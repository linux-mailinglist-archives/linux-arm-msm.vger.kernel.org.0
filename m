Return-Path: <linux-arm-msm+bounces-117902-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RrtRK51YT2qEewIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117902-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 10:15:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2173172E217
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 10:15:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=OkrF6iwx;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=YslWFaL5;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117902-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117902-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 004F23036EA2
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 08:15:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCED53EEAED;
	Thu,  9 Jul 2026 08:14:52 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 077D83ED3BB
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 08:14:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783584891; cv=none; b=W1H7UxYAyX0XCggW2dPPFX1EBGp/d62+TQdgvB0IckiqVwpev27Es3Ge9mgVMorqtrQvdfXTQsIG0ySt5rmEzXsU+Yfc4+UqqnKIhxsI5gyinuSFrENCqV29LQOEqKoPHFSB/tmVwu5xOYMUhz0BNRYdu09Milp8TZHIQH+cvRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783584891; c=relaxed/simple;
	bh=jjR3Z29mlqw/oycaES/VAzcY9tU1jYKDUkP6/rLhE7w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UjSTRwhudw4WB+Y3w5mcmzk7Uc/i/e9PK7unXbDA+kQEUmI/T5WJEQIcM5cSk4yh1QrsUvS8ZMNKAwlzwI7QMLUYeWq0FiYpwUynZ8aWvuDQAhOa2igcxd6cyniQkQyx4sqMkytZ6FxvljzHCWA3PCInNLI9LAAwbILTtvGMcRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OkrF6iwx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YslWFaL5; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66960HRM749771
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jul 2026 08:14:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zteDRW2ENOm/nCFAW3Dq1OD5vsbAVdUt+SYKKahH0og=; b=OkrF6iwxmlGHiTEr
	uSnAEHgkKuyhNmyzEGGlgSdVdSI5i2d0H6rasuMnrD+z27PsJajk0ofBGwYKNlpM
	5yDTVl9ae1rCnCAjj/d62exGStjU722br5p2WSh56VGAayJL4quJcIMgOdWarpWr
	WVk0zTs10duboh+CEbLZZ4HZfmmiecRy8fq0Ob9sAJ+4abk/8vSKHEnE+kp07L3g
	myxwxuue10hGH0KQ9YOPE0HK4szsHjRzrUi6ifJ0HSLDFQVpv6FlPV3MxYIjJ8gx
	BlD0lY0f0hCGnHTKMaAMrR7mYaXr9RUlgNDJ3k861/s+FUkP7cr5SuX6g21fRUq/
	6VPIww==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9wwft2nu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 08:14:44 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c96b4f58ddcso1837474a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 01:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783584883; x=1784189683; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zteDRW2ENOm/nCFAW3Dq1OD5vsbAVdUt+SYKKahH0og=;
        b=YslWFaL52Ps7JNjnnvP24gvV+tEJZ8+N22kbFrAyip0zNbbZ6ouFBR5L7f/d5KdZEL
         SYdUVL8DOXul9E7Bl+RmfGneHiAD7oUoyPZzcJukqAstj8/NWFk9UPBe+095wiSBNTCa
         LC/dsFH4b1yyBfOH9RFNhxEuFZVjOoZPEvY3cJzfRiiEUlXbQQP+MpLkyF2zli5FPzR/
         e/qWOBzevU1B2GK/ulj14B2ph9OnTgLeMEmfJPWfFyppLll2A7dQEb+iHZjkeK1O9Csl
         LIZZ76bBQkuGzGZz2/ZnxRtHxW48HGNPJyxcsOgEkh4+Lv068QCYSNbArblQ65nxgBWU
         +Kfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783584883; x=1784189683;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zteDRW2ENOm/nCFAW3Dq1OD5vsbAVdUt+SYKKahH0og=;
        b=fz7Q2BRv1SAUSpgYTyS6sPVdF0VPylN6BfsUoM6x4fc28H4tF3+62T3dgcABZfkahh
         707Lf03twlrPSSdZlANZFHPxqDte8346cuRuRA/ToRuRxQk+YTJiN2eefg9AVDcDJ69Q
         QcPFocEZbcNEDfXUOGVxxZK/yrDGbEWBx6M8QbABzInhOyi0KSxiYSJiCJEuv0nrnhW5
         UY+4kl0NmJd8NdohyvZADGdcG12A07ZHvgm9AxXrTmi7ckLHgJVR8HW6xtdzrpXc7TTl
         Rqk2GcKMYEDcOYUEieM8xUHaPtUbpQrSa1NJiTaAHTdzZO4PZXf8Lu0DNpYBRVxpc9UY
         PreA==
X-Forwarded-Encrypted: i=1; AHgh+RrcZ4yX5ITB5HqOecXpcy7CIexpP+GmkrmOi06hEQftPcqQXuas3yKtyl5tfxBOecXLEljDx7ruRHvaZ8mQ@vger.kernel.org
X-Gm-Message-State: AOJu0YynNGLQQ2d+993Xu16KGEgurmE1SiTJiTVFDsSj1+PHM5NoCbG7
	dNBr8us+ma2WZmb65/xJ3+gHvKL5UQpwA+3aT/I+F724vzT5gbP6Du0zcS0auzjpQ+LiAduYoK6
	MQwCUJ5fYtyZHm6OL0RhaeEdOqB42gbAnoiSJodXgLJpgl75nTfsXMAgPu8LwUzXnd1U4qkz1q4
	8dahg=
X-Gm-Gg: AfdE7cm3BXutpSPYUQyUDFE81Pwt8gRceSmtDe6n9o3MIg3bqcveGh7Fjzch2WeB8S1
	1nH7YG38d5IxyShQGZHpzPCqAKMnlyExnKYAI3xPuZq6DIaK+QVZIiaXBYfHJavgyRMSNPJilbH
	Em7Pf2IHXMeHSMypiFryJavZDHZntuagzUHqWVqOAupNo/TrOwsuieI//X0rTWsoAZeOHmRAbCP
	IYHz/b9qSTQqPBcYlXEUOH6Ed7JFuI9NdUU8j/XS7HRUzfk/n+3wczMOQxT0i7XQTFRdRqdYsPx
	oDY155+xRlgd0f6oFCkpHveoX7iLFjAX79xGdS+JZ8Qp+/dIz7m3doIWrlGBkuB4P3loch7/WCv
	gG5RTlIjbPxUR1VWDh1hkx77CdFPnTOfjCLnN9vn57tXHpm2uGAdY9QQ9mES0fw==
X-Received: by 2002:a05:6a00:a88c:b0:847:823c:bdf5 with SMTP id d2e1a72fcca58-84842fa0325mr5494661b3a.37.1783584883553;
        Thu, 09 Jul 2026 01:14:43 -0700 (PDT)
X-Received: by 2002:a05:6a00:a88c:b0:847:823c:bdf5 with SMTP id d2e1a72fcca58-84842fa0325mr5494645b3a.37.1783584883117;
        Thu, 09 Jul 2026 01:14:43 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5b3162d3csm3392290a12.18.2026.07.09.01.14.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 01:14:42 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Thu, 09 Jul 2026 01:14:24 -0700
Subject: [PATCH v2 2/3] arm64: dts: qcom: kaanapali-qrd: Add SoCCP node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-knp-soccp-dt-v2-2-6e2bfca96088@oss.qualcomm.com>
References: <20260709-knp-soccp-dt-v2-0-6e2bfca96088@oss.qualcomm.com>
In-Reply-To: <20260709-knp-soccp-dt-v2-0-6e2bfca96088@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783584879; l=730;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=jjR3Z29mlqw/oycaES/VAzcY9tU1jYKDUkP6/rLhE7w=;
 b=hPsXP+g/5qbAwFzO2p9gW9jMXM3n1pFag1B1loWS9cOey2FmRWjAPUMYvym5nqukakb3MuMn4
 8uHFNa0GyMnDSnxGdVTiXG1w0CbHuC2YbHix42SODrVHrxp0Vt6BEGu
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA3NyBTYWx0ZWRfX9wSkZnxzvEWs
 HcFmrjMFjfQNZ3P339V/keH0WnlFDnn1aCQEE9zFAc0wKnRcjyF3GLqqnIXGuBEWB9jr4k4NG55
 AaIxaUnwKn50HVbI7h318EIO5qS9Rupf+opDOPTgAFdDb6j52YNQtDndQN0nRnyNFaNEgRXc9nH
 L7zb5N0re1oYNFOg23w6id4k7DVxci6FKNDS6Z+gP4yqwMoulxL6yAOUOtAKCCTz1Q9GyBU4NIT
 pCnQUtDMx0xNDiNsAgS/Vt/y/UY+is0wSQ9dIUsUi7/i6gImuC1Sne+yfn//jd0aZ1+042hhO4V
 9QW5+I7vqUcRMf2eCWgbrXvEnP11rdKODOqdNtip+FTgLhCPe8BTEq9Ie5wVg7e1Ox8UYvZOgeA
 u6r1vYMBeJELD+cLQnDGizDvewH+Wa6qfjH9/UMu5ftypjlHCagFyDaY8EkF3YophXp51A5S+g3
 6uXsBUYEYdsAvK1HTVg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA3NyBTYWx0ZWRfX7/M2hGRUbMGQ
 FY9Ub38Hut+Lh9lIKPYlng2dpScF56y/ZnlfdaztzaeawYRl7rWxL7Sbt1oYWVe9CQmPpEm5aXr
 obs97RhD1igCAhew/1cMnnz9lCWqjA4=
X-Proofpoint-ORIG-GUID: 9JnwWIHAsBJ3F0hDP-8cMLUxM7b038nI
X-Proofpoint-GUID: 9JnwWIHAsBJ3F0hDP-8cMLUxM7b038nI
X-Authority-Analysis: v=2.4 cv=Krh9H2WN c=1 sm=1 tr=0 ts=6a4f5874 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=ANFwC592Q6juq9kqITIA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090077
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117902-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[jingyi.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:aiqun.yu@oss.qualcomm.com,m:tingwei.zhang@oss.qualcomm.com,m:trilok.soni@oss.qualcomm.com,m:yijie.yang@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jingyi.wang@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jingyi.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2173172E217

Add SoCCP node on Kaanapali QRD board.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali-qrd.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts b/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts
index 55d02219ef4e..8ac1c664a7fd 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts
@@ -786,6 +786,11 @@ &remoteproc_cdsp {
 	status = "okay";
 };
 
+&remoteproc_soccp {
+	firmware-name = "qcom/kaanapali/soccp.mbn",
+			"qcom/kaanapali/soccp_dtb.mbn";
+};
+
 &tlmm {
 	gpio-reserved-ranges = <36 4>, /* NFC eSE SPI */
 			       <74 1>, /* eSE */

-- 
2.34.1


