Return-Path: <linux-arm-msm+bounces-71451-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E46D9B3EEE1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 21:52:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8F2603B3DC0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 19:51:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BBAD26AA93;
	Mon,  1 Sep 2025 19:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ApM1DTnJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F61D25A321;
	Mon,  1 Sep 2025 19:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756756158; cv=none; b=nNyPCeR5Mj0O0/qLseS1qmAkGBRxjZXCNd6aFRhGpG2b15fPZmtJ8Wj35gXz5OyqpVYgVUmmPAtd6kn8XV1HX+0H5K2Sr53l9rWvrUyvE6Xxa4ES0GD7ZhvYNie4yWBstXGIk8EP6teqNC15FL95am93wJH2COTjviJw7SaGnnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756756158; c=relaxed/simple;
	bh=LQ2rLiIYSLPT5dxFbT7Mv57G07M7+SK4XQY6fCmF/48=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Oe5D42BJZ9Q4Q8oYFiUq8ihaHufMdzM7fDHzv+xQU1/mGJCkjwEW1L2VcvEb/JRjXAyf3WAtrfER+cX/UysKA89WY7Iss+ilxpTeGj1sivYc0eG+9vn1LI2PseCNl9lCGslESF4szJadzAAwyHhMrj9fWfiaViYo1ZVPBlhgLf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ApM1DTnJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44091C4CEF5;
	Mon,  1 Sep 2025 19:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756756157;
	bh=LQ2rLiIYSLPT5dxFbT7Mv57G07M7+SK4XQY6fCmF/48=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ApM1DTnJCqS5Chv875Nxi2fKPWnG3UqcdGHpGVV1COO64jJ7mIAp7CVoYwIXzcySO
	 ajGXw9qYWc3GeUI+SrrAIqcl57JzJuVI33TzMYcyAFbDJ4GgbKs1VB0h+cePGXrkhn
	 CyRnUY5Tj79mU653Up1uVBtozvOq9VQui8tJflTzGr241/DBVtvEcdVC1XD0RaJWYD
	 etnuSERMu+PTkrLV/FU8jxhVYoRHdZy77QglpHRcLt/LCWddUFKN1+k0SAD0iZ+UMT
	 p7UfyQRMgJyDlyzqKKvCKwWovwHebnEjaNvNr1ycZ48sNiXr7hjHpL/+mVlEU6AeqI
	 +csYJ24/En8xA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	cros-qcom-dts-watchers@chromium.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 00/15] arm64: dts: qcom: Fix interrupt-map dtc W=1 warning and cleanup
Date: Mon,  1 Sep 2025 14:49:13 -0500
Message-ID: <175675615150.1797303.12852911074797656177.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250822-dts-interrupt-address-cells-v1-0-d54d44b74460@linaro.org>
References: <20250822-dts-interrupt-address-cells-v1-0-d54d44b74460@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 22 Aug 2025 14:04:00 +0200, Krzysztof Kozlowski wrote:
> Get rid of one dtc W=1 warning and cleanup (verified with dtx_diff).
> 
> Best regards,
> Krzysztof
> 

Applied, thanks!

[11/15] ARM: dts: qcom: ipq4019: Add default GIC address cells
        commit: 7d75eda45690ce17a2935174a7ed370dfeeb48ef
[12/15] ARM: dts: qcom: apq8064: Add default GIC address cells
        commit: 1e54cf1f383adde02e49ccc9bb0cb9d3b0662a1e
[13/15] ARM: dts: qcom: ipq8064: Add default GIC address cells
        commit: 014a53ed24e33cc2cab112ad17df60d15ec97997
[14/15] ARM: dts: qcom: sdx55: Add default GIC address cells
        commit: 27cc4d100495faa0fa7272ef8fb9fc3e3abc4349
[15/15] ARM: dts: qcom: Use GIC_SPI for interrupt-map for readability
        commit: ba1045c76be299896528ac48021501fc9de78512

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

