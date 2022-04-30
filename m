Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A8356515E72
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Apr 2022 16:54:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243996AbiD3O5q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 30 Apr 2022 10:57:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239766AbiD3O5p (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 30 Apr 2022 10:57:45 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8DE7506DA
        for <linux-arm-msm@vger.kernel.org>; Sat, 30 Apr 2022 07:54:23 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id m20so20370482ejj.10
        for <linux-arm-msm@vger.kernel.org>; Sat, 30 Apr 2022 07:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=dWEd/3Nb8Itqg/tkRZgxGxUockibAnTciuG63bql54k=;
        b=d/UySQ4Cy6RXYaosrLS19vyorEgZ2IWJtJ79R3CH69wMgohLp+v3oQoBy269ff9lEE
         nG/pMy6GMo9nngY9QlisyBNq/X/dOFJbPjkrpykreKKv0D9UeZvey2ch6aUC+Dz8VRbi
         aJB86ZTsYQZvQUlPsHn1iFI/UpI287KSq+cdxtYbvQMPMgh250DIBXFRuhKex/em9+4h
         LaZpqadMABxMLJhe6iQ9jFemV/xKIpbdeyWSQ5/MT/K+2sUvBORAZ2mz9KF37VUIFXS5
         i79gGYTgymoGOyGv2Uutu2xNWJspRVRxJcgpPRN4IG0AalqrQEFV5wxmxFNHE7vos3Tr
         K02g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=dWEd/3Nb8Itqg/tkRZgxGxUockibAnTciuG63bql54k=;
        b=uImtSoaWuS38IzSVvP4lPIzisLFEECn3Sa7REEtunT3c1SU/DJfk7NjaIdn5u8uy5T
         S/8P2VMq93tGRrzrZqJDPawXYKITT279rBX8M2Fp9aI3etk3Q/PpzpUoOxJT+XQiBFhg
         FbPXdsvIT0+LK9DqFMQCyPgs5UYeBGtEGGVyP/wSNo42HfdeewfuQL1hBabJtwhJcSVm
         K/807b/pE12ElUeD/2TotZVttHpHFYZc5ghJF51pv9f7PAL3ELuPqdVdP+squp6Blby2
         5Oyhxn1i9Nx4eUtVstUfOGtYYMDkiY0il9/ebWwAUBbKyDj1bW/g0U1zwn4Aed7YDArf
         yq/g==
X-Gm-Message-State: AOAM5311UdIXrJyn5mIpbleDUqIZp1d8LJ9oVcDe3NDT+StknbTLnLOa
        M3RudXJdC5H/lpDVLIha7YQcJQ==
X-Google-Smtp-Source: ABdhPJyxP22ZX1yTun8Doyf2QTaUGaMugN0I6TjhJMr0c/d74Bak0nsBk+dqYlWLcpkAPwMntTqW2w==
X-Received: by 2002:a17:907:7fa8:b0:6f3:e975:abfa with SMTP id qk40-20020a1709077fa800b006f3e975abfamr4002499ejc.86.1651330462301;
        Sat, 30 Apr 2022 07:54:22 -0700 (PDT)
Received: from [192.168.0.180] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id a25-20020a056402169900b0042617ba63c8sm4223267edv.82.2022.04.30.07.54.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 30 Apr 2022 07:54:21 -0700 (PDT)
Message-ID: <8ca89d2b-e3cd-8565-aba7-e7b0215664f2@linaro.org>
Date:   Sat, 30 Apr 2022 16:54:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v5 6/7] dt-bindings: PCI: qcom: Support additional MSI
 interrupts
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org
References: <20220429214250.3728510-1-dmitry.baryshkov@linaro.org>
 <20220429214250.3728510-7-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220429214250.3728510-7-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 29/04/2022 23:42, Dmitry Baryshkov wrote:
> On Qualcomm platforms each group of 32 MSI vectors is routed to the
> separate GIC interrupt. Document mapping of additional interrupts.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
