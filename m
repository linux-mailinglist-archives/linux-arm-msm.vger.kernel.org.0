Return-Path: <linux-arm-msm+bounces-107741-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6KwDIZ/jBmoHowIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107741-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 11:13:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D666C54C256
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 11:13:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6D8AA3148335
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 08:54:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8FA3421EF1;
	Fri, 15 May 2026 08:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lBc+ap1Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MnS1FDcs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B4C3421899
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 08:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778835278; cv=none; b=E+uIpbamfHx2PvRqPZa0GkVzxPyB4QN514y4UYWDaOC/kHD4caDKsJ+aHsTPT5+AXJq75q482p/+0uEHfgNcb5wiJkZUJ4+oeSZ8WTaUhXwpyIny+YblCc0pdOb3dlgS1zaDRsqE4GH+msk+2ygGaSuQ1aCXwzN7Uv2owJ1OGW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778835278; c=relaxed/simple;
	bh=EmHp18u4sWuh3VJjtExeGDdQSa3J6QHzm8KmVvnKOoc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qVr4tATpb9AbTKS3vd/Khp8Qzze5gjP6VptROB5amXXp5WOHDSqrcsN9rhneBld/lMyBKuyhMU/VOuUY/AIYJFcfzi0Z9y32QXuLX1TRtp+XvZ1NYKhGD1yrZrOdLBayrHVqmbKBOgxFMM3Qs+SjChpRNrbPMGvk+4wDCXyznoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lBc+ap1Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MnS1FDcs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F4vbMr3513635
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 08:54:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0NEV7inRXKS1pCt2zIS2qrdunSGKxRX+eiFQ4mrU5hE=; b=lBc+ap1ZzYiOzMhS
	UA9vKBcfZi5kuafPPC1RQ6RvGgdMc0ytOOOIXWwnz2iB58TpIz770f7fafmEOBMH
	W3KFdS9xrhZ812hun2iTteTXF1+0K/cbi9ZcRXNHjMSb6czZ1JjcpsDNrVct24Y9
	LU5El1BY4AgwjwOs6WeylvaDfNYB/PvH7DckBHaAf7xPB5clJZWLV2BDd1ZIt1Xx
	i0zoR4/VOB+nPXjrcL32hfw2zoRUyTBp7aofyWSzSV+yDgJT4Z9VQ41JL5HXjCFY
	NbPwxAHIjLHJrq4JVY/oYXmdinu8uYQK80zBQ4ptzn+10EBQi4j6bPP2cHSFRxAQ
	dswTVQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1vag49-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 08:54:36 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8386367b23cso7031655b3a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 01:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778835275; x=1779440075; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0NEV7inRXKS1pCt2zIS2qrdunSGKxRX+eiFQ4mrU5hE=;
        b=MnS1FDcsfw6n+EWqwrL5Cm6iEj+Jo7m5aSCLB7fVHeE1gD9E0cszfAQ01ZW/lrEpi7
         me65qynT6yXQ+rmaHUQBoKi8hspjh1Nsp718NApXTL5p3OC9JgUl9PZh1Vhb9NBnH1pT
         I3WHOKsVaRzFSEr+9uNQnQKsPY3zDsYckyrw/ZaM2KJdQf7leBLRiZjcWIpcp+xQlzfN
         reDMrp0jnA3LK13ryDBSp5CTjXSrwyVBnwJbASHzURshsIaokjAN0NcBp0EGnx6OdhEc
         j/iTOecX30MVIyF3Foi9p1oYgaLXQ4LSprsVsxQFm/Q0mAQRzbJkGfDmW7QhXzevL023
         lGzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778835275; x=1779440075;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0NEV7inRXKS1pCt2zIS2qrdunSGKxRX+eiFQ4mrU5hE=;
        b=PGMrmC7iaXnhff19G+MqACQmbUn59XH7XPAfV0TklJApQapMYlr+5hjuQhh/fyWEfZ
         UxK4XzOXTTUlSuqYXlIxQrypm70Vw7FHENpq0LXEdSZ9/flx3Nv05z9v4jZa8CunWN31
         /F0Y5tF/qbEKi26PnmJhBfXQ/EY4gmTZcZa/zxK90eGAARVHw/QR9x59YUdOxZqLrQwj
         vM2N7kADtYyBXXm44ZRe7yUTMjLOZMO5U09XJ8qoL3t78IPwfLgUelLfcsDWJJ9cZcqe
         Py/EeGPgMUcQoui9v6mV+GMG52uFi1tSxPYAPya5mw67oerr5k0GEefhpOMp8DQd1Iw4
         VF3A==
X-Forwarded-Encrypted: i=1; AFNElJ/FBL0pZVv58rAPYWpvNgguNrUXUdsEUmiDygmqpgCH4sa55XKEkTRCfrqhifkCd9zL8Pzn4JpMkuUPlSlY@vger.kernel.org
X-Gm-Message-State: AOJu0YzQpdl+GfqMR3aujfTG2G8gC+gUJSnJdQJIQlF7k51UYiD0EM7F
	BupQnbY97nD/mcTyzqnxcqnC9wpHsJ8B6TMTCkWpRJb3VPFwGbHp4FSY9Rl+UKe/5TYc16MkyLQ
	BmURLbJ3NjXgPCxlKVwhL2SBjAD4lyoK9fmOnxl0a5Ww/9tY8nO/++PLmyasn6nJnpfEq
X-Gm-Gg: Acq92OGduFEls1onkT/obVXz517d1pJ2A25TwtE9cok1b2vNeATNXxiz8DNxjXxY1Sd
	Wl6RhLjumiOcAR1oRejQgAe9J8UFpCnpR/WpT6HzCNmq/aanIlB+OiCJPzcbre3bs+mJJdAq0KM
	WstNFSN2W0r9FJkwHCe0rIcJa6roGYNbDhkjAi+mWCxCX2jeqx5bz+C7MGAMg3mRjT1FF+MdgcY
	ks+jXRqty8ltfwJfiVdR8PrcWGCDr+4n5LdY69ZAQnfeXJSZPi+Gcd5MZ+CVAmJRELvkcgJ2tbi
	yP9vudyeS80QRzc5Nwly9eaVEEdAQxvHeSVW2SCe5/khEBbzPNT5Nl1WodrWZRH/goCaB+w8SLo
	ph+v3/iKvs+yq71KX5XWghtGDF/1b1yajEDSqZNJW
X-Received: by 2002:a05:6a00:4b0b:b0:83a:25bd:cf34 with SMTP id d2e1a72fcca58-83f33dcbefbmr3465898b3a.44.1778835275023;
        Fri, 15 May 2026 01:54:35 -0700 (PDT)
X-Received: by 2002:a05:6a00:4b0b:b0:83a:25bd:cf34 with SMTP id d2e1a72fcca58-83f33dcbefbmr3465848b3a.44.1778835274481;
        Fri, 15 May 2026 01:54:34 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19f7cc9asm6766426b3a.53.2026.05.15.01.54.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 01:54:33 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Fri, 15 May 2026 14:23:44 +0530
Subject: [PATCH 1/2] iio: adc: qcom-spmi-adc5-gen3: Share SDAM0 IRQ with
 ADC_TM auxiliary driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-gen3_adc_tm-v1-1-39ba29f9b4ab@oss.qualcomm.com>
References: <20260515-gen3_adc_tm-v1-0-39ba29f9b4ab@oss.qualcomm.com>
In-Reply-To: <20260515-gen3_adc_tm-v1-0-39ba29f9b4ab@oss.qualcomm.com>
To: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>,
        =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>, Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>
Cc: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-iio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        David Collins <david.collins@oss.qualcomm.com>,
        Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778835260; l=5616;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=EmHp18u4sWuh3VJjtExeGDdQSa3J6QHzm8KmVvnKOoc=;
 b=sza0BoNecudPPLVZo7qDpQcIV5f5QVXOp6J1S42DztHsnRIdBJXfJxU26H0NHZe2KgF/PMvwx
 +301lrEF013BXI2D671DeS5R0+YVXqCXTZCitJ1UqGearYJ2rlVfu17
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDA4OSBTYWx0ZWRfX8pxiNdJntl9t
 AL7AVvsDETtU+mtaWFjJGLD6QEJOAaovRs23STRB4XoLbvaNMBXsigF0ocKyrzJESwa0JKP8dy1
 Q8I255l+ADwTMjJqhMHiqlTbPcdippWle1NEHVEoMOLUYq3EoJZYe628nT6G6MxOG/qKa5NXcNy
 2wUt1da05sMSx+/TNI5hUmtvpxykjyOT5+rG0rVdbu3keRElMXwwOY13lKs57vYvMj4A0jiE9rl
 gpoKiOUOghuzlpu12rzXUrSWb5UEvPEHAWLx0Spj3V91G0ewwe/sFIvXaPUEroK9GKrem9F/Jex
 kcojO90IqNDklVu9r2x2Lu+H/2Bk+LqPA7dcQRGzLEkB6wbCzb8DMIqCvkOc7UaAaK/UQB+AjFb
 iodW3cA0/QgbuDbLF1xQMdtsB9FVUsLMUnZTsTK7JgGgU55GACpqpmztWFPLfEEusuHi7H5t+4P
 HHF/OSu0BXFZR5IZijw==
X-Proofpoint-GUID: dWoU5P7r7rbw679NQuqswy46KWbgHsqL
X-Proofpoint-ORIG-GUID: dWoU5P7r7rbw679NQuqswy46KWbgHsqL
X-Authority-Analysis: v=2.4 cv=BvqtB4X5 c=1 sm=1 tr=0 ts=6a06df4c cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=oPdqHcHP9CkV3rmwc38A:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 malwarescore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150089
X-Rspamd-Queue-Id: D666C54C256
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107741-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,analog.com,gmail.com,intel.com,arm.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jishnu.prakash@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

The SDAM0 IRQ can be triggered for both EOC (end of conversion) events for
immediate ADC reads done in this driver and for threshold violation events,
based on ADC_TM thresholds configured from the auxiliary ADC_TM driver on
TM channels on the first SDAM.

At present, this interrupt is handled only in the ISR in the main ADC driver.
When the ISR is triggered for an ADC_TM event, this driver notifies the ADC_TM
driver by calling a notifier callback exposed from it for this purpose.

To simplify the interrupt handling in both drivers, share the interrupt between
the drivers. With this, ADC_TM interrupts on SDAM0 will be handled directly in
the ADC_TM driver, so remove the notifier callback and all TM interrupt
handling in the main ADC ISR.

Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 drivers/iio/adc/qcom-spmi-adc5-gen3.c         | 52 +++++----------------------
 include/linux/iio/adc/qcom-adc5-gen3-common.h |  2 --
 2 files changed, 8 insertions(+), 46 deletions(-)

diff --git a/drivers/iio/adc/qcom-spmi-adc5-gen3.c b/drivers/iio/adc/qcom-spmi-adc5-gen3.c
index f8168a14b907..a819c3e627a0 100644
--- a/drivers/iio/adc/qcom-spmi-adc5-gen3.c
+++ b/drivers/iio/adc/qcom-spmi-adc5-gen3.c
@@ -56,9 +56,6 @@ struct adc5_channel_prop {
  *	requests from multiple clients.
  * @data: software configuration data.
  * @n_tm_channels: number of ADC channels used for TM measurements.
- * @handler: TM callback to be called for threshold violation interrupt
- *	on first SDAM.
- * @tm_aux: pointer to auxiliary TM device.
  */
 struct adc5_chip {
 	struct device *dev;
@@ -70,8 +67,6 @@ struct adc5_chip {
 	struct mutex lock;
 	const struct adc5_data *data;
 	unsigned int n_tm_channels;
-	void (*handler)(struct auxiliary_device *tm_aux);
-	struct auxiliary_device *tm_aux;
 };
 
 int adc5_gen3_read(struct adc5_device_data *adc, unsigned int sdam_index,
@@ -287,23 +282,21 @@ static irqreturn_t adc5_gen3_isr(int irq, void *dev_id)
 {
 	struct adc5_chip *adc = dev_id;
 	struct device *dev = adc->dev;
-	struct auxiliary_device *adev;
 	u8 status, eoc_status, val;
-	u8 tm_status[2];
 	int ret;
 
 	ret = adc5_gen3_read(&adc->dev_data, ADC5_GEN3_VADC_SDAM,
 			     ADC5_GEN3_STATUS1, &status, sizeof(status));
 	if (ret) {
 		dev_err(dev, "adc read status1 failed with %d\n", ret);
-		return IRQ_HANDLED;
+		return IRQ_NONE;
 	}
 
 	ret = adc5_gen3_read(&adc->dev_data, ADC5_GEN3_VADC_SDAM,
 			     ADC5_GEN3_EOC_STS, &eoc_status, sizeof(eoc_status));
 	if (ret) {
 		dev_err(dev, "adc read eoc status failed with %d\n", ret);
-		return IRQ_HANDLED;
+		return IRQ_NONE;
 	}
 
 	if (status & ADC5_GEN3_STATUS1_CONV_FAULT) {
@@ -316,30 +309,13 @@ static irqreturn_t adc5_gen3_isr(int irq, void *dev_id)
 		return IRQ_HANDLED;
 	}
 
-	/* CHAN0 is the preconfigured channel for immediate conversion */
-	if (eoc_status & ADC5_GEN3_EOC_CHAN_0)
-		complete(&adc->complete);
-
-	ret = adc5_gen3_read(&adc->dev_data, ADC5_GEN3_VADC_SDAM,
-			     ADC5_GEN3_TM_HIGH_STS, tm_status, sizeof(tm_status));
-	if (ret) {
-		dev_err(dev, "adc read TM status failed with %d\n", ret);
-		return IRQ_HANDLED;
-	}
-
-	dev_dbg(dev, "Interrupt status:%#x, EOC status:%#x, high:%#x, low:%#x\n",
-		status, eoc_status, tm_status[0], tm_status[1]);
-
-	if (tm_status[0] || tm_status[1]) {
-		adev = adc->tm_aux;
-		if (!adev || !adev->dev.driver) {
-			dev_err(dev, "adc_tm auxiliary device not initialized\n");
-			return IRQ_HANDLED;
-		}
+	dev_dbg(dev, "Interrupt status:%#x, EOC status:%#x\n", status, eoc_status);
 
-		adc->handler(adev);
-	}
+	/* CHAN0 is the preconfigured channel for immediate conversion */
+	if (!(eoc_status & ADC5_GEN3_EOC_CHAN_0))
+		return IRQ_NONE;
 
+	complete(&adc->complete);
 	return IRQ_HANDLED;
 }
 
@@ -684,8 +660,6 @@ static int adc5_gen3_add_aux_tm_device(struct adc5_chip *adc)
 	if (ret)
 		return ret;
 
-	adc->tm_aux = &aux_device->aux_dev;
-
 	return 0;
 }
 
@@ -741,16 +715,6 @@ int adc5_gen3_therm_code_to_temp(struct device *dev,
 }
 EXPORT_SYMBOL_NS_GPL(adc5_gen3_therm_code_to_temp, "QCOM_SPMI_ADC5_GEN3");
 
-void adc5_gen3_register_tm_event_notifier(struct device *dev,
-					  void (*handler)(struct auxiliary_device *))
-{
-	struct iio_dev *indio_dev = dev_get_drvdata(dev->parent);
-	struct adc5_chip *adc = iio_priv(indio_dev);
-
-	adc->handler = handler;
-}
-EXPORT_SYMBOL_NS_GPL(adc5_gen3_register_tm_event_notifier, "QCOM_SPMI_ADC5_GEN3");
-
 static int adc5_gen3_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -818,7 +782,7 @@ static int adc5_gen3_probe(struct platform_device *pdev)
 	}
 
 	ret = devm_request_irq(dev, adc->dev_data.base[ADC5_GEN3_VADC_SDAM].irq,
-			       adc5_gen3_isr, 0,
+			       adc5_gen3_isr, IRQF_ONESHOT | IRQF_SHARED,
 			       adc->dev_data.base[ADC5_GEN3_VADC_SDAM].irq_name,
 			       adc);
 	if (ret)
diff --git a/include/linux/iio/adc/qcom-adc5-gen3-common.h b/include/linux/iio/adc/qcom-adc5-gen3-common.h
index 6303eaa6640b..39cbfcbdb101 100644
--- a/include/linux/iio/adc/qcom-adc5-gen3-common.h
+++ b/include/linux/iio/adc/qcom-adc5-gen3-common.h
@@ -205,7 +205,5 @@ int adc5_gen3_get_scaled_reading(struct device *dev,
 int adc5_gen3_therm_code_to_temp(struct device *dev,
 				 struct adc5_channel_common_prop *common_props,
 				 u16 code, int *val);
-void adc5_gen3_register_tm_event_notifier(struct device *dev,
-					  void (*handler)(struct auxiliary_device *));
 
 #endif /* QCOM_ADC5_GEN3_COMMON_H */

-- 
2.43.0


