Return-Path: <linux-arm-msm+bounces-86156-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BFA6CD5270
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 09:47:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2939F3034A0E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 08:44:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85CAD30EF94;
	Mon, 22 Dec 2025 08:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WzDR2hUR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VirQHyN6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ACD52F84F
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 08:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766393068; cv=none; b=O74xYU7YXHue3WAo4OkqLcVWLaob/Bh4ULmohF+et223pz+YLiPWX8nUP0oSOSj4EgDqzKr/oK0w9IUxT4zMxpeoob5jKSlIZnNmbtICDpJRnJNCiOcxlwGkWVfXifoqeISnWhCC9seXXnNw+KzFB0oDIAYUhwOR4fkCfgCfniA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766393068; c=relaxed/simple;
	bh=+65XFLjmzkBfsSXsN4uZBfj8j9rlxmw6Qkdl91guMDs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=b3S8dB2v50ozkq05579UiY835RyXZibPlzR1hGP20AhVRAhaPxFjz6fvr49EL4brhq+nTaR80m57/XDUkbVku99TL5vT+ltP1v8k6hOuJSLCM55/btxP7cmXv7XU+aFHu9cVpzFeJNnBoDBlsVziCsDJPZ3NG8v4l3OV0AruzVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WzDR2hUR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VirQHyN6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BM8RCxo388275
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 08:44:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=FUKnIotoxp2c8hNstV45OI
	ejvixZ1FAP2laOOHlZegU=; b=WzDR2hUR3vs3NN7gaOK1e+N2RoSK+yG/kHG/zT
	l7cRKxrmwLPVeeDZsmunh32GrEpwVGCaUd7/ikbuZoxTNLykjbDlk1t8whIVodQJ
	xJU4zS+wQMjw4xTENalxGi7XcVmcCa34LYPfbtuJz4VEzin2IpPwiRJa74YLSxAY
	/VIPlQ6rFu8gEyulDw+GO8EZA/RMEXISUySfu8LZOXwz09oYi/7AzTl87LLojTUR
	rhdWrQlR4pLf/S/WvMQZsv/M90I9Vhws4lG12qm2+k7Mle6f8qWgIDN11dNUeKEH
	U/Wjw4Ulyl8ZHgCDvu0N7lj0a/elzf/sVOwoAGrxtkkxZRDg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mubmb1e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 08:44:24 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b6963d163eso915210085a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 00:44:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766393064; x=1766997864; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FUKnIotoxp2c8hNstV45OIejvixZ1FAP2laOOHlZegU=;
        b=VirQHyN6amjvQVU3bEPFZ0ozjMB34RERZbhvc1IzG6lrIYhlJfHyxe+Tq5+lezuoOC
         XAGLjt30l1TFfgvlgftgQ7yCuZy+n3UYvetUmIWMNzmkLHwOqK1+MEwS4ZIWFfrLK+qg
         VctEEi9N/ZotL/D9uYZfx2hFQdKaNzaUUo+QqhITd3zlDH2FTS/XpqGqQjJE++8piiQz
         mhUCDrYdEPJFJa+7ljYPg7phtkTXEa4k/GRTVYwvb5zhyim0vnd2fXpjdz5CnqsqCyhG
         r4ezfELd5whNzVFHnQk3U1RJfhkNOYnOlDfkqwuJwkzMo0y4/O6xRe+mAzw6kp/WoGNO
         blZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766393064; x=1766997864;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FUKnIotoxp2c8hNstV45OIejvixZ1FAP2laOOHlZegU=;
        b=NqPEnUBVjcxpsJSIgVhFWbg0OkGMIx7mG5GyS7Hn0Kkma64u7t7/CSCGHhWhUsWvZv
         tpP1afdcyDREY0qBNfg6gTExdNnjJRqWwslTBCTY2xT+K2kkwRNFQOkosiGGgXxnCqVu
         YlFnkPZBt+KqJUUzPZQPG/nJBEuthMIFRuSIZ3A5CzKYa+2Im4Dz4Jdt7SFfYcWmndWh
         u2s5lSU+1gIbdMw9RqP471hR0DbyDRIMWHKTNoiFDXy20+TL74TQ/I5asC0G9oDB2RlY
         Na1zVNmaZCMS9AdMg5/02jH1MHn7rLR4Nks/9DmZlS66nD+RWpcyj1F1hJ37QGu3xd3v
         D3ZA==
X-Gm-Message-State: AOJu0Yyd6sM9pYNJyhKX77PPyrHobSxFtqj73ah3xSMYKw5TMQCMzyc4
	UTnqIp4hc9Hkv9WhaodWzY1JdETHY8zuhMk0458z4yC8aj2o/4V/49w5hpbXGgNWpv5kjRA+ZaD
	n6Gmrz+RuGoFlABnEgZHGFefmL0C/WRxeSn6HvA5ty0eEB+M7V4t9DITV7P9cGx7/PB7I
X-Gm-Gg: AY/fxX5QewrQIu1Yf0kQjoVvPgIUPCKRpxjYTdlBwxU+Kunp0X3s5z9dhUiBqns9YlO
	3VRD5vqL6dQ50XEFzSzgFTvn1YQgA2n2C+i14eAfzzgpw5LRe58D85/NVGBxxiBmYYtDqrEn/Os
	4/PAg+3UKQhmtQfGf5o45XN2tarGvg+fxSZvi955Hq2rOxC0NOVg1XjZ4/E3wwLFIV05YUJ08SI
	0mitiLOOeh/HXNR3oEOaTkWytEoznC87+fXDMEV3gW4xngT+qQsnvCWix/+j6QJ3vn+U+mvoMY5
	YyT7ddFiCFy9VtVAZE46oZ+cacbVg27aCPe3ImKiFZXYkkvEpbBuDn1KoSyVEOcmcCMiyofrjdD
	b0U2W8rjxDUVei6QqkFdWx3HxqxXnR9uphrppWbzG4Lh8i3sIKQNxfS6Z8Tv3S2iOsMHswkuwun
	y9
X-Received: by 2002:a05:620a:2699:b0:8b2:e561:78c9 with SMTP id af79cd13be357-8c08fa9f0f3mr1560389885a.43.1766393063975;
        Mon, 22 Dec 2025 00:44:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFW1SRKpIvC/1h/9jR0hbT6ol8vDr8W2OUoCBZbvQryIDaTonOx9XFKfEWt3VF2eh7VFgh7Lg==
X-Received: by 2002:a05:620a:2699:b0:8b2:e561:78c9 with SMTP id af79cd13be357-8c08fa9f0f3mr1560387085a.43.1766393063471;
        Mon, 22 Dec 2025 00:44:23 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c0975ec0f0sm782975385a.50.2025.12.22.00.44.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 00:44:23 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Subject: [PATCH 0/3] Add CCI and imx577 sensor support for Talos evk
Date: Mon, 22 Dec 2025 16:44:13 +0800
Message-Id: <20251222-sm6150_evk-v1-0-4d260a31c00d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAN4ESWkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDIyMj3eJcM0NTg/jUsmxdi9Sk1BTLVMs046RkJaCGgqLUtMwKsGHRsbW
 1AJgf9XNcAAAA
X-Change-ID: 20251222-sm6150_evk-8ebed9e9f3bc
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766393057; l=1724;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=+65XFLjmzkBfsSXsN4uZBfj8j9rlxmw6Qkdl91guMDs=;
 b=C6TNkm8SuVEhjmlqbdKYWWJosiC8UXwKP2nZJNyOCqJzSsCZw7bFA/lEluUNhPHpJge+YWHL3
 bBT11TKsJyzA8wpCOeYYxIiIB7opwhGjpIPexaYUGTUqJt7Gq8cnGJ+
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDA3OCBTYWx0ZWRfX1tSAs5y0OV7v
 pyZA6gltlD+6eVv4pqhtPWjEk/ov1J9TWKbB4uGP7sFlFxk6iaW0zrdS2y9ed2NrCgzLDJqiclS
 cTC5GdjWvYASTrw0k2KsddMKPltQ55RoCfAMX8T2Ve7u0d5gHuqfhV3sqB/jtOKc43kGtSst8fZ
 J3fUtJfDBRKkqC12kYGau/JlWiB28iljTkB/3lR4ltZRxc4SFoHSGvDYjuEvrxhR2GDNiK6OtoQ
 yUJBglh7+Rz733rFs2ukZ+RTKTa7BRIZskswTdCaKn+F4avv7g418e6MSiiKAHRKaa60vwfsVOw
 QroKluf+Yez4EzqrElLwSgg9dBVZoewcETbIapa3KpQlaz5zKjW9/RwSJL79DImJ73m2lviG2bE
 7QEPKDe8l5Hz1fx774zCzqKsSMlH4rin/GD6RTydt6hc25G78KGZ5oXBaMSz3jIP6sYshGBIQca
 nlNKo2j4f/DsRITVqtw==
X-Proofpoint-GUID: zAgFoPyRRAqOWrRJLpCZ_JcWC3foIncs
X-Proofpoint-ORIG-GUID: zAgFoPyRRAqOWrRJLpCZ_JcWC3foIncs
X-Authority-Analysis: v=2.4 cv=KYbfcAYD c=1 sm=1 tr=0 ts=694904e8 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=1eq2e09OEcjZih1k5uoA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 phishscore=0 malwarescore=0 spamscore=0
 priorityscore=1501 clxscore=1015 bulkscore=0 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512220078

Talos EVK is  based on the Qualcomm SM6150 SoC.
It lacks a camera sensor in its default configuration.
This series adds CCI support and enables the IMX577 sensor via CSIPHY1
through device tree overlay.

We have tested IMX577 Sensor on CCI1 with following commands:
- media-ctl -d /dev/media0 --reset
- media-ctl -d /dev/media0 -V '"imx577 1-001a":0[fmt:SRGGB10/4056x3040 field:none]'
- media-ctl -d /dev/media0 -V '"msm_csiphy1":0[fmt:SRGGB10/4056x3040]'
- media-ctl -d /dev/media0 -V '"msm_csid0":0[fmt:SRGGB10/4056x3040]'
- media-ctl -d /dev/media0 -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4056x3040]'
- media-ctl -d /dev/media0 -l '"msm_csiphy1":1->"msm_csid0":0[1]'
- media-ctl -d /dev/media0 -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
- yavta -B capture-mplane -n 5 -f SRGGB10P -s 4056x3040 -F /dev/video0 --capture=5

This patch series depends on patch series:
https://lore.kernel.org/all/20251222-sm6150-camss-v2-0-df8469a8343a@oss.qualcomm.com/
https://lore.kernel.org/all/20251201172222.3764933-1-tessolveupstream@gmail.com/

---
Wenmeng Liu (3):
      dt-bindings: i2c: qcom-cci: Document sm6150 compatible
      arm64: dts: qcom: talos: Add CCI definitions
      arm64: dts: qcom: talos-evk-camera: Add DT overlay

 .../devicetree/bindings/i2c/qcom,i2c-cci.yaml      | 18 ++++
 arch/arm64/boot/dts/qcom/Makefile                  |  2 +
 arch/arm64/boot/dts/qcom/talos-evk-camera.dtso     | 64 ++++++++++++++
 arch/arm64/boot/dts/qcom/talos.dtsi                | 97 ++++++++++++++++++++++
 4 files changed, 181 insertions(+)
---
base-commit: 1d9566d56c3b6d42b8d3684e940561ef783fe6a1
change-id: 20251222-sm6150_evk-8ebed9e9f3bc

Best regards,
-- 
Wenmeng <wenmeng.liu@oss.qualcomm.com>


