Return-Path: <linux-arm-msm+bounces-91597-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OM/8N56QgWl/HAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91597-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 07:07:26 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 83611D4FED
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 07:07:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4EF303017DC0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Feb 2026 06:06:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BF8736E48D;
	Tue,  3 Feb 2026 06:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jgVIcypc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EP+AN2t4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 263D536D4E2
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Feb 2026 06:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770098801; cv=none; b=bRQpAayr0qdXCC339Gnz2I/eic4FZru9ZZZye005C7Iy+vZWriPF++z0bqnvnVgzuhOYEdz7koHfC/pUuD8keG8p6ng48KWzCUXKvjkvfqZUmqmMk9LXsg9MYqOH7dQ4PFAndytlfxkp3X3klGRmLroQ1PuH2wy5mpiDdVv1TWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770098801; c=relaxed/simple;
	bh=tW4K+WgSJyLZfWN+10XcL4+EBYZ+0pCMvRvFk+AoOeU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QbrclM8CQ93VRvZby37nsPstUYSTJWA181oa6Qlxsi1dYwPmDFzOYzxMyzV5GCO1w79/TAJQUn2WnYdgbzW2zmH34rIO6WgcHtl25fg1sH8LPjtFJFtp87NuwuYM5AUwbyfxyZV5MGnpcHd7bVy4n5eM8NZzxT6H8EieCnp0NPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jgVIcypc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EP+AN2t4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6135usuR3915984
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Feb 2026 06:06:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kUqCiBd6ikhwKifJPE4u1pdAWzTgL175SpkaOSzjkt4=; b=jgVIcypcn9eSQMeo
	jrKtx9PmpNKete1KQ9DhqVR7d32rgzrY0jwcpEMne8Jhu3SqfvYh0XXMk5Yuvu2V
	PTSqF6d+rOlgZjhCJn/PlRBCUDfXHnFlM78/PMlzbrqIgsChjQp/+hPQOblxp42M
	7h/gM9lX38n+gyGKAk9iNpkUNDlcMHqOgNTiDtqG/mWc7lB4Hgfbz+K41SE+ep03
	ntqAo9w6g7P5D8BJgyM61OfVa70A7Fdlx7rRxVTOFsnaLraAlsnu4tggUQTU3dN3
	ZeePJDld4GhJdfYqkrc6LzU0iumDCtUbWUlaNXB1VUAMskAUKUKaLouoa14o84LV
	xMW4yQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2tkmk4wg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 06:06:38 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2b71c5826fbso6085122eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 22:06:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770098797; x=1770703597; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kUqCiBd6ikhwKifJPE4u1pdAWzTgL175SpkaOSzjkt4=;
        b=EP+AN2t4IH9Z48+6d+nOvfhzDbZ2oLcBGbD8ZzpDKBIVUHfh8l9BZYWF7vmk697uqN
         pdMcTgvSMB6TKgZsP8KbWPIZY2ND7k6EY/eLSP4O1kHMp/mw7IV1ki158CHMWGVmwmLu
         K0aaB3Qd6W8wiLi3+HJfjYpp3EO1Qn4GvLsbelA9GdmK2nSelYnYJ2zJRXmZxvYl1cIv
         uDK+xSHaJfGWUBJqibdWXxm8DNZvtwGG5OT4sYsFJbX80GXrt/VVcmpEii9Nu2T91dFz
         8nKFBadBi83zBonFmvyKlo1BBzyAxshkZ9j8QK7g1U5a+CQLsdHNKkGdp1N0qFj4tKLg
         ps1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770098797; x=1770703597;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kUqCiBd6ikhwKifJPE4u1pdAWzTgL175SpkaOSzjkt4=;
        b=vXqOlqmT8baLocjGqQl4FrQdbUmMV0PxgYO4mUsuz3LIHFfGzQYpcTOxxm3YEy3gao
         aLO6CBwcUjj1J3ocmrUnvctF+3k3ahXBMnEpneUwpQ6fYvccJOUc1aaxu4ryrtgjHgqK
         5r8GdwcVlxOaXWYOz6ozAoG/q7c5NLkyNhlhPQM4hHGdUG/a8wpS3Xtfhr9XpjBXyZlH
         vt8om+bHR1Uuu+thOegQaqPHAWBVtVko90oJj0ZZ77vkPPrBAQ9qK0RDjW2kK5062vad
         RA34uYvbuAPL1B0gZ/P6Oslt6IlT9tmFjYdbOzaRbZUmiqOr44b8AojwBjsOV0xL62/F
         sm8A==
X-Forwarded-Encrypted: i=1; AJvYcCW6r0LE7MPK6wQOqankCLlwu5t7IO0bhfOIlyxGIpzQSEAqLj7LnhJwaR0tX+8ceHhwVM+TMTsT5dKaXCsp@vger.kernel.org
X-Gm-Message-State: AOJu0YwZMTWriDecn15Wm8pm8cj8Z6/B+fXZLO6ewXcR7UhK9gL7odb9
	yyOl1OJpKlMuq+4YW2BSLeO0hchztOe79x9+DqZZv3m7F8Waxpp9wkhAeAIBDGw/ZKLVuyTlqW5
	P9f+AklofLxoeo+JrwAMOSa1qA70PBtpdU9PwdW3xsVV7nbDZAmpTSXOf5Ypmf1i9Q3mG
X-Gm-Gg: AZuq6aKYd514KIYpVuwDYsLcfcpDcELxIPIxcF2azz5MCF9lpJMACRHZQOkQlnX7qbe
	dx6++2yt0gtzUtJMmzp3k868wifXLYXZuN6FiXVTBPIHn4NCRwg2zarHR8OYF3B8I67lfUhD8Oq
	lY8mJijENPoZClIRNMpLoGuTpp8bQJzNuFgo+qqaIJmZL2IqKLNFlLYh9mIIlrzc5MwetA+kufV
	Vw0YFgn2nR3CqF5Zyu9euTGwbsjj8s7tTDR6P4l6qcFQSPtdykKOAgVdhBz0V0hLw2/FMqpTU35
	VaSjgrLqRyUEocohKazOSVopfWDnftnBnJ0G6lnfb8vuEOGgnOUBWMK/BYUz6Ptnow58MJCHkDq
	9820jOSTZOgPKnF/ZyS4UKxWZfgn0K+OiGKIDwTvo2QQhquc69/TamTpCQ5sc
X-Received: by 2002:a05:7300:dc14:b0:2a4:630b:c789 with SMTP id 5a478bee46e88-2b7c893c6f3mr6488214eec.37.1770098797205;
        Mon, 02 Feb 2026 22:06:37 -0800 (PST)
X-Received: by 2002:a05:7300:dc14:b0:2a4:630b:c789 with SMTP id 5a478bee46e88-2b7c893c6f3mr6488206eec.37.1770098796703;
        Mon, 02 Feb 2026 22:06:36 -0800 (PST)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b8283def01sm417499eec.34.2026.02.02.22.06.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 22:06:35 -0800 (PST)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Mon, 02 Feb 2026 22:06:23 -0800
Subject: [PATCH v5 06/10] arm64: dts: qcom: kaanapali-mtp: Enable ADSP and
 CDSP
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260202-knp-dts-misc-v5-6-02de82bf9901@oss.qualcomm.com>
References: <20260202-knp-dts-misc-v5-0-02de82bf9901@oss.qualcomm.com>
In-Reply-To: <20260202-knp-dts-misc-v5-0-02de82bf9901@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        20260114-knp-remoteproc-v4-0-fcf0b04d01af@oss.qualcomm.com,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770098787; l=1007;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=tW4K+WgSJyLZfWN+10XcL4+EBYZ+0pCMvRvFk+AoOeU=;
 b=6QZM++EU9JbCZOFu7qRZ7whOIuCVesGjBcACTqP6pML5HB+I2ob4OZDoi/YAFfQ8cSLE2EwuJ
 IfuFU0Skg2bCQrq0um+dGBj6rlDUXFZbAI6UNh9H2ysFwU2h7oJxbQm
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Authority-Analysis: v=2.4 cv=TaebdBQh c=1 sm=1 tr=0 ts=6981906e cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=6pSOtZClNuHiBGgWezYA:9
 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: uBTCmq2no804PzBunVsNg-rLY4-pbaUM
X-Proofpoint-ORIG-GUID: uBTCmq2no804PzBunVsNg-rLY4-pbaUM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDA0NyBTYWx0ZWRfX6XuUU/kP7Jtp
 XUwwQpVJxgXtdn3iQ5K3WYsHvv4sXeMNu6tNKG9tAsGKS7mlZn2j0zvUO0uFoe72DoRXM6ZHqDc
 1I3tuTyR5gu9+L2kPTJpR8eE6pEpp8Te0y2TtfeJVkV1oH3xWhj/vD4vlswZ0TvJibS5EIHBRau
 9pJvTTZo/50lvhfotmSb4dY39wm8csFkTtn1Ki9g/EYd4hNgpUXek9/83sbWacyATWnbBF/G3QH
 DPPNPh+Ldie9j+jSvJSWI+OVNW3bi+9tli9m5PaEo2c+kHsHBGkZ4XEtUdw943XhA1k2nz+j0GJ
 xGhb6R1i0lT4MNPcpsL3vGgw7oHtq7WdRPKrWu8pvp0yrGp/ZRfrmojQVMMjqcRV2Fm6bgBR5VA
 /gzBdX3t4L4lkQn5qtxdqSOFJvm/nlNThRniMvQajGEPtYFNKQUsV+DzyiBQrgfR3lPo4pSHmnm
 h/hxAKFvfNs1m3grBKQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_01,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602030047
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-91597-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jingyi.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 83611D4FED
X-Rspamd-Action: no action

Enable ADSP and CDSP on Kaanapali MTP board.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali-mtp.dts | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
index 32a082598434..3544f744fd1d 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
@@ -684,6 +684,20 @@ &pcie_port0 {
 	reset-gpios = <&tlmm 102 GPIO_ACTIVE_LOW>;
 };
 
+&remoteproc_adsp {
+	firmware-name = "qcom/kaanapali/adsp.mbn",
+			"qcom/kaanapali/adsp_dtb.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_cdsp {
+	firmware-name = "qcom/kaanapali/cdsp.mbn",
+			"qcom/kaanapali/cdsp_dtb.mbn";
+
+	status = "okay";
+};
+
 &sdhc_2 {
 	cd-gpios = <&tlmm 55 GPIO_ACTIVE_LOW>;
 

-- 
2.25.1


