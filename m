Return-Path: <linux-arm-msm+bounces-90797-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IIi6EBnUeGmNtQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90797-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 16:04:57 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A9DA96446
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 16:04:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4120A303CA71
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 15:03:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D8B82FFDE1;
	Tue, 27 Jan 2026 15:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LlEhvEJ0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FwuGqlZv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF6D221DB5
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 15:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769526233; cv=none; b=j+vKiqIm7L8BvKXYLsPkwzV5m39F0+MKjY3OmUyX3+uQoKfWMITAXhTQofG9IShjLYAuEm5mTOtweHtZYOJPut7kbTWtSsdrXN5PalvzkJsAm3oXNXKPw5nRaicZip68Y+s6XqRaRBUMkUhRlwq7+SeMXoPtRcaDtMGU55fKv+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769526233; c=relaxed/simple;
	bh=2YM4XIpqzCb0LHUPbWTlm9mjtrLjc3dpK2x82XsFb0Y=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Nrjz7erKt5ysKrCPwha6V5+CdyPGYNmkkeOReNUxDqLlP4Bh6V79AsdKN8sr/CA75yVu+X0fjlHhRq87/s99mn379kO+2HHBfdGr81UNO8nTvkKdILGhnU9okHthxs98YcEsBcQaEPwgrSsiK6bcWYFta9tIgU8sT+q0I+g7BkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LlEhvEJ0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FwuGqlZv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60RAHAxo3714753
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 15:03:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=NfI8wG2fYkxCZMur3SYNKv
	diP6pGEfXaML2kMJ4JiXc=; b=LlEhvEJ079yV0zydS6/w3Aa24XPpqFjUhOs4gL
	GHgsddZ5BVlX/J+qZyGFeJOtQuyzvQxa9O4Ctkrw/hA9FxavtPTwD6ZLR4YcV5OC
	X8+M0AJEVzDgPjyHXMFrLw+0WulQ8fmPxkwzu9+j3ZbGBYfR5OiEQEBHci2hzEuR
	2BfANCmg/mmsJLQ12SunfiVIzdlJNGhf0dQ31w+6BsoWHuVTT3b96euG7iZIE5PG
	Y3bvXlQ/6sJAfVueNI7YuADkE1M6VjNIdwVl1p3B/igi+ZHBwiTRrXmHWg6GquOO
	k+sGevxB2I5MiplZnT6qEyzZtmvfnngJE95UHeiqaaNzR/Wg==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxdv0bds5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 15:03:50 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-56632d985e9so21996231e0c.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 07:03:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769526230; x=1770131030; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NfI8wG2fYkxCZMur3SYNKvdiP6pGEfXaML2kMJ4JiXc=;
        b=FwuGqlZvuhtOKA6VgDMM3VYeCEp+PPz9Kpr/haeT84LpOiI0z5cg+44Mjia9OCWD5z
         /rOaTCi+2OzFn2V0/E+kxOBon3JYeauDYRkj8YyC6S2UUulBLlAxzIO5KbsvZQvYiBRf
         CpZqwo0LYGkzZK7HWSO2slOrQv2MwCMstEL52SMrHuWzHv93cvZX5MREhh70giEdAfEP
         v4sK9X7xkrPOmpRrglEtPPpwxSVY0lSwJo5jAc0xp5Yfl0tMCCGLbJRFUxPF2X9hu8e6
         FBMTZ8zwqstanxPNHcBC1ImiDDxtM4B4XOZCzH1aGUaDHpuc5v8/0jm+B1JWsvAdKCvR
         jf2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769526230; x=1770131030;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NfI8wG2fYkxCZMur3SYNKvdiP6pGEfXaML2kMJ4JiXc=;
        b=e4SKKr2sO7TGeJsWYucnz93yOTsHysiqQF3QHIfos9nE0CiR342o2yGNKINKCmLxlQ
         l3jNqbY9kYLI0yUnxzY+QmVIjCp7ZntDegIqhulOm+tNrtklNL+wqGwsBJmXd8UKA4X+
         33dp7yv8J+T1D7c/KtovkaPrYeOmsT8sdzSk77tmurial6eKaA8tE52712PIWhHeJHAj
         oGJSBXFS4oiqqWqpZjBmwD0xhkQaBL1DaTeKcxgszDTbk+0lu+6jDYQga6kfibcyCenJ
         XzzeDetN4lHdrSRP3g2Q5DuVdwwMpURt1BTK1CLwco/8vTIg7WkFipQiEqyZGJ60JawS
         rhFw==
X-Gm-Message-State: AOJu0YzYsPf7eW3t8qHv30kGalSwvfN72Qfv1IMC7N/ZDdrsgqHsU+yv
	TOIk/hJ6u3PJqORNl7h4VS6u67yOySQpn5RuHqljuzyDdRPXav5cLvISkEzXHxTZvcMMxmLB5dF
	H2PtPD4NfRQDQNFJqfRhOUBVeEIJ/LEzHXnsKSY62UFEZgQH/V8joEVXB8JiIdD/ijpit7RVXdX
	t6
X-Gm-Gg: AZuq6aJ8gBqkXAoTCotEx5gR58VAZPWLX8AZ2visMHmo1rW2ccXSp3g6kc4qPNlgyEE
	/BqWHJ2PQypVm94roT1AEgQfGyJD44h7MCY+9mlhm5buOvlQt/iPqoDJe2TnFDZkRRyebgwG9sr
	3LwzqoZ7y1yP5Y7zkndnwS9DhlebwaTuAl0St5kpfpsSz52MgbUAV/ir8VFSBf4lYuM1RfgAFUQ
	Kj2ZBYzukpmTZj821aUy0N49PC10LXbjavJrdKjrML+hcbhHHGed+IePzat1mZ5VbVxNDBBJkwd
	rVh28NBMnUZHwoaSRPmK4arc02RyykrEtNxBrY293tRomQHy8F1Ykzg6GI5j+Xnu7JxEfN2nzXx
	UmDvNgpdeOTakxxmb2Q==
X-Received: by 2002:a05:6122:658f:b0:55b:305b:4e40 with SMTP id 71dfb90a1353d-566795e184amr744438e0c.17.1769526229438;
        Tue, 27 Jan 2026 07:03:49 -0800 (PST)
X-Received: by 2002:a05:6122:658f:b0:55b:305b:4e40 with SMTP id 71dfb90a1353d-566795e184amr744244e0c.17.1769526227507;
        Tue, 27 Jan 2026 07:03:47 -0800 (PST)
Received: from hackbox.lan ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1c02cd8sm36895097f8f.8.2026.01.27.07.03.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 07:03:46 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH v2 0/6] clk: qcom: Add support for basic clocks providers
 on Eliza SoC
Date: Tue, 27 Jan 2026 17:03:18 +0200
Message-Id: <20260127-eliza-clocks-v2-0-ccee9438b5c8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALbTeGkC/1WNwQ6CMBBEf4Xs2ZK2KIgn/8NwqGWRVaDaBaIS/
 t2C8eBlkpfMvJmA0RMyHKIJPI7E5LoAehOBrU13QUFlYNBSp1JpKbChtxG2cfbGYoeYoc1LiVk
 OYXL3WNFz1Z2KL/NwvqLtF8fSqIl751/r36iW3k+d/KtHJaRI022l8kRVe5sdHXP8GExjXdvGI
 aCY5/kDBuqrDMEAAAA=
X-Change-ID: 20260120-eliza-clocks-5ee7ec9d0e79
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=1921;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=2YM4XIpqzCb0LHUPbWTlm9mjtrLjc3dpK2x82XsFb0Y=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpeNPAsvCagbVge9+T1BI+0XrRghQvxwm0KNCqs
 5Cu7AaLy++JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaXjTwAAKCRAbX0TJAJUV
 Vp6/EADH6CnX8iThDnDuJCNXyTPwYXW/icDGh0uNdcLh9haXkEwSl6DKzPgzyJBkN3tM+VEIzv1
 JbJuCnjo/9xezlpx5kxItx7D8C2xQO/o/xLlztEXXd6UpUICubXA2KsqMakEd5eB38U1ii9mawX
 5GImQChcQbQcVP0OC4uPEm7DUElJ5PoxWAXnl84XKdY17s6flEf/YfWmCjjKf+qtlGXGP4dKEgG
 p3rZ+PIYtZOFL/+GZ9GDMkocVIR1dSmH8PxJR+AEKMFNTgFBJokvvWwbeiexY5JYQ/WdYMAE42H
 4UoxaadVNMNHuPcV0Mai9rB4fp+NpamNsVBb2VYc53YFgLn8CpGJglw8/3gXmB94rgJkCW2DbWo
 VkWFahMwZ9Wq8HTGdkZruwCdDtLZor1ffrrranY5/ovrFestdZl8MPXftSyjlFk49v1oaL09s0l
 4BUNhMzIshtrLWudRVJJ/Myr8Iw0CXciRd5mE+DgLiNsuR6xPs7tQW1B7ylhqoGjX/fMARW28Fj
 TFVtDEiuPluiMaSRWLe4txG1BxpumB5cNyRWwyKX3/S4ElsUpFGMbcOnViRw9hvOdBiOzozTK8F
 ZW2KPjX9kNSM3NjHtbV6CYgkYqYj/z8nlPXJ63vwjC2YUchVLZGNTZy2mNVD87hotc57FeGgXn9
 M0exwX9FOEPyIYw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: knZ_xgGUdQEvZWi2YgczLj4Bd0QLhHq0
X-Authority-Analysis: v=2.4 cv=SvedKfO0 c=1 sm=1 tr=0 ts=6978d3d6 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8
 a=_s2lmL9ZJNBb6SD5BL8A:9 a=QEXdDO2ut3YA:10 a=XD7yVLdPMpWraOa8Un9W:22
 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: knZ_xgGUdQEvZWi2YgczLj4Bd0QLhHq0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDEyMyBTYWx0ZWRfX44yqGhE5ZBHX
 bPlhEk8usB0XjGdFcCqQ/4MCXCaCpy+Wnu78ba/ebdcY05StthbfYQUS4gz4fdS3xPRfX/FjODq
 kOlD53TwUiRtBVRbbuyHwOLVz5PcHZbeX8oO0S0Q5LvzfOv3Y1UuaMOP2X+9YkNyEoPyhfSg1cF
 t6B+0YWL4bR/ocYGAic4P56GmaP6wZTo5yZdf7XcQcR1VcomG6h/ZmNromKQVYg3oRsQhh9ngEd
 quJqBjV72fTl2okvegJO3ESHK2zx0mQzvYeaqRLtNNo4WJOl612AXrMHZo0O9bI3+IPi4EBojEu
 WcYj5ZYZO4FSKSd7jHv105GZduqC/xIJyrjUoyfKkmkuyf58lUxv0SCwMl7Rw6bkNuhidgV2lsl
 hFZyS9bquR8++XxEXhhSOtyfEJmy/Pnc8uYSIGvdt1d0gh8tiD+HusH5JfSTzSCgoODKfGLoiYV
 SGX43vWqxfY+DSXtJvQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_03,2026-01-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270123
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90797-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,msgid.link:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9A9DA96446
X-Rspamd-Action: no action

These are the bare minimum clock providers needed in order to
be able to boot to shell and have the rootfs on UFS.

The multimedia-specific clock providers will come later on.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Changes in v2:
- Rebased on next-20260126
- Replaced the all-caps SoC name everywhere
- Created separate patches for each clock controller
- Dropped unused header includes
- Added parents to all TCSR clocks
- Added an explanation to why the Milos GCC bindings schema was reused.
- Link to v1: https://patch.msgid.link/20260123-eliza-clocks-v1-0-664f1931f8c7@oss.qualcomm.com

---
Abel Vesa (1):
      clk: qcom: Add TCSR clock driver for Eliza

Taniya Das (5):
      dt-bindings: clock: qcom: document the Eliza Global Clock Controller
      dt-bindings: clock: qcom: Document the Eliza TCSR Clock Controller
      dt-bindings: clock: qcom-rpmhcc: Add RPMHCC for Eliza
      clk: qcom: rpmh: Add support for Eliza rpmh clocks
      clk: qcom: Add support for Global clock controller on Eliza

 .../devicetree/bindings/clock/qcom,milos-gcc.yaml  |    9 +-
 .../devicetree/bindings/clock/qcom,rpmhcc.yaml     |    1 +
 .../bindings/clock/qcom,sm8550-tcsr.yaml           |    2 +
 drivers/clk/qcom/Kconfig                           |   17 +
 drivers/clk/qcom/Makefile                          |    2 +
 drivers/clk/qcom/clk-rpmh.c                        |   20 +
 drivers/clk/qcom/gcc-eliza.c                       | 3160 ++++++++++++++++++++
 drivers/clk/qcom/tcsrcc-eliza.c                    |  144 +
 include/dt-bindings/clock/qcom,eliza-gcc.h         |  218 ++
 include/dt-bindings/clock/qcom,eliza-tcsr.h        |   15 +
 10 files changed, 3586 insertions(+), 2 deletions(-)
---
base-commit: 615aad0f61e0c7a898184a394dc895c610100d4f
change-id: 20260120-eliza-clocks-5ee7ec9d0e79

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>


