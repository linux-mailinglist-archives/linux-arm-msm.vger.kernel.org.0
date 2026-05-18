Return-Path: <linux-arm-msm+bounces-108176-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eAamMET1CmpZ+QQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108176-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 13:17:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6622656B63E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 13:17:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CA28B301435B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 11:16:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B34B93F5BCA;
	Mon, 18 May 2026 11:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JBY+pvsT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J/2Ns37S"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B973915665C
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 11:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779103002; cv=none; b=CG/wN4BcNEHxw2sy6aYB//ebCpzvyvERumdGDh11wvuUOTzxkaibz1LK0aj03U0WmvLOfvtz23PGMynALDILOe5gmjQ6qP6zuvFtzNS1uUlhiD6cCL7C6WyFEcBd72Ymn/r4T+YY1KQ0hEgW1A6+n1NVsOEyh6LnwWjaYiSLWzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779103002; c=relaxed/simple;
	bh=MWg/nLWkhyUVa0mtN8ECSXnZ9iF3BnMHKiVrK+2x1s4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=oGx/hjx5BjDM9yb+NwtRz1TnOfqOjJxLjv50A9oD9WKYRS7rSD1Sy0mr9fYUI6ufnBoxp6IBpu0dp3tQHyIFk//EKgI+knvi8sBAqWWoZFOS2LQ4/qvIX/JpLL+JivyxofJQlsi/xBPmZPbGbeWqPn1xuz1NkjIBa6MJTBwN20I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JBY+pvsT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J/2Ns37S; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64IApApM2083455
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 11:16:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ypXJeOo1Vsw3XPBod+p9NB
	io0CYVmgBXGsE+ri86JNw=; b=JBY+pvsTz3GcvNUzJcVIG3a0A/Mn9kI9NmloQY
	aL45Xczkaz8IWgFY/xD9U+a+Rtd1896f+Ypb+/da5bgvC5N0gwYRIafpDNCbueYJ
	bWEI7AvbplKTOkqLvc88ZsHf3MfW1KMJHIkgpMyStGzv/aarBzWzBXFimpaLkbXc
	U1JwVkS818F1MvFOqlrxLuE2EJPZb64mt7GVc1+8im4rXnmoxD/hThTrKMFRWaAG
	dyDvFd78p6RBTBCw+QVkY+pT0JV6iSrW6Z81Fn6Ndw/FgCcv1sdTQ4y3kUBPATTN
	aMqm47lzlXHkC2aaLS0ap4Sb/xjEn3asW26yaRb99LvZ94Nw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e81ch83c5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 11:16:24 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2f3ec2e8d07so7897068eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 04:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779102983; x=1779707783; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ypXJeOo1Vsw3XPBod+p9NBio0CYVmgBXGsE+ri86JNw=;
        b=J/2Ns37STHfi6Uem0Xt5+FQ6JDb7OCtzkP8zK8riDsJbzDry3yYEXfNh+4wmK2F0Hd
         4VJTWmkK863dDt7oikzwoRC05Y83cDLbvbDLHrYlTuNvwlzbxs/dlwx99Q2psglb+aeS
         xaYlYKusMPps6mq92gi3jhs8QoYUi+6PpJ8Dd582iTBX33aByOD7vgPOJPEBE0bteysk
         h5RBPZoTekeycXNlavYz+VgmjQJWd1l5apgWEkZoLGvs33jfwyRtPfLAuVnK/xQd8AK0
         p2VPkGQPKkXFgrlVhboyNZrCfcY8a7x09KM/C9oP8vw8RPjbjRr3RlOcVhLbih2wpHVK
         fNEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779102983; x=1779707783;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ypXJeOo1Vsw3XPBod+p9NBio0CYVmgBXGsE+ri86JNw=;
        b=sCLTXIrWBw3WdMXOari3fZjZujxFE/ZXJmBxCjQna98/Bm1J74XLCCpsla9HlM9So5
         srTOaz+LaG0UibPlQ/5D7RwmfqfreUacdfDImydD8mNxS3Fo0dejEoUfD9xIVGXzL3dg
         FxM3FWp2kCqpSD/16fB97QS1AZr2hmsc+jR9kmFZ/7KUix/uQStOrR0cJ7pyuEqRoIg8
         7XEMC3umYMAqYkasxyG8Fj95LTml2n89JfDKp2MmNI1+RIsiqXflL3h/ESQygb8BWwMc
         TZrGDkEXfHor9iqtBggAvQ/SGLa66vsDLwVIsvmxW+AZlJg8ba5C3IKiuS+ZjEETdqtf
         CsOA==
X-Forwarded-Encrypted: i=1; AFNElJ/KdXA6Z/plypKgjhJ3xP92ktWGp59ciaJeYVBreD02Ac7d0Cqgz46j9orMGS5z/vyQSq7LVhubsKLe8tpy@vger.kernel.org
X-Gm-Message-State: AOJu0YwFPaP+dwB5oP0UUVcQKB/5dnRjV+VUk29tnK7o7iTnPOELj/sI
	gmA0wSUGUHph12g1Cv503Vybqr9pEt4ZrE2l/iZbWzWFNcwgEU0hxrG/rqD1c8BKvvH5yeE88t2
	ZFYfzClW9cGjJf6TdumqfgiVDNUlTMRE6zagf1yN338el3BoiLeqNcq6Ga0lfCEooMqA8
X-Gm-Gg: Acq92OFipj2I8gSZyYU4q7dhNqqjkqmNp+pU2l2e0bc+tQzw+Es7RHabyeKzr7hJWU6
	y8MAAgdgkluSB2LKlPWCHgPrI2Qs7Ru66Iq+DeHKqNGDLsk7PkeMu1rZwTrldhts5nZuTpJh35p
	LA5vNaj/NdOyQPR8YNu7pPA0AzfOkccyrBkBiDGLpCC8ISkvx6+HAPq7RXhLvNesl2AujEajmLD
	eFlQ2JmENjvjnzZ60tF/ZzK7KC+Ftejv1ZvSeOTt6PS7JwuTUgOPEDYeYOYLCi3ufdELK6fezDI
	4rzw1ZGMImB3RMYjkSZdZOYdss+vl0+5g4wOio2hlcqHhVTNf1UDmgCehay2FNZAHfkac2LtaoX
	fB9PF9VuD56FIKJHDQRKjccme72Li0N3shpgJYCsJw0ZkDRvvKjryoQdzpyzYrmi2S1kRZGAZM6
	X7qPbAAel3mg==
X-Received: by 2002:a05:7300:3722:b0:2c7:287:6740 with SMTP id 5a478bee46e88-30398659f10mr7363913eec.28.1779102983100;
        Mon, 18 May 2026 04:16:23 -0700 (PDT)
X-Received: by 2002:a05:7300:3722:b0:2c7:287:6740 with SMTP id 5a478bee46e88-30398659f10mr7363891eec.28.1779102982478;
        Mon, 18 May 2026 04:16:22 -0700 (PDT)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30294500a97sm15446058eec.9.2026.05.18.04.16.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 04:16:22 -0700 (PDT)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Date: Mon, 18 May 2026 04:16:17 -0700
Subject: [PATCH] arm64: dts: qcom: glymur: Fix unit-address mismatch for
 spmi_bus2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260518-glymur-fix-spmi-bus2-unit-addr-v1-1-27d6edca51e8@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAD1CmoC/x2NQQqDMBAAvyJ77kISUIJfKT2kyaoLmobdRlrEv
 xs8DgwzBygJk8LYHSC0s/InN7CPDuIS8kzIqTE44wbTW4/z+t+q4MQ/1LIxvqs6rJm/GFIS9L2
 xPhobfRygRYpQU+/B83WeFxHu8rFwAAAA
X-Change-ID: 20260518-glymur-fix-spmi-bus2-unit-addr-85018c01c8c6
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
Cc: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779102981; l=1131;
 i=gopikrishna.garmidi@oss.qualcomm.com; s=20260102;
 h=from:subject:message-id; bh=MWg/nLWkhyUVa0mtN8ECSXnZ9iF3BnMHKiVrK+2x1s4=;
 b=0ynt2AeRB97WrLpwY+h4mSnykOI4nJ7fWuvp7lcBo/SyuUahv78ddWhn9J8eeH82yOXWA9vWn
 zXPsek0n57vBqbAW5YQYSwiQkVMXJ89mA/RXkZXB2Dt3Sg87EsSc15P
X-Developer-Key: i=gopikrishna.garmidi@oss.qualcomm.com; a=ed25519;
 pk=TkSjNEhrfsj90i3wkABTZtAjLNr2cfYsujaTvyOIDsE=
X-Authority-Analysis: v=2.4 cv=a4MAM0SF c=1 sm=1 tr=0 ts=6a0af508 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=8dCvXH1CdltW1_umN4QA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDEwOCBTYWx0ZWRfXx9t3EeXF8EZ5
 wfygdh6Qt0yucFe9CGJU5xNBlNKlM+brZby5HcrL7g6sJyLpZYLwn1CJg7EVg+AGHK+CTg+Drkl
 1261k4LXl8M8mJukJOZk+CcQQdo9MJxDQQEBkhkxDapu6HqFtLXsUhylLqRddctEBa8LO3FNDh9
 3VfF5ABHfN6ruh+qMY5EAVE+gLJBztuy2sDgV4I64eqa7BSrIaxvkX3rnOqEvCJDD4Cr2wLBzyR
 noTFCeT+qjbTUg3p7m9BN8gnKAVByV/QmMhr4VwC9x6fv0YXMpvIVQoSH8KzhqSmRbh06d0TWXO
 wERDroLmtwC7O6X4d0XltxuWj/5NBh7DSny5aFolB/A+xO7PDK7dVnhq9SnJ/aF4q4UvZxUl+zU
 6o/fWJL4TEUr2VtLMhYh0lYDA/h2tK288HJ7LflKP2hXWQrbFqOHfKk+WnSA+kJuXBbrLoXJB8/
 01DCig+WSnu9LIfDcPQ==
X-Proofpoint-ORIG-GUID: PU-XjSZ74K4uNARbmvPw6pOj4mlMiolh
X-Proofpoint-GUID: PU-XjSZ74K4uNARbmvPw6pOj4mlMiolh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_02,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 suspectscore=0 spamscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180108
X-Rspamd-Queue-Id: 6622656B63E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	TAGGED_FROM(0.00)[bounces-108176-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,c48000:email,c448000:email,c437000:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gopikrishna.garmidi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

The spmi_bus2 node was named spmi@c48000, but its reg property
specifies the base address as 0x0c448000. Fix the node name to
spmi@c448000 to match the actual register base address.

Fixes: 41b6e8db400c ("arm64: dts: qcom: Introduce Glymur base dtsi")
Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 0c5cb8532b20..849e66a33845 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -4814,7 +4814,7 @@ spmi_bus1: spmi@c437000 {
 				#size-cells = <0>;
 			};
 
-			spmi_bus2: spmi@c48000 {
+			spmi_bus2: spmi@c448000 {
 				reg = <0x0 0x0c448000 0x0 0x4000>,
 				      <0x0 0x0c8e0000 0x0 0x10000>,
 				      <0x0 0x0c44c000 0x0 0x8000>;

---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260518-glymur-fix-spmi-bus2-unit-addr-85018c01c8c6

Best regards,
-- 
Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>


