Return-Path: <linux-arm-msm+bounces-12459-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5391F8627FA
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Feb 2024 23:34:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0E30C2822CE
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Feb 2024 22:34:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4B0E4DA09;
	Sat, 24 Feb 2024 22:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SFUX6wpq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 136264CE04
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Feb 2024 22:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708814088; cv=none; b=dNoBSuF7U2B73P1zSByocXzyu0i8nmzUyoVIe2VaVl5Wfm6iF0tNjPSvZvXM+MEmV0sIHxAsdv1LtpVvKr4yWySTWBC8pEXcThHV36WiTP/CzotdfklLxJVODMTWkNILBQJGBfD8UuNwyhPosZzUKYuhgUGReu3K7HAXQhTBgIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708814088; c=relaxed/simple;
	bh=eulGHgL6SA7y7GwoqKwqLFCs+wque3qqAtEd/9jIavI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZFfjOrpMZiLIwg/XmkRg76rA6nn0G9OxQHCHS6mntrN0xjX7Jh3Cd61uc9a3ybR2l7djlKzLnUfIv0HISvdtvRcvJCTE+7mwsXIgf/GiMw0kTlwY01AmftTC5B/5zM35goffEFMX9+jTaLn3kXpHhZWisUWtUzsKBHwqmMH6vUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SFUX6wpq; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6089b64f4eeso19307877b3.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Feb 2024 14:34:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708814086; x=1709418886; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fSWAzifwmBABORc4RLjDBXc5wdSEcZlyZ0ioROWY0qc=;
        b=SFUX6wpqAPCSrbTryE7iUsXUBgaOrQ2fcKq//h465qYsvEUVFZpPH28XevuOxzkmxq
         Wu1R7KcKZHiOgTjvvhgM4/Q1yn2pueQDl7y1q9lW+DzwAr5dXDOFINu9u9MOAPEVfEce
         ye4IuPqcphUwQsAAvSX59A+Ua7O3tO4HVxeZAKf116mVYl17mbxAkPTgYv8T8bsXi04T
         Y/Q4mL6paqMFhQDjjI+QVFJgRo87l0xOHJ8ULNY9zsRIMZlf24OwnkVsuqom7UEJ8M6I
         XJ/H4bXccMgCqjQywnC8CxIMS+nFxfcTAtSOKXY7p4wuGtOnBKtSqCukwpsMavNcybCS
         fLew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708814086; x=1709418886;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fSWAzifwmBABORc4RLjDBXc5wdSEcZlyZ0ioROWY0qc=;
        b=cuTWOSlZoLvQVz/evCnX+5TQYTGTuMUQlJ9HnWP5I/JVaZttud8d5osl3htR7UlOwd
         CVf0YcV4udgIxENQkkf4rLfJCC8YGvGuVoLf0OILUxU8VJFPN2DmiC8r5/h1P1CxUrA1
         t7gX6xUyvpUn2N8q45H7X/bCoP5qGjEuUYjNalOWE4quC9+HLf7Ys8u7UgmUVRDG3GXQ
         V8cZDSP5E+c5v5DPSrXKN4eNqvP2BIaakt7ev14a2PISBQa3FmCe6Xjwbu0UNBdpBGEH
         +NgYFE4E2zJKXPRV2YPngWClUwyxStP5/uUAvBcvRl/zCJugwORl1yMaePTRa86guIGv
         wbYw==
X-Forwarded-Encrypted: i=1; AJvYcCXv/zKBa5Mp8OXkFhanEl51uc3YQMgt1BnsADw83ixzqmKoTL0w9MpFlkRPfuo4kmngOTmobOc7WlmXYVZg8uL7ueg6UVCPB+j8Cc9bcg==
X-Gm-Message-State: AOJu0YyWwGvEEdTz7kxB84jICA/a5RPywQcjsEyAXP9bpZANSu8RdoCU
	8mD6McIlNfoy0LNt+K4U3ABhAn9slXPko8Aj8LKzWnsaF4Z19D2EVuXMciBKa+rtoxDt3eEF/1I
	Pkoz9eAFwHaswJLVfme+lY/Tpp0ToC2q+ikmtLg==
X-Google-Smtp-Source: AGHT+IEt0J5rY6GTeFZWhG/mY3NWmwow/MGIgHtdSvjrLUVIVDeFiV4UIk5CN4JD9H1JkWvYeScpNmeVrxVqVCTFU04=
X-Received: by 2002:a05:690c:c1b:b0:608:3c43:9186 with SMTP id
 cl27-20020a05690c0c1b00b006083c439186mr3300115ywb.45.1708814086115; Sat, 24
 Feb 2024 14:34:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240222-x1e80100-display-refactor-connector-v2-0-bd4197dfceab@linaro.org>
 <20240222-x1e80100-display-refactor-connector-v2-1-bd4197dfceab@linaro.org>
In-Reply-To: <20240222-x1e80100-display-refactor-connector-v2-1-bd4197dfceab@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 25 Feb 2024 00:34:34 +0200
Message-ID: <CAA8EJppOBHhaZpS_Z34fmFmGr4aRe0-k8w=5ScquNhCrnzRDgw@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: display: msm: dp-controller: document
 X1E80100 compatible
To: Abel Vesa <abel.vesa@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 22 Feb 2024 at 17:55, Abel Vesa <abel.vesa@linaro.org> wrote:
>
> Add the X1E80100 to the list of compatibles and document the is-edp
> flag. The controllers are expected to operate in DP mode by default,
> and this flag can be used to select eDP mode.
>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>

Rob, Krzysztof, Connor, gracious ping for the review. It would be
really nice to merge this patchset during the next cycle. It also
unbreaks several other patches.

> ---
>  Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> index ae53cbfb2193..ed11852e403d 100644
> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> @@ -27,6 +27,7 @@ properties:
>            - qcom,sdm845-dp
>            - qcom,sm8350-dp
>            - qcom,sm8650-dp
> +          - qcom,x1e80100-dp
>        - items:
>            - enum:
>                - qcom,sm8150-dp
> @@ -73,6 +74,11 @@ properties:
>        - description: phy 0 parent
>        - description: phy 1 parent
>
> +  is-edp:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description:
> +      Tells the controller to switch to eDP mode
> +
>    phys:
>      maxItems: 1
>
>
> --
> 2.34.1
>


-- 
With best wishes
Dmitry

