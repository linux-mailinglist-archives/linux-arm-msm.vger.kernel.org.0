Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E5F9771A108
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Jun 2023 16:53:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234428AbjFAOxy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Jun 2023 10:53:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233632AbjFAOxx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Jun 2023 10:53:53 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4D7A192
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Jun 2023 07:53:50 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-4f4c264f6c6so1223302e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Jun 2023 07:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685631229; x=1688223229;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=790tI55xNKd3xmitEfyE+MxPAwHRUWPcKekWE/6Wxf4=;
        b=iIEeuwI+RFGpPQMHkXqwx96h/6EIRBcmwyVDM/IRTV++XS0GtO/ixK9K9/wKNq8ll3
         /PyRDIL+9iYNDAzOt7iqUDtQWW/xc76JEGUNVmoYl4SRTMUH1Lg9rA6BHnczdW3Lf2HN
         X+rOjlBf2uGMHRFGYO37RqrKR+OGgdmiS6WGMLwvLyUYUX7m384QmDZ7MKNLnbW+VxWi
         FxWsyY8b/6rrnQctFVsjk2OvMbQA7IEVNUhdn51xQ/HsZTmwtOClFKlDKAiioL9Pj78H
         S+k2NhSS1MQazhKDh3HIx1Hr3DuTiIhI2/bA0/5HoUyM9tNBpwp9hmhTE8kc3N68Mv35
         EadQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685631229; x=1688223229;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=790tI55xNKd3xmitEfyE+MxPAwHRUWPcKekWE/6Wxf4=;
        b=l9h57fIAfAXMTZW7hLeIRwPWYVumRuDWPwmwusfwJ46O4/pRymQKSXUo1KM0QufkD6
         hRBvIiv+M+mhlbUZBP7r/e5BVKekeUc/vEusT2kG8eiiklgU8d+r4z9i3qthoXp3uKu0
         zWwTgZ56Qzqflvk6hNpavbohELgKs5xlXmNdqzoJANlsl6dfXb4GfIvkAGYq9BWUoGbc
         UqLyeMtalZFXpVxbnLSTjgHqYW2ZuJ2wJXDwpkZUNacDIcUMljnM7539dhRLHrFyE5Yc
         T3R5AdJwrt4ocZXPMItMU8BBWDZS7Y8dM8OcUf0FzpYkXjNBi0ra/I7Tljdx7++2IlTd
         99sQ==
X-Gm-Message-State: AC+VfDxgjkX2cOsaSxqx5b2/byHXnwYQdTrgG73w1mUwdZKwFN2rrH95
        ZkOd7/xT0r9XS15rEIJrS2Dk5dzJwmWORjUN7OY=
X-Google-Smtp-Source: ACHHUZ7enKascLJElckDsSOJWra6TM0JOvnbj8p/kfmTwGYiLGJ8vdY5feC0cuc5xFG4hKI3kFzfgg==
X-Received: by 2002:ac2:44a5:0:b0:4eb:1048:1285 with SMTP id c5-20020ac244a5000000b004eb10481285mr106207lfm.47.1685631228904;
        Thu, 01 Jun 2023 07:53:48 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id t4-20020a19ad04000000b004f24e797c55sm1113384lfc.25.2023.06.01.07.53.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Jun 2023 07:53:48 -0700 (PDT)
Message-ID: <ee48f7fd-35f1-288f-2133-1c473e8804ab@linaro.org>
Date:   Thu, 1 Jun 2023 17:53:47 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH V3 4/5] clk: qcom: camcc-sm8550: Add support for qdss,
 sleep and xo clocks
Content-Language: en-GB
To:     Jagadeesh Kona <quic_jkona@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Taniya Das <quic_tdas@quicinc.com>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>
References: <20230601143430.5595-1-quic_jkona@quicinc.com>
 <20230601143430.5595-5-quic_jkona@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230601143430.5595-5-quic_jkona@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 01/06/2023 17:34, Jagadeesh Kona wrote:
> Add support for camera qdss, sleep and xo clocks.
> 
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>

You probably missed the Co-developed-by tag.

> ---
> Changes since V2:
>   - No changes.
> Changes since V1:
>   - Newly added.
> 
>   drivers/clk/qcom/camcc-sm8550.c | 180 ++++++++++++++++++++++++++++++++
>   1 file changed, 180 insertions(+)


-- 
With best wishes
Dmitry

