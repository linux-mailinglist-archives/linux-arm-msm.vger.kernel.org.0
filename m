Return-Path: <linux-arm-msm+bounces-51482-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 020CAA61B8B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 21:04:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3D9B6882423
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 20:04:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D408420DD7B;
	Fri, 14 Mar 2025 20:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NoR7RFdz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAE6620DD54;
	Fri, 14 Mar 2025 20:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741982502; cv=none; b=qA9aI2bkfgG+VL47yIgwpSslkePatmM1WKp4DrKCxggCK7CN/e89TTfE/2e0zenjqtj/UzURdRd5qHDIRvO0O97ZAv3Dd60WDnlmyncZNsW5+Kv4SR+zF6VSGiHZLtlnz4oDTI02+suA8+Z0GGm8t3m7e+cW6Teu33UVVZroSGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741982502; c=relaxed/simple;
	bh=pHH/bB8hkrOSrOMTOSf6cRH8t8owc3eh+OWjm66sSfA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FG0Pe3zgWIIUue4Ihp9uErnqP5AvbJKQ0LQHySRAz2rhwf4xFrjVS8QOacv4S8N8kpY5e+h7CTJEQLyyKkaQgDjXo8qvFebdLlf5EnJIiE3kdKmyrf+ibv24C/O5hG94W5BF76ox3WX5faYgnFGoZ/MlvglaUusqqCiTlO2exlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NoR7RFdz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36B44C4CEE9;
	Fri, 14 Mar 2025 20:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741982502;
	bh=pHH/bB8hkrOSrOMTOSf6cRH8t8owc3eh+OWjm66sSfA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NoR7RFdz7R1SmxawQiVoaXAqm7V4mPzq6iA3i32/LZk50M4LJmAUISlVQuHYXNdeD
	 GZkJgIVHpqvxOzF9boMn3Fb5YWuy9EAAdbNt0dYzBD2V5ZeIxL2ppImGiXLjdLJRj9
	 GuRTKChz/2WoFnOGJ3RngZG6sds6b8j+ehscanWlaTNbm//EV5K83e04cvJ7eR0ytU
	 mtFTUdoYmJaEiCCIe8LlZd1UjnJg2L2LI4fo7cMGcHCcsg7b6gyJeVD0TaWPwpcisL
	 2lfk338UYcS//J2hGGPcwBzhzLTx7xldLDocD4Du2Dup3y2TNRh7sdfAbZzXi++yT/
	 GFDCbGtbC0vNg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Melody Olvera <quic_molvera@quicinc.com>,
	Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 0/4] arm64: dts: qcom: sm8750: Initial audio support (not yet complete)
Date: Fri, 14 Mar 2025 15:00:56 -0500
Message-ID: <174198247867.1604753.13284559552835031505.b4-ty@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250312-sm8750-audio-v3-0-40fbb3e53f95@linaro.org>
References: <20250312-sm8750-audio-v3-0-40fbb3e53f95@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 12 Mar 2025 13:44:44 +0100, Krzysztof Kozlowski wrote:
> Changes in v3:
> - Add Rb tags
> - Correct va-macro region size (0x1000->0x2000)
> - Link to v2: https://lore.kernel.org/r/20250220-sm8750-audio-v2-0-fbe243c4afc3@linaro.org
> 
> Changes in v2:
> - Use 0x0 to match rest of sm8750
> - Re-order some nodes to keep preferred order by unit address
> - Add Rb tags
> - Link to v1: https://lore.kernel.org/r/20241101-sm8750-audio-v1-0-730aec176459@linaro.org
> 
> [...]

Applied, thanks!

[1/4] arm64: dts: qcom: sm8750: Add IPCC, SMP2P, AOSS and ADSP
      commit: 8744dd90cd6b8ee105f5ade1ca9649451aff416a
[2/4] arm64: dts: qcom: sm8750: Add LPASS macro codecs and pinctrl
      commit: 0fe088574b30588e5fc437be376383b1372da49a
[3/4] arm64: dts: qcom: sm8750-mtp: Enable ADSP
      commit: 0c23fa8648871e6e74cb93ab7089c50f9bc20857
[4/4] arm64: dts: qcom: sm8750-qrd: Enable ADSP
      commit: 23d8b031f302a43408cf43002b6cb13e88e99a10

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

