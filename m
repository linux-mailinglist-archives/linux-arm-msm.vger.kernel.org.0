Return-Path: <linux-arm-msm+bounces-108748-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gCrMJHiuDWr41QUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108748-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 14:52:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DAAA58E3BA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 14:52:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D3FA7303F737
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 12:45:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDAE03E0C71;
	Wed, 20 May 2026 12:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bJKrYH+H";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GN5/SlS6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91E423DE447
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 12:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779281156; cv=none; b=g3sDjMY2tjxbNzVhir+pD8ykmEmZFYKUx7g4CCv6Om8UHGdfuqR0DKS5fy8a++tmLIDE4tKft0M0f7xZD/WkfWWmrhbMkaeLHKZcWy7Txr3WuvgJauYVRHzFcDk95FT51Iq2mPqILR/2oFD6Um88Hb+9pur+mB0fQ2FF5DbjCRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779281156; c=relaxed/simple;
	bh=cLaTmSKhZdE69LzIgcez/DsGhTPNYNcrI9RL0CruJ5g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HZzlzNROH1hWXFzwchjEZgK9+kMoyeX6v5CTrrCulcymdoExW6ZjG4Ae3aMgX9h/8efeia3X8EZiHP1EX41QfPgVOBaU96lbIL7yH2IPbZYKnKbVYqRTeFfe+gu6ud+8+PwsRhc2QBGlw67wbQ4JWKScqEhK4jTHRFU5qECCKw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bJKrYH+H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GN5/SlS6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KBZZOB3085008
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 12:45:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=cIZhTAzDt9+wu0W7bhluPXYB
	8tTK/ULqj6C6vI+4RFM=; b=bJKrYH+HZjulNKG2nXTbJFE5pY6emoCZ1RcOpXoq
	HXkHQ92QHj6os7+z3O3bpOMY7W7DN2TN5b5UPzpda9mZLuAS27CGgatIBNS2zqju
	GsocGnD0zr81EiY6gImdXecz/ASrZh+Q3KJ9MYSQV40m+CKba1NEfY1Fx6Jn581i
	BYMdzKMfiHVX9JzdXNuPq1z/nwOHC+dN7T1UsVomfbWvcM4TXyC2IkNZx7A2OYnP
	6Vn2mIf0a/P+mKl4lUz3haD9lB4nJTzamlD4g9W4XrBsOExzMLvlxG21UUkpqZHF
	m4pVbaO/Vee4X9P4PzNse/kXjwj8uGr2KEg3Nh0ZaIqU9g==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9c7f07s2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 12:45:54 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5760d43e659so11634658e0c.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 05:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779281154; x=1779885954; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cIZhTAzDt9+wu0W7bhluPXYB8tTK/ULqj6C6vI+4RFM=;
        b=GN5/SlS6U9gm/CDhxfrrcy0fMRr96nTNVP1ejT0Os5BS/uD/4DLX9hzTwNv29oN0jV
         kC3aVEi+q6/d1T/86vCO23FDz+UcuxWbAnEE4m3f9Fi72vtGC1IqdzOPeDvzCfwc3jxj
         NZHyLcrnAduGjotfpJctrmmfHjLUtqehYp485OWqVLWJfaigKnaT2y/N39IWX+/2WRQO
         umj8nApS5BLdK2x5+f9RIZuS9ROpgS/N067ehNqDzTA5vLMjpqRgkIYDbljD1C9f7Lol
         G1PP3KcD7lk8KY1MaBHDnwM0pjYr4JFQ86WtFA1xUCVEsto6zOQ6UOrC761Qk9m5zrW+
         u03g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779281154; x=1779885954;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cIZhTAzDt9+wu0W7bhluPXYB8tTK/ULqj6C6vI+4RFM=;
        b=hMO9v4BQa/Ad6piq4Cy37Ao/Y414cwFUophrbcDOUxTRV9PKQrvcFefSN/VkvrSWle
         qeczUAWh+7s52oto8d/RakdtbX4cPrVJAwMMOe5IDxHtedcpyEXgnPUfWRyiBcYkZChs
         7HvoxRFQOV+cVT1LeUH8th3Rn+7Ri5qXzoNVjlqc/qPCltaNGPv4h7hO/iB/wvk6mukd
         LguE1PWV8t4CEuLNj4bh7IQq8VYPMx0m3U1jSMES0lGHhzubKAaITbT7uwzgzaTCof9I
         MLjrPGaD8wob+uNH9FN9ntxLU1T82O+NgT+hL1ZwDFrmjiZvlK4XGG09C5xQaOT1yQ7b
         3IgQ==
X-Forwarded-Encrypted: i=1; AFNElJ91bMAlRbz9dYLzctsEqY2FgXxuTuN19dF6LyjP+trojJ6JQtiasRtOsjFst9rasroNdVq3Zp4Yj60ynMMb@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/COUhlZ8z8I0KPfOjSp6+FiYvKcyYVxFF0wYY5oDJ02JVXsfu
	xi9m5MbfMs7FVYRetcYTWVR5Ov9BaBDOdnlJeynkjPcFzVIst70bBeqeKAnwr911EJGEQCfp1Qs
	wNQyf77/5LU0205vN1g2mnoClLmWFRC//CgIw19fLRQH3A1uoauuF7oNDCCNKQw4I20as
X-Gm-Gg: Acq92OG1uLVU+Pji2dGb2zRGR2v/LxjKHPhqbJ2RxnRlEGfcFfskwtyG5J7JoPGEkwx
	r//HXzhlJtGGq1zsCBHxjI3RbP+1WGkXO76DtVo5tGHhwkq0jUTQ0EZUNOc/RBzb9T2QCv7ZnJh
	2oAfWMW24YBIF3LujQ2x5W8gDE3ppJ/xq9GpzndHH5vyxOWRI2tUEviEj3O1rV/Z67hnx6wPqAG
	6qTgtogv0pnP9cCfJp/D0rToV6uhiqYy/wTyzjYfCrXf3SrLnhfZ8drPH6QNBzdsAXOMmxh6I/D
	meIUEYXzlrq/9J9og5gahGWtI3L7aCjx/k3UeDa4ix/sZGRcvKOtVhkFVS3nULr/oN5OsLwIciE
	VtRdsUttyolt+yLJaaFR/jgyrt+F5YLvVKGg/04WiISo3+qi5b23jcOnNLgRr1yAhk03qSViHeP
	jHdCVZNhLdfJK/bkTu/IGavh8gMwajgwCZ+JI=
X-Received: by 2002:a05:6122:a5c7:10b0:577:51e4:ef1f with SMTP id 71dfb90a1353d-57751e4eff9mr6283719e0c.9.1779281152528;
        Wed, 20 May 2026 05:45:52 -0700 (PDT)
X-Received: by 2002:a05:6122:a5c7:10b0:577:51e4:ef1f with SMTP id 71dfb90a1353d-57751e4eff9mr6283671e0c.9.1779281152095;
        Wed, 20 May 2026 05:45:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a9164c5712sm4836341e87.59.2026.05.20.05.45.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 05:45:51 -0700 (PDT)
Date: Wed, 20 May 2026 15:45:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Erikas Bitovtas <xerikasxx@gmail.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        =?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org
Subject: Re: [PATCH v8 5/9] media: qcom: venus: migrate MSM8916 to new
 blacklist mechanism
Message-ID: <mvlslbtufxodehvqqcmhihtchct3tegjbfjl2nmt3bh3fczdze@4fnrrtm2njlv>
References: <20260519-msm8939-venus-rfc-v8-0-542ec7557ebc@gmail.com>
 <20260519-msm8939-venus-rfc-v8-5-542ec7557ebc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260519-msm8939-venus-rfc-v8-5-542ec7557ebc@gmail.com>
X-Authority-Analysis: v=2.4 cv=c/ibhx9l c=1 sm=1 tr=0 ts=6a0dad02 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=pGLkceISAAAA:8
 a=FYQP979REZT08Aj4asUA:9 a=CjuIK1q_8ugA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-GUID: 0pxn-gSxMSQYiojwDf9DbgmOIJad68jc
X-Proofpoint-ORIG-GUID: 0pxn-gSxMSQYiojwDf9DbgmOIJad68jc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDEyMyBTYWx0ZWRfXxgVAfiUkheQj
 oO4I/0y0npxcH67w+xLZCjTuwIIWDlYirxGnE/uMQXbCDZPSibRkEWm+4goO4NdCDloKNYmg1mB
 3WIhi1V5yNePoNrpp+VnWMB1f0b6PB/0flzRsF5nHK35zU63fXVbsKiA9FgZs7yspIPdTv16dzX
 hmsCH1LqftsFQT+R6hgyPIOC+BeJhGHegyl7AGpXSbaIhOmT9wGTE64FyNZHubFiDevT+NGPQQt
 9aRuYEepr6lkacEx+sSVNhqGc5mtM13kw2dlS3719leVo3rAyg3gnVMW/h4CCU5uONZCVkhSMLs
 Mn0KtwFdDXl0s9mAcuF9HW4wmqCZ4DzpIpbNXqGd5QTTwHpG9yl2Ds6ahWr788lKLlBnb2J3OcS
 39LktigVl7c0Vck+kUkSwng8qu5A9zLAS5CYCsvgK8e7X6Rju5nAFFz5SYFjVE5OOrb1t+mWRQs
 9UZ2D5vBsdU0sJDlUtw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0 bulkscore=0
 clxscore=1015 malwarescore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200123
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108748-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0DAAA58E3BA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 19, 2026 at 06:10:50PM +0300, Erikas Bitovtas wrote:
> Blacklist unsupported codecs for MSM8916 reported by firmware to prevent
> them from loading.

This should be squashed in the previous commit. Otherwise the codec list
will be broken between these two commits.

> 
> Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
> ---
>  drivers/media/platform/qcom/venus/core.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> index a87e8afb23df..3baa6bb4968f 100644
> --- a/drivers/media/platform/qcom/venus/core.c
> +++ b/drivers/media/platform/qcom/venus/core.c
> @@ -684,6 +684,8 @@ static const struct venus_resources msm8916_res = {
>  	.vmem_addr = 0,
>  	.dma_mask = 0xddc00000 - 1,
>  	.fwname = "qcom/venus-1.8/venus.mbn",
> +	.dec_codec_blacklist = HFI_VIDEO_CODEC_HEVC | HFI_VIDEO_CODEC_SPARK,
> +	.enc_codec_blacklist = HFI_VIDEO_CODEC_HEVC,
>  	.dec_nodename = "video-decoder",
>  	.enc_nodename = "video-encoder",
>  };
> 
> -- 
> 2.54.0
> 

-- 
With best wishes
Dmitry

