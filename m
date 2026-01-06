Return-Path: <linux-arm-msm+bounces-87648-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D7E2ECF7657
	for <lists+linux-arm-msm@lfdr.de>; Tue, 06 Jan 2026 10:06:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C54923032952
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jan 2026 09:04:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B48E30AD10;
	Tue,  6 Jan 2026 09:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cWPR0GNW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bUjqwhYk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A41EF2EA468
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Jan 2026 09:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767690270; cv=none; b=Kj/JGafMxaRkWV4gBCN6rynrikTMwaqZygINLm/2V/1rTjLYhh3uxr1ZwM5r7X/zYdfNmoF1hNYofzgSe/RpyhfYRPz+UcVxcI8wEf+Swhn18C5KyWCPOuwEIaTY95MpRe8PK6AcDR53S/7ens9ZC0CPfxT+EyY+fYaTEIy3dao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767690270; c=relaxed/simple;
	bh=hVeR5youbTm3RL4FKz16cxBDUrl9smFkpmmGY9pzlCo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=IOKcHMJFkK3AJ0+UoPrih0Pt3SqJyCFOw/g6mPZbFzGgGkNwjESU+B2hJEj2dc9E/H+GzjWVNcnVd4QdGY7IgEauw4/BeESoWaP7kG+eKKZboNnqTPg5I6Rm/e+i/6FzWIjTmrQ5KAawfcnDZvAVyxTCukBP151Cl6FgLqYVcpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cWPR0GNW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bUjqwhYk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6063Q9an3052764
	for <linux-arm-msm@vger.kernel.org>; Tue, 6 Jan 2026 09:04:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=c8AgQ5lWwyDMiA9CXPUO3v
	mruoWnhOUCOmin54FtXBw=; b=cWPR0GNWwvMVsneThOsPIIXrlan3eIyO6Bh+1t
	P0Ruawoh9n0KQDAkBIlrn3xr3+KTVVDX4V1MCdQdudQZ7YwxziWRuI8sJJ3TPpu+
	MWkV5470wKipB7TVPf93d0rI/Dcqq0lwchN4j0q9MTFWbz0R1KmqoKc0rKb1wrsa
	oGYz5OVTnYMpA3S1+9MKFmEu0WfI3hvhjh8YZBWJq5cAZeg+/SxAMqjC+YRe1mRJ
	yTsqS3a4MCWXeO1DBEGGc18g1Xe8SuN5oRGJFiaIdbGqv5y1hcMnxcRSTO9NSRrQ
	Z9P9enrlxVmqgGB108AlG9dbT71TvVrKr6rApNMjE8jatCUQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgpn9sf47-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 09:04:27 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b22ab98226so272566785a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 01:04:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767690267; x=1768295067; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=c8AgQ5lWwyDMiA9CXPUO3vmruoWnhOUCOmin54FtXBw=;
        b=bUjqwhYkDzYAdOCADbTFTYF320EqVflTKlePN3XDhxMeFrOIdvSBHge+YyDsHQce9t
         OViST7R9BpeSngdVf5GWrz+hLnYydK9KbbhgfNxd/rACr6ejbiMU440DfbdjeKW7E3MD
         HQ4rnUFlLXcVnVk+v53pXg/xuOpuYPRWJFKlLWiKt39gpUTlqIvYOXMK/JGDb4r7XaEs
         bbdIOYicB8lUWHNnMLDu4+aJmJ2YVc5Mj0rL85X6pg7sPICjlbeSc2lnKxwJJ0qdWr74
         eb4uw70EnHYEm8We2ghLI18hzFTSbYM3S1dpNmVPeXphHVcH021PkDr5rijtiS7K0xg/
         3YpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767690267; x=1768295067;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c8AgQ5lWwyDMiA9CXPUO3vmruoWnhOUCOmin54FtXBw=;
        b=GA2KnyiEZ8ZpTBQjiX7s13P8OLUnT6SIJTXnei1hu41AB3UjjRI9NtA/E+62mFKztu
         DGqO2amBGpFkWjpIorn5ULcjChfOQZijeL6PTT77gRHocxT3nwYaZa0g0L4FAB8nk/D7
         kqNhz13R9Rh38icZDa4iv3g02MvTkFJ/hH+1q2jkIn+blcARtR03iIhGnkowg/41Zzhm
         9afaYWKagH8V2JBFxU6Al7SnSfDG/1JxsS/+HLnVHnISyvPJ6ONBoBTdxc26CoytHh8q
         vGVNCp1Ys//hnpx1Cfhsu5PS6NHG8sP+AP7FYYj9L6/XL/d0ey1gcK6Z0EDPkc9tigti
         AHfA==
X-Forwarded-Encrypted: i=1; AJvYcCU/5AcaUFElSq1gct8El69kVjCLKs0NK7t+GMypyYR3H55lHfESe8Sinh5GmR5/S5WX6fbng23W/FrpWeRh@vger.kernel.org
X-Gm-Message-State: AOJu0Yw26P18joiS1GlE+cWRLQAC9Z0pQqpAaeliHDMks0fay5u3rA1Z
	hWBJPN14q5dYqdB9vLZEZb/gUCCmZro8dxvls5uBrAqmMBkv22O/6mhRdU83lgloq2EDZW2nieA
	pYFyaqoFJ/hYaHrRu185Bk638yroIYJdlL228w7azJjOwIbH2aCZVbGT0cJ4XrqGBoEpG
X-Gm-Gg: AY/fxX5wAuX4yNWT0yrxJxi4EdpQA1/k+ba4J7OZZmetVysAK+/0bX6MDbO1IXOxBnG
	Pt2vAcB5HEAmZTNboy/HUC8mlSbvP24QqSFwONpuLiVK5NJVEtaoY7jfQaK0/RK5UYKWsiHBilV
	rIcvnFRSFPOu5Jvq3XLO4BSWU6uKYE0qB5PWWs7YkvwHWEzd1USxxsSUW3RuDDI+KjMJThvroX2
	9UQp2ciBCujNsJZDq8ae2h2/5eMn9FnhcKSbcemkZDO28/EV1Zt7RgKu4q33Wrtpf3PHA50655f
	xUTxkR3fG0Qwr4670ls5R7zHJgJAvihPy7b11XG9fHSk7A6CMDzq1gy9k3nfrkZTh1m2Py7rq+I
	8hSYJ7jd+0vPmKa3BSKejuT8FNYGDVViYrd4cu1GwgR+UDYtcXB/CaSlyeX4ugaEDJkRZcXC/Mi
	Bf
X-Received: by 2002:a05:620a:28d3:b0:8b2:e598:e311 with SMTP id af79cd13be357-8c37ebce23emr314296385a.50.1767690266907;
        Tue, 06 Jan 2026 01:04:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF/GaDPtRPnkK8S45mpJ98x0kSpqB2KEhv8jQ9Li3nj5pJc2C7cAKAX17XPiS3YlFTD6ejDmQ==
X-Received: by 2002:a05:620a:28d3:b0:8b2:e598:e311 with SMTP id af79cd13be357-8c37ebce23emr314292685a.50.1767690266453;
        Tue, 06 Jan 2026 01:04:26 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f53113fsm134368185a.41.2026.01.06.01.04.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 01:04:25 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Subject: [PATCH v3 0/3] media: qcom: camss: Add sm6150 camss support
Date: Tue, 06 Jan 2026 17:04:15 +0800
Message-Id: <20260106-sm6150-camss-v3-0-d1d5c4d02b0b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA/QXGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHUUlJIzE
 vPSU3UzU4B8JSMDI1NDIyMj3eJcM0NTA93kxNziYl2jJBOztMQUCwuTlGQloJaCotS0zAqwcdG
 xtbUAK54Ful4AAAA=
X-Change-ID: 20251222-sm6150-camss-2b46fad884dc
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767690260; l=2340;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=hVeR5youbTm3RL4FKz16cxBDUrl9smFkpmmGY9pzlCo=;
 b=/zCx4du+mAj/JxzfHShLY62fSlhHg+dc7HkAjPsD3dj4xnusexG3tIZNHC//CTB360ialwijM
 ehLv6MKrodRAL7MB9UlvEqFNLMtVr4TCznmU4Jb4XG32HPixDVmpWBU
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-ORIG-GUID: FGDuOYWGr-yfCeFAWvLi2E1BYG5AvZ7W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDA3NiBTYWx0ZWRfXy1GGCMzWVAZN
 Rgk3D5jqfBZRSV784D9VC+vkCRVDxWZ9u7qREjWwhuAJjv5wqol2WXTkvZ8CSx+kWamkv6jYBaI
 5gF8hcTdk59Irp/JSbzM15S8xJi9eJ8dYVN1VHwhKAfrHipuziAOOZK7xlnf7tcB1ng7c0s8oq7
 jLuPlra2i4Pd1BMd4TwlHnkHVkz/hhn+LEWnUVlFPXiTibxhKNSW2tqDepDdprx5h5BnVtNG1rU
 IImhhHwCzdq6JnkaJ8IZejJ63Ra3VuaApV6R6XHcNwoIkOTteovBBSnd7aOdNUKe6qSgKv2ybpT
 GWkks9fftUJpgoo0A+QavcJkYSo4x/53tZf8uaYh+9KeaEV07FEMkUMn9XBB0FIKlAGVoPYM46z
 Sw1W5P92uV827KB/DkX6QQTMzodvo2mxhVdR+Rat0xyi/29/nVkmJm95h+Od/sYTXfvlF2Rcecu
 aSitjrT4z+Ws12cl0uQ==
X-Proofpoint-GUID: FGDuOYWGr-yfCeFAWvLi2E1BYG5AvZ7W
X-Authority-Analysis: v=2.4 cv=KfnfcAYD c=1 sm=1 tr=0 ts=695cd01b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=b5PrnZgeE6CfPZZ6BtAA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 spamscore=0 adultscore=0
 suspectscore=0 malwarescore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060076

SM6150 is a Qualcomm flagship SoC. This series adds support to
the CSIPHY, CSID, VFE/RDI interfaces in SM6150.

The SM6150 platform provides:
 - 2 x VFE (version 170), each with 3 RDI
 - 1 x VFE Lite (version 170), each with 4 RDI
 - 2 x CSID (version 170)
 - 1 x CSID Lite (version 170)
 - 3 x CSIPHY (version 2.0.0)
 - 1 x BPS (Bayer Processing Segment)
 - 1 x ICP (Imaging Control Processor)
 - 1 x IPE (Image Postprocessing Engine)
 - 1 x JPEG Encoder/Decoder
 - 1 x LRME (Low Resolution Motion Estimation)

Tested on Talos EVK board.

Tested with following commands:
media-ctl -d /dev/media0 --reset
media-ctl -d /dev/media0 -V '"imx577 9-001a":0[fmt:SRGGB10/4056x3040 field:none]'
media-ctl -d /dev/media0 -V '"msm_csid0":0[fmt:SRGGB10/4056x3040]'
media-ctl -d /dev/media0 -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4056x3040]'
media-ctl -d /dev/media0 -l '"msm_csiphy1":1->"msm_csid0":0[1]'
media-ctl -d /dev/media0 -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
yavta -B capture-mplane  -n 5 -f SRGGB10P -s 4056x3040 -F /dev/video0 --capture=5

Changes in v3:
- Change the ICC node names to hf_0 and hf_1. - Krzysztof,Dmitry
- Link to v2:
  https://lore.kernel.org/all/20251222-sm6150-camss-v2-0-df8469a8343a@oss.qualcomm.com/

Changes in v2:
- Add more resources(BPS, ICP, IPE, JPEG, LRME) and details for CAMSS.
- Correct the order of the header files. - bob
- Add Csiphy id num, improve the resource name. - Vladimir
- Link to v1:
  https://lore.kernel.org/all/20251016-sm6150-camss-v1-0-e7f64ac32370@oss.qualcomm.com/

---
Wenmeng Liu (3):
      media: dt-bindings: Add qcom,sm6150-camss
      media: qcom: camss: add support for SM6150 camss
      arm64: dts: qcom: talos: Add camss node

 .../bindings/media/qcom,sm6150-camss.yaml          | 439 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/talos.dtsi                | 200 ++++++++++
 .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     |   2 +
 drivers/media/platform/qcom/camss/camss-vfe.c      |   2 +
 drivers/media/platform/qcom/camss/camss.c          | 189 +++++++++
 drivers/media/platform/qcom/camss/camss.h          |   1 +
 6 files changed, 833 insertions(+)
---
base-commit: f8f97927abf7c12382dddc93a144fc9df7919b77
change-id: 20251222-sm6150-camss-2b46fad884dc

Best regards,
-- 
Wenmeng <wenmeng.liu@oss.qualcomm.com>


