Return-Path: <linux-arm-msm+bounces-98083-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SKQiLUL/uGnpmwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98083-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 08:14:10 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3814B2A4A4C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 08:14:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AECFB301904D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 07:13:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 168D53876C6;
	Tue, 17 Mar 2026 07:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oI2OUfYX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VK9UIac9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE9513876AF
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 07:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773731620; cv=none; b=WR4pQzEsEkJ48Jp3n3TT2WO9WoPB7y0A6pI0C1C7pk5nAl6Nr4Gr6c7+WIxmxY9lcSxHSztgmLc9JNkvoGXz2DvKhRM0aCKVMfwsDSZA8hgy/YWaCnXxYzDwJbvURWmAf7mFSHEceHDXLzsrEY6wFrax2srqb5Ar0FgLV5cjOn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773731620; c=relaxed/simple;
	bh=rykuh589cHF6ffkdhGtne5zbDY7KWI8h8voNN5bHSM0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uJ+d5Zubgbz90GG0KFfwfKA38rCnZowC7zSDt9WEgOrytlQa4/xsH/Ptof/7g63LsodOP9912nhyeae44x83kIz8UiJQ74P1vqehTFc2J3SkJekHMNc6AEfpX4QMn1uKxqqdrS/DjSgeclnlClEP9Jd2qRbKeAvBJIeHRQL2feQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oI2OUfYX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VK9UIac9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62H1noQ73125457
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 07:13:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=khvzryLaYdR
	xeg7C76nDQrR5bNiYsv4r+Ubqg8Wo6aE=; b=oI2OUfYXosqiyUGUtDl7ZMOkIfY
	UBIi4kZN4wnqbkL3yzsQ3AY8BMegIaecHjqRYBE/Omf8mTA7JrtnbOUhwHvX3jbt
	08ujl2NnRVWe9gMa5GKJAEH1O1rQ/1Ov8STukkP0by721JU0q6RBhefGYD5Ya4q/
	ftly2Gj++zV9ioiGSh1pktc7Cn5CWQU86uJzJ2ZMpEjBkLTzEOjnLX3JmYsAk8W9
	gguxZqRxlB9M+Rf9+N4nKSiPZD+S/zEZR/wdkNrVWZH6hs63sCVY+hum8oGJKerB
	73OPxEhlHYy4HTaUoAElnjM9MpO/EEbMDNighJySJziax2BpsJ6z7ytPneA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxfsmkyb3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 07:13:38 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35b901d542bso19824483a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 00:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773731618; x=1774336418; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=khvzryLaYdRxeg7C76nDQrR5bNiYsv4r+Ubqg8Wo6aE=;
        b=VK9UIac9F4YvAwy/trv/tPlaoVMIsUeAEZcFgOk2TuT2pXehHrLtInH/j6dpG0X7CP
         gnmNIRkp1rWrFAQginFv8H5KXbs4/yF/jCoHQgX4CDxc5Xw8VGJRF8440mTxxmaF9A9K
         aZnCaQjaTdYPHRNFPCgqZBemhqpAYh8PNtiolPlo8W0Hqinn+6p3D3usczSRXJCrZA0h
         XYckb6JR+zwfUKO3c6RktiY9lrFVVWCc3ekOi2GDbSHL/INzh8hnfyeCjrMyTEu4Cx6L
         hoj7QcozEf6sZ9+aCUKVqMV3VQJIngvIFwnt4W9r3fONAlu33rLIVMUMLBACldsPJhVM
         mN4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773731618; x=1774336418;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=khvzryLaYdRxeg7C76nDQrR5bNiYsv4r+Ubqg8Wo6aE=;
        b=Cwax/szKPVqrmG/fPPR71zxILeavnEURfBULsj63okdDXvIe3OZazOkxTolHhXPfzO
         GnkiSrnGQWlnJvTU6lUBjES5kvy3xSHe3EUPpCwj+dQNP288Y4Pw/rNxqUOUjUKYVi78
         yHyHsbDDX4bvnsMmYcRfSKUUiXcX7XzXnTjGFTlVoJQYBixaM8dM6eBqOT5TOmnc9FJt
         LZ/SVnApzvejstwDMKu3A7plRmCraMVEpWk7etU/CNIwiL/9LPOS5JU4kGuG+hkutLcr
         S00L+0e9uukUcIOlJLMyKoGfPTYRnGtgckg5XpHilE+dA5p4A35HpKI1mIdfNdymnGDU
         V6Nw==
X-Gm-Message-State: AOJu0YwI4tPbZowwuLXAISZE8xKCFEX+Wcv/Fx/W2hfgAgSfhwH8zsqc
	QK4ThD3kOYS0Yjmo12bHdtIYKLMH3uoz5tQPqU0jbO3k3dUsxwoqBU4lqOM67OEHPtD4VtcX3QC
	bkoVIUrKB9Zglo8AU+q7hesYq1hrJVKvuZpUGZcDYyLOwv9Pw7gaG3fZ7a97in2+J8G34
X-Gm-Gg: ATEYQzzksXzOWJmz6uJ7Na6ORZAd+au8VIhDSA1Xs2kdDaz94K1ZhNgpZvZLdzYrQXd
	OTLcODMSiAP4Wto/6m3J8apTi0FxVke3/rdt3rEForFdxi7uDt2koTBVGz/HczMcSd1bW1EyOAl
	nenPRlKsHYuM/v0ehgaZzIpegKuOaG9BnUUDKVdY53dcVjUYJIev9jQpIKbNaKEG9TWjI5On+vJ
	YUnHUmBkf8KboMLGzgcIAxZSm8U1T4lfhc6+PnJBWNe1cYBUUcaI8pKdWbBHY3aWQBjb67iB+I1
	27kedWGwFh+3pnG9ac6itAbl28AT+tP3yIzA7+H1SKGXHy09PXobLNi+NVMaNf7mGw5RqXvSvxa
	ueLo17i7xd42q/prcTGUSuDut2YnGONDU48H7brZ3lJ9KIbl0rCloCE1udXALmWO+
X-Received: by 2002:a17:90b:5306:b0:359:ff8a:ee4f with SMTP id 98e67ed59e1d1-35a21e2fcedmr15130505a91.7.1773731617712;
        Tue, 17 Mar 2026 00:13:37 -0700 (PDT)
X-Received: by 2002:a17:90b:5306:b0:359:ff8a:ee4f with SMTP id 98e67ed59e1d1-35a21e2fcedmr15130486a91.7.1773731617253;
        Tue, 17 Mar 2026 00:13:37 -0700 (PDT)
Received: from hu-pragalla-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35b9d6fe68asm2563184a91.6.2026.03.17.00.13.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 00:13:36 -0700 (PDT)
From: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, mani@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, nitin.rawat@oss.qualcomm.com,
        Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
Subject: [PATCH 1/1] arm64: dts: qcom: purwa-iot-evk: Enable UFS
Date: Tue, 17 Mar 2026 12:43:11 +0530
Message-Id: <20260317071311.1696361-2-pradeep.pragallapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260317071311.1696361-1-pradeep.pragallapati@oss.qualcomm.com>
References: <20260317071311.1696361-1-pradeep.pragallapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDA2MSBTYWx0ZWRfXz/hTkXTbSl2f
 jRweFfFskbvJqxAP3pkbXakFMpnY6U/USKGRGIQ6ECoxeJzuLl/Nkr75j3fQ5UvLkbL53wfwX8Y
 cfGdI+fKp/AlFCtqJqqcC3vkXft44I6CCLqDu/2UwV2mC3IziiQt9PWQ8aCbxdSLKX6O1NG0hoK
 uc+l9fIPVGCeb9j2HWtNpU0itJBeNaxRPyP0Mj/i+HZgIoZeA13q2t1kmC7J9NoVuNorrkOKQRt
 ErMkyxznOMOpGdMK8HsiALvtabbo5shmUNJcAheMxV7bbz/+eAh+2LwBrust9UOgNkVT/n3lKek
 DybceO55nZf6teEeowkALQUgWLXSiUZ6zkNjzZpL5yCpdCz2KZz8s26QAtigEo5HyMmwZ1TtLkI
 nWyegYoioaswodoWijc3oPCv0RNOWFf7JsPFoO3mZPHNPH605nJTqODYM4AFUr6Z2NDDWM1Ytf6
 g2kml4iMltBweD/w/pw==
X-Proofpoint-GUID: NU3zNH9Lq6jhJRBilwazsxXnGHOZwJE6
X-Authority-Analysis: v=2.4 cv=V/hwEOni c=1 sm=1 tr=0 ts=69b8ff22 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=FwCcbryfLnLJMkbT1zkA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: NU3zNH9Lq6jhJRBilwazsxXnGHOZwJE6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-16_06,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 clxscore=1011 phishscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603170061
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98083-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pradeep.pragallapati@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3814B2A4A4C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Enable UFS for purwa-iot-evk board.

Signed-off-by: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/purwa-iot-evk.dts | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts b/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
index fe539b1f4567..e9cf56a415ac 100644
--- a/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
+++ b/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
@@ -1497,6 +1497,24 @@ &uart21 {
 	status = "okay";
 };
 
+&ufs_mem_phy {
+	vdda-phy-supply = <&vreg_l3i_0p8>;
+	vdda-pll-supply = <&vreg_l3e_1p2>;
+
+	status = "okay";
+};
+
+&ufs_mem_hc {
+	reset-gpios = <&tlmm 238 GPIO_ACTIVE_LOW>;
+
+	vcc-supply = <&vreg_l17b_2p5>;
+	vcc-max-microamp = <1300000>;
+	vccq-supply = <&vreg_l2i_1p2>;
+	vccq-max-microamp = <1200000>;
+
+	status = "okay";
+};
+
 &usb_1_ss0_dwc3_hs {
 	remote-endpoint = <&pmic_glink_ss0_hs_in>;
 };
-- 
2.34.1


