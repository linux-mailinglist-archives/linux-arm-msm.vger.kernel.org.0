Return-Path: <linux-arm-msm+bounces-80053-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 08A9DC29FDF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 03 Nov 2025 04:48:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DED713A844F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Nov 2025 03:48:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A23C27FB12;
	Mon,  3 Nov 2025 03:48:08 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from cstnet.cn (smtp84.cstnet.cn [159.226.251.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6144EEA8;
	Mon,  3 Nov 2025 03:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762141688; cv=none; b=SKQcXF4WZnDqSVqIccZiBwqUa2vEe6FZ3+/3NB4ah0klZd2as9PCAkQ1vZfMUDSjrbRqdYbsBRo9jpcThG8RLHlumFBWeIfQtC+51GCM7R5yu+dQ4ize8hoJQs0EjiEj6fzibubTGInwjomISBy66QtLdDg0e938soIZ71ZeAww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762141688; c=relaxed/simple;
	bh=M75ey4SC1nq26YdA3zMPnasTfomPxSxVwmgJl3E+jAw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XZmzccWodxueLjpTRW6DZ05KArnAwhrHy7P3Mb0jI6RzpbW/vSZq/qlztZN8wMluivP+/4BWg2FMLK9w6UBVRuh6w3AHsUzHYyjIk+mhsbJprXUwWIZYk2WOxkhpX90G0yipuNTrpdlUGFDVrZA4sYhWVJaVnX2lPFeww0odjpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from DESKTOP-L0HPE2S (unknown [124.16.141.245])
	by APP-05 (Coremail) with SMTP id zQCowAB34vDnJQhplpMqAQ--.21872S2;
	Mon, 03 Nov 2025 11:47:53 +0800 (CST)
From: Haotian Zhang <vulab@iscas.ac.cn>
To: srini@kernel.org,
	broonie@kernel.org
Cc: lgirdwood@gmail.com,
	jaroslav.kysela@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Haotian Zhang <vulab@iscas.ac.cn>
Subject: [PATCH] soundoc: qcom: va-macro: fix resource leak in va_macro_remove()
Date: Mon,  3 Nov 2025 11:47:35 +0800
Message-ID: <20251103034735.90-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1.windows.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowAB34vDnJQhplpMqAQ--.21872S2
X-Coremail-Antispam: 1UD129KBjvdXoWrKr47KF1rXrWrGF4fXFWDurg_yoWDuwb_C3
	95Wr48ZFy8Wry2g3yUtr4UAanIvrnxArW5GFs7t3yxGryUtF13XrsrCrn8ur1UWwsak3W5
	WF1DWrW8Jry3ZjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbsxFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r106r15McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v26r1q
	6r43MxkIecxEwVAFwVW8GwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8Jw
	C20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAF
	wI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjx
	v20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2
	jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0x
	ZFpf9x0JU3CzNUUUUU=
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBg0PA2kIGm8wxwAAsk

The va_macro_probe() function calls clk_hw_get_clk() to obtain the
fsgen clock, which increments the clock's reference count. However,
the corresponding va_macro_remove() function does not call clk_put()
to release this reference, resulting in a resource leak.

Add clk_put() call in va_macro_remove() to properly release the fsgen
clock reference.

Fixes: 908e6b1df26e ("ASoC: codecs: lpass-va-macro: Add support to VA Macro")
Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
---
 sound/soc/codecs/lpass-va-macro.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-va-macro.c
index a49551f3fb29..440d0f54aa33 100644
--- a/sound/soc/codecs/lpass-va-macro.c
+++ b/sound/soc/codecs/lpass-va-macro.c
@@ -1663,6 +1663,7 @@ static void va_macro_remove(struct platform_device *pdev)
 {
 	struct va_macro *va = dev_get_drvdata(&pdev->dev);
 
+	clk_put(va->fsgen);
 	if (va->has_npl_clk)
 		clk_disable_unprepare(va->npl);
 
-- 
2.50.1.windows.1


