Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 630017925E5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Sep 2023 18:24:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237747AbjIEQEv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Sep 2023 12:04:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353575AbjIEGro (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Sep 2023 02:47:44 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F67ECC7
        for <linux-arm-msm@vger.kernel.org>; Mon,  4 Sep 2023 23:47:41 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-9a6190af24aso321449166b.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Sep 2023 23:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693896459; x=1694501259; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gtHnKiisbpzK+NDkk8Q+svMUp3+b88bQOcuQUudC2cY=;
        b=EztF8NYRBed/IyGyZnFAv6gUmnb3Nkhl8IwRoB0aL3if7/5ikg3JxeKrTt902t6vY8
         mQf+r1pEnG1CEKjnQKutDKkPt1pGv0DVL34b3272FbBdSGjPtvNC/ZrAFPdVqeODZNRK
         N4Fwt5Ihcqb7nhnhIibbJslsISdsIfFiFY32MV/LVwBb5sJwGpSSm4ceDTDigVwWI3Z1
         VWCtSa85hSdIG+G/M8fG3c3dF3/GhIhkxdllZvKte01TaIBE3i8yrnDcxghlqiK/YqMM
         q1kPjmGJ0TZxdNC/BPulSWU54nE5CsN/afoHb3ob+jjUAF0O6xWOQbx2oC3Opq2ruusj
         6ZGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693896459; x=1694501259;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gtHnKiisbpzK+NDkk8Q+svMUp3+b88bQOcuQUudC2cY=;
        b=EgtjTrVeZCq6793j9P7I59gQV0AcJ6Du1Jk7I6sOuVNDY2tij5TTxeXRtJBWQLmnHM
         V08XmhFkk+IoVvUZ1F/vIRXtP874wVIPTEFmPEjmOJ6pHhUtE0xUHxhWJNflDWDiXmo2
         f4bRNg8uDmIC4f4IhzCvIUwL3h3yCjgbHOHDoGexEiQM6MhZ/AAhoKODlHNdG0yCzAJt
         NgoyLP20jFXoNr1H25niUlz0v9oL8pxXWD+8NzaML4RNidchUStrLg4VM/k9Q0i0CqH8
         VuoU5ex37AxXOlrczLmTAl2nKXf8vdplPfHOhHq+Qz356pyTEhu7CMZCSXL0a1dH+/Vb
         yvqQ==
X-Gm-Message-State: AOJu0YwQiN/bawNEBAqvjKELpZRhpT7GqQ5sdfOepyd6sac+yq3lud1m
        faPpWKlZ09B9VA61DzODtGT4cg==
X-Google-Smtp-Source: AGHT+IGpukQ0RDg0shaXuo4HyDBWkoifbqE/MjwhBsHs2JB7raqdMGWC20Py9PQv9ho4KHUd0+P3KA==
X-Received: by 2002:a17:906:4ad1:b0:9a1:e57a:362c with SMTP id u17-20020a1709064ad100b009a1e57a362cmr8488649ejt.9.1693896459650;
        Mon, 04 Sep 2023 23:47:39 -0700 (PDT)
Received: from [192.168.0.22] (77-252-46-238.static.ip.netia.com.pl. [77.252.46.238])
        by smtp.gmail.com with ESMTPSA id um15-20020a170906cf8f00b009928b4e3b9fsm7186471ejb.114.2023.09.04.23.47.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Sep 2023 23:47:39 -0700 (PDT)
Message-ID: <1eb37446-3d83-f7d2-7f00-a0f553bf106c@linaro.org>
Date:   Tue, 5 Sep 2023 08:47:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 1/5] dt-bindings: phy: qcom,snps-eusb2-phy: Add compatible
 for SDX75
Content-Language: en-US
To:     Rohit Agarwal <quic_rohiagar@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, vkoul@kernel.org,
        kishon@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        gregkh@linuxfoundation.org, abel.vesa@linaro.org,
        quic_wcheng@quicinc.com
Cc:     linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, kernel@quicinc.com
References: <1693889028-6485-1-git-send-email-quic_rohiagar@quicinc.com>
 <1693889028-6485-2-git-send-email-quic_rohiagar@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1693889028-6485-2-git-send-email-quic_rohiagar@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 05/09/2023 06:43, Rohit Agarwal wrote:
> Add a dt-bindings compatible string for the SDX75 SoC that
> uses Synopsis eUSB2 PHY.
> 
> Signed-off-by: Rohit Agarwal <quic_rohiagar@quicinc.com>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

