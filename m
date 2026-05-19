Return-Path: <linux-arm-msm+bounces-108449-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QCzjAKFHDGoMdAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108449-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 13:21:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7283657D700
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 13:21:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 91D023221903
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 10:48:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B46F9369D50;
	Tue, 19 May 2026 10:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m9WSQIdH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VmVcNs9U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6610F369D62
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 10:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779187691; cv=none; b=hgvdBnIhBdwSnjEOJ/gKqc1IR8/DW+m92ZeaApkd2w5Lo0MFtCbjtQKnsAhtDT4sCjHZjDHE66+tzI0tkzXG0w77Ht9acDBatYG9HT0mzKgAymFlLEBa/NfkpNvT3nJP0JN2UJqsHcLUTlyKduY7026K/ssTj/JzyOfXwdcWdqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779187691; c=relaxed/simple;
	bh=HTFphzKYcyqmn4TPcf15E20qAhds1kVEI2UpBTC1iI4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=RZ8RsGSRlNNuF12Hbfo0JK1lu/w4mbMwRzD93wsxOnUW6JJMboihI1js+QJ1eHPBubCB7oRudXTMii4tWJOcqzA5XkHyiDQv6YC6n7e2JJ9dZThMXPfjVy4W11p/6SXCPH1zRIZHpfM4xpLdyDbe5O7IhDPkolyn+pRDF+Sonzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m9WSQIdH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VmVcNs9U; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J5xFbM2438199
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 10:48:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=CyZKwpt9Y9+NnTuv9GtsPF
	s4GVoUYE0pbJay0okUjXE=; b=m9WSQIdHElS2Asr2dxNRl94jGhCtbUdYmgH2Qz
	vlq0OtNxk7guUPUl1besPB0UsX1VpMTaGZF3b/s0Mr2YyXPowNBhLMvgKJxRvLD2
	hMr0f9qxi4yShzKdyYc+JpxRglqJ+LuxjHj9Vl8Wv6qSPKRbcMVho5cuzoUKi/oX
	6lLQNNiqI6WMO3F/TCRVf1hAaYMcVX0sN5bobo0BUQLbuURLXnLRbWz8s+VNWR0x
	57EG/P1qUrvtUWsKJ0lqt58jpYEeSyMg3fm84nN0SUNpzm4MUm27LdOVfUDn0zly
	H7htvOqB3nI4/om2FOM0JhjAHepxqK8cWdXw9mzES3Pglh+w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e834v4m1e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 10:48:09 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5165d10e036so19150731cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 03:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779187689; x=1779792489; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CyZKwpt9Y9+NnTuv9GtsPFs4GVoUYE0pbJay0okUjXE=;
        b=VmVcNs9Ux5Ma0+Wej9T9k+KRJ0kt+xarSA+Pybup0pQO9oYyB6uoJ7+boPJRTQ7tnB
         +ykrX9ZKNFa9do8Uvadn7t3EH8P+3oxHGQRlbaekaVgS+e13O4LmgEU9KT3AeWPJnBU2
         AsOnOKmFQBcQALFsgsZTUiWi9AAirWhqjo2OJuiK8MNotYZBPCD6XXck+n+NPBjnw84d
         xN/+FM5AyGlueFQN3i2vr7dBaKJkr41RMEehWUQQhktEPzDzaQySfsvuz+vmonn9fvSF
         in+9Gw9Wb9I09mD9dC7Rz+qjsgxktolRFzlUHviRKUPRuuEQGAepgZF3zs0r7AL2OJtv
         JYGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779187689; x=1779792489;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CyZKwpt9Y9+NnTuv9GtsPFs4GVoUYE0pbJay0okUjXE=;
        b=PXLt90nnzM/NHrYNWKyjrJ8aoUpbsgGRcwvBl/2E8cBOqYvDLb0VGuozhIKxXwn3kV
         FxxTbDHTSPawTN+l9L/4mIRwOEQh43ZomBAE5UlDqTTYTn/ZxAd9qDzy3raYLdkVDrVk
         M/txSY48BbFDIy56W+/LD5I7AUva5FscxPv5/3wY5qbrUbaK65/dA/8nWNbKU6ukNGrj
         xEm//oYVvBMn6Ca/uE1mwBfM/kRWuvxZowrwi695EShoolcwS3wB6fdGq9L8cW3yoA4P
         JIoNOATbMqbjUChrWy022dU8VJQnJGWp7LKBFaVHCGJCRINAisaOQQ6cyJeOwFVpgW3H
         ti4w==
X-Gm-Message-State: AOJu0YwRQk/yFEGCHOxEucqMafda38v1AQYok3gHFcAvSXWni6PN8/1T
	zoenK1KWo9BbCcaTTIgpAau0DkrHjzHdcMHnk7046eI3PdqcSkC6WINwjYumL/xIXDJIkfqC2tM
	i/UuMhwLFLyeBA5WRz+BKC8AkRVvVH8L+j+B0py9IHZov2gjS/XoDWVNUds1fDFAiCzFp
X-Gm-Gg: Acq92OFxrvUROa4XLch7N034SceytOxmYBYRjTqvSjvDXX2Y0R1ABXTkP3ImAPojVff
	P5HcTNR+UEgztA4iR//+vAWJdipMIpWE+yWc7Q/I13u2TyiDK6lPWqtwD83jo5c5KCTLGlsE9nk
	ALThPPob87H4WM3NiOl2BRFYVBHlkzlexOh6m/vYagJdG9nGikC1cEOTulCn/m28HtdrkonlXwN
	R2iyX8mYpj80wFSYC6EEpB7IJ8f7idmxtfiTi/qb47+zAqD+/rp8kkxhXu1T37MTQ63co43EPsT
	U2UW4fa+fzUMmWt0SvOoXnxBpS68LpLE8UbVOs51zyq2FVr57mn210BZgIGbU+RzHXlgvCKHwZ8
	LxymHpQZd0e5IdQlzeg9UEWohiF4cQxAXuMEYBA94jC20a1yrhNYdZaYA3AEBotGnPKY2IKcbSq
	CYYH1pumbw64BnZkMJmXjJR7JUk42s3rhtqp0=
X-Received: by 2002:a05:622a:43:b0:50e:89e9:2728 with SMTP id d75a77b69052e-5165a0b79d5mr279501061cf.19.1779187688847;
        Tue, 19 May 2026 03:48:08 -0700 (PDT)
X-Received: by 2002:a05:622a:43:b0:50e:89e9:2728 with SMTP id d75a77b69052e-5165a0b79d5mr279500741cf.19.1779187688443;
        Tue, 19 May 2026 03:48:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f11a59dsm4031413e87.25.2026.05.19.03.48.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 03:48:07 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 0/6] usb: typec: tcpm: qcom: use connector to specify VBUS
 regulator.
Date: Tue, 19 May 2026 13:48:02 +0300
Message-Id: <20260519-fix-tcpm-vbus-v1-0-14754695282d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOI/DGoC/yXM3QpAQBCG4VvRHJuyK4pbkYP9GYzy0w5Scu8Wh
 09933uBUGASqJMLAh0svMwRKk3ADWbuCdlHg850mRWqwo5P3Nw64WF3QWOsJ626PK88xM8aKA6
 +XtP+lt2O5LY3Avf9ADcpwiFxAAAA
X-Change-ID: 20260519-fix-tcpm-vbus-aabde21f339d
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2198;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=HTFphzKYcyqmn4TPcf15E20qAhds1kVEI2UpBTC1iI4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqDD/ljlj4J8id9tElx6rkqM/ipS18iQoplvyEE
 YZoaUcNrU+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagw/5QAKCRCLPIo+Aiko
 1W6UB/9VjWFxICZyxepRSIazpJtcoQyVkejqs6Iw8pLkBiivsPOAsZJZcd5VdenoWTxvq/4ODe6
 Uw2Od3C1dTtVvn/IPTn1zS7FTbaWkHZiCdonnZm2qCTvexbuAu9PNOt5xOK43DLANCxnCGf4Ta6
 bIuuWIWUJy0ygMon6SyRLlcS08vP265M9Hpyo8xvAhk2URb5NwdCeeuwe4gVBnnMp4st4oLVdyi
 4tXjy8EToy9qkW9LkF6cT/s+rvvanZi5hjOQ64UNI/HUVDvw/csoObJkkwWn2IKRJw9mjU9kKON
 Ie9edwKQ1xqykSarjzjITx8J2XK1GthgKGWDR4Ha/U4o5pt1
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=F9ZnsKhN c=1 sm=1 tr=0 ts=6a0c3fe9 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=YnsYcYk5mXc5G7qeyjcA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: a_IX8Sf8TeAW-oylr0yDuMD-wmofMZte
X-Proofpoint-GUID: a_IX8Sf8TeAW-oylr0yDuMD-wmofMZte
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDEwNiBTYWx0ZWRfX9nzicuJcjlWl
 lbdaohJB57NgSzvrwX4E5GVAf88Tyi6O2UQc4EPrilsULEFHYCCj3/pXZddG0jz18NGzp8rRtO5
 r/lt8hijXMzpPk6ZJbztcHxSUaBv61BrcttezWMQuW8Pc9a6NOFHSybY+MLJ3PFN6bm33xSU3dg
 GN1to/LFsG40RJ/jkLAzfqedYRkFYYs6mA2WgRix5ntdj2qM+BVkpETIJJH23j1oF+WgN+KYYHK
 oUDFyeZg8AfUTOGwX4elChxjwwPD6nRZDJ6ppjdMBBB7vPaze4v/c8+TM4L5xpDfXIj0sGpRJHk
 poaOvR5Wnc87BQv7Ae8dUwYTIBA5grYL7kMmaZ6uIm2bV/hTJ+dIiCWi8wFlPWnJJvQvaXE9N0h
 UeO6ee6WUvhbtwdF8d67eYlA3yhf7olE02omOUo0PD1qEpvcU3Qak9AuJfFqqR/swePh2MGj/hP
 tPnLD+PEPZkpGTRD18A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 suspectscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605190106
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108449-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[linaro.org,linuxfoundation.org,kernel.org,linux.intel.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7283657D700
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Qualcomm PMIC Type-C devices historically provided their own way of
specifying the VBUS regulator, via the device's vdd-vbus-supply node.
This is not ideal as the VBUS is supplied to the connector and not to
the Type-C block in the PMIC. In theory hardware can use different
regulators for VBUS, so specifying it in the PMIC DTSI is not correct.
Deprecate this property in favour of the standard way of specifying it
(via the connector's vbus-supply property).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Dmitry Baryshkov (6):
      dt-bindings: usb: qcom,pmic-typec: deprecate device-specific VBUS
      usb: typec: tcpm: qcom: prefer VBUS supply from the connector node
      arm64: dts: qcom: pm4125: move vdd-vbus-supply to connector nodes
      arm64: dts: qcom: pm7250b: move vdd-vbus-supply to connector nodes
      arm64: dts: qcom: pm8150b: move vdd-vbus-supply to connector nodes
      arm64: dts: qcom: pmi632: move vdd-vbus-supply to connector nodes

 Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml |  4 ++--
 arch/arm64/boot/dts/qcom/pm4125.dtsi                       |  1 -
 arch/arm64/boot/dts/qcom/pm7250b.dtsi                      |  1 -
 arch/arm64/boot/dts/qcom/pm8150b.dtsi                      |  1 -
 arch/arm64/boot/dts/qcom/pmi632.dtsi                       |  1 -
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts                   |  2 ++
 arch/arm64/boot/dts/qcom/qrb4210-rb2.dts                   |  2 ++
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts                   |  2 ++
 arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts          |  2 ++
 arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts            |  2 ++
 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts          |  2 ++
 arch/arm64/boot/dts/qcom/sm8150-hdk.dts                    |  2 ++
 arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi   |  2 ++
 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c         | 12 +++++++++++-
 14 files changed, 29 insertions(+), 7 deletions(-)
---
base-commit: 80dd246accce631c328ea43294e53b2b2dd2aa32
change-id: 20260519-fix-tcpm-vbus-aabde21f339d

Best regards,
--  
With best wishes
Dmitry


