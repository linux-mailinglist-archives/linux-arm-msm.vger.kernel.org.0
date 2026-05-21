Return-Path: <linux-arm-msm+bounces-109083-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gHRnF0AHD2qFEQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109083-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 15:23:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 04CC35A5AFB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 15:23:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 30E1C3134353
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 13:13:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99B5C3E1718;
	Thu, 21 May 2026 13:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mtD0vhyJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dLyjxi49"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 377F83FCB10
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 13:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779368872; cv=none; b=FvwVJG4wmIwpF5VfElTKrqr0mjGRIv3tJkLlLMxAliqLxiPg2Ccul04LYDbVnHaJjb++R/6PULsZZgGRtix3AkNad6gam3q+mh9lzRDX5tnyx/BFTC537LzZ51OHcGt0c8mOVefN4zDvsKY/tbXN2K274WQrlcHa5bUJaTxKq80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779368872; c=relaxed/simple;
	bh=6Gmdmv7lAShyad7gH3r084z0fSBUtKnxVTK+fj/IZQ4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=So9zHbSLB9HHzw8Pnnnh2sKISO67innYVXjgZGoFnmCAAJKubt+F1SxRku581JcK4zwpR3vmYbekZL5uQhNxB/RlBpSu4LSxnCo5nEI2yBW8Sa8hUOlHeWHyeqYzX5oQcdik2fxBiKB7MUQRh3BRddUiD6tHsqeWCYxhQiXlE0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mtD0vhyJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dLyjxi49; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L9AMYv1731237
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 13:07:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pjzMpKoao6HjiAoTyRYUjE9J9YMQAJD0aLcYZMVcq34=; b=mtD0vhyJaRX/6n2h
	oNW6gwzXESyv1buCP50hNxmmf3vTalLeUsZ0c1zG4UA3yqyY/rMzvoPNMguUwP8U
	lmRUJRYJTZlOR1kuyW9g+suZD8y+QfacKRoilqBpq3QlwBY+sN5CfCwuIKQzOGXT
	cBGuIZI2+YVmjQQJ02WnVq7ELb8N1hKrD7XLhbOYBDryvOq9ExAIDU5lFZc4E9Is
	lj6rFukyzaW3MOxBL4YWfTsRbXYqMXzMEvfmM4Oxx5/tJghVblobUuKvtrvJjDou
	5p4Io1bt80tTDsy4Q7DNo0bVqzu458p2p+LGUz3nWUWGd7QM+833UD2wppY/LMaK
	ei1DCQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9c7f5fuy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 13:07:50 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36629e48023so5827910a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 06:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779368869; x=1779973669; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pjzMpKoao6HjiAoTyRYUjE9J9YMQAJD0aLcYZMVcq34=;
        b=dLyjxi49CRATZoGd96STPIRsHY0RmXf+YwUD9vNP6flSuYgeEQ5LvBhR3L/7c+cssc
         p3U0RRobhAGz1G8tZM83Gu7Al6AWBfpC3jNMnE3pVTKDlWbtNoRVh+kvH7JSIk0N78fc
         OlukV+Nk+70+TFXp5nnLRrffYaH0nfOHmXcYuZa1q5l0WB2iNsaYb6TZmgioAZkLYgXF
         TI9ZtWt+g9eUV0oWpbRtWU7M6XkmnOqaVpXqMywxXaYvHmY9C10aep2YxqEnhjBkpxmm
         eGmGmUZCNAacL2wO5WyECiaKSDzUHq6riCXAgPdSYXoGU/+szII9aVIgmTzy3gHnm677
         4P5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779368869; x=1779973669;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pjzMpKoao6HjiAoTyRYUjE9J9YMQAJD0aLcYZMVcq34=;
        b=RDwRSHNJqKxF5Lf7YtMyqKSgcBCpkHGuhD9W7KxO+BVfjOFr8Qdu2eb+scVBxc11eg
         VuRWCq7OXTqSa7hwimG44Vo9DDEIqS7EGlxOxx2n0Oi9bVwX7F4HmHYVxuQt0Ukses4Z
         O3ZssFtDD8K7Vzy8N5oEw/x9vU3xHwZ4bdO1EVNDGf1JTP1nLomadsj0SwVfZ2kOJbdD
         JTCvEJwc1oR3gWHkHpVTVIbFc99xSYZFhkQ3Xd37lEGZVMWrVEY0HgYLYt/QPE/ixeLX
         GS11WJKFOmtSyhYDCsMqJdTNv+yBOQTnj6DiccMz2V7VhYErauetTrdnCJnghF133nd2
         MQ7w==
X-Gm-Message-State: AOJu0Yz5H4uqnK7keOdoZ29alQXHBXgBcTgmeuThj/zYBbrlKoJZ6yDt
	FjxXDaviPqVccMxL/sSeKunnLmUSRp2w+PHkDw7sn+ynnQ8Y/7Kw7H2RN63aOFw3zhhtbCkz+bv
	38Gf83VweKvM6arQvGlGuE3LPe0qFvQxHyjw2zPL0Fhn7/1sV06GabvVyJrQYf0eyWGAY
X-Gm-Gg: Acq92OGKwvwS9K1BPQB/+Ss1YHFaMFg3S+VjJ0wcsZZpSb6TBBH4YJW2Gikvez1Cd0+
	H3X1MO3dqqp3gb9nA+o0akt/1iVYLXsgniTO/UHHKFjYe2j56w7Ynq0RZDIFdIhgTRq8sEYKDJR
	w8LQ/WpQyJQjV4wEGstI20B0ab0t4kehXRTAEmGBYagPO4tVe++zEb7A1t68RpfaCS5WxWbQsgI
	SkJNXEeeTQwayNWv2L0Sw3og1GTUUBEx9mJQPUBvVkMRjwJtH+aC9GhothkHenmlLalUic+xSC+
	pSQxmd4KuvJlwsKOZSwPM4kuMZ+zPUiyUUnRf0AAGj8g8+9FzpjfVV4e2MbRTSJ3wt4khfpNwsO
	EIKs0VLH7mA7czmwULnhXR1FPX9n7HTG7mSXHVbk1tV/1iFYa5Q2f+jkK
X-Received: by 2002:a05:6a20:432b:b0:398:7982:21df with SMTP id adf61e73a8af0-3b3085e3d36mr3488820637.9.1779368869084;
        Thu, 21 May 2026 06:07:49 -0700 (PDT)
X-Received: by 2002:a05:6a20:432b:b0:398:7982:21df with SMTP id adf61e73a8af0-3b3085e3d36mr3488775637.9.1779368868587;
        Thu, 21 May 2026 06:07:48 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c851991ab10sm294602a12.22.2026.05.21.06.07.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 06:07:48 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 21 May 2026 18:36:46 +0530
Subject: [PATCH 13/18] arm64: dts: qcom: sar2130p: Fix PCIe wake GPIO
 polarity
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-wake-v1-13-d822567be258@oss.qualcomm.com>
References: <20260521-wake-v1-0-d822567be258@oss.qualcomm.com>
In-Reply-To: <20260521-wake-v1-0-d822567be258@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779368813; l=993;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=6Gmdmv7lAShyad7gH3r084z0fSBUtKnxVTK+fj/IZQ4=;
 b=wGdhZ0hYyeA4bDycQ44LCcuTBZ340Xcs44tHG1zM/hJ7vJXCD9ufC013PUR2zj6Ne3Vshqexq
 HT3g0lZQzpODZkypbL979/aCHTTa/6OkgxXQbvif8muY7H5+0zBeTpM
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=c/ibhx9l c=1 sm=1 tr=0 ts=6a0f03a6 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=t4RzHNKIQDbQSdFyBH0A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: -LK8BAF0J1vT0xf2dx-1y5-U21Wvor-p
X-Proofpoint-ORIG-GUID: -LK8BAF0J1vT0xf2dx-1y5-U21Wvor-p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDEzMSBTYWx0ZWRfXxHXkoMnMLFWZ
 UnKlHeWntfYMSJiTKQ+n6ABnp5axVTqMw1mHtE889wE9Uz5wBd2xcHmippUODuYxeHlosjBHAQy
 cd4O04I1xkfjmU0iGh/c/eWGUOuXRLho7uTJHNSJMysHyBhgNyq5t1J+AlRDRuNz+5srY87cptw
 FfG2nHGaIik8n8M7UUEh3R/0E0MMP68VLmGGNJYeWha4LkZ09NuL2nDouqgWGJcL3GOyMp5Rupc
 vi0YFAoD+Ae3ZHBxnZ3pyde35F+Sd5HIquBf8O9q/jwvajZeNmWvyFT5zjn3+ouHOTQHTrvcP8w
 6s3Hu2fEtrPCEIqR+MBmz8FxFVHgk5y9yElZlMVSMkLyzO1CCAzCXkNRUEYLkysGT3dpIL9zdta
 +RSq9ehA51JHMYa1IjYeqqbWDzuPaHpPLrfA9fUIXfAefbPyBJ2iFYNWODmjSOpTVhhLncci0eG
 Fncb01DMtEytDdboCRw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0 bulkscore=0
 clxscore=1015 malwarescore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210131
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109083-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 04CC35A5AFB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The PCIe WAKE# signal is active-low as defined in the PCIe Base
Specification. Fix the wake-gpios polarity by using GPIO_ACTIVE_LOW
instead of GPIO_ACTIVE_HIGH.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
---
 arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dts b/arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dts
index 74778a5b19ba..71a09e76b359 100644
--- a/arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dts
+++ b/arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dts
@@ -358,7 +358,7 @@ &i2c10 {
 
 &pcie0 {
 	perst-gpios = <&tlmm 55 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 57 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 57 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie0_default_state>;
 	pinctrl-names = "default";

-- 
2.34.1


