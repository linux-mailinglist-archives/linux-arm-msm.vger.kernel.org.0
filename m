Return-Path: <linux-arm-msm+bounces-100259-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eNw9BHxaxmlgJAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100259-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 11:22:52 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C2D342713
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 11:22:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1D2403117CBA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 10:13:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 598783AA518;
	Fri, 27 Mar 2026 10:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ONlmwu3S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i8Qlpi+O"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD7CE3A9D9D
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 10:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774606382; cv=none; b=rHET156wxhmftmku63Rm0CTpQ3mpB/jHzsQJiuPD1yqa0AAiKQHwOOHm4W+AIkx3tGuA7LOhCAgk6xhDPj+8FqwzKAl/IfBVMu+GRKA9v3r+J8RYcT2+9/CoCp9KGQQSQvFMj/ycz05ynhLycALGnyvggduAoMk8gc1IpJsXaeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774606382; c=relaxed/simple;
	bh=NzHl+TSMYx8b7yrFreTP5LVTAgHzY2fpAX7dzVZ+Ncw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hL7KvOXOZIZbmZWVnQvD3eOG/g5HHe58V1YRUvs2tGCDye79Raxq6jOpS4mby+WYMD3z9QtGIO9Wnd8uKLkQWjvy6sh6iiSMrd2/IEjqjaKcJTVqvWaPcdQpmfH678UX85HV4KSEgy3O6ulHIbdVLc5/9jdTZi5XTY4VV76jeWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ONlmwu3S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i8Qlpi+O; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R6vsOi1226340
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 10:13:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=mk7Qe3bjicV6DXPTZkBZhb3fM69i7303uZK
	vtWPVFp0=; b=ONlmwu3S78wEgZTgHLy0D7e5UtbzpGDnlOk0zNlgAW5SBJ6+V2m
	JUnjktz63ZiWM4hx4PegD7haVxPrHyEEO7VP871ZrRrJVBfZFyoKJsxukBDD9VBR
	DP8eGbc2AYylORPZ9jtakxCGwkxeUG3tPTbxQgz+B0+oq9Fj+ICQ4swneYaEbArf
	q2vhUMStwdPP2J4M1nKMzV6p7QxWi5Uja3/Jp4NeiI2f9jBSO9yMTs14DAW9/oZb
	ddVBQEDlNHgMUE3bFnLoq4fEA/3eVnJRpMZFNfmcTVCprVXRaPnP3LKBRdm3bIfU
	N2n8o5kWarNFvWQJp/LhqNAJ4guDo/+CaVg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d59r1b32p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 10:12:59 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b323c43fdso2867781cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 03:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774606379; x=1775211179; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mk7Qe3bjicV6DXPTZkBZhb3fM69i7303uZKvtWPVFp0=;
        b=i8Qlpi+OV74wKWKldrhj9OEy/j3N8iFxd8wRnBKI0WZEKYDuoELot+/rOJuiRL9Op0
         UO1AT4V4n0/Sv0Oi1SnleYrrY10KOBKSUhYSOb7DNyxGGjhgIDS33OWVo3z2XF8x/HMf
         hisVyIybGasPIAeyBKohivqCrCDHoJVrpRrDAJECbqBOZjwMZyJNmUNxpnZNaUiwEhy6
         ZCdQrSbzOq59p5BYJWsKq7VfgkldxO7gRH0/gh69e4YFjcwcU3xwVUeUEvP4ZdkgYYZl
         qNdPGd+mqQWXLwg+m9Vn3eLMS1z8rNPLIRPpIBH6p152FPwNQNQMdGbY/1XqurpWM2Gh
         2QVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774606379; x=1775211179;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mk7Qe3bjicV6DXPTZkBZhb3fM69i7303uZKvtWPVFp0=;
        b=BJdzJbu1lWaZU7d3vAfYayCSniw8PiiAqk6IUTRYPlnAM7pp922azjrqUk9GhX4cJ4
         Xbj/blsVHyUl+qVCFJhtRr1ZqwKgo0tFUqOrSwWyVM3TmCQ4rN/UDS2Tj3JONctxW9CF
         Ttuud3b9kZ/g+Yb5GqktwQoYW3rLwB2ZMcZYrJ/g+N8lTDSFQ9l8iwIZA+wjQ7LpOSRl
         tky6raYl4b0MMRBcgJbeY8eyOhsqcBBoLKJRI5onBDxhBulamMsSaKZlmGZvnvViFFQB
         Rg8QT692cb2okmfST+lKX85KPrTd1NH+MgA+bOAHMrcinxHnxb0d6nu1cgCdOBjIlMW4
         DWqA==
X-Forwarded-Encrypted: i=1; AJvYcCV3mxIHkTRpuOAYhKcALi1dgf045X8Cpop9XWipVXWNDZ19hxN540A8gvJdYECxcWga9jE2JRCTwUNhfixG@vger.kernel.org
X-Gm-Message-State: AOJu0YznXY00fd6najYsvz5KoCvphqeFf3zIHq7VksTulhIqHE9zBij5
	VxaCIze5kSsJU2Ql21vUHuRLKoLyIPoFzhhjxO0K2Qcz4lScRrzNHptGTSHtU2li6VA/0LF14pv
	Ao8Pfp97O9OT/p5ZcSLOSaJcXNsxFfpAhwt6svmp26+A7KAzyPuGU+p2w9Ci1DClQZktr
X-Gm-Gg: ATEYQzwWT/JU0GO7/+6z3fqyTLP2iKDvTQzn0kVRaCdkL+5pwf/GQnbHJKSHLPwPpJY
	9DI+g3ynIIXh+jbghAtZ/qPOC+bz6oAEQKdl1wjjKJt9wu/CSG+5pMgpRS/Cs4DZD2S5uXhkxKV
	LKeVWXNYy8P2Nr5phMxhRGATbF3g5jKOovflAUL3QtORIiQsQoHGYd/vvLd2D3jw1qIHSdHLI2F
	SVi4Q9OK0YXbg4Tt33e0cD34xKHl/jjs0YKdVMQmZLcEtvS3v3RmiohxaJihPXgYodCNhPBwtIs
	Gex9FsNg8TM/79d8Iu/+u6GGlSlo+apHwoVULzmKnRTjhby4/6Y6H6eADak/hb6jvo3VmoBPGn9
	YA+aaVg8ECGHfntRJbItd8rRS/j3JCXUuhkbR
X-Received: by 2002:a05:622a:581a:b0:50b:29f0:299c with SMTP id d75a77b69052e-50ba393eaa2mr25617231cf.60.1774606378951;
        Fri, 27 Mar 2026 03:12:58 -0700 (PDT)
X-Received: by 2002:a05:622a:581a:b0:50b:29f0:299c with SMTP id d75a77b69052e-50ba393eaa2mr25616681cf.60.1774606378282;
        Fri, 27 Mar 2026 03:12:58 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b9179b212sm15075768f8f.0.2026.03.27.03.12.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 03:12:57 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: qcom: eliza: Add thermal sensors
Date: Fri, 27 Mar 2026 11:12:26 +0100
Message-ID: <20260327101225.382493-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=11388; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=NzHl+TSMYx8b7yrFreTP5LVTAgHzY2fpAX7dzVZ+Ncw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpxlgJalbeEzRxcR5Q6asmJgRj1P1T+Gl13VXQ+
 wwkFqbVbDOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCacZYCQAKCRDBN2bmhouD
 1wjcEACTjpiHEfQ13Tcx/b2+39b78UI9G9aQnPxzlg6N1fLlTYdRk2K57nlnxjSfa1dK93QUOk0
 sNI6i3VdCxSqMVIF/oeMn+LtbOT9LmDwS71Xc6cxVe0tIFteu4nk+MVspakFpwKvnKy8urfx/2K
 5KOvSFqNs5lKByXZPVAutUze/alTbLxiAZsG2zO6ZTh+FNTmrXctPeDzBo0ApNzLGBUhLNUFzqN
 f6udhOvrmn0clDB/1QR/q//vaMDMDhJqBZ2m9d7wVZvvpnRJ3t5fiZpE6g+c78BDVXUKZTOm9nm
 jhzQjv4q2CtL1qkTGn+25kt7KRKO9AqqbE0Ol61WAstj3hR52RnGW3py/SKkyiQd5gnq8ByxjSq
 35mOprPitKwYA5GSeZlqR8xqFp1zjKnpTBqRq75TLaeVT8b9swNEuiD0S3u9bzbXynB+IvRo8Dy
 Mjvzuo+gHhUHq+pX5uPKvzg1wUbQSG7doehn6QDEM7gvIDM742eArzytaA0feKtU4WzsUzauXW/
 D8Br7kq9iYtCfz0Kf6b7Eag/i1zpIE6KKsi8VCPi1sWqQ2zEiUTyCiKlj4VG0ujyvnWOnTMTcNW
 2/svCLEQXkEs/LlKoBj+2S6sF0wpa/NfSdXczlxY+nSGVS7KWx8dD+P8LewDCtsaWJmIOQcbNAF KdE1TU7MOZPlCig==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA3NSBTYWx0ZWRfX9hzS/0HmQcLT
 j27ijd15yXoctW51EmSlHqcjuUDH3B+OkWJSMTORfD4DNxdATmtorcH471G4l5FJbYpSsE8Klcn
 bXYiGPcBdbJGIEvPWEEXUrePl9XlGbduJusTTdkK/Oa4DpfDy6HpdSoFIbbQ7Cuer8II1o9xYit
 Gc1HLtaoiMNfU6F4JbjHrB8ZEl8G0iEbBqV+1PTIEVPsbiwaAr3EXmU74/4tmuVpFkpLBosXBOS
 SooKP34964a49TwmaQyM/75Gry4A/Wzq7RD6QIDj99chUFSC7257oNwiwWQyTu7F0ym3lLX/TpB
 HA1xivxKlfnp1o6iVB86PIr+Lm2lQrNAh3rQc6oLsfF45lgJob7RumZhpxIpPZFQlvmpThBRJP9
 lHDmMhq4/H+NSrQH0sYq/g+eEPuZ6JcxLUxD2aGmWRSzFnmWWKW1FkzAd86e1zmAWF53j0KXhP0
 UqIo8LKaRG4kOu7k3Dg==
X-Proofpoint-GUID: iCdMiZvdZ5oTwgXwAwYgVtWohkS82mhz
X-Proofpoint-ORIG-GUID: iCdMiZvdZ5oTwgXwAwYgVtWohkS82mhz
X-Authority-Analysis: v=2.4 cv=JaCxbEKV c=1 sm=1 tr=0 ts=69c6582b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=kF9h6JnbGkHsP-tOwnsA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270075
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
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100259-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,c228000:email,320c0000:email,c22a000:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 68C2D342713
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add TSENS thermal sensors to Qualcomm Eliza SoC among with thermal
zones.  The TSENS is compatible with previous generations.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Binding was waiting for 1.5 months on the lists. Eventually I resent it
now:
https://lore.kernel.org/all/20260327100733.365573-2-krzysztof.kozlowski@oss.qualcomm.com/

so feel free to pick up the DTS with the binding, since it is not being
taken via thermal.
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 561 ++++++++++++++++++++++++++++
 1 file changed, 561 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index 62fccb43a7e8..4a7a0ac40ce6 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -912,6 +912,51 @@ pdc: interrupt-controller@b220000 {
 			interrupt-controller;
 		};
 
+		tsens0: thermal-sensor@c228000 {
+			compatible = "qcom,eliza-tsens", "qcom,tsens-v2";
+			reg = <0x0 0x0c228000 0x0 0x1000>,
+			      <0x0 0x0c222000 0x0 0x1000>;
+
+			interrupts = <GIC_SPI 506 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 560 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "uplow",
+					  "critical";
+
+			#qcom,sensors = <13>;
+
+			#thermal-sensor-cells = <1>;
+		};
+
+		tsens1: thermal-sensor@c229000 {
+			compatible = "qcom,eliza-tsens", "qcom,tsens-v2";
+			reg = <0x0 0x0c229000 0x0 0x1000>,
+			      <0x0 0x0c223000 0x0 0x1000>;
+
+			interrupts = <GIC_SPI 507 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 561 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "uplow",
+					  "critical";
+
+			#qcom,sensors = <14>;
+
+			#thermal-sensor-cells = <1>;
+		};
+
+		tsens2: thermal-sensor@c22a000 {
+			compatible = "qcom,eliza-tsens", "qcom,tsens-v2";
+			reg = <0x0 0x0c22a000 0x0 0x1000>,
+			      <0x0 0x0c224000 0x0 0x1000>;
+
+			interrupts = <GIC_SPI 508 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 562 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "uplow",
+					  "critical";
+
+			#qcom,sensors = <5>;
+
+			#thermal-sensor-cells = <1>;
+		};
+
 		spmi: arbiter@c400000 {
 			compatible = "qcom,eliza-spmi-pmic-arb",
 				     "qcom,x1e80100-spmi-pmic-arb";
@@ -1313,6 +1358,522 @@ nsp_noc: interconnect@320c0000 {
 		};
 	};
 
+	thermal-zones {
+		aoss0-thermal {
+			thermal-sensors = <&tsens0 0>;
+
+			trips {
+				aoss-hot {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "hot";
+				};
+
+				aoss-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		aoss1-thermal {
+			thermal-sensors = <&tsens1 0>;
+
+			trips {
+				aoss-hot {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "hot";
+				};
+
+				aoss-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		aoss2-thermal {
+			thermal-sensors = <&tsens2 0>;
+
+			trips {
+				aoss-hot {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "hot";
+				};
+
+				aoss-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		camera0-thermal {
+			thermal-sensors = <&tsens1 12>;
+
+			trips {
+				camera-hot {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "hot";
+				};
+
+				camera-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		camera1-thermal {
+			thermal-sensors = <&tsens1 13>;
+
+			trips {
+				camera-hot {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "hot";
+				};
+
+				camera-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu0-thermal {
+			thermal-sensors = <&tsens1 1>;
+
+			trips {
+				cpu-critical {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu1-thermal {
+			thermal-sensors = <&tsens1 2>;
+
+			trips {
+				cpu-critical {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu2-thermal {
+			thermal-sensors = <&tsens1 3>;
+
+			trips {
+				cpu-critical {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu3-top-thermal {
+			thermal-sensors = <&tsens0 3>;
+
+			trips {
+				cpu-critical {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu3-bottom-thermal {
+			thermal-sensors = <&tsens0 4>;
+
+			trips {
+				cpu-critical {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu4-top-thermal {
+			thermal-sensors = <&tsens0 5>;
+
+			trips {
+				cpu-critical {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu4-bottom-thermal {
+			thermal-sensors = <&tsens0 6>;
+
+			trips {
+				cpu-critical {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu5-top-thermal {
+			thermal-sensors = <&tsens0 7>;
+
+			trips {
+				cpu-critical {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu5-bottom-thermal {
+			thermal-sensors = <&tsens0 8>;
+
+			trips {
+				cpu-critical {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu6-top-thermal {
+			thermal-sensors = <&tsens0 9>;
+
+			trips {
+				cpu-critical {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu6-bottom-thermal {
+			thermal-sensors = <&tsens0 10>;
+
+			trips {
+				cpu-critical {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu7-top-thermal {
+			thermal-sensors = <&tsens0 11>;
+
+			trips {
+				cpu-critical {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu7-bottom-thermal {
+			thermal-sensors = <&tsens0 12>;
+
+			trips {
+				cpu-critical {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpuss0-thermal {
+			thermal-sensors = <&tsens0 1>;
+
+			trips {
+				cpuss-hot {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "hot";
+				};
+
+				cpuss-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpuss1-thermal {
+			thermal-sensors = <&tsens0 2>;
+
+			trips {
+				cpuss-hot {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "hot";
+				};
+
+				cpuss-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		ddr-thermal {
+			thermal-sensors = <&tsens1 11>;
+
+			trips {
+				ddr-hot {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "hot";
+				};
+
+				ddr-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		gpuss0-thermal {
+			polling-delay-passive = <10>;
+
+			thermal-sensors = <&tsens1 8>;
+
+			trips {
+				gpu-alert {
+					temperature = <95000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				gpu-hot {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "hot";
+				};
+
+				gpu-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		gpuss1-thermal {
+			polling-delay-passive = <10>;
+
+			thermal-sensors = <&tsens1 9>;
+
+			trips {
+				gpu-alert {
+					temperature = <95000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				gpu-hot {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "hot";
+				};
+
+				gpu-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		modem0-thermal {
+			thermal-sensors = <&tsens2 1>;
+
+			trips {
+				modem-hot {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "hot";
+				};
+
+				modem-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		modem1-thermal {
+			thermal-sensors = <&tsens2 2>;
+
+			trips {
+				modem-hot {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "hot";
+				};
+
+				modem-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		modem2-thermal {
+			thermal-sensors = <&tsens2 3>;
+
+			trips {
+				modem-hot {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "hot";
+				};
+
+				modem-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		modem3-thermal {
+			thermal-sensors = <&tsens2 4>;
+
+			trips {
+				modem-hot {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "hot";
+				};
+
+				modem-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		nsphmx0-thermal {
+			thermal-sensors = <&tsens1 6>;
+
+			trips {
+				nsphmx-hot {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "hot";
+				};
+
+				nsphmx-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		nsphmx1-thermal {
+			thermal-sensors = <&tsens1 7>;
+
+			trips {
+				nsphmx-hot {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "hot";
+				};
+
+				nsphmx-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		nsphvx0-thermal {
+			thermal-sensors = <&tsens1 4>;
+
+			trips {
+				nsphvx-hot {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "hot";
+				};
+
+				nsphvx-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		nsphvx1-thermal {
+			thermal-sensors = <&tsens1 5>;
+
+			trips {
+				nsphvx-hot {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "hot";
+				};
+
+				nsphvx-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		video-thermal {
+			thermal-sensors = <&tsens1 10>;
+
+			trips {
+				video-hot {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "hot";
+				};
+
+				video-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+	};
+
 	timer {
 		compatible = "arm,armv8-timer";
 
-- 
2.51.0


