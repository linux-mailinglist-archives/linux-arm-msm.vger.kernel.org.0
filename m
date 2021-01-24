Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95552301D13
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Jan 2021 16:14:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726488AbhAXPOK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 24 Jan 2021 10:14:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726462AbhAXPNh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 24 Jan 2021 10:13:37 -0500
Received: from relay05.th.seeweb.it (relay05.th.seeweb.it [IPv6:2001:4b7a:2000:18::166])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CDAFC061756
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 Jan 2021 07:12:39 -0800 (PST)
Received: from [192.168.1.101] (abaf224.neoplus.adsl.tpnet.pl [83.6.169.224])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 0F0A93EB8B;
        Sun, 24 Jan 2021 16:12:36 +0100 (CET)
Subject: Re: [PATCH 1/3] arm64: dts: qcom: Add device tree for BQ Aquaris X5
 (Longcheer L8910)
To:     Jonathan Albrieux <jonathan.albrieux@gmail.com>,
        linux-kernel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, stephan@gerhold.net,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20210124135409.5473-1-jonathan.albrieux@gmail.com>
 <20210124135409.5473-2-jonathan.albrieux@gmail.com>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
Message-ID: <cb299b22-f00f-c8fd-648e-6f34c34b0967@somainline.org>
Date:   Sun, 24 Jan 2021 16:12:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210124135409.5473-2-jonathan.albrieux@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The sorting on smd_rpm_regulators & msmgpio seems off.. unless it's the new thing to put it at the end?

Also, did you forget the copyright header or is that on purpose?


Otherwise, LGTM


Konrad

