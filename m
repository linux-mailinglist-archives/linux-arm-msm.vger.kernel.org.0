Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F9E14CF459
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Mar 2022 10:11:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236254AbiCGJMD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Mar 2022 04:12:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236258AbiCGJMC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Mar 2022 04:12:02 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CB8265160
        for <linux-arm-msm@vger.kernel.org>; Mon,  7 Mar 2022 01:11:01 -0800 (PST)
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id E145B3F610
        for <linux-arm-msm@vger.kernel.org>; Mon,  7 Mar 2022 09:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1646644257;
        bh=5EuchempEFVBJsNObrSN9bZUlyRNhaE6rhfvz/HPvrQ=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=FCKHsAjxIiszKg7WiuKmX0m2xEQTunLuGzFVsxSItLLOz5wcQlCAAG/gOfS/aqZjQ
         0tQOJWsWXMGf6nVXBfi0oM3gVC/U+uQ66AhiYcEnuVXaHeTGZSd1lfLnZjzv7p5Ph3
         X7rulIn7YJ6V0G2ysDcIo+VTEh3McnhceMxbV4HhdPHBeEqiol7QMXTfwbZY/LTmJR
         uUy/JymvQC1ALxlEmNXtGOkqe+ba0tkPDId+Oyf7bX52k6ct+iQPOzqh62UazcP0DN
         RaAlJcViicM1sSfTyyvL1Q4sZyUazTWcjbA9A0fs0vHeLk/fcySINRoV2kdxXTJhcg
         nIkOaFibL2DTQ==
Received: by mail-ed1-f71.google.com with SMTP id l14-20020aa7cace000000b003f7f8e1cbbdso8217198edt.20
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Mar 2022 01:10:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=5EuchempEFVBJsNObrSN9bZUlyRNhaE6rhfvz/HPvrQ=;
        b=JFG+cqYziPHdxBvMr1xA1hYEtVC0S2ib9m1C7ZJ96iacao3iOFGzk+KaBc90kMv5ok
         MZOJwJi3COQBV+p4wz5sl4APfyki/6mvhIMrPTtf54igfZAFWK6FIrCgjEJam6iZhq7I
         JY1LNJOTnQGumi2HZe6/0QoypqenY9oQB1ycNQrm8GMK2K2NFw9jFDzNud1BiLhAEZTZ
         h15tBJDMXE+3HvyIrOUVolivlUO00GQJeF5RXH1OrUWBpkl0f1EJJKplSvh+rm4KOnus
         B/pKUzpPhK/HFr5+LTeb+Wf+zZx0zqD2mUDbOOHBH8ORlE/gX9G8RrMR6J7evu5U1aNR
         f46A==
X-Gm-Message-State: AOAM5304kZRuSTXnu+o75wxj6YuKEQlditutFF0ot0/H+41wcghf5U0Z
        mSEBeq7IVxIr3nyyKWHj4fDm2RxOzjmqS3uWjN9w29LRy149pAKPH+C18WW/qqE7T2S0TI+gq6/
        BAibhciN0AYSi8pTsVw9sHFaZVeeTA0vbaSnlOTbFTo0=
X-Received: by 2002:a17:906:aed4:b0:6da:aa56:c923 with SMTP id me20-20020a170906aed400b006daaa56c923mr8053755ejb.148.1646644257480;
        Mon, 07 Mar 2022 01:10:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwtBtJQDeExiXsvhuBndc2H+XAln/uM67ymh7Rq5QR/XjrVGGF3p74nHBCcZCCYoYOwudMCpA==
X-Received: by 2002:a17:906:aed4:b0:6da:aa56:c923 with SMTP id me20-20020a170906aed400b006daaa56c923mr8053730ejb.148.1646644257300;
        Mon, 07 Mar 2022 01:10:57 -0800 (PST)
Received: from [192.168.0.141] (xdsl-188-155-174-239.adslplus.ch. [188.155.174.239])
        by smtp.gmail.com with ESMTPSA id kv9-20020a17090778c900b006da693d5e91sm4442728ejc.122.2022.03.07.01.10.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Mar 2022 01:10:56 -0800 (PST)
Message-ID: <02bd539c-f704-dbe5-4d58-fc62314025a7@canonical.com>
Date:   Mon, 7 Mar 2022 10:10:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 03/12] dt-bindings: ufs: cdns,ufshc: convert to
 dtschema
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>
Cc:     Matthias Brugger <matthias.bgg@gmail.com>,
        Andy Gross <agross@kernel.org>, Jan Kotas <jank@cadence.com>,
        linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Avri Altman <avri.altman@wdc.com>,
        Wei Xu <xuwei5@hisilicon.com>, devicetree@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Li Wei <liwei213@huawei.com>, linux-kernel@vger.kernel.org,
        Stanley Chu <stanley.chu@mediatek.com>
References: <20220306111125.116455-1-krzysztof.kozlowski@canonical.com>
 <20220306111125.116455-4-krzysztof.kozlowski@canonical.com>
 <1646623480.209864.1496443.nullmailer@robh.at.kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <1646623480.209864.1496443.nullmailer@robh.at.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 07/03/2022 04:24, Rob Herring wrote:
> On Sun, 06 Mar 2022 12:11:16 +0100, Krzysztof Kozlowski wrote:
>> Convert the Cadence Universal Flash Storage (UFS) Controlle to DT schema
>> format.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
>> Reviewed-by: Rob Herring <robh@kernel.org>
>> ---
>>  .../devicetree/bindings/ufs/cdns,ufshc.txt    | 32 ---------
>>  .../devicetree/bindings/ufs/cdns,ufshc.yaml   | 68 +++++++++++++++++++
>>  .../devicetree/bindings/ufs/ti,j721e-ufs.yaml |  7 +-
>>  3 files changed, 71 insertions(+), 36 deletions(-)
>>  delete mode 100644 Documentation/devicetree/bindings/ufs/cdns,ufshc.txt
>>  create mode 100644 Documentation/devicetree/bindings/ufs/cdns,ufshc.yaml
>>
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/ufs/cdns,ufshc.example.dt.yaml: ufs@fd030000: freq-table-hz: 'anyOf' conditional failed, one must be fixed:
> 	[[0, 0], [0, 0]] is too long
> 	[0, 0] is too long
> 	From schema: /usr/local/lib/python3.8/dist-packages/dtschema/schemas/property-units.yaml
> 

This will be fixed with my dtschema patch:
https://github.com/devicetree-org/dt-schema/pull/69


Best regards,
Krzysztof
