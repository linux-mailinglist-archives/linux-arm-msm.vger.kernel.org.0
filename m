Return-Path: <linux-arm-msm+bounces-86317-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 625D1CD8DDB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 11:40:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9214030778DD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 10:36:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2615C34EEFB;
	Tue, 23 Dec 2025 10:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CYPsozok";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h+fJnt4v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFA6334DB7B
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 10:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766484311; cv=none; b=r2Gm61Bvrjbvy29r5jTdDbW+bI3y1daiSCFgakp8ahWNXUyJWX3iPpmdxXtsGuLI/idprK3a2JmUoRNMhgaQjTf9uVHWUX3UKmuUBaBuInkHJZHvdoY5JBYYo3Z7d+U4MJRuqZGgyrPkIo8H5ImLcgdbHwJEWOcik5nrbs75pQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766484311; c=relaxed/simple;
	bh=nf5oJf3O9aPMhO8Ad3i1lt+LuRiSuT6c7NtPghEnn7A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mn9ULkKz7DtuhrH5WerKk5E7w6YQGPQKn40phQeIW8IEM95ikiD9HUK7ahKZ0mQ+Ik6mdxUPBaAbHqPV48TMSGaQ38Uvu/UTNdpIIMXel0uniA0tTvOdT2J9v/6KAuQtRJNog4AOSg7p21POxJYq9bueO4rws3cRsD3q/Wv0T+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CYPsozok; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h+fJnt4v; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN9bgt62041230
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 10:05:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zoQy+fdvtf/HqhhS47O1zByPYj8iqB0bW0jZ0bVe61k=; b=CYPsozokpGPmQJ0L
	/aQS9fjYK9EIHelqTgwlX1va4a/az7er30jowGpk0BLmKujXEtSSbLR3+GLrEosy
	Qc/fk6IXN0QOBy53r8b1OPbFTglsHmdDIvcxWY/n921QHZ3vx7U838WTM1JyyRGe
	aBiJiAIJ4VGb2m1OKdkAeOl3gd54owOqb0I0e1zImVxaC4zirfW3+XEBASirQ36Q
	/v6SNJYGpMUjDa3vtsaXn9lOGz0/T6q5hHspXJdtq0HgKLf/cjSPtxJHufQr+iID
	kMC7/N+ZbedAAVw+pPATFVmif9RLDLV6HQs69kvd/nlhd4AQPqtE0L01CXF5AvQP
	JAvUQQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b763pkb69-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 10:05:06 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4f1d26abbd8so130874961cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 02:05:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766484306; x=1767089106; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zoQy+fdvtf/HqhhS47O1zByPYj8iqB0bW0jZ0bVe61k=;
        b=h+fJnt4vYfJOOS1Yt0gYz7e6U4cWyW/yBOp//4bZdrlpLhZv/0mjbRYZKhNJZlC6qO
         lWMUNQyvXvsGpKMEUCZ2kf5owWgnqFYSXB75+mHSDY/aTq3iXtMEDnEqUJI85W1aBftP
         WXssgc4Up+1zUD0QZOU+dyUOwvuvlcRJ5nRPqvDVUSDxO/sek4faDKYfy3lt0xyuABod
         ePX4yUgVpbjC8hzkCd9X6qHQ+RdDC8MyDPGXqjf3gkiT/5yOoa+FqKe3Z71sm+ocJAOO
         aY7UE8qmJB+QbSsSsginh2DFqzuewcOuoZ6hZ6zt3Do9dik3vcC3zTtpVChR6PrkU/PU
         GTMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766484306; x=1767089106;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zoQy+fdvtf/HqhhS47O1zByPYj8iqB0bW0jZ0bVe61k=;
        b=q6vBJi2FoqFmUajJK6JLwGrhKasiZ/BojYJdktj0E5ms+vMLXHXh02lgl404rX6eYA
         Wd9J1hcVGJXXdmY86q12IunU0Pw4WasqdWuNRgFymyNE3qDYt3RrGktitTL2/g7BL/on
         Uq7BXO0t8FhuQ9i7O63JD/APd9ukxguYWhsnesjTJk4fVBm1b448z7HmtZwloucUlLhw
         8TKy99N5wariJ9oVqrjX3+LCCZbTgdDeZrpYz8sDhAkg3U49tkWNWD7kE+LL2b6ApTUj
         ica9WfYcv3NU4i78Pc+52rp0QWkUOCBzOgjxn3At49iPF4YEnIyxVDYvVlQ224bizbXE
         AMSA==
X-Forwarded-Encrypted: i=1; AJvYcCUWq5sdC7hxqtJRmHBHNj4YVk2sv8Ps+lcnrvL/TE87eEVpIm5VGGoSnqOJfxIoAKP4eAss+uKzqxHlKs1+@vger.kernel.org
X-Gm-Message-State: AOJu0YxMX+VPOOjdUh9Hp7G9rrpJaxd66cZkxv/gShjl8SeCsf7zbh0g
	218lMA6M738VzAhuW1EKFNoxiuJAgVB1AVSLUQ/ALoB9mnRoIML88GmB1Jy0JijE9L0rmDFrh95
	7iyylc+uVz17u2iX7Etj7woD6ihlroX/9gwOCm3V+qSuyYrzrW/GMfTuWqhoWtNPoodLk
X-Gm-Gg: AY/fxX7e/JTejVMLHUBO8X1FPrYlkAFYAS87rJ+8jFDDfz0uqY3dgoPEusSt/jUUqZP
	FzNvcE9bbTeqoDYBsl5kWbAmHm7SMfywd5pKYXurZBT/uDJBBtxDQPLDB3WyrsmhoaKy3L2imof
	BJVH4s5c1qxE/LG9su9tRK2SHQOe75AwW+bf/PMh0ujci27Yhs4hQOa8QEO4e2Bzy4oq1h69wcK
	GxS6EhaaSmqccpqVlaRRu1WmjYWopEr9m7ms9ysdeien/JaAHrZnB4N15xXswr9HqcItId1TxqQ
	vL5fdJnuWxzSK0DycYehXIFdeRDaD7/AvmfXgaPwlm1NQs/VrsIKm9nmIX6vwTsBHhjoG6QS8NE
	wR4ZXCD4RYFEb4VKmIKkmZcgY0EdD0woksAaaN3g=
X-Received: by 2002:a05:622a:180e:b0:4ee:268f:baa2 with SMTP id d75a77b69052e-4f4abd01701mr216109681cf.27.1766484306194;
        Tue, 23 Dec 2025 02:05:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGYSreD7Y+9GMIiyDmnU8M0Z0VrGwNbAb3A+4vjzlYqPF8ialPbc18WsA6KQA14vybQlLSi5Q==
X-Received: by 2002:a05:622a:180e:b0:4ee:268f:baa2 with SMTP id d75a77b69052e-4f4abd01701mr216109221cf.27.1766484305734;
        Tue, 23 Dec 2025 02:05:05 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:190a:1976:65e2:c61])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d193d4f09sm235035025e9.12.2025.12.23.02.05.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 02:05:05 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 11:04:43 +0100
Subject: [PATCH 05/12] i2c: omap: set device parent and of_node through the
 adapter struct
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-i2c-adap-dev-config-v1-5-4829b1cf0834@oss.qualcomm.com>
References: <20251223-i2c-adap-dev-config-v1-0-4829b1cf0834@oss.qualcomm.com>
In-Reply-To: <20251223-i2c-adap-dev-config-v1-0-4829b1cf0834@oss.qualcomm.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Vignesh R <vigneshr@ti.com>, Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Andreas Kemnade <andreas@kemnade.info>,
        Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Linus Walleij <linusw@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
        linux-rpi-kernel@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1056;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=nf5oJf3O9aPMhO8Ad3i1lt+LuRiSuT6c7NtPghEnn7A=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpSmlA7HFYEcqnhzElUdoOdZ+7alBl6UxXjVygN
 v/t/qSpYA6JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUppQAAKCRAFnS7L/zaE
 wwf2EACFpsKQZzzmiZCLCkquEwqerhjh8hoJkP7q1sDxU70FDXE79o8YJoJ2soAlRU0+A81A3mQ
 hkMJEk8DbkFqKASaw5jf415hONmKR9bkn6sQIDcxVzVjeFuGrzbvKpm5t7tWQps8aS8yoinb3b1
 hm7g83C6NHjTOILFdzPzTtobZv+yzAeYgccd8PObZ5CiUBWM6XcSwJTDr4mTD9pFzXGfXBaFB8Y
 ZSb1vxzVPWLjVlX/EtyRKpughnvLg7NaMu6fkfYLHLPh5oJ+egpBlwFgJ4+GnbQK8wWevc/lA1/
 TrjkzqroV6IQAcgqg712YiLNOYUlZzj6c4J8uYyFkYpxbZ7S8nEb+34+gfKNYdzckwC1tsSgxMb
 gCEGesh8sRcoOg4XpUNn9dYDcW/NxbjB2G/0bb+zgzMjUj1w6CB1qtFPsybwK944L7HU6Bs6Iuk
 YtrfJb3eo+mhFeJzjZjiDOFj1R/3MSIfYXzSt7Y5XoeOrRwEdMu+rBIFj++KEWFyR+gHqVTdTvV
 qYy2SXXtmlHyuZC7qv2jxaMV7mcKNZqEhyQHozb0midmk4BlPCfUoYNi9sqHk7hnUZyuNhVDDt3
 kXwkFF5NCQN7UlW72CgJsVRsCjl/RytsZJLrVA/Ek4JAWgFLKV7PcHZ8sEYs8ORp0r6K+ml+CJe
 zQiWdDnKBY0L08g==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA4MCBTYWx0ZWRfXzKjpTeGIX1Pz
 /Y/tUF6s548AeQDC0bpHqOroNK2S2Rc7TDKE4anmZhSo1UvJzqWKfo7uhUnEU+jEDC3g5Gwoup/
 bxj0KALgf48CGsscruAeA/CmWeK9REHC8bkq/a0q0AmQCDkwvpqjkPxyQBSBnNUzjika1oLB0kT
 DWSckJHXdIIsz1s+UuBSVHnEARc2v9YY2AdKd+UJp+vXRJsivosBfemuJwFyW/Vo5fnPkvOyBqe
 bQiIz0s8iYcf+HyHmS8l6+TRvZ25O2ywLi3CI6g155pRYZah/XcQzVWDNWy3GuctmBeA4P75l7l
 GYw0KG8Si+ex7XazaHKuwBU9ROu6vvNR7J5YxybD2npwck83vHn/0PO0TBy0FlUb+rFMj3yRQbi
 MqMUOESXy66rj9KAbXoDUkXqNrME2UNVapuT9e6LUUlVUNQtuvvVeh0/CmV/4xC8ZnKDRCIS78d
 Di4Qp/8GJt2nXR2WbDg==
X-Proofpoint-ORIG-GUID: lG7ZnWugJCPqH08lN0pS7ysg6z9z67JB
X-Proofpoint-GUID: lG7ZnWugJCPqH08lN0pS7ysg6z9z67JB
X-Authority-Analysis: v=2.4 cv=H6TWAuYi c=1 sm=1 tr=0 ts=694a6952 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=H-w5s1-Ky7DYDkcl1QcA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512230080

Configure the parent device and the OF-node using dedicated fields in
struct i2c_adapter and avoid dereferencing the internal struct device.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-omap.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-omap.c b/drivers/i2c/busses/i2c-omap.c
index d9f590f0c384340dd31308bdf9ed0cb1a1a2ba8b..f95f31c521314e1d67f3d5b34bb44fcef557624f 100644
--- a/drivers/i2c/busses/i2c-omap.c
+++ b/drivers/i2c/busses/i2c-omap.c
@@ -1496,8 +1496,8 @@ omap_i2c_probe(struct platform_device *pdev)
 	strscpy(adap->name, "OMAP I2C adapter", sizeof(adap->name));
 	adap->algo = &omap_i2c_algo;
 	adap->quirks = &omap_i2c_quirks;
-	adap->dev.parent = &pdev->dev;
-	adap->dev.of_node = pdev->dev.of_node;
+	adap->parent = &pdev->dev;
+	adap->of_node = pdev->dev.of_node;
 	adap->bus_recovery_info = &omap_i2c_bus_recovery_info;
 
 	/* i2c device drivers may be active on return from add_adapter() */

-- 
2.47.3


