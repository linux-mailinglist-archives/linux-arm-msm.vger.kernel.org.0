Return-Path: <linux-arm-msm+bounces-78548-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 10A86C00876
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 12:37:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id DDE615041F5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 10:35:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7990F3074B1;
	Thu, 23 Oct 2025 10:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y5R5Zixn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A864230BF5D
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 10:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761215698; cv=none; b=c4BFTugSgCHB79XVQ/FKEHeEIpxjYSJHO2s6Yacmv9rwPfgA0gHQglIIJltqf3rbSNn08ktZRor6yx1iO9DZk6La4I2R3KZqvvNTqbmESNuj53jkVfMQ8q+Or5oQ1TQ+IOPyiUWI7q0D6L4PJVB+3RWXUJKSeeIbWTioHx50O60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761215698; c=relaxed/simple;
	bh=s6m32btQq5Nec6+zqQXh1gsBw5LxBYImgxIYHSV8yOU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mczSqWjZTXFPMq2Gwh6hDanYFMGj+j8cjXBT6pATd0Feg18OQPcfGzhoFQH9EiDG9kRh/rzCkpJY80uQuI8BF1BCZh/+zImnyNVybG5OeCz0ZfHuK3ywTmY1lnSZjiid6JZ/MBhWhWOVP/W/BtA17vahGPqcm4NTyXqNFM8CTUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y5R5Zixn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N6rG7o010394
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 10:34:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=VoIh0U5rWFRvf8asZ97I/ccs
	zrVP2zU7xtB7amxNOo8=; b=Y5R5Zixn71QkTZ4xnUVDUkHKtkB8KjYsgFuxr5bJ
	Rg+SspVc7EepdVqPCr7JCKbfAc//LN5uCq/XqYs/HyMG+hPE6JnSTnG2sDBilZwo
	ITdgwY3JYJz9wDCfHRS2h70/umY3JXDEl7OVBDf5WBMq5aG5DR2d5cO+x3xbKyqu
	eTHqoq6zII+M1uByFTJJJDbY+U+2RBYFuawqvCip1oqc7esv9W3wRIOK1BqCTttu
	JE1lOpekl+cX0nYMtI1vHUYixAVwsmpMppP7nhB1I8zDz1lReJ3F2HEHMzpn2a68
	XHcSQC6oQF5pa81y7HFGVZ9mEPI4sd94PV9aQZ4Bp12WjA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v344843b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 10:34:55 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7a27ab05999so215379b3a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 03:34:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761215695; x=1761820495;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VoIh0U5rWFRvf8asZ97I/ccszrVP2zU7xtB7amxNOo8=;
        b=AsvAClAkZ8RV2s7Cfua89mqqaREqokGPMmfISF0mkBOCX4Uud7bl/Kou52WkEMUpEB
         UhL6tT/44zZHq2QSieZpdHWOPLVbdXPi5X1ZSDvOS2pKY/GGcA38A9COFX/NedxKaVdu
         ACV+nb/d+sC3JjB+mP0BLiDCS8RYk25pG0NJeuizPb30yRKzwm7yXMvtCm74iAH9+37+
         rG2Nr7zKBTUnhA6RdIzPQMVm3yNNkjsrK8p1sK9LhFKW/Qy6TnxGhMV9yZDHNu4urCPB
         zA1jzqxXfVRovyyZgQDC4/C1IjOqQp40PKrerq57rCtun/4u+Z8RT5W2BcIgRTrxLTPV
         3HcA==
X-Forwarded-Encrypted: i=1; AJvYcCWEGITTSqvefbap0uS2R2XJ0PKAL/ImqHBKdFf+q4hdbbJ4bhlqMDveTxNQ/XZgzUia9pq99rcRzlLmkHLR@vger.kernel.org
X-Gm-Message-State: AOJu0YyKNW67yl4SByKK1ScQ6H8Cset8IrTma/EiKb9SUoSeacmvOYkU
	Xr2hH0z64Iy9qGpnlnGlINxCCE1W0gugdyIZi0fHfy/ea67aOrkkk9CparNK8PRIO95YECEwTZz
	TXEjbCz0vMbuChvZoqo8fklMn3dSqavilnhi0ARl4XU75VScZv4eBgMF5ZPbliqu7wwuE
X-Gm-Gg: ASbGnct9P1ZYM48Ibo3R//Kkf85eKS2yJ3KsDnSDZv27G5WDUIw9FIvD1vtoU8TaZd5
	suW2TpuS0kZ+5c4lXuf6mRCP26HP1Ju3pvLWNTeTtfkrzjJRQjoN/xY22uS9+nIXvbORlmN33w6
	Steq9ST4zJCGTbf+UzcU0HyuPaC0gp80hFFwRJPQOHmyVYw8Vu1SxYctjMnckJAgA0U/n9sWptC
	g7GXZo2VOV6Cvakg65ozKuzF0ya9DAxakds98Uow5CakWXzptAUcpiFelbB0ATZaMFGh0O26ayd
	sS/oiWRJFNYEeTUGhKOz0KTUO+x50qyHJ8meSU3HQ9jJoplYBFMBSVTy0JN3Uqr5/HivQZnJx1G
	RhHbBxGkctrPPJ1Rw7PI7XweelIjUTjKH3U6InhW7cLrSwcSeZ2JwgLnBxeQg
X-Received: by 2002:a05:6a20:7344:b0:309:48d8:cf0a with SMTP id adf61e73a8af0-334a8649ed5mr32785996637.54.1761215694808;
        Thu, 23 Oct 2025 03:34:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFWOBu17jg3/QWcZyY2ZYMO6Vj+q35f8jVO9OOAt2ZnpujVRNu9Uv94N4LPmWI0udppxiCUmw==
X-Received: by 2002:a05:6a20:7344:b0:309:48d8:cf0a with SMTP id adf61e73a8af0-334a8649ed5mr32785967637.54.1761215694321;
        Thu, 23 Oct 2025 03:34:54 -0700 (PDT)
Received: from hu-kamalw-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a274bb2fcasm2032529b3a.58.2025.10.23.03.34.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 03:34:53 -0700 (PDT)
Date: Thu, 23 Oct 2025 16:04:49 +0530
From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        David Collins <david.collins@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/4] Add support to read RPMH regulator settings
Message-ID: <20251023103449.vr6yccqua5gsgck4@hu-kamalw-hyd.qualcomm.com>
References: <20251022-add-rpmh-read-support-v2-0-5c7a8e4df601@oss.qualcomm.com>
 <eivl52lqeurk3bcklnoqjnnfqv3tgmkh4ehf6jchbnf3j44ads@oogqwpvkahhp>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eivl52lqeurk3bcklnoqjnnfqv3tgmkh4ehf6jchbnf3j44ads@oogqwpvkahhp>
X-Proofpoint-GUID: Fj362O9asA3m5jJ7PYRqqcb0P5Vo52MQ
X-Proofpoint-ORIG-GUID: Fj362O9asA3m5jJ7PYRqqcb0P5Vo52MQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyMyBTYWx0ZWRfX0/WcTKlfF7s/
 QgZr8htb5gT5c7yJVczctFJ1AOLpLoQID14juFvrUkm++rfEtz7K/lGIq4FeXSN+bWv5xBgNmpi
 6T5UvjPPCi1UrQGbvJJVk6KBbM+d0h5kIp0Hv8RZG5U3SdUvvJcszZiyQ/DLqHKXTiqUy24Fm69
 mkLyPtCIlr82qRxlR2HzgYxPPD7mIzmPgXhp5Y8EBmXPzK3PoXxGC7Xc7X12AJLtE7GB9Y0AwWP
 7o+hLmr6q0Tl1QyC4J5Vpshe3bXoePn5HzH3xbI5CVTRzm109nuTCgmMDC3irC4BDqPK2ExAwde
 twEish+Jmr0u99x0aUqU2csyCgndflbuZnS10OJjsHrCJ42W1IRLukjeJXV4Ls21u/8KE+j9Ken
 P2dTKG4aJNDHbTJr7SiO8PgSrzBYYQ==
X-Authority-Analysis: v=2.4 cv=E/vAZKdl c=1 sm=1 tr=0 ts=68fa04cf cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=vG2EPF1CwbHkBR8eMh8A:9 a=CjuIK1q_8ugA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180023

On Wed, Oct 22, 2025 at 04:02:00PM -0500, Bjorn Andersson wrote:
> On Wed, Oct 22, 2025 at 02:38:52AM +0530, Kamal Wadhwa wrote:
> > This patch series adds a new `rpmh_read()` API to allow reading RPMH
> > addresses. Also, using this new API, enhances the RPMH regulator driver
> > get_regulator* APIs like `get_regulator_sel()`, `get_mode()` and
> > `get_status()` to allow reading voltage/mode/enable setting from H/W.
> > 
> > This is needed because current design has a limitation - regulator
> > framework can only get the cached values from the last voltage set
> > operation. Because of this right after bootup a `get_voltage_sel()`
> > from regulator framework will return -ENOTRECOVERABLE error, causing
> > regulator framework to trigger an unnecessary `set_voltage_sel()` call
> > with the `min_uV` value specified in the regulator's device tree
> > settings, which can cause issues for consumers like the display and
> > UFS that require a consistent voltage setting from the bootloader
> > state until their drivers are probed.
> > 
> > With this change regulator framework will get the regulator voltage
> > and other settings, as configured during bootloader stage, avoiding
> > unnecessary voltage adjustments and maintaining consistent power
> > settings across the transition from bootloader to kernel.
> > 
> > Besides this feature this series also fixes:-
> > - An existing issue with the BOB5 pass code value. This is needed
> >   by `get_status()`.
> > - Code format/style related errors reported by checkpatch.pl.
> > 
> > Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> > ---
> > Changes in v2:
> > - Fixed the BOB bypass mode handling (existing issue in current driver).
> >   This was needed for `get_status()` implementation.
> > - Implemented `get_status()` callback.
> > - Callbacks for `is_enabled()` & `get_mode()` will now be used as-is
> >   ie. v1 changes reverted.
> > - Bootstapped the read values for `mode` and `status` in probe, based on
> >   comments recieved from reviewer. 
> > - Callback for `get_voltage_sel()` has been modified to handle cases
> >   where read voltage is out-of-range defined in the regulator DT settings,
> >   this is needed to ensure backward compatibilty. Regulator probes may
> >   fail otherwise for some older targets.
> > - This patch is rebased & tested on:
> >    https://lore.kernel.org/all/176070318151.57631.15443673679580823321.b4-ty@kernel.org/
> >   to avoid any merge issues.
> > - Fixed code style issues reported by checkpatch.pl script. 
> > - Link to v1: https://lore.kernel.org/r/20250623-add-rpmh-read-support-v1-0-ae583d260195@oss.qualcomm.com
> > 
> > ---
> > Kamal Wadhwa (3):
> >       regulator: rpmh-regulator: Fix PMIC5 BOB bypass mode handling
> >       regulator: qcom-rpmh: Add support to read regulator settings
> >       regulators: qcom-rpmh-regulator: Fix coding style issues
> 
> These three changes all changes the same one file, but you have 3
> different subject prefixes. This is just sloppy, please follow other
> changes to this one file.

sorry will take care of this in the next version.

> 
> > 
> > Maulik Shah (1):
> >       soc: qcom: rpmh: Add support to read back resource settings
> 
> I'd like to merge this through the soc tree, please put it first in the
> series to simplify this.

Ok will do that in next series.

> 
> Regards,
> Bjorn
> 
> > 
> >  drivers/regulator/qcom-rpmh-regulator.c | 184 +++++++++++++++++++++++++++++++-
> >  drivers/soc/qcom/rpmh-rsc.c             |  13 ++-
> >  drivers/soc/qcom/rpmh.c                 |  47 +++++++-
> >  include/soc/qcom/rpmh.h                 |   5 +
> >  include/soc/qcom/tcs.h                  |   2 +
> >  5 files changed, 241 insertions(+), 10 deletions(-)
> > ---
> > base-commit: fe45352cd106ae41b5ad3f0066c2e54dbb2dfd70
> > change-id: 20250623-add-rpmh-read-support-3288f83cc20a
> > 
> > Best regards,
> > -- 
> > Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> > 

