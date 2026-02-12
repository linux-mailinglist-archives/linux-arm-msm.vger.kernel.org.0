Return-Path: <linux-arm-msm+bounces-92645-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cGWXOGGPjWl54QAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92645-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 09:29:21 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F23012B532
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 09:29:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3BA813142590
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 08:26:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB95F2D2387;
	Thu, 12 Feb 2026 08:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d6IeFB8J";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MGmAV2HO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E335123F424
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 08:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770884770; cv=none; b=VZjEqHg3B6t9DJK1g/A33U6jcCF15j/alLA5EUE7cxEGFU6wclkYBnFH7gsJWVBSOgrML05dff4H6BcWObLaZOAZRfdLKxPSu7kSd3HEYcFRsb86SvplmrlS0FFGWoV45PimPhv8qM+0Aa+xlLf683eNLSZmGJdhpqG498Rjd1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770884770; c=relaxed/simple;
	bh=AdR6PAQkd/glAbRWzZqZs5ZV5zwjk6NoX4PBwfEC2PM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nGzkomRe+9xU6/LMmD+JZzUg2RqTpp8MaE7m7cD+kSFCF6WOXo6QiBf8EsJ8iUHK07m8HHeHTvUZQYAEcz8DfchFJJKqlOr7lgkiLd8r3BB7JlTXCneMJLOofXt7q6juPL8TLgEJ3z485wwIXFxQO9/38TKSL0k4vmRbQ7CIres=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d6IeFB8J; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MGmAV2HO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61C3Rk1n3887956
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 08:26:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=P+L0cVxLmLpyABAqOXlBpx9afMsIvPw+Tl3
	LJrHuND8=; b=d6IeFB8Je9er7jQdATH/QfQyun3o1zeuqV8v4NPkrV62HW170Lu
	dasLOzqCVh9AQt1fQ30fez/whyzZ/vyScLjtgYVVamu91/vGu4qF8Pp7tB6d/A71
	PhIMzI1Qz/cagbCNWPBQ4lxlIAa3Vsqgw5ApwY5r/ERaqF2SC0FicVE+hGWuuUXd
	rNUU4OMDmHjC4JVoQxVNN8+GIqx/9CYykiJkhkha3uwIDDPk6IaCuC6gsj+9VEZh
	CmWsuI9O5oChecaVIYfLZ2xX01wCAWLYl+5OK6A2Mdj8gtaqAo0dcrjGq+q21O9E
	iKr9vmgff2EV6HFGTrMk+0s0JC0yREJuHeQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c90wj9s7g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 08:26:08 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c6e1919fb7bso950002a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 00:26:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770884767; x=1771489567; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=P+L0cVxLmLpyABAqOXlBpx9afMsIvPw+Tl3LJrHuND8=;
        b=MGmAV2HO+9669QcXgnVwLU7Fk5UWK7HPAgKdOB8N3M3CVGOflrx7ZVmgLTEqxoNEBZ
         g3R6vodDoVgCTiuEQPCB7FrKC3CLTGyHS5YqIaLvEcrL8D1NEXpLUZcOYA6z8ipe2BQj
         vVu6vm3wTQWNta0m78qtVIgM/ypBOh2GwrK8v00f7NpMftPmPQsrerMOlM4J2vw0vPrx
         gczlYVaqaJX/DTZgCvMHyTfrX29v3zswZgip02sVn6WB6KAozM+6PiTEdj9eM8exs9UM
         EbbNvrtIx5AeTA2W9bBrLVvw2zlapxdvZZ6u0iIGGjgTmNJLj9HO1zcpaf8nTvYiWiZy
         RDtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770884767; x=1771489567;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P+L0cVxLmLpyABAqOXlBpx9afMsIvPw+Tl3LJrHuND8=;
        b=RpcV59CnHo8zsmjvzmbOMwmU9XJoIhX7eE9xCeiMz6RqiaDQIxnBbtDMvCk/t3eJHt
         9fRes7OGgBOg67lLKQpCuIJXQIfNfFkDHEMmzuFIZBupQswpMTHJZhoXnDMNAM1WYq45
         xMpyLrkntzBhftEIWl2kOrSm3MUiRzb5L/NEA2oun+XpjbWVNWLknC70tB/nk8cH3XXh
         o+bE75O9kBmOslXqTGUZihrH00JLeiDvR9+rBk/gry4WPzqyGzh9me+uPyiG1K1/MSMX
         tABg4RBcUnCL/CDBPT7OArjcyxTQzHxuxbeenWOOnQcGDu8PpilV5WzKXO+MOJfhi46n
         s27g==
X-Gm-Message-State: AOJu0YzKTqLq1m37u5pwsBjupyGkTFEvDIBttwXYl26k8iMxzcjOsCXw
	clGkKuFBqTIkeua2WWy7t7mdXb5MEnRg/A3qZnk32CO+PUwRE2SItyfozSl+o9onVfFQSWTTPxN
	F2m1oUAJ0JtcADHg1uKrmzfRvILzAY0CfMlEY3cnqjxh/hWb9Q3MnvIul+F8mvwjch8ii
X-Gm-Gg: AZuq6aKKHqX04UigiVYJOYnIRFVDX8lQaS8DfKlt7p05p4TpZ65EHu4irk6pRz24fX2
	PIEAWjNwmDRL57Ug0FqMT4Q7vArkqg11Liiwgh0YyCJfmMnq45akTvBX9QW1dCXXCaQNx7TcFPW
	rJiA5famM5Pdzo36KZslBsqpQLf/j2Iy9JJHCCWD49atqY4mde072eps25uA9H6quiOvLq6aDud
	3GY5TsBAd/Xij7lC/OV+9yo7TJrZ3QtQG+/V2P45E078eSn5tlOSboVMEFpTp4A2ahCSPpE3H2k
	FgOGfhv6/usG67kvc4iDu4ZG/yD1G3CvzKqvBbdVQSRZdw0qMhzTs1H/sVeFjN43tfwISDThi7T
	8jrjd5QN2XXOFT9/0nNqgeRNok4uVX9fDlymStce2qfKr
X-Received: by 2002:a05:6a21:4d8b:b0:38e:53cc:3baf with SMTP id adf61e73a8af0-39448498499mr2013862637.17.1770884767339;
        Thu, 12 Feb 2026 00:26:07 -0800 (PST)
X-Received: by 2002:a05:6a21:4d8b:b0:38e:53cc:3baf with SMTP id adf61e73a8af0-39448498499mr2013845637.17.1770884766865;
        Thu, 12 Feb 2026 00:26:06 -0800 (PST)
Received: from cse-cd04-lnx.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35662f6b84dsm10906851a91.10.2026.02.12.00.26.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Feb 2026 00:26:06 -0800 (PST)
From: Xueyao An <xueyao.an@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1] arm64: dts: qcom: hamoa-iot-som: Add firmware-name to QUPv3 nodes
Date: Thu, 12 Feb 2026 16:25:57 +0800
Message-ID: <20260212082558.2811953-1-xueyao.an@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=DtlbOW/+ c=1 sm=1 tr=0 ts=698d8ea0 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=8rlZebuS5uYMG-XfLoEA:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDA2MSBTYWx0ZWRfX6jcZPs3lJpfH
 pLNlL0zn8x8KQYo7l9uV22BYH7UbwolsUuWMeqyroE4kic/jlscCTIEa6ND+Oxzm9b3uwQJ6bTS
 P8OmjBXls5nxlyy4VAK6Tt7c+M/85vfLTT9ONhTUvqt+JoG+go+JEU+jwCnGCQF+MweMXtYUkKm
 CSaW4uPoW/l3d5SKWwensPoHhJQaiXlhWtjya7ulkhO9nlJVBMi6yruva4xTEKmbmZOdXO00er7
 ITIP5x03FN7IIKkVLuWBV2U54KCyL/+qdMt4V+i2lOG0dj1xmFLRAdqGN9oWCHsqBrTzgVcqw7t
 yMoJokXXYmyAhot6/dww03VvSUM1ZhZmw2eAnqTsDsE4sWSK5sak5mDvhMPADdNHbe5muinlS5O
 X6KoDGDDIMeTQ82bM0VYbDtjeQ+ebabaflZUZQ1/pL3tjc9DHrwm+lXqWdPtrnw2GXtJ0T1szfv
 QxuDUXww/Mbsu3EpwKQ==
X-Proofpoint-ORIG-GUID: R9A9Xs7QmPeyNirhFw70ryYv7fcpWXCM
X-Proofpoint-GUID: R9A9Xs7QmPeyNirhFw70ryYv7fcpWXCM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_02,2026-02-11_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 impostorscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602120061
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92645-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xueyao.an@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[8];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8F23012B532
X-Rspamd-Action: no action

Traditionally, firmware loading for Serial Engines (SE) in the QUP hardware
of Qualcomm SoCs has been managed by TrustZone (TZ). While this approach
ensures secure SE assignment and access control, it limits flexibility for
developers who need to enable various protocols on different SEs.

Add the firmware-name property to QUPv3 nodes in the device tree to enable
firmware loading from the Linux environment. Handle SE assignments and
access control permissions directly within Linux, removing the dependency
on TrustZone.

Signed-off-by: Xueyao An <xueyao.an@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi b/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi
index 1a9e930c0496..c26eaf187b17 100644
--- a/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi
@@ -458,14 +458,20 @@ &pcie6a_phy {
 };
 
 &qupv3_0 {
+	firmware-name = "qcom/x1e80100/qupv3fw.elf";
+
 	status = "okay";
 };
 
 &qupv3_1 {
+	firmware-name = "qcom/x1e80100/qupv3fw.elf";
+
 	status = "okay";
 };
 
 &qupv3_2 {
+	firmware-name = "qcom/x1e80100/qupv3fw.elf";
+
 	status = "okay";
 };
 
-- 
2.34.1


