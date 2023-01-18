Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E505671BE7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jan 2023 13:21:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230017AbjARMU6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Jan 2023 07:20:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230310AbjARMTG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Jan 2023 07:19:06 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6DE6589AB
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jan 2023 03:42:28 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id k8so19146102wrc.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jan 2023 03:42:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=18Gk+mCO1WmAWEYgxgsYKPif1ehfEB8cUZsMyOGyMMw=;
        b=hI6zx/oVUBbGKWl4kCND6ZCHTXIoOUOl0AS25Cc8ZyXjw4FkvARg9I6pphpbM4PzXz
         giecpkPjkLTiOfF/mkIt28cZdDCDVkT4vFRc5DvXtazA+rMIjupG1DR007T9sRYkAHrQ
         erzhyQsZMCc0Wwx0Q7tCj2DBD8DamS8ijvG+2LrGnjC2LHEL3v3T3x1Zu6RrzVpkOPSJ
         QY/S4/pJfVzvcyq/bJFwFJWMNqETHe64JMuqiThopDa+iHUpSr+tA53TXEJQzZJ7q0F8
         s4NbZB1y2BqW+w01bd1rfOcpCChWVDzn6LONdrPDfdCIxguKS25scpJlQgjGbpG0YQ6/
         NO/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=18Gk+mCO1WmAWEYgxgsYKPif1ehfEB8cUZsMyOGyMMw=;
        b=zX2HJb9yq+M2iVgZGmGOE/gbKVyhTXOcEBlq7dr0jkDHrCzxJlVRociV0btCd295ov
         uDETS9Gp2jcByxOP5DVKfTqEw8/2VVr/xZHVC3A6JUUYos8E+Qpe3GAfDmIH16e7d9N3
         LOh6x28EdA2jA9GyuS2oeYAaS5DGgrAc8Yb7vSVZIPWhqTwUsatMS+WlY4WLiaTkr2/e
         nn0NOUVtgjiKyn9kAEkmeUDXY0F8cqEQTd6/2nDI0WwkndWXC0urcoYAzcUa3R2dyHW/
         v5sPxCRBIB7Srz2cJs0q+KF5Yt898MBzUj1sB7v7ZB9aENwv/0fzJ9tbfVcpMFAcB5Px
         Vfxg==
X-Gm-Message-State: AFqh2koq0E/m8ITxhjrf/7OFksyzpyaw4HIZuKw3welA3fSEInKEbZDR
        UYfOw6lKpg2n0ZD4wAS6NVTq4w==
X-Google-Smtp-Source: AMrXdXtEscq5AOFLgX+uGl1cQj2eG3dG5v0OGQ2TrQAa+UGE+LJocf61Vq/0c1IFH9Ks287gD67lYw==
X-Received: by 2002:adf:df10:0:b0:26a:3eee:dde4 with SMTP id y16-20020adfdf10000000b0026a3eeedde4mr5635524wrl.8.1674042147399;
        Wed, 18 Jan 2023 03:42:27 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id o2-20020a5d58c2000000b002bdbead763csm20249717wrf.95.2023.01.18.03.42.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jan 2023 03:42:26 -0800 (PST)
Message-ID: <de975bc4-6cf6-ac50-a9bc-25058535b3bc@linaro.org>
Date:   Wed, 18 Jan 2023 12:42:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v3 4/6] dt-bindings: mailbox: qcom: add #clock-cells to
 msm8996 example
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Jassi Brar <jassisinghbrar@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230117223013.1545026-1-dmitry.baryshkov@linaro.org>
 <20230117223013.1545026-5-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230117223013.1545026-5-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 17/01/2023 23:30, Dmitry Baryshkov wrote:
> Add the #clock-cells property to the MSM8996 example, as the APCS block
> is going to provide the `sys_apcs_aux' clock to the consumers.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

