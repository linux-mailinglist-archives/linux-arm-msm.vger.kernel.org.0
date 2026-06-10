Return-Path: <linux-arm-msm+bounces-112524-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ejLPIYSUKWogaAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112524-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 18:44:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 22B1166B9F0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 18:44:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=YuZqHw2D;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="NBP+7/Nx";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112524-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112524-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 147333296ED4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 16:34:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CFDC33B6D1;
	Wed, 10 Jun 2026 16:34:44 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2765833507D
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 16:34:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781109284; cv=none; b=F1amWoVT1BFMLKJrOXd397B9ZiTeTvQcuQGc1r83iw2VfErAHmhFpGeNIVY6f5LHLGuzqT0oBMTRvBBoPjwXsMhg6mp0ipVQu5wbG6XV+nH0q64DjkGLdY6RVKu20SljdD+gPeoJfHXbHBIXrhOKMD0MwAHqGXd1E5kW0RSdI9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781109284; c=relaxed/simple;
	bh=BIE7gkW/4J2dxkYGHiDbLFQ5KlUnz/F1BFTyzaULS7E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=MooN+MUGMbPbHpdWKJd/oXNsKGqyucXQX4x6y5PvtyFZEqAzAWHBXjsv5KibAOtoipcRyhC+uOPqqFOhUFEcRwsg38siniBzHt9shkIk5vEROBqfh6rpnxh9jwfKc5U6tg4iQgwtRM807BtkyUWUP/AKtlyG8OttuD45G2wQfbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YuZqHw2D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NBP+7/Nx; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65AFwgdB2132507
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 16:34:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+XOIWlH40mHwtCgl/V4OVzh5le+vWzs9b3kpiqeGWEw=; b=YuZqHw2DxiLOZgXy
	FHEd1jLR9TZTr1SQAXCLCOkvey5LHWGgBrQyNIGxFxX6k6xORDM3TzmqVCO3Onks
	jzlV/fCkg9/PDKuGWxu5rWE00mroKCs1BDxhKmQP/UR1vadsJ4vxcFWojFmHggLM
	4zgxykU93hyYmvfR7zbOKNgH4zgco8H3b+3O9Kc2NxMmfgNVBFgyJlbSvFUzBSBW
	5W7HmNI4qGplaGOR89HtrM7TFsDOSTuqS2zixq2Un7L3qUN6l/B9NmIeEPMQT5xf
	AnyCOfO4YjCPerFjbovV4XNaPOCuIIIdzKEEhMTh7DUBXPW/x2sceyAkYTK1NR7g
	d+hIbg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq1tg2qnm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 16:34:42 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c0bf6904a6so102545535ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 09:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781109281; x=1781714081; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+XOIWlH40mHwtCgl/V4OVzh5le+vWzs9b3kpiqeGWEw=;
        b=NBP+7/NxfWvVIaktGpAND5A4LnvagBDftdIjle4GiWFjx1ebcpB5K78zX17LQtki++
         Rd9taNuICbFN1ogRttyeD3sDuF9HTukAm0h+8gVUw5Tx9wVQ/pcwwENsM8Sr+3jYmHWA
         /7UCJxcf938c5BwaFeLoxh55Z+kuT5pLUO3BUBw4q4+Xkl8PVaJ2nKQ5Zcv8BxJWG7E1
         28CCc12qZFPpZG32e0wjH7iPs7WY8odZaPhyDFaTUcd+hxnEJzvfHARKZLS//H0dmMfb
         RtNtMRZFYLe6CgZvi+Dvtc3pUh4nDt9jTdh0KokzUIyYaRNRPcgPf5vdys1Mfqtp21iH
         fkBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781109281; x=1781714081;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+XOIWlH40mHwtCgl/V4OVzh5le+vWzs9b3kpiqeGWEw=;
        b=EXMCspX6LDrctcb4xQupP+ikL7cdofgW/mRYnihdxGLYisa8kdAWGoYlabtfnhEbfP
         0uL9JgQRoEwZ/lvg6pbz/KCX5efwqirsUzdcWTzuDntg39CO6ot6CbbPG8fzzq7+GI3g
         M3CAc+SZAYxlOl7qVdIeKaQysGJiWEK7I9U9V9A7ErbWADli8P30EkdjY2FOtGSQ0R1D
         lX+pEn5/wEQgu7aHl5A9HZhD+Q0QkFRXxXSM/cjxAsj171X1oIL7MJVUs4v4BIz41XPW
         l8zqT4gSrbMgiCds5c7HXfSen7p8I58tMYs5EU0FcTPFqKJSy++xKDLXrcs2ISSVG4xP
         e7Jw==
X-Gm-Message-State: AOJu0Yxw1XIdWpDlNLF4fZH3fr+aNzsDmrCRTbvIY4TWayeVMLwuQJ8u
	p4/ZjhCwIxx0HNq/sW0CM873kgG2UlfaoIuIwJNK5+olvgVXS6sadMtPhbMhshyOxC4an5eI0uC
	+gBShHglDemKgB37ArDCoFjHIOJVBzjubP1mPrxoZQbkRvdj3GlY8MyX3Cu9M1o/L4A/d
X-Gm-Gg: Acq92OFY1LW/v2SOJ+Jro7g14SBUqEUCBJbUekK7GBaXX0dxYbttR+muQjKWnVK4KFR
	sQqW5giXiXEJ2E9XFkRuEjEnoFeJK0laWfAe/x92NNrwvVxfnNCzMViQ7FXYbI6XzHbeMyqPqID
	nREHl6EsWytcpArE77T6tJTPcxp/2dXaCNndBF4BhyyQ842K8TkSnScq5GjHxFu8l+HVU9FaqQg
	6i3Al+126x04FJDDNYzqp0RFRbW1yM2pEyhwwSOHRL2v3Elzzixvmjp7tztg0b1/UZ9PRS+lW7t
	I/BZuyuYpui1nuvu8wPSM9fLkgAxRWdU2r86Uv4wxQPyTA44O8KvwnUU1W93NuqzojwNmb9dP/f
	H6PIXlpDMLri/e8ruD3MAVKh5qy9ilM8=
X-Received: by 2002:a17:903:41d1:b0:2c0:af09:f3c7 with SMTP id d9443c01a7336-2c1e85c0cbamr301159755ad.30.1781109281092;
        Wed, 10 Jun 2026 09:34:41 -0700 (PDT)
X-Received: by 2002:a17:903:41d1:b0:2c0:af09:f3c7 with SMTP id d9443c01a7336-2c1e85c0cbamr301159285ad.30.1781109280647;
        Wed, 10 Jun 2026 09:34:40 -0700 (PDT)
Received: from [192.168.1.11] ([120.56.195.233])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16649c302sm243953905ad.73.2026.06.10.09.34.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 09:34:40 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20260608-eliza-v3-0-9bdeb7434b28@oss.qualcomm.com>
References: <20260608-eliza-v3-0-9bdeb7434b28@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v3 0/3] PCI: qcom: Add support for Eliza
Message-Id: <178110927481.10093.6331910233610738004.b4-ty@kernel.org>
Date: Wed, 10 Jun 2026 22:04:34 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: NvtvS6ZFkK0PZwhaNEriSvNEU1SVBAVp
X-Authority-Analysis: v=2.4 cv=dLmWXuZb c=1 sm=1 tr=0 ts=6a299222 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=n8UK4BQKCdfH/t0JQ2luxA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=jf34NEdiGforZHx8bOwA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDE1NiBTYWx0ZWRfXzL/LdbBGLhLw
 HRw4lRnIlCIvqcsoqnviFUl1lG0fF8w0oXr6ZzVmSfW6T/4YkqLEfJOQxhafzv6JKOZDPUGJoGb
 VBTYMTi5UgxvLlUDHgnuVSAc9AGDbTbriEy3TNLxxLy1lp5zxSSmMs9hwSfAWibqD6jZM4Hj0pC
 u0d7f4/1ila4hvI3fa8BgdBp1imIC8whYU3AZ569EMtcfVlZ+3pBC1CxbAe2H57uanFjUT3buAA
 plsRYKHeZ6itMbMPLkzNqlfvrZ4VvJJ/b9BTI5qzjacIpduoCfvrezQP/TowPgCPs46z7PnWzIm
 BbIJJo9oBIzuAo9mxB9wZDtnsc9gIDC0paqFAEU86IQwDSf/cD78Jd+6pU7zFTogSpetpzDaIGb
 LwX8HNYLDXXvsANeEnX3C0C4ZyQNxcY0K3MI5tinvKeDpOHM7jFYjr3gpEpcqzGaMqIa+8kkn1W
 +zkcLF2KIJdWKo/YaqQ==
X-Proofpoint-ORIG-GUID: NvtvS6ZFkK0PZwhaNEriSvNEU1SVBAVp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 spamscore=0 clxscore=1011 lowpriorityscore=0
 phishscore=0 adultscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100156
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_MATCH_TO(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112524-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[manivannan.sadhasivam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:bhelgaas@google.com,m:andersson@kernel.org,m:krishna.chundru@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pci@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[manivannan.sadhasivam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 22B1166B9F0


On Mon, 08 Jun 2026 14:18:12 +0530, Krishna Chaitanya Chundru wrote:
> This series adds PCIe support for the Qualcomm Eliza SoC. Eliza includes
> two PCIe root complex controllers capable of 8GT/s x1 and 8GT/s x2.
> 
> The QMP PCIe PHY support adds a new Gen3x1 PHY configuration with
> Eliza-specific initialization tables, and reuses the existing SM8550
> Gen3x2 configuration for the x2 PHY instance.
> 
> [...]

Applied, thanks!

[2/3] dt-bindings: PCI: qcom,pcie-sm8550: Add Eliza compatible
      commit: d233626c009a515fb3ed823fcd78cee432701d1e

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>


