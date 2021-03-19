Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 110FE341701
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Mar 2021 09:01:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234225AbhCSIBI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 Mar 2021 04:01:08 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:59098 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234178AbhCSIBE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 Mar 2021 04:01:04 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1616140864; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=anXZKrHijnJBEv675UX9vOPYHJeliPJ8SB1cZ2CSvKQ=;
 b=X7uI+WWV8bMPgNQeGDNqtJ6y2ct09PJbOYASNCoRvr0myiUfaaN9UtJlfGMKRTRgaEqb96m0
 YvO3qslsnlXjY9faLSVsgfRJ8ybZPfd/11t+CoPGmVdSnvgkdE+f55CUnE1tr5yYq2CIBEAf
 LFZqVt2A8PLl0D6LwRhEKwSo6i0=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 60545a354db3bb6801c93124 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 19 Mar 2021 08:00:53
 GMT
Sender: skakit=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id F4114C43462; Fri, 19 Mar 2021 08:00:52 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: skakit)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id CE57BC433C6;
        Fri, 19 Mar 2021 08:00:51 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 19 Mar 2021 13:30:51 +0530
From:   skakit@codeaurora.org
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, rnayak@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, kgunda@codeaurora.org,
        David Collins <collinsd@codeaurora.org>, sbhanu@codeaurora.org
Subject: Re: [PATCH V2 3/5] arm64: dts: qcom: sc7280: Add RPMh regulators for
 sc7280-idp
In-Reply-To: <YFE+mC0dP0atFA8A@google.com>
References: <1615816454-1733-1-git-send-email-skakit@codeaurora.org>
 <1615816454-1733-4-git-send-email-skakit@codeaurora.org>
 <YFE+mC0dP0atFA8A@google.com>
Message-ID: <3caea8e288a9e196bd74ff4d57c8230d@codeaurora.org>
X-Sender: skakit@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-03-17 04:56, Matthias Kaehlcke wrote:
> On Mon, Mar 15, 2021 at 07:24:12PM +0530, satya priya wrote:
>> Add regulator devices for SC7280 as RPMh regulators. This ensures
>> that consumers are able to modify the physical state of PMIC
>> regulators.
>> 
>> Signed-off-by: satya priya <skakit@codeaurora.org>
>> ---
>> Changes in V2:
>>  - Corrected the indentation for "compatible" and "qcom,pmic-id" under
>>    pm8350c-regulators as per Konrad's comment.
>> 
>>  arch/arm64/boot/dts/qcom/sc7280-idp.dts | 212 
>> ++++++++++++++++++++++++++++++++
>>  1 file changed, 212 insertions(+)
>> 
>> diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dts 
>> b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
>> index 428f863..78effe5 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7280-idp.dts
>> +++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
>> @@ -22,6 +22,218 @@
>>  	};
>>  };
>> 
>> +&apps_rsc {
>> +	pm7325-regulators {
>> +		compatible = "qcom,pm7325-rpmh-regulators";
>> +		qcom,pmic-id = "b";
>> +
>> +		vreg_s1b_1p8: smps1 {
>> +			regulator-min-microvolt = <1856000>;
> 
> For most LDOs their 'Active minimum voltage' is specified as their
> minimum, however for S1B and S8B it's the 'Nominal voltage. Is that
> intentional?
> 
> There might be a misunderstanding on my side what the values in the
> datasheet actually mean, see my comment at the end.
> 
>> +			regulator-max-microvolt = <2040000>;
>> +		};
>> +
>> +		vreg_s7b_0p9: smps7 {
>> +			regulator-min-microvolt = <535000>;
> 
> According to the datasheet the minimum voltage of the S7B regulator
> is 904 mV.
> 
>> +			regulator-max-microvolt = <1120000>;
>> +		};
>> +
>> +		vreg_s8b_1p2: smps8 {
>> +			regulator-min-microvolt = <1256000>;
>> +			regulator-max-microvolt = <1500000>;
>> +		};
>> +
>> +		vreg_l1b_0p8: ldo1 {
>> +			regulator-min-microvolt = <825000>;
>> +			regulator-max-microvolt = <925000>;
>> +		};
>> +
>> +		vreg_l2b_3p0: ldo2 {
>> +			regulator-min-microvolt = <2700000>;
>> +			regulator-max-microvolt = <3544000>;
>> +		};
> 
> Another question that came up for sc7180-trogdor regulators,
> whose core regulator config was derived from sc7180-idp: the
> label suggests that this regulator is supposed to supply 3V,
> however the range spans from 2.7 to 3.54V. Shouldn't it be
> narrower around 3V? Same for other some regulators.
> 

The label names are given based on the default voltage value(a typical 
value supported by any usecase) which is specified in the Powergrid. For 
this regulator the default voltage is 3.072V, whereas the range is 2.7 
to 3.5V

>> +
>> +		vreg_l6b_1p2: ldo6 {
>> +			regulator-min-microvolt = <1140000>;
> 
> The datasheet says the minimum for L6B is 1.2V.
> 
>> +			regulator-max-microvolt = <1260000>;
>> +		};
>> +
>> +		vreg_l7b_2p9: ldo7 {
>> +			regulator-min-microvolt = <2960000>;
>> +			regulator-max-microvolt = <2960000>;
>> +		};
> 
> This regulator has a fixed voltage in difference to the others, why
> is that?
> 

L7B and L19B regulators are used for EMMC. EMMC probe is failing if the 
value is not fixed to default voltage(2.96V for L7B). Similar issue was 
seen on Rennell as well, [1] is the upstream change for the same posted 
by storage team.

[1] https://lore.kernel.org/patchwork/patch/1176993/

>> +
>> +		vreg_l8b_0p9: ldo8 {
>> +			regulator-min-microvolt = <870000>;
>> +			regulator-max-microvolt = <970000>;
>> +		};
>> +
>> +		vreg_l9b_1p2: ldo9 {
>> +			regulator-min-microvolt = <1080000>;
>> +			regulator-max-microvolt = <1304000>;
>> +		};
>> +
>> +		vreg_l11b_1p7: ldo11 {
>> +			regulator-min-microvolt = <1504000>;
> 
> The datasheet says the mininum voltage for L11B is 1.776V.
> 
>> +			regulator-max-microvolt = <2000000>;
>> +		};
>> +
>> +		vreg_l12b_0p8: ldo12 {
>> +			regulator-min-microvolt = <751000>;
>> +			regulator-max-microvolt = <824000>;
>> +		};
>> +
>> +		vreg_l13b_0p8: ldo13 {
>> +			regulator-min-microvolt = <530000>;
>> +			regulator-max-microvolt = <824000>;
> 
> The max for L13B is 880mV, is this a copy and paste from L12B?
> 
>> +		};
>> +
>> +		vreg_l14b_1p2: ldo14 {
>> +			regulator-min-microvolt = <1080000>;
> 
> The datasheet says the mininum voltage for L14B is 1.2V.
> 
>> +			regulator-max-microvolt = <1304000>;
>> +		};
>> +
>> +		vreg_l15b_0p8: ldo15 {
>> +			regulator-min-microvolt = <765000>;
>> +			regulator-max-microvolt = <1020000>;
>> +		};
>> +
>> +		vreg_l16b_1p2: ldo16 {
>> +			regulator-min-microvolt = <1100000>;
> 
> The datasheet says the mininum voltage for L16B is 1.2V.
> 
>> +			regulator-max-microvolt = <1300000>;
>> +		};
>> +
>> +		vreg_l17b_1p8: ldo17 {
>> +			regulator-min-microvolt = <1700000>;
> 
> The datasheet says the mininum voltage for L17B is 1.8V.
> 
>> +			regulator-max-microvolt = <1900000>;
>> +		};
>> +
>> +		vreg_l18b_1p8: ldo18 {
>> +			regulator-min-microvolt = <1800000>;
>> +			regulator-max-microvolt = <2000000>;
>> +		};
>> +
>> +		vreg_l19b_1p8: ldo19 {
>> +			regulator-min-microvolt = <1800000>;
>> +			regulator-max-microvolt = <1800000>;
> 
> Is a fixed voltage intentional here?
> 

Same explanation as l7b regulator(see above).

>> +		};
>> +	};
>> +
>> +	pm8350c-regulators {
>> +		compatible = "qcom,pm8350c-rpmh-regulators";
> 
> I can't find the datasheet for this chip, skipping this part.
> 
> 
>> +	pmr735a-regulators {
>> +		compatible = "qcom,pmr735a-rpmh-regulators";
>> +		qcom,pmic-id = "e";
>> +
>> +		vreg_l2e_1p2: ldo2 {
>> +			regulator-min-microvolt = <1200000>;
>> +			regulator-max-microvolt = <1200000>;
>> +		};
>> +
>> +		vreg_l3e_0p9: ldo3 {
>> +			regulator-min-microvolt = <912000>;
>> +			regulator-max-microvolt = <1020000>;
> 
> According to the datasheet min and max for L3E is 1.2V. The
> datasheet lists different voltages for 'SM8350 lineup' and
> 'SM8xyz' lineup though, does that mean that the voltages
> aren't limitations of what the regulators can provide but
> what their consumers support?
> 
> There are also deltas for the remaining regulators, but now
> I'm in doubt about what the info in the datasheet actually
> means.
> 

The min/max voltages here are as per min/max values mentioned in AOP, 
which are finalized after multiple discussions with chipset architecture 
team. The same is followed for all chipsets.

>> +		};
>> +
>> +		vreg_l4e_1p7: ldo4 {
>> +			regulator-min-microvolt = <1776000>;
>> +			regulator-max-microvolt = <1890000>;
>> +		};
>> +
>> +		vreg_l5e_0p8: ldo5 {
>> +			regulator-min-microvolt = <800000>;
>> +			regulator-max-microvolt = <800000>;
>> +		};
>> +
>> +		vreg_l6e_0p8: ldo6 {
>> +			regulator-min-microvolt = <480000>;
>> +			regulator-max-microvolt = <904000>;
>> +		};
>> +	};
>> +};
>> +
>>  &qupv3_id_0 {
>>  	status = "okay";
>>  };
