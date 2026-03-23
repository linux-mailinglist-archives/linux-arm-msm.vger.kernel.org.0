Return-Path: <linux-arm-msm+bounces-99168-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0O+WJkAOwWngQAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99168-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 10:56:16 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 184622EF777
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 10:56:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8C47130632A2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 09:50:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A250E387578;
	Mon, 23 Mar 2026 09:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OM7em+d9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z1EnM2Sa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66BFA3876A3
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 09:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774259411; cv=none; b=fXcgpyNm+DAbfQxWUbFfmN+zichXo+Icbsi2i+i0UL8mgM+SCvANe26ZJXfR397FedK1XPSqyvxfQ0Woi/dxk6WRe+NzZESgM/BC/BNqbvQxmLO1ltGWYixVd8vZo7mC9zFPExSrt7nMBwoGHJzFQOC/xukXAIZaLUkoKDMTVTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774259411; c=relaxed/simple;
	bh=QjBBWW3nZNJQ7dW86dG4Ar+IGXRSYDsLrfUfjlg4xNQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tisiU3pSBLdkPaXiwmnmfD0v2xVs0AhqzVzRrBYXFD8uBjlOH5pdTBsIj8Sv+wjRBs0hibOj43hglzsbezc9g+hreyy/pKbVJN9hxzXktY1K+En9cl4SYZUBCIkqliM3BkFUFJUn9NIzSyVCHrRkfJY+spXP43lvK1F3/ZoyZVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OM7em+d9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z1EnM2Sa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N7u8ac3468428
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 09:50:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XNFnCKRlYseUEtoxCTko5eEC5pQQo7W92i+zQLuCE1k=; b=OM7em+d9dFVzcj10
	BE9dEBV/Ch9Z7m5LogiYs8z2jp+aiRvhNsVZhNDeoU0GolWGLQcXeZ12dQJW8hPr
	WJE0BWMXv/72GzSyFsVRZpfkAE6y7A0ed7F1Dw++MwUCm6fuIosfuc88Bskztva4
	gFMlzKvfYndbVfYJI2tEkaIZ9QRjwP4cUe3Oh69r1NUclcUwVREwaAlAYFarLYpA
	Dbbmw3s/+1N4D1n4OcU2o2czOWY4iHJvKsTZVZ/RPuZ3SOKl99Ureo5UMDCwuZX7
	b+LMbwi1J1cbJEuv7q/lAz+Ml089Ph4P8G9ajUlgB4uG9GiBjWJNc4lRXrVuTTqA
	RDzNtQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d31jggdss-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 09:50:09 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b06395b7a7so50006365ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 02:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774259409; x=1774864209; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XNFnCKRlYseUEtoxCTko5eEC5pQQo7W92i+zQLuCE1k=;
        b=Z1EnM2SanCMsKWPIoXhtMeS0KJwZGcqLpMXWhQiqQOCVBHSgYDQUooC9YqXDKovrFj
         v8ULa6U6wKqNHFwRc+U8wdzRYYdqrvd5VG3cEsjny7Dxo7UjbJWxRw3Kd4Sn68R5ewng
         4IxEYbIuc9M5Jh82zE5ITx0ab4Se1+Z/yVwhhtDakyMtM9gIEUcLacdxin2OPdqa3Y9K
         Vu0WeQrU7z5DpXjBTWN7gas8D/ZTSwQhxic7KtQabqVDCVGTROD8wltFSZGpV4ckMkQs
         9gl8C7cBh7YHphKhXFMtBuhKfrLhILH8fecf3ux4zeCWsUurmcZMS3xBUn2GdW+ScKiS
         dYMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774259409; x=1774864209;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XNFnCKRlYseUEtoxCTko5eEC5pQQo7W92i+zQLuCE1k=;
        b=pnx1fI3su+MtvPbnejIhfS6IvZrcGqXMXFRnkvFZllU8KareJu9krAFTswxEC7VJst
         +E4wnZDOiv8PjtAieiLjEMJ3PwCivslrzA6I+gQmypSmY4FlluD4UEe/hTskcFszIg+Z
         /xqtDzdZPpySws6UZThM9SnFYCMD/Qc3end40PNnuqfPIjV/PDzw6cJsSU8zos/LGmv1
         dwiC5SNAUwRG3MIkcok96ciDqzPavXiDe18vt89098VQ3vSnDSlYeRQLe5rXwc1cBMTx
         VbFC0plMFwykmzVBPADskBdIjJC8/9FWq+s++e14vCt5L1yvq7sEoh1x3JvjtVxdUJFX
         S05A==
X-Forwarded-Encrypted: i=1; AJvYcCWdWH1gyvgNiPaofXS3GI47qa26Uw7SUAvgxUe5GNTIkoiO6DITSAa1UyivqWmi4r6GSetFK5u1t5SaCoj2@vger.kernel.org
X-Gm-Message-State: AOJu0YxDXwtiBneCcOEcQmhOVkkK55/3G1Bjnp2xoNgHKkElbCgJqHRP
	8h0J8cS5YhWq8y27qUTxTGnzSw8ZaDYF1pZHk6zK4+pVw4nEGTQpo5e+XaZ1KOHIZwUpKWw/2aX
	dE+F5Sm9HxMAl9mXbS3/j6imjJYD32wLtzjnIkz+Vc8HbJoQfDpXF9lggyfQg+VgzvH/Z
X-Gm-Gg: ATEYQzwaIN0uxHD/36/irAl77nV/0UvpSv1zhCSQMaj4+hZgCs7hnk9BdthUXQyaIXB
	M/XC7AbbX2qIId5cMj7nJtQ1Hi9J+14fJCA+p0CqVBMu08oUowmBXK+zbSrGrUZrsjqEpiYOur0
	e2OmFFyUnRBFKY4zzZvO3JcbQ1olB2YlYZHoG9lF1iz8PdZRpiYOjLvnH4b52otnCQ7fvizQlYU
	IFGIXvYfza7K0pcJW6n9btA9SWdBmO9cCPwJmj2NheGSG+8sPX14lTK7hErFVig7vUZkWdqL21M
	awcOQu6kk7BQJ/aW0i/tN1DqD8OtpgIpUwOzkUXXsx7Yo53hdDcu9GnfaLJtAXViguEi+KhVUgc
	khxYqu+SJIGy0wQ8AwYCgJTGiwrsUtBCNzoonJMxqhLwMlMo2mP4YT7Y+ffdEW2kj50HjvvwvdB
	xC9XtEdsGF
X-Received: by 2002:a17:90b:510b:b0:35a:1b43:dff1 with SMTP id 98e67ed59e1d1-35bd2bf7926mr9813875a91.12.1774259409074;
        Mon, 23 Mar 2026 02:50:09 -0700 (PDT)
X-Received: by 2002:a17:90b:510b:b0:35a:1b43:dff1 with SMTP id 98e67ed59e1d1-35bd2bf7926mr9813857a91.12.1774259408597;
        Mon, 23 Mar 2026 02:50:08 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c743a939af0sm6591935a12.16.2026.03.23.02.50.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 02:50:08 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 17:49:29 +0800
Subject: [PATCH v16 4/7] coresight: etr: add a new function to retrieve the
 CTCU device
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-enable-byte-cntr-for-ctcu-v16-4-7a413d211b8d@oss.qualcomm.com>
References: <20260323-enable-byte-cntr-for-ctcu-v16-0-7a413d211b8d@oss.qualcomm.com>
In-Reply-To: <20260323-enable-byte-cntr-for-ctcu-v16-0-7a413d211b8d@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774259384; l=2348;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=QjBBWW3nZNJQ7dW86dG4Ar+IGXRSYDsLrfUfjlg4xNQ=;
 b=/ND2nS44mbInVi4eNYBq/svnHomprXsHoRCmcKSXJZJjvVzmC7pJzBR0bMBaeQMxxQlzQqux1
 UeemwW4IB24AXbcIycNxDxrs8HgNvFJRGYIm+DAEvI3VmliTw9r+tCV
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-GUID: MZYWJ2jENutVifNaTvSi72ZVmrkkv_Lu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA3NSBTYWx0ZWRfX+OiU7mJY+Z9T
 jM1SMs/FGUSVGeZsGplMlwl0l18OCgMy+nHd/w8/iWSKihaW67Fqc4Od3pUiFwpiPeYQaIAQ0D4
 7dHeXBkgTn2vEqye+3MnoV5JSrAk3jII7oItfWPcr8oB3Gv5Mu97xbWq68nxBXVHZQsL8CFu3MW
 xpIs0G5pzl70MBrFGhqalRH97eYwGguD7fLERjsLDMhDvvhBnuYHXtblfGEepSgyOZFRTkhHMld
 nxbPR2TM+c3nuhdv6nvLGE9199AB0vq71OBjlmhTKsibfLOxRfM+j8ORB6AphW4Y6hgrYuySS4N
 mDeLbQ2iVJ15/lAkyrRZJPJRyIUsdR9VQqM62jDWpnWw9DWQAyHCR3YteQnEifjCqd/q982ye52
 OVEYpnZrX7eGgxTnOKQQAB9dAXwZeXXhc1tqctl4VUQcta/3L1PxVMzIpBxBqVnsQBIBmSI0Tsg
 lMvi6EzL51eYGwzNWDw==
X-Authority-Analysis: v=2.4 cv=CMInnBrD c=1 sm=1 tr=0 ts=69c10cd1 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=FuIWbRVyn4pKkvqW11oA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: MZYWJ2jENutVifNaTvSi72ZVmrkkv_Lu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230075
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99168-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 184622EF777
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add tmc_etr_get_ctcu_device function to find the ptr of the
coresight_device of the CTCU device if the CTCU device is connected to
the TMC ETR device.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tmc-etr.c | 24 ++++++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tmc.h     |  1 +
 2 files changed, 25 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index 306982e88dbb..d4a99c77dd90 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -865,6 +865,30 @@ tmc_etr_get_catu_device(struct tmc_drvdata *drvdata)
 }
 EXPORT_SYMBOL_GPL(tmc_etr_get_catu_device);
 
+/*
+ * TMC ETR could be connected to a CTCU device, which can provide ATID filter
+ * and byte-cntr service. This is represented by the output port of the TMC
+ * (ETR) connected to the input port of the CTCU.
+ *
+ * Returns	: coresight_device ptr for the CTCU device if a CTCU is found.
+ *		: NULL otherwise.
+ */
+struct coresight_device *
+tmc_etr_get_ctcu_device(struct tmc_drvdata *drvdata)
+{
+	struct coresight_device *etr = drvdata->csdev;
+	union coresight_dev_subtype ctcu_subtype = {
+		.helper_subtype = CORESIGHT_DEV_SUBTYPE_HELPER_CTCU
+	};
+
+	if (!IS_ENABLED(CONFIG_CORESIGHT_CTCU))
+		return NULL;
+
+	return coresight_find_output_type(etr->pdata, CORESIGHT_DEV_TYPE_HELPER,
+					  ctcu_subtype);
+}
+EXPORT_SYMBOL_GPL(tmc_etr_get_ctcu_device);
+
 static const struct etr_buf_operations *etr_buf_ops[] = {
 	[ETR_MODE_FLAT] = &etr_flat_buf_ops,
 	[ETR_MODE_ETR_SG] = &etr_sg_buf_ops,
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index a14645b04624..fbb015079872 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -470,6 +470,7 @@ static inline uint32_t find_crash_tracedata_crc(struct tmc_drvdata *drvdata,
 }
 
 struct coresight_device *tmc_etr_get_catu_device(struct tmc_drvdata *drvdata);
+struct coresight_device *tmc_etr_get_ctcu_device(struct tmc_drvdata *drvdata);
 
 void tmc_etr_set_catu_ops(const struct etr_buf_operations *catu);
 void tmc_etr_remove_catu_ops(void);

-- 
2.34.1


