Return-Path: <linux-arm-msm+bounces-94472-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iIcaMMK5oWkYwAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94472-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 16:35:30 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F6E1B9E76
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 16:35:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B087D3085CE6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 15:30:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4FA643E49B;
	Fri, 27 Feb 2026 15:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uOoPHD0i"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1B8343901F;
	Fri, 27 Feb 2026 15:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772206177; cv=none; b=tRlIwt/5BgaYeXS7p5VFyQdibC30zHW/QWc3Ck5+7Yc7sob3rIZ64uvKq9kWIr15pwLHAJBoNJzg/QsBKX8Udoq8PQ3hO/kAttvouNN1EIQutWmUVBT0qRauz6VbkGxalBJQzxB5PSqphfw1zleyS+SPwVo1ZbX98jGNw0KydVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772206177; c=relaxed/simple;
	bh=TThf0zGuIQiVPe0oLyxVWAsH1T/uyE+KzNCGzyGhQNg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=DY46E5nA4BlO3Ya8FlETF6EqqX3mBSaig1FTSO7pH54zt6oPLmJjJgaaZq06dj+nQo2R2FvKujHXwzIyELVPEpInBIOfMhuXdMc/YtR2jHYjVOXFnz8+IowxFXiOigXtRaNbd/0IVNNNpzIZaNpjSokppJ1dlsQ4kS2tJ/22Fmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uOoPHD0i; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A983C19423;
	Fri, 27 Feb 2026 15:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772206177;
	bh=TThf0zGuIQiVPe0oLyxVWAsH1T/uyE+KzNCGzyGhQNg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=uOoPHD0iIJKlxNFsZjC58CGLyazFXWV8TYr5z6ni2Io6oUGNW5/pBrZ3fVY3k2CHw
	 QACPdto5xZwptLsHWcLsDnSXfPaCJIeSCo8XYIZ0fCzB+qPacV25ECqXhee1onQuDA
	 vp6REW107neTbFfpwXrM+lrOWH7WDjb07NxuOds/rmy3336x+PMy0jVr01OyKrgu08
	 v8lSSgPyditSiyEIg9dZOvYo+MBjxjaARXDHWrBlAyMJAEeesaE2hoqsa5gFNgJgfx
	 Ns7/jZsjrT0mgTDIPtZKBIT3I30mabcVCBfQQmcnz+ERT4IWMHxCuw3pBWpm23CX2U
	 427gFXpIlmgHw==
From: Vinod Koul <vkoul@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Wesley Cheng <quic_wcheng@quicinc.com>, 
 Johan Hovold <johan+linaro@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Elson Serrao <elson.serrao@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
In-Reply-To: <20260217201130.2804550-1-elson.serrao@oss.qualcomm.com>
References: <20260217201130.2804550-1-elson.serrao@oss.qualcomm.com>
Subject: Re: [PATCH] phy: qcom: m31-eusb2: clear PLL_EN during init
Message-Id: <177220617425.330302.16212600767917338005.b4-ty@kernel.org>
Date: Fri, 27 Feb 2026 20:59:34 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94472-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vkoul@kernel.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,linaro];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E9F6E1B9E76
X-Rspamd-Action: no action


On Tue, 17 Feb 2026 12:11:30 -0800, Elson Serrao wrote:
> The driver currently sets bit 0 of USB_PHY_CFG1 (PLL_EN) during PHY
> initialization. According to the M31 EUSB2 PHY hardware documentation,
> this bit is intended only for test/debug scenarios and does not control
> mission mode operation. Keeping PLL_EN asserted causes the PHY to draw
> additional current during USB bus suspend. Clearing this bit results in
> lower suspend power consumption without affecting normal operation.
> 
> [...]

Applied, thanks!

[1/1] phy: qcom: m31-eusb2: clear PLL_EN during init
      commit: 520a98bdf7ae0130e22d8adced3d69a2e211b41f

Best regards,
-- 
~Vinod



