Return-Path: <linux-arm-msm+bounces-92586-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kPHzIPhLjGmukgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92586-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 10:29:28 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F2682122BC7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 10:29:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CDCD33082EFF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 09:28:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AB063559E6;
	Wed, 11 Feb 2026 09:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hKB5AI45";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EOZBP/MZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25162355816
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Feb 2026 09:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770802091; cv=none; b=Es841inHbRkfdTfO0fsHid0aNH1VANtigrpFlrINRifccDPK5uBhRwsE7z7rs/EV13y1ZEe6/Ox05D6GL824/yy1FaduuQBeEGPhafIui1oFERYWjsR/yy3PjeBcSFkpZ5kNscVSkNuVxqQp6uNDyDoyrWKbFLJum0JEE47wBQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770802091; c=relaxed/simple;
	bh=Ux46ooQNG2N0IqXAB0C7HAKk8IgkHoiiBz6dDkqTiqw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=RcnhJmet+Z4YhKCVrPEYyX9KPUWus+Gr+QD7g/ezHp4WoGzrR+BVTYhoBwAZNWJL8AOsikSp8pY14N9ePW3DYl02IYT1ixDPaxBz5+lTB6ry9c9c1hHrQTTgM9m1DXWiqxUpdHpOUWoDCAtERMSl/d2pI7W66J/jUGeGHG7AoCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hKB5AI45; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EOZBP/MZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61B3cRJN837941
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Feb 2026 09:28:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=T1k8cXYpRbX9I1IUe7Z1Ib
	ViSZcj6JbLFth/vF0xRP8=; b=hKB5AI45fWtTyK2LidM6yRqcvjabI/Dybx6E10
	LobahJIv/r0I98osWJmXGDzaRKKePsOPMk8+I3Cq3hDtRKkPi5l5kKr2brgQHFl1
	rg/yWXHfq+ROfgdRqqUa6Ha02xnyeQ6UG1tDKRWw1loPOwQsKeH+ptHXju0BAG4n
	L8rMpiI/NHxWNQ5VkBGunOpnKvLp+8o5YJehV9UhHnc2ZDDxtEvPprcatpM/G3O9
	FGIv+DVbnX+/fo7X7Nt0xoB7AQWFhCl5gX9e3U30+ESBivcCGlvutM67gN1mkqeQ
	traEyX9ORNcsgvnmldRkY3qq0BPnRui4G5Aj/9O+EfBu69vg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c8j1t8ytu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Feb 2026 09:28:09 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5032e68560dso182921841cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Feb 2026 01:28:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770802088; x=1771406888; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=T1k8cXYpRbX9I1IUe7Z1IbViSZcj6JbLFth/vF0xRP8=;
        b=EOZBP/MZdhNhp1pevzsz90Xn1ps+h5RRne681UFtri+9hUYKHenAZQKDBQjOdtccHQ
         A169FNC9j0DeZM/PmXRULh0492yziLMp2PjmtMnxl3PqwRJGzvn9Z4NUlZwiOIsaabux
         9ON/p0O2C4wKU6fR5wQhiJRCwHXjKhAjkSD2qaLl+tp/kJ5k+EBLYsM+bvbbzj1NTsDL
         JYUT4Qev4F5wo5P2gQuEnwuscNAZH/uoJ5fbeQIVkmlwCxyLzy/fKp8uVnoKkcrE4PSG
         TA/weEHtI8OQz4pvl9e0MCiLKLlRWMGshzqiBd5fAmHFOIflcLL4aXBYj12rWLu5NZl0
         izZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770802088; x=1771406888;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T1k8cXYpRbX9I1IUe7Z1IbViSZcj6JbLFth/vF0xRP8=;
        b=VNOsHvHSLvogefQ4IN0yZj8PJfdL4EsPq/S5DWjcLzJvsR9H85cTz4pXhn4isy0EPo
         riIiItMvGStqoqqy54ue+4IleRWbREkHSHFYBysr0zRh/oVCV1KM9IQ4wLCBBwXH0y4z
         nsZ/+Nqg21mhtb+KC83H4ywmJG9y9i3SAF6ava3Oh8pSJqCIKuaOrn1ox2iJl0jRf0SA
         Yv3IvQYXx/YKIfOcYV3mtdORne/aa8YSXV7TG9mw1ZODP+XloyQBpLAml4t9+JqmV2vP
         y0+HQGAuCwmZ31rRhSym+1/rzoSbTpurm+TpOp8dzcxVax6eoG9IbAQyH//SKtBGdl22
         bGbA==
X-Gm-Message-State: AOJu0Yz4L/Wz+5XPidwRnrzo8bmdprLhno268x2Y00UeyZzlYr1xeX74
	72pYUQlqh1pxZ5p1QmmGlvCh/nfoF0iYVlfx0HQCBuL5jEVVQ0aLqIdUp09TPcyTU03PfVmW589
	Ohhgqrg7v3d7LJs1D8iuNwf9zHVqkszeCMQ5z+UVkf0L2K+mwuxuZw+FhpMkn3toO2oHd
X-Gm-Gg: AZuq6aJMkuD07Cdl8H1us/P7KLSsRhW3k71NE0aGoTs2W2qmmbJJ02xhUOU3R4+dtUm
	OpHQjgGChNv7fEmOqxjDtCiFoB4ZfMnRQ8BGU0u7kaWlOB3J+wvmd31aENJlxwWSJ94jRVmPcWC
	ADHBG4zGzOETGOPTVtQfKEd//W+e4ci5dbNEaAGJUIKUC69pp8WgPk1JAmCTa/VwgU1varMOMJ1
	KNJ2CWqh6jNmUc390IsC/WBcG8wjGFm36Dv842rTZHK4j+46skzLw0hE1QXS/BA+/hs1QRVdVGS
	EsIlp1jWuez0sYkimQD1/Ticpn8YG8dbRsurOPY292BCRG7BsJxnqGhCljROEnX9UzgyE7yyYEZ
	rninkebmsG1bLCKDJTs5IcSH3/CTb4RDdW/pOp0lqtGAXIyjQH8zaJ1FByTL2BT5UnwacNB9uB7
	F7NxFTYK/xicXZf/BQYyu2LxQYBRKnSF0JWCY=
X-Received: by 2002:a05:622a:454:b0:4ff:c17f:726 with SMTP id d75a77b69052e-5068101e3cbmr23666621cf.15.1770802088195;
        Wed, 11 Feb 2026 01:28:08 -0800 (PST)
X-Received: by 2002:a05:622a:454:b0:4ff:c17f:726 with SMTP id d75a77b69052e-5068101e3cbmr23666411cf.15.1770802087728;
        Wed, 11 Feb 2026 01:28:07 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e5f568737sm223639e87.21.2026.02.11.01.28.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 01:28:07 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 11 Feb 2026 11:28:06 +0200
Subject: [PATCH] arm64: dts: qcom: qrb2210-arduino-imola: describe DSI / DP
 bridge
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260211-uno-q-anx7625-v1-1-677bbcf63668@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAKVLjGkC/x3MQQqAIBBA0avIrBvQiSy6SrSQGms2VkoRiHdPW
 r7F/xkSR+EEo8oQ+ZEkR6gwjYJld2FjlLUaSJPVZAze4cALXXh7Sx2S9YN3Q2v14qA2Z2Qv7/+
 b5lI+RGQK4F8AAAA=
X-Change-ID: 20260211-uno-q-anx7625-26f8fa8360ca
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Riccardo Mereu <r.mereu@arduino.cc>,
        Martino Facchin <m.facchin@arduino.cc>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4674;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Ux46ooQNG2N0IqXAB0C7HAKk8IgkHoiiBz6dDkqTiqw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpjEumC+Ln8FYy5BH3cY+7BZGb8ttr7k7r6jWVB
 wdDA1jrQsCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaYxLpgAKCRCLPIo+Aiko
 1e09B/0Z4YDCkhpuR5x7taYl8K1lFufphgP9SaL55RScgIELmxO89E8aoQs3Y3vt56J2b++lWFZ
 xUIaMvmXrJ5Fl8hxVS2VvB233mZFpfqqodOw9gMbP5GXMzjOu66YZVqX+jZBiLBZ89L8mNEgBeO
 SlkoUsFlcZOwPpQLZiV3GBTMLgKrrth+exCo39rxpXbJBc1PTeuNekeoPgdgBp1vcqeU3A97fRZ
 8fjrewulRu9OkDAT8fhFihqTjEYBtZx+evq4auMpivyxveQbmjAM8BnSmh3e6ls6Hj9BFjUynRC
 WLXYwOwm62BSACvl8k3fhe4WSQhxBgNikjgO6mxYTuoUjpxD
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjExMDA3NyBTYWx0ZWRfX+GJoMKsyXypW
 rFtQsMBRIFwF9DWL5dIIbcMbeTDEnGn8WvQBuXIC0PXmxIeqtNgwBjtL6+HTZcqZVb7LIo0EjDg
 Z0eV8nE/c8pJnhBQJ1lE41sUUc0NNF7qMj8z1i4gHzmeUgmHI83kQttHWOGXOO6ht+Q39MQiS2k
 QbfN6dZjc92CBuq1Nn3hLpN9qWWvdkgbzGEJVlwceiw/o2CEmzEqj35MwiDqyM6O5ob8oR76K7c
 LDK0duEmHcQQgpO6V47Di/KGVaGk+59ZB9D5pw+725k+W41Ppm/3EPoqUawN7PZDE/rwLMclCZC
 QXm8gc97dpwgQX/YATLpQkI3nDR+/rk6hbE/OY3zTIPldwLTC3DAWXWsEiGDxYnHE/p0YBCa9Dv
 5lbB138IjvbxeD1GC2ALHI8Ddzjf9K2XPYpnophKuySoGval5e+sML1Z0iJ+ewmOsTMBze0n3Tf
 hf++GtsODfPi70pHYXw==
X-Proofpoint-ORIG-GUID: Yd4Fgxo86WkiqmheCX6uypHikVBunwN5
X-Authority-Analysis: v=2.4 cv=cabfb3DM c=1 sm=1 tr=0 ts=698c4ba9 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=BI8rhESxQhY5hPGjgb8A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: Yd4Fgxo86WkiqmheCX6uypHikVBunwN5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-10_03,2026-02-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602110077
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-92586-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+]
X-Rspamd-Queue-Id: F2682122BC7
X-Rspamd-Action: no action

Aruino Uno-Q uses Analogix ANX7625 DSI-to-DP bridge to convert DSI
signals to the connected USB-C DisplayPort dongles. Decribe the chip,
USB-C connector and routing of USB and display signals.

Co-developed-by: Martino Facchin <m.facchin@arduino.cc>
Signed-off-by: Martino Facchin <m.facchin@arduino.cc>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Note, to function correctly this patch depends on several patch series,
fixing the ANX7625 driver:

- https://lore.kernel.org/r/20251218151307.95491-1-loic.poulain@oss.qualcomm.com/
  (part of 7.0-rc1)

- https://lore.kernel.org/r/20260121-anx7625-typec-v2-0-d14f31256a17@oss.qualcomm.com/
  (part of drm-misc-next, to be landed in 7.1)

- https://lore.kernel.org/r/20260211-anx7625-fix-pd-v1-1-1dd31451b06f@oss.qualcomm.com/
  (recently submitted, hopefully to land in 7.1)
---
 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts | 112 +++++++++++++++++++++
 1 file changed, 112 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
index 197ab6eb1666..ba3f0c74e814 100644
--- a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
+++ b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
@@ -6,6 +6,7 @@
 /dts-v1/;
 
 #include <dt-bindings/leds/common.h>
+#include <dt-bindings/usb/pd.h>
 #include "agatti.dtsi"
 #include "pm4125.dtsi"
 
@@ -109,6 +110,16 @@ multi-led {
 		leds = <&ledr>, <&ledg>, <&ledb>;
 	};
 
+	vreg_anx_30: regulator-anx-30 {
+		/* ANX7625 VDD3 */
+		compatible = "regulator-fixed";
+		regulator-name = "anx30";
+		regulator-min-microvolt = <3000000>;
+		regulator-max-microvolt = <3000000>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
 	/* PM4125 charger out, supplied by VBAT */
 	vph_pwr: regulator-vph-pwr {
 		compatible = "regulator-fixed";
@@ -142,6 +153,83 @@ &i2c1 {
 	clock-frequency = <100000>;
 
 	status = "okay";
+
+	anx7625: encoder@58 {
+		compatible = "analogix,anx7625";
+		reg = <0x58>;
+		interrupts-extended = <&tlmm 81 IRQ_TYPE_EDGE_FALLING>;
+		vdd10-supply = <&pm4125_l11>;
+		vdd18-supply = <&pm4125_l15>;
+		vdd33-supply = <&vreg_anx_30>;
+		analogix,audio-enable;
+		analogix,lane0-swing = /bits/ 8 <0x14 0x54 0x64 0x74>;
+		analogix,lane1-swing = /bits/ 8 <0x14 0x54 0x64 0x74>;
+
+		pinctrl-0 = <&anx7625_int_pin>, <&anx7625_cable_det_pin>;
+
+		connector {
+			compatible = "usb-c-connector";
+			power-role = "sink";
+			data-role = "dual";
+			try-power-role = "sink";
+
+			pd-revision = /bits/ 8 <0x03 0x00 0x00 0x00>;
+			op-sink-microwatt = <15000000>;
+			sink-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)
+				     PDO_VAR(5000, 20000, 3000)>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					anx_hs_in: endpoint {
+						remote-endpoint = <&usb_dwc3_hs>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					anx_ss_in: endpoint {
+						remote-endpoint = <&usb_qmpphy_out>;
+					};
+				};
+			};
+		};
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				anx_dsi0_in: endpoint {
+					remote-endpoint = <&mdss_dsi0_out>;
+					data-lanes = <0 1 2 3>;
+				};
+			};
+		};
+	};
+};
+
+&mdss {
+	status = "okay";
+};
+
+&mdss_dsi0 {
+	vdda-supply = <&pm4125_l5>;
+
+	status = "okay";
+};
+
+&mdss_dsi0_out {
+	remote-endpoint = <&anx_dsi0_in>;
+	data-lanes = <0 1 2 3>;
+};
+
+&mdss_dsi0_phy {
+	status = "okay";
 };
 
 &pm4125_vbus {
@@ -361,6 +449,22 @@ key_vold_n: key-vold-n-state {
 		output-disable;
 	};
 
+	anx7625_cable_det_pin: anx7625-cable-det-pins-state {
+		pins = "gpio46";
+		function = "gpio";
+		drive-strength = <16>;
+		output-disable;
+		bias-pull-up;
+	};
+
+	anx7625_int_pin: anx7625-int-pins-state {
+		pins = "gpio81";
+		function = "gpio";
+		drive-strength = <16>;
+		output-disable;
+		bias-pull-up;
+	};
+
 	key_volp_n: key-volp-n-state {
 		pins = "gpio96";
 		function = "gpio";
@@ -428,6 +532,10 @@ &usb {
 	status = "okay";
 };
 
+&usb_dwc3_hs {
+	remote-endpoint = <&anx_hs_in>;
+};
+
 &usb_hsphy {
 	vdd-supply = <&pm4125_l12>;
 	vdda-pll-supply = <&pm4125_l13>;
@@ -443,6 +551,10 @@ &usb_qmpphy {
 	status = "okay";
 };
 
+&usb_qmpphy_out {
+	remote-endpoint = <&anx_ss_in>;
+};
+
 &wifi {
 	vdd-0.8-cx-mx-supply = <&pm4125_l7>;
 	vdd-1.8-xo-supply = <&pm4125_l13>;

---
base-commit: 9845cf73f7db6094c0d8419d6adb848028f4a921
change-id: 20260211-uno-q-anx7625-26f8fa8360ca

Best regards,
-- 
With best wishes
Dmitry


