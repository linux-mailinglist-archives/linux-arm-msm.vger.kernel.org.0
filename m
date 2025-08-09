Return-Path: <linux-arm-msm+bounces-68195-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 51DE8B1F3F5
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Aug 2025 12:00:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1323F18C6F39
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Aug 2025 10:01:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C564F26A0EB;
	Sat,  9 Aug 2025 10:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jdFO7fwK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 620D5265CBD
	for <linux-arm-msm@vger.kernel.org>; Sat,  9 Aug 2025 10:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754733601; cv=none; b=j8aLisdoZZ3gxqEeTMXaGyj5lyIIxtMlUubzuY4fRZpcLxgBw5NKt2raqvI+72yegJ2dlhCEU7HQme11uDYBIFkdjAR/bSTssp6P2t2gujveuW16C+/5KLwAnC2XWh2S4EmliatXPfX1ZIgoAxJYpbK2L+5fWYUUWHMOK9haC9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754733601; c=relaxed/simple;
	bh=D98uYM9Z60IMUSi6ICuga1Gz5L3qO2+oE/TUIJZiRHI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N5UvjHAZgIhjyFEZmeCJGqPK3573A9HMRsKDLc0C9Q8mjkNRDEEg4HGO1YlnXZX7ZL2Ev44khOSvbrbe8qA6fQ9Z3EpYTVuFdbGSYuQjwnNJ9X2+wV0liLfB3PyakcupneulQ1AiGV7KxmMDRC3dw24B7kfPoA6d7H303BsioKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jdFO7fwK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5793Ynn5011715
	for <linux-arm-msm@vger.kernel.org>; Sat, 9 Aug 2025 09:59:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o84ehtqBVBZmVKt19QIWtMIRk8uHsOjkSCs7whgckXU=; b=jdFO7fwKcoFS04Uh
	l1TAi96gPHVqHpox9gHpMTIt+lV+9g9oeEEt5UCZabhIYSaP1DNIlwjqcodAXRDc
	ad5iS+khF6Qo/sTtLQFV1Rws9s9WmHrifedCdOWMQPuEPCgMKRPx71t5Apu07+wE
	GBf5P0mhjdxSn2JG4/avFRVFWWRL+2lq0RU7X3HKgUMowjRE5Y7+lSEenj/rGPcP
	1jpITAes9wMbEHIOTSQ0PHksD0xTolo0GPQIjGf0ZNTuuGlieM8UoaIDZqSKqYlY
	3uFi6I4oArVNrYmSsAEYtkW4DRUKn4eDOmrKt5XOypoB98OZS6P9j2n5TPCXJO8Q
	ptZzUw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dxj40e8g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 09 Aug 2025 09:59:59 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2403e4c82dbso22862455ad.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 09 Aug 2025 02:59:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754733599; x=1755338399;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o84ehtqBVBZmVKt19QIWtMIRk8uHsOjkSCs7whgckXU=;
        b=GTL70pXPzcPI8FjIfvBYxVIo4SbYjJ1Wazv1L5CH5OKPd4K2VskgjxMxEMTW0glMn3
         xL9C4VAzm4rRfXmAKGymukZ1AWRs+huoEFDom82B2s/bWjkGHfoU68wQx63T/ZFJsVTx
         nIEYm0SpbHEUuifL2qVwP7BGdYvkEZP+mEayNM67YbpkNYHUSQeRxcRjp9/mcOngXalo
         mrt8IbgP7NWoR6SiaWIKpV/JxsLxOQgC3e59fp8wsuqjdm+zQywTTyTZQwqJacaMkh03
         SawoAsqwpBhuaI1T4VcclGlYa5MeOx9880d3kXdEIVQOIYdoRxhDG3D8D47acQX5+gQQ
         mXbA==
X-Gm-Message-State: AOJu0YzI/zDZCFlYfv6ahsd3wUNAennAG3BnuDoHLDJUtCmCaiw1TUfE
	CTZFS/XTj5xx2RE8ZtNxb+lVM6+LnJ+HsQMOA9Dg9XRGOMG5IKcEwd4jHtMdI400PM++gMf7qEu
	H4IvXC1PK4/ofaD3z02juHY/WMaVSw9pQho86vDmTNtaMh6idHpHCx3SRYE1HMCBuTowx
X-Gm-Gg: ASbGnctpt2p1mDAN2PGBHbsvlg/krFC4PCRCRTDDtCfDIdlsROP4w3XKoc+u7VkFXIc
	agW7qSnvvxIF6yptVhX/dmhJoOR1Km+S8wyRxGWMo59AoxscarGH8c0GvJw8nDO+xO5CIsuaCrC
	foOQCbxYgCKE81YRlrZiYSRo7vJg5jEvgr+O12Dwnpq9TOlbGlSvoM7i8ZXzt5BvOLRjCcusQ99
	W2svXBheKSfO2lcCJ6/1Tswy2bwVFo9ZTwi9qevWGmY3CqA0S22PAU6pM+VdTABD9NQHVe0I4sh
	mKgHnERw6tvGalXShd28O6YNOY2ZmuR6BaMPYOG4u6e+9jIbvZVkCC8TC8SVEmDRGDVNVe4ZHH8
	=
X-Received: by 2002:a17:903:40cc:b0:240:3f0d:f470 with SMTP id d9443c01a7336-242c20440bemr81620965ad.20.1754733598892;
        Sat, 09 Aug 2025 02:59:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFI8IHqimLHr7wh2wQyI+Q0XVDvkBIylGOeXLKFZACnOrlfoFT+ysYaqiBD387svYbfkd+bJg==
X-Received: by 2002:a17:903:40cc:b0:240:3f0d:f470 with SMTP id d9443c01a7336-242c20440bemr81620735ad.20.1754733598457;
        Sat, 09 Aug 2025 02:59:58 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e899b783sm225962845ad.133.2025.08.09.02.59.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Aug 2025 02:59:58 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Sat, 09 Aug 2025 15:29:18 +0530
Subject: [PATCH 3/4] dt-bindings: PCI: qcom,pcie-sm8550: Add SM8750
 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250809-pakala-v1-3-abf1c416dbaa@oss.qualcomm.com>
References: <20250809-pakala-v1-0-abf1c416dbaa@oss.qualcomm.com>
In-Reply-To: <20250809-pakala-v1-0-abf1c416dbaa@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org, quic_vbadigan@quicinc.com,
        quic_mrana@quicinc.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754733575; l=894;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=D98uYM9Z60IMUSi6ICuga1Gz5L3qO2+oE/TUIJZiRHI=;
 b=gwn0lQcGmzLXQ2MXzzYuJm+/nUNsSuse+BknbwSa3jTeXGEUH9LwXwJokOA4GGTXYiB0fuw4P
 GdXwSPgi5sMCf+G5eNlCvWOacfyXIUz8Jdwc3r/BLfu1OH6ZQTtDlg6
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAyNyBTYWx0ZWRfX7kbs3Y8YD+K4
 03Sjt1RXO8aQF+2DyZUhuYEIWc0MZcdmdChc0/9ulpaFG6xUwiw1v5oag+fT4ljqQwx4e2ThRF2
 U87PPyOLA60jIWiWfvE1eEZeIePUdRXoAmBcug5VGL65xCChAZ13xdPmkmxdw7PWe2UvJCKeDVX
 FmfXZ38T8ma5d0M+tLqoyFmjSrMIHVmWd0qqZGS49J/qZPoctCUUYBImAffwxQafgYQXY5v0nPB
 OqVIfdPKwhPa6TpG9mkR7byhEfxSICatCYObR0cLRuZB1InojZ/xHqloGY8Z8TYZxIAaf2bGRnf
 8HxkHanD5/PYYm+HrlvxsmwBr3BeFySfV1P1m6K6mkvaImiuXPrjrLWLD4GfoRWsS1Ptv51vLuE
 1PI3Rak/
X-Authority-Analysis: v=2.4 cv=fvDcZE4f c=1 sm=1 tr=0 ts=68971c1f cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=ly1VyIkaSgMpB_u5KqwA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: qoTi6TZf5ANwuDKlb72bS6x8kzl1qLwr
X-Proofpoint-GUID: qoTi6TZf5ANwuDKlb72bS6x8kzl1qLwr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-09_03,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 clxscore=1015 phishscore=0 bulkscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090027

On the Qualcomm SM8750 platform the PCIe host is compatible with the
DWC controller present on the SM8550 platorm.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/pci/qcom,pcie-sm8550.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie-sm8550.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie-sm8550.yaml
index dbce671ba011c8991842af6d6c761ec081be24cb..38b561e23c1fda677ce2d4257e1084a384648835 100644
--- a/Documentation/devicetree/bindings/pci/qcom,pcie-sm8550.yaml
+++ b/Documentation/devicetree/bindings/pci/qcom,pcie-sm8550.yaml
@@ -22,6 +22,7 @@ properties:
           - enum:
               - qcom,sar2130p-pcie
               - qcom,pcie-sm8650
+              - qcom,pcie-sm8750
           - const: qcom,pcie-sm8550
 
   reg:

-- 
2.34.1


