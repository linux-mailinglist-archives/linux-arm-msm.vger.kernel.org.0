Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB0B46745EB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Jan 2023 23:25:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229766AbjASWZL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Jan 2023 17:25:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230040AbjASWXO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Jan 2023 17:23:14 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0BEBA316A
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jan 2023 14:09:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674166190;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=+ff4/fM1Rwa33ese55sqMMOd49L0hptdds7eOn22FU4=;
        b=ZeXdvwPaFzYwDrbGZZO8sJdr4R3E0rTvQR6X7B1f/7Ma6C7CtN7nkrkBkRJT4y7kTZjmax
        uXeiCu+eecZJ0xNfQKWpp2tjzFyvrv13AwwPinx2ugCd1GzNU4//a2MAyU8EkMsZ3K09pf
        DF32JvKPdpBecFdpoZsNoT+TUPhfe54=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-622-nbLa-3jIOc6QDK4C1QQC_A-1; Thu, 19 Jan 2023 17:09:48 -0500
X-MC-Unique: nbLa-3jIOc6QDK4C1QQC_A-1
Received: by mail-ot1-f70.google.com with SMTP id f49-20020a9d03b4000000b0068645faafc3so1660165otf.16
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jan 2023 14:09:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+ff4/fM1Rwa33ese55sqMMOd49L0hptdds7eOn22FU4=;
        b=P//Lv5OFpylkVr6bchZn0gm8+OgkZ58a1FcHObC2ANMF/aKIBItodtqFbYrcT1Sk+W
         RVZrANnmKsev85lysZ0vVnCfYnwOf6VSI6wyA1UtM32PPXGyrhmqZZp1U1tPt/pBeLrW
         7rTEZIR1TSY471ro1OHofpnsmKMJBdnQmgTFtgi0/Wh1B7guXp6ox8IO+43MeO6uOV9E
         0JTU9VPL8sV97Qt5dbFFQSL9Cbz4oSA0mgSHyqGIV1o1hktluwu+LSjQfmc8JDVHodFH
         UcCjX0qaYaMKpSEROyoPtoXglvrYaUzSSHKBOzyIZCqypCNRkuAF8qbVZV9/POqoJd0B
         qMmg==
X-Gm-Message-State: AFqh2kp6CKGs6gCfPNzT7LGFpvjhMxUZRNguvkYD4ypyhk+VCRyvcBFl
        3nuQ5dB2o31RmRgC02xIa+9CZv8ZC8PptAClMoEUYfn0ZSVY3QzeWHOJHpAZLwnsxlpuGtEdR1h
        UNKVsJVAPYey6JumSvJ13R1hQGw==
X-Received: by 2002:a4a:d0d9:0:b0:4f1:e491:c80 with SMTP id u25-20020a4ad0d9000000b004f1e4910c80mr5791416oor.2.1674166185954;
        Thu, 19 Jan 2023 14:09:45 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvlAQBfJLXrG96Zlvh4RQ4nJMWJGwuMHVJbfbGn3ATiL7GJVtY7vgPjw4l7UMHrH0mXI2RnVg==
X-Received: by 2002:a4a:d0d9:0:b0:4f1:e491:c80 with SMTP id u25-20020a4ad0d9000000b004f1e4910c80mr5791404oor.2.1674166185697;
        Thu, 19 Jan 2023 14:09:45 -0800 (PST)
Received: from halaney-x13s ([2600:1700:1ff0:d0e0::21])
        by smtp.gmail.com with ESMTPSA id p20-20020a4ae154000000b004d1d34f0267sm2490659oot.40.2023.01.19.14.09.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jan 2023 14:09:45 -0800 (PST)
Date:   Thu, 19 Jan 2023 16:09:42 -0600
From:   Andrew Halaney <ahalaney@redhat.com>
To:     Krishna Kurapati <quic_kriskura@quicinc.com>
Cc:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, quic_pkondeti@quicinc.com,
        quic_ppratap@quicinc.com, quic_wcheng@quicinc.com,
        quic_jackp@quicinc.com, quic_harshq@quicinc.com
Subject: Re: [RFC v4 2/5] usb: dwc3: core: Refactor PHY logic to support
 Multiport Controller
Message-ID: <20230119220942.ja5gbo3t3fl63gpy@halaney-x13s>
References: <20230115114146.12628-1-quic_kriskura@quicinc.com>
 <20230115114146.12628-3-quic_kriskura@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230115114146.12628-3-quic_kriskura@quicinc.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, Jan 15, 2023 at 05:11:43PM +0530, Krishna Kurapati wrote:
> Currently the DWC3 driver supports only single port controller
> which requires at most one HS and one SS PHY.
> 
> But the DWC3 USB controller can be connected to multiple ports and
> each port can have their own PHYs. Each port of the multiport
> controller can either be HS+SS capable or HS only capable
> Proper quantification of them is required to modify GUSB2PHYCFG
> and GUSB3PIPECTL registers appropriately.
> 
> Add support for detecting, obtaining and configuring phy's supported
> by a multiport controller and limit the max number of ports
> supported to 4.
> 
> Signed-off-by: Harsh Agarwal <quic_harshq@quicinc.com>
> Signed-off-by: Krishna Kurapati <quic_kriskura@quicinc.com>
> ---
>  drivers/usb/dwc3/core.c | 304 +++++++++++++++++++++++++++++-----------
>  drivers/usb/dwc3/core.h |  15 +-
>  drivers/usb/dwc3/drd.c  |  14 +-
>  3 files changed, 244 insertions(+), 89 deletions(-)
> 
> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
> index 476b63618511..7e0a9a598dfd 100644
> --- a/drivers/usb/dwc3/core.c
> +++ b/drivers/usb/dwc3/core.c

<snip>

> @@ -1575,6 +1690,21 @@ static void dwc3_get_properties(struct dwc3 *dwc)
>  	dwc->dis_split_quirk = device_property_read_bool(dev,
>  				"snps,dis-split-quirk");
>  
> +
> +	/*
> +	 * If no mulitport properties are defined, default
> +	 * the port count to '1'.
> +	 */
> +	ret = device_property_read_u32(dev, "num-ports",
> +				&dwc->num_ports);
> +	if (ret)
> +		dwc->num_ports = 1;
> +
> +	ret = device_property_read_u32(dev, "num-ss-ports",
> +				&dwc->num_ss_ports);
> +	if (ret)
> +		dwc->num_ss_ports = 1;

By using this DT property instead of using the number of each phy type you
find you can get into situations where you're writing DWC3_GUSB2PHYCFG, etc,
when there's no phy to go along with it.

I ran into this when testing on sa8540p-ride, which only uses one of the
ports on the multiport controller. I didn't enable the other phys (not
sure if that was smart or not) and overrode phy-names/phys, but did not
override num-ports/num-ss-ports, which resulted in that. Nothing bad
happened on a quick test.. but I thought I'd highlight that as another
downside of decoupling this value from the number of phys you grab.

Here's a patch enabling sa8540p-ride, I'd love if you'd add it to the
series (probably needs clean up after review, and will definitely need
alteration after you update the dt-binding again). If not I'll continue
to test/review so please CC me!:


From dcb27d07f079194ebd7efe1c9bec64da78beb290 Mon Sep 17 00:00:00 2001
From: Andrew Halaney <ahalaney@redhat.com>
Date: Thu, 19 Jan 2023 14:53:38 -0600
Subject: [PATCH] arm64: dts: qcom: sa8540p-ride: Enable usb_2
Content-type: text/plain

There is now support for the multiport USB controller this uses
so enable it.

The board only has a single port hooked up (despite it being wired up to
the multiport IP on the SoC). There's also a USB 2.0 mux hooked up,
which by default on boot is selected to mux properly. Grab the gpio
controlling that and ensure it stays in the right position so USB 2.0
continues to be routed from the external port to the SoC.

Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
---
 arch/arm64/boot/dts/qcom/sa8540p-ride.dts | 24 +++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8540p-ride.dts b/arch/arm64/boot/dts/qcom/sa8540p-ride.dts
index 97957f3baa64..56d4f43faa1e 100644
--- a/arch/arm64/boot/dts/qcom/sa8540p-ride.dts
+++ b/arch/arm64/boot/dts/qcom/sa8540p-ride.dts
@@ -246,6 +246,21 @@ &usb_0_qmpphy {
 	status = "okay";
 };
 
+&usb_2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&usb2_en_state>;
+
+	status = "okay";
+};
+
+&usb_2_dwc3 {
+	dr_mode = "host";
+	num-ports = <1>;
+	num-ss-ports = <1>;
+	phy-names = "usb2-phy", "usb3-phy";
+	phys = <&usb_2_hsphy0>, <&usb_2_qmpphy0>;
+};
+
 &usb_2_hsphy0 {
 	vdda-pll-supply = <&vreg_l5a>;
 	vdda18-supply = <&vreg_l7g>;
@@ -313,4 +328,13 @@ wake-pins {
 			bias-pull-up;
 		};
 	};
+
+	usb2_en_state: usb2-en-state {
+		/* TS3USB221A USB2.0 mux select */
+		pins = "gpio24";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+		output-low;
+	};
 };
-- 
2.39.0



