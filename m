Return-Path: <linux-arm-msm+bounces-107835-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +OIgO7YIB2qcqwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107835-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 13:51:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2541654EC94
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 13:51:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A2A6E30125A7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 11:17:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 927A947A0BE;
	Fri, 15 May 2026 11:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hhZ5vfio";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R3V1DOkg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3333F47A0B8
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 11:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778843819; cv=none; b=SlS8XEP+oNvBf+UaBs0UKtGym8+2lC2DeV5vcWruk7dec+X1A/CSliAJbnISPZMAV4GPxHhAZAR3UbpK1QOvh3dG11XU6WZdZTkW31UChTLSWWAAlYYMPdsMSES3NnxiJGsIpve5iI5e9OWBs8vo4F0kFLKAMqISkSWRxtLdiWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778843819; c=relaxed/simple;
	bh=IWnII/8of5Gkw/ETzfubG/lxFjHghKOesWQK+yljwLw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GZnrVx1SN0WCZwIld2srJf/TsAoOsDEAu1Fr8fL0++oq0kBhLJTfyQg2m7BXaDPFvSqnacoHywFo3Bb7NuQpjY6xhmNU8hLRaQwxsRhTYwdcVjiujfLgGi03gTjGyOyaSvmuM07bcxAxL/TG2yxM9B7RGFS7DUka9Rs32J07jXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hhZ5vfio; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R3V1DOkg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F5U6XQ4008246
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 11:16:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=s0fs7treef/YeBXhb+YaPUyD
	DWnHEq7xUjHiT+MePCI=; b=hhZ5vfioM01WUPLnn4NidiUbotqj0lrj/LNZwPG1
	bs0uFcA1cXS7pIuGAPeLZTkEqt1qfkRBZzA6X0iqoJIQ+AFZvU2VHz9JqHCIyEao
	aNgzBOTLW1fxyy5RRMt6zdzWC9sF3skk/1AxXWg2EiqP8bZU6r/wN6P48m6fRn3D
	zK7CTtSk+eQio2OdhKWKXWHefGUuUcjJ19AA5k6MfBUAPZQPqdXKI27PoY5ezT80
	cMcQPt5Q8wZp+VNByJukmPUUdJ9K+qxRcl49jpmM8eSumDIIdwDQ3lxOs6nakFJQ
	Bmu5oo0ZQ7t9BVB6E33hlnWZzRDxgtCSCeGZfOUH1k851Q==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1su0ms-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 11:16:57 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b9b8137828so97470995ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 04:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778843816; x=1779448616; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=s0fs7treef/YeBXhb+YaPUyDDWnHEq7xUjHiT+MePCI=;
        b=R3V1DOkgPjJbPSDYuFRlPPxte+U6Fg2RIerL/TQQudIxRiidwG5sAnJUEsP6l4D+UD
         dRtGE29AalqTc4l1jg5dCvUr8BJjaCNuiOG2SuwZkXyGIIY+AMn/whhw1pPsMOxSzuMg
         PNRzqUgM7ViRrk+gE0N27wH5RGy0LFGXFACVqIOakU9UDwx8JNpYrktjuxzwDa7KAQZg
         h8GFQya2RRhHvUoQu/UDzjLgBJo38OggjvWQWAwV23Ib1c7iFvsLUwIuBsBDb7NCO03i
         VVxT9Qs5N/8rWY/CMAqJ8NhcsSr4tsSeANQF05ldz+uimXKkmZYeZQHW095diJI8SYuv
         eEwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778843816; x=1779448616;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s0fs7treef/YeBXhb+YaPUyDDWnHEq7xUjHiT+MePCI=;
        b=nPXrXQyShMi5Ph98tm3phl0V+IBLFp8YeSwfrpDdAlqCuZBrhYdVUcipeTG6ImiTOi
         FsW3mqh/Colt1aBS9alKZpzZH+IErKdC5dfKsCZFCYYiPDsPowjdRLuH65GnPP7C7jXM
         5cAqZJEoLv6vr3ZKIvGOm+yh4QGww6yLG49Abpv11DWl8pPc6C/Rp9gZvSns0B31L0jI
         7pSiBylvavyvZW10GGrwn5giI2203RY7g9HhD4ztR00isdgvYBk5zI+eat6G380Q4P8C
         g8F+Mpc2nCFuoqjFJ1dX1C5bZVV33ySkv/18kHq+nXDYtNhIYcjhXhInXd+rb2vegOma
         t8Kw==
X-Forwarded-Encrypted: i=1; AFNElJ9eUeoRxpnaviISiZR3uhjiN2h2yYu0+KzdGpCiBa6MI2hgtf5S5BkUCQTceXCOpkpjzs7UgmFNBiga+HfQ@vger.kernel.org
X-Gm-Message-State: AOJu0YxJggfs0Lb27D7T1aK+5AQLmTMuuq70fU2M7fUeCNB9npXkRRW7
	PYE4e2DtEw3eHDfg2nRvurJKw4gd2YTgdZB60nxc69Dbm1wxZio3OEaqet/RvAZH5fZ+Yc/SEDC
	Z+t/GULI4QOSe1fvilqX509DZ0S9VanUxOTwNZTTtUJZ3J+AldvheRQkunZsdvSUG6JOzICO2Oo
	WH
X-Gm-Gg: Acq92OG618XaRfC6MDqZRBg55fXvRnK4NsusmhON+lY7l0O8pJa5M5BiQFw0lBFqTY+
	W7SVnmMLtv2gTjqR7aTM5C5GsxClUx3QOoNRf+xtXHORKN0OmMqPl7MG5qHJQS/fjEbZKx8DwP0
	O5KxHmqQ7RMqJqKXFc6fC7pQVWVfYwpjCZ5gAcosT8s+oUsCzdJcWGE6vFT/xT0fExfwSVq8+3p
	B2y0IJ54FcV5/hzen2aZZyTl7fQrDOHxH0SgyZOc1Kjhl6+yc4Zpr9JEf7sUSoczCqlKLpvugmX
	9ZHv/UdR1IbUz2vlQjWncD4g7mZ/CufuSEyyd82brQQ49zWdNu/vgertUq6TfA6f2V7/i0Co1F+
	nyXHApQ5gzXXmVDnpYf0a0UG++HSDyOR8ecHgtqONIE01NYkNCDI=
X-Received: by 2002:a17:90b:5348:b0:368:83e6:ca95 with SMTP id 98e67ed59e1d1-36951733ddcmr3600606a91.0.1778843815974;
        Fri, 15 May 2026 04:16:55 -0700 (PDT)
X-Received: by 2002:a17:90b:5348:b0:368:83e6:ca95 with SMTP id 98e67ed59e1d1-36951733ddcmr3600570a91.0.1778843815350;
        Fri, 15 May 2026 04:16:55 -0700 (PDT)
Received: from hu-kamalw-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-369517ed182sm2498172a91.15.2026.05.15.04.16.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 04:16:54 -0700 (PDT)
Date: Fri, 15 May 2026 16:46:47 +0530
From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
To: Saikiran <bjsaikiran@gmail.com>, broonie@kernel.org,
        monish.chunara@oss.qualcomm.com, jishnu.prakash@oss.qualcomm.com,
        nitin.rawat@oss.qualcomm.com,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, andersson@kernel.org,
        konrad.dybcio@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v3 0/2] regulator: qcom-rpmh: Add off-on-delay support
Message-ID: <20260515111647.qg75thdvcbvvjpoi@hu-kamalw-hyd.qualcomm.com>
References: <20260127190211.14312-1-bjsaikiran@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260127190211.14312-1-bjsaikiran@gmail.com>
X-Proofpoint-ORIG-GUID: Mztl1gY_BEbrpEVjpRg3DYIsav2gERYf
X-Proofpoint-GUID: Mztl1gY_BEbrpEVjpRg3DYIsav2gERYf
X-Authority-Analysis: v=2.4 cv=cZPiaHDM c=1 sm=1 tr=0 ts=6a0700a9 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=sm6vtEfadFUgZexyShEA:9 a=CjuIK1q_8ugA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDExNCBTYWx0ZWRfX7+XCbAYiWGmy
 wkUdu232+lr9C265pOL9Z1MneRCj8WKvXv/+F6gmR758jX6mSnEjrva5+cBG1Z7aE8v3u7O0ive
 wyBWGkUXhxxVIp07599PmooHKQ6IUPkCQNKMWlDfXG2P5YwT3ncWapAhEesuOIT54h68BsTVhCy
 Wrpe22zrN1dZEA3NepNFslAFZ56a9JcLcAJcCMO/iCNQtE0MuwZBYLJQ+IHa3YbMuZWA71ikErS
 KFHc/tv6i+MGNDJ+GP/zs0GOypOpD186oHZ5jwFTRTscQ7YTj/rSKUsTtn/cr636zbK0ggUoTHd
 +d53G8H+oO/NMN85SopOjI26suHOAwIUEKPmZVTz5RHOgC+6hx6bFdiPzoVmOJEVP1FzjdJ+f/J
 BAmZ5wtwkfc9ol/Hy69Z0wXGhJMbCt1y6296knHFA90gjlClb6T41gwibXHIf6LSX9BxDCwR7f0
 GfsqEOhUN7MsJ87eGnA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 adultscore=0 suspectscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150114
X-Rspamd-Queue-Id: 2541654EC94
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-107835-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,hu-kamalw-hyd.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,oss.qualcomm.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kamal.wadhwa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Wed, Jan 28, 2026 at 12:32:09AM +0530, Saikiran wrote:
> This series adds support for the standard `regulator-off-on-delay-us`
> property to the Qualcomm RPMh regulator driver and updates the
> corresponding Device Tree bindings.
> 
> Motivation:
> On the Lenovo Yoga Slim 7x (Snapdragon X Elite), the camera regulators
> (LDO1, LDO3, LDO7) have large bulk capacitors and rely on passive discharge.
> When these regulators are disabled, the voltage decays very slowly. If
> re-enabled too quickly, the sensor experiences a brownout and fails to
> initialize.
> 
> Verification:
> I verified that the core `drivers/regulator/of_regulator.c` does not
> currently parse `regulator-off-on-delay-us` in `of_get_regulation_constraints()`.
> Therefore, the driver must parse this property explicitly and populate
> `rdesc->off_on_delay` so the regulator core can enforce the constraint.
> 
> Changes in v3:
> - Added Patch 1/2: Update DT bindings to allow `regulator-off-on-delay-us`
>   for `qcom,rpmh-regulator` (Requested by Mark Brown).
> - Updated Patch 2/2: Refined commit message to explicitly mention the
>   passive discharge and bulk capacitor mechanism on the Yoga Slim 7x
>   (Requested by Mark Brown).
> 
> Changes in v2:
> - Moved the motivation/context from the cover letter into the commit
>   message of the driver patch.
> 
> Saikiran (2):
>   dt-bindings: regulator: qcom,rpmh: Allow regulator-off-on-delay-us
>   regulator: qcom-rpmh: Add support for regulator-off-on-delay-us

Hi Mark, Bjorn, Konrad and all,

We have another UFS issue on QCS8300 RB4 EVK, where it seems this patch is
helping.

Issue is seen 2/10 reboots and it happens in the UFS probe defer path:

1. UFS probe takes regulator handle for VCC(vreg_l8a) of UFS host controller.
2. UFS probe enables the regulator
3. UFS probe defers (due to some other dependency un-related to regulator)
4. UFS regulator disabled on probe exit
5. UFS re-attempts probe and re-enables the regulator
6. UFS init sequence runs -> UFS NOP OUT command failed (no shell) 

Issue Log:

[    6.583836] ufshcd-qcom 1d84000.ufs: ufshcd_verify_dev_init: NOP OUT failed -11
[    6.592780] ufshcd-qcom 1d84000.ufs: ufshcd_async_scan failed: -11

NOTE
- Issue is not seen in first probe attempt, because UFS regulators are left ON
  from bootloader, which gives enough time between rail turn ON and UFS init
  sequence start.  However in issue case, it seems re-probe is happening too
  fast, which causes init sequence to fail and UFS brownouts (similar to camera
  sensor case)

- Also, we compared this board with other RBxx EVK boards for UFS rail, it
  seems that this board has more caps on the VCC regulator, as the board is
  designed to have both EMMC and UFS, and we have DT option to pick one of them.

  So for EMMC those extra caps were added and they are impacting rampup on VCC.

Since this is not entirely a UFS part issue, but a board design constraint, it
seems better if we handle this in the regulator side itself, as adding it in the
UFS driver may not be acceptable from UFS reviewers.

Please share your opinion, if this seems to be good reason to accept this patch?

Regards,
Kamal



