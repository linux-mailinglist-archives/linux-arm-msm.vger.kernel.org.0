Return-Path: <linux-arm-msm+bounces-116800-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8/nKNnC1S2rgYwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116800-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 16:02:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 44FC4711A9F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 16:02:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=GJdIMBSC;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ItqxgsPV;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116800-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116800-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 766D232BC6D0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 12:32:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1274242CB1A;
	Mon,  6 Jul 2026 12:31:58 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D0AB42CB17
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 12:31:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783341116; cv=none; b=XkP6GtKif6P7lpa8SmvldyaEe1otgetZZ66GrTQgTXS4DZgD5wzQb4gofAdDJfrFunyO2y0FTOMnBx4hLL24UkaeQJLXKBm4fWe/BOGXRxgL/CF975yoXbbIEdoI4dbaErjaK1ebKua5LyVGzPkYb/cSJuozgbFGJmqi4rSgCDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783341116; c=relaxed/simple;
	bh=JMTe2+JJF8T0cSsmDIrsxMfHRBmIBv9GJfZ7BMilGkY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D/2B2VFfanUuTwObTHOpNqdtDvZLRH8btMzZ3bJTmRTtJ3QkPkAMWwS4SHs4348EgICPKLFYXaVctHro3BfN1QXyX67tchJy/MpxkkMWMN+ns9m/PBdZZCxmQ7z5pMlT63oDmziIy9pTYh9oWUoYvon/R0sNfnkx5BbliBD+7V8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GJdIMBSC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ItqxgsPV; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxAlv245625
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 12:31:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A2Ljr0lImczYQDYU16aZIIUIosMUQxB2bqsohrmCamE=; b=GJdIMBSCBpnuXNfa
	u8EwtgquyUAVc1yDQzsb9YbV5GEziYPl1oYr5jW/O9N0qmogys3/ydRCWgssTTqC
	7vi5kz2eBSBJFv4y6zW7XfLtAObdHX5ByL73oiEVar1q4g/jgjAFZH9qUzLCpnDO
	OO72gHf44+X/MmZX/4wtA8tTiTLiLY/JZnpBY0mAeYui0H6zMyCBJXIFr6xPofF5
	n1vGJWn1Suz0MjdWsw4ZlyRghr0ocFN+tFTZTDAxu9pnWhNEKEj8zee/nLUObV3w
	vTVL6onKFJWHrq/Rj4Kz7z4rLSFpp7mUv2vxmSfXWa8kybuj/0tTaTtqqhXXb4m4
	9J1r1Q==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a98gh2n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 12:31:51 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-737d2bd8bbaso3412121137.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 05:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783341111; x=1783945911; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A2Ljr0lImczYQDYU16aZIIUIosMUQxB2bqsohrmCamE=;
        b=ItqxgsPVssOuehmNS6QhtyVrl54jnu734fwNKJYPNK4pYbCPbsYwlHC8Lew9ZhMEtB
         YQa/KFmh9DX+CpXMqgdwe/N19dUvJ/VfHCv6HHHy+YFfSFQ3KldJllbgi5WhWlJOmwfK
         b3MquR/7DBmJ8wWcPg2SVoV7DUA95a1yKteN1UxTeBLPEf0eKzCbbCH/Wj4ekG63Q3Ui
         7J22ku5PT9PHxfJz4SXik9W0BxcGDJ28m+WuBU0USB8dd/6VY9ozt07kX6wHHWuyz06O
         AifLKxQexBNr6PzBGLg5VCnmdU2Fx9UgXA0y28zYuEII2QaiazUJp+j88sulHmaLfr1O
         mfyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783341111; x=1783945911;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=A2Ljr0lImczYQDYU16aZIIUIosMUQxB2bqsohrmCamE=;
        b=dFtMzS74U6wN7B0wa6pBxdiVp0mp8rcSyMqXXfTH71VH1XaEsFkjTxRB5OD793SjYv
         21Vqa3ZmBP1rANCnWbnaUu3ElOKqLAxvAsovgpfHbxM0K68Ig6ijlgvt1oJTfHa9u2YY
         bZmj36gWciVstNYpXm+5UyilavdF9R9BB2sSbdIxYaRP4F1JFOWIg4ZGLeDHKF0JJ+B+
         U0DpUSDk2siAvLivDxX0OSIuc326+iVVVfcfLW6biMzWefzudJ6oDxpHwXMtvgAZDAY4
         yeaxiOfzzU6BblmBWE9XRWrRq589nBq9+yg4BHpZOP9XH8PrkUC7+eFWuQCSk4qh9MYK
         j6lw==
X-Gm-Message-State: AOJu0YwRVeYFfX559B2FdpRGFkoNX79BGP8kDOkS+BL3W48kHTXfmzM/
	Om+zvhFfnzDqXC0D+o/m2Ss3BxPQdMbBAC8j6z7hsl/iTFMiu8EcYLgw51Ad092tdzLkkbJK2TN
	M25H80hG4NK7i1JMKUTmk7i9SNyCDO60QWUVCg87MCt526fkGIiYuzNZD0sQsMF0nRvk=
X-Gm-Gg: AfdE7cmdtwpgJPvXjLj+yUNMQXd3H/1c+B4WDfo/Mo8hxuPCmNchj3CHxLn49IHRBRO
	pd8dQcqhLuKnOc3z7heBU7PgwRX5H/Fhn6MCPY7cYuFYLK6XlLAv5CCpKOPcfTQ86VpmTWRHaeX
	XiEAZMan+ttBZZJhvISsn9rQb+2KyE3xOcwDXCfCq+uEzmq2wXrimmssvUVEaVcpsskmrFfLczI
	SW1pevwrPygdopb1Q7p4PZmYAWV8icvwFRXRR6vWRqSBgJNBXEWNpkAX1UF1fc7K17qLhsuoWiI
	gOU9sGc2PNCtKZDyR49AZ7ThCcchUzsj2cae+IXzwPTmKC0wPC3/WpB2jYondbhbuzB8toN3T/I
	3QphQXl8EC9Vj+dVDCtHIdN7OLfHgJoDvpw25UUH+
X-Received: by 2002:a05:6102:3e24:b0:631:ff40:22b5 with SMTP id ada2fe7eead31-744b7f1652dmr115308137.21.1783341108676;
        Mon, 06 Jul 2026 05:31:48 -0700 (PDT)
X-Received: by 2002:a05:6102:3e24:b0:631:ff40:22b5 with SMTP id ada2fe7eead31-744b7f1652dmr115095137.21.1783341106713;
        Mon, 06 Jul 2026 05:31:46 -0700 (PDT)
Received: from hu-kotarake-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-969838e1980sm5252990241.7.2026.07.06.05.31.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 05:31:46 -0700 (PDT)
From: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 18:01:07 +0530
Subject: [PATCH v3 3/4] regulator: qcom_usb_vbus: add support for
 qcom,pm4125-vbus-reg
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-add_pm4125-vbus-reg-v3-3-999d78a87b81@oss.qualcomm.com>
References: <20260706-add_pm4125-vbus-reg-v3-0-999d78a87b81@oss.qualcomm.com>
In-Reply-To: <20260706-add_pm4125-vbus-reg-v3-0-999d78a87b81@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, jishnu.prakash@oss.qualcomm.com,
        kamal.wadhwa@oss.qualcomm.com, Krzysztof Kozlowski <krzk@kernel.org>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783341082; l=3024;
 i=rakesh.kota@oss.qualcomm.com; s=20250919; h=from:subject:message-id;
 bh=JMTe2+JJF8T0cSsmDIrsxMfHRBmIBv9GJfZ7BMilGkY=;
 b=00zeMQwFnzcMF2i9OxkyJwfR/ZrwGLgAkioqaNyV9R9+xUiR/eHliAHSZEluZgUHQGnXN24ph
 GGY+nVahLBMC1yvykpVy1Cz64fNqasUwtnhmXy3ZWsLlD4W46xC3ojZ
X-Developer-Key: i=rakesh.kota@oss.qualcomm.com; a=ed25519;
 pk=dFhv9yPC8egZglsSLDMls08cOvZKZkG6QQn1a/ofwNU=
X-Authority-Analysis: v=2.4 cv=SpigLvO0 c=1 sm=1 tr=0 ts=6a4ba037 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=3mJ39vkoQXamFeApidoA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEyNyBTYWx0ZWRfX+SwNOFBdHnhe
 3g6yfb6Ci3QlClwVHMSE0wLSkqyZhu3aWIsXVPa9c8TZsrOdLfJpDcmHbaJHkwsmScBLFmCPAul
 W5G90U2o7mA14/4avLI/XuuJrYh9na2w9b2gFtiuZS/dj3seYzmU/JJt2CLJ5mDAVMJEJ6nvys7
 N6YTXnAmEckx70cnCAo0/5a14UqP/bItQQtqfunH9knKMOw2l5mUslOzIOyMDSdQshqt71Lsmih
 SbyIwBptoy3ygCa+yebrn1AwO+Gfh/5uFmf305H0xYekqtyISQUIJYRl0kuoWaagV110RxXwIbW
 BwjQG4In2GYFv9WiNB1gCBjA/hMp5rcN4OKs2r10R4+5LVLlBxNnKMM7aFw0+iFfHQ4tjZoHnch
 OV1v9ODjP223MsmlCqKe/xCtokGffL5WGXawqvPp09074r6wuwEHMVaybOAy8iX5a0bQp9+4s+S
 92mTHD+hMpeLNR6619w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEyNyBTYWx0ZWRfX6RjQisWxeiOh
 N+ygwb+eUSFkaBVOJa0YywzbMbKa1j4OXPbhTT2XILmGuB7N9IHpXSrcrZlNIaQJgdatYrEZjlW
 w8QSSMm0NUeJcpYAt/4j5nBDD/acxaQ=
X-Proofpoint-GUID: zqu45E3aC_zpIRooiFwqjzMJ7oTqfy8F
X-Proofpoint-ORIG-GUID: zqu45E3aC_zpIRooiFwqjzMJ7oTqfy8F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1015 phishscore=0
 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060127
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-116800-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,quicinc.com];
	FORGED_RECIPIENTS(0.00)[m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_wcheng@quicinc.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:bod@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:jishnu.prakash@oss.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:krzk@kernel.org,m:rakesh.kota@oss.qualcomm.com,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[rakesh.kota@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rakesh.kota@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 44FC4711A9F

The PM4125 PMIC uses a different register layout for USB VBUS control
compared to PM8150B. On PM4125, CMD_OTG is at offset 0x50, OTG_CFG is
at 0x56, and offset 0x52 is a 2-bit VBOOST voltage selector rather than
a current-limit selector.

Add pm4125_data using the abstraction introduced for PM8150B, along with
dedicated voltage-selector ops and the pm4125_vboost_table covering the
four supported boost voltages: 4.25 V, 4.5 V, 4.75 V, and 5.0 V.

Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
---
 drivers/regulator/qcom_usb_vbus-regulator.c | 31 +++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/regulator/qcom_usb_vbus-regulator.c b/drivers/regulator/qcom_usb_vbus-regulator.c
index 0201a3983981eec1f475d4b8cdccc9148b5e3b2e..9aea68876284e55427d03f667c9428af0ebb53d2 100644
--- a/drivers/regulator/qcom_usb_vbus-regulator.c
+++ b/drivers/regulator/qcom_usb_vbus-regulator.c
@@ -20,6 +20,12 @@
 #define OTG_CFG				0x53
 #define OTG_EN_SRC_CFG			BIT(1)
 
+#define PM4125_VBOOST_EN		0x50
+#define PM4125_VBOOST_SEL		0x52
+#define PM4125_VBOOST_CFG_MASK		GENMASK(1, 0)
+#define PM4125_VBOOST_CFG		0x56
+#define PM4125_VBOOST_EN_SRC_CFG	BIT(0)
+
 struct qcom_usb_vbus_reg_data {
 	u16 cmd_otg;
 	u16 otg_cfg;
@@ -39,6 +45,10 @@ static const unsigned int curr_table[] = {
 	500000, 1000000, 1500000, 2000000, 2500000, 3000000,
 };
 
+static const unsigned int pm4125_vboost_table[] = {
+	4250000, 4500000, 4750000, 5000000,
+};
+
 static const struct regulator_ops qcom_usb_vbus_reg_ops = {
 	.enable = regulator_enable_regmap,
 	.disable = regulator_disable_regmap,
@@ -58,6 +68,26 @@ static const struct qcom_usb_vbus_reg_data pm8150b_data = {
 	.ops = &qcom_usb_vbus_reg_ops,
 };
 
+static const struct regulator_ops qcom_usb_vbus_pm4125_reg_ops = {
+	.enable = regulator_enable_regmap,
+	.disable = regulator_disable_regmap,
+	.is_enabled = regulator_is_enabled_regmap,
+	.get_voltage_sel = regulator_get_voltage_sel_regmap,
+	.set_voltage_sel = regulator_set_voltage_sel_regmap,
+	.list_voltage = regulator_list_voltage_table,
+};
+
+static const struct qcom_usb_vbus_reg_data pm4125_data = {
+	.cmd_otg = PM4125_VBOOST_EN,
+	.otg_cfg = PM4125_VBOOST_CFG,
+	.otg_en_src_cfg = PM4125_VBOOST_EN_SRC_CFG,
+	.vsel_reg = PM4125_VBOOST_SEL,
+	.vsel_mask = PM4125_VBOOST_CFG_MASK,
+	.volt_table = pm4125_vboost_table,
+	.n_voltages = ARRAY_SIZE(pm4125_vboost_table),
+	.ops = &qcom_usb_vbus_pm4125_reg_ops,
+};
+
 static int qcom_usb_vbus_regulator_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -135,6 +165,7 @@ static int qcom_usb_vbus_regulator_probe(struct platform_device *pdev)
 
 static const struct of_device_id qcom_usb_vbus_regulator_match[] = {
 	{ .compatible = "qcom,pm8150b-vbus-reg", .data = &pm8150b_data },
+	{ .compatible = "qcom,pm4125-vbus-reg",  .data = &pm4125_data },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, qcom_usb_vbus_regulator_match);

-- 
2.34.1


