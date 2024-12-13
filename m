Return-Path: <linux-arm-msm+bounces-42025-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 467319F0D51
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 14:31:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BB13B161712
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 13:31:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F61D1E04B6;
	Fri, 13 Dec 2024 13:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="u4C0YhT8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDDB61AB6D8
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 13:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734096702; cv=none; b=pfpLfd/hQRoMjD2//c8Sd48GE8sZ0B6m6q22dci2j9o0r9ooG5jw2PF2WquzpWWrwwiR4sm0JAUPOZznyjme58/X4lOrwjeBRbRlxVeUj3rqQV2r/USEw2jS2nYBrqJEvxF+zb0AkFnTjq+RtCyA4OGxsZtC/xRTai0mxjffK2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734096702; c=relaxed/simple;
	bh=wu7UMBtCHOFAPZSsmL3zymqjUc8WPgPrgGKUYGXgx1k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Pff8w7T/MIWV5lPQ419ANqIjh7CSW3QInoyZDxOseDBocBM6ybA0y8jKrTCE02sOjJzGxRJPN3oObOGbkPpS5yj4SavQVpEBnrAi17ILox8pUiATxruTbASoJKWKrsqOrWJHbINJBuYaNK4dQT6DrrAsQ/n/NyTM0/jq6El6dqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=u4C0YhT8; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e3a1cfeb711so1168563276.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 05:31:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734096697; x=1734701497; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sfJqbpO8fzR7hotkw8WChASKcoelnmQh7lFNBgHegyc=;
        b=u4C0YhT8Og44DZ92w8Vut+7Ps+aDvtLjOgT0uTn8uBX3WxUxS6b3wZPkq+FX3LlFEG
         /sSJr1TNqGLyEiwTxoPAVjlsdFptbR28m/hUr6yPR5ljwhr9/LYOdxrmZHnpZJv349uP
         +8so/gp3ltclBBRMVHsxU9HNA+6+NfkRXUPKR46TLd46ye2at+o27+sVsg4m6kzIhnU1
         WBmaqVsZQbD/eEYB/8GiSVRObZuJP0eDjSYJS+zEn+YfSGmq8cAMCGoIzyhkmxgOG7Xm
         XdOXJqhe/we68N8IcPsg/UAKt0CpaE8OaXdgxJlQNID4t8Qje1m5wnWd41gxrFPax4in
         DWXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734096697; x=1734701497;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sfJqbpO8fzR7hotkw8WChASKcoelnmQh7lFNBgHegyc=;
        b=E4MsqdPElUNLi+LflqBmdba/H6CfdZdTdONT629NZu1yF7a1KRSRwQQPTxY6E555G4
         9VoZ3rSOXwH15gsE1aNol6SLaE2T9C6zF0fiQoYpuU7LsVO62wKhmD2+QuaOjzKT0AP8
         ueUgjxwIrhyCpHL67hG0Elo18rH6Hb+TtH8QSrQBiWPovEZNd0zjpRpTCg3ckaLqsFWX
         dw4b7lSB8nHdP/BWiJPb/UH8SNUqkq6pH4MlhptWhcreKOubHZLCEj9k+8tbNfs7nEt5
         tpxo+iWXpcO+lo0h7xcBNccmxCBHlcRtTj1/ANMe518lsT5+Rp+7idR59iXSql61lhXu
         CCcg==
X-Forwarded-Encrypted: i=1; AJvYcCXRwPWZRceGQ58RgeoRt1Ut5UmFemX16qOjoane21bvSYDK/VmxFsXnB0YveT7ATzReFWLJW+AU2zmvj8CP@vger.kernel.org
X-Gm-Message-State: AOJu0YyZw0l+W70OGlKkEp5nto7gKfqhSYYba/bd6xUc1U1cbCKs70C2
	zmTDzMfvpDnXOObLB+NbbeTeTNc4BS7m38RiG+wtsFYnbmSbwadrKXk8g0IrVHUTJ/ErMKimA+5
	GV/JxFUxp4zIru9epLkMI7bM47g3ValOVAceRRQ==
X-Gm-Gg: ASbGncvFuLS03OnZBcKjLlZ765HTdwq7XoGxGS3ntWbOMjCGy+L0N9zwtumXOm/5g0E
	SLfsLljBLGDZH6ndyixxpKv5X016FEbyaSO5w
X-Google-Smtp-Source: AGHT+IG2oQo9/pJojNxPge9b6BLy5vw+9wYfAvJ7mQMiGJU6v/4xK8PvgaXtkMMl3WrEhcVUtJlFxa3Ns2fJC50KKas=
X-Received: by 2002:a05:690c:6e13:b0:6ef:7fdb:7d41 with SMTP id
 00721157ae682-6f2798e0c42mr25633727b3.0.1734096696819; Fri, 13 Dec 2024
 05:31:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241213-qcs615-gpu-dt-v2-0-47f3b312b178@quicinc.com> <20241213-qcs615-gpu-dt-v2-4-47f3b312b178@quicinc.com>
In-Reply-To: <20241213-qcs615-gpu-dt-v2-4-47f3b312b178@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 13 Dec 2024 15:31:25 +0200
Message-ID: <CAA8EJpom2amWzH5QpXrPSdMKS6bB_8O4CU67OVNuEjkjA-wseA@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 4/4] arm64: dts: qcom: qcs615-ride: Enable
 Adreno 612 GPU
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Marijn Suijten <marijn.suijten@somainline.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jie Zhang <quic_jiezh@quicinc.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 13 Dec 2024 at 13:32, Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
>
> From: Jie Zhang <quic_jiezh@quicinc.com>
>
> Enable GPU for qcs615-ride platform and provide path for zap
> shader.
>
> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs615-ride.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> index ee6cab3924a6d71f29934a8debba3a832882abdd..860a0db1908cfe32a250b14aac14065923c5a575 100644
> --- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> @@ -202,6 +202,14 @@ &gcc {
>                  <&sleep_clk>;
>  };
>
> +&gpu {
> +       status = "okay";
> +};
> +
> +&gpu_zap_shader {
> +       firmware-name = "qcom/qcs615/a612_zap.mbn";

This brings up my usual question: should it be qcom/qcs615 (fine with
me) or qcom/sm6150 (maybe even better?)

> +};
> +
>  &qupv3_id_0 {
>         status = "okay";
>  };
>
> --
> 2.45.2
>


-- 
With best wishes
Dmitry

