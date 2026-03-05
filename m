Return-Path: <linux-arm-msm+bounces-95519-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IEKEFCY1qWlH3AAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95519-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 08:47:50 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id F310A20CE0B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 08:47:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 79419304436D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2026 07:47:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A62B430B53A;
	Thu,  5 Mar 2026 07:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k40xIYTD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82A69237A4F;
	Thu,  5 Mar 2026 07:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772696839; cv=none; b=If37LCiARG7rYhhxsyrH+Y+jcnrYrdKCuZbdXRZp4uJOlou/v6dK74FtnhA1EcC0E5CIZnSYs2G8ulsbNsSsxfFozQ0Qv9CkM9tLzLPk4yhQCx56muMa76VgmheykBuCOHbCP8Ac4cvQtZKJ90DgqYWN7CnbioyVLIVxl+I1088=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772696839; c=relaxed/simple;
	bh=hYPUpGGfWIgUSWzkvuPzmqoLLcF45V3809LvSzE7F4Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gR+rTUM6i7cQUTajLJY3hpSP0ylHwGDHkp2GcSE8qUErXC6BLmYmQ4OEDaMa5t9FTQD4+0xK1mZZA0ewMeSWnNhrKNxDiAweqAe48IG92ykL5h6QDFb7rAO6AU82UrgyJ98WszhDBesVPs3nlaIAoMQyn/+oTxnz5SE871Zfar8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k40xIYTD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A178CC116C6;
	Thu,  5 Mar 2026 07:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772696839;
	bh=hYPUpGGfWIgUSWzkvuPzmqoLLcF45V3809LvSzE7F4Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k40xIYTDb+o4L/MskPRFgFk2kd3c8XA1sNUqDv5xEQR8SsDegaGvwjgzn9mrpS6+k
	 xPaSUMw7Z5qxNdMPa9YsVLvCwwZGlQRtimRv1qBPYRM0QsUl3VtZTkjBypLNPIO6xp
	 FAqLVSAkuTCqwDIOinW4Qq5GYqSYDvbAWziLRPYAmVMY+IrBpjoAI2xOYC/+EXLyxK
	 FXPq4fx7n2wK9v9uHaO8EDzvuADeEzW5mQjNEOWBEw8hD5M+Kvf9VcTekrkjCvwfHg
	 yguttWZKGmC78gh1xpBpqQldk3EyY8cP1tbi9KmBzEdnibYRm4XlMjmQbSsc7dHySk
	 W+iaobsojVMvQ==
Date: Thu, 5 Mar 2026 08:47:16 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jagadeesh Kona <quic_jkona@quicinc.com>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
	Rajendra Nayak <quic_rjendra@quicinc.com>, Stephan Gerhold <stephan.gerhold@linaro.org>, 
	Ajit Pandey <ajit.pandey@oss.qualcomm.com>, Imran Shaik <imran.shaik@oss.qualcomm.com>, 
	Taniya Das <taniya.das@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 1/7] dt-bindings: clock: qcom: Add X1P42100 video
 clock controller
Message-ID: <20260305-hairy-hidden-stoat-5c1429@quoll>
References: <20260304-purwa-videocc-camcc-v2-0-dbbd2d258bd6@oss.qualcomm.com>
 <20260304-purwa-videocc-camcc-v2-1-dbbd2d258bd6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260304-purwa-videocc-camcc-v2-1-dbbd2d258bd6@oss.qualcomm.com>
X-Rspamd-Queue-Id: F310A20CE0B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95519-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email]
X-Rspamd-Action: no action

On Wed, Mar 04, 2026 at 11:10:51PM +0530, Jagadeesh Kona wrote:
> X1P42100 video clock controller has most clocks same as SM8650,
> but it also has few additional clocks and resets. Extend the
> SM8650 video clock controller bindings to include these additional
> clocks and resets for X1P42100 platform.
> 
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml | 2 ++
>  include/dt-bindings/clock/qcom,sm8650-videocc.h                  | 6 ++++++
>  2 files changed, 8 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
> index e6beebd6a36ee1ce213a816f60df8a76fa5c44d6..e8bf3fcad3fabc4f3b7e8e692c6c634d1aed9605 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
> @@ -30,6 +30,7 @@ properties:
>        - qcom,sm8650-videocc
>        - qcom,sm8750-videocc
>        - qcom,x1e80100-videocc
> +      - qcom,x1p42100-videocc
>  
>    clocks:
>      items:
> @@ -67,6 +68,7 @@ allOf:
>                - qcom,sm8450-videocc
>                - qcom,sm8550-videocc
>                - qcom,sm8750-videocc
> +              - qcom,x1p42100-videocc
>      then:
>        required:
>          - required-opps
> diff --git a/include/dt-bindings/clock/qcom,sm8650-videocc.h b/include/dt-bindings/clock/qcom,sm8650-videocc.h
> index 4e3c2d87280fb9a37cbc52330e31b0710ab63144..ba2d231e9dc8718bdcc07f994577cf68413dc273 100644
> --- a/include/dt-bindings/clock/qcom,sm8650-videocc.h
> +++ b/include/dt-bindings/clock/qcom,sm8650-videocc.h
> @@ -16,8 +16,14 @@
>  #define VIDEO_CC_MVS1_SHIFT_CLK					14
>  #define VIDEO_CC_MVS1C_SHIFT_CLK				15
>  #define VIDEO_CC_XO_CLK_SRC					16
> +/* X1P42100 introduces below new clocks compared to SM8650 */

I don't understand why X1P42100 was added to SM8650. Last time I asked
you not to include other header, thus solution is to add full list of
clocks.

This is completely wrong because you do not have the same driver!

Best regards,
Krzysztof


