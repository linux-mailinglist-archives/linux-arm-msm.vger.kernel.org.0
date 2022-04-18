Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E0E31505BEF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Apr 2022 17:49:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245226AbiDRPwK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Apr 2022 11:52:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345790AbiDRPwB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Apr 2022 11:52:01 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74D3D1D31C
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Apr 2022 08:31:48 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id o5so13314532pjr.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Apr 2022 08:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=LtMMRF4JcWs/Onf4a3Y3tlIdji7WoSU9k4+P0Hcpjbc=;
        b=hE0KBI9KwKkNqK+Xv2o8tsioJRsnAaFJ1eB+X2QNyQ99MfbSVlUxQCxCZEvC+IM/my
         bYEURWsF0lHBi4/PKzpg/bpURMLdcgDvFus+NSJivkPCdzyMjRUFAmnDpeysop2l0FXl
         48JcA53FUXsLakhyZWhH2QzWikVPyhBok6KcU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=LtMMRF4JcWs/Onf4a3Y3tlIdji7WoSU9k4+P0Hcpjbc=;
        b=BIUQPiK+TFAnX7mzv4gPwjBdwoObuQ7jfuB5FVx8S/ddWWIS69swNEFozmv+pHikYQ
         Obf2VdW2/Z8I0f/dlyCbpg9DWYGmO059ljINoomdIvm5f5DaNKet3vR28BH8+AOnuWJd
         aqSbK9Bvi+SVF+TKXxyThq2uE4oYGhWsV0o6yzourFwuV2s//cfM6gHKZIMhnI89rhYI
         SXAfSAl5WJ3He9ElfmU51O+xA/oMYIlH0XlPMsakHMossRIdVAtr0lk5jR2xG1F3J9xZ
         pmJPg5bJvJfU9cUALWbhEaH39yi5gwCZKXbCNfn9L57SB1Y7GjrnmeHsdWyDD8zESWJW
         5OBQ==
X-Gm-Message-State: AOAM530D1+Q12TnBGCJ/56nrCFaeB1iHV0JZAnHaBtK1eLsUaVZMiWG3
        siMkoi0sH5CD9Onx4ogbEDvSRQ==
X-Google-Smtp-Source: ABdhPJzdL3yAngu9mDayKXsveGQ3aVDfr4Jr1rlnzREStGhXw+y1x2674SLwT528JlAC51feQLysSw==
X-Received: by 2002:a17:90b:1c86:b0:1bf:2a7e:5c75 with SMTP id oo6-20020a17090b1c8600b001bf2a7e5c75mr13585777pjb.145.1650295907897;
        Mon, 18 Apr 2022 08:31:47 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:6b32:a0a5:ec32:c287])
        by smtp.gmail.com with UTF8SMTPSA id z5-20020a056a00240500b004e15d39f15fsm13525530pfh.83.2022.04.18.08.31.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Apr 2022 08:31:47 -0700 (PDT)
Date:   Mon, 18 Apr 2022 08:31:44 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_rohkumar@quicinc.com,
        srinivas.kandagatla@linaro.org, dianders@chromium.org,
        swboyd@chromium.org, judyhsiao@chromium.org,
        Venkata Prasad Potturu <quic_potturu@quicinc.com>
Subject: Re: [PATCH v7 4/4] arm64: dts: qcom: sc7280: Add dt nodes for sound
 card
Message-ID: <Yl2EYIdMdz7Lnk26@google.com>
References: <1649863277-31615-1-git-send-email-quic_srivasam@quicinc.com>
 <1649863277-31615-5-git-send-email-quic_srivasam@quicinc.com>
 <Ylc/aR0hUGa6OKBO@google.com>
 <78b1e04c-e7d0-a81d-799e-5c570c2bf106@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <78b1e04c-e7d0-a81d-799e-5c570c2bf106@quicinc.com>
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Apr 18, 2022 at 07:39:44PM +0530, Srinivasa Rao Mandadapu wrote:
> 
> On 4/14/2022 2:53 AM, Matthias Kaehlcke wrote:
> Thanks for your time Matthias!!!
> > On Wed, Apr 13, 2022 at 08:51:17PM +0530, Srinivasa Rao Mandadapu wrote:
> > > Add dt nodes for sound card support, which is using WCD938x headset
> > > playback, capture, I2S speaker playback and DMICs via VA macro.
> > > 
> > > Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> > > Co-developed-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> > > Signed-off-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> > > ---
> > >   arch/arm64/boot/dts/qcom/sc7280-crd.dts  | 23 ++++++++
> > >   arch/arm64/boot/dts/qcom/sc7280-idp.dtsi | 93 ++++++++++++++++++++++++++++++++
> > >   2 files changed, 116 insertions(+)
> > > 
> > > diff --git a/arch/arm64/boot/dts/qcom/sc7280-crd.dts b/arch/arm64/boot/dts/qcom/sc7280-crd.dts
> > > index b944366..1e16854 100644
> > > --- a/arch/arm64/boot/dts/qcom/sc7280-crd.dts
> > > +++ b/arch/arm64/boot/dts/qcom/sc7280-crd.dts
> > You need to refresh your tree, this file has been renamed to
> > sc7280-crd-r3.dts. That DT is for the CRD <= 2.x, newer versions
> > use sc7280-herobrine-crd.dts.
> Okay. will update accordingly.
> > 
> > > @@ -90,6 +90,29 @@ ap_ts_pen_1v8: &i2c13 {
> > >   	us-euro-gpios = <&tlmm 81 GPIO_ACTIVE_HIGH>;
> > >   };
> > > +&sound {
> > > +	audio-routing =
> > > +		"IN1_HPHL", "HPHL_OUT",
> > > +		"IN2_HPHR", "HPHR_OUT",
> > > +		"AMIC1", "MIC BIAS1",
> > > +		"AMIC2", "MIC BIAS2",
> > > +		"VA DMIC0", "MIC BIAS1",
> > > +		"VA DMIC1", "MIC BIAS1",
> > > +		"VA DMIC2", "MIC BIAS3",
> > > +		"VA DMIC3", "MIC BIAS3",
> > > +		"TX SWR_ADC0", "ADC1_OUTPUT",
> > > +		"TX SWR_ADC1", "ADC2_OUTPUT",
> > > +		"TX SWR_ADC2", "ADC3_OUTPUT",
> > > +		"TX SWR_DMIC0", "DMIC1_OUTPUT",
> > > +		"TX SWR_DMIC1", "DMIC2_OUTPUT",
> > > +		"TX SWR_DMIC2", "DMIC3_OUTPUT",
> > > +		"TX SWR_DMIC3", "DMIC4_OUTPUT",
> > > +		"TX SWR_DMIC4", "DMIC5_OUTPUT",
> > > +		"TX SWR_DMIC5", "DMIC6_OUTPUT",
> > > +		"TX SWR_DMIC6", "DMIC7_OUTPUT",
> > > +		"TX SWR_DMIC7", "DMIC8_OUTPUT";
> > > +};
> > > +
> > >   &tlmm {
> > >   	tp_int_odl: tp-int-odl {
> > >   		pins = "gpio7";
> > > diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
> > > index cf62d06..a7c884a 100644
> > > --- a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
> > > @@ -84,6 +84,99 @@
> > >   		pinctrl-names = "default";
> > >   		pinctrl-0 = <&nvme_pwren>;
> > >   	};
> > > +
> > > +	sound: sound {
> > > +		compatible = "google,sc7280-herobrine";
> > > +		model = "sc7280-wcd938x-max98360a-1mic";
> > > +
> > > +		audio-routing =
> > > +			"IN1_HPHL", "HPHL_OUT",
> > > +			"IN2_HPHR", "HPHR_OUT",
> > > +			"AMIC1", "MIC BIAS1",
> > > +			"AMIC2", "MIC BIAS2",
> > > +			"VA DMIC0", "MIC BIAS3",
> > > +			"VA DMIC1", "MIC BIAS3",
> > > +			"VA DMIC2", "MIC BIAS1",
> > > +			"VA DMIC3", "MIC BIAS1",
> > > +			"TX SWR_ADC0", "ADC1_OUTPUT",
> > > +			"TX SWR_ADC1", "ADC2_OUTPUT",
> > > +			"TX SWR_ADC2", "ADC3_OUTPUT",
> > > +			"TX SWR_DMIC0", "DMIC1_OUTPUT",
> > > +			"TX SWR_DMIC1", "DMIC2_OUTPUT",
> > > +			"TX SWR_DMIC2", "DMIC3_OUTPUT",
> > > +			"TX SWR_DMIC3", "DMIC4_OUTPUT",
> > > +			"TX SWR_DMIC4", "DMIC5_OUTPUT",
> > > +			"TX SWR_DMIC5", "DMIC6_OUTPUT",
> > > +			"TX SWR_DMIC6", "DMIC7_OUTPUT",
> > > +			"TX SWR_DMIC7", "DMIC8_OUTPUT";
> > > +
> > > +		qcom,msm-mbhc-hphl-swh = <1>;
> > > +		qcom,msm-mbhc-gnd-swh = <1>;
> > > +
> > > +		#address-cells = <1>;
> > > +		#size-cells = <0>;
> > > +		#sound-dai-cells = <0>;
> > > +
> > > +		dai-link@1 {
> > > +			link-name = "MAX98360A";
> > > +			reg = <MI2S_SECONDARY>;
> > Dumb question: is this value actually used? A quick glance through
> > qcom_snd_parse_of() suggests it isn't. And the CPU DAI id is already
> > specified in the 'sound-dai' property below.
> > 
> > In a quick test I replaced the corresponding 'reg' values in
> > sc7180-trogdor.dtsi with 'random' values and audio playback on
> > my coachz (sc7180-trogdor-coachz-r3.dts) still works ...
> 
> Yes. agree that it's not being used. But i am not sure of general syntax
> followed.
> 
> for now  will delete it.

The binding requires it though. I think the correct thing would be to remove it
from the binding and from all device trees currently using it. But that might be
beyond the scope of this series.

Maybe a two step approach would be the best: add 'reg' in this series, get it
landed and then send another series that changes the binding and deletes all
'reg' entries (and adjusts the 'address' in the node name).

I don't think the CPU DAI id should be in the node name either. It isn't even
necessarily a unique identifier if I understand correctly. A SoC could have
multiple IP blocks with audio buses, each with their own enumeration of DAIs.
I suggest to just enumerate the nodes (and 'reg' while it's there) linearly
starting with 0, or maybe even change the node name in the binding (in a
second step) to dai-link-N.
