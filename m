Return-Path: <linux-arm-msm+bounces-100264-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6OeMDONcxmm+JAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100264-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 11:33:07 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC2934297E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 11:33:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E9D933168BED
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 10:25:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2159E3B19D8;
	Fri, 27 Mar 2026 10:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oice+M68";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XF1DOUor"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90B0D3AC0F1
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 10:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774607094; cv=none; b=Z2mhnU3TcBEwRq23nKJFqPmKEDC+TCpWHzcPFi6ZVgCkmssbuu/5MlMAkHMpMYrFN2kk8z0hkFeg8ZH8OjOTL6E7x+vRmh7mwGYpfwjecYTIYxiHxn8Lcb7xPXTCWlp0SPkQzL8faR53n71InUFrknnRRcrq3mNcLfyYnU71C9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774607094; c=relaxed/simple;
	bh=10fzlebEz+tiEIKnYlb/0ADkVEcnq4RaKhJy10754c8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=A5Pxvbre9JBO20nnA4ctQ/mT/+YRkuHtbIsZvs18U+9MPW06Q97fOjRXG8efBmBDSLUya16rC3OQdvjLR3Rb+Vhx7Hf+QGVZVSCuum+7+t5TlHakWdbDRYB0oKVaRze8RE5A0J1/jgbUzaNWX5AYdcKtU1BKOYKoaQVI908jhG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oice+M68; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XF1DOUor; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R6vf2n1749076
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 10:24:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=gY0ycYZfiYJWhSKhvNMdpW
	cE6pCgfRJY+ho+MWBwPt0=; b=oice+M68OpIa6u78SOk9tGI923GhmUT5q1HqYG
	+PCIenRk269/AJ3k3hxwAh9AJ//Hc/aeVpSCxp3bMf/8ABLu4TAHU7AKiSYnQvLr
	dggEwCO6AriETdVsP4szu2F6VFhjsT66d6fi99pUb3X4zEgWiwWJyAVrVl0NdkIk
	nMh8GAz7IhgynQHRxN//8so79fwG6dmq+nK84gklmHJMEwkGA6BvbZ5VH+tqK+31
	UqjcskkXPAKyp7ZBiLZW12jC1Xto+AvzGu1bSRmj5t0hiSE9Nyaz7spzesjGSsEw
	uoLpXPPcXB486t+S2x6o2o2vY6LU0/Ki3oRLEm0gytLuw6zQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5mn10wef-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 10:24:51 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2c16233ee11so1883851eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 03:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774607091; x=1775211891; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gY0ycYZfiYJWhSKhvNMdpWcE6pCgfRJY+ho+MWBwPt0=;
        b=XF1DOUorOgzhXgDcKc5KKF9NszWKsFMj/Z1At+ws2a9JlwfQjWc7Djb/CslooM4EPH
         B8gZPYWRuru05HRdQkh/a6fk2BPPs8KEUkwl2sczu+qBDuw/t7ZJDK1MX5BbI6D4XcMn
         lizRWIelofjlW6oukB1xI6bpXB7WO+ajL+H9FrG9wo5gLAKUTm/XJaTPcl9eCzrzuwVY
         vJJQLNrSfevIqEEnnmZTIdaR65zYc23JcEXidBQJFevc0WxM4Dxzkt+CwcXRKJaaWl7K
         LDVc/5ZoVLjdxSFkFeq63+DBftsLUEAsF3fQZS6RcdeU1gqfFX+bQoa//Zv3sANBvjRf
         J/1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774607091; x=1775211891;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gY0ycYZfiYJWhSKhvNMdpWcE6pCgfRJY+ho+MWBwPt0=;
        b=OKTsuCJAHaQT2n4Zp9kq5ReSoVFiDK+1OgXqc50n6znKX6beh3zv6nyDvpVmmA+T1N
         XMEvC7oyMY0pFRxJRxtXmsjbJbdK8Q17VYxJIChZ9uy6Q5iZGgY5Z9LojK7j+LvbicpC
         J9pOoZ5HEuVpLikm+FxL58TwOtRWJQltUX3J2akvvGBavcJntEZEaSTcZieB+T6Q1daw
         XcVCMFAN3cS82EUk/TwSG0uIWxF3Iau8I0thspcGyOJvwL17Hd2pb10PMMbv3PkgW35K
         U6HEQ3drc8E10cuBOryL7X7pJISnQ6oYItrv8UkkS1IRpM9AystzDXWMPovbpqu9Tb1y
         318w==
X-Forwarded-Encrypted: i=1; AJvYcCV12x+hkD4xiErVBRxdzIit66zKUk0YFIezc77BSmEJ30uVAkc7mtc2C+yWIW90vZRFIzpAZJm4w0zpY1Iv@vger.kernel.org
X-Gm-Message-State: AOJu0YwCvS0kyElYtUBrd03GDBwsd5Oq9db9lp95Qn9mUUiT95PCymvM
	z1BiIg4TulRGeaFswoi6FjJ+TRc81Ydumr4E5oNzn4nfFP1qdtYEQ7us/QhE6QYHR/pKe9T65ti
	n2LoDZ8Q6ZPJJFpMP46XJKH6QMKGEtn6YPRT35CTOrkTC3mIqTHbqUh+ekSKdgzv+ul6R1WNA7r
	2D
X-Gm-Gg: ATEYQzxWC3ZXpzwCO/BUfnkksTQrDYveoH/popTBY9KadNgU4045vGksIFa2qqpHIH3
	oMqXx4yNgwTeP055JwhfnhlHg21F0k57bl63ZqDcbIocD3hY8tjTNsqC0bfG+NOQRUrZpbygGv1
	G+ZO+LAM95vQYAfESTVT/DmKpEpH15KCZ+aiTUfiSORdvE3DGc8/7E4gU7d4kDigEzmEi05tBvD
	wz8rRPGgi8gEpz06bNtSf/VHjKu40f+aAyCgL/gcmS+0+09LRP03DtCyDbjo/kA/nnZGEN5PTlV
	nzn7RdTfMC0RSRVt1a6TE2pWO6Lsth9DTdMEnvyH9XuZxzkRWJswFvChiHiAknxidl1jIPrYAtN
	921GZP3eh4Ux5eHNLZcgqU33i7x/FLnqQZ1l33fBqm+TJvZdsSfKEgo1K1xSb7w1fpi16d4w=
X-Received: by 2002:a05:693c:2c0c:b0:2c0:d04c:a6a6 with SMTP id 5a478bee46e88-2c185cdd1e9mr1119862eec.6.1774607090554;
        Fri, 27 Mar 2026 03:24:50 -0700 (PDT)
X-Received: by 2002:a05:693c:2c0c:b0:2c0:d04c:a6a6 with SMTP id 5a478bee46e88-2c185cdd1e9mr1119839eec.6.1774607090054;
        Fri, 27 Mar 2026 03:24:50 -0700 (PDT)
Received: from hu-anancv-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c16ec495b8sm4756173eec.10.2026.03.27.03.24.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 03:24:49 -0700 (PDT)
From: Ananthu C V <ananthu.cv@oss.qualcomm.com>
Subject: [PATCH v4 0/2] arm64: dts: qcom: add IMEM and PIL regions for
 glymur
Date: Fri, 27 Mar 2026 03:24:34 -0700
Message-Id: <20260327-glymur-imem-v4-0-8fe0f20ad9fd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOJaxmkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyTHQUlJIzE
 vPSU3UzU4B8JSMDIzMDYyNz3fScytzSIt3M3NRc3aS05DQjIwuLVNM0CyWgjoKi1LTMCrBp0bG
 1tQDgAm1uXQAAAA==
X-Change-ID: 20260327-glymur-imem-bfcf2288e5f8
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Ananthu C V <ananthu.cv@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774607089; l=1181;
 i=ananthu.cv@oss.qualcomm.com; s=20260327; h=from:subject:message-id;
 bh=10fzlebEz+tiEIKnYlb/0ADkVEcnq4RaKhJy10754c8=;
 b=Fb5RCnodPN2nRvi1W0qL3rLkgcHVVD23hLaKAkYQU6fnjuqI8oA9wvugrbU/wqMwRckquurSU
 Ph1lFIOfbKbCrRx4pLJEbNB5CLm5g405ffKBf5avHMIzeIAk2tguIvM
X-Developer-Key: i=ananthu.cv@oss.qualcomm.com; a=ed25519;
 pk=Yyv4ldZGagB5zyqtlYRdUX/L9FZ6y/INQAXO9L3wfl4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA3NSBTYWx0ZWRfX/cJMjEVHFfQ4
 i6iI77jCsQOm3JuQmnVmZipzbP24PFwnCIdByRQiDsAAl253x+JvBhe1llcIRAZWP1Y1esUCJ8r
 6FEisRFkHJcEW4f02hqduxgpXivzfyeTICmbJRzHuemolfWkLqc9+RYDpOUI6Ir+9foIGOF0Cks
 Syyl4LKZ67nEdvoMuJcNxAFZeuUvvQXED0wpwtYLxWpyaYoO3DWWS3INBLBYdSeq6GD102LMsVw
 Yq96/xEkXcxFeza49QcQIt9O9o3qyMIir72VtXRk4GEgyjh317qoD/gJBcyTvKR7yy4Ip5VnyOp
 5cswW6JMoP0PJd//qZw3Szy9CuD2SSS8kkuEI+VG5apbnhy1u0KQajv90IzYJ1RTNILDzvSsh0t
 SY8F1+D5GeMTSE8UN+rPdhshx6RGwOJHeBiZQQ03iChpHQfYesc3pS1HkZBaO4Ojybqz0hvP2O+
 lAlf1sfM5CuNaM5I9EA==
X-Authority-Analysis: v=2.4 cv=CcwFJbrl c=1 sm=1 tr=0 ts=69c65af3 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=DAI0kpoKW5vxLVcNGS4A:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: 5hxdYz_SuRN4s14v9NECQp-LPjKzPD-P
X-Proofpoint-GUID: 5hxdYz_SuRN4s14v9NECQp-LPjKzPD-P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 clxscore=1011 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270075
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100264-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[ananthu.cv@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BFC2934297E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series adds dt binding and node for IMEM on glymur.

changes in v4:
 - picked up acked-by for the dt-binding
 - added dt node for imem on glymur
 - rebased the commits
 - link to v3: https://lore.kernel.org/all/20260129071435.2624252-1-ananthu.cv@oss.qualcomm.com/

changes in v3:
 - moved dt-binding to sram.yaml for mmio-sram fallback
 - link to v2: https://lore.kernel.org/all/20260123101501.2836551-2-ananthu.cv@oss.qualcomm.com/

changes in v2:
 - alphabetically sorted the placement of glymur in the list
 - link to v1: https://lore.kernel.org/all/20260122093319.2124906-1-ananthu.cv@oss.qualcomm.com/

Signed-off-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
---
Ananthu C V (2):
      dt-bindings: sram: document glymur as compatible
      arch: arm64: boot: dts: qcom: add IMEM and PIL regions for glymur

 Documentation/devicetree/bindings/sram/sram.yaml |  1 +
 arch/arm64/boot/dts/qcom/glymur.dtsi             | 16 ++++++++++++++++
 2 files changed, 17 insertions(+)
---
base-commit: 6b346ee225a1747218759fc4846aacf203e1eb35
change-id: 20260327-glymur-imem-bfcf2288e5f8

Best regards,
--  
Ananthu C V <ananthu.cv@oss.qualcomm.com>


