Return-Path: <linux-arm-msm+bounces-87173-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B34DCEE139
	for <lists+linux-arm-msm@lfdr.de>; Fri, 02 Jan 2026 10:43:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9CACA3007EF0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Jan 2026 09:43:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B45E289358;
	Fri,  2 Jan 2026 09:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="idcYAhKG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Nrxc+CjU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C78CD2C3253
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 Jan 2026 09:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767347004; cv=none; b=WG3JwHlrxlyrovC4tYM5XUTdsIi43esvqt2/ivuSRwWXO4WnEqJ/6EwH33e94Mbz7n7c8avJxNNBP7o3aBhOnK/bK07t9ufGDwkk9J68h4jzha+44xDz90lYxnf52rQfzWueCDw4yW70gJWigjmiCVEP6nLAsokwViAkMzAECUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767347004; c=relaxed/simple;
	bh=3qEjXTfpfPxJwNXPUcopGq7QMiHdWpFPIFbYzag/qgo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=kU1WD7Jfj7bm3PkZdZ62y8NJxODMBMh56kbc0UVAeAgpmR0rarINfqe0UPQm4689ysWL1F5q87FnBggjnn+/Hs8zAuN00P1bCEtv/dJ/DAkqYPJ8OE7R+GVCxBTSRfwE8ZtcdGVTps4JVcSuqm0uBk5wEUPZN+sLE8iwFQNsKug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=idcYAhKG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Nrxc+CjU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6029VwY7784374
	for <linux-arm-msm@vger.kernel.org>; Fri, 2 Jan 2026 09:43:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=RchF6Uw2hATAz7C5kI0Mo+
	7CgNCiyMK9RKLhpwaAY7o=; b=idcYAhKGgqOKHhnlIIRAhfBu69fJf+zL4RmRFH
	GucTjL/tXv88PdPWMyl4cSqoF5UdarwypuRqAVpYzw9RKrPDiiTKw8qHoUKLcg/x
	ROKe80+3aWzUBMv6FoMNPr1omfWbvxbTwap9zotRvAbkRly7kQHCvkm8XSR8Uj3a
	Xzc1KxOKgv/jtevIjW6SdYF2jw6LnOUf0tMRV5nG6Qq5wUwjWib/QrZqmALzsoZJ
	MaDtu0WwIbr+LBH4rpVI1ikFnBqzl1TBFWqgpyLlLZp+mi4Kt/cONbBZi1lSkmJk
	pPw5ma916E1waiqAoEa+FolKbRHjFnIR4WSs9+nVXeWbz+Gw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bd7vtk38v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 02 Jan 2026 09:43:21 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a0e952f153so405310655ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Jan 2026 01:43:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767347001; x=1767951801; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RchF6Uw2hATAz7C5kI0Mo+7CgNCiyMK9RKLhpwaAY7o=;
        b=Nrxc+CjUCfrPNXHllasjzWEv2UaU2jZnL6vKzCYxmcy+ue7xHBYbLOUWgYsSP2Og4I
         F3WYIj8+QwLBy5EYfSfikB1EhRQtCqjaPd0XShym2huHEMkZv8PUmqHluqSxmmZ4Cw72
         Pdt8Xp55Vtu1w8bCu0q5vi5X6qzrNoxtKRz9AyQw5iqwLvo3A8nM2F+Gd+7ZnuVlpM3u
         XG+GHcnqKTjDuLUcKf267ggUWxFylajpT+NgjHqKol0IprbQQyp2u7VKloLusRv6MKNK
         7NlGbpVBGuqh9FdRbL18uTEZHvkcL8qoVARtxDHJh4pMYma0Ld66IqIoMJs+IGrgKM34
         EH8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767347001; x=1767951801;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RchF6Uw2hATAz7C5kI0Mo+7CgNCiyMK9RKLhpwaAY7o=;
        b=F4FX2LFUmPuhyI1IWgj6wppUZsuxBPKm+ZNl4cEqO1gUVv0v1KUXXwhiFD9FFi1yta
         kQLbGUQfj7lEjKudsXDOLu/xFCC0aIoELEZpi2VsY3HfieiUuceodyU6l7IdVwyi8cXG
         HkHw+ilAcMe3o+P8KM3oqWuU2F9nh9j2scEKbigb0z3yuRPocsh+If3N67rLN5vGz4B3
         Ot1emU2wHzWT53TBEqJR9nUHYJdAk2MRuyrllXecsVfweXD0RrVf7tRsq/o2yAvlRKFH
         TUvL60xYpr2d71EODVvMJPy8OvPb2gLbIJitBiUKaIGihJULt9dDIxbjdTQzv/6l93hU
         TOMw==
X-Gm-Message-State: AOJu0YweiZLO81KEKlWENzJtorlam8EpJDOl2WS4uL5UY2KK/6ND4eJh
	BZojXCiX2kc9oODLv2pnzeQ57sGf45h0op7vlYFFRZUA23IyIVFy4NtQdSIqaLTQRFW5ZF2y5rz
	t6bG0RmE/CBw0NwDB1iUPR6Hsr2Opj/Z5oyUry0Yk4bE7E4+hBVoA3ZR453eMD3wYU9Fx
X-Gm-Gg: AY/fxX6i7V9lyjabpmC9dDLmK9jA64aT/q3VRb+r7AocMn4BX8I61lmBKncvgW23T/N
	6iSUJlwxkwHkO/Qb8yu2b/qB4OVsrjDY/yD0AjfT2RRsevfB5/eogPcxpEJ6s204sqqHtM4LBDP
	koM9WKlwfDbXAeVru4GSn9pXWsV8ly9tbsfpYG1xtqa1S6aTCQEHeTlSQ8C6Gnr45aWg5lo3f/n
	s/V0dhzhtnhR5nXUVDo/h7cV2z5nB4xgS26dT+CeFdVbXqQa4anRy26jx+2sT1O3h8A9wsEou9w
	dFvUs2JlMlcwqmQAXDIHJSLdP1z9Lv3ZMABBP8BH+nSSDBfKpblfK4o8Ue43sAIUp6oueHMJCdL
	UmKSR8EwfeazmUx0tjggXdChdrp70t45Df4wKSgt/cNLh
X-Received: by 2002:a17:903:943:b0:29e:fd60:2cf9 with SMTP id d9443c01a7336-2a2f2a40096mr399639965ad.54.1767347000599;
        Fri, 02 Jan 2026 01:43:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHakUz7/Chtf5vwSGXnO6GNAt32n4eUGOveiUOpdo4/CelbIlLvS3AGDpCpYc72c8Nzb3F/Ng==
X-Received: by 2002:a17:903:943:b0:29e:fd60:2cf9 with SMTP id d9443c01a7336-2a2f2a40096mr399639735ad.54.1767347000102;
        Fri, 02 Jan 2026 01:43:20 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c66829sm376154255ad.10.2026.01.02.01.43.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 01:43:19 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: [PATCH 0/7] clk: qcom: gcc: Do not turn off PCIe GDSCs during
 gdsc_disable()
Date: Fri, 02 Jan 2026 15:13:00 +0530
Message-Id: <20260102-pci_gdsc_fix-v1-0-b17ed3d175bc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACSTV2kC/x2MQQqAIBAAvyJ7TtANovpKhMS62l5MFCKQ/p50n
 IGZBpWLcIVVNSh8S5UrdbCDAjqPFFmL7wxocDLWoM4kLvpKLsijradgZsRxQYSe5MJd/7ttf98
 PAPwqll4AAAA=
X-Change-ID: 20260102-pci_gdsc_fix-1dcf08223922
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Shazad Hussain <quic_shazhuss@quicinc.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        manivannan.sadhasivam@oss.qualcomm.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767346994; l=1671;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=3qEjXTfpfPxJwNXPUcopGq7QMiHdWpFPIFbYzag/qgo=;
 b=6PABdqOqvWLT1nIpzSfHMDdCtk+Rx3dUt/cDgJO9P3KXmfY7W1J2n1Byu471uKCDHI1RMKtMZ
 7y6A9GG+PLHABEd5PsxY1gh0w/k0plzVMLekZnhsV+57rSV864U9WGr
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=NMbYOk6g c=1 sm=1 tr=0 ts=69579339 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=zEZ2UId_wajk7SiTBasA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: LK-DUQ2JqOhAyxF5m49b5X5MEGJVMOIH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAyMDA4NiBTYWx0ZWRfX2D6wAYmo1X09
 ++UOiCxDHwIxA/Bzl5chFP7xvFYVLYovjx2YYtOGy0cSogKBe6Uw2ebl/z44fALqJQl712/Idg8
 4z09tIMoGPfbOSRHjPqyedl2owQuBFgATl69cjO5s3rhcRgK6INgDBLWU95Jb+hZMvFcjCP9w1g
 onVO52CLz6nWHLQfbDB86TYyv3u4nFQhAkhA8ZPGTaIyEYHenL8ExmWMbp/bzM5zris3Hui4mtk
 zpTGbYnQrIDubHrT16TAlU6udWbXsjo2Ve7wrK/BSAx91rh+MIgPY4cEC/dvPgMKP3wD4p1V4Rl
 /2UJe5YvRn6nn0JK6fwAGfxzTZuTq2ENDlE5WoKGLOe5xh/Ja+a/Iq1gofxXsTP0bfwWb198olZ
 A8kdVHNQF+RLEfWILXci0Tc+B2laBFbBPzY2/10ejLedGjJsAGNyliv+zLjeBOvdkk9gX//f4z1
 OB/u4E1Z5BxL4/ioIww==
X-Proofpoint-GUID: LK-DUQ2JqOhAyxF5m49b5X5MEGJVMOIH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-01_07,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 phishscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601020086

With PWRSTS_OFF_ON, PCIe GDSCs are turned off during gdsc_disable(). This
can happen during scenarios such as system suspend and breaks the resume
of PCIe controllers from suspend.

So use PWRSTS_RET_ON to indicate the GDSC driver to not turn off the GDSCs
during gdsc_disable() and allow the hardware to transition the GDSCs to
retention when the parent domain enters low power state during system
suspend.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
Krishna Chaitanya Chundru (7):
      clk: qcom: gcc-sc7280: Do not turn off PCIe GDSCs during gdsc_disable()
      clk: qcom: gcc-sa8775p: Do not turn off PCIe GDSCs during gdsc_disable()
      clk: qcom: gcc-sm8750: Do not turn off PCIe GDSCs during gdsc_disable()
      clk: qcom: gcc-glymur: Do not turn off PCIe GDSCs during gdsc_disable()
      clk: qcom: gcc-qcs8300: Do not turn off PCIe GDSCs during gdsc_disable()
      clk: qcom: gcc-x1e80100: Do not turn off PCIe GDSCs during gdsc_disable()
      clk: qcom: gcc-kaanapali: Do not turn off PCIe GDSCs during gdsc_disable()

 drivers/clk/qcom/gcc-glymur.c    | 16 ++++++++--------
 drivers/clk/qcom/gcc-kaanapali.c |  2 +-
 drivers/clk/qcom/gcc-qcs8300.c   |  4 ++--
 drivers/clk/qcom/gcc-sa8775p.c   |  4 ++--
 drivers/clk/qcom/gcc-sc7280.c    |  2 +-
 drivers/clk/qcom/gcc-sm8750.c    |  2 +-
 drivers/clk/qcom/gcc-x1e80100.c  | 16 ++++++++--------
 7 files changed, 23 insertions(+), 23 deletions(-)
---
base-commit: 98e506ee7d10390b527aeddee7bbeaf667129646
change-id: 20260102-pci_gdsc_fix-1dcf08223922

Best regards,
-- 
Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>


