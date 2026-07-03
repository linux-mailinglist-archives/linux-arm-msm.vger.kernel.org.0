Return-Path: <linux-arm-msm+bounces-116311-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5RpIOXisR2pKdQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116311-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 14:35:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 429C9702668
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 14:35:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=nz0ocbTq;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="MSbj/KaI";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116311-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116311-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 33CE8304258B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 12:31:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E0983D333C;
	Fri,  3 Jul 2026 12:31:47 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E8B93D25D7
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 12:31:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783081906; cv=none; b=knGsT2nZiJ4RC9V/aSvjp31/g8bW+NeVRl3qS+RdysvyDQ0OC2FURgUlPNbg/jTLPsIgVzh1UenbtCCGSw9zBCaVIKffTO3g7G782eWannFZdWC3ZX1cmDi+f5TXD0cJsLpWrhuys4a4e2UN2xbPo6y4jyyAXJOLZYhPHzXDmV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783081906; c=relaxed/simple;
	bh=LbAzKcdJBSlOlhXn/vOOmm76Btm7euyS6SXySF62Bss=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=imkTvrC2XLSx/pzvwWwJimU6qC0E7EGB5tM+MwgV/uVuVMDRRM6Wj//88uxZGKJe4Wr7rHg7CqE4s3ONeCspzLmbmdoFVTl7XDOsknCTedbb6t0nRLX4d9LtermT0PilWrJPJCL2OGlo73utJqRGVZAu5dpexCCKI9r15VQgiNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nz0ocbTq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MSbj/KaI; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663Be4iu3054310
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Jul 2026 12:31:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qb9ueB3lM6PN4mzsHtBWDVS6JjZvkFZ5R22Y/sH94zw=; b=nz0ocbTqEJlTzI2r
	qHSi/PjppUSV7QdD3ApQHTLojLuR2Kg1JaX08g6j8SjDroaECfmYNyksO+XNC1s3
	+6N+ZNqphmWzi3SXXyVAckAOBGXwcBxHob7S0fe3xkzfUxH5OAZOR0FO6bJI6y6G
	XdN8Bu6Oqz41ZMfUOrnkhVpyOhV+AjHxvHY95hqqZV2OX70IWSv7Djf2nqMKMMM/
	J42riUGU06Ql7pCNH0N52wPSdo8DgaUvZ1nBWXUg/dAq+qAIHKegYqqA4VBYXUzb
	D3RQVN06MLHNtFP+Ls470plr//Nk2VoJIKIzSebxdANLGLBq7HaRekVtOyS2Qb/Z
	BxrUlw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f67j01ecf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 12:31:40 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3811ae55313so521311a91.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 05:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783081899; x=1783686699; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qb9ueB3lM6PN4mzsHtBWDVS6JjZvkFZ5R22Y/sH94zw=;
        b=MSbj/KaIMfzphIrbu/7HmndCZMcqTZxbtIffhGNa4i3RlsrLDvYLDaAF/Rgtf/HhbB
         rMXugKYh3HZ/hjVjDZyZ/od+B/kmpk2xp4vO/NW3QVhtS/S5BPp0hqQ44D1yzO8beii/
         5Zca0Ggas7dHuSDTfXO1+LT26uHLGrUFbJ3B6W9GnAunPDbcdywdUGJlA2gbKP/6QFn7
         NyPVfCYq3zGJ1Kh7Yqt5TUDW6T8lW72xGMn2pA81i4ggg6blkxYXZPKyN/2hJPIaW9Z1
         baTD72LSvI3/2vjc1/QKKfHgH5JdS1j45jcnX1xBX1UyEPlzgt8g7RrPC7HOEIEQq99g
         tOkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783081899; x=1783686699;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qb9ueB3lM6PN4mzsHtBWDVS6JjZvkFZ5R22Y/sH94zw=;
        b=RB0OL+2mcUk8gNFg1bDywXKZUCykw3ScAqfyUBy02Dyd5pxpksvyzeDJ6JjOx1pgUS
         N+wcL3rT9zE65kiznwmwG1YR57SpDv86ta2AjhBSXjjpmeEXYE6EZeCqdhMrsSJb70CH
         EXzHu0IVXKGFxsLLbeCaMZaAbnoIIwFpDSeSsOT0mQSgnmt7ZseP2TfMvu6H/XeHifyF
         qgUOXA2bgjnEfI4cJN4nBklqwUwtt9VJodvd/MoQgiDaS+wzpp+VHKXNzonSFNtarX5w
         GcBUK+5nSlbfVuca7ru4f93cepRUnzxFwvspa2AoNfoE+5iCeTLJgoKz0wneeUFJ2Of8
         I0Sw==
X-Gm-Message-State: AOJu0YwKl1EbTWh4hoV/tS9it0Tfk+G3p9Tob2S5BQPegLrCBF9A3lUz
	coh3vVwADl5Xu37ypg6RjzGrToZR9IfWRRkJfjdhhYWWuIbi9FmuzYLKmBExWsLqAAWLSMviU9D
	WrkLCQxK7OVzw7aqDj/JLD20DV/74vxAPkiNK1XQEh7eB7Cu8gln9yR7/EWswC8X+ZTNq
X-Gm-Gg: AfdE7cnZNmgGww62OOWXCzV2w2fhHeHl6zGatKnwpOBHLWP9hDxmfr361eQBeRDV7O+
	05brhxCbA0J9WvuyOF0BwctMgU4CQvdUSbyFuPzhIWoHUiX9Sbu4OLkwd06h6GX2J1/1wkpaBv9
	lMonPEfvP/yXJDYlIpHVeWN8GbA7x6iNKORjlIOkq9QOCpE279B/ORws0NiEGwmEldUQnjDc6Pb
	uohM5pKw6MyXDGk3IDBenusQZw5LpvazhKd2+e65WVkFVYABrWQd5MlC/MYt51KKvLjOEOZUl9R
	RF7m/ysjhsEfMoKUFG+/MqbPIbKjVGw1m4yOhWmAIQCrK9XZznwXvB/HovRS1YnXTErlDdDRVB+
	ZmFTAA9lJoMilc6cduGFxYUi8I295vG8gewyGQyPuvK18Ac208n6kV6owTjH9
X-Received: by 2002:a17:90b:4c03:b0:381:973e:fa08 with SMTP id 98e67ed59e1d1-381973f01admr862672a91.18.1783081899302;
        Fri, 03 Jul 2026 05:31:39 -0700 (PDT)
X-Received: by 2002:a17:90b:4c03:b0:381:973e:fa08 with SMTP id 98e67ed59e1d1-381973f01admr862632a91.18.1783081898755;
        Fri, 03 Jul 2026 05:31:38 -0700 (PDT)
Received: from hu-anancv-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0bbd223esm20949375eec.21.2026.07.03.05.31.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 05:31:38 -0700 (PDT)
From: Ananthu C V <ananthu.cv@oss.qualcomm.com>
Date: Fri, 03 Jul 2026 05:31:12 -0700
Subject: [PATCH v4 2/3] arm64: dts: qcom: fix SoCCP memory mappings for
 Glymur
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-glymur-soccp-v4-2-b706c4c9b3e2@oss.qualcomm.com>
References: <20260703-glymur-soccp-v4-0-b706c4c9b3e2@oss.qualcomm.com>
In-Reply-To: <20260703-glymur-soccp-v4-0-b706c4c9b3e2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Ananthu C V <ananthu.cv@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783081896; l=994;
 i=ananthu.cv@oss.qualcomm.com; s=20260327; h=from:subject:message-id;
 bh=LbAzKcdJBSlOlhXn/vOOmm76Btm7euyS6SXySF62Bss=;
 b=uflIOkkR8d8djFm0ntwlMcSZF/HQx9zJJjSop7On1AKvtbsEOh/Bq6lLibTVc7KN5PzKTVPbi
 AjfvKmcOz5jC6p+hWtNYFd/8Bax1jtyFFlqwWAaAA4mvybBRziP5fHC
X-Developer-Key: i=ananthu.cv@oss.qualcomm.com; a=ed25519;
 pk=Yyv4ldZGagB5zyqtlYRdUX/L9FZ6y/INQAXO9L3wfl4=
X-Proofpoint-GUID: CJQnpC-4_Q70DaVHXBKP1Dg60BbtG8hf
X-Proofpoint-ORIG-GUID: CJQnpC-4_Q70DaVHXBKP1Dg60BbtG8hf
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDEyMiBTYWx0ZWRfXxyWrVjt8ICTg
 K16BFc6WIplc3aI2nkf/YDK4dP1hd75Xd3hdAYLnClGL82Jk7ZbsZ4VLVbdRFoINrR0RRjxR4Up
 FOLLXYE+p2siaP0k9kIHbd3SLfOb2rU=
X-Authority-Analysis: v=2.4 cv=Yuc/gYYX c=1 sm=1 tr=0 ts=6a47abac cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=gkKWERduQOovxkfYEQ0A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDEyMiBTYWx0ZWRfX5tbRxTCRmgyY
 1tGXeusHSfeUoqUEpqz0SqTQDesYQNban8x+vFxjwJjkS3lC0/AI9LZnLcTX2aftUpqn4etpijU
 bw3Ws+jEkrud1lOX7/NG7tYwsN9+51BEaLN8ZOA6KbVOsJ1fYCpeOS5p3hrIPzhzJpM3HdNK0KO
 Q+b5REa5kAEZ6sDM8FgqaZ9wRbFBFyeQQc2fXwGVQi46vWZTQAmvRaKUsgQWy7RxL6clePJIi7O
 xZxY68Vt9HknoIClrYumyVkEXmwpeQNx/HyGcPeYua3RB6C/KklhVQW4Ef0N7p5LQergjotZhEt
 TPvU39t1tUZskfrX4egC9GCmrGNn3aRaMMfifk3CwBETxXBZ/QFwpFgUPE6Y5hsukGTHF9v09x9
 0ANrf2G8ofARmhVoPWkgLGA3T/lQnC1sqocc9o809pKAESsr3s9Lj258M2XD1EBFD3i9WK1oEez
 MQuhoxh9zrKo6ydJ9/Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0
 bulkscore=0 clxscore=1015 adultscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030122
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-116311-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mathieu.poirier@linaro.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:ananthu.cv@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[ananthu.cv@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ananthu.cv@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 429C9702668

Fixup the SoCCP/SoCCP DTB memory regions to reflect the memory
region requirements of the SoCCP firmware, as described in the
Glymur v21 memory map release.

Signed-off-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 20b49af7298e..5f44f68efde2 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -602,13 +602,13 @@ spss_region_mem: spss@88a00000 {
 			no-map;
 		};
 
-		soccpdtb_mem: soccpdtb@892e0000 {
-			reg = <0x0 0x892e0000 0x0 0x20000>;
+		soccpdtb_mem: soccpdtb@89200000 {
+			reg = <0x0 0x89200000 0x0 0x20000>;
 			no-map;
 		};
 
-		soccp_mem: soccp@89300000 {
-			reg = <0x0 0x89300000 0x0 0x400000>;
+		soccp_mem: soccp@88e00000 {
+			reg = <0x0 0x88e00000 0x0 0x400000>;
 			no-map;
 		};
 

-- 
2.43.0


