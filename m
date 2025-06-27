Return-Path: <linux-arm-msm+bounces-62712-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6707DAEABE4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 02:47:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DBF6A4E1A59
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 00:47:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9C43156F3C;
	Fri, 27 Jun 2025 00:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bA4xoOX5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0E881553A3;
	Fri, 27 Jun 2025 00:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750985228; cv=none; b=gjiWTGIURjPhnqgctIoxWYeCnnvm9iNQQl4o35H3ag34e48uNRPnDBkLbFyBBo4Jk7N85uTqrJ7kx7bRCRiXbF1i4sbSC+DuePZ8y7leJA4Y9+XMUO5f2Z45PxX344g9g5YdA0y/EAAKgf7yJ0YCNQGKtD4LwhVjQ4fnAO+VgZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750985228; c=relaxed/simple;
	bh=LJTr39Kx9TzcBouC4IUe/L5JK7gaijmdnU+4I29p2ow=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=l5iL/tY4/jUX0LzWmiu38LcTyOACg6hu1Y0sMaGyxMsZubSjj8sSZut9P8ms8Iq05REsKO9ZdfBhoBG3xvshPlfvm575BhXTRmyzTpyfvxjC4uP+S7ftDgTzWHcNYEkd5945f2l2JYWi9zdA698GtKb9FX5662lGqFQEmBRYQ3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bA4xoOX5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08F63C4CEF2;
	Fri, 27 Jun 2025 00:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750985228;
	bh=LJTr39Kx9TzcBouC4IUe/L5JK7gaijmdnU+4I29p2ow=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=bA4xoOX5nA8QfsxhPGXul7HIXU5a8zXGOH+1yv6cNDQ+ftwmAbQakn/JSlcqyK9n7
	 ouSDQZRIwx2JbaV3o0TSBc9f/fkwxkZ1knXAFo/8vjt1sm8D9n5HVcq6/eHh9P8Hxu
	 ckFB7Lpb62PWaHcM4HXP9x/THCBikF/qpbgKvJzUxmvsPJpR3KenrG1QQqtEwoe9TK
	 NfGTvCYre9/lFMwrSPP3XAq0ZVWkiYHVM6ENtTKXl1Vg/RH+t70pL5N1DmI2ejI1Lf
	 CgmI2QOlllxkMAqGpkyp0UOj57+5ceVE1YTTN0wb6TCf3Djfd8j9DAaB/3f8OaxkPy
	 vqmDbAtv6LXLg==
From: Vinod Koul <vkoul@kernel.org>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>, 
 Wesley Cheng <quic_wcheng@quicinc.com>, 
 Melody Olvera <melody.olvera@oss.qualcomm.com>, 
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250617080503.11262-1-johan+linaro@kernel.org>
References: <20250617080503.11262-1-johan+linaro@kernel.org>
Subject: Re: [PATCH] phy: qcom: m31-eusb2: fix match data santity check
Message-Id: <175098522793.106297.10666098884425088402.b4-ty@kernel.org>
Date: Thu, 26 Jun 2025 17:47:07 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Tue, 17 Jun 2025 10:05:03 +0200, Johan Hovold wrote:
> The device_get_match_data() helper returns NULL if a new entry is ever
> added without corresponding match data.
> 
> 

Applied, thanks!

[1/1] phy: qcom: m31-eusb2: fix match data santity check
      commit: 603bd9808f58009e1f230271f94e1b9e13d506ba

Best regards,
-- 
~Vinod



