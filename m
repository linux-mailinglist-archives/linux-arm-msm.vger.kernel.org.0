Return-Path: <linux-arm-msm+bounces-79277-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B5F78C16D66
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 22:00:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 93DD54F27F2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 21:00:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0560350282;
	Tue, 28 Oct 2025 21:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q0UmJYI6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QA4WM7oI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3159350A31
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 21:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761685210; cv=none; b=YQE32bMrsQ8qvC7a8duTTuVLXKs2TRAK6LEy9f9YmdCUyeB3AjvJ09AH/zlhdH/PCok2bt+2oelV+nVYCSXwtyt5id9KKzBUeGeoy+XYOFUXoGzOClDBNweBabU5DeIajeqdSTBgStczH2bSj32vvWkxSVkBCsReBuSWpHC/d4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761685210; c=relaxed/simple;
	bh=wRiosEmTpDAVLVLEoBEb3Ki+aT+vGc91sDzAON0Ob/8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=IBuZz1egci8bUn8ePDcnKGwwOij2vt9RFgSA19+tx4CIBQ1F/Wg68vP1604bgamfBgv2pqUrynOT1PjwG1Q4dMKM7cA3bpmx48I1xuGbtEe3HG9ZU2spG42+PPasUHfV/ODdfB+AhCWnvBW1ee3ttZWUDX0ivuBeNgZ31bJdzC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q0UmJYI6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QA4WM7oI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59SJloAL2554715
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 21:00:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=fmeFRlppkrUjz7TJfHZBER
	QR84XKctMO67PE77+lR+0=; b=Q0UmJYI6FHStmegzkAY164F9oqYVJQq3JOr3d3
	ptU6NYifWymGbHLxN9h4GSGM6mM0vLbW6oBXYPkprTQXEUzMikLXxRFfpyRG9jel
	/i0zwxFnQIjaSbvhpT88ryAZY5uPOa8Zv7Igf1eulFEWX4O3abZNN87dFaoIiDwK
	1aH39ehzidzZck5+WyxtPeKvdDMw34g3Bx4/mPxZQ64Kolxl+fEW8RQPY79vlZNU
	KZ53v8FTrgUNyRCCLogHEbWFjqksENMEwPexdhEzjsqFhdvEJjaCjk5234yfJKAq
	6XOzY35Ucy2h3zgWnUQvIjYFzPcDUD2D8Uqjpk9Yiyi2qV0Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a105uh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 21:00:08 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4e88947a773so327644081cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 14:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761685207; x=1762290007; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fmeFRlppkrUjz7TJfHZBERQR84XKctMO67PE77+lR+0=;
        b=QA4WM7oIIkE501OyoQwSdDT8pQ3d72TGmJfs/fjKk+NjJY5tqxjp+pG43a4xtEawSN
         4aOqXIax5MkazoGnyrRSuWLeOTlhgdDz4PoUGykm0KPo35Y3w5XgKA0dWYaUrBSIDjUR
         P10kgbANMhSmuPsGwA2D2rTOIhblAVjvkJ5Gxs+9CkVBS3XfzQVAXAUK8Xce7eIH1Fnj
         Gc/VjJA4QNYG4KKwlNWGA7YL0/qBG4k+lv3yEifCfKjegT70Yrb2HE9aAXGZDdqDRlla
         cUEc9s8VWLJCqEgiswxsgOrE/x3VZEI9r52BXxEosTaMVYEkBSScSHQGVcyqlp0NsjSw
         xbdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761685207; x=1762290007;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fmeFRlppkrUjz7TJfHZBERQR84XKctMO67PE77+lR+0=;
        b=JKJaaMv8jHndPVHzuiLZx1bePAQto41yhP/ennmaVzY8qJoZ1trFkU3IglhmWoGhl3
         HpY2XzWaL8U0krM4G/UKpTD4b9i6E+G6k2+CddHFU7fShz63iYQqUTUQsTQzlBWOnjZG
         KOIT13ohFeJ5WfLVmFvzVFwvsnzB/ZVgswEP/Xxdchbou9z+RxG9du50x8DZVGDCOrJc
         PnKU+BKBiA3t3CNloXprQBLDgJb0uf8b7OEyWLYkcEhbOLsO0lN375OPI87oQ6FYdhDS
         NU9LcyCSFS90i+Uu8nPloml8eNIE7Isxcyl4wcpxq6QOgyyDiQoARsCtIXf1qoikQNd+
         fBnw==
X-Gm-Message-State: AOJu0Yy+gZ9Ay22+7kcsQ3LZZmd8vGzazBvR49URTi4rllqji3bNaYlC
	gIZi3JUWGRdiHfhKFp8wXUjwE/eZbcz9XZlOfOmMVQu/V3t6QMdwVp97ZfAaKJPqCJjAcK1DMbj
	Y2DTYxAQxz9NXCFOE2tHc2tyIrW8EUgaVtcw51Xo+KB8cSLEyydb1eavtH27V4ruUJXoF
X-Gm-Gg: ASbGncsVif+FXDeP58L38SBuNfwB1l1W1tTreT4iGTFYv/7iv9++/f4Mf3TRn3V7gS5
	/3DKdtUXlNa5XOsOV3Xuc/1ct/r5GgEbbP28fUEfqPNc5QsZYeo3oR0U9LRCHaCJ9VJFtYcwx54
	2ddsG5Kvnp4oQmq+XOzCTi3XRaR/0zMZKsIDw5l4FR7ri9xbvxc5V1GW4Q5xPTmYaCr3ucTjvH7
	rCCwsKKtlVjd4PsvSLN9VMIfIozH8N3NeoJqJfU1XdcrpakR7j00BUHhvUlamzZ0ma0GMsmARgI
	EL8knaBj5rPJVAkqKyqBlXm6riXGkpYE1eDRojahKdU8MDxMHS7oXu3qpKeZ0scxRUw27cPfKIQ
	Gn/nUXLMUb97EqPVCVjrxvZdowhoKqk7s0jbNDGyGs0cebwWLllNyfCE0YVmenJWZYY5pkOmeQ+
	5SHEXNb4NEmSjf
X-Received: by 2002:ac8:598c:0:b0:4ed:5ed:253a with SMTP id d75a77b69052e-4ed15b49b4dmr9408581cf.12.1761685206768;
        Tue, 28 Oct 2025 14:00:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHxMsT+5Y09mdzLd+06A3xqeybTxQvQeYJ/RcrwC4yFOFdtYuGuXeKL3kKc6qKOwVjqlnQG5g==
X-Received: by 2002:ac8:598c:0:b0:4ed:5ed:253a with SMTP id d75a77b69052e-4ed15b49b4dmr9408111cf.12.1761685206154;
        Tue, 28 Oct 2025 14:00:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59301f861f5sm3283594e87.107.2025.10.28.14.00.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 14:00:05 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 0/7] arm64: dts: qcom: cleanup GPU's zap-shader node
Date: Tue, 28 Oct 2025 22:59:59 +0200
Message-Id: <20251028-dt-zap-shader-v1-0-7eccb823b986@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANAuAWkC/x3MQQqAIBBA0avErBswoZKuEi1EZ3I2JhoRSXdPW
 r7F/xUKZaECS1ch0yVFjtgw9B24YONOKL4ZtNLjoLRBf+JjE5ZgPWX0PDs9Gp6YHbQmZWK5/9+
 6ve8HenJ6ZF8AAAA=
X-Change-ID: 20251028-dt-zap-shader-df7c258f6ffc
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6130;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=wRiosEmTpDAVLVLEoBEb3Ki+aT+vGc91sDzAON0Ob/8=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQyaj3iXT4M7rb9p7nFObf0s6XI5PPyB9fX1wRbqjl8R56
 7PtVcc6GY1ZGBi5GGTFFFl8ClqmxmxKDvuwY2o9zCBWJpApDFycAjARh/vs/4MYXPSttCOXLZ/h
 yTZdQuHn7I+d+y+aOLyaIJL9+zzTxV7XiQYfdHgcdgdzyk42UcnxnTpfPTy9UOnWFZmzXKL+rSd
 KJmwrXrJe94RcWbdoqJBG8r5ZT32y+nweCX5W0It8ase8hb/IYRvb31tf11R9a9zfHd2/U+mzTc
 GuEyERt7+VBtV4L2Vh1NzlGvZz9vwWHeHdzsKmRe7cMQX2VtF8T2w0rqmfPWrHFMTk32gg+n23s
 IjSNZn0y767kh/8e8QVbsHT6Xkg/8ktpwN5BuxLY7VTgraXJahZJZ4z/1fZob2BY+GEulnzNCV2
 +obqG/jodHJI7Xe3C/ny5EJMNMcKDWNrrew7Wy1tlAE=
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDE3NiBTYWx0ZWRfX5bcPqqeRhP1X
 TEP2DY3Y6b4yQodLJHRQGBNMwWQ6YkRnl0HU+oKBiDQXVl3C2SuL2WuPuer4MT6H9jpCvVXlAxU
 l/osAUrNIHDcdftXLC5HpzOZO5qN7/EqGAIm9uOv6pFPOTTLDq+3i2zaeUCPpWd4wlDftvK0UwO
 JUzjL8otJ9q91FNQG+YXeWnQcY71QaacuucfdfsyThKAbrEpFkvHRkCYGv8/WPQKfD8S/ZYQbHd
 3wJJYQNnrVQZlrFVURf0BFAOkOEUolZl/7MU9IIA2ZLIu04x1U4XQ5ttuO4UP60/dVp/9Rvgu66
 UTNUsIHwHqU/SNG9Sq7w/U+YFv9FLCwUId6fndzJ4V9dVxtiyDBViCMDtDMrXTeSvWuXsvMTbgF
 +8lmR2jIJnlrVYFbbWz6Uo15jnAP3A==
X-Proofpoint-ORIG-GUID: _O8vVlb3slAaBXS11-WokFbSZ8m80n95
X-Authority-Analysis: v=2.4 cv=EKULElZC c=1 sm=1 tr=0 ts=69012ed8 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=1pCyjgwHKzNf7cO5EhIA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: _O8vVlb3slAaBXS11-WokFbSZ8m80n95
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1015 suspectscore=0 adultscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510280176

Historically all devices manually defined GPU zap-shader node in their
board DT files. This practice is frowned upon. Add the zap-shader node
on all platforms, define a label for it and use the label in order to
patch the node with the firmware name.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Dmitry Baryshkov (7):
      arm64: dts: qcom: sdm670: create common zap-shader node
      arm64: dts: qcom: sdm845: create common zap-shader node
      arm64: dts: qcom: sc8180x: create common zap-shader node
      arm64: dts: qcom: sc8280xp: create common zap-shader node
      arm64: dts: qcom: sm8250: drop duplicate memory-region defs
      arm64: dts: qcom: sc7180: add gpu_zap_shader label
      arm64: dts: qcom: add gpu_zap_shader label

 arch/arm64/boot/dts/qcom/apq8096-db820c.dts                |  6 +++---
 arch/arm64/boot/dts/qcom/msm8996-oneplus3.dts              |  6 +++---
 arch/arm64/boot/dts/qcom/msm8996-oneplus3t.dts             |  6 +++---
 arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dts         |  6 ++----
 arch/arm64/boot/dts/qcom/msm8996.dtsi                      |  2 +-
 arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-natrium.dts     |  6 ++----
 arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-scorpio.dts     |  6 ++----
 arch/arm64/boot/dts/qcom/qcm2290.dtsi                      |  2 +-
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts                   |  6 +++---
 arch/arm64/boot/dts/qcom/qrb4210-rb2.dts                   |  6 +++---
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts                   |  7 +++----
 arch/arm64/boot/dts/qcom/sa8295p-adp.dts                   | 14 +++-----------
 arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dts           |  9 ++++-----
 arch/arm64/boot/dts/qcom/sc7180-el2.dtso                   |  6 ++----
 arch/arm64/boot/dts/qcom/sc7180-idp.dts                    |  1 +
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi               |  1 +
 arch/arm64/boot/dts/qcom/sc7180.dtsi                       |  4 ++++
 arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts        | 12 +++---------
 arch/arm64/boot/dts/qcom/sc8180x-primus.dts                |  9 +++++----
 arch/arm64/boot/dts/qcom/sc8180x.dtsi                      |  9 +++++++++
 arch/arm64/boot/dts/qcom/sc8280xp-crd.dts                  | 12 +++---------
 arch/arm64/boot/dts/qcom/sc8280xp-el2.dtso                 |  6 ++----
 arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts       | 12 +++---------
 arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts | 12 +++---------
 arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts     | 12 +++---------
 arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dts  | 12 +++---------
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi                     |  9 +++++++++
 arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts           |  7 +++----
 arch/arm64/boot/dts/qcom/sdm670.dtsi                       |  4 ++++
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts                 |  8 ++++----
 arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi             |  4 ----
 arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts              |  6 ++----
 arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dts               |  6 ++----
 arch/arm64/boot/dts/qcom/sdm845-mtp.dts                    |  7 +++----
 arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi        |  7 +++----
 arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts    |  7 +++----
 arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts          |  7 +++----
 arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi      |  7 +++----
 .../boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi      |  7 +++----
 arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts         |  7 +++----
 arch/arm64/boot/dts/qcom/sdm845.dtsi                       |  4 ++++
 arch/arm64/boot/dts/qcom/sdm850-huawei-matebook-e-2019.dts |  7 +++----
 arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts       |  9 ++++-----
 arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts            |  6 +++---
 arch/arm64/boot/dts/qcom/sm6115.dtsi                       |  2 +-
 arch/arm64/boot/dts/qcom/sm6115p-lenovo-j606f.dts          |  6 +++---
 arch/arm64/boot/dts/qcom/sm8150.dtsi                       |  2 +-
 arch/arm64/boot/dts/qcom/sm8250-mtp.dts                    |  7 +++----
 arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi   |  7 +++----
 arch/arm64/boot/dts/qcom/sm8250-xiaomi-pipa.dts            |  7 +++----
 arch/arm64/boot/dts/qcom/sm8250.dtsi                       |  2 +-
 arch/arm64/boot/dts/qcom/sm8350-hdk.dts                    |  6 +++---
 arch/arm64/boot/dts/qcom/sm8350.dtsi                       |  2 +-
 arch/arm64/boot/dts/qcom/sm8450-hdk.dts                    |  6 +++---
 arch/arm64/boot/dts/qcom/sm8450.dtsi                       |  2 +-
 arch/arm64/boot/dts/qcom/sm8550-hdk.dts                    |  6 +++---
 arch/arm64/boot/dts/qcom/sm8550-mtp.dts                    |  6 +++---
 arch/arm64/boot/dts/qcom/sm8550-qrd.dts                    |  6 +++---
 arch/arm64/boot/dts/qcom/sm8550.dtsi                       |  2 +-
 arch/arm64/boot/dts/qcom/sm8650-hdk.dts                    |  6 +++---
 arch/arm64/boot/dts/qcom/sm8650-qrd.dts                    |  6 +++---
 arch/arm64/boot/dts/qcom/sm8650.dtsi                       |  2 +-
 arch/arm64/boot/dts/qcom/x1e001de-devkit.dts               |  6 +++---
 .../arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi |  6 +++---
 arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts    |  6 +++---
 arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts      |  6 +++---
 .../boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q.dts      |  6 ++----
 arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts   |  6 +++---
 arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi   |  8 ++++----
 arch/arm64/boot/dts/qcom/x1e80100-qcp.dts                  |  6 +++---
 70 files changed, 198 insertions(+), 244 deletions(-)
---
base-commit: f7d2388eeec24966fc4d5cf32d706f0514f29ac5
change-id: 20251028-dt-zap-shader-df7c258f6ffc

Best regards,
-- 
With best wishes
Dmitry


