Return-Path: <linux-arm-msm+bounces-96358-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KEUGBVUvr2lzPQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96358-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 21:36:37 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F023240E96
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 21:36:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 60753311608C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 20:33:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55EEC36CDE3;
	Mon,  9 Mar 2026 20:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kvlMvyGV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iDNRueHp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2F3841C2FB
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Mar 2026 20:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773088430; cv=none; b=O57hXXXE7p2krbw4rS1CwYrkP8ZB3Sxrp9yXiHYQvE1om6IrEVsajwyC5ZmvQnpbc8FjB2pga41nX6y147jq1ixY/VGklglR7iHIZ5NXoRO56eVhlVgeU26L9KfQT1wnqSg8ixOAbjxa+yIBePTM/wttyJiJJrp8NdEeRMTmogw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773088430; c=relaxed/simple;
	bh=iR9FBVRNdBPKUJuF0gdJRHocxr70Pd+iL3Ur6tNvyx8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=I1sw3lXNJdPSssDJTZxvYXIJtzga5BuKQ/8E3CP9Y0/Bn33dr2VfNjEunGRk+wHf4I+IJbmHGqKg6cTOaSF88z0H8AekzGnuWgVzbMc88078GqpMUO8CXDsnMWIrmtrq4Yam81gSXAY9ylVV6r5ks18sopZGuYitsQ34Fcl5+w0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kvlMvyGV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iDNRueHp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629HCfK63281674
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Mar 2026 20:33:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=6aSf9RIHhE0
	ux1aAmM2DjF7m6jzh28AeMG4simH1BJ0=; b=kvlMvyGVnIOq2Nbqz48K1o+SloW
	5bN4LqbAhvHIayeWjrUzduAq7bl+Pz5sa2QX4PbefpArctiPI+nArD1jpgjD75QG
	6u27c8hEWsTJPgaI3+UEgUDQIwlBYSkZX8WgO9UDJCnglXOTEqoRPxzFGVUOdefm
	LC4tMrKgr+JLaXzPFhC1v8UJKXyr8QeeRiqwi5McBfGj1wA11wKvgGFrSqVgAH4j
	qyHohRHVGxAFSg4SVrpIfaaQ5SdLSmz/wcDpTmwQz3aidZ8GHxvP6i7tAokKDeOB
	lzldC75OhdApJeF357E4ZE1UhlUevWeBGUL77SJ7tY7JM1LYKKN3aasTokQ==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csqcyb50p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 20:33:48 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7d7438fc7f0so6393895a34.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 13:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773088427; x=1773693227; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6aSf9RIHhE0ux1aAmM2DjF7m6jzh28AeMG4simH1BJ0=;
        b=iDNRueHp49/krD9OgsUK5Pd6sDh0swG+xfpl2agIbFA5m2H70QKaOqEolX3c00uwe8
         hhFbykPG4OUJ6RF6DQGmFOO8+iAWyh0/XPEyKsg/xXsoWyFSZj2pKMHmcCulD4kOqQNy
         B6zFsVMn0LAj/yOfiivtooKwlQutskUwXXQaITJKSvpHnWE9pxRjhySjS5N786CcmRiD
         Jl0cl917pZtkzDyE3BtGiS49o83IBnwbngwZ7FHjPxfkXQrAH5vgMER8V7gbiILUrWvD
         v0wupt3r2XeZfBvfQQhn0QNkSWICKP0bY1n96ro+yIdxk+lIHkXxnjBMr3kCLSFF8ILK
         gPIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773088427; x=1773693227;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6aSf9RIHhE0ux1aAmM2DjF7m6jzh28AeMG4simH1BJ0=;
        b=bUDXVDTKSux9Te6o/oz3I9fCegucRH9MguQpyOMlP5ygoDOjTXgIE54KEWpg7aVWu5
         sJTDq5DPSRAvz4mDZJ8T9LD8lttylZsslsG+9dU0uQrj7WhHy8QX97WFAPTj80eAt16P
         j5wkAHNSih1kiycJvgz0P7SDryHFPuIx6bG52Q6paR53mJRCNd5xFZ/ASfWudS40HR3c
         xdQaBvDVtYAwHE1I08fOIExxUxy/GlkjG9xe9/Bl/FxntDgC5mW+6I93TK+yaeZFbn0f
         iIErp4Ik4W6a4zI+e6ePcjCLGCLS8dU8G8xKw25wWfd/ymk/qlxvF/lBVvMSbAFj3GL2
         nj5w==
X-Gm-Message-State: AOJu0YwV8fBnQYFIHxt5mf18R6yBGZ1KQxMhSiPsfV6BK161qBlGVYlL
	0VauUF910H92nXO/AMaEH1z2LTPPeyRPu7kTJwo+YRnYv20j6syGR0Jh5/phYZjczaOrDSRyzhl
	s9IEmLABS3ncf+jxSSa/vevsKSYw5rlRpgs4uDAT86T+M6/vxSk4zJnds9+xNf7Xz5LWP
X-Gm-Gg: ATEYQzyjeeB9RtmX1CmilE5L+pvrGgAagYWbBxniMCMd9RgKVLlisYEBh75Ji00e+yd
	HPtn5/C5MieZDXT2nwED21SdazGot/ON0dyZxqh1ke9z7wSdkgrDRQe6M1WJTi9oaYvOdiPeq3Y
	5C56BS5h3aDHkP1TgEzK7bgWuIqyQnYs/gu/gS6cJi06a6rJRjHOoYhAT7Mq1MOpmMlhIgySmIH
	bChgSt6RQyyKZmnLc85Fu/2SlETXLu9TOLZLyfRuKqbjB6vA8bUx/kxtDFDS3t8FcHb4JeoQe9O
	BmG7rK0i7i5pMJeGU/w+W1kNkHW30r4saNPjsTgiG0NuE51GuDMjEuI5gZUf8KhwTOuBH2lZQYs
	aX88PT/CO98wZoVg0dQC97gKS6EMOM/8G/UxXL9Q8BjSmlYgVRFGMa06W1L90CYeDl+ZjsCRRya
	g=
X-Received: by 2002:a05:6830:411d:b0:7d7:4639:440d with SMTP id 46e09a7af769-7d7463947damr3864444a34.6.1773088427357;
        Mon, 09 Mar 2026 13:33:47 -0700 (PDT)
X-Received: by 2002:a05:6830:411d:b0:7d7:4639:440d with SMTP id 46e09a7af769-7d7463947damr3864414a34.6.1773088426862;
        Mon, 09 Mar 2026 13:33:46 -0700 (PDT)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d74885b5a4sm3036494a34.23.2026.03.09.13.33.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 13:33:46 -0700 (PDT)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH RFC v3 06/10] usb: misc: qcom_eud: fix virtual attach/detach event handling
Date: Mon,  9 Mar 2026 13:33:33 -0700
Message-Id: <20260309203337.803986-7-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260309203337.803986-1-elson.serrao@oss.qualcomm.com>
References: <20260309203337.803986-1-elson.serrao@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDE4MiBTYWx0ZWRfX9quiZDoJL6MQ
 IfawuJsYDNGR3dJHjViKONFMgDOW+/y7QgsDkveGQB/mK6ttfTv4jJTbhN+0Zw2HzdquloeHb7Y
 lJIm1jTbEzoGd3qTSghvMKPZokjFwQEetcMZr5sslJJ549Km/BtlnnC3nNk7JDqaPWFYBHX8bZD
 9kD73rjs0dvzbHo44dA9Ocs02SgeAbhQKbY2YGQB6at2/QOUiBg0CCAab3vpHFfJJ8b18X+C31/
 +IagHhalyrIPvtMFtCJGIGph77Fc+l8O7NN26/3dfK84zn/JEbJTEh6dndh4geaT8QbD1qEEltn
 Lbfma6jVF2NH2/jMorpFRy2ta3j6+EiV5cm+67KinCFgYqR43DymiM+emDUigkOb1IcEtRaFQSv
 sGOXtiggPdCCfarCtfAL5uSv803rgcNPUu6z6EGRM0q3qGT63nvDwBqIG1Z4J72RquB8MLfAzz8
 zNDnOF5xKJYEfB6SA6w==
X-Authority-Analysis: v=2.4 cv=QJtlhwLL c=1 sm=1 tr=0 ts=69af2eac cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=oDIJ3hVRoRHbvujwG_AA:9 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-ORIG-GUID: DX7K4HR1fB-KRg604A8zFVzOAsTFn1pM
X-Proofpoint-GUID: DX7K4HR1fB-KRg604A8zFVzOAsTFn1pM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_05,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603090182
X-Rspamd-Queue-Id: 6F023240E96
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[elson.serrao@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96358-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

EUD provides virtual USB attach/detach events to simulate cable
plug/unplug while maintaining the physical debug connection. However,
the current implementation incorrectly sets the USB role to HOST on
virtual detach, which doesn't represent the disconnected state.

Fix the virtual detach handling by setting the USB role to NONE
instead of HOST, correctly representing the disconnected state.

Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
---
 drivers/usb/misc/qcom_eud.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
index 4fd08962d4fb..3a71a0d27b5e 100644
--- a/drivers/usb/misc/qcom_eud.c
+++ b/drivers/usb/misc/qcom_eud.c
@@ -280,10 +280,26 @@ static irqreturn_t handle_eud_irq_thread(int irq, void *data)
 	struct eud_chip *chip = data;
 	int ret;
 
+	/*
+	 * EUD virtual attach/detach event handling for low power debugging:
+	 *
+	 * When EUD is enabled in debug mode, the device remains physically
+	 * connected to the PC throughout the debug session, keeping the USB
+	 * controller active. This prevents testing of low power scenarios that
+	 * require USB disconnection.
+	 *
+	 * EUD solves this by providing virtual USB attach/detach events while
+	 * maintaining the physical connection. These events are triggered from
+	 * the Host PC via the enumerated EUD control interface and delivered
+	 * to the EUD driver as interrupts.
+	 *
+	 * These notifications are forwarded to the USB controller through role
+	 * switch framework.
+	 */
 	if (chip->usb_attached)
 		ret = usb_role_switch_set_role(chip->role_sw[chip->port_idx], USB_ROLE_DEVICE);
 	else
-		ret = usb_role_switch_set_role(chip->role_sw[chip->port_idx], USB_ROLE_HOST);
+		ret = usb_role_switch_set_role(chip->role_sw[chip->port_idx], USB_ROLE_NONE);
 	if (ret)
 		dev_err(chip->dev, "failed to set role switch\n");
 
-- 
2.34.1


