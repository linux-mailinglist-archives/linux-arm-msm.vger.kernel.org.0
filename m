Return-Path: <linux-arm-msm+bounces-59632-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D4D5AC5BF9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 23:07:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4944E4A8251
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 21:07:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13DC321ABDC;
	Tue, 27 May 2025 21:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eFOUBIeA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ED30218AD2
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 21:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748379913; cv=none; b=BaUQsWI2vXhIdie5noNEypo+dyt3chHS/dqoaJsmvkz1ndTNEd6W2Ww4vRr+WGreSxuJzy2ccXoQXW78t3ztcHM7GqF/xdq2TMAjZt7Z62/inQiAFuuVp0j1pFHZ7VOaxzTsY6E/WUfAWhEK1JQi9Mvfc5fdIyYmjp0vBQse8Vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748379913; c=relaxed/simple;
	bh=wCdzpXsKw8zqQyaRyA8EfWIj8Ra4i9wLlBGWl4/WARQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uIzXboFIZXvU0qqrT0Gd6zyrCMpXfSQ0ge4pXbpPfOGdW0YN6FHDp8QLpbw2DsjPyNT2uRtKtg1h5Kv2QHwX47Y5kLkNISCkDiOYoFq59TC0xfWjAFon9v7zgDDdb0uSPoaxKxnNsq7wY0rRu0cGROu4zVbEhgP5dkEVHtY0HVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eFOUBIeA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54RJtC9c023081
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 21:05:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LPkqIIVJzTbHReDF6liD2MG4ODSDIeHW603+18LbzM4=; b=eFOUBIeAvN/dWFCq
	xOi2G013rlZ7UNJ9SVpmPsTDwPGAB0oEuAjvAfGdvYksbrdY0symWV4SsdCUOsvr
	H5m77PaAXjMPVVVdCT9P3/+YHl8oK9cv1yc7qN690fZPZXzsLObszn5SD3YFxVpb
	nsJ6boRRZavZhS8IKbberwTGTRdwJqN0P9P2MJiWDKgdSIlh4kro4o67+Cydu+Cl
	YA4eIzQHP/iwFdzCEDtfnZHghqC0g1ri76po2htmvubU5wzX8UV4jdokohDGlsNs
	M4HGeox6sJpySVWdUqXm3ocOEI96B+VrtD5xDV0fycJ/NciETksjai7aCIAzwQIq
	v0TNbw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u6vjr8ur-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 21:05:10 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7395d07a3dcso2786435b3a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 14:05:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748379910; x=1748984710;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LPkqIIVJzTbHReDF6liD2MG4ODSDIeHW603+18LbzM4=;
        b=wUB7grYNWU75Sp/+6sI+Kjsfn0jy2O6+ZdvjZHG05vRWmEazXa0TrIflUXzkYPQw8C
         s+fYviK2pAnjBvqCtt9GW7JDSD7zW+YB6q1MG1GlxBptszwcUPUioF27F5SX7CdkUxe8
         RLSAknV7nudz9ggPOSA83IKaWvESMyYe4iEiqB2mrWo6riDM2XHGZCBFVpbXTtbSdezm
         qaWI4HbgSR8SBthwC54OC0vCpssbZ5C1lXMXeS8BLPgFnaVsjMiTpO3Uw8AYs9pNUMVx
         uX1SsEV8BQveBUOyc3tgM0mEjWFSJyQ3uqIO55Qqh21TimYC5/QES0ZgtnONB4/1rMK7
         wUfQ==
X-Gm-Message-State: AOJu0Yzje3PqmDW9+Z17zGdKwG5uSNnZLJ5oqg9JRydpG2uAvpovOG3C
	zb5qJrFA+oJFWCR5lLLmml9QSxrE+E5hpgZJeyGTrWYIXHL61cMauxaphT/IwWKN4Nuu0kh+tID
	5cN49XwIGse7luX4JW+HSvCn5IAcRTCvgr/kTuf6V1xD9OICYIAtgYBJnSZg9Sdgjckex
X-Gm-Gg: ASbGncsLpIuEtd+EidnmnjfjeNplwftfxa9ZQwcAdn0nR0LLK1yuJCjwTtmE4TBXxNb
	GgjwqNankEaefXDJOVAbY4L06PY3Or+CR6yjdLVFxTvRNi0SIfWtYoSFn5MVfTUCVcrYIHuQW0P
	hvAhmKIbwvGKy2dEXbyx3+7Ij2+Hpt23qSFIaFe18xofbjsrrYXUWbsazOw+qL0JR6/GSTtocYe
	9lQsQ7GfPjI7jcHQMjPBPSC3e62PJ88+S/FbfNRfMvUfDx03dtCiBP24b/NEgvC6NRUM5tUlvU8
	8aAUYT4+UJ5mvjG+nOfcZybJpM2wBzCjoVzS8548HxWXXYY24PX78PWisKTTnIVyy+E=
X-Received: by 2002:a05:6a00:a96:b0:740:6f69:f52a with SMTP id d2e1a72fcca58-745fdac80demr20724863b3a.0.1748379909729;
        Tue, 27 May 2025 14:05:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE89XO/JDVl6rd3hud7F4tMJEpNAb1237KFGDPWMLXu7CEJYly3v5ShxkxUVfmWpgn+xSWY/Q==
X-Received: by 2002:a05:6a00:a96:b0:740:6f69:f52a with SMTP id d2e1a72fcca58-745fdac80demr20724807b3a.0.1748379909299;
        Tue, 27 May 2025 14:05:09 -0700 (PDT)
Received: from hu-molvera-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7465e64836fsm29167b3a.26.2025.05.27.14.05.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 14:05:08 -0700 (PDT)
From: Melody Olvera <melody.olvera@oss.qualcomm.com>
Date: Tue, 27 May 2025 14:04:46 -0700
Subject: [PATCH v6 10/10] arm64: defconfig: Add M31 eUSB2 PHY config
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250527-sm8750_usb_master-v6-10-d58de3b41d34@oss.qualcomm.com>
References: <20250527-sm8750_usb_master-v6-0-d58de3b41d34@oss.qualcomm.com>
In-Reply-To: <20250527-sm8750_usb_master-v6-0-d58de3b41d34@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Melody Olvera <melody.olvera@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748379891; l=926;
 i=melody.olvera@oss.qualcomm.com; s=20241204; h=from:subject:message-id;
 bh=wCdzpXsKw8zqQyaRyA8EfWIj8Ra4i9wLlBGWl4/WARQ=;
 b=JUlbr6mF6I6cr5T9ZHdAGEijiVb5Mu+5V1BZNQUxXDHvq3yjKg+SamgDa52qed7t8bmWdrkdW
 42TjvtABTDkAncpbXnX/wXXb06bSMRhHbxRyyU16AIFkDNCwCzClSUq
X-Developer-Key: i=melody.olvera@oss.qualcomm.com; a=ed25519;
 pk=1DGLp3zVYsHAWipMaNZZTHR321e8xK52C9vuAoeca5c=
X-Authority-Analysis: v=2.4 cv=UOXdHDfy c=1 sm=1 tr=0 ts=68362906 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=yCBuECYR7Rf6QDnvud8A:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: WFMLGNLyCbQd765HeMadGR_8EUywEUjq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDE3OCBTYWx0ZWRfX9sOaHWSpLYf4
 XhVY0Ib7Od0jGRoI5DNqdX4nAlTHFkk3Sh7cpyUX5OdZkLjcw9tWAfu08NrBhWtbOhYLyYb49Lw
 yz5cKVLHR1YuYwSi6tmsptIA4eTW/9/wPXWxCUCizA2wRj7lx4KnHaj2FsZXNV7plQpGtQteOOR
 0hSP2Qvm6bznHmUomymzQzOXsA0hq5y99XdT3POqP9h1q5Ua2Ti2uwmMoCRnJe//6VKSPK7w8gU
 kgPGwrQnQBTT3Yy+zmGQ3deqdyiT80pgjwiKnEgtC+7NMpXuSbr+KuhQk0DoZ9TA0iKbxWfQ/wF
 iZLy/iriCVjZCaVWTFOOFQuAC9IxcwZO93XvVC4EjCla/7ZVPf885c5VYPkdYLak44EhqbUrXkp
 EZxCCyPj9JOz2nI/B3a7P7K3Gw3d1AcAHUZZN/IEGN6VG+r+TG8EmMau1SiBhDBy2UtCWbvT
X-Proofpoint-GUID: WFMLGNLyCbQd765HeMadGR_8EUywEUjq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_10,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 mlxscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=534 bulkscore=0 malwarescore=0 impostorscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505270178

The Qualcomm SM8750 SoCs use an eUSB2 PHY driver different from the
already existing M31 USB driver because it requires a connection
to an eUSB2 repeater. Thus, for USB to probe and work properly on
the Qualcomm SM8750 SoCs, enable the additional driver.

Signed-off-by: Melody Olvera <melody.olvera@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 897fc686e6a91b79770639d3eb15beb3ee48ef77..f4de2473b3078543b68b01387ac7e3ab6951e4a4 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1600,6 +1600,7 @@ CONFIG_PHY_QCOM_QUSB2=m
 CONFIG_PHY_QCOM_SNPS_EUSB2=m
 CONFIG_PHY_QCOM_EUSB2_REPEATER=m
 CONFIG_PHY_QCOM_M31_USB=m
+CONFIG_PHY_QCOM_M31_EUSB=m
 CONFIG_PHY_QCOM_USB_HS=m
 CONFIG_PHY_QCOM_USB_SNPS_FEMTO_V2=m
 CONFIG_PHY_QCOM_USB_HS_28NM=m

-- 
2.48.1


