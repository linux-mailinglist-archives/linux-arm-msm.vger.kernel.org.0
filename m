Return-Path: <linux-arm-msm+bounces-94975-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mJAgGzmppWmpDgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94975-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 16:14:01 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 755B91DB96B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 16:14:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A80BF305F497
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 15:05:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73981410D3F;
	Mon,  2 Mar 2026 15:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EuqwgZjG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CYlyMCJ7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CB48411625
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Mar 2026 15:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772463918; cv=none; b=MnPd/lMwxEJqYBP6tS60RGIVNifbbalg0iM7HrJq8tFBUEgQxzHEhw+T4IHTxNyyOiFUgLF31SeUECs6iTxHOCc5vGgBEEsvA1fABwkihQDZxy7G2AwWT5U3nTv23cfkEvYEifF4ixavHOx8+XLYqA5u2beQdvt7VmMKWtdTaR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772463918; c=relaxed/simple;
	bh=f/zRpwRvcSPxPIVtLAeJTvEgGlEfU/E9fwUupa/pGtk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WQx4ReFbA8pGT4PRmk7g3TWbJrUnUN98m/fUElda7wx0jNPCVjagVPvShh0FPHR7NWgsyMHbeV+brw2d+wpGmPWnICbMV8xk0myJIGG34jhT3ynZdebC3uWnX4SKsStEyQIWxO0omYZ3xTm+uZEKm86/OJAheNRVSBicdVuGEDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EuqwgZjG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CYlyMCJ7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 622B3lit3863256
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Mar 2026 15:05:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=D+Aknj82moTPuX8FsjTJUilr
	W2ttQjOLx9p2oQ6P6UY=; b=EuqwgZjGa83FW5Tf0uxbfGEv/U9IMlbvinoYq/He
	u11AYxxSiGQ4Piuu+4UfRAQVpVEdB2IhOKUXEFV3xPr36RYheoRF+VdQhFDC+zAE
	5SE3Kn5hQd/EP8u9/1/kg4dBKJMRblRWReGMUgAhDNY2FfxFH1UVyqiPZ3yLDnXF
	WudZmODuu3P4myjOvlmFVs7RA0uYSsAyuCybi8nGPkvkRM0daODBRwVsPO4Hp0FT
	JTdPkWcPNKgpSP7BgPVaEzoc+9kQ5+CWMCiBwIk1l2prk5nVmXyQBS1oeKBovo60
	P9Fz7xoee4V3JM5EGjYoQqmapohV//DFulOLOE44BSWNeA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn9bjgq8y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 15:05:15 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-824b2f0d404so15388952b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 07:05:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772463915; x=1773068715; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=D+Aknj82moTPuX8FsjTJUilrW2ttQjOLx9p2oQ6P6UY=;
        b=CYlyMCJ7nmkYrYBufaPciG47CuJaUl9aa/wPqrCHhfgOZ2ICyG5l54iQ4Ys2IbwxaW
         +Ze3NKJfTwzQ4RhccHdWQy12wv5ekKOj+tV4APUZ02H4M1wAIRw4wtIMwnG/ETVhJb0r
         BT8PtvJfFMX7EUJulAnYzGDet0AOHo3PjMqlsdaUGOSbmOOq39b9xP/LjukUO43VFf1A
         DB4SZiIjYf5mDqD6g14datGMuW8MnPlpJEtRe0viCMRrhRIilVYMrCVvQu/cxl7NEXJb
         xn/fTQYq4OxusgH0Z09PcqcjoavDJeRSBwkbmRQa7wlXohr8QitcVnAoHcIRZp5MIyej
         /PDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772463915; x=1773068715;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D+Aknj82moTPuX8FsjTJUilrW2ttQjOLx9p2oQ6P6UY=;
        b=lQFeeuuI+itk0WsZDq9e8wrmPJtJmcw5AUeuvBe+A9DMu64m8fzulyOqltzuqJxgDy
         G9/Xz6K8hTptf2fwBRRo8dSjMjxszvtAfnENNBbUKh7cogK8b8qs7GF4+lr3C9bAMGon
         pqrbT0JE8yj1Ppstwlblqmu8kpic5JlNo5GFxPNh6CcVt7exoIUCbo7DUIDcd/w4bmIb
         R4FAUQko920kFUhOMrZeY0nO0P2bP5XbGuFJrh8gBGAgv340LrtUpnmHXi817J2iVJ7p
         VVL/uIxuwmIcI7K+GQpFkdPNN0EUmfi2cOR5WmkN7YlaSFGKCTuAEuF002/GABSmZ+EC
         pq0A==
X-Forwarded-Encrypted: i=1; AJvYcCUvpo0hQEvknVu5bK8OAUEoTsiekicIV6c29NPldgPtORC9u3CvCYH0ZSNGVf3MpiBZv1ctJTAsiYLHUVDj@vger.kernel.org
X-Gm-Message-State: AOJu0YyVImtI3+Y6djQBuVgNOr17dIZLvnm9pljLdSSV+SB2rNRaPDtn
	vmAlOmOSAmMFAf/D7R6dNWpTNP5Tfx+cANm+XE8N+dzP7NhB7dS5kJykkriTNC1B/H4rpDTE6LC
	zdkrXTKHckleo8mu2o1NOsKpB7g6/P6Y7AoGHUPcwORU4W+lu05/UlFcSQwxyie0DngLm
X-Gm-Gg: ATEYQzxon2NDxA2ISMLShUJML6V6HYJ2VpQV76rALseyt1HH60pxYqXKJHXc+WnZfG4
	qS7Kgd/URNLXXZXZUTCSq2V3hxPulxF9dpmXnWza4zhC0/Om6G4d20L3aHop3HPwl/OmVlZ6rJc
	tCF1vUHEGeKrDxcE3mlQsIzuHIu6ArUOe97oZlPj+ygv0azMDUp4C+scST3273LQMWJ56ESXWFo
	iScj0LrpZb+SxEoLL0Dex/UezmnXO89oY/0BoFmfuPPY+NqWE2jhZF+ng4l60Rc3WRcVZrDwu8O
	SIBRyWNmuexzCF2lA9JuLcTuP0vWqWTlfzXa4cYOxWHPPuuzGqIgZM3OUfzPX1NRLs8yfU1BwoV
	/w7nuwo8osEyZ56Hi0dNrdizQ0ZzmzEuQqXdKsMuUw7rludRwT6Dw8nZQ
X-Received: by 2002:a05:6a00:9086:b0:81f:4ce8:d641 with SMTP id d2e1a72fcca58-8274d9d9b91mr13793382b3a.37.1772463914642;
        Mon, 02 Mar 2026 07:05:14 -0800 (PST)
X-Received: by 2002:a05:6a00:9086:b0:81f:4ce8:d641 with SMTP id d2e1a72fcca58-8274d9d9b91mr13793304b3a.37.1772463913407;
        Mon, 02 Mar 2026 07:05:13 -0800 (PST)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82739d8805esm14087128b3a.16.2026.03.02.07.05.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 07:05:12 -0800 (PST)
Date: Mon, 2 Mar 2026 20:35:06 +0530
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, mani@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sarthak.garg@oss.qualcomm.com,
        pradeep.pragallapati@oss.qualcomm.com, nitin.rawat@oss.qualcomm.com
Subject: Re: [PATCH 0/3] arm64: dts: qcom: monaco: Enable SDHCI storage
 support
Message-ID: <aaWnIrIMDgXAY7jo@hu-mchunara-hyd.qualcomm.com>
References: <20260227105055.2364348-1-monish.chunara@oss.qualcomm.com>
 <ltuoonopd2fmxhxnfmezflwqicyagha3jchxl3inputbtnpvhm@gsgnsccr62pk>
 <aaWgo/FYDhCVvaX/@hu-mchunara-hyd.qualcomm.com>
 <3insznroqfkpgdspe4wj3nrxgp4igeoyawr5udscpfi66m4kmc@brssmf6olu6g>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3insznroqfkpgdspe4wj3nrxgp4igeoyawr5udscpfi66m4kmc@brssmf6olu6g>
X-Authority-Analysis: v=2.4 cv=Pe7yRyhd c=1 sm=1 tr=0 ts=69a5a72b cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=7VzX_CqY3rlGch63vwIA:9 a=CjuIK1q_8ugA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: 9syuZM-mU9DY0pYZDOjwWgl_KIsyRuAs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDEyNiBTYWx0ZWRfX/cBRBYR37HYQ
 rzXJX7nbEDaJvnhrwJxr2skAzLYsxHB/2vsbhnc2x9OGuw9oduS8khoPAegIVVxqeZxWMSuUhmK
 n0/ZKYVmLNuef01AdfYDFXvlS/BHLoAvCwD4shylks0YS3jGdQBU1Jh9nW3w23Hgwha+hwcUNYB
 /j1o6K11TbQTWU8IjACOkmCpR+lMC0o3qgy+JAgGjtR3XFq/3I0IFlbM9ztizqM/u+J0m2oOv3a
 nNS5qA+MdcgV0HqHq2F8ssBjaJtgvRyyaW7QrwM675Enaj+1N4aWZN0xSnsFGIAW+weddxnFaby
 CgYWIdwo7CsG7PDBbGYfAUZQg5POEZASP8Qh4Zp0mgyv7wqef/tYEpagt92ooW1FQMRpA+aGOcp
 S8DYBQRKGsVinBNsFY+gSA8fDJZ471TCFC3bA+qi4J5m/v0aj/isMOf1zGY13C1z1+YT3aL4VZW
 Wwly3p8dWKQITEVCrZw==
X-Proofpoint-GUID: 9syuZM-mU9DY0pYZDOjwWgl_KIsyRuAs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-03-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020126
X-Rspamd-Queue-Id: 755B91DB96B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-94975-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:dkim,hu-mchunara-hyd.qualcomm.com:mid,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[monish.chunara@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Mon, Mar 02, 2026 at 04:47:41PM +0200, Dmitry Baryshkov wrote:
> On Mon, Mar 02, 2026 at 08:07:23PM +0530, Monish Chunara wrote:
> > On Fri, Feb 27, 2026 at 10:05:32PM +0200, Dmitry Baryshkov wrote:
> > > On Fri, Feb 27, 2026 at 04:20:52PM +0530, Monish Chunara wrote:
> > > > This series enables SDHCI storage support for both SD Card and eMMC on the
> > > > Qualcomm Monaco EVK platform.
> > > > 
> > > > The Monaco SoC shares the SDHCI controller between SD Card and eMMC use
> > > > cases. Previously, the common SoC dtsi unconditionally enabled the
> > > > 'supports-cqe' property. This causes regression for SD cards, resulting
> > > > in timeouts and initialization failures during the probe sequence, as
> > > > the driver attempts to enable Command Queueing (CQE) logic incompatible
> > > > with the SD protocol.
> > > > 
> > > > To resolve this and enable full storage support, this series:
> > > > 
> > > > 1. Moves the 'supports-cqe' property out of the common SoC dtsi. It is
> > > >    now only enabled in the specific eMMC configuration where it is
> > > >    supported.
> > > > 2. Adds a device tree overlay to enable SD Card support (SDR/DDR modes).
> > > > 3. Adds a device tree overlay to enable eMMC support. This configuration
> > > >    also explicitly disables the UFS controller to prevent power leakage,
> > > >    as the VCC regulator is shared between the UFS and eMMC rails on this
> > > >    platform.
> > > > 
> > > > Validated on Qualcomm Monaco EVK with both SD Card and eMMC modules.
> > > > 
> > > > Monish Chunara (3):
> > > >   arm64: dts: qcom: monaco: Move eMMC CQE support from SoC to board DT
> > > >   arm64: dts: qcom: monaco-evk: Enable SDHCI for SD Card via overlay
> > > >   arm64: dts: qcom: monaco-evk: Add SDHCI support for eMMC via overlay
> > > 
> > > You are adding two overlays. But what does it mean? Does EVK has no uSD
> > > / eMMC at all, having both attachable via some kind of mezzanine? Is one
> > > of them attachable? Or are both cases present onboard with the correct
> > > one being selected by the DIP switch?
> > > 
> > 
> > The monaco EVK has both storage devices present onboard and the desired one is
> > selected via a DIP switch. The overlay selection logic would be based on a
> > fitImage metadata entry that gets populated at UEFI level by determining the
> > currently selected storage device (eMMC/SD) on the device.
> > 
> > Hence, this approach becomes robust to enable the user for using either of the
> > two mediums, without any additional requirement of reflashing any images.
> 
> You are answering a different question :-)
> 
> Let me formulate my question as a review comment:
> - identify the default DIP switch position
> - squash corresponding dtso into the dts
> - leave only the default dts and non-default dtso to be applied by UEFI
>   if necessary.
> 

Thanks for clarifying. 

Default switch position is on eMMC on Monaco EVK. But as mentioned in the other
thread, there are a few boolean (flag) properties like 'no-sd', that conflicts
with SD card use case and cannot be deleted in an overlay file as
/delete-property/ cannot be used. Also cd-gpio and regulators used for SD card
would be redundant for eMMC.

And similarly 'no-mmc' added by default would be inappropriate for eMMC. This
being the reason, two separate overlays were added.

Regards,
Monish

