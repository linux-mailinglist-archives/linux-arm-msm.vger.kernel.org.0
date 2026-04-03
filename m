Return-Path: <linux-arm-msm+bounces-101596-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id INMhHWoMz2kNsgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101596-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 02:40:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DD8638F929
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 02:40:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C37A930921E2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2026 00:37:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38E0426B764;
	Fri,  3 Apr 2026 00:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l/+rg6GG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aEcCECgJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B701023B63E
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Apr 2026 00:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775176580; cv=none; b=bXIz/qos2i1BZ5EDhxVzxM1k2jsv6j1C/1L1SwGzV3W7cn+LNU/N8TmtajZMoVsGoxxw5xz6T2+NyEqWMJU7u6nH4ShIhSPzyXGALWwHXLNQTNzIYO8USonx/V+hO2+pBS+OZ6LuDBRyoQ4MR/BoIPjIJoeb64oqQp+p2CDN1J4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775176580; c=relaxed/simple;
	bh=RpiDGkJOR1Okpis1o/oRcRN55/N3YkysXuZaJy2F9x0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SesqcBrl9HANGFQRyQUdnDMrMe5rArau6sqwI9ehfJu/Erq5LqSyc2BjKW9nrILBPId0WSwkie5wMxowXAWWAfPEy9RPzf8yM+FwnkAje6uAt01aHzGG0w9CP2MB0STR1L/iDrTFTu9N6p2vThu/1GnGu4ze+OYU+7QWnAGPJbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l/+rg6GG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aEcCECgJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 632G4WLt982316
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Apr 2026 00:36:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4QnKBqRJ8Pxlp5wm0lmApGHFXTpwJPHSwOx0pf0DVY8=; b=l/+rg6GGMyR52NwQ
	VMVb2/fctF4G91zT908S+dhIIZC/12ez/pi8/bmthsjhwKjk1hldmOesKWDOZbMT
	tF012LbTRptjCoebRLa2APTwqy+a27grdvTZytLn70qdxo6nfwDY04tt9BJz1rJ9
	QSGjh9DA5VbHNsf6z0ZVWpv76T8ywBaM4J2+kTMDgGtz5zJDKBgVstspFXe8crjx
	Zluao3fwGvu2Qw6ZaUq9OXE4EhZw1gufCrcpC0qqYR1KkKipP2q+eL/qPvxnAgV4
	trbRoUovr+sxRvqLDQ6xRGiEQOlLGIAkv8S22QKKuy6uLcadKNJFXLQYY9xuaQa/
	WRdchQ==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9tupsn4y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Apr 2026 00:36:17 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-127337c8e52so1074244c88.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2026 17:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775176577; x=1775781377; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4QnKBqRJ8Pxlp5wm0lmApGHFXTpwJPHSwOx0pf0DVY8=;
        b=aEcCECgJ90UVf9rtqpOXucfpfmCWJcGRlc8uJqX8DpIqMBUp0uajQqSYFjZcCQm7B/
         84fQY6tyVF35dLtrjUTcKsrvQyYj89akMV/3mZ5c3LW02o8msonsRCLv5m21o5GIcUBh
         nHUkRCOj9IgWD0SlBNsBLK9RWSsbIhUEWPW9g8InNWC9RINmOe2Hh30IBvmI5IKmzhrl
         iGox3am8REoFSMQ0v5+J7RN5vvGI/EwxUajV3UTs1Ye+6j+64gpiX07FlHKX8Vnn5Z3n
         TJua9cKUj2Yn966CVaa4XMVibUlcC4urWhvMjf9Y0DcZGehdvQ+3ZSlly7M6Rr1iWwy3
         lmQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775176577; x=1775781377;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4QnKBqRJ8Pxlp5wm0lmApGHFXTpwJPHSwOx0pf0DVY8=;
        b=FH2zMWdPBdwQemuoR2WXrnum9H0qAoZ/g8pTr96iUdjtJC3g3vcAcSCqSSXyCzY041
         VxgfqX3xoQOzmNQzk5r0mGPo/8YqRUHS0lC4C/SYJ3OfLWz/jfZ9sShKIBr3dDlzdc+m
         tu/39qGJpwq3k+daWyjyLOhpnOEOuPCM451HDjgWLSDBTIBD3jpKJtcSL0Qv/B5G5mmv
         LNVCr18mmmIShfqGpl200ur9o22lDLPxbAStocrxPpQV5OpDQSym98svsDjaCk3uHm2I
         ZEBxDKY4k7pgf3phC6rkncB0mwKNlul9E47ynxc0F3CcPFEu10eH4heKsDxuDYpmJWyX
         L0PQ==
X-Forwarded-Encrypted: i=1; AJvYcCWXTLTakbCom2qFjpp9JUA4kDGYkgp7Ky7TjWxmO9nUVr3XmpKODNHPinmVqXYmgX7mAf+X33adjeBIGLLP@vger.kernel.org
X-Gm-Message-State: AOJu0YwNFOetxCptngnpPeZzz32+FkiSCUhDEXTwjCLInNDcqt/rGNbn
	3256pULGUPaqzUkSaXeHaNAhW82uB2kSrB+S24pLxVUzlppAe4I1HFdjCo3BzbFtKUInbKeeiAs
	9VlBudTw3IvPPTo7DZqbLWgAW8sQ0rgJnNXU5vtj1ed3eH45N9p8YLcG9mWBDGv+5nUEI
X-Gm-Gg: ATEYQzzZx5EGduxYS0L6Y7w0cY9m7Kjm3LYnM8QphcfTKs0izxiH4tuswmNBo8EgiTA
	xdt2V2kmp83rmm4r5Ab6bOBUg/yC3HphYTqPuUiHg02uT2rDEM82sWZ/nqjfgWSdK2VPE+75MAV
	8PG04E5dF+YUIU0pv0shATCmkqHenU5OiwEXjucLqm+1fVr7oeKpttYn21fAQlGcjRDdbFeZYoj
	RcYb3oEkvSKve9aN9TYDa1FAtvZ62ucQH2q5L0VF1euUcj6+MB6TxNUlI8Sa5lc1evdn8l0raWj
	iLOCdArYJZCcDiB6y1iYTF2yOuFHAPAPxUU038r3t/0pzrQewgU7Vd+rFAF5wcFSVmrUvzgvYc9
	YGUxt/uX2sIJQboVOK919zZWSqRZ59l0Mi0/q3uldPUtz4P6OxktCoZsk7GTkpiXaREyCMPhglw
	==
X-Received: by 2002:a05:7022:41a3:b0:12a:72af:83d4 with SMTP id a92af1059eb24-12bfb6ebbd0mr555502c88.8.1775176576737;
        Thu, 02 Apr 2026 17:36:16 -0700 (PDT)
X-Received: by 2002:a05:7022:41a3:b0:12a:72af:83d4 with SMTP id a92af1059eb24-12bfb6ebbd0mr555485c88.8.1775176576142;
        Thu, 02 Apr 2026 17:36:16 -0700 (PDT)
Received: from hu-fenglinw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12bed93f861sm6290550c88.0.2026.04.02.17.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 17:36:15 -0700 (PDT)
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Date: Thu, 02 Apr 2026 17:35:21 -0700
Subject: [PATCH v2 1/2] dt-bindings: power: qcom,rpmhpd: Add RPMh power
 domain for Hawi SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260402-haw-rpmhpd-v2-1-2bce0767f2ca@oss.qualcomm.com>
References: <20260402-haw-rpmhpd-v2-0-2bce0767f2ca@oss.qualcomm.com>
In-Reply-To: <20260402-haw-rpmhpd-v2-0-2bce0767f2ca@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        kernel@oss.qualcomm.com, Fenglin Wu <fenglin.wu@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-17187
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775176574; l=3267;
 i=fenglin.wu@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=RpiDGkJOR1Okpis1o/oRcRN55/N3YkysXuZaJy2F9x0=;
 b=w5vWo17PutDYOzx+dGXZzF9z8xU0BVO9E5tXb9ITVIpTEQz+ZzR3Lqnn2ml0Nl9FTrhKG/30X
 Q4OPX6eB9tcD4/taBHXjWirbQYaqCLrulk9V228Ks+tY+Tlc1dm+ki/
X-Developer-Key: i=fenglin.wu@oss.qualcomm.com; a=ed25519;
 pk=hJdt3E7o54lql+miD2GaxwF74cDyhgNwMbmFOZ46bRU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDAwMyBTYWx0ZWRfX+7JH28wVlW5j
 YvLEnZVfbJQKeAht9b+ouLGz8fdSf8ZUjMjDMWJewWe0eCn+g/5DhYnkI5vEYU770pXczXMycm6
 21CjHfmAHepSza7AgurWQHsMDXLtZNO5wsP4uQ807RZ3hP2rM6ixyjxyV5xUtc22le1lVBl4b1o
 Wyy623kBRdb6Gr1VzKCGOMR4MM64+PME0Ez90FF4E3Dv/kdCBpuS7iiqnu14YmQJzGiD55v6bsY
 XvZTQ8doef5N7SZB52vSxSioWeKAx8p6O1im2mN0e0zERwd1ZgWJCWWF3j0807NGhnpeLd4ieg5
 xKY+Z1D0gf/Qg9fiWFEz04mAWOhGPL1FG9ua0mUNDFLFGsUXHGJnJuXI35c4fOg6Dkj0BiCO2R/
 8xsz+gd3tA925hBmUqLHIWzxZ2J+5ORybOVCgm7kfB37K/lOSw8EUdPMFzduPka5UBUWiNwXOMy
 vjiFuc7LsigCO7E2Awg==
X-Proofpoint-ORIG-GUID: 1Xz9rXh5OevHVzTj_eUULTZGlaE3P7Zz
X-Proofpoint-GUID: 1Xz9rXh5OevHVzTj_eUULTZGlaE3P7Zz
X-Authority-Analysis: v=2.4 cv=DZ0aa/tW c=1 sm=1 tr=0 ts=69cf0b81 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=j-8-n3vk8KpYigB0PxMA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_04,2026-04-02_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 malwarescore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604030003
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-101596-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fenglin.wu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5DD8638F929
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Document the RPMh power domain for Hawi SoC, and add definitions for
the new power domains which present in Hawi SoC:
 - RPMHPD_DCX (Display Core X): supplies VDD_DISP for the display
   subsystem
 - RPMHPD_GBX (Graphics Box): supplies VDD_GFX_BX for the GPU/graphics
   subsystem

Also, add constants for new power domain levels that supported in Hawi
SoC, including: LOW_SVS_D3_0, LOW_SVS_D1_0, LOW_SVS_D0_0, SVS_L2_0,
TURBO_L1_0/1/2, TURBO_L1_0/1/2.

Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/power/qcom,rpmpd.yaml |  1 +
 include/dt-bindings/power/qcom,rpmhpd.h                 | 12 ++++++++++++
 2 files changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
index 27af5b8aa134..35a0e01c2015 100644
--- a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
+++ b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
@@ -18,6 +18,7 @@ properties:
     oneOf:
       - enum:
           - qcom,glymur-rpmhpd
+          - qcom,hawi-rpmhpd
           - qcom,kaanapali-rpmhpd
           - qcom,mdm9607-rpmpd
           - qcom,milos-rpmhpd
diff --git a/include/dt-bindings/power/qcom,rpmhpd.h b/include/dt-bindings/power/qcom,rpmhpd.h
index 06851363ae0e..67e2634fdc99 100644
--- a/include/dt-bindings/power/qcom,rpmhpd.h
+++ b/include/dt-bindings/power/qcom,rpmhpd.h
@@ -28,15 +28,20 @@
 #define RPMHPD_XO               18
 #define RPMHPD_NSP2             19
 #define RPMHPD_GMXC		20
+#define RPMHPD_DCX		21
+#define RPMHPD_GBX		22
 
 /* RPMh Power Domain performance levels */
 #define RPMH_REGULATOR_LEVEL_RETENTION		16
 #define RPMH_REGULATOR_LEVEL_MIN_SVS		48
+#define RPMH_REGULATOR_LEVEL_LOW_SVS_D3_0	49
 #define RPMH_REGULATOR_LEVEL_LOW_SVS_D3		50
 #define RPMH_REGULATOR_LEVEL_LOW_SVS_D2_1	51
 #define RPMH_REGULATOR_LEVEL_LOW_SVS_D2		52
 #define RPMH_REGULATOR_LEVEL_LOW_SVS_D1_1	54
+#define RPMH_REGULATOR_LEVEL_LOW_SVS_D1_0	55
 #define RPMH_REGULATOR_LEVEL_LOW_SVS_D1		56
+#define RPMH_REGULATOR_LEVEL_LOW_SVS_D0_0	59
 #define RPMH_REGULATOR_LEVEL_LOW_SVS_D0		60
 #define RPMH_REGULATOR_LEVEL_LOW_SVS		64
 #define RPMH_REGULATOR_LEVEL_LOW_SVS_P1		72
@@ -47,6 +52,7 @@
 #define RPMH_REGULATOR_LEVEL_SVS_L0		144
 #define RPMH_REGULATOR_LEVEL_SVS_L1		192
 #define RPMH_REGULATOR_LEVEL_SVS_L2		224
+#define RPMH_REGULATOR_LEVEL_SVS_L2_0		225
 #define RPMH_REGULATOR_LEVEL_NOM		256
 #define RPMH_REGULATOR_LEVEL_NOM_L0		288
 #define RPMH_REGULATOR_LEVEL_NOM_L1		320
@@ -54,8 +60,14 @@
 #define RPMH_REGULATOR_LEVEL_TURBO		384
 #define RPMH_REGULATOR_LEVEL_TURBO_L0		400
 #define RPMH_REGULATOR_LEVEL_TURBO_L1		416
+#define RPMH_REGULATOR_LEVEL_TURBO_L1_0		417
+#define RPMH_REGULATOR_LEVEL_TURBO_L1_1		418
+#define RPMH_REGULATOR_LEVEL_TURBO_L1_2		419
 #define RPMH_REGULATOR_LEVEL_TURBO_L2		432
 #define RPMH_REGULATOR_LEVEL_TURBO_L3		448
+#define RPMH_REGULATOR_LEVEL_TURBO_L3_0		449
+#define RPMH_REGULATOR_LEVEL_TURBO_L3_1		450
+#define RPMH_REGULATOR_LEVEL_TURBO_L3_2		451
 #define RPMH_REGULATOR_LEVEL_TURBO_L4		452
 #define RPMH_REGULATOR_LEVEL_TURBO_L5		456
 #define RPMH_REGULATOR_LEVEL_SUPER_TURBO	464

-- 
2.43.0


