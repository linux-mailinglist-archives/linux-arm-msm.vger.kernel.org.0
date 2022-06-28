Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0A28855EF92
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jun 2022 22:26:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233204AbiF1UZ4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Jun 2022 16:25:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229748AbiF1UZg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Jun 2022 16:25:36 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAA692CDF5
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jun 2022 13:23:34 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id x3so24326674lfd.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jun 2022 13:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:user-agent:in-reply-to:references
         :message-id:mime-version:content-transfer-encoding;
        bh=PSiDBq1vHVGruF5gmift1cVNTE3Pc+1B023GXA2YLB0=;
        b=rXMj0QvvPFuZZACKXgsVU3QtxEZVwkYfhioneWIZToSxJKdleOY4aM/47BoW7/8LjU
         +qG1Ht609bqqOTare592WDTS0g8AGy77YtXndgidzqO0JhC184d46Kv6Hu/2KL2sVCLa
         4z/bLtat5iVoSuZOQI65xuj8q+OE+wu8QeT973aLh6YczE3V+FzmxSIQoHPPGUU615Ss
         Q+XhbusB8tvRvHRbBPoI5JkS8nduDHCqai8OTVuwjq7DjXVCxBK1YN4AvUB0NJKIvvpL
         /HOcPxzo4PWHW4YgjtAWhxWJq78UXV41zPF7sIbVTmgkITpbblf79W4rkjbzOlCDXIG5
         I4mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:user-agent:in-reply-to
         :references:message-id:mime-version:content-transfer-encoding;
        bh=PSiDBq1vHVGruF5gmift1cVNTE3Pc+1B023GXA2YLB0=;
        b=o8N3UAHe4QkVeueQf0SqrH8DNQb7lP3yE0KEor647O2tFkcLtfW69wdVx6BbWwB95w
         vPRw5sZB+XGe2LHmxppezyY+raMG5vWLrLyknFU8/XtcMOQBWqNlqbTzJGdyLh3NbuQG
         E3yrBzuiDbqILvXMF7cwyblzD2XBRV+x86QC40WPnDPaDyAOHYJMsdu41RIn8caC81Zc
         iNGUmKIa/t5fIfvL2ZzS2QJwBdmq6SwrVVJOYMPpsep1tBXjhe/vBvIh5+AkOE4RbZAA
         r4uz21G3B56QJ7WriIcBMjXnqTup+ksojjOFNkwIX/V+zL0sEEaA/Iuo2/HM4XJSDoGD
         G8Tg==
X-Gm-Message-State: AJIora+RsH2Z6Um/1i+izPd2fBifRk0PYL4Kwkn+QR93D72hsddQaoXT
        Ew7lQqU5ioe/r9kAkVMmKGcJLjfd4pqhag==
X-Google-Smtp-Source: AGRyM1tDeENnyhfxSshBuZ+qiok+9180c45UZ+TKyeeKPYkVKtwRGFHLRib4/fs3xuOZVTdUEQ+hrQ==
X-Received: by 2002:ac2:5df7:0:b0:47f:640d:45e8 with SMTP id z23-20020ac25df7000000b0047f640d45e8mr12573068lfq.21.1656447812537;
        Tue, 28 Jun 2022 13:23:32 -0700 (PDT)
Received: from [127.0.0.1] ([188.162.64.167])
        by smtp.gmail.com with ESMTPSA id bj11-20020a2eaa8b000000b0025a72db0cf1sm1903233ljb.118.2022.06.28.13.23.31
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 Jun 2022 13:23:32 -0700 (PDT)
Date:   Tue, 28 Jun 2022 23:23:28 +0300
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Herring <robh@kernel.org>
CC:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_08/11=5D_dt-bindings=3A_displa?= =?US-ASCII?Q?y/msm=3A_add_mdp-opp-table_to_dpu-sdm845?=
User-Agent: K-9 Mail for Android
In-Reply-To: <20220627180506.GA2679395-robh@kernel.org>
References: <20220625232513.522599-1-dmitry.baryshkov@linaro.org> <20220625232513.522599-9-dmitry.baryshkov@linaro.org> <20220627180506.GA2679395-robh@kernel.org>
Message-ID: <772E0163-AC47-47E1-A0C6-CA04CA874282@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 27 June 2022 21:05:06 GMT+03:00, Rob Herring <robh@kernel=2Eorg> wrote:
>On Sun, Jun 26, 2022 at 02:25:10AM +0300, Dmitry Baryshkov wrote:
>> On SDM845 platforms DPU device tree node contains child object
>> mdp-opp-table providing OPP table for the DPU=2E Add it to the list of
>> properties to let sdm845=2Edtsi to validate=2E
>>=20
>> Signed-off-by: Dmitry Baryshkov <dmitry=2Ebaryshkov@linaro=2Eorg>
>> ---
>>  =2E=2E=2E/devicetree/bindings/display/msm/dpu-sdm845=2Eyaml      | 9 +=
++++++--
>>  1 file changed, 7 insertions(+), 2 deletions(-)
>>=20
>> diff --git a/Documentation/devicetree/bindings/display/msm/dpu-sdm845=
=2Eyaml b/Documentation/devicetree/bindings/display/msm/dpu-sdm845=2Eyaml
>> index 0dc16326bf8e=2E=2Ecc95adcf8f11 100644
>> --- a/Documentation/devicetree/bindings/display/msm/dpu-sdm845=2Eyaml
>> +++ b/Documentation/devicetree/bindings/display/msm/dpu-sdm845=2Eyaml
>> @@ -50,6 +50,10 @@ properties:
>>      maxItems: 1
>> =20
>>    operating-points-v2: true
>> +
>> +  mdp-opp-table:
>
>Is there another kind of opp-table besides mdp? Node names should be=20
>generic=2E

Ack=2E Now if we rename the node to opp-table, should we define the old na=
me with deprecated: true?

>
>> +    $ref: /schemas/opp/opp-v2=2Eyaml#
>> +
>>    ports:
>>      $ref: /schemas/graph=2Eyaml#/properties/ports
>>      description: |
>> @@ -116,11 +120,12 @@ examples:
>>                            <0x0aeb0000 0x2008>;
>>                      reg-names =3D "mdp", "vbif";
>> =20
>> -                    clocks =3D <&dispcc DISP_CC_MDSS_AHB_CLK>,
>> +                    clocks =3D <&gcc GCC_DISP_AXI_CLK>,
>> +                             <&dispcc DISP_CC_MDSS_AHB_CLK>,
>
>What does the OPP table have to do with clocks? Adding a clock anywhere=
=20
>but the end is an ABI break=2E

I should split this to a separate patch=2E And, I must admit, this clock c=
hange has already landed=2E We did not think that it is an ABI break since =
we have clock-names here=2E

>
>>                               <&dispcc DISP_CC_MDSS_AXI_CLK>,
>>                               <&dispcc DISP_CC_MDSS_MDP_CLK>,
>>                               <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
>> -                    clock-names =3D "iface", "bus", "core", "vsync";
>> +                    clock-names =3D "gcc-bus", "iface", "bus", "core",=
 "vsync";
>> =20
>>                      interrupt-parent =3D <&mdss>;
>>                      interrupts =3D <0>;
