Return-Path: <linux-arm-msm+bounces-114233-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id D0gTBY+eOmppBwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114233-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 16:56:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F2766B815E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 16:56:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Bqb1tqFW;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=CBUkrJmP;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114233-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114233-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BEB4B302C15C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 14:53:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 788EB3D3D02;
	Tue, 23 Jun 2026 14:53:02 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DE5B3D6465
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 14:53:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782226382; cv=none; b=nqPjstpzrldiZ5bRFFRwhU6jj+mCJOu37DJpxDuKoyE0wii+xFZA76leZSfhDJSBBuI/monhHkz/GZ8CffAjnXfnny2VEh/0gSY7JOWCB9RtvAwv7ToPd4Boqm3GjbC+F+AmtuOsXX45xRI5dK5f171PvBOgs5+AqRair7BeViU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782226382; c=relaxed/simple;
	bh=kOb03Jdyp29jPgRmKn/Ve3iixRKc3a10Zbfid+x8L0w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mkhqIyValU+cY/DzLMd4tJURV1q/5pns+B1D1kE3qJTr5bHfkL1ClNkYIezMfm4DCxdCqLRJk1F2C9AhpNCaWLSUSwQEwobyTJqZt1Nnp/EI5Frx8XIQPBxT/H7m6EPo0bqWd15MToFE/ZjY6p5dxEpXuHFbn8WDBW/o8cNY+04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bqb1tqFW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CBUkrJmP; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NBZL4t4017209
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 14:53:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Upnj1dro5no
	76AJPF0WGep4IipqFATA6uaE79gGmLzs=; b=Bqb1tqFWVDfqCUwUh6nbw769zFR
	FpeoXqJ4vsR9soJ1IPCy322RRwAW9N1kcKe8mNBegteoswSYMR3WTrU1TckGYQaw
	TANtLdXbeomiqxP4GTY98J1TXfoUosDHOHkoRLUnCmnI9HzI/LRUpI0fM/6vqSxG
	bvDDBNyricU0G7Se/B5u+M6zXuAEgvlnt35Igajnb/+Wewy53sj+z9mB+Ifz24JB
	UmVcEnNnxzWO0ThSb7FbdM3312mPA0/6ssr5TAwbKqNpi69zOktJ3FAlAzOayCJn
	f7fVcsUMKV6KVmWFOwJ2Pom2+lzWXAyMk0PeSeq7cgiherVWy80nLfLzxrg==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eygkjjw3c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 14:53:00 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-9670f220557so4103971241.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 07:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782226379; x=1782831179; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Upnj1dro5no76AJPF0WGep4IipqFATA6uaE79gGmLzs=;
        b=CBUkrJmPtt/NlRpUO2XXsu0VaMv0jDaw3qu2u4PCo/crS3TYKYYgyeKH8KFb7HzzHE
         Nn1IxfFT2P/gYb425NrcKuerpdAF/4ggzpncSeA6E8pLzTNUJbsvW7/VR2G6XqNNDkx4
         8QZqFn3WjoxYtH+w6vgzhaHUg9lWZPU0v4M+UVJlAk9FGoAvjVbhmSRRRgNGlCqX2y0l
         vFbToji/BEbKMEJ7hog7UnZy9pAQjM68mJxzZZsyxvU/UDm/WpVV2f6w/xeK6Si+IIpZ
         IJeQTC8/oEpHpoCXIxtZiE9eGLYkOoCxUp1yY282xeWUNW2+/BAbWAC91Q3/J5kibxqB
         uhFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782226379; x=1782831179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Upnj1dro5no76AJPF0WGep4IipqFATA6uaE79gGmLzs=;
        b=ldxvBYr0SqD1Q9iZSQxgr9TY45slCrfmUxISwGBTbUGFoJxAki2jIhNUhIINdTj6aA
         Q2iJAwgBSataehuBgF+mU99ZVzmXPu1o3qrPgUN+THrcNzMN86Va3OAhq8/7OCKwphPo
         Lekug4Gn6W8OjtKvOJ26VSOZ7X47ajb6vjnYopgyFeXE/2iDMt09XPY5SN7A3KAtQBQx
         q7BXdHlN684J3snBOrDMx6yKnDyScEe8+3tCloBj1d1nAZ/jk2ojrp15r4UoSFTBT8Bd
         7dtoYPQ7URjsnhT9XZiOwCvyNl5c3D5XKigFKLFrZkPkSUyj2gE8fZSt15ag3FNOORu+
         2J0w==
X-Forwarded-Encrypted: i=1; AFNElJ+GNritU7WMQhYj0HutCt6JEuiTZWnkF68F1D/mo9vT/j48vE9Cyo1+XNKJ+6/j/LJklQdq9w6lbJdJdeDm@vger.kernel.org
X-Gm-Message-State: AOJu0YxgBTuyjh0L5oReNB5MLqskQ3wOcLecdZueWPUtACwbmicncHDE
	ITBiWslHvMLYYl1mbIu3iZZP8zp/zQqp6JIbLAwTEOIwURq+ni21FEaCwkmpOg5dA8zcG+V2doe
	KUX5o3duwXr4pdFC0rs2utiFTjIdRjTgKyemp8p0eTEtt4xj2sLiik+QETogT5NvC3Ua5
X-Gm-Gg: AfdE7cmO8Fz+1zIP72YU9QN/YzWRoWxcXsGHYkcpgHrdoGv7xcqowYhcmbiddVjqaQh
	7ongNsb9s76RFneivGSmX5+tEwX9memNaFAFoP+bmCD0zxGK4Cc/XVhiXvIXgvCLqj/xLcBKu2g
	N9WAs92wAZI+2aIk0KQV5IMhtncAclFA630E9IVpFYStS7DjC5wyb/pihHaMMHncuQPIkvbh34S
	j1P/OlpK/gj6/ZLSbAKvtAj168yZgOqKZmkUtsvfJfgu3VT5poTc/sNtq8P8HGdrwq64gh/5gWc
	Xe4f/oJPwB7LFPFrdmZl7+wuwdOpHD8yxLsssRjtyb0VHCO5W/ISRTcRXjPplKEu4ZFJoVENtl+
	uo32b8SDhUPhhgw7Rfhl5NZgerZNzdhMsAlFbBlsKc6o1HoNTXx+5x3SmkKLP0yviYFTSUt/tBW
	Xs8r74rjyqUfkJJILJRna5yP3vkA==
X-Received: by 2002:a05:6102:390e:b0:6ef:f681:d914 with SMTP id ada2fe7eead31-72ff628e831mr1646287137.22.1782226378916;
        Tue, 23 Jun 2026 07:52:58 -0700 (PDT)
X-Received: by 2002:a05:6102:390e:b0:6ef:f681:d914 with SMTP id ada2fe7eead31-72ff628e831mr1645870137.22.1782226370419;
        Tue, 23 Jun 2026 07:52:50 -0700 (PDT)
Received: from shalem (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c60aca46csm534042666b.36.2026.06.23.07.52.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 07:52:49 -0700 (PDT)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: "Rafael J . Wysocki" <rafael@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-acpi@vger.kernel.org
Subject: [RFC 12/12] arm64: dts: qcom: x1e78100-thinkpad-t14s: Move keyb and touchpad to ACPI enumeration
Date: Tue, 23 Jun 2026 16:52:25 +0200
Message-ID: <20260623145225.143218-13-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260623145225.143218-1-johannes.goede@oss.qualcomm.com>
References: <20260623145225.143218-1-johannes.goede@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDEyMiBTYWx0ZWRfX/heDiATJYsZ8
 IQufFeOR/BzGP2tmRiIdaXcHVNtC8W83juoDtKcqJoAGEhJ9Y83e8y5Nc+52Fe3mh20B3JHlcsq
 NdOJActcRH2O1jS4Y05MUltK/aA6Fpi0zvaVMsJV5r0i5CRtj8ev5A0U1AcwgygCsbb6rQIW8tR
 R9ALb+C3a2vgno9EDNu8X3924Mad86NOADfwqaCIMdXlvl/JPpQ5IRMX2xb49jbDfJMarHqgfie
 eY2/ouefJO68oLa7/6Qa0+b99bLcU4LIec396gXTi98IYt5THpGFm1ZpJrVk0YHaE+q7qdwLkus
 KfpzGZocMtA+RlejpT7LopjU7S3Hjw/4sTp6eAVWAVx6BRi+urNmk+F51sxV61qJkGVmza6zAcv
 fvHjJ2e3rliYZKj4msNXGQNzo/GfEqwlLKIxJsjgMFkZNnhXJe48gVffOoitOjtsfml+hjSznMc
 9ikqCCrA2TN54W5gH7A==
X-Proofpoint-GUID: j24CFbRn_Mtp8bgv9x1VS1aJdh9v51KI
X-Authority-Analysis: v=2.4 cv=SoKgLvO0 c=1 sm=1 tr=0 ts=6a3a9dcc cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=yFha0hQGoAcqzG6e0GgA:9 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDEyMiBTYWx0ZWRfX4JYLZzx1KbX9
 XXdoHCep5O15E0D2cCkFqUjU8iISTqd4A5iPZLDKvqLo153RByOjyuLDd6NC0YeOzE2jW7kvdCC
 MgH8T1tOHDp1KAjxkRmDOKlIDZkEnak=
X-Proofpoint-ORIG-GUID: j24CFbRn_Mtp8bgv9x1VS1aJdh9v51KI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230122
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114233-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:rafael@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:johannes.goede@oss.qualcomm.com,m:srini@kernel.org,m:krzk+dt@kernel.org,m:lumag@kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:abel.vesa@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-acpi@vger.kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER(0.00)[johannes.goede@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johannes.goede@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5F2766B815E

Add acpi-path properties for DT-ACPI hybrid mode and remove the keyboard
and touchpad description switching to relying on ACPI to enumerate these.

Also drop the clock-frequency this is also provided by ACPI now.

FIXME: Needs DT-bindings patch as pre-req

Note this depends on these 2 patch-series for working PDC support on Hamoa:
https://lore.kernel.org/linux-arm-msm/20260410184124.1068210-1-mukesh.ojha@oss.qualcomm.com/
https://lore.kernel.org/linux-arm-msm/20260616-hamoa_pdc_v3-v3-0-4d8e1504ea75@oss.qualcomm.com/

Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
 .../qcom/x1e78100-lenovo-thinkpad-t14s.dtsi   | 59 +------------------
 1 file changed, 3 insertions(+), 56 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
index 2fc01e8e8c04..a73576ec238d 100644
--- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
@@ -1017,57 +1017,8 @@ &gpu_zap_shader {
 };
 
 &i2c0 {
-	clock-frequency = <400000>;
-
-	pinctrl-0 = <&qup_i2c0_data_clk>, <&tpad_default>;
-	pinctrl-names = "default";
-
+	acpi-path = "\\_SB.I2C1";
 	status = "okay";
-
-	/* ELAN06E2 or ELAN06E3 */
-	touchpad@15 {
-		compatible = "hid-over-i2c";
-		reg = <0x15>;
-
-		hid-descr-addr = <0x1>;
-		interrupts-extended = <&tlmm 3 IRQ_TYPE_LEVEL_LOW>;
-
-		vdd-supply = <&vreg_misc_3p3>;
-		vddl-supply = <&vreg_l12b_1p2>;
-
-		wakeup-source;
-	};
-
-	/* SYNA8022 or SYNA8024 */
-	touchpad@2c {
-		compatible = "hid-over-i2c";
-		reg = <0x2c>;
-
-		hid-descr-addr = <0x20>;
-		interrupts-extended = <&tlmm 3 IRQ_TYPE_LEVEL_LOW>;
-
-		vdd-supply = <&vreg_misc_3p3>;
-		vddl-supply = <&vreg_l12b_1p2>;
-
-		wakeup-source;
-	};
-
-	/* ELAN06F1 or SYNA06F2 */
-	keyboard@3a {
-		compatible = "hid-over-i2c";
-		reg = <0x3a>;
-
-		hid-descr-addr = <0x1>;
-		interrupts-extended = <&tlmm 67 IRQ_TYPE_LEVEL_LOW>;
-
-		vdd-supply = <&vreg_misc_3p3>;
-		vddl-supply = <&vreg_l15b_1p8>;
-
-		pinctrl-0 = <&kybd_default>;
-		pinctrl-names = "default";
-
-		wakeup-source;
-	};
 };
 
 &i2c3 {
@@ -1598,6 +1549,8 @@ wcd_tx: codec@0,3 {
 };
 
 &tlmm {
+	acpi-path = "\\_SB.GIO0";
+
 	gpio-reserved-ranges = <34 2>, /* Unused */
 			       <44 4>, /* SPI (TPM) */
 			       <72 2>, /* Secure EC I2C connection (?) */
@@ -1655,12 +1608,6 @@ hdmi_hpd_default: hdmi-hpd-default-state {
 		bias-disable;
 	};
 
-	tpad_default: tpad-default-state {
-		pins = "gpio3";
-		function = "gpio";
-		bias-pull-up;
-	};
-
 	nvme_reg_en: nvme-reg-en-state {
 		pins = "gpio18";
 		function = "gpio";
-- 
2.54.0


