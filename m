Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EEAB93A0395
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jun 2021 21:24:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236800AbhFHTSv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Jun 2021 15:18:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237429AbhFHTQ0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Jun 2021 15:16:26 -0400
Received: from relay03.th.seeweb.it (relay03.th.seeweb.it [IPv6:2001:4b7a:2000:18::164])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78984C06114F;
        Tue,  8 Jun 2021 12:08:09 -0700 (PDT)
Received: from [192.168.1.101] (83.6.168.161.neoplus.adsl.tpnet.pl [83.6.168.161])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 1574A2004C;
        Tue,  8 Jun 2021 21:08:06 +0200 (CEST)
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: Add support for SONY Xperia X
 Performance / XZ / XZs (msm8996, Tone platform)
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>
References: <20210608152737.154218-1-konrad.dybcio@somainline.org>
 <20210608152737.154218-3-konrad.dybcio@somainline.org>
 <YL+dSBRwS3bf1ztb@gerhold.net>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
Message-ID: <409ef9ca-0533-ddc3-3332-5cc2af0aa1e0@somainline.org>
Date:   Tue, 8 Jun 2021 21:08:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YL+dSBRwS3bf1ztb@gerhold.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


>> +/delete-node/ &hdmi;
>> +/delete-node/ &hdmi_phy;
>> +/delete-node/ &mdp5_intf3_out;
> Is it not enough to set those to status = "disabled"? Kind of strange
> that you have to delete those entirely. I guess ideally "hdmi" should
> even be disabled by default in the SoC device tree.

Saving memory and bloat where possible. Deleting these makes inspecting decompiled

DTBs simpler and allows for ever so slightly bigger kernel images (the boot partition is finite).



>> +
>> +	panel_tvdd: tvdd-regulator {
>> +		compatible = "regulator-fixed";
>> +		regulator-name = "panel_tvdd";
>> +		gpio = <&tlmm 50 GPIO_ACTIVE_HIGH>;
> regulator-fixed is active-low without "enable-active-high;"
> If that's what you want it's probably more clear to write
> GPIO_ACTIVE_LOW. Otherwise, perhaps you forgot that property? :)

Interestingly enough it doesn't work *with* the property, but does without :|


Konrad

