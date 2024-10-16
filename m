Return-Path: <linux-arm-msm+bounces-34613-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C964A9A0E43
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2024 17:32:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C774D1C21E06
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2024 15:32:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9720720FA9E;
	Wed, 16 Oct 2024 15:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oRWwlsUz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DA4C20F5B1;
	Wed, 16 Oct 2024 15:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729092739; cv=none; b=PSaq5Xf0yGHIEDhY66Y7aXYHmpmxPie5eGASO2Syk+Ogj7sSX7r+s+owGgeSkdYADJJWaBcyRP94U7JmtuyjT/uoVWOdSlzQPZemaxCRGhABc5WJVRhuSjo+RRMGgNtR8Lsr0QsC+j2YQiWMNaxFka8hB8sUPQ9fwDw7LbKFrx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729092739; c=relaxed/simple;
	bh=HFK3Qf+3wZI73y1VpQjPJhueBG1OmDR2KH51TK7TiGk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iUUVYAAMaDUB+TE5r8PpmFzIP1lN3V+W/NfjR6BShWalOIAzKzcU1FtNs0igrr9syT+wsqtVVWj+XcjpURQ40DjDuttO8MyzcIpxFFMlof0uur08r7Pn/R/XigPXzEtCSeGF1wBWT4yf2HI/cG9wLgOt/MwmcAV/XrHVu1QLeCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oRWwlsUz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41153C4CED3;
	Wed, 16 Oct 2024 15:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729092739;
	bh=HFK3Qf+3wZI73y1VpQjPJhueBG1OmDR2KH51TK7TiGk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oRWwlsUzH4W8666QPjaj8QWUruWNRYFJK80rg122K2bL6kPE1ZdoYia95cCEyfsz/
	 1hi6XMkG1HR/1yv5mf3qI/HqSV/AK5+rlMzUPlhxT7mwfKOjEDhh8E/3Q5pot7/0pP
	 slJ9sb4JqxE7Nk/NJHxtNnj0BAQyvFhcyYL5PVXTQhJqJGaJW73JMQ1tkWS/Ifo5Aq
	 eFC8Z+yu0lhmW0cpT+Liv/fd0UQF1ovDSeMeRPIwvXddmdWSqV6CIawsxr+zi8Vb11
	 08OjPEPcJLt7XeSxvOMH63ddJ4hgKJ15lpT3VbaJcbww6h0n9U7QXcxpi9534CNxGI
	 yqlp47bkhdEtQ==
From: Bjorn Andersson <andersson@kernel.org>
To: konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	fekz115@gmail.com,
	Danila Tikhonov <danila@jiaxyga.com>
Cc: cros-qcom-dts-watchers@chromium.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@mainlining.org
Subject: Re: (subset) [RESEND PATCH v2 0/1] Add Qualcomm Adreno 642L speedbin and update SC7280 OPPs
Date: Wed, 16 Oct 2024 10:32:14 -0500
Message-ID: <172909273713.703216.4785669246934704171.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241014194825.44406-1-danila@jiaxyga.com>
References: <20241014194825.44406-1-danila@jiaxyga.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 14 Oct 2024 22:48:24 +0300, Danila Tikhonov wrote:
> This patch series adds support for the A642L GPU speedbin (0x81) to the
> Adreno driver and updates the device tree for the SC7280 platform to
> include this new speedbin. The A642L is used in the Qualcomm Snapdragon
> SM7325 SoCs family, which is identical to the SC7280, just as the SM7125 is
> identical to the SC7180. Therefore, the SM7325 will use the SC7280 device
> tree.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: sc7280: Add 0x81 Adreno speed bin
      commit: f92dbc3807a92f08c5450e024e90651322ca6566

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

