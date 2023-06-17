Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AEABE733F6E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Jun 2023 10:05:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232118AbjFQIFg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 17 Jun 2023 04:05:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346290AbjFQIF2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 17 Jun 2023 04:05:28 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAC2F2D44
        for <linux-arm-msm@vger.kernel.org>; Sat, 17 Jun 2023 01:05:18 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-987accb4349so40221566b.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 17 Jun 2023 01:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686989117; x=1689581117;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Xxp1rn5hr+h9i5CaSCoSMQfGudBpVIHRUp4VzBJuSvc=;
        b=JnNWThApOs1c+QHy+rxQAxoWpul4bmzp8MCbxpakMq8fTUDzGCHNa7a3z5G/duP6kB
         jTv86bXYZeOJU2Ucy/3TdGyEII19qAfCv6PyL2z2TyuE0VIHNlcRt8FWZ+UeXDfRiyOL
         kwilDJsdyQSGwvxi6S2IHFzYI30orRM+LdOC0l5ElCP23sbjzbAIR3mpw5o45RF8V3MZ
         nGFqK0c+ouKQxulGayoQ3QJnlF/yY9AKfM6iYqbCgM6zRI/z2rfb14a+HfTx4KP3IfcY
         lk8SxnFRZaypg8fCmdnFUqkMXAyDdvbZUKdg5+L0vEFTWArjbcltDWfP0Fuxe/EYw7FK
         Heyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686989117; x=1689581117;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xxp1rn5hr+h9i5CaSCoSMQfGudBpVIHRUp4VzBJuSvc=;
        b=HYJXOM4yNPL046O+gSGm5T6Ttzv2ZtQ6/uwD/q576PJRWE5Wjlmqn8sQEwdxcAi05P
         VUsRPegSmijTRyvCJRIo+TZffhrP1h0K629VlwRMzJEBOcE/hCSAm1qhQxmiRa9c4Q30
         PZfxFb8wdZb4Ix65+BwbHeY7IZTo2/vPVxSzIPhHZrwKHLPCyPO5GWqM97UNPV1zp5Dj
         ifG0XcSdhvtIYZB70EnUSRuP4Pyw5JM07IJqip4J7hCWfU4AVCd84t4imw9DMAykvHFw
         jIXn6zT00YXNVN962zOIjwJnZ1R4LK1zZZJ4mHPM0bXM6/B0JU6HbvQMUugPyBPwtNAE
         r1Sg==
X-Gm-Message-State: AC+VfDyC9EAEPyavPCgAkbL2AgWr3GesM3GiWHyXgduorUVS/bfF3QBH
        ScGhKucZAWxNZ5fJ+KnYrZPG4g==
X-Google-Smtp-Source: ACHHUZ7fzVWC4mhfliHqEDlzKPRaPGVXyC+HO8O3hGv23dOoVZW7qwbG1HBrzyGlqbPOtTI0vuXcFQ==
X-Received: by 2002:a17:906:9b91:b0:982:227e:1a16 with SMTP id dd17-20020a1709069b9100b00982227e1a16mr4453886ejc.13.1686989116772;
        Sat, 17 Jun 2023 01:05:16 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id lo11-20020a170906fa0b00b009784915c660sm11812986ejb.136.2023.06.17.01.05.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Jun 2023 01:05:16 -0700 (PDT)
Message-ID: <d2641843-3c00-2b38-709b-0f418328d525@linaro.org>
Date:   Sat, 17 Jun 2023 10:05:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3 06/13] dt-bindings: remoteproc: Add Qualcomm RPM
 processor/subsystem
Content-Language: en-US
To:     Stephan Gerhold <stephan@gerhold.net>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
References: <20230531-rpm-rproc-v3-0-a07dcdefd918@gerhold.net>
 <20230531-rpm-rproc-v3-6-a07dcdefd918@gerhold.net>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230531-rpm-rproc-v3-6-a07dcdefd918@gerhold.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 15/06/2023 18:50, Stephan Gerhold wrote:
> On Qualcomm platforms, most subsystems (e.g. audio/modem DSP) are
> described as remote processors in the device tree, with a dedicated
> node where properties and services related to them can be described.
> 
> The Resource Power Manager (RPM) is also such a subsystem, with a
> remote processor that is running a special firmware. Unfortunately,
> the RPM never got a dedicated node representing it properly in the
> device tree. Most of the RPM services are described below a top-level
> /smd or /rpm-glink node.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

