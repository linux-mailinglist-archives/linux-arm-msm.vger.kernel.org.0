Return-Path: <linux-arm-msm+bounces-7960-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 55DD3839132
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jan 2024 15:21:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 929921C27792
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jan 2024 14:21:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AF275F862;
	Tue, 23 Jan 2024 14:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mbhUlsXw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62A995FDC6;
	Tue, 23 Jan 2024 14:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706019658; cv=none; b=SkZUJ3DUTvOutogOSSD6VmeEWQZj7wmbfuiqafBPk9vvK2eF9SRdibOffVWgfJmoDQfvnA0ePlRKi+v8rUFz1MfkA3UskUrYsUgtCbF+1SdnOPF4FYGIMBWABhQPyiUMeX+5aUp/pT0plmPFHRJ8SEpsYVmwCIYLL2q1GvHvVig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706019658; c=relaxed/simple;
	bh=Fnn6kbblgPOYTHgAoSYebD9MlsrB3lhFQpPsRPT6Uyw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=kaOtPgqqAqPPukrsutMR796zZFETbYo29H9GtedGRbmN5aKOOEUu23DHEAFGe7VNF+X/ObrRYmGcxFp3HxS44WWB440AbH/URoAMrLHYHUL2WzKqgH+SUCLbS2ruO+nq4SKpO+wgxLCCqAgUJ+dnAKcRfX0UjIVx7EOzfrr4Xek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mbhUlsXw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA712C433A6;
	Tue, 23 Jan 2024 14:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706019657;
	bh=Fnn6kbblgPOYTHgAoSYebD9MlsrB3lhFQpPsRPT6Uyw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=mbhUlsXwMBG5JUe5GbAA98Iq95Cnu8TyvBGPHMi2m7n7xd/qfl/cu7IwlfyvUcb1p
	 tQg6LFrmnl1mIers/nehSPv0+8/LCqpvHp+xZibvvKELZ+OwVBQ9Wxi2nW9D9CIcap
	 rJb3S7X2GYQPY5xYnX910gcrEujTyW3wffvhQ/j5MVrm2v9KBARP/1kWcdhGOfiAJj
	 jkO7fzjoUoKbpKUDLKFoIn6cx4t0eD3qK3zt28Iuhr7h6IxBAo9+jD/vEz+tlSQ7kP
	 TUkxX6c1mClUpk8NmGXUg5g+o4CRu/+nTyTUdrjCpXweZ/mWnMCpgZ4Q2COV7Jo+Ud
	 ah0qky1ifkNMQ==
From: Vinod Koul <vkoul@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Guenter Roeck <linux@roeck-us.net>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-phy@lists.infradead.org, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20240113-pmi632-typec-v2-0-182d9aa0a5b3@linaro.org>
References: <20240113-pmi632-typec-v2-0-182d9aa0a5b3@linaro.org>
Subject: Re: (subset) [PATCH v2 00/15] usb: typec: qcom-pmic-typec: enable
 support for PMI632 PMIC
Message-Id: <170601965232.371263.15600839132487159612.b4-ty@kernel.org>
Date: Tue, 23 Jan 2024 19:50:52 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3


On Sat, 13 Jan 2024 22:55:43 +0200, Dmitry Baryshkov wrote:
> The Qualcomm PMI632 PMIC (found on Qualcomm Robotics RB2 platform)
> doesn't support USB Power Delivery. However this PMIC still supports
> handling of the Type-C port (orientation detection, etc). Reuse exiting
> qcom-pmic-typec driver to support Type-C related functionality of this
> PMIC. Use this to enable USB-C connector support on the RB2 platform.
> 
> 
> [...]

Applied, thanks!

[03/15] dt-bindings: phy: qcom,msm8998-qmp-usb3-phy: split from sc8280xp PHY schema
        commit: 159919a184c5ef82fac3605b2390b17a549c06ac
[04/15] dt-bindings: phy: qcom,msm8998-qmp-usb3-phy: support USB-C data
        commit: c1214b579733df7017c0e5f97f26eeb4b66df0c6
[10/15] phy: qcom: qmp-usb: split USB-C PHY driver
        commit: 19281571a4d5b6049dad9318db081af48818b1d2
[11/15] phy: qcom: qmp-usb: drop dual-lane handling
        commit: 52cfdc9c6c3306f0bda4f217396f508d3f5459fb
[12/15] phy: qcom: qmp-usbc: add support for the Type-C handling
        commit: dfdaba27b4660ec26de955cf4459499ddb005e2d

Best regards,
-- 
~Vinod



