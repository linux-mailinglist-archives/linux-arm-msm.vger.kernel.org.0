Return-Path: <linux-arm-msm+bounces-115534-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MG6nEoMTRGpQoAoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115534-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 21:05:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B89F76E7678
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 21:05:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=fxcnZ001;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=S96URSZJ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115534-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115534-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C29F63049147
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 19:04:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFD14477980;
	Tue, 30 Jun 2026 19:04:18 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96F353DEFF0
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 19:04:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782846258; cv=none; b=BViMUmOa2rnpwqcvBksSefmwEe6EuHbHkIX+iFaGz5AbTcaZNmmn+QO85xZWCzaXFqvfMPTOPTaEOwBq+q0mSwgzEmjQtIb6nRcyg1S/Zk3eYEpkjezTeR3gVEfmQQ4TPEvmpKS8yHPG9K4lumDDm5p1Aww+rJpd1DTLgnx+LAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782846258; c=relaxed/simple;
	bh=RTnxmJmcXqptIc1CpIlZkuSiZ1cZFh1FUN601H5hlC8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H0UqsE+1sScI+ud90Na8PzXd/gWO6SdCZAXWw0oUwP18koRKrsEKnSw0cNKUSPwBmfM89VpfkrhUc1GqMMpa+jy2DhJP0XUn1Jrqh7ezaotfO99OJMzjv32jNGfFUpKItEIYPnNW4x1R4ekCXRFaSjqztSbzndHLXMYX/YbHv9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fxcnZ001; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S96URSZJ; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65UHrq1Y2748027
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 19:04:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S6Y7YhobAf0BVh62LWHOQSP9ynKHGLmfRU7MX9qDErg=; b=fxcnZ001O+ruLVK0
	BXa5CxzuAefjhn7iYYCvlCwtrsEk0blxOXoLg9y9bd86Kxk4dyXqoOuipge7H4D9
	wxZrY71mt5uXx2OH/aaazQsa2zVvwd/wnLl4Ic06+MGJLbD1t+H3ocZ/8kQLLlfW
	0ThzjGa8xmIqLPprp5RdLDXM/onc3TJLxUDBFnWHUSLNz39/B7B8pZM7D2h+lgHt
	dm9YmyM8p3jOBJ/NNclZzLITV2XXim1sU9uRGwUNBZFss3AUeHVb3MEMJ233DieU
	wRVLPDrzPzCa8m0nPAEdMS593Ic3SQyI0vQ4zmKzwyCXhEqDGEfP5PimuHfs47ON
	HPosuQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4jkt8bf0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 19:04:16 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30c1f6c5559so87939eec.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 12:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782846256; x=1783451056; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S6Y7YhobAf0BVh62LWHOQSP9ynKHGLmfRU7MX9qDErg=;
        b=S96URSZJgWeNbYCISnNcwXo/oeYCTuVvlFHRLkdG/2RfEP6tfTCHypaYkSJYRJFnz0
         pikrvi7HJwLmdunp8HJB9M2NtXW48ouATp9inbty8oiDh01ckQK+ITPHrU1Oe1HKY08X
         OnsKURk3jVRQ0tkKvSvSssKp1KIefDDCpesTBrul0kGYhIyaYAKNfnqy1ZH9RhDm2pJK
         EY7lwnsGhUO5558bFGWtDkNTu7yRX5NfEIbXlPOGSQg4tvPKXqt2HN1ZrgC+fjBa1ZLF
         lzA5/iWKNx4dWmyKOPPHkoAqjZ3Qpw87p9mKMoaC6d4SS8Fkl2w88teUuVsITMgm17rq
         Et4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782846256; x=1783451056;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=S6Y7YhobAf0BVh62LWHOQSP9ynKHGLmfRU7MX9qDErg=;
        b=Wq4BL9gk6N3GKRbNmrT81FXNjJVhSUEqluOF16eeZzvlPLyEvL7OvNgyUrf1eIqeaS
         A11JuCZ7YjVZljMB7h16JSJ0X2P1H42gsVpCvjpQMTN/ENPOd+lvm0PodMW69Z+SwhLD
         Q8XlBNQ2HqByFKgleWKC/xOofeiTkh1zg9Jpt0+n73erNFKX+KG4y0AsgW0qlr3XuQu+
         yFYsXRdiOS9remFEVXdI0SFLIuLUM8R/hLmo66V32h+uAX8jmz0NKk9T5MLu6Z3G9xuV
         FNOuoaPRHiqn5Z2BnO+QK5I7zZjukaxU+YhkDmv13UZ8J1Mi2NWxGjSO42J1sygwy0+M
         ys2g==
X-Gm-Message-State: AOJu0Yx1OJxpxp3TF7JZeWEnpUJgjxh06RN5WXHDE9Jpzw9MtGZIimQi
	QecEicNGdFwYemPIHCTDW3TrSo0Dv3ylHB6ADn0FldqWImMIu+N0v8r6AtDKHk+0zSsZ4p0XwRs
	aOwlrxG+151fkPeE2ku4vM8kfASlqbCGUCugQoRGUVPWwM1UkTgFrRl+6TRd12WSAzjWw
X-Gm-Gg: AfdE7cnD2fe2ByuM2P937FG7dzPue7cgVELOiYhMKcQfIRN19tk5kjBV1wrSyOOg99I
	znnDaQx9LxGp/DhLEgqipEaRpKqbuJHNn+iBRnww/XJDTEcBTjTKBirTW20DXWjuHw2NyZ5pYdQ
	IbHSZlIYl/3oTWG6+L4KvF7ImgEWXVzo59huUSNvx1uGbXM9/N/m/YVmbuhq5U7ezL11bgLOmgI
	v8WFV4VVvDvfhCKzPd4aXJ2kbQZRizmFTb6uwS63cRBaGYsFI7rfyf0o3C4T8I/9kqrgl4qNAyH
	2iXAYTo3eyFC060Ylgzg1Iesnyg0vRSXrohnTO5YsvFkVymbJbwfnAFPe4FSLn7njkShzApWlk0
	ouKnf/BeXE0OLovPIKcaf4nsI+Or1AUraToDxHwL6QX783Ow=
X-Received: by 2002:a05:7300:57a3:b0:30c:23ab:b7d2 with SMTP id 5a478bee46e88-30ef0975166mr1520423eec.28.1782846255700;
        Tue, 30 Jun 2026 12:04:15 -0700 (PDT)
X-Received: by 2002:a05:7300:57a3:b0:30c:23ab:b7d2 with SMTP id 5a478bee46e88-30ef0975166mr1520344eec.28.1782846254702;
        Tue, 30 Jun 2026 12:04:14 -0700 (PDT)
Received: from hu-sushruts-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ee317095dsm14963815eec.15.2026.06.30.12.04.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 12:04:14 -0700 (PDT)
From: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
Date: Wed, 01 Jul 2026 00:32:51 +0530
Subject: [PATCH 9/9] arm64: dts: qcom: shikra-(cqm/cqs/iqs)-evk: Enable
 PCIe PHY node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-shikra-upstream-v1-9-e1a721eb8943@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782846191; l=1973;
 i=sushrut.trivedi@oss.qualcomm.com; s=20251127; h=from:subject:message-id;
 bh=RTnxmJmcXqptIc1CpIlZkuSiZ1cZFh1FUN601H5hlC8=;
 b=H+Moevnq+AybpYWzC/36+UGo9gtMkD6aY9ze/Ewovw2zgrcI8aCNgiY2Gku5HmDaOD2qP+Ot4
 qWwR9iSiBJOCnJ4ToDj/gO5wgkYZBE/rhbERXLbAk24+D74dWgNVj9L
X-Developer-Key: i=sushrut.trivedi@oss.qualcomm.com; a=ed25519;
 pk=OrUHTxBaSg1oY3CtCictJ5A4bDMNLRZS1S+QfD9pdjw=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDE4MiBTYWx0ZWRfX/+s4cjviS1mR
 OuCUnBgYd/7zpq4HaF3eKpkupKEz6+DUFn+fXrAB25zvzwFTRv+zb8KZfD6iJ1iEUIlLj2uYbwX
 vbBHb9BdInpGnsdcrGWMNZp2tcMT67A=
X-Proofpoint-GUID: M4BUnwjTIubHpz6ED5QHppkL2PnQPBcF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDE4MiBTYWx0ZWRfX0NGReIkKkfYC
 JpUe3NbMqfCuZDi7tP0pL64v5SDC5tGf5gB4KVJ72+XnB/DLg6xrDij1u3DPLxHreqgGsa7yo1A
 fJMTAUXdMiigthozsMOzVK6aiVbgxK1Ryr8g4Y7x52xI8RbilcwB6xOUssaohTuLau3nGMV/QRf
 XqAEH0yae5T9HdVi6V7sMIZ9DR+cMj/c88tkOi1SpYo3POY+FTEchfXrp7j4nLUWJy5lr5rvArr
 ctX4W/7BDkJCLMCtKkhe7cVGEqUdfaZhErgkCXgg4rWGBnutQ8Lifk67T8teLRzVczdJOSzQOYB
 +03wkMZ1q46brTVspwjI4BN9N+VRqWbEPGwoJYzrQLOekvDFqiGe4TAHyXP/l2gVx2RhCgjKtpn
 kfS985oOA8X3+i6WCKv1EEYMG+zjkpTZXj+t7fEt69fqogJYadNpvXcNLHGMvV1QPSsEpxl8DFD
 vEnll7TNCHBbHGKLfCw==
X-Authority-Analysis: v=2.4 cv=R+wz39RX c=1 sm=1 tr=0 ts=6a441330 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=Dx0sEE52Z9zFkSaW5IkA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: M4BUnwjTIubHpz6ED5QHppkL2PnQPBcF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1011 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300182
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
	TAGGED_FROM(0.00)[bounces-115534-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER(0.00)[sushrut.trivedi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:bhelgaas@google.com,m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:mani@kernel.org,m:andersson@kernel.org,m:krishna.chundru@oss.qualcomm.com,m:brgl@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pci@vger.kernel.org,m:sushrut.trivedi@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
X-Rspamd-Queue-Id: B89F76E7678

Enable the PCIe PHY for the single PCIe intance on the Shikra
CQS, CQM and the IQS platforms.

IQS platform uses a different powergrid than CQS/CQM which explain
the different PHY supplies for IQS variant.

Signed-off-by: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 7 +++++++
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 7 +++++++
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 7 +++++++
 3 files changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
index 683b5245923b..06ad32041546 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
@@ -60,6 +60,13 @@ vreg_pmu_ch1: ldo4 {
 	};
 };
 
+&pcie_phy {
+	vdda-phy-supply = <&pm4125_l13>;
+	vdda-pll-supply = <&pm4125_l9>;
+
+	status = "okay";
+};
+
 &remoteproc_cdsp {
 	firmware-name = "qcom/shikra/cdsp.mbn";
 
diff --git a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
index 26ff8007a819..e467c46a55c0 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
@@ -60,6 +60,13 @@ vreg_pmu_ch1: ldo4 {
 	};
 };
 
+&pcie_phy {
+	vdda-phy-supply = <&pm4125_l13>;
+	vdda-pll-supply = <&pm4125_l9>;
+
+	status = "okay";
+};
+
 &remoteproc_cdsp {
 	firmware-name = "qcom/shikra/cdsp.mbn";
 
diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
index fd691d53a0fa..a7628443cb36 100644
--- a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
@@ -68,6 +68,13 @@ vreg_pmu_ch1: ldo4 {
 	};
 };
 
+&pcie_phy {
+	vdda-phy-supply = <&pm8150_l12>;
+	vdda-pll-supply = <&pm8150_l9>;
+
+	status = "okay";
+};
+
 &remoteproc_cdsp {
 	firmware-name = "qcom/shikra/cdsp.mbn";
 

-- 
2.43.0


