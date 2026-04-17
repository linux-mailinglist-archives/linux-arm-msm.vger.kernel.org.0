Return-Path: <linux-arm-msm+bounces-103463-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GEaGNDWv4WkdwwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103463-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 05:55:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 40596416BB4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 05:55:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4F100304A89E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 03:55:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B64034A76A;
	Fri, 17 Apr 2026 03:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZU5Bky0C";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ettYgNX1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADEFC35AC3E
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 03:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776398124; cv=none; b=G5ipg1rHTxZugNmB7/YdCUUk09/zUocBipU0eRxmDu3sEbGPqCB0tVpzKv82ELiHIpjadw/ieyg7vlgcdEtdWcoHDhoVCOJB9iSFmCgiTh5adNHJcoOa60flemTveKh0qgLADXGMeYbA6sTg0Ld43xjrV6nWE6W5s32VH0PGYKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776398124; c=relaxed/simple;
	bh=l0yZLsEgIRPjDTfZa1yjVfDSyWf2p4Bfx6yeIS2DUNk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Pizldb3F3zAInf9gV++EkP6b9z6U3UGtEt2MYSknmzX0DOi6wSZA+F/6cCFasFSqY/tGAfZ2fF64gK9odol0hMYpEUexa7Jmbuz2DMV7AZK7X6To8D9/9aZmWlu/xovAd4LHB73VXRzNzXBERpZnrhWXAmTop+y7PqPQpKrfDrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZU5Bky0C; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ettYgNX1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63H0fr7p1981949
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 03:55:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=wcY2sPb5D7rBKuWZgqOBEYVfgO4axjaKd8I
	UqhrZB0E=; b=ZU5Bky0Cfb0Ci8LMYNCyKEtIZSH1eHBZvfAYMwIiACtcZXGruJu
	Ij6DHgmjyTqu7vfOo6TOy8zMCXryl5TZDgUs57wqc1qrRdzQaQU+K8ecRlF//KMz
	NZ3HHaWK0A+Hr19w9qZr+Xz5RmYxqjuq4q4LKNC4FmLAK1T8PAUY0fR1C6Zl6GGm
	wybMkUdZAmRMLf93r2cXUvPBFuGvzNwwXmpp8lolEzPePOhcaL6YJfIQTJXAUAAh
	TG32ybsA7D+rkxpWjNeeiWPwWToH+ktJm8yJppdkDEKwcypjJbHMfm0ogLUkx41n
	zzO6rHtOlkBwAQ2HEZA6AjwRDQpq98yueHA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dk52jhfnd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 03:55:21 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2c0f6593ef5so247416eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 20:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776398121; x=1777002921; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wcY2sPb5D7rBKuWZgqOBEYVfgO4axjaKd8IUqhrZB0E=;
        b=ettYgNX1X2+iECPqzHl7YHqFPSyxxdLRwYgk8GyuqTaF11lB8N5f/nf+z9jiINtdaX
         2uXiS5jo4Y2twohMEgtqLwclsJaI1QhWu/jkrJ5Rq77YoBjeS11wQW9erwhC187+yym1
         zpnszsqHBhFoOMwzjP78fizX+FQEO9Mtwf4jYf8/n5c9NJdmAJU+nUSdBILD+l4pg8iM
         Rv9pPFc0HiAt/gbPdp8yOsRM5n/DrtnAkN8UAFf7H6YdOu+bb3usFSf59U/d6GmL7tdd
         oKZNpd/r6fpd/TxKGIw/inoUGNR1e5l0gBfqAXt0QjyALg1TWb//9ycPjJlsJNpqvCQL
         OnqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776398121; x=1777002921;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wcY2sPb5D7rBKuWZgqOBEYVfgO4axjaKd8IUqhrZB0E=;
        b=f/LAE5nU2TCqxMu+srILt/dscZfNAJ3TRNBAanGZTzOHwWU8wCT/WE11e3eEwGZ0Le
         xWdeGdZ56sUlX3wsEcvXciLvv0N1SZLFLk+rTWeOYBCVEC4Yyo6I1fpHv+oUUDgrKGT5
         fhKuMi/Qr91II4MVHH6ahc67NxFh5RxKdLBzJQm7bL7XmL60w1is0dcmgzAyQ1FELzNZ
         oMoTp2wQJA74aFsqmSS9rYT8gBuROzZ9v29THTL1JE4h6jLz0mRDlwqnr5++dw5jTft0
         Wa/O9L/JV2MVqG61U79qXnR9U2UDXpdG37RemQ7R7kJ3qWsFF3RMe98J5gvrgZw9jq20
         5jIQ==
X-Forwarded-Encrypted: i=1; AFNElJ+Y/OWKxnRjoPExgZaq0vhGuhVbz5qWQvGEQ1o+M7YPZLjNKCnGdxWw9ss4/GnPfQjhAYUCx3QRMCnEyT57@vger.kernel.org
X-Gm-Message-State: AOJu0YzLeeFyeJzi/0awLKI3nOnGFOfAsKznpXF2hO3cdfvQroOTT74t
	g4ubq3K6f58Z4Ux7HY/c/gU9akvT7m3ChYAHS6Ty2fbb8aI9yVXbC2f0S1+Dz9LCn7Ael4o6Wy7
	xBYL+ci5mOOFxNEkHw2s8BhALfBq8MZNMXB6b71HmFwSQBbHsWxaEfBUMsRGDkALMby/R
X-Gm-Gg: AeBDietHSiVpOAdfkK7SJZcBOh8Hf1FU3PGD7EugBmXdkenytzxFjrQQocJ+gd/lm1u
	vUiZEZGaxVvxd9pCf1AJdqbUeZCltzREZ9is08mjE/2GbK9Lqdq0fkE+BVtjfpHBVUgTnEMJLeY
	Ae9nazPUod/4QUx4SBs/J9ajcuF7byDmrZRGo4bflsiggXbd+5mVdea15YQ7A/vXtE5NUYMF+Ln
	nVpxqrMhIg1gxyKr1iN+gW4/vWJJbQ2YITtrYn1psdd3pxgCPnEbBZKZ+/gZIqbgXtXoBPhQDfW
	0TGaOdUqtksg9UraJenZ/s5K9+4zpaoojg9EtXR/spSD3z1+YBfjeixzx2FlCHd/Cm++/zGk/ct
	Mt7TR4ns3tyHibUUNXjooZDGtEr0TmELEf/Z6+h6vqfT4yMTRjrAR60Y/d3ldZATW1/jYTltFc2
	EZ5yUxsoCizuwsm9ck
X-Received: by 2002:a05:7300:dc05:b0:2c0:bfe3:b95c with SMTP id 5a478bee46e88-2e466044086mr408568eec.4.1776398121077;
        Thu, 16 Apr 2026 20:55:21 -0700 (PDT)
X-Received: by 2002:a05:7300:dc05:b0:2c0:bfe3:b95c with SMTP id 5a478bee46e88-2e466044086mr408551eec.4.1776398120364;
        Thu, 16 Apr 2026 20:55:20 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53a4a8bd2sm571585eec.11.2026.04.16.20.55.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 20:55:19 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH] arm64: defconfig: Enable Qualcomm UFS and QMP UFS PHY drivers as built-in
Date: Fri, 17 Apr 2026 11:55:09 +0800
Message-ID: <20260417035509.1021860-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=buR8wkai c=1 sm=1 tr=0 ts=69e1af29 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=MTWLzke8cICU6Z_Q6AUA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: jOmKDVwEQZo802N46V1jDnaREvFg0qDK
X-Proofpoint-ORIG-GUID: jOmKDVwEQZo802N46V1jDnaREvFg0qDK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDAzNSBTYWx0ZWRfX0jiIGRjewmZM
 jhFoAC6kfX0xOg1BujA7yiXziCwITaZ2g/AgiTokKTFWMVVloxoy3JfmR/UBhSmG7ol+0WcHCZ1
 A5e88Ly/fjz5obib5DybdYPpcsjYk1/1fwnfnZ8oeUSuh+eYywcvJ7DmqYsYmB4VbRsui83pR9+
 UFZRSzXhnObjdRCM4rgUc6n6itmU4bh4vLI0rdeiZ/AciXic5PhyIkxFN7dyLjz8B6XYedwSe8d
 /ckmpbIqW2H049aXUUmXnd79IoaA14F/P4UCGz7v0piu3s+GnN/DYXC8u1z0w81qVZyInfcpvwV
 Nejp/+M2oXgT4KmqedW2Vb1Oxm508+hd1GefDMS1Gy0HQphGIR17lsgbiSVVGj/MXZk0svUwvrn
 vxPfdBpMojdomxhsRKFY+Jp5TmKvT9zKd4Hwi6llOnGlmImGJKYDT5jRe2YX2Hur92gdcu7jFyW
 P3GTpF9avK1E17akqLw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_04,2026-04-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604170035
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103463-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-0.999];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 40596416BB4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

UFS is the primary storage for Linux rootfs across the breadth of
Qualcomm development boards - Mobile, Automotive and IoT.  With
Qualcomm UFS host controller driver (SCSI_UFS_QCOM) and the UFS PHY
driver (PHY_QCOM_QMP_UFS) as modules, developers need an initramfs
to boot from UFS, which adds friction to daily development workflows.
Promote both to built-in to allow booting directly from UFS without
an initramfs.

PHY_QCOM_QMP is a menuconfig umbrella for all Qualcomm QMP PHY drivers.
Setting it to built-in is required to allow any of its sub-drivers to be
built-in.  Since only the UFS PHY (PHY_QCOM_QMP_UFS) needs to be
built-in for the rootfs use case, the PCIe and USB sub-drivers
(PHY_QCOM_QMP_PCIE, PHY_QCOM_QMP_PCIE_8996, PHY_QCOM_QMP_USB) are
explicitly set to module to avoid unnecessarily inflating the kernel
image.  The combo PHY sub-driver (PHY_QCOM_QMP_COMBO) is naturally
capped at module by its dependencies on TYPEC=m and DRM=m.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index dd1ac01ee29b..f6ac2d29cbdf 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1316,7 +1316,7 @@ CONFIG_SCSI_UFSHCD=y
 CONFIG_SCSI_UFS_BSG=y
 CONFIG_SCSI_UFSHCD_PLATFORM=y
 CONFIG_SCSI_UFS_CDNS_PLATFORM=m
-CONFIG_SCSI_UFS_QCOM=m
+CONFIG_SCSI_UFS_QCOM=y
 CONFIG_SCSI_UFS_MEDIATEK=y
 CONFIG_SCSI_UFS_HISI=y
 CONFIG_SCSI_UFS_RENESAS=m
@@ -1783,7 +1783,10 @@ CONFIG_PHY_MTK_MIPI_DSI=m
 CONFIG_PHY_MTK_DP=m
 CONFIG_PHY_QCOM_EDP=m
 CONFIG_PHY_QCOM_PCIE2=m
-CONFIG_PHY_QCOM_QMP=m
+CONFIG_PHY_QCOM_QMP=y
+CONFIG_PHY_QCOM_QMP_PCIE=m
+CONFIG_PHY_QCOM_QMP_PCIE_8996=m
+CONFIG_PHY_QCOM_QMP_USB=m
 CONFIG_PHY_QCOM_QUSB2=m
 CONFIG_PHY_QCOM_EUSB2_REPEATER=m
 CONFIG_PHY_QCOM_M31_USB=m
-- 
2.43.0


