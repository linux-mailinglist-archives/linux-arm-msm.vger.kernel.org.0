Return-Path: <linux-arm-msm+bounces-108059-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sDcAOzD9CWpPvwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108059-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 19:38:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C5E562A63
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 19:38:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 918533002783
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 17:38:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A18E034F49F;
	Sun, 17 May 2026 17:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tj1spj6E";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TMlSUt4o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37E523C3438
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 17:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779039533; cv=none; b=WTDh8RTQJPhXTihJMf67XmJ6qBGFjubUJrM6nCECJZlB4ALLK0iv7SWiFzlvv6rQW8T4OaSnVsO5SRXKaa785O0B8b6XP5mMQIACnnPJuG1I50aAh9X4sHyu7ggj/prVS8ccl3Y0OgJo2cFauHo6WYBFllL6xtT6FmpXOpI6oPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779039533; c=relaxed/simple;
	bh=WkaL/kLNvwG/Jw9o4KPmKBO6ob0RZONaOrsmwEaeBtk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YAWEP+HG9nFw9QReehp6OPF8PjJ2DLUxh8iGCRlQqb2E9MpR3oX7hWaM83b+zUIzp+Dg784Vm3JYPre7cubngmZlWrE+4tDTLq/ShXqOdXM+/ZgsF1HGEegf+zqqiqKEykWVN0k4TLTdjUjK28YpszKKDOzKGGLXEyAAd3H9qgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tj1spj6E; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TMlSUt4o; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64HBK1AZ3846935
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 17:38:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xO55gAOuCtRsxhoaUXNT77T0
	zm1A7xprtxGzeLaTkrk=; b=Tj1spj6EhbX7iluVvpbLdVEz0DiXODo3pEY9NaHD
	0j4HbI9CXhL368h0Ad47lmsLh9tJZSdJM8tMyoOx2/C3NgiTbEMzyHZCcIVN6+U+
	DGwXXlW5Id4rEIWN1F1yQbWKmc1uE731clrJqsU9j+vgl7hmoMBrIk++Nto6OfY5
	lVKh0CZjZZ59nI9EwHYmeGavFqiE7nrHm7NUEtKdDC12Cy8cgJpQDiiPQCypjdh+
	bx/6LDSLxJiJWcmunBGuPFVp8ySTd2DXzmTBdWbbOdVk6EPBK3/3oZwP3lybUSwz
	jUHM5Y7EOFfPKDMSfmcvs2wY82ENRGrQKj1FfFP7JIfwMQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6gy53atf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 17:38:51 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d5d1c2289so48431171cf.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 10:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779039530; x=1779644330; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xO55gAOuCtRsxhoaUXNT77T0zm1A7xprtxGzeLaTkrk=;
        b=TMlSUt4oHW8LuQ9csJ0vJDkorcTxIaVW1Teo45uZYjSfYnheGvD13dSgR0iBvrg9ue
         /DtU/1d+vUK8op5MYqZjz1t5D8gcPJnFY/qIKvGq97/B/ifTyR9/55wC/9dEaoEuS3Ur
         Mq1wVZpvQNkKIvTt5bqmjj/Reo1+35Z7aJlO0X4EVB56ydsNjPgh72zTf+cLf8JU2psa
         5zpIO+ocpfC9qaWCnJHc7ZGpxMEY60/TujOmShjw5j5bDb/Yaulr3EvYNAuRIiT7EaQo
         s8H4/BRnI0gvaSpXrMA4gxAaF9NOpnNu8c2ui3xPtNNJe8maGbrXjZXMdBnQCMnAM2AD
         roVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779039530; x=1779644330;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xO55gAOuCtRsxhoaUXNT77T0zm1A7xprtxGzeLaTkrk=;
        b=BtDh2IDdhWkoKfTyPcqK0ifngZyWULgbA8N1ertJCLjWtTibJG6Y8Vy+CzJuWGJE3s
         ShpvAj7Owsm6V/bpaz6cpRa7+HxpTKB3NHM+Tk4POtahKoKQw7WNC5XLDDnBrR5KOhwo
         5L5lP0irMagRgC9ID6RAYl2kapScgEk5NymEd5+GYbKMqOVCBBIZUUsNZxNfSmBoPv8D
         q7nhlSWIb3XCDgxr5MMRM9x10IRujK+vUmHztVg5xcS5lx/KwIRULeKLhEI3NgyZHSly
         jZ/WfsDzHETjxmKqHN+38VWZbFE4z32opSPBtjv3Les91Xyo5Uq472dmpsFc7+UIc+t9
         5MgA==
X-Forwarded-Encrypted: i=1; AFNElJ+cLMSQJADlgJLxfjzVj82N9SeQKnv+iy2n5kYTi+lxQ1heiYaeKW8IMQaCb1Vp9E6omdlB7+NigqXRbnui@vger.kernel.org
X-Gm-Message-State: AOJu0YxqS5XjYyyotK86FoRNYSiUAjLrCvnFnsdeXCQXiyz/bbyV8HnM
	8/Rf3o1A3StEJfxe3SeZMs0BZjet61w/orDtnZ3K8+wK1iFJ+lSIOmKG8jODIk6pMQIIs2uJ2aR
	Zw1ww6d/WgT6YxpG8q5F2wnKghFtaDqATqH32yHCeRNl+uktICgtTci9xx7O40p1176xW
X-Gm-Gg: Acq92OF1PTKydGab6sikBLQvgRlPG3k/wRxVARU9FNAAODf3zJq0lrJvKn6mruBRuV1
	ag057HSwECXlrGVOjA511USMdHgzh3UPF1VkyA9CrPw2BrvryeUU+3QSLkEhX/yFPErMQuatSru
	1jOOgiQzfzcthduiySqQWHm4OswzkRZYZz0KWhUAuM4bZM/C9hBlF8qQ1w6s46Ci/2MSm/Eq/w6
	OczHijZwZAogVVUyawpQhJg5V2J1LiHJhlN5BoRzHrGtFDEjdFLrMLwt/37M9ZSBjxPA2UNAW+U
	FgpXSL1BGlbHabycmjr9QJz33un2a+atTnz3WLerk3ps+QokxfnJ1tat/keKiUblBQqFf3b8MX0
	rjjGCnbtemDuYvt8G97JQiO6eELOswkezj/TNEAtN5BRl41gcDx9fI7dGe/rStkUmXV6zZFKuLb
	MuLArMHaF5NuYQE0/IBF+R27PagoxJMCyPbFp0X5ZMlGf1gA==
X-Received: by 2002:a05:622a:250e:b0:50d:b0f9:1a66 with SMTP id d75a77b69052e-5165a20c07emr162811351cf.42.1779039530478;
        Sun, 17 May 2026 10:38:50 -0700 (PDT)
X-Received: by 2002:a05:622a:250e:b0:50d:b0f9:1a66 with SMTP id d75a77b69052e-5165a20c07emr162810991cf.42.1779039530009;
        Sun, 17 May 2026 10:38:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a9164ccd16sm2765652e87.66.2026.05.17.10.38.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 10:38:49 -0700 (PDT)
Date: Sun, 17 May 2026 20:38:46 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH v6 08/14] media: iris: Rename clock and power domain
 macros to use vcodec suffix
Message-ID: <txvjet63hwe2a4x43gmqjn4captfeisglas6x4sfvc3ojjkpc3@wl3g7oawt7zd>
References: <20260515-glymur-v6-0-f6a99cb43a24@oss.qualcomm.com>
 <20260515-glymur-v6-8-f6a99cb43a24@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260515-glymur-v6-8-f6a99cb43a24@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Wusb99fv c=1 sm=1 tr=0 ts=6a09fd2b cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=7kw6uZOyWWl20wmryugA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: X0Xh3F_xSwJxLnOSHvfxMW7uChXnjNYA
X-Proofpoint-ORIG-GUID: X0Xh3F_xSwJxLnOSHvfxMW7uChXnjNYA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE3MDE5MCBTYWx0ZWRfXx4OAOdz9/tXV
 9TIj9uPSTe2TajvMWTAjo2Y7XAXFUfp1+vbyw3MwPxeq9mSctKfiGAdqc8WItj6Qo4A5G+lHcoB
 w159HbctXNkXBZdH8O1sKCT+KPt5V14uiBrLzaz91ZMhv5JvyR17Zz51hwSjyBVsA162UG8TmiF
 8qbNzVswMexR/o2gQ7vPSrJvsWa0sowc89XlGYagL5/JLnSYkhN6a8SYpFAGz+6Uf7wXFxXSNko
 fqsy4z7MshFFnaxayJg5kTFX9If1DsyYwDR5M35c8/6+tBmt9bIiG4nXe5X/SF2Ncu8Cmb4sWEw
 ObZf/arcBu2IccNkVweGzls5MnDr/A3J9zlh5GOxSVx1wzTCogLn20voJCghAjxo/g70nbragF0
 2PQ2diOwic7JCtxkc+DqKj5PcphQ//UUyNclQzW6X9nnRUHOs/4xq/K0Hw1ypkwiST673NmFny7
 COPvCFxK2klpe1R+0ag==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-17_04,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 spamscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605170190
X-Rspamd-Queue-Id: 53C5E562A63
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108059-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,linux.dev,kernel.org,8bytes.org,arm.com,linaro.org,gmail.com,vger.kernel.org,lists.linux.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Fri, May 15, 2026 at 04:51:23PM +0530, Vishnu Reddy wrote:
> The current clock and power domain enum names are too generic. Rename
> them with a vcodec prefix to make the names more meaningful.
> 
> Glymur platform has three AXI clocks: axi_vcodec0, axi_ctrl, and
> axi_vcodec1. Positional names like AXI0, AXI1, AXI2 do not tell what each
> clock is for. Descriptive names like AXI_VCODEC_CLK and AXI_CTRL_CLK make
> the purpose clear and also make it easy to add secondary core (vcodec1)
> enums for the glymur platform.
> 
> No functional changes.
> 
> Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
>  .../platform/qcom/iris/iris_platform_common.h      | 22 +++---
>  .../platform/qcom/iris/iris_platform_sc7280.h      | 10 +--
>  .../platform/qcom/iris/iris_platform_sm8250.h      |  6 +-
>  .../platform/qcom/iris/iris_platform_sm8550.h      |  6 +-
>  .../platform/qcom/iris/iris_platform_sm8750.h      | 12 +--
>  drivers/media/platform/qcom/iris/iris_vpu3x.c      | 25 +++---
>  drivers/media/platform/qcom/iris/iris_vpu4x.c      | 90 +++++++++++-----------
>  drivers/media/platform/qcom/iris/iris_vpu_common.c | 45 +++++------
>  8 files changed, 110 insertions(+), 106 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index 84fc68128c70..07cc0ce25b84 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -51,17 +51,17 @@ extern const struct iris_platform_data sm8650_data;
>  extern const struct iris_platform_data sm8750_data;
>  
>  enum platform_clk_type {
> -	IRIS_AXI_CLK, /* AXI0 in case of platforms with multiple AXI clocks */
> +	IRIS_AXI_VCODEC_CLK,

I really wonder... Why do you have IRIS_AXI_VCODEC_CLK and
IRIS_VCODEC_AHB_CLK in the same patch, targeting consistency.

That's not consistent at all...

>  	IRIS_CTRL_CLK,
>  	IRIS_AHB_CLK,
> -	IRIS_HW_CLK,
> -	IRIS_HW_AHB_CLK,
> -	IRIS_AXI1_CLK,
> +	IRIS_VCODEC_CLK,
> +	IRIS_VCODEC_AHB_CLK,
> +	IRIS_AXI_CTRL_CLK,
>  	IRIS_CTRL_FREERUN_CLK,
> -	IRIS_HW_FREERUN_CLK,
> -	IRIS_BSE_HW_CLK,
> -	IRIS_VPP0_HW_CLK,
> -	IRIS_VPP1_HW_CLK,
> +	IRIS_VCODEC_FREERUN_CLK,
> +	IRIS_VCODEC_BSE_CLK,
> +	IRIS_VCODEC_VPP0_CLK,
> +	IRIS_VCODEC_VPP1_CLK,
>  	IRIS_APV_HW_CLK,
>  };
>  

-- 
With best wishes
Dmitry

