Return-Path: <linux-arm-msm+bounces-89526-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B6DDD39123
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Jan 2026 22:37:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F2A83301671B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Jan 2026 21:37:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 432E02E2286;
	Sat, 17 Jan 2026 21:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FGk4o902"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DF2028A3F2;
	Sat, 17 Jan 2026 21:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768685852; cv=none; b=ctZi24mgcfFOQlz3XWCPYeT04+5hxKZWvTk2lKW46gXwWS+e/pAMrDy4UuvEbI95FRycyWCfhewxshHQZ/V1mdMMjiGjaxZxAzBIJxm/Mwyw3kqncMBQafPvYitq0LKyQyI06o2yxk6sf0FEN/KyTUpiph3RWJGzkqqveomMCB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768685852; c=relaxed/simple;
	bh=FBOMsX8+TSI+Tl+TIgoEzOJdBONRvBTbz3VBYPhgK5k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KHGnyNYMz4CxJ5MB6Rmrb+y1ysT89Y83bLGzCTQC7u6KhZzN2Bs9zHheSUce80W6XzLznuZhRgPRryqV6kYtv7Z0/sGVfmIS0AP+1aDeHCJSta6u0erdgBIbnDPFEXNYNlfiarV4rc+veOMTbOza858UEkevgR4/EPulGBbU0nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FGk4o902; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 913F6C4CEF7;
	Sat, 17 Jan 2026 21:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768685851;
	bh=FBOMsX8+TSI+Tl+TIgoEzOJdBONRvBTbz3VBYPhgK5k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FGk4o902JWEpr2omAWuVGo6iind/9V2et6Zy+I2Dmo6MRwEPlL1oJsoyCJLdUeh7i
	 F4K0mL69Dy0StdbXDdzJxEuFayWnHvyuyuDRQx/dy4Zfo/4b/dApM5Lw/9/tc8LwFQ
	 PNx5zZ6k8PPpzn5o5I2lTWsSU1NSDRSqxfwn4CLO/HAm/JuU3lz8ObDssIfEiZ6cke
	 yVMka/36EbTGIwyhcutHMG7ocungMv47sNdw6AAcYRYJ1zV229rgRtJl3HWVnTENAl
	 FxSlC0pueEwC4dZCqiYIInRs3hktOWZCgpemMmcqton3GEJJhFoxdScsmDuu+qC4vE
	 q05kIw2SGeAtQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Manivannan Sadhasivam <mani@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: aiqun.yu@oss.qualcomm.com,
	tingwei.zhang@oss.qualcomm.com,
	trilok.soni@oss.qualcomm.com,
	yijie.yang@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v3 0/3] mailbox: qcom-ipcc: Add dt-bindings and header files for Kaanapali and Glymur Platforms
Date: Sat, 17 Jan 2026 15:37:28 -0600
Message-ID: <176868583412.576069.2171800966105919659.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251031-knp-ipcc-v3-0-62ffb4168dff@oss.qualcomm.com>
References: <20251031-knp-ipcc-v3-0-62ffb4168dff@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 31 Oct 2025 00:41:43 -0700, Jingyi Wang wrote:
> Add dt-bindings and header files for the Inter-Processor Communication
> Controller on Kaanapali and Glymur platforms.
> 
> On earlier platforms, Inter Process Communication Controller (IPCC) used
> virtual client IDs and performed virtual-to-physical mapping in hardware,
> so the IDs defined in dt-bindings/mailbox/qcom-ipcc.h are common across
> platforms. Physical client IDs instead of virtual client IDs are used for
> qcom new platforms like Kaanapali and Glymur, which will be parsed by the
> devicetree and passed to hardware to use Physical client IDs directly,
> so header files are defined under dts.
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: mailbox: qcom: Add IPCC support for Kaanapali and Glymur Platforms
      commit: fc12767c19d49663b13ba2def6e4674df041c8a2

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

