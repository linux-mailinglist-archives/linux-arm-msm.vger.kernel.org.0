Return-Path: <linux-arm-msm+bounces-112578-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Wx2eHX9CKmpNlQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112578-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 07:07:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BDAC466E629
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 07:07:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=WlNzfk1c;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=gqxQ26+5;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112578-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112578-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4E82932699DF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 05:00:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD2D4366060;
	Thu, 11 Jun 2026 04:59:11 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FFC6361675
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 04:58:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781153951; cv=none; b=qyOBOyq4P5J92IKHWiCuJcitnGQKKN5s0ZYdBom4iEKTsAiJS7dqCTPQTSTSjG9IFZUdA7wVtk/Ys+jix1fmzDyvTpa1qObnB+nF51wUjLpNpiuIPmjmZR8qP2mfHgVeX4/hvzrBc0TtxYctk7YTibPJjCOpIhoEw7Efts6OG0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781153951; c=relaxed/simple;
	bh=whWAp+INItUIQjuUf+3XOOZ4Nif49970RqMMkGBDhSQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FDkEqES9URDZboEE6Ji5e0NFtAkh8fCHOq4uEpZ06kjPr/CCfwsWKOA7XZhn+L6XGoptEzv6MaZVfmJ/MwSgaEV/+N67K4diCY/XJrBs3zVwKBgvMhwSG6a3HRlgSn9gCZ6GhBxkSF0brk8gxGd33kvSJt8nHFxx0eO65gk1YxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WlNzfk1c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gqxQ26+5; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B0NQJS1614529
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 04:58:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AUDQsQ2outLuOjNI9ORXJ27URAcMQbP1Y5RcYCfHI44=; b=WlNzfk1cJbf7R+D7
	nAtr6pKRud1vAiZIp+Nb3hiQimaxddxpt8L5oDbqSO5dFYJIKeFlfAiXQnLlDUYk
	oBRIDtTGkyTTqt1v3M8x2pqZKIKsVIdfJ1RALTGtYd8nExsfPx00KDMG+rGlaeTB
	7SxS/pNhD7ymngdbOpXxKCyZ3hJtauaa6s7r/OzbkfQI+43YWYmQmQlD9XKJnNQN
	vZXwEelhc4KD1DNoT6pI0SM0fA/EtPNvto1XNpbN8YGnFVBVlF7U/bi+JUDc2xGI
	dwxft2JXRaRCkRyltVK2+1urtPTTN8bUqZRf2N/v2nSEQsbpxVxmn02VDdiltWA6
	9opZ3A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe79hn8a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 04:58:58 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2bf08c2a24bso72207775ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 21:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781153938; x=1781758738; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AUDQsQ2outLuOjNI9ORXJ27URAcMQbP1Y5RcYCfHI44=;
        b=gqxQ26+5RGdYlbyrtZKt9SGV9uLOFOlifSqM25o9xrb/U9qPR6Bri2s7OofNOKXeTj
         O6vMcH+F7Rt0M8QCIpieXog/5iHysW3RrfJkTdlQUMU9IWMtBRm7OgAL2VfmvImRvRtt
         2XrdE4nTdUtyMSmS1YHPkOFMiKmXLdD5Op9+WXfLk0v8Zcm0JRkNkaRbrfGZiO7FcZ9R
         7aWONmpj0LwAEQZPCsYfouJooJJNixrQB1riHcZ+yPEmXC3Xm8Dnku1twcncKiL2k0qP
         nTpOHtqE5jGxpeUDdOionGGsxe68ozMiNxCcQj9xTOKISYnvz6Diq+BdlNcA4EGAMh1h
         Sl6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781153938; x=1781758738;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AUDQsQ2outLuOjNI9ORXJ27URAcMQbP1Y5RcYCfHI44=;
        b=XQ/Blri6OlcVGdD8+rbt0ucnJHqM9nDfkPYpSJNf8LKg7s4egQIFgLI0zr9farTk6Y
         mKgGjWAmrj5mo2Xy2qCQky5Jg256XfJOjLPFbLvQNeylhcrTpNrFS/Cy9bQF78728BSy
         TJvp/QqR7YbyrQJrvlW+lA6sVd5fU/OueEZolz+ZCIVWSis2aSVz97Fo27Wso9wn3w/5
         nMqVV86jpYA5yhl4sGST4i2Em2/l3TbXFLwl2LmeusX5+cMVa/5ju1zicEo/FxlNYsOS
         i7M1QIFEPkgl64JlxTN3akIXRaeagI8Yf51PJB4t8x3v1Eksm+neU+TKRNqzVPVmWFvj
         iVIA==
X-Gm-Message-State: AOJu0YyxF65M62GMYleMySMorIg+jfT+j4e8zCEKcu9kI1bizlVQvC3H
	MTuevUsmXzc87bt74b90VdRXUu9Cep3RDRxTmg+rUcIGlGxUfE/2fO++VVFFu2qntdbmBeqpTrv
	kgUNtP5qhGV8KeVtXIE5cf4MoXsvGrgiLMCmUo78ltGqCm+iQmww6IZfi6bmoNCqiXE5RR/Vz1E
	td
X-Gm-Gg: Acq92OHXejG74P/fdXctyM+0lAWiGL2v+rmx8mhf13TNKKR/1U6rKDrtLbUCZm/PLeK
	XrMctMmFjNn0t574Rhiwmd2gi2tlznwc4zU1wwp5tYxm8HPstTnKjOcLy6nq+Iejpk88xx+jHbF
	wShVEXhxib36CoIYIFxSeXKtXm/xTWF3odWTLP8CDcJPNXv7CqaYYRP3KhaXGEKBwhf5KY4iiSS
	E6dykchKQXw/efJHKQnd7/8fIuoXxBOCbqn5IHCj7rec0tvDFSrJkxT5qIDCgXDth+Z+b3JSX90
	kAu1MmOSYkMh28r70jhDsjlPXHn7VdY9r2eHH/uLmsmNxaGFQ12Sb4U2U+YN+Kp0YRBilyhtttl
	e29+hc5vbdnOAvWnNskME8YJgT/McHaOjyJmrHJ3OBICjJzvqqfcuIqoSZNH2rkl/7Cs=
X-Received: by 2002:a17:903:1448:b0:2bf:379b:53f5 with SMTP id d9443c01a7336-2c2f1eb779dmr13982695ad.23.1781153937717;
        Wed, 10 Jun 2026 21:58:57 -0700 (PDT)
X-Received: by 2002:a17:903:1448:b0:2bf:379b:53f5 with SMTP id d9443c01a7336-2c2f1eb779dmr13982395ad.23.1781153937300;
        Wed, 10 Jun 2026 21:58:57 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f8bc5asm276188335ad.27.2026.06.10.21.58.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 21:58:56 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 10:28:37 +0530
Subject: [PATCH v2 01/37] ARM: dts: qcom: sdx55: Fix PCIe wake GPIO
 polarity
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-wake-v2-1-2744251b1181@oss.qualcomm.com>
References: <20260611-wake-v2-0-2744251b1181@oss.qualcomm.com>
In-Reply-To: <20260611-wake-v2-0-2744251b1181@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781153928; l=966;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=whWAp+INItUIQjuUf+3XOOZ4Nif49970RqMMkGBDhSQ=;
 b=ZOvNsWR7Kp2QUGDxxPpnU1j5YbR9Sjz3rTdE2gBdpFUutiJMJV2hG6tuG4MqWhcg3mwy1GuNG
 45BWg6cLwxPC154jtJjGnaSjRLv21O8jYip8fa6KMpaeRTVol4imtyO
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: -ivIyJW0ZOGKGJWoCTBhI2ula7oKzi3p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA0NiBTYWx0ZWRfX00QiWuO7UHzE
 /A+HOn8+kH7htblbQpYkQLFifFKAwWmrf6y5CGcmEfqUp+vgDmiNryc2jKdJPFK2Zs8eqZkET/m
 fBROxRmSxvm73/KDwl709OUqjxqunP3T4BWLMeNW/dg5vIQ7q3EElI+z9qeFclq1ifDhExvchE7
 q0G52eaRAdarjeW3KtPT0ZgSqhakGepzSr9XlHiSjZZbIoUYR/V1Hu2FTPWHQeCiKfkwalLwJDl
 R3u6xh6iMiOlkkCTh8Pqxgb1TG3pD7JcuNgWZbfQn6WNIxGm5d59xiNSrOJ491ohgPq8xd0So59
 G6dxNOC8hr3COnWba9PIMgzMzcrOpCBTcEu6kp2Z4+EWF6KYcBV8izzqm1+nRwmQPnUD+MTO7vA
 wKX65a0snrWCi7qCRCNDTJhT70cu/90Q61j54sU3HbWV2oXFxPJZf/nFaiVsWUjS2eoiK8CIu7G
 mvjn3Ta17/8okQ2npGQ==
X-Proofpoint-GUID: -ivIyJW0ZOGKGJWoCTBhI2ula7oKzi3p
X-Authority-Analysis: v=2.4 cv=fbydDUQF c=1 sm=1 tr=0 ts=6a2a4092 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=t4RzHNKIQDbQSdFyBH0A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA0NiBTYWx0ZWRfX0BAXnVKVunZU
 AgppIr/hjrx2NMqX29ws361QZKINeVxEEaCwAv5DI1p0zkxwmqPd/jZRxwjf6E2KzppHwf6iTlq
 FWVDY+mXDKltCNNbzOKAn3Eri8uK0hE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 suspectscore=0 spamscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606110046
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112578-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:cros-qcom-dts-watchers@chromium.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krishna.chundru@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:mani@kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BDAC466E629

The PCIe WAKE# signal is active-low as defined in the PCIe Base
Specification. Fix the wake-gpios polarity by using GPIO_ACTIVE_LOW
instead of GPIO_ACTIVE_HIGH.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
---
 arch/arm/boot/dts/qcom/qcom-sdx55-t55.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-sdx55-t55.dts b/arch/arm/boot/dts/qcom/qcom-sdx55-t55.dts
index 082f7ed1a01f..302c88c47960 100644
--- a/arch/arm/boot/dts/qcom/qcom-sdx55-t55.dts
+++ b/arch/arm/boot/dts/qcom/qcom-sdx55-t55.dts
@@ -251,7 +251,7 @@ &pcie_phy {
 
 &pcie_rc {
 	perst-gpios = <&tlmm 57 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 53 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 53 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie_default>;
 	pinctrl-names = "default";

-- 
2.34.1


