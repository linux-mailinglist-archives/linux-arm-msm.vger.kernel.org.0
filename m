Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4CD4B5F344F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Oct 2022 19:17:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229567AbiJCRRR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Oct 2022 13:17:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229496AbiJCRRQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Oct 2022 13:17:16 -0400
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2B5FB78;
        Mon,  3 Oct 2022 10:17:15 -0700 (PDT)
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-1326637be6eso4000078fac.13;
        Mon, 03 Oct 2022 10:17:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=CANTQZBq/XOoWfsVPPKw2QGH5c/AInZS7NKEUTcpJzY=;
        b=jQt6USMEDp0ZWpjjKGqYOUvSkzWaFSv+NccKowlg1C+bLKGTN2q+GhxPdRZBXS1E1O
         bUjWZMorKzxjl0T+JnDDh66up2ChFRSYTo8/NzkF1NMWRcYWYUzB6iz4cFaZ4M3yL+z1
         0Cv/JnOQRRdssowcUiK1szWk87Q8DduaDvZmzBnG/w89OaLbnHKU+TBoiWRrXaqUoXF7
         JWwCf9SDrkjrXoUeSswTbqffj25T1poy8voK2A3vGpvSpzJQEfphkuBOve0RLQL4iWV0
         RXZVv/NykRKqOihTC4l+aWeNzzNO/KeSjY1nn+Fw4rJq/G7UwvpXQseMbdpMo7etcOPH
         rgDg==
X-Gm-Message-State: ACrzQf148B+YT1nrnYWEnS8/BTn2cDzG7LyoqriypSqzbU0v0ipNt5ni
        gipw/Af0nBpR5rZZOAnMiUBrniHoVg==
X-Google-Smtp-Source: AMsMyM5v0Lgx7wk6GOTnYj4CjNsmfgYXKP5OcTltqEkGl8KwYBU0LkcKBqrlhPSVFrY9tFx5or8q3w==
X-Received: by 2002:a05:6870:d6a6:b0:127:ef52:75db with SMTP id z38-20020a056870d6a600b00127ef5275dbmr5966593oap.232.1664817434950;
        Mon, 03 Oct 2022 10:17:14 -0700 (PDT)
Received: from macbook.herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id 7-20020a4a1507000000b004767df8f231sm2144344oon.39.2022.10.03.10.17.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Oct 2022 10:17:14 -0700 (PDT)
Received: (nullmailer pid 2466855 invoked by uid 1000);
        Mon, 03 Oct 2022 17:17:14 -0000
Date:   Mon, 3 Oct 2022 12:17:14 -0500
From:   Rob Herring <robh@kernel.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: soc: qcom: YAML-ify SSBI bindings
Message-ID: <20221003171714.GA2462016-robh@kernel.org>
References: <20220930212052.894834-1-dmitry.baryshkov@linaro.org>
 <d1a26c97-75db-5d09-4c4f-77ed4fed1683@linaro.org>
 <CAA8EJpoUtfWFR315jiC8PzPQydM9kT3kQYeqyOav-P9=qZKO2w@mail.gmail.com>
 <4658c7bc-b26f-d22b-73ea-9deb7d29f90f@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4658c7bc-b26f-d22b-73ea-9deb7d29f90f@linaro.org>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Oct 03, 2022 at 08:46:09AM +0200, Krzysztof Kozlowski wrote:
> On 02/10/2022 15:46, Dmitry Baryshkov wrote:
> >>> +    enum:
> >>> +      - ssbi
> >>> +      - ssbi2
> >>> +      - pmic-arbiter
> >>> +
> >>> +  pmic:
> >>> +    type: object
> >>
> >> This is quite unspecific... Can we make it a ref to some PMICs schemas?
> > 
> > Yes, I thought about listing all compats, but probably a $ref:
> > ../mfd/qcom-pm8xxx.yaml# makes more sense.
> 
> Then full path - /schemas/mfd/qcom-....

While effectively it's always a QCom PMIC, this is a bus binding, so 
shouldn't it just be 'additionalProperties: { type: object }' without 
any reference to the type of device?

Rob
