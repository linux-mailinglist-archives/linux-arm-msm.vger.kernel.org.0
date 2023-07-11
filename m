Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E3FA174E721
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jul 2023 08:22:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230107AbjGKGWU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Jul 2023 02:22:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229901AbjGKGWT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Jul 2023 02:22:19 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47D51E4D
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Jul 2023 23:22:18 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2b700e85950so80159191fa.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Jul 2023 23:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689056536; x=1691648536;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BMq0CBBNFPwdDt7sKE2WVUIr1xaLmnE621Tq72fmvlo=;
        b=KXF34s2LK1/OBl5Xe01l2pf5fI3j98hJjahYb83FRznicW3TYbQ+Fg5ZH8uGXsascY
         okgUTLfxUfg7EkXx0Y0V8GOaZt3yOlIlumpIymQe3NUZ6XaqZyBk+v8uKV8nOtob2rBB
         fE+px6vx4Sn9sYo+lebROfn9chilOiaYLkLX9a018rpqmuiGDjRtbcEnyL9fAifRGPu4
         Sas6ELlvW8K36b7aIiINkkC5jzsC/k3hxC4FmgPITxFV+pnDhKX92KQbsbZrfENT2hUl
         O0cODNDWq0hWV0xcuJCFuqd0hjN9aM8QJrj+hMISrXLBdbC6ns3RooHaOAbDknIfxULa
         VDlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689056536; x=1691648536;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BMq0CBBNFPwdDt7sKE2WVUIr1xaLmnE621Tq72fmvlo=;
        b=MmmJYjNVtYpOv5FrBN3mFISK1qIicNoORcyDQ+C27TqUg+sdE+JBHZvhRdUMCJD4pu
         5Oiwa6dZY3dVEmT3xQa99k9JSODSsxT9waNNP26Z2HtUNzdZKu42D9dAXzt+8FFoOACX
         dTA0rcQHvuCSl8/sbnDTsyvYgtgnm7mqqsQR3NmPNpKqOu1lXnv2nNBPORPJn9V19cPB
         aKfTk+Cne/N/guE5wgtEGuDBLUCoDZJRBf7l1c7kPB1t9FIjGb+a0gkLc2KesapxYC17
         1JshyrMyDBQH8kW3RLhvydX5nzNZ1U3ghADxPpWclfs4p2LaMCO19vZRm4STEGa7EyI8
         hmxA==
X-Gm-Message-State: ABy/qLbVlgkCd86by5wtxgDdpOVL0lnzfDA3tadwRRYiiizUqTIBsUza
        HtVqUXPskAxFgB3//ceY34CZt95pFWdORFwz9/Q=
X-Google-Smtp-Source: APBJJlFoMATq7vPBc/lWMvWA0+x1/ZhvVIc58N6ncv9I3EHgD/yjZVhuA/8Dad8k448XRfwAGDUJow==
X-Received: by 2002:a2e:2414:0:b0:2b6:9b01:d40d with SMTP id k20-20020a2e2414000000b002b69b01d40dmr11762664ljk.30.1689056536556;
        Mon, 10 Jul 2023 23:22:16 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id y24-20020a17090629d800b0098822e05539sm680198eje.191.2023.07.10.23.22.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Jul 2023 23:22:16 -0700 (PDT)
Message-ID: <5e46383b-9ebd-23bf-6d20-2ce8e7afc1ad@linaro.org>
Date:   Tue, 11 Jul 2023 08:22:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 2/3] dt-bindings: power: Add compatible for sdx75
Content-Language: en-US
To:     Rohit Agarwal <quic_rohiagar@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1689054169-10800-1-git-send-email-quic_rohiagar@quicinc.com>
 <1689054169-10800-3-git-send-email-quic_rohiagar@quicinc.com>
 <afbab9c3-ae67-1a30-6fc5-e031f9f30286@linaro.org>
 <0060bd2f-3884-ba12-08a6-ae7975d22e65@linaro.org>
 <3f1c7089-87ad-ffc2-4978-d7a8664c462f@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <3f1c7089-87ad-ffc2-4978-d7a8664c462f@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11/07/2023 08:20, Rohit Agarwal wrote:
> 
> On 7/11/2023 11:25 AM, Krzysztof Kozlowski wrote:
>> On 11/07/2023 07:53, Krzysztof Kozlowski wrote:
>>> On 11/07/2023 07:42, Rohit Agarwal wrote:
>>>> Add a compatible string that can be used to list PDs for sdx75.
>>>>
>>>> Signed-off-by: Rohit Agarwal <quic_rohiagar@quicinc.com>
>>>> ---
>>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>
>> Ah, I forgot: you miss device name in subject prefixes. You do not add
>> here sdx75 to all power bindings, do you? This applies to all your
>> patches and commits.
> Do you mean I need to update the subject as this?
> 
> dt-bindings: power: sdx75: Add compatible for sdx75

No, the device binding is qcom,rpmpd.

Please use subject prefixes matching the subsystem. You can get them for
example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
your patch is touching.

Best regards,
Krzysztof

