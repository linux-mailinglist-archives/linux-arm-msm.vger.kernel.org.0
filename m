Return-Path: <linux-arm-msm+bounces-71827-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E30B41D7F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 13:51:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 139141BA6995
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 11:51:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEA442FFDDE;
	Wed,  3 Sep 2025 11:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H8ElKYNQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C6EA2FF661
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Sep 2025 11:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756900094; cv=none; b=bVc8pKgynQVLRgDSREWUiw9uhkxEHUVp4pYAOO1iI6ui+8vsx3O008iNj9eFqqxHPIE57JgTxojU+mFx8klGUun4QUdoqiHIrkw+Jd+h+TI7LJ5UwPvGdqYUnPA9xGgQxTLSNS6cpqN8eDhY1T0JFUaK6T9nOGbTNN4mbjrC2Qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756900094; c=relaxed/simple;
	bh=d/8KcN+OgREoal5l5Y/MZyinEyOohKBfCQCl2h9LqwE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FOvGr0+Yx0m7n7MgjKNKwnKbqi7lY5QCSk/SV1PuRCTcrtscdIcrBTQN1iia8lzZl8nLUvGhiuCSrq0ToYBOvsa/nFD463g+1hYRcswgfOdtWZxbYL4OQmsOBbfEXyDJ7tmjDGTSDgqODJwtojcgE0EMyd9FenXeXsJjK4ISTKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H8ElKYNQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583BEx79004951
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Sep 2025 11:48:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BGCKdyi9/G2sO0XrDIQXa/zPVi43JbEno1jV9pbfWBk=; b=H8ElKYNQ4w1OS2SY
	cRjRfLQNXhGZiIT++U+Rj2qGBb9E5/ulQqhy5WBiIY5iWF8F2hmUhcM/rQHVeDe+
	nWssRucKJypAwezIhYKTmmLcFQeo+Jzp56nfQ3f9oEtJxmf/hEms6ceLHyisDpXz
	XhNy4DskGSvOW0IPoYnaHeyKPE57rh60we20aMtvXgOWAqk9dTRWbF3yuGgFMy+S
	heyLA6NhhVQWvCO5lh+/k/8ikAohrif4vmQdw6yg2B13FWQMF5iar7lLMg+6Kszo
	4PmJH1h9C1ENdaBnFtrF4fO/aFRHR63bdEFg3j1Rc7EMAUBRumL0O05t1ngteZnb
	tzWYYA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ur8s3jvt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 11:48:12 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-76e2ea9366aso6349672b3a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 04:48:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756900092; x=1757504892;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BGCKdyi9/G2sO0XrDIQXa/zPVi43JbEno1jV9pbfWBk=;
        b=NGz2zeI5kb3G7OXqfRZS0NXE2qQqbENia9oUuLoa2TD84xpNEvHcbaq9sj2gd7jVTR
         IzrYmohWAf9yz1MjhV6NEKC1FlBGeKrHYpttWmhIitV6V6m7BcIofkNMNWKH14nFG46e
         9bOhfC/jLjphlGoUovRugmdZQwvZh6to+UP7/6KIlNQ5XIh94JCvLU7DuWh5nigSpSoE
         zO3EtGRq/melF6BYkc2nwiBerTjq3k2EQNtq//n7FpssD9BoFnUA6lSnLCpHnzWY81F/
         S61ltk1QR7Qhcyb/48BxvwQmgbvJTXdIm93f3yDGqB/Ke5t5txuNqaZBdvyd6JQ+n7Jd
         WG5A==
X-Forwarded-Encrypted: i=1; AJvYcCXsRAipqgsZsItD4XzFAxDedfV3aB96L/8CXwG7bh70/QlLtS3XpqiwaQ0z9EikewWfBTqWDE079aDxVJLQ@vger.kernel.org
X-Gm-Message-State: AOJu0YwDHfcc44u/lO3CAkUfXLxivudi/YiH2EXx7zV29CVBuejH+HHh
	D9p6Zybi5dUocZy/zSnocUPSMgN+eivkwgtUX6pgJB6dxl+DDNZjpKLNGqgwnOKBG9UF9I2pFNz
	o7uYoYvBr4B6TYl6G8ql7E/4fqDExwClijv0scVMHv4ol6Xqz7lB4QOqkyWrY0od5rzIS
X-Gm-Gg: ASbGncvZYGZ1EpelyMmyVHBfHsj9zpKb7MukyDzbhVuTr95SczMzoSfh1d9sFmEO4Xh
	5hdSi2+s2pZkOsNDYg5UNEZ8RK1aC8C+sJf0hO3LGM9yeI0nBXIXVMXKxy6mNLjOg+BnqIxs0pv
	0JatWVYRkxRsH8rD7BmEPEwt2Yg8i7Sc9HTw1J8MdhPT+cAT9ZJkfsJMrGK0ZNcDnKwWb0aRCfs
	C1JE1wmVcuCjRjjxFiAsD7x8aMlHEJ1u3GJt8mA2/8DlZjF97uLUUb+vx60U/BD9+9cH5yyUSRE
	OKyMLdsLbhml3qfrHJRSqLeeOhVLyiz3l8tbx6m7CTz4ykpQTzcty2B+8OO8eVTvvnIP
X-Received: by 2002:a05:6a20:3d91:b0:246:9192:2789 with SMTP id adf61e73a8af0-24691922d9dmr3770138637.49.1756900091726;
        Wed, 03 Sep 2025 04:48:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IELpa4Dqb/ri4sikbh2/35FUCgGSrLzAq9vhNEPG8ilfsdeKswwyiLmoPL40YnRVxfbYYh9wQ==
X-Received: by 2002:a05:6a20:3d91:b0:246:9192:2789 with SMTP id adf61e73a8af0-24691922d9dmr3770107637.49.1756900091220;
        Wed, 03 Sep 2025 04:48:11 -0700 (PDT)
Received: from hu-wasimn-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4f8a0a2851sm6584074a12.37.2025.09.03.04.48.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 04:48:10 -0700 (PDT)
From: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
Date: Wed, 03 Sep 2025 17:17:09 +0530
Subject: [PATCH v2 08/13] arm64: dts: qcom: lemans-evk: Enable Iris video
 codec support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250903-lemans-evk-bu-v2-8-bfa381bf8ba2@oss.qualcomm.com>
References: <20250903-lemans-evk-bu-v2-0-bfa381bf8ba2@oss.qualcomm.com>
In-Reply-To: <20250903-lemans-evk-bu-v2-0-bfa381bf8ba2@oss.qualcomm.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: kernel@oss.qualcomm.com, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Wasim Nazir <wasim.nazir@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-e44bb
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756900050; l=865;
 i=wasim.nazir@oss.qualcomm.com; s=20250807; h=from:subject:message-id;
 bh=Lwi6TRjPF04O/1B4XCSUMzPV5zfW+xGiP2gdnJ+he1c=;
 b=iKATISuLMw0sB5ZAmFurgIKPxiRrhFzj4GxgOd1LLCa9pPqVxB+oD4RcAcuMndX8Z2sJ5j93b
 Iu5LRYW2UY3CjLniV4Y7XKG505xiJsX6jBly/7LCNpWVf5DXAO362en
X-Developer-Key: i=wasim.nazir@oss.qualcomm.com; a=ed25519;
 pk=4ymqwKogZUOQnbcvSUHyO19kcEVTLEk3Qc4u795hiZM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAxOSBTYWx0ZWRfX60mp5ER+svC5
 40t/VoCvhT0X34PgQYXREnFJ5RWkmgX2wgCxXNTjUxbpA5hRi9cfna4fCWNLRFGUODawfOWzIIJ
 u8o3cBhoiXZ8GDx/64KfH/R1eXx73f4cbgD+ajRDk2rzG+dpsmuEDxT6cjS9w5m8FcQp6OaBflR
 HzWYt+7CxOMGess+HRKfYzxyVFhQe4ahvKypGTADK4bYshKvG8infwq8eRtaO276cbhkz4GJ0IR
 T9ll45jWi7ieE8jyKja+23fB6Y6BNA/vj20SVVRYewlq75E5pmIknKQoRx/ZNzpxBrqRnf/W8dT
 oAb5I2OkVrKgyHoarNtuFyYao3oSsSFJlWYAq72xsJM7+hbxpjEO4Zk4AukDrBp/jLonIZbw10v
 C3VDtFW7
X-Proofpoint-GUID: 6-IO7f6ReU7qKiDUBvI26BhlzVft_36R
X-Proofpoint-ORIG-GUID: 6-IO7f6ReU7qKiDUBvI26BhlzVft_36R
X-Authority-Analysis: v=2.4 cv=PNkP+eqC c=1 sm=1 tr=0 ts=68b82afc cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=9guL5b7EFFMc6jyTlUkA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_06,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300019

From: Vikash Garodia <quic_vgarodia@quicinc.com>

Enable the Iris video codec accelerator on the Lemans EVK board
and reference the appropriate firmware required for its operation.
This allows hardware-accelerated video encoding and decoding using
the Iris codec engine.

Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index eb7682fa4057..d85686d55994 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -333,6 +333,12 @@ nvmem-layout {
 	};
 };
 
+&iris {
+	firmware-name = "qcom/vpu/vpu30_p4_s6_16mb.mbn";
+
+	status = "okay";
+};
+
 &mdss0 {
 	status = "okay";
 };

-- 
2.51.0


