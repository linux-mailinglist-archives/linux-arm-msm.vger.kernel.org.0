Return-Path: <linux-arm-msm+bounces-3089-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 920558020C0
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Dec 2023 05:52:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 54477280F8B
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Dec 2023 04:52:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E1CD33CF;
	Sun,  3 Dec 2023 04:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SVEuysxr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F20A33CD;
	Sun,  3 Dec 2023 04:51:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 398D9C43395;
	Sun,  3 Dec 2023 04:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701579107;
	bh=qJSUaV7uPt3ao7shYX3IVV++wIps8Pf53md930UwnS0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SVEuysxrjwMEwe0uTlIvmSqvN1nwiHZGyrmrTNBR0Xsld7kkz4X/aDlVFK5/x4AXp
	 ngUsnBJEVtQRwjJFNreaNc0jBc6v8ULoGXBQWx+6DGHEn56Sf9BVCdz5ZDoXkU60MD
	 LwkAT3kA4YTbNDi4JgWgX4fv0uoeGirPDcigI13ZQZeV3Scu5RBU4mQVdq6W6RvOGL
	 aOBtknS2Pt0p7CL9PeTBhI+JsOeEpduqT/A5z46lhrrNYP6Cq8z9V1K8cPj3EM/Rmi
	 ANXke02CXUwqI5EsqwZa3LUnKPEztDJxmncqGPtBmzJ7/I1P9nV2JhYYqQDcZxzgQx
	 vBBIvrtJJE0+w==
From: Bjorn Andersson <andersson@kernel.org>
To: Andy Gross <agross@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: (subset) [PATCH 1/2] arm64: dts: qcom: sm8450: correct TX Soundwire clock
Date: Sat,  2 Dec 2023 20:54:36 -0800
Message-ID: <170157925836.1717511.2434506318908467858.b4-ty@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231129140537.161720-1-krzysztof.kozlowski@linaro.org>
References: <20231129140537.161720-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 29 Nov 2023 15:05:36 +0100, Krzysztof Kozlowski wrote:
> The TX Soundwire controller should take clock from TX macro codec, not
> VA macro codec clock, otherwise the clock stays disabled.  This looks
> like a copy-paste issue, because the SC8280xp code uses here correctly
> clock from TX macro.  The VA macro clock is already consumed by TX macro
> codec, thus it won't be disabled by this change.
> 
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: qcom: sm8450: correct TX Soundwire clock
      commit: 20e886590a310665244a354e3b693b881544edec
[2/2] arm64: dts: qcom: sm8550: correct TX Soundwire clock
      commit: ead0f132fc494b46fcd94788456f9b264fd631bb

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

