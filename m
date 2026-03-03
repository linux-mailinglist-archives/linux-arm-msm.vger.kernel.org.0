Return-Path: <linux-arm-msm+bounces-95066-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EOfwJrSbpmnfRgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95066-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 09:28:36 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0926E1EAC6E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 09:28:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3058F313879A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Mar 2026 08:22:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 416ED374E7E;
	Tue,  3 Mar 2026 08:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A910Ig/u";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e+VhV4i+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DE6A386C3E
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Mar 2026 08:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772526141; cv=none; b=A6PcOhlO0VJVms/AzsaTAFVQnolo1a6N21H5eYJBnOThNX3oFI+8eNpLjlOg+ZYZBLzCKJUmU8F2xbxT20NV2pFEHhLLpSkWa+JC2xf6pHSOLpmGeqRn95bgY5Hd5wGu+DAaMw4Nxm54ksOLJAvzrW5aWvmyrKbk7hZOv/TMyz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772526141; c=relaxed/simple;
	bh=3L2NdIsZ0m1aRMuVNIQhv+veMziAbqc057LMDyfnlHg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hpJ+FQgSzKoGxUNoswLzBYw7J+ZIAou89eE7vvVKU/IF5g54wYCneFghCXlMW52/6C2T3KrgEDDjDnoafyd1lfJuvxDp9xoHSiWAcL3arvP6g0ys5160zL4OUSkSn49+h+bxdfSa4XSauqq5Q+6a/LGW4x3B9LV8t7U7N0PF1xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A910Ig/u; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e+VhV4i+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6236uWLq2048909
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Mar 2026 08:22:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=E0asLgT4/at
	m7tMXE70/nCPwp67p1a7B4xwmHW82ID4=; b=A910Ig/uLFh+Uv3Goceeld6sRlG
	aJclFSRXHFjP1hpAJLN1kFaLpbsczPGZQDy213Jivriigd/9SOL2ajthxgZRTTAk
	dGonS5kWqI8YGel4FPZ0qtcUvE7wZiZ2AP1oVd230eENlo6CNKbk/sFqVzjbr6rX
	Zw3vFklLN/3q4Vg6CXL7NGi7mJzd6+wh5Z98jCrr5EVaaZOxNULSR0N0dMy4WSse
	yBTyfTW2xCLbvMndP+PColdtY0RzlA0Id6quf+k8aXjEX8Mm0UHTDSaYNCa2xqQP
	+wvhAriSXGEvLL4LJ7SCZMiCuoSacGyQWPHm7Jklcnct0j1yJDGLRE+BsVw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cncmfu88m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 08:22:17 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3595485abbbso4032109a91.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 00:22:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772526136; x=1773130936; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E0asLgT4/atm7tMXE70/nCPwp67p1a7B4xwmHW82ID4=;
        b=e+VhV4i++VFwhFu8Eodxbyq3TeGsWTrTjMfij5vRrkSqhtw33OqGHv/ie7RGepYcMN
         GURvqjohuq3104H4zcCwJ6Qshwfn06EtRWwFKM01pluQMSmSa4yfx7LAFnspmBO0Re6X
         ujwrB5aJthSgLU6sasUXs2vINOdzzwl6o4SntHP8vUOHKHmpZM2k5wi2FXteHScLOn55
         XG1exNMFxmQnIX/LCVEKd3O+JgsmdnOx5TylSPegUtCxobkqUnGKQJKN8ajsRNveISD+
         l9KUg3/9O2MM4DWYLu0tJ/HNm8n3m/GOsowi0YWCRd+G/vMBeHgBuFlItxDW3XZR40Af
         anJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772526136; x=1773130936;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=E0asLgT4/atm7tMXE70/nCPwp67p1a7B4xwmHW82ID4=;
        b=rqzQLj6frSvSY/UD6Pp3UvFpwlS05FKoQZ2xDKVcenn/RFBV3C48EQcNEXq74/h2fl
         QJciFob6m+HQtxgJ/bFA85IkNjWf5lv3VSIjAKV0q8FjHPqjHdpLyz77QIuKNLshByW5
         04p0cv59GbwKFBB51a0lWOKZmomkub2o2Mvxq6wGQwbtkEUZg+UPCe9V+Lr0twuCPFBD
         le6QeGWx/zWFUKkjeFK+H5K86XUTsU01wp67mVKUJhm2FfJzCkKHq+33oW03aB8W+Y2n
         tQPsoNUHzuIrI3d84x5md14R2X5PxZ6SoH7o0Oau1qX9mTyvJuddGT/oNpjTrKOPU64g
         YJjg==
X-Gm-Message-State: AOJu0YzZtCNZs49bRDK4yw8hh7rBXHPP17T2Cgw2P36GkkmmhqovutPX
	/yOnP5Juld3Klhji/BACHGeEA7RIJZxrMPLrVKsZ9DOP7Vr/FhZVG354BAnk7RlliaXpwiY/IYk
	YafBnD0CPEYa/k83JwwCTY6ThPG7ojc7ExSa59J9UHR0pW/s4fYKjjkLeU6Eqlz9IJGPE
X-Gm-Gg: ATEYQzzRPfbL4f/N5QR+VJLIebZ96za168KJn4eJ5o9BHOk2+em00hRf3ojsckY5/kN
	4hftRPsCKxuSUhYB6iDex+PsqwBHQSoaraqCoJ5+kegdlA5kXXuIgWobILFuRfvFcRT56S5pgFD
	UvY9/dVxM3M8dGpZUVwH5PdS9BgWjXUC9d2ZeU8s/p4REgz2R8zTNbiqyMsLyNOufpO2tfCDNww
	ES5DRYgyzm6zdpRh7Jh8lRnil8AM7qc1nqH0XOcFq9DaZo0O+u/naSqj07ynk9MAnYqokN/5ohx
	ur8OGz11U54ZMyrH1o20tDU+2lVsQKQ8nqi8PahWUQKUUHm/5/LuZtMnt/ew4TyZi/JcBTEqWOQ
	MNItVjlcRq/NKNcEbAjfhhkoYcthG0yWhOtrEeM3lGIvT4yIfiYiIWds=
X-Received: by 2002:a17:90b:2516:b0:359:8888:6519 with SMTP id 98e67ed59e1d1-359888869cemr4785370a91.0.1772526136429;
        Tue, 03 Mar 2026 00:22:16 -0800 (PST)
X-Received: by 2002:a17:90b:2516:b0:359:8888:6519 with SMTP id 98e67ed59e1d1-359888869cemr4785343a91.0.1772526135939;
        Tue, 03 Mar 2026 00:22:15 -0800 (PST)
Received: from hu-swatagar-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3599c4e2f85sm1797214a91.17.2026.03.03.00.22.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 00:22:15 -0800 (PST)
From: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Subject: [PATCH v2 2/3] arm64: dts: qcom: monaco: Add role-switch support and HS endpoint for secondary USB controller
Date: Tue,  3 Mar 2026 13:51:56 +0530
Message-Id: <20260303082157.523847-3-swati.agarwal@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260303082157.523847-1-swati.agarwal@oss.qualcomm.com>
References: <20260303082157.523847-1-swati.agarwal@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Br+QAIX5 c=1 sm=1 tr=0 ts=69a69a39 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=ZrvUoS1E-TgtW8Atug8A:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: Ym4OpvMstYvbQCnf8_FhqzzUl1oV6Q9B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDA2MCBTYWx0ZWRfX6nbC14iKncha
 JHZ4eyOMaoeAYtpAHavv60VD55HI6S3/RUicIe5t5PFZHOE7vrip5KcljBRWVD8EMO5WmnAApW5
 66TtuspuJugUBwDHQ0ciFQannFmt/zVzK16yqesgJahZuR5zihFJOtFUh+S1PqLvLHoJbZShoNz
 sp7deZQRDoV7dvxNIFua8FXde+WDQBvnqOHJgzmvMpIWlr5HMfyLy+1VdNhwVdG2DD1BXNJjMnr
 zfHZK0I2DCTB4IRtVSopYFV+df2p/P6m4o219bfPUDo29WFhucZc0JJgHFSALrv2EkMIlLSrRrp
 87Glxj4DNYc1/Jypd/7KJ+w8TbmcmrD01Reuf9tOQRyaeSWHvW5GvbndMtUDz0/PB5eajyVonWF
 wZQsrIQRssjx0R7fOp+tTBNFvmYR1dFt2FqV2pveVEkuDVLKEXJ5lUmVXRqer8a4Yf67RnCKiOE
 rvYMYD2P5qppra3kJow==
X-Proofpoint-GUID: Ym4OpvMstYvbQCnf8_FhqzzUl1oV6Q9B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603030060
X-Rspamd-Queue-Id: 0926E1EAC6E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95066-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[swati.agarwal@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,aa00000:email];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Enable usb-role-switch for the secondary HS USB controller on Monaco.

Additionally, add a port node with an HS endpoint so the controller can be
linked through the DT graph to the corresponding connector.

Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 5d2df4305d1c..59dfacbae4f6 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -5232,7 +5232,14 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			qcom,select-utmi-as-pipe-clk;
 			wakeup-source;
 
+			usb-role-switch;
+
 			status = "disabled";
+
+			port {
+				usb_2_dwc3_hs: endpoint {
+				};
+			};
 		};
 
 		iris: video-codec@aa00000 {
-- 
2.34.1


