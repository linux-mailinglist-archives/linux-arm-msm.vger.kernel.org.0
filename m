Return-Path: <linux-arm-msm+bounces-111830-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vMxXMT+dJmpMZwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111830-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 12:45:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C0FC4655486
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 12:45:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ULKQ0cWN;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=kKISp78X;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111830-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111830-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5C592306A772
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 10:34:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4AD53BCD29;
	Mon,  8 Jun 2026 10:34:02 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1E413BCD27
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 10:34:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780914842; cv=none; b=aNC+jITaaZNERl2UMkrVT8yam3LjpyrhI6FoIvHz9jFUgFmidpy+IHm/ECYMATmCEg4VHnf5R3zPEBFbpnc14GFUxk79iNFS2+yEY90ITN6vv1laKwmzOfZ6ablOp0jgOkNbThU75mHc/1aqaBo7is8a/SaxiyWVfck+yWbzg2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780914842; c=relaxed/simple;
	bh=xfmMWsDouZv6OXeWAc4X0/D53NHs5zWdAq9X9Mc1eIA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=d/6jSwo3LACnBlWzBh2qmTK2xRX2BNJpM7xXiLO4EltYEQlGjMjj4v3Sko8IKrQHnNC6LbAt1ETOjFmxQhYPBkgScD3H8ip6s7pcA9samfV8J0AahmAvcJdg89MZZklsfcWsJ51FpCNl8v2KJAHqCkMOCtDCXA6dt5WxxoRbabI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ULKQ0cWN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kKISp78X; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658A3b9s2848277
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 10:34:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=pzJyfsYOmcL
	jIQqyBfcVMuHq0RGrLlrmlr/KgSBSmDs=; b=ULKQ0cWN9grF5IatkvqlbABUwG5
	VjgMWChm6i4G7c5OdHP9vfzHhwDRCirsPhcYwrgjyNArE77Qq0OC1gI8IP5s1X6e
	/T7BlqKOl8tSz6sqE/Ux4sv4Jt25iDcx+q7CzXb7PORyVixAyfFwM9f1HHqUOTB/
	NX9NfLdSw/IurshDZ+p9b2HGg9MmtIOxIQjrE/0rl4m3J45ne91bTGKtcHNwR3TB
	XfdzcHmSrB+I65Pb2f14HlgBIMuLHtTGEQVvgVgHY+XWoFADtmyzMIbtSO0OzuLt
	4JlovDUvKTNaQPQAW5QFqie7xcDBVF0PzkJ1RINAxY1sUodKts+Da/Gi/EQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enuna84f6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 10:34:01 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8422f987f2eso6775815b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 03:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780914840; x=1781519640; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pzJyfsYOmcLjIQqyBfcVMuHq0RGrLlrmlr/KgSBSmDs=;
        b=kKISp78XXETIpEcI2DYdgCucjqdPKFSJF4O5CFKiAKmlssiRSKtImG1Iu+zMFVyJ0l
         3gCrBWUicZ4LvyVjWIGoX7bMJUP2T/JgvILJLXNL6sWo2x7Ut4/XKdl6eZjviGHFG5cQ
         wv/nq55WD78lZM2KnTfW1/Ho9Q+39qg+Z7RpMunZ1vj4BmUjZ1BDC+YeywUheMwKEN0d
         0+N72tro2y9OKOFg9zPQ1AK4mYbg6iYaVpZpKbe9gPc73pvo6pH91P+CelHKBLRcbniE
         8Nqt2hePPVvVRawLSMy/AGrJ9GM0nzEh6rjSg3ePmhJsaJ6qoFL7DOXxzHCyR6/+Ak6f
         uRjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780914840; x=1781519640;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pzJyfsYOmcLjIQqyBfcVMuHq0RGrLlrmlr/KgSBSmDs=;
        b=VHdevk0UuFOJLibV4qb9rBNl0+bGF42H0IpWX/PAk3twBUjldcGgJh8Zpw+16/lQ6N
         n0VUU63OjH5OuwFRqSRofFR9vA3GeTseLmN0DQn5SyVenUhb14W8bShPaz8fuHcDV7/D
         PUTdqE8A1vtdLs7BqCQHktyMCxwBCGEto1KUC2BhIRA5mV4gtBn9+MF+X/WAJ+pKq/OX
         MWOScGdr3+Tko6prm5nJo8QQQjxGJ9HrSbjWMVHOfyHJpPjt7JemrtTEQ+PZJfYv+i7e
         rVds9lc6RAb5/zbUaAeCtHD4OTWr+aOAuOSDWYHvonNWH4H0sj9Sy7bPQxw9Roa8DmEM
         +ZRA==
X-Forwarded-Encrypted: i=1; AFNElJ8qObwH8GZUuvLjgvBvNHoQ7FjC7crlyF1bcfAFEJf0Z98yePwZhQjcDB71P/T3i4VBSVul1ubLrQAZw2i7@vger.kernel.org
X-Gm-Message-State: AOJu0YxvE4A0SFW+4Ia/ARXJ+366fZN8uu9uuZQGb5G4hJYL05BnkcpG
	zfz7mRaoEIr2N9GoL299moa1y2F6CbxrKajuT6fFSg3H2S0tyuX92y3ckXnFANDuNXp+0jsxL5C
	2AGxvdYk1lVVIIJ6Kk9T3jZlmBMq+sdMCBQW+/BEhCdxD5cm1ETxcPEdW97oAzejQ1dkG
X-Gm-Gg: Acq92OFKk4zezpI4FzZuDl8b9qZb8/ZveRGtHeA8hXuOLm87i9syeAZ6c6KO6n28QWO
	8aGW47d0gqMEpBrNrtqpmsjpymYjZYILao9d+RHTvdPVQdDc+7YLcOujHJ/OKuHObU4dGryofH/
	h/UggtjmRq9RL0wSzELTAffUpJIYSoX6MZG89Eg6NDdNHg17V2/nvKXEfgOkNviN3Z4nVSnLWWJ
	rydH6cdQwChdBWhssOd44iBzad1pWUFY1EkSMBHyNaVnWelWKYlCABQU4F7Suxd2uk0Xt9Y3iiZ
	KoHITHYLhAwQuRew5kYJZlwv1dHHJdTlTm6PDin7TJ4JuTB3h/1UV2cJxt5Yl8wDENsAtV+DMXP
	+azQYnVhD6xIwzmF6XR/PKQMGtH/wewUenTFGthJJBMMdKtWVXdb7421vKsOsq9iWU+wjewjulz
	jKl0dITNlu7vkiUM3uPGySIXkeV6mLKTcKdF+mH6OBi/7/N7CnzOshY2KmusX9rg==
X-Received: by 2002:a05:6a00:a224:b0:842:670d:f6dc with SMTP id d2e1a72fcca58-842b0e3d2c7mr14941293b3a.27.1780914840320;
        Mon, 08 Jun 2026 03:34:00 -0700 (PDT)
X-Received: by 2002:a05:6a00:a224:b0:842:670d:f6dc with SMTP id d2e1a72fcca58-842b0e3d2c7mr14941268b3a.27.1780914839843;
        Mon, 08 Jun 2026 03:33:59 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842824a2600sm18571570b3a.27.2026.06.08.03.33.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 03:33:59 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: vkoul@kernel.org, neil.armstrong@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, quic_wcheng@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: [PATCH v2 2/2] dt-bindings: phy: qcom,qmp-usb: Add ipq5210 USB3 PHY
Date: Mon,  8 Jun 2026 16:03:44 +0530
Message-Id: <20260608103344.2740174-3-varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260608103344.2740174-1-varadarajan.narayanan@oss.qualcomm.com>
References: <20260608103344.2740174-1-varadarajan.narayanan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA5OSBTYWx0ZWRfX0ur5C/jIsC9x
 aqg1kFMjVckmtROmuaCh6hA7cm3WzwXLn3TNkZNu8aSbDXESmFvWgbqEQG6/vJg90EvFgbRLVPu
 ekoOcvKukd10fJYWQYSlqLCkfuIPxxs+I0IL8ISVBG3PKUFE8hnFRi7wvinIU4H2YvJakarlpwq
 NBS129ZPgQOpL17/0svK+crKno/7z57Z0XrcGnbEn0iG/I/9EptRNzD/LAO+/EFJ4HFLp7UofOs
 5z2QxKyMv9FKrdjDAadMY7zXAd32nQU+iPZC5soOiUsld2g5BNEUPzf1SWZgjrXUs1VuJDG3/+0
 VpNRU3HwoMho4IGzpUxailj5t5jCtISZykyecUt5CT5NqSWylEfFTzHuJqKxdJsPahHPu7klu5l
 GlQtIi3VVrZuyzvmFumbdHIZbYuPZrFAOdqFmnXb0l4BsLKSdUD1tmor29uMO4Hg5ewn8klZEQ8
 WtegiLmDz20OFfzQwWA==
X-Authority-Analysis: v=2.4 cv=RfugzVtv c=1 sm=1 tr=0 ts=6a269a99 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=WI5TtnT-L6ZHCY-PEAAA:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: gB8djO4U0uVAZX6Po4WNispJMGscyqpa
X-Proofpoint-GUID: gB8djO4U0uVAZX6Po4WNispJMGscyqpa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080099
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111830-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_wcheng@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:varadarajan.narayanan@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C0FC4655486

Add dt-bindings for the USB3 QMP PHY found on the Qualcomm IPQ5210 SoC. The
IPQ5210 PHY is compatible with the IPQ9574 PHY, so add it as a fallback-
compatible entry using a oneOf construct rather than a plain enum entry.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 .../phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml   | 46 +++++++++++--------
 1 file changed, 26 insertions(+), 20 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
index 623c2f8c7d22..01342823e57f 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
@@ -15,26 +15,32 @@ description:
 
 properties:
   compatible:
-    enum:
-      - qcom,glymur-qmp-usb3-uni-phy
-      - qcom,ipq5424-qmp-usb3-phy
-      - qcom,ipq6018-qmp-usb3-phy
-      - qcom,ipq8074-qmp-usb3-phy
-      - qcom,ipq9574-qmp-usb3-phy
-      - qcom,msm8996-qmp-usb3-phy
-      - qcom,qcs8300-qmp-usb3-uni-phy
-      - qcom,qdu1000-qmp-usb3-uni-phy
-      - qcom,sa8775p-qmp-usb3-uni-phy
-      - qcom,sc8180x-qmp-usb3-uni-phy
-      - qcom,sc8280xp-qmp-usb3-uni-phy
-      - qcom,sdm845-qmp-usb3-uni-phy
-      - qcom,sdx55-qmp-usb3-uni-phy
-      - qcom,sdx65-qmp-usb3-uni-phy
-      - qcom,sdx75-qmp-usb3-uni-phy
-      - qcom,sm8150-qmp-usb3-uni-phy
-      - qcom,sm8250-qmp-usb3-uni-phy
-      - qcom,sm8350-qmp-usb3-uni-phy
-      - qcom,x1e80100-qmp-usb3-uni-phy
+    oneOf:
+      - items:
+          - enum:
+              - qcom,glymur-qmp-usb3-uni-phy
+              - qcom,ipq5424-qmp-usb3-phy
+              - qcom,ipq6018-qmp-usb3-phy
+              - qcom,ipq8074-qmp-usb3-phy
+              - qcom,ipq9574-qmp-usb3-phy
+              - qcom,msm8996-qmp-usb3-phy
+              - qcom,qcs8300-qmp-usb3-uni-phy
+              - qcom,qdu1000-qmp-usb3-uni-phy
+              - qcom,sa8775p-qmp-usb3-uni-phy
+              - qcom,sc8180x-qmp-usb3-uni-phy
+              - qcom,sc8280xp-qmp-usb3-uni-phy
+              - qcom,sdm845-qmp-usb3-uni-phy
+              - qcom,sdx55-qmp-usb3-uni-phy
+              - qcom,sdx65-qmp-usb3-uni-phy
+              - qcom,sdx75-qmp-usb3-uni-phy
+              - qcom,sm8150-qmp-usb3-uni-phy
+              - qcom,sm8250-qmp-usb3-uni-phy
+              - qcom,sm8350-qmp-usb3-uni-phy
+              - qcom,x1e80100-qmp-usb3-uni-phy
+      - items:
+          - enum:
+              - qcom,ipq5210-qmp-usb3-phy
+          - const: qcom,ipq9574-qmp-usb3-phy
 
   reg:
     maxItems: 1
-- 
2.34.1


