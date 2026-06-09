Return-Path: <linux-arm-msm+bounces-112045-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1JS4KN/JJ2r02AIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112045-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 10:07:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 591FE65D91F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 10:07:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=m8bjtSEj;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=g60qOueT;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112045-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112045-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1EC8430FAA96
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 08:01:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C369F3E7BC7;
	Tue,  9 Jun 2026 08:00:48 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 297333EAC72
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 08:00:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780992048; cv=none; b=OFvN2tyiba7myvLswjR7vfdUwQ/V0qYz9Au1w6DjRQCyWOMzs2J7ahrp8BEekP/Mx3mwC1dOIUOHbUztIV5QBkULK6NV0ml7wJYphFbHwdcIR12LqFQdJe+dCewneeD9LPYRrLMgARY9k9hkhgdApmzpLNdsddJtC6VQmvqNJEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780992048; c=relaxed/simple;
	bh=b4dlCrA160M7CtMKajEn74UYqfbSy4cQVRHpsvUUOw8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZuMtEoFvJHXCgjEBn41hylyDtWBIkiqNJEf46cEtQC5JqQYJUAoV8eP8Xs9NMP/gGB08z+RKNpD63bSxgl/6IruhlNFmxC9CSk27Q6C/wqxCUyAgzjyRzNrm83rdjMT94EK+wKVgTbgCsNMKVnMe2EKwIDZGK/1Ditzh9avLi8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m8bjtSEj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g60qOueT; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6597rMiM1585684
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 08:00:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0uzFHjqc5qdAQfy/5iG6g+X5h52z3b9ZOTOLbbvEn70=; b=m8bjtSEj+tnxXkjO
	fmvnLT/6mNEWwHuXLzOKOD2ls15KBTwYGC9B2C/60CrRrmO9TOrMV8/sSSvmsJrl
	EVw/Y1MUPfkx7prIxxp4SEAab7yb2ZthGXQaWJzBJVqxcTR+nOcccaJG1A/S5S7B
	iomon0deiq/JLJzyWYQsaa6lMQoH058it8Nu70nJbin6CJTV7ouFQkqSID4Tc/SG
	LI5Ep9+kQW/fN4jGC/b1g0yNCvG+BY2r5GFxBlszafiNFuG0B0qz7r3yw3DzQBaO
	q5LV+5IDBt+pUN7s2888T3l355wVWmJh5eFNLpW6N1xcSY/6E5EbWH7J0Vdw1fmx
	ME9eZA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epeqgg2df-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 08:00:45 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51787404d3eso93439141cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 01:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780992044; x=1781596844; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0uzFHjqc5qdAQfy/5iG6g+X5h52z3b9ZOTOLbbvEn70=;
        b=g60qOueTlFaU6eJExYJ8/kKNfGHtuoIxAsDxnNUpGxeoSmGLpir39hFrjwsAJYcffh
         T6unrpBaJiE9SE6fBYeIHU6t8tkffWN8qZY3FeaEOWXX5cCOK1h2O10JrwClXz7+lIJl
         usHaxuzNJfzOp0YZEjUb28yzMgaNpGvbmWRplqcAWh69NWiTqhcbPZZt3mNlZbvRKKhT
         zk4HfkaE52ZB2/sqjzB11sCbw6DiGU7evBr//Oq2Yg7qInnL0stfLw3j+QU/m5w6eVXx
         osT43+CQtomz2yUZvBSdZ4XNMA+48M/lYKM/GkpHdYtE4dYNL5102xxgBGsbOeLZjb3A
         yU3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780992044; x=1781596844;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0uzFHjqc5qdAQfy/5iG6g+X5h52z3b9ZOTOLbbvEn70=;
        b=dZaLt11xT+F3KK8Tni5ua4hK/4pXNMX8aTnh4GGNWCer9mIejVf6pHeIvpY7gGfddi
         EpavuGLUouqxs1pwEZbENDWST1RgLJiCE2Whs6E1AmQlCciLSLUmom6R8jWgvBO3vgDA
         McsiyBhadtqPnOgCtAvBx84i7yugF1+8oms0eaqX0v5GwpNa3Rc2QQD2rNgV7M/IrxS8
         np7yy1RBfZbKXW/pHBABaZalON8xPlFXm21TMlwxQlAlnoKOJ5NW1xdER5Wth5inbNSa
         eZrDQ6MMBzJ+r64eWVqqwmOEaXoIDLlQ7FGm6jsw7NVaI/in2x+3LKmZCwDo6q8ZdkfJ
         llhQ==
X-Gm-Message-State: AOJu0Yyyg6jtrAP64gX+aygIb6PhmKNDeCRXAq0n5HdqwCW/oWzmEeHC
	Vp87EX2TVh4KCGVNSXCqbSz97SZYcDi+CIY2y3ogIBwkwfLB+0v2TgbLt2qW50igYumX0j8v3SQ
	EWuE7CH9qa7ThetWVeHHL29RkoGOJtBQVFEa4NzOzML0l7LK9ycwtl0BAHJf5nPz5zmpJ
X-Gm-Gg: Acq92OG3k8Sv6XMHj5QixJMQBcAH9v8w+mOCemYyoMfpedsJgfz1GtxiBo7k4aSMk6P
	7H5ScXw+AyEXQ2SNXgoUk+LdVIZSE+bHLQvUZyQKVG470rmf3EJm3eCrJimSTeJugWG29eYb2uI
	7sg/oQQqeSxCEi3Za83v/4OvFKKZt7H1gP6NhEgG+HSofpkJj7+5l2NRX1ezc/X+QyeAjGCIj28
	3DkSHLHT1gin1euJBrOEIfudfzcu8CfsuOviCjRjQruv5x4zLRq76BZ6Q09wxQnjYI8vDjMs1sp
	i3trHyojGMILLEN9QnhYaw0O6EVBFwzs2nfOSulE1QEA8VX8HLjh9Vt5d+SzjfiJ3MNc688XFbn
	k78XJOJOYV+wVsftbRgZwXUudffFEgdRY69tz
X-Received: by 2002:a05:622a:6184:b0:517:8da1:4d4 with SMTP id d75a77b69052e-51795b5f418mr275568371cf.46.1780992044005;
        Tue, 09 Jun 2026 01:00:44 -0700 (PDT)
X-Received: by 2002:a05:622a:6184:b0:517:8da1:4d4 with SMTP id d75a77b69052e-51795b5f418mr275566861cf.46.1780992043332;
        Tue, 09 Jun 2026 01:00:43 -0700 (PDT)
Received: from hackbox.lan ([86.121.7.18])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f35fb24sm63605930f8f.34.2026.06.09.01.00.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 01:00:42 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 09 Jun 2026 11:00:18 +0300
Subject: [PATCH v3 2/3] arm64: dts: qcom: Add Eliza CQS SoM platform
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-eliza-dts-qcs-evk-v3-2-b4e9b033a6dc@oss.qualcomm.com>
References: <20260609-eliza-dts-qcs-evk-v3-0-b4e9b033a6dc@oss.qualcomm.com>
In-Reply-To: <20260609-eliza-dts-qcs-evk-v3-0-b4e9b033a6dc@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=11627;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=b4dlCrA160M7CtMKajEn74UYqfbSy4cQVRHpsvUUOw8=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqJ8gjx9UVLvHnkLtEObhYvS9FH1NLFuUmWW0GN
 P0Z+X012lqJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaifIIwAKCRAbX0TJAJUV
 Vtg4EACRbpoEBi+jDGaZj1skBVNu1ocz8nL85hhnVEq0a1HayeojDUChBkP2nTmfaa8tQKlgkaa
 88xckxYxez4uzwBtWPiXFzShSmbmYYtFngRkN4gja/oYa8/15DI0utqrH9RQGNW27ZTPvNPYSqz
 1tFDzQ1oK3l01FZBiR7ad0a4yq4Uhcr+AKOe3h7rKvpnGq6TjVUbNX213A2rKR6UtOKNoiwvYTP
 DQtUzzwZnrhQ4kBNeGw7LaM5QmQ88OzY4FvuL34xzDrDlZDKnwKR4nCZS94I+YJ/kBUyQnWmgwC
 opPTqmbR8+luMmBGG7VudHp08pTTp9sqF3tqwsiRwT4kqfJe1dLBYRv2C6JZqFbfdJYoLqRTNt6
 uMMx0jDWof0xxMYtOoDvgWu5cSUNksR8/fyDserH14NS+0wfH9HZZzCRL85JGr6R8Oklaq9B4vg
 cDRNLH9YdqF/ADQqtbC693rffG7T+wypf0wvo5w0g8cmKrV8YYBVq3u6QJvZhKyG6y7M9HB2CS4
 CvHzTYHMt3XDF9U2ugRJlYxSQzU2AJ1hKGzBSbuQVmbfvIAZynlcfHDDUW9WoTl2aiH2DHi2xaI
 OKtY/tfSwpwpEG0GrXk31T85AKTmGS3fjovKMXpZTDzBNe+NO/hTnddcXpqRhPYcwL9q10eYQ1A
 zyOTaKc7QCkQpzA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA3NSBTYWx0ZWRfX6Upr9NCODryR
 QzNNvcs9qcVN1wrjeD6tUZrqBrzENa4a5+3DDTQwcwE7UVO9EyBLeoN+hPl3Mxi04dq34OfMD7J
 p+1mmg1UpcAkcgARRyZOOueYXBa2oxEj7FWuU2hDro7A88RD3vao/4qHhRgMX8PaCZK7IHQjIer
 4H9z/e4ZE2pdVwm0HEbx+MxZCuSAtW0QPL9Yax/l8+kFjz1yCDihvnjZVBnY5goMAVLGonDlhvs
 KURDJDSYqXYtP7qPqWIUVKgJdaoOuSXFAGg8vusTEd0Mj7sa1S2yKBkoJdvAsIA8Lm5w1IAeAbv
 GRYWFkRsZo15IaMqpbbBF+H4cv6Yixn102dG0Wwems29Et/iu78WGzafEikl3RrEhYqrqqWVmTi
 YyxFN0OIuD3cU751quqzwKSW9EWXnPUUQWEAizUP3ZqZ+IDIgSQKnqF7t3GxDEzoQmQAMRercu7
 4VHir3M1XThSPkApzbg==
X-Proofpoint-ORIG-GUID: hpL-CiDP2qjHkTIo1O1zkF8ZY8kfuj2K
X-Authority-Analysis: v=2.4 cv=KdHidwYD c=1 sm=1 tr=0 ts=6a27c82d cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=BSZ3G9h0/EKbgBlQZBbU/w==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=-rIHGyhvbnQuOfFkfywA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: hpL-CiDP2qjHkTIo1O1zkF8ZY8kfuj2K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090075
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112045-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:abel.vesa@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 591FE65D91F

The Eliza CQS (CQ7790S) System-on-Module is designed to be connected to
an Eliza EVK base board. The SoM provides the SoC, PMICs, LPDDR and eMMC,
while the EVK base board provides connectors for a multitude of
peripherals.

Add the Eliza CQS SoM DTSI so it can be included by the EVK board DTS.
Describe the regulators and board clocks, enable eMMC support through
SDHC1, specify the ADSP firmware and enable the ADSP remoteproc.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi | 394 ++++++++++++++++++++++++++++
 1 file changed, 394 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi b/arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi
new file mode 100644
index 000000000000..33f4cd282272
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi
@@ -0,0 +1,394 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
+#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+
+#include "eliza.dtsi"
+#include "pm7550ba-eliza.dtsi"
+
+/ {
+	clocks {
+		xo_board: xo-board {
+			compatible = "fixed-clock";
+			clock-frequency = <76800000>;
+			#clock-cells = <0>;
+		};
+
+		sleep_clk: sleep-clk {
+			compatible = "fixed-clock";
+			clock-frequency = <32764>;
+			#clock-cells = <0>;
+		};
+
+		bi_tcxo_div2: bi-tcxo-div2-clk {
+			compatible = "fixed-factor-clock";
+			#clock-cells = <0>;
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-mult = <1>;
+			clock-div = <2>;
+		};
+
+		bi_tcxo_ao_div2: bi-tcxo-ao-div2-clk {
+			compatible = "fixed-factor-clock";
+			#clock-cells = <0>;
+
+			clocks = <&rpmhcc RPMH_CXO_CLK_A>;
+			clock-mult = <1>;
+			clock-div = <2>;
+		};
+	};
+
+	vph_pwr: regulator-vph-pwr {
+		compatible = "regulator-fixed";
+
+		regulator-name = "vph_pwr";
+		regulator-min-microvolt = <3700000>;
+		regulator-max-microvolt = <3700000>;
+
+		regulator-always-on;
+		regulator-boot-on;
+	};
+};
+
+&apps_rsc {
+	regulators-0 {
+		compatible = "qcom,pm7550-rpmh-regulators";
+
+		vdd-l1-supply = <&vreg_s3b>;
+		vdd-l2-l3-supply = <&vreg_s3b>;
+		vdd-l4-l5-supply = <&vreg_s2b>;
+		vdd-l6-supply = <&vreg_s2b>;
+		vdd-l7-supply = <&vreg_s1b>;
+		vdd-l8-supply = <&vreg_s1b>;
+		vdd-l9-l10-supply = <&vreg_s1b>;
+		vdd-l11-supply = <&vreg_s1b>;
+		vdd-l12-l14-supply = <&vreg_bob>;
+		vdd-l13-l16-supply = <&vreg_bob>;
+		vdd-l15-l17-l18-l19-l20-l21-l22-l23-supply = <&vreg_bob>;
+		vdd-s1-supply = <&vph_pwr>;
+		vdd-s2-supply = <&vph_pwr>;
+		vdd-s3-supply = <&vph_pwr>;
+		vdd-s4-supply = <&vph_pwr>;
+		vdd-s5-supply = <&vph_pwr>;
+		vdd-s6-supply = <&vph_pwr>;
+
+		vdd-bob-supply = <&vph_pwr>;
+
+		qcom,pmic-id = "b";
+
+		vreg_s1b: smps1 {
+			regulator-name = "vreg_s1b";
+			regulator-min-microvolt = <1850000>;
+			regulator-max-microvolt = <2040000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s2b: smps2 {
+			regulator-name = "vreg_s2b";
+			regulator-min-microvolt = <375000>;
+			regulator-max-microvolt = <2744000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s3b: smps3 {
+			regulator-name = "vreg_s3b";
+			regulator-min-microvolt = <375000>;
+			regulator-max-microvolt = <2744000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s4b: smps4 {
+			regulator-name = "vreg_s4b";
+			regulator-min-microvolt = <2156000>;
+			regulator-max-microvolt = <2400000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2b: ldo2 {
+			regulator-name = "vreg_l2b";
+			regulator-min-microvolt = <720000>;
+			regulator-max-microvolt = <950000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3b: ldo3 {
+			regulator-name = "vreg_l3b";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <912000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l4b: ldo4 {
+			regulator-name = "vreg_l4b";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l6b: ldo6 {
+			regulator-name = "vreg_l6b";
+			regulator-min-microvolt = <866000>;
+			regulator-max-microvolt = <958000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7b: ldo7 {
+			regulator-name = "vreg_l7b";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l8b: ldo8 {
+			regulator-name = "vreg_l8b";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l9b: ldo9 {
+			regulator-name = "vreg_l9b";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l10b: ldo10 {
+			regulator-name = "vreg_l10b";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l11b: ldo11 {
+			regulator-name = "vreg_l11b";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l12b: ldo12 {
+			regulator-name = "vreg_l12b";
+			regulator-min-microvolt = <2400000>;
+			regulator-max-microvolt = <3300000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l13b: ldo13 {
+			regulator-name = "vreg_l13b";
+			regulator-min-microvolt = <2700000>;
+			regulator-max-microvolt = <3300000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l14b: ldo14 {
+			regulator-name = "vreg_l14b";
+			regulator-min-microvolt = <3300000>;
+			regulator-max-microvolt = <3304000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l15b: ldo15 {
+			regulator-name = "vreg_l15b";
+			regulator-min-microvolt = <3300000>;
+			regulator-max-microvolt = <3304000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l16b: ldo16 {
+			regulator-name = "vreg_l16b";
+			regulator-min-microvolt = <3008000>;
+			regulator-max-microvolt = <3008000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l17b: ldo17 {
+			regulator-name = "vreg_l17b";
+			regulator-min-microvolt = <3104000>;
+			regulator-max-microvolt = <3104000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l18b: ldo18 {
+			regulator-name = "vreg_l18b";
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <2800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l19b: ldo19 {
+			regulator-name = "vreg_l19b";
+			regulator-min-microvolt = <3000000>;
+			regulator-max-microvolt = <3000000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l20b: ldo20 {
+			regulator-name = "vreg_l20b";
+			regulator-min-microvolt = <1620000>;
+			regulator-max-microvolt = <3544000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l21b: ldo21 {
+			regulator-name = "vreg_l21b";
+			regulator-min-microvolt = <1620000>;
+			regulator-max-microvolt = <3544000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l22b: ldo22 {
+			regulator-name = "vreg_l22b";
+			regulator-min-microvolt = <3200000>;
+			regulator-max-microvolt = <3200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l23b: ldo23 {
+			regulator-name = "vreg_l23b";
+			regulator-min-microvolt = <1650000>;
+			regulator-max-microvolt = <3544000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_bob: bob {
+			regulator-name = "vreg_bob";
+			regulator-min-microvolt = <3008000>;
+			regulator-max-microvolt = <3960000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-1 {
+		compatible = "qcom,pm8550vs-rpmh-regulators";
+
+		vdd-l1-supply = <&vreg_s1b>;
+
+		qcom,pmic-id = "d";
+
+		vreg_l1d: ldo1 {
+			regulator-name = "vreg_l1d";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-2 {
+		compatible = "qcom,pm8550vs-rpmh-regulators";
+
+		vdd-l1-supply = <&vreg_s2b>;
+		vdd-l3-supply = <&vreg_s2b>;
+
+		qcom,pmic-id = "g";
+
+		vreg_l1g: ldo1 {
+			regulator-name = "vreg_l1g";
+			regulator-min-microvolt = <1150000>;
+			regulator-max-microvolt = <1260000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3g: ldo3 {
+			regulator-name = "vreg_l3g";
+			regulator-min-microvolt = <1150000>;
+			regulator-max-microvolt = <1260000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+	};
+
+	regulators-3 {
+		compatible = "qcom,pmr735d-rpmh-regulators";
+
+		vdd-l1-l2-l5-supply = <&vreg_s3b>;
+		vdd-l3-l4-supply = <&vreg_s2b>;
+		vdd-l6-supply = <&vreg_s1b>;
+		vdd-l7-supply = <&vreg_s3b>;
+
+		qcom,pmic-id = "k";
+
+		vreg_l1k: ldo1 {
+			regulator-name = "vreg_l1k";
+			regulator-min-microvolt = <488000>;
+			regulator-max-microvolt = <912000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2k: ldo2 {
+			regulator-name = "vreg_l2k";
+			regulator-min-microvolt = <920000>;
+			regulator-max-microvolt = <969000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3k: ldo3 {
+			regulator-name = "vreg_l3k";
+			regulator-min-microvolt = <1080000>;
+			regulator-max-microvolt = <1350000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l4k: ldo4 {
+			regulator-name = "vreg_l4k";
+			regulator-min-microvolt = <960000>;
+			regulator-max-microvolt = <1980000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l5k: ldo5 {
+			regulator-name = "vreg_l5k";
+			regulator-min-microvolt = <866000>;
+			regulator-max-microvolt = <931000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l6k: ldo6 {
+			regulator-name = "vreg_l6k";
+			regulator-min-microvolt = <1100000>;
+			regulator-max-microvolt = <2000000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7k: ldo7 {
+			regulator-name = "vreg_l7k";
+			regulator-min-microvolt = <720000>;
+			regulator-max-microvolt = <958000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+};
+
+&remoteproc_adsp {
+	firmware-name = "qcom/eliza/adsp.mbn",
+			"qcom/eliza/adsp_dtb.mbn";
+
+	status = "okay";
+};
+
+&sdhc_1 {
+	vmmc-supply = <&vreg_l12b>;
+	vqmmc-supply = <&vreg_l1d>;
+	pinctrl-0 = <&sdc1_default>;
+	pinctrl-1 = <&sdc1_sleep>;
+	pinctrl-names = "default", "sleep";
+	mmc-hs400-1_8v;
+	mmc-hs200-1_8v;
+	non-removable;
+	supports-cqe;
+	no-sdio;
+	no-sd;
+
+	status = "okay";
+};
+
+&tlmm {
+	gpio-reserved-ranges = <20 4>,   /* NFC SPI */
+			       <111 2>,  /* WCN UART1 */
+			       <118 1>;  /* NFC Secure I/O */
+};

-- 
2.54.0


