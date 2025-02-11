Return-Path: <linux-arm-msm+bounces-47528-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 96E8BA3066F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 09:54:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3975B3A066D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 08:54:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 763CA1F0E33;
	Tue, 11 Feb 2025 08:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P5lFMvTe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A5A21F03EC;
	Tue, 11 Feb 2025 08:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739264061; cv=none; b=GgX8RmltxmqXWyXCHDpZGOYBHU5oG+TUA3+DXoQ9t9TrmniQHxr++1b3Zvlg/lHUBoy+7a5pwzKgDKD8gETp1niwwJS0h1PZ9ZSZlSHdE5kgOOVDmCIZlb9w0KXBnHJOBQM/J4B73LYE8fyBJtVb5WfJgH7UwMQyOhkU39Ij9as=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739264061; c=relaxed/simple;
	bh=/dRLsDYS1EDSH23L/y6b3V/T8AFWJp0V0qlJ6R6eBRg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h2zAa+U9aHOU6Uq645dqhe0dJoKreCyKUHlIhXpQHss8ZWv41Xs5CklxelZYqfFPJ3Gf+eS9d9DLDNDLYupFW4ij3H8GQiJW3pkmf5CHR4SSiJfYSIsUJO8svr2xUUX9lY3pmMy1N2VW4+uQ1UO30APhSWAV/r1cM98FziGf1RU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P5lFMvTe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF412C4CEDD;
	Tue, 11 Feb 2025 08:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739264060;
	bh=/dRLsDYS1EDSH23L/y6b3V/T8AFWJp0V0qlJ6R6eBRg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P5lFMvTeUJpX6TftMGJtnKy2l37/8p3+9fpmrkGifcV74pJklpnLVbLnNH1QO3WfQ
	 skP31RjAbWndfWgbUYbwh7XpnSwOBBaAixbbyaPyDYyveyUdojEhYYoOGHAhxErUER
	 cLUtFZZw3h4mJoAzVuzI0QMbqM1tnkYG8LMsUwhzHPizM43qlTdfHAYWXAV8TPWDUM
	 oiaqCg/DLgPFvtBemQgI7HzIWPw36HfKTLiX+fO8AiexdiBxP1IagAVNKszkKrQb9a
	 dZktFZtrzKCIjI926Jpq5e9ww4p+1eOITyimn0CjRtTxb5ruqx5ji5Z++PhKt/Lr0c
	 z2ddW6JZ/Cp5A==
Date: Tue, 11 Feb 2025 09:54:17 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 2/4] dt-bindings: display: qcom,sm8650-mdss:
 explicitly document mdp0-mem and cpu-cfg interconnect paths
Message-ID: <20250211-rainbow-dazzling-herring-2f08a0@krzk-bin>
References: <20250210-topic-sm8x50-mdss-interconnect-bindings-fix-v3-0-54c96a9d2b7f@linaro.org>
 <20250210-topic-sm8x50-mdss-interconnect-bindings-fix-v3-2-54c96a9d2b7f@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250210-topic-sm8x50-mdss-interconnect-bindings-fix-v3-2-54c96a9d2b7f@linaro.org>

On Mon, Feb 10, 2025 at 10:32:40AM +0100, Neil Armstrong wrote:
> The mdp1-mem is not supported on the SM8550 SoCs, and having maxItems=2
> makes the bindings not clear if mdp0-mem/mdp1-mem or mdp0-mem/cpu-cfg
> is required, so explicitly document the mdp0-mem/cpu-cfg interconnect
> paths and complete the example with the missing interconnect paths.
> 
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  .../devicetree/bindings/display/msm/qcom,sm8650-mdss.yaml   | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


