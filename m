Return-Path: <linux-arm-msm+bounces-93307-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SCRJMQb2lWn1XQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93307-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 18:25:26 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B066158448
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 18:25:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ACA4E3047028
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 17:24:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EA98345CA5;
	Wed, 18 Feb 2026 17:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HiTdfwIi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IWED1Re9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BF7C3451A6
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 17:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771435479; cv=none; b=sWjhFYtG1CMN7ZI23I/OZJtMUnTzid99cXI9IGKy43MXuWIBgIxbKxWaLcsw93G5NCSm0fJDX2yY4ZN7OVp5FcZI7p+Z/Rs/AvoVfEzNVYgCI2dp7HNCkzNaJcq/KcC4OR36BvrrsFcVGVqiLFSWoLJNJi4oT3E9c9caJo173rQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771435479; c=relaxed/simple;
	bh=cZjo88y9rZFFukc55HAP1oXbKdtMRxEsUlLKDPC+97g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hfgU6GcIPuSf/uObB1vQsAea/H/6MqSWfOTBIyLjlFR06UuKsiLKPw9vCoAlCRtQwQ9q1gCqrKx3RNjeQXTt20YbBK35ZEpzsK+he0N8/nwidOklpZ5SRjHJy1K0mhR4C/hKywYC5TcdhETFceXtv+ia7KB7OM+9jPxLfYotR3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HiTdfwIi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IWED1Re9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61IFH0LG423694
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 17:24:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R4Iga5zDyQz6tRoNUjnRM5byhjgwAuTAkhrEWmEWqGI=; b=HiTdfwIijAz7Jh4r
	UKCrk5y/MjnE70vqjGHF9SlbWhCzEQgvfPOgBDOyeJzHLrMMOQR0958CsUqm5LRF
	OeoQH//T7WaxKqy67vm06B/ycg/Ib9rpTnQ5U3sXE3FlLzXVt+czCtlnukj7Me1L
	L1cXfG1WaEwE5aiOGbz8geCE89N+05yfosxWuuyKD1RUc8+1mfrwIFAFyySMaPHo
	VFutVm1RX07C8gIeugpnWeyDBG4kvfLuy792SAIAc2J0RyszJ2ATk/caflutuPn4
	D/CdDzUAMuC4kJVd1pcWGzDBp8BQ0FRqKuzmHQxSJVar2ASotXDmNg2DkTkVuZYa
	mVZ1hQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cd76e1v6u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 17:24:37 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb5359e9d3so23445885a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 09:24:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771435476; x=1772040276; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R4Iga5zDyQz6tRoNUjnRM5byhjgwAuTAkhrEWmEWqGI=;
        b=IWED1Re9eq49wU/UUsHuuhh2yWoKwPI6e7Lh6nYnfag0EIefKlQQyjuXNq5RNapx6S
         xf3Hc2EXTpQ1gjv4kMS+4SDFqQzussAhbSdYxLE8IfgfMIOXf5nLvuzQIzjBggM+ur4b
         7WGbUirlSCZRidtKdpV4nBUY95/KrixvmPSmJ1mWFiQQYQ4ADDsUkCVDFksTeqnePBjA
         TdlT03q7d/dyvcBq9nXdklQ3h8zNGcSN/4e34goiS286kRVBJ2H65ydl6x3Ih1KbksGt
         8xRDVt+9YX5y4L4+yD2X9t3TKTfh7iGhXoXvJ0mvoep1FQ+WdXMkVd3uBLEvBzsp16XQ
         SuSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771435476; x=1772040276;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=R4Iga5zDyQz6tRoNUjnRM5byhjgwAuTAkhrEWmEWqGI=;
        b=k236cPcxgDUgrAcoF+MsmWFBQeyFqIj6B1ndRXMG3VOdh1v/H79CRwTsRAS9bqhKEt
         D60RGmuksWqq+W0V+dcIyMuhYvGPvjFS0uqtQq/mAFJFyLrGrLXJPnAAVTwmRKk811sa
         uS57q1fRbc+hXAcP9w619bxCivTsBLacs2jTJ3hGopO6tzwt6S0+ArsSd+x4IQEfnHqr
         5tQAEk38UxBcN85zSM1GoGy4mOn6gYKWRiD+0tHfogVZ9kXcEUPLw6GuFRY/yNHr62mX
         oi5xegiBdj/LlTGEPf/kY4Tra0Romub5ECgCuPvO7PtzDnrmPYqv4ZY7a6Gh6y1cNVnQ
         koyQ==
X-Gm-Message-State: AOJu0YxCx3fVfXcimX2JgmGOIpCUYeQbKubRWRZaupgfb+Krr5Pr2BPW
	R7fNHVyb2vek7H03MD4Mw9sPto9pliclEHHvuwxzv0LV12ZiR//zcluWaOj09GehmIjBX5Kcqmk
	wqaEeOAtT7xPO6cvpjD9efsm1rYEz9WEHeaT+V1/CKdhhrsWu18Ux3ADyKSeLjLfFcmN3
X-Gm-Gg: AZuq6aIFMKKGyLyVCsRiO6HWCGYgC5zGpSqppq4C/kGN8ZfvQjD+Np6v8CUaJdmUdxL
	8rcZceEjv3Ko835BNA4DAGfNq/34dooB0sktLjp0OQjMmGANO/V3qRZRRH9skCSSG92UQkJuCh2
	nyr9Y2XoHfhOm3J9e6yQ8msI/O5I4Dpm+iib5HLdKvjxtiptqcIIztnkfA8PijEBaIoyHjGroLw
	902p8yLABsqUCrC00RFr6HDtTIdRQY9BY8HyXsN6AuHKCMy3wCyd2xBK6DsCmA1fZykUh3AplF/
	wDplr4eaacojW3RLhNbT84aehDTGnPN1uCIymfqrZz2FYlEQg3ajDVnHZ7eQQtGHmnvkTCNVpSF
	9Nu1sGWT0CItfWS4G5p4Mko9EZdBDJdO6vbpGAC+Mjh+1Jw==
X-Received: by 2002:a05:620a:4724:b0:8ca:450f:c389 with SMTP id af79cd13be357-8cb740dd323mr311755085a.62.1771435476510;
        Wed, 18 Feb 2026 09:24:36 -0800 (PST)
X-Received: by 2002:a05:620a:4724:b0:8ca:450f:c389 with SMTP id af79cd13be357-8cb740dd323mr311752185a.62.1771435476108;
        Wed, 18 Feb 2026 09:24:36 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796ac8d46sm44181368f8f.32.2026.02.18.09.24.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 09:24:35 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 18 Feb 2026 18:24:25 +0100
Subject: [PATCH 3/5] arm64: dts: qcom: sdm845-axolotl: Drop redundant VSYNC
 pin state
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260218-qcom-dts-redundant-pins-v1-3-2799b8a4184e@oss.qualcomm.com>
References: <20260218-qcom-dts-redundant-pins-v1-0-2799b8a4184e@oss.qualcomm.com>
In-Reply-To: <20260218-qcom-dts-redundant-pins-v1-0-2799b8a4184e@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1325;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=cZjo88y9rZFFukc55HAP1oXbKdtMRxEsUlLKDPC+97g=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBplfXKmM4sH3bGsVk09jQCGOv2O3VZN0VO0+DvH
 gusrtSOvHSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaZX1ygAKCRDBN2bmhouD
 186wEACPGrFbFrUU6juBFAYEqsohB5GRcSFH29bo1/YofuE+fcp7zsuEVtTpul4XZbUFv8KciZv
 Agwi4np3OjL8ZQg8EsZQJkGWgiAkcJ/omSqK5ujTcGag9rfkRRtDA7GYbmhJW2xH1QmH3YNGfTp
 AxE2A9WqZ6L7V7ALfBwlbNRvdCfe7nG+0Tgf/y188Jz8OrfdApFN6KvF72k1DOCfI38rYRGeBf3
 XJyKsIolwn4Qm2QnIcu8Z/q50D7KMOqKGg+2lFQb28ATp/LVD6UFgUeqyO4zKQJWad1aPBrLvXo
 Ba/n/cbMzDNzTCqZUqjvCuc2GH75Mz2Uhxi3QgJjppaY5+dLB+s7McF/igr7JA6+WstuYPJwfsA
 1YOqR1YJW4VKwjVHeQ1x7FfwsbscV4KfdvF45GSpDUiginm1rnxpgwrkOBy3fhBc1XtMtLv/kCY
 NEHNkX9McMfOyqODty60trITBOZyclI5oW2XmjjHn1fFWsafqWRE5VxyRZuI76BF7wd7UWNdez1
 3BhCH7l6ITVWAZ5QhSYhuIpVsr1XTAKHRUX6PiyXkc/qrajfpE2yB/KmvVO/BwUa8F96w4oXDnJ
 Z7g/By7LOtAy2mxGi661r3A8RFNIHs7ux4NAsuUXgUKf4YzSSF6u0N6D95RTIewYU02LdlPnlKM
 dAFbGq71j4n160g==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=OKsqHCaB c=1 sm=1 tr=0 ts=6995f5d5 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=kqCYd9rN2MbHXTwIacgA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE4MDE0OCBTYWx0ZWRfX2Gyjhyq+Wo/5
 ZiBVCVMZQV9IDu6ZZwtme8asKM15fLKC6WBbaJQaUGogkD1vyIJF0TvUsWwMlGwayH4ktPA9T4x
 QTUQyOL7YZ3LZAEyq2fD8JXvqJxfWQEeO/x9aydDAfggIdVu6VjeKYSyyKOHTJmCJllRlNtj10q
 3EhxxPUjKIpEQ0+s737yH+i8qEsWj3zyG8FHkyjg7nVUnt155ZN8AxoB/jaGUgWGRjaziOfB8L1
 EtlFdxjw4mO6PRWYXBOx/ccRM2ncVNfia2JJcdbNrKrtJxNZhhKOaTjSJJX9FZ4Be9dQT+cpGhB
 tNRcDqay6hIho0xyYTUyXZn5t1lCKhibh88h50oycpw0uvja/dxqjpKn/yScbYIqWRKvzKv1vz4
 WWBB9ENKH4ifBwyAmZRdTyEJj/oAn5lxIdhihlOa1mG8ASm/c87wMrfpxgTrJiU/TL4KFNasmNO
 MTsWTC+5SH80ZMdb6Dg==
X-Proofpoint-GUID: NSdGCpMwHQReGr8k4bcZz3LjMJ91EjvC
X-Proofpoint-ORIG-GUID: NSdGCpMwHQReGr8k4bcZz3LjMJ91EjvC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-18_03,2026-02-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0 suspectscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602180148
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93307-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5B066158448
X-Rspamd-Action: no action

The active and suspend pin state of VSYNC is exactly the same, so just
use one node for both states.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
index 51b041f91d3e..740eb2255072 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
@@ -483,8 +483,8 @@ panel@0 {
 		reset-gpios = <&tlmm 6 GPIO_ACTIVE_HIGH>;
 
 		pinctrl-names = "default", "sleep";
-		pinctrl-0 = <&sde_dsi_active &sde_te_active>;
-		pinctrl-1 = <&sde_dsi_suspend &sde_te_suspend>;
+		pinctrl-0 = <&sde_dsi_active &sde_te>;
+		pinctrl-1 = <&sde_dsi_suspend &sde_te>;
 
 		port {
 			panel_in_0: endpoint {
@@ -623,14 +623,7 @@ sde_dsi_suspend: sde-dsi-suspend-state {
 		bias-pull-down;
 	};
 
-	sde_te_active: sde-te-active-state {
-		pins = "gpio10";
-		function = "mdp_vsync";
-		drive-strength = <2>;
-		bias-pull-down;
-	};
-
-	sde_te_suspend: sde-te-suspend-state {
+	sde_te: sde-te-state {
 		pins = "gpio10";
 		function = "mdp_vsync";
 		drive-strength = <2>;

-- 
2.51.0


