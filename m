Return-Path: <linux-arm-msm+bounces-96263-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qF80KGvCrmmRIgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96263-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 13:51:55 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0920C2392F4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 13:51:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2CADE3117328
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 12:46:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97DDB3750D7;
	Mon,  9 Mar 2026 12:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RJxHGez8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="arCxwMxM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57A9A3BE15E
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Mar 2026 12:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773060354; cv=none; b=ce6UU5uEEo6LJYRZfaGE5iiKeejG6Y1Q/5sf1yjS/AS/BEKeMEE6iCRJEybg5329t//orwHnvtq8VSoYJNGZ+hGu8qm/u83JmqWXjGhT+hAByhGO77GrQPwSVm0Z1SaM7aHdKsw3PHh3nwIHw8R3APsK88yKJd14DTfKL8iMGw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773060354; c=relaxed/simple;
	bh=ciKizxF4/peB6QoqMp/YaP6KjgNb3jK8WIpiBHrzYMs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KyPNWYBRX92OQdpHSIJImj9I3TYX1HgDfxqI7FuK4fKiL1w1b0iIDbIrbb7M01aeDhFoxFGq8jbUK0r7Xo4SQOB22YaN+tZbwQnkYg+l47XWxi7EoMw/yIuEfHBtJqLO8gWftEy+WOmIVLvZfSN3IVApTh44FDZlsXaZzuKZeRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RJxHGez8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=arCxwMxM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6298A4M02661676
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Mar 2026 12:45:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7htRU030UkbwgiiMTsv8tqmBCQS1hKqLxCtSkMtmYYg=; b=RJxHGez8Ty/0vQ0Y
	pPBlFcR5683mwROj6D7MZPXjDseTZNdeIF2XGSdC8FHj2m1sAf9wZnLrXagAKH5b
	0XUrYIkb/SZGlHch7y/pLrH1behCPEWkzTZ8+AAzrEsEyqyYkCqvkkGVM8wbfEUL
	L9uEvWl1mQuIS2NmTc9ADwjv/VARGhpwpS1KQA6jJyEJduydlEc+ZQ7bXy4kM9Ng
	tVybUB0gv2A/aqrIbLzrPU5PkuNS219FPqRZyujRtFtLZmxm1jF8U73PYCaRxYkh
	gt5eneHPilAb7/s1TYM9Zy84wv+aGZ6tznYwIBzrFgNvmYwp8J5Zx6QXE62GxdiV
	9zDl9Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cr9cpnq7y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 12:45:52 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb50dfd542so796607485a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 05:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773060352; x=1773665152; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7htRU030UkbwgiiMTsv8tqmBCQS1hKqLxCtSkMtmYYg=;
        b=arCxwMxMc/m5oicyZnLQruJ8rH9Pd3i9uCWKk6SRyFDNjM5yIdvsLkD3sNn+dNgWnO
         Sr1hROO7b+JlxGNJo2k9etGgucKRBeja5GHByPsglYmmhuwwwCsg9LhWQ93RCPp55web
         xndGcWhEY3bkuBP6+2Uczh1obQwqR3Dy8hV1tH6XJyNwtSV5cQsAHzpJNVWQuKSk2W+X
         NqGhxQ0ez9zu6g8il+D1a0LKmVwhw0CMYOv/S0Q0C0LXV8albRwN2yzON0QwF4rLUCR3
         7c51NNfB/ayPT9ArLQvgW7cZ7FJvpA+rkWj64kuv5hQxobGpt6Jbxf8qrUy41WxDPgJi
         23pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773060352; x=1773665152;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7htRU030UkbwgiiMTsv8tqmBCQS1hKqLxCtSkMtmYYg=;
        b=Tz75FW6Zh6csAEMRYICkOrQY4KvER8S1B+DnfikFwsPBjBf7ge/Qt9btBU04uMn0yq
         2UmuFMBNzZajatJblK8RL6v1IxlkISGTwpyj6ArLDrDjAFJFJ0vR6KBGNURviyxh1dEg
         hvlnwDBa+PVbzLHs1bhLzBqXP0nZ/c4Rv0I0KS4zDxh3Om0M677PH/VHIb+6uttqHd3F
         JNROLnH2Eqzh7E+2J5Gd5Dc4NBh1+J4W1DCn6lnX030XfwOvJc2ml41nyUsD0Ptf+uW2
         RcQHtcJnimu7gDLr3MWov5SKniuaAMKWbozbaUcdsgvC2Tnvvvp5OnQC3EKVirnx1WeX
         /lhw==
X-Gm-Message-State: AOJu0Yx6RBC6DXXW3FNnnUtd2ij6V8PPuXbnpN7ZwgWpQwgCu1k+o46D
	WiD/70cLX1V+f+ugEk/zKESLjBbefEWG6TeYXvikmW9VTzwIAAtl9bL9DtHpYDKgfbfOgVE6Wey
	OPXWRUMsCbvA53dhfWPqu6xEbA7NM2vVShgZejW2vNku7Bgk4SoLTHM1VplKkFnVzmHAA
X-Gm-Gg: ATEYQzyCmUYbCDpTIJ/JuXnxuzSKthtPnWKuxW/cn3+qzInivL6sGPczl6jw6zTqwhT
	9ouDDXKDMjkbFo5Do2Std+FO5vAOVGdsIf783kQ8bjxMcoTZkmiVVqWTs1Fi06wAODNEHzhTsWQ
	yMr0inMJK6V8OXVQPLfH+/enKCXKgWhCXEZO9ZbwnBml4EN7smPpR0a2I0al8ITA0QcLbGhE5z8
	UWKawBa/JM3KWq/p/w9ZV/EzRiT34WorOJtEYnw4Aa0JPm1WKc16Ki3cRh4yBpABbe8XM41++3O
	SQAwyawD7dL0wmXjnVLwy1oikaWb/EfDph/9+IsS5hjz6Brdh730QCAie0hGMnWsvV4GJYQMU8t
	XGb76I65o6eE9mRlgJgJOJGPMnCG5jXmmtJVWaMpxSuZd4jK0GTTS/eD1SWV7v6TOu/LwBG8WP4
	b++Ss=
X-Received: by 2002:a05:620a:209d:b0:8cd:8bfb:a4a with SMTP id af79cd13be357-8cd8bfb0eb3mr161911285a.0.1773060351940;
        Mon, 09 Mar 2026 05:45:51 -0700 (PDT)
X-Received: by 2002:a05:620a:209d:b0:8cd:8bfb:a4a with SMTP id af79cd13be357-8cd8bfb0eb3mr161908385a.0.1773060351520;
        Mon, 09 Mar 2026 05:45:51 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-661a55a660csm3141140a12.33.2026.03.09.05.45.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2026 05:45:50 -0700 (PDT)
Message-ID: <48c9e2ab-ab0a-4148-83d7-9aeb3de274cf@oss.qualcomm.com>
Date: Mon, 9 Mar 2026 13:45:47 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/9] drm/msm/dp: fix HPD state status bit shift value
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>
References: <20260305-hpd-refactor-v4-0-39c9d1fef321@oss.qualcomm.com>
 <20260305-hpd-refactor-v4-1-39c9d1fef321@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260305-hpd-refactor-v4-1-39c9d1fef321@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDExNiBTYWx0ZWRfX0b15NfnukiNO
 FYK8LynpL5S/pkbAfqWhyU1M5WFteSJ5Uw82A9h8gCaHIzWna03798c33JAJqMUxXvc5ptkBQbA
 skaixAvjaSah+djZTddw+JZ8t3yhMR8bkjD/+UQ19bHauqN3hHABlfSCVkRAbqNKENAytbys8hD
 N5BMIx931F5GMGaiMFub+v0xvlI52I6SVv95cTkJxjHQWaJH38HYgLfJX2SQ0cnBQ/uRkM9VXWw
 whis7rVWvW23TXZ7PtgXHWHczVKoQKjfCBG3SR9S9LGvoLsKWqrBWrYnsy2Qim50+vIowo1/ycW
 U0umxQrsvKqYh0hDmJXu544nRBgrszV97wnaaQQroBEDW2fVY2rTA+6H7cq8Eqdh07ptbqgKvLa
 RMUS6Kj6Uepbo5zuJW+MM0uauddNAn8D54bRtuEnCGE9lyEvJ7ehyEuqhEbSshdkz4RVVe25UBX
 SvVSU3bV+60/dBR/xeg==
X-Proofpoint-ORIG-GUID: _80D3gQ12Q25VpHXyRK2FeDtIYWdtuiR
X-Proofpoint-GUID: _80D3gQ12Q25VpHXyRK2FeDtIYWdtuiR
X-Authority-Analysis: v=2.4 cv=e7sLiKp/ c=1 sm=1 tr=0 ts=69aec100 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=5rTfuJP6cXs4uNvNC2oA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 suspectscore=0 spamscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603090116
X-Rspamd-Queue-Id: 0920C2392F4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96263-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,quicinc.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.930];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/5/26 3:30 PM, Dmitry Baryshkov wrote:
> From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> 
> The HPD state status is the 3 most significant bits, not 4 bits of the
> HPD_INT_STATUS register.
> 
> Fix the bit shift macro so that the correct bits are returned in
> msm_dp_aux_is_link_connected().
> 
> Fixes: 19e52bcb27c2 ("drm/msm/dp: return correct connection status after suspend")
> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

