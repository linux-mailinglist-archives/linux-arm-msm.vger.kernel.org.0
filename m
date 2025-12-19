Return-Path: <linux-arm-msm+bounces-85908-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D2B6CD04AD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 15:36:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 73AA3305C7C8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 14:36:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC90A33A019;
	Fri, 19 Dec 2025 14:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nWMnW2pp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LX+gLj94"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84AB13246F4
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 14:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766154962; cv=none; b=qmcJUwYwVGjUwuWOOaTp+PbVctAiv60d5svKJNUD7ySAOXsc+EW19vpwzv1xE3AUIslV86DnNLABKYvlpdno/cRK/a0+hIJ1eRAWtzdLTN/G3KLKAR6q+iFGfZbqCH7hdX/7H2TiKE2/DYdWWmGD07+MXOpO7OMhkUPdAmO+28Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766154962; c=relaxed/simple;
	bh=5iVrwaVGkX/lz9WN7/1Hu0jkjOFLzSRBWe82w60UkjU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ma+uj70C9WWBXW2I+R1Jso86U8PNi6Qeu0wx0V8cxctQHFdawoqy9iscaQ5aIKLKEyxuND2P3DBenICUfwBVsM1ykIwu+vW6hQISirBWaP8JZF5ZU+vLR4ql4DEwNTSIH5uGK+23YZ3vVUvG7g1U63OVYhiaJlX67EAZL3Oyx/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nWMnW2pp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LX+gLj94; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJBY8rc4145311
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 14:35:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MyMmVElDZvwdRIAby/7iW7vi4WeJE4eibZZHiU0BOnA=; b=nWMnW2ppEGj8sQO1
	72cd/O2SvycHwZ7mfK+mnsDlsERmYByJEzPltbj60Q+AIUnRJwaKAMUNtnd9sBgV
	mQnpWkAOzI5oDXDNOmhADGWtPkspwBO6OLbr3aRxqkQTbBc4KZRfKxXjRylK0JGg
	YusVtweDPoS/yOzIooZTZQELwNqQXAYnV05U1gYJyFp2jp7Nl+/57jhnjsZkqEQW
	WrCvAV6cCa5Elx5uZRFoNYwJTWu7B7dsEj9n6yKpMzeF+ZuAnI3v6VzKGsjGHBzo
	fPTjEEkH4SjwIYKQ1mGqONKLf5i3pXSk4T4mDpJsyWxGnp18xxYaDnMQ/2YqxLTx
	29VZ/g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2dtyj5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 14:35:59 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ee16731ceaso33912991cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 06:35:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766154959; x=1766759759; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MyMmVElDZvwdRIAby/7iW7vi4WeJE4eibZZHiU0BOnA=;
        b=LX+gLj94Yhmovy/6Dqanpqt0lhF5XOLF4WZqn3DTgRI8IO+AjoDJbItEDr3AO/jg0s
         iq7WP8xP8hY49zfTpAlAH1coFSzHjyQHEG1UYbffMLK0SkoL/xm621wtyapoaw9Kj7A2
         5IE7NGucP/csoenr8tNz1aEOBqZiz4TObek98CfYJg8z1Yx+xSnq878/B6DdqoSUSFzH
         TYviIo0EwWHCMTL5L2AOzEB4bxjp3HkxISAX576rDjZQKsG3FSgNYm4Adb6VAkJd61QR
         4oiykZdBkq9rv2pnqWoLLpp/UVN3YSDPs5fdMygqK21qe7McU19pILtHlctBQlkxVqhB
         8QdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766154959; x=1766759759;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MyMmVElDZvwdRIAby/7iW7vi4WeJE4eibZZHiU0BOnA=;
        b=mBobI9ypQNOKzBtjFxK+c2oHaeOGZTfinBgYohNrLZWhbC9Yq37/K8vec+UYHuNzrP
         3MqIc4SCKTiFzgMjLvZZu5Nc9SlgYWQoxQHq3ZY9bGxyf5ctAHD9w04QoeCUlpuy3cdv
         jYdvmqL+8LDxOYGBw5hO0MK0msKyYoCZzOEJ1lmmdqoroxI5J7NttveofedoTfh5rYgN
         /1T4YJL1Q4zNeaciLY5/6laRy6N5k5gWv7IWleCuyQx+q0sxBIHEocaSph/TIvzyKEWq
         QnuYfrGwdcAhMKrpu0C+bD4uTFCR3tO3yHewWAfWkjEuYXGVgZX5P+cLg2YoWB9yL8TA
         y0/w==
X-Forwarded-Encrypted: i=1; AJvYcCWY7JZQGzvII2dWCJ2hz5VeJswiOAj9/+l8qqwQBRTOX0bjPTtRhyBkTGDy7CjGyAqjWaYBwIhIhYecoBZZ@vger.kernel.org
X-Gm-Message-State: AOJu0YyPeVbUEKIAWxbzNk7HZmSjbQ1KnlNmyY7PgEpRag7nZIa2Y2sz
	VWVBujbgrapIONoPefkQXJAU1YgRKry81Ie7hRJtRZVbY9fradYNI49ddnFRVfoGeoKlHUKh2lX
	b5z6tgnHlty/Rg3Ugn1y8U+d2AWuIi80WhNrgmDm9QwmGIAsHnDmGp1GGOhId7muUFiPw
X-Gm-Gg: AY/fxX6jgXS84f7u03/jrBHBDN+7t80IX8Fyu2wZB504E9iPstf3KQBu/Ug49t/WSzJ
	/WaHtlFsdT08B5DyDnr5UCNy4amr459//vaCmRIY8ctaYPIREcx5p6a24AJ89vR6cOdqH6oG/Wq
	EUUkPVgz5SO2IeZCf3Q8C/vgy2YEpcpyK1Iite61bxipwNMiB8LCoIQn/1J6T02+iGZGxSfrQmk
	CFkKaWxJ1weSYAtzss1th9nxWyK9P6wgdKkAdj6ENmojl/53E6sBfhRoL+nYL6BsrKu7udqjA5j
	v7rTSOfLn8qavDlrNwLSYgr4+k2wmo5qJKnK2nhXIbn9qAR6Z/9z1hrriHxANnTMEf0b9jMmJWr
	ycggYtyj41gsEQaim9o1xnCoPLk3mn4moa82tlmIiN7CnNmqO0P99KLGomzzhiUzz+/EA
X-Received: by 2002:a05:622a:1e94:b0:4ee:209c:be59 with SMTP id d75a77b69052e-4f4abd9541bmr48095911cf.55.1766154958800;
        Fri, 19 Dec 2025 06:35:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFy3s+cedRD+jScDO/yti3WIT0fmJUy0yEz4L9LKCuvDsUwnGPrO9lv5lNcy508pzCE+1Jc6A==
X-Received: by 2002:a05:622a:1e94:b0:4ee:209c:be59 with SMTP id d75a77b69052e-4f4abd9541bmr48095371cf.55.1766154958397;
        Fri, 19 Dec 2025 06:35:58 -0800 (PST)
Received: from [127.0.1.1] (83.31.98.88.ipv4.supernova.orange.pl. [83.31.98.88])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037ab7f86sm245145966b.17.2025.12.19.06.35.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 06:35:57 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 15:31:51 +0100
Subject: [PATCH 2/5] iio: adc: exynos: Simplify with dev_err_probe
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251219-iio-dev-err-probe-v1-2-bd0fbc83c8a0@oss.qualcomm.com>
References: <20251219-iio-dev-err-probe-v1-0-bd0fbc83c8a0@oss.qualcomm.com>
In-Reply-To: <20251219-iio-dev-err-probe-v1-0-bd0fbc83c8a0@oss.qualcomm.com>
To: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>,
        =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>, Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Heiko Stuebner <heiko@sntech.de>, Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>
Cc: linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2371;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=5iVrwaVGkX/lz9WN7/1Hu0jkjOFLzSRBWe82w60UkjU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpRWLFkLm4i1w5ivMIJ1P76TTT6SODbzjV9Amfa
 9AuVP27BKyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaUVixQAKCRDBN2bmhouD
 1355D/9zK05TIVLM90YKH+VJ22rkGMMZGxQjjUGFR0oKrTlLWycdW95453AT1vgoNi5JaUt7uhG
 EEm4uMIUCWH+8hMVEji27mf/TEh4IxaMOwaO679edjyhgWMLoV93nYZ3dIEHbA3pJU/dj2JBQ3C
 mRWJowsgDCUMxCHqy9iZAHAX5nTZYZlxArvoFGlaAMrya9ou9xnNapJXa+lRHk9/Zcyx6GudSge
 M71hRmDuvoU3UX3rdLU3Y2+2KjqIt/6cWBzm09etk280kbA4IU1Om9TgwNkN9ydPmDECDHPrftn
 FZYZ/9kAVjsqrPUkaMFBAhEXW4UowvR8EbZ4b8bXf1twI5WrtlGKwpsfXXkkiUJNdDg0RPBN1Zp
 bEXk5mcZg00qSFTFxZZdNuQSYV/USnXxwVpkNZ+uAvwRkGZWoAYSLBoS6uTz/sdoDQnJSUV4OQP
 UybAN7xllOhnQwQwxlyF7rXZNAVgo/aHHU/wiDGNrcDMix34ODC7ZIu5LqbaYe2bw+0nzCpy4wp
 GLj0CDDkP88fOOZ2vI/6mCHyZpXvBMcE12Jn6EFKBOQyxG9ju0A5khAGXp8vToVjZrdMhDi/f8U
 s9v0QkdA6kJF4TjZbVqsyIEr9GKmHiq/T9Hm7HB4od4NZSU3rm+SkVpm6RFCMeUBySXr9gQJ8Pd
 ONf3bUbf6HecpuA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: XiqfT8iKIMQGVKY5PrXTVsMj1q5b8qLZ
X-Authority-Analysis: v=2.4 cv=A7ph/qWG c=1 sm=1 tr=0 ts=694562cf cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=qe4J/qXhiWkb1JZGYKbLYA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Y7nMzdyCy53GPDWIMu8A:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: XiqfT8iKIMQGVKY5PrXTVsMj1q5b8qLZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDEyMiBTYWx0ZWRfX8gN9Tta7UNXa
 xbH7Yeumy4KAtxRP9GNSTpqoqJETCnTcGjDDSkhNIDr1ESTqAqaIofU67AsmWmDqndnTAk71sc4
 RZ0KtanVzuUA2Ob0Mgki70Jvxv/f68zIBvrMWO9s8dH6tMf8nQZqAM0EJ71qLtl4+XeNfw//tCn
 YUMd0OTfnlCn2fay0MPVVlq27XMn6zn92RMqKtfFNnkh/J/Nh2AF1DKKfLqWhjeqqy6S04iLETX
 w06ZBuz7nKa/xfyh5zrz5zaHDMgxEjwcobU8iMTlJZFfjqDXJozXXwbRyPD0yC9jpshD1+uL8fP
 7L2YjbO+HjYRi4nOkrWJcOwhIofGipHCAZyTB3hvCKLDRgVTccedqbve6ociw8GaRd7lVJYjP9E
 BpP7BaH1f2mQN8oxBA0CZtYEc9LCamgOJmVSxqgbV4IgP0Z1dbpg1CjlbtMta0tDBXNvnauaJTO
 pVH4lWtUEBsb39HZtVg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_05,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0 spamscore=0
 phishscore=0 suspectscore=0 malwarescore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190122

Use dev_err_probe() to make error code handling simpler and handle
deferred probe nicely (avoid spamming logs).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/iio/adc/exynos_adc.c | 29 ++++++++++-------------------
 1 file changed, 10 insertions(+), 19 deletions(-)

diff --git a/drivers/iio/adc/exynos_adc.c b/drivers/iio/adc/exynos_adc.c
index 1484adff00df..491e8dcfd91e 100644
--- a/drivers/iio/adc/exynos_adc.c
+++ b/drivers/iio/adc/exynos_adc.c
@@ -564,10 +564,8 @@ static int exynos_adc_probe(struct platform_device *pdev)
 	info = iio_priv(indio_dev);
 
 	info->data = exynos_adc_get_data(pdev);
-	if (!info->data) {
-		dev_err(&pdev->dev, "failed getting exynos_adc_data\n");
-		return -EINVAL;
-	}
+	if (!info->data)
+		return dev_err_probe(&pdev->dev, -EINVAL, "failed getting exynos_adc_data\n");
 
 	info->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(info->regs))
@@ -578,10 +576,9 @@ static int exynos_adc_probe(struct platform_device *pdev)
 		info->pmu_map = syscon_regmap_lookup_by_phandle(
 					pdev->dev.of_node,
 					"samsung,syscon-phandle");
-		if (IS_ERR(info->pmu_map)) {
-			dev_err(&pdev->dev, "syscon regmap lookup failed.\n");
-			return PTR_ERR(info->pmu_map);
-		}
+		if (IS_ERR(info->pmu_map))
+			return dev_err_probe(&pdev->dev, PTR_ERR(info->pmu_map),
+					     "syscon regmap lookup failed.\n");
 	}
 
 	irq = platform_get_irq(pdev, 0);
@@ -593,20 +590,14 @@ static int exynos_adc_probe(struct platform_device *pdev)
 	init_completion(&info->completion);
 
 	info->clk = devm_clk_get(&pdev->dev, "adc");
-	if (IS_ERR(info->clk)) {
-		dev_err(&pdev->dev, "failed getting clock, err = %ld\n",
-							PTR_ERR(info->clk));
-		return PTR_ERR(info->clk);
-	}
+	if (IS_ERR(info->clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(info->clk), "failed getting clock\n");
 
 	if (info->data->needs_sclk) {
 		info->sclk = devm_clk_get(&pdev->dev, "sclk");
-		if (IS_ERR(info->sclk)) {
-			dev_err(&pdev->dev,
-				"failed getting sclk clock, err = %ld\n",
-				PTR_ERR(info->sclk));
-			return PTR_ERR(info->sclk);
-		}
+		if (IS_ERR(info->sclk))
+			return dev_err_probe(&pdev->dev, PTR_ERR(info->sclk),
+					     "failed getting sclk clock\n");
 	}
 
 	info->vdd = devm_regulator_get(&pdev->dev, "vdd");

-- 
2.51.0


