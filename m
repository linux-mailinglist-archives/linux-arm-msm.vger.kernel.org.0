Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0EA7D313572
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Feb 2021 15:44:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231735AbhBHOnK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Feb 2021 09:43:10 -0500
Received: from m-r1.th.seeweb.it ([5.144.164.170]:56103 "EHLO
        m-r1.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232714AbhBHOmd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Feb 2021 09:42:33 -0500
Received: from [192.168.1.101] (abad44.neoplus.adsl.tpnet.pl [83.6.167.44])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id DBFED1F671;
        Mon,  8 Feb 2021 15:41:28 +0100 (CET)
Subject: Re: [PATCH v2] arm64: dts: qcom: sdm845-xiaomi-beryllium: Add DSI and
 panel bits
To:     Amit Pundir <amit.pundir@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dt <devicetree@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>, phone-devel@vger.kernel.org
References: <1612426177-6611-1-git-send-email-amit.pundir@linaro.org>
 <889e6ed8-133a-9416-be3b-5b2a97ea7fbb@somainline.org>
 <CAMi1Hd3bgDaqsH+txFVEnBc9dsGbrgic5TK7uq4GwqqkM6seiw@mail.gmail.com>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
Message-ID: <9bbeb403-2937-aebd-91ff-5682f9112dee@somainline.org>
Date:   Mon, 8 Feb 2021 15:41:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CAMi1Hd3bgDaqsH+txFVEnBc9dsGbrgic5TK7uq4GwqqkM6seiw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


>>> +      ports {
>>> +              port@1 {
>>> +                      endpoint {
>>> +                              remote-endpoint = <&tianma_nt36672a_in_0>;
>>> +                              data-lanes = <0 1 2 3>;
>>> +                      };
>>> +              };
>>> +      };
>> The endpoint has a label, you can simply use &dsi0_out {};.
> I didn't get what you meant there. Care to point to some reference dts
> snippet please?

sdm845.dtsi, L4139 as of v5.11-rc7:


port@1 {
                        reg = <1>;
                        dsi0_out: endpoint {
                        };
                    };


This means you can essentially do:

&dsi0_out {

    remote-endpoint = <&tianma_nt36672a_in_0>;
    lanes = <0 1 2 3>;

};


in your dt :)


>>> +              vddpos-supply = <&lab>;
>>> +              vddneg-supply = <&ibb>;
>> With Angelo's latest series [1] merged in, I reckon you should explicitly configure lab/ibb (like in [2]),
>> as wrong settings (which CAN BE SET BY THE BOOTLOADER in some instances!!) can lead to hardware damage.
> So iirc in the case of beryllium device, these regulators are pre set
> by the bootloader and I can't find any reference of we
> setting/resetting it explicitly to switch ON the panel and display. So
> far default lab/ibb nodes are working fine for us and I'm hesitant to
> tinker around anything regulator related that can potentially damage
> the hardware. Having said that, I do see lab/ibb nodes being set in
> the downstream dts, with relevant soft-start and discharge-resistor
> properties and I can try switching to that once the new lab/ibb
> changes land upstream.
>
> Regards,
> Amit Pundir
>
I understand your concerns, however we actually did find out that at least one device had LAB/IBB set up by the bootloader in a way that could potentially damage the electronics, so I'm just making you aware. If it works as-is, it's probably OK.


Konrad

