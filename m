Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0AF5B16AA66
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2020 16:46:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727968AbgBXPqM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 Feb 2020 10:46:12 -0500
Received: from ns.iliad.fr ([212.27.33.1]:48122 "EHLO ns.iliad.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727734AbgBXPqM (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 Feb 2020 10:46:12 -0500
Received: from ns.iliad.fr (localhost [127.0.0.1])
        by ns.iliad.fr (Postfix) with ESMTP id B47C12062B;
        Mon, 24 Feb 2020 16:46:06 +0100 (CET)
Received: from [192.168.108.51] (freebox.vlq16.iliad.fr [213.36.7.13])
        by ns.iliad.fr (Postfix) with ESMTP id 94BF1202E7;
        Mon, 24 Feb 2020 16:46:06 +0100 (CET)
Subject: Re: [PATCH v9 00/15] CoreSight CTI Driver
To:     Mike Leach <mike.leach@linaro.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        DT <devicetree@vger.kernel.org>, coresight@lists.linaro.org,
        linux-doc@vger.kernel.org
Cc:     linux-arm-msm@vger.kernel.org, mathieu.poirier@linaro.org,
        suzuki.poulose@arm.com, robh+dt@kernel.org, maxime@cerno.tech,
        liviu.dudau@arm.com, sudeep.holla@arm.com,
        lorenzo.pieralisi@arm.com, agross@kernel.org, corbet@lwn.net
References: <20200210213924.20037-1-mike.leach@linaro.org>
From:   Marc Gonzalez <marc.w.gonzalez@free.fr>
Message-ID: <0acb5970-7d87-6180-01d2-154f568a3235@free.fr>
Date:   Mon, 24 Feb 2020 16:46:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200210213924.20037-1-mike.leach@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: ClamAV using ClamSMTP ; ns.iliad.fr ; Mon Feb 24 16:46:06 2020 +0100 (CET)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10/02/2020 22:39, Mike Leach wrote:

> Mike Leach (15):
>   coresight: cti: Initial CoreSight CTI Driver
>   coresight: cti: Add sysfs coresight mgmt reg access.
>   coresight: cti: Add sysfs access to program function regs
>   coresight: cti: Add sysfs trigger / channel programming API
>   dt-bindings: arm: Adds CoreSight CTI hardware definitions.
>   coresight: cti: Add device tree support for v8 arch CTI
>   coresight: cti: Add device tree support for custom CTI.
>   coresight: cti: Enable CTI associated with devices.
>   coresight: cti: Add connection information to sysfs
>   dt-bindings: qcom: Add CTI options for qcom msm8916
>   dt-bindings: arm: Juno platform - add CTI entries to device tree.
>   dt-bindings: hisilicon: Add CTI bindings for hi-6220
>   docs: coresight: Update documentation for CoreSight to cover CTI.
>   docs: sysfs: coresight: Add sysfs ABI documentation for CTI
>   Update MAINTAINERS to add reviewer for CoreSight.

Some of the patch titles end with a full stop, others don't.
(Dunno if it's worth the hassle, in case you respin)

Regards.
