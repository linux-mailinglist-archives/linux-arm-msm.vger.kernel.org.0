Return-Path: <linux-arm-msm+bounces-109421-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2JSxDhC2EGohcwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109421-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 22:01:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F1085B9D41
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 22:01:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 36E9130433CE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 19:56:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BECB337F73B;
	Fri, 22 May 2026 19:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X/dTrkT4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jWcWXI+3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4369937E301
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 19:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779479771; cv=none; b=uXtEAWdMyzd5E5a1vC9fPjChV96REK48TDzCFm2j8h1CRRZ28M48a6ar0jEajI8sFF/PzM2D8pv5g7Z+h2LMF0zVr25rmROiq8wti24juCrnXhKMZsqTKCIKniNpcQqTQB4smcn0CAjtDzDD2aRmQJ8dTj3Y0G7ByG1EK76llwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779479771; c=relaxed/simple;
	bh=kBN22TMc/7vjGOVvI692Rr+gDEl0kHxa64ZiwZ8tVD0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oWyCS7YwVyVR0qqXkcVS7y4tOrRjNlI6B8kGiFjIXvQTkre1MKOvwf4Fd2fYPQyqlOPO+NtBaOE+WWx3ISv6iJKFLQo03mY4WOXZOgVe1fe56A+q6sR7enyrYk9fEnL1GQmA/v8R473OI0rgC1Q3tP1Q+YaWqtyArTu8kNauZws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X/dTrkT4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jWcWXI+3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MG0cIX3476974
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 19:56:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6Kju7bnElF3xvJvgZGFgnbL70Z6TnXx86KxMilu6Zsw=; b=X/dTrkT46pEQ9YzA
	8LnwYWHQ6qxmHR/pt3KCRzIdDVQqL3jKv9VML9FagZR2JK6rqi8z4GNOGsZgUDrr
	wFFJ1Yg1BFlzCewIsrAFRd9W2ibNZ4eNW8Em0RUw3UDwVT10KQLDTMAdC+41cTeP
	oAEJLdzCuxPxjZmw+Eu1vjNexrfMaIrKuanQNfRd8TvuBo8FXQ0FoQUvn+669SCn
	M46M7cqa1cXsRGEPs/6rweY2q1KVMh8dIGhI+bY9s6NTWN8mtRghDUrlKfRy/Oob
	K8ExnvlKCYcCp3PwiaSpMbY6ELjGfSs1pJcXhSZWwGqMZ2fTIxat59HSfPW3km5+
	kj1Fog==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eat9r8tam-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 19:56:09 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ba3245a43dso82388675ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 12:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779479769; x=1780084569; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6Kju7bnElF3xvJvgZGFgnbL70Z6TnXx86KxMilu6Zsw=;
        b=jWcWXI+35C5cub/nMxaZTBJt5SE+44NCr66VOcAX4pOXeF/+CnSRrgz7E/6jTtoS84
         /Z51iwZbGxtO+H7P4I9IwmXCPkK47mQUCCfCFwhlsr294dUZDXmFKa5AxPm8y76oNjGA
         +h98v5LjfsogO3VSArrbXzvLYOy1yxAbAqLe8GFl5vCfOPNq+u+F0ll8COXFmdVjJ2bx
         oV+sazehbahmEItxxthqiTFVjjdGfvTw1BPPfkDWqq+QkABxe/HHSArisUlhohWTCdYp
         1nIxmdls6F4UW+bMC1JUn4//6lKwlotrOkSMUjsAoEPLRjw8I0rVXI7XMCBZUA5CWGc0
         WDxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779479769; x=1780084569;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6Kju7bnElF3xvJvgZGFgnbL70Z6TnXx86KxMilu6Zsw=;
        b=NOteI2yPMC/q3nwHD6h4TkxK5mUNxZRzWBuhXMKlYYTZ9196/TF1l+4j8QvHZYwBWy
         Nt32iziRzVfiRvTiylOEvv0B6BjqN3fagOnoaRAH/n5Eh8e5NSRaBAPY3c2H1s4DSAmz
         6UuZh7Yygrmsx3QrrUZvHSP7lwzL4EKp3yC72UUGj9wIiJNhwdkmwrI2G2CLEcL4UIHR
         O7okiEVJARH0iUNLI3PAvSYu8UhW6QjJ+eCk43X8bM8IfE6A4QO8bWUdVly7vo9zD+do
         soPy2rgJdpcqJrkAxFHb4bmhVZdz0fen0dux9DRckZbsIe5IiHhqYezsRpAcBuAF60sE
         AS1g==
X-Gm-Message-State: AOJu0YyVOYFaUbNG52Jm9jvbVOgfW4Vuti9Q2c5funTIhfaGszwQSe5K
	C6Jf04dTjPWLeyCy53woZX+Hx0iCWGoDdEjjcoviwX93GOJOBwbIFSlstzZ3Oxuf/T/4c/6cn9U
	qMUUSWvNybvuWJ2Rh41BTA9Kq2ntC5kktTIvn0hqeqyM7yyVScWqd2psYCYkjOa6lyWtM
X-Gm-Gg: Acq92OFqFDKt68JNtQrP6CGFmOAztfyjtDYJZ3AH4SgXCgNEbpzmulFopF9ehK1vyWP
	VQ5+65xEJ+1EoJlt/TPQarcEYg59Zjr7ORi4DAOLzfmEp/ifKabJOj9bycG+cO/3RoS1oMLlpwl
	KG+WpJ206wWWDfauDZWUsQCj4LzlLQJg42TrP52gxvINbBqXK7NwTkndpYkwtkK0IewI2BcCjpL
	IefeLkaEZl1+ZhZf0S2q6pS2G3fdF2hkVu1EOI79vvyMhZjELvOeXTtH8j5BQo8EURy93Gww9NK
	ZXtlQNJHV5dGcJgjp6g1PfAkVCbyCOyLeu2830Ut+yRGRRn0w4XC1R3ZuuMrrFizEhsme13Hzcd
	Ti146M/XFr8kkl4t61OEAYMCOgj4d36EJKoWr1w==
X-Received: by 2002:a17:903:2350:b0:2bd:eeb6:ff29 with SMTP id d9443c01a7336-2beb0356a13mr55371855ad.12.1779479768609;
        Fri, 22 May 2026 12:56:08 -0700 (PDT)
X-Received: by 2002:a17:903:2350:b0:2bd:eeb6:ff29 with SMTP id d9443c01a7336-2beb0356a13mr55371495ad.12.1779479767939;
        Fri, 22 May 2026 12:56:07 -0700 (PDT)
Received: from [10.213.96.151] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb5914287sm33389355ad.79.2026.05.22.12.56.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 12:56:07 -0700 (PDT)
From: Pradyot Kumar Nayak <pradyot.nayak@oss.qualcomm.com>
Date: Sat, 23 May 2026 01:25:38 +0530
Subject: [PATCH v2 2/2] arm64: dts: glymur-crd: Add reset GPIO to
 touchscreen node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260523-arm64-dts-glymur-crd-add-reset-gpio-to-touchscreen-v2-2-5c333051e5bb@oss.qualcomm.com>
References: <20260523-arm64-dts-glymur-crd-add-reset-gpio-to-touchscreen-v2-0-5c333051e5bb@oss.qualcomm.com>
In-Reply-To: <20260523-arm64-dts-glymur-crd-add-reset-gpio-to-touchscreen-v2-0-5c333051e5bb@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Benjamin Tissoires <bentiss@kernel.org>,
        Jiri Kosina <jikos@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-input@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        20260519-glymur-mahua-common-nodes-v2-1-9f1b89a3f398@oss.qualcomm.com,
        Pradyot Kumar Nayak <pradyot.nayak@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779479752; l=1445;
 i=pradyot.nayak@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=kBN22TMc/7vjGOVvI692Rr+gDEl0kHxa64ZiwZ8tVD0=;
 b=Se1fgTQ+cPubFRcspm9htA5pmfOc9MexQnnUVl6jDuilApJkK4SoVp/iLpI6OISWYJD61eXwM
 XzlpjdRBwFsAzC2HXnu4HSyB9lxDagWgmBQIw48R+Y/XIm9HK7/J5Wt
X-Developer-Key: i=pradyot.nayak@oss.qualcomm.com; a=ed25519;
 pk=ZAwwH8thDSb6bq4dCgFHWr80BqB7MmUAKogkd9BsiXM=
X-Authority-Analysis: v=2.4 cv=dt/rzVg4 c=1 sm=1 tr=0 ts=6a10b4d9 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=lbRSShi60cGz1d_720QA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: A3G7As2dCAwvv2nEXyzN9IrpIZBqZtRe
X-Proofpoint-GUID: A3G7As2dCAwvv2nEXyzN9IrpIZBqZtRe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDE5OCBTYWx0ZWRfX8b9uBwMYedmg
 ndX6C4zEw7eTCrrV3kJxAy3EDZJDlKkpWZ+324Yrs5mcV7JtyrNrGjl5LgmI6g7VTKkO73DWcql
 8yaqpefKXnUh4ZivlC/GkA4wgxLZmQnjxidccW+JVOpHvuVvP04Jqg1MlcyPaXLhW7BF6QIuLoz
 TnV/yZuJ5VFN1Eh/7c3ZgDqXs70D6b9Y/fvhZFQWUGrfO4nMweHOlj7ALzVikeckFDiXctveOkF
 HkQIEmM9nvV/T2l4pA//BmB0HLSB/neP0mc0tnWIwU+6xjyefOZjYyJDgvKXBlwohCOg456nyP2
 vq1jcRsUwP/RnDn/wJ8MXa2QnjpSOvbx7z4hMYR9Xs0P6jdIeinS6BKmMTZITB2TsHTg0GeJoUY
 otYVtgFK4S/9DxN0htB8sD0BSqipFRNLc3Q3dnFHza4QlGh6M7mnxSi7irttN/4Vp7NPoQiskct
 +GpEp2TnyXCg5To4Jkw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_05,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 phishscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220198
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-109421-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,0.0.0.38:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pradyot.nayak@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9F1085B9D41
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The touchscreen module on Glymur/Mahua CRDs is different from the one
used on Hamoa CRDs and requires the reset-gpios to be wired to the device.
Without this in place the reset line will remain permanently asserted
during resume leaving the device offline and causing all I2C transactions
to fail with -ENXIO.

Error Logs:
i2c_hid_of 3-0038: failed to change power setting.
i2c_hid_of 3-0038: PM: dpm_run_callback(): i2c_hid_core_pm_resume [i2c_hid] returns -6
i2c_hid_of 3-0038: PM: failed to resume async: error -6

Add the reset GPIO so the driver can deassert the line on resume,
restoring I2C communication with the device.

Fixes: e6bf559f7eb9 ("arm64: dts: qcom: glymur-crd: Enable keyboard, trackpad and touchscreen")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Pradyot Kumar Nayak <pradyot.nayak@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
index 1de3a49f49e4..2259577b9ae1 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
@@ -623,6 +623,8 @@ touchscreen@38 {
 		vdd-supply = <&vreg_misc_3p3>;
 		vddl-supply = <&vreg_l15b_e0_1p8>;
 
+		reset-gpios = <&tlmm 48 GPIO_ACTIVE_LOW>;
+
 		pinctrl-0 = <&ts0_default>;
 		pinctrl-names = "default";
 	};

-- 
2.43.0


