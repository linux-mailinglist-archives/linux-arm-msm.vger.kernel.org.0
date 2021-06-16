Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00AC23A9AE8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jun 2021 14:47:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232801AbhFPMtD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Jun 2021 08:49:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232920AbhFPMtB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Jun 2021 08:49:01 -0400
Received: from relay02.th.seeweb.it (relay02.th.seeweb.it [IPv6:2001:4b7a:2000:18::163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D59ACC061574;
        Wed, 16 Jun 2021 05:46:54 -0700 (PDT)
Received: from [192.168.1.101] (83.6.168.10.neoplus.adsl.tpnet.pl [83.6.168.10])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 2C0561FF7B;
        Wed, 16 Jun 2021 14:46:52 +0200 (CEST)
Subject: Re: [PATCH V2] arm64: dts: qcom: sc7180: Add xo clock for eMMC and Sd
 card
To:     Shaik Sajida Bhanu <sbhanu@codeaurora.org>,
        adrian.hunter@intel.com, ulf.hansson@linaro.org, robh+dt@kernel.org
Cc:     asutoshd@codeaurora.org, stummala@codeaurora.org,
        vbadigan@codeaurora.org, rampraka@codeaurora.org,
        sayalil@codeaurora.org, sartgarg@codeaurora.org,
        rnayak@codeaurora.org, saiprakash.ranjan@codeaurora.org,
        sibis@codeaurora.org, okukatla@codeaurora.org, djakov@kernel.org,
        cang@codeaurora.org, pragalla@codeaurora.org,
        nitirawa@codeaurora.org, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org
References: <1623835059-29302-1-git-send-email-sbhanu@codeaurora.org>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
Message-ID: <069df71e-3d01-8938-fa9b-7b79851b5508@somainline.org>
Date:   Wed, 16 Jun 2021 14:46:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1623835059-29302-1-git-send-email-sbhanu@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 16.06.2021 11:17, Shaik Sajida Bhanu wrote:
> Add XO clock for eMMC and SDCard as it would help in calculating dll
> register values.
>
> Signed-off-by: Shaik Sajida Bhanu <sbhanu@codeaurora.org>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>

This patch is already applied in qcom/for-next :)


https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git/commit/?h=for-next&id=81cfa462e458405f58b23f45ddd9439c70bf5347


Konrad

