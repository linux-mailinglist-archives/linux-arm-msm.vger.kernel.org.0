Return-Path: <linux-arm-msm+bounces-113923-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ifI7JH7EOGo+hwcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113923-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 07:13:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DE356ACB17
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 07:13:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=XYCwCspw;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Mr05nnYk;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113923-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113923-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A413E3020FFB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 05:12:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7607935E1AC;
	Mon, 22 Jun 2026 05:11:42 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76603359A68
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 05:11:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782105102; cv=none; b=n1AYTCEVw/a8tg4TEsxULANnqpwCLowb+VbJ0ubhOxiAphSQEygLk5JkIr/+p06JJnfS+XkrFd7eIM0W9Pk7G/jc1zIRJx1zhuG6tEhorXkMoQM77QTCxw3I0z2obpcFf1t1t4fKV5U1WKlIZ34EvNXnhDs6TxmrzdN1RnR1K4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782105102; c=relaxed/simple;
	bh=rw+jGsr4GUmMEn15wX/6cDmASyIshmLyIewu6Ex4SSM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l+rXSluwLRNe+3wKOzWVe0ySgpm/3fIHKHaBrBVl+hYqvLJB5z3rrytPqUIlse4yW27R1De+GPAo7OrnRs/x5ASwWrC7OMlc6y+Vy9pqCtZaFXUEcdVOqsIfwZCWPC9kzgCtBpyQ9QUwqQ7OObAwUd/Uht2oSIgsaJ46i2QxVBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XYCwCspw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Mr05nnYk; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65M59A5i3786541
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 05:11:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mn/qVyFIMu6IlzLhpxr4K9csqV7Oi92rZZJCZ2p710A=; b=XYCwCspww4fB6MRA
	KF8z7EIL3ifQYwvco9T7HNX0neEu1QUEmo17ieEoDWC+SBStng6Lk8fyAldFB3d7
	BNvRYfeqsuA5AF4v0H1lWuQMDJkyq+XDcIszaH7gNCKRxi7DjMUjFb8Kc/kkvTTN
	/thXSeLHaAzOAvHSw3BtP1c2am1fPImf31It23SsWFw4xAWzxkgzl64qOjarA/Fe
	Eke/X3eFfG1Jtm8z9qEAdofI1OeK/BuwVug1lc0xCTYqSAPNN7jg+3X+kmqDE2ng
	qqXDssm/t1CxRwtRvW+nbV9JE0zNRGZ7Nbnt1uF0Pgmt37/QKpLjnmcJIX4UJ/O9
	RNMGjQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ewkmecq1v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 05:11:39 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30beab99453so6930849eec.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 Jun 2026 22:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782105099; x=1782709899; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mn/qVyFIMu6IlzLhpxr4K9csqV7Oi92rZZJCZ2p710A=;
        b=Mr05nnYkezwO/DT5dbui0z8gF424Pj3uguHqBJJLR8QlQsjuMcIDEDHSoCLcPCNXxX
         IykXKfcqvMB1nMuZQMorMiCPETRMYvqGpmjj6prXZ6i2iTiMOmKbxYBSJyG/z1ea7eTf
         D2MscWCJdHGCaIC/xtDhSZJlRFO0vuWWf1OEh1qDa/YRbaaN6llet5V3hqUharwRKYdM
         jgexrVA1KlEruqt/G7vU5+Q0bwrFLE2MRGWvXVXeAON18n0Rb3NCvC0J1IPiwdwI5Sq2
         SQ4bgK85rX9qUiYVSUdxqSbU1KRAxbMA+YhL5imdHd2Gnk9MWtxzSsawxzVek5lwS51h
         kgeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782105099; x=1782709899;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mn/qVyFIMu6IlzLhpxr4K9csqV7Oi92rZZJCZ2p710A=;
        b=j4SWBetjXflh3FX89FeUMx7gvhyEC7py5oOLEpya0GkooT6YugHt8nRaI6h6qGeYuP
         +HCC84majvlr9Rh9cS642TYHRtSx1kCy5buqTV3hWvDQO+B+P7CBY5vm94J0BthQWTUN
         odfIv84XhRnSuAh5T0yoGMBK81ll00OpuMCH5Snmcy0KUZOLF+90CNwnqZrT/Zywavyp
         3y4hfx2MOEjrwczd4qDafSFLE9q9iZKTGKAMRs4vw+/t7/IU6AabiibuOlwlWxne5il0
         SenLyq6KJQElXX3SPMDIrjYXqVbGkj2yEDMMH/X68ofJO1yGEOuS0qMw9lZDkjPyinoX
         UKCQ==
X-Gm-Message-State: AOJu0YwXwhDwmXLRm8ChZVSqN5HeK4/zj6wSzEouCbrojVX4nc/J75jy
	aYNnN7fP4uEQMqNHBH5+x1/HUpGfwqq9KZyFuwdUGlTPKbopaoKD7+E8lYRHGWDUPfqTpNHjYPa
	dBXuGG9DIXZrx0t8f+O/gw6uyhwKjHRXUH/A7AIQVUPu/IUWkXv2IpoMChkJzg2PbnwN5
X-Gm-Gg: AfdE7clJR2OJKNuCL0ojOrNW2DNr+gLRR0+NnwiXei5kjYnwvi0wxKGOafIIwwJR5vl
	TutVlQtPd5XPcg3N5Y0k9qMHfG4gO44UBQyE1UZwcJSMYw82wkJMsA7hEStC9pxhYtq7T6h+ACT
	Zg0XhoxJPYz/r4GNaDyr5fZh8+Ok0nN0Rj1Ql3durlWB2AqLOVPIC1FDdjQMG3u2oveR5j5siDL
	iWC7OcW9DaNu0TAOgaY8ImiqUn5/rmgaXYYW20j6HigZoYUDAaH3o6TUYl3/kED4r3e659j561c
	n8opSIZ4zWUJdOAjHssBt/76X3vTDs33c/ks4yWYs5FKyFpFBJE5RYjKH535tDF4UBhRf9l645b
	qvOe04BTIBFIBnh0AAlQw/T7+rQvEPbOrdWByqg2tqi4m3Px7+gEEV51yTQ==
X-Received: by 2002:a05:7300:6ca7:b0:304:ab8:f87c with SMTP id 5a478bee46e88-30c06fff418mr8800534eec.12.1782105099168;
        Sun, 21 Jun 2026 22:11:39 -0700 (PDT)
X-Received: by 2002:a05:7300:6ca7:b0:304:ab8:f87c with SMTP id 5a478bee46e88-30c06fff418mr8800514eec.12.1782105098653;
        Sun, 21 Jun 2026 22:11:38 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c1bd8d779sm8947716eec.17.2026.06.21.22.11.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 22:11:37 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Sun, 21 Jun 2026 22:11:28 -0700
Subject: [PATCH v6 5/8] clk: qcom: tcsrcc-glymur: Add Mahua QREF regulator
 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260621-tcsr_qref_0622-v6-5-c939c22ded0c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782105091; l=4460;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=rw+jGsr4GUmMEn15wX/6cDmASyIshmLyIewu6Ex4SSM=;
 b=neyFdZJhWpeusrQeV6c4WGn71aucsOGLhGoNrBICZsLh5N/Kg7Rq/rgninvJjOgnLQFOaKQaO
 yDiX0J4mov/AD4zELMFdiax4N17g/ah+ylNfjiveby7xWgBiovaFC+8
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDA0NyBTYWx0ZWRfX9K9Mo0P1UNfF
 6FXbHJuwJMDE7/3Uoa4+B42GoAdo/Jm5IsKhkWlJrO8l1iTE4jtQl8YdYpk/FmucgbEdJ2YgP1h
 dtSgg7scXGsfnYH1GwZlfqP/Mu1lgC62lu4JmU4tLFfJVYWMRRgu0207DcC4iAWDh9zQhNcgAsp
 WEe1gOiBHx/1jVhhtPWju3Dyq9CHrBCXxfoOD2hSUzTM/tUoqvd07kgsxvyE4BdTauC6kAFd8bZ
 +sgI4ieu22NBWjHGe6dCx1dtKZFRBzlb8Q9rlFpb8Tf4ovWyJRvWpfMtOddKOd2K0KIqv8b83dY
 iccfBa5UiAVXBRlnaoJ3UsOjRVok9Tm1RTPtQf0bGoIl/cvaYeeUazPuz5oHMqHDTnjgh0Jk+3t
 2FiHruLcGoKQvqQwbi+2kjfs4mpDsDEnt1qIbXn+tehn40N7jANAOlnambmftq+8UQbbJ5TOEXG
 VvnvS5Av9wWc4U0DO5A==
X-Authority-Analysis: v=2.4 cv=MtFiLWae c=1 sm=1 tr=0 ts=6a38c40b cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=ejsaoIeHybvuXmj4E6UA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: J9EWCWbA-ZwKVq7TMPJ7CUbdcIYhnTEE
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDA0NyBTYWx0ZWRfX4MErRKzd1ehP
 Ph1JD/zFOlyFFg7WXyM7Y27rnz07hquWuRnPKtIyt+kiFWCQ9Lbc++pOzwAZheG1Emt9vpirrTI
 z2T/1MLpd/R7V/aDKvioj2W9YkSnDDs=
X-Proofpoint-ORIG-GUID: J9EWCWbA-ZwKVq7TMPJ7CUbdcIYhnTEE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_01,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 clxscore=1015 phishscore=0
 adultscore=0 spamscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220047
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113923-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:taniya.das@oss.qualcomm.com,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:qiang.yu@oss.qualcomm.com,m:krishna.chundru@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
X-Rspamd-Queue-Id: 3DE356ACB17

Mahua is based on Glymur but uses a different QREF topology, requiring
distinct regulator lists and clock descriptors for its PCIe clock
references.

Add mahua-specific regulator arrays and clk descriptor table, and use
match_data to select the correct descriptor table per compatible string at
probe time.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 drivers/clk/qcom/tcsrcc-glymur.c | 99 ++++++++++++++++++++++++++++++++++++++--
 1 file changed, 96 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/tcsrcc-glymur.c b/drivers/clk/qcom/tcsrcc-glymur.c
index 2db039342f30..9af520b71f31 100644
--- a/drivers/clk/qcom/tcsrcc-glymur.c
+++ b/drivers/clk/qcom/tcsrcc-glymur.c
@@ -13,6 +13,11 @@
 
 #include <dt-bindings/clock/qcom,glymur-tcsr.h>
 
+struct tcsrcc_glymur_data {
+	const struct qcom_clk_ref_desc *descs;
+	size_t num_descs;
+};
+
 static const char * const glymur_tcsr_tx0_rx5_regulators[] = {
 	"vdda-refgen3-0p9",
 	"vdda-refgen3-1p2",
@@ -57,6 +62,25 @@ static const char * const glymur_tcsr_tx1_rpt34_rx4_regulators[] = {
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
 static const struct regmap_config tcsr_cc_glymur_regmap_config = {
 	.reg_bits = 32,
 	.reg_stride = 4,
@@ -146,17 +170,86 @@ static const struct qcom_clk_ref_desc tcsr_cc_glymur_clk_descs[] = {
 	},
 };
 
+static const struct qcom_clk_ref_desc tcsr_cc_mahua_clk_descs[] = {
+	[TCSR_EDP_CLKREF_EN] = {
+		.name = "tcsr_edp_clkref_en",
+		.offset = 0x60,
+	},
+	[TCSR_PCIE_2_CLKREF_EN] = {
+		.name = "tcsr_pcie_2_clkref_en",
+		.offset = 0x4c,
+		.regulator_names = mahua_tcsr_tx1_rpt01_rx1_regulators,
+		.num_regulators = ARRAY_SIZE(mahua_tcsr_tx1_rpt01_rx1_regulators),
+	},
+	[TCSR_PCIE_3_CLKREF_EN] = {
+		.name = "tcsr_pcie_3_clkref_en",
+		.offset = 0x54,
+		.regulator_names = mahua_tcsr_tx1_rpt012_rx2_regulators,
+		.num_regulators = ARRAY_SIZE(mahua_tcsr_tx1_rpt012_rx2_regulators),
+	},
+	[TCSR_PCIE_4_CLKREF_EN] = {
+		.name = "tcsr_pcie_4_clkref_en",
+		.offset = 0x58,
+		.regulator_names = mahua_tcsr_tx1_rpt01_rx1_regulators,
+		.num_regulators = ARRAY_SIZE(mahua_tcsr_tx1_rpt01_rx1_regulators),
+	},
+	[TCSR_USB2_1_CLKREF_EN] = {
+		.name = "tcsr_usb2_1_clkref_en",
+		.offset = 0x6c,
+	},
+	[TCSR_USB2_2_CLKREF_EN] = {
+		.name = "tcsr_usb2_2_clkref_en",
+		.offset = 0x70,
+	},
+	[TCSR_USB2_3_CLKREF_EN] = {
+		.name = "tcsr_usb2_3_clkref_en",
+		.offset = 0x74,
+	},
+	[TCSR_USB2_4_CLKREF_EN] = {
+		.name = "tcsr_usb2_4_clkref_en",
+		.offset = 0x88,
+	},
+	[TCSR_USB3_0_CLKREF_EN] = {
+		.name = "tcsr_usb3_0_clkref_en",
+		.offset = 0x64,
+	},
+	[TCSR_USB3_1_CLKREF_EN] = {
+		.name = "tcsr_usb3_1_clkref_en",
+		.offset = 0x68,
+	},
+	[TCSR_USB4_1_CLKREF_EN] = {
+		.name = "tcsr_usb4_1_clkref_en",
+		.offset = 0x44,
+	},
+	[TCSR_USB4_2_CLKREF_EN] = {
+		.name = "tcsr_usb4_2_clkref_en",
+		.offset = 0x5c,
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
 	return qcom_clk_ref_probe(pdev, &tcsr_cc_glymur_regmap_config,
-				  tcsr_cc_glymur_clk_descs,
-				  ARRAY_SIZE(tcsr_cc_glymur_clk_descs));
+				  data->descs, data->num_descs);
 }
 
 static struct platform_driver tcsr_cc_glymur_driver = {

-- 
2.34.1


