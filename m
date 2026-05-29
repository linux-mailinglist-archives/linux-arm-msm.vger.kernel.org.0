Return-Path: <linux-arm-msm+bounces-110203-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uKF7EZTnGGruoggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110203-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 03:10:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA695FBD9A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 03:10:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 73FAE300B9EB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 01:10:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1998F34B1A6;
	Fri, 29 May 2026 01:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SqI/1pf1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F4bdWn9k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E095E32D0CC
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 01:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780017037; cv=none; b=BvK4SvUvPNRuW4EuCGyFG4jT75opjSdUFE7frUWfU7Jn7WZHRzO6ouPIfXJ0+LvAC5BtbMgGw2W/7tl9Qcyt+Vn98an1LzW1eIcQTudRbBmsIcrx/5X3ScJheV0IgSO+VlbcvdY3ZijJb2E7JPMGWyen+tvlyUxQUr6R1Sx5kDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780017037; c=relaxed/simple;
	bh=ED17Tu6Boefwx031Ua9Mi1AfjIk4AgqPmRso+e1SoR4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=UU9DLHLQw8TkBsgkAVVPFrzG7bIEjNrDddCyVCQtxiBMAUviRkEB8/yFaO7tXel/g+Cgw3yEWPtJokF9pQmHCC9c5CdA3veUH4l3id1IZVdt3+yJYNg9EcELZvPt8hgKjH/c6EPDljRyZ08HNNIbPlFq0v/MLlKVhzixs04PZwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SqI/1pf1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F4bdWn9k; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64T0AE631495941
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 01:10:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=61flKZ6F2p/mWTtuVMLVmd
	xCIeA9SAxH8x2BNy1Y4qs=; b=SqI/1pf1FmVy8sv7TY0lgA85oqTRo9ZXNGXnRv
	8G9vUvA0kVSdDGgLFKHHr+6et2kWiNdj4M0olyqRrvjMkzRuWJz9BBVJB24mcOz7
	eAp3XdRRvF9AZUQwRtFL1dbD8s4UgsaAVq9hqy81DrSKtYH2uZ3dRVdz/8/yjGD9
	6ggoWHcLCrkIwMrV+FgmA1hQpaYLcxkeROFTn8VYRj+jFeDCyLOBxEdHgZ2zMjmI
	AQMUweC/lWMOVMl76JA5C1lRlW59oyNKkhwopEOC3Emg11QG4xS4pJl/30wjPm1/
	oKhfBS7OQ+Y5AVOIUn/uafagauyePKlctu/o1V6Syj6JZ65A==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ef01585yc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 01:10:35 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-304e4636205so889588eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 18:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780017034; x=1780621834; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=61flKZ6F2p/mWTtuVMLVmdxCIeA9SAxH8x2BNy1Y4qs=;
        b=F4bdWn9kfrZEqX0kucaGpKfA2kjCCk7PPxHtuJ+p+nBN816K3l05opWxiXuFn05z3J
         CynNihZyfOoxvSIDFJnrQrkE0sqD0ukyPWqOh6l6cycS4sD+Q7IiKDPFcJZzQ//eFKOW
         CKrqqk+WWMeG4oHJ/7u5cubsnX3b0rUs/gN4royaRbqALH3e9Rrl9mGrkYt42y7yuHBH
         /hzS6Il4Pc+kM6rh4x/w7gwlRlJpTRzwjWGgvpCHYXy+8QwK/9mND1R+P6+BQA/glhhW
         ho4+4jZaG8sN4ZuW6ZDtv/TvOYwzplwKdQX/b+Z6MZm9EVOh6bxrkPagU+XX08HdPIJ6
         CcGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780017034; x=1780621834;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=61flKZ6F2p/mWTtuVMLVmdxCIeA9SAxH8x2BNy1Y4qs=;
        b=FZ9Np1hrDOZvogU0N5rU1C7vwlx1pOBBBmA5xU/AnpWj+mF/4Gd5tXEZxqtYYCx9nu
         Lp9EVuVlQeSfLBksZMCKvBZwpwAQ239mEAqiVnh7hvcHL4j5hUwrYAb5Jam65oIIaZDF
         0da71rl57m1CayLC3oLh8Q2rhXf5kktLFWpcDK3zZquSexEwheRRWfdgQy82lhaGU/4E
         vx+Qg/YrQ84XVVj6bXQZ1HZSVs5OpMQlVbKFmHQEWznMFvEblvKynAPrkih+hZNvT5Ll
         TTNhT0/C8FOHesahJm5aI/dltxP6XE8P5Jze6ykO2fePixMCURo1RoGJQ8pIHdYTe6T1
         AC9A==
X-Gm-Message-State: AOJu0YxQtArK/KHU45l6wkhQAnqiw/hq+pYLhicM00eUBrgl7P5P4K46
	P8nafKyJWdm2s2Glqxk1LjybRfbXjtSuyleSXPTbcatsatcdB0c6T6jZiwWu3pgHMtWn7m3Lw5n
	tbTBaKRZnTYYHeFZB6/Vnpw7lOZd4FaRPTa/GDLMEr0fQ2FYcBjyzew9D3S+Kdvrf5IaJ
X-Gm-Gg: Acq92OGnxMqNasJfEalwuEVZLOh/lm1vlaGfrrZNkrjzvw0qWXPPtdX2qs8h2VJ9IW+
	Q/oldBSKen9fhLuQIVm+9G2G80jpnLVuHFtYVJ38a81qrC3pPwSpvHMecuFaqT1pTCbz8Y01Tk7
	PgNT/ueiZ58KE39f8WhstYNjQuvTvEbLijczzpCpCoLj5NJdhH+0KdiUQdeNe4IQNC8n6r7Zwrt
	06NpQ0ymdUC5Y7oBYAZIoghr8av1I5qt/U3mlOx8HUbiQfr5+wfjSkbMsUOfUC0N794pmpApttD
	wUox+9Zx2g74UaetNhxLL8P2jekXeAxg8FmchXYUiwmf/iR5fUAkutfwmC/Ry2ruG6ecvHX/Oj+
	uCyK+JTUYu5Ki25ERxjfD2MftZ8VOM/C+wl1Mr7YP/7GITI7T6ntmYZIkdYLW33VPEzhwYg==
X-Received: by 2002:a05:7301:4b18:b0:304:eaa8:11ea with SMTP id 5a478bee46e88-304eb2add39mr428440eec.34.1780017034423;
        Thu, 28 May 2026 18:10:34 -0700 (PDT)
X-Received: by 2002:a05:7301:4b18:b0:304:eaa8:11ea with SMTP id 5a478bee46e88-304eb2add39mr428427eec.34.1780017033742;
        Thu, 28 May 2026 18:10:33 -0700 (PDT)
Received: from [169.254.0.3] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304ed5a114dsm173785eec.24.2026.05.28.18.10.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 18:10:33 -0700 (PDT)
From: Matthew Leung <matthew.leung@oss.qualcomm.com>
Subject: [PATCH v2 0/2] PCI: qcom: Add PCIe support for upcoming Hawi SoC
Date: Fri, 29 May 2026 01:10:07 +0000
Message-Id: <20260529-hawi-pcie-v2-0-de87c6cc230c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAG/nGGoC/02OQQ6CMBBFr0K6tmRaoQor72FY1DrIGKHQAmoId
 7egRjeT/J+X/2ZiHh2hZ3k0MYcjebJNCHITMVPp5oKcziEzCVJBCopX+k68NYS8VCLZpkYnEgw
 LfOuwpMe6dSze2Q+nK5p+GfgQDrshSPofVpHvrXuuH4xiab+y/Z9sFBw4mExABqrcYXqw3sfdo
 G/G1nUcDivmeX4Bi0AmstAAAAA=
X-Change-ID: 20260506-hawi-pcie-f61435ca420c
To: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Matthew Leung <matthew.leung@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780017033; l=2408;
 i=matthew.leung@oss.qualcomm.com; s=20260428; h=from:subject:message-id;
 bh=ED17Tu6Boefwx031Ua9Mi1AfjIk4AgqPmRso+e1SoR4=;
 b=qX9j/g+3hKFXSNVcgPVdVlt+uHxKf7x0HKJdOyPwo+StTrtj2hC6N9/CdAVEvMl6xvrR3uMAg
 7kBCUg2XbbKAamVDziGBv7tdn7XjHXiDObZYknx/PpDf/ZMdbrmTl3y
X-Developer-Key: i=matthew.leung@oss.qualcomm.com; a=ed25519;
 pk=aT25ggJo5PMHLN9N+TsZ3s/BVU++kEYuiFebPWe21+o=
X-Proofpoint-ORIG-GUID: owUe4Z0wmX9eO52HFCN8hucie4ibcJ8J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDAwOCBTYWx0ZWRfX7nqGvK9iQLPB
 qWWQuWlXnH6xWrxw4q/bZma4qUw19VGP6UY9FVmIg8re0VG1C3Rk8SCqFuR+AbEXVWCiPhkAAD7
 Q4YNe7caQ1jm0wXl1iD56WtfOIe/KDJBfBIg8iurQfFYzGezssfgUibo68YrxkZdzjF64vqSNp6
 WgOQI5SjOGBFgi7RfF7eIFF9Pf7S381PE821XnalrL+2XYMjrdqWsJfMOVU61CKVFU3LNTdOJLN
 NCROParFuOEUg+jq9KegSqClgsfl48GzklezG2rC7KtVQ4iyvgb3sBA4ai5mprHFnk07as4ktRN
 pAtpmFF5b6I6WwimcmU4fOOstjzQ4+tdqpUfaev5AkdJZB6GS9P5VAbz/B+cHsxP0X6eKURisJz
 gSlBewW1G04yKGKdDdfB/1ivbLHd4OjbyRyrSh1ApWgWBmXmlC9N/FNJXwKr99waxsl9LZ6nTiH
 sZZqQCl/7UygOMMW/6w==
X-Authority-Analysis: v=2.4 cv=DIG/JSNb c=1 sm=1 tr=0 ts=6a18e78b cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=1XWaLZrsAAAA:8
 a=7C53p0e5iIXEOqMNOosA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: owUe4Z0wmX9eO52HFCN8hucie4ibcJ8J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_07,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 spamscore=0 impostorscore=0 adultscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290008
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110203-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,msgid.link:url,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[matthew.leung@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4CA695FBD9A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series adds PCIe support for the Qualcomm Hawi SoC. The Hawi
platform features two PCIe controllers: one capable of Gen3 x2 operation
and one capable of Gen4 x1 operation. The first patch adds the device
tree bindings documentation for the Hawi PCIe controller, and the second
patch adds driver support by enabling the Hawi compatible string in the
existing qcom PCIe driver.

This series depends on the following series queued on linux-next:
- [PATCH v3 0/7] clk: qcom: Add initial clock controllers for the
  upcoming Hawi SoC (Change-ID: 20260316-clk-hawi-1ad4cad36d6a:v3)
- [PATCH v4 0/2] interconnect: qcom: Add support for upcoming Hawi SoC
  (Change-ID: 20260311-icc-hawi-d6dc165f8935:v4)

These provide the necessary headers for running dt_binding_check.

This series was rebased onto linux-next and applies cleanly without
additional prerequisites.

Signed-off-by: Matthew Leung <matthew.leung@oss.qualcomm.com>
---
Changes in v2:
- Rebased onto a newer linux-next snapshot
- Previously required dependency series are now queued on linux-next
- Added minItems constraint for clocks
- Moved description comments for clock-names, reg-names, and reset-names
  into 'description' entries in the devicetree bindings.
- Removed maxItems constraint for clocks, regs, resets for the fixed
  size 'items' list
- Link to v1: https://patch.msgid.link/20260508-hawi-pcie-v1-0-0c910906f7e5@oss.qualcomm.com

To: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Krzysztof Wilczyński <kwilczynski@kernel.org>
To: Manivannan Sadhasivam <mani@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-pci@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Matthew Leung (2):
      dt-bindings: PCI: qcom: Document the Hawi PCIe Controller
      PCI: qcom: Add support for Hawi

 .../devicetree/bindings/pci/qcom,hawi-pcie.yaml    | 204 +++++++++++++++++++++
 drivers/pci/controller/dwc/pcie-qcom.c             |   1 +
 2 files changed, 205 insertions(+)
---
base-commit: f7af91adc230aa99e23330ecf85bc9badd9780ad
change-id: 20260506-hawi-pcie-f61435ca420c

Best regards,
--  
Matthew Leung <matthew.leung@oss.qualcomm.com>


