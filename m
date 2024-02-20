Return-Path: <linux-arm-msm+bounces-11903-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5164885C326
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Feb 2024 18:58:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0785B1F25193
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Feb 2024 17:58:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B787D7866A;
	Tue, 20 Feb 2024 17:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s9tOlNph"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8853476C6C;
	Tue, 20 Feb 2024 17:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708451869; cv=none; b=MQjsU70ilr3dLnhmgHvI28bpNB/iCJ4+WiBhbYRPvilAmn8lF2NKh8b5kd8x1Z8TLxk1d3YDsofcmtS0YmrnfB5a63G6BK/r3dh4ESO/bCDiAJ4BR5+/TjKWfbJj2KHQdgfQrkhPwKh68dJaGfT4gAqVMEm/RQYaKSBCZ4SAyqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708451869; c=relaxed/simple;
	bh=niU0e3YYXa8nKs0bptXFagevwIy6zWw8W8j5BfvgpWU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CFgVSJ0ENg6CLaw427fgWVUBHOPyXoeOv0yDsEhkyNAP9Chuz2PobD8oCGpY6fddoxecQpYxeRhdIwrcK2SgAGjqCrAYSzpWT0M8SvAMdCtgVtW3ISZgts74e9ufE0ihmkt1NB1OemMkWv9+EhNeyVkknKv6eIkmfaBzv6JAg5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s9tOlNph; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04FA2C433C7;
	Tue, 20 Feb 2024 17:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708451869;
	bh=niU0e3YYXa8nKs0bptXFagevwIy6zWw8W8j5BfvgpWU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=s9tOlNphyB1KcCqAiLhfn9eQVOuKTO8p3H1b6SGtA+rlMHnesuq43aSDVkJh8rtZ8
	 AE1+ojcA7o4Re9rRlk/RLxrxXXvrHx5QbE+1ieTFuLH94DGZHoUoVIBLPSBC60kEGm
	 RVe3V+C9vMavyk+WkaO+81u4XIVycySNquJWDiXN6i8fuc8DlaTRrmwZD3Ej0hw4uG
	 Ln2VvBuFxQEkRABSENvL5rW/M8ZZzsS2cjrgryCDk1/czcyQQ359JWoqNcnL/bEvkS
	 UpU+4zwmbeyPtWaiBIJnYO14Sc4o3/n+cHCzggJJ7oMCxxLn50QYnAjyZtE9Uq4MW6
	 J6MngogkXnV+Q==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: (subset) [PATCH v2 0/4] arm64: dts: qcom: qrb2210-rb1: enable Type-C support
Date: Tue, 20 Feb 2024 11:57:39 -0600
Message-ID: <170845186085.159943.14965896524132330811.b4-ty@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240202-pm4125-typec-v2-0-12771d85700d@linaro.org>
References: <20240202-pm4125-typec-v2-0-12771d85700d@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 02 Feb 2024 01:55:07 +0200, Dmitry Baryshkov wrote:
> Reuse Type-C support implemented for the PMI632 PMIC (found on Qualcomm
> Robotics RB2 platform) and implement Type-C handling for the Qualcomm
> Robotics RB1 platform.
> 
> Dependencies: [1]
> 
> [1] https://lore.kernel.org/linux-arm-msm/20240130-pmi632-typec-v3-0-b05fe44f0a51@linaro.org/
> 
> [...]

Applied, thanks!

[3/4] arm64: dts: qcom: pm4125: define USB-C related blocks
      commit: 46ea59235c4f00bbca6955cf05d7cc0fccde7a64
[4/4] arm64: dts: qcom: qrb2210-rb1: enable USB-C port handling
      (no commit info)

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

