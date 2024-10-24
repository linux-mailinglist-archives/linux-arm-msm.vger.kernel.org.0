Return-Path: <linux-arm-msm+bounces-35702-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E8C629AE98C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 17:00:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A49571C22607
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 15:00:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FCDF1EF943;
	Thu, 24 Oct 2024 14:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gdgA8mmf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 075961E7668;
	Thu, 24 Oct 2024 14:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729781985; cv=none; b=sca8+pYBAuhbjtLfHRgfGhbwuUaJubJJUF3z9S82RleWc0yNO2K0Gz1UguU08tIdBhqoU8siA4sEMkGkulErtpgFbk65d0huoc3obJUtSZqxu92fW+y1RfCdfAHT6OhRed+gE5HYL8GPmob5E09B9/jO3MdHdlE27SCgaSnIVto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729781985; c=relaxed/simple;
	bh=a9D+ECPdaFr9j5MKxaRp+nVfNINM9KxZ32q2IW93W40=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nphyAikbXLQ5yvayHM5Mi05i32SyfB6dmuLmhhrTO/CfGjOQQDHMNwjbQFhyzAfTzd3U1N9i2Ox5rXz/mg204Rrexvt6H/jHSiVxTmvfPjXDZrVlk4ry9o0QUL+pGZAaVqoqLgplnfup4+0NCtjx+CJsBEugWAaTcOUzmIMpBL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gdgA8mmf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF698C4CEE9;
	Thu, 24 Oct 2024 14:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729781984;
	bh=a9D+ECPdaFr9j5MKxaRp+nVfNINM9KxZ32q2IW93W40=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gdgA8mmf8mDEFGS9uyuucTgQSWSXzhwWAQu36b1P3/coieC+ESuQCqK/Vy9A2hm97
	 Vk+278elCAcWy3nhu+PHjya1rh3xjOnRSBR13X0uGgkw7/jmZzidJSLc0s/722x67J
	 ZMSZc9iLmMSHVwuIZeSuHjDI4xvwJTBTjBVW/wkSipeibhTDV9H2ZVntWTpd47jfNF
	 ViHkhQqT8ZSJlpcGqxz27e6TZlWxFL4D6rhJRkS420ZwfBM0XB/V9VxUCKaJUCZbaS
	 0OXwAvjsFh2jEDeiWcEMj0buMAHts+6/FygLqaRLqJ9W2bBh87O2CBy4TiKUiTANWR
	 FL6vPsHZxfiMA==
From: Bjorn Andersson <andersson@kernel.org>
To: konradybcio@kernel.org,
	hanchunchao@inspur.com,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
Cc: quic_srichara@quicinc.com,
	quic_varada@quicinc.com
Subject: Re: (subset) [PATCH 1/1] soc: qcom: socinfo: fix revision check in qcom_socinfo_probe()
Date: Thu, 24 Oct 2024 09:59:32 -0500
Message-ID: <172978197056.296432.9296768032985094455.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241016144852.2888679-1-quic_mmanikan@quicinc.com>
References: <20241016144852.2888679-1-quic_mmanikan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 16 Oct 2024 20:18:52 +0530, Manikanta Mylavarapu wrote:
> In success case, the revision holds a non-null pointer. The current
> logic incorrectly returns an error for a non-null pointer, whereas
> it should return an error for a null pointer.
> 
> The socinfo driver for IPQ9574 and IPQ5332 is currently broken,
> resulting in the following error message
> qcom-socinfo qcom-socinfo: probe with driver qcom-socinfo failed with
> error -12
> 
> [...]

Applied, thanks!

[1/1] soc: qcom: socinfo: fix revision check in qcom_socinfo_probe()
      commit: 128fdbf36cddc2a901c4889ba1c89fa9f2643f2c

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

