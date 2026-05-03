Return-Path: <linux-arm-msm+bounces-105611-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2EjyKAyC92n3iQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105611-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 03 May 2026 19:12:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FA324B6BE5
	for <lists+linux-arm-msm@lfdr.de>; Sun, 03 May 2026 19:12:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0C5113008889
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 May 2026 17:12:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BDFB372EFB;
	Sun,  3 May 2026 17:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G26YuI+x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7912D3630B9;
	Sun,  3 May 2026 17:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777828329; cv=none; b=ABDDpmy69dTaEkdpURHu36EkQqVYnHjv9TVbkKwnPqLscxAzykBMRAOrqfX39dbXlqzoVel2nKiBd5cVG8GF4ZutvvtFKjBYyfS+MCiWb0hGOMYD7e+BxZ3zOq5ZkklnwjjiR49hm0/h86O3DL9KPWXdDQa47HG4dUwzDhj2gkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777828329; c=relaxed/simple;
	bh=VSVVTCxUpqH6gUJP/+1230YPiKCL5WEfgYBGdHK6SeY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=JK/aYWEPDMnDzVhavfYPtdnci6smV5qHnTX4vrSZfptNBiBQVS05kEotfcMn3XMhmXeuVFBrxnZ4KUQBZGAiTYtz0MIqaLimwBkAkjALKZaSaN0qqiONxC6lp3pWVhrtK9OGQPvsodwYSz8KrQ5V4lTUtIag1QkJlixkd46GEXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G26YuI+x; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FFB9C2BCB4;
	Sun,  3 May 2026 17:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777828329;
	bh=VSVVTCxUpqH6gUJP/+1230YPiKCL5WEfgYBGdHK6SeY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=G26YuI+x4jF+WpcAccWSTOdC0H9T9YrHmwMMoUBP9+YB1/C3etZyOdIrlyGK4QwHc
	 2aROAFAYy6+I7rmVbu6VsZlk9mBPweYtLk31xneG2o31DBN+95HHVLPhodcER0S9sV
	 eOzFd9UuvYV7DoCF+K1K3AFRqKovgDE8T/fPkAf84e3Dw3GCrHHN2IC8j8njysPCSq
	 ltzzVEsCRDj75IWPPXNawl5vAXTdZ77j1jamfJk4+bXztI48WCEi8+/IVPAP1CzBGM
	 TS3Qa2wu0iSHpH8tSoiYpci8JYW63dUuPcuiiNW3T2Yl3UaoRlWkcNB0hzxYXvGEGt
	 aD89jy2KRxlrg==
From: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Stephen Boyd <swboyd@chromium.org>, Bjorn Andersson <andersson@kernel.org>, 
 Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20260427-edp_phy-v5-0-3bb876824475@oss.qualcomm.com>
References: <20260427-edp_phy-v5-0-3bb876824475@oss.qualcomm.com>
Subject: Re: [PATCH v5 0/5] phy: qcom: edp: Add DP/eDP switch for phys
Message-Id: <177782832516.123780.10745485778034358012.b4-ty@kernel.org>
Date: Sun, 03 May 2026 22:42:05 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
X-Rspamd-Queue-Id: 4FA324B6BE5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-105611-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vkoul@kernel.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]


On Mon, 27 Apr 2026 14:35:18 +0800, Yongxing Mou wrote:
> Currently the PHY selects the DP/eDP configuration tables in a fixed way,
> choosing the table when enable. This driver has known issues:
> 1. The selected table does not match the actual platform mode.
> 2. It cannot support both modes at the same time.
> 
> As discussed here[1], this series:
> 1. Cleans up duplicated and incorrect tables based on the HPG.
> 2. Fixes the LDO programming error in eDP mode.
> 3. Adds DP/eDP mode switching support.
> 
> [...]

Applied, thanks!

[1/5] phy: qcom: edp: Unify generic DP/eDP swing and pre-emphasis tables
      commit: fd672888cccd6b855154efe0ac78e7ce3e8ab088
[2/5] phy: qcom: edp: Add eDP/DP mode switch support
      commit: 3011c365a329cf2db6d55e8d684550dc88350436
[3/5] phy: qcom: edp: Add SC7280/SC8180X swing/pre-emphasis tables
      commit: 3d22594d6f842814b7718600486fe3ce9453abf0
[4/5] phy: qcom: edp: Fix AUX_CFG8 programming for DP mode
      commit: bf237a9fcbbf9d658522f7315ffc04bf2d49be42
[5/5] phy: qcom: edp: Add PHY-specific LDO config for eDP low vdiff
      commit: 519a228ee40d1be3453d1da339b4577c3785e333

Best regards,
-- 
~Vinod



