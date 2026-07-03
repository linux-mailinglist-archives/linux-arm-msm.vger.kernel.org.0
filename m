Return-Path: <linux-arm-msm+bounces-116306-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vjHACfOnR2o4dAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116306-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 14:15:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC5370243E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 14:15:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=QsV1Vm7C;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=IEihPR1h;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116306-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116306-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8731F30C7029
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 12:09:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D7D23CF673;
	Fri,  3 Jul 2026 12:09:03 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B740B3CF688
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 12:09:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783080543; cv=none; b=a42p1qqiSotX5wOmNQdJyKNiuFpyKlo2f8Nlckp20eCe4BluuZQLECy6CoIPfPUJhjzJQsVU4GsiVfLJBjQCRzPb2SkkeVEjRShkjW9XD32hQZ/SXLXnX2i7VzNowGXZ8pqFcSlF6s0KbERu88BR3/4r5vBDaICMMaQZ1FENJUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783080543; c=relaxed/simple;
	bh=RLQd+8L2duBjcipyPTJw+yVMnJfcWltw5Gg8I61tJk4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hM6fuotlkoXO/wlWPyftI598a4WuD+vh163n04S9EvP+nJZfImjX0idNE01SVg9R6mCw+P6O024hQNmKDIy6SygdmCZVhztAQWPW/ls9r2rb4RnFgVr5Zor5sGGyUl8OTECnuUSP68THAEWUi1VOIQag5GWqYgXJbr3JpkpMBIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QsV1Vm7C; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IEihPR1h; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663BW06u3127066
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Jul 2026 12:09:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KYQhHF4yO5tQSQmCplJ7wLXwhEcx8usic4R8j8a5X2I=; b=QsV1Vm7Cv4qlZga1
	+JfGWGDdpU92l472Nr+xVk+5E6RpIa5832TKX4ZoqLhWyooLRd0cdtMwDZevT3l0
	9HnDWw+Rw5gQ2T/WVLQa3+V66NWv3f3rcZ/52qes+4i2s2zdM4kGCO2DbjqOXZMx
	iFoZQOzYmlESetPB6tT9aUdRtXJnEPKP2rZJxEs/cKtTWLIB+d2LnEkkgmEZIpS0
	FEI8BsC5Nu4BhaI0cRjcGuT6UhOcXM452TpoptL7inzNpkx/UClo2MfW/gU+TbZs
	fDZFEiqN7jE7eA1jDNzsk2seyWQmF0/igoua7fMA1taVsfGd4s4WC4nKTdl6MWOX
	PSevGA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5tpnmcvq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 12:09:00 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c88e0f04e51so603227a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 05:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783080540; x=1783685340; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KYQhHF4yO5tQSQmCplJ7wLXwhEcx8usic4R8j8a5X2I=;
        b=IEihPR1hwm2OuBcHzmUfN3gnKSwssZWJ4HseBd2Bg4VO974s3u7RabqZmRASI5doT9
         bvuEpR8e++S8xODxpWjZ6perEeB6FIsVX+xh0ZxgsBLU25lLy8qFUtxoJ0DK1XlrvptN
         zwQp4MZ0uQ0R/olH2F4/qR4fsJdWajmqiJ/KWmEtSVYRhpOe1ljqBeTungSYLM6gTOpp
         MDAIEylAirb7z7R1A9UjwM023/TNg8xAuEM8ie8a0nyf7LoyRRb+gpFRAuNm0HVlJGV9
         hXPF2CJk0IXZYBLcXy69lvFpqTLWsxnH0phCap10psmMLoZ9ogq6Q5G8jzlKaf3/xbWa
         4Mpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783080540; x=1783685340;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KYQhHF4yO5tQSQmCplJ7wLXwhEcx8usic4R8j8a5X2I=;
        b=TF93u/jeARIdfftVyxABEbdlXE969//izp75kSUXtkAmnF2/bEArCok5aycBQEJenH
         ztEQjV3emzzROy16aNolz8BqITkuHIKVnZ/DCLgzAJAy/iqSBy1gYGPDkCOVCf4YJE6t
         KdP5mmOwmJOPM7soZHDc3SCW4M6IuFnB7sei9ZpA8Xx0L0DXyaP6Dprx1lcBZA2HQFWz
         R/sL8srKZ9zacyfCFaDKCoHkdvrO8xC0Y/9ErOGJniJgEGZLZUgDoDRhcpBm6YwJC+XL
         lbrLWu8NIhFUWBJiowGy4rPkgrNusgDvgt7MJR4rtSep5wJZRB/M4U3PD4d4jfOZuAdE
         /JQQ==
X-Gm-Message-State: AOJu0YxuXagkWhU8OX545tIMC2XMSD8MUQvnx6NCFFGpnk6I2m/6tiZ/
	a7oLk0AOYswDifS6EmyezQXvbaC0DCwkZExDQb/+GA1ZfXZLN7W5BS7nAC/9Jm9RjWzox93ZJWS
	Kq6QO6QiUaKXoJrnhG2W4gjyNW1clM7pLBhx8+9hiB+OsgWK05THcIDH6czRRaxHahcCz
X-Gm-Gg: AfdE7cl5pJ4S8KLe1KjZcl5QBHWjFkPZA4GaDN3xlogEfTeLOPMs2lzMnpq9x38HVan
	mkGw37Fj+DFv4LQZYlbgQ2Lp+7hhNiWrvpfmq6pTghDI0RD1oP5XHl1bpOH/XOk/xxUnw+dlRL+
	BjIN/WnoyxmZtyRy7Bx2XN4MH8L+9unxyJviDKiyqTbjM7bhRcrni+UKvZ/Gn0F98SuK9qVTmgc
	IM1/77gHnTgysguZmrRSJhH1J50y3zaUcCRYaMI2GYvka/kbzQEpb8sY6rETZJQWA13tRC+xcrF
	Ugq8wgcdG8Y/258XqASoRX+Qvdqi9G/HjRiIIGlvIxWv2vE1urtQUM+opigw3br1AYfTcbU2ArU
	WQRXT5yhrbREq6m3uNY91icQXBelJi1g4vl4LZBHLi+wyDTfo
X-Received: by 2002:a05:6a21:6f12:b0:3bf:7498:9cd1 with SMTP id adf61e73a8af0-3bff42b62a6mr11392369637.45.1783080539644;
        Fri, 03 Jul 2026 05:08:59 -0700 (PDT)
X-Received: by 2002:a05:6a21:6f12:b0:3bf:7498:9cd1 with SMTP id adf61e73a8af0-3bff42b62a6mr11392323637.45.1783080539153;
        Fri, 03 Jul 2026 05:08:59 -0700 (PDT)
Received: from hu-vpernami-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c9e8eb10638sm2530779a12.2.2026.07.03.05.08.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 05:08:58 -0700 (PDT)
From: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
Date: Fri, 03 Jul 2026 17:38:41 +0530
Subject: [PATCH 2/2] dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Add
 Maili PCIe PHY compatibles
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-vdev_maili_dt_bindings-v1-2-c9df0916cd5e@oss.qualcomm.com>
References: <20260703-vdev_maili_dt_bindings-v1-0-c9df0916cd5e@oss.qualcomm.com>
In-Reply-To: <20260703-vdev_maili_dt_bindings-v1-0-c9df0916cd5e@oss.qualcomm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org,
        Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783080523; l=2267;
 i=vivek.pernamitta@oss.qualcomm.com; s=20241114; h=from:subject:message-id;
 bh=RLQd+8L2duBjcipyPTJw+yVMnJfcWltw5Gg8I61tJk4=;
 b=AxTvxvUKlTazRBczJfhkLqI1ilqpqocvA9VMTCUBo2s9osBbfUxOMT3rka38QjfODOl0oIE+e
 WPvCvBzZ+5KDt8UxK1zdLrgcZivTo7eslU6Sb4OYKTvlyjQeSoSsiOj
X-Developer-Key: i=vivek.pernamitta@oss.qualcomm.com; a=ed25519;
 pk=HDwn8xReb8K52LA6/CJc6S9Zik8gDCZ5LO4Cypff71Y=
X-Proofpoint-GUID: GvE_AsteDU0InyLY5j0WvQEjR2ouVdag
X-Proofpoint-ORIG-GUID: GvE_AsteDU0InyLY5j0WvQEjR2ouVdag
X-Authority-Analysis: v=2.4 cv=UMft2ify c=1 sm=1 tr=0 ts=6a47a65c cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=DH4gakA0-Fj5Mf9eDRkA:9
 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDExOCBTYWx0ZWRfX4+V9SPggWgFo
 2NhlyLooVA0zL5W6qg+jH+bFVyTgcjTQHT1WMvhezB0CRfwdED/aNh31Rons+caLB5vbgT9rrNw
 OqOwmdpNkKGVjHe+E92Vgs7JrK0xgVw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDExOCBTYWx0ZWRfX5J3bFKEEmMK9
 +rkWdWz8rxL8DopDSaVuUugmXjCwrF6oM84GFlaLEqp3mO3opjvMZWT65ynM2khXCLqCu8B1f6Q
 yIs9GJHZALaQyWCCXeFOCs+8LGQFjPn7y4x6kcLuhSk4AwNEh0ctUOhaKTz7EKcgmPP6LQ817dD
 pDM+3NCa7rUde1jRo6mZzILZzodq+ijeYcLnMZcFFjDtUwMepgU6qJxiLRA6VPtXVhZ+qaCOma6
 DlONRl1tm5uTgKYvzpHLzWmGJu5yNg2g828R5+zdOADIF9zQ+xZvWaMLYhjhdrSeJ+1L3jaxf6f
 DZ/nLxy9sAgkjsGUSyZAJ2dulULIZ8Tmh4bfk9yKkzYlI5KXWdY2GEXjRsT2R0ZJglhCW+WHezJ
 AE5FklBMjd/5loQQQH1xBgF7yYA0CKDjMCeYz7mBDFN1ppcHoY2KobJ72hoMQ3gLXYH9eYKM3IF
 ALKuWF0fUlllb/95JRw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 spamscore=0 adultscore=0
 clxscore=1011 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607030118
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116306-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER(0.00)[vivek.pernamitta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:mani@kernel.org,m:robh@kernel.org,m:bhelgaas@google.com,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-pci@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-phy@lists.infradead.org,m:vivek.pernamitta@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vivek.pernamitta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4AC5370243E

Add qcom,maili-qmp-gen3x2-pcie-phy and qcom,maili-qmp-gen4x1-pcie-phy
compatible strings for the Maili SoC PCIe QMP PHY.

The Maili SoC is a derivative of Hawi and shares the same PCIe QMP PHY
architecture, allowing reuse of the existing Hawi PCIe PHY DT bindings.

Signed-off-by: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
---
Dependencies:
- phy: qcom: qmp-pcie: Add PCIe PHY support for Hawi
  https://lore.kernel.org/all/20260618-hawi-phy-pcie-v3-0-3fa42ca45ea4@oss.qualcomm.com/
---
 .../devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml         | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
index 259ed9678393f12c03535389b972fed0c7e36517..971474526cf97cf333a80a31e8fb13abcb995e97 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
@@ -23,6 +23,8 @@ properties:
       - qcom,hawi-qmp-gen3x2-pcie-phy
       - qcom,hawi-qmp-gen4x1-pcie-phy
       - qcom,kaanapali-qmp-gen3x2-pcie-phy
+      - qcom,maili-qmp-gen3x2-pcie-phy
+      - qcom,maili-qmp-gen4x1-pcie-phy
       - qcom,qcs615-qmp-gen3x1-pcie-phy
       - qcom,qcs8300-qmp-gen4x2-pcie-phy
       - qcom,sa8775p-qmp-gen4x2-pcie-phy
@@ -200,6 +202,8 @@ allOf:
               - qcom,glymur-qmp-gen5x4-pcie-phy
               - qcom,hawi-qmp-gen3x2-pcie-phy
               - qcom,hawi-qmp-gen4x1-pcie-phy
+              - qcom,maili-qmp-gen3x2-pcie-phy
+              - qcom,maili-qmp-gen4x1-pcie-phy
               - qcom,qcs8300-qmp-gen4x2-pcie-phy
               - qcom,sa8775p-qmp-gen4x2-pcie-phy
               - qcom,sa8775p-qmp-gen4x4-pcie-phy
@@ -230,6 +234,8 @@ allOf:
               - qcom,hawi-qmp-gen3x2-pcie-phy
               - qcom,hawi-qmp-gen4x1-pcie-phy
               - qcom,kaanapali-qmp-gen3x2-pcie-phy
+              - qcom,maili-qmp-gen3x2-pcie-phy
+              - qcom,maili-qmp-gen4x1-pcie-phy
               - qcom,sm8550-qmp-gen4x2-pcie-phy
               - qcom,sm8650-qmp-gen4x2-pcie-phy
               - qcom,x1e80100-qmp-gen3x2-pcie-phy

-- 
2.34.1


