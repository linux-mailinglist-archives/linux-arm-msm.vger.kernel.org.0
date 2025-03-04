Return-Path: <linux-arm-msm+bounces-50101-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D8A6A4D25A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 05:09:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 701F4171452
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 04:09:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D03FB1F417B;
	Tue,  4 Mar 2025 04:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YmIVy6WF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A18801F4161;
	Tue,  4 Mar 2025 04:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741061361; cv=none; b=hWkwc+aedh/LeXOFhjUqRH3psVZYKytS5TxomARocvITSDnXWI+pkrcqfw9tcv0iiPZAgPCPLbS0woSz2c+jKWbGd1iDNUIdn4hEkiTBloVJnW6oHomU2nuEe0wPl7K/bvw4N0ilLjoLYlERkXsF+k9OurLtEfZK6yRk7AydYgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741061361; c=relaxed/simple;
	bh=bsQPXXCCjGVJZ5dkWrd5NllEN/Zgl7X98JItl6lgNoM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oBROw72GPZSv86PYBncOxl8ZT2USoV6LZj7cbLwjKHg6SUreTctx5UI95PRcz8+UevKX7GnVkjliVlvaqNoU0Fjn7CJWSY40pAHz84RRIWtKqQFdBupcJrYIyXQJv6khBv1sXnqs5kvMuv1jFl5LiPpu3Rv7lsLpaDbJ7t6NXPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YmIVy6WF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6585BC4CEEA;
	Tue,  4 Mar 2025 04:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741061360;
	bh=bsQPXXCCjGVJZ5dkWrd5NllEN/Zgl7X98JItl6lgNoM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YmIVy6WFgt7ldYru/6odnu5DYMAyih6dCZb+f/0qlAChD6FzUlboxB6vfhFQ2yoMA
	 KX5GEhx7Ok4n5rXbjDLdKvGd1WyWH6/TCjlUQmEBnb8LBIw0wzTb52yKcwvZrvj+QY
	 d90wa6Fy7L8Xm0h5Q5GyasNF2RIKKxBkm+cSiY3lO9hXJdjbnPTg6R91w7R6rbAJ9U
	 yN/2dwX5XX4pPQKSAkg53EhVtiXBOmfjkyW+3cS3DKkwIvB+ujf8uFVjlhyn4Y/Q0T
	 L37QiaJd+6BNKoBDZ75uIchPHUCf6F5kK0HDk5SSzheVAU1QW7GmTX2cFc1gOdVnku
	 30oqEi83Dg6lQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/2] dt-bindings: display: qcom,sm8[56]50-mdss: properly document the interconnect paths
Date: Mon,  3 Mar 2025 22:09:15 -0600
Message-ID: <174106135204.690218.18053860461752631665.b4-ty@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250227-topic-sm8x50-mdss-interconnect-bindings-fix-v5-0-bf6233c6ebe5@linaro.org>
References: <20250227-topic-sm8x50-mdss-interconnect-bindings-fix-v5-0-bf6233c6ebe5@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 27 Feb 2025 10:00:31 +0100, Neil Armstrong wrote:
> The mdp1-mem is not supported on the SM8550 & SM8650 SoCs, so properly document
> the mdp0-mem and cpu-cfg interconnect entries.
> 
> This fixes the following errors:
> display-subsystem@ae00000: interconnects: [[200, 3, 7, 32, 1, 7]] is too short
>         from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8650-mdss.yaml#
> display-subsystem@ae00000: interconnect-names: ['mdp0-mem'] is too short
>         from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8650-mdss.yaml#
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: qcom: sm8550: add missing cpu-cfg interconnect path in the mdss node
      commit: 327d489d1ecaf16182952f079cc21f04cf83f967
[2/2] arm64: dts: qcom: sm8650: add missing cpu-cfg interconnect path in the mdss node
      commit: f22be5c1dd3e12519e3f3b80c14d10b90be2c2fc

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

