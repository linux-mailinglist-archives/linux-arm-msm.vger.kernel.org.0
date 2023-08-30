Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D3E078E012
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Aug 2023 22:16:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239199AbjH3UIV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Aug 2023 16:08:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239850AbjH3UID (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Aug 2023 16:08:03 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90AEC3171E
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Aug 2023 12:55:31 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-68a440a8a20so30923b3a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Aug 2023 12:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693425260; x=1694030060; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YJMdw/C4AyMPoyB2tq4Z62TY5NrdXD5YnDuPj2zmJiM=;
        b=Em+EaU/DCJVGjRDwmNwc/tTue200oGR6xG34EazfO1ju3e88vrHCOcVq1f25uVWJv6
         M94+WtlqiYh10S2MGmUT84HGmgVHNoPugfXx7KIC+kXT34whg+wd4YxnEny5BYB0wJ+d
         5DwQbM30tS2zTyH7aYzx3avVpsSkWL2Nq1wHAxWPXJC86I36W6mjy9wi3UNUx5P+fmtu
         PO7YrlPIhRcAQabKiQDdxJExsoJ3CU3szXundivg9uCeZ8cxsnMC3gSb815OPuiRCVpI
         7F6IQKJe/KrRAV2Tm99SzX2FK9smmA+YXORVOEcnCV39eCyqZyxZoW2NiJRjMCsUzpUR
         GBBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693425260; x=1694030060;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YJMdw/C4AyMPoyB2tq4Z62TY5NrdXD5YnDuPj2zmJiM=;
        b=lMb3Qi4y7sJv9PP+aGao0ics/my56edVUU1h8iKIIXqgLVujOqH7YMEiNQw44THqJT
         CvE+PfaIEOROZI8onYqo/Q/kN82SDXINRKYlv+KZeiNOu+xdOeUQrRGS9aDbkoLOxv3Y
         uCDMijVLlENhzNv7HuuWzrNZbynO7RgrlvAMWa3VTWDSa/efCER05h23OyYW13r0YueI
         pv554UcH4gtNwwaMV9QP5HfX79FuyU7ec2MTxLh9AC8w7c9Om6hOQBV7dv0JNojTuzRp
         MMbaUwFU5Bw3DlvX5J3jnifjvZP4ZeC0X2nbHzbJPp7xddlB3yEDeBpsfFOTDtk2WBN2
         uuJg==
X-Gm-Message-State: AOJu0Yx8SaTZKvs79qins7O+rIeGedmJ/3CX/w9y8SiOsOfVMtt+Wgra
        t1uisV3JVp+uvnYA6F4rOzwhif1rWmIcAgYQZdzyzWyOecoS8O7n
X-Google-Smtp-Source: AGHT+IGkX+b8/id5mnhsdSwU9pp41YFk3WYZkYEZqYPlBixDk1KbdsztU74V3Q6iBQqWEbgI4/9irEaASDq7WrvYvAE=
X-Received: by 2002:a5b:889:0:b0:d47:3d16:4b0d with SMTP id
 e9-20020a5b0889000000b00d473d164b0dmr2944641ybq.25.1693424889246; Wed, 30 Aug
 2023 12:48:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230829095423.760641-1-quic_gokulsri@quicinc.com>
 <20230829095423.760641-2-quic_gokulsri@quicinc.com> <3722a8f6-8f63-fe7c-6983-ac96caa18c87@linaro.org>
 <d2080d0b-f0d2-b5f2-4fd5-c929735e406c@quicinc.com>
In-Reply-To: <d2080d0b-f0d2-b5f2-4fd5-c929735e406c@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 30 Aug 2023 22:47:58 +0300
Message-ID: <CAA8EJpo=e0JNWRhERUFFtLZ6o+hMhdBspC8yPi3j8U0AAo_FQw@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: clock: qcom,a53pll: add IPQ5018 compatible
To:     Gokul Sriram P <quic_gokulsri@quicinc.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, jassisinghbrar@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_varada@quicinc.com, quic_srichara@quicinc.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 30 Aug 2023 at 21:31, Gokul Sriram P <quic_gokulsri@quicinc.com> wrote:
>
>
> On 8/29/2023 3:39 PM, Krzysztof Kozlowski wrote:
> > On 29/08/2023 11:54, Gokul Sriram Palanisamy wrote:
> >> Add IPQ5018 compatible to A53 PLL bindings.
> >>
> >> Co-developed-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> >> Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> > Knowing that this patch could not come from downstream (it's some old
> > kernel without this file), I really wonder why two people were involved
> > in developing trivial one line change.
> Sure, I had kept this co-developed-by for this whole series of patches.
> will remove co-developed-by for this patch.

Each patch is individual, even if they form a series. Different
patches might be developed by different parties or a combination of
them.


-- 
With best wishes
Dmitry
