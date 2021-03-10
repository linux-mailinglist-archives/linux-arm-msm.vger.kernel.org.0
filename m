Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F120333D7E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Mar 2021 14:16:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231922AbhCJNQD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Mar 2021 08:16:03 -0500
Received: from z11.mailgun.us ([104.130.96.11]:57227 "EHLO z11.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232710AbhCJNP5 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Mar 2021 08:15:57 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1615382157; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=61KOGg5DVCRRDiUIctxhV2DNXZ6vJnFQ+jXLaos6IFQ=;
 b=GTfcG2Izg322XphZm4SlVCHxLCC37qCACzFc0x6z6l+CUIxopZR38/CobOBU9EEt15hAvA1i
 mUdHprEWQHTeIx7TRDSV5dt+/kZkLI2rOlT6gW/arpg0Xv/kUobtQz679k2CuFzVOKZRAKEn
 tO6bJB/+67eNfF4/Y0sjpB1GCgk=
X-Mailgun-Sending-Ip: 104.130.96.11
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 6048c6880c7cf0f56cc85928 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 10 Mar 2021 13:15:52
 GMT
Sender: sbhanu=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 66B6AC43467; Wed, 10 Mar 2021 13:15:52 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sbhanu)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C5687C433CA;
        Wed, 10 Mar 2021 13:15:51 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 10 Mar 2021 18:45:51 +0530
From:   sbhanu@codeaurora.org
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     adrian.hunter@intel.com, ulf.hansson@linaro.org,
        robh+dt@kernel.org, sartgarg@codeaurora.org,
        asutoshd@codeaurora.org, stummala@codeaurora.org,
        vbadigan@codeaurora.org, rampraka@codeaurora.org,
        sayalil@codeaurora.org, rnayak@codeaurora.org,
        saiprakash.ranjan@codeaurora.org, sibis@codeaurora.org,
        cang@codeaurora.org, pragalla@codeaurora.org,
        nitirawa@codeaurora.org, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org
Subject: Re: [PATCH V1] arm64: dts: qcom: sc7280: Add nodes for eMMC and SD
 card
In-Reply-To: <9346cc73-297a-6bd8-1d0f-c09027ebcced@somainline.org>
References: <1615317483-23780-1-git-send-email-sbhanu@codeaurora.org>
 <9346cc73-297a-6bd8-1d0f-c09027ebcced@somainline.org>
Message-ID: <3590f707e807beedfa074477470b5b5c@codeaurora.org>
X-Sender: sbhanu@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-03-10 02:20, Konrad Dybcio wrote:
> Hi!
> 
> 
>> +
>> +&sdhc_1 {
>> +	status = "okay";
>> +
>> +	pinctrl-names = "default", "sleep";
>> +	pinctrl-0 = <&sdc1_on>;
>> +	pinctrl-1 = <&sdc1_off>;
>> +
>> +	vmmc-supply = <&vreg_l7b_2p9>;
>> +	vqmmc-supply = <&vreg_l19b_1p8>;
>> +
> 
> Redundant newline, please remove
> 
> 
>> +
>> +			mmc-ddr-1_8v;
>> +			mmc-hs200-1_8v;
>> +			mmc-hs400-1_8v;
>> +			mmc-hs400-enhanced-strobe;
>> +
>> +			status = "disabled";
>> +
> 
> Redundant newline, please remove
> 
sure
> 
>> +		};
>> +
>> +		sdhc_2: sdhci@8804000 {
>> +			compatible = "qcom,sdhci-msm-v5";
>> +			reg = <0 0x08804000 0 0x1000>;
>> +
>> +			iommus = <&apps_smmu 0x100 0x0>;
>> +			interrupts = <GIC_SPI 207 IRQ_TYPE_LEVEL_HIGH>,
>> +					<GIC_SPI 223 IRQ_TYPE_LEVEL_HIGH>;
>> +			interrupt-names = "hc_irq", "pwr_irq";
>> +
>> +			clocks = <&gcc GCC_SDCC2_APPS_CLK>,
>> +					<&gcc GCC_SDCC2_AHB_CLK>,
>> +					<&rpmhcc RPMH_CXO_CLK>;
>> +			clock-names = "core", "iface", "xo";
>> +
>> +			bus-width = <4>;
>> +
>> +			no-mmc;
>> +			no-sdio;
>> +
>> +			max-frequency = <202000000>;
>> +
>> +			qcom,dll-config = <0x0007642c>;
>> +
>> +			status = "disabled";
>> +
> 
> Redundant newline, please remove
> 
sure
> 
> Konrad
