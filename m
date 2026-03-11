Return-Path: <linux-arm-msm+bounces-96812-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YKunGkvUsGmLnQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96812-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 03:32:43 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E32DC25AFEA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 03:32:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6625F304F323
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 02:32:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FA863370E3;
	Wed, 11 Mar 2026 02:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dM8fBTNK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KlCbGvqp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FC61278161
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 02:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773196349; cv=none; b=ca0pCV62iiZTVFcfQl9zlDv7LYtFosfEixYpAzZSfLt+ai3amgGHgSh7WVCvKlDXKtV96pUOq/71BJXx/+yrNtJ3I7C8pTjI1y+X08L0yArDGdeXsSeoeA+cNfm8Zme7tjS0cNz/JIvVezHPJ0t5EScd5byAhnjPYk1KBqK60Sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773196349; c=relaxed/simple;
	bh=/WnnHz20JL4LJIpw3kNdPIqRr0TwffT1dw5WMebNVxc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Z8ioGfeEoSba28TfEko2y4rWDBYqJHb3WogG4TLW66uwIzBgJiSyH+ukjou2Uay5i3xKYmpXYzpQVVF2lNptpAlmN0RhlDtqxjTlpWpihuvLGN8dXAQCXi7TwfAtbi1mfwmBjvm28fwcRPrfLyepuIe94HfXa+C3Y2WBPL20DK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dM8fBTNK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KlCbGvqp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62AIpejL303881
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 02:32:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=PvMJaoAUFTpeCu9LcxMc1h+yA2zabj4CO5K
	7XnJbko0=; b=dM8fBTNK8t3EFPdebFQMW3nDlVpFHEMaNnnhaNO1KWiIh1AIEsC
	/8i9ZSCSqVWJFs0TWvPzDWSQmHznArYdvmFzjYTG9GQUYTzDjhXusenPnffo+k3h
	PyuWL9Ui0OKdxnafruqPgp2+fvvcyrG5Fz1KDfH/ZUD+uha+RaehbaHpPMnPwaca
	R/CVl+B9rlHHBpBvUMZXoqvlfyrwmNQeCouZcNt5P9PzasO+lsb4hRKD03izWiw5
	x5YEVso/DbggM9ruMfdZw02aC20tE+/dWCsfrFxCvQW/Ad19J2xr6tJrpu5Nlrkq
	2p6zRGv9bnF26H2TnAtS9975LLMzx6SDytA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cthjf39xq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 02:32:27 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-829b20cc6faso397442b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 19:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773196346; x=1773801146; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PvMJaoAUFTpeCu9LcxMc1h+yA2zabj4CO5K7XnJbko0=;
        b=KlCbGvqpt5H6u88geMJLqejbgMrwKsjMz+e95RTQ6vtEW0riBQJAoJMAQ2Y+ItHD21
         oNJhC8BfKPWHE9ESW+VygzyhE/9lCvBrIY2kdySYTtm4V/E5UiZzwpY6aP4Yks2/r6S5
         nv2R689Bx0d300hNk7C+Y+t7x4+oBnctra1LHLDJvq+mJsE4Q2BhrBIdt9+HxMboI+6n
         syYXxETXnA9vIGWaaYSqTHZGNIeGh4JaJvb3ySLmPbgOAPUBvQqN4W0JJbhLWWxx4XR8
         LI1BYzLFKn2IKod6D3T4MGTcKYHfoE2zCUpD5qRlqiXfP4dTOFtOZhpnoZdlYfGJoXgY
         vapg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773196346; x=1773801146;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PvMJaoAUFTpeCu9LcxMc1h+yA2zabj4CO5K7XnJbko0=;
        b=EbuqGeIytlCzuqZRXDVjiCnRp3axaO+6Blk+rAZguSoG/BIghBMUHnMzaxS0Sz1uRd
         HsegY5T0VkO+x8nuztW2Bj+NA+Rqqzh1ZtarvZ95eSxBfO82wiGy0TP7cl7lRQg+g3tw
         XoiCswbf7KQAlJNANCUMI+wmTH8T8RZnh++vUCq0ZlPMbq8WMkay+yyLUkTpEWQtx+Tv
         TKneCHtVKe4CDww/DnlKlenoO/2TeToHPpnGlM2ukCl7A9DdCzQgXHXYFkz0shlyTCHJ
         4Kw+FJWy+rv9phApzzTbGNW121LgqXzEWRXmYMrZA3DXOiU7vuX4y3kjnUMYTfSSL5Q0
         Z4JA==
X-Gm-Message-State: AOJu0Yx211LbjDazdxWxFk7CuFQdBbP7R8Qii7BLIsnmDJXnYaXaEcIz
	id2EERUeQfAYRuwdd7VyUsTOF7O91oozd123EXhUKMiPjoo02/mbatZFXYvFv00UQbQ723pSddc
	NzVzUTraXt9vnAR5+R+TfU9lHaVefzLe0KVWZX5Efw7vqfoAoV4FIuuUkayq9no/fMIK5
X-Gm-Gg: ATEYQzzyWQS/DfsQFCDXugk+cRLO3J6smxlJTmoCmKTr2USt+zDACjrEkLmaeiOIdb/
	kAkuUq6yeSq1fBiGQz+L3jGlor7Xxh3Ze4oZGIS2fUrtRSpUdrgbteBKFpwDxqk9irBFlf0LSgv
	orh3gVeY6SNBzOBenJop+002kEqzKcKkrypkt/J0LE9XJ1JiwORStnDszZuEb54xkrMyGHbn4Ck
	tG+WLphR5HWZUpd+87eO4gszA78iT0d+/WkC1dCyRWMG8HPmT7xEq40WeoONSRmh4+ch7g/FSUa
	zfBo9y85ELq9aQ8jgHct8j+KF+fVp2Uax8QKgWiIUgdnS5+Mfn9auz+4x8nvWKtkuCfLhxluwIn
	V+Ygn57bjQmSgJUNV5utwv8JpNF16o3BsLVkSXzBRGlNSad9NhNN0wqfD0w==
X-Received: by 2002:a05:6a00:91c5:b0:829:f775:110c with SMTP id d2e1a72fcca58-829f775455emr649016b3a.30.1773196346538;
        Tue, 10 Mar 2026 19:32:26 -0700 (PDT)
X-Received: by 2002:a05:6a00:91c5:b0:829:f775:110c with SMTP id d2e1a72fcca58-829f775455emr648987b3a.30.1773196345895;
        Tue, 10 Mar 2026 19:32:25 -0700 (PDT)
Received: from hangtian-z2-2004.ap.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829f6dc2d15sm680869b3a.12.2026.03.10.19.32.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 19:32:25 -0700 (PDT)
From: Hangtian Zhu <hangtian.zhu@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: qcs6490-rb3gen2-industrial-mezzanine: disable wcn6750 and wpss
Date: Wed, 11 Mar 2026 10:32:19 +0800
Message-Id: <20260311023219.2284643-1-hangtian.zhu@oss.qualcomm.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: L8g29ssGlkDXvfB9YLMIlsPi7zTSc42o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDAyMCBTYWx0ZWRfX1jVOWhJgyQte
 m21shO+TG185Z32AWqkcO1igrfXdqkrGOArZNc3uTsE9Kq9nfN9sUewTP4kRS2hwnw3VmsB086X
 K3okOV7DQCJqYCqka7+A+MIajbauPV1wILVhVzVVQDV+MUZf6Ei7tzT685JzfRFrbubSS+kJQsQ
 KALcnQzSQ/65gpxgQ2pGU2cy2O82uWpfYhWnb37YOVm4VMWSxGkNr1Eagod2rNEUsjrJenfFwPo
 Ap3X4/7b1z+otE89jU0K/sr6+ha+dijzmxK0+KTKncMrlCMZDAPZUk0jVkSxKenhxw5NFuNaAI/
 hRFHsaFsExvUi9AW2csY3AQ6wKQi3HO991wGFzWlNJO33WwfHH+Vq1ChyUJ5MfO09jvFx/cD7Ok
 +Owj1ZWqqkK8vbofeFNE6JfzVlP5A+OFTZgs4KC7PvdKCLXfwbyQKxNCxZLUwiHq0uKOQbP2qMp
 mWRmjjVfY9NO1CeLMig==
X-Authority-Analysis: v=2.4 cv=A71h/qWG c=1 sm=1 tr=0 ts=69b0d43b cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=o7Z_n79bENMEhQF7KSsA:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: L8g29ssGlkDXvfB9YLMIlsPi7zTSc42o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_05,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1011 suspectscore=0 bulkscore=0
 adultscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110020
X-Rspamd-Queue-Id: E32DC25AFEA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-96812-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hangtian.zhu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

From: Hangtian Zhu <hangtian@oss.qualcomm.com>

Disable wcn6750 and wpss on industrial mezzanine. On rb3gen2 industrial
mezzanine platform, pcie0 lines are moved from wcn6750 to qps615 pcie
bridge. Hence disable wpss and wcn6750 nodes for industrial mezzanine
platform.

Depends-on: [PATCH v4 1/2] arm64: dts: qcom:
qcs6490-rb3gen2-industrial-mezzanine: Add TC9563 PCIe switch node for PCIe0
Depends-on: [PATCH v4 2/2] arm64: dts: qcom:
qcs6490-rb3gen2-industrial-mezzanine: Add second TC9563 PCIe switch node
for PCIe1

Signed-off-by: Hangtian Zhu <hangtian@oss.qualcomm.com>
---
 .../dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso    | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
index 2a2b7c2f9210..6594c7e1ea93 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
@@ -32,6 +32,10 @@ vreg_1p8: regulator-vreg-1p8 {
 	};
 };
 
+&remoteproc_wpss {
+       status = "disabled";
+};
+
 &spi11 {
 	#address-cells = <1>;
 	#size-cells = <0>;
@@ -280,3 +284,7 @@ pcie1_tc9563_resx_n: pcie1-tc9563-resx-state {
 	};
 
 };
+
+&wifi {
+       status = "disabled";
+};
-- 
2.25.1


