Return-Path: <linux-arm-msm+bounces-38144-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 022679D06F5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Nov 2024 00:21:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 19304281794
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 Nov 2024 23:21:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CC991DDA37;
	Sun, 17 Nov 2024 23:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=spasswolf@web.de header.b="D07L0vhr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87FC4143748;
	Sun, 17 Nov 2024 23:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731885688; cv=none; b=GD5UAjy4ElVJW4IbwyjjG7CuXZlVnANEZXOhDKFkjMsv3mhAgqqXvkGslp3v6XTL4GmFj57IxyoxYgeOISnGIPALrWPgpHZGMsps+mw6C23Fn10sO498SwJ//s4FKpZWM6QNSsmhwXqGg38I8haGyZlFt6OxDGOCpO0qz0iFQS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731885688; c=relaxed/simple;
	bh=hceMuZltkxsAevxTMbzv8/My+gL6tf/ANKKWCqWpnL8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BzU2PI66aP782lpe9hVu3YxarwluGh2nKFXXOEa3zMtLi7uVfUjgP+u9thiPN2kfRorP35PjVOT2bgDhQz7RiSDsxwAS2Og7+8Vr3RuYgW4f8BHdZkVc1jD1kuFFBeh42+zcsYdZDSAytxmOKJ6EeUUKjnP1GgfvfnzdkOr7Zio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=spasswolf@web.de header.b=D07L0vhr; arc=none smtp.client-ip=212.227.15.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1731885665; x=1732490465; i=spasswolf@web.de;
	bh=VNf5yKUCwlfHJbMu6/6RZkTHJt28mgqFMR3tYkD17F8=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=D07L0vhrmsLmPOQ5EGPBJGXnT8trcmzm8oa7fsD7p9TEihNDuH7NpTFuiIXpg1LU
	 vA9719otd4NYcHQqTm4dP1cmOKScgVqShuXUpBEdxGi+Oocd+0GgxcvxBg2+wQrWo
	 DMSv4eD6aKPctAekuPA+x/zLUvznxoOgRlMiOtpyRYn8F09h9VfxHKISY8zrTJfVL
	 s8jCK7Rxgp6vtMNw9YpxeDPsfpy6+u/ixpBDyMs5xqSJ4Y59uQ1CL7btEGVMdaUgc
	 kjCMWjoZ3NgaGZpY9K9pwozArSZ62OD2uhyocVMr6jM0OR1DwHFUHt6ZwnOijv3XF
	 B2uvhLCYbEpdhZa+jw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from localhost.localdomain ([84.119.92.193]) by smtp.web.de
 (mrweb006 [213.165.67.108]) with ESMTPSA (Nemesis) id
 1MNOVK-1tNAQl0rMo-00JEYf; Mon, 18 Nov 2024 00:21:05 +0100
From: Bert Karwatzki <spasswolf@web.de>
To: Stephan Gerhold <stephan@gerhold.net>
Cc: Bert Karwatzki <spasswolf@web.de>,
	Mark Brown <broonie@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: qcom: apq8016_sbc: Fix second argument of apq8016_dai_init()
Date: Mon, 18 Nov 2024 00:20:58 +0100
Message-ID: <20241117232100.23760-1-spasswolf@web.de>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:FoOB3vKq1UKw6Wxtf3ryOzCsih3jKzk7i9YjxLeRn4jsAIQ5zb6
 t1qrmVLjY+TvsjPmubDxFlYPPEgLufBvihYtecYVx163eFAe7xKVwD75wp37VPShR6IhXJd
 tuFVI4D/p2lVfvdtKXyyIo/vk38SpfZgPMgAC8YuaTGDnuGjGEFdqBmsKC5UU6nkHd6xQar
 6JW/1Ul1s6Fe6GQV0KpIw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:TiSWYEaojQE=;8sEHgFuD/vy8M71Qffrgfz4/crb
 qIqXcYNBg1xiw5yDhXWTPh7SQCUuVfOAquTL/X8bZ8QjY/kwQ0xkbZgWKYnZ4tSZUknx2a8k+
 OKXL04WrjPUAyuJ3kAsEKWnJZxZKXcPuROdXR822pK5DAbeploYKT/exJSx1ha8zSNvEcHR6g
 Ekc41J18JKRt701vi9k6OHPU3Lagb1uuZQvaJCrOmP/yzClMLBNs43uRVODHq3IqxCKWDVT+M
 xf1vBQtJIJs3OfLa8j3NPvfqKdsJgMzSFUTWN7jD1jQOyawLEHuPifw1yJuTdXZadsDCLkNMu
 /uDpLbIdXBfH/azxx6Z8tr3DJF1yOLsXuzYO2ouNKw+cuqgCBu+FNqicr0wBLajVRUSAc++HN
 qTASbMr4UxYdX7bUVs6jdLmE7cB1myaQYJLnyySJy/5xM6YkgAcDMHZJaxshPyvcOaMlgPCR6
 OJ5VGJD9IA0Hg8T05C0Q9TC6g7397NtxnfNPNV4H7TK9QWk2vq9iaSJCJpbqySm6y2J9MdSNH
 0Iyou8YkAE0oY+5ZLAohe4QH++0Bv7CNS2BGqCzkrrPhPZvz7QgERr+xrCzaMK0oeA+DBmuwq
 q5ETktfDwhRw2951dZqhMes69qiV4FAdr0BYetjb/pUcC+2MmcUCj7eYnq8tKU0dyLzJ1CC4L
 INyVHMp2M8XYYG67ypXiDxw3tjxjtcuTE4+aeKKXVk0noTEbcbamLFRQLMAWLmtabiVq6xS8e
 1GmwcWsRzi20x1DURDRnBJi+fgrxNpeOYVvplnUgWowflhfil/2e78pyT8GmexlnnDK+q1zNW
 7BPLQXJP1pLgBgYnazwUN2Cf+IMQyikyVxeIXNs2sY3VaEiOjRP4MrBl0675HtNLjpA7imBa7
 iXtZQ57gGCEDhz7A7szW+J66CExhSKB2jBzXvG6vv+otF9QeB96/LJLeg

Since commit a78a42fb48b8 the second argument of apq8016_dai_init() has
to be an lpass id returned by qdsp6_dai_get_lpass_id().

Fixes: a78a42fb48b8 ("ASoC: qcom: apq8016_sbc: Allow routing audio through=
 QDSP6")

Signed-off-by: Bert Karwatzki <spasswolf@web.de>
=2D--
 sound/soc/qcom/apq8016_sbc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/qcom/apq8016_sbc.c b/sound/soc/qcom/apq8016_sbc.c
index 3023cf180a75..ddfcd4616895 100644
=2D-- a/sound/soc/qcom/apq8016_sbc.c
+++ b/sound/soc/qcom/apq8016_sbc.c
@@ -150,7 +150,7 @@ static int apq8016_sbc_dai_init(struct snd_soc_pcm_run=
time *rtd)
 {
 	struct snd_soc_dai *cpu_dai =3D snd_soc_rtd_to_cpu(rtd, 0);

-	return apq8016_dai_init(rtd, cpu_dai->id);
+	return apq8016_dai_init(rtd, qdsp6_dai_get_lpass_id(cpu_dai));
 }

 static void apq8016_sbc_add_ops(struct snd_soc_card *card)
=2D-
2.45.2

I came across this while I was trying to adapt this driver to another
sound card.

Bert Karwatzki

