Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC56536129A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Apr 2021 20:59:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234506AbhDOS7Z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Apr 2021 14:59:25 -0400
Received: from relay02.th.seeweb.it ([5.144.164.163]:45649 "EHLO
        relay02.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234130AbhDOS7Z (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Apr 2021 14:59:25 -0400
Received: from [192.168.1.101] (abac128.neoplus.adsl.tpnet.pl [83.6.166.128])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id E5B541F49E;
        Thu, 15 Apr 2021 20:58:59 +0200 (CEST)
Subject: Re: [PATCH v2] arm64: boot: dts: qcom: sm8150: add SPI nodes
To:     Felipe Balbi <balbi@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Caleb Connolly <caleb@connolly.tech>,
        Felipe Balbi <felipe.balbi@microsoft.com>
References: <20210415104159.1811077-1-balbi@kernel.org>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
Message-ID: <6d861c1b-76e3-5572-8ee9-ca2c803eeac5@somainline.org>
Date:   Thu, 15 Apr 2021 20:58:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210415104159.1811077-1-balbi@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi!


> Tested on Microsoft Surface Duo (DTS will be sent after -rc1). 

Cool, along with the Lumias we'll now have all the MSFT arm64 qcom devices supported :)


>  
> +			qup_spi0_default: qup-spi0-default {
> +				mux {
> +					pins = "gpio0", "gpio1", "gpio2", "gpio3";
> +					function = "qup0";
> +				};
> +
> +				config {
> +					pins = "gpio0", "gpio1", "gpio2", "gpio3";
> +					drive-strength = <6>;
> +					bias-disable;
> +				};
> +			};
> +

This format - while technically still correct - is now considered obsolete. Please move the pin definitions into a more concise one, like so:


qup_spi0_default: qup-spi0-default {
    pins = "gpio0", "gpio1", "gpio2", "gpio3";
    function = "qup0";
    drive-strength = <6>;
    bias-disable;
};


(hopefully Thunderbird didn't mess up newlines here..)


Overall, the patch - while on the large side - looks correct to me. Thanks!


Konrad

