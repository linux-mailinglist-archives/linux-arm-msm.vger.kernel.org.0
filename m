Return-Path: <linux-arm-msm+bounces-84813-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E083ECB164B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 00:10:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1DEC630E9F6E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Dec 2025 23:09:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51D3F30275C;
	Tue,  9 Dec 2025 23:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ciro1ck0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XW1ZxmBe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 909B22FC014
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Dec 2025 23:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765321795; cv=none; b=cyosrj+BECmS6ccqq14aWs2tafLEF8yVlyJoa/660lWKrssFmepnHaiiU2vlJxFFCfmAC02K9zxqvvy3PEVK6HrgBOgqbCAIeRoF506akV65Pecb/pMcpK1dbuor499l38xaW54N3/zM6RZwizUnJp+rix/uNFo76qp/QmY+TLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765321795; c=relaxed/simple;
	bh=D4j+WTARId7aLyHJPuHhuaHB1obraW3ZbX7sJ9MUsrg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Wb0Jnyu8LLjVczPJMZML3fQuubgP329lZn4Hfgmv+44oFd6Q899ZybpI2iGjUOj72hzRw/zrK9GBXidYoY5X6WgFaezk5H3RUT/K4e9miCDUBePeAp8opkGG/GgInimvwMBnrae/EWt8v28kaakZHHRLf/oAHx5zAh9vVNSdrU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ciro1ck0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XW1ZxmBe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B9MmfBB674478
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Dec 2025 23:09:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qYJqlwO1uvOnWPq0wZwziCSJV2k+4S4j8CeuNlbAgeM=; b=Ciro1ck0OwjThuzg
	9AD975F5TVfzzkJG4mHW1UBZplR+r3pocNU612PnHwR7zrkhQd42QwFYyVpMeQqd
	01KXIfdcmxuGXkLJFblLla5SiImB0zH4a5VozuG516C6P346kNOtBOyUSqrs2ADR
	8btrVKK70VdVGiJlAvXqDfezr1o9CrGg9+OG1KsKtEZTxrki+uItr8YyttuH4ht9
	CyexMoH+C+ZDLkC1fiOUv8wneHDuytS0uaC7OfkDi/VK9zlaC89I9XFefJazk14Y
	HYxDYu+HICO1JRwfQxnKBJdEwbV0FJm7okc2H/bFgEHoRAnNFRbZgusReTznDHWq
	zRkVSA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4axqqn12ts-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Dec 2025 23:09:52 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-299d221b749so116211405ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Dec 2025 15:09:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765321792; x=1765926592; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qYJqlwO1uvOnWPq0wZwziCSJV2k+4S4j8CeuNlbAgeM=;
        b=XW1ZxmBeP8LlidpQk8x9HOs5bOl8I0d+Xm9DAsDXPORFVNffiXoA4ypwKPkrg2tom9
         3ibOeXxsWYwXGPMPeguU52o6dYIL9LSXzYNcMHFg3MjiAECkQ1GNRpzALzL/xtfhMqbD
         zz9P4NskXAxv3cbOTbqlM2aHX6uAAauDpOhti1CMRxjVHUtsy3ETEQM1QtHhk42kbIAW
         QfWs39JLTVn3XRA8v2Ikm1lbCB6WiKzHwXVyNFzP9gW3lHOgwlYrf+vnvZDBcl+Kz6w/
         yj5Sk+AZdedeGLSL6Wmhaotw+3/3FR76wAMXm3gp89m+rMgT4MKO4O5PWGs4gDdg6PxJ
         gDbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765321792; x=1765926592;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qYJqlwO1uvOnWPq0wZwziCSJV2k+4S4j8CeuNlbAgeM=;
        b=dW0dFEmlxHSpUUBskQKYdYLg2PVAzJIK1/E91C2eCoWatj4gKbcQRUug2xuMBfa7Sa
         SW4j6dedWpK5h//Lb6cWBFfLSKBTwNS8MUPArA9q68N4/3fRB958+ZmwnXidVgswCABA
         Zmqt8PkV7QwXvYBwjaBxSikg0AD2Q5LKUbJXUC9Q4/nv2mBHs7VV/Hy/U69og8FM+hpe
         OUo+mdo//eNw/2/bxBNeIb7H879T69VZHVfPKaQp+oqzO6MPb+gS2qljRYkNEUMMixjw
         euBqwROYr8NoMbRsJAIYj4lFt4MEJ0wwRLgDSst9THiEWgMFNPcYjRKZoG5BQYqm1/h3
         tD5g==
X-Gm-Message-State: AOJu0Yw+BMQgqUSzH93rlph40i2WD2RmDpiWjlXixhFSheI0jTKuBXcT
	EZs+5yWtZxkWPJCthan8YJMQxy18YcOqkg/vpWTcY6aCzpciZxu2wUfRQPDPMY0u4lnxUAlvbLe
	qJE1JPMe8aNup9RB9hDZWbMdlBfIvH2WaDA1RTdc6IBtOboak1YBQCc+jTryTD3MKqa1D
X-Gm-Gg: ASbGnctLbJaaB38++msW10atG+NcjzvG+V+o5JGs3IfdvNhPyBSzc7RKuAkXDfuRX2q
	O6gaShnYT1YbWe9xVAax02MbN46ZVXjYJQfODqowkue6RWVoiVBU+pxs2mXHnvhp6cMhs2nRZoS
	/K+ttpQZzkOylujSp/fViaY94ZSjtpQN2vnd4CITdh391XiFW7oqn0RuA2nthNiyi3SRtXZy9NC
	hCs/HKRdMyIb+t/e07NPCxzqW80sZP1Bg6R4vD4bRCM/9nU06CzEGjwXJbNQPIbyjH6ue7m8FVs
	LAqZTW48tBKgRPaZ6Q7bVv59R/KlMSr9rseVcxw/zH4mBo09JRIeH9mb2tKD9JbNSVPU3ryFHRE
	ojt06C3VtiN+asMNVwvWksCXi/WBDInN11sypNWC9DSIOSdaY0GGtzS3MpcZGfw==
X-Received: by 2002:a05:7022:3844:b0:11e:161:c008 with SMTP id a92af1059eb24-11f296cb6aemr260016c88.26.1765321792137;
        Tue, 09 Dec 2025 15:09:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHaKLb2qtxxFn4YweXdB0+CLDDiFZIEeR/bRWCJyv09vWfhRAGjiHiD5Zz1lmE625x+DL2MkA==
X-Received: by 2002:a05:7022:3844:b0:11e:161:c008 with SMTP id a92af1059eb24-11f296cb6aemr259984c88.26.1765321791500;
        Tue, 09 Dec 2025 15:09:51 -0800 (PST)
Received: from hu-wcheng-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f283d4811sm3338933c88.11.2025.12.09.15.09.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 15:09:51 -0800 (PST)
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
To: krzk+dt@kernel.org, abel.vesa@linaro.org, conor+dt@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, vkoul@kernel.org, robh@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v8 3/9] dt-bindings: phy: qcom-m31-eusb2: Add Glymur compatible
Date: Tue,  9 Dec 2025 15:09:39 -0800
Message-Id: <20251209-linux-next-12825-v8-3-42133596bda0@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251209-linux-next-12825-v8-0-42133596bda0@oss.qualcomm.com>
References: <20251209-linux-next-12825-v8-0-42133596bda0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: YDU6FP0gvKS_C_EYWPURj9dLF4ynjGQv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA5MDE4MSBTYWx0ZWRfX/EUVVEqePLFU
 bnXfvKHVDqLpY8pytbfX4hFUyEtaW4bpjDEFX3pEl1VDZFn4FN1DXOb1lWCh6D+VtKD/83xktOV
 UqAr0rp2zkc/8Q9QXg+DMTM29DrpgU+lskDsqtr/KCc8J90X592FrB6KnzU9dOemMT73su7R313
 2FfiJbYmzXqJa0ftxytk89HK249HfkAKNOWqOPo9IAXcXvkQGzrAl2RBdfwJKIsUpag5p8R2g/D
 1pNEukbv0AWcTnxjg8YDWbA/kXYBIfzCkQx2/fBAA6FWZOtvDSPnge9e7So6mZLpdHZc/h3iJvf
 IjAvslJFT/KHAnAtn19+3Vq52FfeIl+xryeTqn1Ut0zsV9x0JAKBwOOAraQbIqCic/x9y8AWIBR
 DExPvC0UplBwsDKGPReR6VKS6OYngQ==
X-Authority-Analysis: v=2.4 cv=A5Jh/qWG c=1 sm=1 tr=0 ts=6938ac40 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=MNFpXpnAGPlOs8bYK0sA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: YDU6FP0gvKS_C_EYWPURj9dLF4ynjGQv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_05,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 bulkscore=0 phishscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512090181

Add the Glymur compatible to the M31 eUSB2 PHY, and use the SM8750 as
the fallback.

Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml
index c84c62d0e8cb..409803874c97 100644
--- a/Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml
@@ -15,9 +15,12 @@ description:
 
 properties:
   compatible:
-    items:
-      - enum:
-          - qcom,sm8750-m31-eusb2-phy
+    oneOf:
+      - items:
+          - enum:
+              - qcom,glymur-m31-eusb2-phy
+          - const: qcom,sm8750-m31-eusb2-phy
+      - const: qcom,sm8750-m31-eusb2-phy
 
   reg:
     maxItems: 1

-- 
2.34.1

