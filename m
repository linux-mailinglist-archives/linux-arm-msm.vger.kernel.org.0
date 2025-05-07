Return-Path: <linux-arm-msm+bounces-57181-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B97AAE6E0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 18:38:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 59BCE7B86D9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 16:37:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A79828C2A4;
	Wed,  7 May 2025 16:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="caAB/Uy5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4827028C011;
	Wed,  7 May 2025 16:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746635918; cv=none; b=uQDFuIaHO8tIwaulgEaoXc31xnNwNEUy1Xd89Ld7rvM0LE8B+dAsZNKBTSoOhAXzS4uLY2bPd0EUTx5mixrcUVuNMHHgy6YPlYutFRvyPQEe+kpWrCrPmV56HwS1RDabKuVgNW26wiiqPKdoBOGYQCKo+pnfbnl0wS/t+3MbZCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746635918; c=relaxed/simple;
	bh=ddKz4iSS3BTmMNyzSI8tEVvSwXxAmFwTGYZSvOK/5VM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ci9fOm20uamVpOX5cGlEKNzqXZKtn9uMZ/apoI5jSGmKmzuCRzgoexB6ZUoTQMAHpIqDdwmwM/I/sJoDrRVXhZYgwezAuhpfvz4xACwBtsGtyr1m5vI17zyD00QgikuhwvXP7lTnTuft6vgQ6BFbzGW7pEmcsPqdyJCv0682XfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=caAB/Uy5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3FBCC4CEE2;
	Wed,  7 May 2025 16:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746635917;
	bh=ddKz4iSS3BTmMNyzSI8tEVvSwXxAmFwTGYZSvOK/5VM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=caAB/Uy5V+RzeUk4eR9bwjUsOIRZAMxSVsioXynskqzCfKMovlIx/2ItvNUUFMujA
	 ApBP+tLs/Uvt8EfTJaxFJGBgdBekoqVgtoMvARe76yG6xAQLgp5w1ODNS2hzsSglxg
	 3LGZDAlI8mlbiHwr8pnFqRicup/qKUa3yTfnafRKukr/+tGE0frDkKzZ2KD7u3RHFG
	 Rmth+t9fcNc+RJhN+8QcjV2pztVgs065nQNxgZ1PXk1JHCGXYHug5fuLMy6muj/BnE
	 RCh+EOy+jM+b3pzFQahwzY0OzEVXy0aCOwsjBg7taF/6y1CNSm76wNmuLbFryPzj3v
	 I3EroYFZdSYkQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Qiang Yu <quic_qianyu@quicinc.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: x1e80100: Fix PCIe 3rd controller DBI size
Date: Wed,  7 May 2025 09:38:32 -0700
Message-ID: <174663591262.3531.5134996472032724831.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250422-x1e80100-dts-fix-pcie3-dbi-size-v1-1-c197701fd7e4@linaro.org>
References: <20250422-x1e80100-dts-fix-pcie3-dbi-size-v1-1-c197701fd7e4@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 22 Apr 2025 14:03:16 +0300, Abel Vesa wrote:
> According to documentation, the DBI range size is 0xf20. So fix it.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: x1e80100: Fix PCIe 3rd controller DBI size
      commit: 181faec4cc9d90dad0ec7f7c8124269c0ba2e107

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

