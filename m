Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07B42404490
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Sep 2021 06:44:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231364AbhIIEpY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Sep 2021 00:45:24 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:63864 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229956AbhIIEpY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Sep 2021 00:45:24 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1631162655; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=v320XhZj9gyFcrPASJLLRDE9pWMYLXWJMVo7lM5KMZ0=;
 b=ClyWQFU3QQv6rHNfvoqsxm214lpeb/TSbxfm+nhjKv8/hcLm2v6xxysA/KQDelsRxffIa/xU
 xk4B7Eig+0slrZdBapZkVyxf+lmcE/74GkVdsNAQb1hOnTxuqtbSib/pFbA8UTs+sVUuZ3c+
 DrWhyOS/VN2QXF8AeRtcWneB/JQ=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 61399110161bd38c42275d4b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 09 Sep 2021 04:44:00
 GMT
Sender: rajpat=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 2448CC4360C; Thu,  9 Sep 2021 04:44:00 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: rajpat)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 0F75EC4338F;
        Thu,  9 Sep 2021 04:43:59 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 09 Sep 2021 10:13:58 +0530
From:   rajpat@codeaurora.org
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>, robh+dt@kernel.org,
        agross@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rajendra Nayak <rnayak@codeaurora.org>,
        saiprakash.ranjan@codeaurora.org, msavaliy@qti.qualcomm.com,
        mka@chromium.org, dianders@chromium.org
Subject: Re: [PATCH V3 1/3] arm64: dts: sc7280: Add QSPI node
In-Reply-To: <YPXbw6a4+B5TBD0W@yoga>
References: <20210604135439.19119-1-rojay@codeaurora.org>
 <20210604135439.19119-2-rojay@codeaurora.org> <YLxHTDxVcSvVxsd5@builder.lan>
 <98befc79fc039496b0c12d7983319c92@codeaurora.org>
 <2ad7a00924b5065bf61c47e8b6d24339@codeaurora.org>
 <CAE-0n51NfHSwRQvG0HnTcHBkv=Huy-CXEwJCxLG03MN3dSe5kA@mail.gmail.com>
 <498a2359eec36c6a0b811337ee187df8@codeaurora.org> <YPXbw6a4+B5TBD0W@yoga>
Message-ID: <b67133f1a12ff0cce1114b10ebc6d6e7@codeaurora.org>
X-Sender: rajpat@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-07-20 01:38, Bjorn Andersson wrote:
> On Wed 14 Jul 02:47 CDT 2021, rojay@codeaurora.org wrote:
> 
>> On 2021-07-09 06:26, Stephen Boyd wrote:
>> > Quoting rojay@codeaurora.org (2021-07-06 02:19:27)
>> > > On 2021-06-08 13:37, rojay@codeaurora.org wrote:
>> > > > On 2021-06-06 09:25, Bjorn Andersson wrote:
>> > > >> On Fri 04 Jun 08:54 CDT 2021, Roja Rani Yarubandi wrote:
>> > > >>
>> > > >>> Add QSPI DT node for SC7280 SoC.
>> > > >>>
>> > > >>> Signed-off-by: Roja Rani Yarubandi <rojay@codeaurora.org>
>> > > >>> ---
>> > > >>> Changes in V3:
>> > > >>>  - Broken the huge V2 patch into 3 smaller patches.
>> > > >>>    1. QSPI DT nodes
>> > > >>>    2. QUP wrapper_0 DT nodes
>> > > >>>    3. QUP wrapper_1 DT nodes
>> > > >>>
>> > > >>> Changes in V2:
>> > > >>>  - As per Doug's comments removed pinmux/pinconf subnodes.
>> > > >>>  - As per Doug's comments split of SPI, UART nodes has been done.
>> > > >>>  - Moved QSPI node before aps_smmu as per the order.
>> > > >>>
>> > > >>>  arch/arm64/boot/dts/qcom/sc7280-idp.dts | 29 ++++++++++++
>> > > >>>  arch/arm64/boot/dts/qcom/sc7280.dtsi    | 61
>> > > >>> +++++++++++++++++++++++++
>> > > >>>  2 files changed, 90 insertions(+)
>> > > >>>
>> > > >>> diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dts
>> > > >>> b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
>> > > >>> index 3900cfc09562..d0edffc15736 100644
>> > > >>> --- a/arch/arm64/boot/dts/qcom/sc7280-idp.dts
>> > > >>> +++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
>> > > >>> @@ -268,6 +268,22 @@ pmr735b_die_temp {
>> > > >>>             };
>> > > >>>  };
>> > > >>>
>> > > >>> +&qspi {
>> > > >>> +   status = "okay";
>> > > >>> +   pinctrl-names = "default";
>> > > >>> +   pinctrl-0 = <&qspi_clk>, <&qspi_cs0>, <&qspi_data01>;
>> > > >>> +
>> > > >>> +   flash@0 {
>> > > >>> +           compatible = "jedec,spi-nor";
>> > > >>> +           reg = <0>;
>> > > >>> +
>> > > >>> +           /* TODO: Increase frequency after testing */
>> > > >>> +           spi-max-frequency = <25000000>;
>> > > >>> +           spi-tx-bus-width = <2>;
>> > > >>> +           spi-rx-bus-width = <2>;
>> > > >>> +   };
>> > > >>> +};
>> > > >>> +
>> > > >>>  &qupv3_id_0 {
>> > > >>>     status = "okay";
>> > > >>>  };
>> > > >>> @@ -278,6 +294,19 @@ &uart5 {
>> > > >>>
>> > > >>>  /* PINCTRL - additions to nodes defined in sc7280.dtsi */
>> > > >>>
>> > > >>> +&qspi_cs0 {
>> > > >>> +   bias-disable;
>> > > >>> +};
>> > > >>> +
>> > > >>> +&qspi_clk {
>> > > >>> +   bias-disable;
>> > > >>> +};
>> > > >>> +
>> > > >>> +&qspi_data01 {
>> > > >>> +   /* High-Z when no transfers; nice to park the lines */
>> > > >>> +   bias-pull-up;
>> > > >>> +};
>> > > >>> +
>> > > >>>  &qup_uart5_default {
>> > > >>>     tx {
>> > > >>>             pins = "gpio46";
>> > > >>> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> > > >>> b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> > > >>> index 6c9d5eb93f93..3047ab802cd2 100644
>> > > >>> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> > > >>> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> > > >>> @@ -1061,6 +1061,42 @@ apss_merge_funnel_in: endpoint {
>> > > >>>                     };
>> > > >>>             };
>> > > >>>
>> > > >>> +           qspi_opp_table: qspi-opp-table {
>> > > >>
>> > > >> This node doesn't represents anything on the mmio bus, so it shouldn't
>> > > >> live in in /soc. Can't you move it into &qspi?
>> > > >>
>> > > >> Regards,
>> > > >> Bjorn
>> > > >>
>> > > >
>> > > > Sure, will move it into qspi node.
>> > > >
>> > > > Thanks,
>> > > > Roja
>> > > >
>> > >
>> > > Hi Bjorn,
>> > >
>> > > Moving "qspi_opp_table" inside &qspi node causing this warning:
>> > > arch/arm64/boot/dts/qcom/sc7280.dtsi:1055.35-1072.6: Warning
>> > > (spi_bus_reg): /soc@0/spi@88dc000/qspi-opp-table: missing or empty reg
>> > > property
>> >
>> > If DT folks are OK I think we should hard-code 'opp-table' as not a
>> > device for spi to populate on the spi bus and relax the warning in the
>> > devicetree compiler (see [1] for more details). Technically, nodes that
>> > are bus controllers assume all child nodes are devices on that bus.  In
>> > this case, we want to stick the opp table as a child of the spi node so
>> > that it can be called 'opp-table' and not be a node in the root of DT.
>> >
>> > >
>> > > Shall I keep the qspi-opp-table out of &qspi node?
>> > >
>> >
>> > If you do, please move it to / instead of putting it under /soc as it
>> > doesn't have an address or a reg property.
>> >
>> 
>> Hi Bjorn, Rob
>> 
>> Can we move this "qspi_opp_table" to / from /soc?
>> 
> 
> If you have made a proper attempt to convince Rob and Mark that
> a child "opp-table" in a SPI master is not a SPI device - and the
> conclusion is that this is not a good idea...then yes it should live
> outside /soc.
> 
> Thanks,
> Bjorn

Hi Rob/Mark,

adding "qspi_opp_table" inside &qspi node causing warning
we are getting "empty reg warning". qspi_opp_table contain
frequencies for qspi and i think putting "opp-table" under qspi node is 
not a
good idea because if we put under qspi it will treat "opp-table" as a 
device on the bus.
in this scenario "opp-table" is not a device on the bus. so we moved 
qspi_opp_table from /soc to /.
please give your inputs about this.

Thanks and Regards,
Rajesh
