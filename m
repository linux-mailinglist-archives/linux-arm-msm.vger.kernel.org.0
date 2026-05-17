Return-Path: <linux-arm-msm+bounces-108054-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +N94Inn8CWpPvwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108054-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 19:35:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D2A225629E3
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 19:35:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 609CA30053C5
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 17:33:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F2DF275B03;
	Sun, 17 May 2026 17:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QOLCIXrb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZJ9y++I4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0BD224BBF0
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 17:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779039211; cv=none; b=rkQwDE3kNL3Dxs+kCuvVnUXyRPdvfToSOeSHoGKMfh53Bdc8aq7s70XVQoOYkuB78VsRPFp2gfVaSX/xA+ok24uxGcEeaJZwg5PAbq33I72tWOyDdQaUjukQD48GsQCgSTqwTKIKZHurtgItYN/B9v32utacjTWMedk5McaBIwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779039211; c=relaxed/simple;
	bh=/AeskSQAB+GvkvpbhAQK047uAob7kM+wJqfSBgGdkZ0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=kgYGLoYX2dxCGJT+adp74HalLTlsy39Gl9PafvKpvCzJ3DkuBNuy4GEmom3hFNWFwLYa1OlPcA+T23hyQiLU50iQkZF543JaEb0rfSyYaP0ZO9Dm+HetHrl5X7j3JDe4KJ+SIqMpRxCykK+Dq3S7rxzhWWQYYXRsaXDcCld4K7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QOLCIXrb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZJ9y++I4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64GMjinD1879331
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 17:33:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=CtCk7wO3QRicdXUPJEyQ9R
	e7pEma9qkfvLI2CfxWtzQ=; b=QOLCIXrb84Hn3uklDwafHLKU9Rpl6Z1SBiDbXk
	afUXnDQqT8Qr30pa8qYnL/JOQV+g1yZ2s7SsNbWBhgM9A7GI4WfbIS6MBd0B1OF5
	9ICnhfyvKZI1x8A6w2LdKkGpgX269MvQ7q37P92i83dAlnqjk5qwovLo+xLkbMF+
	dZRlspMLp5+GvCaxeU9uUimSZdyT2mulqmg21kVA6MZ9bCXjZ2o7VSJQTiD9/A9u
	o0QKBJVNPTQ2g4EMTGq/UbqsGfOnhWcnXQKoniECzW+pryFKAN7ysuSzSNUbuUM2
	yQ50HiM08WezK88uU7jKLhvSAkuDdOOCSZxtCl8q+pdJSXgA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6gyw39a5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 17:33:29 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8386367b23cso959909b3a.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 10:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779039209; x=1779644009; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CtCk7wO3QRicdXUPJEyQ9Re7pEma9qkfvLI2CfxWtzQ=;
        b=ZJ9y++I46HDLu3OsTAdyCi5ykmpjlt19YWHEColO5KzfhxonvEI5g8kzDoDHGf9xQb
         D4Wt/dCcg84ps0sr9SLwCcii8pX9F8TbYEjqkvKDQmIRa5y6vj9lxEB9xeCg7rukL0zC
         jN7FKemgAdfQPDWMDGPnfnqxbpo4AOIItnTTcDQOVPOOjCNXDYocQzkQPxbzlPRToDzt
         ytxeUNGmRD4G7NV+fVx+VWBJNsrUIIcE9JsFgFXQFhj8rsThc1pv31nG/Sl3HsK2TI6B
         1lZ3JLlF9DKvnD6Epqi257f56glJbzFMzL5+/ZIYLwLH+yG6EF+G66NWTH2gtyzE6LSk
         qEdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779039209; x=1779644009;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CtCk7wO3QRicdXUPJEyQ9Re7pEma9qkfvLI2CfxWtzQ=;
        b=b38UvP8AutQxcvzh+e+NQEm9V7JAAvJTLZGXesRcVPdxVO8t3DUoTW60xjUOvX7Hpu
         mWrg1GBOURYQE0AADR87Rl/iH4vFdPueLLwXMBueTMhbIif/thyZS4WQNOoToHs1pGZD
         NeJQQF0V8lh7JgGKYm3LQy+c63IQSd+M1PpGphn8LTa1sARbMiL+ed7wY9uHfca+VUfG
         wacTfgk1nLQNeyzCHcK9e3aA/8+u3nBoZ5zo0AdreQfXnCz/FyyRkbmD7DE5MFYJGVc6
         p4XzvQqYuMlQ2/aEdSlzd66Yt+vUxVP4Kzrc0nLEi04lW0YxH69x/MuOY6dDu8PdsUhg
         58ew==
X-Gm-Message-State: AOJu0YyLi8XmKDAV/ToFWd11AE7yXF8hN0xf3mvHuRElYgh8q1uyqtZP
	7XeOC7A8rPFkU4aCEClC+a0hQ2gxi+X40M6lmT4yH+5s8NaYyt55uH0gr1wk/1QuV3yWT9hEh1l
	Qeb+YMRJyF9huwPlSDNMizhJUCVYlrq0JJQXHVYktJPkDlc630TNh12sKUMvwrOqTm8i8
X-Gm-Gg: Acq92OEK3Dx0ySyQnBJS1c4AtsjT6Jp0veRp4WdK9gpL4xODcKOWchbx9AC/aG6qlmE
	O/Y2I3ZDDehCkEbibhk07EehSmeFWh83Wa2hmxo35QJdtYXGfbI9aqWeGaUFi6YCb8ha8SOb/hV
	67hOOQU4YRytYSu5GNnSZF9/TtNTAl8l9jrTfaFtzDA6U7AVXEic2w+WpHQ5nD6RiIl9snDKJV0
	aoXDvysrXVjSAsb+dHq2NXOkzrA9eYOknoq5YCl3N1+1eV63c5nac9f/CvysLiHTgE69t7Omu/x
	1s0DqUUYMhbG1lsiLIKPU/5ppHNnElFyMoKrzyM9F5O3FepKFvq5UByNrX8eM+WwJpeE0iq2ORU
	saxxmwsMWn2MiKxcAMz96bviyB8ZBpcnqmpcDxfuNEj4geWAtukEj
X-Received: by 2002:a05:6a00:bc93:b0:82a:7893:e14b with SMTP id d2e1a72fcca58-83f33d98510mr11947009b3a.38.1779039208599;
        Sun, 17 May 2026 10:33:28 -0700 (PDT)
X-Received: by 2002:a05:6a00:bc93:b0:82a:7893:e14b with SMTP id d2e1a72fcca58-83f33d98510mr11946993b3a.38.1779039208116;
        Sun, 17 May 2026 10:33:28 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19778c87sm11331567b3a.19.2026.05.17.10.33.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 10:33:27 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Subject: [PATCH v4 0/3] Add camera clock controller support on Glymur
 platform
Date: Sun, 17 May 2026 23:03:06 +0530
Message-Id: <20260517-glymur_camcc-v4-0-9d00acffdbf7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANP7CWoC/3XOUQuCMBDA8a8Se26y3dRlT32PiFjbmYN0taUk4
 ndv2kMl9XLwP7gfN5CA3mIg29VAPHY2WNfESNcroivVnJFaE5sAg5xlXNLzpa9bf9Sq1poiCGb
 4yZTCCBJPrh5L+5i5/SF2ZcPd+X7WOz5tX1DK4BvqOGUUN0axTAE3Su5cCMmtVRft6jqJg0xeB
 x8GFAsDosG0KA0vpNzkxR9DvI2ML/8Q0VCSF3mJCFL+MsZxfAK0K1HBNwEAAA==
X-Change-ID: 20260517-glymur_camcc-e230d1bdf3d3
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
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE3MDE4OSBTYWx0ZWRfXxBx+0YK4bgBP
 0/1orRlmn0aUAjjGWK2Yq3kqKKC7cBMRpRGB3GOEU3BZ1bDwoHgoqyFXELFE28AivTVFLhqySog
 +2reuTU4xRR9mrYMC/UFtbZB+7ye+IO7iGqqpLJXgoFArpiUaxzX4k1YbxsrsticG8odw0PxIeD
 R/7nx4bCkNs6dJXE19n8L6W66kQgXzfYnn5MTmHWz8ZwVP20H6F8mUgLv0sVfv7bytjTO+bpaN1
 vg/G/Sw9UwuLaYEDUaPHNt9vWZocakPxy6cHM+MUXO8PQ5IWFO2+GirJKRzMioqGOseO9Zrtus9
 vSzg02vJidv28wnbfCRy+6mS8n8f6tTEIa5slZXJfpT0f3WHTYCAVnvEd4E0EznKrMKHAMvm64a
 yW1I/NVef/ZvALH+6dz5Ufu/cZUQZcS4fiBhC+GZ1mza5F9rQvgJ8PlEsWtNrp9wK7Q1x3Jdico
 HGQQtU3G7G+uwTFEuQQ==
X-Proofpoint-GUID: WiWw7QL4K3DLi-iPBnF5lXDwGqsVJgml
X-Proofpoint-ORIG-GUID: WiWw7QL4K3DLi-iPBnF5lXDwGqsVJgml
X-Authority-Analysis: v=2.4 cv=E5v9Y6dl c=1 sm=1 tr=0 ts=6a09fbe9 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=PfRGEEtQfDBBo0DW6aEA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-17_04,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 bulkscore=0 adultscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605170189
X-Rspamd-Queue-Id: D2A225629E3
X-Rspamd-Server: lfdr
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
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108054-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jagadeesh.kona@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add support for camera clock controller on Glymur platform
for camera clients to be able to request for camcc clocks.

Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
Changes in v4:
- Fixed parent src in ftbl_cam_cc_xo_clk_src to align with it's parent map
  [Reported by sashiko-bot:
   https://lore.kernel.org/all/20260513215441.E17B8C19425@smtp.kernel.org/#t]
- Added R-By tags received in v3
- Link to v3: https://lore.kernel.org/r/20260512-glymur_camcc-v3-0-a7196fee2779@oss.qualcomm.com

Changes in v3:
- Dropped separate defconfig change[PATCH4] and included it in Kconfig
  itself [Krzysztof]
- Included glymur camcc header file in the DT patch
- Added R-By tags received on v2
- Link to v2: https://lore.kernel.org/r/20260429-glymur_camcc-v2-0-0c3fd1977869@oss.qualcomm.com

Changes in v2:
- Updated DT node reg property to use hex for 0 also [Krzysztof]
- Added R-By tags received on v1
- Link to v1: https://lore.kernel.org/r/20260402-glymur_camcc-v1-0-e8da05a21da7@oss.qualcomm.com

---
Jagadeesh Kona (3):
      dt-bindings: clock: qcom: Add Glymur camera clock controller
      clk: qcom: camcc-glymur: Add camera clock controller driver
      arm64: dts: qcom: glymur: Add camera clock controller support

 .../bindings/clock/qcom,x1e80100-camcc.yaml        |    3 +
 arch/arm64/boot/dts/qcom/glymur.dtsi               |   17 +
 drivers/clk/qcom/Kconfig                           |   11 +
 drivers/clk/qcom/Makefile                          |    1 +
 drivers/clk/qcom/camcc-glymur.c                    | 2280 ++++++++++++++++++++
 include/dt-bindings/clock/qcom,glymur-camcc.h      |  122 ++
 6 files changed, 2434 insertions(+)
---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260517-glymur_camcc-e230d1bdf3d3

Best regards,
-- 
Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>


