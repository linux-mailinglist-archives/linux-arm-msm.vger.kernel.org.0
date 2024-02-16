Return-Path: <linux-arm-msm+bounces-11340-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02A00857C2C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Feb 2024 12:57:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E8328282780
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Feb 2024 11:57:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3554977F3C;
	Fri, 16 Feb 2024 11:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DKJUShQb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1100D77F34
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Feb 2024 11:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708084673; cv=none; b=VZzwO61bFVd0Krmdthvzm7fbDsGTxKzmUfUBSRGE86AXFm7sC7H7zOms+WEDC58E9eY6AAJ4Q+fvh2RoTPLEOw3STkey8BSvwLW3sra4e2ukruK/oGmqHg1yfoY0VGZSjFXfXbb9qf0sjG+k1UoMuqgGV+oJtGf+G3k/usFpcdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708084673; c=relaxed/simple;
	bh=q54b+r3HTYV9zIDF4ItH8BvDFz8WwM/tv+Owy9PZbIg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=cSoc1b0MwF+Jn1pmqOxpRTHiz2l1+JrBAmuDmJ9mHgL4+0lgZ2nTzvYYm87YYZLeM1bpocjEactk66GwVRDW5RSkXps3+0g14VTGaHu37vxtGeP3S38eg7w7Q1NiSUP4CwPfx2Vv9Egf94ysV/eDoWdd2vGx7A9dAnU9RXwiHJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DKJUShQb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 216A0C433C7;
	Fri, 16 Feb 2024 11:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708084672;
	bh=q54b+r3HTYV9zIDF4ItH8BvDFz8WwM/tv+Owy9PZbIg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=DKJUShQbW7EA2ta76eXSj7hhZ/wy/T+FV+Td7iIzct1+HTFwsQWJ1vFuG28Pv/U2e
	 M+xbLqzREuC9tOaX1V4b8h033ATTlx5FZM2u8Uxb8xb8fjDnantINpOS3tbbAWNZYM
	 uaOHAAO6WAj+C1UAUcilUyxF4AHah5EoQaoZVwMUYPKDu2L222ex7KwfhBUNDS+RVN
	 etBMT6OvXM41ALaYGMYjgJu/tivmd0sPiX2Y8rpbhTkUe54g1w7L9SjnsRPZ0b7cGz
	 0KJ35BN5fY2GrHs22gm0Ve2oHNX+mhPYc7XVsoqEoOgDqNfGlHFPLSKcTsOQv1kzNT
	 WtW32GiLK80kQ==
From: Vinod Koul <vkoul@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org, 
 linux-phy@lists.infradead.org
In-Reply-To: <20240213133824.2218916-1-dmitry.baryshkov@linaro.org>
References: <20240213133824.2218916-1-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH] phy: qcom-qmp-usb: fix v3 offsets data
Message-Id: <170808466973.352622.4246974712400834462.b4-ty@kernel.org>
Date: Fri, 16 Feb 2024 17:27:49 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3


On Tue, 13 Feb 2024 15:38:24 +0200, Dmitry Baryshkov wrote:
> The MSM8996 platform has registers setup different to the rest of QMP v3
> USB platforms. It has PCS region at 0x600 and no PCS_MISC region, while
> other platforms have PCS region at 0x800 and PCS_MISC at 0x600.  This
> results in the malfunctioning USB host on some of the platforms.  The
> commit f74c35b630d4 ("phy: qcom-qmp-usb: fix register offsets for
> ipq8074/ipq6018") fixed the issue for IPQ platforms, but missed the
> SDM845 which has the same register layout.
> 
> [...]

Applied, thanks!

[1/1] phy: qcom-qmp-usb: fix v3 offsets data
      commit: d4c08d8b23b22807c712208cd05cb047e92e7672

Best regards,
-- 
~Vinod



