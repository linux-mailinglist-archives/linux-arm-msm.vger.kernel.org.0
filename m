Return-Path: <linux-arm-msm+bounces-111757-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AJZGK4CFJmoGYAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111757-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 11:04:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 21384654588
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 11:04:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=aideAHVE;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ZbBgFDwy;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111757-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111757-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BA7763035A93
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 08:48:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97B0B3B1EC6;
	Mon,  8 Jun 2026 08:48:27 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB37D3AFD1E
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 08:48:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780908507; cv=none; b=bVyYuKo8/GuOOE1vEwcStbNI7K/sbzC541Evcc+ZWmeTNoA8GQCACc08rbxJXw6YcGwNC6R86zY8FaqQ/wVVV2ob37d4JwD+S1D2AGCK1ETcKsIPz9vrh7wLOf8GKBc8kXEAeq8icCf4kpjngXZ+yD0HMsi0Dmdx1jeYYaJH41s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780908507; c=relaxed/simple;
	bh=cdsPMqfeWD35Ac1rhIkKLbMsGtZjV2Cq7h7n1rY1KCQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=p+ambCOLYnoKBspSMf7XW//AVnPkalvCzMrbeSoUTaFe0aXew8trki/6jLyd433QB7HTp3oHtOY1OrjsrC5rMpKMC1l9oqwchrQQXRi/Sgxp9/0cpvuNPtvyhEcxWEVMTc5FwNuusByrdd6VdBR/IaSAbOq5xl1HAq1Jg0xYB9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aideAHVE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZbBgFDwy; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6586Qp2M2771081
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 08:48:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=2aTHTubIziKVG4zlKxyz0c
	AXqTiwuCicZ1yd32rnqXk=; b=aideAHVEgxtRLrcoemMiLwDOXftCri25RqAneU
	cXk9HkPN8NW+I+qqha55fmAv4ebCTJk/Uqk9udgFdQYUYsodKnGfuFCxLUCJp9v4
	tIZG8yb+TnJYuYSMBktwyLXzuiSp/gi2+BbtynZFr+IjG6wWCl0Rd/5wMq2uv8lf
	snvrbkFbg+i3mpQU0oPMDoZORf+17i+3ZT4QnHHmj6CgRR3ySpGnq9OlodjObvct
	nj9Jweo/h0FyqFF5vepo0wLzaNiFEFH05NbYzZNFTiu7ngvgKF5YjMJX+mWqjONS
	gj5K79eWV96wcNhhm3iYbHtXXu5JKBhDY8SVfstAR23vjiQQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4embx6etu4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 08:48:23 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-36e09ec696aso7000481a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 01:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780908503; x=1781513303; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2aTHTubIziKVG4zlKxyz0cAXqTiwuCicZ1yd32rnqXk=;
        b=ZbBgFDwyhYspPF2ipxWOgrdLFqpa1MxivIXRA5zgN+LVzjC4yngYlbmrM03N9RbSYI
         eqfcxiconHCl5HYi3eq34GnB1TPTArNe8KwluI64ZodcVRX8FkzApmkK1CxlMrFpKmui
         na//EUUh1dyp1LEZBt2BmmjPrV/qX+VNaMNB8JRo6N5GF7Z4lhPRuMs4AZWn0V9SBENT
         DTM/wHzzY7iNcRloQwtEMyiDWk9LT60Afvfr5zfMPzsZTtMqsJSBTzepoA6/5Tsy1RfC
         KlnC8Pf1zlO2mKnsR5wK05j7oVf3SKy+5wK+xqp9yAFOxfXj6LEMxR1wW8WJEYjzABkg
         0wGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780908503; x=1781513303;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2aTHTubIziKVG4zlKxyz0cAXqTiwuCicZ1yd32rnqXk=;
        b=DlW3BE5nEhBMjnpuEJ2TskzfXbFvVI+sBZOYp2LHwvJJdjJjjVmw84E9VBxrqdU/FN
         64UWWNqK27A0OE04V8a4IoIiJHBeOT+6RWI0w/FhIe2TzVZZCOIQwOHZn/8K65IVCO8s
         OaEpDRnwnDv2NHqeTglsdTVZ8PnLQ0G/odczfbxcwqsYeuYbGN20FL9GOaXAJIhnONN6
         2UCVmMaU+NVwznKqpUEWd+e19FSe1V0d2Hm8UI2qoTzjJPADf2rG4pUho4/uxODjLa91
         MtFj5GtAOarv1FA+58Gu5yjSh/SbfuDQ+26jv1ZwztSO6iWsU+fAN/BkPByK9UakvQNh
         8jJQ==
X-Gm-Message-State: AOJu0YybzsJE7yDXrvpo4SYImb5jyl5eS+0O3eF4sb5Cd693OFzO5Lhu
	iKqv4Rl2Kh7O+4IVfQG2SVIBnd0voveMBOl3a74CM+F/AdMHzvg1j9X8yV8r+3lcRiMrn/hYR3Z
	FBpNtY2hhvECx7gY+IdUWDS+n7u3PzfwQNVIHK84bt4w/0D1MaLG9FoLpfVCc0qmgny2k
X-Gm-Gg: Acq92OGe5PPoD83g0BXGJT7ZlaCM+9B2eaZH6EGs+cHKun1OkYQe5UQumNsthvE/c7X
	MPlJ1ksyAfHq5PT33H6rHe2fRHBMUZ7Vd7gW4zz4esJKQXjdl+TZebwlVNWXIDBY9xCaYh3rTL/
	rPVnUIUlw/MAG5QHQNTe25fnVExnVSq0uJkaxYieJWd6IZti4gt0wdpICc+qOoHAXt5FVCNjull
	ZoTup2i/JGQ1T1vko9Cbox24wxv0XErTablnSXyVOw0iDIvJZZxU58CgqOd+DKIbH5tyhXvS82j
	ohjR0FvFJjez5yc1RY5FJuYcWNRkc44fRcS/q34fAKXNXdkw/hL0ZAiTz8UOjQf7EVlR2gg33Ej
	X4DsDS/7dYmT26pBQi8lqOWug9vQ0FHxG39HgOOs6xo29WT+ytZoCcrF1XiBFxKFHYWI=
X-Received: by 2002:a17:90b:1d89:b0:368:ea0c:1b75 with SMTP id 98e67ed59e1d1-370ee82fe25mr15451776a91.6.1780908502808;
        Mon, 08 Jun 2026 01:48:22 -0700 (PDT)
X-Received: by 2002:a17:90b:1d89:b0:368:ea0c:1b75 with SMTP id 98e67ed59e1d1-370ee82fe25mr15451729a91.6.1780908502386;
        Mon, 08 Jun 2026 01:48:22 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f712de91asm15070198a91.16.2026.06.08.01.48.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 01:48:21 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: [PATCH v3 0/3] PCI: qcom: Add support for Eliza
Date: Mon, 08 Jun 2026 14:18:12 +0530
Message-Id: <20260608-eliza-v3-0-9bdeb7434b28@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMyBJmoC/22NzQ6CMBAGX4X0bAltKT+efA/jobSr1ADVFhqV8
 O62YPTiZZNJvpmdkQOrwaF9MiMLXjtthgBslyDZiuECWKvAiGa0yHJaYuj0S2DgjHAuoKooQWF
 7s3DWj7VzPG3spuYKcoxyXLTajcY+10eexN3W5JR8mp7gDNelVE3IsqpWB+Ncep9EJ03fp+Ggm
 Pb0JxfZV6ZBLpo8l7WkTHH4Iy/L8gYx+WBt8AAAAA==
X-Change-ID: 20260427-eliza-e53155ae8821
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780908496; l=1742;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=cdsPMqfeWD35Ac1rhIkKLbMsGtZjV2Cq7h7n1rY1KCQ=;
 b=ecrik45mYwX77ErSUKzG8xA3oHBydDoNjh+Dyt1/LxNH8+i5JjlSkyEgZfViU7d5S6sgMQMf6
 Ju9syZl1cUwCc4e1Wh/vrygWyWiYrecOUYAYVTouvVPE0NX9TjeN5J9
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=cvmrVV4i c=1 sm=1 tr=0 ts=6a2681d7 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=RZHP3SvTWnTKgiXxB68A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA4MCBTYWx0ZWRfX6MsqpftrCVJL
 PEelYsnZim7DUsjndRmGFuaKXHJB6Rqvs/tSedL76Bx3K0DVZfnL5V5KeLVsE0zZ1Vok0y5nVYe
 FSc5OaGL/QsGVn92rgmzJRD+RBVVLCYD8qw6PT4EvqcvWs4ciz5ycfwCJJ2fuGtLfDLSdY1IFxG
 FJTIg+fNdB19fzaYUjgpN3tUVlVc4ucJShXj8MP6NSGqlFBDyRigBa51LnjRShhT4VdYmHbI7i5
 oRU+zUygZcT0ZdPDFnPP1/I9ZjtYl3VlHBNZHlFW8OOVOp/cdyD+eaS6wj+kGh08d2IO+G8YD5l
 aVPF4+yMf3vcrOHVdnJwEUYOxoM0GjPiC3xOlB2ksOaEG2am1oxat+oBm6p0jzEhttGYF+D94pD
 /rnBy82Iql0hvb0KjGXd+GkceeDap69tZHmgLfTOsE633peTivP438Ur/oX0wQfXcEr6WY1hGqv
 ZFIP8ypkSVsP7cBdnzw==
X-Proofpoint-GUID: N4s1M_RiY6E0NlkvVtZegGWLuDC4mjZM
X-Proofpoint-ORIG-GUID: N4s1M_RiY6E0NlkvVtZegGWLuDC4mjZM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 phishscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080080
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111757-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,msgid.link:url,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:mani@kernel.org,m:bhelgaas@google.com,m:andersson@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pci@vger.kernel.org,m:krishna.chundru@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 21384654588

This series adds PCIe support for the Qualcomm Eliza SoC. Eliza includes
two PCIe root complex controllers capable of 8GT/s x1 and 8GT/s x2.

The QMP PCIe PHY support adds a new Gen3x1 PHY configuration with
Eliza-specific initialization tables, and reuses the existing SM8550
Gen3x2 configuration for the x2 PHY instance.

The series consists of:
- dt-bindings for the Eliza PCIe QMP PHY
- dt-bindings schema for the Eliza PCIe controller
- QMP PCIe PHY initialization tables and configuration for Eliza

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
Changes in v3:
- Add allOf constraints for eliza (Krzysztof)
- Link to v2: https://patch.msgid.link/20260601-eliza-v2-0-6b44c9c23d5e@oss.qualcomm.com

Changes in v2:
- Remove the driver patch and instead use compatible of sm8550 just like
  kaanapali (Krzysztof)
- Move all the phy settings to lowercase (Dimitry).
- Link to v1: https://patch.msgid.link/20260521-eliza-v1-0-97cdbe88389d@oss.qualcomm.com

---
Krishna Chaitanya Chundru (3):
      dt-bindings: phy: sc8280xp-qmp-pcie: Document Eliza PCIe phy
      dt-bindings: PCI: qcom,pcie-sm8550: Add Eliza compatible
      phy: qcom: qmp-pcie: Add QMP PCIe PHY support for Eliza

 .../devicetree/bindings/pci/qcom,pcie-sm8550.yaml  |  50 ++++++++
 .../bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml   |   6 +
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c           | 139 +++++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v6.h    |   1 +
 4 files changed, 196 insertions(+)
---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260427-eliza-e53155ae8821

Best regards,
--  
Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>


