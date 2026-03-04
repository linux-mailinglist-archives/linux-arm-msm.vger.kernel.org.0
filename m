Return-Path: <linux-arm-msm+bounces-95244-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +M/sHTanp2kHjAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95244-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 04:29:58 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E2A191FA57D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 04:29:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9463130312FF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2026 03:29:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95DC7366042;
	Wed,  4 Mar 2026 03:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YboktBob";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E3kvsGHt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 048513537D1
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Mar 2026 03:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772594994; cv=none; b=XeXhpMBlP0XJ+NfO4C9vNViNVq1KUD9EQW9J2L8+3rSXOsBRmVLphZybR0z6P0u1JdTUfcWzpcPVbb+bct2SjaZudyVlHNppYT1H+yFMDljqKzEEKq13t6yiKiiY+0IpMnPWwmIJrAiGLe6H6Ij2MJcJaGzYwC0uJVKE202Fzec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772594994; c=relaxed/simple;
	bh=KTk3UNcnq3W13RKPmnE/G1sAK+8ndj+/o5tFjtWk0mo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=iYd3t+JI0jZ+X+7qnTNEyUKCENKxN4Rj8cLIYyDw0XDSeV+N/RQ24uVpko86kbJxquXvEn/sL9YSAc0xpRAJF81LxxrhGA9xgwjSai/GJzhf+ALfhZC4dB4AlnXiwmz22YhkChQ7gbSi+xFUI783e6HV440YL+whR/eXVEiLG/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YboktBob; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E3kvsGHt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6242UltA4030760
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Mar 2026 03:29:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=HSwZuvag6iVlp9HNVvojaf
	m90FLVvQb2cd7/Qt6+VWM=; b=YboktBobPg5+Y/x8saG0fRnZkjZzOXp1Oh5VhT
	OvZCnqM6wB2qhSCx9XH3w9A/SMKEDA9tq40iuhiOBj3jah1ULGE5p3zq6RWtOX41
	PhfuieU+OrOp2NaQcYWcqfYjGazQg3eeVntlxETCu8httysZGrc92hg3RrJ16qNK
	wDXE6hHBTql8I94IrvjvinbyVSOdGaMMquUqJZThysmFbz/3oZNY2xwicYiwg8sg
	BsyMtC4rbr5GxQKzcJearNvfQ5ceoe3bt4L+ugUhu9t/knWxuqL3Svilw5Z5gZE9
	wuZlg299Kp6fIhB6r4MjxV0FqKZU3UdV2c4iNp9h2cdRXxWw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnuqu3p76-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 03:29:51 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb4817f3c8so3650174585a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 19:29:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772594991; x=1773199791; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HSwZuvag6iVlp9HNVvojafm90FLVvQb2cd7/Qt6+VWM=;
        b=E3kvsGHtjO+gwobjbwJNBGf2LlgKeyEKAJMfxisYEj1R7asGUQKBZIOzr1GVBtJTAK
         TVDUP5n710i1GMg7gjRnFbXQIDu8B/+zWF28wnlPq1W+mCW85iFkLDe9h7vFW7rtpCNx
         V3/yxqZ6eqOrzps7nx0QNKW9dVByZyBTSt/OV9DPGG5Z/QLitSp+cf1iSMX2s224+lGO
         CQB7gsplAY9aqYx3nudXGkCxNDvzRSOxIbbDu6619gD1YDyFn+vHV9qdIgfevGH8oXyd
         cIMBCNTNGTnWAuMUoDwtYsTxSTBWebVfdUrmLkJ3IUAiittSlHTRYtbrBdNJk3YHWzvQ
         ucZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772594991; x=1773199791;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HSwZuvag6iVlp9HNVvojafm90FLVvQb2cd7/Qt6+VWM=;
        b=wgdsM70mvlpbbClf+dxfHTy7+QfIpgRz6U+DxSrAhITTnfvHgOIps4CLhxUcPEPgfr
         CERoYAgUX5vM2MVkFjQbSQMAipbQGdKQv571NCB6R5UDOhgVKOu/ejHGZjCpsjxhZzvj
         TYBqzZa3op/3iuyqEWRnYYkpd4FDPmeHmIY4TlabxQr6vIwOLfxl05LasmRS0vj35erZ
         VxAJLi9mjs1az1Qf7R36igi4V07wCjzIUkJdvhbxXWCH86JMhKBI+trzM9XJUUmbefNE
         hnXs3HiPImZ8G0MLaemDP306UsjyC5HLzZpHYS8rx1p04vL/XpbBtJCQoBjvPoLJxeyf
         r9jw==
X-Gm-Message-State: AOJu0YwABE/OOheoMVRJPvtGfkaUau9VNKwHhZI0IpqHZ6k98xmEHr0w
	bmww1f0ota196OCU5OXZcsmxZzcksj+FKpNOOHEvvfZDQSJkNk4iRm1glByXMiuX3L0b+nrhZnO
	juGgxmstbJ36F0+50qcuH3MJcl7+2qlAZxv/yKpoIih7blFyaelYbotjuf7aXWDArEW+8
X-Gm-Gg: ATEYQzwO3Q+trdvApOnPj6uIjtR31X1tssRdI/sedRBABXbEqsRwyjTVOfxYLYjUjoG
	287/OBjJgb3ebjLmUcDxRqgD93K1gnpzIYfuYfuhoqo3sn+m3SMzdSoNoFdKI9/QIj8q0rMOq0O
	t6Ucag958ua7LoJTteYeUEEMpl00faQcTl3EaaYcN4UpONC1VEpXCuaLo3FHq2BaXuvKbxIkgAU
	t8n05aZfZrEVJ/hUOQy7XBoDle7vvzp73xWMLibOhJfkQi9UWQ4r/bXFP3OhB2XKhRGZfwfeMkE
	LE5H/XA4XDeIEXRynpe1dQMFHwa+eax6+MtRKP7ncQ4rOcUx/wyDXMWWdhdM2iqtTN87+RcP2zB
	Ll22M6A/KWx6m6aLG8b4ohPahj9cpMA3N3CWjl65k5SIl5Dx+FXn5R8ySWwOPjoK0vuhrKSI2Ah
	cVXg9r2tjjZbLKWDnGdhhwIhY+ObWPjhwar/A=
X-Received: by 2002:a05:620a:2992:b0:8ca:2baa:76e with SMTP id af79cd13be357-8cd5aee6e79mr81756885a.19.1772594991032;
        Tue, 03 Mar 2026 19:29:51 -0800 (PST)
X-Received: by 2002:a05:620a:2992:b0:8ca:2baa:76e with SMTP id af79cd13be357-8cd5aee6e79mr81755285a.19.1772594990508;
        Tue, 03 Mar 2026 19:29:50 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a1237b8177sm967511e87.59.2026.03.03.19.29.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 19:29:49 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 04 Mar 2026 05:29:47 +0200
Subject: [PATCH] arm64: dts: qcom: correct RBR opp entry
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260304-msm-fix-rbr-v1-1-b9eba986eaef@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIACqnp2kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDYwMT3dziXN20zArdoqQi3ZSUVIMkY0ugXJqFElBHQVEqUApsWnRsbS0
 A3rFdZF0AAAA=
X-Change-ID: 20260304-msm-fix-rbr-dde0b39202f8
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=12532;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=KTk3UNcnq3W13RKPmnE/G1sAK+8ndj+/o5tFjtWk0mo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpp6csC8zxSX2yMravTuLFsN9U5Di6Kn0uCXvW2
 /F6WqD2wd+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaaenLAAKCRCLPIo+Aiko
 1RGuCACHTAhtt9E+G9g92s6uDuIv49ilKp1z6j9EJRdIwSA7zD2j4+qc7fBepi2Pn9dcwBkWTsY
 Qb0DhvMnK0PKgLfEFsZ/J71ADSJKIyhSJazknebKNyTQkKOGySxfl4pX/4hL9JbtWVxMC47cEcr
 p1PZ6yPOyKU+k47ijQIVsorhlz5ROAvfGo+lGkiSEEtvoba8+rmh22sDNhmPgw2564a49477+GY
 /Oye3meJkPqtv1IhBGENiGbVXKPQxt1G6rb2+Hrnv8LM2bnFlE8BY2Ax4jpQB/42FMhYnSQdeHF
 9lBLoDBHa+I6FOepdkWvex3vwfL8wPC5iI/ES4CFzr3f5klo
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=M85A6iws c=1 sm=1 tr=0 ts=69a7a72f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=yxVAQYpWGZGJL5pQS9oA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: Ej3z8yaAJcA-3ZB6J2kV9WHwMvjA_hfX
X-Proofpoint-ORIG-GUID: Ej3z8yaAJcA-3ZB6J2kV9WHwMvjA_hfX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDAyOCBTYWx0ZWRfX/MGRdS5fs7XP
 BzcyxqIgntgn6IBLI4V97ULPYkkvx1YKZnjkazmoJssNc3sA2mIIUkPMZwe4RYcEV14PnkAi4xC
 rYquyraiG9IiwTE0MyjIRZCTgTLiUHldGBwTCYFc+zs6q14v47ebcTJI1TXfayA02bZPOvs7ipd
 5vMzMRz5fX9Q09f/pMZqJQ4xTTMO6KpIKbzfdcvEiBz9eGHWOz3lZhqBDinSMz2RQ9oMJpNihzo
 8yhhIOR1GTaQ7z9gsjZ8sGD7f/pas+hiYK4INP0vqe6S4WZzBw+FCFtLKx9byPG5OQXssLDwdVD
 e3xLIIyOqBCNAiDWtpU3bsYd8bMHd5o/dIdyqbovo66v3AzTvR7HxuEEutd8eds5fJVWmC+CaOL
 GqYKFm/tSmv2e/ecTFXO5PCLQL56MFrFAS0ZIJGZRCAz/TEXig8dF7J1tXW1PduNyxJ93kSUzOJ
 VZNf4OAInFwm6zO8NbQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_01,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 spamscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603040028
X-Rspamd-Queue-Id: E2A191FA57D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.1:email,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95244-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

DisplayPort Reduced Bit Rate uses link rate of 1.62 Gbps, the main link
clock should be 162 MHz. Having the incorrect frequency (160 MHz) in the
OPP table will result in selecting wrong link frequency. Correct the
entry in the OPP table.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi    | 16 ++++++++--------
 arch/arm64/boot/dts/qcom/kodiak.dtsi   |  8 ++++----
 arch/arm64/boot/dts/qcom/lemans.dtsi   |  8 ++++----
 arch/arm64/boot/dts/qcom/monaco.dtsi   |  4 ++--
 arch/arm64/boot/dts/qcom/sc7180.dtsi   |  4 ++--
 arch/arm64/boot/dts/qcom/sc8180x.dtsi  | 12 ++++++------
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 32 ++++++++++++++++----------------
 arch/arm64/boot/dts/qcom/sm6350.dtsi   |  4 ++--
 arch/arm64/boot/dts/qcom/sm8150.dtsi   |  4 ++--
 arch/arm64/boot/dts/qcom/sm8250.dtsi   |  4 ++--
 arch/arm64/boot/dts/qcom/sm8350.dtsi   |  4 ++--
 arch/arm64/boot/dts/qcom/sm8450.dtsi   |  4 ++--
 arch/arm64/boot/dts/qcom/talos.dtsi    |  4 ++--
 13 files changed, 54 insertions(+), 54 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index 694f5e21d82f..439aaf3ce3e8 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -5774,8 +5774,8 @@ mdss_dp0_out: endpoint {
 				mdss_dp0_opp_table: opp-table {
 					compatible = "operating-points-v2";
 
-					opp-160000000 {
-						opp-hz = /bits/ 64 <160000000>;
+					opp-162000000 {
+						opp-hz = /bits/ 64 <162000000>;
 						required-opps = <&rpmhpd_opp_low_svs>;
 					};
 
@@ -5863,8 +5863,8 @@ mdss_dp1_out: endpoint {
 				mdss_dp1_opp_table: opp-table {
 					compatible = "operating-points-v2";
 
-					opp-160000000 {
-						opp-hz = /bits/ 64 <160000000>;
+					opp-162000000 {
+						opp-hz = /bits/ 64 <162000000>;
 						required-opps = <&rpmhpd_opp_low_svs>;
 					};
 
@@ -5951,8 +5951,8 @@ mdss_dp2_out: endpoint {
 				mdss_dp2_opp_table: opp-table {
 					compatible = "operating-points-v2";
 
-					opp-160000000 {
-						opp-hz = /bits/ 64 <160000000>;
+					opp-162000000 {
+						opp-hz = /bits/ 64 <162000000>;
 						required-opps = <&rpmhpd_opp_low_svs>;
 					};
 
@@ -6034,8 +6034,8 @@ mdss_dp3_out: endpoint {
 				mdss_dp3_opp_table: opp-table {
 					compatible = "operating-points-v2";
 
-					opp-160000000 {
-						opp-hz = /bits/ 64 <160000000>;
+					opp-162000000 {
+						opp-hz = /bits/ 64 <162000000>;
 						required-opps = <&rpmhpd_opp_low_svs>;
 					};
 
diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index 6079e67ea829..8f05ba696d95 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -5505,8 +5505,8 @@ port@1 {
 				edp_opp_table: opp-table {
 					compatible = "operating-points-v2";
 
-					opp-160000000 {
-						opp-hz = /bits/ 64 <160000000>;
+					opp-162000000 {
+						opp-hz = /bits/ 64 <162000000>;
 						required-opps = <&rpmhpd_opp_low_svs>;
 					};
 
@@ -5604,8 +5604,8 @@ mdss_dp_out: endpoint {
 				dp_opp_table: opp-table {
 					compatible = "operating-points-v2";
 
-					opp-160000000 {
-						opp-hz = /bits/ 64 <160000000>;
+					opp-162000000 {
+						opp-hz = /bits/ 64 <162000000>;
 						required-opps = <&rpmhpd_opp_low_svs>;
 					};
 
diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 808827b83553..67b2c7e819ad 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -5404,8 +5404,8 @@ port@1 {
 				dp_opp_table: opp-table {
 					compatible = "operating-points-v2";
 
-					opp-160000000 {
-						opp-hz = /bits/ 64 <160000000>;
+					opp-162000000 {
+						opp-hz = /bits/ 64 <162000000>;
 						required-opps = <&rpmhpd_opp_low_svs>;
 					};
 
@@ -5492,8 +5492,8 @@ port@1 {
 				dp1_opp_table: opp-table {
 					compatible = "operating-points-v2";
 
-					opp-160000000 {
-						opp-hz = /bits/ 64 <160000000>;
+					opp-162000000 {
+						opp-hz = /bits/ 64 <162000000>;
 						required-opps = <&rpmhpd_opp_low_svs>;
 					};
 
diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 5d2df4305d1c..08beb397db62 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -5697,8 +5697,8 @@ port@1 {
 				dp_opp_table: opp-table {
 					compatible = "operating-points-v2";
 
-					opp-160000000 {
-						opp-hz = /bits/ 64 <160000000>;
+					opp-162000000 {
+						opp-hz = /bits/ 64 <162000000>;
 						required-opps = <&rpmhpd_opp_low_svs>;
 					};
 
diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 45b9864e3304..8d69225a4271 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -3460,8 +3460,8 @@ port@1 {
 				dp_opp_table: opp-table {
 					compatible = "operating-points-v2";
 
-					opp-160000000 {
-						opp-hz = /bits/ 64 <160000000>;
+					opp-162000000 {
+						opp-hz = /bits/ 64 <162000000>;
 						required-opps = <&rpmhpd_opp_low_svs>;
 					};
 
diff --git a/arch/arm64/boot/dts/qcom/sc8180x.dtsi b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
index 8319d892c6e4..f45deb188c6c 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
@@ -3322,8 +3322,8 @@ mdss_dp0_out: endpoint {
 				dp0_opp_table: opp-table {
 					compatible = "operating-points-v2";
 
-					opp-160000000 {
-						opp-hz = /bits/ 64 <160000000>;
+					opp-162000000 {
+						opp-hz = /bits/ 64 <162000000>;
 						required-opps = <&rpmhpd_opp_low_svs>;
 					};
 
@@ -3404,8 +3404,8 @@ mdss_dp1_out: endpoint {
 				dp1_opp_table: opp-table {
 					compatible = "operating-points-v2";
 
-					opp-160000000 {
-						opp-hz = /bits/ 64 <160000000>;
+					opp-162000000 {
+						opp-hz = /bits/ 64 <162000000>;
 						required-opps = <&rpmhpd_opp_low_svs>;
 					};
 
@@ -3480,8 +3480,8 @@ mdss_edp_out: endpoint {
 				edp_opp_table: opp-table {
 					compatible = "operating-points-v2";
 
-					opp-160000000 {
-						opp-hz = /bits/ 64 <160000000>;
+					opp-162000000 {
+						opp-hz = /bits/ 64 <162000000>;
 						required-opps = <&rpmhpd_opp_low_svs>;
 					};
 
diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index 706eb1309d3f..58876b25dd23 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -4769,8 +4769,8 @@ mdss0_dp0_out: endpoint {
 				mdss0_dp0_opp_table: opp-table {
 					compatible = "operating-points-v2";
 
-					opp-160000000 {
-						opp-hz = /bits/ 64 <160000000>;
+					opp-162000000 {
+						opp-hz = /bits/ 64 <162000000>;
 						required-opps = <&rpmhpd_opp_low_svs>;
 					};
 
@@ -4851,8 +4851,8 @@ mdss0_dp1_out: endpoint {
 				mdss0_dp1_opp_table: opp-table {
 					compatible = "operating-points-v2";
 
-					opp-160000000 {
-						opp-hz = /bits/ 64 <160000000>;
+					opp-162000000 {
+						opp-hz = /bits/ 64 <162000000>;
 						required-opps = <&rpmhpd_opp_low_svs>;
 					};
 
@@ -4931,8 +4931,8 @@ mdss0_dp2_out: endpoint {
 				mdss0_dp2_opp_table: opp-table {
 					compatible = "operating-points-v2";
 
-					opp-160000000 {
-						opp-hz = /bits/ 64 <160000000>;
+					opp-162000000 {
+						opp-hz = /bits/ 64 <162000000>;
 						required-opps = <&rpmhpd_opp_low_svs>;
 					};
 
@@ -5006,8 +5006,8 @@ mdss0_dp3_out: endpoint {
 				mdss0_dp3_opp_table: opp-table {
 					compatible = "operating-points-v2";
 
-					opp-160000000 {
-						opp-hz = /bits/ 64 <160000000>;
+					opp-162000000 {
+						opp-hz = /bits/ 64 <162000000>;
 						required-opps = <&rpmhpd_opp_low_svs>;
 					};
 
@@ -6125,8 +6125,8 @@ mdss1_dp0_out: endpoint {
 				mdss1_dp0_opp_table: opp-table {
 					compatible = "operating-points-v2";
 
-					opp-160000000 {
-						opp-hz = /bits/ 64 <160000000>;
+					opp-162000000 {
+						opp-hz = /bits/ 64 <162000000>;
 						required-opps = <&rpmhpd_opp_low_svs>;
 					};
 
@@ -6205,8 +6205,8 @@ mdss1_dp1_out: endpoint {
 				mdss1_dp1_opp_table: opp-table {
 					compatible = "operating-points-v2";
 
-					opp-160000000 {
-						opp-hz = /bits/ 64 <160000000>;
+					opp-162000000 {
+						opp-hz = /bits/ 64 <162000000>;
 						required-opps = <&rpmhpd_opp_low_svs>;
 					};
 
@@ -6285,8 +6285,8 @@ mdss1_dp2_out: endpoint {
 				mdss1_dp2_opp_table: opp-table {
 					compatible = "operating-points-v2";
 
-					opp-160000000 {
-						opp-hz = /bits/ 64 <160000000>;
+					opp-162000000 {
+						opp-hz = /bits/ 64 <162000000>;
 						required-opps = <&rpmhpd_opp_low_svs>;
 					};
 
@@ -6360,8 +6360,8 @@ mdss1_dp3_out: endpoint {
 				mdss1_dp3_opp_table: opp-table {
 					compatible = "operating-points-v2";
 
-					opp-160000000 {
-						opp-hz = /bits/ 64 <160000000>;
+					opp-162000000 {
+						opp-hz = /bits/ 64 <162000000>;
 						required-opps = <&rpmhpd_opp_low_svs>;
 					};
 
diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
index 9f9b9f9af0da..fec01750e2c7 100644
--- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
@@ -2346,8 +2346,8 @@ mdss_dp_out: endpoint {
 				dp_opp_table: opp-table {
 					compatible = "operating-points-v2";
 
-					opp-160000000 {
-						opp-hz = /bits/ 64 <160000000>;
+					opp-162000000 {
+						opp-hz = /bits/ 64 <162000000>;
 						required-opps = <&rpmhpd_opp_low_svs>;
 					};
 
diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index 97ca5275d740..0e101096209a 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -3954,8 +3954,8 @@ mdss_dp_out: endpoint {
 				dp_opp_table: opp-table {
 					compatible = "operating-points-v2";
 
-					opp-160000000 {
-						opp-hz = /bits/ 64 <160000000>;
+					opp-162000000 {
+						opp-hz = /bits/ 64 <162000000>;
 						required-opps = <&rpmhpd_opp_low_svs>;
 					};
 
diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index c7dffa440074..01453aaa1752 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -4826,8 +4826,8 @@ mdss_dp_out: endpoint {
 				dp_opp_table: opp-table {
 					compatible = "operating-points-v2";
 
-					opp-160000000 {
-						opp-hz = /bits/ 64 <160000000>;
+					opp-162000000 {
+						opp-hz = /bits/ 64 <162000000>;
 						required-opps = <&rpmhpd_opp_low_svs>;
 					};
 
diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index 5c8fe213f5e4..28b4b79d2587 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -2925,8 +2925,8 @@ mdss_dp_out: endpoint {
 				dp_opp_table: opp-table {
 					compatible = "operating-points-v2";
 
-					opp-160000000 {
-						opp-hz = /bits/ 64 <160000000>;
+					opp-162000000 {
+						opp-hz = /bits/ 64 <162000000>;
 						required-opps = <&rpmhpd_opp_low_svs>;
 					};
 
diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 920a2d1c04d0..fd2d5648b92a 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -3508,8 +3508,8 @@ mdss_dp0_out: endpoint {
 				dp_opp_table: opp-table {
 					compatible = "operating-points-v2";
 
-					opp-160000000 {
-						opp-hz = /bits/ 64 <160000000>;
+					opp-162000000 {
+						opp-hz = /bits/ 64 <162000000>;
 						required-opps = <&rpmhpd_opp_low_svs>;
 					};
 
diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index 75716b4a58d6..b4c8406c6738 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -3958,8 +3958,8 @@ mdss_dp0_out: endpoint {
 				dp_opp_table: opp-table {
 					compatible = "operating-points-v2";
 
-					opp-160000000 {
-						opp-hz = /bits/ 64 <160000000>;
+					opp-162000000 {
+						opp-hz = /bits/ 64 <162000000>;
 						required-opps = <&rpmhpd_opp_low_svs>;
 					};
 

---
base-commit: 3fa5e5702a82d259897bd7e209469bc06368bf31
change-id: 20260304-msm-fix-rbr-dde0b39202f8

Best regards,
-- 
With best wishes
Dmitry


