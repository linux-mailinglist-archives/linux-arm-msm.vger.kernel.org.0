Return-Path: <linux-arm-msm+bounces-86518-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 68128CDBC2C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 10:10:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 935D330AD5E5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 09:07:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 203D2330305;
	Wed, 24 Dec 2025 09:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xc3zRpH8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g0sb08ch"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 828A832F75B
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 09:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766567258; cv=none; b=YTund8Nse3UipaFswabq+PTNvv1XyBFTIwB4b7VJQGbamTSlTXw00a9ZKAEg1roT4VFKUn+uYw0ZB9Bw4zg6SBcrTM4iuALw5DjCwD8veJeME+JlQwiupD5zYrt3Bf+8Z0wudPtTgZJs51caRV8leanCMvusAKwC58w4vPkvdfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766567258; c=relaxed/simple;
	bh=Oy7z+jq/TjNetJ2Zgz+w8FIQKCJz069QL66/p8AMAm8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=teoKereT6EAAFGuHCPt+6FXeOqrwbRJC6Z6og+j1DrNBYAWXhl5lHduvEet0jf12UaEOiBTk37QY+op1pejb5KM1a4kyyf4YEbUtxGkRK8sEPD4iA413pKX8/Ag2smBRQ4NYaJwZFZg9frEP5MKm+jLOTZInD92UMxI7E4tO2IU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xc3zRpH8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g0sb08ch; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO180ci1598800
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 09:07:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Vt0RRfM8pFKfBxD6jKeqJVSWMlwtbL7pwYs+oCiP02U=; b=Xc3zRpH8LgHJ/XHO
	XQ6wcSyKWOHzllg2/iBJ4sR5z6j10AvQc1VrWD7co8MuLS470yXRfYOJbPEURAig
	vHGn7wabZ6XwZky8aBUY1xO++ZULXeazWZnNF1cu1O6ASXcKHeSCS/JfL11m8JgI
	VwMHgFasds2JQgfOa6eKNSNzZ37DcZrEjxPqnVizD5xFKb4h9NKFXupTv+t920tP
	zLYE+h8MTcXTKE001iO0NXO68TNGa9h/GYtG883Sc4JakZkIQA9TERtrKMOivJtx
	+EAn5njYZjZWcCQVUYiVjTtPCEltZ1YBcNa/Qr+fdlL+jPB0/yB07Se99DE8iDiQ
	441LvQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b8683h43k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 09:07:35 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a0fe4ade9eso61563875ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 01:07:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766567255; x=1767172055; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vt0RRfM8pFKfBxD6jKeqJVSWMlwtbL7pwYs+oCiP02U=;
        b=g0sb08chdF6JaWNBsvUk3ysD9Zl/kM8i/K4JvrFqpJZbVScpjIYwBbYkdCbfrwAlJ8
         rn2jhnds/N+jZa4bnDZP0TQ2uWPJkci/abqahNIQBcqZ5sNbPJvh1rZxvwqXUOGDkdv8
         1eI6emAlbEUObHP2TtHsxGpzYgLQDU9q3baQ/qQSIRtiTSce0dgQUFFZTnRlhtMKQT+Z
         tdggcj6fAg0+fWz968OwAVhIcPIrdJAdnsPzhY75GXRF05lNpghVBKIWYqWIygqPfjK7
         C2DEHgJoTx/ZQOJmAO57Vl5iYxB6ng7MT9ubXoWVL/GFsmlIOaZro/0JNj6sl5AgUoaL
         eTKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766567255; x=1767172055;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Vt0RRfM8pFKfBxD6jKeqJVSWMlwtbL7pwYs+oCiP02U=;
        b=e05sUrWrsKNsuDINj9EW2f0pASrr8KdicH6zpmDe6tx4vD5B5HKxSTC9mjkabiLn8c
         K2WGs00nCmma1U05klaINEoQSSKcShLKh89bdXcqznjoyZD+4i2A8ZcGaU0qn6PmkHx2
         20FlXaCJVr1vtY8FlsdgpO8dLytnrk8ok0jE/no+S/uTFeykMEAK8k/BsL82k2TAAy73
         FPi8IcHzUwhZMNFAM7cU+rHhN6wacxyCMixGDiPjdhqJOsjAm2ZYTq6gklp4dzkurs1z
         aFfh9rK5ExAJNAyy8s1vn8JAcGGGRhLmZkxma/cQHd+3MkUKyKh1xOwIdnPPzQmg2KBa
         FU/Q==
X-Forwarded-Encrypted: i=1; AJvYcCU6k26hE2HRW/ZWy8wMAuT3iyVCIdPikSxoNHuqgmqWFTdo9aNdLRakp3YTeetxk2ViMJ56Zq4C3fL7yXoZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0aTUrOfar9LO1dxCuycD9lqrynue/bTZhozsnvObM9Gr+cKTb
	r/7XjEMbrzQbVIvdDKteP1n9dIk97vm8k0XW2pTg+oxKbamd/9yoj2fjfOQFzd/f51DSdB7ZYMh
	YaT1BIBTvJUl7yq2WVfmXl69Yqpla1AzbVMTDHACtD/466HnNlt49iVgbH39d2ZgHXRoN
X-Gm-Gg: AY/fxX41NiRgvhGJpbtjRELTqLWrZnFo4EIiBNJX+wAbvESzu680ts9cPHRZSnmFG6I
	NYTL651d3uEXObU8dtaBWBDS7YXn0/WpkJhI76dYkNldogSubCYiaaWs4Y5LZ9XkWUN2s+ZZB20
	IxTtoXmWBYCWgyaeOf365lxf2uQRhs2n3jyD+ei0Ge+5HBroUDn19vaBLrYZBiCOt6z+RSdXyA3
	TNfo04W7AnkNE512OW5bvDXfdJcYYIavn4zZflT2bk5UijPon+Ao23b+AN6gkrBx2jvDxKpo0ZG
	F7rTEq//UTxF69tuvXSZn7ivPNiClYNA/nId3Uq4yA1Y4HIIeyagBWVCNjfbsPfZxToO4N4yTmS
	glz0AUafS6/gE1jWasmZp+4u4ZC3R6jxyUI3pBQ7Ntgi3wjVPBdxmPuHTo8kWZBdG/8uSC09E
X-Received: by 2002:a17:903:249:b0:2a0:fb1c:143d with SMTP id d9443c01a7336-2a2f220d70bmr166139305ad.1.1766567254846;
        Wed, 24 Dec 2025 01:07:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHtlDjLrg85QpNs/nDXqL9KQlAfHLs/TEb14kZhD7bfB8JqUkFh5EDf0SN5JVIgyqLXbuFdZw==
X-Received: by 2002:a17:903:249:b0:2a0:fb1c:143d with SMTP id d9443c01a7336-2a2f220d70bmr166139015ad.1.1766567254297;
        Wed, 24 Dec 2025 01:07:34 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c666d5sm148418095ad.21.2025.12.24.01.07.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 01:07:34 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Wed, 24 Dec 2025 17:06:17 +0800
Subject: [PATCH v9 7/8] coresight: tmc: integrate byte-cntr's read_ops with
 sysfs file_ops
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-enable-byte-cntr-for-ctcu-v9-7-886c4496fed4@oss.qualcomm.com>
References: <20251224-enable-byte-cntr-for-ctcu-v9-0-886c4496fed4@oss.qualcomm.com>
In-Reply-To: <20251224-enable-byte-cntr-for-ctcu-v9-0-886c4496fed4@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766567216; l=3605;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=Oy7z+jq/TjNetJ2Zgz+w8FIQKCJz069QL66/p8AMAm8=;
 b=uSaM/v/6IGPwFdUgM27elSIz+7592+G9joqAqMykPDiujN0xGFIL3I8ImHLoA3zeBynz6jEHP
 S7phaA0hB1fDJ0se5c+j5hyfyFqHefa53uPF5zL3nq8KKJlDnROnRz8
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-GUID: kYJ1Z41ocnRLj4cuYOTEScElihfo29mn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDA3OCBTYWx0ZWRfX2vxERpZ8oL7f
 oIuuLbVwkOUUqRNhGD7ElUQhopYiFCMXij63yWzIbttfeIyfHYsJE3rE7hQucUe3dkdmxDvjLKA
 oRr7L/qswXgv8U+L43NwDBq23RHTKCy65944eiRk21LSWmjKsVEgalWxynZqD/vV4MuRxue8i6p
 wwD+plSRZ6BqaqXfULBUWL7pWpAXu+OlG7Bu4nhKVNIRDOHNMbr2PwOloPpEbiv3puLM1xEXO7k
 CmDmUNnFJoVVfwcqYKRJ4STHfKGmk2rSdmB/Vd8hmSqZ57hFuq5VX7stw4n1rmQ1zNBl95ZqzTh
 XFYTY8+kLASF1bdRN4E9kqNv81pukmU7iJr/WPBnAoMLgkwUgSSiHUs0W2VF7W+iHyf52XzUyrt
 ahibysiEFS7CES+l/FeDQU0F2GFz7Q3IwtR0CWeOs5Bkt1RBgzI7rM2HWTAWTwhVuRA8RpPn4Pl
 hofu02GW3SOkfUv++VQ==
X-Authority-Analysis: v=2.4 cv=HqV72kTS c=1 sm=1 tr=0 ts=694bad57 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=i2GxayCjj04of9N-vEoA:9
 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: kYJ1Z41ocnRLj4cuYOTEScElihfo29mn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240078

Add code logic to invoke byte-cntr's sysfs_read_ops if the byte-cntr
is enabled.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tmc-core.c | 53 +++++++++++++++++++++++-
 1 file changed, 52 insertions(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index 8b0397a77e57..5e74f33f6a23 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-core.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
@@ -31,6 +31,7 @@
 
 #include "coresight-priv.h"
 #include "coresight-tmc.h"
+#include "coresight-ctcu.h"
 
 DEFINE_CORESIGHT_DEVLIST(etb_devs, "tmc_etb");
 DEFINE_CORESIGHT_DEVLIST(etf_devs, "tmc_etf");
@@ -228,15 +229,47 @@ static int tmc_prepare_crashdata(struct tmc_drvdata *drvdata)
 	return 0;
 }
 
+/* Return the byte-cntr's sysfs_read_ops if in use */
+static const struct sysfs_read_ops *tmc_get_byte_cntr_sysfs_ops(struct tmc_drvdata *drvdata)
+{
+	struct ctcu_byte_cntr *byte_cntr_data;
+	struct ctcu_drvdata *ctcu_drvdata;
+	struct coresight_device *helper;
+	int port;
+
+	helper = tmc_etr_get_helper_device(drvdata, CORESIGHT_DEV_SUBTYPE_HELPER_CTCU);
+	if (!helper)
+		return NULL;
+
+	port = coresight_get_in_port(drvdata->csdev, helper);
+	if (port < 0)
+		return NULL;
+
+	ctcu_drvdata = dev_get_drvdata(helper->dev.parent);
+	byte_cntr_data = &ctcu_drvdata->byte_cntr_data[port];
+	if (byte_cntr_data && byte_cntr_data->thresh_val)
+		return ctcu_drvdata->byte_cntr_sysfs_read_ops;
+
+	return NULL;
+}
+
 static int tmc_read_prepare(struct tmc_drvdata *drvdata)
 {
+	const struct sysfs_read_ops *byte_cntr_sysfs_read_ops;
 	int ret = 0;
 
+	byte_cntr_sysfs_read_ops = tmc_get_byte_cntr_sysfs_ops(drvdata);
+	if (byte_cntr_sysfs_read_ops) {
+		ret = byte_cntr_sysfs_read_ops->read_prepare(drvdata);
+		goto out;
+	}
+
 	if (drvdata->sysfs_ops)
 		ret = drvdata->sysfs_ops->read_prepare(drvdata);
 	else
 		ret = -EINVAL;
 
+out:
 	if (!ret)
 		dev_dbg(&drvdata->csdev->dev, "TMC read start\n");
 
@@ -245,13 +278,21 @@ static int tmc_read_prepare(struct tmc_drvdata *drvdata)
 
 static int tmc_read_unprepare(struct tmc_drvdata *drvdata)
 {
+	const struct sysfs_read_ops *byte_cntr_sysfs_read_ops;
 	int ret = 0;
 
+	byte_cntr_sysfs_read_ops = tmc_get_byte_cntr_sysfs_ops(drvdata);
+	if (byte_cntr_sysfs_read_ops) {
+		ret = byte_cntr_sysfs_read_ops->read_unprepare(drvdata);
+		goto out;
+	}
+
 	if (drvdata->sysfs_ops)
 		ret = drvdata->sysfs_ops->read_unprepare(drvdata);
 	else
 		ret = -EINVAL;
 
+out:
 	if (!ret)
 		dev_dbg(&drvdata->csdev->dev, "TMC read end\n");
 
@@ -277,6 +318,12 @@ static int tmc_open(struct inode *inode, struct file *file)
 static ssize_t tmc_get_sysfs_trace(struct tmc_drvdata *drvdata, loff_t pos, size_t len,
 				   char **bufpp)
 {
+	const struct sysfs_read_ops *byte_cntr_sysfs_read_ops;
+
+	byte_cntr_sysfs_read_ops = tmc_get_byte_cntr_sysfs_ops(drvdata);
+	if (byte_cntr_sysfs_read_ops)
+		return byte_cntr_sysfs_read_ops->get_trace_data(drvdata, pos, len, bufpp);
+
 	if (drvdata->sysfs_ops)
 		return drvdata->sysfs_ops->get_trace_data(drvdata, pos, len, bufpp);
 
@@ -300,7 +347,11 @@ static ssize_t tmc_read(struct file *file, char __user *data, size_t len,
 		return -EFAULT;
 	}
 
-	*ppos += actual;
+	if (drvdata->reading_node)
+		drvdata->reading_node->pos += actual;
+	else
+		*ppos += actual;
+
 	dev_dbg(&drvdata->csdev->dev, "%zu bytes copied\n", actual);
 
 	return actual;

-- 
2.34.1


