Return-Path: <linux-arm-msm+bounces-98583-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yBrMMoFku2lVjgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98583-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 03:50:41 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 54F582C526B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 03:50:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AE8B031E4148
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 02:47:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AF863876B2;
	Thu, 19 Mar 2026 02:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VhGl1KFT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0715E277C9E;
	Thu, 19 Mar 2026 02:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773888431; cv=none; b=uhcaz02hOFYxNhedoEVaJmPRFEsDt5MclonDcGzrTA/hJ+0dPpxSF+nF3zQt9HC+U+4FgiLnHr/VjTx/fcotkRVZiSNKeNjAHk5E42jn+3BrwkywVfUuBIIpHmLX57WLnPSYKZbcvGdR062v0DuVAoKeDw12NZ+dIT6I6KUTXEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773888431; c=relaxed/simple;
	bh=WUzdWoZEsIp05iqyKAdE9Hu+zAQdC/kGFK1iJ0WN2KU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZVcSD7dfj8w88u4HJIiSG+OrbLlAdYZMcaNOyV1u/ohrIu5yWy8VKRXTiNV3iIG88fOAmulmhvi5A42G75SmpD59MUfFzbwxvS2BX+HgoGkMAXNZqq4HRKtpbP91yGHWDP+cXLTMsO/5ne5zu1wlLlWKyJKPXPDIvFkI2FmURcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VhGl1KFT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 168CBC19421;
	Thu, 19 Mar 2026 02:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773888430;
	bh=WUzdWoZEsIp05iqyKAdE9Hu+zAQdC/kGFK1iJ0WN2KU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VhGl1KFTGpVM7Q9wwj57RCMnyxirA7eGw4kTRQrKDJUimNQepz1u51NRpIwt6wC0o
	 ZEptQ4Ai5KoT+SXgzn6y2CP9OczIbZyHUYS72SfKNlRgk5VKXIIl+Maq7TblMzegm3
	 1oDNARwzF8ERycF/YBI2xxtObgs9D74g7fMb1j8OMRa49ziTJVZ8nKxx6WzhHinhQz
	 +XeOZxfZOZa1Bclg4k44XlsTF62Mw/Y+gf/EJl3RwwpELZKv5RUAW13rKHePd6IHCQ
	 +8fpxUZ48c0pvqvnvC5MA3twHC8mDP3E7SJlhFAxRK4dCNbG+fZIUIPtuM64V039UW
	 xVneJ9eM5wCYw==
From: Bjorn Andersson <andersson@kernel.org>
To: Val Packett <val@packett.cool>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Maximilian Luz <luzmaximilian@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v2 00/11] clk: qcom: sc8180x: PM-related fixes (and refactoring)
Date: Wed, 18 Mar 2026 21:46:48 -0500
Message-ID: <177388840390.11529.13605486035483008934.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260312112321.370983-1-val@packett.cool>
References: <20260312112321.370983-1-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-98583-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	NEURAL_HAM(-0.00)[-0.985];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,linaro];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 54F582C526B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Thu, 12 Mar 2026 08:12:05 -0300, Val Packett wrote:
> v2:
> - collect tags
> - bring in dispcc patch mentioned in cover letter
> - add a couple new discoveries (mostly camcc related)
> - add refactoring to current style (qcom_cc_driver_data)
> 
> v1: https://lore.kernel.org/all/20260309010214.224621-1-val@packett.cool/
> 
> [...]

Applied, thanks!

[01/11] dt-bindings: clock: qcom,gcc-sc8180x: Add missing GDSCs
        commit: 76404ffbf07f28a5ec04748e18fce3dac2e78ef6
[02/11] clk: qcom: gcc-sc8180x: Add missing GDSCs
        commit: 3565741eb985a8a7cc6656eb33496195468cb99e
[03/11] clk: qcom: gcc-sc8180x: Use retention for USB power domains
        commit: 25bc96f26cd6c19dde13a0b9859183e531d6fbfc
[04/11] clk: qcom: gcc-sc8180x: Use retention for PCIe power domains
        commit: ccb92c78b42edd26225b4d5920847dfee3e1b093
[05/11] clk: qcom: gcc-sc8180x: Enable runtime PM support
        commit: 733220662679da538c5c416b3367acc7cb212f29
[06/11] clk: qcom: gcc-sc8180x: Refactor to use qcom_cc_driver_data
        commit: f641773e10fa5e85154554b15f2aff30e050bdcb
[07/11] clk: qcom: dispcc-sm8250: Use shared ops on the mdss vsync clk
        commit: 8c522da70f0c2e5148c4c13ccb1c64cca57a6fdb
[08/11] clk: qcom: dispcc-sm8250: Enable parents for pixel clocks
        commit: acf7a91d0b0e9e3ef374944021de62062125b7e4
[11/11] clk: qcom: camcc-sc8180x: Refactor to use qcom_cc_driver_data
        commit: b39ae8c2f3de2a2429caad9dd414db14f84bcc8e

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

