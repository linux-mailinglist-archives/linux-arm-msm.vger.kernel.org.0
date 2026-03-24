Return-Path: <linux-arm-msm+bounces-99680-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YGOiCCORwmkXfAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99680-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 14:26:59 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 969E8309629
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 14:26:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D96D03161227
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 13:14:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED1263F99FA;
	Tue, 24 Mar 2026 13:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fH8QbbFV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OGH10Mur"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F8DC3F8E0E
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 13:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774358045; cv=none; b=Rf6FW6hbeihZQ6ib9rYFFgz1seqMT7VCKK7eP7ao6KW5Gat8YxW2K1aDwzv7sgy8pA7PpYbUiPkN8r1fEDeKXz7KaMmKGvG5AfVOSi52WG4OqN/BKin45joqzCMQLFT50PeWojNaQG2Fr3qMjQISxTBmPRWom9AfNBoLpYGTn9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774358045; c=relaxed/simple;
	bh=eF5XHvabBc9LBykA0FGksNSDFueQYcnoVPKzmT91Vnk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nqPOl8hHYlm/ZX/n32NCVXxFuqcvkHteJKi3hPPz6f8z0mGwu9VwRn6NM2j6bpvQs+naQRTnEo9NNdTeaV4hePlwVRvWlyOU1lOvcmFJKxD1/62faLREdPfKfy2hT44YVc4pXnJNGwHvBJ3VGSGSJ+XZwaS7MMiHCMNgZlhTLHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fH8QbbFV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OGH10Mur; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O9wgaX3039885
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 13:14:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7tPC2bQE9RijAHIYt6BKlmxIIWNy/+QOYhBdjLBo+xQ=; b=fH8QbbFVxa02Z//r
	6Cn2nodHZNzyN3LEbfdWaqNovMoOfiFUhTxNrtJqk23+/icwEBkajpwgNYwqL9Rg
	f6g5qHlRMFx6JzhrTrIVIi8aNc+RWcv8zix39MIVL91ZdW1pebtZ1i8ojWYyT/jX
	sF2P+nJV1Zrgg39xwDs2O7GtAvCSmZT6NIXny3mZfeMIWj5I5/B0Fnh073B/EpYt
	LiAbNv9pRbDuJoSE2VF16t7xSTvTjwgMgXlG+sdaoZhn6fHaQelU38dYdfle2KcK
	yR3DQ1h+cY22OJBr6DODnc62rmt6eV2w6uq5/lr4+mHOmk9N8H17tqUoE7kJdeH8
	luVkXA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3rf0gq5e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 13:14:03 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c74169c1efbso875786a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 06:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774358043; x=1774962843; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7tPC2bQE9RijAHIYt6BKlmxIIWNy/+QOYhBdjLBo+xQ=;
        b=OGH10MurMiJsQGcmcFbnqGBErhNqrEbM9j0mwUOSr3FDYzcK/NbWDP9uFNgFnvE3c0
         Wdlj2iBSI6Sq+aGfWk6CVCuP4PBV7asWl1MV5AdO/fv1KGOBGYdIillaadIPpsQbppXG
         5QeOLcNCPBa9PQ4a4ubwrQZ6iRlPxO3glmWk9UVbSFFJXEa9ESeIobTbtznrXyzRVpa/
         syKQu6uw0gcwLxPy8OQFxoo44eyNXTJY1/af78Bxw81L5uz5SDIF13S2F07USEy1xHeD
         BnDD6/9CYPd4R2wTfY8Un5F58uK3OXqOfbErAzS8JvPt+QiWvpEwn4zynr1wjQh76Bg3
         GGQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774358043; x=1774962843;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7tPC2bQE9RijAHIYt6BKlmxIIWNy/+QOYhBdjLBo+xQ=;
        b=DWTtTYjXUJ0TDmuKbAKjSMiBJOZROsoScj7mRXb4CCdAT7Nwb1Bj1irdZloTYUhk1n
         n9xcaSyY9/CYRqjbRcux7UT9i5trKqCJj2F33XHwFeXOYjTR4YcO6ByDK9/7QkHezMfq
         L3KqS76q0w7KXC6W5xbjWJ3JalC3EvyPP9D1rTB39rj4UfK27Yh5ZEDtjS7mEw5qHLvG
         j76zt3i6QIopgk+0qsEoe/A/RsBSL+7h5Tw+08SXN/mZFeMjvd8I+1F9naO9pCTE3Etp
         YCAkVzkCqqEzx3HsnSIbdJounkDP2KoBhl+RIHzvjT4hivS1mQNArNdZme1TXXxa8rks
         Xg9A==
X-Gm-Message-State: AOJu0YzG54cGtC50qjcX3nSnh7QT2zgHgB+7nECRWij/7DJqI9n0R9ZU
	U4elFKpSmWZBSr78Z1dPxUnPW+lto4zeKXc++wugyunwkpLGPrRlM0n4PAMV3830t+SOnIRYPcU
	sXUGPnMg54m6l/fQqts/sNRl2X1pH9Um7eyS2JGh5mUEvK1JaqFlvnEUjuRlSfeGnr/qG
X-Gm-Gg: ATEYQzxwp7Ut+H6jabwSF5ZJyHuDuaEICWE6nHbT0n2RFsc10X7xUU7RZ9mRKs8HD2E
	RMVX0+z3givamiClK/PCitwwHy0Sr6h7Rq+doHEpeKFhTU+24Qwg/zlpqz5KCnWV5b6fIDyuw9B
	HtrAv7zWOStNoOP7q6VLCo1xrjfeBV/HGPR66stLk6GeF6hOygLGcVIX2T6li8hL4iya/eoPkSd
	5q7R3u/f7tg6yfDUFdF+FbAFZjkxh6HTQcIqEHXVheEI5nB2hwUXZTVjrGU2klb4IDtuDo8vNR8
	kx9J3eGtGmlbzywYcOIdgMQBQuVfLZgo7woJpCnpI5aiur9qGbEsevFdV5n2LHju0rE+HW1KJT/
	D7zdmDel084flEz7TxCcfhpwd+Cn4brC9bInqvotkeLMYM6hAhi4LRMlpnQ==
X-Received: by 2002:a05:6a00:2443:b0:82a:77f9:2a85 with SMTP id d2e1a72fcca58-82a8c2a72demr13105275b3a.26.1774358042818;
        Tue, 24 Mar 2026 06:14:02 -0700 (PDT)
X-Received: by 2002:a05:6a00:2443:b0:82a:77f9:2a85 with SMTP id d2e1a72fcca58-82a8c2a72demr13105244b3a.26.1774358042207;
        Tue, 24 Mar 2026 06:14:02 -0700 (PDT)
Received: from hu-vdadhani-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b03be3396sm13517528b3a.27.2026.03.24.06.13.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 06:14:01 -0700 (PDT)
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 18:43:21 +0530
Subject: [PATCH v1 4/6] arm64: dts: qcom: qcs615-ride: enable QSPI and NOR
 flash
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260324-spi-nor-v1-4-3efe59c1c119@oss.qualcomm.com>
References: <20260324-spi-nor-v1-0-3efe59c1c119@oss.qualcomm.com>
In-Reply-To: <20260324-spi-nor-v1-0-3efe59c1c119@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774358020; l=919;
 i=viken.dadhaniya@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=eF5XHvabBc9LBykA0FGksNSDFueQYcnoVPKzmT91Vnk=;
 b=5h6ClvKVLsu01oh+Y+2wVpqGRXCbb+KQs3smOaUadjZDQKYaq0AkY7rm72qKJbyQsXdtmPi/S
 dIw82+LW6BbDeR5frEur+EZfcJg7DOXcNCrdnIriVjuA5XLXiZ9Gjah
X-Developer-Key: i=viken.dadhaniya@oss.qualcomm.com; a=ed25519;
 pk=C39f+LOIGhh/02LQpT46TsUSXRvBn9qXC8Xb26KJ44Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDEwNCBTYWx0ZWRfX0c/Jg+ShN54O
 1IsqZktIC9gPgfLRRha1jW44e8uSgqHOK7C7dxjtEZ1zaoUpy3VH7hd5xSd+kNtQ4PdVxd9J2kJ
 Ux/unp+Tuk3v4p+6OLp5TBnXnK/gUSRrfhblZ33Q20wqK/5UgyfzYBWQ/WzH69759gg2xv05kfn
 5FMZwDVsZ2lCri4RlyqEpb7YsNR2yYjkL6HdgZ9eR3/n2oI7LoNj5+Y2bb83yQbvSqtQ2t9V8oG
 QopjN1EUomMu/U/dxvTO1JyOPjv7J9VLO/u1x2OPw3PaP6TuakmyrWp0F4KQdy5FnW9ptcpYxRR
 o2DD40e/P/CTo5nU6vZPT99564DR2yiedwuY/of9Nus0uwKknXp8G0spvQx8z9YMviC/0WHyjmX
 zYAtucnQmF+bSMSs/RGLxu1+ZZIfRn149O1AcVY+0txoAf8VcOYwG3pqPIXqy2vVQD9z4lyntJj
 KLZMKs33CjXTpc70oxg==
X-Authority-Analysis: v=2.4 cv=Ua9ciaSN c=1 sm=1 tr=0 ts=69c28e1b cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=4y34Q046fKwHFbVZ31UA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: bUwgt5X9Ph04zUp7GwyIifFzOXcqed4t
X-Proofpoint-GUID: bUwgt5X9Ph04zUp7GwyIifFzOXcqed4t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 phishscore=0 bulkscore=0
 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240104
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99680-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[viken.dadhaniya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 969E8309629
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The QCS615 Ride board has a SPI-NOR flash connected to the QSPI controller
on CS0. Enable the QSPI controller and add the corresponding SPI-NOR flash
node to allow the system to access it.

Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs615-ride.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
index 5a24c19c415e..b096d96ab220 100644
--- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
@@ -516,6 +516,18 @@ &pon_resin {
 	status = "okay";
 };
 
+&qspi {
+	status = "okay";
+
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <25000000>;
+		spi-tx-bus-width = <2>;
+		spi-rx-bus-width = <2>;
+	};
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };

-- 
2.34.1


