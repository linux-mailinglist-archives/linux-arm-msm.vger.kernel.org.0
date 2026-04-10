Return-Path: <linux-arm-msm+bounces-102721-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4ANPNl5F2WnjnwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102721-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 20:45:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 865E73DB902
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 20:45:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 693D830859D0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 18:42:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4689A3E4C81;
	Fri, 10 Apr 2026 18:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AY2dxTlG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R7h7dO5h"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B38B3E4C7D
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 18:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775846554; cv=none; b=n+2z7cVtiAoDDE8u7Jv8Daa1nexEeEgtVIeepZ1lw0oa1palxzdMh8QZK3wMqWsg02LRmogA1WhVkJp9WWFZUBMsmRFhrprIDklzsWpBO/RbTXK5806Wj00AuukxAXgHduUV5cMsVxBYjHZpm7c4xY4VqAwT9lNnVqVuXiWB7fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775846554; c=relaxed/simple;
	bh=HJXduTg9hxaA8qKqC+JL4c7iFkEjPIs9Sxs17pC9Cmc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GmU6P+Sfda/bX6gB0dRxcnUTc1LGiSadHz93JMl9hAMSgpMpOz+cBb6CwmZbQq2nmQmDFzQSw8LYaKv0Ft6zC+Fz9Cg9T9lV9HssojmVZW1TXZZce5L1kiUD9YVKZNDEi21PYapOVl37BnuFEPgTiVBpftwDCVOqzIqV8e1u22U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AY2dxTlG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R7h7dO5h; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63AHCcRt709170
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 18:42:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=FBhGIp5I0BC
	sP8tmjb8Zd7XQUOosbicmW/US1Z8/HZg=; b=AY2dxTlGihuctwTqllXzvKvkkpR
	dTnf+NdIn6H1N7cUUDRx9tTTGw/XYD6L2oFsSLnmihxdCcTPvNvUU07sC2FDSLrl
	tVzHt1OvvG/V4ya8ZI3ZMbLv9Ku46Xm8afWCPjcE9mHFhg/KyDjxEPpRDqtPAE86
	fAougywIJzAlXKwxUXVL6kzA16k12G97wZidWm9e6K3pHNt0HkrRjMok9z5rSBcB
	S8emBk9EJi99+z0QNTh0UU33NISbpAx/ycvvKyuYoPYUYgDXSqGsFMNobx1qKc+l
	2ii1bF29yPPVLZmDmF93jD/RJQS81H3NCCJ66Cu2I1wfjcWWX2LNNE1EoIw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4deudj2jjv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 18:42:32 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82cf8dcd079so1489982b3a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 11:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775846551; x=1776451351; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FBhGIp5I0BCsP8tmjb8Zd7XQUOosbicmW/US1Z8/HZg=;
        b=R7h7dO5hQbtcJ3EAYMR2QwuSvNZHtFalkrconn08VNwagQL5GN5TqXy5VoAOndheep
         YNMWeSIBN6fExK+qToMfvnEh4DKxd0VY8ZQxDtSHNXdSGApiNiFfDqvRXygUiIhcKdnO
         OGi7gYHCvqlgCy4kYUiNkTVpbfitTbNsYaK0MeiEBZs287HRXbvOaiNbcXgWqnJBK3zT
         34NDN5PFOCndpmOg7c4G9I4ALH8RUEKhLPu1WJb4G8LuWLshROTDGSR1MehxOrzrHh+p
         wI4/HaH6Xq+ng5nx11rytcUfW109O0qPsivhbKsySJa8H2WQx68sDa3lV/Wz/aiPp7tS
         rBJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775846551; x=1776451351;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FBhGIp5I0BCsP8tmjb8Zd7XQUOosbicmW/US1Z8/HZg=;
        b=ssV1G1zxGU81KtUqTMApNopzzFTlww2KipkCxN/SMmArjvmB5SBe/wV1tS0Vws2jDn
         J+KqMpL3gugg9Jt3RrUgxV3uIov7wAM6q5eMnpf+m6+oHfcXQxZhHaEzL2OF+02z93yh
         1CJP1ssUKeVFJzd9Y6VTUg5coJlNyo1ZtXNtVV4llQXuSoQ7Vm0e/O1135bXXpRka9p7
         /sjhAVgjxvo3Q4qF1Y2wYqwANsNtGig/djHDf/acnAAc9OqQGAYgKSbukz8hXofBvOzI
         62YLtOgLh+34fBKNiAJb362N76FS28J25ephovYciDHJQQzzuB/6nvBMUnUpAo/nXwlP
         cqPw==
X-Forwarded-Encrypted: i=1; AJvYcCXmefZ4YHFCbfOT4fqp+WvpiAGhzoF//AGdeP4T8KZHL125WTBfCPOMEMQOT+Smgllv4qMCAwXqNUfe4NNO@vger.kernel.org
X-Gm-Message-State: AOJu0YwwrROkA33jQCvz+f4oVUf4ITIv307VQxjfPm7VLGB+73/I2XZs
	GIHQ7ya/SByH30YWfPDKc1Ok0dCY3x9SoAwK6r4QKT3SN2aP4igZLDWNzcYTfKvPS2nPUQ4Jmd2
	E+6apo4A3Xwh5n4rv8RJ9zsZ6+LhmlAU5/hEJw4/Nm1O5L35EbstiGOms6qWDHjDBV/A0
X-Gm-Gg: AeBDietf8An0+X1po2qZ47oq3znbJsZuOtXx638PbL926l8xpG096YYKEJDfyW3zqNn
	d+uTSox0/fVc8w0IlFHnC7zerWHjceIMToIKjiiLnCJ5AFm3WjOtmhlq3q6ruQPFxnH6+ov+7F9
	Svu2BBPYMci4XQ5emGr6FfNmLDc4JiYwFsIKPg97tgsA/8NK5IMsIECwNmeBmLWFlaUvxQRFUm9
	KB4F/XFCQszkXZLVBUpuy534w1WD66bCC4dJTo9bymlYGdn5tsbWt2sLMdkvwyp/Y/sl3PxDK3y
	v0kQOvD3wicZlwJ4VxwLRylr6cG5ySJXMto7VsJe9W/YvR1wtyIkO0/EByznxOVEb5fTc2TA5Ho
	7j592r/o5SE9Yhd+E/OR/MjWLfW2TRdha4d9EugGpKlJFliqj
X-Received: by 2002:a05:6a00:138c:b0:827:28ba:ff00 with SMTP id d2e1a72fcca58-82f0c169e53mr5293585b3a.18.1775846551407;
        Fri, 10 Apr 2026 11:42:31 -0700 (PDT)
X-Received: by 2002:a05:6a00:138c:b0:827:28ba:ff00 with SMTP id d2e1a72fcca58-82f0c169e53mr5293557b3a.18.1775846550804;
        Fri, 10 Apr 2026 11:42:30 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c32e744sm4036922b3a.13.2026.04.10.11.42.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 11:42:30 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 07/35] arm64: dts: qcom: sdm845: Fix PDC reg size to single APSS DRV region
Date: Sat, 11 Apr 2026 00:10:44 +0530
Message-ID: <20260410184124.1068210-8-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: qSUsdJH13pQhSUuIJGBqlObW8IG_xt-u
X-Proofpoint-GUID: qSUsdJH13pQhSUuIJGBqlObW8IG_xt-u
X-Authority-Analysis: v=2.4 cv=cKfQdFeN c=1 sm=1 tr=0 ts=69d94498 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=oy73fdSuVNde8ymsYewA:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDE3NCBTYWx0ZWRfX8mbiQdfTbV0B
 W2nuJN7522R3CqWR3sskdh4S9HeQYS+EJwwqVgb4joQ8jivMHpTTzFVmwlpCl5ez8woYpdV09L3
 jvDS2J0zDgIbH05XpLd0q1rwLGOsHiTqXPQPT1T8TOSzrOllcbBM/IYlK9wiEohP93FLHfF+Z2q
 Bj7VhCIvp4G9ne0ym4M8ONu0jrzqAJuFh7rA6BnCY/MQ57bbOeA4HtS75LXXg+mnXpNITh43qbQ
 FhKPv40w0oLA/I64mF0ZVciMJx10EMFSpAR02zAWWDv2DOXh+GgR4yweICCnOz3SJF6SokoaN22
 0Am0wAdFG59C5FudfjqcQhcUS0SS4X+TmxGYEJHL6IkQYBj/UlsatookKArlW30IBbLu1K1QNNo
 irdR9buVrp0AcxvYBj1MkQj8e9TzFpThx88H9MxkFX5QJEkKgajJqHXjdYvROCJ4dxRCpzf8H6P
 l0jr4nJm1ueWSHEqttQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_05,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 suspectscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100174
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-102721-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 865E73DB902
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The PDC reg size was 0x30000, covering three DRV regions. Linux only
needs the APSS DRV region which is a single 0x10000 window. Reduce
the size to 0x10000 to describe only the region actually used.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index bf2f9c04adba..09eec9ae03b0 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -5044,7 +5044,7 @@ dispcc: clock-controller@af00000 {
 
 		pdc_intc: interrupt-controller@b220000 {
 			compatible = "qcom,sdm845-pdc", "qcom,pdc";
-			reg = <0 0x0b220000 0 0x30000>;
+			reg = <0 0x0b220000 0 0x10000>;
 			qcom,pdc-ranges = <0 480 94>, <94 609 15>, <115 630 7>;
 			#interrupt-cells = <2>;
 			interrupt-parent = <&intc>;
-- 
2.53.0


