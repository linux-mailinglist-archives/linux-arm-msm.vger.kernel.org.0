Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E222455EF9C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jun 2022 22:29:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231769AbiF1U3S (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Jun 2022 16:29:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232465AbiF1U3A (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Jun 2022 16:29:00 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F20A5CE0C
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jun 2022 13:28:13 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id i18so24290069lfu.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jun 2022 13:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:user-agent:in-reply-to:references
         :message-id:mime-version:content-transfer-encoding;
        bh=czcHDitp/KKFpz2Zm7B25Ec2yqHhKnm9gQ8OoMXa6Wc=;
        b=tW/MyVEei2l1iolFz/U/Z70Ud77JO4yugINvQHVlL6JM4y5ftJxU/6RupaieCpJ5Nr
         NnA0M63Cq0GM07eZ2TNcKLGNNJyyk/73XPMnKc7C8OARb47V1rOLCIp4L4CDizeWyijd
         SLHXzDXQIqvrtL/drSo+Z+mjq3zoampbQe7xuN5bpKAbxPdIcGMFszivolecvB1Fkj8E
         HoUjLgwgT/OpxjSX0r0EdOuy1taGk5FCzbFeDQBDlAurcG3e3PYT2VWqsgWUQ+gcj2ku
         669RC4co7zA86AC4jJz99ovbogSa028jSpgc+05S+8g7O1uide89QklKNTmt576PistC
         IcLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:user-agent:in-reply-to
         :references:message-id:mime-version:content-transfer-encoding;
        bh=czcHDitp/KKFpz2Zm7B25Ec2yqHhKnm9gQ8OoMXa6Wc=;
        b=IHVQn5M/UowaxmvmmQqsjp88onMy7Kxpf3ZWTsTbO2tfMDPdxvWCjVHStpPN1cZagE
         VO7u5USOfV/FTCN33lDa+NtySZKae8ju4BwFMREdS7/wK0BQDXMupDyasE+LcjpNrs3c
         yq6a287FW1+ktjoxDxx0AjJxxA5m3Qk/2AxKdBoYtec78GfMm72b8euseFU0CfGz2QMO
         LPnhTWUlY61/InbGW+Jx8lXhthCN6wBKTxktBURM6BybHGX8FYA8zC3N0mwLbWCMVn80
         wA1frTCJ9Vr3T3PNOLBnr/IFe9jPXQMZ/QtuULHFxuJaLCoC+pKYU20Dsd7mrbP/hyzM
         RG1Q==
X-Gm-Message-State: AJIora+vWUIeNDRlvTaCYYdZ+U7t7dvUDK+OsRXFDGKlLcUDiVMWfpL3
        WqkJ/88o7KghTXuvMPi+NMwM6g==
X-Google-Smtp-Source: AGRyM1uzCk7QiPQhUl6l94ftELy4OD2BZOzucOCR4LCpMBHTFV6FghgZptYpAfmhlTfeNz2dVgYNWg==
X-Received: by 2002:a05:6512:2810:b0:47f:a76c:8770 with SMTP id cf16-20020a056512281000b0047fa76c8770mr14390644lfb.116.1656448092338;
        Tue, 28 Jun 2022 13:28:12 -0700 (PDT)
Received: from [127.0.0.1] ([188.162.64.167])
        by smtp.gmail.com with ESMTPSA id u10-20020ac258ca000000b004813963179fsm81965lfo.230.2022.06.28.13.28.11
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 Jun 2022 13:28:11 -0700 (PDT)
Date:   Tue, 28 Jun 2022 23:28:05 +0300
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Herring <robh@kernel.org>
CC:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_02/11=5D_dt-bindings=3A_display/msm?= =?US-ASCII?Q?=3A_move_qcom=2Csdm845-mdss_schema_to_mdss=2Eyaml?=
User-Agent: K-9 Mail for Android
In-Reply-To: <20220628143827.GA425727-robh@kernel.org>
References: <20220625232513.522599-1-dmitry.baryshkov@linaro.org> <20220625232513.522599-3-dmitry.baryshkov@linaro.org> <20220628143827.GA425727-robh@kernel.org>
Message-ID: <031FC304-6407-4CC2-B1B7-F7365CF2F4E7@linaro.org>
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



On 28 June 2022 17:38:27 GMT+03:00, Rob Herring <robh@kernel=2Eorg> wrote:
>On Sun, Jun 26, 2022 at 02:25:04AM +0300, Dmitry Baryshkov wrote:
>> Move schema for qcom,sdm845-mdss from dpu-sdm845=2Eyaml to mdss=2Eyaml =
so
>> that the dpu file describes only the DPU schema=2E
>>=20
>> While we are at it, rename display-controller node to mdp to reflect
>> actual node name in the sdm845=2Edtsi file=2E
>>=20
>> Signed-off-by: Dmitry Baryshkov <dmitry=2Ebaryshkov@linaro=2Eorg>
>> ---
>>  =2E=2E=2E/bindings/display/msm/dpu-sdm845=2Eyaml      | 137 +++++-----=
--------
>>  =2E=2E=2E/devicetree/bindings/display/msm/mdss=2Eyaml | 112 ++++++++++=
++--
>>  2 files changed, 135 insertions(+), 114 deletions(-)
>
>What's the base for this series? Patch 1 applied, the rest did not=2E

I was developing on top of the drm-msm-lumag tree, part of Linux-next=2E H=
owever I think 5=2E19-rc + [1] will work=2E

[1] https://lore=2Ekernel=2Eorg/all/1654166998-14907-1-git-send-email-quic=
_mkrishn@quicinc=2Ecom/


