Return-Path: <linux-arm-msm+bounces-69350-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ECFDBB27D15
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Aug 2025 11:28:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F33F7164408
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Aug 2025 09:25:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC0EA2C158C;
	Fri, 15 Aug 2025 09:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RuS4jZ2k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 449572BE7AC;
	Fri, 15 Aug 2025 09:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755249900; cv=none; b=qxRdrxCylSDeY6E6RTv17iMRwxIq+LISsEHi0at35OFVbfQnkKPNYwXr6ojvfaexQy/VGh3xqfwgSZsPo9rbhNN//DBlX242tn0D2nPYuuJYs87D90dQLyn7qOE4FIZ6ucwq64Q2XwZkYcYPmCeBmHqkGHnEhGweMe1r9dQBDbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755249900; c=relaxed/simple;
	bh=5ZqmMV9CCC6/bZI3rO9zYxuPxQkdI54URe8G0jkHA6w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sKKS+HaHv4XetmeBm+gXAOYA2fBUgLCZhepVgFASRXrudkJIh6ZLFPtzTUhPbkEz7YMxTX5CFUd3Dprc4sZW+mpduEgCxGf1XZ3oIqUaS68eHZSGQ4cSz3RU+K3Cql+67W62AZtkUA8nc/q1F6rLRPc9641i4dWLMxd7d8ELezU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RuS4jZ2k; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-b471aaa085aso862534a12.0;
        Fri, 15 Aug 2025 02:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755249898; x=1755854698; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sUSAZNhHUWclOgiLa/zpd5x9MShtdm5IEGFME8YQ2lA=;
        b=RuS4jZ2kn6TRdDDFSlvfVpXC8HwzVeFqBylXyDmhX7K458+j++FWgSQTcNlsh9N5v4
         yw5WYLG6yqKG842tWACEJE5NDi+sPZIgmm9tcS8xiBBXN+tF+6kUjGCJmrvh/lqqcl2c
         MXCHMlnbaJwGGcL58uFjNoVaRN15EILffD35kqnk8co68IIRmGyrXr9ar4xi8AFjwyf1
         Cg11mEAj1wkG6p9pArgVaAaUSLYTA70FWPrB8T7SgrKHu5c4GwFCXd1LOw3VyS0PwS8m
         9j+5WY5fDGKzncJnMTv0wfLxqD+xyeRdbk4aAXsiFhTBQbVA8RwPIUXTldLJHPgFbObY
         VHzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755249898; x=1755854698;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sUSAZNhHUWclOgiLa/zpd5x9MShtdm5IEGFME8YQ2lA=;
        b=WJhznp9a5FEgwEpstNySA42jkGglLapHqsDPcUsz9AaIhFNapBkM1gBX/Od+i3ff59
         D3ekBaqfDdRWWv6JUq+h0y7OcQRmjFGbJaK0K0yah4PORNwvtLRjVSnroD8oNV94HcBW
         Y0/R8INVMQu86yO2Geu924j0r6HzVO5XuUjd0JdQF5oFzlHnYNe4YRiylRztqYzoZejh
         /QbmbU7SUzM+g7s44EYaIloJRjP/1t5Y+W2eNXbn7t+R5uh2SWljuZYjS+8sultqtC1B
         6haHw6ZdFRuP8MfarNWmdJJYgNFwb0ovPrVSez+UfeYXxk3iow4u57Ri7hEM0+DC5smV
         yDdQ==
X-Forwarded-Encrypted: i=1; AJvYcCUzb+hLGCD3oOzLEeVmorczXdoiTJ2Z5MC7OwledDsdyj3vzIplv0pjBB0FSNEKoW0s9BZh4+Jl34Yi@vger.kernel.org, AJvYcCXRB56px6NIxA049vg7aV1dR4VoQWo3EMzovPfH4MuekKWcm+ldVkrvr4xB+9L20c77eGEC58ZqJZU/rGJD@vger.kernel.org, AJvYcCXnkw2fP/rdJ8EMfmN8A+dCkj3std0iky2XfCEc+NYeZOhFZs8vE+79kD79JGZqJeIUxxJhO62SoRawWMHC0A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyWeAg23W3GMYAM2WrmSaPPW2mowYqBAXvnL+m6M3t44HqTSSy9
	RzJPfQx2Zv4YN2s72h8tFsCOvMG+SX3c2TTc2NaImLZ8wFCz/oWI5c1NQCiXGLewkBgAld3Ym0w
	1UNK5r9akHBxoByt6cYiM0ZKSrGDSA2h6IZ0=
X-Gm-Gg: ASbGnct9jBfpyR6bWG4ERThCNWcJr3xjyEtPlOKGauKRyW3f/KO2yoHuXw4p0pXhYsr
	Z7LWSOwaocIBPe/EZHeNWSpHVl9P/YZEjS7wi/S2DRu89nYgUidHercyfvyJTHN6j/V8ZbTGHuM
	jD1mxnX3TEOsg/euWxf+wmSoZ+TD4wNQ2zM6AAdz7XKZxQ3ywkOnz1GQsUzCHWMryRZMpogLe0M
	TESR4Q=
X-Google-Smtp-Source: AGHT+IEtIRl1Vmpdfezvm3nW6eekbTQL/dTTqJFffwLW5S5TL7I5ybUYEQz+8BAYTsvLPauEJlFEY2im3hYLZOTmd4Q=
X-Received: by 2002:a17:90b:4a4c:b0:31c:39c2:b027 with SMTP id
 98e67ed59e1d1-323402f3979mr2271688a91.7.1755249898151; Fri, 15 Aug 2025
 02:24:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250814-x1e80100-add-edp-hpd-v1-0-a52804db53f6@linaro.org> <20250814-x1e80100-add-edp-hpd-v1-5-a52804db53f6@linaro.org>
In-Reply-To: <20250814-x1e80100-add-edp-hpd-v1-5-a52804db53f6@linaro.org>
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Date: Fri, 15 Aug 2025 11:24:47 +0200
X-Gm-Features: Ac12FXxXs1WIPSo3O5Qi1vZHZmRPsh7Ak--HK5Z6ELk4txLVxHj367p-QxOdBkA
Message-ID: <CAMcHhXr2ayhVAS8gwxj2+ixq2GhSPBPdxB3swOUisstHGxufYQ@mail.gmail.com>
Subject: Re: [PATCH 5/9] arm64: dts: qcom: x1e80100-dell-xps13-9345: Add
 missing pinctrl for eDP HPD
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Abel Vesa <abel.vesa@linaro.org>, Xilin Wu <wuxilin123@gmail.com>, 
	Jens Glathe <jens.glathe@oldschoolsolutions.biz>, Srinivas Kandagatla <srini@kernel.org>, 
	Sibi Sankar <quic_sibis@quicinc.com>, Rajendra Nayak <quic_rjendra@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, 
	Christopher Obbard <christopher.obbard@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 14 Aug 2025 at 15:30, Stephan Gerhold
<stephan.gerhold@linaro.org> wrote:
>
> At the moment, we indirectly rely on the boot firmware to set up the
> pinctrl for the eDP HPD line coming from the internal display. If the boot
> firmware does not configure the display (e.g. because a different display
> is selected for output in the UEFI settings), then the display fails to
> come up and there are several errors in the kernel log:
>
>  [drm:dpu_encoder_phys_vid_wait_for_commit_done:544] [dpu error]vblank timeout: 80020041
>  [drm:dpu_kms_wait_for_commit_done:524] [dpu error]wait for commit done returned -110
>  [drm:dpu_encoder_frame_done_timeout:2715] [dpu error]enc40 frame done timeout
>  ...
>
> Fix this by adding the missing pinctrl for gpio119 (func1/edp0_hot and
> bias-disable according to the ACPI DSDT).
>
> Fixes: f5b788d0e8cd ("arm64: dts: qcom: Add support for X1-based Dell XPS 13 9345")
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>

Tested-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>    # 3K OLED
Reviewed-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>

> ---
>  arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts b/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
> index 6b27067f0be66b5c41fa681ff3b4f535100bdf59..6cb98197eb9c0d6e171741aa83e7f4ff77e911c9 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
> +++ b/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
> @@ -900,6 +900,9 @@ &mdss_dp1_out {
>  &mdss_dp3 {
>         /delete-property/ #sound-dai-cells;
>
> +       pinctrl-0 = <&edp_hpd_default>;
> +       pinctrl-names = "default";
> +
>         status = "okay";
>
>         aux-bus {
> @@ -1080,6 +1083,12 @@ edp_bl_en: edp-bl-en-state {
>                 bias-disable;
>         };
>
> +       edp_hpd_default: edp-hpd-default-state {
> +               pins = "gpio119";
> +               function = "edp0_hot";
> +               bias-disable;
> +       };
> +
>         edp_reg_en: edp-reg-en-state {
>                 pins = "gpio70";
>                 function = "gpio";
>
> --
> 2.50.1
>

