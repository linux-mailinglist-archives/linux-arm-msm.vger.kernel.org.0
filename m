Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 400CD303440
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Jan 2021 06:21:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726402AbhAZFVD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Jan 2021 00:21:03 -0500
Received: from guitar.tcltek.co.il ([192.115.133.116]:57725 "EHLO
        mx.tkos.co.il" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726931AbhAYJm5 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Jan 2021 04:42:57 -0500
Received: from tarshish (unknown [10.0.8.2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mx.tkos.co.il (Postfix) with ESMTPS id 828C4440205;
        Mon, 25 Jan 2021 10:44:49 +0200 (IST)
User-agent: mu4e 1.4.14; emacs 27.1
From:   Baruch Siach <baruch@tkos.co.il>
To:     linux-arm-msm@vger.kernel.org
Cc:     Kathiravan T <kathirav@codeaurora.org>
Subject: IPQ6018 CP01 boot hangs
Date:   Mon, 25 Jan 2021 10:44:49 +0200
Message-ID: <87sg6pcsn2.fsf@tarshish>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi linux-arm-msm list,

I am trying to boot kernel v5.11-rc4 on the IPQ6018 based CP01 board. Boot
hangs with these last lines shown on the console:

[    0.000000] psci: probing for conduit method from DT.
[    0.000000] psci: PSCIv1.0 detected in firmware.
[    0.000000] psci: Using standard PSCI v0.2 function IDs
[    0.000000] psci: MIGRATE_INFO_TYPE not supported.
[    0.000000] psci: SMC Calling Convention v1.0
[    0.000000] psci: OSI mode supported.

I verified that the psci_set_osi_mode() call after the last print never
returns.

The board is loaded with stock boot image running 32-bit vendor provided
U-Boot version 2016.01. So I'm loading a 32-bit kernel with the
ipq6018-cp01-c1.dtb file from arm64.

The only boot image version identification appears to be this:

S - QC_IMAGE_VERSION_STRING=BOOT.XF.0.3-00072-IPQ60xxLZB-1

Are there any missing patches I need to make boot succeed?

Thanks,
baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
