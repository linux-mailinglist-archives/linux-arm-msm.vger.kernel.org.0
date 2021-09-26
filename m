Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCA82418CEE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Sep 2021 00:58:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231151AbhIZXAA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 26 Sep 2021 19:00:00 -0400
Received: from relay06.th.seeweb.it ([5.144.164.167]:44255 "EHLO
        relay06.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231127AbhIZXAA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 26 Sep 2021 19:00:00 -0400
Received: from [192.168.1.101] (83.6.166.81.neoplus.adsl.tpnet.pl [83.6.166.81])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 5C38A3E85D;
        Mon, 27 Sep 2021 00:58:20 +0200 (CEST)
Message-ID: <c8d61171-225f-ca1c-db9e-7ed3f91365b8@somainline.org>
Date:   Mon, 27 Sep 2021 00:58:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.1
Subject: Re: [PATCH] arm64: dts: qcom: Drop vdd-supply from qusb2-phy devices
Content-Language: en-US
To:     Shawn Guo <shawn.guo@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Caleb Connolly <caleb@connolly.tech>,
        Amit Pundir <amit.pundir@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210926075951.28034-1-shawn.guo@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
In-Reply-To: <20210926075951.28034-1-shawn.guo@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 26.09.2021 09:59, Shawn Guo wrote:
> Looking at qcom,qusb2-phy.yaml bindings and qusb2_phy_vreg_names[] in
> qusb2-phy driver, vdd-supply is not a supported/valid property.  Drop it
> from qusb2-phy devices on various boards.
>
> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>

Why not add it to the regulators list instead? It's a valid regulator for this hw.


Konrad

