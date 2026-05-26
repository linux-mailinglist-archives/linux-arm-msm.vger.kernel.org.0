Return-Path: <linux-arm-msm+bounces-109753-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KFJyBEZgFWp7UgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109753-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 10:56:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C7CB5D2CD0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 10:56:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 053DA3038957
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 08:53:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E473304BDC;
	Tue, 26 May 2026 08:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XeNbgbB8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="asVwiRYZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBE5437F015
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 08:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779785592; cv=none; b=i+DZZKPTWil5tk/8RdVad6A0/FjmrE+AsWrXJ1FWRdPhMo3iVXikS4dRvMO7287SdhpBcb52sKndWDvp9RtAAQXirNwWM2B8Y9B2tnAco2xw2uUXROwbJPpziZ0hksE57MA8PrX4R8/WM75WE7cJgOMI52Sh5jFRA7O3t4zBj58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779785592; c=relaxed/simple;
	bh=6dwjKXpdQIOHdZ4McKq+nYOl6X4s0oJJFQKmLJGEN0U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=n/qdxOu20kZFpDfm/xtYhqhyfVy6IfSVPLLibao0R/4jnDs+IdQy/58vph8yE551sHHxHe0vqw7ZUPIYng2IufsLaCCQFHLiYPc/cRKMcKTjINaLtvJx7+BkqFQkqIhrpBFgSJIz6IStIpTnmvn9yA7UmY1kqN1qSn9XO9Obbh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XeNbgbB8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=asVwiRYZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64Q8BZnm3603990
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 08:53:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=RVoZcULGEjGW1rN/Iq0DEm
	0850ecwTybL4jJLvdoIhA=; b=XeNbgbB84sKaW4B8kXqO2iF3LVKRw3jyfqKboB
	VMOm6KqM0D8uxdlyN0zla4BXusRvmOBSJfl5Jomuem1ozjcyxvT5L+fgNxzK5KOQ
	7Toy2KJBhGFzE9bI+drC271a1aRwEwQ5Au+7IcQMCTXK0kMpvv274PcT3vOk+qb0
	y9J2c39v7g1vC+suDwvj/FSfKZmcUyp+ywfKHpjk9uJTZIhVFLt4A9uaQ14g2YAH
	uMnU+uJvz5v1/Gau5WLrObWI3F2TEK8s2QiSa+eS6k47B2DYymnHjGOhZVFj3U6F
	aJgX0wr9uOXuGvIZ6mb6bbL5h0KQsNFBR/oui1hoKHGAW7bQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecpyqk675-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 08:53:10 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-304627c66ddso1995835eec.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 01:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779785589; x=1780390389; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RVoZcULGEjGW1rN/Iq0DEm0850ecwTybL4jJLvdoIhA=;
        b=asVwiRYZIfh+4tIAveEDnaG6E8HsX8BqE/ZOEJWzGHQfcASM9j1iWLqw/ueh74CXln
         6ixUH6knJP5wMzW76bl5aCuo1FJ9GIrwLJt/k5EyTuM4djeW1tyd0AUvCxF8KwCwMWDv
         RucAY8vOPHMXjbGk35ruJO5CAK/8ouhaWDrRX5n1KPuWcmE4Z0VuIuF8bPQo6RAR8vWV
         LxMsTktTJjJaqLiYpqJOmYdrQlKQ2I8gK6kP1eqfBDsCAlIkGV3VBDxQdP4+bQhZJvDF
         x2YDAJUfPE0JWn1DxBq08a+lk4/pDKofnWmloLqXe34olKL9P4k5w0/qMbArQKoQaJfJ
         Jb6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779785589; x=1780390389;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RVoZcULGEjGW1rN/Iq0DEm0850ecwTybL4jJLvdoIhA=;
        b=ljTbAHzk9SV0nuk5/oxOCrynFAVZwDw9fQ209VOhr0eyzaJETY+XyZHhSrj8zrfTUQ
         rz2i1a4EqFWf0A2eA0BAy7FBKVT7XukBOVIhg5tDQfww6eODsnlclFqzDkMNlGiMvRPM
         m7Km21EVLanQ1ugw9USEbqVHfNIf60lryHS7NXhJgF03KPwSuuSN/FoXxoc/n/ZXmSvn
         YqSXVNIDzQo6kZuYu5AeqOSK+f4zw5njPYqrTfCsjtrB+1LqiZsGwyxNbhv/LO+t1zpj
         3+CN7MdntFq0CGyz6jOY9uE/xi7RjE7Fq0isHNJy+/N6mvTJM3s12lk6Un2te3lNV6n5
         Q6BQ==
X-Forwarded-Encrypted: i=1; AFNElJ9Jp4XorVk5uQWlHN/JaROIKjmOXhZUW7QVAeCwD4XIco1NTxEn7K0QemRtuuy6HLFKo5AxdoBw+p9WA7Hu@vger.kernel.org
X-Gm-Message-State: AOJu0YxG4ERfnIee8EW02jbU7vIV8Rj4GJy0HNWBqZPJkIOORnnHeqZo
	UO9CgWkGLetj8fFREl3U/ienEPzRA8WFpLfiU9tiTNZ8CVH6jlJsZp9WZ0C6bXuasGOGxfqHwsj
	sWwuE1medJj8OKAJqpnpTHRS2DyuN7twUvlcEwDiSKqPqAKq3b0xHhPrmTrNarSmjnDIW
X-Gm-Gg: Acq92OH0Jo9DUwykknIfKaM9f5SjU0L8Ivq3R4bz+9dkB+3nYNctTgBTPSLVm3NH7qP
	NplrtVA0QQ0Nz4uW4r8jFsU7bq1MIYyk/LAAscMsCI8wthwRs2+I8D9MQ64xS3dg0me+/wOkYGj
	qsAvTXID0+J2G3UGf/MhawZZbk0HTSKwx4Xt9TOCURC3R+GAFarjlgyYuS5HenL/DWmTC8u18cv
	Y1i8JakPaSFBqhgCI0uNs4ykh7pvzNmrB0iVDy18NQod3vom2PBUG6cRhxPCbrra7ujT+q2Jfk+
	jtVDl17O9imR1yPFB0ryAdSbAr9HXwn76AeNGv2AZmNzYqGr9F96Svct1B4mX1PmQQ+xENxiAGL
	if1rwYLpdgiyD6dDyWdUYfsjFmiFirz+J0jEHcVbAvVSlbpZ2Au+TCSBKESmagvdVW7oRtwvJ8P
	bRw/C8d2PSaw==
X-Received: by 2002:a05:7300:cd86:b0:2f5:3641:f110 with SMTP id 5a478bee46e88-304491f39cfmr7245237eec.31.1779785589480;
        Tue, 26 May 2026 01:53:09 -0700 (PDT)
X-Received: by 2002:a05:7300:cd86:b0:2f5:3641:f110 with SMTP id 5a478bee46e88-304491f39cfmr7245228eec.31.1779785588963;
        Tue, 26 May 2026 01:53:08 -0700 (PDT)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30451ef4719sm9921260eec.1.2026.05.26.01.53.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 01:53:08 -0700 (PDT)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Date: Tue, 26 May 2026 01:52:57 -0700
Subject: [PATCH] arm64: dts: qcom: glymur-crd: merge duplicate
 &pmh0101_gpios node extensions
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-merge-duplicate-pmh0101-gpios-node-v1-1-c4ab4983f8be@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAGhfFWoC/x2NQQqDMBQFryJ/3Q9JaES9inQRzIt+0CQkthTEu
 zd0ObOYuaiiCCpN3UUFH6mSYgP96GjZXFzB4huTUaZX1vR8oDTp33mXxZ3gfGxKK81rllQ5Jg+
 2Bi6MYxieg6UWygVBvv/J/LrvH8OCC7Z0AAAA
X-Change-ID: 20260526-merge-duplicate-pmh0101-gpios-node-52eaf99f8485
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779785588; l=1650;
 i=gopikrishna.garmidi@oss.qualcomm.com; s=20260102;
 h=from:subject:message-id; bh=6dwjKXpdQIOHdZ4McKq+nYOl6X4s0oJJFQKmLJGEN0U=;
 b=JDdIB1pKcxiRZbw6FwkdfKXENqU+pAJtDMtFuCnoTJgTVZFuj19YBuIGFbfiZ1rxhvEUyiI76
 qBjurF7bri4Adl2pr9Xsq3K75Gqkh3Q7MlBTOE4Cn4aWi07TU/cBZl1
X-Developer-Key: i=gopikrishna.garmidi@oss.qualcomm.com; a=ed25519;
 pk=TkSjNEhrfsj90i3wkABTZtAjLNr2cfYsujaTvyOIDsE=
X-Authority-Analysis: v=2.4 cv=dtfrzVg4 c=1 sm=1 tr=0 ts=6a155f76 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=EoTlI1rpe4zGgeXVSq8A:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: m4ocRd6wWQx0QM0mhaCliOixRvNawhf8
X-Proofpoint-ORIG-GUID: m4ocRd6wWQx0QM0mhaCliOixRvNawhf8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDA3NyBTYWx0ZWRfX3nttYH9kTmSG
 vzkTW7nQqus2zMKMaOcz1pcNSq9G4Arv6ozv8o1zUpx0SmwN13c0AcNgJi0/N7LkbNSE5p9ap2O
 tsIfBY8lVgzUbp1W1MiX+6GA1zoVN2WujO+pL5Fsu9N3UQULto/Mxti6uj51ulH959/CkpRH5Zd
 XI+/+I6Rl5trnH0EkeUfmCRT5ZDigM4mZNR1EhlGk79X4b7s3+6aAeuKaJAS2bIEJfmYBW0OdYr
 4li/cJydIRPYMueXayhjoi4L43LjeG8y5V7R4yvMEZuzcizQQ4rij8zpiMnVcjtLdXFhB5URzis
 VtVOinGxsZ7yYnW+3UZ/Mv39jGk8qerTM4TjWaqEdBxvuVJGW/WVKzfSMT0taMuaVa4C3ESYkvF
 W/SPup1OPjY1FpS/Mp2evVyuw2iZtF4QXo4qP3gI/UDxEnRNcTYOWI1doq5IqC8zYRTSi+mzLD2
 n1DAWcTvaqkbMzQOhfA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-26_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0 phishscore=0
 adultscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260077
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109753-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gopikrishna.garmidi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7C7CB5D2CD0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The &pmh0101_gpios node is extended twice in glymur-crd.dtsi. The first
extension defines the nvme_reg_en pinctrl state for the NVMe regulator
enable GPIO (gpio14), and the second adds key_vol_up_default for the
volume-up key (gpio6).

Merge both pinctrl states into a single &pmh0101_gpios block to avoid
the duplicate node extension.

No functional change intended.

Fixes: a5ad8a8e473c ("arm64: dts: qcom: Commonize Glymur CRD DTSI")
Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
index e784b538f42e..faa149b02c69 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
@@ -543,6 +543,13 @@ nvme_reg_en: nvme-reg-en-state {
 		function = "normal";
 		bias-disable;
 	};
+
+	key_vol_up_default: key-vol-up-default-state {
+		pins = "gpio6";
+		function = "normal";
+		output-disable;
+		bias-pull-up;
+	};
 };
 
 &pmh0110_f_e1_gpios {
@@ -553,15 +560,6 @@ nvme_sec_reg_en: nvme-reg-en-state {
 	};
 };
 
-&pmh0101_gpios {
-	key_vol_up_default: key-vol-up-default-state {
-		pins = "gpio6";
-		function = "normal";
-		output-disable;
-		bias-pull-up;
-	};
-};
-
 &pmk8850_rtc {
 	qcom,no-alarm;
 };

---
base-commit: d387b06f7c15b4639244ad66b4b0900c6a02b430
change-id: 20260526-merge-duplicate-pmh0101-gpios-node-52eaf99f8485

Best regards,
-- 
Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>


