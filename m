Return-Path: <linux-arm-msm+bounces-118754-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LNCHC6nTVGqYfQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118754-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 14:01:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1600474AA93
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 14:01:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=YHu72Zwn;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=YYe3flSI;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118754-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118754-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8A9D1304E55D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 11:58:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 069753F4DEA;
	Mon, 13 Jul 2026 11:58:38 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 656A73F482A
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 11:58:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783943917; cv=none; b=TlB68CiV0+lpuTzQXfaUAdsqeWfNeozXat1CEQyBcq9fAb5z/vEUUmOwkVQ2VrWu6VyHk9TzDDoJz5J9t+uJfP0l+MPjYyq2okdasirwPt1oCv7QLxZZxc8P+dmoNhOFZAO5fRbNRChE/f95vTLFbE2FJA68MswG5MUWMUYdgqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783943917; c=relaxed/simple;
	bh=WeA/Wy9c5MKU2UD2GwOeQhDQz66ME3bEbXly4eAnD0s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Xe5V+GXndyKEN/1fy86+iXais1/k6S5LU+yQVgr2xMvNAueHaRmXG56Br3NsagtrfiGnG1kr7nAxjpdGIJ4Ul6Huirn6KMyVSDjiQp5H4i0IzTMXUjRa+9SyFO7dlm/4ZvO2Mzdct74BXxsoHrAvEQPl5F5m1WWTbULVwynHgCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YHu72Zwn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YYe3flSI; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D9RAjw1123001
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 11:58:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5iJieZ8EQcjhAmKwiUQKT3yTUvEdnOkURgGJjmiy/Gk=; b=YHu72ZwnG0tE2hUb
	GOqWR5IaC6HkplUS8vPSnVfL0pBVP+BlsUTm9vZ6H3Ms3bUqpJRuDSakBZonettR
	szF3GqdM/XdlSxbrd3bvYitx4/hQDXWlgXCeV+s1Y14q5B4YYLWWvw7fAzAEYGYK
	rDJS7kL6Gw+m3oSCiEvjMXxzXlsZ+t7AysLcsx2QrPvrHNQEhABcLTBtB7YVcLDE
	Di8mR+U6pfPy5/n5JLwjyR6hdrJD9KySjUgH1u3h4FdTGmTn6KiwNxUD87E/ohNi
	FeOEOLxdvL1qR768F4nL0jryvVn5Bo7Y0cFcN2/oUUwU0gNZWH0mZCy/IrtbjzWu
	j1jNLQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcwda0ht5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 11:58:33 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3823dcc1647so4088812a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 04:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783943912; x=1784548712; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5iJieZ8EQcjhAmKwiUQKT3yTUvEdnOkURgGJjmiy/Gk=;
        b=YYe3flSIx4z9iOwx7+ngZDh7vOGcDsjgNbfkvMYbw9BPvRuYTxwNKBQe+yIHRW4enA
         TbdATmr9rDB4qaIMhYEpXAhC6Qkkfnd+N4x+2rxk7t74s/rVhMYWs9nkfnQMWhjUvheO
         /ou1JWy17HW25s2xvtOnvV0LNnkSP+ukef7kz+rrXeZHezQkYvgxC27zIyX4RjDnA7xr
         QQeShQQFYQTRbZ1tTx8/VTjgUEN+L+SH/P0BvPYkOJw5K/FnLf3nLyQbWSX6etWYvwJT
         sKOUGG+1XcQG+nNhxccHakPyA4PaXrbSpnGsVE26EOBqzY2OOPZOOism9wS44rVGlXK3
         yEkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783943912; x=1784548712;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5iJieZ8EQcjhAmKwiUQKT3yTUvEdnOkURgGJjmiy/Gk=;
        b=PvknvI5pSU2I2apBK8fSVPoLzEd5vhDKXffpQicJdAhXBXTmIxAE+qN5XBJrHEUSSH
         l+zpFUC5wxklVmySi6uirhzbm+wKE9GvAE3dJ2Nua9+xG19rx+G+XZUPPkI81FIF1+Wr
         6HGE8D5s+vsuqyjZCpfqJirUHwG0b/1GYIiGUdDgk7Fa6qkqLT8O6ysrtusNg7THgPYA
         fwtoK7EtNFb1YSFfh763nPFuljgFuDn+Zkb1OSDo5d1YosBx6p1ANaYfcdB56pwVD4hd
         0ZOCERVMlyt7Od4+Ct58DQN3A7YWKqro7B+ot5GOrn+i0dhOc3dfgMBfUKdnI0NiIl93
         enjQ==
X-Forwarded-Encrypted: i=1; AHgh+RroXK4dT3pw7qRCKKRA8EbPnTqonXzoVtI2eHZEL09LL6bmf9GzPk3WJ/gvXjuvDbfUsmujjmEVuzqNtKdG@vger.kernel.org
X-Gm-Message-State: AOJu0YwZDB3GQyX2utipcJwOz1g98PogQ8qhdirTcKO1Gd9y4UAm2MI7
	4maGTi7ImONe72561lzFmsn6jJkquXm12JeP4N1UuECUHHSOuGFdFVubx0ZRbT4upufk0KOCye0
	U3vxZkaES/OFc7X1ozmQ7VN9w8quMRW5MQ5fsKqpxSbuoTtM2YpeyEQx9bFDjzbSNUNE=
X-Gm-Gg: AfdE7clp8JjIDY+rdEYtUQDzYS8/BOK+5K4rJNzeYhlYZJBtBRi9q7bYD16jCXUFT8i
	vZegUU1f4ppQeE7Yqvo8bEwn2kIXhVT7T/s8RR4M4eZua5FB87NTbAio6lF25ob7O6ZJFAvM9CX
	93LdvRy5if9GbJXrXflGzm9ekVKJHCij0kxXa5LIBBDqs/SZ2CGfrmzvgIMtY6esjhsCjS6ogHF
	JRYfNb7rkz/lWz5zbMFuHvuqoqWW2ftci1+AblDq5g5YjQGDOVShe0yFYxgQfsTOx9jkJUzOebp
	M2fld/ihRjlKAmMncq1e3vanb7koei49hX/rEtG4UzVnJlavMyJNtdGut75LDicQOqCf7nmz3KV
	TfyeyI8gH/FjGyl3pYExdMEl95HUgsJKtkZ+C5Fxt
X-Received: by 2002:a17:90b:5344:b0:381:1b66:4734 with SMTP id 98e67ed59e1d1-38dc75d0b31mr8284347a91.6.1783943912329;
        Mon, 13 Jul 2026 04:58:32 -0700 (PDT)
X-Received: by 2002:a17:90b:5344:b0:381:1b66:4734 with SMTP id 98e67ed59e1d1-38dc75d0b31mr8284335a91.6.1783943911906;
        Mon, 13 Jul 2026 04:58:31 -0700 (PDT)
Received: from hu-kotarake-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174ae6cd9sm74546638eec.31.2026.07.13.04.58.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 04:58:31 -0700 (PDT)
From: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 17:28:15 +0530
Subject: [PATCH v5 2/2] arm64: dts: qcom: monaco-pmics: Add PON power key
 and reset inputs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-b4-add_pwrkey_and_resin-v5-2-3bea476e1453@oss.qualcomm.com>
References: <20260713-b4-add_pwrkey_and_resin-v5-0-3bea476e1453@oss.qualcomm.com>
In-Reply-To: <20260713-b4-add_pwrkey_and_resin-v5-0-3bea476e1453@oss.qualcomm.com>
To: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783943896; l=1670;
 i=rakesh.kota@oss.qualcomm.com; s=20250919; h=from:subject:message-id;
 bh=WeA/Wy9c5MKU2UD2GwOeQhDQz66ME3bEbXly4eAnD0s=;
 b=lNNwuqwq1a2EM9whUp2dZ4sbP/GSnfnsOJsmGPhA2xqLV+fwu/Mn2oFRmWMG9ToK+UlXnVAQU
 K+UhKJ8s0kwCxwbI7w35A3hEj8sdJOiL5abTr3SspYQIW7i0tI/eMls
X-Developer-Key: i=rakesh.kota@oss.qualcomm.com; a=ed25519;
 pk=dFhv9yPC8egZglsSLDMls08cOvZKZkG6QQn1a/ofwNU=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEyNSBTYWx0ZWRfX5QuYh9PQh4zS
 cyNDTYgZ64o0RdH6iLzv43VYKjq7oJ42jBrSbDDGwcAwtmATdIumV+hZPI2kpYdbqdPMyp/y3SG
 fcTlHc8AV2ylCv6m+6qv9DGJWlM6tgU=
X-Authority-Analysis: v=2.4 cv=cNbQdFeN c=1 sm=1 tr=0 ts=6a54d2e9 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=f3aK1VMAgMfWcFvZUCoA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: iYiZLTH8nUHVaHIeJOvjTAmdAFqKjXcO
X-Proofpoint-ORIG-GUID: iYiZLTH8nUHVaHIeJOvjTAmdAFqKjXcO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEyNSBTYWx0ZWRfXwDQDJ+Fwdo0T
 W43ZDCeylTTd/jPw2DgiyjlmrC5Rk1VW69X6HixubCgSgLQkdTEasNy6wHDxhtBmazbQWkMrNB8
 Uchb3DNn7gQ0hJNJT7YMpXLaDRelC1IpgrRTzvhSn/3XqRTMFRFAuj7QoDSmGwEnpr7f+dp3jBc
 4hfKbgOEFE6zs3OXa+Ta0eE5/KzTmxC9DOAnjKfcN5Y8LoKrp8Kptp5KLFXkL65cN6jyrKt2uLZ
 y4MVeEvP5k2fHnVjolL4yYUUZwi/OAJVnRysd440J83/C4OklvbzR8V553o+Eo9ZLSgDhgR32si
 2owhXzFanqs0resVX0aEYEg2JROh8spSx0UA0u/yXqG++QKHOYchKbGyQXPBYfqWrDfg5Yo6T7r
 14ZnD9cvuC2FPulHM/+86UtFVS+Hb/muzL4BYmCP35KvNDhOr1nwEdriDOOgOFhQb7JZeWpVBJn
 5T8Hx/y+ha6wCXyebjg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0 impostorscore=0
 phishscore=0 clxscore=1015 adultscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130125
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118754-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:sre@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:vkoul@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-pm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:rakesh.kota@oss.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:jishnu.prakash@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[rakesh.kota@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rakesh.kota@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1600474AA93

Add the Power On (PON) peripheral with power key and reset input
support for the PMM8654AU PMIC on Monaco platforms.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
---
Changes in v3:
 - Disable the resin as suggested by the Konrad.

Changes in v2:
 - Add new PMM8654AU compatible strings as suggested by the Konrad.
---
 arch/arm64/boot/dts/qcom/monaco-pmics.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco-pmics.dtsi b/arch/arm64/boot/dts/qcom/monaco-pmics.dtsi
index e990d7367719beaa9e0cea87d9c183ae18c3ebc8..af4c38309efae89479f9a11fcb970a4c18f03a91 100644
--- a/arch/arm64/boot/dts/qcom/monaco-pmics.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco-pmics.dtsi
@@ -13,6 +13,26 @@ pmm8620au_0: pmic@0 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
+		pmm8654au_0_pon: pon@1200 {
+			compatible = "qcom,pmm8654au-pon", "qcom,pmk8350-pon";
+			reg = <0x1200>, <0x800>;
+			reg-names = "hlos", "pbs";
+
+			pmm8654au_0_pon_pwrkey: pwrkey {
+				compatible = "qcom,pmm8654au-pwrkey", "qcom,pmk8350-pwrkey";
+				interrupts-extended = <&spmi_bus 0x0 0x12 0x7 IRQ_TYPE_EDGE_BOTH>;
+				linux,code = <KEY_POWER>;
+				debounce = <15625>;
+			};
+
+			pmm8654au_0_pon_resin: resin {
+				compatible = "qcom,pmm8654au-resin", "qcom,pmk8350-resin";
+				interrupts-extended = <&spmi_bus 0x0 0x12 0x6 IRQ_TYPE_EDGE_BOTH>;
+				debounce = <15625>;
+				status = "disabled";
+			};
+		};
+
 		pmm8620au_0_rtc: rtc@6100 {
 			compatible = "qcom,pmk8350-rtc";
 			reg = <0x6100>, <0x6200>;

-- 
2.34.1


