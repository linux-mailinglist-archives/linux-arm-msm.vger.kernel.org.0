Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFC7D339B4B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Mar 2021 03:36:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232992AbhCMCfr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 Mar 2021 21:35:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232949AbhCMCfi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 Mar 2021 21:35:38 -0500
Received: from relay07.th.seeweb.it (relay07.th.seeweb.it [IPv6:2001:4b7a:2000:18::168])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF18DC061574;
        Fri, 12 Mar 2021 18:35:37 -0800 (PST)
Received: from [192.168.1.101] (abac242.neoplus.adsl.tpnet.pl [83.6.166.242])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 9588E3EE58;
        Sat, 13 Mar 2021 03:35:35 +0100 (CET)
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: sdm845: Move reserved-memory to
 devices
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Doug Anderson <dianders@chromium.org>
References: <20210312234310.3490809-1-bjorn.andersson@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
Message-ID: <13234328-7251-407d-8870-d409708632e3@somainline.org>
Date:   Sat, 13 Mar 2021 03:35:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210312234310.3490809-1-bjorn.andersson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,


I'm not sure I can agree. Especially for regions like IPA and TZ-reserved, which seem the same on (almost?) all..


Sure, the configuration for various remoteprocs *can* differ based on what the vendor decided to go with, but more often than not (especially with phones) vendors just take a MTP or CDP design, add a screen, couple of cameras and call it their own (you can tell by how similar most of them to the original reference designs in DT). While this is usually the case with lower-end (so not exactly sdm845) devices, it also kinda applies here...


I guess for this one, we should find the lowest common denominator and keep the nodes that are in the majority of devices in 845 DTSI and only alter them if need be.. For WoA devices that may stray further away, you can just add a label to reserved-memory and /delete-node/ it, so that you can rewrite it cleanly. The proposed approach just adds a lot - A LOT - of duplication. It will REALLY bite after more people submit 845-based phones, of which there are plenty (4 Xperias, a whole lot of Xiaomis, a couple of Samsungs, LGs... need I go on?).


Konrad

