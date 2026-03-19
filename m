Return-Path: <linux-arm-msm+bounces-98690-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AKiQDcHGu2n1oAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98690-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 10:49:53 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 414E62C9065
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 10:49:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5533E3153725
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 09:25:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 003F63BB9FE;
	Thu, 19 Mar 2026 09:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LGwcjYPz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hXaOZi2U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C55603BAD8C
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 09:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773912266; cv=none; b=AL81g25IZwZL5YPyiUdI7loyMRaA79CMgtrVVY6VQe2bpSbnemsk5YObG2KhYS5BF89VdActy0CHpm5yLQYFoSrYQ3ym3WQ0ANfmNDWL+jkZMn4123gaG0sERKySAIXny3qTPE5wlGreUoU3CkKkDwvF6YtOMpQ3OWcgFvC4M+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773912266; c=relaxed/simple;
	bh=gfxLWwfF2AKQXalU+rumQ0ieO0pXnHY/iN5+ExVE2gI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BmoT1agu82fqMrZV1gzjxLfHqnhTY1r0sRcUwMfw+iNSv/mBWSNJxPWg3z9oCAcmT/F+NR/VWuuyYeYk5hs0ebMcz1ssi85qf+ghlGqcOeNv0R4VBMtS00+yfSurmyge4YnmjLUvoaMvdu8Yo9IgWkbTTkbYqKDLGv81c9o73bQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LGwcjYPz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hXaOZi2U; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J73v7d1898554
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 09:24:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qYRdTdLgVsmr83zB2UHBMMXbgW5Q/MM7kZAYJiw4tzE=; b=LGwcjYPzGYdExa05
	os/yi4ARGz7AYyMXHKIXA7CmAPO5cCf9LDqBa8ApMx8JSdsz/LbGIxPAu25sjwFS
	yiRYENtCcewS+9SIZCjtbQWpZcaRtOsd9wzlNQn1KgLNgNKhoN1s7d6Riggw5Cph
	o0qF37MvevbriycObxEVfyw5hGYr1ZpnS7HbsR9tO6nbvj9JmlrOjpGZk99CIVuW
	mO4F7NZcQmWO8IR8yUc5/9gCjdeFSDge1M1B/ayAnFUTJS6NgA0AdHNeFQXz6JWo
	lXoYT/8MOsTEAHCUlmum9FvrkPeMEUE01rSVL9oYlqnjHZrJ+eIkXuIeRjVTbe92
	ihisww==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyyhgav3f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 09:24:25 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b069bfa817so11786335ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 02:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773912264; x=1774517064; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qYRdTdLgVsmr83zB2UHBMMXbgW5Q/MM7kZAYJiw4tzE=;
        b=hXaOZi2U18QFEolcs7D5tI88J7SdQURc/EEG3S2Uf75lhopU4lSyNQZFLuXohvMB8d
         0BQ/DnCQeMyErNU75tD3ojfJIWxKhNqeHEbNV1xlok5FgUFI++QwisrZEvZqfl7wu/XZ
         7o5aW3U7yJ6gldJbIIrmpR3z2pAEQPieAUTQovhe19SP1B0sD5rYOCWklHYmAz1i9MsO
         nDWaxw+BFcCtI6UEj14fkD+DAkxAjtser3SDrJCmhUiQ9IYvGE1QrO9/sLr5LuhHGMgn
         3CuaQRHb5EAX7f7V9+6FsFPAg5zgj2lsHCKNtCKk8RsxTZRAF9gxQ5+N4DGBVNrmTIuy
         ozfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773912264; x=1774517064;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qYRdTdLgVsmr83zB2UHBMMXbgW5Q/MM7kZAYJiw4tzE=;
        b=hRw1fZBIWhm1HFtewKhmwvaMZr++MlhYZTLl79/6VMek9uapv/gaUc1zB+ZQlmz3MI
         2RRoBVqjhzGzfykYQgb3DF5gj170PEY3POfNlXCH9s11A9jhzap1olWt8QTuQed3wNNG
         A2jNl2XpQc37YmkV7AC3T/bRrc6PWRkuMEKcFKii5QKM4FgBBPuNVeNSc3veKyPUb7XC
         Z687Ofbn73pV2f7BlHGdrHsoUoW72xmqKk8o2UBsfXtiP5MW95bRW9nL8extA+O4Ok4o
         1ozgQOt6tAmeEIXgc01WmyVUShZ3AvoqnYLTjuh3gf/E0T/PmyYHxlx6lptxbml+GIdv
         RNJQ==
X-Forwarded-Encrypted: i=1; AJvYcCUgKtTY5hLUstx7wYUOX+Js12fqTFwRQbDA9QJbRmyoGXBPz3vP82i6cpW9nP6ftX52KgLeE59HG2v08pcC@vger.kernel.org
X-Gm-Message-State: AOJu0YxfG5nYUYvFwnEqCPZvh0p+DESM5cB3+NA00MyO3+9Bol6GmtU+
	wP4AKF3K0xscZEtkh1FLyHbVeOP6ATQxgpWnmTlHj9ymPc4llGoMqLrMt4ec6+HuBpyipAHW/dk
	RUYwa57Et0B1ZBk+19aOhnxV+tezlzaJsgNUsAqE2osEq6bVFw6Z54JYaqvqzlfxJybD+
X-Gm-Gg: ATEYQzxObLOuhGPwvXpdqMFrwIBGeAy975iQWviqtQrMlQD4c2BMpi/Sj1TERGRlJFE
	uI084TQNtxnf7Wc6HKvuCJAqJpOlPuJxjhh9sQl+Ge7Y74pYTi3d+P3G74US9r4w5yiEQxOZsJv
	Losw/N6cQgo8YMLo53KNDz1bkj+2TxQRsmNJMeWryXAUFE+aepI+fdWX6nPl7OjnKnwsPdBlno/
	RudZvGlUrJ5KuKAESF1HyOL2MHQmprjfZaZSxzcblYSZauX6MYVQbzmpUFde/WVLZGgS8YMTbZK
	zqM4lIn4+RPF4Li7Iufn+5iRxFjdjKJf8Df3CPfWfazJ3ILLgE43NbsRf5XN/d8inOTWPO5Rhsk
	3uG9+xlBDH3eygiJPBCikGSxNNRwrS8Hlrunq3aq/uCkV0COq5WpCUrIa7fGKMJOCIok4heEgPY
	CRkRK3Zl2r/P1V22vn+e1Z
X-Received: by 2002:a17:902:cf11:b0:2b0:6e8f:8e73 with SMTP id d9443c01a7336-2b06e8f918fmr57167095ad.44.1773912264540;
        Thu, 19 Mar 2026 02:24:24 -0700 (PDT)
X-Received: by 2002:a17:902:cf11:b0:2b0:6e8f:8e73 with SMTP id d9443c01a7336-2b06e8f918fmr57166715ad.44.1773912264060;
        Thu, 19 Mar 2026 02:24:24 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0704ccc67sm48391035ad.15.2026.03.19.02.24.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 02:24:23 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Thu, 19 Mar 2026 17:23:57 +0800
Subject: [PATCH v3 5/5] arm64: dts: qcom: purwa-iot-som: enable video
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260319-enable_iris_on_purwa-v3-5-bf8f3e9a8c9c@oss.qualcomm.com>
References: <20260319-enable_iris_on_purwa-v3-0-bf8f3e9a8c9c@oss.qualcomm.com>
In-Reply-To: <20260319-enable_iris_on_purwa-v3-0-bf8f3e9a8c9c@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773912238; l=797;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=gfxLWwfF2AKQXalU+rumQ0ieO0pXnHY/iN5+ExVE2gI=;
 b=sEuyW/0qqAXh5V31A5N2qELgEK3rgyEUpmvQZkub5l42MXqpM8aIh7ubyIuEYXtYxkSaotBDL
 H/8F6SAdqXPBT0+2wASsAMAtN55Nsx6/q+dG+svxtMwaRb8kxeQHS8s
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDA3NCBTYWx0ZWRfX6nim3NTAIgOI
 NYKV5kavcEhK7Wr3tgsm/J05dA5cgaCtznYOWUm3/i+J43vrX0+gM9ey8tvLeWPtylK9H7dGbOh
 +CcatbsWnOdrS3QJDhQCE3alA0KmQBI+dAzJdRP5THjgpLV4Z04tRzOA3mD+q1EnInw5Iq4lJAX
 cTzzDiXRQf0LvC9a1OfsXZTnYTFvfHNflzTVIkvstiE2WUtPTn2W7e8rNJ/RnGmRLI4VJ4gGrXu
 VlJJYPdIPfXDZQ9Br6RtQ1b/98UyTl95TE8U8/VJuDEQR4yys2WKkEDsVCCC9MoekCExp3ajBaz
 4BnmIojWDdKOi0wTEosCxQuFqMXd2lF0V3NddRxBU7KhUjAFCieFFWOkzHqWWRpaQZAv5fTqE5u
 fqHas7ScJ+O8rR0P8BhcQqFp6NA2FF7c3A2rDALmAbUX/Jko70/XgIwHrVBNhiQ2pbkoo9wHQpf
 anoIsz/dYmmCNRVWl0g==
X-Proofpoint-ORIG-GUID: EZaM1BHCMeOGioYM2soobtn6xcaWniaQ
X-Authority-Analysis: v=2.4 cv=IbSKmGqa c=1 sm=1 tr=0 ts=69bbc0c9 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=lIq5CcVmxYL3PNKvYLcA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: EZaM1BHCMeOGioYM2soobtn6xcaWniaQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 clxscore=1015 adultscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603190074
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-98690-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wangao.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 414E62C9065
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Enable video nodes on the purwa-iot-som board.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi b/arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi
index fb90beb1096f665dab834737b6f4115f56c72977..549fbfa3273270d287bb447b45a7d2f58fa15a47 100644
--- a/arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi
@@ -389,6 +389,10 @@ &gpu_zap_shader {
 	firmware-name = "qcom/x1p42100/gen71500_zap.mbn";
 };
 
+&iris {
+	status = "okay";
+};
+
 &pcie3 {
 	pinctrl-0 = <&pcie3_default>;
 	pinctrl-names = "default";

-- 
2.43.0


