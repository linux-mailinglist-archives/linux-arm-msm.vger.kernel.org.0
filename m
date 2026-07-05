Return-Path: <linux-arm-msm+bounces-116582-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id h6w4O0uzSmpTGQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116582-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Jul 2026 21:40:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 86A9870B072
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Jul 2026 21:40:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=FtgGyEI1;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=C7qviGmi;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116582-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116582-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A2BE030098AC
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Jul 2026 19:40:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0C5B3A59A3;
	Sun,  5 Jul 2026 19:40:56 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72A903A2544
	for <linux-arm-msm@vger.kernel.org>; Sun,  5 Jul 2026 19:40:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783280456; cv=none; b=JNqnvio6kWIG9qXKJmwVhtc0WN0G6RUgAnzZAnWdm4P9CVV2MBrXhF1EDPTLN3wL7EZCPAD1YdRm08A1hTQBZylbIVtGKfCKI3U6z7vSdyIG+/++eo97oQBeg/14U+bfYYEUcSPQMdotPkrhormOGzZTpflY44fNR1G9ELFXtFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783280456; c=relaxed/simple;
	bh=MBCzqv0j+WYMFcF4TKWqHla8911PrHE8zUSaVvk5eeg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RChDB/t1Km0cVZoq4U0SclZ7NTrKnvMZtyGMg1Zo1nFbA1X7d5JMgGpfT7L3ZzcjMetDjEHYAPZzwG0JWy6WsmUh6Vu5mZ334xL8Bk4YRvN3tIXMy/+yzH+f0MoSTXKEJoo3+cOw0RdPoDdW792HMEwJZKPyAM+dMQQZdoJUXzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FtgGyEI1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C7qviGmi; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 665HiFeK2315313
	for <linux-arm-msm@vger.kernel.org>; Sun, 5 Jul 2026 19:40:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=hN6fEXJ0a4t
	H3MRwTjmjwBZxQ0G8Nv14FZEH67BaPoE=; b=FtgGyEI14vKK9OqT430xUfOmGLF
	J5bdRwGnYlPPVp42isHulDlrVXRumzlXOnWaKAvEqFlOMf4WK0t/UVb0tPS4H/wS
	PtxzMba7S17DNMo9ExtOcv+rJsW93dNgj/CIpMpvyCzFyneGj05+u1GK8iECoqyK
	WM1mPqrqXajrrVrH8/J9pdvK2VoDaXNIt2t74egeo5x9BAqNhYqqiB5QdwrFv+QG
	jv/TZ5nh6enGJUvvqqxYx00YdVL+37mb/7PnZAc+8iS+maLp8PJIHST5NiO92D5M
	ugD1/b8iFPnLJM/Dv5JgaqSUO0Jj7Rg0n1nlkl2C0BeSOL69BMELnoL/dgw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6t8uk9t3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 05 Jul 2026 19:40:53 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c88aab7c1fcso3610372a12.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Jul 2026 12:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783280452; x=1783885252; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hN6fEXJ0a4tH3MRwTjmjwBZxQ0G8Nv14FZEH67BaPoE=;
        b=C7qviGmiEltSC4Cgo/wTu4JmZRlyDLu6fX3iQA53mNc9iDjmghT1N8l21Vjd3W3d0d
         u3qKBwuJlUN4iJrZaWa24RZmiqC67NkuYHYAJowwe1e7cNhoWPS8/4L86bkfm68mliYV
         N1JEtlvE1fnzHaWo1S86ulQOjbXbO54N9ELppItNjUiIXP1ES1nNhAOsETmzGjAY5OOZ
         /sfd4yLYcFZ6SwDT7H3gXits+7AHqpYNRSEBCTXDGBmHoDxKSsR5+paPPENNl1jt/y3n
         ne1cG9aAnDIu2Nl/xPH6S2xnjZSkb5t8Zeb7hhxVk5DZiz4FdgrdP3yps8brPftifkT/
         ConQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783280452; x=1783885252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hN6fEXJ0a4tH3MRwTjmjwBZxQ0G8Nv14FZEH67BaPoE=;
        b=fXN+PAovN4Et5W+5V+7K5E1W7Vzcgf/DMdtTHZPF/xqtGfYYcWCj1zAJJUImuZU3sk
         84my5OsfwNN7P8ZyV34IstSmcJIAGt4q90lnOMTMOzM9aG1LUaVLnvvPi3HW5HdByfWL
         nJHDS1xpg1Wkum1u55Q25cuBEqCgnEyAInL4os7q+s8MS8W6YMEXsLxuq2AQdiQM77zQ
         y9IRmyF6Ek8Wnu3NugYgXlXNzq4poup+d3Ctr4MuKnkXgRHw2WG8RYvVFDzrIJcOuouk
         2H+mzUjqeumFXySgZvOoo+UmdpaH6/KprIlK8OibEGfiJXQ07pIFoKhy72e0vGPr6KfG
         9Teg==
X-Forwarded-Encrypted: i=1; AHgh+Ro5orEi02kxS/vAz3HhCcBF7ci+QNpLBGM21RonU/VfpD4BaadW7j4whzGyBdbQY1nXAFD9rZ+/Y67zUU3U@vger.kernel.org
X-Gm-Message-State: AOJu0YwN96KdTe5lV1t98OxUS3DDTIkSxDViZc/KS/G33L8OpZp+bZTc
	RedMbnuFWLDdnuvzc13kL8ZAmOEBuixGuRTW38eYzZsgIIZs3YtmpNKbWrdylk7dfiF2pzzL1YI
	pZmwFf2AxyqdDjCEIIwlffO7FBApFwlHmX5I+0tZoigQ2TbK/rJd7lbavfhjZ9RPci/qx7JjOHE
	Jy
X-Gm-Gg: AfdE7cnNxnQkyBqOkGagKDtBvaNjCsAPVnT0bTfqpS6IhnYqoSZF6zOC5r3hFB0lqge
	SNiWZLjTDjGPX1IRkSq5tARVBjdquHcv7qWcV05LZ5XX+XND8ls+YqkGy+ccRfG+SRV8NrFQCqO
	cODBrrxwehn4HVRQQ0e5BEz1gbGcsNoc3IjlfZR37tNu5i37aCG+LzBgrBtuNnQNQXHMHQq2Lg9
	23IWXDroXVS4rYDzW3Mq07LfLW8xuJSG38rYKq+nnih691iPOBRXEZbEHrN4gDW3oTPB6CaWpp0
	GQiaUreS0C1IQo3KDp1hMXh5I5Gm55twlZC9NVfe5OHAvRh0v4zRQwmu156mFsMXoy76HrD1FlU
	AksL+OSRbCLrc/wNyO7n1H4OCeeg18eUWvW74hA==
X-Received: by 2002:a05:6300:670a:b0:3b4:9171:2573 with SMTP id adf61e73a8af0-3c03e4218c2mr7386831637.37.1783280452364;
        Sun, 05 Jul 2026 12:40:52 -0700 (PDT)
X-Received: by 2002:a05:6300:670a:b0:3b4:9171:2573 with SMTP id adf61e73a8af0-3c03e4218c2mr7386810637.37.1783280451853;
        Sun, 05 Jul 2026 12:40:51 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7fa566sm40573417c88.4.2026.07.05.12.40.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 12:40:51 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-mmc@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-sunxi@lists.linux.dev,
        linux-tegra@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        openbmc@lists.ozlabs.org, sound-open-firmware@alsa-project.org
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 36/42] ASoC: mediatek: mt8188: Use devm_of_reserved_mem_device_init()
Date: Mon,  6 Jul 2026 01:10:12 +0530
Message-ID: <20260705194019.2565498-4-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
References: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: gDGgt1JghGiIrF9ksOwsnInUW480bJUy
X-Proofpoint-GUID: gDGgt1JghGiIrF9ksOwsnInUW480bJUy
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfX9c09QSHTANid
 FmWJl9a9C/tyFxbTKzyS9h3dCImSv0+FpyUsp9NheGgKKP2yabsZFsjUcnK2HAWCCM0FmumDlZF
 ATBtqHX+rsRQ3znOFYbIeLY/O3DY6iw=
X-Authority-Analysis: v=2.4 cv=MZxcfZ/f c=1 sm=1 tr=0 ts=6a4ab345 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=16fIdGUa3qEwhQSg-dQA:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfXzYv+neh1tI1o
 /DclEgl85P8dzWTeT/YrTGolMioLHS7Ry7tbRb/3YmPj5m7dUx1FxIicQodXxfrJV44yJ7ewPkk
 vuQoTGNitVXgmYzgn0ziz5xtrsSjJiL/0jIJL1Giea6EYBYNwiSUxQ9nodJz+OYFVKtS4dcEaEh
 f11aEKhNun/D4+jgqmnro4Lq7E85ZFx/A0XLkuUDKDxaHxlHpv94HnFIlb5FUDf4aOVS42LRPTe
 x8Fxbfl3J3anCcHfCrjFQ6+kj3yZsp88jtj0260L4HWYlf04pf+h7eQuli/RBMn64iXOUe+HwFA
 LQ1xsbl2LyoC59gI8jrhU0bGFcz7u5Vnydjp9AE3X7jj09x5QN52+CpOxZ5grRj3aiO+EZQgxkZ
 8PHA3ffxsR9VwnqVu/aNpCgdn6h89n3tD8Hhxwkk7LPHCEDjWPoa7lqWiw7uWw04TlaM3yqAq7o
 76jwe/y2eHPGRUvn8KQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607050212
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	TAGGED_FROM(0.00)[bounces-116582-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:devicetree@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:linux-aspeed@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-mediatek@lists.infradead.org,m:linux-mmc@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:linux-sound@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-sunxi@lists.linux.dev,m:linux-tegra@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:openbmc@lists.ozlabs.org,m:sound-open-firmware@alsa-project.org,m:konradybcio@kernel.org,m:mukesh.ojha@oss.qualcomm.com,s:lists@lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 86A9870B072

Use the devres-managed devm_of_reserved_mem_device_init() to ensure
the reserved memory region is released on device removal, fixing a
missing cleanup in the original code.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 sound/soc/mediatek/mt8188/mt8188-afe-pcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c b/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
index 7b1f5d05f4d6..ab4ce5e86b9d 100644
--- a/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
+++ b/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
@@ -3199,7 +3199,7 @@ static int mt8188_afe_pcm_dev_probe(struct platform_device *pdev)
 	struct regmap *infra_ao;
 	int i, irq_id, ret;
 
-	ret = of_reserved_mem_device_init(dev);
+	ret = devm_of_reserved_mem_device_init(dev);
 	if (ret)
 		dev_dbg(dev, "failed to assign memory region: %d\n", ret);
 
-- 
2.53.0


