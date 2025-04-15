Return-Path: <linux-arm-msm+bounces-54297-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C5CCBA892CF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Apr 2025 06:23:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0D4A8188F40D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Apr 2025 04:23:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9292F18A6A9;
	Tue, 15 Apr 2025 04:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VfyLCIno"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1636B2DFA51
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 04:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744690978; cv=none; b=mRk1DFlo2wISa/0fjh2qYFobDldAqPweHANetQEnlgsTZz7eDuUMc2idtbZIAThtODh2aP3GhGt8lBWy7rw+N0oH5b8QNoK9O+sTnwO5Y/AvU0GyEiUnJwfSJQNA52PZgDJVj7uxntwtvEKsBNOm8Bnl3tOJGUb1IFqroFAHSX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744690978; c=relaxed/simple;
	bh=UySY5QTJHVg5GTrBaYA2PTmlS4zMHyVLJFT/hmWX9lc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=f4wMjsbAagGzDi57pr7b1tGo3pi/IR4TRt74VGwtQjuULNbMxBvF6pYp3ydfTTtajWbsqBXHsHT0LlRlfEpe+sXqw/wdsZyL5Fdj3P2rL7TBSMhK0zH0wqm5+875IFgZlHEWeoiQ4q0RmF++3rdIdjzrs86xLkqBqP75s2s/iE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VfyLCIno; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F16jCU000652
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 04:22:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=QK5ggKjgEaGC+RdtEJ/3TC
	Ttyzna3JscU/P1oJ6de7Y=; b=VfyLCInoqbRmKp7Ehv7Oa+eiT0Y4PjdIOZl/gv
	T6q2ABWmf5HpOzU+ry+dkwxH5b3XbgqVdOpGOcIURkUpIMiSch+Req9pMmfgKHkj
	SpQnDJWFnzBcPL1xf0re4aTyEpjWjalnxRbmH6uR7wcSuVSk6OSJlFRj3xukBJGL
	GbfvQioOrKGEhWQ2Z9GZvQI+lY99oBocplALouEtGBMgsAgoC9hD5p75ZYhT4tI3
	VhIbeVfVAS86pPS1EdErmCi12OV+CmRUQhr+e6TZ7zq1fg/mzxPrE543czqMAibr
	TtrqwkkuqeNW4nvqI4wYcXS0fk3YtRSKpkGXVcTBR18eKxCw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygxjxgc6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 04:22:56 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2ff605a7a43so6645496a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Apr 2025 21:22:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744690975; x=1745295775;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QK5ggKjgEaGC+RdtEJ/3TCTtyzna3JscU/P1oJ6de7Y=;
        b=NmE+rpEfTyJ0fcJfdn4TON9BSr04KSGRmhHs7saldNcj1jDZ7YMHFALbqY9b5uYOCz
         eZw1pZerGYIPF0tecp6cdajOcx/JHfV3uPy24ravLNIddcRB/XMCXkQKxhZOx37pF03X
         +SMB4MJaXT3mHWXR2L34wr1uRnmOU/jtMVXlA8YsHspArBDXmTgVkYhwyZwFrAgcmHo/
         /ALVg1BTf0tefsbWpSLIQ7yOfMxrk0cvD3AR+aluQEoiYpFRpDxKYMssezUIjxd1UaEB
         KJCwfPhS6rQ5OhmKamGNfa46gyXleLikQdiyOS/lF9vyzLTV0OFe+sZJ4mbCRcrTW6tZ
         5Xcw==
X-Gm-Message-State: AOJu0YzbYhdWA6LlyCaP9CiPUXRh7YlJgUAWOItHXer9TcVLnSs5SgHQ
	y0/msTaCmvUr7DPFud/ujWux0uRATlAFOTjRpuKOIyL+mPjYC3RZ5hIT++ftdSfZXhWAxA6vV03
	ntlSmTK2H6IAYYgd6PKENWptA4uBHyxOE2ELqtfePNHUllsV07fcwt2e9NEDTsufH
X-Gm-Gg: ASbGncsim/ErrToEhax0p61M9HNXhYLyfFYWYCbk+qEbV8IWvU4mTqiwlWyYdGtEqlP
	DnXari1dCAS5dpxPcEY9ARSBsvTM8V2OMFkTaj91JBbqpmGwnlJPKc1XmRqacBd7sJ540cbVAx4
	v2ymkMMjW2LDjucpd4wFpjUhhoqWIR9cZNlhq6Si1kjdVq9K2EtzXs71os5YNcp2KDLvDeA98cn
	fXu8qDOmlzJUhP+OX/lwq/2NFJnOVT6XOY9k9z5YdcKU7P4EiypkZ1NFmd7IBJqIkyCEBayTkK/
	OGX9eiVU1WWVL6nsPNX8pSMdFKup0i7umNvlBM4FgPYmYgYepPtXRPTzvGHkXezl8qm9zZ5NKD0
	hQ7gtWszQacpsQ3bU2pletc8IhAwal1381en/GrGQumsN944=
X-Received: by 2002:a17:902:d58b:b0:223:501c:7581 with SMTP id d9443c01a7336-22bea4ab90amr210194865ad.16.1744690975356;
        Mon, 14 Apr 2025 21:22:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH7+uvkdGknQb00oQUI1NfaDMk4fzN02uM7D8bZc8IMJdJh2THCZXSQRaS1L2fXBEdTdfKOLQ==
X-Received: by 2002:a17:902:d58b:b0:223:501c:7581 with SMTP id d9443c01a7336-22bea4ab90amr210194655ad.16.1744690974929;
        Mon, 14 Apr 2025 21:22:54 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7cb5047sm107381865ad.170.2025.04.14.21.22.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 21:22:54 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Subject: [PATCH v3 0/2] Reuse the IPQ6018 QUSB2 PHY settings for IPQ5424
Date: Tue, 15 Apr 2025 09:52:49 +0530
Message-Id: <20250415-revert_hs_phy_settings-v3-0-3a8f86211b59@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABnf/WcC/4WOywqDMBBFf0WybiQvte2q/1FEUh1NoBqbSaUi/
 nujq0Ip3QwcuHPuXQiCt4DknCzEw2TRuiGCPCSkNnrogNomMhFMZExxRWMIfKgMVqOZK4QQ7NA
 hVUWuZCPqIrtpEp9HD6197eJrGbn1rqfBeNAfOlb80k2ccgr1SYHkOWh+ujjE9PHU99r1fRrPV
 mIsBufnffwktqq/OydBGY2RYw6Caanlt7hc1/UNrV9NLhgBAAA=
X-Change-ID: 20250414-revert_hs_phy_settings-47643d2c75ba
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Varadarajan Narayanan <quic_varada@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744690972; l=1328;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=UySY5QTJHVg5GTrBaYA2PTmlS4zMHyVLJFT/hmWX9lc=;
 b=SjKOYhH6N5+aNsnBq8lsBu/EjLKWHVVfmg98xJODXNImkUJXu1K5vNVvJ9ZpeHZIoNkwAEPEy
 8ZCGdEF7QgCAxhRUg4Yb6LHZXffABOj0A6UChS7Vq+ZZW9Jalpy1XsY
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Authority-Analysis: v=2.4 cv=WecMa1hX c=1 sm=1 tr=0 ts=67fddf20 cx=c_pps a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=5a8PNGn9bNKLW8I9e00A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: RQtmWbrMFymMxQ3iRQKvspPD_jp304Z_
X-Proofpoint-ORIG-GUID: RQtmWbrMFymMxQ3iRQKvspPD_jp304Z_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_01,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 mlxscore=0
 impostorscore=0 mlxlogscore=699 spamscore=0 malwarescore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150026

With the current settings, compliance tests are failing, especially eye
diagram (Host High-speed Signal Quality) tests. Reuse the IPQ6018
settings, as mentioned in the Hardware Design Document.

Merge Strategy:
--------------
Both the patch in the series should be merged together to avoid breaking
the USB feature.

--
Changes in v3:
	- s/complaince/compliance (Mukesh)
	- s/design team/Hardware Design Document (Mukesh)
	- Link to v2: https://lore.kernel.org/r/20250414-revert_hs_phy_settings-v2-0-25086e20a3a3@oss.qualcomm.com

Changes in V2
	- Splitted the patch into 2 patches, first revert the commit and
	  then reuse the IPQ6018 data (Vinod K)
	- Dropped the R-b tag from Dmitry
	- Link to v1 -
	  https://lore.kernel.org/linux-arm-msm/20250407-revert_hs_phy_settings-v1-1-ec94e316ea19@oss.qualcomm.com/

---
Kathiravan Thirumoorthy (2):
      Revert "phy: qcom-qusb2: add QUSB2 support for IPQ5424"
      phy: qcom-qusb2: reuse the IPQ6018 settings for IPQ5424

 drivers/phy/qualcomm/phy-qcom-qusb2.c | 27 +--------------------------
 1 file changed, 1 insertion(+), 26 deletions(-)
---
base-commit: b425262c07a6a643ebeed91046e161e20b944164
change-id: 20250414-revert_hs_phy_settings-47643d2c75ba

Best regards,
-- 
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>


