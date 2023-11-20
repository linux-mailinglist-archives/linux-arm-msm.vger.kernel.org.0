Return-Path: <linux-arm-msm+bounces-1205-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 165867F1902
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Nov 2023 17:45:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CA8A31F2524C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Nov 2023 16:45:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93AB61D52E;
	Mon, 20 Nov 2023 16:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay163.nicmail.ru (relay163.nicmail.ru [91.189.117.7])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD1E8D6F;
	Mon, 20 Nov 2023 08:45:40 -0800 (PST)
Received: from [10.28.138.152] (port=50740 helo=[192.168.95.111])
	by relay.hosting.mail.nic.ru with esmtp (Exim 5.55)
	(envelope-from <kiryushin@ancud.ru>)
	id 1r57Ox-0000kZ-BK; Mon, 20 Nov 2023 19:45:36 +0300
Received: from [87.245.155.195] (account kiryushin@ancud.ru HELO [192.168.95.111])
	by incarp1104.mail.hosting.nic.ru (Exim 5.55)
	with id 1r57Ox-002hz6-0z;
	Mon, 20 Nov 2023 19:45:35 +0300
Message-ID: <958b96ee-9224-4289-a3f6-b654d2b49f13@ancud.ru>
Date: Mon, 20 Nov 2023 19:45:34 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Nikita Kiryushin <kiryushin@ancud.ru>
Subject: [PATCH v2] power: reset: msm: Process register_restart_handler()
 error
To: Andy Gross <agross@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Sebastian Reichel
 <sre@kernel.org>, Stephen Boyd <sboyd@codeaurora.org>,
 Guenter Roeck <linux@roeck-us.net>, linux-arm-msm@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 lvc-project@linuxtesting.org
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MS-Exchange-Organization-SCL: -1

If registering restart handler fails for msm-restart result is not checked.
It may be irrelevant now (as stated in comment to register_restart_handler,
the function currently always returns zero), but if the behavior changes in
the future, an error at registration of handler will be silently skipped.

Add return error code and print error message too debug log in case of
non-zero result of register_restart_handler.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: 18a702e0de98 ("power: reset: use restart_notifier mechanism for 
msm-poweroff")

Signed-off-by: Nikita Kiryushin <kiryushin@ancud.ru>
---
v2: remove superfluous initialization, use specialized error handler for 
probes,
set poweroff handler regardless of restart handler registration failure
as Sebastian Reichel <sebastian.reichel@collabora.com> suggested.
  drivers/power/reset/msm-poweroff.c | 7 +++++--
  1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/power/reset/msm-poweroff.c 
b/drivers/power/reset/msm-poweroff.c
index d96d248a6e25..0d568805e70e 100644
--- a/drivers/power/reset/msm-poweroff.c
+++ b/drivers/power/reset/msm-poweroff.c
@@ -35,14 +35,17 @@ static void do_msm_poweroff(void)
   static int msm_restart_probe(struct platform_device *pdev)
  {
+	int ret;
  	msm_ps_hold = devm_platform_ioremap_resource(pdev, 0);
  	if (IS_ERR(msm_ps_hold))
  		return PTR_ERR(msm_ps_hold);
  -	register_restart_handler(&restart_nb);
-
  	pm_power_off = do_msm_poweroff;
  +	ret = register_restart_handler(&restart_nb);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "unable to register restart 
handler\n");
+
  	return 0;
  }
  -- 2.34.1


