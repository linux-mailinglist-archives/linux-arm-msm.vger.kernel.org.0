Return-Path: <linux-arm-msm+bounces-102747-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cFeJGIxH2WlToAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102747-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 20:55:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FEA03DBAF2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 20:55:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A5F733155F16
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 18:47:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF9DE3EAC98;
	Fri, 10 Apr 2026 18:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f+1unU9b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YnYkCXmL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A21873EAC8A
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 18:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775846656; cv=none; b=NVa47Y6nwvBdt9hf7dolsC5l2HQepBR18XLYcHsb8DdzZMAK0wa3kytGFAKJr8HAEO4u2Sh3CIMbnDWAg/ErLKU7R1yOQ/p00EDHxwrTJKkbYvhX3YWAQTJ1M4D750+LaUX/HTFAeF4QVS3mfaKo5K8bodj7SsOgi6FX8sGqGMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775846656; c=relaxed/simple;
	bh=WqsQpn7s0ZV5h/zaMO4HrjGzk6E644Ti9dj88dVmfNY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Tb82WOcALMq0svzRbDQ5LULD0b4RTYWtnBsclkkJMQFnaIMWB4JCfDa7kIwVT/rMMBUisri42s+yOmEBj1SnuuHsWPaAUyLO4Xyqx1HjFpsb+EipYHvn8GCbjgQIorVQbOyB7PFLq5NKwhLZ5W2JANLYFhA/iRJjcPX59n3Dy3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f+1unU9b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YnYkCXmL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63AF5tHQ3759380
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 18:44:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=V3rE52GS8C3
	mDxuji4MPgHRTXY0MLvScv2I3hFnriSc=; b=f+1unU9bMNJXmB1HP0/W+uS0clT
	Tz6i8fDp1aautou5eDy2adBVtFKfe2uDQXjdiEhIn0qvicgYjiF666rw3aV/vAfn
	Y8uZTWWDHSzfT59UOmCxSYDxQDY9pdY2MEWE9ZYgvBggW8XuW5JE+qgvA2YrcPuO
	S21UuZg2KWwQ0E8WoU17vU8BrB5AHHtz9MHxcW+WDVd2RhTqm+ZX8A97oDji4JQv
	PrxJuh0tvNFmWOKV354YtQGRKYx444PsfyHX46HHBM8wgi7SQgBv5Z/59kQSNh4a
	Bs355kFaYYEXFejm3fFmCcw3ynJNusOuTd0NYystOPAxpclNwFGKUCJQRog==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4df3j1gnhd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 18:44:14 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c76fede6ccdso1454111a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 11:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775846654; x=1776451454; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V3rE52GS8C3mDxuji4MPgHRTXY0MLvScv2I3hFnriSc=;
        b=YnYkCXmLJP7spBX7WGkaznjJQXyIX8yv5YVeMUYtaOa7B9cUb2ybGD9pFV6g4Xk6Ik
         cuoz3cH9CWGRUh0QMpdOJUag9ov0dQFY+n2O9WRkqEbsJOguykwS/un8HbRx/Qfu0pgX
         Y9N+GEvhkLLjOxJ5mmn/yvi6a39SYU0J+omPtBXln4gmrhemKqYmjv8q61r4iDB1Vcsn
         GDeCu5z3GR3qm3PF+N6IM3AVZaeUPfWJE2aEj/q9jnKIUORZHnqGEu/P4jo1ZyknATHB
         3VIFnY9HnVRGMhUsNmBRMoStJDGQNyuHDZHUXmYLF9d0LsXs7l8MlXRiiWDVWxHL0E9y
         v2kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775846654; x=1776451454;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=V3rE52GS8C3mDxuji4MPgHRTXY0MLvScv2I3hFnriSc=;
        b=jfZXOvTmIkc+NKjjbWx+Wz3bl+6LJ2QvOmb9gRjtpJbH8E2lMwHNVftQNvSNf/z24T
         g9O/sZgVH+DbwPQVmrUpC1O9+zwPkz6TbdwRZIEhJ5D1HSQXk6a42vVViPYk1VolRQrG
         aAyQSC0KsIjrBvXrokQq0D1tYvDINTH/C/sdfLk6Xq+BfrEVHMQCy4Y1AaB0Wk762EIO
         8w/ILp5d0q5934FR/Zvvdx7hKrJu643QjEi5UzmhX2UW4h8t09BKtG5EymEjXiQHThzu
         h8Nk0EJX2y77yqA0dAyIa3ISfx1hVCTdaJVZciioc2vCx85iFrt9iPmZndNzmGYWbTRY
         fLmA==
X-Forwarded-Encrypted: i=1; AJvYcCWFVc2bk5yDVryC/LJyef0xPEZIetlpzxRZPnlFTTPd2m2jckOmUTjyAX6/3Dsse5iEtlH3STxR/lqIjDK4@vger.kernel.org
X-Gm-Message-State: AOJu0YzR9SyRfKqClKqvVdTZES05L6Vz83vD8/xtDB70ivQBPoCrdrcd
	b3CnYDl9h0O6njvi3VKX40AiIKj5sxJcHM7VEpvLVixge/if92UK+UD4CTaEKIVWY3ucnxn20n7
	IlLhg8d0GTfJkil440j6yv8hq7cDW+BaYFDw1gy3u+y0mQoj+gceOvZL4GZVsiODnDCCP
X-Gm-Gg: AeBDieunsW5RIWyv5XYsuUgb8SfkuPtGmqhc0FYHBNqBBEi1nXnLxbBAlDlKGoJbs9C
	QV82kgyFajiipnFFMUmhTBmT6KoLKNu3YIdV5o+SDaA8iqtHy30+ts9cKJGioM06XMfKsoj9W8P
	Zb2UhsY+WcsLOjatiWwx/iTqen5JoBMYlhvOjfl5zs+3KpTOSkBwdxuUuli3u+WqzkuHxGdCgPZ
	mi7KEqo1j0Ber06sNc4GueeNqEJTpJz0Jg7l+rmPghbZUApS06VhmGPdCDV+BwKvCSsnSxmBMaj
	b1ZxmZfvAJSibYDhWIJ7A4gUazRPov5rBI97ygQ59FdQpZpn2WbbKTLUD3XBOvweNdh0T3jm5+1
	yWu33Yn1Y/7TuTV+dUB7Wx/KpvnZdB/pdmwUkTjHzO6jIAmx5
X-Received: by 2002:a05:6a21:6d81:b0:38d:ec8c:7e55 with SMTP id adf61e73a8af0-39fe3f18cc0mr5080428637.32.1775846653627;
        Fri, 10 Apr 2026 11:44:13 -0700 (PDT)
X-Received: by 2002:a05:6a21:6d81:b0:38d:ec8c:7e55 with SMTP id adf61e73a8af0-39fe3f18cc0mr5080397637.32.1775846653088;
        Fri, 10 Apr 2026 11:44:13 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c32e744sm4036922b3a.13.2026.04.10.11.44.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 11:44:12 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 33/35] arm64: dts: qcom: sc8280xp: Drop unused second PDC reg entry
Date: Sat, 11 Apr 2026 00:11:10 +0530
Message-ID: <20260410184124.1068210-34-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260410184124.1068210-1-mukesh.ojha@oss.qualcomm.com>
References: <20260410184124.1068210-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDE3NCBTYWx0ZWRfX4dTUc0r3zR3F
 7tpGLWeg7RFIWk5/A4Kkv19MTbd4L/NO6aNwsRcEQIVGF89mzarUmKm0VAOoH1H22zCGbaTrlmM
 sAn96rQPL4SY5Ud5rcJys9ZUNoAjpcurGLDsYAG4XxMDDfRDogD3kRoP6OwXe/P8H2OOh17nQDj
 Orj5sN5FmXvvPPV0dDboNVLTZz/YmdkYSxkRNrDNaGYtLZV+C70aSb7Jw7vMBP24fAYOnsaqSCS
 STCV361pt9T0x8/0xHBPX8n8OYwBTzQv9jDSINS4rZkHYghveyz9KE2LxA+i0hI35aUBd2iIb0u
 uJB9zIx+S3FIrRkqEl21NWTUbwOAOySQzcHfeRvJvMszKzbqOGkFWK44KICb/hR6HokvNoAgfI5
 lt0rAA14TwHSrwCLTBzUla3K6DtDzxyXgnQg+vApqY1dN1/Qg7i3jCUWBbzCWcJ2ptaE1YQaqd9
 8U2yrIC1znwpFLvzZ9Q==
X-Proofpoint-ORIG-GUID: K5S2Lx3TSdkI01126T7r14o4rixyKSGc
X-Authority-Analysis: v=2.4 cv=AbKB2XXG c=1 sm=1 tr=0 ts=69d944fe cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=PYWmFnaUksdtvJZQtVAA:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: K5S2Lx3TSdkI01126T7r14o4rixyKSGc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_05,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 bulkscore=0 clxscore=1015 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100174
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102747-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,af00000:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,b220000:email];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5FEA03DBAF2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The PDC driver only maps the first register region (APSS DRV) via
of_address_to_resource(node, 0, ...). The second reg entry was never
accessed by the driver and can be removed.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index 2c6e48495d20..59354f2474c9 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -5095,7 +5095,7 @@ dispcc0: clock-controller@af00000 {
 
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,sc8280xp-pdc", "qcom,pdc";
-			reg = <0 0x0b220000 0 0x10000>, <0 0x17c000f0 0 0x60>;
+			reg = <0 0x0b220000 0 0x10000>;
 			qcom,pdc-ranges = <0 480 40>,
 					  <40 140 14>,
 					  <54 263 1>,
-- 
2.53.0


