Return-Path: <linux-arm-msm+bounces-20875-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CCA58D2A7F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 04:05:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 534BF1F22AFA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 02:05:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A682716729B;
	Wed, 29 May 2024 02:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ib7uO6F+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C9BF167295;
	Wed, 29 May 2024 02:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716948150; cv=none; b=T5xqt2QXHSfUttCdTuFNIQLVwDqYBb+J466DvHVtb/hX/8uiEk2Rquz2FmZGY5j1arLqnKcLh6i4Z455t+PeD+mcQx8o2ARXLsH87JN3QDpYDigekukx8Vpla3Y2SXQx4MOCivIetVEPO/K58Yp6zD84di/uhqReROFHbWyvock=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716948150; c=relaxed/simple;
	bh=biOKKQYS9v9p8+ysKrMGAHimtcsgoFjXX++HTfUtxms=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VZUDdwFScohl1oCQ6tiBzDg5zoNR5NSVKWZ+L53SDP1Q0kUe+95DWEkYO1bPjNEtrkEEnPsCo5VmbjNmJl/h8m8zj3O8SX2ZSYFeRoYUH/eUmdFF9c7xLa22AxPbZSn7Ej3b6EceBeECOELelZam3CR/fI/WiXvz3Ngz1irMU8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ib7uO6F+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88680C4AF08;
	Wed, 29 May 2024 02:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716948150;
	bh=biOKKQYS9v9p8+ysKrMGAHimtcsgoFjXX++HTfUtxms=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ib7uO6F+rSSDmS4kKfpxUYQc7mtN06Fmri0wid0gVr72HQMXcsIY/VsPyZlZ/UcMK
	 I8H0RaPgphujZV/Thrrr4yxIkwaDxSiJ2o60w49vrNQbEYvGouI7l39gnGY0a0Wmeb
	 Xjob+cxdZFPvHcUlK715Efx31yhmZ+kjY2oEASFQdH5e8SrY8niJ45loQ6kl7RCPtw
	 cTF0nHZtklxleOuOGzqZ4OQylTTolU8jh1jeMq/EsObviGu9q2P6epzcxyHsUp3SXD
	 DQfdEUSivAvZ1OQf4q9w8fqU5X7EYWHSRBOsAidSPRS6hSO6kTKULyPggxxD4lxjdp
	 qdtRZuAXdyCTw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"Rob Herring (Arm)" <robh@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Xilin Wu <wuxilin123@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: Split PMU nodes for heterogeneous CPUs
Date: Tue, 28 May 2024 21:02:03 -0500
Message-ID: <171694812072.574781.11187115177804451860.b4-ty@kernel.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240417204247.3216703-1-robh@kernel.org>
References: <20240417204247.3216703-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 17 Apr 2024 15:42:46 -0500, Rob Herring (Arm) wrote:
> Arm heterogeneous configurations should have separate PMU nodes for each
> CPU uarch as the uarch specific events can be different. The
> "arm,armv8-pmuv3" compatible is also intended for s/w models rather than
> specific uarch implementations.
> 
> All the kryo CPUs are missing PMU compatibles, so they can't be fixed.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: Split PMU nodes for heterogeneous CPUs
      commit: c8a346e408cb2e516472658ff191f13626d8571e

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

