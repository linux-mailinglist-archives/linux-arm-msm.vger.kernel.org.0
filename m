Return-Path: <linux-arm-msm+bounces-70816-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D26D1B354F7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Aug 2025 09:02:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B62DE4E22FA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Aug 2025 07:02:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23DB5257842;
	Tue, 26 Aug 2025 07:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CJp1yoeX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85FC42F6577
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 07:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756191728; cv=none; b=t7gl6JFtOh0mcxx+1CotLAloiUrUPWZpjqAWSz3oE9b+twUfGH9Qt/NrCvHDQfxg38Dp3dITt+uM9TDb1kSjpWpFfsfSyn1Cn6pBWRqjQfA1ByFGh8DqyB9JW/QICfJ7RoUWD1W0EJDnbka4BG8vHSwjDpdw+YA9NnhTKZKyLVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756191728; c=relaxed/simple;
	bh=0/5OZHffw4MZuc5X1lI0MOyqXCGdpMXrLJ+db0eHooA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rRHXitTQXkxW/iQPsMld72/axJBg7b1o+ogKURy8jWaohiPvM0gC1P8oaEr4014QB5lhiZLeuFmNHyNr6O8MMXw9/IuyU9gjHkazPTo1woq0Qpsf5AU19TFi/ovdDQB8PoJSGrPpUmqk3IgxC9Qtld4ZJv/teVn01EJJf/37O2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CJp1yoeX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57Q5AGhl007851
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 07:02:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=vG+JLCn6L4I
	c7MLBU6Y9jQ5LFWamplScsqK99+l+ZYQ=; b=CJp1yoeXIk3Hu7FSl8v7E4T1S3m
	eu+FK5k+wa/7oMn4u1oolfigvAHAeoVivW8wlOtG/HEhJDDWPorfDLZ3iNFmM6tI
	H2p1TZPOkciZiYyWDSXCZ4qrJsj2+CzzgvcBpS1RiPQcfXCjK+nNeFGg/i9ZbvGp
	yvuwpJ0Q9PPidUj+npiH/emQuN1vxp6iQbDOrDFLxpFDQr1DGyOsgxSwCA4Y5/uv
	tyFkQdDghu4dwN2oBGhFaFjHUT7TOrLwZJblOF/2ySGHun1JCSDCpJ2Ltxj3zeVv
	jVJzFTF6IIVOSfk18aadt0s5oFix763RRe/1JSxnrWOkwhCY8uOGofnRG6w==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5xpqxh1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 07:02:05 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b47174b3427so3794645a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 00:02:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756191725; x=1756796525;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vG+JLCn6L4Ic7MLBU6Y9jQ5LFWamplScsqK99+l+ZYQ=;
        b=EIrVeWrQBB1eJ5HyGCLEfCXAjQdj2wPdAU7SqaP9z9Ds4dXSBgNJyTvPTtXir8OBAq
         1bEkm27y6hJIGDFaouCTJtMTsDIhnIiIhTcuhl1gNIdc2VaxTEhq08GTrywg5xwhp2+m
         SBjJImhKZP1lIE6JVJ41n1NPUMLOGwK4Pcd+3NlDdQ/WbVdSv5fFXG9W1YbTLp6rPZDQ
         SkoPFfWZfFmC4s56BcONQoOWz2tyzGMRV+GG1GwB+q005rEMDKSwT6MyqgX53C7Blhbd
         aokpiBF/bdBvfrziBQ/qc4gVgOqcCJpVbcIBr14CL5liB+unW9TVucXESoI6aqM4Lw7x
         r3Cw==
X-Forwarded-Encrypted: i=1; AJvYcCX4QaLJeKoL3ka+urK2JHnyyDekurg+Vsfko6q6nQJJSfXK8gDa9PbHcOVSHzW53M0tsBHs1x0VONYXG9yp@vger.kernel.org
X-Gm-Message-State: AOJu0Yw35dJuYrB6/vl0AGiyL4JJU6jkpMY/Mvb01983ckIeoTjVy0zT
	gptI+u2XDfgMTAnPP0yR9X9fBONTCqyTiVLinrQhYnRbdBc4KWNzgeujfJKS2P+YxeG7jmWNf/K
	tOALKaJr8hMbuHBi4GFyCmaKmsWN+R8d5AE4RDC3NLoOteZlc5VKwuSvwyDFFOjGezR8zK5x1E5
	WSeLk=
X-Gm-Gg: ASbGncsNXuoMfkTkVrEYBIrg/wAzB4ethfBQ342gNTGuraoOGUSU2n+b1QaAvi3otee
	sL+heV7zX9uJIXmQ/LJmiUje0x9XGpd/SFoMZsCmlkQQQGddDV1z3zBwrVHIbXEnt969sIcnnKk
	Ofk+NkW5nlIAnm10+InDA0UFRErRLvTE7xJdR/Yz2czxaQLkXUVZxjqUMUltfFAtIVzPl8izqGW
	5VknnTojPH5CDDiSYegFFx8eXk0IsyQYpZCZKWvAR1/eD3Pq3lYncgZpXfr7/kVvbakzmV+TwIX
	D7Ktk1emAgR4flnjw1++95Z5WtcQIamvh7o8MVg1vbo+KmOYgzkPghGOEuIpxk60JhUXi6yUwd3
	xFQRNj/wael8+YRjadojR
X-Received: by 2002:a05:6a20:6729:b0:243:757a:8859 with SMTP id adf61e73a8af0-243757a8d66mr6775834637.24.1756191724002;
        Tue, 26 Aug 2025 00:02:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEsB6DgGNhNRZIVnU1LaZzXfbxjCKpRrkugicqU0gWrNG6/1baUumt0mfh3z5afOb2+MFXU6A==
X-Received: by 2002:a05:6a20:6729:b0:243:757a:8859 with SMTP id adf61e73a8af0-243757a8d66mr6775769637.24.1756191723268;
        Tue, 26 Aug 2025 00:02:03 -0700 (PDT)
Received: from jiegan.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-770b5bed428sm5628582b3a.16.2025.08.26.00.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 00:02:02 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH v1 2/3] coresight: tpda: add function to configure TPDA_SYNCR register
Date: Tue, 26 Aug 2025 15:01:49 +0800
Message-Id: <20250826070150.5603-3-jie.gan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250826070150.5603-1-jie.gan@oss.qualcomm.com>
References: <20250826070150.5603-1-jie.gan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=KOlaDEFo c=1 sm=1 tr=0 ts=68ad5bed cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=8xtsYS7Ed2DtWhKBhe4A:9
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: n2Upfgz9RTToOcDFgXa2kzU828XS_xki
X-Proofpoint-ORIG-GUID: n2Upfgz9RTToOcDFgXa2kzU828XS_xki
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX/BQI+e0hPuS0
 Or06zn7BlLx22vKWwltwaFG+LxQuZQEvuc3WUUsRi+NdnHUHHALopqi3iEyFpbvRJQmAoyHkI4Y
 tDbm6o2OH2s4OU+UxQSsSaQP5QvK54GgJ5/I8A0R+hkDB2PKhGgrH0fhcGS6gxpYNyVUQQr5rOF
 VmtoQxW9e4wfqatfM68AM+DI84+fqejHpebIOXMR4ggnjIcrNsI5jOagufEhNxat2b0OexxiHlB
 VgaERBORFkKeqJQPWelERc3onmMkVBNhYwOZWGiIC0OG+W4/57jbpar8iqfbF7YyVdC8EzDXvMd
 DpH5b38L2x9KgQmHMgMk//nt0KNvV5MDrAJIzHPNLeLTLTQ7iUX2TPF4fQix2Edm2e18RCj9AMI
 v5j9AIwv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 bulkscore=0 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230033

From: Tao Zhang <tao.zhang@oss.qualcomm.com>

The TPDA_SYNCR register defines the frequency at which TPDA generates
ASYNC packets, enabling userspace tools to accurately parse each valid
packet.

Signed-off-by: Tao Zhang <tao.zhang@oss.qualcomm.com>
Co-developed-by: Jie Gan <jie.gan@oss.qualcomm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tpda.c | 15 +++++++++++++++
 drivers/hwtracing/coresight/coresight-tpda.h |  1 +
 2 files changed, 16 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/drivers/hwtracing/coresight/coresight-tpda.c
index cc254d53b8ec..9e623732d1e7 100644
--- a/drivers/hwtracing/coresight/coresight-tpda.c
+++ b/drivers/hwtracing/coresight/coresight-tpda.c
@@ -189,6 +189,18 @@ static void tpda_enable_pre_port(struct tpda_drvdata *drvdata)
 		writel_relaxed(0x0, drvdata->base + TPDA_FPID_CR);
 }
 
+static void tpda_enable_post_port(struct tpda_drvdata *drvdata)
+{
+	uint32_t val;
+
+	val = readl_relaxed(drvdata->base + TPDA_SYNCR);
+	/* Clear the mode */
+	val = val & ~TPDA_MODE_CTRL;
+	/* Program the counter value */
+	val = val | 0xFFF;
+	writel_relaxed(val, drvdata->base + TPDA_SYNCR);
+}
+
 static int tpda_enable_port(struct tpda_drvdata *drvdata, int port)
 {
 	u32 val;
@@ -227,6 +239,9 @@ static int __tpda_enable(struct tpda_drvdata *drvdata, int port)
 		tpda_enable_pre_port(drvdata);
 
 	ret = tpda_enable_port(drvdata, port);
+	if (!drvdata->csdev->refcnt)
+		tpda_enable_post_port(drvdata);
+
 	CS_LOCK(drvdata->base);
 
 	return ret;
diff --git a/drivers/hwtracing/coresight/coresight-tpda.h b/drivers/hwtracing/coresight/coresight-tpda.h
index b651372d4c88..00d146960d81 100644
--- a/drivers/hwtracing/coresight/coresight-tpda.h
+++ b/drivers/hwtracing/coresight/coresight-tpda.h
@@ -9,6 +9,7 @@
 #define TPDA_CR			(0x000)
 #define TPDA_Pn_CR(n)		(0x004 + (n * 4))
 #define TPDA_FPID_CR		(0x084)
+#define TPDA_SYNCR		(0x08C)
 
 /* Cross trigger FREQ packets timestamp bit */
 #define TPDA_CR_FREQTS		BIT(2)
-- 
2.34.1


