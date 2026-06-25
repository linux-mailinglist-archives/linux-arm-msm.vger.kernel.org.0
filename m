Return-Path: <linux-arm-msm+bounces-114573-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FAtkH0OSPWrB4AgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114573-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 22:40:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E016B6C88E4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 22:40:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=cay3Jf4t;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=LxLx3Pso;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114573-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114573-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8276A3096812
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 20:39:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DF7936EAB0;
	Thu, 25 Jun 2026 20:39:24 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B57CC3B6364
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 20:39:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782419963; cv=none; b=FFVdjSKBNiY0bggOk4oKnpoCn7/WC2Fy2XSD7au0IEk5Kx077kCG83yWCqpTse1bf1w84K5bDhsPXDeuvPTn8eWL5OyFWqsvfBQqiLeayDsubrBuWcdvuWaR10awJKPqvTXdue38wbmnD/QhETUY2UVqdzlBys3vrrugRsQNc0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782419963; c=relaxed/simple;
	bh=i+0AAz3WDNLaIrf5TpMkoF5mSyPu7bbMM7mmjXJH9WU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=X2/6g5AQx9GXFl4FGe7WYg8PhND1TH9346xvvH23Z7HxtQ8Bq42bG1g0Y5gElb2nLDAtn+EgeCMmo9Cakw7IpMMdCox2jnHU6tKRhIUZZ3ww1l41kMrQ1pnGA9m9m1KcOx/Al0TMex6ajNl9mUmlC+w+KRWm20tmrHciEyaR8Uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cay3Jf4t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LxLx3Pso; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65PFe9Hi2801479
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 20:39:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=wQ0wPa9pi/vo3Mf8WPQJr0
	IWTIlooFDEEgQnkHn1StA=; b=cay3Jf4thwdk9ESA2CKIAlvIAYcruFdbSVmlLk
	cBb2uCuNnpnTiQd7O9f9dKVhVOTM1mzevbMvu4pVbLE0b1wXzMy4hkhM0Gmcd2rS
	UpRuSGCaWtlc7B48W/A2UbSHx2ZKEqZNkFppcIMBba+o/CnPVzyDPCdUaVtx7RwP
	y1LbrusxmcwIfSK28cxYG7N5D8b8jO8mz48cHhBI7XGna9r+K3vSrcNA28j5fh4q
	I82enO3aAzDcEEl+KJpeGktEIsxhfzjL2lhf543sW6ou7XTbOgpsuQG7d1vkTTo9
	i5hEFsF/2RwGTmYbjkWmXmIacY8u1kfvPGL6Id6//BuIZqkw==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0uhmm752-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 20:39:15 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-139c6673856so498316c88.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 13:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782419955; x=1783024755; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wQ0wPa9pi/vo3Mf8WPQJr0IWTIlooFDEEgQnkHn1StA=;
        b=LxLx3PsolJoPpIYMq1/MbDN0qJ04jY9Dx7Ttcc7w/fP3b6KRlGml567PiW3Ro5SoRd
         Sy4PeQCFV14TOn6V4yi9tJS+2DGk4PVgH8gWrAR5nibiL7p9bJ73E03ouyyfNnPIXWGJ
         vdk/szIXYD3HbQ9pBA7wVw1/fa/2oCnnCCD/hz3xIot7xpltDidVPhVX//AwH0v4e1RS
         kNvYlZKAUfkipUzvJfMd/+0EG8uBPGl46B1orV5SjmQchCwy6RxomWnBnVx2lW0lM8Ry
         7y+C4OxnS/7H/g9XRkLzyl+/lHx2Ejav/9dTF/Z3JOWVYODcfsYheOHs9DKxLhdxYOEp
         uJdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782419955; x=1783024755;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wQ0wPa9pi/vo3Mf8WPQJr0IWTIlooFDEEgQnkHn1StA=;
        b=V7x2sxNMvlSDf6sHg0AeYsseWveYo1PTT8nqWVqFmS+yLPlFaQgR23svxsLDXCDTWp
         4gk8m+1gDiZ2GQk7NdwjI7qYJ5xc4Phr897bMX/DsgzSlfZLwhcB+kZPavNXCZLIbj/X
         x1RDYzEb8tPCtwOqsC17X6kM+AM+0SA3/CQjkvadPWlJG0ZgBI6MzKF3u1Ab5KlFFNxa
         jrpCWBfVCScr9Df9VuWwvNqn/FBff6jPDDylDh3eig6hBBMgHh6f9cshT5TJ83ngwPLE
         KfEsj9YL4cwAn9qMDmJnqDLydySli+ODdb+2mbGECj0LT3wAhwyqHbZb1n1UCanGOh5t
         B6Jg==
X-Gm-Message-State: AOJu0Ywb6Gzrq/Vnq9zpfigl/GpRIQm3fgeMXiv8AJGNpxn+luPqjACh
	ZEx2rR8DmzScxPXRJpg4Y9z6YZDoCg8oZ6Bss89pnW44lDDD76cYbZsWdD7SLn8hAD9chWAIrXj
	kqnBEQWZdSvu7P3DnnQIwGaq+Aj3BLDa+qJPh74WWRKrFONWO0s0+Wt/iRwoqvwrbVwPJ
X-Gm-Gg: AfdE7clVXT8dxRCQR/0nATloBejb2zCgg2XdY2q3R6T9EaE+gxHnuT0zAiWAM/bHsUC
	zMOXqkuXJuhneIWTflJUMRFEXvzBwhy11xneWTGt0xBlwCIP7/ILcsihtFAjn0/5omvP2Hckxdi
	tpm6vieJ/NAYDxLm4cwypml8zecUywMgSD6ofja5Wx7XkKlcLpPBNTDc/pE54taLZ2lxbiY98H0
	nfcEa/uvdj5iRy/jxYMRVLDtPWAxkMxO1y+81DGzJpmOTmfGUPsf7O1rnbUbt3kzlbKxyrGdict
	C9ypdlLJtmnVDNd2ZDo3f8emWybBLtW2rCCIMlYY9sEI0+bGoXx4A95PZs0E//BUr7LkxtaQqKx
	jbewTYvk1+9nHMs0OwRq5j2dzZ2Dm/vohqSH5Laei8yc0UDDx
X-Received: by 2002:a05:7022:ea21:b0:139:8172:76b2 with SMTP id a92af1059eb24-139dbaa7203mr3356182c88.21.1782419954625;
        Thu, 25 Jun 2026 13:39:14 -0700 (PDT)
X-Received: by 2002:a05:7022:ea21:b0:139:8172:76b2 with SMTP id a92af1059eb24-139dbaa7203mr3356150c88.21.1782419954100;
        Thu, 25 Jun 2026 13:39:14 -0700 (PDT)
Received: from [169.254.0.3] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139d8ddcd34sm10858623c88.0.2026.06.25.13.39.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 13:39:13 -0700 (PDT)
From: Matthew Leung <matthew.leung@oss.qualcomm.com>
Subject: [PATCH v4 0/2] PCI: qcom: Add PCIe support for upcoming Hawi SoC
Date: Thu, 25 Jun 2026 20:38:57 +0000
Message-Id: <20260625-hawi-pcie-v4-0-1a578603cd86@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAOGRPWoC/3XOTQ6CMBAF4KuYrq2ZtlDBlfcwLmCYSo2CtoAaw
 t0t/kRMdNPkNS/fm555cpY8W8165qiz3tZVCNF8xrDMqh1xW4TMJEgNMWheZhfLT2iJGy0iFWM
 WSUAW+idHxl4f1mb7zL7N94TNCLwajs5tGGk+tdL6pna3xwWdGH/fY8lkrBMcOGAqIAVtlhSva
 +8X5zY7YH08LsLDRqyTE0CmU0AGoKBkiRpRKsA/gPoAWnxdoAJglEgSyE2u6BcwDMMdHgq69lI
 BAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782419953; l=2300;
 i=matthew.leung@oss.qualcomm.com; s=20260428; h=from:subject:message-id;
 bh=i+0AAz3WDNLaIrf5TpMkoF5mSyPu7bbMM7mmjXJH9WU=;
 b=lpd/QUzmVBs06zOMfbwXTuUN+pgdY32SFFRwkrj2d7jUlld75+y3T0UpNWu1IAERG6oXsorxZ
 HIeMqsU79MmCuB594dOWZ5KNSnWZ+cU5vywiacdnBKqQS3C3jSAEtXr
X-Developer-Key: i=matthew.leung@oss.qualcomm.com; a=ed25519;
 pk=aT25ggJo5PMHLN9N+TsZ3s/BVU++kEYuiFebPWe21+o=
X-Authority-Analysis: v=2.4 cv=cqerVV4i c=1 sm=1 tr=0 ts=6a3d91f3 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=1XWaLZrsAAAA:8
 a=yFGAn9Q8HXAzXJEDlGEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDE3OCBTYWx0ZWRfX99IEF1j4HO3v
 kTrblYULoikfRkwe3e/4jYnyExXq3rxI/TxLf2/exmNG4Fd7nOoEasfV51icjKjln+E4lFF3Yiw
 OC8/kHXCAnV5eK3zvFFsIK4iptnB+iUzn4dSPX3aWfNVbTGr6JFiv3LSJeL3xQNljRHrfG2ljYS
 3j2B5sFhY58xI0LUrbVo3IhPpcwc1OeeGo7j3OtD5wVG8N2lBYDT1z94nKAbKi6qk77WBtYw3uJ
 +YbNcZxR8os3i+H4FWllhDbpkdfsdkrGe0gXsxeZNNmsnBEa5pFePPRRgjq+MhgR1qgu0gXHrF6
 1vDGLVxVepu/PxhZZUWj96VX9NxEqsCNk8qiieCLDTvl1t9oGtBK7vFp8Lx9sgL2VyGcylqae3w
 YmDSvfxnqqMMNcmMCPDOJFQJ6jO7KJxR51f06GiTyK/coPf3t7HwvGPhkQ55akH+B3H35liwZir
 E0f4iFUpPco6xZH/Rtw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDE3OCBTYWx0ZWRfX6/HJdbTsSjZt
 vYHojIYNHCKk/oAVSbV5Fp+DtUb9yTHrCUxhfFitpTnKN0/GLU98R4cmk5CfeEDd1k0tahEVsVW
 W83V9Pz39gzvxVnIjp4Lcc0ixjrKlAY=
X-Proofpoint-GUID: f4g4B5efkdO96kn0Qr_wdwAb6fkp0QXH
X-Proofpoint-ORIG-GUID: f4g4B5efkdO96kn0Qr_wdwAb6fkp0QXH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_02,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 phishscore=0 priorityscore=1501
 malwarescore=0 suspectscore=0 impostorscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250178
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114573-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[matthew.leung@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:bhelgaas@google.com,m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:mani@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-pci@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:matthew.leung@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[matthew.leung@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E016B6C88E4

This series adds PCIe support for the Qualcomm Hawi SoC. The Hawi
platform features two PCIe controllers: one capable of Gen3 x2 operation
and one capable of Gen4 x1 operation. The first patch adds the device
tree bindings documentation for the Hawi PCIe controller, and the second
patch adds driver support by enabling the Hawi compatible string in the
existing qcom PCIe driver.

Signed-off-by: Matthew Leung <matthew.leung@oss.qualcomm.com>
---
Changes in v4:
- Dropped minItems constraints from reg, clocks, interrupts, and resets
- Link to v3: https://patch.msgid.link/20260618-hawi-pcie-v3-0-f31880bfb3ec@oss.qualcomm.com

Changes in v3:
- Updated binding example to use ephemeral values, removing cross-tree
  dependencies
- Link to v2: https://patch.msgid.link/20260529-hawi-pcie-v2-0-de87c6cc230c@oss.qualcomm.com

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

 .../devicetree/bindings/pci/qcom,hawi-pcie.yaml    | 196 +++++++++++++++++++++
 drivers/pci/controller/dwc/pcie-qcom.c             |   1 +
 2 files changed, 197 insertions(+)
---
base-commit: e2cae00c05d196491c318196792297f2dfbaa02c
change-id: 20260506-hawi-pcie-f61435ca420c

Best regards,
--  
Matthew Leung <matthew.leung@oss.qualcomm.com>


