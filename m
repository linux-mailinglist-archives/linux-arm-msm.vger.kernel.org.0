Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF8A03D9D39
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jul 2021 07:44:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233966AbhG2Fog (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Jul 2021 01:44:36 -0400
Received: from guitar.tcltek.co.il ([192.115.133.116]:51315 "EHLO
        mx.tkos.co.il" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233965AbhG2Fof (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Jul 2021 01:44:35 -0400
Received: from tarshish (unknown [10.0.8.2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mx.tkos.co.il (Postfix) with ESMTPS id 7E391440E49
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jul 2021 08:44:15 +0300 (IDT)
User-agent: mu4e 1.4.15; emacs 27.1
From:   Baruch Siach <baruch@tkos.co.il>
To:     linux-arm-msm@vger.kernel.org
Subject: qcom_glink_rpm rpm-glink: RPM TOC has invalid magic
Date:   Thu, 29 Jul 2021 08:44:29 +0300
Message-ID: <87tukdvflu.fsf@tarshish>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi linux-arm-msm list,

I can't get cpufreq to work on my IPQ6010 system because glink_rpm_probe()
fails on boot with this message:

[    2.048522] qcom_glink_rpm rpm-glink: RPM TOC has invalid magic

Dump of the IO area at 0x60000 from U-Boot shows this:

00060000: 4cc422f6 7ff52c25 c702abe9 7f3f020c    .".L%,........?.
00060010: 9e0ffe7e 6f5d9b4f e6e7789d b8fd4815    ~...O.]o.x...H..
00060020: 5b2279ee 3afb04c2 c530d8db 1dfd3487    .y"[...:..0..4..
00060030: a26b4ef7 e67e647e 78ebc07d e36941b0    .Nk.~d~.}..x.Ai.
00060040: 6984f3f5 fd73c619 50c7b8c5 7dd90ed7    ...i..s....P...}
00060050: 27976afe cdb72684 13e88a17 bb3bcbd0    .j.'.&........;.
00060060: 3a8ff5d6 3be85d8a 93002396 f7ca6853    ...:.].;.#..Sh..
00060070: 01429a10 17ba3872 5b9ca7b6 5a5bab2a    ..B.r8.....[*.[Z

Data in this area changes on every boot. Dump of kernel driver 'buf'
from glink_rpm_parse_toc() shows entirely different data.

Information on version of firmware components that might be relevant:

# cat /proc/device-tree/rpm_version 
CRM-RPM.BF.2.4.1-00089
# cat /proc/device-tree/boot_version 
crm-ubuntu121-BOOT.XF.0.3-00098-IPQ60xxLZB-1
# cat /proc/device-tree/tz_version 
CRM-TZ.WNS.5.1-00127

Any idea?

Thanks,
baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
