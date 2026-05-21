Return-Path: <linux-arm-msm+bounces-109086-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CD2gGjQJD2rREQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109086-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 15:31:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B78E5A5D3C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 15:31:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7D21B313D9D1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 13:13:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1BFB3E1D01;
	Thu, 21 May 2026 13:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lFkCkZbN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PfrrCijq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BAA23E1CFD
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 13:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779368883; cv=none; b=ZPc5u3TeeMLoDf623Trui6g6x0wkx2wkqogn4b0frJ2PCxwdohstoN9TC0OhmIIOz7W3ftUMdz+I7RfVyKwBhmIez5VjZcGgfMPRYx1fZourE/xbV9xp9s2/4T91xCJPBT3xnPi+Z1lS32jxH+7744POyzNOK6b8okVmcsuP+/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779368883; c=relaxed/simple;
	bh=K2PktD81GLchwBUK+zykynZPifY53YubUDY8lpH3JZg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pJmFclXJlHPc+X9JoyvJFOG6gtLEMZz5LjQyraVaVHerJNm5bJw6GkUT7DZhVh1eQrsyJaKpmrT5qXem8KxjMyrdoq6U6a65lBMveWEKntGgZ3Ibhr4t/Wf/8uA8u2EHuq1wjZjXzjc4DX6g7+bHnZeFDc3XOrjXTYFz1ypvFXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lFkCkZbN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PfrrCijq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L9AL6K3555969
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 13:08:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FKFWeqSVdABp3bZUWRkG8UEu9s72wVyfZKzIZbZCsxE=; b=lFkCkZbN1ufRJedm
	4QOsBV9dxOHg7OhCMUNNcugn9Q4HDsMAjNkl6NOMEq+BJJhCjhyZsycnAOb8TwOd
	RMwAWTgbl3Ooz0k+YPPEiuXjlexByDBs7AeMw9iwH1DVbqXlJ9+10FQW+MUFgNkS
	DaW2PFXPmhk1XhegYftn2+BQ4w12Cb6DXzzS8/0e+ov6DeXDNa2FvFY576vOix7j
	CBRFUy/PN50ImKKNepAjyOWz9DFS7AwnYKvBw1bnBoMQlLWmtaXTJvj4mkF0a+uP
	y1WgA+o4HAajtkyJs4E1WNZaercbhk6TKYZyAA8TWMbV8EV5IfKytte66lJ4FVMm
	i7KtzA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9fb6mme5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 13:08:01 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c82c935e048so4279058a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 06:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779368881; x=1779973681; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FKFWeqSVdABp3bZUWRkG8UEu9s72wVyfZKzIZbZCsxE=;
        b=PfrrCijqe4jnjUU3NBlfBXR13hD6p4pdzOR8DHZ8IGK5z81N4+k9wwHeWHSzG/vBrI
         0/EKw7n3Qv4ofGAFWDP2CNWsNqnuEKbL0/JRfSSkAbkOlsQkwllJRIFs9kCMg4V1OTrO
         kBO+tA9q4GEzCA0ScvO1AXbAgI6VFlt40ipFJihQIhWobqkmnTq/GOUZVDl1iQ/8wHaX
         mPeLpGw3y+iGzTTk04tAMayYH7C+HbIsoH4VD4Y/ClCm6GCRlnKdt2Y0DE32n25UdnvG
         SMTLLBzhwPpgCMAy9YkuphIPVUVF6y1PAx0RdJcO/AUBTPUMUGun42AgwDmkTawP6gPd
         v7sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779368881; x=1779973681;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FKFWeqSVdABp3bZUWRkG8UEu9s72wVyfZKzIZbZCsxE=;
        b=Ykiw7OR6UCGR+b7PWBsUyE7Ye/m/0xOxEUqcNbWf6G6FEg4Odo0aiJIUfdUruAl6Rz
         FqwjWjoYkSeVS0Q28HeI1QWn/q39AI303vDfoIep1Z1KINex/B7b552TrFpAnfo2Q1AV
         uvf6J1K2LjsDV4Iz2Jl0xORtLMe7g73VPFgSHgK1SHu7AI50Rmh/u/02u/veOiFGMmuM
         1ql15PgzjZF8a3ob8z2tsarzK/QQO5bOp6yhD3m6kR17jz0GYRrWzjF1IEXtvLLD+BG0
         yZaP03WxIXqfaZ5bQU81a/t7Ia3rRgWbJOZpNNVjfl3LVz7Pc28U6nVVNsU9hxEk/1Qu
         a7ZQ==
X-Gm-Message-State: AOJu0Yw+u50TWZhfdugNtw8eEq54GYE2jJt1bC/C4oHfFDdfpwf8LOQv
	zuqudCFKJDnGJxgNXbI+bTJGW8/jUHJDjP8Kxc6CefcgVYpPOxqnW/x8AA7T+8NXXzW/FLs2gpL
	pnog/q12m12TUlF2FVY96uJo1DpfjZajMq1Ch5dmSmCcFQQPMlCeI38JPcltUYRYQBr+V
X-Gm-Gg: Acq92OFTkeoxSbdV3EKd8zZ/CO/iPMBzazJtDUp/fB3D9RRnapCdZIYRI5HRHlZlG/I
	4wx49bHMNclbrV8wqh/kbuol/Tlx/QDdqhPpgK2yl5PBsGFcK55kH8strD7vaqAwQ3oQhel5uHJ
	4zJj3vGyMEbnBBTgOnHqUvdDQOFck+5M8mD+X43FoWl2KvtTvfoC1RclZuhj2eUlJ2NH2Ci3Mmp
	MhwCHuYQ88Pe+JOoW4q8OXKrsVDrIMxFTrI1OmJ+xvBceU3ok86WcaWj8cTjopO4DVIkSUnFiEw
	Qz+1/moMnhG66beZQY8KPBKRfzaSlw9Pq/UYA25HavKdIydtxQcy/u6lq2aRzkzJM8tcWEixDjZ
	fvvmWGiye6qeGsNPTjyJPF5zZTObc357YJwgD0n/ctcTRlFuLGzSl+wAW
X-Received: by 2002:a05:6a21:ec06:10b0:3a2:c7e1:ff93 with SMTP id adf61e73a8af0-3b3082ac358mr1871161637.8.1779368880954;
        Thu, 21 May 2026 06:08:00 -0700 (PDT)
X-Received: by 2002:a05:6a21:ec06:10b0:3a2:c7e1:ff93 with SMTP id adf61e73a8af0-3b3082ac358mr1871135637.8.1779368880520;
        Thu, 21 May 2026 06:08:00 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c851991ab10sm294602a12.22.2026.05.21.06.07.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 06:08:00 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 21 May 2026 18:36:49 +0530
Subject: [PATCH 16/18] arm64: dts: qcom: sa8540p-ride: Fix PCIe wake GPIO
 polarity
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-wake-v1-16-d822567be258@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779368813; l=1324;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=K2PktD81GLchwBUK+zykynZPifY53YubUDY8lpH3JZg=;
 b=6z400tfdCbltvSD6mGAEzUkJX9xdC48omIB/LVe2vGJx9iVfjex2JKmwBBHATv6+LT54qF8/K
 AwboWlsYBgoB3CtvnY8hv0A00kwa5/Z0yO4eG7ToFRysmVx1NyRo1EM
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=do/rzVg4 c=1 sm=1 tr=0 ts=6a0f03b1 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=TRJGHeO7bdl8qYu8Ap8A:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: tWmp24EpJ0dYxac-4U9ETaXpRCCj5Ipm
X-Proofpoint-GUID: tWmp24EpJ0dYxac-4U9ETaXpRCCj5Ipm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDEzMSBTYWx0ZWRfX6WMacfX3y1v+
 cWeo0HbvyEBQcrQgSuFjHBT6ZEDm147nBn9McGjWUKgtjErNOJS82svQZ9cnrBB1t3G2DE0acs3
 6RLZDQ2EJXEb6W8HTpYemCVoLMKnN8SqFTe7gF4t2RM8zU99fQs9qWxU7I4tl3o+mcAJBdu6Jyz
 GrrCoRWLONwPa8MIP2KxNbk0zWyGuf3JVxi+zgb2IppsUNogBhAjkFd+rizAQoUDDWR3Dcv9IFS
 XVjRGnevpHvcbbPTt3s7ZD7eQqPlquvdWfvnTHQWraU8nEGTntJpXmOp/k2nNqa/qNg2Qjvtoj6
 Z05ZoqPeyEggiZee0vVl3AiCAjVKK5KcPwBI9RPWpLGXIb0hXPQpGD4f2KbnfeCJlHS/zzxhIUT
 pOZgUfBEOx1rulzgX9/X1mhsh/WkNq3i6ZBaXqmMdKi4MZ5O0lOtwKfB51ujDar6V8pE40KMIgy
 9lDjiopksyT0yn2K9NA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 spamscore=0 malwarescore=0 phishscore=0 priorityscore=1501 impostorscore=0
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109086-lists,linux-arm-msm=lfdr.de];
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
X-Rspamd-Queue-Id: 3B78E5A5D3C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The PCIe WAKE# signal is active-low as defined in the PCIe Base
Specification. Fix the wake-gpios polarity by using GPIO_ACTIVE_LOW
instead of GPIO_ACTIVE_HIGH.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
---
 arch/arm64/boot/dts/qcom/sa8540p-ride.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sa8540p-ride.dts b/arch/arm64/boot/dts/qcom/sa8540p-ride.dts
index 44177e9b64b5..702ae4cd3d0c 100644
--- a/arch/arm64/boot/dts/qcom/sa8540p-ride.dts
+++ b/arch/arm64/boot/dts/qcom/sa8540p-ride.dts
@@ -367,7 +367,7 @@ &pcie2a {
 		 <0x03000000 0x5 0x00000000 0x5 0x00000000 0x1 0x00000000>;
 
 	perst-gpios = <&tlmm 143 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 145 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 145 GPIO_ACTIVE_LOW>;
 
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie2a_default>;
@@ -388,7 +388,7 @@ &pcie3a {
 		 <0x03000000 0x6 0x00000000 0x6 0x00000000 0x2 0x00000000>;
 
 	perst-gpios = <&tlmm 151 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 56 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 56 GPIO_ACTIVE_LOW>;
 
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie3a_default>;

-- 
2.34.1


