Return-Path: <linux-arm-msm+bounces-97022-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YKlgGJSBsWmjCwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97022-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 15:52:04 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DF0C4265C2F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 15:52:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BCA3630EA420
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 14:47:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C51493C456E;
	Wed, 11 Mar 2026 14:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h24agLFk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XZb9AaoN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 096C23CF036
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 14:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773240448; cv=none; b=e06lp81pUrF9Tb8Pd059EVI7TsuCT5iojBlvQBdq1hhy5Nv5WfqKb8n20K9CKktvMCcNeqwSMVZjzcp96hNv1pMkWMSmHoEysDonbPbq/6sFnuhROMEYA+71tIL35am0CWBt91qmICKgY9N8JabOAxYqJq+CZHpAjJGP+RAuDbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773240448; c=relaxed/simple;
	bh=lfcic3rWieSBOpNTTe996fQWPXc0BONb1A3wAIkOn00=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uZfgTFFZ6y4ZkgtsdPcaLfnTWi0Jrd5cUVGZHzLvcjFSDYzNG37Kbi3fdqIUckeC9lcjoO+XMuYQMtNOGhF/X994RdUPOcHslV3FtZ0vWspME1qsZJGQPM5FdethU5VSZluv0byh+WCXhViEys5emU5nN6VtjnwIDUGAXmBCT9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h24agLFk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XZb9AaoN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62BCJMoo2140298
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 14:47:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ANpPnl7R12WEG+PZegDGsUgxLaXurmiOJ2hV3onBaYs=; b=h24agLFkF6X7hYfu
	Ni5EZLDaYXrEvW7l8sgsaQ9y1UjiAjidP7d3j7GejxcShaHHsHektsCUHlRRwVvM
	4ovNlmsENp9EEjJ57+cbh10kzZ3A75PYVl8PE6OjxlXPAmotPwcvDsNdWtEUotHv
	Xdsg4zRnBBNgRZYdplQiIcznM8gVmBQ/SV24yY3bT5iVrSykyG2peg03qQEkg+aj
	AwmDJMFFead2w+o89n6mrih1OMFMOTZLQplZVG86dSQ6GuWRfCFmR8An8ctqduyM
	SW7IPsTzhAyXxZI+LpaiY01L1V8nbymXtf4DXIS+j+s2WpP8nAvrPlJcBYiXbK1H
	vMDVpQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctqgkc2n7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 14:47:25 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd7d4cc049so3932311485a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 07:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773240445; x=1773845245; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ANpPnl7R12WEG+PZegDGsUgxLaXurmiOJ2hV3onBaYs=;
        b=XZb9AaoNfXZwq4ejsJX5pmEe/D3r5HfLr+8DQ1eOX+s5R8qPA15G6Izd3qTkULW1k8
         tfG2F2PSPkxg+GZQ6ilhYoTeEbsuRqqxkj79hobNmOHy6NBwe0bekdHuuGMqvpewAo3R
         NnaYXvn3mxPmCVfyPNFXk/2u9YFz+JCNmExETuVHyHvEWVSdkTw9Kzz1T9Q3hQzw0p4d
         SMb0grvotoKAHi/Upodk6kk4dTZ+bNdK0FsHsMU3ztiLN3WlaOSBxK67iRdp80/DuSGP
         MwWXYFJ+H6zTAtdoBJcb5tVYlMkcXEv9M8h+rSJPNHL3nG9ltylP05j9FixLGfnbuAIw
         R8fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773240445; x=1773845245;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ANpPnl7R12WEG+PZegDGsUgxLaXurmiOJ2hV3onBaYs=;
        b=Vb/2b0luA7sINOWb7rfN5QwvCCU4d3ASvCzL40SHSLHiV2JbohRYrLPunwq/KQqU+8
         xQayy2jeEq4blbir0VmvX1LqWrwDtB9A488GcrUdaoXobF2yRkUGYPhQnhnB0hlVdjGZ
         0Vjgxth+ohD6QDmp5UeTLYLFS9CPNNuqJdOpjVud+fvSAJ6UHRYGbAnaPQLE2cgxF6nS
         sHZAMZJe+iNo3Tiv7ec5OJoJqEZg0qoSZG/skosBUVN0DEl+UIuDlb2qvSKZrkpBuY4I
         3g2JQoG8Ab/DFPrUA3I6gHwTJtntVi3I2YVBBPZWsGlVCFDS978qfVDH9HCEIRvRegrb
         I26w==
X-Gm-Message-State: AOJu0Yy99kS/UyCvIbw8JHV18YIU3QzCae1imioTaG/4DTtrDTWFLALF
	dfJ3cMeym6xVJvQH0crcnwWnJfgHcPnYUQaXYLjFtEblIHRhme2ogJYsgzo276bqQW97+15LQc7
	kHLWfrHhDaEo+Q5EuCcZb3lgmqvRME6Jse8MdLb4okZ+kR1pj+V9rb34wJciHzpe2GkE6
X-Gm-Gg: ATEYQzxh1DX6I9F3rNWF9+HBDxM8t0QaHzWENSFxtKVfMueGfFbm6NMkabNB3HMv/o+
	dE6unpEW+MiXnnLrmC+irawfVMTGWuuJy0Oc9cRYAE9WB4u4AX608zo4cSMeB3J+V6lTE8WOZ+n
	eETaW5vjvwzJyGtg1ypgcxvsj+gxqR6pMzpPRTW02StOk20Bsid4GEE5WLoaEFG1nEKu5CMgDRs
	PLlKVpGaGKDIpj+sdiyAgRh7jLJvzwuHczeH0BsWpRKhlGihzztQmPqYODrr7WwcBZOiwYzHZ0n
	jURu7HjjO8hOeDUg0bjTVGvjbKyGNrTH1ksLmkrZMQCku2yCLNC56PnuJWhu/rfCHi4/wA4AKbT
	K803QNLuy1LNq6ZKW1fADFGlzo1kakA==
X-Received: by 2002:a05:620a:d8a:b0:8cd:99de:6b5b with SMTP id af79cd13be357-8cda1ac6e95mr360021485a.72.1773240444529;
        Wed, 11 Mar 2026 07:47:24 -0700 (PDT)
X-Received: by 2002:a05:620a:d8a:b0:8cd:99de:6b5b with SMTP id af79cd13be357-8cda1ac6e95mr360017385a.72.1773240443993;
        Wed, 11 Mar 2026 07:47:23 -0700 (PDT)
Received: from hackbox.lan ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439f818d61esm7992501f8f.8.2026.03.11.07.47.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 07:47:22 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 16:46:36 +0200
Subject: [PATCH RESEND v6 6/6] clk: qcom: Add TCSR clock driver for Eliza
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-eliza-clocks-v6-6-453c4cf657a2@oss.qualcomm.com>
References: <20260311-eliza-clocks-v6-0-453c4cf657a2@oss.qualcomm.com>
In-Reply-To: <20260311-eliza-clocks-v6-0-453c4cf657a2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=6765;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=lfcic3rWieSBOpNTTe996fQWPXc0BONb1A3wAIkOn00=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpsYBkx1C+3f5ZJNewUP0PApAcMDR9qmnuQNi6R
 1A/mTaWEeaJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCabGAZAAKCRAbX0TJAJUV
 Vn8lD/0bPEJE31DKb6Q86OZJoUXOnFUEvN+d87rE3xQhC52Lvf51WvvP+KpPM8KSGakS+N1pO1g
 KahSvb9pvWdu+W3S0nVZhz7y8MCAFJPRlULPR4NB6O+6bqHcB0SmNH68PCyE9EEWi8T7bt9q8mg
 hV4wBODfnX3G4cT2PnMuzyF3mELtLgXu81Kqfn4BtGlhMOhT/j+C9vVj5ujNCKrnxO1YhqqcpYz
 lWa4y1IgdKCXV6O7WbPAs5AaCvHOy4swAKx5c1cyoP7xBIStO9MtqMS2IZinEvKh2XHRsCug+/r
 KpbwYGJZKEsIpV5Bk8LQ4rFdJv82NU4bhBloANkxSg1l7en7fB7Q1tPE87rKbeG6tjRTnkgzHWa
 j6Y5I3h9Itu0/unIISYkR/eoYU6fUvKfOtgI4S0aVfHt/wiDeHIPn8E/VcED7ODrnMTR+PmM/zR
 IiN/BJTszKABEpA8Wh0dBRpkBKTxInrt0C+m96E6ZfYPgiR+/WF17GIneS0RhH3O4eGUNr83REg
 xJHrWyjYZvbStHNQigKi2GB/50Bn2U9yuvaQ9IT/cmvj1H8YIs+Se82qWa8pU7t8wdNUoRSzPJ1
 Cyg01DIgegeJjHOyLgr428dRwGb6qLCG+6D/TaSHEnyaeEkWpun7X+9tpxXxkmQnDMYQrowXkN+
 E5wkbYYCLeDPlcg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: hw5W5TqDYP8GKxwUD-2VYj6HgZmMVfiI
X-Proofpoint-ORIG-GUID: hw5W5TqDYP8GKxwUD-2VYj6HgZmMVfiI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDEyNSBTYWx0ZWRfX2deWmQSHDYcG
 01PnolLvSnSbh0DFxOAYX0obiXraQyVU9bCOwllGvgmMtqmS48dXZK3V4cfFKvXx0bgXWrqkKka
 crn3Omg/3tFUDAXYeAfOilGPczyazVJ17zDpBpxCJxQNrIEUuW7oHJZoLT1Re9naKwVt2NdWMKz
 bfYLptDyLGhSWDrlY4kvmPbObGfUsBBnFRv1Fgg5LbM0x4AQTS0f1OdZGi82rHO11qhI8cytnju
 oI1m1y941qgJhPj2QhGnCahu3BPZfsqK4xbW8pc7hUGJ9auwGBM8G/8/4cTkCC3VA0OQXSydmR1
 eQ564nRkJoByazHJLbAYmb0xeVwkhDVP1FPbsJb6RPZp1vzzmCI672NtSwppuLQEEULT9azwapP
 uA7iNd9slXOWb4XXvwREcmsVsMTugRl3sAir0oT85ckvfRdbQPiC8yDe5ng5jP1PLV2DjXxq9CX
 3+Zi8/PaHXVDdHkgrKw==
X-Authority-Analysis: v=2.4 cv=M4JA6iws c=1 sm=1 tr=0 ts=69b1807d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=2JdIKsXJOnzpQMKPkA4A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 spamscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110125
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
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97022-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DF0C4265C2F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add the TCSR clock controller that provides the refclks on Eliza
platform for PCIe, USB and UFS subsystems.

Co-developed-by: Taniya Das <taniya.das@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/Kconfig        |   8 ++
 drivers/clk/qcom/Makefile       |   1 +
 drivers/clk/qcom/tcsrcc-eliza.c | 180 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 189 insertions(+)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index dc5d15a3056c..ced60771ec64 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -28,6 +28,14 @@ config CLK_ELIZA_GCC
 	  Say Y if you want to use peripheral devices such as UART, SPI,
 	  I2C, USB, UFS, SDCC, etc.
 
+config CLK_ELIZA_TCSRCC
+	tristate "Eliza TCSR Clock Controller"
+	depends on ARM64 || COMPILE_TEST
+	select QCOM_GDSC
+	help
+	  Support for the TCSR clock controller on Eliza devices.
+	  Say Y if you want to use peripheral devices such as USB/PCIe/UFS.
+
 config CLK_GLYMUR_DISPCC
 	tristate "Glymur Display Clock Controller"
 	depends on ARM64 || COMPILE_TEST
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index 97a0e2cd0631..82c5c2ec968e 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -21,6 +21,7 @@ clk-qcom-$(CONFIG_QCOM_GDSC) += gdsc.o
 obj-$(CONFIG_APQ_GCC_8084) += gcc-apq8084.o
 obj-$(CONFIG_APQ_MMCC_8084) += mmcc-apq8084.o
 obj-$(CONFIG_CLK_ELIZA_GCC) += gcc-eliza.o
+obj-$(CONFIG_CLK_ELIZA_TCSRCC) += tcsrcc-eliza.o
 obj-$(CONFIG_CLK_GFM_LPASS_SM8250) += lpass-gfm-sm8250.o
 obj-$(CONFIG_CLK_GLYMUR_DISPCC) += dispcc-glymur.o
 obj-$(CONFIG_CLK_GLYMUR_GCC) += gcc-glymur.o
diff --git a/drivers/clk/qcom/tcsrcc-eliza.c b/drivers/clk/qcom/tcsrcc-eliza.c
new file mode 100644
index 000000000000..ef9b6393f57e
--- /dev/null
+++ b/drivers/clk/qcom/tcsrcc-eliza.c
@@ -0,0 +1,180 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include <dt-bindings/clock/qcom,eliza-tcsr.h>
+
+#include "clk-branch.h"
+#include "clk-regmap.h"
+#include "common.h"
+
+enum {
+	DT_BI_TCXO_PAD,
+};
+
+static struct clk_branch tcsr_hdmi_clkref_en = {
+	.halt_reg = 0x14,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x14,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "tcsr_hdmi_clkref_en",
+			.parent_data = &(const struct clk_parent_data){
+				.index = DT_BI_TCXO_PAD,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch tcsr_pcie_0_clkref_en = {
+	.halt_reg = 0x0,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x0,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "tcsr_pcie_0_clkref_en",
+			.parent_data = &(const struct clk_parent_data){
+				.index = DT_BI_TCXO_PAD,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch tcsr_pcie_1_clkref_en = {
+	.halt_reg = 0x1c,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x1c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "tcsr_pcie_1_clkref_en",
+			.parent_data = &(const struct clk_parent_data){
+				.index = DT_BI_TCXO_PAD,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch tcsr_ufs_clkref_en = {
+	.halt_reg = 0x8,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x8,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "tcsr_ufs_clkref_en",
+			.parent_data = &(const struct clk_parent_data){
+				.index = DT_BI_TCXO_PAD,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch tcsr_usb2_clkref_en = {
+	.halt_reg = 0x4,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x4,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "tcsr_usb2_clkref_en",
+			.parent_data = &(const struct clk_parent_data){
+				.index = DT_BI_TCXO_PAD,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch tcsr_usb3_clkref_en = {
+	.halt_reg = 0x10,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x10,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "tcsr_usb3_clkref_en",
+			.parent_data = &(const struct clk_parent_data){
+				.index = DT_BI_TCXO_PAD,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_regmap *tcsr_cc_eliza_clocks[] = {
+	[TCSR_HDMI_CLKREF_EN] = &tcsr_hdmi_clkref_en.clkr,
+	[TCSR_PCIE_0_CLKREF_EN] = &tcsr_pcie_0_clkref_en.clkr,
+	[TCSR_PCIE_1_CLKREF_EN] = &tcsr_pcie_1_clkref_en.clkr,
+	[TCSR_UFS_CLKREF_EN] = &tcsr_ufs_clkref_en.clkr,
+	[TCSR_USB2_CLKREF_EN] = &tcsr_usb2_clkref_en.clkr,
+	[TCSR_USB3_CLKREF_EN] = &tcsr_usb3_clkref_en.clkr,
+};
+
+static const struct regmap_config tcsr_cc_eliza_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x1c,
+	.fast_io = true,
+};
+
+static const struct qcom_cc_desc tcsr_cc_eliza_desc = {
+	.config = &tcsr_cc_eliza_regmap_config,
+	.clks = tcsr_cc_eliza_clocks,
+	.num_clks = ARRAY_SIZE(tcsr_cc_eliza_clocks),
+};
+
+static const struct of_device_id tcsr_cc_eliza_match_table[] = {
+	{ .compatible = "qcom,eliza-tcsr" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, tcsr_cc_eliza_match_table);
+
+static int tcsr_cc_eliza_probe(struct platform_device *pdev)
+{
+	return qcom_cc_probe(pdev, &tcsr_cc_eliza_desc);
+}
+
+static struct platform_driver tcsr_cc_eliza_driver = {
+	.probe = tcsr_cc_eliza_probe,
+	.driver = {
+		.name = "tcsr_cc-eliza",
+		.of_match_table = tcsr_cc_eliza_match_table,
+	},
+};
+
+static int __init tcsr_cc_eliza_init(void)
+{
+	return platform_driver_register(&tcsr_cc_eliza_driver);
+}
+subsys_initcall(tcsr_cc_eliza_init);
+
+static void __exit tcsr_cc_eliza_exit(void)
+{
+	platform_driver_unregister(&tcsr_cc_eliza_driver);
+}
+module_exit(tcsr_cc_eliza_exit);
+
+MODULE_DESCRIPTION("QTI TCSR_CC Eliza Driver");
+MODULE_LICENSE("GPL");

-- 
2.48.1


