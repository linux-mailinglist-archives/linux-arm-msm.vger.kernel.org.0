Return-Path: <linux-arm-msm+bounces-70079-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B7DB2F1AF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 10:31:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 87EB41CE0138
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 08:25:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E62D42EACFF;
	Thu, 21 Aug 2025 08:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iNGM4qrm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57A4E2EA73E
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 08:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755764477; cv=none; b=IWGRPboEmDO4XFXzk2NXjlJd/bCpgLuUgKNc0F66ymIWeNMd9R87H+9Nn2Zaj0UbAIfvixDgyUhdRA5M9WjmLsndgh4UTxug608RdX0zSrGNtTnyWP0iiXBkDzu0rBmY6BYf0mJkvE3Lan1HGCY/Dzu91P5hHPlRWV2YRKhJC4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755764477; c=relaxed/simple;
	bh=ES0C/eHUJ0vZMSiE7e9k3eopudAsRoEFpDfAJn+GlGw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NIDyhgjDGIIi0DghyAxGyqxG2uI+llgiYZcJ7/WxXe+7RQVhg4znCsAjdVJINnIoa5TMpYfVEdAaIPDeYeopTlbqygOssD3qTymv804YdRYWqNiM4p0Ynl0QIgDIdcbW9ApxFGPf0eXXLoDKLmUsCQ27JdIWgViTMtHIbXWB+8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iNGM4qrm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57L83qBm007306
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 08:21:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jWgEnfKM2T8SN4ZowpfF7xlxhdEVJCQ/+pQl9CKBY4Q=; b=iNGM4qrmsZwkB+zr
	f5CAp2WyI/Ta3V6F/HMKUIRdVMuNekopp0G94rFqhSK+cEUGtmlQui1pJ04+rNZN
	CgkdpIv4CjlAz64A1EooPwSsHrLmZBzuA6KDRpFg8KVYbwqnPV7dJ0ZZZgrNT2dN
	PIT51M+iHe2RpBlCLou6+obH8lVE7Fov0E1zJbyxgPNTSIp/EOSabCreqq3F6yyu
	40nNhhbfZWie/eI2Hyxef/TvHpUj9YVtL7/mf6OuVGVh2gEwYcKFB9PefvuV7f58
	quUF++3+agg9g9RuHoUgqV5zdIYmMtMOpfTjN9gG1OdHiD8yD0FgZDHV80axUhOW
	bDBGjA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n5294n9c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 08:21:15 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-76e2eaecf8dso725149b3a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 01:21:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755764474; x=1756369274;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jWgEnfKM2T8SN4ZowpfF7xlxhdEVJCQ/+pQl9CKBY4Q=;
        b=YC3rb3hF1pQZms29r/iHTv/kILf9Z7YshXPPhaiS/h172baRI2xsjG/ZCdvPiEBsjU
         f5ivrJFKGG7b30avU9I33BWF1M/qUP7UvN32c9G1f2tgTzYtcJBl9eSCG77Vkaejm+95
         hilDAmmPlNvj855hfXPwGdWEdSaOBZ1hmRvui0mBKgVDFsOseE+Sx32HLzG3CXAz9Cwy
         pomfl3PeH3Q+k2BJBzVcV6w1RdnsoK/code/OKnrrN1IT+mfPkI4a3xZgf0HlNoCBSAe
         dlYUyBb8ZvpauE1npObL0Tm2sgAN+31qatcmOzeGSfIa5AMlti/3eY906ftj5fDe6HFc
         /oMQ==
X-Gm-Message-State: AOJu0YwV527jMvAdkb9XNWrunD+QGiUw8xXa6YfYhkLhNdUecRpd2bzb
	LEduqlnYZnr4n5MGX4Iv6950ZfldELIs+Gsowns3v5RZQso8YbPO45CdvqkeUWlVCHMjQeoBVYm
	d0H+FrKcri8Du6leetY3gH235i2V7id5bHj66WQLy+SxFvl7Cxbs+DMoObV7scq3kaikKE41kxd
	a7
X-Gm-Gg: ASbGncsdFVvC9EtncGWseTNlvw3+6QDnB4Fm5lVr1pXu2nXgIJppuCl7V9KTz2ShGf/
	4hvwq9rVZdDC5VY6ZjFQnkUd0xqVtlrt+4R5F6BRuuf7xXwjfIgM8pSDSSM4wmKEENmYl4vCiw5
	D6WJNjcXKO7bkaO3QWRvb3X+yAZtu0Kac6ujcxPTepQEFVmbh4JCx9rjqrNvN87DZ2a411Qtgx9
	KaRvLom3p/FjtBd4VBjNNZL3d7zDyYAE5eDlhN1+D517+m/Z0vTk7Ft/fLaJL/Ebx/M+jems4Gg
	JkAkWGgJ5ATc4ASX1smWzfz1mAvKB9qk+MqbFMKzlsxDZdaM4kA82LiD2bec+eRU/fCr+tD4gLi
	HYrc6sYGUq7UYP6ppsIHkCN06X1WDFyyc1w==
X-Received: by 2002:a05:6a00:1304:b0:76b:c882:e0a with SMTP id d2e1a72fcca58-76ea3158eadmr1981950b3a.5.1755764473925;
        Thu, 21 Aug 2025 01:21:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IExQWvGUYVR7FpRA23GECMY/ZJWDx/O5PjHPa43nIM1xLoiZabU7zXN/xe8IPCGKxVvnekxXQ==
X-Received: by 2002:a05:6a00:1304:b0:76b:c882:e0a with SMTP id d2e1a72fcca58-76ea3158eadmr1981919b3a.5.1755764473476;
        Thu, 21 Aug 2025 01:21:13 -0700 (PDT)
Received: from yijiyang-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e7d52c7f2sm7468238b3a.87.2025.08.21.01.21.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 01:21:13 -0700 (PDT)
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
Date: Thu, 21 Aug 2025 16:20:22 +0800
Subject: [PATCH v6 1/3] dt-bindings: arm: qcom: Document HAMOA-IOT-EVK
 board
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250821-hamoa_initial-v6-1-72e4e01a55d0@oss.qualcomm.com>
References: <20250821-hamoa_initial-v6-0-72e4e01a55d0@oss.qualcomm.com>
In-Reply-To: <20250821-hamoa_initial-v6-0-72e4e01a55d0@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Yijie Yang <yijie.yang@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.15-dev-5bbf5
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755764464; l=1177;
 i=yijie.yang@oss.qualcomm.com; s=20240408; h=from:subject:message-id;
 bh=ES0C/eHUJ0vZMSiE7e9k3eopudAsRoEFpDfAJn+GlGw=;
 b=rxPgNDKUD77jdVkhCq3vW6y8IP8u/z9/7nuPRT2Kr924Q5kpi+l5w6bzSStWB465X6Ri8p3DF
 185UGswVt4xBN4TmwwyjXwrNl92sVgUj01xWdj43hv0QWkKYcQRtZZh
X-Developer-Key: i=yijie.yang@oss.qualcomm.com; a=ed25519;
 pk=XvMv0rxjrXLYFdBXoFjTdOdAwDT5SPbQ5uAKGESDihk=
X-Authority-Analysis: v=2.4 cv=Aui3HO9P c=1 sm=1 tr=0 ts=68a6d6fb cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=Bh1HEMNN3wmc11-eFpoA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 2060N90JiUfx3-6RkqmOGHD8f1OPEROy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX2Qa9crnEiFyi
 K2CK0C1R/gkPqNYr46A5rxOc85E28oi8dINMkcrPviuUyccvrn4HlpqDLzvT+LQmmIcVxA2qVtt
 xpgUH6LZSwezMhjaX3WtcFHomq1anbd/3ETYNDSk0nhwWeAp/g5ifQU6Jt8sulVNcsi95+EpdS3
 7m4MuNgK7oUziRYxuwOzE5j3PJzCrTjYiPzYJzaI+VecUdgnuhDE+hnStVuLieYZuTs+h19WWJa
 8/5FIo2c4eKeYa91OIeBdFLeKbePR25DcgOHX5YRFGKZv6VvbdgeQTo/ziKFxSq/RzqKGOvamus
 uT+iwxY2TMY3VySZdSy/5hIfosAtD3R1Xl56CPA8dnOBZl8hbpspnjG7ddYipindOeb3MAFJQms
 PmRZNUsXLmseavYjuo02rbenP3ODSw==
X-Proofpoint-GUID: 2060N90JiUfx3-6RkqmOGHD8f1OPEROy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-21_01,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2508110000
 definitions=main-2508200013

Document the device tree binding for the HAMOA-IOT-EVK board, which uses
the Qualcomm X1E80100 SoC.

The EVK consists of a carrier board and a modular System-on-Module (SoM).
The SoM integrates the SoC, PMICs, and essential GPIOs, while the EVK
carrier board provides additional peripherals such as UART and USB
interfaces.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 55e5eb75af89..6b6503181ad6 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1069,6 +1069,12 @@ properties:
               - qcom,x1e80100-qcp
           - const: qcom,x1e80100
 
+      - items:
+          - enum:
+              - qcom,hamoa-iot-evk
+          - const: qcom,hamoa-iot-som
+          - const: qcom,x1e80100
+
       - items:
           - enum:
               - asus,zenbook-a14-ux3407qa

-- 
2.34.1


