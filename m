Return-Path: <linux-arm-msm+bounces-96311-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aIQMEXYEr2knLwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96311-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 18:33:42 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9999523DABE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 18:33:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CD20030134A5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 17:33:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D9902C11E6;
	Mon,  9 Mar 2026 17:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GXC1+C5t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Kw21v+Ju"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE0E528B7DA
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Mar 2026 17:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773077619; cv=none; b=F9gWlMG8KU4Qv5oyfXjqakt5x1VZF7gmyEQPZGDedbYVcdvXExQTG9jRDtdSFor11McOn7SXfVag5jRRP6BMnNrHdg+pZDi6le4MIK/8QIAUmIGHkEojYoPMz4VpEQGVmY4goUcqlUteGhzlxLcyGLYNsr9/0zTgU106YlwOcNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773077619; c=relaxed/simple;
	bh=TLz4jzeiALTc6Eb3FWtI1SdxpImn8cZAqISy3Dqot4g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=kBQJduLfnPLAtbJAO7Zmbz4OpwboF4cuV1Yb0qYma31OTGun7tIFW9Ob7U3TAjkt44vY/PCfbF78UCq2wiLpvhhtfL9kbk0kw/vVFqowhzL1LC585iu5pRy6O3M2LTGure8GIB11X1O6/VkbP/gTP7blWW4wUpqG6X0bqtp1Vvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GXC1+C5t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Kw21v+Ju; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629HC1Zd1298214
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Mar 2026 17:33:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=PoTS5bu2pOBH2rQMsB31Hs
	J69HhruICKPzfjyEcjSXI=; b=GXC1+C5tKD4hXicHI4iVUuFteLmwA9Zy/qnHtJ
	hZYMYqaYGQD2WBmHskQHm0yHkLpYvo8lpIjlTQiH+BIo5DFysop8BNORWg2rWEY1
	ysmQ2+nUlMqNh+z7j4/aIA2uMeltlx3oaPYI6+imqIHozBa3hP0J29N4d6IHsSD3
	WDaEYSG7F2CAhcbhqEz2LyHtXceU+ZJyPqD/DH4nAeSD6E9WMEVaj5UIwTxPCSFg
	z6DA0MukVDKavNOBxztBYzDnVfGBQwYLbRN5fYg9qLGkiRVY3YaRjlaORR7hUpvp
	Am+H8JQNXFXfwA6n52YhOBpZ2iFoONgWsyLc8fxU1cXwosYw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csyv18rbm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 17:33:37 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-506a07740bdso2715471cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 10:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773077616; x=1773682416; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PoTS5bu2pOBH2rQMsB31HsJ69HhruICKPzfjyEcjSXI=;
        b=Kw21v+JuiXi+U1qUIwYP+H/b4MrKrJf7v1rGFWq426sDnH2Z0M9lEp3HL1M5ZHO9EE
         D9af6FWg4c2bSnLWRLfjBj8/XDkBrpk1cHIinCckWpfbbp5Jtqf/vb2+fd7/4b286R4E
         FYGG7NQ2JjbrgJKtWEE5FgTmoGHtgY47/06z64SACrCmcWRulsruQe1IcJDQkJ9Ff2/J
         81PIQEcdLgIvywj7loHUnq6W+hV0whovtOIpobyeLsX7HmMZk6/nTL241DFfxuK4ZNgz
         Qn2S6ZyOCcJ4N5TXZs7QLfc/WmhW2T2kDkrE9an9e7z/pFaU1WRi271XMN+LxCzc1340
         LSGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773077616; x=1773682416;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PoTS5bu2pOBH2rQMsB31HsJ69HhruICKPzfjyEcjSXI=;
        b=TGxJp1eL8NpxGjbREr64zLGf4CW8ZOrrsMkI4HQ7cInabFYOTFdLjSWR8ZdgnuZAiq
         WRLpfsToslWl9+a/3mOCD+b3BGjSodLkAEfpdNPen+Idqh+JBXIv3+CrpoxpqeDZsE6K
         5L2jzvizAl/v7O+OjTW+Z0d0c0DYoAmBV6Itf4C0+Oh8MRWOIJExdOUAqeb5ZVm6ODBR
         0ZJGG/6p7VwHRCTDS6qV6ZkHRLMtREPw7LlLiUCwCgbb/b703G6aBO4VGe42sHjLPGET
         hOyi1jIB4tnNzp0wEPn9RCsS6Fk4nf8brlSZz2kV+GOOdgH+S0EUW2izyNvLoUtq9/aK
         XxYw==
X-Forwarded-Encrypted: i=1; AJvYcCXZow7YCzlLTYXpmgwv+FnBkQa6oi7JDuPQafPfK8YX0HM9geeFI4DrMemc5CZ83bVgyvp9WTb2OpwpdWl+@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1bZrVsKicoEI2GvtYJ5nyCS7KWyCZNaRssvBIpI/AoDsl8yT5
	BhE/p1C0NTl3UbWouT+R3FdWz4L4R7s0T8tmsAHv883se8qls7B4TRDLZTM185u+kXuAcQWmCpU
	tDHpqaOrv4+J5248s9K2Su5KLEZXZrwk1pJhfAVyby4eUTJUTC4DWMEsKNPi1JYMbM/T0
X-Gm-Gg: ATEYQzxXmt4uHZc6mfjTZvhPgpfXnl2LM/pqsghdcCKKUFxpo9MPhzNJLoQIct9UFXr
	wxmWUJpgpMLO/0GsUwQIw7zuvSIBDeXhSebKHwmumRQy+cHK/m+V0Zs6eltJc7OdA25wntPbIAB
	0SbxATcynwBoMK9qC7AjJU/mhOdkJ/Jeg99v4C7wBd2SfLAik7d94tkUF1jSmiVJe+2VD5Om6jZ
	l2KslwlvC7p7kfep2TdGCTra5dA0vQftL8WJhyMMEvauvibHCyuMELhWWL5UUzACW3tdWeXMitL
	PnfDeOkD2XNzdxmS4VMdI8qUgmIT7Xdqu2L+LNTnxoLb2+asyp+Fbp+GatN9jIFGPRnC4aPURea
	Xo6CtEW5AUEvxCK02/MhNDwrBEkJZGA==
X-Received: by 2002:a05:620a:4514:b0:8cd:90d5:92f with SMTP id af79cd13be357-8cd90d5118bmr242654685a.9.1773077616037;
        Mon, 09 Mar 2026 10:33:36 -0700 (PDT)
X-Received: by 2002:a05:620a:4514:b0:8cd:90d5:92f with SMTP id af79cd13be357-8cd90d5118bmr242649785a.9.1773077615392;
        Mon, 09 Mar 2026 10:33:35 -0700 (PDT)
Received: from hackbox.lan ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541b6f6e6sm12928375e9.10.2026.03.09.10.33.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 10:33:34 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 09 Mar 2026 19:33:25 +0200
Subject: [PATCH] arm64: dts: qcom: glymur-crd: Enable WLAN and Bluetooth
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260309-glymur-dts-crd-enable-bt-wlan-v1-1-3badbddd5439@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAGQEr2kC/42PSW7DMAxFr2JoXQIaPMlXKbIQRTpV4SmSnLYIc
 vfKSQt02R0/8PH+400kjoGTGKqbiHwNKaxLCeqlEv7NLWeGQCULLXUrjbRwnr7mPQLlBD4S8OJ
 wYsAMH5NbgNBKX6ua0TlRGFvkMXw++K+nZ047vrPPB/SnEfmyl+H8rAl0icGv8xzyUDXK9LJX2
 JuerGaFoyfyHXYarVaN967l3oxS/BUeqoeuKrqH56XAfr0dEewJIe3btsYMreqwJUvSaD9c6/9
 ijtcPFNMGssyXm23XyANxut+/AWT0J7ZXAQAA
X-Change-ID: 20260309-glymur-dts-crd-enable-bt-wlan-db90c414ebaa
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Zijun Hu <zijun.hu@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=5902;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=TLz4jzeiALTc6Eb3FWtI1SdxpImn8cZAqISy3Dqot4g=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBprwRs9VasoHtO/wG/38wdlq3ak2A9LcI4F2Ac5
 wuM2cX/IUSJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaa8EbAAKCRAbX0TJAJUV
 ViZ2D/9e6mWXQ9pGGmkGlknkgDgfbXQ97Qf1sCK0cgloK2DUecAysAtZ6APsHbLuHJpiaPNbfT5
 72Jr3Qt0V0retoSLY/OjICGyhdr2S1x/oyVCs+X1w0VtBMkib1g10izBa3WycpMLoz7vPTL/GhZ
 ObGYs05iriXvmdUxlUtUJHQulV18JzLfTUCsquejRxhHvWsXgNzK7L8oNGUyqt/Cj0KWPp5pCYO
 eg3wK+OrcUgPcZc+/G6pNinE5mVSDTHuwzllWvUZVrQAcoyAMdOwMP7PJ3hT9JyClluR/ziWLhX
 0l3BN/OYaISCvLnq7nv/1NjO6n3/bVCePRy9cUDuGWq0yprtQmlo3LvgwiDyumcUIaTtof5LrV3
 JzBIzIs20jQ6wRO146pKXoTTZ+qt/ZLp7SIBOV5TU3JuaHBm4ryJiUcnBQT+rQCqIOh9z9upPD6
 s6aAk+mojKbOZ+OYULVO5qpFVgoOIFfF0u/dVNZFJWlnZfVOGuXZAIaXfgfA3smqO+vU+iYoaiZ
 YgmLaSNBJ4u40imzYpO6qrlWxnzc4dmMflJ/kFfQYoHvhlO6tC9ulJieaF51bKhDRFrmgL22h1D
 rtq1L94ntv3y1vnpXNN/WrW/WPZVJjXb7PMefyM0j1Xwftsr3wi7j/z9SwSXuR4sBYrwOGTULO1
 z29spdDVPacsrag==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: g5Vnn5isXZdPJQ3cBF9plRnrZuYntJ_z
X-Proofpoint-ORIG-GUID: g5Vnn5isXZdPJQ3cBF9plRnrZuYntJ_z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDE1OCBTYWx0ZWRfX6cqOAQrFX8o1
 wiIvB6rqO8zBKwptffOedbcuBDJe2OB+bev3IXtj7gsH8WvwHdfbkv9pm6pVKX7r/bF62yPLKKR
 AMDPk/9j4AXIkQl/LpgYXBbTvtBgx2c9ZFiMdH3qX7VPNJrjQ+FgivPSnVEaYMtlPCnQ4PfPqLy
 3embM9/mwyGr/3wGZFJsDI7ecx6DsV4NM+tDOlXZODLf5wDnduUzTmLv8lqX5SokVNfSQTEhXzQ
 r+xv7W8Tw6ocNxlphq87sux8TcyelOGYs8PMU1F+vh7w9GFeUNZn0GflUSQoPBdqfDr/7RkgCvU
 BWQ+Ucfrw0WV6MddVBYpukOZo9xAwujN9vfvopvhTHIgW28V+M5gPcjEoEQT/cI5eSCvCQkBhs7
 BwVId3SzyVNhhLeHljQ0x741OhRPcjCZkClBseOuk5P7vY/e9XU6yeGKrY9hqW2zpGb94yaA9yY
 TlVPO72drVkjm3oJ3pw==
X-Authority-Analysis: v=2.4 cv=Cuays34D c=1 sm=1 tr=0 ts=69af0471 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=GPKmwmUXrvMFAArN0YQA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_04,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 spamscore=0 adultscore=0 priorityscore=1501
 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090158
X-Rspamd-Queue-Id: 9999523DABE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,0.0.0.0:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96311-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

The Glymur CRD features a WCN7850 WLAN and Bluetooth combo chip.

So describe both the 0.9V and the 3.3V regulators, then WCN7850 PMU and
the PCIe WLAN and the UART Bluetooth nodes.

This enables WLAN and Bluetooth functionality on the CRD.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dts | 119 ++++++++++++++++++++++++++++++--
 1 file changed, 113 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
index 0de7d35e1148..bcee513e477b 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
@@ -190,17 +190,27 @@ vreg_nvmesec: regulator-nvmesec {
 		regulator-boot-on;
 	};
 
-	vreg_wlan: regulator-wlan {
+	vreg_wcn_0p95: regulator-wcn-0p95 {
 		compatible = "regulator-fixed";
 
-		regulator-name = "VREG_WLAN_3P3";
+		regulator-name = "VREG_WCN_0P95";
+		regulator-min-microvolt = <950000>;
+		regulator-max-microvolt = <950000>;
+
+		vin-supply = <&vreg_wcn_3p3>;
+	};
+
+	vreg_wcn_3p3: regulator-wcn-3p3 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_WCN_3P3";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 
 		gpio = <&tlmm 94 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 
-		pinctrl-0 = <&wlan_reg_en>;
+		pinctrl-0 = <&wcn_sw_en>;
 		pinctrl-names = "default";
 
 		regulator-boot-on;
@@ -219,6 +229,66 @@ vreg_wwan: regulator-wwan {
 		pinctrl-0 = <&wwan_reg_en>;
 		pinctrl-names = "default";
 	};
+
+	wcn7850-pmu {
+		compatible = "qcom,wcn7850-pmu";
+
+		vdd-supply = <&vreg_wcn_0p95>;
+		vddio-supply = <&vreg_l15b_e0_1p8>;
+		vddio1p2-supply = <&vreg_l18b_e0_1p2>;
+		vddaon-supply = <&vreg_l15b_e0_1p8>;
+		vdddig-supply = <&vreg_l15b_e0_1p8>;
+		vddrfa1p2-supply = <&vreg_l15b_e0_1p8>;
+		vddrfa1p8-supply = <&vreg_l15b_e0_1p8>;
+
+		wlan-enable-gpios = <&tlmm 117 GPIO_ACTIVE_HIGH>;
+		bt-enable-gpios = <&tlmm 116 GPIO_ACTIVE_HIGH>;
+
+		pinctrl-0 = <&wcn_wlan_bt_en>;
+		pinctrl-names = "default";
+
+		regulators {
+			vreg_pmu_rfa_cmn: ldo0 {
+				regulator-name = "vreg_pmu_rfa_cmn";
+			};
+
+			vreg_pmu_aon_0p59: ldo1 {
+				regulator-name = "vreg_pmu_aon_0p59";
+			};
+
+			vreg_pmu_wlcx_0p8: ldo2 {
+				regulator-name = "vreg_pmu_wlcx_0p8";
+			};
+
+			vreg_pmu_wlmx_0p85: ldo3 {
+				regulator-name = "vreg_pmu_wlmx_0p85";
+			};
+
+			vreg_pmu_btcmx_0p85: ldo4 {
+				regulator-name = "vreg_pmu_btcmx_0p85";
+			};
+
+			vreg_pmu_rfa_0p8: ldo5 {
+				regulator-name = "vreg_pmu_rfa_0p8";
+			};
+
+			vreg_pmu_rfa_1p2: ldo6 {
+				regulator-name = "vreg_pmu_rfa_1p2";
+			};
+
+			vreg_pmu_rfa_1p8: ldo7 {
+				regulator-name = "vreg_pmu_rfa_1p8";
+			};
+
+			vreg_pmu_pcie_0p9: ldo8 {
+				regulator-name = "vreg_pmu_pcie_0p9";
+			};
+
+			vreg_pmu_pcie_1p8: ldo9 {
+				regulator-name = "vreg_pmu_pcie_1p8";
+			};
+		};
+	};
 };
 
 &apps_rsc {
@@ -616,8 +686,6 @@ &pcie3b_port0 {
 };
 
 &pcie4 {
-	vddpe-3v3-supply = <&vreg_wlan>;
-
 	pinctrl-0 = <&pcie4_default>;
 	pinctrl-names = "default";
 
@@ -634,6 +702,21 @@ &pcie4_phy {
 &pcie4_port0 {
 	reset-gpios = <&tlmm 146 GPIO_ACTIVE_LOW>;
 	wake-gpios = <&tlmm 148 GPIO_ACTIVE_LOW>;
+
+	wifi@0 {
+		compatible = "pci17cb,1107";
+		reg = <0x10000 0x0 0x0 0x0 0x0>;
+
+		vddaon-supply = <&vreg_pmu_aon_0p59>;
+		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
+		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
+		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+		vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
+		vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
+		vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;
+	};
 };
 
 &pcie5 {
@@ -873,7 +956,14 @@ wake-n-pins {
 		};
 	};
 
-	wlan_reg_en: wlan-reg-en-state {
+	wcn_wlan_bt_en: wcn-wlan-bt-en-state {
+		pins = "gpio116", "gpio117";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	wcn_sw_en: wcn-sw-en-state {
 		pins = "gpio94";
 		function = "gpio";
 		drive-strength = <2>;
@@ -888,6 +978,23 @@ wwan_reg_en: wwan-reg-en-state {
 	};
 };
 
+&uart14 {
+	status = "okay";
+
+	bluetooth {
+		compatible = "qcom,wcn7850-bt";
+		max-speed = <3200000>;
+
+		vddaon-supply = <&vreg_pmu_aon_0p59>;
+		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
+		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
+		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+		vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
+	};
+};
+
 &usb_0 {
 	dr_mode = "host";
 

---
base-commit: 5138081b838d92e1bfcddc7b72b9215cca6e83f0
change-id: 20260309-glymur-dts-crd-enable-bt-wlan-db90c414ebaa
prerequisite-change-id: 20260109-dts-qcom-glymur-add-usb-support-617b6d9d032c:v4
prerequisite-patch-id: df42484b224c01014637ec5a8f56bab459890557
prerequisite-patch-id: d986d8d948eaf7b80028b2244750dc7aff7de307
prerequisite-patch-id: 7ec5f802a334d96421d8f95d4d9e9773655cc947
prerequisite-patch-id: 8d9e016b49979fa817cf9eab70b809fdb9d4656f
prerequisite-change-id: 20260109-dts-qcom-glymur-crd-add-edp-03f0adde9750:v4
prerequisite-patch-id: df42484b224c01014637ec5a8f56bab459890557
prerequisite-patch-id: d986d8d948eaf7b80028b2244750dc7aff7de307
prerequisite-patch-id: 7ec5f802a334d96421d8f95d4d9e9773655cc947
prerequisite-patch-id: 8d9e016b49979fa817cf9eab70b809fdb9d4656f
prerequisite-patch-id: 6a291fd702870ca28d64439313d498593996b741
prerequisite-patch-id: c96958ab5c5605fb9577645ac5bfe5912cdfebfe
prerequisite-patch-id: bfa283218723a48e54fcd842484b004c877339b7
prerequisite-patch-id: 346f2db0933c551a039f63b945f989a5c8320657
prerequisite-patch-id: 919020405b70d588fa4356a5cbfb44e67006102e

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>


