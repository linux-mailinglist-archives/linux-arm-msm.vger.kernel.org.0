Return-Path: <linux-arm-msm+bounces-102774-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kmInMRII2mkEyAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102774-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 10:36:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 356CC3DEFCB
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 10:36:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C4AC4301EC70
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 08:36:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63771286891;
	Sat, 11 Apr 2026 08:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OEq+8xdW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 404C71C84BB
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 08:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775896590; cv=none; b=a9xt4svO/92r4x7Iqd6E7QFepR+fNxMdh2G5FPS/fV61poEfnJhpqR1QEfmUSYo7WCQj5iLCe/mALBEt62gyXOeOqnAF8Q9cAtVsp9sn4itLuL2J46px0NuEE5y021DV5gOvtBAXhbZfdddO3Iz8TTq7TZwc9z9H4ooW+CAy2Y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775896590; c=relaxed/simple;
	bh=wprADVJKu9wHnF7hgXcFtU3lqaLTiDIRd/Vv8wZiTZc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GQje7XYBG/c5GGpnyIDF0JAJXKyqXH5vbNaqedffZDBQa8Aufu6RwCrkinrABbdA8d6vVhXs4gNaTXwwY4xAzlhaFXayVsHk2y0S5+CVTzgRFB7k6SvBJybMWOiwm94rDB/guLb28D7KkHN8zJTc5Zi71/FVtVr6vmN9M1Ph8OM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OEq+8xdW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60921C4CEF7;
	Sat, 11 Apr 2026 08:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775896589;
	bh=wprADVJKu9wHnF7hgXcFtU3lqaLTiDIRd/Vv8wZiTZc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OEq+8xdWHBmKWDgsA2JDojibVUDQ9tmJo4A3w1aQXafDDRStzOQqLETOsS6bezolZ
	 UKhyks9z07BeunXBMPTFcVyXwkKc0zQmsEAw0lrzUp2Crii6pe5I8k39RO0E9l5UtF
	 k2Cvmuvh7v1MW7uxqVyRwtlzFW3Hw/RGw1QBtpNQLqPv7QRY1lc8/9HBs7vOTVwpzD
	 0r72IMin8TyOAnSaiiiWsVM0mMCMv2nig7HJ/pklvK0UAmv35RXys9qVuScr518QBz
	 Vz4nqNB73JpzeVIrrTtCBQHEZGJ17N/QqSq0gqcbw+LIs7vMlRyX5dt9+dmoGAm43+
	 qyUPV2pSRQN7w==
Date: Sat, 11 Apr 2026 10:36:27 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: arm@kernel.org, soc@kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, 
	Paul Sajna <sajattack@postmarketos.org>, Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>, 
	Sudarshan Shetty <tessolveupstream@gmail.com>, Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, 
	Casey Connolly <casey.connolly@linaro.org>, Jie Zhang <quic_jiezh@quicinc.com>, 
	Abel Vesa <abel.vesa@oss.qualcomm.com>, Alexander Martinz <amartinz@shiftphones.com>, 
	Amir Dahan <system64fumo@tuta.io>, Christopher Brown <crispybrown@gmail.com>, 
	Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>, Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, 
	Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>, Qingqing Zhou <quic_qqzhou@quicinc.com>
Subject: Re: [GIT PULL] A few more Arm64 DeviceTree updates for v7.1
Message-ID: <20260411-strict-nifty-otter-fcd6dd@quoll>
References: <20260406132007.2264408-1-andersson@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260406132007.2264408-1-andersson@kernel.org>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102774-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,lists.infradead.org,arndb.de,postmarketos.org,oss.qualcomm.com,gmail.com,linaro.org,quicinc.com,shiftphones.com,tuta.io];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 356CC3DEFCB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 06, 2026 at 08:20:07AM -0500, Bjorn Andersson wrote:
> 
> The following changes since commit b683730e27ba4f91986c4c92f5cb7297f1e01a6d:
> 
>   arm64: dts: qcom: sm8250: Add missing CPU7 3.09GHz OPP (2026-03-30 09:35:01 -0500)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-for-7.1-2
> 
> for you to fetch changes up to af241225893ac4933bb8f0615f2dfda8ea2326ce:
> 
>   arm64: dts: qcom: Add the Lenovo IdeaCentre Mini X (2026-04-02 16:08:54 -0500)
> 
> ----------------------------------------------------------------
> A few more Arm64 DeviceTree updates for v7.1
> 
> Introduce the Hamoa-based Lenovo IdeaCentre Mini X, the Dragonwing
> IQ-615 (Talos) EVK, and a Talos EVK camera overlay.
> 
> Enable DisplayPort support on the Glymur CRD.
> 
> Add WiFi, Bluetooh, LEDs, and venus on LG-based SDM845 devices. Add
> battery, charger, and display on the LG G7 ThinQ.
> 
> Enable SD-card, describe the audio amplifier, and increase the speed of
> the i2c clock for touchscreen on the SHIFT SHIFT6mq.
> 
> Add camera subsystem, camera control interface, GPU, GMU, and GPU
> cooling on the Talos platform. Enable the GPU on the Ride board.
> 

Thanks, applied

Best regards,
Krzysztof


