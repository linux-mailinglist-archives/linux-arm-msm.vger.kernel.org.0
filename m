Return-Path: <linux-arm-msm+bounces-4127-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA4FA80BE11
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Dec 2023 00:21:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 456F1B207CD
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 Dec 2023 23:21:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95DE21DDE3;
	Sun, 10 Dec 2023 23:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PJG/QnmF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B9481DA5B;
	Sun, 10 Dec 2023 23:21:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EBCCC433C7;
	Sun, 10 Dec 2023 23:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702250472;
	bh=cYa9J1ieXiNcVmac3GC210D9qnNDg5hPHhQXN5DdsbU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=PJG/QnmF+SSe7sxvcxKWBSFKBXVU5hObbY49NBOwyZBJkkQg7vpBTo0W1J6Qir8kH
	 +kKUayKPLLmgIqGzQLOmc7j4q9pwa9AZRToPo9Coa/Cfx+dLJmUBGHPZdMFi3yhXqv
	 FbePG0qe+wg3b8tsbES6OAheEoeQkIACfPYCK2kOjt0EACj/PKB2A5pPJ9nLUXikV2
	 VkdJrIbW8BB1otr09jHhLhEjEfc3IBh+E7Q4P0DVr437UnSrxTo+gILIAnb6rCZRdv
	 QvWtom9ux3QKNoJMVion5yZyu1kK9w7ROfUg2kXQaNiRlEsSW5x9nzz8XYE9TTPYaZ
	 kBVo4+KjwUSIg==
From: Bjorn Andersson <andersson@kernel.org>
To: Andy Gross <agross@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] arm64: dts: qcom: pm8550: drop PWM address/size cells
Date: Sun, 10 Dec 2023 15:25:35 -0800
Message-ID: <170225073869.1947106.15081606683916739366.b4-ty@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231208124332.48636-1-krzysztof.kozlowski@linaro.org>
References: <20231208124332.48636-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 08 Dec 2023 13:43:32 +0100, Krzysztof Kozlowski wrote:
> The address/size cells in PWM node are needed only if individual LEDs
> are listed.  If multi-led is used, then this leads to dtc W=1 warnings:
> 
>   pm8550.dtsi:65.19-73.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c400000/pmic@1/pwm:
>     unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
> 
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: pm8550: drop PWM address/size cells
      commit: a1c7da5fb02c0c24e5d8b2d78d449482bce5e92b

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

