Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 984A454D386
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jun 2022 23:18:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349941AbiFOVSo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Jun 2022 17:18:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350233AbiFOVS3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Jun 2022 17:18:29 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7396C5548F
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jun 2022 14:18:28 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id t3-20020a17090a510300b001ea87ef9a3dso3172625pjh.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jun 2022 14:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=AdSNYlarnghZLL4+EwD5Nxa+VwtZOE12n1YSRFgSAD0=;
        b=rq4HnFWbq6xo4ji9uDTZmvctRQPOMXHvVKyRxreJHg5eITcoxkEQ6nZOWfWPBms4Fl
         zKZ61g6FzYqexv/S1p1JkHv3DWL7dHqvtn0J4/fF1v9m8yX4qTbP/s6ZyY93Jlqzc2Sj
         gLyuPHqzLXNHJe0FwYjs645KMSKe6FSsJi4rbByhr4xKMEId9b3FldShsDEwNo2C8B1S
         NeODmLsRDJ+3tVZ788Hah7dyxkh0ZqqCxb33Nta7jTiNPVDRwwmKg9QcKGMKlG9Alvbf
         UoeEFLICKmbY7LfDudU4Mu1CEG6Ld7nyvMFn/dYae2vOXm5A9YFTHfIs3lAgBP4oaYtv
         Xjng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=AdSNYlarnghZLL4+EwD5Nxa+VwtZOE12n1YSRFgSAD0=;
        b=VNTwLu4wLPufRCUxRT6fTkJRp8c+bx3LrFyD/puAIs94uenhlbWOizB9BDrIDvuLur
         PqHLGR6Tn4aFx57cSOiCndxbQJsqfYmhkmBkX/aG1YIRxs8hwz3fTJt+Xec1FT41eAg/
         gSzw6ZVNvreUNLhYIdO6o7WseB6Ng+foU8oZPO8neGUyEtOxsL/PpQ/YfFeJjIMDUwDN
         ivW/UgFCVy/fFx5AXWjdcjK98wVmINQech+bLod/AuubQC4hn/Lkmjmli42r6p5rcYsW
         JQjGi8WKK81cGXDxRFYDDk7h6hVVPM6ZkE7hm7G7xhbKk7apoUtPc8WQ+Wc/VetLlhBy
         U+5g==
X-Gm-Message-State: AJIora8yNljUK6e3MfzCET6qpdeiejQuo05nC/H1xGPYwELqXDhAolBB
        W8l7jOKGNMy2kP+MPHf8ukv0xfSKr7XpCA==
X-Google-Smtp-Source: AGRyM1tA/elZAAtrJW4sA4e2iACdIX7S4wavbn+hv4qN9/qOkHwSZUGjW/opaYx+1Ur/YEnpVMCSaQ==
X-Received: by 2002:a17:903:230b:b0:167:5310:9eed with SMTP id d11-20020a170903230b00b0016753109eedmr1469945plh.46.1655327907931;
        Wed, 15 Jun 2022 14:18:27 -0700 (PDT)
Received: from [172.22.33.138] ([192.77.111.2])
        by smtp.gmail.com with ESMTPSA id x8-20020a17090a6b4800b001e2d4ef6160sm39763pjl.27.2022.06.15.14.18.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jun 2022 14:18:27 -0700 (PDT)
Message-ID: <90bf6d4b-68bd-3508-7a28-4b45287ee4cb@linaro.org>
Date:   Wed, 15 Jun 2022 14:18:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3 01/14] dt-bindings: display/msm: hdmi: split and
 convert to yaml
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, David Heidelberg <david@ixit.cz>
References: <20220609122350.3157529-1-dmitry.baryshkov@linaro.org>
 <20220609122350.3157529-2-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220609122350.3157529-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 09/06/2022 05:23, Dmitry Baryshkov wrote:
> Convert Qualcomm HDMI binding into HDMI TX and PHY yaml bindings.
> 
> Changes to schema:
> HDMI:
>  - fixed reg-names numbering to match 0..3 instead 0,1,3,4
>  - dropped qcom,tx-ddc-* from example, they were not documented
>  - make phy-names deprecated, drop it from the examples
> 
> PHY:
>  - moved into phy/ directory
>  - split into QMP and non-QMP PHY schemas
> 
> Co-developed-by: David Heidelberg <david@ixit.cz>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
