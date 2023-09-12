Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C57D79DCA6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Sep 2023 01:30:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233379AbjILXaz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Sep 2023 19:30:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229614AbjILXax (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Sep 2023 19:30:53 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6564210C7
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Sep 2023 16:30:49 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2b962c226ceso104093521fa.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Sep 2023 16:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694561445; x=1695166245; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TiT6xmXSdGoBaHZvckfZjy18MoIhmr9QJ20ZYjr0eBk=;
        b=jwxjtWtnNgZGQxDzXYAC6JaARkuWiqA+k1hrJNVsQWvd8C7G/ZWIzu7BkAm6/r60Ss
         JHFzXYmNd/+UkcyZQ8xqQ1nOxjxyB+kpBbda63ChSNTmBmlwOpzfn1k6JJhsc14CWJtU
         43PuDrmhDY9XddaLWfiy+CXavUyR3/ClsBhWw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694561445; x=1695166245;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TiT6xmXSdGoBaHZvckfZjy18MoIhmr9QJ20ZYjr0eBk=;
        b=pNirH1w9jrxHcVU9CwpVIoe6qZ3SeVlTOWqViPft8AasUUp2KO788FIrCdmsFzzukb
         cjY9VYpaMbJD9cR5YCDOmQyD0hXxIIWVtZgMBGwm3j1USLgdcKRfT2fp10X7ZUcgqu4d
         fwKlhCkQqaAIA90Zg9vyP0hw44Hm+L2GwW0tkqtjcTN4pgOshbTTvUuSw7xxGyudg6Vl
         2P6LFbxOCoKKLjUrDaWxnP+Om8TxTglnXc57vT/QjiXPJ3CD2sAB50G1jM44mHX9peAA
         gu/cVOQbffUsMkWwuW3smLwyf/V7i5TlpNMekeIyhEjJqM/aS1kTVBWTM1Zcdhgc/NK/
         gkgg==
X-Gm-Message-State: AOJu0YzTCbmVi2TaPEUeNtSOID+eMimixPDVVrMINPdCi8+X0PlOsAbE
        //6lGzSrG2NQb5K0p1LAdgsxT6yutXLkA8NRNBWLPw==
X-Google-Smtp-Source: AGHT+IGOPNv8qfSi2uMQMYH3HZcJjSSRuBpJ6kN2mCwszGxWdxR6UKiysyKpxF+kChquVNy5BdiDzw==
X-Received: by 2002:a2e:9d08:0:b0:2bb:78ad:56cb with SMTP id t8-20020a2e9d08000000b002bb78ad56cbmr828183lji.37.1694561444903;
        Tue, 12 Sep 2023 16:30:44 -0700 (PDT)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com. [209.85.128.48])
        by smtp.gmail.com with ESMTPSA id h25-20020a170906855900b00989828a42e8sm7426640ejy.154.2023.09.12.16.30.43
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Sep 2023 16:30:43 -0700 (PDT)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-402c80b71ecso33695e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Sep 2023 16:30:43 -0700 (PDT)
X-Received: by 2002:a05:600c:5123:b0:403:9d52:195f with SMTP id
 o35-20020a05600c512300b004039d52195fmr57028wms.6.1694561443510; Tue, 12 Sep
 2023 16:30:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230912071205.11502-1-david@ixit.cz> <20230912071205.11502-2-david@ixit.cz>
In-Reply-To: <20230912071205.11502-2-david@ixit.cz>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 12 Sep 2023 16:30:31 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XYdvcF2mo9=-EBb4Ann1UAM1VFW61MH3yOWjyLqCJRiw@mail.gmail.com>
Message-ID: <CAD=FV=XYdvcF2mo9=-EBb4Ann1UAM1VFW61MH3yOWjyLqCJRiw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: sdm845: cheza doesn't support
 LMh node
To:     David Heidelberg <david@ixit.cz>
Cc:     cros-qcom-dts-watchers@chromium.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thara Gopinath <thara.gopinath@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, Sep 12, 2023 at 12:14=E2=80=AFAM David Heidelberg <david@ixit.cz> w=
rote:
>
> Cheza firmware doesn't allow controlling LMh from the operating system.
>
> Fixes: 36c6581214c4 ("arm64: dts: qcom: sdm845: Add support for LMh node"=
)
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
> v2:
>  - moved power-domains removal from this patch to previous one, since
>    it's not related to LMh support
>  arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi | 12 ++++++++++++
>  1 file changed, 12 insertions(+)

I haven't used a cheza in years, but this seems reasonable to me.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
