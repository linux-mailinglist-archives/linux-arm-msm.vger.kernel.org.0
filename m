Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C3CC6E44CA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Apr 2023 12:07:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229657AbjDQKHG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Apr 2023 06:07:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230211AbjDQKHD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Apr 2023 06:07:03 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B667A2698
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Apr 2023 03:06:31 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-3f1738d0d4cso3760985e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Apr 2023 03:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681725884; x=1684317884;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EZUY4/57kqmqVHMhmuIoQO3azKh51Iz8m2kCJDmMY0A=;
        b=qIBJraDIQIA5v+rbd4LhBeAHTbxfPcUNOzM49wsoxm2/Tj8p4mgrpOCDpRTdfCOTHP
         667nXkDdg2EDkzr1k6EA30HyEQZVM5BFAc2JI39U0gvmXMYhxgZFD191FjDUNgtKF8Xc
         NuMg0m5fqMm9G7B+lGHbUdUU5IeSGh+bbbdZo4IvgXx1mcwP2PYec+gPWQl2FqNbH67/
         ELuEH+Vt+vt1u4uz3aiH/GCnCnwm70cM54xbwMjnNqtPtOfGWmlPs+WGvbbQK8F+mFEp
         1aPgjTPTmEOMqkbJACj0E/jdyr9eTxgRufqka8FU5eXy4EI1ngzAt6BR6tN4RMn3efpp
         qfqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681725884; x=1684317884;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EZUY4/57kqmqVHMhmuIoQO3azKh51Iz8m2kCJDmMY0A=;
        b=OrYN7F8ghCWKcIfV+RTWBHD7L83971bru81XabiA8H11YtoSjsEswItS8XGxrwwamM
         AYvn607xlh2FAbYAQS5QOFrFlNa/9i3H+3QcZCzvZ5iFUzBsK3drOrSsA4b1lftxlKSw
         rQ9bXuEtlslssgpomRQjitUfJO/lJcMg0ejPTnFbULbboXMcw3D9jACXUEimuIe92Zb+
         j4/Z0xCf5sNvqT+yJZiEkDiAwYILEi6MRMS7yf6vN+FlLrHe0HGtAlj4f1V4FJ83HEKs
         E3aHszrZ6FZ23R8AXkrKT3abf6+DntXdkwgZkiNs8NqBB6Nw81uhBGDY76iR2o3VQfPY
         yg/g==
X-Gm-Message-State: AAQBX9ekJlMz8wSXak8kIp7yhNp8GctLkUSxgY+9ghP0FcqGP0yaSMuR
        VN+TgCGpG9XPR8wOawAPKQOiqw==
X-Google-Smtp-Source: AKy350YOGGEXz8m/tFxIzICQ9PcToXq3MDFLmmm7h1rjdTEkDBJsnzkN6fcjfCprXUvhpBW8L7VVKQ==
X-Received: by 2002:a5d:5104:0:b0:2f8:cd53:d882 with SMTP id s4-20020a5d5104000000b002f8cd53d882mr4621802wrt.56.1681725884198;
        Mon, 17 Apr 2023 03:04:44 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id i4-20020a5d55c4000000b002f74578f494sm7745975wrw.41.2023.04.17.03.04.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Apr 2023 03:04:43 -0700 (PDT)
Message-ID: <75d00efb-ff3c-b1f8-a141-3fa78a39557a@linaro.org>
Date:   Mon, 17 Apr 2023 11:04:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v5 00/14] Add Qualcomm PMIC TPCM support
Content-Language: en-US
To:     Luca Weiss <luca.weiss@fairphone.com>, linux@roeck-us.net,
        heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
        andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-usb@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     caleb.connolly@linaro.org, konrad.dybcio@linaro.org,
        subbaram@quicinc.com, jackp@quicinc.com, robertom@qti.qualcomm.com
References: <20230413113438.1577658-1-bryan.odonoghue@linaro.org>
 <CRVOZOPMKBX4.2T7FOCWF0RKBJ@otso>
 <10551f5e-4516-c0cc-0b04-73aa38f80a2c@linaro.org>
 <CRWA2OP2T6KT.RCWAVWF5Q2T2@otso>
 <ccc9fa4c-ca52-d8f3-a8b3-45031bea673f@linaro.org>
 <CRYUWMIJDSB2.BJWEPJEA3Y1D@otso>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <CRYUWMIJDSB2.BJWEPJEA3Y1D@otso>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 17/04/2023 08:35, Luca Weiss wrote:
> Do you have an idea in which part of the code to start debugging this?
> Since orientation detection is working is it maybe in the phy code and
> not in the tcpm driver? Or does that also touch crucial stuff for USB
> apart from telling phy which direction to use?

PHY - I'd almost just do the following

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c 
b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index edb788a71edeb..bbac82bd093f8 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -3369,7 +3369,7 @@ static int qmp_combo_typec_switch_set(struct 
typec_switch_dev *sw,

         dev_dbg(qmp->dev, "Toggling orientation current %d requested %d\n",
                 qmp->orientation, orientation);
-
+return 0;

In that case the PHY should "just work" for host or device in one 
orientation.

The other possibility is that the data role message is not hitting dwc3 
drd on your platform.

If you take the last commit on this branch - plus the updated PHY commit

Commit: 171d7f507511 ("usb: dwc3: drd: Enable user-space triggered 
role-switching")

Commit: eb0daa19f3ad ("phy: qcom-qmp: Register as a typec switch for 
orientation detection")

https://git.codelinaro.org/bryan.odonoghue/kernel/-/tree/linux-next-23-04-17-pm8150b-tcpm-qcom-wrapper-typec-mux

cat /sys/class/usb_role/a600000.usb-role-switch/role

On SM8250 it looks like this

- Attach TypeC accessory with USB key plugged in [1]
   Mount USB key, read/write some data
   Unmount USB key

   cat /sys/class/usb_role/a600000.usb-role-switch/role
   host

- Attach TypeC accessory in opposite orientation
   Run same test

- Connect to PC via TypeC cable
   Run usb-ecm-up.sh [2]

   cat /sys/class/usb_role/a600000.usb-role-switch/role
   device

   PC     : ifconfig enp49s0f3u2u4 192.168.8.1
   SM8250 : ifconfig usb0 192.168.8.2
   Then
     PC     : iperf -s
     SM8250 : iperf -c 192.168.8.1 -t 10
     [  1] 0.0000-10.0706 sec   307 MBytes   256 Mbits/sec

- Unplug from PC - replug TypeC accessory
   Rerun test in both orientations

- Replug target to PC
   In this case we only have to reset the IP address

   PC     : ifconfig enp49s0f3u2u4 192.168.8.1
   SM8250 : ifconfig usb0 192.168.8.2

Yep its worth checking out that the data-role switch is working, we 
might be looking at the wrong thing for you on the PHY.

[1] 
https://www.amazon.com/CableCreation-Multiport-Adapter-Gigabit-Ethernet/dp/B08FWMWGTD

[2] usb-ecm-up.sh
root@linaro-gnome:~# cat usb-ecm-up.sh
#!/usr/bin/env bash

# load libcomposite module
modprobe libcomposite

# ensure function is loaded
modprobe usb_f_ecm
modprobe usb_f_ncm

mount -t configfs none /sys/kernel/config/

# create a gadget
mkdir /sys/kernel/config/usb_gadget/g0

# cd to its configfs node
cd /sys/kernel/config/usb_gadget/g0

# configure it (vid/pid can be anything if USB Class is used for driver 
compat)
echo 0x0525 > idVendor
echo 0xa4a4 > idProduct

# configure its serial/mfg/product
mkdir strings/0x409

echo 0xCAFEBABE > strings/0x409/serialnumber
echo Linaro > strings/0x409/manufacturer
echo qrb5165-rb5 > strings/0x409/product

# create configs
mkdir configs/c.1
mkdir configs/c.1/strings/0x409

# create the function (name must match a usb_f_<name> module such as 'acm')
mkdir functions/ncm.0

echo "CDC ECM" > configs/c.1/strings/0x409/configuration

# associate function with config
ln -s functions/ncm.0 configs/c.1

# Set USB version 3.1
echo 0x0310 > bcdUSB

echo "super-speed-plus" > max_speed

# enable gadget by binding it to a UDC from /sys/class/udc
#echo a600000.dwc3 > UDC
echo a600000.usb > UDC
# to unbind it: echo "" > UDC; sleep 1; rm -rf 
/sys/kernel/config/usb_gadget/g0

sleep 1

ifconfig usb0 192.168.8.2

