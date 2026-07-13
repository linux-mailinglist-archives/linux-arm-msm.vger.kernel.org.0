Return-Path: <linux-arm-msm+bounces-118642-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SfTjEDSHVGrCmwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118642-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 08:35:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E1947478DD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 08:35:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=TtMHN7Lk;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=F3wEtf33;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118642-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118642-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C48D13032648
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 06:33:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A905381E91;
	Mon, 13 Jul 2026 06:33:56 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10FE8365A13
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 06:33:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783924436; cv=none; b=b4bmKdH6rAOa01eZ6sgdcpJhLPMi5vNyoEWZz9IFHpzglEfyI8zKfp/vpTwG6kK6Ydy12Adp/XN6w6EUxUYhf+qfQBi6WMSRcX1zdmxTqZMt+iQn87v0X1BN+HxxGly5ir0y9lJNiXpE1rqdUI7eUS+ae9khru3pPrL5f1rNf2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783924436; c=relaxed/simple;
	bh=27EaIAhqGp+mquHVB6kjkp0Z2doJh2GJOYZQSDehpyg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C/deCZPyz30vGqzdv9V+nvdj49rjftTgsnVU5dtO8c73+gsHDtd4X2ikZ8kLFmCIjvoh2Cpk4TuukbgR1mQvNv8upBNfnkq+PwaY26aefLiPhc9zCO2r8tnpyiUmzSPu6Z2aLKZtWgwc3h9KW3ZoNLL/YkjwiuJXm5JQNVjQXj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TtMHN7Lk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F3wEtf33; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D6Nwu5390875
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 06:33:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qprFpyjG0X97ZmZqIX1N021KXVlLLLyX73couEvv2lg=; b=TtMHN7LkPIKiJb1W
	T8Or4o+d02tJskQ+r7Gtnzgr7+v89b67hR/V8P1KOS8LN5cDrvhhhzDeGsafzE9e
	HoUGUR6X+scfM0Y+7La72sZDRjTB0PVzXyLSCWG+l0Ze9/PZHqzyoaBqsU6HXVfJ
	h100H1FEQ08F091PF8XlCP1E7p0SjW7r8qAFVCmB/JHdXpnKYhxTmxVSLDLiaK3V
	HW9UApulTmxDu/JFn5Zv5ZP2oht6CB/Cb6EOJnK/kLqvw5u2Zx8kZT19PXfS1UOH
	cFxevUeVakDEHu3O+tiLgZVfAie19CkqW45sN1EqSdrUbZgZC0vpxDG7NnzgikYB
	sV0vgQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbf0gmkyx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 06:33:53 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-ca860baea9fso4193574a12.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 23:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783924370; x=1784529170; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qprFpyjG0X97ZmZqIX1N021KXVlLLLyX73couEvv2lg=;
        b=F3wEtf33LVJ3+qYup22bAv5ee0E2InRQ+3VCHQwxaKWFxnTmyINd3H/1JTd8lCeMAi
         k0mRGXZf8IrzbTxi44YKuFuNfj7MPuTKOcNtS9cRXTErT2XT+2xWTU/8cJQFM3dZ/Kh3
         8K3LyWo2iX0vTpIZg2MjtIcBz1NSXKwZKerK3PQ0sIy34zW43vmUZ9bidqcSRKoLsDEC
         csSa53LJHLGHOiaVdvTXcDGJs4hR5K4MkhUXtVke8UFauvWeSrt8PltOUFOCtMEB4TCr
         BL4ImCM649NwSK4lmsZaRL+a0ONApUqiwAYAk4CcTngHBD4LfpSfC4ikU1lND5lbMj41
         9JBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783924370; x=1784529170;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qprFpyjG0X97ZmZqIX1N021KXVlLLLyX73couEvv2lg=;
        b=EmQZGjdldpatt10BqtSUWKP+LL/z3/lTVl8BBnVYenHW6Ao8YPhSjhBW580P6y70Zz
         4mOiQPawumvju97iGVGe2epw/WCaocKnBPa3qdtJm2LXzwYQv1+Pily50XVDya7Eg+95
         XoLh++ZCVugLH6BA8bGKW9u50Tk07NlQurl7pj+aAIW0x8/uRHdYzk9REDaKPU/C/F8t
         g7gJTLES6hGnnn5Nq3rIgI14G3X8SYckz03jtb7cjfL7/DPy/hSU0x76AGxwzbneQRR+
         /PqqFC9Dmx/LTqGaai8JMtlHGDG9ZahqH06ltstaWna9A3Npkyj4bafpRRYUmFsIvvrW
         AU9Q==
X-Gm-Message-State: AOJu0YxNa6sUIrHl7ejMgi4e9jiEcfh8u8q9LVd63HaN/8QL55YwUuvs
	xvdRTHXsRMMx9hKSwArphkm+4WRFgsL9hl4ZT1U5xXiL3rcAHYbDt+RyTxV4B1Y7RwiQrb23CAH
	NUyHhj5fyXCKGVTydYWlffswkuWlH9IUFUt66+lzk7/ND9c7M+FLTPN2ZSip3cbcsrxSY
X-Gm-Gg: AfdE7ckxQchry9QEcPQq083FDZ1TsVPgoMPGyN79FFdy30szqmfyWs3i0w8OfqrHWXg
	qpJ+doBzYbkStoEaAzyLBqQ7UN0bjXMZpRdk6RlDV+tN5Ph1gCucHzN7GkIqaUdHI+j1hBT5TAU
	fyIfDVSFfATHzNYp8S6xMPvfvpzrRoplomhEQiNUheun7xM+XQKS9+sQoTsADlTD6lTgHyKUael
	XJLqN1Qsf4AEoJZTDHbfl2/IWN3QTWgLlfeluECynV9yickPRfq/mLnn8gaW5fuH9EwVzKT+8Ul
	g7m4+1gfHj55vuii/6u+0mRZHRYZ7Qx3YcDGKEgP2tNHja1ATQn9RaeI57/Md0WFQePHrlaGR/W
	pJ2Tl6GucgFVKlg0bX2svpZJQoN0d3UmMY1nAp+ma9cuivqyLtw1XL504eNRoxn3A8MkDEsXh/I
	8blpd2GgUqseVwipQ7rH7Vj2o2qGiiLU4MEm3mRg/W
X-Received: by 2002:a05:6a21:50b:b0:3c0:9c1b:d0b7 with SMTP id adf61e73a8af0-3c110a1213fmr8922191637.66.1783924370394;
        Sun, 12 Jul 2026 23:32:50 -0700 (PDT)
X-Received: by 2002:a05:6a21:50b:b0:3c0:9c1b:d0b7 with SMTP id adf61e73a8af0-3c110a1213fmr8922173637.66.1783924370005;
        Sun, 12 Jul 2026 23:32:50 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b87b92b27sm25435361c88.6.2026.07.12.23.32.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 23:32:49 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 12:02:18 +0530
Subject: [PATCH v13 2/6] dt-bindings: remoteproc: qcom: document hexagon
 based WCSS secure PIL
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-rproc-v13-2-41011cbcda3e@oss.qualcomm.com>
References: <20260713-rproc-v13-0-41011cbcda3e@oss.qualcomm.com>
In-Reply-To: <20260713-rproc-v13-0-41011cbcda3e@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manikanta Mylavarapu <manikanta.mylavarapu@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>,
        George Moussalem <george.moussalem@outlook.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=Nq3htcdJ c=1 sm=1 tr=0 ts=6a5486d1 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=UqCG9HQmAAAA:8 a=fvnyRN_YwKOm8-nVNuIA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: X9eIPTf0gblVMy_qL_IyOLov99Dm9u_N
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA2NiBTYWx0ZWRfX9YWJmgL+9q06
 6/rv0BVzbmidvWbHrPZAtgzEneIXISIJ2SjTKbFw2nVKzh1velhmmLn2pmlJlG1CpvaqXvMtJeX
 FPmeE7kZEJr8Sh7DxCHt5ChbxZ/Lpl/eyJuZPIzxKwHgv+UFIIgZztPBR9DS8SM4jfWRoK4ZI1d
 6cJnu9MePoGivPy/FkN2jSIsVkMTgaxUIQg5agmwkHxwtKeLvjkOVunBVGNYNGPXkVSIWQZi8VG
 YjGzzCwFbLKb5i3ktWSd5CTl7FwmxWIeECBBCZsMJYwYLL/WIr8c5i/HZMuxYZONlY3+Wb+eM+c
 6zY5GrIP/NiWVYyl/PdK3S87idenCZiy73yw+9Xd0HVVthryXwaecAFQwRtaeFJAMGNIJgFTpbe
 OdvAX+ykZ7QR2qepD5Ok+lXLcRuCZ65pX+OHCwUrDjYuhw3NEgSDoZGwFE04Mp2ixp85cKM1MU9
 xjWt0bMPllhIRqwX+tw==
X-Proofpoint-GUID: X9eIPTf0gblVMy_qL_IyOLov99Dm9u_N
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA2NiBTYWx0ZWRfX6Q6TPIHyF6UF
 A+6m+RA44M9oPVigDl5Mk28S2ZWQgeNYNMT4mr7IEbY2LrBXFj/ECBcLiI49rJ1TgxWfu/k23kD
 eEbdKCydBI+ckrC1XdAiU5Y8hq1dkcM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607130066
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-118642-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:mathieu.poirier@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:manikanta.mylavarapu@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:devicetree@vger.kernel.org,m:gokul.sriram.p@oss.qualcomm.com,m:george.moussalem@outlook.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:vignesh.viswanathan@oss.qualcomm.com,m:varadarajan.narayanan@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,oss.qualcomm.com,outlook.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,devicetree.org:url,outlook.com:email];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
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
X-Rspamd-Queue-Id: 8E1947478DD

From: Manikanta Mylavarapu <manikanta.mylavarapu@oss.qualcomm.com>

Add new binding document for hexagon based WCSS secure PIL remoteproc.
IPQ5018, IPQ5332 and IPQ9574 follow secure PIL remoteproc.

Signed-off-by: Manikanta Mylavarapu <manikanta.mylavarapu@oss.qualcomm.com>
Signed-off-by: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
Signed-off-by: George Moussalem <george.moussalem@outlook.com>
[ Dropped ipq5424 support ]
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Tested-by: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 .../remoteproc/qcom,ipq5018-wcss-sec-pil.yaml      | 178 +++++++++++++++++++++
 1 file changed, 178 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,ipq5018-wcss-sec-pil.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,ipq5018-wcss-sec-pil.yaml
new file mode 100644
index 000000000000..a6fc3a9db621
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,ipq5018-wcss-sec-pil.yaml
@@ -0,0 +1,178 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/remoteproc/qcom,ipq5018-wcss-sec-pil.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm WCSS Secure Peripheral Image Loader
+
+maintainers:
+  - Manikanta Mylavarapu <manikanta.mylavarapu@oss.qualcomm.com>
+
+description:
+  Wireless Connectivity Subsystem (WCSS) Secure Peripheral Image Loader loads
+  firmware and power up QDSP6 remoteproc on the Qualcomm IPQ series SoC.
+
+properties:
+  compatible:
+    enum:
+      - qcom,ipq5018-wcss-sec-pil
+      - qcom,ipq5332-wcss-sec-pil
+      - qcom,ipq9574-wcss-sec-pil
+
+  reg:
+    maxItems: 1
+
+  firmware-name:
+    maxItems: 1
+    description: Firmware name for the Hexagon core
+
+  interrupts:
+    items:
+      - description: Watchdog interrupt
+      - description: Fatal interrupt
+      - description: Ready interrupt
+      - description: Handover interrupt
+      - description: Stop acknowledge interrupt
+
+  interrupt-names:
+    items:
+      - const: wdog
+      - const: fatal
+      - const: ready
+      - const: handover
+      - const: stop-ack
+
+  clocks:
+    minItems: 1
+    items:
+      - description: sleep clock
+      - description: AHB interconnect clock
+
+  clock-names:
+    minItems: 1
+    items:
+      - const: sleep
+      - const: interconnect
+
+  mboxes:
+    items:
+      - description: TMECom mailbox driver
+
+  qcom,smem-states:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: States used by the AP to signal the remote processor
+    items:
+      - description: Stop Q6
+      - description: Shutdown Q6
+
+  qcom,smem-state-names:
+    description:
+      Names of the states used by the AP to signal the remote processor
+    items:
+      - const: stop
+      - const: shutdown
+
+  memory-region:
+    items:
+      - description: Q6 reserved region
+
+  glink-edge:
+    $ref: /schemas/remoteproc/qcom,glink-edge.yaml#
+    description:
+      Qualcomm G-Link subnode which represents communication edge, channels
+      and devices related to the Modem.
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - firmware-name
+  - interrupts
+  - interrupt-names
+  - qcom,smem-states
+  - qcom,smem-state-names
+  - memory-region
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,ipq5018-wcss-sec-pil
+    then:
+      properties:
+        clocks:
+          items:
+            - description: sleep clock
+            - description: AHB interconnect clock
+        clock-names:
+          items:
+            - const: sleep
+            - const: interconnect
+      required:
+        - clocks
+        - clock-names
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,ipq5332-wcss-sec-pil
+    then:
+      properties:
+        clocks:
+          items:
+            - description: sleep clock
+        clock-names:
+          items:
+            - const: sleep
+      required:
+        - clocks
+        - clock-names
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,ipq9574-wcss-sec-pil
+    then:
+      properties:
+        clocks: false
+        clock-names: false
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    q6v5_wcss: remoteproc@cd00000 {
+        compatible = "qcom,ipq9574-wcss-sec-pil";
+        reg = <0x0cd00000 0x10000>;
+        firmware-name = "ath11k/IPQ9574/hw1.0/q6_fw.mbn";
+        interrupts-extended = <&intc GIC_SPI 325 IRQ_TYPE_EDGE_RISING>,
+                              <&smp2p_wcss_in 0 IRQ_TYPE_NONE>,
+                              <&smp2p_wcss_in 1 IRQ_TYPE_NONE>,
+                              <&smp2p_wcss_in 2 IRQ_TYPE_NONE>,
+                              <&smp2p_wcss_in 3 IRQ_TYPE_NONE>;
+        interrupt-names = "wdog",
+                          "fatal",
+                          "ready",
+                          "handover",
+                          "stop-ack";
+
+        qcom,smem-states = <&smp2p_wcss_out 1>,
+                           <&smp2p_wcss_out 0>;
+        qcom,smem-state-names = "stop",
+                                "shutdown";
+        memory-region = <&q6_region>;
+
+        glink-edge {
+            interrupts = <GIC_SPI 321 IRQ_TYPE_EDGE_RISING>;
+            label = "rtr";
+            qcom,remote-pid = <1>;
+            mboxes = <&apcs_glb 8>;
+        };
+    };

-- 
2.34.1


