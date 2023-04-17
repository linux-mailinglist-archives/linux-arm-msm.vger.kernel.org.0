Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 72FDF6E3CE5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Apr 2023 02:09:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229510AbjDQAJW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 16 Apr 2023 20:09:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229473AbjDQAJV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 16 Apr 2023 20:09:21 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B97461FF3
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Apr 2023 17:09:18 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id eo6-20020a05600c82c600b003ee5157346cso14654832wmb.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Apr 2023 17:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681690157; x=1684282157;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CbPYQdpIos11VFsu8WhwNBj+KG9SbHGorRS3cfQMAPk=;
        b=VEk+V8v9goo7W+1YywTCEB/TuI1nlWT+CQDVShO3S61BvRaVUzwEUHHQ2neg8v3+b2
         ax0VaF9olA6pj5y2nu1Dy63J42PTzdyPjKVqxp3GBmKyl4D+dItSUo5yahUK/qN1CZYu
         ijLj12EKd9yMHG/KmwiZqVjrBMPofkmNj++agySJo/D2u5BnwalC9beEMG29T0ffdbtZ
         oFjs2wlosXQ0uoZcSZco4g0UCYwFGCSm4LJHrvuJYoZBKgcZDKx5RIQNRacoA7GaoWxM
         mrrRNG4zd+LP871PRceEP1KlEWmg07YIdLMzmwEPbkZZ3dVv4jDlilgVA94sk1MoIHEX
         TUvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681690157; x=1684282157;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CbPYQdpIos11VFsu8WhwNBj+KG9SbHGorRS3cfQMAPk=;
        b=Q6L/9PS40qTTFxiTE/KTVPGVrYOZhDrziAN55Hltzh4ffXlA3DMZXvzzN7eTr5wl6v
         ZzageocNfrav6RbxBN8RFkyFbinAsSCbVnsWrbhFSZK5alPiYEc+IzSGQh+9q6/STfd6
         6ZCsnt7pvstt014DwrMqdAKIValzRaDEra5855jziWnVX9FKAMnetUnw4w8047pRxvLB
         V6a8/vVuXvh6U66LqeNL36E1NOVrHpy641EmsFVcNxUrpcH+4Z4Vl7r8TMLBArrNzki4
         HmlW2YlWPMSWZc+PPghY32KdohRfZwhKfAq0eGIXD8xz72Yt6CGuD+ktYAryqz/R7lXT
         BTew==
X-Gm-Message-State: AAQBX9eCvYmgh51YjJuYtwvxd6FUkanxwVVQLt0WSrbBHVHloE0jMmT0
        dQTPmQljq0ddOoEe94ns0llBVQ==
X-Google-Smtp-Source: AKy350YjlGO3iN4mc0hPFM83gKsC1xggLtdZxvPFHWG15hHOAe/xV4ep8SGVDPrsShfkmURC5rkyrg==
X-Received: by 2002:a1c:750c:0:b0:3f1:6980:2d2e with SMTP id o12-20020a1c750c000000b003f169802d2emr3908271wmc.22.1681690157096;
        Sun, 16 Apr 2023 17:09:17 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id jb17-20020a05600c54f100b003f17316ab46sm2256484wmb.13.2023.04.16.17.09.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Apr 2023 17:09:16 -0700 (PDT)
Message-ID: <b2388450-28a9-3dd9-8557-3649518c6619@linaro.org>
Date:   Mon, 17 Apr 2023 01:09:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v5 04/14] dt-bindings: phy: qcom,sc7180-qmp-usb3-dp-phy:
 Add ports as an optional
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org, andersson@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     caleb.connolly@linaro.org, konrad.dybcio@linaro.org,
        subbaram@quicinc.com, jackp@quicinc.com, robertom@qti.qualcomm.com
References: <20230413113438.1577658-1-bryan.odonoghue@linaro.org>
 <20230413113438.1577658-5-bryan.odonoghue@linaro.org>
 <6ec55a3d-8b9a-2a44-6a0c-0dfc0100e88a@linaro.org>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <6ec55a3d-8b9a-2a44-6a0c-0dfc0100e88a@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 16/04/2023 18:47, Krzysztof Kozlowski wrote:
> I assume both ports are required? Could it work without input or output?

It can work without an output because we might not have DP switched on 
-> bog-standard USB orientation-switching in host-only, device-only or 
dual-role modes.

---
bod
