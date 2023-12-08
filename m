Return-Path: <linux-arm-msm+bounces-3816-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 45FB08099A9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 03:53:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DEBAF1F21306
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 02:53:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 072C31FB4;
	Fri,  8 Dec 2023 02:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EbFZ0vIa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC8974A2D;
	Fri,  8 Dec 2023 02:53:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE80EC433CC;
	Fri,  8 Dec 2023 02:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702004011;
	bh=Z6n/+nID4ewJlze65BwH1SFveUAH/ABWb0Y50HV+A2w=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=EbFZ0vIaSDy9lQM7OP4YuzM6iVIRvsicbqjek6zcQ9ZColJQX41cfR/Odo43nP3iL
	 qSK5tSbzZpqC7ILGEY+tql1wHicM0n7VXYYbglphFR6UY6BIBSs8MDELLnDlPrl/xa
	 yVPG1I7iRDIoIxPmBsNnGkNOh2DaCJ5wjBN7t5F9kJ9ZwIZwi+QbBi96DZjhPZ7wfK
	 +3KDIOp2SbA6oxANGmqeUY//MqeDdJozKklc8XdEBinhiOIYJU0KbhcCbZLQfr4K+4
	 9mcYkE6Gn/MZ4XvI/oOermlFCMhWiPwJTWNNfmkmQdNitNGSjXmM0CIQrriaPte/gp
	 v/H6gjgF+bBCA==
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
Subject: Re: (subset) [PATCH 1/3] arm64: dts: qcom: sc8180x-primus: drop sound-dai-cells from eDisplayPort
Date: Thu,  7 Dec 2023 18:57:35 -0800
Message-ID: <170200426916.2871025.9487099350234282419.b4-ty@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231107103540.27353-1-krzysztof.kozlowski@linaro.org>
References: <20231107103540.27353-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 07 Nov 2023 11:35:38 +0100, Krzysztof Kozlowski wrote:
> Qualcomm MDSS Embedded DisplayPort bindings do not allow
> sound-dai-cells:
> 
>   sc8180x-primus.dtb: displayport-controller@ae9a000: #sound-dai-cells: False schema does not allow [[0]]
> 
> 

Applied, thanks!

[1/3] arm64: dts: qcom: sc8180x-primus: drop sound-dai-cells from eDisplayPort
      commit: 5a71b4719be718ffd99dfc08a457cefac4070102
[2/3] arm64: dts: qcom: sc8280xp-x13s: drop sound-dai-cells from eDisplayPort
      commit: 7613e707612e50fb73bba3e9ae1b281f36eff24b
[3/3] arm64: dts: qcom: sm8350: move DPU opp-table to its node
      commit: fabfc74f1b3ab1801d54cf32d8e44a893340be7f

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

