Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 68767616920
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Nov 2022 17:33:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231978AbiKBQdp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Nov 2022 12:33:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230501AbiKBQc6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Nov 2022 12:32:58 -0400
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com [IPv6:2607:f8b0:4864:20::f2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32AF32A97E
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Nov 2022 09:29:01 -0700 (PDT)
Received: by mail-qv1-xf2a.google.com with SMTP id h10so12806721qvq.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Nov 2022 09:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wSLCTGltW3Pi3vNURWHl/J6vr0vOOEtgsi2cwjTbaHk=;
        b=IBM51Ly+I+VOb6yQDBY5QFXqI4VLSSXLOi3e8mlWm0IvAkBPN8ujE746YJPCI2E6uU
         SJhM61XFfmDf6N+5lYTlVW01Rhgt9IYTh4XUXnXz/WSgrP2OQG2uMF9nMZP5Rk3iBxsv
         yqlnLtmV6EvvajTgj+5ozKpC4dOOL/4bD02y2Xo577MIAjxfBXQD9DpVekhEXTcgN8z9
         rJ6GtIxN49Cx8s1aGXTOAB+DngWoU6ZPCFjkQ7UAJrffHSI78PnXukShZwQfcmvMYT4a
         96gj54S1D5wNEy5IJQU7vJp17h1NvQ+/ovoL4PR0ESvVfgMlJ3hILNm5ZNfEw9UdQYcG
         NpKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wSLCTGltW3Pi3vNURWHl/J6vr0vOOEtgsi2cwjTbaHk=;
        b=eJay0T078MeO+WGVTJWhf5AR7WMXoCyGXJXNuG7tXSnb0LA4CkFvUYDyiWpbmKpKBU
         WvSQBHo9opMoYpeFVC2zeNDFZo6WSkqSrcNY1ClMrzr9JDLI0TZbnmv2D5Y0U/q8Qp27
         +kBEOvok6PzcSTb1LA+4mm2WIqKW6aKSUQwQQ1lOzbF4JgwoWVbfmW4AH+JfwujUJV4i
         l1dCLy66sTXv4WZBl3MnCTtka1mKP28iky5/i90gopugQUpv3svNg7lh93TpkjpstCBu
         z0DhMbpq2zo1UEsQ9ibQVDVWGYpbouz1j0iJBavNv5+Tc72ewG31si4PwKkPVBnBiovb
         6Zfg==
X-Gm-Message-State: ACrzQf1gXT51COp06Pp/oHDVUvkSWgGVi60rwWHxEvYPuZ8e2qlUZpi0
        DL2/i9sso7PJMmModS19NcrzEg==
X-Google-Smtp-Source: AMsMyM6vEdjs6pC2UwrHlF7jhERcEyWGRw3mHyE1j1GlNQHycpdB2Yn71e9EB42zr2iMMXdyy9CE4A==
X-Received: by 2002:a05:6214:2a84:b0:4bc:e81:39e1 with SMTP id jr4-20020a0562142a8400b004bc0e8139e1mr10179419qvb.115.1667406540345;
        Wed, 02 Nov 2022 09:29:00 -0700 (PDT)
Received: from ?IPV6:2601:586:5000:570:28d9:4790:bc16:cc93? ([2601:586:5000:570:28d9:4790:bc16:cc93])
        by smtp.gmail.com with ESMTPSA id u21-20020a37ab15000000b006fa1dc83a36sm7811228qke.64.2022.11.02.09.28.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Nov 2022 09:28:59 -0700 (PDT)
Message-ID: <af086bd0-89da-d40a-6c45-742de69a8f47@linaro.org>
Date:   Wed, 2 Nov 2022 12:28:57 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH 1/2] dt-bindings: clock: qcom,gcc-ipq8074: use common GCC
 schema
Content-Language: en-US
To:     Stephen Boyd <sboyd@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Christian Marangi <ansuelsmth@gmail.com>,
        Claudiu Manoil <claudiu.manoil@nxp.com>,
        Daniel Machon <daniel.machon@microchip.com>,
        "David S. Miller" <davem@davemloft.net>,
        Del Regno <angelogioacchino.delregno@somainline.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Eric Dumazet <edumazet@google.com>,
        Govind Singh <govinds@codeaurora.org>,
        Horatiu Vultur <horatiu.vultur@microchip.com>,
        Iskren Chernev <iskren.chernev@gmail.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Jeffrey Hugo <quic_jhugo@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Lars Povlsen <lars.povlsen@microchip.com>,
        Loic Poulain <loic.poulain@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Martin Botka <martin.botka@somainline.org>,
        Mic hael Turquette <mturquette@baylibre.com>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Paolo Abeni <pabeni@redhat.com>,
        Rob Herring <robh+dt@kernel.org>,
        Robert Foss <robert.foss@linaro.org>,
        Sergey Shtylyov <s.shtylyov@omp.ru>,
        Shawn Guo <shawn.guo@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        Stephan Gerhold <stephan@gerhold.net>,
        Taniya Das <tdas@codeaurora.org>, UNGLinuxDriver@microchip.com,
        Vinod Koul <vkoul@kernel.org>,
        Vladimir Oltean <vladimir.oltean@nxp.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        devicetree@vger.kernel.org,
        krishna Lanka <quic_vamslank@quicinc.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        netdev@vger.kernel.org
References: <20221028140326.43470-1-krzysztof.kozlowski@linaro.org>
 <20221101194805.9EE0EC433C1@smtp.kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221101194805.9EE0EC433C1@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 01/11/2022 15:48, Stephen Boyd wrote:
> Quoting Krzysztof Kozlowski (2022-10-28 07:03:24)
>> Reference common Qualcomm GCC schema to remove common pieces.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
> 
> Should I pick this up into clk tree? Or are you going to apply it to
> binding tree?

I'll send v2 with subject fix pointed out by Rob and then please pick
them up via clk.

Best regards,
Krzysztof

