Return-Path: <linux-arm-msm+bounces-94842-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0PiYG0RjpWmJ/QUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94842-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 11:15:32 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE571D6397
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 11:15:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 72FDD3019822
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 10:15:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9C673A0E81;
	Mon,  2 Mar 2026 10:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GDzx9Zfm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OCK+JR/Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE3043A0B1C
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Mar 2026 10:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772446512; cv=none; b=Oztkbr2h+C6BK7bEmPD7KtAQQ5b3z8jJJmUHFjerKQ5dc32O2hvCip6Z5nsA3gqiMjPZxKEf02bUoqH1Xagh6N2+Veaeef+MScyv+cKCUiGALQ53NB6J7Gyc83SfD1YSer+8h9D1IyEKVlXXSekG53a3+QJJlNhrAgQJViJOZuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772446512; c=relaxed/simple;
	bh=/AkdgchW1du6u8cjXf3KM+oHBacBF71Tc3iQwP2BLg4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cpMPSAricRB2uT9mHhr9CydpkFD8clTYwe36l+PfrQYR8V0922jwMPwwtztpbFezNLm8j5CrfgxDa6LIE9k31vbmATJdG7rMQNjhcxWsFZ+Y/wWUTufccZ0YwK3PR/hKE88EZKI703x87HmlpquATpPM6iI2TnMngA/v7VEpJ8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GDzx9Zfm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OCK+JR/Q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6225ZV4P911398
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Mar 2026 10:15:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gBRf915flOO89c646podLNerCacnzutRJQ8/WgkEjh0=; b=GDzx9Zfm7+sZ5W8w
	3FlEavwZTWGqA0xQkDk7qR851k+lQrSvOK5/WkgaiBCtB3i7qvApETFJ0uZnIg6g
	MP2mfbl7uFonXJIGpQHbbXQTH9JFH/9Fu7AErBIfXRnGu6niFMFJNCCwVPeNh2HX
	Emc2Y8Vg0JgEjNNzqwEx8II4Y+xkkkGHNjHQQlksD1PSO2h+rtzYnlA4oC76aCvq
	alu5QSy48oYMQ1u0qU/FgYISGgL4Ns9hkM87YLx7sl1dXARoi3TdN9gLGKQUfkiq
	cjLrfVNwOO/VVW07PjIRj7zTPv4nR2c/UwgASpia88S8ql8YOFtuygeX1K1/UB1i
	arsfcA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cksfd54cr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 10:15:08 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb45a6b860so320107685a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 02:15:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772446508; x=1773051308; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gBRf915flOO89c646podLNerCacnzutRJQ8/WgkEjh0=;
        b=OCK+JR/Q1r4E4cLbMnUROxHD8jdLp532EAPRxrGcWaZoDeHt9NRClhlsWTBH4c4eG9
         emVUzmZzvqW56acn+dY1rSAhPBZ6IQ0RRIYjTLbCfAyBBOHCR5LvBJxVJt27YLtrXcpH
         yMmUz+8t/7uLFxnURHp2r7aogUo8zS30O7jNf8Vw7JyMUy9kpnHe4w6c3g+KUN++DyJj
         zd0o8bFAtwiohgr2H6Z03FL0MxdSGf0b/BBHAqm+glexLa7CJsfYGO1AlThTWVvDnAcP
         PCyXdMt0bbQ6kS7bTV6snZFnQenXqg/e1vYqFzFeLdPR1sNy7M8XOknFaLiI0OmaTF8P
         jM5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772446508; x=1773051308;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gBRf915flOO89c646podLNerCacnzutRJQ8/WgkEjh0=;
        b=hhJJ6dW7zhVYnCPjxfH3ihjbuOJshEKVv04kGHpExVOEs6XBn8SR0rGAd239XyS4Xc
         oHv0EvqnUp8O8p2Gm5D/0FZWrY/G+KJNGDMmLanzsaCErPczbwVuWmUeOSVAjEy32M+d
         b3A3+UacAVgOba/3CgpU9Xwygq8KjR2qEfP6kOx2AesBkV3UpMhfU5Rz3D4aGx8Zxn1z
         ttnUNk/AGhxhl3hlPPSxMcfBeyX5piP3t1ZuDzaTxHCEtgGFyQnDYEt8W7x0D7v6hZNH
         fyyE8Y47pRKlmgFeHLXfXpxQ4ImdjS1X9GX7Ge6t//trj862Xqbp7Mr7UhWTLKNPCpvS
         2vaw==
X-Forwarded-Encrypted: i=1; AJvYcCVC6eKcsuuDnhsT6+EbI+KZTa4z1GObJsUnHDDlcXavSl+4zwTtsFNa3vzx6UDREcfFnIE3t0jEBCW6QUUe@vger.kernel.org
X-Gm-Message-State: AOJu0YwTnnMSytiy6zl+2/mQJJ/DgMf9yc0UZp5+n9WSnLBNvf+ED7Ht
	tba/nwMA4aRkF4s9IJTjs9yCK+goRk/xg+YI5a8S0fWJMRA4hW1Yd+/Pb8a/lg4Wr32hKZSpOKT
	oziyLBAPQ9OaBce1JyamI2wduF7xt7mIAW0DaGE/9zYEzt3r7v8/TXTuiCxigZGdF3V2A
X-Gm-Gg: ATEYQzwdWnK9pzTrI03Y3gg3uDGxLTjDIUUhBG1+dP7SyjSBH17+4b9AC0eRs+OMlVz
	eZMbPzM420nUzb7wpgOQN+C1xNM0CUU0/9kBxH7w4+USPE4KLh7gU1CEa4w5ywW3xMDzpGU2/Mb
	iN3jLOqomINYJu7LBu/CnFDQFgWq2yNDlrmTR6KB+vqd4IV6PbyHaVz9W9GjId7cqA4hAZBdq/o
	/HFFbU3vbBIwWLy38oY9Ow8aIul5ImmTqljo5qNKV8zOcAa7XjdX9N5wHRBocSl9puwBoaG8ANp
	CLlf//rrerOx0R7YIsFsKIRAsh4//U6Hob8q391xBgBZ36rh8lfyTydkLrmxRNykblkXrbBiOuh
	bQNicvAQ8GdQFnvp5qlb4vsuiVHrZSe8TxlLFUo/8zEMO1CsplesdCph0keTilH1HVLA9Nf+aAM
	Tv3yo=
X-Received: by 2002:a05:620a:c4f:b0:8b2:df32:b900 with SMTP id af79cd13be357-8cbc8e7abc4mr1125835285a.4.1772446508137;
        Mon, 02 Mar 2026 02:15:08 -0800 (PST)
X-Received: by 2002:a05:620a:c4f:b0:8b2:df32:b900 with SMTP id af79cd13be357-8cbc8e7abc4mr1125833185a.4.1772446507733;
        Mon, 02 Mar 2026 02:15:07 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66006aec2fesm1777219a12.1.2026.03.02.02.15.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 02:15:06 -0800 (PST)
Message-ID: <68049d83-8e60-4145-8ab1-d72c2394600d@oss.qualcomm.com>
Date: Mon, 2 Mar 2026 11:15:04 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/11] media: qcom: iris: simplify HFI params handling
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260228-iris-platform-data-v2-0-acf036a3c84c@oss.qualcomm.com>
 <20260228-iris-platform-data-v2-4-acf036a3c84c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260228-iris-platform-data-v2-4-acf036a3c84c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: _pD0b99k911vALUnxgp28N8xHm89zd2l
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDA4NSBTYWx0ZWRfX0Wv0s+CliAlK
 pWFODKMvbPZLXLo66P7+qXJxh+OrC98f49MzqoRheXfWcl9J2Z90fxbw3wmyHamKNTWY5PQy0qC
 j60r30ELYPX2+Ma1QeL5o8AQVxsllfyYy4wCSR4dxYDF04move0Om++Y/93R+z1tTiVr/vuQ/Tn
 acPHXZ9fctXE/zVj5hpc3yt7taxlOfN4j3IhSKqZa/FZb3FuVb0CEpEJgWoXYYY+72Ry8ZP9d+q
 F5TLC57zw4XdUw36LMCtzhYoaKuSeEQ3TZArmKNWPmt7gAfvthuXERTijWJPD0naerB8acbOZyA
 gt7Tmr0WrMFSlyCBTQioOINPlV4g4zMLPw5Qd+RkfTHV3MpNR/xoYLbiVXllEjIQYsxO8tvG0ab
 ZA7BqGBV3/6husslR9VAviE6pBhlCo/DsLghc+24h/YiIwepOuU2nWaWz4xQX7TTcPoqgRetDdf
 NqTrf3VtG0Pes0Yj+ag==
X-Authority-Analysis: v=2.4 cv=HKDO14tv c=1 sm=1 tr=0 ts=69a5632c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=iTeDPL9QkzG7IXd0jXAA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: _pD0b99k911vALUnxgp28N8xHm89zd2l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_02,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 impostorscore=0 adultscore=0
 spamscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020085
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94842-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CFE571D6397
X-Rspamd-Action: no action

On 2/28/26 4:26 PM, Dmitry Baryshkov wrote:
> Instead of looping over two tables to select the static order of
> functions, call necessary functsions directly in the correct order.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

[...]

> +	} else {
> +		ret = iris_hfi_gen1_set_frame_rate(inst, plane);
> +		if (!ret)
> +			ret = iris_hfi_gen1_set_stride(inst, plane);
> +		if (!ret)
> +			ret = iris_hfi_gen1_set_resolution(inst, plane);
> +		if (!ret)
> +			ret = iris_hfi_gen1_set_raw_format(inst, plane);
> +		if (!ret)
> +			ret = iris_hfi_gen1_set_num_bufs(inst, plane);

Some \n, please?

Otherwise the function calls all seem to match what they've previously
been decoded as

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

