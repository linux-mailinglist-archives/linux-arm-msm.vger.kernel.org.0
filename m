Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A9AF6F770D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 May 2023 22:33:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229906AbjEDUdF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 May 2023 16:33:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231178AbjEDUcl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 May 2023 16:32:41 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E501912E9C
        for <linux-arm-msm@vger.kernel.org>; Thu,  4 May 2023 13:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1683231615;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=w1AF1GZ0WT5pOD5hZDOW/UjsIUcOtqbdTWX7manOxFE=;
        b=XYoenRai9A8k3RwpOGhjDlnOWaAcbKWdO0x6+7wB+Oq2nLER/loM6YCB7PfdAj0AORnj5h
        iozvuHwrlj3Bj9jQOqgf6dDuGh+zLo1GipsvLQt2OwFmgMGXfCuMo4GYNGgJ7SLJ59R243
        qR1s2nz8D4eDsX2ZqAtovMl8bWCb5PU=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-445-Vbvy60BOMFOOvmypN78_Jw-1; Thu, 04 May 2023 16:07:03 -0400
X-MC-Unique: Vbvy60BOMFOOvmypN78_Jw-1
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-6a5f602a905so512052a34.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 May 2023 13:07:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683230822; x=1685822822;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w1AF1GZ0WT5pOD5hZDOW/UjsIUcOtqbdTWX7manOxFE=;
        b=eRqkSI7zwxId4JoSHMkfewy8GOGHRQ35KAvNfx8MjsZZjllzy/Rw8oAkYCzhnQsB9K
         m6x43AH1MtlOVh/20DE0CS+iysEN4gpRKWl4i99N605yfIJ2N1Novvq95LN5+R/MlYVV
         V9SYX3E9zKoqNxLky05LHfgnUhzPrrcylXuiMTB2ZdydU+dSoJNXjI3yjHrQQAJxOxCY
         k3LXNIM7tGK/XoXAaflEMkavHf03wn55D/eml01FoAXtmMQAeVJG+EW4Tw44NH8CA/tG
         Irbpg/rk9rhuzeZeG2RcmGs+TgPtFMcUNyHZCCSmBuTiT1mhJjgqjNlPoivgtUgHvn2t
         vqxQ==
X-Gm-Message-State: AC+VfDxR7v/V4SeZBclt7vJkPTenO6QnOZRI7Y8exVPpmIXmcFCbsis4
        zODcAMWS3SaDDdXIaK2UDrFSw2O3BsIDmZabIMslyeE1iQlxgSzCT+uQxOo2KV8Enf7sC/nbkhR
        yDwZseJzpDv+83To7PAwLEmA7uw==
X-Received: by 2002:a05:6808:2908:b0:38c:4c09:562b with SMTP id ev8-20020a056808290800b0038c4c09562bmr2161218oib.13.1683230822470;
        Thu, 04 May 2023 13:07:02 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7VkFRsQ30RP8BdLiC5yw8mFsv18WmnGMIJaxjTVfEq37GPL76+In3y48ZZ235FmIqKb8QOpQ==
X-Received: by 2002:a05:6808:2908:b0:38c:4c09:562b with SMTP id ev8-20020a056808290800b0038c4c09562bmr2161213oib.13.1683230822199;
        Thu, 04 May 2023 13:07:02 -0700 (PDT)
Received: from halaney-x13s ([2600:1700:1ff0:d0e0::22])
        by smtp.gmail.com with ESMTPSA id o20-20020a056808125400b003908004b37dsm1966248oiv.26.2023.05.04.13.07.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 May 2023 13:07:01 -0700 (PDT)
Date:   Thu, 4 May 2023 15:06:59 -0500
From:   Andrew Halaney <ahalaney@redhat.com>
To:     Krishna Kurapati PSSNV <quic_kriskura@quicinc.com>
Cc:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Felipe Balbi <balbi@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        quic_pkondeti@quicinc.com, quic_ppratap@quicinc.com,
        quic_jackp@quicinc.com, quic_harshq@quicinc.com,
        quic_shazhuss@quicinc.com
Subject: Re: [PATCH v7 9/9] arm64: dts: qcom: sa8540-ride: Enable first port
 of tertiary usb controller
Message-ID: <20230504200659.aphlfmk5przvfthi@halaney-x13s>
References: <20230501143445.3851-1-quic_kriskura@quicinc.com>
 <20230501143445.3851-10-quic_kriskura@quicinc.com>
 <0e76a9f6-f062-2802-d9de-3c0b2b897a4e@linaro.org>
 <50c37e0c-3171-bce2-d97e-371150e1854f@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <50c37e0c-3171-bce2-d97e-371150e1854f@quicinc.com>
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

nit I just noticed: s/sa8540-ride/sa8540p-ride/
please during the next spin!

On Thu, May 04, 2023 at 11:33:44PM +0530, Krishna Kurapati PSSNV wrote:
> 
> 
> On 5/2/2023 4:37 PM, Konrad Dybcio wrote:
> > 
> > 
> > On 1.05.2023 16:34, Krishna Kurapati wrote:
> > > There is now support for the multiport USB controller this uses so
> > > enable it.
> > > 
> > > The board only has a single port hooked up (despite it being wired up to
> > > the multiport IP on the SoC). There's also a USB 2.0 mux hooked up,
> > > which by default on boot is selected to mux properly. Grab the gpio
> > > controlling that and ensure it stays in the right position so USB 2.0
> > > continues to be routed from the external port to the SoC.
> > > 
> > > Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
> > > Signed-off-by: Krishna Kurapati <quic_kriskura@quicinc.com>
> > > ---
> > same comments as patch 8
> > 
> > Konrad
> 
> Hi Konrad,
> 
>   Sure, will add a default value for drive-strength for this pinctrl node.
> 
> Hi Andrew Halaney,
> 
>  I currently don't have a Ride device with me to test this change. Can you
> help test this patch on SA8540-Ride including (drive-strength = <2>;)
> property (which I believe is the default value).
> 
> I can test the same on SA8295-ADP and can push the next version quickly.
> 

The patch here for sa8540p-ride already includes the drive strength. I
did pull this on top of usb-next and it is working well for me in a
quick sanity test. Konrad's pinctrl-names/pinctrl-0 swap is purely
cosmetic of course, but for what is worth that works fine too.

I'd add my Tested-by for this patch, but it seems silly since I authored
the original :)

Also, make CHECK_DTBS=y qcom/sa8540p-ride.dtb is still reporting issues,
but other reviewers have highlighted that I believe. Just for the record
though, make sure you get those silenced!

I look forward to the next revision.

Thanks,
Andrew

> Regards,
> Krishna,
> 
> > >   arch/arm64/boot/dts/qcom/sa8540p-ride.dts | 22 ++++++++++++++++++++++
> > >   1 file changed, 22 insertions(+)
> > > 
> > > diff --git a/arch/arm64/boot/dts/qcom/sa8540p-ride.dts b/arch/arm64/boot/dts/qcom/sa8540p-ride.dts
> > > index 24fa449d48a6..53d47593306e 100644
> > > --- a/arch/arm64/boot/dts/qcom/sa8540p-ride.dts
> > > +++ b/arch/arm64/boot/dts/qcom/sa8540p-ride.dts
> > > @@ -309,6 +309,19 @@ &usb_2_qmpphy0 {
> > >   	status = "okay";
> > >   };
> > > +&usb_2 {
> > > +	pinctrl-names = "default";
> > > +	pinctrl-0 = <&usb2_en_state>;
> > > +
> > > +	status = "okay";
> > > +};
> > > +
> > > +&usb_2_dwc3 {
> > > +	dr_mode = "host";
> > > +	phy-names = "usb2-port0", "usb3-port0";
> > > +	phys = <&usb_2_hsphy0>, <&usb_2_qmpphy0>;
> > > +};
> > > +
> > >   &xo_board_clk {
> > >   	clock-frequency = <38400000>;
> > >   };
> > > @@ -401,4 +414,13 @@ wake-pins {
> > >   			bias-pull-up;
> > >   		};
> > >   	};
> > > +
> > > +	usb2_en_state: usb2-en-state {
> > > +		/* TS3USB221A USB2.0 mux select */
> > > +		pins = "gpio24";
> > > +		function = "gpio";
> > > +		drive-strength = <2>;
> > > +		bias-disable;
> > > +		output-low;
> > > +	};
> > >   };
> 

