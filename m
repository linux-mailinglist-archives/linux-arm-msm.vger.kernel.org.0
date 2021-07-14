Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8299E3C7F95
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jul 2021 09:48:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238330AbhGNHuw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Jul 2021 03:50:52 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:16855 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238333AbhGNHuv (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Jul 2021 03:50:51 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1626248880; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=SFKw+GHBRVetr42G54iytoT6j/yGrxSa5sLEwFKpf3M=;
 b=Ohpc0ktzuZ1aISFaYUDNtnsJoO3twcTav1NyfT5FSzf0pvFMKIEWBmQSHeIjqesYcZaHfgAS
 vEZOr+qDRI/eyDzA8CPHNtj9deOVgnp6k2JSZRf2r9uYPSzlrZ8cTVgH7GjMK20N4kcjIINC
 gWd39AaDulmyFfeP6T4k77nhXCE=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 60ee969706ea41c941a5a46b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 14 Jul 2021 07:47:35
 GMT
Sender: rojay=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 62FEDC4323A; Wed, 14 Jul 2021 07:47:34 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: rojay)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 64FCCC433D3;
        Wed, 14 Jul 2021 07:47:33 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 14 Jul 2021 13:17:33 +0530
From:   rojay@codeaurora.org
To:     Stephen Boyd <swboyd@chromium.org>, robh+dt@kernel.org
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Rajendra Nayak <rnayak@codeaurora.org>,
        saiprakash.ranjan@codeaurora.org, msavaliy@qti.qualcomm.com,
        rajpat@codeaurora.org
Subject: Re: [PATCH V3 1/3] arm64: dts: sc7280: Add QSPI node
In-Reply-To: <CAE-0n51NfHSwRQvG0HnTcHBkv=Huy-CXEwJCxLG03MN3dSe5kA@mail.gmail.com>
References: <20210604135439.19119-1-rojay@codeaurora.org>
 <20210604135439.19119-2-rojay@codeaurora.org> <YLxHTDxVcSvVxsd5@builder.lan>
 <98befc79fc039496b0c12d7983319c92@codeaurora.org>
 <2ad7a00924b5065bf61c47e8b6d24339@codeaurora.org>
 <CAE-0n51NfHSwRQvG0HnTcHBkv=Huy-CXEwJCxLG03MN3dSe5kA@mail.gmail.com>
Message-ID: <498a2359eec36c6a0b811337ee187df8@codeaurora.org>
X-Sender: rojay@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-07-09 06:26, Stephen Boyd wrote:
> Quoting rojay@codeaurora.org (2021-07-06 02:19:27)
>> On 2021-06-08 13:37, rojay@codeaurora.org wrote:
>> > On 2021-06-06 09:25, Bjorn Andersson wrote:
>> >> On Fri 04 Jun 08:54 CDT 2021, Roja Rani Yarubandi wrote:
>> >>
>> >>> Add QSPI DT node for SC7280 SoC.
>> >>>
>> >>> Signed-off-by: Roja Rani Yarubandi <rojay@codeaurora.org>
>> >>> ---
>> >>> Changes in V3:
>> >>>  - Broken the huge V2 patch into 3 smaller patches.
>> >>>    1. QSPI DT nodes
>> >>>    2. QUP wrapper_0 DT nodes
>> >>>    3. QUP wrapper_1 DT nodes
>> >>>
>> >>> Changes in V2:
>> >>>  - As per Doug's comments removed pinmux/pinconf subnodes.
>> >>>  - As per Doug's comments split of SPI, UART nodes has been done.
>> >>>  - Moved QSPI node before aps_smmu as per the order.
>> >>>
>> >>>  arch/arm64/boot/dts/qcom/sc7280-idp.dts | 29 ++++++++++++
>> >>>  arch/arm64/boot/dts/qcom/sc7280.dtsi    | 61
>> >>> +++++++++++++++++++++++++
>> >>>  2 files changed, 90 insertions(+)
>> >>>
>> >>> diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dts
>> >>> b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
>> >>> index 3900cfc09562..d0edffc15736 100644
>> >>> --- a/arch/arm64/boot/dts/qcom/sc7280-idp.dts
>> >>> +++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
>> >>> @@ -268,6 +268,22 @@ pmr735b_die_temp {
>> >>>             };
>> >>>  };
>> >>>
>> >>> +&qspi {
>> >>> +   status = "okay";
>> >>> +   pinctrl-names = "default";
>> >>> +   pinctrl-0 = <&qspi_clk>, <&qspi_cs0>, <&qspi_data01>;
>> >>> +
>> >>> +   flash@0 {
>> >>> +           compatible = "jedec,spi-nor";
>> >>> +           reg = <0>;
>> >>> +
>> >>> +           /* TODO: Increase frequency after testing */
>> >>> +           spi-max-frequency = <25000000>;
>> >>> +           spi-tx-bus-width = <2>;
>> >>> +           spi-rx-bus-width = <2>;
>> >>> +   };
>> >>> +};
>> >>> +
>> >>>  &qupv3_id_0 {
>> >>>     status = "okay";
>> >>>  };
>> >>> @@ -278,6 +294,19 @@ &uart5 {
>> >>>
>> >>>  /* PINCTRL - additions to nodes defined in sc7280.dtsi */
>> >>>
>> >>> +&qspi_cs0 {
>> >>> +   bias-disable;
>> >>> +};
>> >>> +
>> >>> +&qspi_clk {
>> >>> +   bias-disable;
>> >>> +};
>> >>> +
>> >>> +&qspi_data01 {
>> >>> +   /* High-Z when no transfers; nice to park the lines */
>> >>> +   bias-pull-up;
>> >>> +};
>> >>> +
>> >>>  &qup_uart5_default {
>> >>>     tx {
>> >>>             pins = "gpio46";
>> >>> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> >>> b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> >>> index 6c9d5eb93f93..3047ab802cd2 100644
>> >>> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> >>> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> >>> @@ -1061,6 +1061,42 @@ apss_merge_funnel_in: endpoint {
>> >>>                     };
>> >>>             };
>> >>>
>> >>> +           qspi_opp_table: qspi-opp-table {
>> >>
>> >> This node doesn't represents anything on the mmio bus, so it shouldn't
>> >> live in in /soc. Can't you move it into &qspi?
>> >>
>> >> Regards,
>> >> Bjorn
>> >>
>> >
>> > Sure, will move it into qspi node.
>> >
>> > Thanks,
>> > Roja
>> >
>> 
>> Hi Bjorn,
>> 
>> Moving "qspi_opp_table" inside &qspi node causing this warning:
>> arch/arm64/boot/dts/qcom/sc7280.dtsi:1055.35-1072.6: Warning
>> (spi_bus_reg): /soc@0/spi@88dc000/qspi-opp-table: missing or empty reg
>> property
> 
> If DT folks are OK I think we should hard-code 'opp-table' as not a
> device for spi to populate on the spi bus and relax the warning in the
> devicetree compiler (see [1] for more details). Technically, nodes that
> are bus controllers assume all child nodes are devices on that bus.  In
> this case, we want to stick the opp table as a child of the spi node so
> that it can be called 'opp-table' and not be a node in the root of DT.
> 
>> 
>> Shall I keep the qspi-opp-table out of &qspi node?
>> 
> 
> If you do, please move it to / instead of putting it under /soc as it
> doesn't have an address or a reg property.
> 

Hi Bjorn, Rob

Can we move this "qspi_opp_table" to / from /soc?

Thanks,
Roja

> [1]
> https://github.com/dgibson/dtc/blob/69595a167f06c4482ce784e30df1ac9b16ceb5b0/checks.c#L1844
