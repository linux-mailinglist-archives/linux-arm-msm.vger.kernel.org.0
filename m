Return-Path: <linux-arm-msm+bounces-24877-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD11923C55
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jul 2024 13:25:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1D64B280D27
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jul 2024 11:25:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE13C15B0EE;
	Tue,  2 Jul 2024 11:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PKZ/1wY7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95BEC76F17;
	Tue,  2 Jul 2024 11:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719919515; cv=none; b=Rqr0L6XErt/UQNyXdWIrcrUwD8bIYmwxJkLUq4ZjKvrtTWQXhcHoCYQMdEblLbU6aQhgZY0F3mIHmnDXjh7VPxBgq7kJw7sl8o586EsXYs/RxCe2tJlyRJMzYgXh3nB32ci3wmrP6qCaLFVjDquVpDVZ0rMxuqV1A4tQVdEXJfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719919515; c=relaxed/simple;
	bh=IGTDRo6K0tNvKcrV9mV4TjWGqTPF30WgvwuJZWZo89I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=scGRIEPpjOSdrZDLMBFjm2OwC1yFXwZoh+PHF4IzGVeuMcoEXnDKP+cFWLQLxwui8qSPlxcO09Uvu8VJByTSU6hceBFkTyOlKh70n3aLenMo9rKw8BaROdMYXxxMCFiaJKBiFkLMFLNslG336XW7mJN5xMnIckh5IvANRH6vXu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PKZ/1wY7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 137CAC116B1;
	Tue,  2 Jul 2024 11:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719919515;
	bh=IGTDRo6K0tNvKcrV9mV4TjWGqTPF30WgvwuJZWZo89I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=PKZ/1wY7tvnQaI+Hw0HCd/2Y7JR21vFGvwILD5Mjf+tLfWdzWegNWShdC2RK462CS
	 LCBQCsYfsFCCIYdO241a/ALbsMALzY2tURPNlP/lAkEBnirO8KdsDwyURmEk5BXKtr
	 egNi79vCTPhUtOTuLCzpjoxoEu5kixrTXWCtgmN6QbRCidfAN5CsCg35VYBO961Utl
	 156nS5zOT4irehy7MELJfyJpkOEOZNcEDkgXhmrReaYHO7sngPrjNwNQJ13c4MKZ60
	 HeGsvafdYiZIMkna5wWGG3+KZ3lDQ9qN3Ftu5sWAKBWupfYA7rIEVIPSj88wpHmIKK
	 Cy8vP8shX24GQ==
From: Vinod Koul <vkoul@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, 
 Sanyog Kale <sanyog.r.kale@intel.com>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20240618-soundwire-port-map-v1-1-9644e5545b9b@linaro.org>
References: <20240618-soundwire-port-map-v1-1-9644e5545b9b@linaro.org>
Subject: Re: [PATCH] drivers:soundwire: qcom: cleanup port maask
 calculations
Message-Id: <171991951268.679506.15436884721168000207.b4-ty@kernel.org>
Date: Tue, 02 Jul 2024 16:55:12 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Tue, 18 Jun 2024 14:55:15 +0100, Srinivas Kandagatla wrote:
> Cleanup the port map calculations, existing masks of having separate
> masks for in and out ports is not really required.
> Having a single mask for all the ports in the controller is simple and
> cuts of some unnecessary code.
> 
> 

Applied, thanks!

[1/1] drivers:soundwire: qcom: cleanup port maask calculations
      commit: 518aee32c551d2f7d1e577f63df6dfcc80259b50

Best regards,
-- 
Vinod Koul <vkoul@kernel.org>


