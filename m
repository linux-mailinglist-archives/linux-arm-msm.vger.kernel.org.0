Return-Path: <linux-arm-msm+bounces-90231-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gAFkMyFDcmnpfAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90231-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 16:32:49 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3926D68EC4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 16:32:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9D8AE30000AE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 15:32:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2AB536167D;
	Thu, 22 Jan 2026 15:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JLmQkKWv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KoNkRbUv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D80EC34AAF0
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 15:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769095462; cv=none; b=n9WFgi0DRzRYO1SbdAP8ilQGddzzsm6hNCTm4i5dJq2e0zvP+F2+PKB9o+vd/0XYc0lTZvXU5GYc+HrJWSBfUWZSwCM3cNH9zch0FgtZtvqpKJ90qhFlsYX1rWIuDiiTgQqelwuBriZGJ7WLvSnRno4hBbQ5wiWTDwtDrKP2tAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769095462; c=relaxed/simple;
	bh=mBof4ivxIxry1XVPj4xY2M8shs8OYfrDP7bXib9Z2Pk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Cjme/IfmMTrZCfXa+j5BQPLYUEMRW82GgF0D+t7rJTGVheQrw3JidJpsfbe5v40dJWo536j1dhgkcYGa5OxuqII/b1x/nJEOeUmoJOlp9M4hqoToyHVAhWOxRRSK0F7nXuuqBjr0AK0eQHGjT76y5VvxYzwoZfrG1WBXq+7Sksk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JLmQkKWv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KoNkRbUv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60MEFmqQ724879
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 15:24:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=nGWyjBh38Vil58fepZKZxM
	G9lSqgbR5aX2k2ofpTjLs=; b=JLmQkKWvt7LW2vbNi3aHZzMWcDQTomfLSccpwZ
	YkfiPi9mHPSAi2fpTXh61dZuTcaaetJcoDb9ezhiRlgTCZY5TioHeUb5VbXIkgwk
	8WZ3uNXg7MR0dZCOCkHRx6mZFtD3QjOE36c8nVrSpFskgogHcu8kIHRvV/JdHQjO
	UxYuOJkDV7wRkd+rXL/Hz011Q3lbIRlThN56LeOck+y+BdTi5YHvc/JUI7O0qSfU
	WDMouZ+An/Caa5XZiRfl2Jn4Z9r7jPEcHzsrziAbm7swUK+956inVCT0C8LtiDj3
	yV5iOdjk+ZUp9oBkUDTcBCDJ/SvGrlMWCuRNxlIlBoSOnxyQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4buf1bhhfb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 15:24:19 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-822426d844aso723242b3a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 07:24:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769095459; x=1769700259; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nGWyjBh38Vil58fepZKZxMG9lSqgbR5aX2k2ofpTjLs=;
        b=KoNkRbUvgTHJK5eJZZ9MoBZg9DyRWvuM75tpSinEyViH5ba2DKyusRtwOyQg335M6T
         2DcgAIZCh/qnZJOCt3sqSVttzFICk4VeWDRAl3E7vBS8CiK/R8zRs1NUJhtZb9duegxZ
         5AVA6xsSmJNaAb333ZqAY0+1oM5e2fnCZlQLBZGPzmur0BG+4Afc4w8PzJLCujrj84Zx
         Y//OJq3iY1y1NOeLWcOBfIMsVXi/RI3ocdwAN5C2aS8s86uowXvC0yaGnDaLsSWkaI9m
         FMij3US1qUkutN8UBUBgVkItHiQC4ZCRhijypYlRv4LnQWjG4QbelrokSgPSmMdp+SsD
         eypw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769095459; x=1769700259;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nGWyjBh38Vil58fepZKZxMG9lSqgbR5aX2k2ofpTjLs=;
        b=jz26jj+4AK4ob5soV3y1aLKmap/0LPeHx5swtavkMQ/FpamoXYRQ0JRKjcTMhaZR66
         hedl7mJNt2gP7tohWOOKI32naO8budpHCH6YigwXMhbhvvbZUp777DTCQ9j/9o0VsK+g
         hW+4TUujTnCGsO5uNA+8W5VH6ByfLHD7qm7HmSA6dW6k1Ch18Xn0IAap8S3PwTH75qQw
         z+OPk4GrrH0M2vZ3tZ9KWPhRwB6/vIBMtHtmx2Y//MOk4A1cb4cONwgm22tkvxP6OaX3
         dfVU1isCz44C4TFanThWEZQPu1ZOdT7WNdtqbqmfBd85uHrMg/gUehcum/c4RsuM6JeJ
         p/qA==
X-Gm-Message-State: AOJu0YzGDa2D2eGcOEYHfO0nQuY6awG3ehJR2psygiLNJf/Z43YLdQGQ
	V3t2ngBHV1Ogc2fQiU4BtCS0/8iqxdHHwGtbce8TqiwDPZOhczN/h8Ryxoi3EE0ISweh2LjwXae
	XhO6qgB0ciOkdfIzNvHLB+gEVbhuE0F5qgkhsw05dNcqejEIouQoWAyswR3yA7agW+l02Vojvnw
	wp
X-Gm-Gg: AZuq6aKcpL1XCn6OGzaQuO/tsLX4OoOFaEHZYlXcfvquck8a9zJuZBmxr30CVDybYBC
	Wn4q3cu2DXO+rJRfKpkZ1p6oT23eYTT0tfssgyAvT4UbiYLHve7ml0SDK0GqqetYNSsKNklMJ0O
	l1mtZFkjcI/BneFrSZkynIYjKUylrs9Um4PtHj9IGbs2C2kNBROKb8OdwSN2pDS06aDWoVoh/D1
	juY1IeuNcsQTqtzPN8S7jVjS+k0Eb92ICUCQJMHLBreymOtJ9OFLgBqOxhHTiBIBlxZSWlMjtqd
	gBwgyACHPQMONtaEMnJXzANcWgDj3B8QYO59DTjso5v3H+8yrEHesd1uF+TiYKmlNJPw0zkwFwe
	0ik+6q0SRWmUhhSW3mmJQly+HQv84C2zO3wl6aHhq4XVc7dmArXvRCFiQMSMdY0gCNcuseReF7V
	Q7NRZPGedEXbhruCrcjjT7eE107P8Ekg==
X-Received: by 2002:a05:6a00:3c86:b0:81d:9862:a140 with SMTP id d2e1a72fcca58-821978d8259mr3088673b3a.3.1769095458272;
        Thu, 22 Jan 2026 07:24:18 -0800 (PST)
X-Received: by 2002:a05:6a00:3c86:b0:81d:9862:a140 with SMTP id d2e1a72fcca58-821978d8259mr3088608b3a.3.1769095457488;
        Thu, 22 Jan 2026 07:24:17 -0800 (PST)
Received: from hu-pankpati-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82180636c38sm3743474b3a.24.2026.01.22.07.24.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 07:24:16 -0800 (PST)
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Subject: [PATCH v6 0/4] arm64: dts: qcom: Introduce Glymur SoC dtsi and
 Glymur CRD dts
Date: Thu, 22 Jan 2026 20:53:57 +0530
Message-Id: <20260122-upstream_v3_glymur_introduction-v6-0-245f408ed82a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA1BcmkC/43RbUvDMBAH8K8y8tqU5NKk7RDxe4iMa3vd4vq0p
 C2Ose9u2iqITuabwAXy+99dLsyTs+TZdnNhjibrbdeGwjxsWHHAdk/clqFmIEBLIRI+9n5whM1
 uUrt9fW5Gt7Pt4LpyLIbwlmuUQuc6jjNVsqD0jir7viS8vK61o9MYgob1kjXkPS5B281jyDFCg
 uSrzfvGFrypSj5JLjkg5nEFkpKseO68j04j1kXXNFE4nua4n5gOlubHtl+lmkrPJ8UF16RTVZk
 0F6T/Ry19SSlSSCMAkwgzt9Rje8S3qMfB1redHD3x+cYO201sKjIaoYCU2LyPg/VD587LB0xqW
 chn29ndXS+DKIBEVjKMostfDSwRU/zFhhEk3GfjwKYolDEgBQn4g9XfWPgHq2c2x8QUSseU4Q3
 2er1+AOmdqD+TAgAA
X-Change-ID: 20251007-upstream_v3_glymur_introduction-5a105b54493d
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769095452; l=5524;
 i=pankaj.patil@oss.qualcomm.com; s=20251121; h=from:subject:message-id;
 bh=mBof4ivxIxry1XVPj4xY2M8shs8OYfrDP7bXib9Z2Pk=;
 b=yME9VLvsL9hOo+/a6PbBwNbQp5XAShxkEQdYibVBQLBSs67c4kqZ9Nl8w6cBxOrBzqJoBdZF5
 IiUfSeT2UNtDkxZaW5ho/T3fhaYDvWcy5aWRjv+ky/E62t/+yxWFChE
X-Developer-Key: i=pankaj.patil@oss.qualcomm.com; a=ed25519;
 pk=pWpEq/tlX6TaKH1UQolvxjRD+Vdib/sEkb8bH8AL6gc=
X-Proofpoint-ORIG-GUID: SscBztD2pt99AXFBwF20dd62UZP7qVGY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDExNyBTYWx0ZWRfX3KJZ39AOb5kV
 +s6RbaG72w2LrDDjY4Oyng4ofAuGgsPIjJZkadWN/5TCNLozLL7k/FqLdNUuFrFQCVls9VRSZm4
 LwY2tfJvtQorsaF6C0Bs61YJnvwNNy9g4lhgzttcdK6bKVmTDYNEjNtqPmhvhc/dTsQnUKZdWSc
 Jx9yiPoiI5Rg76HQ4STJ6C228PKs5PxzbNq6M0F24ub28k1P4NUK6k8ziOiUzmRUkuQWXEUu8CX
 QX16nmzp3HRwg9xHGo0MFYzw/puhuqM71GuEot17X2wQqBwvW9NR0h5ZDWo9DGGruK18/rJHAKO
 9cqyQpIDgkT9ZhQ6ZIHOXVtUerd2DWIIfBKQRyqg5ubEHSj6ibZRY//RuEEC0M2Q3N/Va9IbYYR
 6uYy80vYGIeBVCC/t7NZvmMtcch8/S687QPj8h45dBiqgoU4zGuDyZyHLJyDMZiem9BClG/glX6
 iZtaD+TtuUCGO1MpsNQ==
X-Authority-Analysis: v=2.4 cv=G+0R0tk5 c=1 sm=1 tr=0 ts=69724123 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=qC_FGOx9AAAA:8
 a=pou2ygFnXE7-ag75BL0A:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-GUID: SscBztD2pt99AXFBwF20dd62UZP7qVGY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601220117
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90231-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[codelinaro.org:url,qualcomm.com:email,qualcomm.com:url,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pankaj.patil@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3926D68EC4
X-Rspamd-Action: no action

Introduce dt-bindings and initial device tree support for Glymur,
Qualcomm's next-generation compute SoC and it's associated
Compute Reference Device (CRD) platform.

https://www.qualcomm.com/products/mobile/snapdragon/laptops-and-tablets/snapdragon-x2-elite
https://www.qualcomm.com/news/releases/2025/09/new-snapdragon-x2-elite-extreme-and-snapdragon-x2-elite-are-the-

The base support enables booting to shell with rootfs on NVMe,
demonstrating functionality for PCIe and NVMe subsystems.
DCVS is also enabled, allowing dynamic frequency scaling for the CPUs.
TSENS (Thermal Sensors) enabled for monitoring SoC temperature and
thermal management. The platform is capable of booting kernel at EL2
with kvm-unit tests performed on it for sanity.

Added dtsi files for the PMIC's enabled PMH0101, PMK8850, PMCX0102,
SMB2370, PMH0104, PMH0110 along with temp-alarm and GPIO nodeS.

For CPU compatible naming, there is one discussion which is not specific
to Glymur, Kaanapali and Glymur use the same Oryon cores.
https://lore.kernel.org/all/20251119-oryon-binding-v1-1-f79a101b0391@oss.qualcomm.com/
We've kept the "qcom,oryon" compatible

Features enabled in this patchset:
1. NVMe storage support
2. PCIe controller and PCIe PHY
3. RPMH Regulators
4. Clocks and reset controllers - GCC, TCSRCC, DISPCC, RPMHCC
5. Interrupt controller
6. TLMM (Top-Level Mode Multiplexer)
7. QUP Block
8. Reserved memory regions
9. PMIC support with regulators
10. CPU Power Domains
11. TSENS (Thermal Sensors)
12. DCVS: CPU DCVS with scmi perf protocol

Dependencies:

dt-bindings:
1. https://lore.kernel.org/all/20260121-glymur-pmic-mfd-v1-1-2aab4f21e79c@oss.qualcomm.com/
2. https://lore.kernel.org/all/20251215-knp-pmic-leds-v3-2-5e583f68b0e5@oss.qualcomm.com/
3. https://lore.kernel.org/all/20260121110828.2267061-1-pankaj.patil@oss.qualcomm.com/
4. https://lore.kernel.org/all/20260111155234.5829-1-pankaj.patil@oss.qualcomm.com/

Linux-next based tree with Glymur patches is available at:
https://git.codelinaro.org/clo/linux-kernel/kernel-qcom/-/tree/b4/v6_glymur_introduction

Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
---
Changes in v6:
- Moved pmic thermal zones to their respective pmic dtsi files
- Link to v5: https://lore.kernel.org/r/20260122-upstream_v3_glymur_introduction-v5-0-8ba76c354e9a@oss.qualcomm.com

Changes in v5:
- Added opp entries for pcie nodes
- Dropped qup-memory interconnect from uart nodes
- Update trip1 type to critical for pmic thermal zones 
- Alignment and newline fixes according to comments
- Link to v4: https://lore.kernel.org/r/20260112-upstream_v3_glymur_introduction-v4-0-8a0366210e02@oss.qualcomm.com

Changes in v4:
- Enabled PCIe SMMU for all 4 PCIe instances
- Updated dispcc required opps level to "rpmhpd_opp_low_svs"
- Updated watchdog compatible
- Renamed gic-its to msi-controller
- Updated GCC clocks property to 43 from 44
- Moved cpu-idle-states to domain-idle-states
- Fixed alignment and zero padding issues according to review comments
- Dropped glymur-pmics.dtsi
- Moved pmic thermal zones from board dts to soc dtsi
- Link to v3: https://lore.kernel.org/r/20251219-upstream_v3_glymur_introduction-v3-0-32271f1f685d@oss.qualcomm.com

Changes in v3:
- Enabled system-cache-controller
- Squashed all initial features to boot to shell with nvme as storage
- Updated tsens nodes according to comments
- Merged tcsr and tcsrcc node
- Addressed review comments
- Link to v1: https://lore.kernel.org/all/20250925-v3_glymur_introduction-v1-0-24b601bbecc0@oss.qualcomm.com

Changes in v2:
- Series was sent erroneously
- Link to v1: https://lore.kernel.org/r/20250925-v3_glymur_introduction-v1-0-5413a85117c6@oss.qualcomm.com

Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>

---
Pankaj Patil (4):
      dt-bindings: arm: qcom: Document Glymur SoC and board
      arm64: defconfig: Enable Glymur configs for boot to shell
      arm64: dts: qcom: Introduce Glymur base dtsi
      arm64: dts: qcom: glymur: Enable Glymur CRD board support

 Documentation/devicetree/bindings/arm/qcom.yaml |    5 +
 arch/arm64/boot/dts/qcom/Makefile               |    1 +
 arch/arm64/boot/dts/qcom/glymur-crd.dts         |  601 +++
 arch/arm64/boot/dts/qcom/glymur.dtsi            | 5913 +++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/pmcx0102.dtsi          |  187 +
 arch/arm64/boot/dts/qcom/pmh0101.dtsi           |   68 +
 arch/arm64/boot/dts/qcom/pmh0104-glymur.dtsi    |  144 +
 arch/arm64/boot/dts/qcom/pmh0110-glymur.dtsi    |  144 +
 arch/arm64/boot/dts/qcom/pmk8850.dtsi           |   70 +
 arch/arm64/boot/dts/qcom/smb2370.dtsi           |   45 +
 arch/arm64/configs/defconfig                    |    5 +
 11 files changed, 7183 insertions(+)
---
base-commit: 46fe65a2c28ecf5df1a7475aba1f08ccf4c0ac1b
change-id: 20251007-upstream_v3_glymur_introduction-5a105b54493d
prerequisite-message-id: <20260121-glymur-pmic-mfd-v1-1-2aab4f21e79c@oss.qualcomm.com>
prerequisite-patch-id: bd5a4703a5a7fc530418337680cf1e2ea1518f35
prerequisite-message-id: <20251215-knp-pmic-leds-v3-0-5e583f68b0e5@oss.qualcomm.com>
prerequisite-patch-id: 6bbaff642cfd1f1386ff0ccd746739b68cdbeb45
prerequisite-patch-id: e30603778b23b7f7586b1c01a362e45af7bd0aa3
prerequisite-message-id: <20260121110828.2267061-1-pankaj.patil@oss.qualcomm.com>
prerequisite-patch-id: 14469fd166b31b251b98bf25e783ab6f57ddd13a

Best regards,
-- 
Pankaj Patil <pankaj.patil@oss.qualcomm.com>


