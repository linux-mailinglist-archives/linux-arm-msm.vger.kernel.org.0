Return-Path: <linux-arm-msm+bounces-35826-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BEB7C9AFD36
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 10:53:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 603D11F21ECC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 08:53:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39D111D363F;
	Fri, 25 Oct 2024 08:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Oup1uo3i"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B9821D3576;
	Fri, 25 Oct 2024 08:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729846397; cv=none; b=bqEjwzQXExJBavzIafZwsZVFYIrq9eswpwBdO1CqUxdz6NTO9bRpt4X0P0+8i4/boBUnpQ9p4sPE/ZObHPfCpAUKePku/ncNgQRTkj8/oizsjtntj23g81vFJxQm+E1yymOOHH4pj8OGlD5vYUK73giau7w4cQcJ/SbJPnVTU9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729846397; c=relaxed/simple;
	bh=EQXlaHkkUBgXvMPKwCMrBI9AIMpW9JACxPlTI0Akon4=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=YGSQWvrwpmCthREFx6j7BXYNLgUoZbjKl2tJSrbklPNEXUomd7BKowSkvCE0SUzjMv4/asNsZgYAP1dcDnymw/74MtdUyOvRBB/2I6FFlJPk7iWpkNsqqPJPy6OcA+WXiZv6asKKK5plbgHsW6It/Q9eOHl/Pw0mpHtvMFZ7F0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Oup1uo3i; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49P7RaXD019891;
	Fri, 25 Oct 2024 08:53:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=OQsxfbYu4suddiKXEr1SZv
	OHQfEpg8JLy7OaXcSYP7I=; b=Oup1uo3iQCPv/u9Ib+M+Cf+pMEl6Xg3Ti4GX6a
	+Z7WRvRZFzHjWTeIpm5XFZ5Nng/YIk/Yzekr5cClBmXRjL/KMQ7OEqDIy3LJYfpO
	XKrWrxkWh2rYVisdBLS4Pu2R7u9V4d+Sp9/0dsYomZfikH/9ztYTyxORVd1RiAVZ
	KPGzXGFve679TQGUXBsDpXbfa2xZrPyMVUqkpz0TVl9eCvPBrWCUUtPgCy+5ik4r
	CehR52tRaS43XuZUT3n9W9QiK2p1FGqmLSX0m2mOXF82zz/HZ9bnAl8sBbdqETCj
	evvPDCZgoMzhO/X8rRW9UAnss2TvHOUZcDrpfD8BRw15xxEw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42g6y90759-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Oct 2024 08:53:10 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49P8r9iH005214
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Oct 2024 08:53:09 GMT
Received: from hu-tdas-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 25 Oct 2024 01:53:05 -0700
From: Taniya Das <quic_tdas@quicinc.com>
Subject: [PATCH v6 0/2] Add support for videocc, camcc, dispcc0 and dispcc1
 on Qualcomm SA8775P platform.
Date: Fri, 25 Oct 2024 14:22:52 +0530
Message-ID: <20241025-sa8775p-mm-v4-resend-patches-v6-0-329a2cac09ae@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGRcG2cC/32OsQ7CIBRFf8W82WeAQqlO/ofpQODVMpRWqETT9
 N/FGuPmeO5wzl0gUfSU4LRbIFL2yY+hQL3fge1NuBJ6VxgEE5IzzjCZRms14TBglhgpUXA4mdn
 2lFAKXSlHnRKGQVFMkTr/2PSX9sORbvdSmX9j79M8xud2Iav3+q3x/7WskKE0x45rZ+umMueit
 j7Ygx0HaNd1fQFs3q/z3wAAAA==
X-Change-ID: 20241010-sa8775p-mm-v4-resend-patches-42735def52a0
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, <quic_imrashai@quicinc.com>,
        <quic_jkona@quicinc.com>,
        Bartosz Golaszewski
	<bartosz.golaszewski@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Ajit Pandey
	<quic_ajipan@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Konrad Dybcio
	<konradybcio@kernel.org>
X-Mailer: b4 0.15-dev-aa3f6
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: I6QJeOy8ZQU_Yg5KF14Ng8oAUm70xYBw
X-Proofpoint-ORIG-GUID: I6QJeOy8ZQU_Yg5KF14Ng8oAUm70xYBw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 spamscore=0 adultscore=0 suspectscore=0 mlxlogscore=999 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410250068

[v6]
 Update commit subject and commit message for both the DT patches [Bjorn]
 Subset of the patch series applied: (Removed from this series)
   Link to v5: https://lore.kernel.org/r/20241011-sa8775p-mm-v4-resend-patches-v5-0-4a9f17dc683a@quicinc.com

[v5]
  Rebased the device tree patch to add clock controller nodes.

[v4]
  Changes in [v4] compared to [v3]
  Videocc: Update the mvs0/mvs1 gdsc to use HW_CTRL_TRIGGER [Konrad and Qualcomm
  internal discussions]
  Camcc:   Add new clock to the clock tree.
  Change the patch order for 'Update sleep_clk frequency to 32000 on SA8775P' [Krzysztof]

Changes in [v3] compared to [v2]:
  Update the qcom_cc_really_probe() to use &pdev->dev, for the CAMCC, DISPCC & VIDEOCC drivers.

[v2]
https://lore.kernel.org/all/20240612-sa8775p-mm-clock-controllers-v1-0-db295a846ee7@quicinc.com/
Changes in [v2] compared to [v1]:
  [PATCH 1/8]: Updated bindings to reference qcom,gcc.yaml
  [PATCH 3/8]: Updated bindings to reference qcom,gcc.yaml
  [PATCH 5/8]: Updated bindings to reference qcom,gcc.yaml
  [PATCH 7/8]: Split updating sleep_clk frequency to separate patch
  [PATCH 8/8]: Newly added to update sleep_clk frequency to 32000
  These multimedia clock controller and device tree patches are split from the below [v1] series.

[v1]
https://lore.kernel.org/all/20240531090249.10293-1-quic_tdas@quicinc.com/

Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
---
Taniya Das (2):
      arm64: dts: qcom: sa8775p: Update sleep_clk frequency
      arm64: dts: qcom: sa8775p: Add support for clock controllers

 arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi |  2 +-
 arch/arm64/boot/dts/qcom/sa8775p.dtsi      | 57 ++++++++++++++++++++++++++++++
 2 files changed, 58 insertions(+), 1 deletion(-)
---
base-commit: 0cca97bf23640ff68a6e8a74e9b6659fdc27f48c
change-id: 20241010-sa8775p-mm-v4-resend-patches-42735def52a0

Best regards,
-- 
Taniya Das <quic_tdas@quicinc.com>


