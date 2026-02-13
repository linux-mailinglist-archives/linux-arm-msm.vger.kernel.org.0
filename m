Return-Path: <linux-arm-msm+bounces-92759-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iGPqOBX1jmnDGAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92759-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 10:55:33 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 463E2134BCA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 10:55:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 94ED5307BB8F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 09:54:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AB3D34F27E;
	Fri, 13 Feb 2026 09:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V/KiJc5q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U6///qWs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 627EF34F244
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 09:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770976451; cv=none; b=uQiELEi8XN8d/2NQ0cnS67pkK8ei/c/sWizewx3fkE/0g54K/itK3p1EMlB/x5kgRjybdrk66NYSTbncq+RyDBo0IXFutYiJarNkH+ovuogE5dSQBvlVtmQLpff+bTqY9kx4GDtCXH4VTM8OVDSl4B9cmRZiVNzrfkwf8lOP8OA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770976451; c=relaxed/simple;
	bh=ZzJUNhI7ZhHOAG/b26pH2ydFZZDho8gHQ4ObMbgLV4A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q+LmVXMz2DaC1qaf2SnV7aldKhnN1+hu1+R9VwimJ0qicKzEXNvNsIh038Md0lKYzvkV16RQpIms38u/YPJaXbgiBPySZEPk1rD9ZS0juWukbpTXx4vBw6T0WvPO2ifEAuvdbm+hGs1wmSk0OhRuiL3j8AHmhA4fzDTUR7tRtIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V/KiJc5q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U6///qWs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61D5466H1827712
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 09:54:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F2GLreLvQdl5FX3f0m2tljvkz9W5oG38Qt7BEVG/W3I=; b=V/KiJc5qPn0I1OIn
	JyOSpfKhJmxvYXW7gg3uMSr1Zfo1/3jTaLA4wZ90DSQE4sqGH0Ne2d9v6xwgF67A
	+/+yf3xdUAdqWry1FZWLaAyl/VFWqrD5MXqI383hY1uBKeybpn0qzEZndEuNPzDG
	TL/bRxjtPqH+EQ+/Xp6veDvuXfhy4StEFVjIsGxXxqTHLONDN5p5W7iABLGmzvFR
	jeOYFZjJAIfFVfCpW7DUnsNUkrmLiu0AeuQhcwSpOUYxzLcUulhez5MmwPjUcqw2
	LPUpD9Dlu9xaQ8YZHpW7uE0b+EWq8pGyTI0BVRyOpSZqI36zNzWwRY1nZOmh51pT
	XcJwIA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c9wg011ch-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 09:54:08 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb485c686cso4303385a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 01:54:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770976447; x=1771581247; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F2GLreLvQdl5FX3f0m2tljvkz9W5oG38Qt7BEVG/W3I=;
        b=U6///qWsY8+6ylAs2T9Qbys6S/yx0Voc5vdrM2jecDe1RteQTa9j+kJPyzX5jxYaKU
         4wWwkiikn0FreU8MJS+OdU7ijSKfCvbpFI6J0RfBoB2lwlvfPLEPCS2tWDCacyHeMesR
         U5g9Vd9buihxbLlpFX0ba5F0ocIbStO8lWPNPtC2abd1TGzMdjuwIEWzSK+MsOSOQIsj
         tJtgjR5eMYfno9u+PUAlGFpTrDWl5fqCayI7Z+gipiM26c/PgaiS3Sdcq9Og1YY3t97o
         3VJmx5KlMEDyVObjv/+s4ElIHIpgmY9Ee4qTJKOrKeKER/b7/QYiv2UbbtxwOR6gQyXG
         uQgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770976447; x=1771581247;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F2GLreLvQdl5FX3f0m2tljvkz9W5oG38Qt7BEVG/W3I=;
        b=GSIo0jRkmDXk9nZKEj1p1C3d4aJVHnENCDj59kRmdXPVfhXhnBizMGKqIzEwCpaVYd
         KSduQn2mC6X3osg52guP4CHDPrTr/WKHcYWkiVnno5S8J24MvJs8Sa7Jd/VUAkq3JaFV
         MB2r7d527vWgimEulzpaTNh7xNksCJyJ8Q5oR3d/6sUUBMmCFEUUDnSwSqguD9gxMg0y
         Ev6nmGstCVJkyt64dbvj0xNOe7rXVNDde0zfU4NRkuhw1IEvBNAyt4Qzn9BKOgBOiKBt
         BtTlLHpywRmHl1ywUcyYrPWtzQTFk0KKF2gxE0r3bzgzNmRoO/0v42cIRXYzIxz+fiJM
         7ctg==
X-Forwarded-Encrypted: i=1; AJvYcCWoiG7okiydDZhTSawttTVQAb5s9MgWRS3E8qf7gWdplkBeWuIVvOlwcSAB2WePbpcVTOeoMBT4CVC1yb3P@vger.kernel.org
X-Gm-Message-State: AOJu0YyYSZuOeqG3CMdWQA2+otAY6ejtLwd/l7dQX7SE9+0096boBJuf
	Mp0QOXHUj0D3qYCKxROOXbC233tsNS0B0SZcMNHH0JF9tVb+d6t8y76QWKK+nmqjmwiNNgNnFTm
	cM/cav3ZW4eygKmrrVMxBOgiW3oRixgqjcJNQv+zPBIuzHFwqcvztweT9ZzHTZYJ4EG7MJ118lK
	9C
X-Gm-Gg: AZuq6aInt5rJEzKRG/LwbkKTrSM4hWvZCqzkiZ56JmsUmA9pOX3br38w6R7q6Xgj56C
	ntvtV8LthsIrX3S+Cwm4GVVpxYNJIfMbSFtbC4sX0jIYrIDAdFnRmUsRq/k2Ixel8Lx+Syy0Zgh
	5vzFmfSi/69aoevka2LGFDEXruTsg8j3//ti9R9sxquxk2CbtR233fD+DrzHkEQ3hc5J4HgNK3S
	/TLAyuZGZAPcx2fGCM8D39CEfsJCExORB3oXO1eHszpGUU7vQzYEIhgrHgrZ4OXaO9mOJnI5az6
	wITTQIbv54Nk+7RGXTNdbLyZmYuT2ZEMuShf1pRxCPwOQ3r7EWrSiV3zREf7NNAebDFRUpXY6oE
	K27px2CSUy4RzPIGw9JiWiWZNEzgYjHHfDC7Cxw5SkbUMztb4vSEk3XXeUuLWuwCSQMxfh8IYW0
	DPI2I=
X-Received: by 2002:a05:620a:460d:b0:8be:6733:92b1 with SMTP id af79cd13be357-8cb40740010mr179849485a.0.1770976447650;
        Fri, 13 Feb 2026 01:54:07 -0800 (PST)
X-Received: by 2002:a05:620a:460d:b0:8be:6733:92b1 with SMTP id af79cd13be357-8cb40740010mr179847785a.0.1770976447299;
        Fri, 13 Feb 2026 01:54:07 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8f6ec5740csm235219266b.56.2026.02.13.01.54.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Feb 2026 01:54:06 -0800 (PST)
Message-ID: <84895cad-9f1a-4e51-8e43-faf30b4bdabb@oss.qualcomm.com>
Date: Fri, 13 Feb 2026 10:54:04 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] media: iris: add new rate control type MBR for
 encoder
To: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260213-b4-add_sc7280_mbr-v1-0-e8d95b4e4809@oss.qualcomm.com>
 <20260213-b4-add_sc7280_mbr-v1-2-e8d95b4e4809@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260213-b4-add_sc7280_mbr-v1-2-e8d95b4e4809@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEzMDA3NSBTYWx0ZWRfXzO/0H9rTI+nd
 zL6XaGCAr7li8+T+9/WNVEMP3hNP0rKsG16Qh4JrWGjMqBZftve6WZfw7QPYQA25I0TA9fRcEwV
 +C4XRXru3l+Fll9Cj35SM/9WXpHhJfga9a7ckahUgkNNi8sZYrpBU+ee5zS/l13U0cGfj+kKttA
 9S/7U36JTPWzQfcbD685mYFxERnauMzOSXH0nxkOnrb0IuSAJQEMt0rmZWKxP3rBzbhlxe5cl71
 iGEubmNuJ4nEO/8o1nGch0UjahsHdTwwTt12GoypoY3ltxJLBhdsjE8+jbmKlAwOmNsmIzB+o9x
 gQM4aPwRQW79PG4z7+Eukyo4zLSDt/+5nB+Q3h1JwJt+6MKDSJm4aTzlf0TS7LNhPBUobuj1jGL
 idOAo+90K3qQ31/6I7Sev8wJ/PPL3SHXuPgYqOivEJL2Zg220qpwWPkTCAGh9D0mAJ2Pn53gnMd
 kYwHyLTUUSgax0TFO8Q==
X-Proofpoint-ORIG-GUID: pnYk2QL0Ne0cw15i18FAEG3ae3yeQpbI
X-Proofpoint-GUID: pnYk2QL0Ne0cw15i18FAEG3ae3yeQpbI
X-Authority-Analysis: v=2.4 cv=bo5BxUai c=1 sm=1 tr=0 ts=698ef4c0 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=7pxfKWAvF3zSQ3OEpkYA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-13_01,2026-02-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602130075
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-92759-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+]
X-Rspamd-Queue-Id: 463E2134BCA
X-Rspamd-Action: no action

On 2/13/26 7:04 AM, Sachin Kumar Garg wrote:
> Introduce V4L2_MPEG_VIDEO_BITRATE_MODE_MBR rate control to Encoder.
> Encoder will choose appropriate quantization parameter and
> do the smart bit allocation to set the frame maximum bitrate
> level as per the Bitrate value configured.
> ---
>  drivers/media/platform/qcom/iris/iris_ctrls.c      |   2 +
>  .../platform/qcom/iris/iris_hfi_gen1_defines.h     |   1 +
>  .../media/platform/qcom/iris/iris_platform_gen1.c  |   9 +-
>  .../platform/qcom/iris/iris_platform_sc7280.h      | 202 +++++++++++++++++++++

Is this really only available on 7280?

Konrad

