Return-Path: <linux-arm-msm+bounces-96293-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2DpNNrXormlRKAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96293-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 16:35:17 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 42C5723BC6B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 16:35:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7B86532004DE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 15:25:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 269A73E3D90;
	Mon,  9 Mar 2026 15:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EoxHNe7S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dQ/UUHs6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 774BB3E0C73
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Mar 2026 15:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773069879; cv=none; b=TdTH5pw4ZvAW+Y1kRE4UTXocFIvpRFWfX28gdCO+XKcHyDkNrnrihlt8qTdTYGiMh2dAl55KqTQuBXhp5njOJeqi8jntCJmeuARB5eMSTKLsvR6EKsK1VIvBG+Brq2bWMplnBQ5Hv2NU7uVrGN77DSvLayNxL8/aHNP24qVwc5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773069879; c=relaxed/simple;
	bh=x9brd5pLSeKoNygja1dvAl7QqSkQOu7gniSmsU2x60M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oanurmKdDbvuVVMNwbeUkrcHw4LXkiBRIdjJZD8CdoheY+DT/R1cUaQkK0DamxezmcO18kmaSAPlChEJrE+PHamiQJwEn4YuOtKp5K/B0d02O93P+XEFxv4St2UT0BvI1iLA7geJfQ1iSZNUoqFD8Wpf9vuW43iNQqueaLktbIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EoxHNe7S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dQ/UUHs6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629A6ffx2195131
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Mar 2026 15:24:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=sqp1z6Ji/52
	Rrc6p/NTzKG5+Cmga87yxwgSBmBHuHBg=; b=EoxHNe7S5i8nc6hUD3J4IdE2oxA
	H7lqwIG9SSqkoz9bvTG9ZEeDzzPjWPRTNqGot9i76Y+gNJh1h9DsQqHqf3CO1xHN
	EeMUkF61Bj64CUHMQWBvjpe7UL8pI7JVx7mMZYZHySsnbev3vhPcinHnhDRjMGeT
	+RLDgOhcVa6nFqX9Vu38xcX1pMGxhhk8NWjv3rqcy2q/DX33ZigCPJ2DZPqjEDaT
	z8ClHzkssE0Kmn/sJ0mgKCX5rdUKn35QUo6CYQ1ZbQ4xWHpX+J/RaynVJFz74g/A
	sNDBSfN+DpE0u3/JdrwFqvLHinXvpudX+SxQc9kxXHeiwVFnz4dd+HVVQtw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csv5u90fc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 15:24:36 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-899edf01747so620441036d6.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 08:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773069876; x=1773674676; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sqp1z6Ji/52Rrc6p/NTzKG5+Cmga87yxwgSBmBHuHBg=;
        b=dQ/UUHs61eU0F/mCfDR+v6xn0kgKW/fig6xEKj8rinezxeURrbwGzv9QFKM585vcLj
         pQKGiuryYwSa20t/Ud0BiLgHN0FzqBTUOMvQzGNcp9Hii/zuKWok7i4iI/dOS9tYNi+m
         x/vTc9h5cadXXG+4rGU5bRlnFIv7+FdNjP3ZenvUujjKnstcLLzZG/Tg4svkhshmCJBN
         ngm+wCrfjbrXPS5kkphwZtRSBFgQXaMpBWNxY/h4KhCqw1/6UQa5TSuWHb8Ejx7oBUTQ
         l5snmKrX89zbfX+GnsXLqqYU0lotcKehzlQN2t34dczFH6CsqRKcur3VaDuabhqtGCHW
         F0hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773069876; x=1773674676;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sqp1z6Ji/52Rrc6p/NTzKG5+Cmga87yxwgSBmBHuHBg=;
        b=GCEPkPzgyaFE5gjSDJK+jl8rivV1FwczWRqxBHMRTTs1LLFR6iwaYYGVV1FpQArhJW
         DXHEeW8+72sOj8QPmFVrwotsA4ZvG9yyhz+6d90jX9CtoRfFeGRIKT3eeQexBc9qNSvK
         QBfe4m5LNDaY9niDIIXJ7rfFI8vHoh6C2bk61UsuB72LRN55UWckNG6JsyR2yiyQLCdh
         lK+49xKukSgYFVubquLEgoWDhQo3S0CtmxnwXnX8y7+jStpkRB528O40BNymcdiqZLQv
         bba2ZYlU9O0J4Ven0z4gdMnhIADjEtbCVEFjTncVEpj3e57E66qQ2QUBXoMsPXE0Oz3P
         mz9w==
X-Forwarded-Encrypted: i=1; AJvYcCVw0AzYN0z8B5u19DBcNBbAA52SLBGzd4OYYpQg5Xa3XnAbN9SBnKb/mRe8yF+5J4W74ZC8yXElTy/1oHN7@vger.kernel.org
X-Gm-Message-State: AOJu0YyAqaXQsgz349xCwd5vZKNALkKmVxjQ38EUWobCsNZblFC2nVYI
	bz98cSdGvUPuofl1oHZrIoqAlNyJ2JgLnypmja4CpEhIILkARJAZj6qCZn7iu/0sLEJSrG7068R
	n80AENrj8rHR1yCLnHEHUqnfJVumzkNc2CZrBx954KCQ3n6avu93cVxB6hj6RcaSzV/Np
X-Gm-Gg: ATEYQzyJI28O3Tyr9zarjMPLK4pappyr5vmgiYZ/eBhow4tcylnIC9NxA+mIj43JHeJ
	Kgnd+vhjkuTQMbl/CA9vOGhzs1Wlda1fq8kqP95OqnBECv+SKJdf0gvdaeSKKyohIP0SR4d3O0Q
	Qd2d36KX57TexHwhsQugt0GIhy4gN4tatYV/oruIR9W8C04CThRyYqRDTvndlg0dPhNaQnLdV0v
	XQAzw4fTrOCPyCslHlZYci3zB5CEpib8BbT4ARoBU9j3Pw8FED//raGCSP9lr9Yn++TSAawRGiR
	jn2vxs72x9Jt7cK1lpuf/QqFS2MFn4LXvlVEIiIKEyWMbWXMConrW9cVHojb46zyvltA2wC9kbS
	gyOHWIqc0REdDAqbDGnWikAr7Lvk3rf3Zvgz0jkS/U/OHWRV4bvK9bXI=
X-Received: by 2002:a05:620a:170c:b0:8cd:92c2:5125 with SMTP id af79cd13be357-8cd92c253damr100791985a.13.1773069875819;
        Mon, 09 Mar 2026 08:24:35 -0700 (PDT)
X-Received: by 2002:a05:620a:170c:b0:8cd:92c2:5125 with SMTP id af79cd13be357-8cd92c253damr100786585a.13.1773069875278;
        Mon, 09 Mar 2026 08:24:35 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4853a59fc36sm192812515e9.9.2026.03.09.08.24.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 08:24:34 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: richardcochran@gmail.com, geert+renesas@glider.be, arnd@arndb.de,
        dmitry.baryshkov@oss.qualcomm.com, ebiggers@kernel.org,
        michal.simek@amd.com, luca.weiss@fairphone.com, sven@kernel.org,
        prabhakar.mahadev-lad.rj@bp.renesas.com,
        kuninori.morimoto.gx@renesas.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org, m.facchin@arduino.cc, r.mereu@arduino.cc,
        loic.poulain@oss.qualcomm.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 5/7] arm64: dts: qcom: monaco: add dt entry for lpass lpi pinctrl
Date: Mon,  9 Mar 2026 15:24:16 +0000
Message-ID: <20260309152420.1404349-6-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260309152420.1404349-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260309152420.1404349-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 6jckpH38GqLgaLbbWen8KRNM-pws_gTp
X-Proofpoint-ORIG-GUID: 6jckpH38GqLgaLbbWen8KRNM-pws_gTp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDEzOSBTYWx0ZWRfX+YXFKVfS3pTT
 r+FwsNBYovzjKACgLfZPhr7jHJF50Jo7lt9w42eAv9kGMNgGnFgZyVIjXCA9fsvgNiGfZuD4bYQ
 s9rwyvYWfgzC+JE1CoYk+bLokF1lFCTXUEytVTRlEK2gIquPzEGJK7+xHU32CLtM0/LH0NjAdcS
 7mPVbblmTySgdhpzlrq9+P5qCN+5bCurXJBY9ZkZcsXkVKVwC4d5KqEZx7MD7zfOngXs0jwQNG0
 fJLQbS7OSrMvofDcVSUXRUZmttgNBVaoGzpYYIreN0w4ht9SIZP2llCyG4s5iLvgZVKNZssk0bM
 gOp7aqkVuMV/uB64NfMHIKF2EhRsbE93r+wn4tWnHhqg31ewRc6h1HXfyCa3L+KKor5xzPmR7Oj
 ZqqzDfJcyoUa209spcbYx+pvnjPIUZoANrdE78hD7eJldVwWWYBxaVKBIq/UcY3r5n58n1CJ4AX
 dXzbUecVyuV0gwyQtdQ==
X-Authority-Analysis: v=2.4 cv=Xr/3+FF9 c=1 sm=1 tr=0 ts=69aee634 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=UQoYJOyxK7kCTs_gie4A:9 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_04,2026-03-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090139
X-Rspamd-Queue-Id: 42C5723BC6B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,glider.be,arndb.de,oss.qualcomm.com,kernel.org,amd.com,fairphone.com,bp.renesas.com,renesas.com,vger.kernel.org,arduino.cc];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-96293-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.52.125.128:email,qualcomm.com:dkim,qualcomm.com:email,3c40000:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,renesas];
	NEURAL_HAM(-0.00)[-0.997];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add LPASS LPI pinctrl node used for setting MI2S and soundwire pin
configs.

Co-developed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index ce1565c7cc3b..0727dbd44a75 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -21,6 +21,7 @@
 #include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/soc/qcom,gpr.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
+#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
 #include <dt-bindings/thermal/thermal.h>
 
 / {
@@ -2872,6 +2873,20 @@ q6prmcc: clock-controller {
 			};
 		};
 
+		lpass_tlmm: pinctrl@3440000 {
+			compatible = "qcom,qcs8300-lpass-lpi-pinctrl", "qcom,sm8450-lpass-lpi-pinctrl";
+			reg = <0x0 0x03440000 0x0 0x20000>,
+			      <0x0 0x034D0000 0x0 0x10000>;
+
+			clocks = <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+			clock-names = "core", "audio";
+
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&lpass_tlmm 0 0 23>;
+		};
+
 		lpass_ag_noc: interconnect@3c40000 {
 			compatible = "qcom,qcs8300-lpass-ag-noc";
 			reg = <0x0 0x03c40000 0x0 0x17200>;
-- 
2.47.3


