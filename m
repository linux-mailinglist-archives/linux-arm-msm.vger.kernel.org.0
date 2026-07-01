Return-Path: <linux-arm-msm+bounces-115764-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dj+zDPZBRWoY9goAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115764-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 18:36:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA5A6EFD99
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 18:36:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=acgMu2X5;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=V0SkdxBA;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115764-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115764-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 90DE230EAC34
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 16:31:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E305372048;
	Wed,  1 Jul 2026 16:31:32 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D92AC3749F3
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2026 16:31:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782923492; cv=none; b=lTAquhKHJd4zCokbTGcmHXFhW4LPewD6S6e/pwTor53dGaW5VSzlvTzNvtYbwjV/wsMSU77JwUP8ptWgnDLLeASOks3Bb0nGhAuHSslAxAfvEaxwetIZX79FS5z7EJeU8znWkeHNWlDoRqeWIfjackTVZCYCbETeiPDogzoPJlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782923492; c=relaxed/simple;
	bh=Ck15Ifwwt/sWwiGfL7xs5DDUGsPRNLTmRP0ACg6/EYE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=befHcZpdiKuKqI2RZFarPaS7ajycE0o+AXIRiuXr7Ik5LEYl3fg/prpTxmjew3sm3d5bx8TeiVX2AePA0mR8lJgcs8LyOwjqwlzxkS9mbZ6Rq/QvsEqRS5owOpyxtxx7ILRFKHyM4ev07ThMxMckZZpRMUDUkxJwwwToml9gooA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=acgMu2X5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V0SkdxBA; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661G3HF81504005
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Jul 2026 16:31:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=UupkwVWxT4l
	1MfcXUJVDgYmKGN8Ph7ccF9FfPRlrfgA=; b=acgMu2X5VUdGIHxn1mprhuPCSwf
	uAPtuHL1DMOn/BpmePJZ+F+2VKm0hkdl9cWr0qZMOD9kwWHY+yfX4oUK3eGeI8f8
	kbT/vODZVeBBjVczf3Ew78VARgFiVuY/VsgLOJ6b1lOjKcBCY419XaIO5n4uedJm
	T3tmh60sUzhf+Hv/2D3ljbz1II+hdP67zxpn/sH/uTS+dkEG+Efi3iJvpgV46rYw
	40IBOJIOg40ClwH3NmmCeLweJGO4h2QNxrFaSb6zc3BMgegJi8r1W2vGPKOarE0S
	wvo2Dz0d5wRr20SfuEJdEMGhymhUg+k2TP0FfdRBqQcvbZ0zoQ+zWJrVwHg==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5630845r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 16:31:27 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-48952d1c293so1280827b6e.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 09:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782923487; x=1783528287; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UupkwVWxT4l1MfcXUJVDgYmKGN8Ph7ccF9FfPRlrfgA=;
        b=V0SkdxBA5Ek2izJnrRN1D095WuQeChlreWGcRCaXYbZMuVdPynxCL7ODvtCcRYADrH
         GtS02BviDk59vmqAANogWY9hldZEmTTkwHSte5mwsMgim226PlSAmFwKfmbk+ImubL96
         +66sjcynub1z+Ejs8WkUOGjj7/JyMrtJtDhcNU2FkiiG3Kt55Pg43yNlDuSVgeqlseTo
         OvS5dB5KE18ZJAo2xZrj4+a1H0F7bjdmnIjLc+ieLDTlMVov55EwyQjMTrZivZwVBTc4
         Ogrmvlz4iiusyescv4CR9ST6KPcv7yl4gnyMPV2gJP5TLsIW2lWUYGctz86pSpzYrr5+
         IPXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782923487; x=1783528287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UupkwVWxT4l1MfcXUJVDgYmKGN8Ph7ccF9FfPRlrfgA=;
        b=H6YYdAKJuzccO7CxTY0tnVLMjaG7Kb/0bobgRaGd9A9PyhDjwJAxExOGoY+/Vaqioq
         DJuc7vQXXYyOBvp/0tNrkFAvBuFzsePYGYBrtdyXNzyipLD7232/NpQqXITEdEoYaQ7Z
         UX5hELgkX1diZSR2LBokJX8XQ4BnwB8DbRjBSGzwyOhtxxTLaTxfhEgnH/pixTOYVCm/
         7c72vAL0OG1e650rH1Jsv+BqsUmXByAiWRcEV4KEFngvFPfX73RmVuPk+bY5JoSVG3+/
         p1rWDMLvX25siVPpQOavMjHldUQULbFlXQbCWExkhKnFVhRjxPAVEtZI99qjoPRaE981
         v8Vg==
X-Forwarded-Encrypted: i=1; AFNElJ9mB4PIjthc4ojH93JX7pp81y2ptlc/70UvL6yfXYV/sL9rlZER/AQVTEiCS6HXFqzJnT3tmQsnaXHBHsXQ@vger.kernel.org
X-Gm-Message-State: AOJu0YwDEMGZ1C5KgqHC2WXpC1d4aRg+hZSQHV3tkvc/9bsGmAiVhgRa
	HnOCdrRpmfyW4L/lAKSy52ga8ImKDPq/0fA1V786cOE6ZN1wkJHy7aP9TDibv5Nps4JHAu8bLIO
	WkNNIKsKSSKAe+4T88ILvjTwuwuT1NFLhqBPLO8AtVEPKbOe8BlDdTiNi2Mhf4vUx+71v
X-Gm-Gg: AfdE7ckEw2dnZ0UQBAuJbpMz6C8xpbLixwv3mcHxFK22SllWNahXjFmCQORNCE7E3iv
	mr4xsnLauArtFeKusr3usqDewj0F9MQA5sm8j7VuYrX6cfiEtOQNoOu6a3O0DycGNe/YGZ9NlSa
	6cNDvuoN1LYM+IS3W8fv1yY9puQo+Kh3VRqjPb6kcVw79TvQTBCJcji9G8U1MdxdtETl29X6Ty2
	BwEd4CfysdAO4hNeMNY0MwEyk2TjpBr3EdFDI53Tly3me2Cr9LW2xY0TUhYZRiqtHnW7q6UzePm
	RQX8GLgn6f5rlj1n6TZsn3K49HlRPmPTOPDrcqFV55vY+G7xwZlupkkX+oVCc/3fYu/3973mVPE
	cq3NK6mWottE06Vkhdf1/4ys8
X-Received: by 2002:a05:6808:5188:b0:489:352c:5153 with SMTP id 5614622812f47-4960ef22fdamr1436013b6e.21.1782923486784;
        Wed, 01 Jul 2026 09:31:26 -0700 (PDT)
X-Received: by 2002:a05:6808:5188:b0:489:352c:5153 with SMTP id 5614622812f47-4960ef22fdamr1435965b6e.21.1782923486208;
        Wed, 01 Jul 2026 09:31:26 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477db8a4b73sm1077874f8f.15.2026.07.01.09.31.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 09:31:25 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        srinivas.kandagatla@oss.qualcomm.com, vkoul@kernel.org,
        sibi.sankar@oss.qualcomm.com, prasad.kumpatla@oss.qualcomm.com,
        quic_srivasam@quicinc.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v10 3/3] arm64: dts: qcom: glymur-crd: add Audio sound card node
Date: Wed,  1 Jul 2026 17:31:15 +0100
Message-ID: <20260701163115.3701298-4-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260701163115.3701298-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260701163115.3701298-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=JdiMa0KV c=1 sm=1 tr=0 ts=6a4540df cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=Q9KsY8QRZZO8mUXd1LsA:9 a=TPnrazJqx2CeVZ-ItzZ-:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDE3NSBTYWx0ZWRfX3u7uH3TeZjc5
 k8allrw8C/yKpqolgpHbeD/nOkQ8aYKS1bhz/zTxhtOasXg1Z+92vlqc5uyYMI+yaWLzluIymKa
 YpCo/brJt9zbiseZ/Wei9xbEMOfnXlI=
X-Proofpoint-ORIG-GUID: -dVxbsQtKmyz6BHaifBkRGMuEFs5QxLD
X-Proofpoint-GUID: -dVxbsQtKmyz6BHaifBkRGMuEFs5QxLD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDE3NSBTYWx0ZWRfXxkqNU3glsKAu
 XrBosZ+nN89Gdu7vC034HcMqI6feSMlA82u14U8cLR/aKWVb17ImHsbJV8/SRkOoiVPEEGnjeux
 Uoot8LHm5c1XQtuJhSD46YIliy4zPCmx/P0hVqdbgBhOybWojpa+oX+KmgWxqqKk3gaGG+keLa7
 My43f4DUgBDNK0Q8kKPwVg9/V7WgWR+8XQtXp6avVMw/WmvuqTK3bYFxI1UsP63yLxb9k+fBgnh
 MuGIzaryyceRm5aQlQC2mct75PW9EApVxHYCNc51kFuVAM+Z0D4ehBNa8X+j47n2PQjV7URBCna
 7h8WXnSwD8PvtRmksqoaX+6t+E/nO8ghD7zIMzbE/cpAlw+B1Frfb7sfKknW7iGayYoiXEgO0mz
 uxhz0bwBb49/mFUP+iQDPWkdzitPsLCwq8mJd5eobDlFQGt3YzIGoe/CsS0wSl7pU0L13VXHpg0
 fsxolc5n0KIPIGwUQ7A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 adultscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010175
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115764-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:srinivas.kandagatla@oss.qualcomm.com,m:vkoul@kernel.org,m:sibi.sankar@oss.qualcomm.com,m:prasad.kumpatla@oss.qualcomm.com,m:quic_srivasam@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mohammad.rafi.shaik@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7AA5A6EFD99

Add the sound card of Glymur-crd board with the routing for speakers.

Add device nodes for the sound support with WSA884x smart speakers
and playback via speakers and recording via DMIC microphones.

Co-developed-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Co-developed-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 111 +++++++++++++++++++++++
 1 file changed, 111 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
index e784b538f42e..97bdc45fa1c4 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
@@ -68,6 +68,54 @@ switch-lid {
 		};
 	};
 
+	sound {
+		compatible = "qcom,glymur-sndcard";
+		model = "GLYMUR-CRD";
+		audio-routing = "WooferLeft IN", "WSA WSA_SPK1 OUT",
+				"TweeterLeft IN", "WSA WSA_SPK2 OUT",
+				"WooferRight IN", "WSA2 WSA_SPK1 OUT",
+				"TweeterRight IN", "WSA2 WSA_SPK2 OUT",
+				"VA DMIC0", "vdd-micb",
+				"VA DMIC1", "vdd-micb",
+				"VA DMIC2", "vdd-micb",
+				"VA DMIC3", "vdd-micb";
+
+		wsa-dai-link {
+			link-name = "WSA Playback";
+
+			cpu {
+				sound-dai = <&q6apmbedai WSA_CODEC_DMA_RX_0>;
+			};
+
+			codec {
+				sound-dai = <&left_woofer>, <&left_tweeter>,
+					    <&swr0 0>, <&lpass_wsamacro 0>,
+					    <&right_woofer>, <&right_tweeter>,
+					    <&swr3 0>, <&lpass_wsa2macro 0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
+		va-dai-link {
+			link-name = "VA Capture";
+
+			cpu {
+				sound-dai = <&q6apmbedai VA_CODEC_DMA_TX_0>;
+			};
+
+			codec {
+				sound-dai = <&lpass_vamacro 0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+	};
+
 	vreg_nvme: regulator-nvme {
 		compatible = "regulator-fixed";
 
@@ -444,6 +492,13 @@ vreg_l4h_e0_1p2: ldo4 {
 	};
 };
 
+&lpass_vamacro {
+	pinctrl-0 = <&dmic01_default>, <&dmic23_default>;
+	pinctrl-names = "default";
+	qcom,dmic-sample-rate = <4800000>;
+	vdd-micb-supply = <&vreg_l1b_e0_1p8>;
+};
+
 &pcie3b {
 	vddpe-3v3-supply = <&vreg_nvmesec>;
 
@@ -571,6 +626,62 @@ &pon_resin {
 	status = "okay";
 };
 
+&swr0 {
+	status = "okay";
+
+	/* WSA8845, Left Woofer */
+	left_woofer: speaker@0,0 {
+		compatible = "sdw20217020400";
+		reg = <0 0>;
+		reset-gpios = <&lpass_tlmm 12 GPIO_ACTIVE_LOW>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "WooferLeft";
+		vdd-1p8-supply = <&vreg_l15b_e0_1p8>;
+		vdd-io-supply = <&vreg_l18b_e0_1p2>;
+		qcom,port-mapping = <1 2 3 7 12 14>;
+	};
+
+	/* WSA8845, Left Tweeter */
+	left_tweeter: speaker@0,1 {
+		compatible = "sdw20217020400";
+		reg = <0 1>;
+		reset-gpios = <&lpass_tlmm 12 GPIO_ACTIVE_LOW>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "TweeterLeft";
+		vdd-1p8-supply = <&vreg_l15b_e0_1p8>;
+		vdd-io-supply = <&vreg_l18b_e0_1p2>;
+		qcom,port-mapping = <4 5 6 7 13 15>;
+	};
+};
+
+&swr3 {
+	status = "okay";
+
+	/* WSA8845, Right Woofer */
+	right_woofer: speaker@0,0 {
+		compatible = "sdw20217020400";
+		reg = <0 0>;
+		reset-gpios = <&lpass_tlmm 13 GPIO_ACTIVE_LOW>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "WooferRight";
+		vdd-1p8-supply = <&vreg_l15b_e0_1p8>;
+		vdd-io-supply = <&vreg_l18b_e0_1p2>;
+		qcom,port-mapping = <1 2 3 7 12 14>;
+	};
+
+	/* WSA8845, Right Tweeter */
+	right_tweeter: speaker@0,1 {
+		compatible = "sdw20217020400";
+		reg = <0 1>;
+		reset-gpios = <&lpass_tlmm 13 GPIO_ACTIVE_LOW>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "TweeterRight";
+		vdd-1p8-supply = <&vreg_l15b_e0_1p8>;
+		vdd-io-supply = <&vreg_l18b_e0_1p2>;
+		qcom,port-mapping = <4 5 6 7 13 15>;
+	};
+};
+
 &remoteproc_adsp {
 	firmware-name = "qcom/glymur/adsp.mbn",
 			"qcom/glymur/adsp_dtb.mbn";
-- 
2.53.0


