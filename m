Return-Path: <linux-arm-msm+bounces-118927-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id eZ+BLIDCVWocsgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118927-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 07:00:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 59E26750F99
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 07:00:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=SYNmoun7;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=VZSlPEaH;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118927-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118927-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1796F300E29B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 05:00:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AEAF30C608;
	Tue, 14 Jul 2026 05:00:02 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA57306752
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 04:59:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784005202; cv=none; b=Qva3pXg0cqBsu/RPLrBVJuOxk8DIdZHY0ZUStz9sFP1US1o5MIUzfcWFjo0xNN7MUsKLa2WqOuUYbxtBkchYz8FmbCt/D1zi1sSjDKtYydac8AV7UPfvHnaDeA45G4mJNsE51T187uOb71cQh32DVdk9LsR6k0byDk7h0hvaTE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784005202; c=relaxed/simple;
	bh=Xv3av/rD+ldK9r9tj755nWcpZGWPEFEhsHdy0UkmLVg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YeWfogeu3lPkVYsMtOnjsKbIM+45DMxNa9DdkXWkwsCoquj4uoIaPYv5SmTRghZp4oCz+TBzGpBxMyAukGQa1gFeadEEcytxVGrW+1mwV0REOpcYQVp/0+OEBYqsDl9vU+JWcNLpDrR6qRgaaJId74glskkidEgAMu3Yvl8YVDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SYNmoun7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VZSlPEaH; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E38WFK3483240
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 04:59:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gTDbhLDusd8RpoV9P1sSM4e1vQjmi4jllQGShEAZJQM=; b=SYNmoun7qemFTD5t
	j1Woav0E3B5VW+31/xgc31/hvKXz2/W+O1YZqr2eBpnvfFj8T8pS2tPPd4hG/wF9
	PC+RkOStyz89tvIxr+Y59moB2mfKqU/2RINAsKx12VUBrWQRvDZHiIcFDkpD1/Pa
	t1ymKVbLfZ8i8/PiGmHmrkEGUrHcsvWTJdushwyIOVne0X5F58jspcpE9VmoSHfM
	vyD7n5gB/2LVCXJIqM5rq6e4+rH1hm5soZx3LE/9gOWSfhYIanMV62oik1fyuLke
	UPivTvv5u+sJ7gAQhquZWP/79fPi9keuIVyU1Nu8hSML0wTljHdwYVkj8ewE/nVN
	MdIhXg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fd37xa9j7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 04:59:59 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-ca7c1e22995so4188207a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 21:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784005199; x=1784609999; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gTDbhLDusd8RpoV9P1sSM4e1vQjmi4jllQGShEAZJQM=;
        b=VZSlPEaHh/Zqqlg/Q31O2GovpxjOI+1kgDzQNmegC1y2yNQ4V40Ezh8+gd3WKcvQWM
         5zPow9a/+5LRWk46v5ngi2wkFKB8xdOekEaEB92un5iC6oYFR5FxcSRjFyZ1lT1GKNr4
         Yw1AJklmkrDq3kRAw/d57KD2L+alDStPHstm0XL+JSqbD6Gd6aQDuBB9i/xDKb+5nD1p
         dX+Hea3Ty86sxsft/aw3qsaLiWdM7LQE0NcE3l5ODB3cw0KkS4Vuq/Q33lZssx2A8paz
         mt3fslZR23W3buB6d+SWbfZlEoc7jXhwYf4i49T1b5mkbBkAUvaoE4Wbim6+upy8z7kK
         kjdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784005199; x=1784609999;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gTDbhLDusd8RpoV9P1sSM4e1vQjmi4jllQGShEAZJQM=;
        b=ohjvYHeA1CzqvYHyDT2o656BWG/DcRpeqNn9mtvcmWWRaQDCe2I/brUVLt/3TCe6cK
         kVyW/z1d3gibYe5hBDKC116W0sC1+RReL7Ys0r5xZdE72cuJrDAhkPr41Bc659rXC6u8
         BNb5tf3WYZTLDgzK3BZN2LY7sdClXBtXVa1sMu68uePYoEaUDeGCDr+uxCGLjaLZ8GTC
         1e/XPeiX+OgE13hJfNxiT/Hsd+9x1jyGdgj6QowmF2IR+boBST1vv7N11iqh3+Nrz4h7
         iICIvQiZ1pom28ZcOh+pm1jDGaM1jvNK9d6NQoK7TdNajl0+ABOmfo1sMmb+kJrykTHK
         LApA==
X-Gm-Message-State: AOJu0Yxc6EQsL6cl2lHShzsoMC8poZf98mJZg3kRh3qBRcgd13eRNNuo
	iQus/HcIPO7jn0Exw81UeFf1CVCEL6msuEb/SVe/pNSxUQT8WVjqkx6NxVw13NyX6hFEx6fnh46
	Ley+JSOD20PQsCTY4pU77dmG7N6rd0LvhbudZD3C/aVmEFkEAlaVz6Fn7e0QIFKgSsMR6
X-Gm-Gg: AfdE7cmtdIi6g88ctqGVf8Rl8CiOgWIW28urVOHeyyOBh7gvP3zgAfFdOvJpXr+B7G/
	tqb8GkDP/dnMnsUR0UnLpb3JytYBjk2IzLearJwFWKkhCzYAjsbvI5/MYDRgO+Z90bssLdY/Mdb
	7Z0cdAYNtmxLCNsGM9JuvmnlBFJjuKOQYMbw5u9DNdzyiNSz51PvttFcpENOdOIju8cTCNffMSa
	IcwsfRPLEZoT5F18GPJEPUbc3+rQ4HOuuRi9+HreDB0S5tC99PkJvdh6BADl8J6mMuSl93d3TUc
	dWijNc6XHkmd7wl7Q0q874hi33fzntOSg3OVL2CHWU3uWLMpu5hfNUl5DqtDo0/gZWS/MPQ2Fj3
	pJVCMZonnwhyJ5Z+4X0ogh0nLV222Yi9OyEUrlIp0jCfGr15JG6ztukidRw==
X-Received: by 2002:a05:6a21:4902:b0:3c0:9c19:65a7 with SMTP id adf61e73a8af0-3c110a258f0mr13160902637.63.1784005198671;
        Mon, 13 Jul 2026 21:59:58 -0700 (PDT)
X-Received: by 2002:a05:6a21:4902:b0:3c0:9c19:65a7 with SMTP id adf61e73a8af0-3c110a258f0mr13160873637.63.1784005198151;
        Mon, 13 Jul 2026 21:59:58 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3120c8e41fcsm41874021eec.15.2026.07.13.21.59.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 21:59:57 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 21:59:42 -0700
Subject: [PATCH v9 7/7] arm64: dts: qcom: mahua: Add QREF regulator
 supplies to TCSR
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-tcsr_qref_0714-v9-7-373670ab15f9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784005189; l=2520;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=Xv3av/rD+ldK9r9tj755nWcpZGWPEFEhsHdy0UkmLVg=;
 b=N/46vvMiqukbaDa4T1kM6laO+YMYxGuFC0jiMaamitPYKZoKPqpNGc3elJ1gCm23KOpz/+5TG
 M4x4Evx8G9iBQBQp9SkmxZBOpQJFWB6TVmodGftRYjRDO7YUyzOZ7i+
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDA0NyBTYWx0ZWRfX3OqPHpzlzAb+
 wsNu3D8ah/xo6s1fgwDaQcqXz9/hEOMUSRtNyjwpTJMvJu4iFt/ghuJml6/TVFJ16ac+QPxFD9i
 b+UBm1bCcrNxYF1zxFl51TKK3/uSQSFBOgtDbObEdvkecsjhRRfneIh0dFGJ4lKC3xpsUdw8Ho5
 Drg+aQlPIFSRY4pVlvFExw/V5QXEbrM0R2PquEMh3s9s+niv0zVGQz4G8WS1HNfP9gOch5Wt8F6
 eUC0JY/tkGVRLlIIfgVQFbvGjScK+6DjHnnzQvnom6QemitH5ruLGr+1ULW4ofGFRPg38DfSyI7
 iSEvO1i7SDI67s0QmiEPPYDW9CxdQhw8C+FQJE1t6wskGfRtdD1lvkeI15cmvM6Q8AGsZsqkhGn
 mCX3WfthdfS+rflU7X/OGEuDTpU4Lakm8hInWYkkpIC45eCnjvSXyG5cPDxJPB0gfBjaoHQiA+F
 DTBCi2CB7FffqhpQ5XQ==
X-Authority-Analysis: v=2.4 cv=BNWDalQG c=1 sm=1 tr=0 ts=6a55c24f cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=nz7bh4JJC2V4q-rTAcgA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: 38ESuzvE8s59C-4ifMGQXMWJTTtqSY-9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDA0NyBTYWx0ZWRfX2qMXBlibfnZb
 aLEo5jNOSnsHp7RzjphurVmBcau3c+mo1sBf064j5TO+UyuHH/9l4KNrXDb9B9wufGm/TzfzcIs
 FJapaZfrhx35E+erlLMm62DtvA0qpQU=
X-Proofpoint-GUID: 38ESuzvE8s59C-4ifMGQXMWJTTtqSY-9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_01,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140047
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118927-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:taniya.das@oss.qualcomm.com,m:kees@kernel.org,m:gustavoars@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:qiang.yu@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
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
X-Rspamd-Queue-Id: 59E26750F99

Mahua has a different QREF topology from Glymur. Override the TCSR
compatible to qcom,mahua-tcsr in mahua.dtsi, and wire up the required
LDO supplies on the CRD board.

Unlike the other PCIe controllers, PCIe5 PHY on Mahua gets its refclk
from the CXO0 pad directly and requires no QREF clkref_en voting. Hence,
point its ref clock at RPMH_CXO_CLK.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/mahua-crd.dts | 16 ++++++++++++++++
 arch/arm64/boot/dts/qcom/mahua.dtsi    | 13 +++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/mahua-crd.dts b/arch/arm64/boot/dts/qcom/mahua-crd.dts
index 9c8244e892dd..fa5229064b10 100644
--- a/arch/arm64/boot/dts/qcom/mahua-crd.dts
+++ b/arch/arm64/boot/dts/qcom/mahua-crd.dts
@@ -19,3 +19,19 @@ / {
 	model = "Qualcomm Technologies, Inc. Mahua CRD";
 	compatible = "qcom,mahua-crd", "qcom,mahua";
 };
+
+&tcsr {
+	vdda-qrefrpt0-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrpt1-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrpt2-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrpt3-0p9-supply = <&vreg_l1f_e1_0p82>;
+	vdda-qrefrpt4-0p9-supply = <&vreg_l2h_e0_0p72>;
+	vdda-qrefrpt5-0p9-supply = <&vreg_l2h_e0_0p72>;
+	vdda-qrefrx0-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrx1-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrx2-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrx3-0p9-supply = <&vreg_l2h_e0_0p72>;
+	vdda-qreftx1-0p9-supply = <&vreg_l1f_e1_0p82>;
+	vdda-refgen3-0p9-supply = <&vreg_l1f_e1_0p82>;
+	vdda-refgen3-1p2-supply = <&vreg_l4f_e1_1p08>;
+};
diff --git a/arch/arm64/boot/dts/qcom/mahua.dtsi b/arch/arm64/boot/dts/qcom/mahua.dtsi
index 22822b6b2e8b..e6c059708912 100644
--- a/arch/arm64/boot/dts/qcom/mahua.dtsi
+++ b/arch/arm64/boot/dts/qcom/mahua.dtsi
@@ -115,6 +115,15 @@ &oobm_ss_noc {
 	compatible = "qcom,mahua-oobm-ss-noc", "qcom,glymur-oobm-ss-noc";
 };
 
+&pcie5_phy {
+	clocks = <&gcc GCC_PCIE_PHY_5_AUX_CLK>,
+		 <&gcc GCC_PCIE_5_CFG_AHB_CLK>,
+		 <&rpmhcc RPMH_CXO_CLK>,
+		 <&gcc GCC_PCIE_5_PHY_RCHNG_CLK>,
+		 <&gcc GCC_PCIE_5_PIPE_CLK>,
+		 <&gcc GCC_PCIE_5_PIPE_DIV2_CLK>;
+};
+
 &pcie_east_anoc {
 	compatible = "qcom,mahua-pcie-east-anoc", "qcom,glymur-pcie-east-anoc";
 };
@@ -286,6 +295,10 @@ gpuss-4-critical {
 	};
 };
 
+&tcsr {
+	compatible = "qcom,mahua-tcsr", "syscon";
+};
+
 &tlmm {
 	compatible = "qcom,mahua-tlmm";
 };

-- 
2.34.1


