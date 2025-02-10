Return-Path: <linux-arm-msm+bounces-47458-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40DE8A2F510
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 18:21:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7A927168852
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 17:21:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CE0D2566E4;
	Mon, 10 Feb 2025 17:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hatvvd7Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00C6224FC17;
	Mon, 10 Feb 2025 17:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739208076; cv=none; b=CBSbTST9nZmCBgAZa00f5vnllC//cC0NDoJn836DA4+28GXc0BUOW+K9blLx/XuQxViHHiP+KLIySyI3CYQY87Ls9A0RYn9aZUOkmRVqilGatij1yv8AxLLJjzNaHniUPh4o/zSDgJ8nPHzBPXOdW+pEvQtWZ3E8W9na3oVO4hE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739208076; c=relaxed/simple;
	bh=nZQV1M8VioPGk0QM/byl7cQeGIZPLm10q9X0KPkc0mM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=GqO3baF3pYLVC7mDaa6D9O3v8MSWcpuldJnuJPTJKdNtxjaGm8SCOPkL+hfURikTC1lkEmwxbopNFn7dWmrNSokgi48cttWtiOItCc6d7RC5j7mDBDaxx4fcmAtWRrFhKrQDKEsgciobyRUWL4qty6wQ555eoxAf8a/p6J3d1MM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hatvvd7Z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E1E7C4CED1;
	Mon, 10 Feb 2025 17:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739208075;
	bh=nZQV1M8VioPGk0QM/byl7cQeGIZPLm10q9X0KPkc0mM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=hatvvd7ZA2jhfAgyNWC5wYRlzenwFWVjyxBvHTFy1KqH8IKfKYI7eP+nEQM/l4aSW
	 0hAnr7YRdK739JQLX3pDLQ606IwOP20vzJu3+zg6rxMC08IubpXlFIpGIzDPg/OKoo
	 5WLrDSLBECYEPMrxn7hHGQJA9tC7bOBvLJid/NuMWC6j/wogokqTXXyukxBjgwbhNq
	 sxAhnDKvO5WArkXO3qF6ENLOquTMBG/5UGVATs4ne/Pcg/Mzugp0Ei6cl1g6pdDOUl
	 A726z1LofPT5jZuxR1J57FNm3MDTkI+yfwSJ3lrZoieLToD/thk4POXpKbUhZ9Knf9
	 QK98S8z0NA59g==
From: Vinod Koul <vkoul@kernel.org>
To: Kishon Vijay Abraham I <kishon@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>
In-Reply-To: <20250203-topic-x1p4_dts-v2-0-72cd4cdc767b@oss.qualcomm.com>
References: <20250203-topic-x1p4_dts-v2-0-72cd4cdc767b@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v2 0/6] X1P42100 DT and PCIe PHY bits
Message-Id: <173920807069.103786.582122226183842202.b4-ty@kernel.org>
Date: Mon, 10 Feb 2025 22:51:10 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Mon, 03 Feb 2025 15:43:19 +0100, Konrad Dybcio wrote:
> X1P42100 is a(n indirect) derivative of X1E80100 - the silicon is
> actually different and it's not a fused down part.
> 
> Introduce the DTS bits required to support it by mostly reusing the
> X1E SoC and CRD DTSIs. The most notable differences from our software
> PoV are a different GPU (support for which will be added later), 4
> less CPUs and some nuances in the PCIe hardware.
> 
> [...]

Applied, thanks!

[1/6] dt-bindings: phy: qcom,qmp-pcie: Add X1P42100 PCIe Gen4x4 PHY
      commit: 2e1ffd4c180591e6a46c7f94a6bb187a0661141e
[2/6] dt-bindings: phy: qcom,qmp-pcie: Drop reset number constraints
      commit: f67f8c61b7fd3f72cf716b3845211e69265d13bd
[3/6] phy: qcom: qmp-pcie: Add X1P42100 Gen4x4 PHY
      commit: 0d8db251dd15d2e284f5a6a53bc2b869f3eca711

Best regards,
-- 
~Vinod



