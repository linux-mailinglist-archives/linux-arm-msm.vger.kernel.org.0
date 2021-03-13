Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0F8B33A17E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Mar 2021 22:47:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234772AbhCMVqi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 13 Mar 2021 16:46:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234754AbhCMVqP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 13 Mar 2021 16:46:15 -0500
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11B95C061763
        for <linux-arm-msm@vger.kernel.org>; Sat, 13 Mar 2021 13:46:14 -0800 (PST)
Received: by mail-pg1-x52b.google.com with SMTP id 16so11707918pgo.13
        for <linux-arm-msm@vger.kernel.org>; Sat, 13 Mar 2021 13:46:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=Cx4a3wzdq9mvZbTnRmeobN3xjQT5VBegMUzWIc1pP08=;
        b=ZxpJvwkRps0vZWHXIXDzrrCfXV9mY0XYbADplxOAEOcMpL7topb6hvSyMt3KocTXac
         KBHM6rMMtIqbhc89dYKMhTcEZ7IGcqVNl7FwaZarjT0qdGmHh0OvPVTp5pXsrfpHmAGM
         mClqxnaCWm8KZjJriSuLfnmeKGa7RieEapq4g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=Cx4a3wzdq9mvZbTnRmeobN3xjQT5VBegMUzWIc1pP08=;
        b=SMQM6z28pGlOccKSqnO1tBUTp/CEbORWvX3heet6vSzD3Vgmx1C26Zego2SoG+Q5rp
         rwpXUeXtcMvtDKT+DFOXUb5jAChbW1Fo3mIDnuAAv6pgTJ+KGoXY486NKuuQbrgmGoD6
         5CD6JuMqdOvlROKqwhisX3ZdxRKlIWQwoOir0YIo054BiZeB4uCVKYGFEAp4GzVdXjcw
         2p4RxTl76LQnacAHRMc/K6/OV74w81TPI2Pl2XwIO4vT08T330a3Y8OpP68cDS1xIsu+
         ETLY7+RfrTi4MHJWQQ2FnPc/eEod7AgYUiuSHMEAmOuy1y7xJc+UFqWA/6BwtJX9DgcA
         uf/A==
X-Gm-Message-State: AOAM530C7UHu2C0uBNlzHIYHHG/n+nqJL/w0ZEzCeEgQHm8WWsPDFiHo
        sXJbV91xCspWIY3D17IE25Vuqg==
X-Google-Smtp-Source: ABdhPJws5FwB+v+G5AwL2SmI7GrxBXVVuNyAd7F+xhxIRV8vGS4P+sDYmC4+jRhO9E9gKcJflhLXQA==
X-Received: by 2002:a62:7bc4:0:b029:1f1:58ea:4010 with SMTP id w187-20020a627bc40000b02901f158ea4010mr4290400pfc.70.1615671974162;
        Sat, 13 Mar 2021 13:46:14 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:e859:c7d5:7d7b:5ed8])
        by smtp.gmail.com with ESMTPSA id g12sm9448366pfh.153.2021.03.13.13.46.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Mar 2021 13:46:13 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1615269111-25559-7-git-send-email-sibis@codeaurora.org>
References: <1615269111-25559-1-git-send-email-sibis@codeaurora.org> <1615269111-25559-7-git-send-email-sibis@codeaurora.org>
Subject: Re: [PATCH 6/6] arm64: dts: qcom: sc7280: Add nodes to boot WPSS
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     agross@kernel.org, mani@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sibi Sankar <sibis@codeaurora.org>
To:     Sibi Sankar <sibis@codeaurora.org>, bjorn.andersson@linaro.org,
        p.zabel@pengutronix.de, robh+dt@kernel.org
Date:   Sat, 13 Mar 2021 13:46:12 -0800
Message-ID: <161567197220.1478170.12600358804299446135@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sibi Sankar (2021-03-08 21:51:51)
> Add miscellaneous nodes to boot the Wireless Processor Subsystem on

Maybe add (WPSS) after the name so we know they're related.

> SC7280 SoCs.
>=20
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
>=20
> https://patchwork.kernel.org/project/linux-arm-msm/list/?series=3D438217
> Depends on ipcc dt node enablement from ^^=20
>=20
>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 143 +++++++++++++++++++++++++++++=
++++++
>  1 file changed, 143 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/q=
com/sc7280.dtsi
> index 18637c369c1d..4f03c468df51 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -244,12 +251,131 @@
>                 reg =3D <0 0x80000000 0 0>;
>         };
> =20
> +       tcsr_mutex: hwlock {
> +               compatible =3D "qcom,tcsr-mutex";
> +               syscon =3D <&tcsr_mutex_regs 0 0x1000>;
> +               #hwlock-cells =3D <1>;
> +       };

Is this node in the right place? I think the node above it is 'memory'?
In which case 'hwlock' comes before 'memory' alphabetically.

> +
> +       smem {
> +               compatible =3D "qcom,smem";
> +               memory-region =3D <&smem_mem>;
> +               hwlocks =3D <&tcsr_mutex 3>;
> +       };
> +
>         firmware {
>                 scm {
>                         compatible =3D "qcom,scm-sc7280", "qcom,scm";
>                 };
>         };
> =20
> +       smp2p-adsp {
> +               compatible =3D "qcom,smp2p";
> +               qcom,smem =3D <443>, <429>;
> +               interrupts-extended =3D <&ipcc IPCC_CLIENT_LPASS
> +                                            IPCC_MPROC_SIGNAL_SMP2P
> +                                            IRQ_TYPE_EDGE_RISING>;
> +               mboxes =3D <&ipcc IPCC_CLIENT_LPASS
> +                               IPCC_MPROC_SIGNAL_SMP2P>;
> +
> +               qcom,local-pid =3D <0>;
> +               qcom,remote-pid =3D <2>;
> +
> +               adsp_smp2p_out: master-kernel {
> +                       qcom,entry-name =3D "master-kernel";
> +                       #qcom,smem-state-cells =3D <1>;
> +               };
> +
> +               adsp_smp2p_in: slave-kernel {
> +                       qcom,entry-name =3D "slave-kernel";
> +                       interrupt-controller;
> +                       #interrupt-cells =3D <2>;
> +               };
> +       };
> +
> +       smp2p-cdsp {
> +               compatible =3D "qcom,smp2p";
> +               qcom,smem =3D <94>, <432>;
> +               interrupts-extended =3D <&ipcc IPCC_CLIENT_CDSP
> +                                            IPCC_MPROC_SIGNAL_SMP2P
> +                                            IRQ_TYPE_EDGE_RISING>;
> +               mboxes =3D <&ipcc IPCC_CLIENT_CDSP
> +                               IPCC_MPROC_SIGNAL_SMP2P>;
> +
> +               qcom,local-pid =3D <0>;
> +               qcom,remote-pid =3D <5>;
> +
> +               cdsp_smp2p_out: master-kernel {
> +                       qcom,entry-name =3D "master-kernel";
> +                       #qcom,smem-state-cells =3D <1>;
> +               };
> +
> +               cdsp_smp2p_in: slave-kernel {
> +                       qcom,entry-name =3D "slave-kernel";
> +                       interrupt-controller;
> +                       #interrupt-cells =3D <2>;
> +               };
> +       };
> +
> +       smp2p-mpss {
> +               compatible =3D "qcom,smp2p";
> +               qcom,smem =3D <435>, <428>;
> +               interrupts-extended =3D <&ipcc IPCC_CLIENT_MPSS
> +                                            IPCC_MPROC_SIGNAL_SMP2P
> +                                            IRQ_TYPE_EDGE_RISING>;
> +               mboxes =3D <&ipcc IPCC_CLIENT_MPSS
> +                               IPCC_MPROC_SIGNAL_SMP2P>;
> +
> +               qcom,local-pid =3D <0>;
> +               qcom,remote-pid =3D <1>;
> +
> +               modem_smp2p_out: master-kernel {
> +                       qcom,entry-name =3D "master-kernel";
> +                       #qcom,smem-state-cells =3D <1>;
> +               };
> +
> +               modem_smp2p_in: slave-kernel {
> +                       qcom,entry-name =3D "slave-kernel";

Do these names need to have 'master' and 'slave' in them? We're trying
to avoid these terms. See Documentation/process/coding-style.rst Section
4 naming.

> +                       interrupt-controller;
> +                       #interrupt-cells =3D <2>;
> +               };
> +
> +               ipa_smp2p_out: ipa-ap-to-modem {
> +                       qcom,entry-name =3D "ipa";
> +                       #qcom,smem-state-cells =3D <1>;
> +               };
> +
> +               ipa_smp2p_in: ipa-modem-to-ap {
> +                       qcom,entry-name =3D "ipa";
> +                       interrupt-controller;
> +                       #interrupt-cells =3D <2>;
> +               };
> +       };
> +
