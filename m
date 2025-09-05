Return-Path: <linux-arm-msm+bounces-72329-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 07305B45CCA
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 17:44:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B56D9583E6E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 15:44:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C47F530216B;
	Fri,  5 Sep 2025 15:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vv8zdK9a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2833030214C
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Sep 2025 15:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757087082; cv=none; b=mZOZajVzpORFlfxkJtsfZWaovV0iAH7JM0HyfdmITrMQCQDsOVWga4keL8TElNodaot6yMxDso+HE7moL6qDusQeFub/n830xc9tfm272vugZzsNCaUo1kF5p7tv2NuXlK3/jetTdXBaGyTfWvcmMPRZoDmgU7bCa7u3C7BZ+Dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757087082; c=relaxed/simple;
	bh=PhB2wEGrckuh+HShGhmgklly6y1CfiMHr/vjqDHdiKM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ScH9TKZQ5vAXofviV47ygsujVkVraGzrOAT7SGeNgfVQzpUOwPJnqOVh1IBUd2z8AU8VN8fOGGJ60leoPat1ZL//t+IScZp1hoILd38S/4OdpLnmxJ9vBvgFdrfHghP32z1obKH9ELmhl36aq513/1tTnUwEqMYHcqqWFR7bweE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vv8zdK9a; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5856m1GT032210
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Sep 2025 15:44:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ZHK+TaiHSdo
	0i2W1eF6c5y+ExVot/td708SwKzVcklc=; b=Vv8zdK9avO0Ifm+uuve/qJ56e7R
	NmudbvEYiA1ytla4nPHVQw6SCsmv6Nsf/f9O+n5iXsQRtVEEupgM1pGbP8kJtbTi
	BVUEaAnWafn7ibu79IWvKiQHi+FyuGjAfAdKyDhQkPJXhLQKejwGeTVO6Pc314EB
	nm6piuQFIRikG2adf9PCf9hbKuiys4yzMWamOAIkPODkvU00nLX4WCivVcextCvu
	lw0F1+z82YJS9FK4W9qU2ZA5asgDpi0zJOSAziQHUJq2qhdBjbZYTYq2wLEX9lQn
	ZyngY90dHkJdO+p5NlX2c4jvjSNZiMZy5qzMJSyoHbeJjraaWUDsfBv6fdw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48upnpkraf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 15:44:40 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b548745115so54533251cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 08:44:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757087079; x=1757691879;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZHK+TaiHSdo0i2W1eF6c5y+ExVot/td708SwKzVcklc=;
        b=aFQOQiTEu52xAxMKf4kLfanrnjNx0O0LdExAYCDSSWEDOF2ZghIBCRTt0mEB34K4Tg
         S1ba5+vTAyGca0Ngu6vVqzXRAnZ3LSD6EaUaB3jdWvpVHTaOzbp+KahuYVXzNLYipAEk
         ENnSEYWlhz4RyWfqyLRF4tBAzoFGUbJnWmooaHxROfjNVdejRyIGC8qR2D3aJXDnepUH
         wy/gtnkuQA5TDNl00bVkFAVFYvQ96Zi8SdJ90PJCi9/1VE4nWVX5nn3TxL0gNiggjo5l
         hiBa5urKmrux2nEeF+h1u1hT2yrq1bl8M6zT2jLrUASRY363JAskisp/Dt1+c0wR1u15
         8Atw==
X-Forwarded-Encrypted: i=1; AJvYcCWd/+XPfJEOmCM7g8OTgeE3Zmr7h4gicA4wD+IO2I3fVlh/IjhRRIhbh7kcCjgnoGSMpvy8479sPLnWPruQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yzv7JP1W5WBOPb2Hatyf7LxZepaVJGT8Yk8cpUCtHcqbl0TPN8R
	cWj7uGfhuE/lYznmVt0Pd1KRWGH86oQYaIo57TdWUSuqZS38Wq898LdQo1W8+u6TE6pqI+PuB4u
	CFF8Wcr7gJNqgF8WImoKseG5IDqxwe1N25pBB9kq+1BdROQZbnFvRyM0YROo6p0UvoX/M
X-Gm-Gg: ASbGncuWfaoAM/pnkBBhetbPKVVyBuc7GK3MiCr4TaU+anFIosfnHRfMD4P3CzoD5/P
	u04Cwo0jxVi+ixWb8xMwHmJxdKuoDKqrpE1enhuKI/xl74L0uVsDfuAg1O+lPZJGJEFJTpYQcYR
	PTX2Pr3RQf3szlC/z8/Ub4niqc/8u+1cpobrx5zSZyEQwQ6FOoCiGsPUqnZd/VBDo+0ZP3Km3mD
	VoWA3VtUPxWCwLY5/5BnI4yU8lMfut1w196+LUjOH4qD7Acop8TGP5bZ4sWZgDTiivr8V7RDfw2
	F/biIE+dfSVE7hDNxLRuFjKBPJlIHQtB5rXh7P1P48TgCLc6Ht3/Dg==
X-Received: by 2002:ac8:5814:0:b0:4b3:7ec:d238 with SMTP id d75a77b69052e-4b5e7cd601cmr40993111cf.4.1757087079053;
        Fri, 05 Sep 2025 08:44:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFCIAh7hGtTrk3JjGWpjyCU0bakKbexV7o3uoUq3SmrVpektwo8ogXEHDmPA2fIURe83QX7mQ==
X-Received: by 2002:ac8:5814:0:b0:4b3:7ec:d238 with SMTP id d75a77b69052e-4b5e7cd601cmr40992681cf.4.1757087078395;
        Fri, 05 Sep 2025 08:44:38 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b9bcda91dsm165716585e9.6.2025.09.05.08.44.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 08:44:38 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, tiwai@suse.com, vkoul@kernel.org, srini@kernel.org,
        yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        neil.armstrong@linaro.org, krzysztof.kozlowski@linaro.org,
        dmitry.baryshkov@oss.qualcomm.com, linux-sound@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v3 02/12] soundwire: bus: add of_sdw_find_device_by_node helper
Date: Fri,  5 Sep 2025 16:44:20 +0100
Message-ID: <20250905154430.12268-3-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250905154430.12268-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250905154430.12268-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Oqozz9vnk1FXbLoetewZANOpX1RxtUi-
X-Authority-Analysis: v=2.4 cv=Jt/xrN4C c=1 sm=1 tr=0 ts=68bb0568 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=Ogeiovxhkh_6Bnox_XcA:9
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: Oqozz9vnk1FXbLoetewZANOpX1RxtUi-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwMSBTYWx0ZWRfX5/ulNfaZ0IXN
 U1yL/ytv1nbIwH/QDjfcIhbNV+qIsprQ1F4ukyzDCk4gHpsg1UGB2twn8sMSHEsEpBcLCvSVxHR
 eZpU+HdybzEwPWWA+7lWK8xyNjUz8ZR6PZm4/eLnvPxE/UicPReJ0yhfFqXyVeDAZhuhAu1W3LC
 80tP0u4az0zAHZ39KSUqHPY6NTbFqrMuXTWQoFIV6zvI7MryNjrxxl6HF6ipkWmR3i+1HybRZeC
 dkFfvUbYqHXmPvDzQeuN/+nk6QAX4ja9a1t4kk27B21Xi4uok8bVHYjwC3Q6RsJ69JZFJB7nTtX
 0c8CAV9tKT4/bVr8rA1o02f/2T3vikisNT/+CL2jZn9OJsQ4NpcrmQ0zVujxjYKslHCKhG3KDej
 YgA1zOW/
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_05,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300001

There has been more than 3 instances of this helper in multiple codec
drivers, it does not make sense to keep duplicating this part of code.

Lets add a helper of_sdw_find_device_by_node for codec drivers to use it.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Acked-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/soundwire/slave.c     | 6 ++++++
 include/linux/soundwire/sdw.h | 9 +++++++++
 2 files changed, 15 insertions(+)

diff --git a/drivers/soundwire/slave.c b/drivers/soundwire/slave.c
index d2d99555ec5a..3d4d00188c26 100644
--- a/drivers/soundwire/slave.c
+++ b/drivers/soundwire/slave.c
@@ -273,4 +273,10 @@ int sdw_of_find_slaves(struct sdw_bus *bus)
 	return 0;
 }
 
+struct device *of_sdw_find_device_by_node(struct device_node *np)
+{
+	return bus_find_device_by_of_node(&sdw_bus_type, np);
+}
+EXPORT_SYMBOL_GPL(of_sdw_find_device_by_node);
+
 MODULE_IMPORT_NS("SND_SOC_SDCA");
diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index 0832776262ac..096213956d31 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -19,6 +19,7 @@
 
 struct dentry;
 struct fwnode_handle;
+struct device_node;
 
 struct sdw_bus;
 struct sdw_slave;
@@ -1086,6 +1087,8 @@ int sdw_stream_add_slave(struct sdw_slave *slave,
 int sdw_stream_remove_slave(struct sdw_slave *slave,
 			    struct sdw_stream_runtime *stream);
 
+struct device *of_sdw_find_device_by_node(struct device_node *np);
+
 int sdw_slave_get_scale_index(struct sdw_slave *slave, u8 *base);
 
 /* messaging and data APIs */
@@ -1119,6 +1122,12 @@ static inline int sdw_stream_remove_slave(struct sdw_slave *slave,
 	return -EINVAL;
 }
 
+static inline struct device *of_sdw_find_device_by_node(struct device_node *np)
+{
+	WARN_ONCE(1, "SoundWire API is disabled");
+	return NULL;
+}
+
 /* messaging and data APIs */
 static inline int sdw_read(struct sdw_slave *slave, u32 addr)
 {
-- 
2.50.0


