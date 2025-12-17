Return-Path: <linux-arm-msm+bounces-85465-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A19CC7251
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 11:46:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3049A30B8607
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 10:41:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41B6A34B435;
	Wed, 17 Dec 2025 10:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O/Rs8yNz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ORbGIfRq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAB2434B415
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 10:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765966377; cv=none; b=oY3cmdEC87JQ1Mt3TODgwyXBVjW+B7PzVNT124nyjm/XWbK35b/xp47w/ixEd8G4eDBX47R7NciQ8PIT/wKHE/8/5GNOFElaYmgORjvQEEY9w99PYHjJGsZISR7enl4Rano0+ErdO0mxhz48OW5ogm16ps5RhyBWjCEmbp974n8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765966377; c=relaxed/simple;
	bh=5rBsnC6utLZsn2mQZMwtrLnMQmTQlPNyGuYb+c6RNjg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=SoVu3EqPQDGCQHpIfhGSzg/wyZ89tBvEnnfVC1Mo2CXUSnP8If4u88N+CVzV/0D8R5ebhJzLt93wnykDDgqMfsMxIT14S9dsvXyjJ8aInp28TZ0PnbDsdut8j+ZCgl7Fc3+9odJpDuKj52qyNYH0+1bQegGvQO4JztZp1PvF/0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O/Rs8yNz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ORbGIfRq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BH3F3bB1501176
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 10:12:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ZRVTa9XJTMzPZAgPVHT1Zy
	tYbf8W6P5h6oM1d+Nwy4o=; b=O/Rs8yNzb8czEq+9HqvD7FBpb3n5X7Y89e4w7c
	cnnhL3yNqys8PTPbLpMI8HzLS79FuZMUcdhwRHKg5nXxUqjoR1zheMxb+P3pPlwa
	L7Q+E2VKS2gQQeC9fOv9g/tckAVgye3qXka7jGw+5kU+IBg5jgjpOTLmaZING7xX
	djEICLaotweq37/kmxA11r7r0KgiuQM6V0SxKRK4mra56Mz1HwobOr9JPlcLA9y6
	54AaeitdWEmPuF9/GhWqNtDqXaQ0DSXD2Tpe+1QY5U6Ak1W8Lh/epuIVDMa4AORI
	pJtQJHGq5gPA2FOEpGQV3wgu3EfFo8OgZl4dl3T79Zt2Bn6A==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3kkesdb8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 10:12:54 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7f21951c317so4827187b3a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 02:12:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765966374; x=1766571174; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZRVTa9XJTMzPZAgPVHT1ZytYbf8W6P5h6oM1d+Nwy4o=;
        b=ORbGIfRq7DBSHEqj93BvoNue1hOExGP+sG5XqlsGcgsRcOA/OiD4245muxlzJgL+UU
         61Ob/XZCSP0gKi0rOU+POKgrRqiExhp930u2AKAaZT+ub/2J+a2AS6T15tmNaQGABMpl
         XaQD3Yhy8uk0YZG+EMPRl2DvZr6Rk0H4F3lK0GZPi75GaYJazs6iBB+0Wbvh3B21rFHu
         Y2TyIMvtC1bfUy83oITG0u0DBbOZ6q5FxOe++8yzTyM/z0AriuRzknHQgSEfYww+1tzW
         m10DytyiFFBJmE2r4RB4QArKkfM0fjuDa47bIxPcjoQid6g4Hw0evPxGinohvUIP6vfb
         fc0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765966374; x=1766571174;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZRVTa9XJTMzPZAgPVHT1ZytYbf8W6P5h6oM1d+Nwy4o=;
        b=AMCXNPkBqcpgDRP5yibXtQElWBSiy65YCcUSZxAMswSLAzRYjQWDASndnHhtn1esHu
         EOAwQ7wLQ0w8lT2lqAsVhURP8c0aXVir9YCc38+l1nm9ADEG9NhPeeFmJUlIh+z8hDpU
         oFc/INoqihIC7jFx075iOnB+3dKJqEj4CIc8pXaKEPa61fyPOZf+0LUCV5EtwrNR3II1
         djqpnPo1rXWd+cVvys6JPn5veNQp7yRXOMJPSY3G4zeYE/8b+htLnc4QhNTQjLWyLmfm
         BFP6WRl/Bzz0UjY1oEcMG486iTkOMxjXyejyccyXFKylAoufE7GJEzB2mi1/XZQIB+J1
         ueiQ==
X-Gm-Message-State: AOJu0Yw4onRIdE9QB+hA+ZWEmu+ChnIYUbbHfNcRm1tLR6eVcs0ca4uc
	vY3wOYpCBGCeKxjCSE74568ZmAh726CImThGuv0ZO8kFRj7ohFxExQdQqWqX/toojg4LHXo/I49
	y9+sAq1zNlGtomhUwqSYzgai+7hIr73nGmmPXQ52fYWqs3IgpfiVdzl9vS7q7Q69tC6ot
X-Gm-Gg: AY/fxX65U2M3qeOLk66fA7CMt8TRAalog4bo64OZKShdnE/yWJxsSp6449M3Ok6lSjF
	1FvER9Kw8h5FDsc0GGY1rgF719dF1ilSzUX5jy1ebGsaZz+XLrgYVbP7/kh9eHJ7vSjwBOCgrWW
	J/tm7cpLeGT3VjOzYpW78RjFw/Ge68fcW/0TTfVbumv/Kr137IGEXYc+WZ8iEtrnN4BemAzgXwu
	VjrJInQGiYIbTvnOdHwK0Q9xFOXDjLbYktNNVqnpcJAM7HKCt3CPeCKdi9Nq95tlWbB38PBvtta
	3K7Fw99utrW1JsVVlJM9aL2m3oR87d5XHxUNryeXZ0i8Izw2fqpWjZq3hy1M2xInxzDNpspFtcj
	D5zeGzle9ubjTrp3MUh3zqX0Smyv2C47+qy49FlHj+Kg=
X-Received: by 2002:a05:6a00:bc10:b0:7b9:a27:3516 with SMTP id d2e1a72fcca58-7f667d197a4mr15423572b3a.21.1765966374227;
        Wed, 17 Dec 2025 02:12:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFrpEe+uxrRokPBJn7XzwGhKI67ALGEa/WRrX51YtyFdWdUzUfbYWywNtpNWjS7RzstaL3EBA==
X-Received: by 2002:a05:6a00:bc10:b0:7b9:a27:3516 with SMTP id d2e1a72fcca58-7f667d197a4mr15423541b3a.21.1765966373746;
        Wed, 17 Dec 2025 02:12:53 -0800 (PST)
Received: from hu-msarkar-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7fcbb11ee42sm2290347b3a.43.2025.12.17.02.12.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 02:12:53 -0800 (PST)
From: Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>
Subject: [PATCH v3 0/2] Add firmware-managed PCIe Endpoint support for
 SA8255P
Date: Wed, 17 Dec 2025 15:42:44 +0530
Message-Id: <20251217-firmware_managed_ep-v3-0-ff871ba688fb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAByCQmkC/32NQQqDMBREryJ/3YhJGiNd9R5FJOiPfmiMJq1tk
 dy9qQfoZuANzJsdIgbCCJdih4AbRfJzBnkqoJ/MPCKjITOISigueM0sBfcyATtnZjPi0OHCrFW
 D4s25VqqBvFwCWnof1lubeaL48OFznGzi1/73bYJVTBstuRRaVtpefYzl+jT33jtX5oA2pfQFD
 eoTdb0AAAA=
X-Change-ID: 20251216-firmware_managed_ep-ff5d51846558
To: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        quic_vbadigan@quicinc.com, quic_shazhuss@quicinc.com,
        konrad.dybcio@oss.qualcomm.com,
        Mrinmay sarkar <mrinmay.sarkar@oss.qualcomm.com>,
        Rama Krishna <quic_ramkri@quicinc.com>,
        Ayiluri Naga Rashmi <quic_nayiluri@quicinc.com>,
        Nitesh Gupta <quic_nitegupt@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765966367; l=1555;
 i=mrinmay.sarkar@oss.qualcomm.com; s=20250423; h=from:subject:message-id;
 bh=5rBsnC6utLZsn2mQZMwtrLnMQmTQlPNyGuYb+c6RNjg=;
 b=bhMD0EZn6lZhNm9tPwqKHbNWVYzuVGXU1nxrUzhsX5DUpX87Pl1/IMKgfzNI+13iuoREGfkVj
 XSpKYeMpjpiBrTKm9WZ+7Xm8x2zDqABiPO15dGzU2kzu1zUmNO0yF9A
X-Developer-Key: i=mrinmay.sarkar@oss.qualcomm.com; a=ed25519;
 pk=5D8s0BEkJAotPyAnJ6/qmJBFhCjti/zUi2OMYoferv4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDA4MSBTYWx0ZWRfX6dd3FrW2XfJ/
 SE4iDa8gz4OHWQ/AKn5CuL32BqoyE7SQ3eeOGh0Pnt24cVEdGroBLccWWwd3Ps3jd3q+XWhVcIy
 IFOxH37pcY7HP+e/gxniEmAo0CtW4FXiMURgx02NZey2Q7ZeBIqP03CE7B0PqweN4cjhraomHvE
 Fv1vrYoKgOhc22QBDQSrHAw0KZdOnkDnbQV30/1pKT/MeaYnxss0j9MVv0xgpXu5tdg2D8faTcy
 MUJTRKwcJYryhBK++/N5dzLzS6iVjel2DQ7UqZXc2Ev39BVsgvXXDaq/fM2IVW2bGCgUBYUva3c
 gv0dosWSDg/wu8DdsEbS+taJQB/a2yksQ131PPMIWlFRUu3bImNwDHRSyozDnjkHXkGIwqEw2UA
 9IcTz1J8lG6/9zSBuWm1eS9S9FIL4g==
X-Proofpoint-GUID: Z_u_M2OXHnH3uSzIYTroBXN0vN11T8-L
X-Authority-Analysis: v=2.4 cv=Fcw6BZ+6 c=1 sm=1 tr=0 ts=69428226 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=KnNq_94ptiHzTE3zWj8A:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: Z_u_M2OXHnH3uSzIYTroBXN0vN11T8-L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_01,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 spamscore=0 suspectscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512170081

This patch series introduces support for Qualcomm SA8255P platform
where PCIe Endpoint resources are managed by firmware instead of
Linux driver. So the Linux driver should avoid redundant resource
management and relies on runtime PM calls to inform firmware for
resource management.

And documents the new compatible string "qcom,pcie-ep-sa8255p" for
SA8255P platforms in the device tree bindings.

Tested on Qualcomm SA8255P platform.

Signed-off-by: Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>
---
Changes in v3:
- Updated compatible string in dt binding example node.
- Link to v2: https://lore.kernel.org/r/20251216-firmware_managed_ep-v2-0-7a731327307f@oss.qualcomm.com

Changes in v2:
- Updated dt binding as suggested by Krzysztof.
- Updated compatible string to match file name and compatible.
- Updated driver as suggested by bjorn.
- Link to v1: https://lore.kernel.org/r/20251203-firmware_managed_ep-v1-0-295977600fa5@oss.qualcomm.com

---
Mrinmay Sarkar (2):
      dt-bindings: PCI: qcom,pcie-ep-sa8255p: Document firmware managed PCIe endpoint
      PCI: qcom-ep: Add support for firmware-managed PCIe Endpoint

 .../bindings/pci/qcom,pcie-ep-sa8255p.yaml         | 110 +++++++++++++++++++++
 drivers/pci/controller/dwc/pcie-qcom-ep.c          |  82 +++++++++++----
 2 files changed, 172 insertions(+), 20 deletions(-)
---
base-commit: 563c8dd425b59e44470e28519107b1efc99f4c7b
change-id: 20251216-firmware_managed_ep-ff5d51846558

Best regards,
-- 
Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>


