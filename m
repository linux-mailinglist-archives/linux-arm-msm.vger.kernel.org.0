Return-Path: <linux-arm-msm+bounces-107522-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6HA8LgpMBWoIUgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107522-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 06:14:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 197F453D949
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 06:14:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F13983039CBA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 04:13:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08F3F3ACA7C;
	Thu, 14 May 2026 04:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fsn3KOPa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A4lSQUst"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C0403AB267
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 04:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778731993; cv=none; b=M92Mj6/ctg6OXeRlZX3XLEJAy9IIN4nvQhOvJ5/HriyBuID1SbfR6BsbGC9bZ6vnF43Gd/A5ETe7qNMnAk7iy/AqOlCUd7/lw3AmxjkjvWfisMsljTYIAByie2JA0dfNZbn3kA+xaJH2fA9Ni+ZLR+3pNYdIKuNJceW0bFA0dsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778731993; c=relaxed/simple;
	bh=UCvF5W4Php1eq6KLqSfeXsUXTv1lLN3d9cYyXqBJvHI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=kYXgjYF7QzYqNX6mZvsVzKqbEJKwuS1+aFJTFMgk+Aj+iKAX8R7bR4kFP4j8Y8kSeyR14wmhC0JmB4QEK6UrURF0rEBEuWswgIF1i1NjoYjhJ1gW+xJIcg0jFVQ8H7dAxJqg6I4kg0+b2W/Wep/FzSDeT2VMAAFLbVb8SFjVUyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fsn3KOPa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A4lSQUst; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64E0tCW31622524
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 04:13:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Se+XvDLdHFlrKh024A77jn
	O6bIXBjZkbQxOwwc6Wg78=; b=Fsn3KOPayXzjgeP8UurUtOWS7+CkNmB0hf9vjE
	whrOAVvaFGcU9p1kZY6Jy/9uoWIOoM2kBGC47rrW/cZbi4vtJoVbiX39DdVCH8+p
	IA3vOE19xj+EWS8aQpu9YE5cB/hhqdK+PbwBnvgoxlpopj9MckUyhQ11aLpKoF30
	05rbAVj2fmIeezhDB33UPcwfEbQNeg1gRIBFigFAwvc0Z2iCxlkdfroujZB0uluh
	kLQlLuVztU52D8wGIZlxNvwE3zIY0JkCbINo4X96y89hQ8Qv4ik0oq7ofR0JaIgV
	yy+iug8QgM/lvGta/8+r1bL6vftjlT7bKezzgZPO/3kuw6+Q==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5492rgx5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 04:13:10 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-83544d05c5aso4073606b3a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 21:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778731989; x=1779336789; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Se+XvDLdHFlrKh024A77jnO6bIXBjZkbQxOwwc6Wg78=;
        b=A4lSQUstu862v6TCwMyQQdb3uLh1W2GrU4HrEe9cqxGsJR6xrYBsGejxM8QaQF8NWv
         TW0Ig1D90ghSItsfgDPpG5dkWn20K4Bq60PteLsSWtpk4pdjHBlcBbCVcU6KuEnagZb/
         qNTePLKYgjUpiqb8JPlzkknKVkkNLoLBhISM8ecCqsrVGU6iXJerCb1Rl7mLIacoj19J
         LgzmW5PW/yCHM+FfGXU1YkS5zL8jDV6oNSFS1n/wYO6MpJ2hL+RAGp9qNqr0el9Sn0D9
         K2X6AlgCLr2sHCxGZvP7JjVi2aYz29SeTURfwQRi/mYfzvgVktL1Cgh21D6F1UvEL7Y7
         1E9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778731989; x=1779336789;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Se+XvDLdHFlrKh024A77jnO6bIXBjZkbQxOwwc6Wg78=;
        b=dQjgBtqeV6WzrFiEnkv21oNS+khzi+/C34659KWt0fwCwJpTozged2eS/gpXoO2+HL
         P/ym9e9lDl0oGWGmOgSmM0Lf1qj3Qus/Ui4mO0c9FaMHXo0ZiNpAzQGynnVh6Fnl6w05
         mXTKwSP6ARoouPQ+tSb2BXbR2QFMjFz0dVpcYDm1lFSz6nxTr0WwyHff9C4ioJGIEIex
         Me/ND33pvRnzFdo4+0H+hApQvM8QrQDPRexuIlgGaFCILGfO8BCsikfF4aMIz8krxDUH
         UpfLko8nTMB8PpHPNbo1t6EPVbh70Cb4kNbNqtIXVoMJ4TiSiH4oyomMqn2wT3zztMdv
         4Iug==
X-Gm-Message-State: AOJu0YwBqVX/1UgH163BoymCX4p9GM+1oiEeiIikN/iO/QzK8SvSwmEd
	b3t7JW04Wa+bEB2+b4W/tQ2tx4cMOdSWmnZTLO92+tAga4WIFwQ5W7dMcih7n1OAxXV/dt7kxOn
	x6qbo9uMS95/Yic3vTq3CSwiYYEjR355s/BoD6TJ+jDMjho88xMsJmJgb8TSg+KZASdjj
X-Gm-Gg: Acq92OGmClI3CQfuFIlYa7rIdthHQm75qu6BkaDk5wOf9fzy3NGLIMVb/3GDnI1ujvq
	BhCd8HMPKsJklB28PFEFrVkB4bpgi55ktvZfy/Nq3SsAYljhG5KCCpqOD6b533VobGsrMmP2HFZ
	SKKx4/sawuTLV3kYOLKpU2xSn2yS2vbOdRwLdon6AXENObubq+0qpiJ9UBo91GBILMj/heCGc8J
	GPH0xnYQJd1k80qlpSlJbDrsAl5dQnYGRsRA78jcT0mvSXQ+Vn0LRWXh00LmDSrcU6Qx5Robfdo
	HzSJyr2kL0qeTUx7WW5fdfUpbe7+Yy4v/nE7EdHQYjo+a3hjU1bylMZDQ2aYLyaMY1w2KgQozgl
	QcHwwnwZEtTMHL4fFrOcZlqr3+lokS41Qn+9jl+qf1YIs7fhUbq2jdd70Rzuis7hGV2+xkGzyiq
	JjAIIp9PgruSDF52vFaY2QzoDThh3KDbF3jtDBGGEcNybSKkpmjkvPZNrf2wEGSA==
X-Received: by 2002:a05:6a00:4004:b0:82f:70a7:4a25 with SMTP id d2e1a72fcca58-83f042caa00mr5624652b3a.35.1778731989381;
        Wed, 13 May 2026 21:13:09 -0700 (PDT)
X-Received: by 2002:a05:6a00:4004:b0:82f:70a7:4a25 with SMTP id d2e1a72fcca58-83f042caa00mr5624617b3a.35.1778731988787;
        Wed, 13 May 2026 21:13:08 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19c5be71sm1075432b3a.39.2026.05.13.21.13.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 21:13:08 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: [PATCH 0/2] Enable PCIe controllers present in Qualcomm ipq5210
Date: Thu, 14 May 2026 09:43:00 +0530
Message-Id: <20260514-pci-ipq5210-v1-0-a09436200b35@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMxLBWoC/1WOSw7CMAxEr1JlTSQ7pmnTqyAWieOAF0BpCwIh7
 k4FiM/yjWae5mZGGVRG01U3M8hZRz3sZ8BFZXgb9xuxmmc2DpyHGpe2Z7XaH2uHYEPT+MYljtk
 7My/6QYpenrbV+sWDHE+zdHqFX2dX/Rn77dVSKxwSch0DdGc0vxd+6sr8OQAxARWKJC29JymOY
 vmw2+nUVRLa7JCxgQSYsxTyvoCjlAoXnwhrCCW2ZNb3+wPk1NWtCwEAAA==
X-Change-ID: 20260514-pci-ipq5210-977672bcad62
To: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: msauHwdc5ULl9zICpM3o0FzoMYWeKJ_I
X-Authority-Analysis: v=2.4 cv=R74z39RX c=1 sm=1 tr=0 ts=6a054bd6 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=wNaPFhMNx_1Hpoq_LpsA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: msauHwdc5ULl9zICpM3o0FzoMYWeKJ_I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDAzOCBTYWx0ZWRfX5a324VTb5FAg
 kb5890jVNirctIziwC/Uzd/4pk8MrtvASWFzqHkwI/gPsFL0zGUN01np11uZwOKhHgZZ1+2eoNk
 NdlVW8FYH/h8/6aogRAhXA8DhlyddvgcMt6z6uZyn3nGRiHXoBhVVuLAksiWKxfk0ThazaR3iYS
 dsB2gbtNOrBfwCTU2+cTLZfZh2toAx8TDoBnPK9gLv27AsvbjpVKSVTRe6pRMg5licqqVsGvL+z
 Qd3Fe7K/uccA4SvCqzgLrCpXh5Uin9SJ+vIaTsMpek5fFvPEbJ0Yt2+TQsGpmzjLcTnOmAfZ0mB
 E4QySGaqYnEW2g58zEPWr21SMtU0QC1q3E+gcAFuZCh5kwkcb4Y+BO7l7Pi1KRG8iHaEWJYtJNl
 E1lkNDILzdUzWuTAPTZKp/4n+0luEuylJehR7jclGNgOTD9W673ZYAUcEaIEM4uEqLzK5+tFf5r
 QWMzYWlmNtyU5NwG5TQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 phishscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605140038
X-Rspamd-Queue-Id: 197F453D949
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
	TAGGED_FROM(0.00)[bounces-107522-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Update the relevant bindings and DT files to enable support
for the PCIe phy and controller.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
Varadarajan Narayanan (2):
      dt-bindings: PCI: qcom,pcie-ipq9574: Document the ipq5210 pcie controller
      arm64: dts: qcom: ipq5210: Enable PCIe support

 .../devicetree/bindings/pci/qcom,pcie-ipq9574.yaml |   1 +
 arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts        |  43 ++++
 arch/arm64/boot/dts/qcom/ipq5210.dtsi              | 261 ++++++++++++++++++++-
 3 files changed, 303 insertions(+), 2 deletions(-)
---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260514-pci-ipq5210-977672bcad62
prerequisite-change-id: 20260514-pci-phy-38ec9b1c5a90:v1
prerequisite-patch-id: aea0d856b804b879fd5f24ea02f809b4dec84a30
prerequisite-patch-id: 26fb9a62b5ba0fc6275c0b081c7a16348d5a4fd1
prerequisite-change-id: 20260514-icc-ipq5210-0ab03f3a3e83:v1
prerequisite-patch-id: 0b6145b6635b18fe79fbbff5815041b43778c5ed
prerequisite-patch-id: 924c6ff7baf4283ac7991ee94c803a00fc5cece4
prerequisite-patch-id: c2fe1800fe769dccd37f94c19860a07f979e3c4c

Best regards,
-- 
Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>


