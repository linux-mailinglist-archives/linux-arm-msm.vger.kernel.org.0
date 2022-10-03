Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 794365F313E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Oct 2022 15:29:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229788AbiJCN3Z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Oct 2022 09:29:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229627AbiJCN3Y (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Oct 2022 09:29:24 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 765832612A
        for <linux-arm-msm@vger.kernel.org>; Mon,  3 Oct 2022 06:29:23 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id bs18so10182182ljb.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Oct 2022 06:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=6TsOQ1h1v8zG9b7DSkhBBkd7Y1zM04JnBp/JF+TVzYs=;
        b=qplxdpmVEoaA880ajX0q9Xc15xIgU7a9znpzWXqhN2xUZcoYn+OJqvotp4ktDhrnJY
         53VJjiqPa0hlidd3rvGeahqJtB8eXMv6iQuXZ7l+FalzcT+Yc84Wf95Unr4P8vMCCcMs
         ehCAWBrTHE/MQd+BZPUoU7CxKxSVGba211CPwmmrxSs/Lm6PUnnHLe+4duiYmx7kk7XP
         MdzuDhH1USPRx9n70QBymXdReKvtVD5QmQg5XgTRygtL+hMf//fS3tPrkkZCbqFJVOZH
         cwaQM/Rpp8+4aEpMjhYqUoVRvHxYU+ZejCYvEFsYsegczgc3nw8tD+B5uqqxBJ0BdGl+
         ixfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=6TsOQ1h1v8zG9b7DSkhBBkd7Y1zM04JnBp/JF+TVzYs=;
        b=PCHSnGtkO575dLPTEulR+9psrBiHIiHUrH1CyUWkBMZxAYdrjPAQ/Q3WwHHXCC9LPi
         v2yCJrmdoY5ips/SFkxzgVzTxOvqh+VhpCIz0D/Xngx/5u1FicmM812Yrt/YCdHW2A+3
         t+2PBaQSQ/elCcpM7J0dSUxpAizqml7YEdhGcmHVpBR7qmXSXVARPXESlm//LVPk1l+0
         PsUQLOzDCJm0DJZ0a0MzpXCERBwXfb4UvfpXzqiE4AawTc3TLA5YyjDpZ9l1zdhATXUp
         7lmwooLlFIryWizw4Jq8zeoLGxd4TMAb6vvkmKVT4g/S8dXLABaR/o7YOKZAG6qmudNb
         Opkg==
X-Gm-Message-State: ACrzQf2M6qH7jMG4zh10qcgKpfk23JcsSOmRgM+zLoW2IS1O53p0lmwg
        KePZgz+cA3qmX6QMytjoPJtIWA==
X-Google-Smtp-Source: AMsMyM7jJKEQi4Zcz9Re0+ixhiTC4ABYQozRTB1uQMsdG6rsg7M0TF7GZ2TwAXTHHJsmt75lplp9Ag==
X-Received: by 2002:a2e:9906:0:b0:26d:db58:22fe with SMTP id v6-20020a2e9906000000b0026ddb5822femr1734691lji.397.1664803761722;
        Mon, 03 Oct 2022 06:29:21 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id p26-20020a2ea41a000000b00261e2aab7c2sm883752ljn.58.2022.10.03.06.29.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Oct 2022 06:29:21 -0700 (PDT)
Message-ID: <10c70d8b-efa5-f468-f4f2-ddd2f2709bb4@linaro.org>
Date:   Mon, 3 Oct 2022 15:29:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v5 3/3] arm64: dts: qcom: introduce sa8540p-ride dts
Content-Language: en-US
To:     Parikshit Pareek <quic_ppareek@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Andrew Halaney <ahalaney@redhat.com>,
        Shazad Hussain <quic_shazhuss@quicinc.com>,
        Brian Masney <bmasney@redhat.com>,
        Johan Hovold <johan@kernel.org>
References: <20221003125444.12975-1-quic_ppareek@quicinc.com>
 <20221003125444.12975-5-quic_ppareek@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221003125444.12975-5-quic_ppareek@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 03/10/2022 14:54, Parikshit Pareek wrote:
> Create new dts file specific for Qdrive-3 board based on sa8540p chipset.
> Introduce common dtsi file sa8295p-adp.dtsi, to be included for ADP and
> Qdrive-3 board.
> 
> This is quite similar to sa8295 ADP development board. Main differences
> are related to connectors, and interface cards, like USB external ports,
> ethernet-switch, PCIe switch etc.
> 
> Signed-off-by: Parikshit Pareek <quic_ppareek@quicinc.com>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

