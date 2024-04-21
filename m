Return-Path: <linux-arm-msm+bounces-18092-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AD5EE8AC1A9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Apr 2024 00:29:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 585731F20FB0
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Apr 2024 22:29:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FCAA45033;
	Sun, 21 Apr 2024 22:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UEV1kiFO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF2FC1BF20;
	Sun, 21 Apr 2024 22:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713738575; cv=none; b=t6VgKGzLbkG7pMDvRCL3xwks42ZhACiRkYTT2Frr3uGs2OfPstctBiGR/tp0gi4Tu8mzMxQVE5hU3QHhXv8/kZYtB4DQFH71b+sTpwYh9Z921rQUWEwIHjUKKgPm2fcv1uOQnsuSo3Ereg+F0VS1VYo0hK1BuemJnuqCg0RwKNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713738575; c=relaxed/simple;
	bh=REl89o4bv0R52EoKzu72ECL2XiehegiEytRsjAok3eY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=okaO+RkFkT9RPCTiE0oUfptQOCx00JcG//2gJ1urlQBmxtyEH9G27M4MsZfOVnQTP3FK489060JmdAlAkY4G4sO78ngcnlR+AnEx6mD+IKxaw+y5+iT/lmxrqr2bttQ6ivcPpEsrpS+qMVTyq6Fa0YjRi2rCKpQPS8cNvJYLGAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UEV1kiFO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3DAFC113CE;
	Sun, 21 Apr 2024 22:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713738574;
	bh=REl89o4bv0R52EoKzu72ECL2XiehegiEytRsjAok3eY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UEV1kiFOkYkgkgEAmcvWXuhJ1XrCyWQFW/6uzPJ9Uj4jmCxB0tKGI2c6zoYo2mA6r
	 YQ3R9jygQpH2FnBhg/CxOmiYFMgn89mtJvXYebmMuhHtgCO9L+7uucqimD8i1eBpyP
	 1+OuoOyHgmLVbR3iil5Ye3Jmf8RxkxG1+A/nhgjYDIoDgRlkKzyWUGuEeYEDNmkBUN
	 R0zfYa6k90cqIueyD+LlQioxgEka42icnDGRWFMudFpUEjfN3H4DlCrMfkOkS3mQD4
	 GlUc0/BdQydRHLPBPQEghMsSmQtk2l1jDRKTbvh+sfGrQW05ARrgvgZntKo9/vlp78
	 Hq+LBUM1PzD6g==
From: Bjorn Andersson <andersson@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Vivek Gautam <vivek.gautam@codeaurora.org>,
	Caleb Connolly <caleb.connolly@linaro.org>
Cc: Bjorn Andersson <quic_bjorande@quicinc.com>,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sdm845-db845c: make pcie0_3p3v_dual always-on
Date: Sun, 21 Apr 2024 17:29:08 -0500
Message-ID: <171373856770.1196479.13744120309670353975.b4-ty@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240320122515.3243711-1-caleb.connolly@linaro.org>
References: <20240320122515.3243711-1-caleb.connolly@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 20 Mar 2024 12:25:11 +0000, Caleb Connolly wrote:
> This regulator is responsible not just for the PCIe 3.3v rail, but also
> for 5v VBUS on the left USB port. There is currently no way to correctly
> model this dependency on the USB controller, as a result when the PCIe
> driver is not available (for example when in the initramfs) USB is
> non-functional.
> 
> Until support is added for modelling this property (likely by
> referencing it as a supply under a usb-connector node), let's just make
> it always on. We don't target any power constrained usecases and this
> regulator is required for USB to function correctly.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: sdm845-db845c: make pcie0_3p3v_dual always-on
      commit: d73ed58d7f2793df161d0afb66afab3d1b862945

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

