Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F22B07CAA7E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Oct 2023 15:53:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232259AbjJPNxu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Oct 2023 09:53:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231508AbjJPNxu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Oct 2023 09:53:50 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C1FBFA
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Oct 2023 06:53:46 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-53e04b17132so7378508a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Oct 2023 06:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1697464425; x=1698069225; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vOvRSIBCKDO/EoG06SNXpskpBSv5uHfI6z7Qbijhh84=;
        b=ZGfXHDIEVPsrSdi6s+cmpqGpouYUKTMnHCS0XjgyskuNwWucIDjhMF7sJdA650u0aF
         F6LffFSACGmJSI0ChVpnRRmsvDqaSedds+h4Pq2bhnEXceocq6j1uKfCv5VZk5GxK8LQ
         QGlBpWwk0qLq3vPnL4ILlwUdvrCcYNkzABzYzs1HEiKVKwYFehlXmDnkLhGVla1K6qq/
         5Dpoa8QwjjfdotnmCzsEhOl7rplTtfTMuEPnT6YtISlME/pEkSdm5bxTXeoB7YeiOgHN
         TGDg77JFPEL7UTIhgBoRUTcVz+P0KCmntScaYclCQVXVL3ZqPWrlU5GndpHBd/CXgr9e
         Hq7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697464425; x=1698069225;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vOvRSIBCKDO/EoG06SNXpskpBSv5uHfI6z7Qbijhh84=;
        b=tjJE/GlWBFLCcxbyTEKSiVle0J2rU7PdWs8LzP0vqmzZlbINPXmExtVZCwjw4+RDZw
         MEutfheit+Szwts5JOxMplqfuMYiw8Ad1M3cCyQL06Gxpi/nF9/aCX64SrCJpe7OblOR
         LZj5bH/Z5WTb7pIEVWomhI61FoQwMVeEMsSVG3XK1ZkcxV3fE+EmL+NytE4Rmi3NhCyT
         HmIsg4P6trPE8S3YVNocB8lrmM3J7qmzNGeR1idSzufo1n45BpXwmadyiFQzCXi0vxUJ
         qLJb4bqgwL9GJbXsXBi1tabsjvGZVJTXqxM5rVr6RtraMy4BFQyAFw41U78JAqjajC04
         e/5Q==
X-Gm-Message-State: AOJu0YxjEwbS8/0p6Hk+hOqJWmBYGZavEF05Rx0900vLUGWdxC4BcfzX
        bXEcteDESy4Gkry36tWXinbNPg==
X-Google-Smtp-Source: AGHT+IHoxPW8PwdZUvfviYS7QdbDikx9yohEhHLS/XOTq3T9uH87ZFiSCdLJimiupbVDzkcfzqrchA==
X-Received: by 2002:aa7:c549:0:b0:525:6e47:10f6 with SMTP id s9-20020aa7c549000000b005256e4710f6mr29895269edr.22.1697464424717;
        Mon, 16 Oct 2023 06:53:44 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id q18-20020a50c352000000b0053e9352643csm3015296edb.62.2023.10.16.06.53.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Oct 2023 06:53:43 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Mon, 16 Oct 2023 15:53:42 +0200
Message-Id: <CW9WX2BFW95K.2PHV8UU363BFE@fairphone.com>
Cc:     <linux-arm-msm@vger.kernel.org>, <linux-iio@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <phone-devel@vger.kernel.org>,
        "Rob" <Me@orbit.sh>, "Clayton Craft" <clayton@igalia.com>,
        <~postmarketos/upstreaming@lists.sr.ht>
Subject: Re: [PATCH 1/5] iio: adc: add smb139x bindings
From:   "Luca Weiss" <luca.weiss@fairphone.com>
To:     "Nia Espera" <nespera@igalia.com>,
        "Andy Gross" <agross@kernel.org>,
        "Bjorn Andersson" <andersson@kernel.org>,
        "Konrad Dybcio" <konrad.dybcio@linaro.org>,
        "Jonathan Cameron" <jic23@kernel.org>,
        "Lars-Peter Clausen" <lars@metafoo.de>,
        "Rob Herring" <robh+dt@kernel.org>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        "Conor Dooley" <conor+dt@kernel.org>,
        "Kees Cook" <keescook@chromium.org>,
        "Tony Luck" <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>
X-Mailer: aerc 0.15.2
References: <20231016-nia-sm8350-for-upstream-v1-0-bb557a0af2e9@igalia.com>
 <20231016-nia-sm8350-for-upstream-v1-1-bb557a0af2e9@igalia.com>
In-Reply-To: <20231016-nia-sm8350-for-upstream-v1-1-bb557a0af2e9@igalia.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon Oct 16, 2023 at 2:47 PM CEST, Nia Espera wrote:
> Bindings for a charger controller chip found on sm8350
>
> Signed-off-by: Nia Espera <nespera@igalia.com>
> ---
>  include/dt-bindings/iio/qcom,spmi-adc7-smb139x.h | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>
> diff --git a/include/dt-bindings/iio/qcom,spmi-adc7-smb139x.h b/include/d=
t-bindings/iio/qcom,spmi-adc7-smb139x.h
> new file mode 100644
> index 000000000000..fe163cd8bbdd
> --- /dev/null
> +++ b/include/dt-bindings/iio/qcom,spmi-adc7-smb139x.h
> @@ -0,0 +1,17 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2020 The Linux Foundation. All rights reserved.
> + */
> +
> +#ifndef _DT_BINDINGS_QCOM_SPMI_VADC_SMB139X_H
> +#define _DT_BINDINGS_QCOM_SPMI_VADC_SMB139X_H
> +
> +#define SMB139x_1_ADC7_SMB_TEMP			(SMB139x_1_SID << 8 | 0x06)
> +#define SMB139x_1_ADC7_ICHG_SMB			(SMB139x_1_SID << 8 | 0x18)
> +#define SMB139x_1_ADC7_IIN_SMB			(SMB139x_1_SID << 8 | 0x19)
> +
> +#define SMB139x_2_ADC7_SMB_TEMP			(SMB139x_2_SID << 8 | 0x06)
> +#define SMB139x_2_ADC7_ICHG_SMB			(SMB139x_2_SID << 8 | 0x18)
> +#define SMB139x_2_ADC7_IIN_SMB			(SMB139x_2_SID << 8 | 0x19)

I think you should expand qcom,spmi-vadc.h with the 0x06, 0x18 and 0x19,
in the ADC7 defines somewhere below ADC7_REF_GND.

Regards
Luca

> +
> +#endif

