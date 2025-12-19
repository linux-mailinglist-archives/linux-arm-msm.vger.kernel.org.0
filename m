Return-Path: <linux-arm-msm+bounces-85818-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A63DCCF503
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 11:15:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EC26F30D8D64
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 10:09:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D12B6304BB3;
	Fri, 19 Dec 2025 10:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n5fqXN0B";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VBmrq6KK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D78B30103A
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 10:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766138919; cv=none; b=gEzFulQF0sHzxRe62mU27flfvNA+TiN633TsbZ3NzoWBn7K3BPqe9F6Hxnezk9ZzaWo7e8knRGAcDahS4ElrikBKE8u3n+TQML3aAvvQYbLqFTdDph6wHdKBd8UcEZ+fQUDCFSOB/Tid3+1l1BVIdK5rZS3mQmOPITZlKqm6kic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766138919; c=relaxed/simple;
	bh=6dN4XjHr+6OQnOzxmGwMll0VZH7PW0q5aNlxk1E5+Hg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YUIntnfeDKvBHnGVwPGOQbc6/sCaaxmQn8k8jWGa7eqkctTHwDrIOdK+RhN0R3oZnWA3/Fy/eNYwR8PPbMCPjJPKLXM3G5/ptRwu2mU8y80ZyQIiwWgBLPXvohwS4oJDC/aSR7wBe2iZqw7RvNABy1tbX4kzsETBQFDxPLcljTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n5fqXN0B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VBmrq6KK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJ4cCUg091853
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 10:08:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9iGVNuTYeeAltbq14HNN1Bd2g5XTMHQ/MFj6N7hyZ8I=; b=n5fqXN0Bv1w+8CH0
	/TZ9HkqZFss7Hx+yvZ+KsSGXvs/aHLNvPt3++hLfdXNAz48ZTDGjn8PmdRIBYHVb
	b0IkYSx41HEH3I7DkzPodrPATqntLM3uZEmhwYEjcCU9jgZ8SJpVZ7VYDKUY6rll
	5KidemAgIRLq6nZJREjPG18Tg9jD8gWQ14LLP4PusBkKr7x+wRiowIGDIKPT5Qx5
	8KMHGb3MRF5czPTeCJSdWQeDJK8ZpRBoKDpibS5y+ppqmbq0Mb2GiuHJvEbr0MfM
	HyT02UPj75GqzsG7mDLsXa7Juewyo/R18JEDYTFTZZeuOPTO1eVFWxHHAlgM3wSB
	1WvvaA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2ea81y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 10:08:35 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4f4ab58098eso19695741cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 02:08:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766138915; x=1766743715; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9iGVNuTYeeAltbq14HNN1Bd2g5XTMHQ/MFj6N7hyZ8I=;
        b=VBmrq6KKNxm62b1tuNzd/83a9KO19Jxd7bhjI9qS8Yk/gJbL45W+XQ3PNuCYyX1AK4
         YUODTzvIqYaNdAwVy+SWpHWYX7PuBkv/wo/fs3i9ywDfU7sfpqqwRPsh4bBr3ZTAdNhD
         qrVl2VdveE3Zxyu8EaAG/e18kby7vRzp/WxdK05Rh3a0PxMJ8DPXEg5Bg1GwqZrQHs6U
         h9JQW75+dUy/0ZiqMWooMN0NR0uSjsVoMu0F+7TgdbKU7qnRu50mxLo3KshtuX1Ce68/
         gh1E3tE2ax2khAopOh9pOdfrib7/VhhuNCz6VrOfiqE8bDRoRtq6atn4CFGiAyzR7+21
         fPhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766138915; x=1766743715;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9iGVNuTYeeAltbq14HNN1Bd2g5XTMHQ/MFj6N7hyZ8I=;
        b=N7hb+Cml/ejga2zT39AMBNbrGtZ9hODvBtVH8vRpdnkny7OMU6zlctGrK24CK65bs2
         qvbEnHEI2n4K+JIqz6Gjz5d0yT/Qr8RguDlUfxdMgn6LI12FNwabca+IRuRMQHJ19Q/o
         XUyuDOJH8RIRlcc+cHHY9ig7m1yBY0rLSeLB+j5pcsPC65ANYV8Zne71iuM0cnuXU8oT
         rjUEgXx9Rsu7JyoYCyGjAgKEgPjcThhAhEbrGxhHMwVpAb1Gh3HyQMbNzYPexDXhQYAX
         h6iZ03YJavJ+MYgSTuaVm54BjAAUU2sSc7QZavTibLdMQqXPg/ZnXk7XVay1DOLGfUST
         JpSw==
X-Forwarded-Encrypted: i=1; AJvYcCURLq7f9JzzItG+Zh3bNhykz6NpcKyop4P82HVOeoM7ONd/d/v/vYdsJ82cxySkiUf71nlJInEsJ4LWubOu@vger.kernel.org
X-Gm-Message-State: AOJu0YxpmGFAqDQFOj7TIx+4LwTflIavRy3FaR4YuR9tTIWIVwxrdjH7
	QFHNnip3B2vqv+SFhpcIVzymUt4WFqG5zxi4JP7JODFP9elkoTq/waN6sU+tzqfM7hfnXRtZVsw
	yyQY/lViKlXgaWwb1THuaHbk0sJZNIN/QkB+Bm3IdZq97ASPOvOWX80fAUP/3JmrOWDn6
X-Gm-Gg: AY/fxX45cjLpMz0ixlxgqeVKZWAhoeUmSW7owHNxfou2rMOqbYT7kIJPT1HjYOlN+L8
	x7RnObe3LjGvpK2zrjDpMdlga5pXHIza/JkQgS9eRvi3WfbZuMnVf1mQfQWOvsUvtOqcnybsBgu
	TeQhRmA53cmsfTPIW5vJQCXIg1qJqnUUxoQiJYv2hmV7H/zcU9ZxFJJnlNrXz0ISmOvZTgvGV/Y
	P/9so+FDwZlK+vkt4Gh+JAjxihTxF+K412JcNZQgGd8pYq8fGnxGSf0QfUbYhLcdbp25Nr8GaG7
	vH6TGasZ5BihDt+il5ywPecdz98WrhtdMCBa9nKdWOlu2Fwm7dU8XucMmbbeDuThk6OnqdY78/L
	D/H0unlh4QjM9ycoiEhIqejvXjZBv7X1HBKJzlQ==
X-Received: by 2002:a05:622a:28f:b0:4ee:1ff0:3799 with SMTP id d75a77b69052e-4f4abd74a55mr29641351cf.44.1766138915329;
        Fri, 19 Dec 2025 02:08:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFz4giQwH5X7LuypWLo9U1+fJMoHQI0FlkCPgyAR+B+nIDT3LsZmrmPqVD87xFUXXNPvdXU/Q==
X-Received: by 2002:a05:622a:28f:b0:4ee:1ff0:3799 with SMTP id d75a77b69052e-4f4abd74a55mr29640941cf.44.1766138914836;
        Fri, 19 Dec 2025 02:08:34 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:a48:678b:dad2:b2eb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea82f6asm4209571f8f.27.2025.12.19.02.08.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 02:08:34 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 11:07:45 +0100
Subject: [PATCH v10 06/12] crypto: qce - Remove unused ignore_buf
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251219-qcom-qce-cmd-descr-v10-6-ff7e4bf7dad4@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2012;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=DfH5Bb+Cx5AadRW9+jaH1GcMtyO0VLpMWlVREcJBr7o=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpRSQTefcv4cYMI1ZoHjt400fLY9Litr6ZG59Dj
 KtoJRtN6nyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUUkEwAKCRAFnS7L/zaE
 w7DzEACtc8xd+jyPZoQLMG6DPKT8itC99zs9zfVE3otqbuwsbLdmoFn6MqnzRMuHHe90IBhRJmU
 SY/l7zOg5MDp8BLANHlBm9fqc9xmcqg61MTrzKpM7nYYMJ710O48FZqCl9IDYOhIvETcDh+uqXc
 8oaFJ36UpnKHSoLaigiTalvVx15tY0eZFZc1XGV7O29DQ0gxkVEdl2kjfJBn2PdngFwVINmgJtw
 hMKhhj1reGzd3JaPZbQDjSnFh7mKKKZyP91JnfgXX+vapLLLQDFelirHCPuk4xK023yJkowrz13
 IbItlUbrupdp539e4nSfREzOJonDADg/NiIEwKAcp6dBOubSyviUnfKG6jQ67wguSHDtpW3wpN6
 i+OwT4XyRHAbViqW8isUIo+3mtIxqJnagIuiGWGnWvX/RbLDK2RP1qZop2sTyuY2CJeCyIpPoUi
 5kGt5L5pNb5Q9nSxq9XgZNNmu66T0RK4UpZ0wHS/SHlovNUy+v5muKAHw07Oh6j0RH/fsGHpz8w
 sQLoP+iAZiS6szgaCgTqE9RfvMe/n9W46ZJ84KA3HRzNpilp9zRxIkAyAh3L1w65HyUOdibwWXd
 AUmOIZlJQgL48vmGdtAvxN/HKzwaynU5XNMdb59kXzZ7/RkJSPFeiUXucFHbdnW2Zt4Vx6fPvfs
 t0q5Mk5/jOZHQ+Q==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDA4MyBTYWx0ZWRfX2pSJkMreS0sn
 XpzB2sS3WjsT3tE6tAXTrLLQt6Bl+MLKmqzEhzPX6q6qmcjUg1r0FIHHi3eZaB9Dg1BUOAmduts
 t3WgC7eXgNPl2gD1wOQegLa8gJaxekcP/URY6XifY8dBiieenNqhBSZw+50QmMeTNM0S477jWm4
 44g5uLJuuYL1zc86/kUjLqnr8oMDWN2X5RxHh8OtYqeJQGdwB8c+fDRMGILDhakG/F2wqavQMiv
 n9LM7Dphjfx+vstsUDYXtVvMDBth9z+sRXT0tuXxsEzGqxZ1mnACdWQeMMshMTbEn4aBHpTMty0
 IlabTmWpkhfbynYUfltMLH+NxTkOdZCuWXw4ots5VsBYXeQkV1RD70jnM3KFeOdi5oIp5S/V2Cl
 XFpkE1VkVxKh3P7gHDaPs+XE7pYPgyPAcGXYP5Pv9OXRghA9tsW4HOHYNS+Ax+BVcBML9S//xBH
 IeHtJ3LFajZx10VhMwA==
X-Authority-Analysis: v=2.4 cv=W+c1lBWk c=1 sm=1 tr=0 ts=69452423 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=tWRRbWwrKX-5tUpmLDIA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: WgkxU8u9uZxhRaMCDAdkyksObS0ZBqqy
X-Proofpoint-GUID: WgkxU8u9uZxhRaMCDAdkyksObS0ZBqqy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_03,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 spamscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512190083

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

It's unclear what the purpose of this field is. It has been here since
the initial commit but without any explanation. The driver works fine
without it. We still keep allocating more space in the result buffer, we
just don't need to store its address. While at it: move the
QCE_IGNORE_BUF_SZ definition into dma.c as it's not used outside of this
compilation unit.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/dma.c | 4 ++--
 drivers/crypto/qce/dma.h | 2 --
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/crypto/qce/dma.c b/drivers/crypto/qce/dma.c
index 68cafd4741ad3d91906d39e817fc7873b028d498..08bf3e8ec12433c1a8ee17003f3487e41b7329e4 100644
--- a/drivers/crypto/qce/dma.c
+++ b/drivers/crypto/qce/dma.c
@@ -9,6 +9,8 @@
 
 #include "dma.h"
 
+#define QCE_IGNORE_BUF_SZ		(2 * QCE_BAM_BURST_SIZE)
+
 static void qce_dma_release(void *data)
 {
 	struct qce_dma_data *dma = data;
@@ -41,8 +43,6 @@ int devm_qce_dma_request(struct device *dev, struct qce_dma_data *dma)
 		goto error_nomem;
 	}
 
-	dma->ignore_buf = dma->result_buf + QCE_RESULT_BUF_SZ;
-
 	return devm_add_action_or_reset(dev, qce_dma_release, dma);
 
 error_nomem:
diff --git a/drivers/crypto/qce/dma.h b/drivers/crypto/qce/dma.h
index 31629185000e12242fa07c2cc08b95fcbd5d4b8c..fc337c435cd14917bdfb99febcf9119275afdeba 100644
--- a/drivers/crypto/qce/dma.h
+++ b/drivers/crypto/qce/dma.h
@@ -23,7 +23,6 @@ struct qce_result_dump {
 	u32 status2;
 };
 
-#define QCE_IGNORE_BUF_SZ	(2 * QCE_BAM_BURST_SIZE)
 #define QCE_RESULT_BUF_SZ	\
 		ALIGN(sizeof(struct qce_result_dump), QCE_BAM_BURST_SIZE)
 
@@ -31,7 +30,6 @@ struct qce_dma_data {
 	struct dma_chan *txchan;
 	struct dma_chan *rxchan;
 	struct qce_result_dump *result_buf;
-	void *ignore_buf;
 };
 
 int devm_qce_dma_request(struct device *dev, struct qce_dma_data *dma);

-- 
2.47.3


