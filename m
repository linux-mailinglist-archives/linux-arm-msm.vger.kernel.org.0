Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 85ADC58F520
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Aug 2022 02:16:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233269AbiHKAQA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Aug 2022 20:16:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233215AbiHKAPy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Aug 2022 20:15:54 -0400
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6B6B65670
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Aug 2022 17:15:40 -0700 (PDT)
Received: by mail-ot1-x32b.google.com with SMTP id a14-20020a0568300b8e00b0061c4e3eb52aso11706161otv.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Aug 2022 17:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=to:subject:message-id:date:user-agent:from:references:in-reply-to
         :mime-version:from:to:cc;
        bh=rH4tJJVaEKiEVSX/7gEAY/BKJ/vg9HsTOqIZEj5Pmh4=;
        b=h0aj7RgQ934e0ORmtu9pIYkIT6Z+gcdEaZXquy67TLMV6fKF1doh6+IH+Ih+3hFrDz
         TELVjZEBzRbJUq8tPbTEQA/LVyDrWQBexnyLeZg0MEVz2nP0yNhbckOc9pbQBxyEnWme
         aFHtmSlIXxlJYxB7QNAGnuAzmmCzDwd6wCrQE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:user-agent:from:references:in-reply-to
         :mime-version:x-gm-message-state:from:to:cc;
        bh=rH4tJJVaEKiEVSX/7gEAY/BKJ/vg9HsTOqIZEj5Pmh4=;
        b=t0crXeWT3XuE8dJYTSYvak4hGPCzSmPWcSYgji8f9O9VygGY0KV2xMitksz0f+VjUm
         1V6Vj5Cc39DhpixkF24dS4PiPyNzPtlILKt+Uycn2CRsfsXjyJbmJVAfpX71ojPJ7oxY
         KPDlYsFTknCQpFIcwBYkp3Z1YAKzK4JIrzu+2bj/37N2d+NlP/dYdoMn+Ap1e7O+CGtS
         hjw8qrXJOM8bgO9fQ3a4swPuGIui/g77O5llXVAimfY7K+scnyNhUCE9fWxn5bdHsrvn
         58ftNMMtyVo7oWPkf5y3e7KyRQbb9O3lrcJC1hAcd13RHwR6x7IpAO+NGKGyAa8E0KAE
         fS1Q==
X-Gm-Message-State: ACgBeo07ugFkPmh8eo7i/o0Y1Svbxt1/Ax2lAO2ZJ77x+zpHZUoTnPAz
        B/IERw5CE1RNf20C23S3eTNTl734rbnQ3PdU61ddKw==
X-Google-Smtp-Source: AA6agR5BtDf4XxrUrg0Gk1lYiHMkGfXr1/IVnw2zv2k57Qwoaw08dnBtupoZEjg0MmKn5KxR5W5npRRcFJ+VX9QGae4=
X-Received: by 2002:a05:6830:2645:b0:61c:b7cd:bde3 with SMTP id
 f5-20020a056830264500b0061cb7cdbde3mr11142467otu.73.1660176940236; Wed, 10
 Aug 2022 17:15:40 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 10 Aug 2022 19:15:39 -0500
MIME-Version: 1.0
In-Reply-To: <1660117558-21829-5-git-send-email-quic_srivasam@quicinc.com>
References: <1660117558-21829-1-git-send-email-quic_srivasam@quicinc.com> <1660117558-21829-5-git-send-email-quic_srivasam@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Wed, 10 Aug 2022 19:15:39 -0500
Message-ID: <CAE-0n52=OzOG7qCXivVbsfJMdNCZJgJNSX3-3CeYqbW9tV3qqQ@mail.gmail.com>
Subject: Re: [PATCH v3 4/8] remoteproc: qcom: Add compatible name for SC7280 ADSP
To:     Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
        agross@kernel.org, bgoswami@quicinc.com,
        bjorn.andersson@linaro.org, broonie@kernel.org,
        devicetree@vger.kernel.org, judyhsiao@chromium.org,
        lgirdwood@gmail.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        perex@perex.cz, quic_plai@quicinc.com, quic_rohkumar@quicinc.com,
        robh+dt@kernel.org, srinivas.kandagatla@linaro.org, tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Srinivasa Rao Mandadapu (2022-08-10 00:45:54)
> @@ -741,6 +757,7 @@ static const struct of_device_id adsp_of_match[] = {
>         { .compatible = "qcom,qcs404-cdsp-pil", .data = &cdsp_resource_init },
>         { .compatible = "qcom,sc7280-wpss-pil", .data = &wpss_resource_init },
>         { .compatible = "qcom,sdm845-adsp-pil", .data = &adsp_resource_init },
> +       { .compatible = "qcom,sc7280-adsp-pil", .data = &adsp_sc7280_resource_init },

Please keep this sorted on compatible string.
