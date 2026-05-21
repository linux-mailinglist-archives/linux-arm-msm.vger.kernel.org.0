Return-Path: <linux-arm-msm+bounces-109076-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KJZNK4YPD2rOEgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109076-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 15:58:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F90B5A6974
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 15:58:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E5C4B32452FD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 13:11:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0728C3DCDB4;
	Thu, 21 May 2026 13:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NacZ6rzN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T9qAES8h"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF293F58CE
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 13:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779368844; cv=none; b=kYd+jQdQid6H/QHAZBtSEg3b+haK4SoxqUJbnNENV5YuB+4owKMMZM5lIpoOLkPSXtS2GHlm26Gj9g1SSLi1VQf4E4kbTgY/QS5Ih1UiQy+joo/Z1E5Q9su26xC0fuNEUFVlpEhakVMHEC5KqJP7HGfpGf6lbpy+NL0YjAkKxlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779368844; c=relaxed/simple;
	bh=39Sa4FRbA1XPh56vrPZ233l8fBb+GbeXoYXxNG9G+R8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ekQSln2PCn2HXXswSCSZS388AxrVqFDcUJiXS4nQC/idOXQLpponHsmCr8HhPZdtmX03Z49OYXUOl1cp0ovajd7GKrJ0HoeQ9/glkC20caRnRQZ+PeKOTMgKRlvCIFpr0cut2NXlDycdSY+RuFM2R/uUZGGAfm/K7W0u+woknAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NacZ6rzN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T9qAES8h; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L99ntE3118648
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 13:07:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uKxCvumCkaRFL/8oxTufBn5fDWZVIi+dKwaTyeQSE8A=; b=NacZ6rzNe4O4spn5
	jqNbDI9qp+YlB0DJWOrVvpAk2elBrAESVgmUgj6ht0bDPbaDPIfcJCvG10eAYIR+
	BLigHEV6GAW5gwNzbNlYXiWW5gxu9Aqw6x9bSoytxKdqi3jC0zC4U8ckJBhIqNg+
	6eyhP1VSQaXRQyWmjKhBuy1WWkr0U2hdnt/lA0UCoXdsys3PAP6Inub7JwjpBzdE
	C9vRHn9L+i3eWmRMZghEem/joFd2KsmOME5hFETUR9XX/4YndIw0dY/xyhLI/SzE
	8KedJA/Oln2gtT0I1OLHPFqGgZTz+uMuTzCptJ8lW0m2mKNYhApmCI20uyVzI4TI
	EApbdA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9r962hrr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 13:07:22 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c802545ae0eso3885797a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 06:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779368842; x=1779973642; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uKxCvumCkaRFL/8oxTufBn5fDWZVIi+dKwaTyeQSE8A=;
        b=T9qAES8hQh93Aw8ilwXiojf5gcRuu0zlkSIN4QxxIwhYqqq1k61w7FnURp8MAO5Su3
         x1BW5kM6NSwJTrVur0uOJXHUgRq959j+xQA6HjFdBgEKa3THgpg5s6ckMl6HqjvbL48x
         tfcvCVuatYlcG/F093vBW3rNDBON/HykHzx9Zr6na+s5q88gWdcjxv1g1Fm5JjIcy5br
         ZSpr58SwMdavWszmBIAGnmMLyYdlMOdn9YZGc2yz1+xNPbEfy/lmN9ehzWhX2PGzUnF9
         VZXiX1LowCjzUKFsCjQCGyqYVYCXdn37nO2paLd4gfPOumJX9DB9IdP7zvwOmYHQN0RE
         Ti3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779368842; x=1779973642;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uKxCvumCkaRFL/8oxTufBn5fDWZVIi+dKwaTyeQSE8A=;
        b=dZxkN6xXa4NuRmukG5ttQ7iNRz3JpNNmFDTcb7m1Y/M/6iGraQ19161MKyayLNxM9x
         jKwwqec889dvXM2RbnKfrb41is2MWbvGV/ECD9uKWdsr2RHFct8uqz2mG7tF835tnq6c
         MFj+wR4wNxgnY3jkNbwM/NUBBnnVErWnd7PGOsq9EWWdob5EPyrqhBetZ/Aasnw/z1KF
         gGmcoaDzwthA3Ju6X6hOz+b/2vvy0BY6eG2y4nfeUsPr5a4a1RCr/WQ5Xif3pLTBlOIS
         kq9C5z3sK49vFx/OPQQQcGkztZ+BP/rZi8cAhwrmywgELcLRnrZYlZ1g6K/i39MB5kSl
         l0oA==
X-Gm-Message-State: AOJu0Yzlwwqb5CE8XdndAIjHLaopyK1he1tXjhVV6xFEw8u3tIVkfxOc
	PJoJPF45hE7me5R5fns3uoMhG8YXfxntHhQuLYTLHOLg54zg4fbaIEEW6WIq3pP3rmIbbmTACjm
	ScLa4+BLUfZZ0SJRMNbMT60boMHA7CRIw2LTnrVPjRXgXMSi/VDvtdvRv+xQOlMDmViZlyvkYXo
	ew
X-Gm-Gg: Acq92OHpy7i4UiimrV9jJgW4FaTvd7YWc0hpwl/41NYBd61OkUdWCJCT0lfslOkbEFM
	28480Unk5Zpj1zmY9L48d61A2GtgoQ1W/5n+7qecyYqcF5O5V+JcCZpaL3Z2wy1M4nlXPQWXCOm
	BhPJYvcu+yg4dqJSo/93zX/Cz6C+bLslINTMo7vpQSkjFI7juqLGp8O8orB5vlMAINrBA0BHHNl
	elnANPrqmS/d5iO0gvZZXzZFh6BiXOn038vi442GwmHmFPnUI3ZX/E0EzuL1f/60OoYvid9LELc
	zu1e+7OYMCqSuEyEPq8fnMJH2o3EMEdQjiwmIjEUCgbbXPs87FDS/XzuO7/1s7zecfaF9VU9iRB
	uIn5joB0IdBo9HCVuYnx3Sv3UdlKho7+SHOLJKAQNF9Pgc3Jql5Go18Fm
X-Received: by 2002:a05:6a20:4327:b0:3af:cff3:b347 with SMTP id adf61e73a8af0-3b3087a5f1emr3405791637.36.1779368841590;
        Thu, 21 May 2026 06:07:21 -0700 (PDT)
X-Received: by 2002:a05:6a20:4327:b0:3af:cff3:b347 with SMTP id adf61e73a8af0-3b3087a5f1emr3405733637.36.1779368841071;
        Thu, 21 May 2026 06:07:21 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c851991ab10sm294602a12.22.2026.05.21.06.07.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 06:07:20 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 21 May 2026 18:36:39 +0530
Subject: [PATCH 06/18] arm64: dts: qcom: sm8250: Fix PCIe wake GPIO
 polarity
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-wake-v1-6-d822567be258@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779368813; l=1575;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=39Sa4FRbA1XPh56vrPZ233l8fBb+GbeXoYXxNG9G+R8=;
 b=V2PKgU3o/Lx/KKcf8HhaHoGw+SWL5/Xh00CCq7EtLb41g0aW6SMDWo3NoPwaXeIHZzqdJ4AwZ
 QkoBhkho58KB+0xXoKeLG/++BSlJKmOskm02EC1tsCFz0Pr71L3ThF4
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: I1HdBvBqy81yxPpjyR3NjbFWFtwFNFnP
X-Proofpoint-GUID: I1HdBvBqy81yxPpjyR3NjbFWFtwFNFnP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDEzMSBTYWx0ZWRfXwMuUgzD4BygK
 r8lrFAPfNTgG2My8fntqs9dxhFJUwpAfZ1HXgB5Fw7JMr9TanVIAErpKWCywD+Py+Yod/OyqyZ3
 lma1X6WiB3RE/0b7PX1/pbdl003USKZHivfEsP1gQHR2wc+UiJFoGqO06VNMYeqsnRk1w6ma+OW
 t3u3v3Osdtdk7vrq64s/9j6u38bHgRja5YHKl7GS3+QV1wTr0TjT5CgSYInYLUIP6be9+bECNxM
 VVKlvTcBRoiplmRhkoI5FDyTw5HUI+PmsbBKityuGdgAvAEAArmc+sSSYuc39WEJzqFR5Z7CFx2
 MGU3Ty42k1OTfkuMN7RrVpZr3gWzwge/wOw21OGA4V/hIyCua5bUWf0lQUkXBtCMd1xHj/Wzqoo
 dIoRWMpK0I3dJHXhwHSL1gQ4mwfZ8bdXEDzk8nM+122Q5zbYIG+V+Q8X4RGrsKqHe5hA7Fz4HQK
 MW8FFwC+kpabk/Yp8ag==
X-Authority-Analysis: v=2.4 cv=GqFyPE1C c=1 sm=1 tr=0 ts=6a0f038a cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=TRJGHeO7bdl8qYu8Ap8A:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 clxscore=1015 impostorscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210131
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,1c00000:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,1c08000:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109076-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Queue-Id: 2F90B5A6974
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The PCIe WAKE# signal is active-low as defined in the PCIe Base
Specification. Fix the wake-gpios polarity by using GPIO_ACTIVE_LOW
instead of GPIO_ACTIVE_HIGH.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 7076720413ab..eca66d1c1c5b 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -2202,7 +2202,7 @@ pcie0: pcie@1c00000 {
 			phy-names = "pciephy";
 
 			perst-gpios = <&tlmm 79 GPIO_ACTIVE_LOW>;
-			wake-gpios = <&tlmm 81 GPIO_ACTIVE_HIGH>;
+			wake-gpios = <&tlmm 81 GPIO_ACTIVE_LOW>;
 
 			pinctrl-names = "default";
 			pinctrl-0 = <&pcie0_default_state>;
@@ -2329,7 +2329,7 @@ pcie1: pcie@1c08000 {
 			phy-names = "pciephy";
 
 			perst-gpios = <&tlmm 82 GPIO_ACTIVE_LOW>;
-			wake-gpios = <&tlmm 84 GPIO_ACTIVE_HIGH>;
+			wake-gpios = <&tlmm 84 GPIO_ACTIVE_LOW>;
 
 			pinctrl-names = "default";
 			pinctrl-0 = <&pcie1_default_state>;
@@ -2456,7 +2456,7 @@ pcie2: pcie@1c10000 {
 			phy-names = "pciephy";
 
 			perst-gpios = <&tlmm 85 GPIO_ACTIVE_LOW>;
-			wake-gpios = <&tlmm 87 GPIO_ACTIVE_HIGH>;
+			wake-gpios = <&tlmm 87 GPIO_ACTIVE_LOW>;
 
 			pinctrl-names = "default";
 			pinctrl-0 = <&pcie2_default_state>;

-- 
2.34.1


