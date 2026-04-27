Return-Path: <linux-arm-msm+bounces-104688-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GCugJk8472mD+gAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104688-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 12:19:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD60470D62
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 12:19:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 178463044AAB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 10:06:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12E7F3B47D7;
	Mon, 27 Apr 2026 10:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BT3aUdX6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e+5hwD5l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AF943B6C02
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 10:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777284356; cv=none; b=TC+hZZkPdp4CeZCw33rDuDrHTVEgTzVAy65DZnL+PTBo3a/s/Kw3rVizJdRhRrDmlPIBlCkJ/ebHTVWgNAV8+1GhCrgmSHUfVHCUtKGveRJ7DJ+8STvOPY7TT3v3OyluNVDsDWMRpj57Ep0eDuVahgQHHqsixWznFi4VvCRUl7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777284356; c=relaxed/simple;
	bh=+E4tZfMlel36uwMhdXbJ+b8CyJSQUpcuObNpX2cZjj0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=klTJdQctPWMfneKTMuMNTFzeQwNbaruZ8bD6HJEwYFzCrYdROz79ezsg1VZfwFlPLBukQfmqds4dmq5iZ2TvBKQmk5x+Mbm/LTkHDCs9c8WtqZpN9auZQsnNAIiyBc5uMrHtIY/iPa8oioSxm9wqc+HG8iqLvzJNsLQ5eMm09kM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BT3aUdX6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e+5hwD5l; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R8T98q2913817
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 10:05:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XReiQn22kMCzGHeyxP3PcAro8SFN43+wajCGNcXyMl8=; b=BT3aUdX64cbdVWP7
	JOZkuEd8UF2XXrH8pF0AxWqQ20nWvVUQI63vVGT1kbcvPgjuHZCJowoUehvZ9oh+
	1qDQD9iHtPg/mBSSRsfjfYzBmNl9naIcJIH8xDCoP7m9zhg8S6CWMgFPnZPLOJud
	RrMMYV+dYZMxb/ox1OS5d13wVFMO6OlD77jiiJ4YCKhWVHXCFznORlw8mtG3yCw1
	OLUQ+s+ZUW4sR66oh4pHPHJp9WDJm8vFCm8vCDr8Pc4z7eWV60uMdXKX9ZGAKkVI
	GpOs4eTjzYEqxb6vZn/mCaDFdWgNTf5NDQ0pGv5wpUtICDBRIR3G8oLVzTl+Z0Ph
	XduikQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt26xgy6c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 10:05:53 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82f74f0e3c6so6582726b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 03:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777284353; x=1777889153; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XReiQn22kMCzGHeyxP3PcAro8SFN43+wajCGNcXyMl8=;
        b=e+5hwD5lgsL5steTkh+1XjBj76V4k92ZywC/FASZXV9rjwUSUTC5hbEOfcHjjNqoC5
         Tx/P9/wMcTinmek1s9J7OF2iH1iM7nTk5yI3A3s6SE1ibpD0Z3GOeuIOgcOSyDV7FfDa
         rY+HrYXNoSKcVOE80nWw5nwfdemjBQV9VpJf5RiMoF0+D8+jL6VrD97Ixktqt+B6/Znn
         PA+TbymCqxExrGSM8lNAhEQaryR6zoCJDwR3VTQ7lYdFL9EgqziO6WJP+d/vYjyUjQpw
         PmUwrFxqplBg69blvKzT2BtECXNg5cYkHSg2GObRjyqh7if1EZWZnE/Se+Js9s8ezsSw
         +tLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777284353; x=1777889153;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XReiQn22kMCzGHeyxP3PcAro8SFN43+wajCGNcXyMl8=;
        b=PGw/SQnRp/Kdk64Exy96DwR9IrCsRQBaSyKYjzsAIo3k+oATOYZ+NuTYEG5yP5Skv6
         e/ZiaxI0UVoE9bTsxF/DJhXJaQ1xdV/pGDOZE0iDd5gtCMHW6Q0usmEDZ8AxjpwuKqTb
         lPIIAgQGih+hgL/nMlyIH7dp+Dx50MWFLfD9IeZ47XncBfsyhl7qIesBa+X10S4v5u2b
         DE0AWBnU7DGDycakinzthZ//UG0SVp1USTe/sVMkcngP8SAzFoSCx+JD7Yn3HpcqUPhL
         M55Uka5JphRmSRXfag3T2g20KcTaRPzRdHVRAetzcAL6B1LLBXFfJpzj4t6ik2qEr4Uk
         leSQ==
X-Gm-Message-State: AOJu0YyX0Em5ntVGGOFqYuh4UpMjjx0IQHdpSQyTZhQOIQKpgeglLYNj
	ZYp1Vu0Qbnp6iIT9FtUZUX7PU3jBks0fD1un6/boOp4QnJDt8ecDqxFWm04SASB3Goioc8O+S1B
	Psvt+VytKhLUiYogPZsCC1b+5s+UtGgU1COB2yXg11QTOgfr+O3Cnkn6b4xfUcILYjUPb
X-Gm-Gg: AeBDietFSta8WGrB22AAhTFVK35W7rSuyMUHvhBf0gkFCvVsyXOUubkKavGl/jaAV0o
	O4QKztgEz56eaKz6WMYX3m/nxpB04mrYoxNC/P5F3V0y4TXAK4RexWM6Et3dnW1cbZXkZxMINPp
	dzsI/tW/YAr3I2l2r0LjUP5YXzLrM7a6uHq96uUZg7tckupqiJFvPpieiaNGjqHrK8ZlFlRqZkT
	JGu1iZNfqrmAdGZJWObgbZrrHgL/PTSxwaFIfqwlzlKdnldY7j95jahGeifDBhmDc4z9nAShKD1
	/HZZKdH60FJ+BfBqKaba6HsP6mNlAKWl7W0ngeBspAN/7267AynMA+CtGTUFrRjwAqIxlVt2VCr
	ZU9npKmoPEgmL8NMPlJFjqbktqcsK1kqEBXYw554CrP+zgQFXPUtBbfZ95K8l3Ewi3h+svZXGjZ
	8J+hGE2H8M1QwKte42oh5PIUvbqDtMls+Yzi5oeiA6heO4
X-Received: by 2002:a05:6a00:ae10:b0:82f:9300:cc44 with SMTP id d2e1a72fcca58-82f9300d8d3mr37687518b3a.8.1777284352600;
        Mon, 27 Apr 2026 03:05:52 -0700 (PDT)
X-Received: by 2002:a05:6a00:ae10:b0:82f:9300:cc44 with SMTP id d2e1a72fcca58-82f9300d8d3mr37687487b3a.8.1777284352136;
        Mon, 27 Apr 2026 03:05:52 -0700 (PDT)
Received: from hu-ajainp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ec24850sm33004008b3a.60.2026.04.27.03.05.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 03:05:51 -0700 (PDT)
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 15:34:56 +0530
Subject: [PATCH v8 5/6] arm64: dts: qcom: hamoa-iot-evk: Add Embedded
 controller node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-add-driver-for-ec-v8-5-702f74e495f7@oss.qualcomm.com>
References: <20260427-add-driver-for-ec-v8-0-702f74e495f7@oss.qualcomm.com>
In-Reply-To: <20260427-add-driver-for-ec-v8-0-702f74e495f7@oss.qualcomm.com>
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777284317; l=1627;
 i=anvesh.p@oss.qualcomm.com; s=20260313; h=from:subject:message-id;
 bh=v3xhy4TAVQzMuukJtx0ZPXFz4/C8vTU0vk3Dukc5Tss=;
 b=G20t0T6hMFcwFiB3AZXoLPzJUgYeyg6CKBcrlYdOUOKBo9Cu4kmaAD32H+Lj4JcIu3JWSqVOz
 xHb0FA5D2tKA6Tqiu/8D2JbXshlA731qqzunTq1XB2xyNkRJQndu7wE
X-Developer-Key: i=anvesh.p@oss.qualcomm.com; a=ed25519;
 pk=8o9EG7gkPe2Er9y9UVCx8MTdcFCwU8Pa54hBZPuduXE=
X-Proofpoint-GUID: Fu7fNAAsSlAkMh9k_YhdnoOsPysRuP8P
X-Proofpoint-ORIG-GUID: Fu7fNAAsSlAkMh9k_YhdnoOsPysRuP8P
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDEwNSBTYWx0ZWRfX2xJeLhdRESh8
 HYJ95claG8aywkSmKVcGH+47kdkr+OLcvV5eMvKP3GkxeSt2izU8CIR28M6P24xn6CoMfpL/KLD
 ddYBUOYOHz8+7E/GuSs3085mFLxVIImL4mcXi+zr9SLByzBDhSbB9i4NbNzP5JRVk1bZ57WltlS
 P6/QhCMYTlp41/OoAdiKjwRrz1FQSeRVjsfqhXVjJ6sgYKKsn1PTNizBWbn6pEtESAM9lPebB08
 lbrIZQXdBabyXB1vBf1Ny6tmkf3Z1PociLuoiBm7QG8W7e2tlc6XPOv4UJudmfunI6b8IkwtGwO
 8WECNJ8jKX1LUFlsqfkoV8P110lXuqwuaZVjLXlQiSB8NvbGtfZBMD6CSANExDh74xd58OrWd8u
 dhEHmQAN/af2M6iOLdkBLugGvvxLDpvQEeio1VfPa0NpiIgJhRurYvdb+udA2+TZNevWwGOROZ0
 y6Wyj3UI1J8cBiWdj1A==
X-Authority-Analysis: v=2.4 cv=FM8rAeos c=1 sm=1 tr=0 ts=69ef3501 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=um1wo07bdbQtbc5qrgwA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 bulkscore=0 phishscore=0
 spamscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270105
X-Rspamd-Queue-Id: 3BD60470D62
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.84 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	SUSPICIOUS_RECIPS(1.50)[];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,4f:email,0.0.0.0:email,0.0.0.76:email];
	TAGGED_FROM(0.00)[bounces-104688-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,body];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	RCPT_COUNT_TWELVE(0.00)[18];
	R_DKIM_ALLOW(0.00)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_SPAM(0.00)[0.129];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anvesh.p@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	R_SPF_ALLOW(0.00)[+ip4:172.232.135.74:c];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	RCVD_COUNT_SEVEN(0.00)[7]

From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>

Add embedded controller node for Hamoa IOT EVK boards which adds fan
control, temperature sensors, access to EC internal state changes and
suspend entry/exit notifications to the EC.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Tested-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Co-developed-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
index 460f27dcd6f6..a0d2ccf931ec 100644
--- a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
+++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
@@ -831,6 +831,16 @@ eusb6_repeater: redriver@4f {
 		pinctrl-0 = <&eusb6_reset_n>;
 		pinctrl-names = "default";
 	};
+
+	embedded-controller@76 {
+		compatible = "qcom,hamoa-iot-evk-ec", "qcom,hamoa-crd-ec";
+		reg = <0x76>;
+
+		interrupts-extended = <&tlmm 66 IRQ_TYPE_EDGE_FALLING>;
+
+		pinctrl-0 = <&ec_int_n_default>;
+		pinctrl-names = "default";
+	};
 };
 
 &i2c7 {
@@ -1320,6 +1330,12 @@ right_tweeter: speaker@0,1 {
 };
 
 &tlmm {
+	ec_int_n_default: ec-int-n-state {
+		pins = "gpio66";
+		function = "gpio";
+		bias-disable;
+	};
+
 	edp_reg_en: edp-reg-en-state {
 		pins = "gpio70";
 		function = "gpio";

-- 
2.34.1


