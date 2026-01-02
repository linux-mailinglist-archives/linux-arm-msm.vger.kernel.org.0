Return-Path: <linux-arm-msm+bounces-87244-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C9F27CEE9B2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 02 Jan 2026 14:00:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5F12F3051E87
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Jan 2026 12:57:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02972315D4C;
	Fri,  2 Jan 2026 12:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P0acStaR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d/cItmlU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BCA5314B6C
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 Jan 2026 12:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767358197; cv=none; b=JUyeNBYtL7rzRbpGcZfIWm7jm3pjN7/voeh1hzqVnTGHyiYmZdtGuoTazEmWhBEQiFLinjlvAc66R3x0duzkKk9noCvmRMVyoNZbzGgyA32kzIEjIxMw8PotTufRtB2PZE3puU2EDqhAEbAQ0vda0Trl+/TjLj257PbQWtu1EYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767358197; c=relaxed/simple;
	bh=kjdJYWdNUl5KclFKxYTWNNG5kkOEBU1fS578yV9TsrM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZXWAOUOIN5Cza41DI5PbR1eUMWJfbLqNsmXcM6FJIlgtnHRFNHlw3D5ZFwVuof643U+K+aVF9OJ5u2Uygqoa3Mt69u5FiaiW6x30SHNj2oCp6+woOfREaJ9CcNX5CxdIfSxIN/y9Ny6IogNszgwWcxM6V44C08JkipsWCZ3eIoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P0acStaR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d/cItmlU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6029VxdR637501
	for <linux-arm-msm@vger.kernel.org>; Fri, 2 Jan 2026 12:49:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=WIoOrmukDmi
	KVA+SLtYYAQlXdF3Ad90O6gPmYeW1uDs=; b=P0acStaRJ7offTKMW4swuRsqa5v
	ZmnITIUjAPuumQTpMPvIN7pVKaCRRkeJ0Jx8vRNJeaHzH7IRqNR8l1GmJwDaJC7Y
	xhrS5qCR9v/KiqVWPQWBveQ4EDPp7ahCh/qP0K6qO973AHHqTaaLIywV0Ha81nuT
	2pIes9rZkTFB4M6ptyplDwnt4I0AWkowQWDSbyRs81uduMQWUnrXXxA/2uEDJnRJ
	HAp9fznuw4m6LlYJpYbVD0wzj3fEJg86yuJSU9XZ18v2rHwZX/StJMa9xBGYsKdH
	/05eBNuxDWnO3h4FhQRUO74RrfPq0JLve6iyZyjLyjdmvrtuLAT22f24cRA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bd3v8utjw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 02 Jan 2026 12:49:51 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4f1d26abbd8so368216991cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Jan 2026 04:49:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767358191; x=1767962991; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WIoOrmukDmiKVA+SLtYYAQlXdF3Ad90O6gPmYeW1uDs=;
        b=d/cItmlUdIheeyO3sRzkCG1YQoLkxrjEDJziDrQz5dnYpSnjSTQLH231kh+zZS1sUz
         TUqOuzT9Dx5SUGOLaVdtyB7AAZwsPCaPUYk9hNjCLK/FXYzOl04UsX3yQlkB//nBeKHY
         jioqPuu+xIoyIFYeJXTGK9Ajow959Hf0RYD6N0xrR3iA4gTfInG7AlXOpeQj8OEvJ6sh
         aawtKKhRRdwrl2fZt/GaoB5rdlgRBbM5qHmLR0OFWxKbmd29N5ATZyrATE25hUdnyZrO
         Qb44uMnsRO5L9zRgDTEI8kUt6Dsckf3Zy2VEcqfW5L2Jr6Nw9u2wRhYAR1J3R1D/olNs
         mmEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767358191; x=1767962991;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WIoOrmukDmiKVA+SLtYYAQlXdF3Ad90O6gPmYeW1uDs=;
        b=ecM+/Cx/658pOiL4V73ca45ytm2Xrc20ENVv6CJCf5WlnRmBM+yJwD9TaXcWQxZvyW
         lCNDFO7n2tYpIXLqeQ2nUQbkM/mBEqE7O7rPycoDhTtslcRogD6RFODplOxV2J33DpmF
         UxXhN/713V/5+3dAu2p/g9BZXMqlpa3l23TVhOn44q2vBZasVn0lsNRM2eqYEwJzyia8
         uM9CdP9O3mbfiF42wjc4+/gHh7oMY8ODaxNlU3RbMcAKo6GUkhlultdhoLlfaWFg57/W
         wVf8mGb08bu1zUzQBgjQIpB+JouyvcqkmJzUuq4UBQiACuhwdKJds/l8fPVRj3GuEsHR
         /VWQ==
X-Forwarded-Encrypted: i=1; AJvYcCVylCF4G1wwyzMoivWrekQmxyt5ZURF173FlKJoqKo9gopdD15c1vtoCbCshUieTATauXsqI3Aomzorxs1d@vger.kernel.org
X-Gm-Message-State: AOJu0YyTo88Wx3ktJslKf5YVX3KagHGujuRLwT0XJxlsvqDKxDecXut5
	7/93tE7WUPYqYufHUPiseHF2S5VTsHY5+hXlwE8kKDLNl6NendOdxALEVJu7ZcddDF64s/pguRQ
	o3h5b+uLIbuffiOBrqOP+UHTbjDALtbImhWwt8JwdvhA8tPCfZgL+h5rhW2m5eHRcRUJg
X-Gm-Gg: AY/fxX5c3ooPGageYQRGgYeckRK2OTcaNZp2Rye1ZkSYBZOVp0syxrURW+Gppqw2QCj
	Z4bYd2YTlI9zmv4nmIBpzZHmYQOhVMyPJ24guAKmnVaDep499omFl7H5XJLBD95FeTJ6MXCyWCL
	YDRGwATcadD/8Qeiktd8hSMd1BhSbHDr6C8pj8CRKpxvIAbMaXzdooTdI/VvTxBaJvhMv00E2OB
	3IQnn29SLfxLV77Ul5MKwG80FQVZA/C4xEbyIAS1suCLB0VssMLVcamxXEYrXgeWTxbbH1bpQ5E
	c7JMeEZsMcPk+QII7ldg6cc8P0T93lt1XSOR/4mKuXrq+b9/u1YVURqr+UX5tEtoiVxuBqtN7aa
	bXvdl4DhWWjUmb3eUtFoxMSrfuw==
X-Received: by 2002:a05:622a:1f13:b0:4ed:6b27:1d1a with SMTP id d75a77b69052e-4f4abd0ffa3mr640014421cf.32.1767358191452;
        Fri, 02 Jan 2026 04:49:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGVMf9IMN/4MmVFAXCQSAmHxzLFU2UpefBanTHFfjDtIyZNkbF7ek0j2v2fBFEvKipCrfTGQw==
X-Received: by 2002:a05:622a:1f13:b0:4ed:6b27:1d1a with SMTP id d75a77b69052e-4f4abd0ffa3mr640014111cf.32.1767358191071;
        Fri, 02 Jan 2026 04:49:51 -0800 (PST)
Received: from quoll ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea82f6asm86385833f8f.27.2026.01.02.04.49.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 04:49:50 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Brian Norris <computersforpeace@gmail.com>,
        Kamal Dasu <kamal.dasu@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Harvey Hunt <harveyhuntnexus@gmail.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Stefan Agner <stefan@agner.ch>,
        Tudor Ambarus <tudor.ambarus@linaro.org>,
        Pratyush Yadav <pratyush@kernel.org>,
        Michael Walle <mwalle@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>, linux-mtd@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, llvm@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 7/7] mtd: spi-nor: hisi-sfc: Simplify with scoped for each OF child loop
Date: Fri,  2 Jan 2026 13:49:34 +0100
Message-ID: <20260102124927.64703-14-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260102124927.64703-8-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260102124927.64703-8-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1136; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=kjdJYWdNUl5KclFKxYTWNNG5kkOEBU1fS578yV9TsrM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpV77dQjeohSg8lei73Gg0uadUyLqljkiLtt1C0
 wYhfaAnr8+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaVe+3QAKCRDBN2bmhouD
 1+DxEACTimO5Ql5LgejdoctH2lN8H00RIE66UE7YbHeS+LzxHc6Z16LUMwkdIJvE1wl+KRN3MqA
 QbTQYe8zyNyngNQSDxJvEx18VJNC4/a0Eu//latTs9k4tRA6HUFDr0J8fVOsA4UU4Ew6DKrIqxc
 QGKvtjOYT9lt4HQRuDXLJGnssl4HaFztnL8lta8xck2HQSIYWIHCZPud2H8XIopBinkAIC+YcMa
 2rp0lZTJH3bKmhtqizT+9+uIEF3CinYr56X9CmHTvLpAmz3tavz/QkB9CKwI5o4w0t9XsejOI52
 e59ATwz+4/DXiwrjXELzY0gbRfiIX41/cgTMzovDyT6OIls3IP6KcTKzioTeb1/f8GF3X5eZ2hP
 JzdeA3qQ4Wyivz/1UhUF2uRU2/dPoQiK+y5wJZNMcZ6UbpGQ/AJAVk36Fw6jWRYMzmEFlTDiIzg
 01D5L2ZAtnYOuIQ0wKhG/4Q5xAiPsOaUx6yHa/hlzkiwg7SSP5wv4l9L1PTEjNEDYaQUhLUK0Uv
 0lhn25rNmyZ8UapGaeRBQ8fGVXdvnDUbTtWBMbKbVlXxwLOlXu11MwIVoDygzNqtFZMGSv94Zcz
 BK+BonJcbetJNo8WckCosCezUHyStP+weL7Cdn5Pk43XRt7OmeNcO+cU0gogn+Ye+46YTLN/8Zt 0tVDSYxqgm6x2Ew==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAyMDExMyBTYWx0ZWRfX6LueYWyPOj7K
 C05MMlcgKOhnvfAITw7LWQXefbBBY17g51DY/q91Pq2Pvhkg/k9dNTfwKS3gafMR47DbRCC8SRU
 vogMia32JU7e0WQV9nLJSti6vvhvE7A23nNWl7bwuuOiwdT0YhMKgw8vsEq08v2m3novPQ+Vrkc
 TZ9sgoosytUH7J1sztjEC6UAd0haSAkOqCbaOWeLJBhfhO3LNravZ56u3eYcFiBf2sPqrmH1Da6
 m7o8tyqiDoc1tN9mcTtuSLZTy/iC39GrkBeZAVcfJkh7jSbde1gL/kbuqnXBkbJuV8zV5ZCJgqV
 zObkJ9IQa2zTCcMpmAYrhHQPGsUhw/WXmGilYqSL838TuU1Pmr3Kq7VkhRaG7+9RiW+dOd6pPM6
 dtfTkJBaBMVdPu7FCCItCZjdEq4q8JjTlWX9y0rszGvutI9+iQRZSv4igpB7DYB6eWUCtPunGyK
 3Z//ejH90bNXtY0Y87A==
X-Authority-Analysis: v=2.4 cv=JdOxbEKV c=1 sm=1 tr=0 ts=6957bef0 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=vTKw0S6QdLxGGRXgtZgA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: kWOhdrYr3P6YlI4QP0oXCPh61KClZinF
X-Proofpoint-ORIG-GUID: kWOhdrYr3P6YlI4QP0oXCPh61KClZinF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-02_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 phishscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601020113

Use scoped for-each loop when iterating over device nodes to make code a
bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/mtd/spi-nor/controllers/hisi-sfc.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/spi-nor/controllers/hisi-sfc.c b/drivers/mtd/spi-nor/controllers/hisi-sfc.c
index db948da2c4c5..54c49a8423a2 100644
--- a/drivers/mtd/spi-nor/controllers/hisi-sfc.c
+++ b/drivers/mtd/spi-nor/controllers/hisi-sfc.c
@@ -394,15 +394,12 @@ static void hisi_spi_nor_unregister_all(struct hifmc_host *host)
 static int hisi_spi_nor_register_all(struct hifmc_host *host)
 {
 	struct device *dev = host->dev;
-	struct device_node *np;
 	int ret;
 
-	for_each_available_child_of_node(dev->of_node, np) {
+	for_each_available_child_of_node_scoped(dev->of_node, np) {
 		ret = hisi_spi_nor_register(np, host);
-		if (ret) {
-			of_node_put(np);
+		if (ret)
 			goto fail;
-		}
 
 		if (host->num_chip == HIFMC_MAX_CHIP_NUM) {
 			dev_warn(dev, "Flash device number exceeds the maximum chipselect number\n");
-- 
2.51.0


