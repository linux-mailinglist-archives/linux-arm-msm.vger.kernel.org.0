Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD2ED5EF12A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Sep 2022 11:02:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234738AbiI2JCi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Sep 2022 05:02:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234352AbiI2JCh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Sep 2022 05:02:37 -0400
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 163C813EE9A
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Sep 2022 02:02:36 -0700 (PDT)
Received: by mail-yb1-xb2c.google.com with SMTP id j7so757604ybb.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Sep 2022 02:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=yKPB55kqrYfeN1gOA599C3nAwB2kg/l4ZAUq+bshASA=;
        b=eiuwK3T0g179jNPxt3DC04h7S5HSU+dYiVOlj8DYf1hxjgAkcEkGf4yYbFUbmCgvY6
         RkwGR6unYdoX/DvCR2zdf/M8V/3dqeXA5Zh9CawoNLLNoBO1Qc+e1rTK6SL5JZiHJ7zO
         tmt6CvE+5ZpzxEKodj/tmoOwpRZVc1fXWTxGMc77ylNKC/aZ/zlS47etImuGiYwclMvr
         U2Y28+Fjckwf/N13JazRvxbBkMfj41Bm6nyf+WYrC5DiGEe6bt7jutlCve0+6gU7twh3
         EdP3yxzLb4Tsp0l0ZE4v0F0+C+e2nUx7kerl9d06tYDXLiChRg6OoRYKaoG7XojV9e9y
         NHZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=yKPB55kqrYfeN1gOA599C3nAwB2kg/l4ZAUq+bshASA=;
        b=C6LMhV1T2Vjhk/r8imOfLH/AYyXYRjYwNvLz9vj+TATvvmFRyWMzLCfuIPldr3eo7h
         FztgvLea2JDrWgS7jTfg9tt3MYRb6xCi2hg4kf+SFMJeTJqOAG0Wsnfgi2h5H4ycBRZR
         /NOKbtTxAqWip3U7pV4l8uYfIDw2XbAqfB2oO5fw2i+fa9YxHObZ94HSEW7eB5QqRZS5
         i9F5RnXnnpUie8V0isJgmoVD3zTLnp2Gaa70d2FpHNyHiHfkFzmozvT34r1P2+rN4ypE
         WEVTP2Yg+gB2Il373iTc+TiYEQ37cjIp32G4TZhTpwD+QTn4KwXJOHK0FuTmExkVn6rc
         MQSg==
X-Gm-Message-State: ACrzQf1T9sof0S7u0y5NDLI6xmPKFaDD2a/RoO+qs5j3G1l3H4TO55Bf
        S/V6kf41lgMBoGz1WGQQMJ1577nMw+a1QSFjivaOo3KMAEY=
X-Google-Smtp-Source: AMsMyM7fcwdsOzxi4Y/A4abn1a2Rw6OsEt4ShseX5ARSzqORDdAnULDTqq+5gcxWyE2gQIQjHNZR2gXdAR3KGdesMWY=
X-Received: by 2002:a25:3f86:0:b0:6bc:998:873e with SMTP id
 m128-20020a253f86000000b006bc0998873emr2255866yba.152.1664442155175; Thu, 29
 Sep 2022 02:02:35 -0700 (PDT)
MIME-Version: 1.0
References: <1664435628-4011-1-git-send-email-quic_kriskura@quicinc.com>
 <CAA8EJpr9pcN-SG-yQNUGEoHCmv74prChprj4f42PKpSAzGzVKQ@mail.gmail.com> <0cc382cb-b76e-a5a5-3480-47a451bdc958@quicinc.com>
In-Reply-To: <0cc382cb-b76e-a5a5-3480-47a451bdc958@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 29 Sep 2022 12:02:24 +0300
Message-ID: <CAA8EJprvHSFKS2ZOLyeYgUpj4Fzec01RhQ7=nUh=qDpYBe0hrA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sc7280: Update SNPS Phy params for SC7280
To:     Krishna Kurapati PSSNV <quic_kriskura@quicinc.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 29 Sept 2022 at 11:54, Krishna Kurapati PSSNV
<quic_kriskura@quicinc.com> wrote:
>
>
> On 9/29/2022 1:29 PM, Dmitry Baryshkov wrote:
> > On Thu, 29 Sept 2022 at 10:14, Krishna Kurapati
> > <quic_kriskura@quicinc.com> wrote:
> >>
> >> Override the SNPS Phy tuning parameters for SC7280 devices. These
> >> values are common for both trogdor and herobrine variants.
> >
> > They are common for trogdor and herobrine, but should these parameters
> > be a default? In other words, a random new device based on sc7280
> > would more likely use these overrides or the hardware defaults?
> >
> Hi Dmitry,
>
>    Currently there are only two platforms, so I made these changes on
> common dtsi. If a new platform comes (mostly it won't) we can override
> them in platform specific file is what I thought.

This is not how it usually works. The 'sc7280.dtsi' is not a 'common
dtsi' for trogdor and herobrine. It describes the SoC.
Thus in my opinion if these overrides should be a default to all
sc7280 platforms, this patch is fine. If these overrides are
applicable only to the two mentioned platforms, they should go to
respective platform-specific DT files.

>
> Regards,
> Krishna,
> >>
> >> Signed-off-by: Krishna Kurapati <quic_kriskura@quicinc.com>
> >> ---
> >>   arch/arm64/boot/dts/qcom/sc7280.dtsi | 7 +++++++
> >>   1 file changed, 7 insertions(+)
> >>
> >> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> >> index 2125803..ae2c23e 100644
> >> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> >> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> >> @@ -3310,6 +3310,13 @@
> >>                          clock-names = "ref";
> >>
> >>                          resets = <&gcc GCC_QUSB2PHY_SEC_BCR>;
> >> +
> >> +                       qcom,hs-rise-fall-time-bp = <0>;
> >> +                       qcom,squelch-detector-bp = <(-2090)>;
> >> +                       qcom,hs-disconnect-bp = <1743>;
> >> +                       qcom,hs-amplitude-bp = <1780>;
> >> +                       qcom,hs-crossover-voltage-microvolt = <(-31000)>;
> >> +                       qcom,hs-output-impedance-micro-ohms = <2600000>;
> >>                  };
> >>
> >>                  usb_1_qmpphy: phy-wrapper@88e9000 {
> >> --
> >> 2.7.4
> >>
> >
> >



-- 
With best wishes
Dmitry
