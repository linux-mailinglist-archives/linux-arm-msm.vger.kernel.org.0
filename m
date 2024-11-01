Return-Path: <linux-arm-msm+bounces-36766-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC4B9B94CB
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 16:56:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6BFCB1C20DF3
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 15:56:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEB1B1C876F;
	Fri,  1 Nov 2024 15:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eKVNy96u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0AED1C82F1;
	Fri,  1 Nov 2024 15:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730476569; cv=none; b=tuRe6VPhVvgI9oqasfNR4SGBJZAfKdyU6rmN+7vE+2uEci3eB3Gse9ZAoewLPIEYQeb19uq+P/93evfalNAr5bKgcQbszoCqzfaoZW+bJG0EqhVD6cIpO1B3FwhYYbpq9g6gOBnGK1RpmafrmHIRlnVUqXQHZzXEKiLZ89OADwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730476569; c=relaxed/simple;
	bh=t7oKgsETFr273A7RvyL2X1/OppxzBtZym5X35T8L0bQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=lHWYyz59QFCPYB5Ule4xLNsOSro6TnuLdYMaa2dBUwSJHJrso90ePtqRqF7iCKdzs6hRAxeucRp7mTrzYa4+3z6I1ODRdI0zA6nmtScT+Wqhh/r5o5mMtmE7SD/+Cq3H5C3SHCtO1mphp4kA9piKpYpVfzh2jE2/Ueknyac1gYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eKVNy96u; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 242E9C4CECD;
	Fri,  1 Nov 2024 15:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730476569;
	bh=t7oKgsETFr273A7RvyL2X1/OppxzBtZym5X35T8L0bQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=eKVNy96uvXS9yt+HWB4rdfmMIzi7wfVwXUFOcitPN03t+l3CHWWkCIrZjHEvHtCIb
	 E0SErly6kNO7WGiCvO0Y9IcW4O0V+KzE+3HfzUWTamCLp3++wiyVCdPcjSbjD3TplH
	 9LipYT+lDyr8CvjgUr7DP2YR8HB3ZPYYCiu4w/ZcBOamrsECZadRdv2PhNft5+tUTR
	 Hd93CsC8cSHlGjSazxMb/f3P0SoUcYO4FdoFR+sgB7U2X0PS8V6yimtTDbYkH6vy33
	 TLNu3c29FKuZNEmyEz/YOl3b5VLKPaJJSqO7dUAfnJ2NC2A+UrCiHqDF3qyqDRLQZa
	 eSZlgUGw8LDbw==
From: Lee Jones <lee@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
 =?utf-8?q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?= <nfraprado@collabora.com>, 
 Stephen Boyd <sboyd@kernel.org>, Trilok Soni <quic_tsoni@quicinc.com>, 
 Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>, 
 Melody Olvera <quic_molvera@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Jishnu Prakash <quic_jprakash@quicinc.com>
In-Reply-To: <20241021232114.2636083-3-quic_molvera@quicinc.com>
References: <20241021232114.2636083-1-quic_molvera@quicinc.com>
 <20241021232114.2636083-3-quic_molvera@quicinc.com>
Subject: Re: (subset) [PATCH 2/5] dt-bindings: mfd: qcom,spmi-pmic:
 Document PMICs added in SM8750
Message-Id: <173047656485.1921130.11574000081112709760.b4-ty@kernel.org>
Date: Fri, 01 Nov 2024 15:56:04 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Mon, 21 Oct 2024 16:21:11 -0700, Melody Olvera wrote:
> Document compatibles for the added pmd8028 and pmih0108 SPMI PMICs.
> 
> 

Applied, thanks!

[2/5] dt-bindings: mfd: qcom,spmi-pmic: Document PMICs added in SM8750
      commit: 42e34f8446252a3dde70822d7e6f8d7d86ec20f4

--
Lee Jones [李琼斯]


