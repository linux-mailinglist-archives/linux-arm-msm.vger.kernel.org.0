Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7DB7B6DA06A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Apr 2023 20:56:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239786AbjDFS4h (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Apr 2023 14:56:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240283AbjDFS4f (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Apr 2023 14:56:35 -0400
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8521C9012
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 Apr 2023 11:56:33 -0700 (PDT)
Received: by mail-yb1-xb2c.google.com with SMTP id p15so47196028ybl.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Apr 2023 11:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680807392;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ucnAW8w35vol8Pg57OLPiTr9yW6zisn9tO1ygQITttI=;
        b=biLsD71bt/4qhOiC+fjKpXwMJ7DLuQs+qj3u1Sm3s/qCNkrktChSmO29ZgGtDVliSq
         gzoFMDRfEEJ1Id8nivsrn+6O2Bm9wkSqLZRb/Z4MGRDMuQeGoV46EtSSmF50tPOQx0qw
         m4ZIY3q50IWmZPapaUOGPmVxbiKyoEz4TmtOxpH98EC3Fmo3VpqOd4AcPfubhe4dXsOZ
         Ma6IJj+keATFHXQvx1xtILQ8Pt8JGRCtihK6+VaQyuog4KgGxKfPg7FaUzFgxnyGr2lB
         qWpfjWGeReUfg1lDInoDgjJ2Ey/TplX3Fv0IH6fda92c2lYRCWfL3iWfv8ZADggCSPPd
         nk+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680807392;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ucnAW8w35vol8Pg57OLPiTr9yW6zisn9tO1ygQITttI=;
        b=tgtalNi3CfKMBa1KmXXAZ3DHCYbQ0gX9Ox3LlSpVpLmGEPD4Y2XeJ3+/vPko6ado4Y
         9KWOglk4yjoZ60YGZtwhOkw5zWlYaDbFDO3rt5Yd74nwE1CeMYDvohNWo2c9FZL0Jr1Y
         U9RlG3EcmRpU24+k/CrHOOGWwrY2mhwvm+AdMcP2lBhWOZinV+k9lyD09jpsTsBgNINE
         8rvC8lbl6eSjrXmghsqJ8a1OAvglNnrbr6iDyuRCe1aVwVXe19hx1Ny4uxSCDSkRuKgm
         8DKrDewtqgdd4585kwNELCUupXDvgud2zqCajw0tzvFIVnadZydV4xdOX7mxxncrRjfJ
         e05A==
X-Gm-Message-State: AAQBX9dInpbwuT1ZIeoLV4eqoceA8helXhUwmJJ8+UAK3I7dr6TFR+8Z
        xZraByo0Cskn3AG7CfYBpviEpuSoUyEm/zp0CQXiwA==
X-Google-Smtp-Source: AKy350aLyY8waJyCoRar/QqAuHJLAJ4vbrM/5IkmzmLH9JFqvplgiFfoD5QooPuJEJQ83FPjVX8k1FVTGH4xULbcZa8=
X-Received: by 2002:a25:d64e:0:b0:b8b:f02b:ba20 with SMTP id
 n75-20020a25d64e000000b00b8bf02bba20mr210452ybg.9.1680807392707; Thu, 06 Apr
 2023 11:56:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230406-topic-lenovo_features-v1-0-c73a5180e48e@linaro.org>
 <20230406-topic-lenovo_features-v1-4-c73a5180e48e@linaro.org>
 <7476b5ba-426c-3701-c4aa-d3e2db3de112@linaro.org> <bceb91fa-c94b-a0bf-a612-19fc5778810e@linaro.org>
In-Reply-To: <bceb91fa-c94b-a0bf-a612-19fc5778810e@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 6 Apr 2023 21:56:21 +0300
Message-ID: <CAA8EJprmzibdarZCKDtAa14HTShxTwQ6FQfi665hbVR_=5MLaQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] arm64: dts: qcom: sm6115p-j606f: Enable ATH10K WiFi
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Kees Cook <keescook@chromium.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 6 Apr 2023 at 21:32, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
>
>
> On 6.04.2023 19:51, Dmitry Baryshkov wrote:
> > On 06/04/2023 18:25, Konrad Dybcio wrote:
> >> Enable the onboard QCA Wi-Fi. HW identifiers for reference:
> >> qmi chip_id 0x320 chip_family 0x4001 board_id 0xff soc_id 0x400e0000
> >>
> >> Firmware sources:
> >> /vendor/firmware_mnt/image/wlanmdsp.bin -> qcom/.../wlanmdsp.mbn
> >> /vendor/firmware_mnt/image/bdwlan.bXX [1] -> [2] -> ath10k/.../board-2.bin
> >> [3] -> ath10k/.../firmware-5.bin
> >>
> >> Not sure where 3 comes from on the device itself, gotta investigate that..
> >>
> >> According to [4], it's called WCN3990_STRAIT.
> >>
> >> [1] XX = board_id printed when the file is missing or by your downstream
> >> kernel firmware loader in the dmesg; if XX=ff, use bdwlan.bin
> >
> > Since the board_id is 0xff, please add qcom,ath10k-calibration-variant
> Do I make up a name, or is there some convention?
>
> I see Johan used "LE_X13S" in commit 2702f54f400ad3979632cdb76553772414f4c5e3.
> Should I go with "LE_P11"?

I think Lenovo_P11 or LENOVO_P11 might be better.

>
> >
> > Ideally, could you please send the bdwlan to ath10k for inclusion, see https://wireless.wiki.kernel.org/en/users/drivers/ath10k/boardfiles .
> The legal situation is ambiguous at best :/

As usual :-(

>
> Konrad
> >
> >>
> >> [2] https://github.com/jhugo/linux/blob/5.5rc2_wifi/README
> >> [3] https://github.com/kvalo/ath10k-firmware/blob/master/WCN3990/hw1.0/HL3.1/WLAN.HL.3.1-01040-QCAHLSWMTPLZ-1/firmware-5.bin
> >> [4] https://git.codelinaro.org/clo/la/platform/vendor/qcom-opensource/wlan/qca-wifi-host-cmn/-/blob/LA.VENDOR.1.0.r1-20700-WAIPIO.QSSI13.0/hif/src/hif_hw_version.h#L55
> >>
> >> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> >> ---
> >>   arch/arm64/boot/dts/qcom/sm6115p-lenovo-j606f.dts | 8 ++++++++
> >>   1 file changed, 8 insertions(+)
> >>
> >> diff --git a/arch/arm64/boot/dts/qcom/sm6115p-lenovo-j606f.dts b/arch/arm64/boot/dts/qcom/sm6115p-lenovo-j606f.dts
> >> index 2aac25171dec..4ba8e59a27d8 100644
> >> --- a/arch/arm64/boot/dts/qcom/sm6115p-lenovo-j606f.dts
> >> +++ b/arch/arm64/boot/dts/qcom/sm6115p-lenovo-j606f.dts
> >> @@ -315,6 +315,14 @@ &usb_hsphy {
> >>       status = "okay";
> >>   };
> >>   +&wifi {
> >> +    vdd-0.8-cx-mx-supply = <&pm6125_l8>;
> >> +    vdd-1.8-xo-supply = <&pm6125_l16>;
> >> +    vdd-1.3-rfa-supply = <&pm6125_l17>;
> >> +    vdd-3.3-ch0-supply = <&pm6125_l23>;
> >> +    status = "okay";
> >> +};
> >> +
> >>   &xo_board {
> >>       clock-frequency = <19200000>;
> >>   };
> >>
> >



-- 
With best wishes
Dmitry
