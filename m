Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB0435E67B5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Sep 2022 17:56:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231771AbiIVP4G (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Sep 2022 11:56:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231822AbiIVPz6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Sep 2022 11:55:58 -0400
Received: from mail.z3ntu.xyz (mail.z3ntu.xyz [128.199.32.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4ABFF1D43
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Sep 2022 08:55:54 -0700 (PDT)
Received: from g550jk.localnet (212095005231.public.telering.at [212.95.5.231])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id D693FC70AA;
        Thu, 22 Sep 2022 15:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1663862152; bh=L4u42A2MdIb6IOpiw4kgQECCBrdDUIe5QgeQlZVIk1I=;
        h=From:To:Cc:Subject:Date;
        b=MeNv0kPE4jXr4Q/6wQHA9ZoexlAczUU/N1ZdE0cIEEpbqTR4CkTces7kzNe69a8lE
         vLohaORwCkVwcNkySa/utpCqXof2JtJ64NmhG0hjC9Mu/DyfPsaSi8DFQFxPr8qjlU
         AZDuXlnY60oiWIi7jPyHQx0xzpnhABFayO9o4XSY=
From:   Luca Weiss <luca@z3ntu.xyz>
To:     linux-arm-msm@vger.kernel.org
Cc:     linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
        Alexey Minnekhanov <alexeymin@postmarketos.org>
Subject: Boot fail with UBIFS_FS=y on Qualcomm msm8974/msm8226
Date:   Thu, 22 Sep 2022 17:55:51 +0200
Message-ID: <2845511.e9J7NaK4W3@g550jk>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FROM_SUSPICIOUS_NTLD,
        FROM_SUSPICIOUS_NTLD_FP,SPF_HELO_NONE,SPF_PASS,T_PDS_OTHER_BAD_TLD
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hey all,

sometime last year (June 2021?) I first noticed that with arm32 qcom_defconfig 
under some circumstances I get weird boot failures on msm8974-fairphone-fp2, 
and lately also seeing similar with apq8026-lg-lenok.

In short, with CONFIG_UBIFS_FS=y there's nothing from serial console, nothing 
from earlycon, just nothing on serial at all. As soon as I disable this config 
option and rebuild it boots up fine again.

At some point I also got this from fp2 logs, after I changed something in the 
boot procedure (maybe fastboot boot instead of fastboot flash? I don't recall)

> Error: invalid dtb and unrecognized/unsupported machine ID
>   r1=0x00000000, r2=0x00000000
> Available machine support:
> 
> ID (hex)        NAME
> ffffffff        Generic DT based system
> 
> Please check your kernel config and/or bootloader.

With CONFIG_UBIFS_FS=m and loading the module at runtime seems to work fine (at 
least nothing visibly broke) although I didn't try mounting anything with that 
file system.

Does anyone maybe have an idea what might cause this and/or how to debug this? 
While just disabling UBIFS_FS in my config solves the issue I feel like this 
should be resolved, because I also sometimes forget that I have to disable 
this from qcom_defconfig and then wonder why my boards aren't booting.

Regards
Luca


