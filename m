Return-Path: <linux-arm-msm+bounces-107523-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kMggLCNMBWoIUgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107523-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 06:14:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 515F853D977
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 06:14:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C6FAC305C588
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 04:13:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B7293AD52B;
	Thu, 14 May 2026 04:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qxs3bZch";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LeMuY62y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A3DC3AB267
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 04:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778731997; cv=none; b=DN9gUxyI016WpTbiMDGoegLOgKYQ/xXYsONX7YLLPyyY/NmTjcDBizob1pI5qcz4psdtsfoaPTYnzQ21NvKK1awzkUMbirxD6a9aervEmxH7DydMtIinX+3ou3kvjtkp8xnmk6MOa3pklFg6lJM0KzFT0Tt+l8xtMIJcSDqtvP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778731997; c=relaxed/simple;
	bh=JwW41K8IdkdgFGE2IHpnYGuhMsXkm8hjOGtwlDbRcpM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YIqcTB6UTlHN9O7+V2o9K8cAFi4357x3nItsgccvKcTLUzF8+6aPFVl7ZsdbWVLv2Xp9ih5Kc6riR8rTQgqJ1lU3vMNKCYt6sxZEYpx145nxA8d18KkeHJN0xU5MAvtaytey4FIoYIXu8lZU3DGkSPtdoCx4d4O4OpKlu8VrWGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qxs3bZch; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LeMuY62y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64E2RFVZ2524315
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 04:13:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Drn7srxvV0vFK1yAhzD7aPenQzPVdFLlBpIYOLOBz4A=; b=Qxs3bZchewyCJxYh
	kqnp+jnlp3WTeHVJq3hIiuQkRYsZ1bsFMXkISbWRq9UivlByFhCYRP1jVdZcXidF
	zJ+pWWFrm2vABIsGELi1B5Sd7RbqtO4pxeXkawKuBSQcdLm7RKjFdmWrzezoFbgh
	np5AkAUyA0g6xKGLtQ5LfkcMzZr5FtS92p98PV/5ru1qeKLN6YTZPis/ozz7RBtR
	pZKjTHLlhPs4E02rr4mm9qwPvtMe0rq9MxBB4xMIcd59JJFsThq0oVB1GIzg29ad
	AaudpBZAJAcKIsgV5q1O0Oa0sl2Q7EEM8Uv22T+8HP5QV4AEK6ZQLDnRQjVl0XyJ
	xpkD6A==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4vkjj8fx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 04:13:14 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8353b042152so7549221b3a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 21:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778731994; x=1779336794; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Drn7srxvV0vFK1yAhzD7aPenQzPVdFLlBpIYOLOBz4A=;
        b=LeMuY62yfCol4oJe9gOSCg/zDkagssZ4sL87I9SKRByqgYAepiPHWT/Dv++pZyjXx9
         NTLFRHjzq6tthfCIskSgsDMrdvhOZi2jZt9UWhUQxpGP9MASwX5wchAnUF73tx/AsP+5
         YbM/pLpaRDLeAIy5smpGrKbkPQmpocZ4mzDLDkxdhGIDEzrRQYYTjsg95H8dqvIzLx4x
         gWuZw8b+/gTGgkuwk5bbRYJCPxe6kADrqrlgZMDv3+y39Wg99uQSMy147t/Gb63sm9S1
         yDKsgEP1SNbu4a9bYhQ8VCwsuTST8UdJZx0kAohZNWY5UGsCNbejXALYNlKQhUSujUFn
         YeuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778731994; x=1779336794;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Drn7srxvV0vFK1yAhzD7aPenQzPVdFLlBpIYOLOBz4A=;
        b=TBGjZ6iSnW7PSJ+iZr2ckFQDZ78hICsW66ECoMxyDu0u5UHGuubbsb6VjiIUNitVZu
         L8LpBhtB+NwGrRuLp56Oq8Odd5Wcpyv7R0zao/M53ijiIJ30obEHvapyoTGfoSahUYJH
         81Oaj7BUHV9q0pVuJa0JSblz3hGOIuByudq5JLrJ5NKj80Aiy8Q3qgblBAnmNO9F/Cqm
         oKmJr9HxsoyTnsfyauZOq6UsJictw9wuDNqL2YFSVJ73HxfD+KMNpPvNiZRLrMcqdSKB
         YUIvWCfccxVa/4zUd3CXlbgu07uSDrp7vv9ybRGhZ/4HSuOZF66EwX9uS/OOwViDb+HO
         qZqQ==
X-Gm-Message-State: AOJu0YwRdTPL3ufhh0IIygIGHAg7KqlK38zmNr4GPmGWIAJclLKdB14K
	D0geNpYsJ6icPFor2uIbU5ZmCO7f0HJNRC4gy90PGYezPz34z+aIJPNRk+9ROoQzxZ049KcGdMC
	wkHsK2YHCD1doxqebKFML6Lgnbz1GUjTteseHkT55ghFn3yMHhlebePsWWUNUJs36cKfm
X-Gm-Gg: Acq92OFQtH/8C5BxOqFXiKPR2oXKtDURvAnsCZ0rsrXt2OuUiLcshVV2vzdnYmswz/F
	Mcm9IljVkOV75LXNOYKbB4Abbf0RPSMc2dYHjPcVXnhqiVXDSjtf/FX2++ZA6Dgg+y4kueHCRHa
	8R/fMOlTC6eJqQ58DXcz9QiBe65ORfjdN5gIAYiFGKxtcCzh5v2+HlBJawTjhysb6wx8MHCOO/U
	2SQdIRiSY/6M6Ve7sflWLrQJmOxcNlgyV3IZd02KqUaQmnJpDt06Sy2DQVst8Eeoiz+h73uVCQM
	A7jyIG3vsHjQbb4SjzNPBf2pczetlRg0mTmXPLXlhmShPG7C6sYMJ5MqNibPfQSk/I0GGGQ8eP0
	8SkNMT682yGrl+3gBI9s+MJsPxkMPFm9tFYVPMda0Q3LoBKk/rESHGKquUAaQlfbHHbs0ARqtSn
	FVsINYKCJJnc9142864aniHG2XtdRENvt/RQbbybF2AJ8b7xun22Q=
X-Received: by 2002:a05:6a00:909f:b0:835:532a:3468 with SMTP id d2e1a72fcca58-83f0546e833mr6386252b3a.20.1778731994018;
        Wed, 13 May 2026 21:13:14 -0700 (PDT)
X-Received: by 2002:a05:6a00:909f:b0:835:532a:3468 with SMTP id d2e1a72fcca58-83f0546e833mr6386211b3a.20.1778731993466;
        Wed, 13 May 2026 21:13:13 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19c5be71sm1075432b3a.39.2026.05.13.21.13.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 21:13:13 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Thu, 14 May 2026 09:43:01 +0530
Subject: [PATCH 1/2] dt-bindings: PCI: qcom,pcie-ipq9574: Document the
 ipq5210 pcie controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-pci-ipq5210-v1-1-a09436200b35@oss.qualcomm.com>
References: <20260514-pci-ipq5210-v1-0-a09436200b35@oss.qualcomm.com>
In-Reply-To: <20260514-pci-ipq5210-v1-0-a09436200b35@oss.qualcomm.com>
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
X-Proofpoint-GUID: Y-wL2dZM3LlV9sTUMcrysRZ3gUjBjCqL
X-Proofpoint-ORIG-GUID: Y-wL2dZM3LlV9sTUMcrysRZ3gUjBjCqL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDAzOCBTYWx0ZWRfX3X6R/5W69FLv
 +BXznBMV66vd6R3TKMgm6e1i3ZcHlpiED/4cmqGXulfhJc/GPl3tKy9bpF8tcNW8uwdK/kBN+X/
 X7+TpTzFmnkPYcVskDydNgXoucNmRGfEGRHwiWqcdE4VfDy5CFp8RjYagC4wRucOg6GPO/rVEuX
 NoE7rD4bl0mAMdwcCspE0ng8jX8hnSLufA836FedrLWryl7NqnhCNqfGqR7smDUph65jbVIUcVC
 bB58X3wU0hi0QP1SBKO94Jylv4sVr4gtn1L4aghrEluJyGgABr5EzN7xUq6+15y0pxB/v3jpn/5
 hqa1k13/Wb3FYr8WuiLtgKhutLWRdQ3mix/3V4HgKnDyK4tfFDk7CeigWImDicg+S1yfo47ZFBU
 z1wqAUAedt0TgaawYoF8PGrNo/2caFzLeFLh0ibz+hw3JmDug4zHdS/5kX4urCNi/mk/GKEw10R
 tT/xWm6NLiYrStj7Ggg==
X-Authority-Analysis: v=2.4 cv=PbDPQChd c=1 sm=1 tr=0 ts=6a054bda cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=QcxusUPE0xsQWomV07wA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 malwarescore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605140038
X-Rspamd-Queue-Id: 515F853D977
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
	TAGGED_FROM(0.00)[bounces-107523-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Document the ipq5210 PCIe controller using ipq9574 as fallback compatible.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/pci/qcom,pcie-ipq9574.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie-ipq9574.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie-ipq9574.yaml
index 4be342cc04e1..a75ff554c283 100644
--- a/Documentation/devicetree/bindings/pci/qcom,pcie-ipq9574.yaml
+++ b/Documentation/devicetree/bindings/pci/qcom,pcie-ipq9574.yaml
@@ -17,6 +17,7 @@ properties:
           - qcom,pcie-ipq9574
       - items:
           - enum:
+              - qcom,pcie-ipq5210
               - qcom,pcie-ipq5332
               - qcom,pcie-ipq5424
           - const: qcom,pcie-ipq9574

-- 
2.34.1


