Return-Path: <linux-arm-msm+bounces-9557-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CA295847233
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Feb 2024 15:51:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 865B628F164
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Feb 2024 14:51:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FFF37E102;
	Fri,  2 Feb 2024 14:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AhnnXlwx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 690391419B0
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 Feb 2024 14:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706885501; cv=none; b=ASk9WqA+/nT41MNrrGzn3cjDjYn7RxGNhcXAFvh799CVVmxSbALefjwUZRj3HhiPk04FK6naqLAQklISItG+ZlkE5WE1YpkWGBZCddlsru/ddeSHaCxnSiYEwfY6TmulOMp20kBbR+7ajLDgLDyayj14hxU+UPnOaEVgmp6Hb7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706885501; c=relaxed/simple;
	bh=pi5rb7Tmyn/7tYX8PooVljl6kCdTTto2zjA8GuBlpAY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PwMTEYgOXHSV7yJh67UtjlS/ppU+6Co2QaK77FefLUVfU0bpu44Bf7lf5FLH3sZhCCKl0Yxd9AhuFr5PvI2dDRYKSduqjawTIQiINLOOBpQ/9B8OHZ9DojFRceeJ91j16Dt5/HA8ZGKLaz/D3riwaZwac/pnrf1VOUcTRvG7R6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AhnnXlwx; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-dc6c4a5bf2fso2218682276.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Feb 2024 06:51:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706885498; x=1707490298; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5ilE578MCSWuARlueVH7UntettuBsn2jGRybz77noas=;
        b=AhnnXlwxIZOs19Mv3JIjQFABk3L2h0YBoug9D4lQdOsMdGSAFeEnooAGf89g8Q9jm3
         qhmngmocgRaMRbkpL0Hixa69ENOM6CAufNcRzRe2ZjpmJY7NGKblf4dIowT3qT2liRAd
         ggmvyIEJMob9r1eBdr9q3ixebl3go4ln2iIO/tR04+agLLIZZLw+1/UvsqPvx02ZLUTs
         9/ZvWoEQ+aqQv5SnrRM57epENLo1fNsvR2Mp58bDLb2w51QdlNMibVSTsCIkrt1u9dKv
         NeZQBZYWtRf1Bihn/WdAbvEZVf/JfS90cNQBGcpLKPvqATpItU6UmbzGgP/YXaaIvvMT
         IIZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706885498; x=1707490298;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5ilE578MCSWuARlueVH7UntettuBsn2jGRybz77noas=;
        b=uzLAk9KmlBX6fQjetAZ4GCzJ1laDm8Zbd8CvidAgQRRFugF3TtSI5JLUOt/DRaRvFr
         VJcPVuutGehhwWFr1QnZYu3Uw8aLls77bUIWIAoBqYYS2ww/sEByHwsHQ8IFui5qs16e
         KvUbn2kbC7ErN4EtIPQyfG9ENs8pnkfxf1zJZtfY73omGkZ67Tij7MHwwWTtaSKz8o+4
         suSSJNDvUSYz8UELoqsh7G9t7sETkhmgI3SqYO/GzPzhGxj/MKlR1FFDuFEFjcSYiOzD
         YEpGRZu+8BLXBRvzlp7EVyefG1EJKH3Ai7sZ6B/OJH7BwVonHwdvDCW/9eO1cbBSAIBS
         bsIQ==
X-Gm-Message-State: AOJu0YwQ22LYDRZfDEGbXhUZxaCoXfXQtYoEyaxQz1yYzbE1nJjowwaq
	BMC6u80kqYNHjRHeUFrJlb9y7GvPGBz73+umo6g1JfyLrcuacw7Cc8AyD3KcormuT7uuNk6AYfS
	2fTQ6sSpEAgOwq4k3q21tq6JVLvtEiHmpQqyDAw==
X-Google-Smtp-Source: AGHT+IGAu6APLA2kU8DipKtx/vB6ojLEggEiEM1eRwpgZew+E0GgfuIW0deCZUiuf3ZHZKYpE++k4dcdLQJ7ztG9oM4=
X-Received: by 2002:a81:52c4:0:b0:5ff:569c:d349 with SMTP id
 g187-20020a8152c4000000b005ff569cd349mr8284638ywb.19.1706885498324; Fri, 02
 Feb 2024 06:51:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240202133638.4720-1-quic_wasimn@quicinc.com> <20240202133638.4720-2-quic_wasimn@quicinc.com>
In-Reply-To: <20240202133638.4720-2-quic_wasimn@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 2 Feb 2024 16:51:27 +0200
Message-ID: <CAA8EJpqARMwKhybgsFDKNZ=-uSAY=j4ocdZ=ax5U1KVPNXBTCg@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: arm: qcom: Document rb5gen2-hdk board
To: Wasim Nazir <quic_wasimn@quicinc.com>
Cc: andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel@quicinc.com
Content-Type: text/plain; charset="UTF-8"

On Fri, 2 Feb 2024 at 15:37, Wasim Nazir <quic_wasimn@quicinc.com> wrote:
>
> Document board bindings for Rb5 gen2 hardware development kit.
> Rb5gen2-HDK is using Rb5 gen2 SOM which is based on QCS8550 SoC.
> RB5gen2-HDK is development kit used for IOT solutions.

What is the actual marketing name for the SoM and the carrier board?
The RB5gen2-HDK doesn't follow the previous example of the RB* boards
and doesn't sound in tune with the RB3gen2 submission.
Could you please sync up internally and come up with two similar names
for the platforms with similar purpose?

>
> Signed-off-by: Wasim Nazir <quic_wasimn@quicinc.com>
>
> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
> index 9cee874a8eae..ce5b5dfe0e46 100644
> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> @@ -104,6 +104,7 @@ description: |
>          qcp
>          qrd
>          rb2
> +        rb5gen2-hdk
>          ride
>          sbc
>          x100
> @@ -915,6 +916,14 @@ properties:
>            - const: qcom,qcm8550
>            - const: qcom,sm8550
>
> +      - items:
> +          - enum:
> +              - qcom,qcs8550-rb5gen2-hdk
> +          - const: qcom,qcs8550-rb5gen2
> +          - const: qcom,qcs8550
> +          - const: qcom,qcm8550
> +          - const: qcom,sm8550
> +
>        - items:
>            - enum:
>                - qcom,sa8155p-adp
> --
> 2.43.0
>
>


-- 
With best wishes
Dmitry

