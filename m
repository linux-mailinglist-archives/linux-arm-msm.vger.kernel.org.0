Return-Path: <linux-arm-msm+bounces-90682-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iC9kNHuIeGmrqwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90682-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 10:42:19 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A0BC91E74
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 10:42:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A37AC3012264
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 09:38:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B1C72C0F7A;
	Tue, 27 Jan 2026 09:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PZuKPyBn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X+omophY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDB4A2E0B59
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 09:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769506690; cv=none; b=Fa+8WoC9x7eFelt/FjZvBEULL2pH9yudcbQWSxtn7Z97XPcRGRs/blzzA/ycsp0jeqfoqd6JXeiKM6l0TAygtNGglV/vYItfqbENwRgqycHy3b3NJeFbsuEzAr3XZdPx8mITTKQ+x/qteGrada/2cCj7bA3VBvtc783UIc8hX9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769506690; c=relaxed/simple;
	bh=GYGOUtyADGsv0KpQrM6S7wBKne9COcR7J6drzhKdUjg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uEz9s0+PJR5ykavjt39pCu0b4WOqQzzVd+MoUTbqDySGsbSAA5NWWFirubNBEW8rFrkn6idySxeGhYyn+xODD9tyy1sdd1r18TgrJcEaisBg/8z9YznpSn+9NcUaMcMLkLBEhI0gHLlFeshDRQLMDMRBQxC4PCL23+wVYgLRZwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PZuKPyBn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X+omophY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60R4UBQd786945
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 09:38:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0gH301sgId3YAlETF7y119rA
	piUMWVRjkOXADa65XqQ=; b=PZuKPyBnyRjZy5gnVK5dQcDWOOyIDLPzFnC24pWk
	UYtbcL7TuoQCO9MalIQp8V5KAEBjC1GfzDy6AkUWclIzPon+P+/wnBSzYzZAzwgQ
	aPf41RM+G3eGjz9OayGBs6U9Zo/rRrqXWAVuQVtS3u1HW37mCsUm98JUu4wV+X75
	Ag20VYOQ6MfP3sse+m/GYtxy7V7n68olgHK0yFqwzr7oJoFP1g1pTpzkaNu36HuJ
	n9OjkI0RNAb4sgXtE6Pj5Xrf0yi7XTZI3AitVxMShqkm0j5oAmCspa3LJ1NEF3lm
	yW/AEyD4tF0YitbY/kggek/pG7tiavyB11+/2+TyNDdotQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxg93j2cu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 09:38:07 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-353c9d644b0so1587618a91.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 01:38:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769506687; x=1770111487; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0gH301sgId3YAlETF7y119rApiUMWVRjkOXADa65XqQ=;
        b=X+omophYABxl0iPpU6Rb7gOfKMrqUNdIKIY+RSaxQ71kv1muoXsRcoIMfUIwPCCnQP
         E1PS99kj4lpJ1LRInF2hkzVaqaqAtfogfI3ojhFs0nHLPZVU+Pf5v4NE47hVFv0vxTLP
         gVN4eB57YceKNNllyT8scGhZpaoGrUCcjjKXDVrpEsf27WpWP7MVA6h/dEX0ZYsV3N2F
         ZBCbCtAQxKmtt3o2Zwga3GFsCEfOXjzto0atiFaAK0TohaBtkcMd/BaWeE4dnOCVK3l4
         WvvFCn2+bGIAvJ0VI6FmxDgHeUcvKnZbZzIHTNFM4RikMn3MwekKF4XaHH9Md3Bv5K2Y
         J+Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769506687; x=1770111487;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0gH301sgId3YAlETF7y119rApiUMWVRjkOXADa65XqQ=;
        b=ghms45vn0ImEwbnf82Md8Fsrs2ltXj2gM+Lio3yomj8OcVjAqwlLIe9w2S+1U1A2TG
         anjA+4vUkp5SZhLBBpqmbCNr5Alc7jZ+XtbwWolUwbMwBQAkRH0k2qYL3fdh7c+kRl8c
         DozuoI6bY5bJdzrVGqXCdSG/PTzgolu4FyFMBqh5W5EHBRD/YBl1+1EaW2DjK7ykkvwi
         9f/IJ4C6MEHaKmxKkZ20/2+fWqqqBGCngv3te3mSqmvRyu7Xw1D81BoUgJy3vmnFfLIE
         Y6PSU/vzZcKrC//cKjlBUsuLw4rr5uUAjkmnGoLi7rhuYFVe+WwMrrBhtjhq0KYV+b4P
         ggUw==
X-Forwarded-Encrypted: i=1; AJvYcCVQBuhSFp2KOpsP113CeqxYtXhf5eilyvr38EiDtFfSL+2cHBgQ/+X15l61+4UAnJiz8U2aAFpGPZCJjWVd@vger.kernel.org
X-Gm-Message-State: AOJu0YyyD+GFP1HZiAmoV15mt2+gRGNtttiv5CINWBI/9TL7mBdTlOGE
	WYYWsu9RxCrFWq1Nec+Apm+oZdpbTraVQ4D4PeKGNLnKx7RnmErxsueHdvA+j0JoclFicASkbH0
	ibzXyRRyd+XYnssunjnGduOvkUhTZ/+V7ezKXLK+hPKzYDEB4Fsqq1Q639aIydr+2mvT6
X-Gm-Gg: AZuq6aI8e4x40DV2WEo7YBqt2AcPgiCFBnZLqrITN0LCN4vrfSwGaJTqGM+7oTr2g/o
	XkNx7Mero4VvOHSSRcYjRc+o3is3b3ygn6j4Nvk2yx+kg3PlUIxLbtdNRKGh7997MY/6FVWoO6d
	kngW10V0+db6t4bGH4mp2wgG+ue3+32T51xiWmcBRAOGMDJa4TyRcgYOqxno4kdpNQryws3Wnj+
	GtD0fNP594otF0Z49aUGCcfCYz5sqdR4GIItwjxF+e2zaguS4IyJo5z5v11qMfGv7KOzANuZqAs
	RAST3rk+pplpgDkGpSXXgWMSi0BPB9GsCDlkv+C+nwhb506a+wBwry5SarElkkds1Qg/XV1j52c
	2ALOrVYG6wz4CxCSFKXypHx0/ocJ8lCR+ANXlv0sxRpnTiQM=
X-Received: by 2002:a17:90b:2dc9:b0:341:6164:c27d with SMTP id 98e67ed59e1d1-353fecc66admr1183078a91.3.1769506686620;
        Tue, 27 Jan 2026 01:38:06 -0800 (PST)
X-Received: by 2002:a17:90b:2dc9:b0:341:6164:c27d with SMTP id 98e67ed59e1d1-353fecc66admr1183061a91.3.1769506686092;
        Tue, 27 Jan 2026 01:38:06 -0800 (PST)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-353f5f96293sm2017007a91.0.2026.01.27.01.38.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 01:38:05 -0800 (PST)
Date: Tue, 27 Jan 2026 15:08:00 +0530
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org
Subject: Re: [PATCH v3 1/3] soc: qcom: ice: Add OPP-based clock scaling
 support for ICE
Message-ID: <aXiHeMcQiF8X1ANZ@hu-arakshit-hyd.qualcomm.com>
References: <20260123-enable-ufs-ice-clock-scaling-v3-0-d0d8532abd98@oss.qualcomm.com>
 <20260123-enable-ufs-ice-clock-scaling-v3-1-d0d8532abd98@oss.qualcomm.com>
 <gfqpfzulzptkrbcrc2zcnqv6kmtdgwwxqc2rxnbq3rlh7azilj@srzlycd7wv4d>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <gfqpfzulzptkrbcrc2zcnqv6kmtdgwwxqc2rxnbq3rlh7azilj@srzlycd7wv4d>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDA3OCBTYWx0ZWRfX9JWBrin/016r
 eheUdGG5652fNBmK0hWkVlPsRraaKYH8HN7/IYoPcMdN0JFTTX0nEtmGaPZjkmZdGJSzaFxc8eZ
 ArFDyzVSJ3X/87/njmprBRkIgbAngpg3T2h2pN5NN+HAVDspf1Ybb9kWSpFKPy/e6d6r4q82/p8
 Bd0W5g60wngF6GipqQmYeN5jpLitOU4Hz3QpTBD9rjHEHNbLGq+N3Ji+SpU6jcfSTEO4Gje0s+X
 eeVgkZdeB3YoQZYzsEekajn1tAt3jjgPaTdvyR0RDrVUn2zCkJzkqC+wRfmZnRyRHfeeNNBOu7q
 jKa/0LnUvLt7Wc1zU8VpbYreCg1ehWR971v7XK2K8KAxr/ZhDBWVcVV3zhKjZDW519k5Pq42366
 3yoMcamofrrepkjctHFdvHrQOMBi4j74WC+TYuMmj26xyoEUncyTdRR/22WeUu4hi4hjQy51U1u
 EXZvnNNI1jVP3h7xWtA==
X-Authority-Analysis: v=2.4 cv=Uc1ciaSN c=1 sm=1 tr=0 ts=6978877f cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=J-iJWbdkTBbMhk0S1ZMA:9
 a=CjuIK1q_8ugA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: RjYkrkPj6-IqjgyvMOTtZR1VdF_d9WuY
X-Proofpoint-GUID: RjYkrkPj6-IqjgyvMOTtZR1VdF_d9WuY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-27_01,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601270078
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,hu-arakshit-hyd.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90682-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abhinaba.rakshit@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5A0BC91E74
X-Rspamd-Action: no action

On Fri, Jan 23, 2026 at 09:21:40PM +0200, Dmitry Baryshkov wrote:
> On Fri, Jan 23, 2026 at 12:42:12PM +0530, Abhinaba Rakshit wrote:
> > Register optional operation-points-v2 table for ICE device
> > and aquire its minimum and maximum frequency during ICE
> > device probe.
> > 
> > Introduce clock scaling API qcom_ice_scale_clk which scale ICE
> > core clock if valid (non-zero) frequencies are obtained from
> > OPP-table. Disable clock scaling if OPP-table is not registered.
> > 
> > When an ICE-device specific OPP table is available, use the PM OPP
> > framework to manage frequency scaling and maintain proper power-domain
> > constraints.
> > 
> > Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
> > ---
> >  drivers/soc/qcom/ice.c | 63 ++++++++++++++++++++++++++++++++++++++++++++++++++
> >  include/soc/qcom/ice.h |  1 +
> >  2 files changed, 64 insertions(+)
> > 
> > diff --git a/drivers/soc/qcom/ice.c b/drivers/soc/qcom/ice.c
> > index b203bc685cadd21d6f96eb1799963a13db4b2b72..ca6a7df7a6827378af1f013c7e62a835d1b80cc5 100644
> > --- a/drivers/soc/qcom/ice.c
> > +++ b/drivers/soc/qcom/ice.c
> > @@ -16,6 +16,7 @@
> >  #include <linux/of.h>
> >  #include <linux/of_platform.h>
> >  #include <linux/platform_device.h>
> > +#include <linux/pm_opp.h>
> >  
> >  #include <linux/firmware/qcom/qcom_scm.h>
> >  
> > @@ -111,6 +112,9 @@ struct qcom_ice {
> >  	bool use_hwkm;
> >  	bool hwkm_init_complete;
> >  	u8 hwkm_version;
> > +	unsigned long max_freq;
> > +	unsigned long min_freq;
> > +	bool has_opp;
> >  };
> >  
> >  static bool qcom_ice_check_supported(struct qcom_ice *ice)
> > @@ -549,10 +553,29 @@ int qcom_ice_import_key(struct qcom_ice *ice,
> >  }
> >  EXPORT_SYMBOL_GPL(qcom_ice_import_key);
> >  
> > +int qcom_ice_scale_clk(struct qcom_ice *ice, bool scale_up)
> > +{
> > +	int ret = 0;
> > +
> > +	if (!ice->has_opp)
> > +		return ret;
> > +
> > +	if (scale_up && ice->max_freq)
> > +		ret = dev_pm_opp_set_rate(ice->dev, ice->max_freq);
> > +	else if (!scale_up && ice->min_freq)
> > +		ret = dev_pm_opp_set_rate(ice->dev, ice->min_freq);
> 
> Do we expect that there allways will be only two entries in the OPP?
> If so, it should be a part of the bindings. If not, please design the
> API with more flexibility in mind.

No.
Thanks for pointing this out. With OPP v2 being used we can indeed,
support multiple frequencies.

Also UFS core using devfreq clock scaling can scale among
multiple-frequencies depending on the load.

Will update the patch-set, with multi-frequency scale support.

