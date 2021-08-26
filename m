Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A0E03F8E8B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Aug 2021 21:14:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243398AbhHZTPC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Aug 2021 15:15:02 -0400
Received: from mailfilter04-out40.webhostingserver.nl ([195.211.73.157]:61555
        "EHLO mailfilter04-out40.webhostingserver.nl" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S243339AbhHZTO6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Aug 2021 15:14:58 -0400
X-Greylist: delayed 963 seconds by postgrey-1.27 at vger.kernel.org; Thu, 26 Aug 2021 15:14:58 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=exalondelft.nl; s=whs1;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
         from;
        bh=67cnWy3rW/WRnFpQePp6vVIJLxw7FP6uaLsSK01XjKk=;
        b=LkpAVlIBxEC0Tl02Rax81B/yHLLCoLYqsROgvkNUu1r75o3tmc1N0/SOg0G4ZwtdARAFQ7ES0Lvpf
         rYiwxxXvztzsmoeDTA4dV9vBDUoWZbdWnGJKYadL+aZGlZLVtTa4kBVGuk9Eo//1+mqpVdzqkCjdpw
         xZfqeGX3yQ7/H/KEtrDVKdg0jdQkhacaLxonW/0ktY/+snjRRKBkFm3f7mrzScexeoISLsJyIBhncS
         tbW4yqKOqZRJALibjYS90HNnqhMx1UI44OShRAI5Pi0KXo3tsq7LSiHQmWRgkGa35EJbEifMlKjVxG
         nY1ylJoJqSdiENSsubR7W7ln9vMx2mA==
X-Halon-ID: 8ac6b3ea-069f-11ec-8938-001a4a4cb95f
Received: from s198.webhostingserver.nl (s198.webhostingserver.nl [141.138.168.154])
        by mailfilter04.webhostingserver.nl (Halon) with ESMTPSA
        id 8ac6b3ea-069f-11ec-8938-001a4a4cb95f;
        Thu, 26 Aug 2021 20:58:04 +0200 (CEST)
Received: from [2001:981:6fec:1:f9ad:97f3:2f9b:d8ba] (helo=localhost.localdomain)
        by s198.webhostingserver.nl with esmtpa (Exim 4.94.2)
        (envelope-from <ftoth@exalondelft.nl>)
        id 1mJKZh-009E4p-KA; Thu, 26 Aug 2021 20:58:03 +0200
From:   Ferry Toth <ftoth@exalondelft.nl>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ferry Toth <ftoth@exalondelft.nl>,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Pawel Laszczak <pawell@cadence.com>,
        Felipe Balbi <balbi@kernel.org>,
        Jack Pham <jackp@codeaurora.org>, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-doc@vger.kernel.org
Cc:     Lorenzo Colitti <lorenzo@google.com>,
        Wesley Cheng <wcheng@codeaurora.org>, robh+dt@kernel.org,
        agross@kernel.org, bjorn.andersson@linaro.org,
        frowand.list@gmail.com, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, heikki.krogerus@linux.intel.com,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Pavel Hofman <pavel.hofman@ivitera.com>
Subject: [PATCH v2 0/3] Revert "usb: gadget: u_audio: add real feedback implementation"
Date:   Thu, 26 Aug 2021 20:57:36 +0200
Message-Id: <20210826185739.3868-1-ftoth@exalondelft.nl>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Antivirus-Scanner: Clean mail though you should still use an Antivirus
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Although there is a patch resolving this issue (see 
https://lore.kernel.org/linux-usb/1jilzsy8g7.fsf@starbuckisacylon.baylibre.com/T/#u)
it needs a little work and will not be ready for v5.14.0 release. Until then
revert the series.

v2:
- Added SoB (Balbi)


Ferry Toth (3):
  Revert "usb: gadget: u_audio: add real feedback implementation"
  Revert "usb: gadget: f_uac2: add adaptive sync support for capture"
  Revert "usb: gadget: f_uac2/u_audio: add feedback endpoint support"

 .../ABI/testing/configfs-usb-gadget-uac2      |   2 -
 Documentation/usb/gadget-testing.rst          |   2 -
 drivers/usb/gadget/function/f_uac2.c          | 144 +----------
 drivers/usb/gadget/function/u_audio.c         | 225 +-----------------
 drivers/usb/gadget/function/u_audio.h         |  12 -
 drivers/usb/gadget/function/u_uac2.h          |   4 -
 6 files changed, 6 insertions(+), 383 deletions(-)

-- 
2.30.2

