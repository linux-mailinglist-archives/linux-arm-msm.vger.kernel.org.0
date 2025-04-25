Return-Path: <linux-arm-msm+bounces-55584-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A99E9A9C378
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 11:30:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BFAA91899347
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 09:30:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 648E1236A9C;
	Fri, 25 Apr 2025 09:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="nYVJhNhM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C69C522ACF7;
	Fri, 25 Apr 2025 09:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745573413; cv=none; b=BxXmM+TVCG5kNYnzeBhxin1ALPDxGsdYxrasbtUDQncl/7rABT2saHwM0NHJ4g8l8EgvZr1fx3q+QxfnS8sHscyAczNqojLdePuAMEVG/pN1gj11PrDUuRMAhCv72V4udPvcYxJlkKbPqjIh4tTDmZaN6yqmceQwl89YLHNvrfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745573413; c=relaxed/simple;
	bh=XdX1zdxnOlKi1GAFdfPNJjwetb3NnSOz6sgyFNxDk8Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JSWgk460HY6ezq5bud20iVSZqKQXfHjimPFNLT1+eTLq0sKhTcLioVJn2zVcgGrgaFwxmpQCrn3jBV41D9s4k+mpR9JUNaR9sXW6QQI4x4Rbrf4c5FTXRVlRxOz+gZlrSfwE/iDa5heG9OgLLfxfKRRu9Bra+LdBmXcOC70Pceo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=nYVJhNhM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53P8TSl5023834;
	Fri, 25 Apr 2025 09:30:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=p5JfYp96lWL
	lVf5fAStHH5hlJ//K0yKw4fXIIktZojM=; b=nYVJhNhMDG/IfRIbnKzDJ0CXAG0
	c8mp5zi1hBQdthbe9NoRzisYWb8u5RxJlB4/neT8hYcCn4/S9xAXyPG9j+Eyq6Si
	eAUj6jfVMxpAK18dtN+8jJJYeW/gqxmU6iSitOwSFWcBEnzLn6QHzfyOuXIJ525l
	F8HPYU4X5niIFUckeGILfIzXlwhoOGaAaU3hxw4TkLQlwzZBhRjlHG+vlgcS70I5
	4VvVXYta8ZwKfmmkyXDqIENLRLoYhUZd8/oRWUuhXtda7WSjK6+znObyhFvM7KsJ
	O2W0oDkboJtXUsMkYuRq2wZ/jG/7gO+y9saKCH67xQki4FbayhStGEwP4hw==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0gk4u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Apr 2025 09:30:05 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 53P9U3II022399;
	Fri, 25 Apr 2025 09:30:03 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 4644wnf74w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Apr 2025 09:30:02 +0000
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 53P9U2J2022382;
	Fri, 25 Apr 2025 09:30:02 GMT
Received: from cbsp-sh-gv.ap.qualcomm.com (CBSP-SH-gv.ap.qualcomm.com [10.231.249.68])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 53P9U2cV022340
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Apr 2025 09:30:02 +0000
Received: by cbsp-sh-gv.ap.qualcomm.com (Postfix, from userid 4635958)
	id BFDB940D6C; Fri, 25 Apr 2025 17:30:01 +0800 (CST)
From: Wenbin Yao <quic_wenbyao@quicinc.com>
To: catalin.marinas@arm.com, will@kernel.org,
        linux-arm-kernel@lists.infradead.org, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: krishna.chundru@oss.qualcomm.com, quic_vbadigan@quicinc.com,
        quic_mrana@quicinc.com, quic_cang@quicinc.com, quic_qianyu@quicinc.com,
        quic_wenbyao@quicinc.com
Subject: [PATCH v2 2/4] arm64: dts: qcom: x1e80100: add bus topology for PCIe domain 3
Date: Fri, 25 Apr 2025 17:29:53 +0800
Message-Id: <20250425092955.4099677-3-quic_wenbyao@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250425092955.4099677-1-quic_wenbyao@quicinc.com>
References: <20250425092955.4099677-1-quic_wenbyao@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: vGvPLv_TKGRJ6NWrot7MvOLX2n52X4zv
X-Proofpoint-ORIG-GUID: vGvPLv_TKGRJ6NWrot7MvOLX2n52X4zv
X-Authority-Analysis: v=2.4 cv=Fv0F/3rq c=1 sm=1 tr=0 ts=680b561d cx=c_pps a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=R2ixBC5xtkv2JAc71vkA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDA2OCBTYWx0ZWRfX2H0LK2Symofh qwJToJw5U6YDBRh0Ax6LUEIA4OaE8w0wBsjU0ngSjkV8ZtkhVmWKD56SVItMolA+NfE6+9/CwBP aMFXPnmS+kjwG9lxNqYRfEehrzPGXN0DHhc/algH5pHpD5sfS69EEDUqsgFFzWuvzo1s9y5I/fM
 3S2m8DOleDZv1TqR5QQUSlQlTUE3YAPqFeGv5i/uK1vCwiqq6KjY8n8HCfyIhgvWkfkrABW5eue elwYZ70hzZSsGylcNkq8HCObUVrX5pdhlwfZn4CzEjkn5lwXPlj2EQK4mGs7p/7B3HoerztnK/1 vYv+8Z6wI3824qLK1nx+ar9fowwfKmHaFtVMiwEs0qOYnWTjBcM2TmJlJvFP0CBfraBFqg84NB/
 ER+HgO9j2nNoWd1XL0tSU4de4/aoexgzwuQwVAAGp59tS5SKLC8UWivG2nPpJoZwaJsiwwz0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=948 priorityscore=1501 suspectscore=0
 adultscore=0 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250068

From: Qiang Yu <quic_qianyu@quicinc.com>

Add pcie3port node to represent the PCIe bridge of PCIe3 so that PCI slot
voltage rails can be described under this node in the board's dts.

Signed-off-by: Qiang Yu <quic_qianyu@quicinc.com>
Signed-off-by: Wenbin Yao <quic_wenbyao@quicinc.com>
---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index 46b79fce9..430f9d567 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -3287,6 +3287,17 @@ opp-128000000 {
 					opp-peak-kBps = <15753000 1>;
 				};
 			};
+
+			pcie3port: pcie@0 {
+				device_type = "pci";
+				compatible = "pciclass,0604";
+				reg = <0x0 0x0 0x0 0x0 0x0>;
+				bus-range = <0x01 0xff>;
+
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges;
+			};
 		};
 
 		pcie3_phy: phy@1be0000 {
-- 
2.34.1


