Return-Path: <linux-arm-msm+bounces-105533-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KLdcMrjf9GkhFgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105533-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 01 May 2026 19:15:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D49644AE748
	for <lists+linux-arm-msm@lfdr.de>; Fri, 01 May 2026 19:15:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 288E8301021B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 May 2026 17:07:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38BCA426D08;
	Fri,  1 May 2026 17:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JJ68d7ec";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JHxT3As9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F7B6425CC7
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 May 2026 17:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777655209; cv=none; b=Yw4SSLMfyNouvFHanKCcxba/ycb2IhFALcLgptlS/NxQmKjGzRxcMGFfVGhaxSIlDuWPvssUZTLq7knG3DP7YkFAg8w2RK99xXOsV+iB6g1hHRLIseYreoJBaXHJuKpfdNH/OZcoiK6BRUN+0HiaYfNX04Rnws+iUayGqCyic8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777655209; c=relaxed/simple;
	bh=Y1WK4FOxLS2Z8JGTPQKxCLLaX1hY2Z4D8mCYOE3lAX4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=C936cE4MGFcihhRCAva8/7I1cCkW37j4Fnw3pAdMv4jajtcvvx2kw9mFrso9V04CW6TDljgufuXufO86bWCFBcKkEX1ggX1QiyrAZyLiODcvRQZ6ZGzX/P+Vhn+2NU1TUv8kcr3bgxl5YqFCOFVBHkJqwe655KQ2jn1cC2rI2+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JJ68d7ec; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JHxT3As9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 641GLfbl625446
	for <linux-arm-msm@vger.kernel.org>; Fri, 1 May 2026 17:06:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=X8L41HTjzwq
	EAHHTicu9WDnxJN0Uofe905/Soc4E8Ak=; b=JJ68d7ecr92fhgl/HWK/jDP+OHC
	6Db4pkn+9aHdJUYi84pIFOP2QZMtTpoxPPAhjmA8Ge36aVkWLPDDDQQAxUSjt9O4
	KCqtRStv173QG0nQ58qswXJ7lkkuooAKI26g5XZIdGL7T6LAMZ1PfnHnrm3TmScK
	x1abk81zRyPZ18SiFn/mg/w6MYm7r5OnU4KQuHYafXaqiGlcH1JHsSkTVNK67+xg
	TVYYcEXU3VqwZMf2pEAuv8aocNs8LXaTPCpfBnR4G6aBTfsTRiMcWrmUoum8yhqP
	O80aYu9/AE89+D6Ipr9F5eLvyqltCAofhbiXkxuaze8amuXBKacpobUcP8A==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dvc45beyn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 01 May 2026 17:06:46 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-12c726f4019so3019676c88.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 May 2026 10:06:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777655205; x=1778260005; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X8L41HTjzwqEAHHTicu9WDnxJN0Uofe905/Soc4E8Ak=;
        b=JHxT3As94VHYIqFCzxd889OfCbA47FVKKm0mA1IHm5fj3/WqqpJXjJhep6/hAklsBx
         Rlog9zcQGIHaEHi75XfAyGzKQJ6iPxynhXCBsjigpA8Svm+dxU1tuzjpa7mh3hkHU3Qe
         FsKBF1l8wm/8ytTQt/+uEBTmORJcZ1a7INQmaUrgLuwL7HYLfWYZSqMl5x++opoEXUt5
         oAKpQrV/Xu3DkLrGoHfZoXh/jBg1cHgbJmfAlu6mkfxehVp1ale+yLPD2wxyQYoqBXBe
         149kpRrUcSnbJa2fJkyG3F/c2uyTeltFVfWI1h0eW+i+J9D2U6t4RUyM/5gVMcAHx2a6
         iTMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777655205; x=1778260005;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X8L41HTjzwqEAHHTicu9WDnxJN0Uofe905/Soc4E8Ak=;
        b=SWsR8yJDj0eW38RLkjSmS74C3q/eEWlDDPQNb1FWvv1K40mUENZAbkE4wd/29XOC8P
         LuxIbbV2gwdZShUVEEVfY/EdK6jn7yc2CSMyAq+b6lEQPpD7Ww6QWWUycEbvywz+uwFQ
         9cpSaJnpE8wTajMb/dGtk9zilOA8L2dV5FePIM/30GTi3D+dtOuN6v2hLLO9qeWEDsPL
         gscoE7Wdl4TdZpqAd0ILCU2nR/ItYI++JXogTf1nteX+zW/0gLXRQz4Gr+LTCP3XyPze
         ohWdrU4EPQyHibnH6tSNME1af7oWmtYM0Zy0xGhqXe85pYQ3yWWq7OV08YC+DwbS/EDY
         mfkw==
X-Gm-Message-State: AOJu0YzJdiSLOIYzGuskulYrEKG6ilmNnxNowQc0uewD5vJ3Auh8D0zh
	Ok0j9cC3xj2V2CnChjovrA9OWmIOkN2WRPOfhMSLQvps7ckpKr0Z3bSUQpyuhzvvytBAe+Yym32
	58zFhO+21vy6BmaaQaqHFptjYsGdZg/un1qartuwiazC2h5eMlVqFkhCMH5Ppdb2BEJ21
X-Gm-Gg: AeBDies5TyT2HEqi7IhU7j//UxxqpgeVDSpnUYKGGhWvq/rPRQMbbSWOHcJD4jTR7Jq
	NykByYippkiQMK3++F0/3r/zj5dqIZKeix/cBU59q6ss67jN7hfQDXQoJI1JHewpsUFYtz6hQyl
	x7xVwQBNxcCYVXrZx7rSNlqMK2yNZqSZd9Gjcam1PHhvmF+a40G9e2c+yM0nSUEyIHhY8A/EGgW
	zWkZh2rCCbTqTo1zpslvknTjzIAtRa6IuYdcL9P13yCSWmq2cGbq28ACSkzL4EzCmpEBb9lj4ET
	uwkd7dyByIVeA2UX0xV8hQLDuP1S85RCWRpMhwwZtRR+VLHfGazJ1DcwNCLAZ3z7D1AfciHzwcR
	3oQIu8JA8ri2quoKI3u+ctI/F/C9Weu4w6n3T2CvuQo8YUzRuugWw4FSBLvmkKnzyBmPpZMowS+
	BM5H1F7dzWKw==
X-Received: by 2002:a05:7022:6187:b0:12d:b2e9:b20f with SMTP id a92af1059eb24-12dfd821474mr50082c88.21.1777655205166;
        Fri, 01 May 2026 10:06:45 -0700 (PDT)
X-Received: by 2002:a05:7022:6187:b0:12d:b2e9:b20f with SMTP id a92af1059eb24-12dfd821474mr50073c88.21.1777655204606;
        Fri, 01 May 2026 10:06:44 -0700 (PDT)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ee3537d300sm6655978eec.0.2026.05.01.10.06.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 10:06:44 -0700 (PDT)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 8/9] arm64: dts: qcom: kodiak: Describe EUD UTMI path using child node
Date: Fri,  1 May 2026 10:06:34 -0700
Message-Id: <20260501170635.2641748-9-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260501170635.2641748-1-elson.serrao@oss.qualcomm.com>
References: <20260501170635.2641748-1-elson.serrao@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTAxMDE2OCBTYWx0ZWRfX9eePrf4NljH5
 h+js2bsQXkQbFBODWTd9VtdS8BTA55ZQ8UpYMc0JwkzwTt242a75G51GnsDxsWM2gxM7YrcC0bX
 fIiV17/G6zNc7HEoDcjtV0DuHq19MjzuTJOQnJp6GmCWsPY9mqNAAhhg7yUROYnDzVRXzC1g36V
 4aZZnT+BI79eo3d36/3M9pl1GiYRtpd7V2d6SDy5tyiWmnCH9DIMBzs7PrDdO3Z4Yu5INpETrrR
 gzruTx0HwWRFff1Jhbdh9BgRbjHmobXi9Dl7ulofcnjFBxvyLrXLReoOdgg81oaiKPF94aFPk9G
 UGhSJPGog3wYkw/u7KFi6aaEYAolsBwDvxdEJIHmfi1mGNklU8JrlDjNXZPaPy6JW1NczahFVPm
 3XHLNY55z99hJhG1xik9duKIWoYD0afWMYWi0HqsXIOy2VwoNCGsMR5LVWuGWX20XOBZpOAVYau
 h7+EHVLNTDrOUIs2f5g==
X-Authority-Analysis: v=2.4 cv=DP+/JSNb c=1 sm=1 tr=0 ts=69f4dda6 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=-Y8wEhFFMILef-Bpc8oA:9 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: 2J7wIXnEQ3viLseXXow_7Vv0MOP5XfJO
X-Proofpoint-GUID: 2J7wIXnEQ3viLseXXow_7Vv0MOP5XfJO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-01_04,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605010168
X-Rspamd-Queue-Id: D49644AE748
X-Rspamd-Action: add header
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [6.34 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105533-lists,linux-arm-msm=lfdr.de];
	R_DKIM_ALLOW(0.00)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	GREYLIST(0.00)[pass,body];
	RCPT_COUNT_TWELVE(0.00)[12];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_SPAM(0.00)[0.685];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[88dc000:email,8c00000:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,0.0.0.1:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,88e0000:email];
	FROM_NEQ_ENVFROM(0.00)[elson.serrao@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	R_SPF_ALLOW(0.00)[+ip4:104.64.211.4:c];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Spam: Yes

The existing EUD description uses a legacy single-path representation
that assumes uniform UTMI routing. This was sufficient for minimal
configurations where the USB port operated only in device mode and role
switching was not considered.

Update the description to explicitly model the topology using eud path
child node and add a role-switch declaration to reflect role-dependent
UTMI routing. Also on this SoC, the EUD hardware intercepts only the
primary UTMI path. So remove the USB endpoint mapping to the secondary
controller and associate it with the primary controller.

With the UTMI path now accurately described, enable the EUD by default.
The connector side of the path is left unspecified, allowing board-level
DTS files to describe the physical connector mapping.

Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 35 +++++++++++++++++-----------
 1 file changed, 21 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index 988ca5f7c8a0..cad1d78f9e62 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -4400,12 +4400,6 @@ usb_2: usb@8c00000 {
 			phy-names = "usb2-phy";
 			maximum-speed = "high-speed";
 			usb-role-switch;
-
-			port {
-				usb2_role_switch: endpoint {
-					remote-endpoint = <&eud_ep>;
-				};
-			};
 		};
 
 		qspi: spi@88dc000 {
@@ -4729,16 +4723,28 @@ eud: eud@88e0000 {
 			      <0 0x88e2000 0 0x1000>;
 			interrupts-extended = <&pdc 11 IRQ_TYPE_LEVEL_HIGH>;
 
-			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
 
-			ports {
-				#address-cells = <1>;
-				#size-cells = <0>;
+			eud0: eud-path@0 {
+				reg = <0>;
+				usb-role-switch;
 
-				port@0 {
-					reg = <0>;
-					eud_ep: endpoint {
-						remote-endpoint = <&usb2_role_switch>;
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+						eud_usb: endpoint {
+							remote-endpoint = <&usb_1_dwc3_hs>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+						eud_con: endpoint {
+						};
 					};
 				};
 			};
@@ -4965,6 +4971,7 @@ port@0 {
 					reg = <0>;
 
 					usb_1_dwc3_hs: endpoint {
+						remote-endpoint = <&eud_usb>;
 					};
 				};
 
-- 
2.34.1


