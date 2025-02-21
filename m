Return-Path: <linux-arm-msm+bounces-48827-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DF190A3EFE2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 10:20:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0A36A7A633D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 09:19:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6643201004;
	Fri, 21 Feb 2025 09:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ffyDNa++"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97644B67E;
	Fri, 21 Feb 2025 09:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740129619; cv=none; b=kkxTVEbvnjeNfRH/jCI5in1any4UY0IjpZVlZyCEQVf5fHXeGzmPmn2Mwn5GXaYDLzZejpq1NjcSiGv21pGX6IL5HEaM/tR1PmCDc9Cz7pqvfJGZ6cpcY5/7xpwYV+H2qd9RzybAn3dwNSMof5OpSfWK+LBdRuDdTxFGtLnGAj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740129619; c=relaxed/simple;
	bh=sMF0GfImDCqUxySHs2z5TP4zwlnmW0+egD/zqf04aj8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D81UKBRXc9B7BPGzYkaPVA4q9yn8WyS23Hk1Jklod6ukO8vyTSv65CYvsDftr75n8harUub04DakVaUfPt/X9YSn+ItFzOvXwQxr/+YwFQsIw6b4uDTQuuth62zFJhIZL1/oL7NEuQCfWmLcbjQdwbKW7HFfhIXQ+2jj+SdtrIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ffyDNa++; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C698C4CED6;
	Fri, 21 Feb 2025 09:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740129619;
	bh=sMF0GfImDCqUxySHs2z5TP4zwlnmW0+egD/zqf04aj8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ffyDNa++t+B0ITw+oVlS7LLrEjy1Yie/RYOPthHxRvosFXHg4CtPT35p+LQeGJkpa
	 aLUmJVr8o+AWop2cnMNyN1fRQxLU1eb0sXrVgLVT2B0Uacppj6LpGdxT5ZR41Farvq
	 TCXY6IxcjOaXFJ7tHrMk2yO2eooMnGHVuissvmAf2ldf9vK3/Xc1jmzEHJbipzTNBy
	 sfgSYRcHZNpC/TwM15ioN+R33OsUvlwmGZRA1hDXAW0n5JMlbiLflfSgTJwHaRcqDO
	 xGu5mtBPHhQZjUmpwCnkTNcJgZvKu3R1mv9fVymFVMtDpPYQmxaVj1cxy92iGb0O42
	 VzmYjseVnnvKw==
Date: Fri, 21 Feb 2025 10:20:16 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Taniya Das <quic_tdas@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Ajit Pandey <quic_ajipan@quicinc.com>, 
	Imran Shaik <quic_imrashai@quicinc.com>, Jagadeesh Kona <quic_jkona@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/4] dt-bindings: clock: qcom: Add compatible for
 QCM6490 boards
Message-ID: <20250221-rainbow-goldfish-of-masquerade-7d7627@krzk-bin>
References: <20250220-lpass_qcm6490_resets-v4-0-68dbed85c485@quicinc.com>
 <20250220-lpass_qcm6490_resets-v4-1-68dbed85c485@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250220-lpass_qcm6490_resets-v4-1-68dbed85c485@quicinc.com>

On Thu, Feb 20, 2025 at 09:52:50AM +0530, Taniya Das wrote:
> Add the new QCM6490 compatible to support the reset functionality for
> Low Power Audio subsystem.
> 
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> ---
>  Documentation/devicetree/bindings/clock/qcom,sc7280-lpasscorecc.yaml | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,sc7280-lpasscorecc.yaml b/Documentation/devicetree/bindings/clock/qcom,sc7280-lpasscorecc.yaml
> index 488d63959424088ede67835eb4dcf3feef6d0848..64efb2c533d1e71a9bdc3bf0d245b00cec00841a 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,sc7280-lpasscorecc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,sc7280-lpasscorecc.yaml
> @@ -20,6 +20,7 @@ description: |
>  properties:
>    compatible:
>      enum:
> +      - qcom,qcm6490-lpassaudiocc
>        - qcom,sc7280-lpassaoncc
>        - qcom,sc7280-lpassaudiocc
>        - qcom,sc7280-lpasscorecc
> @@ -68,7 +69,9 @@ allOf:
>        properties:
>          compatible:
>            contains:
> -            const: qcom,sc7280-lpassaudiocc
> +            enum:
> +              - qcom,sc7280-lpassaudiocc
> +              - qcom,qcm6490-lpassaudiocc

Alphabetical order... although now I question whether these are
compatible. Nothing in commit msg explains this, but it should.

Best regards,
Krzysztof


