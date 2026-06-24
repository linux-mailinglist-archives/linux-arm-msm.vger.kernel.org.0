Return-Path: <linux-arm-msm+bounces-114366-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +SiQBQnvO2ptfggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114366-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 16:51:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A806BF504
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 16:51:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="B/xXu/Lg";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=CxPb9lEx;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114366-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114366-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 127683004F10
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 14:51:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26E803909AC;
	Wed, 24 Jun 2026 14:51:31 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D84693CCA15
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 14:51:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782312691; cv=none; b=WeEfh1f/8TWpIDqTgu2waVSfhraW1bQkSS4fr5GgJHbBfgD2EX/Fc6faMDCoDJcZ6pPMuJtVnFDcGq8ABYlhJ7/Y9Jb72yCXS7xageOvwbRoLBwG5EojKbn8eS5wUhUNb/vpvFanyfLnOrxbDWOMeZDHuKP3ufeX6VOpTK//mK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782312691; c=relaxed/simple;
	bh=uPaHJPX4fBQA/65TQFLuVYTjl+5WzccZWh+8+FnorRg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ja3UOe5+y1VdW4zZofRcYySfp/Shj5fTphP4Itf8yyLEg6PDqjYeK4j8cnrcJbltzyqNn+Qpy1Yu64cLaTh//G0vyAZ6jGcH/JpjsX94qWGE66Z/EXOmPluXjsfO+i3zGRS5xY+b48eZiy9AvABDHsFUSEOX+2iMdW+okK0Qrrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B/xXu/Lg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CxPb9lEx; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OEfM1c3076075
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 14:51:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u8XivURppudXZz+Z+GoxZig9m3FBNIfHMcPRM9Xb4h0=; b=B/xXu/LgiVbB7mgR
	d5vYXO5JYtoToD4jXeNqzL68W0cQUznt1nL2Y0xOFpgBlIi5OT+3lXKtNxs/qn6U
	4OOrbI7WWzKZ76CMeCr0/hZ+BJz1Wi9QCg6b26pAkgFyRpNHXaNApMeAezw5Jh85
	e5j9e5BEbrnSM7J73ds5+6/6JHcZND3CIBC3NZhDiDZtnUT8lYT4pRRdGAf7B0KF
	t0XBTs8zeL0hTW1fPJANYmrX7H/OgM2lCI6FNwbRVwu0yCsxXmyKOJxVo1q/VDwz
	Rm+6yVLGXHGFjIb7jR+BPOhUy/V/xS1XuZ0dB7zj4blHOz/iE0OisptzQ0pRm1Tk
	uuLjag==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0d45158f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 14:51:29 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8422f987f2eso1816829b3a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 07:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782312688; x=1782917488; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u8XivURppudXZz+Z+GoxZig9m3FBNIfHMcPRM9Xb4h0=;
        b=CxPb9lExJX1dIo69aRbYkyGI2YiplYW1aJn1gnyW+C16z87VRmCS0Z1f660xTqNW6g
         oEZnEBy6SrCxkXt9ymhLJZGZrZfUFt1lYj6bOM5HoFY07v8ow/x/qjq05JLUqET5I6Qt
         jKdT6YGUngUknUIR++9Rh7RrLcH+ud1eedhvmQeykq+dLJrwPe2OwEN/gJ8m7sg/eMdW
         uVhbr0SXNYb5QHhuYsH2uZD1aV6AnALEqRFAAuqYwAeoYROBX26PvrChMRJ/wGWtEZf9
         pomrLpKdug6+4uNHb/IIn4pn3mFiNHYYej8gnAr6dPBRtxqWb4P07qbb8bhxhJ1RPaD9
         vYAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782312688; x=1782917488;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=u8XivURppudXZz+Z+GoxZig9m3FBNIfHMcPRM9Xb4h0=;
        b=juMe8WP39eASqj1F81Xc+qXlHaaDxncpf2QDeSOBffmhelPxDHtAumQOApHl8ZU+hF
         uCpCJvMRByDo5wfuJaa6VhethfWhcVjglNr0aHnnRYy2OBUc5jbR7ThBQZcHyhB9rVdC
         X7wccxuZFiV/MRgqlW69s5EBLLiNnViy53AgQbc59XUaf2KG3J/yK+ZZsUCw86+RNKPW
         IfK9o+BimVroUXALFGqnIIydOH28jI/4gs1iMYChVNA/WccMdZNX/jNfI+rUckf8soev
         6u/DCQt4tw/Wk+jsxuIbWUh3Jnqr7KtI4s1bz6vUkTfdUP3y1YFbFZtC75fDCqUD90LG
         YaHA==
X-Gm-Message-State: AOJu0YzkN+Af4YTyicspRnXqNhp8tNQwS2Wch7Z72+5KbkIz87St8fWj
	8cqH5y0Eno4nk0NU/0YnUKRVbmJ5KgERRgGM14mu9KOIjt73B6cc8WPINajPr7VYnZp+oIN4fNq
	2HVzHbullxMQxh7yFQgIzD9UBYvVCaWWmoZY0/Cmbq6wpic8DLlW7wB81iykMshODbg2e
X-Gm-Gg: AfdE7ckw/twM4G5g9RV2SviWUXrPj8m4awQiYQfQk89K2VKCh053YZKzV+eicKEVzBT
	1m3sNvEwM1nVNO4G0qtf47s9yE5mfA4blob4ROLicnEsX10xLbdN+Nlrum0XmFjhq724lHbdwIC
	rc7nsqe7OAidM4iwn7IzL4M6ODvQpD5g9HMAQjuWnzU2c7B2xTSeofP5Gw5tdgRCv8wwIdBmbe5
	Oaj9Spuu8apy8mWF179kQFh/VmHPDucmlkieyp+BNZfqSIGVNhHNAeBaWOx8ZrmdYLEoJ7mU9bO
	RlLBp2PGAkeFv8go755aeNa55aZwOuN7t+s/zZ1/RE/H2nLMG1tgiBqIPMFsyHUURfYcfS4RuAL
	AIbSbBbunXGzwCYy7N0+lIiIEbNXDluTgyaBu6NySEQ==
X-Received: by 2002:a05:6a00:b46:b0:835:388c:9764 with SMTP id d2e1a72fcca58-845952d9857mr9047626b3a.37.1782312688153;
        Wed, 24 Jun 2026 07:51:28 -0700 (PDT)
X-Received: by 2002:a05:6a00:b46:b0:835:388c:9764 with SMTP id d2e1a72fcca58-845952d9857mr9047578b3a.37.1782312687461;
        Wed, 24 Jun 2026 07:51:27 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a3fcc839sm2643271b3a.10.2026.06.24.07.51.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 07:51:27 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Wed, 24 Jun 2026 20:20:31 +0530
Subject: [PATCH v5 3/3] arm64: dts: qcom: glymur: Add camera clock
 controller support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260624-glymur_camcc-v5-3-a321df74b1a1@oss.qualcomm.com>
References: <20260624-glymur_camcc-v5-0-a321df74b1a1@oss.qualcomm.com>
In-Reply-To: <20260624-glymur_camcc-v5-0-a321df74b1a1@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDEyNCBTYWx0ZWRfX4v77EtFfczhd
 6X4GF028gDoXfwjiRVX2ff6+hEulLXq8h7gUKnGFIlTAXfd8evx3F9a/O9f8LpNkNwxmyofzxPU
 YHYhVARQV1purYOeH0cRiqU3sPjfSMLEbBUC7/WqZI6TlK0E3G49gHHPM0ZSetM0DX52BWVPpzf
 juOGVo7c5ExY3u5AkPWFAnMvOJznmIQQp+hQfL3u4UA0FTmV/0Ww2RwRUARMCVh8aWsImPI+/hf
 y7NRLfiJextSXAanjuDMSkqKwY+Il2VF0zFp8ifFH8sJ9y6Q1pD0Wo/CK5keUZ56j3XP2I4MavJ
 AYc4saRl463garkgEzpUOtN92mop6g5YBJopdUrxIiUfZ9kP/VRqqSD+nQEyjlbZTKc8SvszDBx
 GmSzngbrd/v/Xm34Zi6EK3ACGWq5YjDpyn42KBoU/hKB2bMxUJD9T6R+7fEUZqsOTOvms0DeZWm
 tTu79z39vWKK3MSPKBg==
X-Proofpoint-GUID: 1suQeH87S186YzGSZuITAk0ibWYGl67_
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDEyNCBTYWx0ZWRfX1hh0J+68KUhn
 OjdeevTFmWExB0aa8o4o1nml3UvrLZHQRDMyosDYjyMtVGOk0DYunAJKbpcchJrllLxWSa0qAMK
 Qukg+kKFj6vAnq5IZ0UYJU7lVoa7DbM=
X-Authority-Analysis: v=2.4 cv=Ar7eGu9P c=1 sm=1 tr=0 ts=6a3beef1 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=butnsgrUGOw-u3YEFNkA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 1suQeH87S186YzGSZuITAk0ibWYGl67_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_03,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 malwarescore=0 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606240124
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114366-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[jagadeesh.kona@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:bryan.odonoghue@linaro.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jagadeesh.kona@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:vladimir.zapolskiy@linaro.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jagadeesh.kona@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B2A806BF504

Add support for camera clock controller for camera clients to
be able to request for camera clocks on Glymur SoC's.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 20b49af7298e9549d126aa50a0dc7a90943a3249..eb5cdb588e9aeea4275a0ba8e94d77dd608ec6e6 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -3,6 +3,7 @@
  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
+#include <dt-bindings/clock/qcom,glymur-camcc.h>
 #include <dt-bindings/clock/qcom,glymur-dispcc.h>
 #include <dt-bindings/clock/qcom,glymur-gcc.h>
 #include <dt-bindings/clock/qcom,glymur-gpucc.h>
@@ -4362,6 +4363,22 @@ usb_mp: usb@a400000 {
 			status = "disabled";
 		};
 
+		camcc: clock-controller@ade0000 {
+			compatible = "qcom,glymur-camcc";
+			reg = <0x0 0x0ade0000 0x0 0x20000>;
+			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK_A>,
+				 <&sleep_clk>;
+			power-domains = <&rpmhpd RPMHPD_MXC>,
+					<&rpmhpd RPMHPD_MMCX>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		mdss: display-subsystem@ae00000 {
 			compatible = "qcom,glymur-mdss";
 			reg = <0x0 0x0ae00000 0x0 0x1000>;

-- 
2.34.1


