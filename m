Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4854B5609DB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jun 2022 20:58:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230267AbiF2S6L (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Jun 2022 14:58:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229729AbiF2S6K (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Jun 2022 14:58:10 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F086CBF40
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jun 2022 11:58:05 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id by38so20079748ljb.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jun 2022 11:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:user-agent:in-reply-to:references
         :message-id:mime-version:content-transfer-encoding;
        bh=QYZAgrfhk49lzLUuFjw6B1O7Zz6sl6FqL+L4Ejbb/r4=;
        b=qSia/dWyaWJ9BNfd7r3B8IDOa994IYlAmU2aa/+oHVn4fpjphPOg7L6/tfkI33z7A8
         us7a5wZ1HFmxvyYimOJZU3qWHVq6OcOh1M25XTuc+C6KasU77ONzrIIFv5UPyZ55YbHL
         Z4bdq5el5TRvSCUUpcdXvlYLmsW4OEN+HB3tZYEJUgqeaHBNclIOScCLN7QW4TiEyM+a
         de9SGChXZ6LdTUXNFe3jzLLGwyQpFp3EgUcnJy28POPwlaxh0R3yQvKYfGRwif2g95JZ
         GhRqPMWDzN5U1bRyHexW1YkQ/+GzhdO04ePNp1WZmranQ7B645Zd1Qxu8UGnhcfTebHe
         TFVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:user-agent:in-reply-to
         :references:message-id:mime-version:content-transfer-encoding;
        bh=QYZAgrfhk49lzLUuFjw6B1O7Zz6sl6FqL+L4Ejbb/r4=;
        b=6yCB1LG4UyjrKjpgRcwhG9OYj03AYU//sDpB6w2JQty7kO6jmLSAP87B/sWg5mE9JT
         TWYkrwjOwg2FDOMMdFNehkua2ZJ0CSjUwydviqPQjihnqpqshikGvy4f8AnPz4NIyqOx
         BRdzvYLgctmgIUaZ2EQ0Wx4CubnV74g+RfCO8owfV4Swo6k5hwX1WPUp5gBngvZ3xoOQ
         UIGbhmFrsxpqD1agiDi9ba6TdVc28J2PtfZ2YDCHFipe2ECHA7GqkOy7Bxyuj3LU6atg
         YZ/Bocw1Da3GJmBhsUdNjY2mvZr1keNHLuOnVYMOcvWmUV3ekQIFYLk6T0yHtKgzvAEM
         STFw==
X-Gm-Message-State: AJIora9vDbjlFhyqYCGSpSm5cofrmsjyQwQAcTjVCJ56TqYf+gsLQR/z
        l2aJhr7fsILLWADJJmkLp9d1zg==
X-Google-Smtp-Source: AGRyM1vK3aRgMtM4vp3JC8oLZ1h6/8DljR5JiFPtpWzVEDfclPLBY/0pg6p1L99EUupCdECV+pl1BQ==
X-Received: by 2002:a2e:8552:0:b0:25a:99bd:5f9e with SMTP id u18-20020a2e8552000000b0025a99bd5f9emr2821338ljj.519.1656529084357;
        Wed, 29 Jun 2022 11:58:04 -0700 (PDT)
Received: from [127.0.0.1] ([94.25.229.210])
        by smtp.gmail.com with ESMTPSA id h15-20020a2eb0ef000000b00255500154fasm2248617ljl.52.2022.06.29.11.58.03
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 29 Jun 2022 11:58:03 -0700 (PDT)
Date:   Wed, 29 Jun 2022 21:57:58 +0300
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh@kernel.org>
CC:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_08/11=5D_dt-bindings=3A_displa?= =?US-ASCII?Q?y/msm=3A_add_mdp-opp-table_to_dpu-sdm845?=
User-Agent: K-9 Mail for Android
In-Reply-To: <6e1b37e6-83e8-a920-61d9-044b08e93605@linaro.org>
References: <20220625232513.522599-1-dmitry.baryshkov@linaro.org> <20220625232513.522599-9-dmitry.baryshkov@linaro.org> <20220627180506.GA2679395-robh@kernel.org> <772E0163-AC47-47E1-A0C6-CA04CA874282@linaro.org> <6e1b37e6-83e8-a920-61d9-044b08e93605@linaro.org>
Message-ID: <5407A5CD-D8AF-41B3-9F16-67A30940D844@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 29 June 2022 12:23:48 GMT+03:00, Krzysztof Kozlowski <krzysztof=2Ekozlo=
wski@linaro=2Eorg> wrote:
>On 28/06/2022 22:23, Dmitry Baryshkov wrote:
>
>>>> +    $ref: /schemas/opp/opp-v2=2Eyaml#
>>>> +
>>>>    ports:
>>>>      $ref: /schemas/graph=2Eyaml#/properties/ports
>>>>      description: |
>>>> @@ -116,11 +120,12 @@ examples:
>>>>                            <0x0aeb0000 0x2008>;
>>>>                      reg-names =3D "mdp", "vbif";
>>>> =20
>>>> -                    clocks =3D <&dispcc DISP_CC_MDSS_AHB_CLK>,
>>>> +                    clocks =3D <&gcc GCC_DISP_AXI_CLK>,
>>>> +                             <&dispcc DISP_CC_MDSS_AHB_CLK>,
>>>
>>> What does the OPP table have to do with clocks? Adding a clock anywher=
e=20
>>> but the end is an ABI break=2E
>>=20
>> I should split this to a separate patch=2E And, I must admit, this cloc=
k change has already landed=2E We did not think that it is an ABI break sin=
ce we have clock-names here=2E
>
>xxx-names are only a helper and order of items is always strict, thus
>any change in the order is always ABI break=2E

Ack, we will keep this in mind=2E However in this case we have already mad=
e this change=2E So the question in his do we cope with it=2E

--=20
With best wishes
Dmitry
