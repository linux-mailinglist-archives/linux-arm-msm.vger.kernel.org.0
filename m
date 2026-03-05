Return-Path: <linux-arm-msm+bounces-95496-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oER7LMoLqWnC0gAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95496-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 05:51:22 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E7E20AE85
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 05:51:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DF762301C5B5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2026 04:51:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CDF1201278;
	Thu,  5 Mar 2026 04:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mYaAOiMy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VKX7aXSn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1794821C9EA
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Mar 2026 04:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772686276; cv=none; b=ZIegfsfR5AjP8sSHlOtg3lvBmEtpKGvUiD2VPQhxlcYzcpEH3EDN6SkyXS2arreNUIsxlkqQcqWADS76w6oDIeJxhzM4tUb5MezBKtSmIgVhx6YLhj4MKxgTTEVfJCjacHGTWgcqNxGqCXvq7vtFA/L070PDIBE5AiBhq+TBo+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772686276; c=relaxed/simple;
	bh=lC6xgaiOwQj6TfG378aZcT2Fi4PK+up7AoQ+IBJS2b4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JGg4LGxcY81e7yWUt9pEb3hDTlROmdy4EtC1OXlhejZJWsjenkooJ863KuaBE6TeHnBs9ilKFypbYFXTTZhUJuEVLozASUbnMsiGlOpNVKdx+6oIfpw7GW++Pbx7CiXS6xnQXbd1kWbcXBPZ/0Re2ipqCEtp8Y+YdIWETMr/E9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mYaAOiMy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VKX7aXSn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6251Bo7o629141
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Mar 2026 04:51:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=eAsYQf/kQIuuyY8oT9SBZkDL
	BFT+VRhF/FgCIKJaAZs=; b=mYaAOiMyH89MgnqcoNYe5kIG73nPHOmZ3hc/4Lq0
	XQD7yGuzFMAiCFYPPNDnQ0o1m+C56TrL9y6hmeeWTz/8fxVacZY67DuxA3uUNHWl
	5ajeMuD7aiH+eCdrgfUt3yLK/M2hEIbDqJXOTN8k3QVkUzi9N31V0zlCo681oU4N
	XQuVu5KFDguWs4xKgydz7dsE/fxBVZFh7ndJKLyl9GnsoGgzCE414i32pI7qD0H3
	G2pIK5NcXyIO0wRFChGkucV4vHFIW2sRH5QS1U9NVgfQV+3G4gFoq5r1PeB1osIl
	JtIuzTQKovYqdPw+1M0r/YqpqRsgWwGRYSpN6o8opXazMg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cps0m1swy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 04:51:14 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb42f56c4aso4819890885a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 20:51:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772686272; x=1773291072; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eAsYQf/kQIuuyY8oT9SBZkDLBFT+VRhF/FgCIKJaAZs=;
        b=VKX7aXSn6Q7JF4Yt91xJc5gDosioO/+f5H82+CmvdQanxT0PvPMrRxDY4f/pZi25u3
         sc7RhalNvbUaSxtoHcNqdKKHY9fOpA7vwnhTC76OO6S9J0/F7GogXsUspYMMhieUvezR
         Cr6x3/3+gbLwmBGziLSoDyG7boBPo9UEF3MKt4yX6t1o1gePW5+7pY8s+squGBuYPoIF
         8koL10sxGgnOqKwP6SaQkbMXFkD5IdgXYBTCKipTJJpFSKcN2Dfd/In9L583cH1Kph6C
         RdsXszUTMcRxmWHks87aBwdWsh2aPQVfCE/SSaWNB3Vq8O0EHjggLJMzUNGtfCkd+qCT
         kVJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772686272; x=1773291072;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eAsYQf/kQIuuyY8oT9SBZkDLBFT+VRhF/FgCIKJaAZs=;
        b=Mbdd9gagUPBcX20puJHFfgmUzwg+KMsF2zpJ5AOPAPT1he2sbTJymmYB4tHMAkNtUc
         5UVMsnRqK5f5DpqSddt6lsZeZbWVoEjEFcWuT9zFGbRe+eS35zDcLX3XPyJ8clO8Gqck
         +UJTiJcB1oT9hfourd3OnMbb/kW+4eOemDFlszS33qpNvVIJqtwISfOQrE4iIuA3Yu/E
         hYZfRFRmaqQ/BPFgYszx+FDVVD1Ku6nZ2uogXm6ZAclQEk0rLPkDgRB4Xje5jWFZIteF
         nQyn19JZAa+sVdZ+Pb/oAm/3Xq4vbwVJqjlOYLdH1jaRqsv3sohSlMBPio9ex3FV9KW6
         dkXQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4N4+E83rx8nwCLGYjDxtn3rNnjx0lHVixkq0S9JWthOL7ORFHM/iE+p2UDyzUiXktmIuhURZABSPYRHNi@vger.kernel.org
X-Gm-Message-State: AOJu0Yxj15Dc6+4mgvkMZir1S1NpITXPKyAefLCvXvm2K1vodahDQZeD
	CfwWye+lt3bmeM5l3iIqySern/uIbwrAl1YBl0akAQtMTsnaGbPzgE8GkPgXkOnzjJqa+4pCrtZ
	ggrTDNIWSs/hHThFEyKx1rcf7fkMhxFPvorgcQsDp3Qb1/crXodIth7LAhQZoHfnXC0R5
X-Gm-Gg: ATEYQzz5UHDvN+GDMUZaMFrogmdSW2zq6M4JmVg9+ZJxt3KPH4M3PW9Xd61QLxDCDks
	U+cQu7FwsZmkyHCfz/+dbnVubhSEF9sgZpIZ965cB641lPruMj/SlOlpcnh2mEZxhfJWqWQ4quy
	MCOt0flfg0NR8J9o152MIwNOCox31JDDcITNlvgH9TerEL47xZ3wNdENf11UmaHAycaXEUVmQmm
	yNSavJNKzJNs8UE+/NjvBe465HQfx2gE3i1QD7aigVTDDVS5J3DhFonsXramfegWMeotm+NLtan
	Ikw+T3rk8ggA+50Mw7idgeNw5j59Z4JdKDFaGsVSqKuI6vH6/fLeiDTokbxG6PwB0C539YX8KuI
	11jg04OqwUpxGUdvcBdmwC6lPds6NS9wgX3HecShYUD4B8nmaijy+ZDShuUKC5J2YaC5fwwsu0W
	Qz/nsBrde5tWrjcX/WeUc5fkO9tY1rqoF6LAw=
X-Received: by 2002:a05:620a:31a4:b0:8c7:1afc:c694 with SMTP id af79cd13be357-8cd5af803f8mr556176685a.47.1772686272365;
        Wed, 04 Mar 2026 20:51:12 -0800 (PST)
X-Received: by 2002:a05:620a:31a4:b0:8c7:1afc:c694 with SMTP id af79cd13be357-8cd5af803f8mr556174185a.47.1772686271902;
        Wed, 04 Mar 2026 20:51:11 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a12ef66371sm499780e87.62.2026.03.04.20.51.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 20:51:10 -0800 (PST)
Date: Thu, 5 Mar 2026 06:51:09 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Monish Chunara <monish.chunara@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, mani@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sarthak.garg@oss.qualcomm.com,
        pradeep.pragallapati@oss.qualcomm.com, nitin.rawat@oss.qualcomm.com
Subject: Re: [PATCH 0/3] arm64: dts: qcom: monaco: Enable SDHCI storage
 support
Message-ID: <4gg2xq7mdx7bni2acicavtq3ogwupe4ok6tehh7rmjarldwb3x@j3cgohnd764i>
References: <20260227105055.2364348-1-monish.chunara@oss.qualcomm.com>
 <ltuoonopd2fmxhxnfmezflwqicyagha3jchxl3inputbtnpvhm@gsgnsccr62pk>
 <aaWgo/FYDhCVvaX/@hu-mchunara-hyd.qualcomm.com>
 <3insznroqfkpgdspe4wj3nrxgp4igeoyawr5udscpfi66m4kmc@brssmf6olu6g>
 <aaWnIrIMDgXAY7jo@hu-mchunara-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aaWnIrIMDgXAY7jo@hu-mchunara-hyd.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=e6wLiKp/ c=1 sm=1 tr=0 ts=69a90bc2 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=OJeWzqPOIPmk0VHQ4RsA:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: b-KtqGNmJXJnyWhHP1ZAX388iijqcnUm
X-Proofpoint-GUID: b-KtqGNmJXJnyWhHP1ZAX388iijqcnUm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDAzMyBTYWx0ZWRfX4yKd5LgRuc8/
 Yjm0fi0WhzGADxwKVz6ArHt6+KIus2rzyjST0d4S3lvfs0JPLqLtpfkN8ki5uO5qU0JSEj0nrr3
 Wd/LMq8Gi/EHvPM2M7LBsgmgPWwPA65pQI0IVzQ89aIw8tYrqAfaIinf8EeJdexyZqRPCY5nm2V
 OveR9oSupCZnnQY9uhf5kGDIX927MObAotOQG+m1yzrrXrFBEzJQiFrsvfr+pGyOK6rtm9Hv68c
 Uwnh/Y2/gKPP5VFtAMMrrNwYSEoTnu+eNMWNHnmfrngLmrxBQJlJ9MD4LoeV2RtE5eRyusJq3dy
 gQbs/r9wtxmSKdnucgl/ldma/6ssIEQI+ULfASUMnRB/uX6q1mj42HpCXDnE8T2CmRDzGZ+iPHV
 ArMMdfF9RP14QeO2gqQGHd1/PC5Gu6fo2+inPipAr3bpkl5OrPZg67g6PvwpFwoEFIq5yXRZvnb
 7e2QNXFACvS+og88UHA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_09,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015
 spamscore=0 adultscore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050033
X-Rspamd-Queue-Id: E8E7E20AE85
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95496-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Mon, Mar 02, 2026 at 08:35:06PM +0530, Monish Chunara wrote:
> On Mon, Mar 02, 2026 at 04:47:41PM +0200, Dmitry Baryshkov wrote:
> > On Mon, Mar 02, 2026 at 08:07:23PM +0530, Monish Chunara wrote:
> > > On Fri, Feb 27, 2026 at 10:05:32PM +0200, Dmitry Baryshkov wrote:
> > > > On Fri, Feb 27, 2026 at 04:20:52PM +0530, Monish Chunara wrote:
> > > > > This series enables SDHCI storage support for both SD Card and eMMC on the
> > > > > Qualcomm Monaco EVK platform.
> > > > > 
> > > > > The Monaco SoC shares the SDHCI controller between SD Card and eMMC use
> > > > > cases. Previously, the common SoC dtsi unconditionally enabled the
> > > > > 'supports-cqe' property. This causes regression for SD cards, resulting
> > > > > in timeouts and initialization failures during the probe sequence, as
> > > > > the driver attempts to enable Command Queueing (CQE) logic incompatible
> > > > > with the SD protocol.
> > > > > 
> > > > > To resolve this and enable full storage support, this series:
> > > > > 
> > > > > 1. Moves the 'supports-cqe' property out of the common SoC dtsi. It is
> > > > >    now only enabled in the specific eMMC configuration where it is
> > > > >    supported.
> > > > > 2. Adds a device tree overlay to enable SD Card support (SDR/DDR modes).
> > > > > 3. Adds a device tree overlay to enable eMMC support. This configuration
> > > > >    also explicitly disables the UFS controller to prevent power leakage,
> > > > >    as the VCC regulator is shared between the UFS and eMMC rails on this
> > > > >    platform.
> > > > > 
> > > > > Validated on Qualcomm Monaco EVK with both SD Card and eMMC modules.
> > > > > 
> > > > > Monish Chunara (3):
> > > > >   arm64: dts: qcom: monaco: Move eMMC CQE support from SoC to board DT
> > > > >   arm64: dts: qcom: monaco-evk: Enable SDHCI for SD Card via overlay
> > > > >   arm64: dts: qcom: monaco-evk: Add SDHCI support for eMMC via overlay
> > > > 
> > > > You are adding two overlays. But what does it mean? Does EVK has no uSD
> > > > / eMMC at all, having both attachable via some kind of mezzanine? Is one
> > > > of them attachable? Or are both cases present onboard with the correct
> > > > one being selected by the DIP switch?
> > > > 
> > > 
> > > The monaco EVK has both storage devices present onboard and the desired one is
> > > selected via a DIP switch. The overlay selection logic would be based on a
> > > fitImage metadata entry that gets populated at UEFI level by determining the
> > > currently selected storage device (eMMC/SD) on the device.
> > > 
> > > Hence, this approach becomes robust to enable the user for using either of the
> > > two mediums, without any additional requirement of reflashing any images.
> > 
> > You are answering a different question :-)
> > 
> > Let me formulate my question as a review comment:
> > - identify the default DIP switch position
> > - squash corresponding dtso into the dts
> > - leave only the default dts and non-default dtso to be applied by UEFI
> >   if necessary.
> > 
> 
> Thanks for clarifying. 
> 
> Default switch position is on eMMC on Monaco EVK. But as mentioned in the other
> thread, there are a few boolean (flag) properties like 'no-sd', that conflicts
> with SD card use case and cannot be deleted in an overlay file as
> /delete-property/ cannot be used. Also cd-gpio and regulators used for SD card
> would be redundant for eMMC.
> 
> And similarly 'no-mmc' added by default would be inappropriate for eMMC. This
> being the reason, two separate overlays were added.

This only means one thing to me: UEFI mechanism needs to be changed from
applying the dtso into directly modifying the FDT in the DT_FIXUP protocol.

There are three options which needs to be removed this way:
- supported-cqe
- non-removable
- no-sd

> 
> Regards,
> Monish

-- 
With best wishes
Dmitry

