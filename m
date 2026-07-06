Return-Path: <linux-arm-msm+bounces-116799-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ayOHHr+gS2otXQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116799-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 14:34:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CE707710926
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 14:34:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=a46SNaYG;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=fL0IogjP;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116799-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116799-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9542A3035F00
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 12:32:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41CA742F6FA;
	Mon,  6 Jul 2026 12:31:46 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1317F42F703
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 12:31:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783341105; cv=none; b=m9PVzs0T5xTJKflQWymNUWuQp63SCV2xT5Ggr6uZ2f9SIheq6UK3w/JLkSon0Z6KS9BWy0neLcsfoAhZW7eYZgJu1voa3GvqgpHr1hJpL5MzenT0X1OF/22DTuuMHCxmmf4JDg0WD85d065J8fbUQF7+BBM0G1Adl/U6AqYvFO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783341105; c=relaxed/simple;
	bh=/GzaFAOemySs/nlLPtlFiaFz3jJ0quf8oFuTtWmRDak=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WHLLPrffGbUdUfbt9NaID6y9t3GOjnQYmB47Ux6NqAT/1yq7T2FaL34G7O94YDAFhgkHormugppeFLHEac3H6hRIOA6FNuKbJLJZdAU2mYdljREB8oNsFooN/ZXueyz7PDnMjQTvOhm47wiBMoRrUw+rhk2GwBOiHXu1q+DourU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a46SNaYG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fL0IogjP; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666Ax90N391072
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 12:31:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FPtJLqoAlsxEODuiTU8suBNjHSX7SMerMst72naEVeA=; b=a46SNaYGU4uehRa6
	yLA3lIQWlyQukrq7E1GLJ1VRhwyfbjo2mFQD4yfqytW6x5RYLu7G6J0O8KwjHYIi
	epILVVmGYpWsY4D8CmcTNzzl7Ezm1KinwkdOaLJb+u94w80swP7D2f5yazHsxQkz
	IF4Ce2pBc79sD+bLUTa0+9plF+T/VW1EAl/9xhftOmGD54NZ9IgKa/zLu03HKsgo
	tnKhp3tMMPYZ/1G8bcjWEAeDJ2UBgbuo9ew9WMlL+m1aRW86ZaSP3LJVdcKPk8x9
	Lc0leNPcYt3EPs/JDhLX7FuAlillmLqEsLHzrt5xjhCCy/gcM3WwUXRJyPPNwwc4
	3Cskrw==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f89kgrpxe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 12:31:42 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-9691eef15f5so817764241.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 05:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783341101; x=1783945901; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FPtJLqoAlsxEODuiTU8suBNjHSX7SMerMst72naEVeA=;
        b=fL0IogjPM614sFo5I/05TPlINUlAUXkjNrfgT75zebGnOtypBB3AoNEyCdL5dSb/k7
         NZ2Hcb8OJ5lNK2lBT9Nm1c41SzgqVVFbqVL8dWy27G4gK3fy3LUCTWxcZxmo0ogvSN+V
         7+oocxqgmq6jci2G/bIvTvQuSX6FEWYjdwzqwwXMeDh9kFk+FlKhInmfHI4etGPV06UX
         lkgawU6l2A5RDrECgWe1SPpGxt7MHVKGD9w/z1zXljcomCaNJ9oX4gMOJYL3QJsCrcYt
         8XIRyRAAAtD07SmuxriYmw80LsyH4vtMtcU+aXwc1IiuGNa6QM4N6xUzXHUX6oGFB2/W
         VOEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783341101; x=1783945901;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FPtJLqoAlsxEODuiTU8suBNjHSX7SMerMst72naEVeA=;
        b=NvTQ+vDOqpPXaRLjZnmkDmGjCnq4al9hPZi6RwYK7cXCKME4Ciq62tiJbXFlFgJpLV
         GiktZinc+1YA3sok8WQlWiVESR4VUkI1QOkBaGg9H5Ka/4Ngj0u3zuSo0KT1Rd9PkoRh
         Cv2GooFJRMc4aZW++f+FRkOOox6Y4Wte6qoYX+YHwpgcwbTP+Ohz91IQuZBF+OQOsebO
         JbzJ+DLjks1uSQXoiW8MH2Xvs8RDNfgFGvGDqHsOffwPyEiwB/fPVJL7zVF8XE22M80O
         RRGnuqaPief5qZ83ltPvJk1hUCuYAS3jL7bqgbIW/Flsp5vUOle7ZnyDXENPrUSUqX2A
         BNNw==
X-Gm-Message-State: AOJu0YxhpoAM2wLGCYDtb4XpOR1pfY4j1GOGG+vNXQ5U25nZiuxaNTPU
	Snx00Bdz+I2cDs/v9eFxX3Xy9NVxtBz0cT9PjJojuMBjd93jygEknZSX0RNT5DYu9lxk2piX9f3
	ZLlEtLRST9cF61P31X8L/Oo+l1ReDU2GVsupaE9k5xFw2EQlWwMv5x0dTiZooAh+IO+g=
X-Gm-Gg: AfdE7cl1989VGR2Wqx2GlUWSzGzYr4q5uOlOrViUenIDV61cId6aTEv4UQwrFQrWHJP
	1xwOW6Fx3tV0OToBcuONYX5OadQynF1hdb3mBpjx+ZjAxqHda2F9FCIdLQ4hnST0EcpfqVKSSuw
	Ua6qleB+3MeqpyYjRrPMJxVJsa19p3aRQQGj8v44nVeQ2PqMTRL6cAaPEeEj3UGP1xr5Ngsxddq
	THI8ra81GoMerhO/OiVkTsyKyjfPHir4RHZjCIscjIpzkGjphf3HmN0fu+dyLtvGzA0MVeMSgiI
	52y4BG1+OG+f0c1uAHE0WMcZhWVPlQXjeVhl5iOYJiq089VbahfswDUx42EuFHK3oaKBlYVPsKL
	mU1xxbPMuQWSbkyVDUrwo3yb1/U00iAuHznOzUkuk
X-Received: by 2002:a05:6102:c08:b0:73a:2195:4386 with SMTP id ada2fe7eead31-744b7e4e3a8mr107850137.24.1783341101301;
        Mon, 06 Jul 2026 05:31:41 -0700 (PDT)
X-Received: by 2002:a05:6102:c08:b0:73a:2195:4386 with SMTP id ada2fe7eead31-744b7e4e3a8mr107806137.24.1783341100861;
        Mon, 06 Jul 2026 05:31:40 -0700 (PDT)
Received: from hu-kotarake-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-969838e1980sm5252990241.7.2026.07.06.05.31.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 05:31:40 -0700 (PDT)
From: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 18:01:06 +0530
Subject: [PATCH v3 2/4] regulator: qcom_usb_vbus: add register abstraction
 and PM8150B support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-add_pm4125-vbus-reg-v3-2-999d78a87b81@oss.qualcomm.com>
References: <20260706-add_pm4125-vbus-reg-v3-0-999d78a87b81@oss.qualcomm.com>
In-Reply-To: <20260706-add_pm4125-vbus-reg-v3-0-999d78a87b81@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, jishnu.prakash@oss.qualcomm.com,
        kamal.wadhwa@oss.qualcomm.com, Krzysztof Kozlowski <krzk@kernel.org>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783341082; l=4897;
 i=rakesh.kota@oss.qualcomm.com; s=20250919; h=from:subject:message-id;
 bh=/GzaFAOemySs/nlLPtlFiaFz3jJ0quf8oFuTtWmRDak=;
 b=C2vCoEe5tidcdA+fabiAER2zmvmjcEDfMkbAEd1nGmJv8vRcF0zurc2NP5QsbCIPlT+ChJe4K
 HcsBQII1k5RDTKIFokDQcvpDmt8EURZlCTyN+2oNMkRvxYb8utCcLiV
X-Developer-Key: i=rakesh.kota@oss.qualcomm.com; a=ed25519;
 pk=dFhv9yPC8egZglsSLDMls08cOvZKZkG6QQn1a/ofwNU=
X-Proofpoint-GUID: hL_9Si9dPmOIuPkTwTkBf8D3uI5xX-Yk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEyNyBTYWx0ZWRfX3jSjij6/lNU7
 s6e4vS980nkMit+J0znlZIhdj5ueaCHOSmjBZypd6AXurdP87KRuOHHzYu+jvqj/KV9INDTKtjm
 HrokrRM7/TlbR/S9Eqt3Xxp25wMzOjpLah97/MNkyGxVVDRdWi6IYrP2OQuz321NGx0QvBRf4nB
 RMUka6HwpTs/gCyhovzTrnHzqu/Z+xfQWjJGXOfiNH335RzpzO4ghtPIpb2ZinCZptdvdoDIhei
 1BMWgDG2teOCEUkvHajNnQwONPiIJK+2YTxFSWPtYv09aNLb0nT6OICLk4uiTkuKrj7R2gmV4dF
 aJpe4WXyBgctoZ7dHrEOw6m4pmgxjLPP1Jx86E+KRVneoswWuFl/C5UB+JXBf6M69r8bBfYsIoI
 KurD/szmO5Vnd+YpX0fRldZUhR+nTu6KEsS0QwmkrK2LP1zlGkK+5lHhvvoqsIv3EvWGR11BAMm
 qtZMBbHWKKG6Q6+k/Nw==
X-Proofpoint-ORIG-GUID: hL_9Si9dPmOIuPkTwTkBf8D3uI5xX-Yk
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEyNyBTYWx0ZWRfXzdlH8nt2T24h
 njNpStpgSvdUjh3rj2tnBmQ2mQ0SK+m6ir/Vg+/D+OQTXXiRIDF8TeuRj3MiFl1gDSp9smn/+zP
 x2P4QChWZWphWY01L/fwPNdi60EITQU=
X-Authority-Analysis: v=2.4 cv=c6Sbhx9l c=1 sm=1 tr=0 ts=6a4ba02e cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=aEv-xYknOxzy9_AnOEwA:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060127
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-116799-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,quicinc.com];
	FORGED_RECIPIENTS(0.00)[m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_wcheng@quicinc.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:bod@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:jishnu.prakash@oss.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:krzk@kernel.org,m:rakesh.kota@oss.qualcomm.com,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[rakesh.kota@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rakesh.kota@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CE707710926

Introduce per-compatible regulator descriptor data via struct
qcom_usb_vbus_reg_data to abstract register layout differences between
PMICs. This allows the probe function to dynamically populate the
regulator_desc fields rather than relying on compile-time constants.

Refactor the existing PM8150B support to use this abstraction, wiring in
its CMD_OTG, OTG_CFG, and current-limit registers through pm8150b_data.
No functional change is intended for PM8150B.

Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
---
 drivers/regulator/qcom_usb_vbus-regulator.c | 71 +++++++++++++++++++++++------
 1 file changed, 57 insertions(+), 14 deletions(-)

diff --git a/drivers/regulator/qcom_usb_vbus-regulator.c b/drivers/regulator/qcom_usb_vbus-regulator.c
index cd94ed67621fee9f6d7a0327054db0ebab6cc7ee..0201a3983981eec1f475d4b8cdccc9148b5e3b2e 100644
--- a/drivers/regulator/qcom_usb_vbus-regulator.c
+++ b/drivers/regulator/qcom_usb_vbus-regulator.c
@@ -20,6 +20,21 @@
 #define OTG_CFG				0x53
 #define OTG_EN_SRC_CFG			BIT(1)
 
+struct qcom_usb_vbus_reg_data {
+	u16 cmd_otg;
+	u16 otg_cfg;
+	u8  otg_en_src_cfg;
+	u16 csel_reg;
+	u8 csel_mask;
+	const unsigned int *curr_table;
+	unsigned int n_current_limits;
+	u16 vsel_reg;
+	u8 vsel_mask;
+	const unsigned int *volt_table;
+	unsigned int n_voltages;
+	const struct regulator_ops *ops;
+};
+
 static const unsigned int curr_table[] = {
 	500000, 1000000, 1500000, 2000000, 2500000, 3000000,
 };
@@ -32,19 +47,23 @@ static const struct regulator_ops qcom_usb_vbus_reg_ops = {
 	.set_current_limit = regulator_set_current_limit_regmap,
 };
 
-static struct regulator_desc qcom_usb_vbus_rdesc = {
-	.name = "usb_vbus",
-	.ops = &qcom_usb_vbus_reg_ops,
-	.owner = THIS_MODULE,
-	.type = REGULATOR_VOLTAGE,
+static const struct qcom_usb_vbus_reg_data pm8150b_data = {
+	.cmd_otg = CMD_OTG,
+	.otg_cfg = OTG_CFG,
+	.otg_en_src_cfg = OTG_EN_SRC_CFG,
+	.csel_reg = OTG_CURRENT_LIMIT_CFG,
+	.csel_mask = OTG_CURRENT_LIMIT_MASK,
 	.curr_table = curr_table,
 	.n_current_limits = ARRAY_SIZE(curr_table),
+	.ops = &qcom_usb_vbus_reg_ops,
 };
 
 static int qcom_usb_vbus_regulator_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
+	const struct qcom_usb_vbus_reg_data *data;
 	struct regulator_dev *rdev;
+	struct regulator_desc *rdesc;
 	struct regmap *regmap;
 	struct regulator_config config = { };
 	struct regulator_init_data *init_data;
@@ -57,27 +76,51 @@ static int qcom_usb_vbus_regulator_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	data = of_device_get_match_data(dev);
+	if (!data)
+		return -EINVAL;
+
 	regmap = dev_get_regmap(dev->parent, NULL);
 	if (!regmap) {
 		dev_err(dev, "Failed to get regmap\n");
 		return -ENOENT;
 	}
 
-	init_data = of_get_regulator_init_data(dev, dev->of_node,
-					       &qcom_usb_vbus_rdesc);
+	rdesc = devm_kzalloc(dev, sizeof(*rdesc), GFP_KERNEL);
+	if (!rdesc)
+		return -ENOMEM;
+
+	rdesc->name = "usb_vbus";
+	rdesc->ops = data->ops;
+	rdesc->owner = THIS_MODULE;
+	rdesc->type = REGULATOR_VOLTAGE;
+	rdesc->enable_reg = base + data->cmd_otg;
+	rdesc->enable_mask = OTG_EN;
+
+	if (data->curr_table) {
+		rdesc->curr_table = data->curr_table;
+		rdesc->n_current_limits = data->n_current_limits;
+		rdesc->csel_reg = base + data->csel_reg;
+		rdesc->csel_mask = data->csel_mask;
+	}
+
+	if (data->volt_table) {
+		rdesc->volt_table = data->volt_table;
+		rdesc->n_voltages = data->n_voltages;
+		rdesc->vsel_reg = base + data->vsel_reg;
+		rdesc->vsel_mask = data->vsel_mask;
+	}
+
+	init_data = of_get_regulator_init_data(dev, dev->of_node, rdesc);
 	if (!init_data)
 		return -ENOMEM;
 
-	qcom_usb_vbus_rdesc.enable_reg = base + CMD_OTG;
-	qcom_usb_vbus_rdesc.enable_mask = OTG_EN;
-	qcom_usb_vbus_rdesc.csel_reg = base + OTG_CURRENT_LIMIT_CFG;
-	qcom_usb_vbus_rdesc.csel_mask = OTG_CURRENT_LIMIT_MASK;
 	config.dev = dev;
 	config.init_data = init_data;
 	config.of_node = dev->of_node;
 	config.regmap = regmap;
 
-	rdev = devm_regulator_register(dev, &qcom_usb_vbus_rdesc, &config);
+	rdev = devm_regulator_register(dev, rdesc, &config);
 	if (IS_ERR(rdev)) {
 		ret = PTR_ERR(rdev);
 		dev_err(dev, "not able to register vbus reg %d\n", ret);
@@ -85,13 +128,13 @@ static int qcom_usb_vbus_regulator_probe(struct platform_device *pdev)
 	}
 
 	/* Disable HW logic for VBUS enable */
-	regmap_update_bits(regmap, base + OTG_CFG, OTG_EN_SRC_CFG, 0);
+	regmap_update_bits(regmap, base + data->otg_cfg, data->otg_en_src_cfg, 0);
 
 	return 0;
 }
 
 static const struct of_device_id qcom_usb_vbus_regulator_match[] = {
-	{ .compatible = "qcom,pm8150b-vbus-reg" },
+	{ .compatible = "qcom,pm8150b-vbus-reg", .data = &pm8150b_data },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, qcom_usb_vbus_regulator_match);

-- 
2.34.1


