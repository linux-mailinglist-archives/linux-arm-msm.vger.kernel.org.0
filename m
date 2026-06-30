Return-Path: <linux-arm-msm+bounces-115529-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id upYFIj4URGqToAoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115529-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 21:08:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DA5D6E76FA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 21:08:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=RBgb0u9Q;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ejjPk3uj;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115529-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115529-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 23BFE3167DBC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 19:03:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2CD13B388A;
	Tue, 30 Jun 2026 19:03:45 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1A4B367F4D
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 19:03:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782846225; cv=none; b=LQ20u32id7xGTdLMLM2Sb9oWPrfW7Ebyhoewxw0rou99D/gvEikT6Zipt6zLFdQ5G8L2Ie2NpLFa0x0JI1xASZFk926s5wca360LxSM2Rbojzz5tf1QAMTRL84ziPxPDHk8EFk3E2gn13JZ7AnKIaT6HiG2ceA7JdJRXMsTgc1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782846225; c=relaxed/simple;
	bh=GecsPtDzBCsWNuDkEsU+ZgpETbYSghfoMtZfgts9qAA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=caeHwfu/0MHm8wOKVCVzS/OMyNkk2va0mXSPjGn9ZmXmUPmyvuEZrfl7GbClruCPGqhh65UtwXCcHg+HD+Gx8QG9kcl2eqP2yDd1kurJ8T4/11a5zNxm20KlBgIIMPhAOVJNYXxU1I7r5QEdYb+seKDtF6mh2R2oFXOC4sEald8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RBgb0u9Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ejjPk3uj; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65UHknTx2632068
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 19:03:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GCgClY81I44AjvbZ/aXoo8VK5dN9dzyBFnWzQ9hfEIY=; b=RBgb0u9Q3NWcNR1q
	fqduvcaEhgXaUT5tc5NwsCbXZfNsGyrursYZiJAapEhPgYQHLOpXuWQctT+WUpPA
	Zwq3c7OzDWnymEQGG3zVku22NqnGl+WTTCfrEIgwFV19uC8lVGz83SgOaYxEGAbc
	jcbVYNEkcoXhyrzroV9GMo4PnbWcBp5PN1aLrPpb2oGZQVEsuqqeoLB5NLD+MFOU
	l+VEzLKU/LeWzSqhHGplugqAh0qe+REfqAFx8LzCDpItFpcoOOII8bVmY6VS0yHt
	3X00bGyKVYey5XqpaEXWv87M9MqOfTiCanjDrkoBKY9mJg2DvXQoQQN3FWwXsqpY
	XjfZQQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4hbd0tfk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 19:03:43 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30c1f6c5559so87359eec.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 12:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782846223; x=1783451023; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GCgClY81I44AjvbZ/aXoo8VK5dN9dzyBFnWzQ9hfEIY=;
        b=ejjPk3ujYn3nvUVAJhuKcEsxl537YJUzmDbgNKipovenGsFQmWlKfR/Dup+YX287IV
         VYnuUNHpB1O//i8+bYKT0e3MyO6VAKMoOLNo8PNHnUm5xbuWOjRIzBzaaMan/OsT9dzH
         IEPCqET8UTb339YXrgIIqxgjo3YpDe0mTRAXDqFfg4qJnPNV5cNUpx5pQwlt/wtK6Bk+
         VazPV/pFEGM/LivMTkfPsWh4viGRwHOFIMDe3wcR681ZXA3OHYzZ6JFCX37NOj7sHMPB
         3SmxPgBR4NiBGRWUWUrVTjcViNI0TZeofwebwIptxFdSZCUQdUz79WQuAB56QZM4mMKC
         sL9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782846223; x=1783451023;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GCgClY81I44AjvbZ/aXoo8VK5dN9dzyBFnWzQ9hfEIY=;
        b=FPst1JJV9OfBiLfaiD+uZ96bdJ3fI2u3aD8Lj/0JpXeuZydpNa9PXE5ddv5h44nmBz
         tSM2d2IZ5RYci0UjJt6S0Gmd4hn6kSPbLU+mtY1ir43ZCiQ5/2YB+ZkdV14DGznLgbjr
         qQaDYMy9yYsH7mwyPPqlHLSW5UMqN/lQSWU+PXUtqeew+uxWlSCEVvVcj6mPPi6pVK0B
         AI4muPCDovGEhCDixyZPtcPK+YIiLZnN34ca2EbIwxBuloA1VJIUBn7YiCXRiSXWJz4D
         vnuxcgOpqehH5LpxcW1DHZDoL+8EgSBJOzE2m/7mqnw1Y4IFtBbID4D6CIbL164lcX/3
         4p6A==
X-Gm-Message-State: AOJu0YzmaD+AyGEAjZvgw9RbI8OAysaNIkWdUhxxuyPTu+CsYzEa5eH9
	mGx1gVmOwudBQmNzxzic9RdAnP0mQnr4yTBdVry6VJdqdW7oY3PdcOUaJgD+V1nyFHxRJVIUhqq
	rl/YTH2HdXbYHCHp3UJ9Sd6CWHuKgY2kumHVdoVTTvagVuhI5DlVSsjOpFRYp4/BrmkQK
X-Gm-Gg: AfdE7ckfnBTWFFq6JFGka+1uOth5wzAjphds1k2QYleJFTS/+NFbcbE2rtMfd2XlMvG
	5l3RotrYdjiPOOfs6qDGJ3H5wTW0dZFlJU1whGqGSgb8wYdZ3m2aE/LOtiJCTzTXa2JoJ2vLZ9Y
	a/ptCR4Mn2lsxB3yC4du0jwYDeHFUgLchbru74ci0ZaLwrEQFJtI9J7jpr9NK+Z0uvVHYvRGVN6
	Tz8mJxp7ir4Zx5vJF7g6RgHl5RnUCokS29ZasxlC7Kee99Fwt6rmgRrBzOM7ItZxVRqD0zMcCnF
	K9TjrRVwRGOcHq67S78zfmOl2jvCQk1zmVrS3SfnNcuJUA0cz8XZwye/JOUf1djRMa+1LrNNswq
	74Bzb5tzIFcdV/G0yvl/SQ6nQfBpZLfFUP4ryijwlM2NYuU8=
X-Received: by 2002:a05:7301:2f8f:b0:30b:dd58:e155 with SMTP id 5a478bee46e88-30ef096e8f5mr1218375eec.20.1782846223169;
        Tue, 30 Jun 2026 12:03:43 -0700 (PDT)
X-Received: by 2002:a05:7301:2f8f:b0:30b:dd58:e155 with SMTP id 5a478bee46e88-30ef096e8f5mr1218329eec.20.1782846222658;
        Tue, 30 Jun 2026 12:03:42 -0700 (PDT)
Received: from hu-sushruts-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ee317095dsm14963815eec.15.2026.06.30.12.03.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 12:03:42 -0700 (PDT)
From: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
Date: Wed, 01 Jul 2026 00:32:46 +0530
Subject: [PATCH 4/9] PCI: qcom: Add support for Shikra
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-shikra-upstream-v1-4-e1a721eb8943@oss.qualcomm.com>
References: <20260701-shikra-upstream-v1-0-e1a721eb8943@oss.qualcomm.com>
In-Reply-To: <20260701-shikra-upstream-v1-0-e1a721eb8943@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org,
        Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782846191; l=854;
 i=sushrut.trivedi@oss.qualcomm.com; s=20251127; h=from:subject:message-id;
 bh=GecsPtDzBCsWNuDkEsU+ZgpETbYSghfoMtZfgts9qAA=;
 b=P8iXgoZ0ZmeREPgz0BzlNdOW1PX47JuBxAE/yjvDHkAEX3OQpmUXJ5BbOV87TORQ23uz/0UyF
 zwsAIcJQLL2A6aVZRhqot74U2Lymzxtp+S/bx//KLuoZLN+ihrMtvYO
X-Developer-Key: i=sushrut.trivedi@oss.qualcomm.com; a=ed25519;
 pk=OrUHTxBaSg1oY3CtCictJ5A4bDMNLRZS1S+QfD9pdjw=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDE4MiBTYWx0ZWRfX6bZS/+o2ckXl
 eQ45hyvgPlZtgpld+s7D51HRVvfZim/zQSV25dVFRUocwpRHvTtUxxf2vBs+sIiVJA1Bs7Egkm+
 axNLm/A+YuaKHjfhHkWDQkUhjZxBDZw=
X-Authority-Analysis: v=2.4 cv=MpJiLWae c=1 sm=1 tr=0 ts=6a44130f cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=sKgv3_SsqRtbfYgyWx4A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: 7jA6TgIvu1RXQNBK7cAbf2gQeWSGbDhD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDE4MiBTYWx0ZWRfX57A8oYgh/oMs
 4WDqpVGLMwepH+q/Vza66xhCjJEmvm3bjwdRS2v4ruOuWwHA/AbKjAIp6dcxKYyRZT0P7JXXngA
 YOATrRGuyIUS9lCilDXnYI1OGmQcnSwZGVqBAXwFjqQm7x5n2sdDBUlp0Cu20E0f3d9Ux2GR+lc
 B+H6cvITOCmxsiaOe1UAjPBvyQd/p2nmsU2PpjB/hzUhluEyUNEBeIYqCn4jM/EUnZ41hKuUzfI
 wGvLHWoAa3ESUB7tFF3vGA6ON8Wmcmp5MnbZIvLdasGsBBjYRfW5WQVU+OCrk5GHI6ES18Th4cF
 DluWUfrqk1SIElGIVUmw5+7Ir3DQyXMx+zce4UbvrOeuk0K2+ZB4JOfOkOQSdVLtKgm/6BnyaTl
 YKcTg3SKXqMt6Hmrnfe4RZ4t2vPt+4ibV36vXHLdNmTd6DuUnp1EIXNHgER1Mb88S1cRgJcPxiX
 kI/hd3CE+S0sKJJD8PQ==
X-Proofpoint-GUID: 7jA6TgIvu1RXQNBK7cAbf2gQeWSGbDhD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606300182
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
	TAGGED_FROM(0.00)[bounces-115529-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[sushrut.trivedi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:bhelgaas@google.com,m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:mani@kernel.org,m:andersson@kernel.org,m:krishna.chundru@oss.qualcomm.com,m:brgl@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pci@vger.kernel.org,m:sushrut.trivedi@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sushrut.trivedi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2DA5D6E76FA

Add support for the single PCIe controller on Shikra platform
which is capable of Gen2x1 operation.

Signed-off-by: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index d8eb52857f69..19daadee65f7 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -2309,6 +2309,7 @@ static const struct of_device_id qcom_pcie_match[] = {
 	{ .compatible = "qcom,pcie-sm8450-pcie1", .data = &cfg_1_9_0 },
 	{ .compatible = "qcom,pcie-sm8550", .data = &cfg_1_9_0 },
 	{ .compatible = "qcom,pcie-x1e80100", .data = &cfg_sc8280xp },
+	{ .compatible = "qcom,shikra-pcie", .data = &cfg_1_9_0 },
 	{ }
 };
 

-- 
2.43.0


