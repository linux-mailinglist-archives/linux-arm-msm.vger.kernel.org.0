Return-Path: <linux-arm-msm+bounces-118926-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zy9YApnCVWoosgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118926-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 07:01:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id F2CD8750FB5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 07:01:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=hEJo55Qq;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=NukgE9c5;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118926-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118926-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 44B89301CF54
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 05:00:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83E4F2F39B9;
	Tue, 14 Jul 2026 05:00:01 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB3D93016F7
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 04:59:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784005201; cv=none; b=UQoRpDLb256/mAPL/itzcVRt0YRcgO/ByI5ee2G9w2JPR6ShppQLuaoH/GJlI96XKBQtRf8afwqvjNodtKw7t+iOF9ayasdPNg1IMTF1sWhoC9dznivHFdm9p2qslqAPHV2BJ2FnPazUfDdVlHjI8wTXzO6LzaJk8UMEyEpi5yA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784005201; c=relaxed/simple;
	bh=9BxxmcrVybxTieypSLyf4ctSd8fHI9uE2WwM4etNwjk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jZdtiPD5QRsIzk4W/H1rrmzNvp/IVBuIy38EwH9oCwbaK4SCRO1xi4WRQSyLGyEDAh05EZ1OjRD0D6K2str672ym8VbfRCq3+H723CZie8OkYmLrgm/HPjfHcDwlBMdERcMmAxf2COWv+cz18VlRxXfaJSPNdRK4IoLkJ+R7gYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hEJo55Qq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NukgE9c5; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E381YD3556455
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 04:59:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JO86e3p018RnHLJ2AvFSTUm2N11FNqXo/0u9fnwt8/U=; b=hEJo55QqxScdYxtE
	ORCbvEfsi7r4jmvR6Saw9ulmAnwQPxHpPLvL64IHkuoWbmCvORuDiOohsnJK7Val
	qwhpf51HySXMvD9n8k/rHyVgohKaoMMwsFglRMLXncNiPrbTTojdbMi7JsqJE1Oy
	1B39M0nZaHRFLl0793Ts3WSZRvW724Eao4beIgv/Ar8TCBYJbjAdqj7uasf4/PwY
	CyRSYSO/x3paIJelSIgL+8qJLQVhNPgIzJE1d5g2V8bUoUSpt82EadpF33KYzIr+
	GUe/e8grXRdnZhG0505HHoaG4WInvcytD85WpwY5ENPuMFfH+1i0zPx4O/w1+cPb
	hmwHDA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fd44ct17a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 04:59:57 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-ca8aee88725so5619215a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 21:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784005197; x=1784609997; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JO86e3p018RnHLJ2AvFSTUm2N11FNqXo/0u9fnwt8/U=;
        b=NukgE9c5ssKSooejWgJOORBTzRTsPkbV1wABuu1/LiT8x+ZSPPsyOJWPgsEI3421Jj
         KzdAj/3I8jh6U4GMJzXZcApgiRLyfG7BPztERMlEyKH+JSvmSXOzmixy5xRS0c7Q8qP2
         qEQybpTJbITOR2cNeiw1XLhrNH02EcrYYGH/kwxfxDIluSm1dA86FEuFM5Uh9NZGwy/7
         qv4NrnROt81BXNqsyj6yk3bq6ZmQCYcxpoCkt4ZdP7z8Fe/R8XV752RTwfXScCB3OqCn
         45/yZnroxPAWmzU+exHFzXJ3+x/R9qUWukYiQD7lYROItnQfit+rA1RxSI5r37DPfsKq
         jl7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784005197; x=1784609997;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JO86e3p018RnHLJ2AvFSTUm2N11FNqXo/0u9fnwt8/U=;
        b=PIZok1fdcdCtoH6VocqeHYZ6WkLWFopOjGWVv3Vn5Lc8z3TQQXzhmzw9CTuf2ryep6
         T1XKxZwi0OC7ro3LeRZvjLtaYK0fO1QWK/LZ3w6Ja+VYt3S41LXi0RxkYHHLUGxi8lHJ
         4F8wfWGy0kNuGSOekEYkPb7crhcPjEPL0FyDVEFbQJYBGN6qmYqSwuAcjsMCyxszEUg5
         nuUDBPGfRItzNTX27o7VpAhGBHVbiXmbt7Bwcdgi6R/TaNF3xB1BIYmpN7iV0NMWXlw1
         1AOI0jQOXS9VJZ8pAuLfDpSQw987/p9Xp+pBdhmOPOVT2+4SQ5wUhCxSSg1vuYTuFJW2
         0HDw==
X-Gm-Message-State: AOJu0YzWTO8XtWIKFOIshGjm9Zfh2Ip1ftzq/Xc9m5DXN/JfY+KU9oJo
	MEm0f9SatrXS9mqXsstFKoKmVvpSjPgw2XnPUdWnpPmbOUNcvAFHTYzCcecnO9PyI5RvtrLFM/P
	OBI/gfYIpGu+dPfrIhlFn0MU5cURRwtwMJg9yjHHLWPJLvQSqarRNQushBLrvGC6aMDqE
X-Gm-Gg: AfdE7cmh6yzXVVEp2icNucYcrbEYZaOLQU4W32NmqN11PGJsXKGOBZ5agMGwV8HtTRY
	gfr9JWl93YH+z/e5NW4xglc+7gdF/UhraMgviVKW/5aiPBH3qt00u5HeGI5rSbEroSJGtotEdaR
	9sUBOC0PWTIxHrKwWRCoqi/fBDYNyzfrUQNFjfBUg7p3Hc3BUpKQ+FzxYB/jMxoWj6ruQ6Z1cnv
	Se2iLDsQxdyEzQF+pV2VQBDzpPoZuPfEyQtIbIACo0v1M5t4DJfFcs6WhUJpwIqKlrUK+FO/fvV
	MPyfcn1FP+k5geiUhY7gZoAGUOCRiwEOjYd+8OswrIN/OuTh35DYCjPQnFcis69zaLMK9zDvZmi
	5yQwfRGqRFLq5q4Kubu9G9jm7UKwOJfskjuvIPKUFqkwjvxt8ICtkr+MnDQ==
X-Received: by 2002:a05:6a21:3382:b0:3bf:e66f:2656 with SMTP id adf61e73a8af0-3c34d88f27amr2844512637.55.1784005196523;
        Mon, 13 Jul 2026 21:59:56 -0700 (PDT)
X-Received: by 2002:a05:6a21:3382:b0:3bf:e66f:2656 with SMTP id adf61e73a8af0-3c34d88f27amr2844471637.55.1784005195983;
        Mon, 13 Jul 2026 21:59:55 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3120c8e41fcsm41874021eec.15.2026.07.13.21.59.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 21:59:55 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 21:59:40 -0700
Subject: [PATCH v9 5/7] clk: qcom: tcsrcc-glymur: Add Mahua QREF regulator
 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-tcsr_qref_0714-v9-5-373670ab15f9@oss.qualcomm.com>
References: <20260713-tcsr_qref_0714-v9-0-373670ab15f9@oss.qualcomm.com>
In-Reply-To: <20260713-tcsr_qref_0714-v9-0-373670ab15f9@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org, Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784005189; l=6484;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=9BxxmcrVybxTieypSLyf4ctSd8fHI9uE2WwM4etNwjk=;
 b=CVmdDinA+nb7Q6Yb5dZWylsvDXWZde0G1SdFkVBZhPeU6/Fj5hjg7fepDRHE1zznj/Juk1uct
 KzwCpMtYMwABO0iqBr3VLGq1J9NouUfL1a/00Q+Xf5quNQPBWF2uNlR
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-GUID: ujgIQx2UyAV5n--bKy_P3z-Y8DEWsP01
X-Proofpoint-ORIG-GUID: ujgIQx2UyAV5n--bKy_P3z-Y8DEWsP01
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDA0NyBTYWx0ZWRfX6Ze9iZjbBPv8
 eqPRhghUrEooJqoThMULYTbxskXEwyI/ChXbVNPFUj5SiDKoKYejciewLO7etY1ibd5BVnhzdBi
 QD1qwuLAlh58WxDTzaiqkKySOKenltQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDA0NyBTYWx0ZWRfX4YJ7WjS+vDja
 DRrDdpQc3RjcYUkQ2FkJWc/T20aM0JQ9/Q9XvQ4p0kpfXUcoJN3ITsBEUXwCVrHQM7o95yg3iEk
 pyDuKV4Xh+8LZxixm/zVN1qI5XcyCdUInQr+ibM6bdV2wX6Si98h/NHTy1fSGVkDWzCNmHMiPrQ
 Rfq+6Ve4Dl2tsKElH0VCetn+n5jXIsV/Xw4s12dj3e3S5HcXmfBcKLEivJtK/jLVQnWzPaZncxa
 h4ciMSYAMU6m2bQSfdQ/XyLsnTxZ8Ha9QmhT88FUIPyJk1wFDvjMVQllo+qKZo4WxK7IA9iiUD9
 4YhWH7p5uWTkeuEj0tLexIWavdA5eEkXcXTl8OTElT7XjQ4vPjmVBRJe5fdKtRrPWSIdkwqnEwI
 VgG6iz1967/ZuRqkmj41YLOt8dRXDN4TFxhQTrkd2loiosBfM1Boh7jfmKry565NmyQUMkazNy3
 RfGlkRrfIROrvjbpD7w==
X-Authority-Analysis: v=2.4 cv=P84KQCAu c=1 sm=1 tr=0 ts=6a55c24d cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=9Ojz-Py7MuQnRvcrkDsA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_01,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 bulkscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607140047
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118926-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	FORGED_SENDER(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:taniya.das@oss.qualcomm.com,m:kees@kernel.org,m:gustavoars@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:qiang.yu@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
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
X-Rspamd-Queue-Id: F2CD8750FB5

Mahua is based on Glymur but uses a different QREF topology, requiring
distinct regulator lists and clock descriptors for its PCIe clock
references.

Add mahua-specific regulator arrays and clk descriptor table, and use
match_data to select the correct descriptor table per compatible string at
probe time.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 drivers/clk/qcom/tcsrcc-glymur.c | 136 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 133 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/tcsrcc-glymur.c b/drivers/clk/qcom/tcsrcc-glymur.c
index e0b545258ba4..1791e23739ed 100644
--- a/drivers/clk/qcom/tcsrcc-glymur.c
+++ b/drivers/clk/qcom/tcsrcc-glymur.c
@@ -12,6 +12,11 @@
 
 #include <dt-bindings/clock/qcom,glymur-tcsr.h>
 
+struct tcsrcc_glymur_data {
+	const struct qcom_clk_ref_desc * const *descs;
+	size_t num_descs;
+};
+
 static const char * const glymur_tcsr_tx0_rx5_regulators[] = {
 	"vdda-refgen3-0p9",
 	"vdda-refgen3-1p2",
@@ -56,6 +61,43 @@ static const char * const glymur_tcsr_tx1_rpt34_rx4_regulators[] = {
 	"vdda-qrefrx4-0p9",
 };
 
+static const char * const mahua_tcsr_tx1_rpt01_rx1_regulators[] = {
+	"vdda-refgen3-0p9",
+	"vdda-refgen3-1p2",
+	"vdda-qreftx1-0p9",
+	"vdda-qrefrpt0-0p9",
+	"vdda-qrefrpt1-0p9",
+	"vdda-qrefrx1-0p9",
+};
+
+static const char * const mahua_tcsr_tx1_rpt012_rx2_regulators[] = {
+	"vdda-refgen3-0p9",
+	"vdda-refgen3-1p2",
+	"vdda-qreftx1-0p9",
+	"vdda-qrefrpt0-0p9",
+	"vdda-qrefrpt1-0p9",
+	"vdda-qrefrpt2-0p9",
+	"vdda-qrefrx2-0p9",
+};
+
+static const char * const mahua_tcsr_tx1_rpt0_rx0_regulators[] = {
+	"vdda-refgen3-0p9",
+	"vdda-refgen3-1p2",
+	"vdda-qreftx1-0p9",
+	"vdda-qrefrpt0-0p9",
+	"vdda-qrefrx0-0p9",
+};
+
+static const char * const mahua_tcsr_tx1_rpt345_rx3_regulators[] = {
+	"vdda-refgen3-0p9",
+	"vdda-refgen3-1p2",
+	"vdda-qreftx1-0p9",
+	"vdda-qrefrpt3-0p9",
+	"vdda-qrefrpt4-0p9",
+	"vdda-qrefrpt5-0p9",
+	"vdda-qrefrx3-0p9",
+};
+
 static const struct regmap_config tcsr_cc_glymur_regmap_config = {
 	.reg_bits = 32,
 	.reg_stride = 4,
@@ -145,17 +187,105 @@ static const struct qcom_clk_ref_desc * const tcsr_cc_glymur_clk_descs[] = {
 	},
 };
 
+static const struct qcom_clk_ref_desc * const tcsr_cc_mahua_clk_descs[] = {
+	[TCSR_EDP_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {
+		.name = "tcsr_edp_clkref_en",
+		.offset = 0x60,
+		.regulator_names = mahua_tcsr_tx1_rpt0_rx0_regulators,
+		.num_regulators = ARRAY_SIZE(mahua_tcsr_tx1_rpt0_rx0_regulators),
+	},
+	[TCSR_PCIE_2_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {
+		.name = "tcsr_pcie_2_clkref_en",
+		.offset = 0x4c,
+		.regulator_names = mahua_tcsr_tx1_rpt01_rx1_regulators,
+		.num_regulators = ARRAY_SIZE(mahua_tcsr_tx1_rpt01_rx1_regulators),
+	},
+	[TCSR_PCIE_3_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {
+		.name = "tcsr_pcie_3_clkref_en",
+		.offset = 0x54,
+		.regulator_names = mahua_tcsr_tx1_rpt012_rx2_regulators,
+		.num_regulators = ARRAY_SIZE(mahua_tcsr_tx1_rpt012_rx2_regulators),
+	},
+	[TCSR_PCIE_4_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {
+		.name = "tcsr_pcie_4_clkref_en",
+		.offset = 0x58,
+		.regulator_names = mahua_tcsr_tx1_rpt012_rx2_regulators,
+		.num_regulators = ARRAY_SIZE(mahua_tcsr_tx1_rpt012_rx2_regulators),
+	},
+	[TCSR_USB2_1_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {
+		.name = "tcsr_usb2_1_clkref_en",
+		.offset = 0x6c,
+		.regulator_names = mahua_tcsr_tx1_rpt345_rx3_regulators,
+		.num_regulators = ARRAY_SIZE(mahua_tcsr_tx1_rpt345_rx3_regulators),
+	},
+	[TCSR_USB2_2_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {
+		.name = "tcsr_usb2_2_clkref_en",
+		.offset = 0x70,
+		.regulator_names = mahua_tcsr_tx1_rpt345_rx3_regulators,
+		.num_regulators = ARRAY_SIZE(mahua_tcsr_tx1_rpt345_rx3_regulators),
+	},
+	[TCSR_USB2_3_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {
+		.name = "tcsr_usb2_3_clkref_en",
+		.offset = 0x74,
+		.regulator_names = mahua_tcsr_tx1_rpt345_rx3_regulators,
+		.num_regulators = ARRAY_SIZE(mahua_tcsr_tx1_rpt345_rx3_regulators),
+	},
+	[TCSR_USB2_4_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {
+		.name = "tcsr_usb2_4_clkref_en",
+		.offset = 0x88,
+		.regulator_names = mahua_tcsr_tx1_rpt0_rx0_regulators,
+		.num_regulators = ARRAY_SIZE(mahua_tcsr_tx1_rpt0_rx0_regulators),
+	},
+	[TCSR_USB3_0_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {
+		.name = "tcsr_usb3_0_clkref_en",
+		.offset = 0x64,
+		.regulator_names = mahua_tcsr_tx1_rpt345_rx3_regulators,
+		.num_regulators = ARRAY_SIZE(mahua_tcsr_tx1_rpt345_rx3_regulators),
+	},
+	[TCSR_USB3_1_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {
+		.name = "tcsr_usb3_1_clkref_en",
+		.offset = 0x68,
+		.regulator_names = mahua_tcsr_tx1_rpt345_rx3_regulators,
+		.num_regulators = ARRAY_SIZE(mahua_tcsr_tx1_rpt345_rx3_regulators),
+	},
+	[TCSR_USB4_1_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {
+		.name = "tcsr_usb4_1_clkref_en",
+		.offset = 0x44,
+	},
+	[TCSR_USB4_2_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {
+		.name = "tcsr_usb4_2_clkref_en",
+		.offset = 0x5c,
+		.regulator_names = mahua_tcsr_tx1_rpt01_rx1_regulators,
+		.num_regulators = ARRAY_SIZE(mahua_tcsr_tx1_rpt01_rx1_regulators),
+	},
+};
+
+static const struct tcsrcc_glymur_data tcsr_cc_glymur_data = {
+	.descs     = tcsr_cc_glymur_clk_descs,
+	.num_descs = ARRAY_SIZE(tcsr_cc_glymur_clk_descs),
+};
+
+static const struct tcsrcc_glymur_data tcsr_cc_mahua_data = {
+	.descs     = tcsr_cc_mahua_clk_descs,
+	.num_descs = ARRAY_SIZE(tcsr_cc_mahua_clk_descs),
+};
+
 static const struct of_device_id tcsr_cc_glymur_match_table[] = {
-	{ .compatible = "qcom,glymur-tcsr" },
+	{ .compatible = "qcom,glymur-tcsr", .data = &tcsr_cc_glymur_data },
+	{ .compatible = "qcom,mahua-tcsr",  .data = &tcsr_cc_mahua_data  },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, tcsr_cc_glymur_match_table);
 
 static int tcsr_cc_glymur_probe(struct platform_device *pdev)
 {
+	const struct tcsrcc_glymur_data *data = device_get_match_data(&pdev->dev);
+
+	if (!data)
+		return -ENODEV;
+
 	return qcom_clk_ref_probe(pdev, &tcsr_cc_glymur_regmap_config,
-				  tcsr_cc_glymur_clk_descs,
-				  ARRAY_SIZE(tcsr_cc_glymur_clk_descs));
+				  data->descs, data->num_descs);
 }
 
 static struct platform_driver tcsr_cc_glymur_driver = {

-- 
2.34.1


