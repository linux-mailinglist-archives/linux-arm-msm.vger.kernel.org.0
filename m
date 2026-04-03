Return-Path: <linux-arm-msm+bounces-101670-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eDh2BmXLz2m50gYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101670-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 16:15:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F0EC3950FD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 16:15:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4A0BA30309AA
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2026 14:11:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2A513C73E9;
	Fri,  3 Apr 2026 14:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mgD0X0p+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Oz9IO85Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F92B3C65F8
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Apr 2026 14:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775225489; cv=none; b=SjSaqs1aBkmHCW2/pIzGUqbmj4bO+zFqftFjVzlg9tlUToGQO19RfB/EZqQ/lBzy2etFpGgsi/zth4hfnR3B3H7CY3qMiSYzZm4Cx7KaOVEVo/B1vQQN8/lKdS4n8W6zEWb8FuK3hUQUufeVEyreRYuGh1QLCYasTW0ti4ftSyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775225489; c=relaxed/simple;
	bh=vGgcAuslyoJWyNGK44xG02vagKnjoQAZqSHv+gjTJcs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bwcXImJ6SmNe3tqm6yLjr/99+T4IH6vpYSxl07Qzp6IGbbo0rRRwrTlziXxHtILTPqSJaa9BzDhKablwFvEEQct0Ubnqu0ynKbz2ir5OAGF4orR8X76dX7+gm2Ytkx9JyAdUMbFgbfA5KeRlvChjWVE7DsQ0SqklNhJhIOq8fkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mgD0X0p+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Oz9IO85Z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 633BeeqC982316
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Apr 2026 14:11:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w7V9GD9oO93FrsRNDlEG2IE2JOPbAv1X0jFKI17MXAE=; b=mgD0X0p+lnkgcMEt
	nolq6DJf7vDGFqsHdp15iEvOFsUZFgEwQq4/oLqbCFT4bYXNwblBEVUc9SUZD777
	gA6O5lyPlv7OobVLvM4+EnK+NFEIy2kUyD6Ct8B4lECtGlRovjUx6raq0kqFSMgn
	Xa/tSoW+epBtk36/k7dXq2/SzjFatCo2ObtRNXj8WeXSinImVAPqm0EwcKKQ51PW
	XZSefASxqwWwuflHlkg7G53Li/Kf4DP1oQWiy4gZ6q/PC05kskUqnRmsockJi/rN
	xemrn/ag6SbcSpY5EqC7g1dh5eKHJxelqiMDss9MMRp7d6GMxkjxSn1FfC1mGaGV
	ewJpyA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9tupusrj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Apr 2026 14:11:25 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-60554e770e0so524227137.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Apr 2026 07:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775225485; x=1775830285; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w7V9GD9oO93FrsRNDlEG2IE2JOPbAv1X0jFKI17MXAE=;
        b=Oz9IO85Z8/m6/0NjdPAMIrY1NsORKUUF8JjujGIuFw+RHRbcOUunCqgTBoEocUo+Jh
         Xx8mPWxOsJSVVsUgK9IG0Thwumt5JxZCAOqBGJY9xkpBWcNIDHlKOfWz2FFYQsSwtXtn
         p7X876qEqtvTqjEPD6rUZbD3h285FD7ImiVmvbSaQpCwEn3Ias9L11Ksu80m+CsJuS8c
         /fj9ynDFwjhh49hR2mcdBiZcTaPeT1dq9tJ18m/Xv2g9XRFdYP5uqlKr5eyf/F3CbqSg
         M+wo1kGhi3NE/2wX0ejVknBndiz7SUi3wfSu4m4RURF75M6ch7YKEun9BastWTMHGKBL
         i07g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775225485; x=1775830285;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=w7V9GD9oO93FrsRNDlEG2IE2JOPbAv1X0jFKI17MXAE=;
        b=qy2noAFirc6iCFqF603BqsXcY2toS/SB8nLPpr4KNFqQYG/LVkgklD1JV96felK4I8
         BJSqnYA0MFzQcDvbVOWqm3o7/R4z2dMPETeJs48d/lfVRCUkkMxGqqdWRIY6mLPzyNB8
         Yr0f/llOGkHnmy+Kyfp/4JPiziN3C2GxQxKa0aFQ17GFWnpxDPhN4SV18Eu9Ega8sQ3T
         0GjV9KMiUpKezYx3fYNnmQvq88Ri8G9Si5INrNQVdj/VBSC8Prs23A/M9PeUbO/6HdX2
         sD5pR1ku68U4EWLxNo2al4+8RG9IMt6JR6Eg9HwX89fDC7eLYdDvUqAmvRccNNDcPFtE
         17bA==
X-Gm-Message-State: AOJu0YzKVsP8LNacIm7DELs+4lXIMn2tNghBFZeecET4O2C+7Mw7JEYf
	hbLnonPS90BEyQrBaYD8ZRb1p1bPQXoW+QiQrHpbpCRJDKtYmBKAXrhgFU5AmEbRBJ0V++dLzeR
	8FENo1q6862wPSVHvnrYg5M3SdoNTWz3bzM8pWHgJjJb2DStbWUpYgmdayylztUZysCdd
X-Gm-Gg: AeBDieum14Nm1BmDRIibr+IEh2sLSjdA9uGkZhqP3fDfg4q2Ew3sZUGpn+hZB2G1wQ1
	dxlVzMYrtT3E8VsUfQZr9I5FxeuB9P6CH8ZHPrOaJpuxpYvtZNpGO716ytzihu6x4Rk/wrmiGeY
	jQ76NRYfAcVgzvjZUJIxikOidLMCFmReK3fqwWYJ5BQGj5BLwgcnc3vs8S+TD7yfAX1RRze4KSP
	dEuCCNQ5MF8IMkBYTLOlAcTUrjywfFL9c40WljoDuDMjqSUf2lB58oALVlOn7oaGvJNZ/1BoK+L
	zhz0GuIaQCKqayfEoqgtnXMAV0E6Pa3ZJscbSwpbNqEl7U+CUxicydfwbcadaO+7qUaAlXmg9UL
	HhtlTNj1RrGnA7CBMNUOcwBotqxvRfqe6Y24NJlaq9zqf/iaeev0=
X-Received: by 2002:a67:e717:0:b0:604:ee6f:18d with SMTP id ada2fe7eead31-605a5136c50mr1017613137.35.1775225485182;
        Fri, 03 Apr 2026 07:11:25 -0700 (PDT)
X-Received: by 2002:a67:e717:0:b0:604:ee6f:18d with SMTP id ada2fe7eead31-605a5136c50mr1017605137.35.1775225484753;
        Fri, 03 Apr 2026 07:11:24 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:129d:59e8:f7c9:47ca])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48899d1b19esm30127315e9.6.2026.04.03.07.11.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 07:11:23 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 03 Apr 2026 16:10:52 +0200
Subject: [PATCH 4/7] clk: qcom: Add TCSR clock driver for Nord SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260403-nord-clks-v1-4-018af14979fd@oss.qualcomm.com>
References: <20260403-nord-clks-v1-0-018af14979fd@oss.qualcomm.com>
In-Reply-To: <20260403-nord-clks-v1-0-018af14979fd@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=11446;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=WngLlsIJYc2VIn1dcAieQln8rLCNCDVE6moeVof9C0I=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpz8p+Dir+221cIHEjFe9bHg3dZpfJH9yxCPp4f
 XNSNEtapoSJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCac/KfgAKCRAFnS7L/zaE
 wy5TD/0anfd0cK5Z4x1lKWKDsYak747gBS/wSlnp6AfKfyEeNMCP6W6l+TF7qjWGJ4a6TUTZsnT
 7KRdN/yx4Rs1NS6hrPcH32PL/7BQxX9+adPgF/4Yu1LU5Kg9+M+yV9KiOPHKtvz2ZivTdoybomM
 1dal0zNBmRNPT7f/bxJvmtWf6vePYzkgWvhQ9tHhycmYTMDgK1gG70ShOD+MsQHZ6WqemTrAcFV
 yamcwnzva2nmEB4TFbVaQFX0MGlHcgqFdyhLhoPaT/O9gsV9Y46F2nxfXjCjVKV7bc0UEUqVL4L
 fbKVmsiqx4SGlOKXZ2iwbGqabDp6CCO5hGZle6SM+XpNSFNe0Az12A/cfJ60BAVtcLbdygllwE3
 8OP+7mI7j9uH3fqj+WyEWlwPcIqgXYGfBtPz2Xk4i/Qv9FF/1Z0FsMBgmHs9zluGSX7ItWWYvKz
 MSq+B/q5EzQQ/cqTojLokOg3QcdDQBljZQHixHY7URpZSFgJ09LO2fbTmb2ESHAFAPlt7edRrZv
 qc0cD1tdrHNunTtxgye1OJQyxEsUGC1hT6zx03GUwQF07Fs6+MjnnL/4TnH4zt4YaKzT58a/3dc
 /tuHWM36XZqEOGQR2hAmuZ/kMW5IROGu7URxCpGqnpCHs7piZxTuxe1cFguxS2Lzs5DMSAIN3M4
 KEnVa/TGtwpqC3g==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDEyNiBTYWx0ZWRfX+Angk3t9ZYxF
 wRbWENmZY78wFAb+xZYqPakPU1ynEGcbeY7r/GkOu+aU+1CIvqyeyxzCYG4IuoJd2PTAfHt3TOF
 njChX2o/1T9qjgNn4vToM+KwWFZdz6XnGq5C1xVdDkOObD58L3zLtc7ktxSWQF9BVy8JHFRFZ7D
 ebLrnfQmogQPaLkGllIBE/GCQkxuxKK80e+Le/8ov2WRLYy0t5YuH12oLoevOGuAZPIGFji+JvD
 0gsOdaSj/eOLYaS7+UxoT6isPHWtNvRTdW9brmcGaZjaMg1nV26g78ahWOZuJ0t3bghCaFj7cnI
 6dIkwFaCdFFsUQsqjmE6GvHE3Me6GiSQBgLhyfvnr1vGNNbQl4jmRY7+YWfSoll193/0Q8fteeJ
 BJDcRP4PDUmnNCg2KN7/Xv9iYLfI5c1WcF8pgtxmcEzbpayQHFnaEzJSkuaMZksOt+9rPg3R+Yb
 Rz951XrYWwDZVT1zE9g==
X-Proofpoint-ORIG-GUID: lafgzLNfaMVqZM-tlNREXI5JqgEcms37
X-Proofpoint-GUID: lafgzLNfaMVqZM-tlNREXI5JqgEcms37
X-Authority-Analysis: v=2.4 cv=DZ0aa/tW c=1 sm=1 tr=0 ts=69cfca8d cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=BTsOh_UvGg-GVyuq9HEA:9 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_04,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 malwarescore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604030126
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101670-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,oss.qualcomm.com,quicinc.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9F0EC3950FD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Taniya Das <taniya.das@oss.qualcomm.com>

Add a clock driver for the TCSR clock controller found on Nord SoC,
which provides refclks for PCIE, USB, SGMII, UFS subsystems.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
[Shawn:
- Use compatible qcom,nord-tcsrcc
- Drop include of <linux/of.h> as the driver doesn't use any OF APIs]
Co-developed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/clk/qcom/Kconfig       |   7 +
 drivers/clk/qcom/Makefile      |   1 +
 drivers/clk/qcom/tcsrcc-nord.c | 337 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 345 insertions(+)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 8f55f10261ec2dd4add61101c5619cc4516f7d66..10c74db7e072f560f4bc26f81b4378034d1f9bf6 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -674,6 +674,13 @@ config QCS_GCC_404
 	  Say Y if you want to use multimedia devices or peripheral
 	  devices such as UART, SPI, I2C, USB, SD/eMMC, PCIe etc.
 
+config CLK_NORD_TCSRCC
+	tristate "Nord TCSR Clock Controller"
+	depends on ARM64 || COMPILE_TEST
+	help
+	  Support for the TCSR clock controller on Nord devices.
+	  Say Y if you want to use peripheral devices such as PCIe, USB, UFS etc.
+
 config SA_CAMCC_8775P
 	tristate "SA8775P Camera Clock Controller"
 	depends on ARM64 || COMPILE_TEST
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index 103d6c4b860ccbc6b4ad552e9e6af43298a4474d..1a7ff1986b834f48dbaa2fd8c2559f0046ea7579 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -35,6 +35,7 @@ obj-$(CONFIG_CLK_KAANAPALI_GCC) += gcc-kaanapali.o
 obj-$(CONFIG_CLK_KAANAPALI_GPUCC) += gpucc-kaanapali.o gxclkctl-kaanapali.o
 obj-$(CONFIG_CLK_KAANAPALI_TCSRCC) += tcsrcc-kaanapali.o
 obj-$(CONFIG_CLK_KAANAPALI_VIDEOCC) += videocc-kaanapali.o
+obj-$(CONFIG_CLK_NORD_TCSRCC) += tcsrcc-nord.o
 obj-$(CONFIG_CLK_X1E80100_CAMCC) += camcc-x1e80100.o
 obj-$(CONFIG_CLK_X1E80100_DISPCC) += dispcc-x1e80100.o
 obj-$(CONFIG_CLK_X1E80100_GCC) += gcc-x1e80100.o
diff --git a/drivers/clk/qcom/tcsrcc-nord.c b/drivers/clk/qcom/tcsrcc-nord.c
new file mode 100644
index 0000000000000000000000000000000000000000..ed0f4909158f6e7e073e111549a8740f6a7fc94c
--- /dev/null
+++ b/drivers/clk/qcom/tcsrcc-nord.c
@@ -0,0 +1,337 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include <dt-bindings/clock/qcom,nord-tcsrcc.h>
+
+#include "clk-alpha-pll.h"
+#include "clk-branch.h"
+#include "clk-pll.h"
+#include "clk-rcg.h"
+#include "clk-regmap.h"
+#include "clk-regmap-divider.h"
+#include "clk-regmap-mux.h"
+#include "common.h"
+#include "reset.h"
+
+enum {
+	DT_BI_TCXO_PAD,
+};
+
+static struct clk_branch tcsr_dp_rx_0_clkref_en = {
+	.halt_reg = 0xa008,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0xa008,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "tcsr_dp_rx_0_clkref_en",
+			.parent_data = &(const struct clk_parent_data){
+				.index = DT_BI_TCXO_PAD,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch tcsr_dp_rx_1_clkref_en = {
+	.halt_reg = 0xb008,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0xb008,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "tcsr_dp_rx_1_clkref_en",
+			.parent_data = &(const struct clk_parent_data){
+				.index = DT_BI_TCXO_PAD,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch tcsr_dp_tx_0_clkref_en = {
+	.halt_reg = 0xc008,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0xc008,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "tcsr_dp_tx_0_clkref_en",
+			.parent_data = &(const struct clk_parent_data){
+				.index = DT_BI_TCXO_PAD,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch tcsr_dp_tx_1_clkref_en = {
+	.halt_reg = 0xd008,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0xd008,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "tcsr_dp_tx_1_clkref_en",
+			.parent_data = &(const struct clk_parent_data){
+				.index = DT_BI_TCXO_PAD,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch tcsr_dp_tx_2_clkref_en = {
+	.halt_reg = 0xe008,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0xe008,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "tcsr_dp_tx_2_clkref_en",
+			.parent_data = &(const struct clk_parent_data){
+				.index = DT_BI_TCXO_PAD,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch tcsr_dp_tx_3_clkref_en = {
+	.halt_reg = 0xf008,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0xf008,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "tcsr_dp_tx_3_clkref_en",
+			.parent_data = &(const struct clk_parent_data){
+				.index = DT_BI_TCXO_PAD,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch tcsr_pcie_clkref_en = {
+	.halt_reg = 0x8,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x8,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "tcsr_pcie_clkref_en",
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
+	.halt_reg = 0x3008,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x3008,
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
+static struct clk_branch tcsr_usb2_0_clkref_en = {
+	.halt_reg = 0x4008,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x4008,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "tcsr_usb2_0_clkref_en",
+			.parent_data = &(const struct clk_parent_data){
+				.index = DT_BI_TCXO_PAD,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch tcsr_usb2_1_clkref_en = {
+	.halt_reg = 0x5008,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x5008,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "tcsr_usb2_1_clkref_en",
+			.parent_data = &(const struct clk_parent_data){
+				.index = DT_BI_TCXO_PAD,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch tcsr_usb2_2_clkref_en = {
+	.halt_reg = 0x6008,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x6008,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "tcsr_usb2_2_clkref_en",
+			.parent_data = &(const struct clk_parent_data){
+				.index = DT_BI_TCXO_PAD,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch tcsr_usb3_0_clkref_en = {
+	.halt_reg = 0x8008,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x8008,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "tcsr_usb3_0_clkref_en",
+			.parent_data = &(const struct clk_parent_data){
+				.index = DT_BI_TCXO_PAD,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch tcsr_usb3_1_clkref_en = {
+	.halt_reg = 0x7008,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x7008,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "tcsr_usb3_1_clkref_en",
+			.parent_data = &(const struct clk_parent_data){
+				.index = DT_BI_TCXO_PAD,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch tcsr_ux_sgmii_0_clkref_en = {
+	.halt_reg = 0x1008,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x1008,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "tcsr_ux_sgmii_0_clkref_en",
+			.parent_data = &(const struct clk_parent_data){
+				.index = DT_BI_TCXO_PAD,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch tcsr_ux_sgmii_1_clkref_en = {
+	.halt_reg = 0x2008,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x2008,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "tcsr_ux_sgmii_1_clkref_en",
+			.parent_data = &(const struct clk_parent_data){
+				.index = DT_BI_TCXO_PAD,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_regmap *tcsr_cc_nord_clocks[] = {
+	[TCSR_DP_RX_0_CLKREF_EN] = &tcsr_dp_rx_0_clkref_en.clkr,
+	[TCSR_DP_RX_1_CLKREF_EN] = &tcsr_dp_rx_1_clkref_en.clkr,
+	[TCSR_DP_TX_0_CLKREF_EN] = &tcsr_dp_tx_0_clkref_en.clkr,
+	[TCSR_DP_TX_1_CLKREF_EN] = &tcsr_dp_tx_1_clkref_en.clkr,
+	[TCSR_DP_TX_2_CLKREF_EN] = &tcsr_dp_tx_2_clkref_en.clkr,
+	[TCSR_DP_TX_3_CLKREF_EN] = &tcsr_dp_tx_3_clkref_en.clkr,
+	[TCSR_PCIE_CLKREF_EN] = &tcsr_pcie_clkref_en.clkr,
+	[TCSR_UFS_CLKREF_EN] = &tcsr_ufs_clkref_en.clkr,
+	[TCSR_USB2_0_CLKREF_EN] = &tcsr_usb2_0_clkref_en.clkr,
+	[TCSR_USB2_1_CLKREF_EN] = &tcsr_usb2_1_clkref_en.clkr,
+	[TCSR_USB2_2_CLKREF_EN] = &tcsr_usb2_2_clkref_en.clkr,
+	[TCSR_USB3_0_CLKREF_EN] = &tcsr_usb3_0_clkref_en.clkr,
+	[TCSR_USB3_1_CLKREF_EN] = &tcsr_usb3_1_clkref_en.clkr,
+	[TCSR_UX_SGMII_0_CLKREF_EN] = &tcsr_ux_sgmii_0_clkref_en.clkr,
+	[TCSR_UX_SGMII_1_CLKREF_EN] = &tcsr_ux_sgmii_1_clkref_en.clkr,
+};
+
+static const struct regmap_config tcsr_cc_nord_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0xf008,
+	.fast_io = true,
+};
+
+static const struct qcom_cc_desc tcsr_cc_nord_desc = {
+	.config = &tcsr_cc_nord_regmap_config,
+	.clks = tcsr_cc_nord_clocks,
+	.num_clks = ARRAY_SIZE(tcsr_cc_nord_clocks),
+};
+
+static const struct of_device_id tcsr_cc_nord_match_table[] = {
+	{ .compatible = "qcom,nord-tcsrcc" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, tcsr_cc_nord_match_table);
+
+static int tcsr_cc_nord_probe(struct platform_device *pdev)
+{
+	return qcom_cc_probe(pdev, &tcsr_cc_nord_desc);
+}
+
+static struct platform_driver tcsr_cc_nord_driver = {
+	.probe = tcsr_cc_nord_probe,
+	.driver = {
+		.name = "tcsrcc-nord",
+		.of_match_table = tcsr_cc_nord_match_table,
+	},
+};
+
+module_platform_driver(tcsr_cc_nord_driver);
+
+MODULE_DESCRIPTION("QTI TCSRCC NORD Driver");
+MODULE_LICENSE("GPL");

-- 
2.47.3


