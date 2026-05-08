Return-Path: <linux-arm-msm+bounces-106629-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yOubI6W1/WkXhwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106629-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 12:06:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FDA14F4BC5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 12:06:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A9AF1301E822
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2026 10:06:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FE6234887B;
	Fri,  8 May 2026 10:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lXFTBvDw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FvxtNN/d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9307937C914
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2026 10:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778234778; cv=none; b=dyCg5bwDNZZ43kSEBhPrwhmNy/dpZu2F8FYyJKkfPgMMWgXXPqq+8YJQK2mBRmNHfvQGtI+rcY8urMN/wxkrZnG90dmPH6MjTCBIDDOK1lT+5MYHC8/07+UCizLqued1uPfiUF12skvUVaAvq7pXRzaTXmhnmDWRT5/0CrJ0jKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778234778; c=relaxed/simple;
	bh=VjEJENxDuHCllJ7KS2xG9VmjlN7BZbjIH3IT1Yto7aQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QfwI9PAjLu020sWtqflv9lowzmHdaQ639BgnyPNDQzkJG9W0w0qvuLQSEoJ8vTGc2OOXHs0PqokM2SQhOHHJjmIFOg2rPKrFArZtuDz6xOqqC5UIxK+3Lb5x+eOCr+0UGcIhirOepMPb6+AlkGCjFtRowFoyi3yy7U7CtwokQ+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lXFTBvDw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FvxtNN/d; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6485t1vX4069446
	for <linux-arm-msm@vger.kernel.org>; Fri, 8 May 2026 10:06:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OayF4gM8TJfL26qUwfDS4uiyjtIujhhqWG9XxC8ev90=; b=lXFTBvDwjEcLfFuD
	yoinouVC3528ecIKdmh8PZI7aBG57VSdNqoZhaeRe+Vyh8qU4pkkt7Vmk8RMDqXU
	ioHBlKyWMmfcrg1l5yFvC6MXbzm7L6zwyYw6ifH4e+GtxmTijxPTanNLlpyqjt1a
	XOUq1UY7nqNevE12p5TeV+cso9E8fOcyU2RQo34zNYFNQMAxfAIrHIeNzHj7dvs0
	TflAn2HA0SKBdcQYkOBxgze6xkmdJPfh1+h4PqGWhv31ll6w6VYvmcizgb1Dhw4H
	U/L+xxEfuRUDtZUqModHR9khA+eGGVOUli8OjKm7Hxk1PlJtwz8s2pEHl9uKyT0E
	xMvcAA==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e12sp2dw7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 10:06:14 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5755f6c9bf5so194849e0c.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 03:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778234773; x=1778839573; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OayF4gM8TJfL26qUwfDS4uiyjtIujhhqWG9XxC8ev90=;
        b=FvxtNN/d5edtgd0Jg2G06RH9gpwv9V6vjcc5UOKRBryvidtMD0R5TSNCaZaWKBLAjd
         mVX4yC0E9djnlKvp2N0Cxexfx2gXTj0JeAmPZimd5XWl1BTX8BX6jC5kwIGn/cJu7R6S
         yFxKropXG/DfAzP33MhhjZYZavCIpZwq8xbhWbnw4sPqeVnuHTsUUF2nicf6bjahcI3s
         P/u2GG3ZhTnGKGUPe1PIbNt12FYsTUvIqIIVHs7yWma+M7811MjH24uWJnFWtUTO43Np
         xT0kpSe4QZxcllve4dEHvuP0HJM0L/np+/ex01Xoa7MQluJg6YbEOfViNkNw2ylFyF0I
         rnqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778234773; x=1778839573;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OayF4gM8TJfL26qUwfDS4uiyjtIujhhqWG9XxC8ev90=;
        b=LNGYOxC4oxu4F96X6erxAY3dsw+FcEiBLFa2EjJTVCVKssa3XL7s59Yc6FMTmser7/
         RFQ3z7WAeJG1CA6Wbgi7M2lm1svEFLivp4H1dcw1WIR4s5P37rBUMhyON9+OaX4Dx7Oz
         beNII8z0ry/jt5DYc6CMtIb5lV0vGUyl3RlxBDmpchuua9KgBVr8sivONZHrDqk1tj9O
         JcjKUwE8j56sQTkESv5WtgLBEYq+4v/v/d6qpygzSMspw6GLYqlc3awAKmRzYPFj4O3J
         8eUZ1fZtKPzuVquAUR1l9gl8vKLJjCR3tScfxoUwqcbn+PFwiZgXM8Wn2KGOLiIaFFqX
         G5PA==
X-Gm-Message-State: AOJu0YzOlvXzsAdS/h4YDx7q4KZN4aMyeMWWOZs47+6F8cXwV9v77ZXo
	PsZ7QWcTLsmNgRzArnmN5+JsXsDTReNLeRgZ7x5mDnzav1tdIaJEXla1sTAW1SPz76T/umhu3Yn
	Ii/V+FPKURHWiiuayDlil0s0PAQ7bzgE5hvrIAcAb+4rgACP/52j2KFOcX1QlQ9LLl5wD
X-Gm-Gg: Acq92OErRyc+VpA4kHygDAfusg62mUc/e1FagHThQAgsMjksGAnAmEJen4bJE9BGGLU
	Fy4q6d5O+Q+oNas4oPy6ApdQ46KXbHe60pGA65kzD2KY/AWhleNTyWki16QeyPIVXnkDRFnk5Er
	mADD7V5tv//aekd0PcVHtEIiLqAtYUu8m+JdFFalmP7DMR/k5slXcKrs5WnPi/MwV+eGiZ/reje
	IsICvYmMuHK/+SCL+/yFJqvvHJVVgsqTRZlkDRbDKQCqDJHeszWZVt0a4wr7Ur69BbPvYyPgwfU
	65g4KtAHHtEpmAY73DkH2jQ4pZk+paz5tVy2JJ9Lr4DLgQ7UHsCg7p9LLv5wwgxvnst9DR9EpYc
	vGE5eeGngkcQX4KIusFKtyYYpNx5VQOUm8XeyyzXFWJyuANYB7UE7VSIpR1puiTbKqO2voZr+PL
	m3wV+b1+prMksn2A==
X-Received: by 2002:a05:6122:6214:b0:56d:baee:40 with SMTP id 71dfb90a1353d-5755cc74085mr2309383e0c.1.1778234773414;
        Fri, 08 May 2026 03:06:13 -0700 (PDT)
X-Received: by 2002:a05:6122:6214:b0:56d:baee:40 with SMTP id 71dfb90a1353d-5755cc74085mr2309369e0c.1.1778234773009;
        Fri, 08 May 2026 03:06:13 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bcb43e09752sm21464166b.59.2026.05.08.03.06.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2026 03:06:12 -0700 (PDT)
Message-ID: <28dd74fb-ebdc-438c-8624-6b8fa0657e40@oss.qualcomm.com>
Date: Fri, 8 May 2026 12:06:09 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 19/29] drm/msm/adreno: use version ranges in A8xx UBWC
 code
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260507-ubwc-rework-v4-0-c19593d20c1d@oss.qualcomm.com>
 <20260507-ubwc-rework-v4-19-c19593d20c1d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260507-ubwc-rework-v4-19-c19593d20c1d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDEwNCBTYWx0ZWRfX+Pr1meEwXSX3
 52Zr94v61gM/M4XaN9GjmPweFM62ZJxgoyoCN6kiAzAQs0QYI6aMHweglLBEUEz8vIZIMGKrN92
 BzEC+cWKB21vpGXt2rKPTshtH/3KmJ4wItyTrcIEa9EaQRWkGMDGU4ePOzkTEygSeAjI37Y7fJ2
 RmKwAT+3UKWTQuw9TjsqQrbtojNBHqWq3aMhJsOghSZSMMe1rZiKLBS2A/IO1+5uOOngw2C9f9+
 j1D9NlX+6gMMe6INI87vJV1m4RdbCzqwZCfOGasWac+qgBVIStDiFanEyH5m1ao/ydzTaDRzHpQ
 v96aoqK/bWqC62HITRvWh4/5K1IAYtF2ZYUjY+OsoJ7f9/zeuxP+HY489zek4hdld6qpy+E9JIa
 u52Ff/If3Sw4IvIhIHY0nEwSmP3N9mbFjtM9boYsfg+TNy7rDWBAM156T4sf5y3aadqwrreYUCR
 FstYCRvESP25RKhGwEg==
X-Proofpoint-ORIG-GUID: Qs3G9vFwSJqRmIGKDplY7In6fKz4Ul9Y
X-Authority-Analysis: v=2.4 cv=Wu4b99fv c=1 sm=1 tr=0 ts=69fdb596 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=F66dyu4Cpv24ktMMw0UA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-GUID: Qs3G9vFwSJqRmIGKDplY7In6fKz4Ul9Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605080104
X-Rspamd-Queue-Id: 3FDA14F4BC5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106629-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/7/26 3:03 PM, Dmitry Baryshkov wrote:
> In order to simplify handling of UBWC minor revisions (like 3.1 or 4.3)
> use version ranges instead of a case switch.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a8xx_gpu.c | 32 +++++++++++++++-----------------
>  1 file changed, 15 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
> index 5c73a9ebb22b..29d559fe4683 100644
> --- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
> @@ -286,26 +286,24 @@ static void a8xx_set_ubwc_config(struct msm_gpu *gpu)
>  	u32 hbb, hbb_hi, hbb_lo, mode;
>  	u8 uavflagprd_inv = 2;
>  
> -	switch (ubwc_version) {
> -	case UBWC_6_0:
> +	if (ubwc_version > UBWC_6_0)
> +		dev_err(&gpu->pdev->dev, "Unknown UBWC version: 0x%x\n", ubwc_version);
> +
> +	if (ubwc_version == UBWC_6_0)
>  		yuvnotcomptofc = true;
> -		rgb565_predicator = true;
> -		break;
> -	case UBWC_5_0:
> -		rgb565_predicator = true;
> -		break;
> -	case UBWC_4_0:
> -		rgb565_predicator = true;
> -		fp16compoptdis = true;
> +
> +	if (ubwc_version < UBWC_5_0 &&
> +	    ubwc_version >= UBWC_4_0)
>  		rgba8888_lossless = true;
> -		break;
> -	case UBWC_3_0:
> +
> +	if (ubwc_version < UBWC_4_3)

< 4.3 specifically, or if (4.x)?

Konrad

