Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D8C12F781A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Jan 2021 12:56:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726045AbhAOLzb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Jan 2021 06:55:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726046AbhAOLza (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Jan 2021 06:55:30 -0500
Received: from relay07.th.seeweb.it (relay07.th.seeweb.it [IPv6:2001:4b7a:2000:18::168])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB94EC061757;
        Fri, 15 Jan 2021 03:54:34 -0800 (PST)
Received: from [192.168.1.101] (abaf224.neoplus.adsl.tpnet.pl [83.6.169.224])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 362E33EBB7;
        Fri, 15 Jan 2021 12:54:28 +0100 (CET)
Subject: Re: [PATCH 1/4] phy: qcom-qmp: Add SM8350 USB QMP PHYs
To:     Jack Pham <jackp@codeaurora.org>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Wesley Cheng <wcheng@codeaurora.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20210115104047.3460-1-jackp@codeaurora.org>
 <20210115104047.3460-2-jackp@codeaurora.org>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
Message-ID: <2c5481fe-f5be-5d6a-f62f-c93d04b9210e@somainline.org>
Date:   Fri, 15 Jan 2021 12:54:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210115104047.3460-2-jackp@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,


I might be wrong but it looks as if you forgot to add a compatible for the "sm8350_usb3_uniphy_cfg" configuration.


Konrad

