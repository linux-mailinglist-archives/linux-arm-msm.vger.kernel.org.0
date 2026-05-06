Return-Path: <linux-arm-msm+bounces-106146-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oOaQJKFx+2m7bAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106146-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 18:51:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB5C4DE559
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 18:51:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9D2CA3008250
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 May 2026 16:51:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56D114A13BA;
	Wed,  6 May 2026 16:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ux9uJknh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hSZBNjkG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABFD84949EF
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 May 2026 16:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778086294; cv=none; b=NUjLwJo6ccD3qkKzcJKUhADAHItGioBueeI/7xOkc5vf3ZQ/WKQaYr0AXkS383MNRgx5xLMr7daq/rAUIR1mEP/pPFk+rXjTY4HJ33WO+ab4618KMYPl8PdzvjkkZXARbq5hmI2XxqO635gsSCfchNfZ2TCngsomg5U7B+Z7LYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778086294; c=relaxed/simple;
	bh=tjHaye4xtZ717xh77McuvoBcjHTyO4dZVWJzKb/WY7Q=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=QWqQe3qnNDKeW90zjgZNmAJvuf5S49qL+rVJIQxMVfVLaPHq07u/aNQb/+chttllWZJJckbYOriTTXDDjLD8XdqF+wrrT15k5VdVC2USPk5MevQ9UMQNTgrwUysUHsF8kuZ63jGqr3Rip1rgSjdHdpB318tohFvE1ZC5ZSTUqRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ux9uJknh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hSZBNjkG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 646E8GBs2428180
	for <linux-arm-msm@vger.kernel.org>; Wed, 6 May 2026 16:51:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=y5jRm5GwQWesVDd6LymNGM
	yqSTz9fmO3BXsCvRQbSNs=; b=Ux9uJknh6B3sktohrsSk8gDQry+99E6Jqtocjk
	Jd0zafxft/B/y28Z+iyF0sFRqClx3AcpSP/lWGTOnZsDSzj0G3ZIJOn0qnbM0+cu
	f/98FjzkS7FbqGSa+Q8nUAKsWnw57D7pExJCdUJ2Gk7UFseulpOsOAh5+OMNBXNQ
	EKVxjEPcHsdQeM9gVh0IVSwmR3Mk6fuWl4sU4hpjSyPkPRxXrbHtYUAZ5CV8Vq62
	xr70bUsnuoAz5Bnc6Af0Z79H4eye+BHNXIVK2pFOvEJ7G+AnRxrhvrRghSXhcGVc
	Wn2EhPUnJjY1ZxC53r8GXVn9DgsKJkNUSx9zARBRJijcdjOw==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e01ph23dn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 16:51:31 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1309f4ee96dso6243760c88.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 09:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778086291; x=1778691091; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=y5jRm5GwQWesVDd6LymNGMyqSTz9fmO3BXsCvRQbSNs=;
        b=hSZBNjkGiIemAsbg466V/TAcI9IOlN+OmhPxhuN/d8a5x4djx98xG5xDEhRQtfLPh6
         eZaVFpCnkiS/YnCZpxbOpMkFiMlwpo+vlRGkaKKPRTiDSIW7KHZfIbYvi+QmMbMDhz7W
         N61D0O792rkAfJMZ/1wWbpGKwKpBXbEvB31sfivGB7LR+z8YPq9z0qpZGs1P126XXEWA
         fbF+6zHvAXXt/E1M7fPnweUrtOWEZFR5S96RCfvUwaeQawL12S9VfgywvHtQ+FGMJYr5
         ZONsO8I8YhNtxPBSPU00hUd8TSnlWDGq8A8kJ5ef9oQg+kS0fSYGibPsVoxYquRLRx2b
         avHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778086291; x=1778691091;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y5jRm5GwQWesVDd6LymNGMyqSTz9fmO3BXsCvRQbSNs=;
        b=pojALJg6smIybRXCaCHNJYdVGzRosOlpk4dTd6A9S6IQRmOFS6A4bG9iWr3olvNA+h
         fRB7jFy7VRH+J1D5IPCaCcOs7XJ+A7eZX9AT6oTUZAcu8SsCAUdqb33TsvoKurbrne8F
         1Bi8zo2DtV3ZJMx6iyA97t98HnseZbgGRzMTTKhJ0KmZUlFbsHQMoJmi2i0QMZyd2VAH
         IieIODS7Era+xvlztO1v7Cbd+0b+oxlv6tiO9CWDIu/a9W0pBs3UdanH0ZU96zr3vB+H
         I7FLAzQRCgsB84ebfs6XIXlMiVFnz78Ets6baOc3PrH1cIHn0wexCjOsKyc9aHn9Zv5p
         OtYA==
X-Gm-Message-State: AOJu0YzWftaUSjYvv+IH8AP4GKCgR9G4PdFU/KV081kHy+/yUxw4R+zR
	DSfhSt6IhsI8f8xJA5bWfBVMZFauG9vcJ7vmsYZR0W4cX04v7dbOQZb0L+dnkazNcwBJKcuitpV
	9446ibOwS0uzObRt6eJH8gz+rcquzlyf+J6TuZq/axecnFgafOwEA02vVA//KpBPpRi7q
X-Gm-Gg: AeBDieuerA9YR7BfI54iY9qRUzp84y63MgJdCxYeAWeyLGIpW7cvazBkJoxsgJD7/Ni
	Svq9zTUkWxMA9FARkqvE4e0evOZMavqzBogS7S0bHagoUb3jWjqdhEXH3wibt0xjo+aBoRzdlmA
	NSudRufQkacnBRIf/2ISGuSfSJ6W/uxe1a3K5xZ4jslOtBPcrKUrHQb+T9IXT1dmjgXnuR4yULK
	GSW7l0A0bh2J1hxYSK0H/Gkavk5Vt+SDi7XKfhapfcJEkq/ZOEAnXDMfk3NRtC5UEYwWdDb0EL/
	BxYF9z1rOXbYLBt83uGDZCvesHkcgegDvkeFixU7OFQiv8EdCobGEhNS2fwJepun0kIqp1fNYHU
	eNf+Qh9gQAQ4BZVFitJo0wuXP+B4lofDIJyTmAlCVWFpGxpDQGV6wP7JVnDFUZ/+ZT4FvnnKSEa
	Wjwc2i57GFjPc=
X-Received: by 2002:a05:7022:123:b0:12d:ca32:5a7 with SMTP id a92af1059eb24-131969d27aemr1847321c88.10.1778086290513;
        Wed, 06 May 2026 09:51:30 -0700 (PDT)
X-Received: by 2002:a05:7022:123:b0:12d:ca32:5a7 with SMTP id a92af1059eb24-131969d27aemr1847293c88.10.1778086289894;
        Wed, 06 May 2026 09:51:29 -0700 (PDT)
Received: from hu-viveka-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1320f16b189sm2696087c88.12.2026.05.06.09.51.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 09:51:29 -0700 (PDT)
From: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Subject: [PATCH v3 0/7] clk: qcom: Add initial clock controllers for the
 upcoming Hawi SoC
Date: Wed, 06 May 2026 09:50:39 -0700
Message-Id: <20260506-clk-hawi-v3-0-530b538679f1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF9x+2kC/22MzQ6CMBAGX4X0bEl/oAIn38N4WNsqG4Fqq1VDe
 HcLMcGDl01m882MJFiPNpAmG4m3EQO6IYHcZES3MJwtRZOYCCYUk1xR3V1oC0+kHEyhwUhlFJA
 0v3p7wteS2h8Stxjuzr+XcuTz9xuRbI1EThMJUEpabmR53LkQ8tsDOu36Pk+HzK0oVr9g9Y8vZ
 n8LvCplVZsa/vjTNH0AysFDpOcAAAA=
X-Change-ID: 20260316-clk-hawi-1ad4cad36d6a
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Tipton <mike.tipton@oss.qualcomm.com>,
        Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778086289; l=2472;
 i=vivek.aknurwar@oss.qualcomm.com; s=20260311; h=from:subject:message-id;
 bh=tjHaye4xtZ717xh77McuvoBcjHTyO4dZVWJzKb/WY7Q=;
 b=WAG/vm+Kob1W6hfEmeXQsfzRbn9uyuKe44+zOU3HxBuVk52CaTtWmI7cOyRCKprAklF4VgS2+
 cgU0shJAVh0DRlrtAq2cLtHceKxSbxgHCXgViOSPy6p63IF+8uTJVps
X-Developer-Key: i=vivek.aknurwar@oss.qualcomm.com; a=ed25519;
 pk=WIVIbn3nJR9YRWNRyJiEbvpgoHhNyYrmVqMUXWqAIC0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDE2NCBTYWx0ZWRfX/iFxfxLYqCcK
 xQ4StTXXyR5iKmPQiszX9+KSd1NdHVNBpifv+rkgXThpgCfiCW0jrD6V/6ywAQJpBnk9X81WQ7r
 Akwp2VJr+mzC9bLbeXhzea1i2jn8lbbX7asfwxAQKTNraWoHTiPacdSGCqoNVtzzlnIGrrhUqHG
 FgXYVcsLiYOQ7qqYpDBM4+XMf5jUO8roZtEzI5fI4J72avCunTVQSP4IKqKgLpDpSE0Lm8SzXIF
 nHdgu/EUuaGEXKXxG5lI5VAlwcIB5/aHojK/nguvCp7wAEQbOtME/GocI2oohXsZz/o47RkIjdz
 EAlItPcCVFE01hIvSiUkPYImam31QW+sNEbftxf418FtmMc2/J9pprYVM6i0WyLqgtteqhpYWZF
 yLS9CIsj3gDuGQu6lIuQNDYyr2bS3jI6Q/zMMjsQ8MWAcFAZrQcr2BLh/FZVa4IH2HJJgkEtP+N
 utE1PuG/vhTz/6tM9Hg==
X-Proofpoint-GUID: 4WqoS6SzskQ9EuClQlmFfCp9uCi6Y_Nu
X-Proofpoint-ORIG-GUID: 4WqoS6SzskQ9EuClQlmFfCp9uCi6Y_Nu
X-Authority-Analysis: v=2.4 cv=MYhcfZ/f c=1 sm=1 tr=0 ts=69fb7193 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=9tIqp-kY1CHwBKU6mdUA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 impostorscore=0 adultscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605060164
X-Rspamd-Queue-Id: 7DB5C4DE559
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106146-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vivek.aknurwar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

This series adds support for the initial clock controllers required
by the upcoming Qualcomm Hawi SoC. These include the Global Clock
Controller (GCC), TCSR clocks, and RPMH-managed clocks. It also adds
the PLL support required by Hawi.

Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
---
Changes in v3:
- Mark gcc_hawi driver data structures as const (no functional change).
- Link to v2: https://lore.kernel.org/r/20260409-clk-hawi-v2-0-c7a185389d9a@oss.qualcomm.com

Changes in v2:
- set the use_rpm flag for GDSCs to support runtime PM.
- Use clk_rcg_shared_ops instead of clk_rcg_shared_no_init_park ops
  for the UFS RCGs. This avoids a UFS GDSC enable failure due to a
  shared PLL used by the UFS RCGs being disabled while the RCGs are
  still configured to it.
- Updated commit messages wording to explicitly refer to the chip as
  the Qualcomm Hawi SoC.
- Collected Reviewed-bys
- Link to v1: https://lore.kernel.org/r/20260330-clk-hawi-v1-0-c2a663e1d35b@oss.qualcomm.com

---
Vivek Aknurwar (7):
      dt-bindings: clock: qcom-rpmhcc: Add RPMHCC bindings for Hawi
      dt-bindings: clock: qcom: Add Hawi TCSR clock controller
      dt-bindings: clock: qcom: Add Hawi global clock controller
      clk: qcom: rpmh: Add support for Hawi RPMH clocks
      clk: qcom: Add Hawi TCSR clock controller driver
      clk: qcom: clk-alpha-pll: Add support for Taycan EHA_T PLL
      clk: qcom: Add support for global clock controller on Hawi

 .../devicetree/bindings/clock/qcom,hawi-gcc.yaml   |   63 +
 .../devicetree/bindings/clock/qcom,rpmhcc.yaml     |    1 +
 .../bindings/clock/qcom,sm8550-tcsr.yaml           |    2 +
 drivers/clk/qcom/Kconfig                           |   16 +
 drivers/clk/qcom/Makefile                          |    2 +
 drivers/clk/qcom/clk-alpha-pll.h                   |    6 +
 drivers/clk/qcom/clk-rpmh.c                        |   33 +
 drivers/clk/qcom/gcc-hawi.c                        | 3657 ++++++++++++++++++++
 drivers/clk/qcom/tcsrcc-hawi.c                     |  158 +
 include/dt-bindings/clock/qcom,hawi-gcc.h          |  253 ++
 include/dt-bindings/clock/qcom,hawi-tcsrcc.h       |   16 +
 include/dt-bindings/clock/qcom,rpmh.h              |    2 +
 12 files changed, 4209 insertions(+)
---
base-commit: 4cd074ae20bbcc293bbbce9163abe99d68ae6ae0
change-id: 20260316-clk-hawi-1ad4cad36d6a

Best regards,
-- 
Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>


