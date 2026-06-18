Return-Path: <linux-arm-msm+bounces-113802-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WIyQJjVpNGprXQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113802-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 23:55:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E55C16A2D0F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 23:55:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=W5xBCTnz;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=K8rJxcx9;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113802-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113802-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B244F3018AF7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 21:54:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 012A72F12A1;
	Thu, 18 Jun 2026 21:54:58 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5CD222D4C3
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 21:54:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781819698; cv=none; b=PVV7nW+WQjFP/6NfmounrWeI5cVeXTx+z4bTNfuXMNBB6bZK1ySI8kE1XTSLTKS8rI7trLKmrZO6Xqr7CNrHbIs4yl3tDD+RPeC4ibHqYNtt+J6swAZkELFzpEddhqr9PxYEi3mknGS12wB2OtEi3Pkffl9jLai4WyumvuVamM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781819698; c=relaxed/simple;
	bh=RHPv53SnE8+XMk7kiNsS/IPw0K+WbzN9wk2f4cANiIs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=luUgP7as54oqz3wcOxxN+xlmzJnACHeXaBKHH3LkvZ5Na+rvFmnhiv+o4p9rBkXVTY3OHcKyMe0JjfLDX8i3FKH7rREnklqP9vdZKGwTJuauk5kqN9xNtuc3yB11qyOBe5ssEnURmoVTLApRyD5Ah1w4ut2P7k2F7TpRNhD7uc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W5xBCTnz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K8rJxcx9; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ILs9fe2444117
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 21:54:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=cFhmc6tat5NN4iF51gvWQR
	hQtkdukby5rCSzb69wkuc=; b=W5xBCTnz9C4PWvZ0KwYkC9Z85RI+DCoWnM0z9T
	TxDgeQmxgffiG0dQ07hOCUGpeIUJyEeUYoiQs4doDQWqhnkRxjc7Kqdyk1gJzgn4
	MxrbR+nvseXvl5ZHm/NmeicZAFu7I2ONvqRJcEyOn9Ufma2xcHt1CKZOALYxvdVW
	spw1dYb092436mKOEljzDhQrrZdjQSZuQ3/vNZKou9PZdnjFhU1raTe2UEj7rck8
	Z9GpOdYTxK44E9wMCq7/g354UWHesXMP53ZKImDuBol3q55uoBha9qAncD9crGp0
	jPLagOtJ3DvsLo7nD11/zhoFvXzgplmqdcHKwJmcHrTH4WhA==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4evdn433xd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 21:54:56 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-137e49e896aso1919196c88.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 14:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781819696; x=1782424496; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cFhmc6tat5NN4iF51gvWQRhQtkdukby5rCSzb69wkuc=;
        b=K8rJxcx94qh8X88nHjbyKDvr/asUQhhhQyd8tHw17YU2s5kh/fu852qkOldL8VT154
         kWT+kTKODsnUr/I2CvEZUZwV30mrB5oLvuD1LEDxp7cUDe8aS9B+yQBZ2QUDxoODRTc7
         ddnI8srNuRPqedyItSbHu0YxpYIWAqdbK4FxmW/SbsE5emxBDZQ6qnbUm4EsZ7+JBm5K
         Nbm73FO95CL0ovVVF0vRk/bqgARMIzcR4CmUxB8hVVd09HSdPt1r/Icz/V3Qy3S3Tv/F
         gjkvdRmu7Sra1L6o3gcHjVi31R6wdFgp8HYWBAHHgaWwuKtZjohsG3Cmvwd2dDsO8sDU
         rYQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781819696; x=1782424496;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cFhmc6tat5NN4iF51gvWQRhQtkdukby5rCSzb69wkuc=;
        b=rnG3+sQPXw6h+drxwsSOr2mqyczM9iCkMOJi0I1u/tv1S2XIx2xAbGu5kZBkUI1nPa
         7lJPd4f41zFFgVQ+JqmQztzpR03gjt0dVpLLEcWzmTrjh4B6Opoi/jUpzN8xtC2vb+kV
         Oy/y2qk70lLhwhJ788elcsQRU/hXBp/UnpaOLiQDpgLXeCKFtBno3LJNs2S4CX0mHrk7
         h+F55knd6NJ6i5HNH0p7S2trM/cxOMEKbiuQAF4K4xyskotJyPaZ9cOLCtD4/1RKw6ii
         eaAmnIwXLjtiOOk9j15UxUzmnTvEepkey3EzjKhSNSBn+1Q308kNXt0cqQTLAA/aA2He
         R7dA==
X-Gm-Message-State: AOJu0YxgvRl+OHJpQO6+pvO+rNFfhe+CIBGn+wFPXXfajYGA/+jZeaXc
	6/w0JT7SXE9glTJF6qwM8Cpz7yker+Umn5qmu4coGTMDhGMcr8vK4tUTaCOqoD3wYu2JLSOjZPl
	YCAFOVGHe24xSrzujWScuP/4Vf1+/HW1PYH9Sevv2M6EIalZyOF/Iq53vf7WthIemHJrervdZya
	Az
X-Gm-Gg: AfdE7cm9ASmVFMPFELBi52NnfK7MMpsTiftprynNekVGVXkwUf87qOxbcNNchIdFKB+
	Hu1F795cmJEZb9ey1yB8dCNj1VLtjqJqkHmMnE67T5GmP+QIxALiok1YXHi+wRmKPt948yAtulG
	pD9NsijU5/7T8E0PoZq6wfxdsnXh8+bE9pwL2GS/29qnDaglm5sxQkNJDvHFzrnc72XO1I7fscc
	EAuceA4FfvKJMCZ1N9czvR1uQpkY4r3v7cNCWOSVkqhp0B+yTrvfSl/SHbS28+5WFu8qd9uCAiQ
	p4sHqiwpWGqq+CSclNrgtA/ILk6qqs8eRneO0E8sRlSJQ/Hl7EKQVderuGed82dyt4bAYIb7bYN
	KXjP7HxBxvEfoaDVTqWgtWLG3DBlUmL3jd5IOD8CcryX5k0Ys
X-Received: by 2002:a05:7023:b0c:b0:139:85c2:d7aa with SMTP id a92af1059eb24-139a311b661mr469639c88.18.1781819696163;
        Thu, 18 Jun 2026 14:54:56 -0700 (PDT)
X-Received: by 2002:a05:7023:b0c:b0:139:85c2:d7aa with SMTP id a92af1059eb24-139a311b661mr469611c88.18.1781819695614;
        Thu, 18 Jun 2026 14:54:55 -0700 (PDT)
Received: from [169.254.0.3] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c0670a1b4sm619430eec.8.2026.06.18.14.54.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 14:54:54 -0700 (PDT)
From: Matthew Leung <matthew.leung@oss.qualcomm.com>
Subject: [PATCH v3 0/4] phy: qcom: qmp-pcie: Add PCIe PHY support for Hawi
Date: Thu, 18 Jun 2026 21:54:35 +0000
Message-Id: <20260618-hawi-phy-pcie-v3-0-3fa42ca45ea4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABtpNGoC/23NQQ6CMBAF0KuQri0pHUBw5T2MC1oGW6MUKVQJ4
 e62GGNC3Ezykz/vz8Rir9GSQzSTHp222rQ+wC4iUlXtBamufSac8ZxlLKeqemraqYl2UiPlBZQ
 AIk0SQOJ/uh4b/Vq90/mT7SiuKIeAhIbSdjD9tA66JPS+drGxXUIZ5bAXRZlCBo08Gmvjx1jdp
 LnfY39ImHD8h+Qs3SLcIwJLVtSQ5awWf5BlWd7m5TkxCAEAAA==
X-Change-ID: 20260506-hawi-phy-pcie-283933b4113e
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Matthew Leung <matthew.leung@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781819694; l=3298;
 i=matthew.leung@oss.qualcomm.com; s=20260428; h=from:subject:message-id;
 bh=RHPv53SnE8+XMk7kiNsS/IPw0K+WbzN9wk2f4cANiIs=;
 b=2vQ3spsrM+vhNVXBIP/ekl4DyABK1cAFh76MkEZM/E3wgDICHeWcVEfnhj40Y0pIYHkXW21CO
 MxsP++tKE16DMtFY67CG8GBrQpt6lrwh79sQ6hZOClUuOJdVrntstrn
X-Developer-Key: i=matthew.leung@oss.qualcomm.com; a=ed25519;
 pk=aT25ggJo5PMHLN9N+TsZ3s/BVU++kEYuiFebPWe21+o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDIwMCBTYWx0ZWRfXwDZr/HqvELry
 TrAVAM0qn4NYT91Rk+0+ZAKxOwjfMUlFdcVQ442WkyZD2Txv5SEdCtxHZ+b1OVGF+pS27Nlp5MM
 VNd+TSEhrJ+p1ZpfTkGzixRCbC06/+GWJxfEoREHlc4NG1Fk1AGd30bBgX+WtrxF9l2l9B3LpzE
 6M8W/nlTcdt1tbkALXJSCf8eW3u29hl+v3iRr2u4wMxQ7UbHf+Oi8XR2JktN7kMUsRzR7uzSrCv
 s7BQBg99fwXLx7IckrfU62MxgLraSZeV8L0FZPC+lZmudwMC7oTZSNGGGrLIwn4PA3Og0jg2gRx
 v9/N2Fa+Ec2sHuXNl+ZLPxgYP3FDpeA7f4pAiW7L6xgynxkPQtLcI9OaXdw/IDZ3xydh33VsBS4
 3MJuxoukVlGH8eKmLVJQrP5DCQWbZdSNCDOlDTtGhg9efxJ/7ZXS5A/DpJFAJoob/0p5IyJ0QJN
 jEyC0LPy4QS0kJbhoYw==
X-Proofpoint-ORIG-GUID: Q8OLbG9dMQg8N4tDqH41nzHX3ALvdr_3
X-Authority-Analysis: v=2.4 cv=FN4rAeos c=1 sm=1 tr=0 ts=6a346930 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=KKAkSRfTAAAA:8
 a=JfrnYn6hAAAA:8 a=NdRViCHAqdO61CPby4IA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22 a=FO4_E8m0qiDe52t0p3_H:22 a=cvBusfyB2V15izCimMoJ:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-GUID: Q8OLbG9dMQg8N4tDqH41nzHX3ALvdr_3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDIwMCBTYWx0ZWRfX+F2hpY+VAnPb
 Qwv/SyfNg4ExR4dGkOE5+Suyl/bbcdlvqeo1ZLqSHpVQZN1mAYSzNjwfZGoVx2IJY9rklaKd4xE
 VqD2sEC+kkB5cp1uXgz7l+x+vBGbQoo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_04,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 phishscore=0 suspectscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606180200
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-113802-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,infradead.org:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:matthew.leung@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[matthew.leung@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[matthew.leung@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E55C16A2D0F

This series adds QMP PCIe PHY support for the Qualcomm Hawi SoC. The Hawi
platform features two PCIe PHY configurations: Gen3 x2 and Gen4 x1.

The Gen3 x2 PHY uses v10 register definitions, while the Gen4 x1 PHY uses
v10.60 register definitions.

The series adds:
- device tree bindings
- v10 register offset headers
- v10.60 register offset headers
- driver support with PHY initialization tables for both configurations

Overlap:
The series has overlap with "phy: qcom: Introduce USB support for Hawi"
by Ronak Raheja (see link [1]). Both patch series introduce a subset of
v10 registers (this series for PCIe and Ronak's for USB). I have
coordinated with Ronak regarding the overlap, and we can update the
series to resolve any overlap based on the order of merging.

Link: https://lore.kernel.org/all/20260508213234.4643-1-ronak.raheja@oss.qualcomm.com/ [1]

Signed-off-by: Matthew Leung <matthew.leung@oss.qualcomm.com>
---
Changes in v3:
- Squashed v10 register offsets into a single change
- Squashed v10.60 register offsets into a single change
- Removed USB mentions from header comments; offsets are PCIe-specific
- Reused the tx offset for the v10.60 combined txrx module instead of
  introducing a separate txrx offset
- Link to v2: https://patch.msgid.link/20260604-hawi-phy-pcie-v2-0-be908d3560db@oss.qualcomm.com

Changes in v2:
- Rebased onto v7.1-rc6
- Patch 1: no change (Reviewed-by carried forward)
- Patch 9: rename QPHY_PCIE_V10_60_PCS_PCS_TX_RX_CONFIG to
  QPHY_PCIE_V10_60_PCS_TX_RX_CONFIG to be consistent with the
  naming convention used in previous pcs-pcie headers
- Patch 10: update usage of renamed macro
- Link to v1: https://patch.msgid.link/20260508-hawi-phy-pcie-v1-0-237b894353fc@oss.qualcomm.com

To: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-phy@lists.infradead.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Matthew Leung (4):
      dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Add Hawi compatibles
      phy: qcom-qmp: Add v10 register offsets
      phy: qcom-qmp: Add v10.60 register offsets
      phy: qcom: qmp-pcie: Add QMP PCIe PHY support for Hawi

 .../bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml   |   6 +
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c           | 375 +++++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v10.h   |  18 +
 .../phy/qualcomm/phy-qcom-qmp-pcs-pcie-v10_60.h    |  26 ++
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v10.h        |  22 ++
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v10_60.h     |  23 ++
 .../phy/qualcomm/phy-qcom-qmp-qserdes-com-v10.h    |  49 +++
 .../phy/qualcomm/phy-qcom-qmp-qserdes-com-v10_60.h |  55 +++
 .../phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v10.h   |  47 +++
 .../qualcomm/phy-qcom-qmp-qserdes-txrx-v10_60.h    | 109 ++++++
 drivers/phy/qualcomm/phy-qcom-qmp.h                |  10 +
 11 files changed, 740 insertions(+)
---
base-commit: 8cd9520d35a6c38db6567e97dd93b1f11f185dc6
change-id: 20260506-hawi-phy-pcie-283933b4113e

Best regards,
--  
Matthew Leung <matthew.leung@oss.qualcomm.com>


