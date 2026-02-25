Return-Path: <linux-arm-msm+bounces-94031-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +HjTLjmanmnXWQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94031-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 07:44:09 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 334CC19272E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 07:44:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 206D0303C819
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 06:43:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1C027261C;
	Wed, 25 Feb 2026 06:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VTgyfSQ0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RRIhxctb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 915752FFFBE
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 06:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772001835; cv=none; b=nc1cfShozgA8fQos9uTLg/vhq8vVkkFlIaAGqXBh7/HETdnmEkpg9nW6WbjBz00xgxbgx05DWjhGqlVP4OlN9bBXtOohlxWGWoIi6jOGD0yZQH5kv3MsB4+8tIPsFVtvJmdJcEAuo1GoOrGAuxl7negwxcwgdn5SQh4TYeREo3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772001835; c=relaxed/simple;
	bh=klb1mTD8W7Su19cIU10+TMEB/SZUUf0xo+EcCYWc9R4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j9vHoc6C6Xacld9vDun2oAEppxgJtDJ5PoWrQfjSsrhb+ybyo7Poi+nVi1aXoF+r5uIcj7UyKr9LlaGluAzyvyf4cqa7AmSgARWB0JKfOBs/eWy4RInBk7wxcO8EpgviK5/CkqqfYb+louPv/Gg6q+1aUxM7v1KXjxEr8v+Ay30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VTgyfSQ0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RRIhxctb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61P3dd6h057209
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 06:43:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YYpFC4PVupG141m5ztdsDiNh49sOlwcUYrUhCvXRdlo=; b=VTgyfSQ0bdsBVQFu
	dlkKE2M3CByMfFZLxSIYReAph7+pYnyMIrhqjjge6rQxxbAGqikas4JG0TeiEw9n
	OP/ipIxRnulc/eXXPN/KCLoyhclbaczhNmAC1iCDXmXQ1FBlpGYQjT/M44zhrrk9
	ai5PZrLpuiE0govCu4fS2/5rkR6W9mHN9xIaxBx938R9pLH3L9d4vuO95/qoB5fL
	B4P8EazRePAG/fOt7CCP7+mHzYahBhOLsm371oGdR/McOyCodu6z8oAWs6oO4aLm
	RgtncNWgE7C6SOBUChHvCfs8RgHd8/1nefhlTdnOIZflG8FIfvpCNf4LIqII8GXp
	97u56g==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ch9sabj2e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 06:43:53 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-824b42b8a81so24300006b3a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 22:43:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772001833; x=1772606633; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YYpFC4PVupG141m5ztdsDiNh49sOlwcUYrUhCvXRdlo=;
        b=RRIhxctbMz68nBn8IrJZqfQr721kh+T+oy+wu8uJq25xs/TPJbJ2mKaaJ5tmDFHIm5
         UmyYH0ea8RwVh/39x4vsTDQviPuSNqXqsxNej6iQHvLPYnvZjBjR+LIns4lQnBlhzYnu
         YB16mn6MwTZuRpm3REwlkZr+68wpoCOPpPExx9Xl1LtmQTA5p/4MLc5XJxWenoIbwYq1
         OrceNgJhT1f+QeuBKKdhwTD3CSuen2mLa6pBQI9GkRgZ6te271btPjEchmP7yVbQ7SFr
         977WffWvT/33jznBV1eziR1vehepd8OUPnJ3kh5e6uL5wuuRD09YhW+RXXRqGBc2uRDD
         ERGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772001833; x=1772606633;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YYpFC4PVupG141m5ztdsDiNh49sOlwcUYrUhCvXRdlo=;
        b=UsqHPRwVIuf8FuqJHom1GPoN/hzOUMhdit+OMGs3WRVgmHcYKJm3B6BeYE+gZcSGbQ
         9UqZ7McpWYocXq28XL5QQlLpFFlpemaxnNoFBTo7hgjLVLkhMPVyFGIGTlzeXL5pECTW
         jEdv+x3x8dNDyDMPPZIeNVhtsNn4e1/cjOfjgDPIO1t8b5WQdqs/N5AD4OnPLtTMRBSF
         YcuVwGSbc5UmLwKTgFQH87M3u7wqM89UjPzSS+iw2ovkF+oCIdr43LI2xjGCs2uMoaTe
         ej88lyzXfioQLzJIrOhD6plnMmtzaHZ4HDqgxPg4Ur2pkuwzwd1gv04/Js6frg4G24X0
         o0vQ==
X-Gm-Message-State: AOJu0YwA054hupPrtOeH8KGgTlUJjswxDMVHuLU+tL6bI0PV4XkFXS2N
	NTGcui4UQpLGkW7AbH62FaT0j1QhnsMWVNe8yslbSQ8mGjQbgXigBo6GP9OrLcbZCi5T6LaywHU
	t1l1kBeGnJnZQq75/V1P943eqlui2/NB61tlYAW6ZQxKh//D45BIK3mx81zFXz2/qN/pQxX4R/f
	At
X-Gm-Gg: ATEYQzyo6QFFk+liwABNqpir9PVqjVVptpwTY+cRVEoOC8fLrfoCdGanPicJ5KkknaI
	YNu5m0uaymmllAOixFkM/8yPJaiMsr/6O99ysgX99Obw6mWu6QD9If1e2XEXOsV7iVx4ZC5joiY
	VvG4AKpOA4f7uCkKiCGBZ1QQzq2Deohmj0sOGMx8zZCeJo4jkaBXtQOFAfyTkN5IvWvWnyKknAM
	Xc2mxWfYSVWovVMMywuN+HWMGKsS3mk4ySshFUH4MAt++Ljwy8e/PUXf3vbuz1bxoG3wTfYX+wM
	4bH8Tx/DWYWITyux2Pr9Q1UwcT3Ax6L9F08Nf9tEpiXEQfQs2SMWX2PpVqrqOumXrzOpHkOibrk
	etm7quzpx3hcrG9fjynZ7loPpzskD3gAph1rmxdSIyldKhN7psdVSSktYkAIBO7DqQUMYmk/S9M
	t3lVI6D+1IYQaKZm37ODHgTyRW/JXWeHCyXPPJx3XPA4dWUiebP1fDbcBH
X-Received: by 2002:a05:6a00:4188:b0:824:a25b:db0d with SMTP id d2e1a72fcca58-826daa7909bmr11966099b3a.56.1772001833060;
        Tue, 24 Feb 2026 22:43:53 -0800 (PST)
X-Received: by 2002:a05:6a00:4188:b0:824:a25b:db0d with SMTP id d2e1a72fcca58-826daa7909bmr11966079b3a.56.1772001832653;
        Tue, 24 Feb 2026 22:43:52 -0800 (PST)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-826dd692b99sm12856570b3a.24.2026.02.24.22.43.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 22:43:52 -0800 (PST)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Wed, 25 Feb 2026 12:13:14 +0530
Subject: [PATCH v7 5/5] arm64: dts: qcom: ipq5424: add support to get
 watchdog bootstatus from IMEM
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260225-wdt_reset_reason-v7-5-65d5b7e3e1eb@oss.qualcomm.com>
References: <20260225-wdt_reset_reason-v7-0-65d5b7e3e1eb@oss.qualcomm.com>
In-Reply-To: <20260225-wdt_reset_reason-v7-0-65d5b7e3e1eb@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772001806; l=1448;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=klb1mTD8W7Su19cIU10+TMEB/SZUUf0xo+EcCYWc9R4=;
 b=tl+1L62HFJaNbdkNyXKuOqh52kv39BTvUUSa1o61BUZhftg44KgAoS1Xjyk1CJhWhu3ECCTxU
 lrh8Y69ELX1CXi0FP15SG7RFYnTcv/wt3NHRieeJ6N+YNU6yk3OF7NK
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDA2NCBTYWx0ZWRfX1RWwIqH6GQgi
 0lJOGUgB61hxdCCncrCMHO9TppYnj83rCIRWhLkaj/A8uthlqWiVcBEb/z+Umtq154pwJ7So4a9
 pUzKNuR9ZKASlYpEUmY+6k7fKuuFRvlkOUcwwV4et52bBwr5Il9RCZbvmcMJWqfHkuH4a2YMd+4
 o08+UHkEpd0fEBWE4kqFUop135XEi9YNpCrb4UlFQA6yzyh8Jtmr/dxer9ftYp42+SKJZKVvqBX
 jgy7RHr+cfxxSx/pac3zqOVA2K3ySSdfiVVBAsZTVWw0WNa38voFxxuiaukWnnsjdRQktmWQUQO
 VmW0PvI/C5nRcJJHBsOiTWYeNNiJctCKJxe4dKF/sdG+jjXNG9FYT857zF+6DfgG+X8a5bSLUL2
 b4Fpt4pZOZbFq4wwrrbEBsm4t7nn1qMHPX7ffC6CWjnD9mdc5NAlGcSKzlvbOcxWYCo1rhB6GU8
 eM/8yS0nujzJDU9aqXA==
X-Proofpoint-ORIG-GUID: jQW_GqSOpePcgmD6YBEamI8GHb_cySy4
X-Authority-Analysis: v=2.4 cv=e7ELiKp/ c=1 sm=1 tr=0 ts=699e9a29 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=WbeaI0-OC7IQdSlKmUMA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: jQW_GqSOpePcgmD6YBEamI8GHb_cySy4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_03,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602250064
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94031-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,f410000:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_PROHIBIT(0.00)[0.131.57.192:email,0.1.21.88:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 334CC19272E
X-Rspamd-Action: no action

Add the "sram" property to the watchdog device node to enable
retrieval of the system restart reason from IMEM, populated by XBL.
Parse this information in the watchdog driver and update the bootstatus
sysFS if the restart was triggered by a watchdog timeout.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Changes in v7:
	- Picked up the R-b tag
Changes in v6:
	- Update the 'sram' property to point to the SRAM region
Changes in v5:
	- Rename the property 'qcom,imem' to 'sram'
Changes in v4:
	- New patch
---
 arch/arm64/boot/dts/qcom/ipq5424.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5424.dtsi b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
index 491bc3b00494c47c5524df069e9d65bb4654e863..86de974949f48269170a2bfbeb64214d37fbe488 100644
--- a/arch/arm64/boot/dts/qcom/ipq5424.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
@@ -591,6 +591,7 @@ watchdog@f410000 {
 			reg = <0 0x0f410000 0 0x1000>;
 			interrupts = <GIC_SPI 0 IRQ_TYPE_EDGE_RISING>;
 			clocks = <&sleep_clk>;
+			sram = <&restart_reason>;
 		};
 
 		qusb_phy_1: phy@71000 {
@@ -706,6 +707,10 @@ sram@8600000 {
 
 			#address-cells = <1>;
 			#size-cells = <1>;
+
+			restart_reason: restartreason-sram@7b0 {
+				reg = <0x7b0 0x4>;
+			};
 		};
 
 		usb3: usb3@8a00000 {

-- 
2.34.1


