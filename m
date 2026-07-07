Return-Path: <linux-arm-msm+bounces-117400-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1Q1lNyBSTWpmyQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117400-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 21:23:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 787EA71F2A2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 21:23:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=gNq83lrR;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=EG2kXaIB;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117400-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117400-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A3BDA302494C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 19:22:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 712C939EF1F;
	Tue,  7 Jul 2026 19:22:40 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 631DF38887E
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 19:22:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783452160; cv=none; b=YADM04FhoR0Yef6vdde7zlyAkQDqTunz52UmjfCyOA0n9gKnC3EyIv7EjGwiRc64GzdIYFOL7Mo6J5YYvdID7xkRfefaHa+XJidUOlMfs6CGoEjxnXZXmXc6Qk04yKV/DrDlBmRt75PNsedaPZk3HItSjgPT/SzlrB0nCLUuWNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783452160; c=relaxed/simple;
	bh=OLMI44Lp6GoBRY1rHghq6n1Fah+DXzoEhLtqQBP7V2o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NvacKUsm12fXm13VVmVlqhuhkYx0PpvfqhSHC3ySEfC6UBeLvmT4UQsePzufoV46v2WjqXFiKukNhg7CSCk8eLtZxqieekQz4kDQU5IjKwrqNZgBLjKYdzak9DzE1mpnRaKWrKJUpTsnuPq6WIpNk1+sFlWxLHuuWCOErAM7s48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gNq83lrR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EG2kXaIB; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667J5Fk6542061
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 19:22:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=PH9kSE6ElCx
	Spv01qD+dgcHkXgkXzbxHF+kJhTdzTJ0=; b=gNq83lrRtsUMcnMImKB7p9xnCO7
	ItfQyJ5pFR5inaiQEXi4axYHT0o3yVyyRj+RikIWjT0x12HXA//QpRsNwAjUM4PU
	Ow9pU/rtA0+35z+UkKzx9KMQhuAWzuI+/SbGv79A5gJFWJ2GL+LXtVC7EKqr+lyG
	vqXQsadcGUuA17B+bdiR1LROdt5xt78DbMohiIwWXVY3taPBZFncWfLWtJpiADq1
	6/CX5ysCPvoP5dz4sWNpz4M2NnpSFECX+ijZJWE6YHkX789m9qJhQHtDxLq2Qsi6
	RttaXrM+1dNQlsHD2acnFiEEO09ACefkB2r0Nep4FUUsBJrWMTD8kFYYBzg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8w11u1y9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 19:22:37 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51bec738909so34552171cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 12:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783452157; x=1784056957; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PH9kSE6ElCxSpv01qD+dgcHkXgkXzbxHF+kJhTdzTJ0=;
        b=EG2kXaIBGbpphCx+LrwHHeCcLAZuKP60ZyioeewXHJeX6GaXocr9OO774bp8hgQl8l
         6Jb8VuxzApY10/bxsHOWHxa91OnALHkAK5xbtLghldOZ0f2IDjPJ4n47VRQyJc6bw3wp
         FuyjYN1pd680WUe77Gf2XdRMxZO2Kc0PWSjBJF6z3SFeJd5tiI0zY383BHVio48K9mbJ
         TlwkttEJz/Hid/Ajy/vRIegoGXJQ+Ly+x+0w8SQ3viViHoVvB87i9A2T2+CgaSIUXIy1
         AWEhf4f2vyCcf9gkgfXAMsm8PHXCUfB1ypviavjNpFjpmkJFhSpLT5Z9JhxHCePKzrl4
         peRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783452157; x=1784056957;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PH9kSE6ElCxSpv01qD+dgcHkXgkXzbxHF+kJhTdzTJ0=;
        b=e2wdlWZt16k9iXdRKE5xJVSZ25CHJd/8LNlFKSEiMVSL64mJPf6FS9AGutfBNRA7ry
         aC4NVhiJU3iCIIMk0YGu5f7Mn2G/dWGCwQYYI2D48eoYlqqzBP+/9S9LZrT2xLFXaHjZ
         j+P2shOrZNok0ocqUJAvYDTMwTmcxDlvQFkQ1QSeOvSgTdcjtkspdfpqHiRoe3Lm6u6K
         Ay+0M7NKZzx30n3zzfqsO4DUTsdB1xZloP8MpfrQq0JgtCihiEgXOVkU+1cpyQha+oE+
         H5ohu0j1z2F/BiVNq4XqVT1fCOUO49Q4iHDFJUKceoEB1jpeQM/ffjCLYVoKL9nQWRlx
         /B2A==
X-Forwarded-Encrypted: i=1; AHgh+RpnbxKYCSTNBiaRdRSOWXWGEb4gFU5+QfzN0lec3K+VpZQl7ocbHTgmjcUQVC37FLu8mK6K8dObaEIG+kyT@vger.kernel.org
X-Gm-Message-State: AOJu0Yyr0QqQWGcxcxyJwivSKdT1WZ1CXt+b4p2Fcdr0yIUDQgpgP2U4
	HW5tT5Ebk9t0iI2wFC08FRC30TT7WEid/UZhn1QBLKd95J77f6+1+ApsaphQ870yQCwc/naaiNb
	SmnUeLjoNipRPKa5dwZNwXbulWEeM+GFUBdrql2/W8jDlfLVvgY7jQ5jJ1qe1HYXTk3n3
X-Gm-Gg: AfdE7ck4OMZMOKpd1eokuz8MLaK5dT7lGeXu0orAIaVYwO9Aol0bFLheiz+XCctlI/G
	Y5cRo5A0x/gGzY6QyG2vUn+FmrvPMhE19ynlzkNEsmiXdveQfe9J7haPAxiZGUqzpalEdV+DTT9
	KUnLaI9NQ4e3tWD3KpxlHyRqXKDFQgvdsZ3gVcQBWfClQ9sop6nO+bzu/hdE7vYUr3AYLNXoam4
	mgx5u6YnJtjqjSotRSxaoQdodkTJvJnG7s3kyS6ot473m+UqnZ50ZzSWfoar8Vx+0wd9ps42OKY
	qg8vA+6xbEtmpoddAwjLNGE+1SlQJK2/czhFyL9r0uSIW+djD5S7Vbhd0g/EC6LetRWS8xFfL46
	EYkXm0Jm1+u6SsnDHzFmVJGuqGeeR76412TA67/tGhgc=
X-Received: by 2002:ac8:5989:0:b0:51c:7bd:2c6f with SMTP id d75a77b69052e-51c7477d221mr85363101cf.8.1783452156481;
        Tue, 07 Jul 2026 12:22:36 -0700 (PDT)
X-Received: by 2002:ac8:5989:0:b0:51c:7bd:2c6f with SMTP id d75a77b69052e-51c7477d221mr85362591cf.8.1783452155901;
        Tue, 07 Jul 2026 12:22:35 -0700 (PDT)
Received: from juillet.box.freepro.com ([2a05:6e02:1041:c10:8029:bbc1:63:ed84])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0f3677asm70025515e9.4.2026.07.07.12.22.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 12:22:35 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: sre@kernel.org, hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
        linux@roeck-us.net, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: bryan.odonoghue@linaro.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        neil.armstrong@linaro.org, gaurav.kohli@oss.qualcomm.com,
        manaf.pallikunhi@oss.qualcomm.com, priyansh.jain@oss.qualcomm.com
Subject: [PATCH v6 3/3] arm64: dts: qcom: x1e78100-t14s: Add thermal zones for keyboard skin and charging sensors
Date: Tue,  7 Jul 2026 21:22:28 +0200
Message-ID: <20260707192228.14647-4-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260707192228.14647-1-daniel.lezcano@oss.qualcomm.com>
References: <20260707192228.14647-1-daniel.lezcano@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=DMe/JSNb c=1 sm=1 tr=0 ts=6a4d51fd cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=8S540zSUgs8tgqG0LUMA:9 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 4WesF-U4bn3KRx7ewVE5IHTCzbW5HdW9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDE4OSBTYWx0ZWRfX/Z3lsQJiuXwM
 SXRnczEBKMQ8Sif8eEsV26xnsjZBT5i5PXGnBsv9yuT9MDhwZMpi/zuy6FSTt0vWnIkzBEOHnDu
 KODH1XB+6MFG//VmvGOrt+Bj3Q3r6yM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDE4OSBTYWx0ZWRfXxTdgUwpfRIaa
 CFLBXSXDbW6cOFSVvT/haapwpiGzOyEz9/0IoCzdx3RPl1WWRru9obnw43q3WMSP0wbi29qdDVI
 8hp2vJjXfmdwed5ha+0JMYYOanTZrZi7IFTZW3v1uOL655Yzt4p1ubQ3VJ6vgxwxziJmvMdGscw
 6xVqlM08OlJhQjpK3RdsVVX4lTF9Hdtz5ap8TKYf8TMidvmNwl79iiG5OTwvfer8JmOGkJ8tKLs
 llWwuwLOa9isRRBsJNTgggsqnqIQjMvgpvkeyAdiCio21fn1QVE8V4rHrmTbAesdrgkAfIqSLD0
 jPAy+6kKirYj3pVRWFgwYavxcLENi5rJltGRZMJspTbzO5q+cSaLMMhPLw3pTZFdbXTLdhJTKYc
 PJUxu1Qufse4ya3gIAeYWRRzpuo5azmESZR4YENkl4cf4hcivA9YR6QMH1dq/cWvyzjGftA7T3S
 75dI9tsZQAqq6RIFk5Q==
X-Proofpoint-ORIG-GUID: 4WesF-U4bn3KRx7ewVE5IHTCzbW5HdW9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_05,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070189
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-117400-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:sre@kernel.org,m:hansg@kernel.org,m:ilpo.jarvinen@linux.intel.com,m:linux@roeck-us.net,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:bryan.odonoghue@linaro.org,m:platform-driver-x86@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-hwmon@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:neil.armstrong@linaro.org,m:gaurav.kohli@oss.qualcomm.com,m:manaf.pallikunhi@oss.qualcomm.com,m:priyansh.jain@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER(0.00)[daniel.lezcano@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[daniel.lezcano@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linaro.org:email,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 787EA71F2A2

The Lenovo ThinkPad T14s embedded controller exposes several platform
temperature sensors that are already used by the firmware for thermal
management.

Expose the EC as a thermal sensor provider and describe the keyboard
skin and charging circuitry sensors as thermal zones in the device
tree.

The keyboard thermal zone defines passive and hot trip points, while
the charging thermal zone also associates a cooling map with the CPU
clusters, allowing the generic thermal framework to apply CPU
throttling when the charging circuitry temperature exceeds the passive
threshold.

This integrates the EC temperature sensors with the Linux thermal
framework and enables platform thermal management using standard
thermal zone definitions.

The EC protocol currently does not provide a mechanism to program trip
points from Linux. Consequently, the thermal zones rely on periodic
polling to detect threshold crossings.

Using the charging circuitry temperature for thermal mitigation provides
a conservative approximation of the platform thermal state and prevents
the platform from reaching critical temperatures under sustained heavy
CPU load.

Without this change the platform reaches a critical thermal condition
and resets under heavy load.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on T14s OLED
Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
 .../qcom/x1e78100-lenovo-thinkpad-t14s.dtsi   | 67 ++++++++++++++++++-
 1 file changed, 66 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
index 5d49df41be02..ed5ba3a428a8 100644
--- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
@@ -979,7 +979,7 @@ &i2c6 {
 
 	status = "okay";
 
-	embedded-controller@28 {
+	ec: embedded-controller@28 {
 		compatible = "lenovo,thinkpad-t14s-ec";
 		reg = <0x28>;
 
@@ -988,6 +988,8 @@ embedded-controller@28 {
 		pinctrl-0 = <&ec_int_n_default>;
 		pinctrl-names = "default";
 
+		#thermal-sensor-cells = <1>;
+
 		wakeup-source;
 	};
 };
@@ -1729,3 +1731,66 @@ &usb_mp_qmpphy1 {
 
 	status = "okay";
 };
+
+&thermal_zones {
+	ec-keyboard-thermal {
+		polling-delay = <5000>;
+		polling-delay-passive = <1000>;
+
+		thermal-sensors = <&ec 1>;
+
+		trips {
+			trip-point0 {
+				temperature = <55000>;
+				hysteresis = <2000>;
+				type = "passive";
+			};
+
+			trip-point1 {
+				temperature = <62000>;
+				hysteresis = <0>;
+				type = "hot";
+			};
+		};
+	};
+
+	ec-charging-thermal {
+		/* EC trip points cannot yet be programmed. */
+		polling-delay = <5000>;
+		polling-delay-passive = <2000>;
+
+		thermal-sensors = <&ec 3>;
+
+		trips {
+			ec_charging_psv0: trip-point0 {
+				temperature = <55000>;
+				hysteresis = <0>;
+				type = "passive";
+			};
+
+			ec_charging_alrt0: trip-point1 {
+				temperature = <63000>;
+				hysteresis = <0>;
+				type = "hot";
+			};
+		};
+
+		cooling-maps {
+			map0 {
+				trip = <&ec_charging_psv0>;
+				cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						 <&cpu4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						 <&cpu5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						 <&cpu6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						 <&cpu7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						 <&cpu8 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						 <&cpu9 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						 <&cpu10 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						 <&cpu11 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+			};
+		};
+	};
+};
-- 
2.53.0


