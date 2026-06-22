Return-Path: <linux-arm-msm+bounces-113924-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CVFKHUPEOGovhwcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113924-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 07:12:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A1FD6ACAE7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 07:12:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=NdrEeNpt;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=c4nemu6y;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113924-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113924-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1CBE7300CB39
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 05:12:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4844335F164;
	Mon, 22 Jun 2026 05:11:44 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2EB335DA6D
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 05:11:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782105104; cv=none; b=AcdGTQJ1iG24+JtGDBDbzeK3DClLEfGMccwxLfM0ntCUGNPHDuOF0Oj0BSHUZY33qDJtXZDY0psoTSZGH17HCjqxmLUitxSIbOm9nDZJzqshkHo3dIX17EveSVrItneKc0mOqN/i3Yg6W1kSNH6YkPfC8r68pkKg6DC1pQUxFCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782105104; c=relaxed/simple;
	bh=87z1o4XyGauYHYE1QVaxn8pz2zob1D2UjTKFIy1fTD4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LX8gLGo8IAbHcPSedtDtEHb4yrnW2VGQplY0Zlb1CknlaO9QzH1N+vwSxPT1OChPVvuGV+FQMvmb5XNkxbBr6wUKJW4nWi6mV2h9xh8TYL98v1sygrQRxfPjgRCyvq2mSzmv4KwmguyqO1qaVDljwoDeQN85eYewtdqvU4Vpm80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NdrEeNpt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c4nemu6y; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65M593rB1275257
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 05:11:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8TvT0X1xsWIx/xeH+6U1rqCWrbGM5yHzwFV2cbUfXeY=; b=NdrEeNpt83Jla76r
	iSnMxqV2vobIs1RxWiAu4zHsqbyGv24INZQwQC2id+JJzL/k3q2RsbX6Fuc1Czgm
	qjuYAws2cMcNvyRWtc0UlFBw2t29eP3ekv+i44jhbC3tKDcrHRRUwNj8DkmnscXv
	wZvVVVkyDlg5djNG1fCr/EHkEy/0/c1kJPzoWq3ZeCgqhxkB0YfpgPSyoGsyz4PN
	lfO9XCaWV2ZycE7OPdvW75JEb22PQya8NFnrc/GUJuDCLyjcaPqwZegapkEmtk61
	IBBrlbsncUA4kyxQw+EYCc3hpiDU9QypddZd71QwLvLfVF5XCwdwYL7dhfrLM7jJ
	NUBgSQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ewk32vsgg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 05:11:41 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30ba395b047so460819eec.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 Jun 2026 22:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782105100; x=1782709900; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8TvT0X1xsWIx/xeH+6U1rqCWrbGM5yHzwFV2cbUfXeY=;
        b=c4nemu6yjGSZubCyu8abzOrfwf64SH4dLUqSK07HfRMef9JfsBxvq5U6xyNFXBZi1l
         MTGTWth9jeoBCAJXTmatTANm5vt712Vnz7l0c6YQcwSXfT8hs5Elh3ptINm3KizMwOBt
         iA2BDJH2fa2WtwES7cJBTBrr9izX/Fht0bj3DmEwVUt7BFCH6rmtuZzWN6fRxywgAYk/
         9nFHhp6Tjd3pjV/oO+iFvDD6sgA9eK+dq4ABKx8LzE/l0Im2tyGbwaT9oJebz0ywJzQT
         k5ywvnnzeVq88CvAnTXxvxQwC4QhbZlytsDxnEKu8OIK4PNLT0ayCfig4GyU5Wfr+5q8
         EPGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782105100; x=1782709900;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8TvT0X1xsWIx/xeH+6U1rqCWrbGM5yHzwFV2cbUfXeY=;
        b=UnSiPQj0MhnOmIRqoLoQ5Kz8A/2Dv2Tag8ERoFiRe/8kqbPFYQdOoY5Smr0D6TNE/G
         QWJ2/HQ0EjYfBzyZN1V/cQMUWmqdsHHPBMG41WI1ti1JkWU/Q7PSYFVl70m9LNkoE8c5
         XC4ySS6OKYUT41PQ5Lve1NkhtVfC0m3ZursXqkbvi0jujihuSI64zGrwxoDNktJLpHBS
         0tadrAe/O9dxQkw2blbvNRJoA65zHzYd/2JGNZRhBKIb6z5grnb5GmSDGR/mD+uzZjUu
         D/8RADOF3sto2kKWCbUDUMbOxnpOW5zCVFzpN0x00Y+ZkL/liVu22LIWWNqXjEMg5Yo3
         3fIg==
X-Gm-Message-State: AOJu0Yw/WGczmDS3BUStcVemXfGAdGr7fpwfmDQN3AlHH6/UcWNiGXTc
	JB4CvRoqQuxU5xGB7Sp5xfH0fKD2Zb3Ys2vT7phH3mK6lyHOmKV+biYK7NLDZyGfj492GgY/O/b
	6TDRpVXqAiafmYfDpmWFTGG2ORdxUMSJNZkzpygdbr+CUEluR/z3JxM0cjYl5QacRPVgf
X-Gm-Gg: AfdE7ckeQphrl/5Wn/OQF6cQJn2xWp6w+7DS/TDZlzL9WBphJwqvh3McwjzT850mo1E
	y9zAqWJLhMNPYBb9Em1pg/MG/PZwT4z5U76bMRuhgqySDMHatL8zlkEXuyIhewOhae+T6OKaXQc
	VAgCRq6WVs6avR7Ao8i8aco2p3/eoao6Nec1IyCXba6eree/mgRMJ8/QArN+PaS8TCNgc2aDwXy
	Gaw07+N2EWaFHTs1ZHZwMD57Sf9mfL6FtlsXIlGaHMaEoIM/L3FaD9UVId0L9rUSPAT0BLv31Nz
	Qh18lCn1lgbD3NHOfJajxbxTYIyb8ruhy/27//MnXDbnDVWFAIr1TGiHD84AC+DMI9TaPmhPyEq
	pfXOY+Rkt9dG9VCsH94D74CgWgdXEnPLX0cYMNhbZ0ZsXkvfVZwHJZxaYIg==
X-Received: by 2002:a05:7300:3082:b0:304:5bee:f59d with SMTP id 5a478bee46e88-30c071e7a4emr10186959eec.29.1782105100415;
        Sun, 21 Jun 2026 22:11:40 -0700 (PDT)
X-Received: by 2002:a05:7300:3082:b0:304:5bee:f59d with SMTP id 5a478bee46e88-30c071e7a4emr10186937eec.29.1782105099882;
        Sun, 21 Jun 2026 22:11:39 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c1bd8d779sm8947716eec.17.2026.06.21.22.11.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 22:11:39 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Sun, 21 Jun 2026 22:11:29 -0700
Subject: [PATCH v6 6/8] arm64: dts: qcom: glymur: Add QREF regulator
 supplies to TCSR
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260621-tcsr_qref_0622-v6-6-c939c22ded0c@oss.qualcomm.com>
References: <20260621-tcsr_qref_0622-v6-0-c939c22ded0c@oss.qualcomm.com>
In-Reply-To: <20260621-tcsr_qref_0622-v6-0-c939c22ded0c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Qiang Yu <qiang.yu@oss.qualcomm.com>, krishna.chundru@oss.qualcomm.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782105091; l=1625;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=87z1o4XyGauYHYE1QVaxn8pz2zob1D2UjTKFIy1fTD4=;
 b=ERbwFbugGaGe4P+UwsrTcFlyaZDuwjk5RauNrGYedxo6+Ewtx0mEWDY13Y6WufJuVqSDSD+fd
 m+gS5ZOKEWhDDNJbK/ITdLPWSgFTQ1cooMDuviQ4ndPaeQa6ZD3Cqqn
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-GUID: tdXhldU0PJhkJTktM0YnCfqbIaiudE9g
X-Proofpoint-ORIG-GUID: tdXhldU0PJhkJTktM0YnCfqbIaiudE9g
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDA0NyBTYWx0ZWRfX4jX+8ZYGED5f
 d4dEuqPshW6W7VAWlnO5b/OCeFDVG5Vbdqga+KIURXb2csTvzO9rGuRWLGNAjh/tQtaBSDD43g1
 CdDUNw48MODHnt9vYVb5ym2e5vJsRYg=
X-Authority-Analysis: v=2.4 cv=NovhtcdJ c=1 sm=1 tr=0 ts=6a38c40d cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=J05kOiREooJSWT36y8oA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDA0NyBTYWx0ZWRfX5SlXYERrWrRo
 uJjy4y2fd0jpSpwNW7JVca82idSObTNehQAy4FZaYYWl5KbkDjVhjMvp7VO12qLxBlSIIPR2BFx
 VdidyPDmEiE/i78tI08J0w6lnuY9Osm6ZC6SzpVIcn7ve3DKXa8vj655fp9Y5x2g7LAtigK0peu
 AzrjD6DbEy/+QVWva/DP8uRnmN7Dg0HtoZYQPsY6lQfLEokbr9MBGg9jTM2GJkfD/Sm7rrgzfus
 QNYL8m1J8ZcT5/W8cr4Z482mI3M28Pv7y5jO2p8rWTwEpwWq4n6iGA8FIrmvOVJcsqNi4vkFKW6
 UPapUMLn5dUtUMJZlb0dOP9PEN5IC+BwwQF0YQi8/h5O87wc8N4Ck6ufKoDWQ/SaFIW/Uaw8XRf
 IySVeZGYYqJmCFbnJWypdtsUDLEvTFLVmYcwuERhzhAl3pwfja2cQGEoEHzM9hYc34aN6FkuA9b
 H8Ue33FFTLal6Ysxmbw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_01,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220047
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113924-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:taniya.das@oss.qualcomm.com,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:qiang.yu@oss.qualcomm.com,m:krishna.chundru@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1A1FD6ACAE7

The TCSR clkref_en clocks gate the QREF block which provides reference
clocks to the PCIe PHYs. Wire up the LDO supplies required by the QREF
and refgen blocks on the CRD board.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dts | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
index c98dfb3941fa..92b929ee3448 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
@@ -278,6 +278,26 @@ &smb2370_k_e2_eusb2_repeater {
 	vdd3-supply = <&vreg_l7b_e0_2p79>;
 };
 
+&tcsr {
+	vdda-qrefrpt0-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrpt1-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrpt2-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrpt3-0p9-supply = <&vreg_l2h_e0_0p72>;
+	vdda-qrefrpt4-0p9-supply = <&vreg_l2h_e0_0p72>;
+	vdda-qrefrx0-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrx1-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrx2-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrx4-0p9-supply = <&vreg_l2h_e0_0p72>;
+	vdda-qrefrx5-0p9-supply = <&vreg_l3f_e0_0p72>;
+	vdda-qreftx0-0p9-supply = <&vreg_l3f_e0_0p72>;
+	vdda-qreftx0-1p2-supply = <&vreg_l4h_e0_1p2>;
+	vdda-qreftx1-0p9-supply = <&vreg_l1f_e1_0p82>;
+	vdda-refgen3-0p9-supply = <&vreg_l2f_e0_0p82>;
+	vdda-refgen3-1p2-supply = <&vreg_l4h_e0_1p2>;
+	vdda-refgen4-0p9-supply = <&vreg_l1f_e1_0p82>;
+	vdda-refgen4-1p2-supply = <&vreg_l4f_e1_1p08>;
+};
+
 &tlmm {
 	edp_bl_en: edp-bl-en-state {
 		pins = "gpio18";

-- 
2.34.1


