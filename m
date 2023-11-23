Return-Path: <linux-arm-msm+bounces-1742-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F25737F6509
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Nov 2023 18:16:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 91FB5B210AA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Nov 2023 17:16:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81BE33FE46;
	Thu, 23 Nov 2023 17:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YoPrU2JS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 611ED3FE3A;
	Thu, 23 Nov 2023 17:16:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11565C433CC;
	Thu, 23 Nov 2023 17:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700759779;
	bh=Y/Uu3aDbe5RYcazWSJu1Y4R/Eztt9hVU2SQs2W4+78c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=YoPrU2JS7HDeMPu4upQlU/qpD/pYUqQS9SWoTRpG2v1NggNz1jXv+k880M7lnfBel
	 ppYf1zlobGd74Blu64PU004hGv6lrLiDTTAIbKI0P0hEVYZY+nOkyy+cLrFR+HF9bD
	 wIg7epMwdt748PKcKQSY+s+H84mbpRkh8FUfHHfxy4S4OkQcI8BB5tuDFslSr9qAi9
	 MyDh/8pUdtanfGuURroPfvoFypIafD9CpqM8fRazwzkCJUVrx/JHCIySrEseUoxDAh
	 EBj5oiqAyMckbWsGb9f3M1vhHNbk0SewNdB6A8eDP+ViM+za0grEddMHbTg0d6lU0k
	 xi4ylofeDy63A==
From: Lee Jones <lee@kernel.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Dang Huynh <danct12@riseup.net>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Caleb Connolly <caleb.connolly@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20231121-pm8937-v2-0-b0171ab62075@riseup.net>
References: <20231121-pm8937-v2-0-b0171ab62075@riseup.net>
Subject: Re: (subset) [PATCH v2 0/4] Add PM8937 PMIC support
Message-Id: <170075977679.1459397.15383633309594797039.b4-ty@kernel.org>
Date: Thu, 23 Nov 2023 17:16:16 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.3

On Tue, 21 Nov 2023 12:34:58 +0700, Dang Huynh wrote:
> PM8937 is a power management IC. It is used in various boards with
> MSM8917, MSM8937, MSM8940 and APQ variants.
> 
> This patchset has been tested on Xiaomi Redmi 4X (MSM8940).
> 
> 

Applied, thanks!

[1/4] mfd: qcom-spmi-pmic: Add support for PM8937
      commit: 587fcef6762cef9f44eb1aadc294d515262e6da3
[2/4] dt-bindings: mfd: qcom-spmi-pmic: Document PM8937 PMIC
      commit: 2a7b788e2ee041ee8b96481952b3cf4bebed60f3

--
Lee Jones [李琼斯]


