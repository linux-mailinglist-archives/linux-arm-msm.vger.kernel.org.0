Return-Path: <linux-arm-msm+bounces-27666-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2865B9444E5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 08:55:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D81DB281B51
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 06:55:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF01A15855B;
	Thu,  1 Aug 2024 06:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d9kiV361"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B683915854E;
	Thu,  1 Aug 2024 06:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722495304; cv=none; b=W1rBrIU/7/v0kfN6W35MqCRIPaLU1+opRGGecZ6KsErgq5GsuMXVgqD6GpNy8ZtsAgbjRya+YWrS2X8ob6Fv6Cg5XdVt085LqI7PKquNI+BP1mdpJ0Y/f+QlncJ6oclPNHALw73CsW27j8YaE0VFzfcCSxoTYe+iIQAWYH5HiIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722495304; c=relaxed/simple;
	bh=HOKNNnybr8vVI+CenbuRHSy81M/wqIhPpxRQv9NWUoY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=t9iYNj7e/G/3n2NQUj0/dTTAWYfX7QcDZY/bOudVu+jqUKI9KiFeyGjJkCwr6WfGGoWlNuCs2gjCAQHv5FKqi59qWQDy6Cbat0OC2b/MbX6xq6Wn5OSLTgq5Nlx2VLAldsEI4mPr/6jHpOKJrF/2LFWNkjyA50h4w9PdubJqMTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d9kiV361; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D71DFC4AF0A;
	Thu,  1 Aug 2024 06:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722495304;
	bh=HOKNNnybr8vVI+CenbuRHSy81M/wqIhPpxRQv9NWUoY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=d9kiV361GzPZKR5XC0GAwJInrK5PlMk4VKb6GpKn61lZtw/FdY8aVZZVg+i7zk+O8
	 KOo1FJZwsDy1cXt1znBqm6pqjlYnQ9dRsEaJy9S1KzxxMkU/AXpoX5Uw/dxVcUnTVn
	 YT554rTNpJvU/kg8JRJpSOSe0kLJPvAbSe0nppGwdEPWNLyaSn/VuOK8R+ePvZxdm2
	 9z97fPncxIhLi9IHPotLj80NaatGpOF/eOmTxZ6b2ubG5oJUyKFfIc4gNlckpxYnvC
	 2+AUmGvn0fiDTyIOFjtsUxo3xBRjmIqssK63kzus/in1zrLVEhv/xldS8pAlTwMXZp
	 D2HxiqXgiIExg==
From: Vinod Koul <vkoul@kernel.org>
To: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Rayyan Ansari <rayyan.ansari@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org, Rob Herring <robh@kernel.org>
In-Reply-To: <20240715130854.53501-1-rayyan.ansari@linaro.org>
References: <20240715130854.53501-1-rayyan.ansari@linaro.org>
Subject: Re: [PATCH 0/2] Convert Qualcomm SATA PHY bindings to dtschema
Message-Id: <172249530042.256913.13518178288820179470.b4-ty@kernel.org>
Date: Thu, 01 Aug 2024 12:25:00 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Mon, 15 Jul 2024 14:01:05 +0100, Rayyan Ansari wrote:
> The following patches:
> - Convert the old apq8064 and ipq806x text bindings, to a new unified
>   qcom,sata-phy binding in yaml.
> - Remove reg-names from the SATA PHY node in apq8064.dtsi to conform to
>   the bindings
> 
> Thanks,
> Rayyan
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: phy: qcom,sata-phy: convert to dtschema
      commit: 4bf8b462f84dd81c5938341a5468c3b669dbb1af
[2/2] ARM: dts: qcom: apq8064: drop reg-names on sata-phy node
      (no commit info)

Best regards,
-- 
Vinod Koul <vkoul@kernel.org>


