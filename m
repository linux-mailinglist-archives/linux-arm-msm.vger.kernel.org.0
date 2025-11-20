Return-Path: <linux-arm-msm+bounces-82721-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 73230C7594B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 18:14:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sto.lore.kernel.org (Postfix) with ESMTPS id 0537628B11
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 17:14:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC0783A79A8;
	Thu, 20 Nov 2025 17:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SDwOSNBU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF8953A5E75;
	Thu, 20 Nov 2025 17:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763658714; cv=none; b=jZ5BnoPugcPxTNkQksG+iOpiyCfF+gqyLbPdJDuKGcMwAQs+tVaA2a4OK2dlZXJJvuuIDeGM330Q3ThxLY9mmvQdhahVq8iHuAknaXMZ5r4hwu7YiujsAz62DW1X1BzbQDZCXaeQ+aHJqpL0MW8Kvl1MazwbaQUgWHkw3qzX2bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763658714; c=relaxed/simple;
	bh=MlYGscgFhatbKZzft9OaJCGjeje2mrEArOpT1N63d5c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=adzsi6JBxKR5jouOPTysOBY5O6DOJV9ywozg2r+UPdKgilWu5K90jCvyJZfm15EyEPC0dqLVoL9o8PTNHG+4UqjDzMtdu1Hq/gaRwTa9QpNEZ4EoHpKHqF+YwzuUfMljdb6TdBtdmJYoCnnEkuHXmYe5j3n/OW7HZXionHTdVqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SDwOSNBU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 111D2C4CEF1;
	Thu, 20 Nov 2025 17:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763658714;
	bh=MlYGscgFhatbKZzft9OaJCGjeje2mrEArOpT1N63d5c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=SDwOSNBU9IBfujouk87w/12yWvX3k8aNdUDhVVOamXF1gxPDOT9pjGj5JMkPdHoIb
	 tES7liQqll2kykAqlNVR39uBwX7lcY2JlgOwHKSjDhUwNz/a66JYBf7K8L/qZtZ6Eg
	 mMGdb4Rzj+kFvVkB33/SC9iwfFNelbf6VUUsetrwPQyAcUc94GNP01alN4gxi03RVA
	 sH7T5JP7ULADiVlFj9O9KQVV7e/bbOqOPmg/2bZwvOplAdBRy26bVPGj70/Ap4yGCt
	 mQIaiNhTlMyUQitPR/eyB+DiuRLIGV92jeJaX4q7WoOz1Zwfik7uBLqw2WQQ9NY3qc
	 0W4wc1DacOUzA==
From: Vinod Koul <vkoul@kernel.org>
To: Kishon Vijay Abraham I <kishon@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Prudhvi Yarlagadda <quic_pyarlaga@quicinc.com>, 
 Wenbin Yao <wenbin.yao@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Manivannan Sadhasivam <mani@kernel.org>
In-Reply-To: <20251103-glymur-pcie-upstream-v6-0-18a5e0a538dc@oss.qualcomm.com>
References: <20251103-glymur-pcie-upstream-v6-0-18a5e0a538dc@oss.qualcomm.com>
Subject: Re: [PATCH v6 0/3] Add support for Glymur PCIe Gen5 x4
Message-Id: <176365871069.207696.4414338394387114477.b4-ty@kernel.org>
Date: Thu, 20 Nov 2025 22:41:50 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Mon, 03 Nov 2025 23:56:23 -0800, Qiang Yu wrote:
> Glymur is the next generation compute SoC of Qualcomm. This patch series
> aims to add support for the fourth, fifth and sixth PCIe instance on it.
> The fifth PCIe instance on Glymur has a Gen5 4-lane PHY and fourth, fifth
> and sixth PCIe instance have a Gen5 2-lane PHY.
> 
> The device tree changes and whatever driver patches that are not part of
> this patch series will be posted separately after official announcement of
> the SOC.
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Document the Glymur QMP PCIe PHY
      commit: d877f881cec508a46f76dbed7c46ab78bc1c0d87
[2/3] phy: qcom-qmp: pcs: Add v8.50 register offsets
      commit: bc2ba6e3fb8a35cd83813be1bd4c5f066a401d8b
[3/3] phy: qcom: qmp-pcie: Add support for Glymur PCIe Gen5x4 PHY
      commit: 1797c6677ad6298ca463b6ee42245e19e9cc1206

Best regards,
-- 
~Vinod



