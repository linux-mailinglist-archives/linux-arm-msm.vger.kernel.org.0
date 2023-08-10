Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B0507774C6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Aug 2023 11:38:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233302AbjHJJiO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Aug 2023 05:38:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232434AbjHJJiO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Aug 2023 05:38:14 -0400
X-Greylist: delayed 3610 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 10 Aug 2023 02:38:12 PDT
Received: from 2.mo560.mail-out.ovh.net (2.mo560.mail-out.ovh.net [188.165.53.149])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EB2AB4
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Aug 2023 02:38:12 -0700 (PDT)
Received: from director6.ghost.mail-out.ovh.net (unknown [10.108.20.216])
        by mo560.mail-out.ovh.net (Postfix) with ESMTP id B489D26958
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Aug 2023 08:19:48 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-mcdsn (unknown [10.110.208.248])
        by director6.ghost.mail-out.ovh.net (Postfix) with ESMTPS id B128A1FD86;
        Thu, 10 Aug 2023 08:19:45 +0000 (UTC)
Received: from etezian.org ([37.59.142.95])
        by ghost-submission-6684bf9d7b-mcdsn with ESMTPSA
        id JGJ1J6Gd1GQ4WwAAFS1g3g
        (envelope-from <andi@etezian.org>); Thu, 10 Aug 2023 08:19:45 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-95G00158ee42f4-af56-45f4-9d06-950df53a57f6,
                    62EFBB9BC1B6506EF7AC1DC0B5845D5E0D36228A) smtp.auth=andi@etezian.org
X-OVh-ClientIp: 178.238.172.51
From:   Andi Shyti <andi.shyti@kernel.org>
To:     florian.fainelli@broadcom.com, rjui@broadcom.com,
        sbranden@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
        yangyicong@hisilicon.com, aisheng.dong@nxp.com,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, kblaiech@nvidia.com,
        asmaa@nvidia.com, loic.poulain@linaro.org, rfoss@kernel.org,
        ardb@kernel.org, gcherian@marvell.com,
        Liao Chang <liaochang1@huawei.com>
Cc:     Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 0/9] Use dev_err_probe in i2c probe function
Date:   Thu, 10 Aug 2023 10:19:35 +0200
Message-Id: <169165547667.2480436.2965071341321476080.b4-ty@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230808012954.1643834-1-liaochang1@huawei.com>
References: <20230808012954.1643834-1-liaochang1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 11359204162790034076
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedviedrleeigddtvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomheptehnughiucfuhhihthhiuceorghnughirdhshhihthhisehkvghrnhgvlhdrohhrgheqnecuggftrfgrthhtvghrnhepveevieffieefgfefuddvteelffeuhfelffejteejuddvveekveehvdejgeefteevnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepuddvjedrtddrtddruddpudejkedrvdefkedrudejvddrhedupdefjedrheelrddugedvrdelheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegrnhguihesvghtvgiiihgrnhdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqrghrmhdqmhhsmhesvhhgvghrrdhkvghrnhgvlhdrohhrghdpoffvtefjohhsthepmhhoheeitddpmhhouggvpehsmhhtphhouhht
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi

On Tue, 08 Aug 2023 09:29:45 +0800, Liao Chang wrote:
> Use the dev_err_probe function instead of dev_err in the probe function
> so that the printed messge includes the return value and also handles
> -EPROBE_DEFER nicely.
> 
> NOTICE: dev_err_probe always print the second parameter that happens to
> be the return value, hence the return errno will be removed from the
> third parameter to avoid a redundant error message.
> 
> [...]

With the messge/message change in the commit log, applied to
i2c/andi-for-next on

https://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git

Please note that this patch may still undergo further evaluation
and the final decision will be made in collaboration with
Wolfram.

Thank you,
Andi

Patches applied
===============
[1/9] i2c: bcm2835: Use dev_err_probe in probe function
      commit: 7aec2f39a1a4be99a7872e2342a69b96396c3e0c
[2/9] i2c: mlxbf: Use dev_err_probe in probe function
      commit: 45a7a0524bff52360f82277f165bbdef7a199484
[3/9] i2c: xlp9xx: Use dev_err_probe in probe function
      commit: 9a648b3f56c49551081b9560392e9a640aa3d5cb
[4/9] i2c: hisi: Use dev_err_probe in probe function
      commit: 3c5e6ae40164ba6af1efaa1ca94e2cdea0c8f25e
[5/9] i2c: qcom-cci: Use dev_err_probe in probe function
      commit: 605efbf43813857d8110ca0b5bda75f93426a789
[6/9] i2c: pxa: Use dev_err_probe in probe function
      commit: d29066600a85b15077221be404a38d9c4bf5b888
[7/9] i2c: dln2: Use dev_err_probe in probe function
      commit: 235712aa7ebf75a8442905ae672c02a4f9f8468c
[8/9] i2c: imx-lpi2c: Use dev_err_probe in probe function
      commit: 5d51af11f41eb348d9c3ccb5c74ffa9078673166
[9/9] i2c: synquacer: Use dev_err_probe in probe function
      commit: 7a34bab2daeaae6d2f32bdfa20b876a8f210cd7a
