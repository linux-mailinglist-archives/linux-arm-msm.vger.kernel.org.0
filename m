Return-Path: <linux-arm-msm+bounces-12605-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C5C6D867F95
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Feb 2024 19:10:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 626471F23EBF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Feb 2024 18:10:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B0DC12EBE9;
	Mon, 26 Feb 2024 18:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="U9uBdYs0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A92D912DDAB;
	Mon, 26 Feb 2024 18:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708971047; cv=none; b=Tg8gIvfLLeY7iP9AZ7lA4DVSJgy/RR/j9WH6EuZ1rnJAhp4u0A2GKMnfv513PBlQn9R+jHPP6vuvBNpJtXaqqarD1l+m2pR9YnvBO0ZzKxRsFVHjI6UpXXarjzZTh6QecFvgoeOgTkr7JHCzx7cp2PEgRjth+UYdkITrJMibotE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708971047; c=relaxed/simple;
	bh=hEcSAUnbz3n2LmN/VICAPNTSRgNLRrDuxbmA81pv+gc=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=NWO0z8GmO7zKYT7OmNPdaMJU5JoIJSbUu8QDBUIeZH78K9e2PHSmMSmuOOwzhb1ib9sORSPlhDDaD4SC3Lsr5uvNQ9pzmR11jUrrciMkGKUdH7N6KGnhfI6k3wSDAMvORLdV33m5s4Gb7FOE0hPIcm6e0ycvaOCBX4zBVsxOpf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=U9uBdYs0; arc=none smtp.client-ip=212.227.15.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
	t=1708971027; x=1709575827; i=markus.elfring@web.de;
	bh=hEcSAUnbz3n2LmN/VICAPNTSRgNLRrDuxbmA81pv+gc=;
	h=X-UI-Sender-Class:Date:To:Cc:From:Subject;
	b=U9uBdYs0pyb8l68xKrPVdFxo+9R6SFhdyVj0qGgcTg0RhLPhCBqMfZSsLbLwffgw
	 NPdhLA/7pVO1KvXo9RAX7V0plpEvhzl8NZtzvJq6zC66402lXz/n7pY2KnzhsQo6o
	 hfFvaSQ6sLF0/5WFni8w/0MY9prEcYE1cU/muPkig/kXZHucZ4sLIj/Dh4KYfWK/x
	 ISJJllgT1chX7prypVqI7rgiQYBMXWWmda5Mqpjy46R+VOV4gQ2XRbq+PT0iThxjn
	 98ilyJnjZRy+20E+/eumTWhwpyNPDUcz14poOLPqqwE4+OnaADIeCsDOk6H9aibz0
	 jaeZPr7P7+JstHgLDw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.86.95]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MdfCH-1r5bnP3TLF-00ZZmS; Mon, 26
 Feb 2024 19:10:26 +0100
Message-ID: <5a9e4cb8-824e-4f62-bfc0-ea4b89f27ebf@web.de>
Date: Mon, 26 Feb 2024 19:10:24 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, kernel-janitors@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Douglas Anderson <dianders@chromium.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Content-Language: en-GB
Cc: LKML <linux-kernel@vger.kernel.org>
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] drm/msm/a6xx: Improve error handling in a6xx_gmu_rpmh_init()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:/rqSBuUqEf/kYjvRFzsIYsjAmaIC0le+OIDvKdMIX+8WRAJdbvl
 8xwPiSyrSPo6Uq3TD7VkFy/4q1yq3KcxaapAQ8yTWrHKAUP7/6CW+W2I0E3NnApXUkdeTVy
 C37ffE9OObkJus66qXJuXQOSKy2Nlq1xqgpKUeMUh8cQDRpBgOzi1GIZaLtxqAksq/Uqad3
 0+Sfc8wsFIIZklRtaqINA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:FdpfUuTW3hE=;qT2la4ln01wFUxHSA5KyVXPa8uk
 bDSBGRNcQ4L4T1mJBcXVHoxB1VWh5FJclNOYqCZ57T5LREm+BsdB5UErNW5PWjINDxAqgt9yF
 bHZuDp4nsQy8IHTUBVBBwdS8BYlTaommVav7DoNWzuaWSLK3bgIZ/4husDam4OHkeWvh1yA2l
 jSw5gRDiub6AkaTER5SqzR0isjTloSOc1JotE33+qSkMsFInCaT9Pbb/XD7cxVEICd/m0TwP/
 toWrMP9BgtWS6gvJismpLsrafU1ALQmNQv9f+hKE/5/q7LOpaGBWLCgS2+gjJnTt/WIYStJDu
 zMxuKErCIZWdFpuuGwf19t3ToeccyXIhyzBTfrkG0m0A/PdnGzr0SZWJR3qEDc/FYTCTi5OLD
 Km8RMtHDAJHLmOm1ssV4oh4yyAaViUHQJ4w05J7DP0E8+Rm+5PO+RpW8mSm0Nj3gHFLE7qqad
 +13N4vRaAxpXuw0wRuIu1CmCKfNMmNvIlAtKUNv5bFuoOZ7lzzPfApVppqeV0Bf3RLctJHdZp
 kD+9awVAmnHyE8adXLKbTqidYs0fWhkOmmRoEK10UPQFD/ldum8P/e42Jc67LZ07uGTMwrkBW
 zyMHcsTGW2gxsLwEqyoBbmhi+CEcxANF7sny2jh5s/jAvLjPKe17oQ4qfxHBzHDRXgWegYqC4
 J/m05LSMWYWYAl5amEVilbMD+bkuLejUoY1r3bXQo2ronNaxaCNgAeI7u4rWyLr3XNXsirSV7
 pJvVq8B+XWt1x4uyljPbZpoopgtBEOKic+QlEushrvcR96JProjtUuobJsdeim0VFNYrkz/xs
 iif2Pl/N+X5WlPB1CpGE+VK9GdMf7PqPbLEWbiRJcBVaE=

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 26 Feb 2024 18:46:38 +0100

The label =E2=80=9Cerr=E2=80=9D was used as a target for two statements de=
spite of
the implementation detail that failure conditions could be handled better.

* Thus return directly after a call of the function =E2=80=9Ca6xx_gmu_get_=
mmio=E2=80=9D
  failed at the beginning.

* Reorder affected statements at the end.

* Adjust a jump target.

* Omit an extra pointer check which became unnecessary
  with this refactoring.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/a=
dreno/a6xx_gmu.c
index 8c4900444b2c..55a34f11eb9a 100644
=2D-- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -525,7 +525,7 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu *gmu)
 	bool pdc_in_aop =3D false;

 	if (IS_ERR(pdcptr))
-		goto err;
+		return;

 	if (adreno_is_a650(adreno_gpu) ||
 	    adreno_is_a660_family(adreno_gpu) ||
@@ -541,7 +541,7 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu *gmu)
 	if (!pdc_in_aop) {
 		seqptr =3D a6xx_gmu_get_mmio(pdev, "gmu_pdc_seq");
 		if (IS_ERR(seqptr))
-			goto err;
+			goto unmap_io_pdc;
 	}

 	/* Disable SDE clock gating */
@@ -634,11 +634,11 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu *gmu)

 	a6xx_rpmh_stop(gmu);

-err:
-	if (!IS_ERR_OR_NULL(pdcptr))
-		iounmap(pdcptr);
 	if (!IS_ERR_OR_NULL(seqptr))
 		iounmap(seqptr);
+
+unmap_io_pdc:
+	iounmap(pdcptr);
 }

 /*
=2D-
2.43.2


