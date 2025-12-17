Return-Path: <linux-arm-msm+bounces-85601-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC83CC9BFB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 23:59:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C3FDD3020DF7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 22:59:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AA64330338;
	Wed, 17 Dec 2025 22:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T7mE5Dea"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E609155C82;
	Wed, 17 Dec 2025 22:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766012374; cv=none; b=AoZg/2lwFcyhIydKaNDZpxjsckhVqkrOioJbLkEmxeDpXsM0HYKutIlm1OMmz+FnyGHuZ6qKV5P6+fTOVjO8bjaERC18fCApXFnuPqjH1ds8pg7k+bs9j9OvrToIWkg3hBIaLjsOzMvw1zkw3U3Gp+tfSZ3hPgk3L3OR2uulAjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766012374; c=relaxed/simple;
	bh=gxKD86vCYqVB9qu1hsvUUHYg9TwFu68CpTRHZf5NsTc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ogj1ybo28KLcmbcdf6LgKK7RMmwSZQWOTn7xpv9eMlcXXV6lt6fKZCs1+K4ngNcQjpmCS61TV7P3zDyjxEdfbfrMLpLuoiMXzLCD6gc1QRDPo9IbayJvm1Rz6rILIA/aAgGxB047u5gHDVavnwYnhPn3K3oAMh17URWXrgsMT/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T7mE5Dea; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D1D6C113D0;
	Wed, 17 Dec 2025 22:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766012374;
	bh=gxKD86vCYqVB9qu1hsvUUHYg9TwFu68CpTRHZf5NsTc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=T7mE5DeaNTdS1nvSdU3EA2szh6vYo0Cse/TAATlBxRVhbkSikI9VxL5YOhWi91G2u
	 cu0psOD8SouPuN9kRDw99Z/sFOgB8lwH28DlLwrCIul3rLblw1PsrgROgSxsTo3yre
	 pb3XsrH3Y2G/oop0MKVxZTR+UVsSx3CTQjho0DGxpMvv3O9hmcL6QIWOgNWy7vG50y
	 FoMmXg9u0knK/kEvnYHzs16vJ9JcYtAGvF/ovqPg+jIZlTkZrksDA/pV7n6t1tv8RL
	 +YtQgrz5JpS+y02Z58w0Oc+CnEQg4NR7hLMG/aAzRiyH0krReq2o0PkwbDvJIAq0Tu
	 W0/L8CnMrxv7Q==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Conor Dooley <conor@kernel.org>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	rajendra.nayak@oss.qualcomm.com,
	sibi.sankar@oss.qualcomm.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 0/2] soc: qcom: llcc: Add support for Glymur SoC
Date: Wed, 17 Dec 2025 17:07:36 -0600
Message-ID: <176601285471.201175.3617092991903531436.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251211-glymur_llcc_enablement-v3-0-43457b354b0d@oss.qualcomm.com>
References: <20251211-glymur_llcc_enablement-v3-0-43457b354b0d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 11 Dec 2025 14:32:34 +0530, Pankaj Patil wrote:
> Glymur SoC uses the Last Level Cache Controller (LLCC) as its
> system cache controller, update the device-tree bindings to allow
> maximum of 14 registers for llcc block since GLymur has 12 llcc base
> register regions and an additional AND, OR broadcast base register.
> Updated SCT configuration data in the LLCC driver.
> 
> Enabled additional use case IDs defined in
> include/linux/soc/qcom/llcc-qcom.h:
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: cache: qcom,llcc: Document Glymur LLCC block
      commit: bd0b8028ce5fbc7d9f5c2751c20661b0d8114e60
[2/2] soc: qcom: llcc-qcom: Add support for Glymur
      commit: 0418592550c6a370b2b8a5cbebd53fb7dd63d837

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

