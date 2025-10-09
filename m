Return-Path: <linux-arm-msm+bounces-76543-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id DC379BC7870
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Oct 2025 08:19:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 6322F3517F3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Oct 2025 06:19:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09F0023E347;
	Thu,  9 Oct 2025 06:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b6eJ3jPy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7046F29B781
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Oct 2025 06:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759990764; cv=none; b=TVti2EVekmjNRRuIMUknRVlpKq3m4B1IJsG0A8aCny7Kf/kjJbdMfqrns43+dtdl/G9YrsZEbhoU2tZcKrWI5jkaUFwyHGCNJnD2wylJ+BzfEE3yJZeP2P5o0gJn0RBPc5WJEPAmIbJ6EPr+Dt1REhvZ+WZFRWKx/5ZMyDpjUp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759990764; c=relaxed/simple;
	bh=hq6lPwx/LlAxDemNp/o43bmJQh1mZWxBV9kEbcr71VA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ONW9WX//iX/g1itrOPtgb/IpHhCRTARTnu1GPFdZaHurDUyt+SCOIWJLa97wlLjXZCbmbBH+koptUD5Ntt9tzFLd3DWdc53OOZAHb+tx0aLRcRzTjVhJmfx02NsQhQ8JTyvcfrkg6WeqljKicSZZEKxHaZyc9Aifgf4SyzJAraU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b6eJ3jPy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5996Ed9v029992
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Oct 2025 06:19:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vihRQdTrmgMT5JdtyKr026uGWsPWwj22Qw1GxNp1440=; b=b6eJ3jPyTK5hkGce
	KQsS/Yqt/3qKYyd8AHrcEUXvCxCByXwfCIh7t/NxMDiVutd/lsR1LLQvnrV+mXbw
	pSx8Nm6ftBnSNgzJ34bOmcZ+Efg1cQCZVOTxD/bsRYCDVZR6Pn52VR2V4FEzA+NX
	KL1G28u6Dq3ncOdOkxnlZJyCON1tXgdzrBnaBHIFCiR6I/r19GD23dPn/6mK+sE5
	Fq+1NUtRTu6VEEljzAP879YzBYbDO3KiXfgGs0FBpAKsKfWEW8TGcuyUHBmVX5N6
	v1A2jKDwzImO6T6csmwu+hUzE/AdW8AgpcChknL0ttquGPIe833i2kgpfTU4M5lg
	vK4IKA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4kspwt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Oct 2025 06:19:22 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b57cf8dba28so1010040a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 23:19:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759990762; x=1760595562;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vihRQdTrmgMT5JdtyKr026uGWsPWwj22Qw1GxNp1440=;
        b=j8EehEahDRjj1m/a0QlCTFccbn7QWFYpfDWdUwoBcO7LrzKquZ65F6ORiwM0hJzMhQ
         Rj+6ucMQowx+f0j2a+ELILYhAE3rGpsEOwChPjXVlBuEs7uU8I40kPWfbw9zy9mSne5H
         FX+AZ9oX03YgjV1XXRwJX7J3bkvvFDHqoJsx5kUI5KVBNSHWa5MI+KvJfOlSiQ96OO1b
         L5SpPQ5nYWLy1jjt/XlVFWTzkPnyPMt0kwkZNj514DlSjQXASuV8m9ptZGrQd834nbhO
         LOJrHdV4e3YPdsUOF9guxpY0IGV5Gj6EzJHKz2jTaW/Ovl6AzMOv8VZpFMFkCLovq8QK
         vRTA==
X-Gm-Message-State: AOJu0Yw9ujWS+O0HFGz6mx87tLfc4ZTgUaSjSw3zPi1YqahE7VR62h9f
	ufp9+kEaoTXnCuSBS1Z6vHVCEXndPl0aGRDowbtxvpIwnfXa685/02TRme/hT9zeeibyzt8C4V1
	dC1zDXMCxx/1A6qOBjusZSi8iZgEkPEYaldxb7HBU9ydgfnW+i2uuVabNiYbSOBxzEVH7
X-Gm-Gg: ASbGncvjHEJz192HndXQoEbp949zyf2g5l9jDhdxJfy26Qji/aoVioOMQFVtlMPJsDq
	ArLxZyRWf+ENa0/DGGbOqjZ4CvHaA7XtJGD/yEjXfvxbxum+CN+c/cxHTQEkvD7ulJPNzpriAUF
	E3k+/iVDxYKKi15ZNYNNh+6D3y01bRQqjnY/RpCwVjKCXG++BhcudsbxA8pOkL3N/HfQllYuopo
	xJxucb/86zY60ZKE9Bo9SS8AYSoBSej6CcbLOpGHO4I3eba9pjSOBkae0J2vzntu9uDw2AfOcJu
	Sce3+NeZxAqzk/WPGEJxHNJm+nH4heTqaVbhMFlWRU98paNUTjF8ik9xYK4VakdHko8yDBb0x6m
	bA/EzhyU=
X-Received: by 2002:a05:6a20:3d93:b0:2f6:ec69:d448 with SMTP id adf61e73a8af0-32da83e389bmr8621612637.31.1759990761907;
        Wed, 08 Oct 2025 23:19:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHmGBOeCai2v9eRB0KpRm+tuIHJxkr+PscYZcrlVB1lXuEuGL44JtmrAh4zV0b7qSGb6VhPsg==
X-Received: by 2002:a05:6a20:3d93:b0:2f6:ec69:d448 with SMTP id adf61e73a8af0-32da83e389bmr8621573637.31.1759990761401;
        Wed, 08 Oct 2025 23:19:21 -0700 (PDT)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6099adbcbesm19239671a12.4.2025.10.08.23.19.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 23:19:21 -0700 (PDT)
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
Date: Thu, 09 Oct 2025 11:48:52 +0530
Subject: [PATCH 2/5] dt-bindings: crypto: ice: add freq-table-hz property
 to ICE schema
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251009-add-separate-ice-ufs-and-emmc-device-nodes-for-qcs615-platform-v1-2-2a34d8d03c72@oss.qualcomm.com>
References: <20251009-add-separate-ice-ufs-and-emmc-device-nodes-for-qcs615-platform-v1-0-2a34d8d03c72@oss.qualcomm.com>
In-Reply-To: <20251009-add-separate-ice-ufs-and-emmc-device-nodes-for-qcs615-platform-v1-0-2a34d8d03c72@oss.qualcomm.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>
Cc: linux-arm-msm@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-crypto@vger.kernel.org,
        Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX1WsCS8kStiZ3
 DfDuNY0sADXynRZMYe3t06NVbAxFweX4tMKLuII5vVjQlE4knxjsOieSms1nMlya5wucuRmXcNE
 hXdZZK1gNuRQPXq65G6BZKEFK/NjfP23ohwXT2mK+hvh/tZbY/8wX3+Qlf7+KmtvVxMAN8v7Ka6
 1It9ptIBFGBbaay3cvvXSPM6nZ+Bxojyd1ZAFL+48fG1Gu745dpE8uvnbn1hXNFCYXJA4ZbP5jw
 sdIXAOKJ7cHQcQMMgl46r6mKoiCeldA6faJIb6p92XhZhkokSzQPFZKLpRH3rFPmXbJPQZMK4t2
 doXYjP5ajJZaTOQDUBwIpJj42GeFpvXQTpvMaN+l4EWFdiklHybwxNcG+zOjiMFoHQdaVPfPhVW
 e3Mr8n2/hH0NS8MmG2rNb4VdCkodAg==
X-Authority-Analysis: v=2.4 cv=CbcFJbrl c=1 sm=1 tr=0 ts=68e753ea cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=RNL4ykPXmF0GAHKcDNUA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: f8txQ9ac8aV7Tf9f4Hiueo3SC-h4mAGT
X-Proofpoint-ORIG-GUID: f8txQ9ac8aV7Tf9f4Hiueo3SC-h4mAGT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_01,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 malwarescore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121

Introduce the 'freq-table-hz' property to specify the minimum and maximum
frequencies supported by the Inline Crypto Engine (ICE) clock.

This property is added to the ICE device node because the ICE clock is
managed independently by the ICE driver and requires frequency information
to be available in the device tree for the proper configuration.

Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
---
 .../devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml       | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
index 08fe6a707a3714ff11d01b36afc8a2aab1ad490c..88bef1d38013fc7d0e6842e370b2adb3bf3e8735 100644
--- a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
@@ -29,6 +29,11 @@ properties:
   clocks:
     maxItems: 1
 
+  freq-table-hz:
+    items:
+      - description: Minimum frequency for ICE core clock in Hz
+      - description: Maximum frequency for ICE core clock in Hz
+
 required:
   - compatible
   - reg
@@ -45,5 +50,6 @@ examples:
                    "qcom,inline-crypto-engine";
       reg = <0x01d88000 0x8000>;
       clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
+      freq-table-hz = <75000000 300000000>;
     };
 ...

-- 
2.34.1


