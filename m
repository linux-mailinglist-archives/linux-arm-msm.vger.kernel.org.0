Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9110B201D5D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2020 23:55:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728218AbgFSVzO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 Jun 2020 17:55:14 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:41725 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728220AbgFSVzO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 Jun 2020 17:55:14 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1592603712; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=wam1wyE1W3Of+tegUUPP3NeNpIntvTygPj4lrZBjm+o=;
 b=HKrxqujayXTasK0Gpko+KQypCMbiHIG1lS0PF5fwJvY0jz454GMKKajKkYUiLK4+fwuRJj+6
 Qdu0uz6YBUWud498/E+j/L0hbwsqgYBJHz+UnV61+7karV7+84W5ZeY/bJhxvDFg8W1OxvN9
 uWjfKowxDI+HBbTMsQe8mWbxYvI=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n12.prod.us-west-2.postgun.com with SMTP id
 5eed343d6bebe35deb2df770 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 19 Jun 2020 21:55:09
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 5208EC43387; Fri, 19 Jun 2020 21:55:09 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: tanmay)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7C819C433CA;
        Fri, 19 Jun 2020 21:55:08 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 19 Jun 2020 14:55:08 -0700
From:   tanmay@codeaurora.org
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     agross@kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        seanpaul@chromium.org, robdclark@gmail.com, dianders@chromium.org,
        aravindh@codeaurora.org, abhinavk@codeaurora.org,
        bjorn.andersson@linaro.org
Subject: Re: [PATCH v2] arm64: dts: qcom: sc7180: Add Display Port dt node
In-Reply-To: <159252916745.62212.16228625951632835694@swboyd.mtv.corp.google.com>
References: <20200618232113.22687-1-tanmay@codeaurora.org>
 <159252916745.62212.16228625951632835694@swboyd.mtv.corp.google.com>
Message-ID: <c110cd89a3144a20b21ec392f50eee68@codeaurora.org>
X-Sender: tanmay@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Thanks Stephen for reviews.
I will post new change addressing your all comments.

On 2020-06-18 18:12, Stephen Boyd wrote:
> Quoting Tanmay Shah (2020-06-18 16:21:13)
>> Enable DP driver for sc7180.
> 
> Add DP device node on sc7180? This isn't a driver.
> 
Done.
>> 
>> This change depends-on following series:
>> https://patchwork.freedesktop.org/series/78583/
>> and https://patchwork.freedesktop.org/patch/351990/
>> 
>> Changes in v2:
>> 
>> - Add assigned-clocks and assigned-clock-parents
>> - Remove cell-index and pixel_rcg
>> - Change compatible to qcom,sc7180-dp
>> 
>> Signed-off-by: Tanmay Shah <tanmay@codeaurora.org>
>> ---
>>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 57 
>> ++++++++++++++++++++++++++--
>>  1 file changed, 53 insertions(+), 4 deletions(-)
>> 
>> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi 
>> b/arch/arm64/boot/dts/qcom/sc7180.dtsi
>> index 916401f7e87c..26fe623e3b0f 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
>> @@ -2216,10 +2216,19 @@ ports {
>>                                         #address-cells = <1>;
>>                                         #size-cells = <0>;
>> 
>> +                                       port@1 {
>> +                                               reg = <1>;
>> +                                               dpu_intf1_out: 
>> endpoint {
>> +                                                       
>> remote-endpoint =
>> +                                                                
>> <&dsi0_in>;
>> +                                               };
>> +                                       };
>> +
>>                                         port@0 {
>>                                                 reg = <0>;
>> -                                               dpu_intf1_out: 
>> endpoint {
>> -                                                       
>> remote-endpoint = <&dsi0_in>;
>> +                                               dpu_intf0_out: 
>> endpoint {
>> +                                                       
>> remote-endpoint =
>> +                                                                
>> <&dp_in>;
>>                                                 };
>>                                         };
>>                                 };
> 
> I thought this wasn't supposed to change? At least according to the
> binding it shouldn't be needed.
> 
Thanks. Yes it should be port@2 as per new dpu-sc7180.yaml bindings in 
below patch.
https://patchwork.freedesktop.org/patch/371087/?series=78583&rev=1

>> @@ -2293,6 +2302,46 @@ dsi_phy: dsi-phy@ae94400 {
>>                         };
>>                 };
>> 
>> +               msm_dp: displayport-controller@ae90000{
>> +                       status = "ok";
> 
> Please use status = "disabled";
> 
Ok got it. Board's DT will enable it.

>> +                       compatible = "qcom,sc7180-dp";
>> +
>> +                       reg = <0 0xae90000 0 0x1400>;
>> +                       reg-names = "dp_controller";
>> +
>> +                       interrupt-parent = <&mdss>;
> 
> Any reason why this isn't under the mdss node like the other display
> device nodes?
> 
Done. Moved msm_dp node under mdss.
>> +                       interrupts = <12 0>;
>> +
>> +                       clocks = <&dispcc DISP_CC_MDSS_DP_AUX_CLK>,
>> +                                <&dispcc DISP_CC_MDSS_DP_LINK_CLK>,
>> +                                <&dispcc 
>> DISP_CC_MDSS_DP_LINK_INTF_CLK>,
>> +                                <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK>;
>> +                       clock-names = "core_aux", "ctrl_link",
>> +                                     "ctrl_link_iface", 
>> "stream_pixel";
>> +                       #clock-cells = <1>;
>> +                       assigned-clocks = <&dispcc 
>> DISP_CC_MDSS_DP_PIXEL_CLK_SRC>;
>> +                       assigned-clock-parents = <&msm_dp 1>;
>> +
>> +                       data-lanes = <0 1>;
> 
> This can and should be left to the board files. At the SoC level my
> understanding is that there are four lanes possible, so no need to
> artificially limit it here.
> 
Removed from here. Driver changes I will be posting accordingly.
>> +
>> +                       ports {
>> +                               #address-cells = <1>;
>> +                               #size-cells = <0>;
>> +                               port@0 {
>> +                                       reg = <0>;
>> +                                       dp_in: endpoint {
>> +                                               remote-endpoint =
>> +                                                        
>> <&dpu_intf0_out>;
> 
> I'd prefer these were on one line, regardless of the 80 character line
> limit/suggestion.
> 
ok done.
>> +                                       };
>> +                               };
>> +
>> +                               port@1 {
>> +                                       reg = <1>;
>> +                                       dp_out: endpoint { };
>> +                               };
>> +                       };
>> +               };
>> +
>>                 dispcc: clock-controller@af00000 {
>>                         compatible = "qcom,sc7180-dispcc";
>>                         reg = <0 0x0af00000 0 0x200000>;
