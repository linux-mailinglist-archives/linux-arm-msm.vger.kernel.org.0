Return-Path: <linux-arm-msm+bounces-35330-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D3529A988B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 07:35:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1EC9A1F241BE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 05:35:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3D6C14EC55;
	Tue, 22 Oct 2024 05:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SsIsfUVB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0E9A13F42F;
	Tue, 22 Oct 2024 05:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729575175; cv=none; b=GNA1fNBVWPN6Ki3GICQA6w9xr3Fycg88DMCICyAXapU+q/Xt7Do7mh+YjJsiROAJ8nOOYLvHu3UwZ8Bt0B3FnwszwCKUFhIqwV0qRznteJxlReTJpLZYQmfDksAbzUD1/ski6ObFHAraObz5PvPxp/Djgzw7uhwYyrctzkscmMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729575175; c=relaxed/simple;
	bh=eh5c4h3CkGCO/mZQgkwvM/qIDAYGPN9tRfVaEHgegAs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=NIOuhdacbS7n9HrAwtgZAgsZAnAR8VK+ABvbvKA1rIZPKW3clOwPxzx3Wsupy2Ze75OGQ59c1wmYx75eFPrT1Jez2NoRrF7svBxAhAAKh1pfTek8gUjW+HB9XDoAKqWfFcZaCkM7UFOFTgOB7Fz5Y30jWNuS5i7DfD/7BkjgGKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SsIsfUVB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E074C4CEC3;
	Tue, 22 Oct 2024 05:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729575175;
	bh=eh5c4h3CkGCO/mZQgkwvM/qIDAYGPN9tRfVaEHgegAs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=SsIsfUVB+2l3Nx+c5HhekukYSvbFt9KNQKkmpjgIisTuWv8fIZMtuLUVhWwYgX/0z
	 cFdK6lO17/JXUnO3gCEU/tBnP6zIvkM4vtM9Axpx9EbjYm6TTh6D0nIczLxpjwjq9R
	 5mKh1EKIkTCaY9InQnTBJGeqEU/jqMfil4VR5cYAfmyIlsY7Q3nXiXxhhfpgX8UEJc
	 7lrdeL25eo7cLo3YNCwR5mkY6eMmWpwUdd94RoxLloPDnM7pPGSs2nAatJVr13Xnad
	 EIR/b9DXI3gz+lxC22/j5MJT5LY7NknUemeQnDR5SeFuGg1+byIPaa0VYGzc0a7Lw+
	 GMIeoIbUZb4TA==
From: Vinod Koul <vkoul@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20241017-sar2130p-dma-v1-1-e6aa6789f116@linaro.org>
References: <20241017-sar2130p-dma-v1-1-e6aa6789f116@linaro.org>
Subject: Re: [PATCH] dt-bindings: dma: qcom,gpi: Add SAR2130P compatible
Message-Id: <172957517301.489113.3658561077139339207.b4-ty@kernel.org>
Date: Tue, 22 Oct 2024 11:02:53 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Thu, 17 Oct 2024 21:11:49 +0300, Dmitry Baryshkov wrote:
> Document compatible for GPI DMA controller on SAR2130P platform.
> 
> 

Applied, thanks!

[1/1] dt-bindings: dma: qcom,gpi: Add SAR2130P compatible
      commit: e7a614cc8847f469370ea29604be966ee16f07e9

Best regards,
-- 
~Vinod



