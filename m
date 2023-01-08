Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF6FB661841
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Jan 2023 19:44:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233180AbjAHSoX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 8 Jan 2023 13:44:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233073AbjAHSoU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 8 Jan 2023 13:44:20 -0500
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 720AF6162;
        Sun,  8 Jan 2023 10:44:12 -0800 (PST)
Received: by mail-il1-f178.google.com with SMTP id y2so3863340ily.5;
        Sun, 08 Jan 2023 10:44:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lmOUY9g5zDuVcLo7gzbslvuL+HzUgol+moZo0Bwe2Zo=;
        b=llpOqTF7xQK5twsz2FYsjKHrKcn+4EjqNNe+Sf/gqkLgLMKv9YFjSmtCta+W1swnMi
         39TB2ufWGYyxPEkls9rMTDM5gvC9fQ9lDFmkj413UJDpD9NI6QtmBoD2M05ZGFVUnqfU
         zSAjGQERPNXINQxbn5aAMxx9TZVd+wvKGTz3uTR1RnqOaFw64Y5LmVvEPw5jgGGhDNzC
         ockNUhOWvxBoJUpq3XPYYQGpnN0FWvJ+dzQRgqVDenc1YDfYDoyHRAIYsE5tbsLnGLFQ
         uFhAegt/ciM2R2Pdu/u0Kix2e5NJijEw3nbS9XoVGPOuj75NyUc/aiQVOG74zAEXtlzg
         VVlg==
X-Gm-Message-State: AFqh2krB+K/FKxTlBiKA6u+RScfW+9fVQ0xvOXQWoN9Ig7wkpwZvoI/+
        WOtzQ94dqbcNMIUI1fWPrw==
X-Google-Smtp-Source: AMrXdXt38U/rl5BW9WIjkSeHA9Mp6ralDF9lnmnlu1T4C9d/UDAVaBatJG0A1/92d2pciRd06y0/Qw==
X-Received: by 2002:a92:d343:0:b0:30c:22e:9af2 with SMTP id a3-20020a92d343000000b0030c022e9af2mr32696931ilh.13.1673203451682;
        Sun, 08 Jan 2023 10:44:11 -0800 (PST)
Received: from robh_at_kernel.org ([2605:ef80:8069:516a:f2b0:691e:4315:7c0f])
        by smtp.gmail.com with ESMTPSA id g96-20020a028569000000b00363a4fcd3a8sm2161469jai.5.2023.01.08.10.44.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jan 2023 10:44:11 -0800 (PST)
Received: (nullmailer pid 191712 invoked by uid 1000);
        Sun, 08 Jan 2023 18:44:04 -0000
Date:   Sun, 8 Jan 2023 12:44:04 -0600
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>, linux-clk@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v2 04/16] dt-bindings: clock: qcom,gcc-sm8350: drop
 core_bi_pll_test_se
Message-ID: <167320344124.191595.1612452776724841028.robh@kernel.org>
References: <20221228185237.3111988-1-dmitry.baryshkov@linaro.org>
 <20221228185237.3111988-5-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221228185237.3111988-5-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On Wed, 28 Dec 2022 20:52:25 +0200, Dmitry Baryshkov wrote:
> The test clock apparently it's not used by anyone upstream. Remove it.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  Documentation/devicetree/bindings/clock/qcom,gcc-sm8350.yaml | 2 --
>  1 file changed, 2 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
