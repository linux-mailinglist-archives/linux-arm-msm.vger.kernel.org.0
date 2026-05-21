Return-Path: <linux-arm-msm+bounces-109105-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wA9BId8fD2pSGAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109105-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 17:08:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DE2A95A7EF7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 17:08:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 577E13061C9D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 14:05:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B79562EA72A;
	Thu, 21 May 2026 14:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I31eoLTl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XqpjpQo2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4826F2D77F7
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 14:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779372341; cv=none; b=rxMyd8HHET+TqirRKmt7AzOF8vqxrNZjTSosUBznopvjLVDQVSB7OUhLrn3RLLYQqXYEi+OVsdH38KkAev8Rlo0mgbzW9Ar9fvGH82LNGaSfFnFPGK3ohhkJtsHPDbJolMqbWmXGFJjplCPsb8gHTyZU933oGI6LYA6Jjwl6oNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779372341; c=relaxed/simple;
	bh=O7C+WAshZBT5qe7BGQyWLbLRGLqNcCFqdNXx9ENZ2ug=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=VVfPVtJNIKyboGP+pjj0LFcY9rGQd/qgtdWcXsukiytUiyqCjmDrWQ3ChlXTW3SY5AO+y8ac1o8USzXqulvbjPLTRf07Q8LdmpfP3on+Xf8GXJRIEwAFoH7pXXy3bnr3yJ2Zs6deB6u7GOQ/K0u1W+ThNK5ng4e7cLkT4YTLYcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I31eoLTl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XqpjpQo2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L99hU53527248
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 14:05:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=3OTRDFg5JhaU43k+bSlIH/
	IJf6yxe4CHmbFjPGs2lIU=; b=I31eoLTlZxSwY4D7eKvF9DrRGuKU5fS9wyoXER
	sJ/5uko/s/wbnZ1PxNzVEqsM3rxLAj8yrUU9CL973njaVGN7Djqk+A/aym5y7YLC
	c1a58MtksLOzv1/NUABWuu3yx6q28MIDk1O3VckAqHr4/TpnHU73jbaU3Xeb048y
	DlOjXUTId2e7ZY7iTflLckcfhXM1mLrzUPVCsF1wXmlbJ0oeOjvpCvwD6V0eERi0
	mqDvxKW6HGYTF/Ml4sfF1/2e/4ltCofwNgYNb7ORZq8AjRKFO64hZ51epQ1mzZyb
	SqJYzciWuh40RoTt4Yb6YN8FO0ssS9sRQfDemLKcexGP0HvA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9vhbhxsq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 14:05:39 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2babc42244aso148205805ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 07:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779372338; x=1779977138; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3OTRDFg5JhaU43k+bSlIH/IJf6yxe4CHmbFjPGs2lIU=;
        b=XqpjpQo2m5qvzcc4Q/XDDgw2sP0OpNdg8MjMU/XTMzyLonAiCUVjQFGWszvuGEMALh
         8UKp1A5xkGXgD71QFYUTRqg7VJfSwsPfA5UGhIbjOI3EPNkmBoAZbhZyM6OueBd4vKxP
         DbfcHLXno1YblKi4uhO3OhfLZ+6rhaMSWj8LIrJ8ebcBV+xDyjeU0UK+AKVR5PveZbn+
         7fazC8bGxcOyxz3rWMaK+OcROoXm0AqUdmNSQxhbP8DYUHFnU1JGSI029BU/g6VUy1aZ
         0yQN04+dpLOhmqsqvJsxXmHrDZGYgRfi4oXGcG+C5OvpAi8KJlmwH8hqfHMxk1TU8gDL
         nX5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779372338; x=1779977138;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3OTRDFg5JhaU43k+bSlIH/IJf6yxe4CHmbFjPGs2lIU=;
        b=e5y47A/a7ucs/kc5/rADarKk+YXXmLDRRNZmLeOqj9hE5hzPVMCXBOEM3DjHOVk8+A
         2D15k9YEUq/f/KX55Xocb+NDJpkkanje72c3vbxQ+lPOq8BsEJSv3he1J1NEvGIket0V
         1ixGvsvHrKFk6o2ecb6Jg+Y3YXq9DsoylkyUUDrYjtNwW5UKZA379NKGPg+Dkv5OTnfY
         Yc9PpUPpEf8UpxqmBqPilnOBvJ3J9efYauW7358cc2OMhZKhthUsYKbG78nPC1qWlFlb
         u/ME0xYd+XtiPvXejEj8GgdB6InlOjVRknT1VrhVigiTnsmyBUP9gf7QwBY4uTYBefQ0
         zPZg==
X-Gm-Message-State: AOJu0YzK1goMaUE+5ziB5g2CXmho+NryzQV+YMWgaWeOxpGoomRd7DiW
	H63hbCOvZq7AFnqRYAEatN9J62RlYXIkVFz+sOwILsS8If+u8eLZlmjlq2z5C0AoyMC+h24zLcQ
	nS/sC5uqBe9o9eqF0qHl+SMFtP5X4lWgnh5tGJb5kmR4l5Oa6r6vxEMRC5IWlnOZASHhW
X-Gm-Gg: Acq92OGpQTquWQtMRnDhwj7c2ZzdJkZeJcLXi4mkwnHUwzDnfg6HexBTbI7QCUkpidK
	gwaJ343xflexZDi7PBwIcZ9kcbLpWtFH585+R6mW/ThUpYWPuAjEHOucI/9TdXKCElQpEtond8/
	rfMnZryJsmv5upjNTbcEmiTq548souD729DwLt5sN32+uii0styp/c6pSghPOdxdkOGUX/vzZdT
	4PF7rL+czlj0oKZIiBN71ztuJtg+/M23OBaj5SNhQ+4PQDYgPeYkKVa9bKlONIjP0Wo2yUop57L
	gHLH3Pwh8+tgKBJYNy8UzcSBWMuYCtIuj1hZcSDToCMtroDB5ylto1lpyz8NKC1dJ+IbvJLjlya
	KeZe+bNo71pDRlMUr0E2tkDVlT/jAgqgsip9UK1veLTj9tSSb+1YPl3CQ
X-Received: by 2002:a17:902:d551:b0:2bc:7d1d:b677 with SMTP id d9443c01a7336-2bea33abf63mr34891305ad.36.1779372338091;
        Thu, 21 May 2026 07:05:38 -0700 (PDT)
X-Received: by 2002:a17:902:d551:b0:2bc:7d1d:b677 with SMTP id d9443c01a7336-2bea33abf63mr34890605ad.36.1779372337563;
        Thu, 21 May 2026 07:05:37 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bea9287997sm13189765ad.24.2026.05.21.07.05.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 07:05:37 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: [PATCH 0/4] PCI: qcom: Add support for Eliza
Date: Thu, 21 May 2026 19:35:28 +0530
Message-Id: <20260521-eliza-v1-0-97cdbe88389d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACgRD2oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDEyNz3dSczKpE3VRTY0NT08RUCwsjQyWg2oKi1LTMCrA50bEQfnFpUlZ
 qcglIs1JtLQCRIcRQaQAAAA==
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
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779372332; l=1529;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=O7C+WAshZBT5qe7BGQyWLbLRGLqNcCFqdNXx9ENZ2ug=;
 b=qL6upoywstmBHfEA/kiZY/0E1OCxGPxyH5TmL0lnTocWoJBsNk0QQEwjSWCA4ZdE4q5vbc/dw
 BP2qsvW2fqnD7WGsvOL+X0cDgwsAeSxb0W4TQitGgfNk2ublP7xS5hw
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDE0MCBTYWx0ZWRfX/+81R9YN9LDm
 EbYkbUnZ6Oz6gx7NIo/lN+ijJZDMygXEsk1bwaMgpqDTCotK0pu3ANXgmKgz2JXcP2U5ASC75J1
 e/ocSjw9BRc4vMxeFM5owq5yKF64W30WI695jz8A0KXIEAa97f76HwpniG71qAgM/Kyq6bStuyy
 2WJm0yX/qCTi8Ho5bHtHIvXVL1jFymuukp9VZRFulIpWE4fBaDDK4VMKV+PyvwVmFYfVo6e6umn
 kagrgUc/Oq59l+u0wIJqC4UGFM57JWcwgFUkzqKwiRNE4hxfMO2yccPUrs1WPzS34KIQzm5lkA5
 F8+d3ye9E8qVy9epqhFj/zOxEhwcxRoMyxY8pDPoq1agGPdqzDnSJJkXBnkLxHkIBiPZ299jsNU
 OPFFPzHLgl4z97sXGshlZYtau7vSYpjZPSH9YtUrI5W6o+8ctWzaVwj+IJd98XyxmhTr1ZQ5iwW
 /wM40hvgR3RmGiEUtMA==
X-Authority-Analysis: v=2.4 cv=GYAnWwXL c=1 sm=1 tr=0 ts=6a0f1133 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=KRKipztoQesxEaMeAmMA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: fwKQi7ERIfUTY5FzbR7grCcap58h1did
X-Proofpoint-ORIG-GUID: fwKQi7ERIfUTY5FzbR7grCcap58h1did
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210140
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109105-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DE2A95A7EF7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series adds PCIe support for the Qualcomm Eliza SoC. Eliza includes
two PCIe root complex controllers capable of 8GT/s x1 and 8GT/s x2,
both using the cfg_1_9_0 configuration.

The QMP PCIe PHY support adds a new Gen3x1 PHY configuration with
Eliza-specific initialization tables, and reuses the existing SM8550
Gen3x2 configuration for the x2 PHY instance.

The series consists of:
- dt-bindings for the Eliza PCIe QMP PHY
- dt-bindings schema for the Eliza PCIe controller
- Driver entry in the Qcom PCIe controller for Eliza
- QMP PCIe PHY initialization tables and configuration for Eliza

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
Krishna Chaitanya Chundru (4):
      dt-bindings: phy: sc8280xp-qmp-pcie: Document Eliza PCIe phy
      dt-bindings: PCI: qcom: Document the Eliza PCIe Controller
      PCI: qcom: Add Support for Eliza
      phy: qcom: qmp-pcie: Add QMP PCIe PHY support for Eliza

 .../devicetree/bindings/pci/qcom,pcie-eliza.yaml   | 165 +++++++++++++++++++++
 .../bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml   |   6 +
 drivers/pci/controller/dwc/pcie-qcom.c             |   1 +
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c           | 139 +++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v6.h    |   1 +
 5 files changed, 312 insertions(+)
---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260427-eliza-e53155ae8821

Best regards,
--  
Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>


