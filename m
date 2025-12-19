Return-Path: <linux-arm-msm+bounces-85820-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 69619CCF51B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 11:16:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7E3FE30E64F6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 10:10:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A0CD3074A1;
	Fri, 19 Dec 2025 10:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E7HWsdqf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UrOlWC1w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D551B301026
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 10:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766138923; cv=none; b=soHm+WGiNN5M2M2CpgW87SIFuYlGZiSu7NRcNDNdoL51vRTyBG+wSAZqjTOUMThv/0YqTGz5zrliuIXqCMpsXuSyZMe0DQodkSzV2nnAfn5ziOHiubFiB8Ar9VfuXgd3o4svYSx8qndg07oLjd1resN5QOZFDPH4JAYxt+Aeue0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766138923; c=relaxed/simple;
	bh=0l3gdVnkPeEhRWmaFMSjmRRcTqey535uYCWAXzuHtwc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ncEekJ7RYfDbfqV9jd5KAMdLTk/R9oBW+2APzjd3xnqM9R0qfMouU01R1ImjmsWH7n0qGTzKOcID4aIvDcixfYlcXx79UFRxolvsbzNmH3ubgfgb1n+9GNg74KNMurxYdC6BqSRmEcSZD3CJdKnCv/C7ZCdW+5kcmlih0OMaqjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E7HWsdqf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UrOlWC1w; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJ4cY4E3700970
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 10:08:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bP+u/9sMDsi5B9HZu73nJnAW0uvD7B1160U6L0iNO8E=; b=E7HWsdqftRm/lSe7
	yvpq3qxHbM1aAQMytnVnmhqMduehaTld2RXY6cLi+04dbKmyPxjKDPCBeuONokGM
	r8oqv+PKExm1t/Ovxj7E8f+hDQFAGVNFoUOp8miTIZ3M8TOol5FF3ZFgeFed04AV
	y4n+NYLr4rI60KD1JAE9Rmq+4VVtfPj9Un1Nv2B9Xu7lMM/sEuHYebiDrfwsKmV0
	qHV4lrAayxSzF+e5T8zipIpXmb3ASxHkKV4DFNBDrwvn2gl3XxYcoFdry1HkvopK
	HikT1E2GQfOZJc/h9YyPe1CNudU814aBYCZe9Xn4/0wx4zMEylDetay/uhU6MXVS
	aS0OWA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2ej6yd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 10:08:39 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-88a3822c06bso37589536d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 02:08:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766138919; x=1766743719; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bP+u/9sMDsi5B9HZu73nJnAW0uvD7B1160U6L0iNO8E=;
        b=UrOlWC1wcsaXOp6oPwERRrwlgFx8JnDDc5qQVfP94zCel2/dD0T9lyw7VJT7DcJj9N
         gFhn4PS5eZswm6fUhCb/68jpK+AStsO14PAo5ON2zipp4WLS1zaqR7R/tYImg4n99hnm
         hpHwsjtyraq4+J0+XebFNbyMiZqeJYVMEMGSuHKLOmjaKeFzlnpc0tFtk6Who7b6DIO5
         V3VQWprttQ1zbrT6kNX+5ZMdIigF9b0fWSL0wstxD0tX6IkagmxYEsgVuKRrOMXmBVaA
         jTcYcNXN212dYIhvLK6MRbQYXmnxDxQJQ9Zi0Lvaz2gdLLGhUS6JMHKqrfJKdWhdlUIC
         gr0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766138919; x=1766743719;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bP+u/9sMDsi5B9HZu73nJnAW0uvD7B1160U6L0iNO8E=;
        b=WKsWsp+h0lZiw/g/FNv68ifTwFqHDs6GBoVe4to0VU0DI32x7Tu3glBJyBprnSLGkR
         4UaJs8N1Zl98kcUlrZ38yzcBofibvXYqBL7L5CXgNjR/Ifp7+Zm7He/WAKiJoQ1AXfm7
         cppLqZLWVQcay7xM3+78DaOLWxzVNekvNjcVlQpNtwYYjGwk9aPAEAZWHGO570OSd0GQ
         nLEYPyf0ZR5CB61Yr8eeTcj3aEaJrWaLWKRWIWeCRU20npSaGqRROPISJilssgpd4kUz
         TE5HqKRoTgOdKZaoXeV8BasxDfO/34bBnwdYLGyDqylB4mGvJQXtya85eMwlcpo50Nu6
         76Sg==
X-Forwarded-Encrypted: i=1; AJvYcCWQ+cwur90Qn9PvsjmWvAJTRrGtMbMuYzXsNypTuun8xSGfeTDOcblNyHCshfmIurlj/ODSHc5CQh6hyeg7@vger.kernel.org
X-Gm-Message-State: AOJu0YyJ3+yB1Mcfm1piMt19vPB95F+giywcTPoFuwQAfMqORP3X4WCD
	qz0aUPVdpsztX6pQaApv3iHCVDuzNVJiSTIAKtuEQ4as9i5kr1QIncEt+z+7TPwdxufjZTDZRX7
	5dmMwXRvQc6/QSm+Kp9C7cXCyldYKUcTOCNVXrTRF6YKBYaX2iYliMhQZux3OQCQZ29ME
X-Gm-Gg: AY/fxX61nCChSR5J1KMDUXW5w36No18ldUCZfJEi4IUm/7+KRunlqSlI1oTgfpirbXx
	FAdiOlsELXLDOq98oj0IV5pgMWDFrIKAb3n+6gm2r+rZkNhn/1OXaQtMJprE7lgdgyf4O7sEoak
	Ztp+ctvw1Mt6VNGGYpAdlsqtjvW97hNn/Rx31p/ax/4FGDEH2K093m2mMmHTzHRoJRaH26RmY4P
	zHCzBlx+aWa6gc2fRS8hn2YbIzrgyG6NjgaxQTgc2KymvFBEnGYC/qwlVMWwB4um7VDFNRhpsCp
	dDwTaK5FV25W4kb32665DzGteWWbHZOpaB9s1xpIfBuXRYAdprbL28HRr3psmcxdehO1gm1dDuv
	fjtKSNrHRviDt05CYIA89/plWNv2zz4pegFZprA==
X-Received: by 2002:a05:6214:1315:b0:88a:43bf:b26d with SMTP id 6a1803df08f44-88d82524bf4mr41463986d6.15.1766138918403;
        Fri, 19 Dec 2025 02:08:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH7+ng+TMJdIriKO2FCbHPSS/RqLqd/ZtxuW3TLEQgmbTqVki1I3qDta2wpZfmsBufhAKs30Q==
X-Received: by 2002:a05:6214:1315:b0:88a:43bf:b26d with SMTP id 6a1803df08f44-88d82524bf4mr41463686d6.15.1766138917903;
        Fri, 19 Dec 2025 02:08:37 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:a48:678b:dad2:b2eb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea82f6asm4209571f8f.27.2025.12.19.02.08.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 02:08:37 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 11:07:47 +0100
Subject: [PATCH v10 08/12] crypto: qce - Use existing devres APIs in
 devm_qce_dma_request()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251219-qcom-qce-cmd-descr-v10-8-ff7e4bf7dad4@oss.qualcomm.com>
References: <20251219-qcom-qce-cmd-descr-v10-0-ff7e4bf7dad4@oss.qualcomm.com>
In-Reply-To: <20251219-qcom-qce-cmd-descr-v10-0-ff7e4bf7dad4@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Udit Tiwari <quic_utiwari@quicinc.com>,
        Daniel Perez-Zoghbi <dperezzo@quicinc.com>,
        Md Sadre Alam <mdalam@qti.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        Michal Simek <michal.simek@amd.com>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2266;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=azGHQ+ypZ4Lhe2NPlFIx77n1JCkKbs9Xx9/yXH7ccEw=;
 b=owEBbAKT/ZANAwAKAQWdLsv/NoTDAcsmYgBpRSQUBr0mYDyjQ8uzwnLSY+TxENDs4i7vLTmnZ
 HUSMJTud66JAjIEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUUkFAAKCRAFnS7L/zaE
 w2inD/jp9D6aEn1hR8fcE+ZZwHMWLX1sjWC9MoSYSQoCnooBe45yOVD9RiQE2YITZIlz0MJKtL2
 rrF6TMmpOVYoUU4UFaJA/WtYOdPiv+oDwflFafnix3MBzZNCgRl0kuVrt+v2x6zt5VZTWbew+MF
 PLHYkVkbhEl7q/nZxDmqhnwtoY5dVtWgkPpAZtKP0fFhGgc6ZkS6m0+0tUFQVweFBZ5RdMIiZJS
 ZZk87V8hyPE2IZOhYx8Em8tgIqdSAgBZ/1vBDeNEKeFe7/4fT9u2LQR0eVm3Ew/i6b5g32oUcq+
 NmxOsrskpkyXgwJI0spMwDVrbJY02n5BbiIWGFr8S+qst4il8nsBDfBl7Jt9k5GkR8hPXpq3nNw
 FWHqgJLEME4XPoiUd3UFdY7Zkm5Qo9rQFpbBzt+8DH3F4X/Fn+utnJ6VI7LUiYDekNjVb2n63e4
 HsJihi3ePCFwBhbqan8uhos2Iq7cajqOG/50y8ljAah3e9/2OwqyOzxec2A/J2dD2bJuMJUzMhB
 R1ci+0g2WW5yi63m0+qDHJI8PuTQPvHz9FSND5jHUg1qy2LDJTT5LYx9O4ht7++5sHYExUwe666
 +ODjaRUKU4cSr93JrO5AK0Sx/Tz3IIHL2xsGVHjQ4XssU0qthshPNpshhBAYZU7OacQ86kc+YmT
 nQjZYoeiVGROy
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: 9LcQ6zlPWKR7IGhxZquhpyVhURYKnJYv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDA4MyBTYWx0ZWRfXxNFDDsgOusvg
 m4b/ZZzzctlOfmmjNT+EXLE0cP5xqN76yUnmicJs4poxuVFAXat5a3SrkExGs7RsO1hMaSZ50C1
 yQrWnE1gqHAbzJHXnVdmNOhIQ148/ntEhg2wdZOf23O57GsXiNBQVRCCB3oC0eJeydsTygSFvKd
 Y8FTHyl3yxrQEL4tcdpCtxIfv4xMNk1JbADGZgF3HBVOh3eSUEANDM5LwxRyZwQTbAqKrEg04Yr
 wpIVOwf7MDiRHyiB8QrXjTeIUlmQxglxsdfgIvrpUO845adFvD5wIsBxcsdwobALHxnxkxnmaWt
 4DeDLq+vNukLdzvCN7r9mQcvJJVhDEsiWVe4e2DXFPxbb5gPk+ZCTPLdIBF/rJVkvDnJLlC3bCh
 M2PrXe3q2WEUGhj72EB6oJ7pRyHWUS8XLdJyehbJ0MxSiy/LsWkCNhBK4M5/ikvgirOiUdcPHpY
 FcP7QGlmDMDk1qOJHLA==
X-Proofpoint-ORIG-GUID: 9LcQ6zlPWKR7IGhxZquhpyVhURYKnJYv
X-Authority-Analysis: v=2.4 cv=EabFgfmC c=1 sm=1 tr=0 ts=69452427 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=r78XHnC5kAO70zNBxnsA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_03,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190083

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Switch to devm_kmalloc() and devm_dma_alloc_chan() in
devm_qce_dma_request(). This allows us to drop two labels and shrink the
function.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/dma.c | 39 +++++++++------------------------------
 1 file changed, 9 insertions(+), 30 deletions(-)

diff --git a/drivers/crypto/qce/dma.c b/drivers/crypto/qce/dma.c
index c29b0abe9445381a019e0447d30acfd7319d5c1f..a46264735bb895b6199969e83391383ccbbacc5f 100644
--- a/drivers/crypto/qce/dma.c
+++ b/drivers/crypto/qce/dma.c
@@ -12,47 +12,26 @@
 
 #define QCE_IGNORE_BUF_SZ		(2 * QCE_BAM_BURST_SIZE)
 
-static void qce_dma_release(void *data)
-{
-	struct qce_dma_data *dma = data;
-
-	dma_release_channel(dma->txchan);
-	dma_release_channel(dma->rxchan);
-	kfree(dma->result_buf);
-}
-
 int devm_qce_dma_request(struct qce_device *qce)
 {
 	struct qce_dma_data *dma = &qce->dma;
 	struct device *dev = qce->dev;
-	int ret;
 
-	dma->txchan = dma_request_chan(dev, "tx");
+	dma->txchan = devm_dma_request_chan(dev, "tx");
 	if (IS_ERR(dma->txchan))
 		return dev_err_probe(dev, PTR_ERR(dma->txchan),
 				     "Failed to get TX DMA channel\n");
 
-	dma->rxchan = dma_request_chan(dev, "rx");
-	if (IS_ERR(dma->rxchan)) {
-		ret = dev_err_probe(dev, PTR_ERR(dma->rxchan),
-				    "Failed to get RX DMA channel\n");
-		goto error_rx;
-	}
-
-	dma->result_buf = kmalloc(QCE_RESULT_BUF_SZ + QCE_IGNORE_BUF_SZ,
-				  GFP_KERNEL);
-	if (!dma->result_buf) {
-		ret = -ENOMEM;
-		goto error_nomem;
-	}
+	dma->rxchan = devm_dma_request_chan(dev, "rx");
+	if (IS_ERR(dma->rxchan))
+		return dev_err_probe(dev, PTR_ERR(dma->rxchan),
+				     "Failed to get RX DMA channel\n");
 
-	return devm_add_action_or_reset(dev, qce_dma_release, dma);
+	dma->result_buf = devm_kmalloc(dev, QCE_RESULT_BUF_SZ + QCE_IGNORE_BUF_SZ, GFP_KERNEL);
+	if (!dma->result_buf)
+		return -ENOMEM;
 
-error_nomem:
-	dma_release_channel(dma->rxchan);
-error_rx:
-	dma_release_channel(dma->txchan);
-	return ret;
+	return 0;
 }
 
 struct scatterlist *

-- 
2.47.3


