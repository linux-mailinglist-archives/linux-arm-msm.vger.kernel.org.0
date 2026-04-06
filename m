Return-Path: <linux-arm-msm+bounces-101945-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KDcTH76S02kDjQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101945-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Apr 2026 13:02:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB293A2F7F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Apr 2026 13:02:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A14ED3014556
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Apr 2026 11:01:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A2C73264F3;
	Mon,  6 Apr 2026 11:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mdVsCC+N";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BNz6NOJO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FBAE32F742
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Apr 2026 11:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775473289; cv=none; b=rYnx91/odNfGBwg2G87TLURxAP8Ri1qCYBaifB7PiGptsL9dFBKKy7qJFgDDiZbNg/vbiqKjB0XD/FqWdOTpRVwO9S+bjOaHs0vd5qviPrYTT/et8WCE79xZ3O0zx8Pjg83nPNL4eurvKJF2VhgRfel2a7iwDXmQsxw1ptCpUdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775473289; c=relaxed/simple;
	bh=XVSQJAsYoVMAR93G9UBt1XvC4Txcv9nD5uc2OvoYbDY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=E0sr3OFES/kV4CyjvPlXgfxWUP/PdQZ0xdwBuyEreJqA3yZc9p1+nEpFugHXAKKwoesboOPnRySWzyl5Psj5USL16tW7O9464kxV0GcZ+9cu75t2B/XVUtszqggw8wliyrBmOQkP4lulsvl+E8DXWXz+Njx/XYT5kp2FHjJD/LA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mdVsCC+N; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BNz6NOJO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6369ChIl1884221
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Apr 2026 11:01:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=PGIKvZFR8Ji
	2CYrEVqMneoJ3CnAcjf8CSViSgmS0ZCA=; b=mdVsCC+NPJB6KzZEjuZ+guRCPX1
	fZG78yE+ecl8xocedgdIZ+CVLP7Jmp0lF0FfdPQShcxvCcDwgqzReS30JfOXz/uk
	bXbgCSpOOuulzyZ6HBGTwKuA1Gx/9vbaUcd0jO8KF2v3q94NztQL0rBEpskofLga
	hEdeQV/K/53+EikiNytolOUCWq7S8Gev3HCsqgbHYXldLnDqxv1RpfaOUkqhaa9w
	O4kz3iWlqt0UGFgf9sendJArc/5VXIzRdBlR1mdLPD4jYtbGLZ7gWfGAIvU/Py2Z
	3ZfSp5ymP8NFJGmZlJVbEXwdFUuyrO6KxNx5kwpVshV2U5nY53ZEPnD4HjA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4daux8cum6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Apr 2026 11:01:27 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b0b339b8dbso40492745ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Apr 2026 04:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775473287; x=1776078087; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PGIKvZFR8Ji2CYrEVqMneoJ3CnAcjf8CSViSgmS0ZCA=;
        b=BNz6NOJO27n9IEl5vC1tXjYJ2CmWcr1+/XoQjD9wV5eii3nrntGoAph2RXU1+G1nxR
         nlCjbyLvEJp+x19qqOgyzAI89OF1SjSKSwWizZkafsurYBE4rtvc22uH27oORTKXi+cv
         D88IDlLZC7n57hmMpwmCHrLw/omNhY8uuu8L5wwtph3X2vmMSYu8ZMK9DcKhAynjEnKy
         FOyd7dIHxWU3Fccb0Ylwz0JxDi2XpP6F176mPogf6dZkIGHMcAAwA0jvkPJpcG7IC2A6
         jaakmNolCXM5km+94bLGomIien9z3DCBQoTYD4gfpE+rD5sonRidBQYIiP77iR0k58fH
         enKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775473287; x=1776078087;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PGIKvZFR8Ji2CYrEVqMneoJ3CnAcjf8CSViSgmS0ZCA=;
        b=Weq1wxT4rlaUKWk2D6WNYCsPbTWiUNREng1el3yROVcePXWxkD5woANgQ5n+paaod5
         JO+ZtZa8efDlXmFKcCUAGfsSZJerMjz9XEQOu6ma9HBXuAScU70+h809KOONgQq6SuRf
         ImQzHXiPknbJwjBbbVXt8eNWkg/bBM+6diMsKKWUMNDCOVGzNwc5Z9Vdnh5W1LGsRTHq
         eSHHzxYC3DSo28aLnNPTsw1naHNp8ZCOnm2zth8pyWmIoSjUzwypUR3y4zLZ5YJ97odA
         TFZBnYQ3VXFPW3VEUnjVHK7dU/eIMlsfBXyIG/MDM1BXI0diFsx5m8+EmbL6ZFAFezuV
         ddkw==
X-Gm-Message-State: AOJu0Yxz0Fqzn1Jv8taiUQMlds6JETLiRK/SsFsbpEoRkmtvpU6g2CMo
	AV4gHLkgwQAj4GUv6go/2Px62lUR6PqOpOpdJVHXtAwAkHktu3O5eSGSD3M4cdOsSA8XHwcGHJ9
	ZJ6c1ePiseOt5uYjDv29SJqQjdekr1eGbeVoOeEJYYd51iPNFp24PTe5V1gX3vCyxSRI4
X-Gm-Gg: AeBDiesJ6PsMtmmLz8KH3/4gmbeeFkmCbeMlowQuqLSAeIHLkIRpucZ3menQGreANQ5
	fji01uti/ZW3Bk+njly+P8H6R0cg1nTeSMm6KC0+JofvKG+kwSAaI3J0Svl2pyHFW/up5ZPmTxZ
	uHPdQX16EdVy7dnQWFTidll0L17Ge7yD1LaXvGLaYVTMlkPqgA/rR+fEf8X/4UqzRkkL18B6vAm
	Ss2rMDIUiuF2yAHfnYtFHY5khARbNAEuD0+BVOPYYEXqo+W62YryCoOWGzsQ92Ef7aUxGhcpHBr
	5qLMnOtBIFo6BXs/yUSb1qXXon6nvFPNwvdIYzjl/9jTlLMMTZ2Sb1lgyFIR++TxNNXwOJQFoET
	AjLdLFHF8fBkyWf55O5O/pIOHaP3C5/QxAxx+rPOzD0vWOLGdsbJ7JXs=
X-Received: by 2002:a17:903:944:b0:2b2:6df1:111d with SMTP id d9443c01a7336-2b2816d82c0mr126296185ad.21.1775473286493;
        Mon, 06 Apr 2026 04:01:26 -0700 (PDT)
X-Received: by 2002:a17:903:944:b0:2b2:6df1:111d with SMTP id d9443c01a7336-2b2816d82c0mr126295715ad.21.1775473285959;
        Mon, 06 Apr 2026 04:01:25 -0700 (PDT)
Received: from hu-swatagar-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27475bc2asm141696075ad.19.2026.04.06.04.01.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 04:01:25 -0700 (PDT)
From: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Swati Agarwal <swati.agarwal@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v8 1/2] arm64: dts: qcom: lemans-evk: Rename hd3ss3220_ instance for primary port controller
Date: Mon,  6 Apr 2026 16:31:12 +0530
Message-Id: <20260406110113.1709886-2-swati.agarwal@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260406110113.1709886-1-swati.agarwal@oss.qualcomm.com>
References: <20260406110113.1709886-1-swati.agarwal@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: MgVosUPKC5Ua4TiMBHo5U6FXY4cgp3XT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA2MDEwOCBTYWx0ZWRfXxVBC5MhghGbn
 GSicgj9YkvrsLFxBx5Ju91hVq5GZZAdU0qAOeXbv7m/C4yJgqzBnlmqUkiw/UDzVOpWGfif5IrQ
 NlNSth/qzQa6OOr3aN8mTNwHj4RO9FydtIGCNY3fEC4lGyoOPdzc08I58K0QQIhb6J2j1+xfHU8
 chV/XysWM0uDPai/IY3wW/FY64AHXGs8rDl4wdfOgpOM8VQppu58U1rAaTxpdpbTaCYCbl1mXrW
 v3qj8duJnG2HFXxFmyNumViiXufMvHtueM+/oVWfbYXjqEqIkhMGF0rjmFRYPHsCQHiYFMHG4yc
 YAixBGvg+zcpORfM6abmBCN5iteSrX2I7169pQYB+wRbyr2E+ymW2kTFJx8CeWB5cvE9ODoxply
 RIg/tr5zcJZWoMfEFtomh3D5YHzQM8glrhZSxQ2VLdgELyDn/nGFg9zyKxFzNzfuY6TqjVE6qpy
 DwHwbxpPK906JKalZqw==
X-Proofpoint-GUID: MgVosUPKC5Ua4TiMBHo5U6FXY4cgp3XT
X-Authority-Analysis: v=2.4 cv=AuzjHe9P c=1 sm=1 tr=0 ts=69d39287 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=917_i3xC6rPZgS4eXuUA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-06_02,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 clxscore=1015 lowpriorityscore=0
 suspectscore=0 spamscore=0 impostorscore=0 malwarescore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604060108
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
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101945-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[swati.agarwal@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.0.0.1:email,0.0.0.0:email];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CBB293A2F7F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Rename the hd3ss3220_ instance to improve clarity and simplify usage when
adding a secondary port controller.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index c665db6a4595..522d407c9925 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -63,7 +63,7 @@ port@1 {
 				reg = <1>;
 
 				usb0_con_ss_ep: endpoint {
-					remote-endpoint = <&hd3ss3220_in_ep>;
+					remote-endpoint = <&hd3ss3220_0_in_ep>;
 				};
 			};
 		};
@@ -551,7 +551,7 @@ ports {
 			port@0 {
 				reg = <0>;
 
-				hd3ss3220_in_ep: endpoint {
+				hd3ss3220_0_in_ep: endpoint {
 					remote-endpoint = <&usb0_con_ss_ep>;
 				};
 			};
@@ -559,7 +559,7 @@ hd3ss3220_in_ep: endpoint {
 			port@1 {
 				reg = <1>;
 
-				hd3ss3220_out_ep: endpoint {
+				hd3ss3220_0_out_ep: endpoint {
 					remote-endpoint = <&usb_0_dwc3_ss>;
 				};
 			};
@@ -989,7 +989,7 @@ &usb_0_dwc3_hs {
 };
 
 &usb_0_dwc3_ss {
-	remote-endpoint = <&hd3ss3220_out_ep>;
+	remote-endpoint = <&hd3ss3220_0_out_ep>;
 };
 
 &usb_0_hsphy {
-- 
2.34.1


