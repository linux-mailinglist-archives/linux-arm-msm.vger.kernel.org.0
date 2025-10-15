Return-Path: <linux-arm-msm+bounces-77369-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 64200BDE157
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 12:52:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B62861927BA1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 10:53:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88EA131C57B;
	Wed, 15 Oct 2025 10:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L6Um0qae"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB25931A067
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 10:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760525541; cv=none; b=FZ8cBUBpsP0CwFmw+yOSzLHB1i+tAF23d6peKX+dtf0cwsG0R0ks9MumjZx0eSSezswMwVA2WNpPySSw2KBlu4bwLJYogFE6SpLvAZxMA+9i+ZIFJC2uWvnytSc0+mn4nhhv5ZifB1G+e7Z5HvMzfCAEIPBgA22oJjwWXGUxHXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760525541; c=relaxed/simple;
	bh=htS3m7/wI23Lts/jq+cm59+BhkrNFqvDrYMupeLJOi8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=gckFPYtlf51iqI5OSych3fdMcQQqvxLxSA8r3DHZZeD2Z7pcx9FOD98+CGsdSlSbzoJlJ8tlyx8QykizX8Fg1xfPOXCDuVlM9DYhAQL2FVUCSObTkdJS0b1nnNMzqpvfCBYVUMELB6FUK/EY71o/CoAcAHY4vArfbjEPYL1+Yqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L6Um0qae; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59F2s9o0009138
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 10:52:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=FGPIvefiO6H1hRJgbX4nh63VjXOnf1EpQav
	pKG8+yUQ=; b=L6Um0qaeGoXsayUxaSGmw/P02FPKX0AzjDAYyNJy58JFNQhEB76
	c78YrxnBn2XBFe2CHGHJUGvOpN9BU9wMICVm1yNUXKTgE5JgxXSQoaGkUo52oi9p
	HLyJi3DbymEUPsUbOSyCMfCY4oqoIq52AwXPnyK2pcN/C5EGV9BHKKYpixhw4lVV
	OzF1vsSIDlBZkT46xv1qh3v7VfS4WCUtIBoXOkuDH9Fh39HgjK8wymIV8aLpIJ7X
	ZIxzkcZ+m9t0mk0j8rB+Viw6ycFQiM31GlG8i2/IQ9PiY7j/rYQZNScCNttNbxvO
	3gjtriW3weICowfN3wr7it4+tL9pHDj3Hfw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qg0c422h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 10:52:19 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-32ec67fcb88so9530435a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 03:52:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760525538; x=1761130338;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FGPIvefiO6H1hRJgbX4nh63VjXOnf1EpQavpKG8+yUQ=;
        b=FsxwW35cSo2SOiGAsehfUWwi/PeCP/FGygPMXElY/J4kKTJiUslQFMTp89HWXLwDXv
         jxuaoYPxFhNbDZXP9+7/HlpatHyZ+hUKbPGDmYWGn4EflooUSQaDumSiCepDiU14jk5T
         szFsBhqDi8PboxwaUZ/EndpqcCEbz2vVpi0Q3QzrFz7eGkeeWVDtMpJSOHIIiwM1bl6I
         d+5KfCOT7+g1dKf6mYAG8SOytleCFC4kAxb/6NHBREKt7j+cZ5TB97peuY0du1cbpf2V
         hORCPZ/v4DDHWYJrkmEU7ccsqzTrwsIv7FntbCFkG1C5Qi8x6YdWVN5BjGZ36YUhs/zP
         M7WQ==
X-Gm-Message-State: AOJu0YzMLR19vp1qBik65VkCiof+rAv2D3MSkFbf8LSdoQ32KvSgweW7
	px88hprrFOe9d34QehAsT8jaFuo7bNVogtXbEGXr9HKiEmGsdgMt+g13dAgw9RyhtgALJbQN581
	t1p9Oj3uj6UjOnLaUN/j9ToPFcjEpmYn2dM+W+FIv5p7wei5wG24hY8anUbTSTFzhLBxk
X-Gm-Gg: ASbGncv8pHiGLTzII1wmP9QGdHzCar0x5QZvc4Htud0B0tcAFq/CeyxnNtqAjgUZsLK
	PzDE8/eqmy6Ka7Mh+N2+c9359MFYqJ9sb/U72EWiboR2+BnJUaP/uT2jpV9CdGOkhxAQ8XtLuWz
	bBHapm/RVSboF5HNm3BhXHXOnzMscaYDpk4zNHC3lmVNsB7qK1+NV60Ohfhnm6T3dLdzTKUWHoB
	K7zAnE5dH8E8r3fd9NjQqcTLwjCEkoudsABqeldPA48HI3qr86vAIK/hM8MQWuKf8jK/gvr54aQ
	VD9YKOw1pCHl59dlMtGqrC0cvGnG59cbOgEF74eBsiLE2f6t+dYY76k7igjo0Kr2Ow52Qf3Hpo9
	/6JO8cN7D/tzRoCu9pqdSykNB0zuja9C/OVXn
X-Received: by 2002:a17:90b:1e0d:b0:32e:a4d:41cb with SMTP id 98e67ed59e1d1-33b511174afmr35985943a91.1.1760525538325;
        Wed, 15 Oct 2025 03:52:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFNf/euWuF8S5QLpkc/iS+5D5TH0rpuTLXzgEEJpupvTiNlYhjbJmkZlXT7SB2dQnc86jozcw==
X-Received: by 2002:a17:90b:1e0d:b0:32e:a4d:41cb with SMTP id 98e67ed59e1d1-33b511174afmr35985917a91.1.1760525537810;
        Wed, 15 Oct 2025 03:52:17 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b678df6a95esm14449105a12.36.2025.10.15.03.52.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 03:52:17 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Melody Olvera <melody.olvera@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH v7] dt-bindings: usb: qcom,dwc3: Correct the SM8750 compatible
Date: Wed, 15 Oct 2025 16:22:07 +0530
Message-Id: <20251015105207.2819689-1-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: fFubX6kip5zsslvW8dkY2K1Oti7GXfuf
X-Proofpoint-ORIG-GUID: fFubX6kip5zsslvW8dkY2K1Oti7GXfuf
X-Authority-Analysis: v=2.4 cv=eaIwvrEH c=1 sm=1 tr=0 ts=68ef7ce3 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=YaekFVptU7I1Td1_cOUA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyMiBTYWx0ZWRfX9ryP/oSkPLsj
 9X+HClLCsNvxdydjgTH59sCvagsAT3H+/dM0T9jkAl45wURCxo9zHTouujNmi/WCH2AxHMUrkOR
 AnkEdMoPAhs0kN96GcGxdl2v8h+COKmV5nc3kPnrQzO/yYTLbgaM6o0+tUZUEZ8gII5IQqBWxoO
 iYuazpKW7LA3GCNhKucVw5ZE0KxqpudUwwKJiMcJh5PgLRwI9Am8yUwK7TEBLk2kIXW0sbadcvQ
 aZN9XBdrBlJw2PVa/99Xu1zQX0mvzWByKkyVRLnjUaPGSuyzmQPc+XJ82dy4F0ziH9+Dllwe6X4
 h8hFD9t0j/DB/AJq08W1bqAviIvNeqf2shPbQIuGKlaxupj3jd7Nk6VU7t6YJzZaO+g76UtmvD/
 Gj3h5bKbSM3v6c2U5DhugN7CHtAc7Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_04,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110022

From: Melody Olvera <melody.olvera@oss.qualcomm.com>

SM8750 does not require an XO clock in the dt as it is the
parent of the TCSR refclk_src, so move the compatible to a section
where the XO clock is not required.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Melody Olvera <melody.olvera@oss.qualcomm.com>
Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
Note:
This patch is originally part of the v6 series. It has been split and
sent separately to avoid mixing usb patches with dt patches. No code
changes done w.r.t v6. It is a rebase on latest linux next.

Link to v6:
https://lore.kernel.org/all/20250527-sm8750_usb_master-v6-3-d58de3b41d34@oss.qualcomm.com/

 Documentation/devicetree/bindings/usb/qcom,dwc3.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
index a792434c59db..298b1472ccbc 100644
--- a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
@@ -227,6 +227,7 @@ allOf:
               - qcom,sdx65-dwc3
               - qcom,sdx75-dwc3
               - qcom,sm6350-dwc3
+              - qcom,sm8750-dwc3
     then:
       properties:
         clocks:
@@ -366,7 +367,6 @@ allOf:
               - qcom,sm8450-dwc3
               - qcom,sm8550-dwc3
               - qcom,sm8650-dwc3
-              - qcom,sm8750-dwc3
     then:
       properties:
         clocks:
-- 
2.34.1


