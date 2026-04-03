Return-Path: <linux-arm-msm+bounces-101719-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2FYsGAsW0GmV3AYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101719-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 21:33:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 08546397AC4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 21:33:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EFA1F304D161
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2026 19:33:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27F463D6CA2;
	Fri,  3 Apr 2026 19:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SFXHOl18";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="is3Y8BAc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C07F3363C58
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Apr 2026 19:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775244795; cv=none; b=WQiVVkFPe2CfpMFP9ynY2UxlDVr+XDdrvUHC7C4hixae6aBA9qucHsd7WHZCWFwa5Ru3OBWnuyYq4pRLD83/3Yc+18DcZNmXC8HHshSa3x0xSmuRjzgOMZ0sQo8lB/iTpjeefSycpK+pnK2ODiHyne/we0avGKO3S7BG5dKGZzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775244795; c=relaxed/simple;
	bh=Nm8bVhXwnXi2Nj/UAQqeoQnFymro7OZDrrWhb6FQxok=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U1k+WnUD9yQsOx8EIjCqiCv9lVQTwSQlB6gJpYnnLx7v+1s9hy68qSoVtRasE7ap6tDiPPaIqgiX8NUrohJXsGgZclffLgiRpoAkYDTSRx+UBZPBTYLUb4i3waIMg7sZqXX/UNrqhb2dD2OEn0qVu2pGgyiKxTZCWRvW27qWwtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SFXHOl18; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=is3Y8BAc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 633EX5OE141785
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Apr 2026 19:33:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hYnQcnhGrNgV/eoN2v/2MbLY
	nIbeQOs3Yrb0qovNiyA=; b=SFXHOl18ZrNpJYsxzN0alNvOumMDCNM30qEr/82I
	PJbpGr61yKTxM0Ht+vfdgHQSS2ODMl4CQky3KuOEgsguhcW4Km2MHi+7ZfeGHCxa
	dKpua3ge4HBlz85i+tZGv5RfTHQCsPTxgSSKm44+pn6FdFyCpQFnzY6W9Yoh09Y/
	hmTWqqhtVosQ5po5LI6q3xPp6p0KpdqSpv/yDNICpnVXYIcp06rC3wC+WWfLdJ15
	pGeyH3O6nbSRHIkySc+L6Negk+qMi3rhyOfxdHK0fuQYpOyKWnWH5X+WiI+zicaS
	JZretIRWjpOFR4hzxFjHhRC9fxX3nR5kh0M/bU5r6MpYeQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4da83y259r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Apr 2026 19:33:12 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5093b92f327so62222431cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Apr 2026 12:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775244791; x=1775849591; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hYnQcnhGrNgV/eoN2v/2MbLYnIbeQOs3Yrb0qovNiyA=;
        b=is3Y8BAcfRynBV4Nu4AKdq/aw8T1bXMd9sJ2d/7KuXUdiXhT78V+B49bw0ilH7E2fq
         3f7xmgwuYZddm36Sg7VTN7zRhz180X/N1PVpo6ahVBFrrlNn7P9pYU+laiZDJhd/0UkF
         /QhL0vL8exMrwh49aPEaxAZXybsL4Xmc4iko475AYdkJiV7GuulMNlqf3ikCRvOvosej
         lBCVSxaWCqEXgeAeOw3fyTR+lPhwNwJq24tcg40d29qN5v/du19hA/xfLCbQkQ0yu8sx
         KPQzGDtrb/z6VLn5BQGJ+rvVRyUFZHDDdjJJU/6FMBpHIQiS5w1sfifQL+dkK26OyaSd
         rY6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775244791; x=1775849591;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hYnQcnhGrNgV/eoN2v/2MbLYnIbeQOs3Yrb0qovNiyA=;
        b=Ym8sheQkFNqnT9iQEcuJXxdprLecAFvp7Yq4o69yaokTElzClfj3pSQ9UqdRDmUkpB
         oj/gyuOzjHRVCNjhQE6iFccGT+efRe3yV+2ZQ5vUntecjBRTkvu5B64BiCnZqFOxMtXG
         rLXsGlOVcFskYihV1V0sTIScGOowbpnfekvLzOMWxmfDw/ORfRH6HLH+X4gHcdoD4CJR
         N0rZbyvZSCHPz1dT4Ez38VeGullJHtl08w+QeK11hEUBSZGXg5A4DyCpfLbbx6cEzK3G
         dM9/nVfyAClBPKcAjW3OBmijq/uu/VHVi1Z0RFh2C0x8dDjBGMhZzOq8Q9cGtUb8Jikg
         GnCA==
X-Forwarded-Encrypted: i=1; AJvYcCUaoPls8oCCs9C65Y1IhY7TszqW8wJikWuQTVhaBaQjWMpTscPpEl4T82liYuj1ZxNu4UvHxGBhy/aqdRkI@vger.kernel.org
X-Gm-Message-State: AOJu0YyE8l6Ebs8/Ig159SKLbI+exzcNxIHigJVh1dxcz6w334Ae0UFA
	rnBCdwgnAxLhlhRPCiQFtGQeaxcDLXHfIxNv+GmlUZ4cAwFG+YUWqKRxu6Em07qmidsrG+yRWO6
	AWiQXNZtWOyP6I28QPjLnNY5sryDk4g2fqjv7fjUftsjSdVsmITZN4qD9dgRhcu57Mqc6
X-Gm-Gg: ATEYQzxXDbLnQXJotO91gxTof6xuCethxbANSHogYyjTqFcDEnepO+nCXxJddBI8L0m
	uNsIOhZFNFZvq52soNl+4T2xF/Iv4awlQOTr0/1quOktjLD/pFE0fFpG2CNGLRnc+/Ey51fN7VG
	L9xAQqUsTe9f78kwEtdkIL1iUM+tmbNRz8Son/ezDrDl+B6XovLaJoDtfZ5lLeHcNE1crEmz3m8
	oGvPU7IfUK8PpEVjwVXhHtq+LlMFbmFNYEBBGwnYLLWh2hKe1fycqzuqkSf4/aoMIgO7tKGe/YP
	iwadMEHrjC0kTMTeuvhIFoXDdKGEh98oAqOP7nyTP5booQGu3b1DVYeMYeW1Y26ddu6/E3r8x5S
	+YKKBEvT3a3F+/J0XIRMy40UzzEblPAoiRsWdgTNAJ19VZ/i3LMUWg3d7Uu2A/BaicwUoKMMrva
	HRjgbx9ZL2PuMI6387bASHNAdErJWMQz2lBZY=
X-Received: by 2002:a05:622a:6850:10b0:509:481:5365 with SMTP id d75a77b69052e-50d62b02630mr48690771cf.50.1775244791114;
        Fri, 03 Apr 2026 12:33:11 -0700 (PDT)
X-Received: by 2002:a05:622a:6850:10b0:509:481:5365 with SMTP id d75a77b69052e-50d62b02630mr48690431cf.50.1775244790654;
        Fri, 03 Apr 2026 12:33:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6c9cbcesm1654085e87.21.2026.04.03.12.33.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 12:33:09 -0700 (PDT)
Date: Fri, 3 Apr 2026 22:33:07 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alexander Koskovich <AKoskovich@pm.me>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org
Subject: Re: [PATCH v2 5/7] arm64: dts: qcom: milos: Add WCN6755 WiFi node
Message-ID: <7edl5o4lc2jk5exozyxomxjzooqqhek5zyvmp6e3p4ndxweulg@h2dwmk2zizgj>
References: <20260403-milos-fp6-bt-wifi-v2-0-393322b27c5f@fairphone.com>
 <20260403-milos-fp6-bt-wifi-v2-5-393322b27c5f@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260403-milos-fp6-bt-wifi-v2-5-393322b27c5f@fairphone.com>
X-Authority-Analysis: v=2.4 cv=ar6/yCZV c=1 sm=1 tr=0 ts=69d015f8 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=6H0WHjuAAAAA:8
 a=EUspDBNiAAAA:8 a=nnh3LCdgXL55amKsc48A:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: stgyrNqcb9AfLxGRt6p8I5lqF0BzKWxd
X-Proofpoint-GUID: stgyrNqcb9AfLxGRt6p8I5lqF0BzKWxd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDE3NCBTYWx0ZWRfX/b44VinSCtWP
 3tTTvTF2vp7RgoChqy1mQ8RN77Iy9wDsI4j+x1/ZDwic7GEXyRVA7RK8Zrq5RI7HKJoo+a3Gr7O
 SY1kuoCVXyDQKa2pNkOSqUteiSJeinVM7M1VgAjufgtAR7lK5nyBy5Rbg1V8pd1GmODgMWyc/H8
 PwPN/O+Giwi5Bl5nXvrSsS7ejTdQU6tqKD2+EJi8TbSUT5ux6Bp6Rd66O2471v1NGtIL3Oj79Me
 YRO5b6BlVubc/unTuTQFPBs/nH2GpBr2cjJmwP6+W/Kpt/VDSta6wHvt7YL6389tZ8xY0DWi7Ia
 AbPSdxSExe5+4zYb4DJ00JdUZt/L1+LxgI27t1Hf6y37wmaaLx31aKn3bRav5CClySq2PS+YqT4
 abAWwgYXfAqTas5Wt4tKsltWyJkbhapzZV8AqvFDMwVsgxFn0rgYGV2L0+xWws/acXvJHxhiLp6
 9noE2ZbmA4jjKOwwDDQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_05,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 malwarescore=0 phishscore=0 spamscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604030174
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
	TAGGED_FROM(0.00)[bounces-101719-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,pm.me,gmail.com,holtmann.org,quicinc.com,sipsolutions.net,lists.sr.ht,vger.kernel.org,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,fairphone.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
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
X-Rspamd-Queue-Id: 08546397AC4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 03, 2026 at 03:52:51PM +0200, Luca Weiss wrote:
> Add a node for the WCN6755 WiFi found with the Milos SoC.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/milos.dtsi | 46 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 46 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

