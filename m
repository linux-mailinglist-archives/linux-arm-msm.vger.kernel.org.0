Return-Path: <linux-arm-msm+bounces-115460-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yEwyJ5jQQ2qWjAoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115460-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 16:20:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id F1BA46E557C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 16:20:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=BXE8tHum;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115460-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115460-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D87AF313DC5B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 14:11:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F1EA3F788D;
	Tue, 30 Jun 2026 14:11:55 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 880AF3EA967;
	Tue, 30 Jun 2026 14:11:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782828715; cv=none; b=TAAQQ80oXhnGT4SG9Pf++ka4lZ25lBD4gnZT/9MBR+t5QagYX6pFPWD+RwNoN1g+3JpSY+xnaP8Sfe5+D8Wv09ZBzFy3DZfJ6q+T2ixdkEOewTThu7mF97PZlBdWH2vgHJ+tOSTSA/yol8mNuh7odAhlOvyrQKV4gQXtuPZll90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782828715; c=relaxed/simple;
	bh=TV0AxArBOZA8ansh81H9L+g8wsnC9CSJ+jzmnNdEdd4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dB9BbtsxghuUneNrP9OOqEHTbo4KyUfIwntfqzLXvfLp4vfY3Vr+2jHopRGreXXl3yRQTlimtDInA0ZkjSwC3RdpnjTJSwwrb4A8HI/kwceK7itTraial2IBPGbzadCZgOwg8J6RKSElb1HuqZ7xdd6MYwAfBRm5im/qmDENVaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BXE8tHum; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87A841F00A3D;
	Tue, 30 Jun 2026 14:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782828714;
	bh=OxqE8XJk8FpXsDtMnw9cJ871KeFT4FrIUhssgme+6e0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BXE8tHum8lYO6SVLVyqJR53OEaz6KofiZTIvzLwOsDIHQQ/2QSYsrJE7GEetrCWvh
	 icxEDfuPTdVAboppr9/DAic3tgkUDEKdxz8EW+m7X3e7p1eRgJ25Dmm7qxLwXZJJNY
	 9cTfqxhgQeUozwRz6hsXX512HGvZ/wZJKm9xDQICYBPN6HM5sZ64ajEvLa57gn6+Fx
	 2C7XwE+3z9Jixdk4352X+bNgCLs6MJk1hywdLVWacsJbbWBm5GLNS6Q+tDfUwYFax8
	 TV4oSZ7uRyMTc6Wa97+uCwQA74t4twWRhjVGFBPVD65yxeBodEigECGk9yrdAqfDns
	 mGvUr8KSX227g==
Date: Tue, 30 Jun 2026 16:11:43 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Cc: Saikiran <bjsaikiran@gmail.com>, broonie@kernel.org, 
	monish.chunara@oss.qualcomm.com, jishnu.prakash@oss.qualcomm.com, nitin.rawat@oss.qualcomm.com, 
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	lgirdwood@gmail.com, andersson@kernel.org, konradybcio@kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 0/2] regulator: qcom-rpmh: Add off-on-delay support
Message-ID: <ckcwlttxqqtvoyur2ura3ohexbtnpy27irqz6xubsd24ryij7o@2tp2l2smrc72>
References: <20260127190211.14312-1-bjsaikiran@gmail.com>
 <20260515111647.qg75thdvcbvvjpoi@hu-kamalw-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260515111647.qg75thdvcbvvjpoi@hu-kamalw-hyd.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:kamal.wadhwa@oss.qualcomm.com,m:bjsaikiran@gmail.com,m:broonie@kernel.org,m:monish.chunara@oss.qualcomm.com,m:jishnu.prakash@oss.qualcomm.com,m:nitin.rawat@oss.qualcomm.com,m:bjorn.andersson@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:lgirdwood@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-115460-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,oss.qualcomm.com,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,2tp2l2smrc72:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F1BA46E557C

On Fri, May 15, 2026 at 04:46:47PM +0530, Kamal Wadhwa wrote:
> On Wed, Jan 28, 2026 at 12:32:09AM +0530, Saikiran wrote:
> > This series adds support for the standard `regulator-off-on-delay-us`
> > property to the Qualcomm RPMh regulator driver and updates the
> > corresponding Device Tree bindings.
> > 
> > Motivation:
> > On the Lenovo Yoga Slim 7x (Snapdragon X Elite), the camera regulators
> > (LDO1, LDO3, LDO7) have large bulk capacitors and rely on passive discharge.
> > When these regulators are disabled, the voltage decays very slowly. If
> > re-enabled too quickly, the sensor experiences a brownout and fails to
> > initialize.
> > 
> > Verification:
> > I verified that the core `drivers/regulator/of_regulator.c` does not
> > currently parse `regulator-off-on-delay-us` in `of_get_regulation_constraints()`.
> > Therefore, the driver must parse this property explicitly and populate
> > `rdesc->off_on_delay` so the regulator core can enforce the constraint.
> > 
> > Changes in v3:
> > - Added Patch 1/2: Update DT bindings to allow `regulator-off-on-delay-us`
> >   for `qcom,rpmh-regulator` (Requested by Mark Brown).
> > - Updated Patch 2/2: Refined commit message to explicitly mention the
> >   passive discharge and bulk capacitor mechanism on the Yoga Slim 7x
> >   (Requested by Mark Brown).
> > 
> > Changes in v2:
> > - Moved the motivation/context from the cover letter into the commit
> >   message of the driver patch.
> > 
> > Saikiran (2):
> >   dt-bindings: regulator: qcom,rpmh: Allow regulator-off-on-delay-us
> >   regulator: qcom-rpmh: Add support for regulator-off-on-delay-us
> 
> Hi Mark, Bjorn, Konrad and all,
> 
> We have another UFS issue on QCS8300 RB4 EVK, where it seems this patch is
> helping.
> 
> Issue is seen 2/10 reboots and it happens in the UFS probe defer path:
> 
> 1. UFS probe takes regulator handle for VCC(vreg_l8a) of UFS host controller.
> 2. UFS probe enables the regulator
> 3. UFS probe defers (due to some other dependency un-related to regulator)
> 4. UFS regulator disabled on probe exit
> 5. UFS re-attempts probe and re-enables the regulator
> 6. UFS init sequence runs -> UFS NOP OUT command failed (no shell) 
> 
> Issue Log:
> 
> [    6.583836] ufshcd-qcom 1d84000.ufs: ufshcd_verify_dev_init: NOP OUT failed -11
> [    6.592780] ufshcd-qcom 1d84000.ufs: ufshcd_async_scan failed: -11
> 
> NOTE
> - Issue is not seen in first probe attempt, because UFS regulators are left ON
>   from bootloader, which gives enough time between rail turn ON and UFS init
>   sequence start.  However in issue case, it seems re-probe is happening too
>   fast, which causes init sequence to fail and UFS brownouts (similar to camera
>   sensor case)
> 
> - Also, we compared this board with other RBxx EVK boards for UFS rail, it
>   seems that this board has more caps on the VCC regulator, as the board is
>   designed to have both EMMC and UFS, and we have DT option to pick one of them.
> 
>   So for EMMC those extra caps were added and they are impacting rampup on VCC.
> 
> Since this is not entirely a UFS part issue, but a board design constraint, it
> seems better if we handle this in the regulator side itself, as adding it in the
> UFS driver may not be acceptable from UFS reviewers.
> 

Ofc. UFS driver shouldn't deal with this board specific regulator constraint.
Please work on addressing Rob's concern to take this series forward.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

