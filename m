Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D392B729D89
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jun 2023 16:57:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241358AbjFIO5d (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Jun 2023 10:57:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241534AbjFIO5R (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Jun 2023 10:57:17 -0400
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 702584237
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jun 2023 07:56:52 -0700 (PDT)
Received: by mail-oi1-x232.google.com with SMTP id 5614622812f47-39caf0082f3so64534b6e.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jun 2023 07:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686322611; x=1688914611;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5P30yTVObjCNWePFrPZlTAmy25U125Eu2KEScJ+3Q+g=;
        b=DiS+tAYV8rfbWIbHRCpGArV53sDOTNWWuaxxiYJkEDzhscawVJagxGAHwzNWLaqwgc
         YGozAa1IoPB+RSWtvhCwgM3Zs3NkLYepHEaDIaKQbmHWQTuIHlEwA1YUzjPK2L4Ma3wS
         MVA3ehcOIOGbJNbt9Lg4CMuG+vHbUTmwpqsQFRSjDX8vzp/bTOQh3J39klectF02yxfF
         gCSraKM82LukA3+xXvX2N8pd41a4kdevnusmT5DZxAk8KOQIHnsHISOy52Upt+ZngN2F
         4VV5ZTxgZ+Utt2hhv7XJBhjVPYq71c1p31B3EiF5rVkENTYx0/UD8XKjZjdvDAFV/Cps
         PdFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686322611; x=1688914611;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5P30yTVObjCNWePFrPZlTAmy25U125Eu2KEScJ+3Q+g=;
        b=VSFw7hcwcqlk+eQcdWLFFFfjHWDuRZt+5NFfROw/dSDVkHOEghGQCaSXtJIy+yaJPj
         kiuCt7+/S1Fw89mMH/X1WDZm0oQHSqyFLXcLB7xJVjOjqy8aehFfnwGN6zqdsxiytzxW
         6KXwz8yeVF9vZyjT3gSyVp9t74BMnXf0+mXsIiUHz7aXvKyNr27Mn6QT/nvWtlCHG4LC
         cGlvx1oYaebwjYQ3e89UU7uF9BLeUd5Lsbgk5bLbH75BOm83rM9M93K8wxq6SJL07xqr
         jVzV7WeZYc0rnBSI0WJpEfYmk4ZlwF5ccYTVzAVWbXFar8IjUjGSHrNPg9m/PM29vdkt
         9DaA==
X-Gm-Message-State: AC+VfDwoH4brW79jhWm2B9cChTnH+jUbVs8m9ZeQ61rL580Wcx/HIOWY
        aDSLDf4dNMm4OSjqP23dDDKoKq2tFagCbxf7OTuOJN7VduiWNHNw
X-Google-Smtp-Source: ACHHUZ4nFpTpj3lsBdccjwaqtlsCznyPJ13GRyEpdzMAWcin+xTZz2n7mc55BitUQ9Mi+bJLBYRdi7BCReqlTQKBHw8=
X-Received: by 2002:a05:6358:bb92:b0:129:c3fc:ff5c with SMTP id
 df18-20020a056358bb9200b00129c3fcff5cmr1385785rwb.24.1686322610069; Fri, 09
 Jun 2023 07:56:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230609054141.18938-1-quic_ppareek@quicinc.com>
 <79206b05-674b-1f6c-6eb1-ed45e6bd5637@linaro.org> <20230609125631.GA29252@hu-ppareek-blr.qualcomm.com>
 <2881f374-70e2-0057-f43e-7be12d32ae22@arm.com> <c3c12574-fc38-84ae-2a94-3c80fb9fb363@linaro.org>
In-Reply-To: <c3c12574-fc38-84ae-2a94-3c80fb9fb363@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Fri, 9 Jun 2023 17:56:39 +0300
Message-ID: <CAA8EJprqfq0ey2hgBXxf9Zg1Y_MwHP_73EQkwg-W-sRYS7VE8w@mail.gmail.com>
Subject: Re: [PATCH 0/3] arm64: dts: qcom: sa8775p: Add interconnect to SMMU
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     Robin Murphy <robin.murphy@arm.com>,
        Parikshit Pareek <quic_ppareek@quicinc.com>,
        Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Adam Skladowski <a39.skl@gmail.com>,
        linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org,
        "linux-kernel @ vger . kernel . org Prasanna Kumar" 
        <quic_kprasan@quicinc.com>,
        Shazad Hussain <quic_shazhuss@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 9 Jun 2023 at 17:52, Konrad Dybcio <konrad.dybcio@linaro.org> wrote=
:
>
>
>
> On 9.06.2023 16:45, Robin Murphy wrote:
> > On 2023-06-09 13:56, Parikshit Pareek wrote:
> >> On Fri, Jun 09, 2023 at 10:52:26AM +0200, Konrad Dybcio wrote:
> >>>
> >>>
> >>> On 9.06.2023 07:41, Parikshit Pareek wrote:
> >>>> Some qcom SoCs have SMMUs, which need the interconnect bandwidth to =
be
> >>>> This series introduce the due support for associated interconnect, a=
nd
> >>>> setting of the due interconnect-bandwidth. Setting due interconnect
> >>>> bandwidth is needed to avoid the issues like [1], caused by not havi=
ng
> >>>> due clock votes(indirectly dependent upon interconnect bandwidth).
> >>>
> >>> [1] ???
> >>
> >> My bad. Intended to mention following:
> >> https://lore.kernel.org/linux-arm-msm/20230418165224.vmok75fwcjqdxspe@=
echanude/
> >
> > This sounds super-dodgy - do you really have to rely on configuration o=
f the interconnect path from the SMMU's pagetable walker to RAM to keep a c=
ompletely different interconnect path clocked for the CPU to access SMMU re=
gisters? You can't just request the programming interface clock directly li=
ke on other SoCs?
> On Qualcomm platforms, particularly so with the more recent ones, some
> clocks are managed by various remote cores. Half of what the interconnect
> infra does on these SoCs is telling one such core to change the internall=
y
> managed clock's rate based on the requested bw.

But enabling PCIe interconnect to keep SMMU working sounds strange to
me too. Does the fault come from some outstanding PCIe transaction?


--=20
With best wishes
Dmitry
