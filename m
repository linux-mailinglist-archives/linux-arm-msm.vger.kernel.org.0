Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A57E9333F76
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Mar 2021 14:42:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232815AbhCJNlt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Mar 2021 08:41:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232907AbhCJNlk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Mar 2021 08:41:40 -0500
Received: from relay02.th.seeweb.it (relay02.th.seeweb.it [IPv6:2001:4b7a:2000:18::163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E18EAC061760;
        Wed, 10 Mar 2021 05:41:39 -0800 (PST)
Received: from [192.168.1.101] (abac94.neoplus.adsl.tpnet.pl [83.6.166.94])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 4862B2015F;
        Wed, 10 Mar 2021 14:41:31 +0100 (CET)
Subject: Re: [PATCH 05/18] dt-bindings: arm: qcom: Document sony boards for
 apq8094
To:     Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210308060826.3074234-1-vkoul@kernel.org>
 <20210308060826.3074234-6-vkoul@kernel.org>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
Message-ID: <d1febeca-edbe-3e1a-c912-d18c9e42480d@somainline.org>
Date:   Wed, 10 Mar 2021 14:41:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210308060826.3074234-6-vkoul@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi!


> +      - items:
> +          - enum:
> +              - sony,karin_windy
> +              - sony,karin-row
> +              - sony,satsuki-row
> +              - sony,sumire-row
> +              - sony,suzuran-row
> +              - qcom,msm8994
> +          - const: qcom,apq8094
> +
>        - items:
>            - const: qcom,msm8996-mtp
>  
>
APQ8094 and MSM8994 are separate (though still very similar) SoCs, so they should probably have their own const:'s.

karin_windy is based on APQ and all the rest are based on MSM. Sorry for not having documented these when first adding support for them.


Konrad

