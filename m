Return-Path: <linux-arm-msm+bounces-5116-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C16E18160F6
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 Dec 2023 18:27:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7D4D428134F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 Dec 2023 17:27:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E4404F887;
	Sun, 17 Dec 2023 17:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jjKzNxEy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B8144F881;
	Sun, 17 Dec 2023 17:22:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F82FC433C8;
	Sun, 17 Dec 2023 17:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702833720;
	bh=eFR6pspOochqCLKIzFiWFwUUtDUsO3tZe1Zo9k2kWIo=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=jjKzNxEyOgpa7/5b0x7IJmdmxwkAJsE4t+cIIcQ6vKgXYXx7UyrQ0GQC6/H78/E4y
	 w1L9tBXBNpYao6z0Yy716gSO++cZn3IsB0yDcARiwmg6GpFXF7MRjQ0BJ6L82uMHIr
	 kqSQSykIakdmAkdYsYX4uc4PtMsrck0/SQCi9Xpa0PnXG1kvmIpvUPhb9bnseWHoHg
	 EC+0TLD9QdoQrNRzkYnOpaGnVQQwFj99miu4K5Pr1P4DBLNek6UnzqjwCo8ikrlMie
	 ydiWdSZ6hdcNrTw9344ezvw8OUSSeedoIY86b6zZ5ZA9pjHEg4xlLY5Rkn6uMf+1PI
	 Qek08n+HMKfuA==
From: Bjorn Andersson <andersson@kernel.org>
To: Andy Gross <agross@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] arm64: dts: qcom: sm8550: add missing two RX Soundwire ports in configuration
Date: Sun, 17 Dec 2023 11:21:14 -0600
Message-ID: <170283349427.66089.5011786714636316659.b4-ty@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231212185415.228003-1-krzysztof.kozlowski@linaro.org>
References: <20231212185415.228003-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 12 Dec 2023 19:54:15 +0100, Krzysztof Kozlowski wrote:
> The Qualcomm SM8550 RX Soundwire port configuration was taken from
> downstream sources ("rx_frame_params_default"), but without two ports.
> Correct the DTS, even though no practical impact was observed.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: sm8550: add missing two RX Soundwire ports in configuration
      commit: cf58c96c4f82cb09556e20a48ef93bdadf05b705

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

