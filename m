Return-Path: <linux-arm-msm+bounces-77305-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A209BDCAB4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 08:17:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9CD773C7E9E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 06:17:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C5AC287276;
	Wed, 15 Oct 2025 06:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kdYpHCC8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9463223ABA8
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 06:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760509027; cv=none; b=rITx5b7L4YddxKZ5kCCADY1BiBKSJfyRuVJvita8nYkx1USbCXx+h2jpJGXSILmfTlHvigdGn3jdI/DNjDgOhBLBzfMsUTIah2s2c5ylL250AtT7wRtr4QKCApbohSVlMBuGUo8kk1n67bl4OohnUJ6rowBVkxvImUIx6g1acZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760509027; c=relaxed/simple;
	bh=8o2ilcr55Fg90dhJPraKKyivyb/o3FWk4iedWPgUcpY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=YJhShyF9tI8lWPo6hQkUchoj6YSOqG+CdqcGOpmG7+/YovWLUEo85W+uzdPX0ApRymhMhcF3jg1Uu/cz7IQBDLdk7XOPzJ0q74wvlvR7nh1sk/+No49zjcBJsBAYcd/T9D0ggazZODgqEd61e6HqVzMSjwj0xBd1f7OlCXAoqlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kdYpHCC8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59F2s7Cf003995
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 06:17:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=3aaVM+bk/LWG9/WNX++Lnv
	M79HuhHY2u/sY0DQEOZAY=; b=kdYpHCC80vFKpk4shYjLb/ai+gmfWL0GvdWT6o
	s2qQXlcklQpe4wX5WLWAzEjWNlpd9MzlSRce0yeM9JQK/YJxAzcR7UJHaazwijfb
	W4pJcOKWZ57t2mGRVYox5Ynl9kvvZyg5pLAmAz36FNyG/KzvzyvbLFOYH1BWC3bc
	xkZNOTKxFFqJE7On9L59U0gmwWOUJLCJtwT8iLPIkvjaj5cLDjlmjMYQ+mUlEFk0
	QhJSfBftFi7D897bRHrGhNTqbnV4ePlo4pzHt4yaWsX/P8nz4n92GHo5OKwxO6so
	cfkAc/YZJpk6yBUh504Nqf+NCgwLB7+95g+Al283bDuiYa4g==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49s6mwnk1n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 06:17:04 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b471737e673so13298860a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 23:17:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760509024; x=1761113824;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3aaVM+bk/LWG9/WNX++LnvM79HuhHY2u/sY0DQEOZAY=;
        b=NHoLgmbI+2dch3kuNUfMYzGsudusqvPUtDPlMD5k8oIiQ8N0PShKT9oQACHeXRNIAG
         7kCuvzvwtYAnyDgsyHoLQ7z9jxN2hsV69L1XMKJG3enMxwbEU6hzJYYh537TxiSTtZvH
         9pNdO0FsGDvY80uK6V0p30KpTO1YtApnv2RdoMYJFYuKUMw/VdURu+8A2IscF6VoIXZz
         xCI/YG3IN4cdcANL1Mq5Brz4IhYFF6ZlXt0pAJP5BesYVFKugOhcw46h47TdU3csqlks
         QrmjD7/FXCe+l/UeikAJ5GMwr4ZW29eHZcoSwDktI5Ay81zlEDoW6d90c093EtM+4dpV
         dYOQ==
X-Gm-Message-State: AOJu0Yzpy6yu8yyk2mK9Bq7wWBzKH1t7GoiTmZG+DnblKIbYe/DVKS6q
	RmXktXQ7+Jh01K8AiDTfr2oCVNUW0NgDCwzeiF+aKj75UwsTsbrE92mFPerLul6PwoLlqDLdgkP
	7KE3kuiWNjBmOmdlRmD6pDMil1hdO0609u2VG16+bPL+2fy1meRpD6pboF3lsLlRudepBC3oqDN
	Sv
X-Gm-Gg: ASbGncus03YLqa7LnPQmmahjPE2tzLm/U2zYmHyDhv6ZHGDYT8ROStIS2mqYtcHOq6P
	l7SSHpN36MB0Ei2ZqPBgF7NXQEYOQL84sTxTrDC76uWF3S15PfPTwAkNCXz+yiFhAEm1WkbSeM+
	tk21q3Tl8/nqkm4fH1OuAJwkFDYC6Scu+2U6cKn+SNRLFEH8N2qyNVtiEuYC9KUfmCLASlUAGSc
	NURgAq3Ud3u6G7fR0fTS5K5T4VOylvV0PROJ6zXkbrNxQ/zdxWAjFnel7odOddpdN3YyrVF9cMH
	baCgjUtIXzmlAon8/2qOhtQIdOL1vBiaUMoxu/4oKe0ZyXhrRa+BMWD8bhScK0AZzQ3nTmGvQTD
	UMSUHb+f91vEQxwQhJv52XwV8+sbqJqJ8aWy7aQ6x2XQjyY9WXjzbT8JhTiweLGxX5g6r842wps
	k=
X-Received: by 2002:a17:902:ebc5:b0:24c:d322:d587 with SMTP id d9443c01a7336-2902739ad8cmr393579895ad.26.1760509023639;
        Tue, 14 Oct 2025 23:17:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHhDcrB3xuKE0zzJAh7RmWViAUMrq8EO27WhzhgDZ7ywcjhYtelAQhCDDoRQPJQseFA9I0umA==
X-Received: by 2002:a17:902:ebc5:b0:24c:d322:d587 with SMTP id d9443c01a7336-2902739ad8cmr393579625ad.26.1760509023178;
        Tue, 14 Oct 2025 23:17:03 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2904f61a1desm125785985ad.82.2025.10.14.23.17.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 23:17:02 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Wed, 15 Oct 2025 11:46:58 +0530
Subject: [PATCH] dt-bindings: sram: qcom,imem: drop the IPQ5424 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251015-ipq5424-imem-v1-1-ee1c1476c1b6@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAFk872gC/3WMQQ6CMBBFr0JmbUmnUAFX3sOwIO0gk1gKrTYaw
 t2t7N385P3kvQ0iBaYIl2KDQIkj+zkDngow0zDfSbDNDEoqLTtsBC+rrlUt2JETlZat0oO1FSF
 kZQk08vvI3frME8enD5+jnvD3/gklFCjOzYhaGtnaqrv6GMv1NTyMd67MA/2+71/7GbgarwAAA
 A==
X-Change-ID: 20250917-ipq5424-imem-350825add3e1
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760509020; l=1492;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=8o2ilcr55Fg90dhJPraKKyivyb/o3FWk4iedWPgUcpY=;
 b=FAmgSZB/x157W3MAG2SKsRFZVJFvQFVhYaXakEZ7YvXSuhrq0orH9yVIrnj/8MpP7UWpxtKgF
 m4DBpwl5NO+BYPOSPtDA8sRnQhJbfAjMq1ktZ9ROPRmq9MRU7aFNkfv
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDA4MyBTYWx0ZWRfX29nVfn1/u6AU
 Feec9MgK+HeZstDTLaSCVpxLJ/yRD87MiPh8C90tWUmBDZ9LXMEpmtD7/G0aB5flCGgh8y6s12K
 cpa73Q7l8tAkh7D5j/vCyDyOoSNa3EIJi3bTYo6/0LuWQqXmeMZcMecHAz5yvZMUPADq6/Su8lj
 fLcLIeqGI7soQQb9aCSwAoTHqTXg8Au8nqnDlz8Otcp4uxBeDfmqFG2GJqf+0SFJnnCcTb+DU4t
 UMqHNXkCrmhyCjR4G4O0Ck/pW3Pi3sNhoc3RI87ZNmjb2wZbLYXLgMwiTlsYcS8PEfnFQkI8mBL
 CHKknk8wEZ/+dKrxRmpcRopHQnxgc16Q4gi2pGLnrOtqUz2UDzyoJlubBKrMoJ2l+B0deOSXi/L
 pv7U6flTqv9QzCSpeJm5zvaNfceplg==
X-Authority-Analysis: v=2.4 cv=Fr4IPmrq c=1 sm=1 tr=0 ts=68ef3c60 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Qr2viKChbx9OD4LU12sA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: 1mQivFXfS21LqwwPtAPAO1cEtt5r2uMX
X-Proofpoint-ORIG-GUID: 1mQivFXfS21LqwwPtAPAO1cEtt5r2uMX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510130083

Based on the recent discussion in the linux-arm-msm list[1], it is not
appropriate to define the IMEM (On-Chip SRAM) as syscon or MFD. Since
there are no consumers of this compatible, drop it and move to
mmio-sram.

While at it, add a comment to not to extend the list and move towards
mmio-sram.

[1] https://lore.kernel.org/linux-arm-msm/e4c5ecc3-fd97-4b13-a057-bb1a3b7f9207@kernel.org/

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/sram/qcom,imem.yaml | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/sram/qcom,imem.yaml b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
index 6a627c57ae2fecdbb81cae710f6fb5e48156b1f5..3147f3634a531514a670e714f3878e5375db7285 100644
--- a/Documentation/devicetree/bindings/sram/qcom,imem.yaml
+++ b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
@@ -14,11 +14,10 @@ description:
   transactions.
 
 properties:
-  compatible:
+  compatible: # Don't grow this list. Please use mmio-sram if possible
     items:
       - enum:
           - qcom,apq8064-imem
-          - qcom,ipq5424-imem
           - qcom,msm8226-imem
           - qcom,msm8974-imem
           - qcom,msm8976-imem

---
base-commit: 52ba76324a9d7c39830c850999210a36ef023cde
change-id: 20250917-ipq5424-imem-350825add3e1

Best regards,
-- 
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>


