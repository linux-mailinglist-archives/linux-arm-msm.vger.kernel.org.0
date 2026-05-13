Return-Path: <linux-arm-msm+bounces-107456-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gNUFNqPOBGr0PQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107456-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 21:18:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DD99A539CA6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 21:18:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3B9693035640
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 19:08:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 293013B27C4;
	Wed, 13 May 2026 19:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TQrRpsBK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C84BD3B1EC7;
	Wed, 13 May 2026 19:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778699331; cv=none; b=Z4AKuiCr++f1ialpTIn+Tj2BjcgT0KFW9e87IMrUyY4GbrH0VM2AarlbheKUwBpEacmbG98X1kf/NLCi1YJPQ5KcozAhVTXIhUzDux0BB25n6nfMGHTK3/G0dy6/v5/FOtl5JZmM1zirDIOwn+LbzHVuxHQOm3QTJEc/+rImMdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778699331; c=relaxed/simple;
	bh=C40JI5MXBF5DlqJ0Uumh8u9RGj/dKmfC7jtKT64bETQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=di6FpBhtitlrgXCTrY/QnnUzo3DU9L+qWrhdhBlCT/ZuWxTUVUBaJ5rS22WgNMBKA8sol4iWq6RLPMLC3lyVDVpBCrmeC4oSFJcDXCJBHePBTuTOzHdT2KC8q7npMndzkohoLJIlTrkSUE2dCAXZHe7ugU9CCIDoD8jbrTkph/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TQrRpsBK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18C6FC19425;
	Wed, 13 May 2026 19:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778699331;
	bh=C40JI5MXBF5DlqJ0Uumh8u9RGj/dKmfC7jtKT64bETQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TQrRpsBK1BVDGU6EEj7pYIFxTPQHYjssd6LKn6Ar1o4H+4a4zyQNATAa0JCLmIZt+
	 g7wzla1FEF4zEFACC0+rALyh8TqtQZ56crzqH3JYOQC+oFl7yeZhRDwD30fVGLpp/P
	 hu98qE+wDNi5bwNkthfra+pyJIm/tuLPsA12ViHXm5QcrLUeq53sQ3MXWGc4hmjQ++
	 aZUhpyxKU/05qY8COCM8q8UqdvkZZs/x89lCP4/A+/UYb2AXXKs/gfT4BygpRFzFd5
	 Zk+aCDpCIv5uK2qHLEuE7+U93nfRxabB8hZOhXa2NJo8vrpHws05N73yXgxwp8yFwh
	 tz/ZS0hpVWkng==
From: Bjorn Andersson <andersson@kernel.org>
To: linux-arm-msm@vger.kernel.org,
	Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
Cc: linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v1 0/8] Add support for Microsoft Surface Pro 12in 1st Edition (Snapdragon)
Date: Wed, 13 May 2026 14:08:40 -0500
Message-ID: <177869930359.1496076.12020223802779537187.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1778498477.git.harrison.vanderbyl@gmail.com>
References: <cover.1778498477.git.harrison.vanderbyl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: DD99A539CA6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107456-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[vger.kernel.org,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Action: no action


On Tue, 12 May 2026 00:40:49 +1000, Harrison Vanderbyl wrote:
> Add support for the Microsoft Surface Pro 12in 1st Edition (Snapdragon),
> based on the Qualcomm X1P42100 SoC.
> 
> Currently supported:
>   - UFS (with inline crypto)
>   - Touchscreen, pen, cover keyboard and touchpad (via SAM)
>   - USB 3.2 x2 with DP Alt Mode
>   - Audio, WiFi, Bluetooth
>   - CDSP, ADSP, GPU
>   - Display (BOE NE120DRM-N28 panel)
> 
> [...]

Applied, thanks!

[4/8] firmware: qcom: scm: Allow QSEECOM on Surface Pro 12in
      commit: 667d05a09db3da8b3dfbe0bc1dafae2d7887176b

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

