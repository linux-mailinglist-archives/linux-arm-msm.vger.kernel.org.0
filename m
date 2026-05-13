Return-Path: <linux-arm-msm+bounces-107406-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wAKbAey8BGrrNQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107406-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 20:03:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 64E1353885E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 20:03:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B31DC31496C4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 17:54:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E539D4DD6C0;
	Wed, 13 May 2026 17:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RnrEFmAG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OqNuhNc5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 864B1306D2A
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 17:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778694849; cv=none; b=hFTE/QAtfzs6BUPv2kTH4yafugm4Uz1JRXxFiAERklkErvTAsDCxENxc43JpsdzmaQ7+Ux/l+9k74dxBnwKceZTAzyosNruDP3H16yu5NNtPJ4IQGpk3GxTOEDRF9AlLDm0HF1NPPPGXGabJ1izwcDjdV5YrpphO7h8uWd15zCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778694849; c=relaxed/simple;
	bh=5OCnIDxaKzXtIMFl7vgca1Wdf+x4Gq6w9DliutD+wa8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H2+NTatV7Vq2yd85qzKlfGeRVoPq+MioJQSKt0fKpKmixLql8BAoE2/XaVKpzXt2DaD1Sj6suNwIyrRonN3kBPP3Nrcg7m+TjpGHbi1cWLuIebv3kT0Pp7wrxbiqul/Hbzkj1wtFpGSQsKVPjO9A+xxUs+q+tPbf2LIVH5p22Ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RnrEFmAG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OqNuhNc5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DHcEcd3430224
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 17:54:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rPuHL/f5LzXJ7O7qOo274Obs
	+ipAHrmu1VPjHVQ/kck=; b=RnrEFmAGoLK6MSSxH/hyxpSV94i49m/hTXnpMIbi
	D7cl9PdO2cHptax5x49zf/eDaswen8dPC1Z9MKvwXnNfg0Se79gL6OSFmSE/31HB
	SFGfiYRWoYg/1GpBol6ieYd0ontVTPIMbEeIsikKfwZQ8ZH+1zPScFZ+0gh87H8d
	xfjxPH2dZIc7qXrQ4WxqmmxtwF5W0ZfctuaohLAw5NA1oLPbyFiQj13uctdBVqwn
	aUSahxZQbQPR8ONqSWRf5yLcqLQ57B9RcaRdZRp4K4FeG9SfEy8KVbtMrueuuaAr
	FGQHPyeAyThzLhvmkv2qOZfFtvOz4Gn7p8RBqSV3MvvzEA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4qmchr6t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 17:54:07 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50fba8d8c40so50103391cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 10:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778694847; x=1779299647; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rPuHL/f5LzXJ7O7qOo274Obs+ipAHrmu1VPjHVQ/kck=;
        b=OqNuhNc5S9UqRbnv+3a2P0a73yzgVajispWeJ77/VVOIDRI7/gRsCLsmeGyD/6ayNM
         5Ayah76Q2RE4kJS9wKSi5eCSB06WJGizBZockx3YKLBFXNRarWDFxBlppk+1UkyFT6bW
         X5mZNlksomo032a6dzkQwwzl75AqFgH4TYuI7J+Z7aGZ3DX0rbgxHRpkejS98Ne/itfS
         z9Ih8PyOJy9BAniOUjW8+ZbSoc1l+IWqjr/409mYvJhUD1KYreSWZDQjyj/00qGhQUFt
         5S/O8DLKc5woEFQ5b1T3HZfn0MQbVQrsLbTEGtIUsDOkf5d3+UOuGZxOhqA6GRRPtD6H
         dasA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778694847; x=1779299647;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rPuHL/f5LzXJ7O7qOo274Obs+ipAHrmu1VPjHVQ/kck=;
        b=Xod/gf3vDjoTjxmbqJITf4VBAsybY6/XlYvvNa3QgpUTbNGkKQB+/dofJaLo1gJTdp
         JGDjizy3bAsgyoGMuqa9LUCDO2u1mJ4/8OjX11dzJFKE3TQ9nKCBqCGqlUL9//kdmGdJ
         D+vmqmuNR64Znycq8OajW+qJ9cbHIa0g147/VaNWo9I2+v1sUW8paT6Ab8I9qYVNIn7t
         Nq0EH9w242jyIvMh3E4p3NZOrNMoIvZvKYGwSUXWdJANEkY1509YL9ODg0a5vMu7UvqV
         z9dYQiQ4md0FXYkyDmlNwWJ7tEc5bCdfmEdBPMprRPGe0bmue/mlgVychNFZZvI7Sh4d
         PvXg==
X-Forwarded-Encrypted: i=1; AFNElJ8jGOh3bIOV3AKG3mecYZJbTqd3zEg5t2mDtr/0KwVrSmlimoCMVkMdqjibIer9+RXPWkzlJ/gpndEKMJnt@vger.kernel.org
X-Gm-Message-State: AOJu0YyvQLIWZRxgDM4rTf9hIfozl3qrLNcTa+oHh4wgr0MSPiwj+PPS
	NO2yBy0P6jMPgFcMXC/0t2M07RgcR5vt811cW7L+cS513k+EAnf9+yyLO8NGtfODheUsgP1hiN4
	Ro/6yynrj4KkvPT7MBKYmmwqwa86KGrbyS1Qkkam8M4+8QXQ0ymNRycOuI0ffkBm4PVrC
X-Gm-Gg: Acq92OG/0Kj1HfqikaDMbVGXm9vaSYqXn9aBB8xKS/IVR4RpsWKStAQZL27w0lG8aIO
	AeLTJ3J13DaJikdZaUGfsOmKPbTD7hJjptWskh6yl8gKyxAwYFJuDRlD03P9JUQ/d3PmFKnnl8s
	0kwuRK09O+7ErxSxH86+WDV2QpV0VCJMlynOW6mzFgCpi+uc7Z9PCplrah5o+O1ZjRyyuRMTFXI
	2q3q3T/t1RytQLHZ/WBLFVM+4vSQtvE0UQOfbinQrFtBja9dkeH2eZ/MN6gVePasmY2ivdENwVH
	K3P91dz/7nuGLrxWSVsT8xN9Nz5KAFgwgqKOqi+n1Lnbmx/CkwBCj0wo/LXYOnQ3ESsbapZ/Vca
	QC6UYO/AHP4Z+unhT/6CSYipGVc9ayRUMHbZ1Rg23+Yo+DWbnAErL/YFtWnPoEXpJo9ezQKsXTW
	wCcN3bzNOuHjUjfL5LTKIgiFsZ7ROSVkuDGQM=
X-Received: by 2002:a05:622a:98b:b0:50d:a3a3:e612 with SMTP id d75a77b69052e-5162f4a88fcmr58559301cf.18.1778694846807;
        Wed, 13 May 2026 10:54:06 -0700 (PDT)
X-Received: by 2002:a05:622a:98b:b0:50d:a3a3:e612 with SMTP id d75a77b69052e-5162f4a88fcmr58558691cf.18.1778694846256;
        Wed, 13 May 2026 10:54:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a956606fsm4199375e87.60.2026.05.13.10.54.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 10:54:05 -0700 (PDT)
Date: Wed, 13 May 2026 20:54:03 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 7/8] arm64: dts: qcom: kaanapali-mtp: Enable GPU
Message-ID: <c3qa7bctzt4v7lblcnagdkxl7q2ku6iutwz3c7yplh7zvrrxb7@iyhn3wd43mrj>
References: <20260512-kaana-gpu-dt-v1-0-13e1c07c2050@oss.qualcomm.com>
 <20260512-kaana-gpu-dt-v1-7-13e1c07c2050@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260512-kaana-gpu-dt-v1-7-13e1c07c2050@oss.qualcomm.com>
X-Proofpoint-GUID: deXRydXKHQtLUpkBen2CzGFG5lCeS_2i
X-Authority-Analysis: v=2.4 cv=Hu5G3UTS c=1 sm=1 tr=0 ts=6a04babf cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=z9YPW0OalzF3dbzmYPEA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE3OSBTYWx0ZWRfX6ioanUT1aILU
 vUmLFq0lQnkuLaKLafTxJH8+kRJxadwa98Z9PF6IYLNlE2z91Dxfc8IOU2/wKpnxgj+utTpntdu
 QcjPHzqg6m8yuJ+Cyoa9WguqajcySiJMdDPEingmsjbYrxB0OSdaQGZhuUsArLsebTo9cBRdvM4
 6hqL+jAIbtLE10u9yL1qv3ueckYa6dwrTtbWBP/n7mqBD+lBFfxtLkC9lmH9hgWLsTaedQi4AC2
 xw8UcTSBtCeOF1Z/4DkYVTHMWuQqu4ONbyxxOhBsTSrnNY0SWmbbsTdM7cxIX4nPL6ul1Uf40Y7
 wHTxrKYSGRinnacUmZEXogrpMTpyf6PMM1me1HBvfKi2Z4kKcgkKgUXPPs8oYA1aIQMrZSBoNOF
 aZtyLWkEeZ8lMwayuzBDMZ4nZ4MZaU5x+2PkZAs/aV3dxNZXz+LL4sFC753UvdEoCt90ASmwbJJ
 qgjfAQJz+LMnnCSsc6Q==
X-Proofpoint-ORIG-GUID: deXRydXKHQtLUpkBen2CzGFG5lCeS_2i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130179
X-Rspamd-Queue-Id: 64E1353885E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107406-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[27];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,arm.com,8bytes.org,oss.qualcomm.com,linux.dev,gmail.com,somainline.org,linux.intel.com,suse.de,ffwll.ch,poorly.run,lists.infradead.org,lists.linux.dev,vger.kernel.org,lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Tue, May 12, 2026 at 03:53:21AM +0530, Akhil P Oommen wrote:
> Add the secure firmware name property and enable GPU support on
> Kaanapali MTP device.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kaanapali-mtp.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

