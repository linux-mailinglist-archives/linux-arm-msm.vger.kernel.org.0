Return-Path: <linux-arm-msm+bounces-104153-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6BgLCLfz6Gl3SAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104153-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 18:13:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D8D1448555
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 18:13:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A61B03038AFD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 16:12:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3921B3603E0;
	Wed, 22 Apr 2026 16:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bHISloUa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13A362FF65F;
	Wed, 22 Apr 2026 16:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776874343; cv=none; b=gBAwt7K1WREXjayTUhEjdzl3hnpA2Hgk05R7FqFB3qQVEHjPu4r6VKzA0Lz6wGI9yWNCkr9QSYbgCeHMak+97dVOEOscw+bvkrsiq+pNnATfNOG65Rmntu/VzgZ60x4bi5W9h/koLA9xFO+w/WPVZy/1VLzY1LYx0b1ke1y/Li0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776874343; c=relaxed/simple;
	bh=TZYnqAuMQONfQUBkdrhbVRyOzRizyFfMXehRIG2dacE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qoh0s+9GklN27OKW5F0NmdDuaRZ8XUjG/uY/n6ESGEpRd3zGrjimsAINzR/c+hTadgV2jscreSTWeScGQFzVZMH+xGiiMW0SI2tsEKqtpxUu1qc8aiNlRTNF0G+sjQZXrJ60RSKMBcMZPRLGl3+uV6BYvxE9xGW3a/0sWnHLuFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bHISloUa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16D35C19425;
	Wed, 22 Apr 2026 16:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776874342;
	bh=TZYnqAuMQONfQUBkdrhbVRyOzRizyFfMXehRIG2dacE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bHISloUaOKkygHwIfZtXscLkyPdmAh0VN3l1QPbaSyFqGw7us5/59cj5RtmCrrFGJ
	 euoTFhJFPrWzjiCF3liYm7ukPi+HI6OItEhG2YuKQHV8KKrztfqmVHsQ0jNg+c5+iI
	 BNknI8fWtyki2mokKx2rUmKiZZf+WoH6rh5AHQ44IAMpj5I0VuHivEqcZNNDFPPbfI
	 BEKMwE2dEwCGvpROsyxl+1v8lz4pB347wiZDY9JTdlzblq37zsIGiNW9Uvb2QhvJNv
	 tucodMbOjOGqiracGxI9GGFjRxdovBrh1zoI7lnXYhVxPd0cnNRTCzl9GW+ndtdBAX
	 KEwyt9slDBWTA==
Date: Wed, 22 Apr 2026 21:42:11 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: palash.kambar@oss.qualcomm.com
Cc: James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com, 
	linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	shawn.lin@rock-chips.com, bvanassche@acm.org, nitin.rawat@oss.qualcomm.com
Subject: Re: [PATCH V5 0/2] Add post change sequence for link start notify
Message-ID: <anieqjzuel6lnrjfkckalb5p7u43d73tttapif5nwkjor57bnt@k7wzwkln4bmt>
References: <20260422114939.2901925-1-palash.kambar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260422114939.2901925-1-palash.kambar@oss.qualcomm.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104153-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MAILSPIKE_FAIL(0.00)[172.234.253.10:query timed out];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7D8D1448555
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 22, 2026 at 05:19:37PM +0530, palash.kambar@oss.qualcomm.com wrote:
> From: Palash Kambar <palash.kambar@oss.qualcomm.com>
> 
> This patch series introduces two updates to the UFS subsystem aimed at
> improving link stability and power efficiency on platforms using the
> Qualcomm UFS host controller.
> 
> During link startup, the number of connected TX/RX lanes discovered may be
> fewer than the lanes specified in the device tree. The current UFS core
> driver configures all DT-defined lanes unconditionally, which can lead to
> mismatches during power mode changes. Patch 1/2 ensures to fail on this.
> 
> Additionally, certain Qualcomm platforms support Auto Hibern8 (AH8), where
> the UFS controller autonomously de-asserts clk_req signals to the GCC
> during Hibern8 state. Enabling this mechanism allows the clock controller
> to gate unused clocks, providing meaningful power savings. Patch 2/2 adds
> support for enabling this feature as recommended by the Hardware
> Programming Guidelines.
> 
> ---
> changes from V1
> 1) Addressed Shawn Lin's comments to fix comment to connected lanes.
> 2) Addressed Bart's comments to remove warning and trigger failure
>    incase of lane mismatch.
> 
> changes from V2:
> 1) Addressed Shawn's comments to fix commit text.
> 2) Addressed Bart's comments to remove variable initializations and
>    indentation fix.
> 
> changes from V3:
> 1) Addressed Manivannan's comments to remove extra comment and return
>    logic.
> 
> changes from V4:
> 1) Addressed Manivannan's comments to fix indentation and return
>    handling.

And you dropped all tags given in v3 :(

- Mani

> 
> Palash Kambar (2):
>   ufs: core: Configure only active lanes during link
>   ufs: ufs-qcom: Enable Auto Hibern8 clock request support
> 
>  drivers/ufs/core/ufshcd.c   | 35 +++++++++++++++++++++++++++++++++++
>  drivers/ufs/host/ufs-qcom.c | 10 ++++++++++
>  drivers/ufs/host/ufs-qcom.h | 11 +++++++++++
>  3 files changed, 56 insertions(+)
> 
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்

