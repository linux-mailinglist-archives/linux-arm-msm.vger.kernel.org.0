Return-Path: <linux-arm-msm+bounces-197-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F4B7E5C7D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Nov 2023 18:35:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 132A5B20D38
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Nov 2023 17:35:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D87E321B9;
	Wed,  8 Nov 2023 17:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96F2B30338
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Nov 2023 17:35:31 +0000 (UTC)
X-Greylist: delayed 447 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 08 Nov 2023 09:35:30 PST
Received: from relay163.nicmail.ru (relay163.nicmail.ru [91.189.117.7])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CA3E1FC8;
	Wed,  8 Nov 2023 09:35:30 -0800 (PST)
Received: from [10.28.136.255] (port=50502 helo=[192.168.95.111])
	by relay.hosting.mail.nic.ru with esmtp (Exim 5.55)
	(envelope-from <kiryushin@ancud.ru>)
	id 1r0mLO-0006Tf-Br; Wed, 08 Nov 2023 20:27:59 +0300
Received: from [87.245.155.195] (account kiryushin@ancud.ru HELO [192.168.95.111])
	by incarp1105.mail.hosting.nic.ru (Exim 5.55)
	with id 1r0mLO-0000zR-1w;
	Wed, 08 Nov 2023 20:27:58 +0300
Message-ID: <feeb1a89-59bd-4fd6-81a5-1d828f95b0f0@ancud.ru>
Date: Wed, 8 Nov 2023 20:27:57 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Nikita Kiryushin <kiryushin@ancud.ru>
Subject: [PATCH] power: reset: msm: Process register_restart_handler() error
To: Andy Gross <agross@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Sebastian Reichel
 <sre@kernel.org>, Stephen Boyd <sboyd@codeaurora.org>,
 Pramod Gurav <pramod.gurav@smartplayin.com>,
 Guenter Roeck <linux@roeck-us.net>, linux-arm-msm@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 lvc-project@linuxtesting.org
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MS-Exchange-Organization-SCL: -1

If registering restart handler fails for msm-restart result is not checked.
It may be irrelevant now (as stated in comment to register_restart_handler,
the function currently always returns zero), but if the behavior changes
in the future, an error at registration of handler will be silently skipped.

Add return error code and print error message too debug log in case of
non-zero result of register_restart_handler.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: 18a702e0de98 ("power: reset: use restart_notifier mechanism for 
msm-poweroff")

Signed-off-by: Nikita Kiryushin <kiryushin@ancud.ru>
---
  drivers/power/reset/msm-poweroff.c | 7 ++++++-
  1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/power/reset/msm-poweroff.c 
b/drivers/power/reset/msm-poweroff.c
index b9a401bd280b..5877a1ba2778 100644
--- a/drivers/power/reset/msm-poweroff.c
+++ b/drivers/power/reset/msm-poweroff.c
@@ -35,11 +35,16 @@ static void do_msm_poweroff(void)
   static int msm_restart_probe(struct platform_device *pdev)
  {
+	int ret = -EINVAL;
  	msm_ps_hold = devm_platform_ioremap_resource(pdev, 0);
  	if (IS_ERR(msm_ps_hold))
  		return PTR_ERR(msm_ps_hold);
  -	register_restart_handler(&restart_nb);
+	ret = register_restart_handler(&restart_nb);
+	if (ret) {
+		dev_err(&pdev->dev, "unable to register restart handler, %d\n", ret);
+		return ret;
+	}
   	pm_power_off = do_msm_poweroff;
  -- 2.34.1


