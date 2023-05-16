Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6DF02704A39
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 May 2023 12:15:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232024AbjEPKPP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 May 2023 06:15:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231877AbjEPKPO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 May 2023 06:15:14 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E9791A5
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 May 2023 03:15:13 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-3f41d087bd3so71435885e9.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 May 2023 03:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684232112; x=1686824112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u6hotZHN8F9GNcRVXqml63G6mGoDwzmzd1ogRplEl7A=;
        b=SDhZGQz5V3SpYUUAG+uNAFNGhnNYPNqZAwiuBxZuB26G0qwLy9arpDWno5m+HEtaSd
         viRZEzVSIoMJeRNV3JZT/flDlg7xAOdRRui4DCMyKJaMnN17VosKMzvqpN2XFSPSaqS5
         EA9FClOtKW/q5SxCn1QNh6rUaSvk12dpOzdQCRzrtfZZTxcDtWr6AWoTtyLjy2m48r7S
         drGc0xro/Txc9sqafClJooMRNPqPEjyJw61DvShlvObUAfkfu81FX52w6CfIWh1FqS7A
         yXyF1K0uI7wG1kOe5F2TMEbeYL4NVzAk1CArA7BynVp7y6B61dAqRN9alIqgSZ8vZo2F
         bhxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684232112; x=1686824112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u6hotZHN8F9GNcRVXqml63G6mGoDwzmzd1ogRplEl7A=;
        b=Euyn9hYGwEPevckzM1NU0f3t6ISFVp2yAfuY/RXIOPKjoBSnJ2TBJjKlc1Vdz83aeD
         vJiDwGxz04ZwlfKeeglW+A8phJQRJlL+5MkMd78WdVRfu9SF2QGNmjarPB/jk8QdR9UU
         ox/m7kebjH0KTt42UNO+wllo8XdfxQJoAC2QXY3hCIMDedDAU2EVUtnhpzqYSie5B+F3
         dB0xbKv7LTL7MsobCWcQhDCuYZNw2FPxMdYcy78ZKCMr4je8cLFdi8uA+PdiR4A3JJvc
         QErqafFVroQ+gaFGvWG73YgwpJTM8kG5Ewk36vGXwfTrwd4eR3ptn71YTLNJbgjV8Gh4
         k+wQ==
X-Gm-Message-State: AC+VfDxObrFGvGLexErYCyIq4oXj4VcetDv4NAO7e4Wom5ELWuMHMzTy
        d2kmr6j+CSlC3G0k1YTtJupWSA==
X-Google-Smtp-Source: ACHHUZ65rv/dw7p0nohu7DByQygeobX+M09FaCDj6gFZbJEE3WkNFueyBIUJEXdBv1OGMUkYFyePZg==
X-Received: by 2002:a1c:770e:0:b0:3f5:e88:ffc4 with SMTP id t14-20020a1c770e000000b003f50e88ffc4mr3507273wmi.33.1684232111893;
        Tue, 16 May 2023 03:15:11 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id m7-20020a7bcb87000000b003f4290720d0sm1742351wmi.47.2023.05.16.03.15.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 May 2023 03:15:11 -0700 (PDT)
Message-ID: <f4b774a6-d739-2fae-cdbb-9554fb0db707@linaro.org>
Date:   Tue, 16 May 2023 11:15:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v8 04/11] dt-bindings: phy: qcom,sc7180-qmp-usb3-dp-phy:
 Add input and output ports
Content-Language: en-US
To:     Bjorn Andersson <andersson@kernel.org>
Cc:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, luca.weiss@fairphone.com,
        lujianhua000@gmail.com, linux-usb@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        konrad.dybcio@linaro.org, caleb.connolly@linaro.org,
        subbaram@quicinc.com, jackp@quicinc.com, robertom@qti.qualcomm.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20230515133643.3621656-1-bryan.odonoghue@linaro.org>
 <20230515133643.3621656-5-bryan.odonoghue@linaro.org>
 <20230515195949.yemdw4n2pquive2r@ripper>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20230515195949.yemdw4n2pquive2r@ripper>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 15/05/2023 20:59, Bjorn Andersson wrote:
> Perhaps we could put some of this in a separate yaml and include that?

Ok sure.

---
bod
