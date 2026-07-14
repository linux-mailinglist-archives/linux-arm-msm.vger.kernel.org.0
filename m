Return-Path: <linux-arm-msm+bounces-118920-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XwXtJU3CVWr+sQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118920-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 06:59:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 33E51750F54
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 06:59:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=p0A2q4IN;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=iD+JJyop;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118920-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118920-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A7AB5300F5C4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 04:59:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0A722EBB8D;
	Tue, 14 Jul 2026 04:59:54 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E87E2E7365
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 04:59:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784005194; cv=none; b=N/CrTu2q/Zmt8DI5iZE7Qi7nl1bjaUUZ98Ijbr1IvEmMgNuWKFRvBzU/tC0+BRHcHdY4w42TCA1QOvTmb1JiGLEJqUtJCVUAAwlp2P8Gw6dqcGGGTwZRBPkxLV5chHWTjS9aaeEBh+5plG4WIcz6ZXmHU1/QfCZO3Y8+4DFE/v4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784005194; c=relaxed/simple;
	bh=LKAINk67qcWpTEFbooGQl2hvLx8wgZLI8xl/8ZLIRNI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=byJZTultcwvqqSJ1GvXWtsu5qbaCRzWKUj5NGGAR9/nL3ClKKArIoK607rQ6+EXxNPSG5sGugkzNtUftl/3IKG6YMy5/8EWREh4d0WO8oPYvPRYE0dJxOTCXajNw/KaDWPFjazeNt1x+pU0kr2/CtviRRYLuRiKWkjxMDklzTcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p0A2q4IN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iD+JJyop; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E387IB3181805
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 04:59:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x0BcJHYQFSbu4RvEjMIgNWDsUGzhhHcMUNQgh7uDdv8=; b=p0A2q4INMw2XRv//
	SKRJmuXlEGNNee6OhATXDvS3l6sVIUMp//K6fSYBVGQRePtII9AjRZPWql/RYYR0
	IOZzUiW6N/RymmtdYhD+l8c4zX/I2qBRwn3/0Rki7G8PjV1nCRuJDEiCdCiY+gnD
	kTUjJ2h9cyWfxElbaV386QdVNWUqqDk0tJilroZSOtyWXf2Ooq4XSYrROJz4goyX
	iBOdqGBEGcczDEGYvdNdNmsIs4XPAlyB5KRErWgvN1fcAef9fHK8RXW4WS82NgPM
	Iuk9YY7LRLkXsiYyEKNuIA0/odioVwEOvvADwyWs3kIp3F+m4TaencXnz8vtrcFg
	pDC66g==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcw4quycr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 04:59:52 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-ca8409ba0easo557705a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 21:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784005192; x=1784609992; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x0BcJHYQFSbu4RvEjMIgNWDsUGzhhHcMUNQgh7uDdv8=;
        b=iD+JJyopmAhmrBugCwgI1MMe7Ef9G12jq64ePnx6rO4lWaCp8JF4Tn00ZN1cue37g4
         tDTZftUN7ZlrEVD2zpk0gzf89PryF5S+mkFhrxLFuzphZiCW0US7ifqxlTgdt64juz5W
         Q0b21Yc9ZO/iqjTndJcUcrqDzlxRNtZBwP0J1lZGXJ1579IVF2PH/nzPVu9QWzRPuFli
         EQ5Vb5DNxpIJBDJ7K7FXPzw020hyuqk7noI//ieZ1tfdb3Tk7s7/mAZixA/m+fA2eLoU
         nYt5Yb6N8fqkL7xjcoMfVjzjT6jipJqIlFn+crI+1sFcA3KYLTF3iyPEYXtNrlsqQl3Q
         j/QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784005192; x=1784609992;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x0BcJHYQFSbu4RvEjMIgNWDsUGzhhHcMUNQgh7uDdv8=;
        b=eUp3wyZ3+wZv8tiw+ezxHkFi4IA0lhqElXPUcCrVXraiUz/WGze2OycZ676okLGExI
         bwU4e/tNUzIsG5Lw72Rq22xt1UOslsqWtuAYlGEly/Nwwnuh+xGjAjiPNhzwPJqjid5M
         PeUBjgwand1TBxkz3z+bSrlWEf+22mRDR1MrpTzCgtveAAbqHjS0Ziw69mqyqqbrOUBs
         xz8XThUkWN0Wcyj/jF1fR/FXNY/noMaiodX120D2GEaI8BospnuxpJ4EqU/X0yikXHA3
         0pWCIlT7leDHC2ZZ4c2sUuaKEacpzyo3vHjl5+Yr/nZ2iZvprT57/jQ7c4mphcsaQAqy
         5iUg==
X-Gm-Message-State: AOJu0YzCi9AxQ5mFmHC47INkcON1fPfmeJhrZqnxKVwVZPmzx9hI33WO
	ftuI2KDbmdSSblBUFdK/wNis92ojDTIL5r0nHoAnhvmsjOhtcQjcA+13stQ3U02rcempmA8Lcko
	8j9o/9w/xEjY1Mz/zQrOJ+CNE9JvRehcTX0JjjDdju50LkNb73IgtOd1KWjKEHM6phx3f
X-Gm-Gg: AfdE7cnljqrZN7jQT/vbrbfg8Acjmr1V84N3V16TBcezhEC5Uqn2KmXinOTxVHjWdLt
	hZI0Lb1jP0ey5EZi8apMrpWwOr5iZ0uyxAfGJfodAudrTNu2+cqFKGcgd/KM+zk58d/XWPFLm+G
	47wEIeFrFALJGwnEs9Hck1WwbZ0iAJdLSMFfmgqID71ssO7A/DAISlK47i1xHNVHFaIARgWmA+6
	EzzRN0B23WIA9iu30QHyv0bSxY4hJbbRdeTqsuxf+DCZd/ctvTqmwvxJBPTa055PihzNSM7uzbW
	FKDY14uSK+ZJCetEELxRQ+uvdp9nNf0G+hxR5O/hIocZrxvWwFvKXv7WjwYEBALzIeaj07Ql5mK
	6q+S3VEblxCRI2++leK2/fddUTEzW6yFkU1ip/m6nVLfrDAgw4Pg1glzoMw==
X-Received: by 2002:a05:6a20:12d1:b0:3b2:8674:9830 with SMTP id adf61e73a8af0-3c0f093fb96mr18680511637.14.1784005191768;
        Mon, 13 Jul 2026 21:59:51 -0700 (PDT)
X-Received: by 2002:a05:6a20:12d1:b0:3b2:8674:9830 with SMTP id adf61e73a8af0-3c0f093fb96mr18680483637.14.1784005191325;
        Mon, 13 Jul 2026 21:59:51 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3120c8e41fcsm41874021eec.15.2026.07.13.21.59.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 21:59:51 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 21:59:36 -0700
Subject: [PATCH v9 1/7] dt-bindings: clock: qcom: Move glymur TCSR to own
 binding
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-tcsr_qref_0714-v9-1-373670ab15f9@oss.qualcomm.com>
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
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784005189; l=5632;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=LKAINk67qcWpTEFbooGQl2hvLx8wgZLI8xl/8ZLIRNI=;
 b=MCSwBzrCoi31GS/AI8EhewAJanmu/dE9dSWBIP4u0je5ksjs3nQmD4+jJcSBOFeBufFPZICKa
 rhqY/C5MXn8B95xdkvxRk+5FtoTZF+UzXkXc9HjDqOhCwosQnjgscLi
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDA0NyBTYWx0ZWRfXzq6ehMZmju9J
 kLpiEmnnluKRo5IL2y/0J8dMFrNyIO5I2ptMMIdM2yHCO/+NfN1o4n6uz2KLvPW6B2JI6lk4kJr
 AfFdm6O1SSFheDAEhrIkcjpb1nKRlE/9c8oUXkFJHxzO36iquk1CgzXnn9Oqlu2onIBTOJA2Tmw
 OmqS49QVKG522ykfmjSIzCqU2wkGVDkaZW8LPoFxjneQiSUas4drbxP9EQTGNxeIxCBPwmHQUoP
 AtgbmN9BB/iCuDDXT/jkVLvRd4drvKDdNE0Fi/Gatwz+1btTnGaxGq0j3Y6cCXDiBRRyO966d4R
 Ipb6VUSWxTBmKxPgnb3WdbiWkbk2/iFf5TcMYSdqNZZKDAPzFbZYmki6OUMu9aMeTPFRvYdtP8V
 o+BVb/kq2zbYTyq0brlvQjcDCONa7ZFNKpdOP+Mwf753LoGLiBBUcTkxuHFXqh88NyWYOlQDbg9
 qFE3S8QpCo8aTvBO0Gg==
X-Authority-Analysis: v=2.4 cv=HJrz0Itv c=1 sm=1 tr=0 ts=6a55c248 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=12nZpKSYVJl7DlM_WUUA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: LMQ066dztzTby4qpHYhDG2wZIiY2sGUi
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDA0NyBTYWx0ZWRfX5liJyuJj/f6z
 hj/IECIoWPCqw9fQ0+cHKfTMOMYzqvZXkd+7V6s/9uhpgjI5U41adVv/7U0OS1HeMfYN91i7yD5
 Fus89dQfrX3kG0164WNHbqABGucmnp0=
X-Proofpoint-ORIG-GUID: LMQ066dztzTby4qpHYhDG2wZIiY2sGUi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_01,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140047
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118920-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:taniya.das@oss.qualcomm.com,m:kees@kernel.org,m:gustavoars@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:qiang.yu@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 33E51750F54

The QREF block supplies reference clocks to PCIe PHYs and requires
dedicated LDO supplies to operate. The digital control interface for QREF
(clkref_en registers) resides in TCSR on glymur. Since QREF has no
dedicated DT node of its own, these supply properties are placed in the
TCSR node which acts as the control interface for QREF.

Add a dedicated binding file for qcom,glymur-tcsr and document the supply
properties. As this binding will grow to cover more SoCs, mark the
required supplies per compatible using an allOf/if/then conditional.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 .../bindings/clock/qcom,glymur-tcsr.yaml           | 126 +++++++++++++++++++++
 .../bindings/clock/qcom,sm8550-tcsr.yaml           |   2 -
 2 files changed, 126 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,glymur-tcsr.yaml b/Documentation/devicetree/bindings/clock/qcom,glymur-tcsr.yaml
new file mode 100644
index 000000000000..ec89feff89e4
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,glymur-tcsr.yaml
@@ -0,0 +1,126 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,glymur-tcsr.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm TCSR Clock Controller on Glymur
+
+maintainers:
+  - Bjorn Andersson <andersson@kernel.org>
+  - Taniya Das <taniya.das@oss.qualcomm.com>
+
+description: |
+  Qualcomm TCSR clock control module provides the clocks, resets and
+  power domains on Glymur
+
+  See also:
+  - include/dt-bindings/clock/qcom,glymur-tcsr.h
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - qcom,glymur-tcsr
+      - const: syscon
+
+  clocks:
+    items:
+      - description: TCXO pad clock
+
+  reg:
+    maxItems: 1
+
+  '#clock-cells':
+    const: 1
+
+  '#reset-cells':
+    const: 1
+
+  vdda-qrefrpt0-0p9-supply: true
+  vdda-qrefrpt1-0p9-supply: true
+  vdda-qrefrpt2-0p9-supply: true
+  vdda-qrefrpt3-0p9-supply: true
+  vdda-qrefrpt4-0p9-supply: true
+  vdda-qrefrpt5-0p9-supply: true
+  vdda-qrefrx0-0p9-supply: true
+  vdda-qrefrx1-0p9-supply: true
+  vdda-qrefrx2-0p9-supply: true
+  vdda-qrefrx3-0p9-supply: true
+  vdda-qrefrx4-0p9-supply: true
+  vdda-qrefrx5-0p9-supply: true
+  vdda-qreftx0-0p9-supply: true
+  vdda-qreftx0-1p2-supply: true
+  vdda-qreftx1-0p9-supply: true
+  vdda-refgen3-0p9-supply: true
+  vdda-refgen3-1p2-supply: true
+  vdda-refgen4-0p9-supply: true
+  vdda-refgen4-1p2-supply: true
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,glymur-tcsr
+    then:
+      required:
+        - vdda-qrefrpt0-0p9-supply
+        - vdda-qrefrpt1-0p9-supply
+        - vdda-qrefrpt2-0p9-supply
+        - vdda-qrefrpt3-0p9-supply
+        - vdda-qrefrpt4-0p9-supply
+        - vdda-qrefrx0-0p9-supply
+        - vdda-qrefrx1-0p9-supply
+        - vdda-qrefrx2-0p9-supply
+        - vdda-qrefrx4-0p9-supply
+        - vdda-qrefrx5-0p9-supply
+        - vdda-qreftx0-0p9-supply
+        - vdda-qreftx0-1p2-supply
+        - vdda-qreftx1-0p9-supply
+        - vdda-refgen3-0p9-supply
+        - vdda-refgen3-1p2-supply
+        - vdda-refgen4-0p9-supply
+        - vdda-refgen4-1p2-supply
+
+required:
+  - compatible
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,rpmh.h>
+
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      clock-controller@1fd5000 {
+        compatible = "qcom,glymur-tcsr", "syscon";
+        reg = <0x0 0x1fd5000 0x0 0x21000>;
+        clocks = <&rpmhcc RPMH_CXO_CLK>;
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+        vdda-qrefrpt0-0p9-supply = <&vreg_l1a>;
+        vdda-qrefrpt1-0p9-supply = <&vreg_l1a>;
+        vdda-qrefrpt2-0p9-supply = <&vreg_l1a>;
+        vdda-qrefrpt3-0p9-supply = <&vreg_l1a>;
+        vdda-qrefrpt4-0p9-supply = <&vreg_l1a>;
+        vdda-qrefrx0-0p9-supply = <&vreg_l1a>;
+        vdda-qrefrx1-0p9-supply = <&vreg_l1a>;
+        vdda-qrefrx2-0p9-supply = <&vreg_l1a>;
+        vdda-qrefrx4-0p9-supply = <&vreg_l1a>;
+        vdda-qrefrx5-0p9-supply = <&vreg_l1a>;
+        vdda-qreftx0-0p9-supply = <&vreg_l1a>;
+        vdda-qreftx0-1p2-supply = <&vreg_l2a>;
+        vdda-qreftx1-0p9-supply = <&vreg_l1a>;
+        vdda-refgen3-0p9-supply = <&vreg_l1a>;
+        vdda-refgen3-1p2-supply = <&vreg_l2a>;
+        vdda-refgen4-0p9-supply = <&vreg_l1a>;
+        vdda-refgen4-1p2-supply = <&vreg_l2a>;
+      };
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
index 08824f848973..19ae0634b922 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
@@ -16,7 +16,6 @@ description: |
 
   See also:
   - include/dt-bindings/clock/qcom,eliza-tcsr.h
-  - include/dt-bindings/clock/qcom,glymur-tcsr.h
   - include/dt-bindings/clock/qcom,hawi-tcsrcc.h
   - include/dt-bindings/clock/qcom,nord-tcsrcc.h
   - include/dt-bindings/clock/qcom,sm8550-tcsr.h
@@ -28,7 +27,6 @@ properties:
     items:
       - enum:
           - qcom,eliza-tcsr
-          - qcom,glymur-tcsr
           - qcom,hawi-tcsrcc
           - qcom,kaanapali-tcsr
           - qcom,milos-tcsr

-- 
2.34.1


