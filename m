Return-Path: <linux-arm-msm+bounces-102743-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wPhlGKxI2WmkoAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102743-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 20:59:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AC6A3DBBE3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 20:59:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 236E7309718C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 18:46:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A8BB3E959E;
	Fri, 10 Apr 2026 18:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KvVJjqbk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XtjQdhYK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 240973E5EF6
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 18:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775846641; cv=none; b=h+p5GBYBln5VsjCTgfZ4R7cB34tdyKnjTTVPfUO//gKRHGf7mHdfWj5V8HlM7oqWwGwDo8ScI4sLd5iT6PKk+w2vw219BmEqMDuIIQRgmf6T7i+17lulqOpRBN9ckfGJpQKstlxsjkKNzLE1Zr0ZgjHyCGQuip9T4R2A4Okiiec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775846641; c=relaxed/simple;
	bh=aEBAnLlxCZozHzOwGXFnubDkSflswiY+W6QfvA/HVhg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=isGXf3+IJtadCLKo6IzVj4m+J5f3w4My4MZ/RpzotsSKkrHw5uNStPhVjV6Kv/9sFFZusAfRK4mccTQwgugXEzcgM3+BYvf66BRs9JhZkQeXy7sNKQNuSsY45vLsgua5Ufa1jy5QTsChanfd3e/MxpNZZ9I28Pu7XzHZ02I5zZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KvVJjqbk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XtjQdhYK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63AGkVoF2047821
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 18:43:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=61VZ+Zf992l
	YtRYAJuSIdkeDIpmhb6h081Ez0jvr6hI=; b=KvVJjqbk56EDSzP7ydEl4AyzaoP
	KBwu1RotbRANVdv0Ib5F2/Vz2Jmu5qWx/ERf+7IhxMJcbJS3LRCJJ+juZj+S/5lQ
	/XAvXN230aFKYSLYrzl3lFQx0uOUpz7XrcbadBN2arFsfwhhMpRnj6yTvn6zZmpi
	pjJbWSDPLpk8mpgmeV+Ba40vHJp46KD7X7DYCaZE+WfafAKWJHCoHCnbczbIbn75
	9XJLeLfuBEWyzsjr5jTiw0c/8KWrgrQzDnSmjxDk2ttCLqXKZJeyklv1h19GpYH+
	n7RV4DXkCASVfDJHx/qEPOEnOyuep3caZa9kvalKFKnfbLfxP+svstOfTTQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dey779jg6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 18:43:59 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b630753cc38so3640370a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 11:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775846638; x=1776451438; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=61VZ+Zf992lYtRYAJuSIdkeDIpmhb6h081Ez0jvr6hI=;
        b=XtjQdhYKPsXfpWrpuNIWC7Kr11cAkK1lPGlhRWP6y4m8j4qLHDmiS1/e5WSfDWgl4w
         smtBCQC/RgtDpMscKFzAOZefCrhvY5GFeZbFDye1tELgzpPYrir26MSjKwVzmyu+8kRV
         ec5+e7Hi6I9YnG6L1GN1/pr/kEb4d0SsnO9RCpFoc0He6A3daMKrRpjbNe9F6ltMsui7
         V3w65UtcRz2ZP1RRo00jpUqsRV2CO/DP89kyXP0ZVOt2CgayAy+WxWrjttWRqk+f3eV1
         +UfTKgnn35e2DzKd3OubQbxGm33+Znim14hAaUd8p8y3HX5MAmwprCcGXcoIAAa9k8lG
         52xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775846638; x=1776451438;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=61VZ+Zf992lYtRYAJuSIdkeDIpmhb6h081Ez0jvr6hI=;
        b=ArDQFV53ZYZogJNXIkFQCjByaryiiOO8luklidhGei5cLmUhaArb4yeBVYes5R2JGC
         7X6qhbDTycE7kAVo97p3Y1HZydPFm50k+2x7p9MEUabcKqULbzJU1RfwTQFwzMvKuT4C
         krhrXgokfhkcQ1x4LFVzqf+z9O7riLbZGKPpO6Ha6wMiLSG0lKfgz5dYzXW1Yj/jmojD
         /NN1W7Dob1A1TH/hmrnZSS+m4T0Nqp0v0TThGHzxpq2jGwsRn9mebo9bsJmGAFRGH+hx
         j2Hxapw2CzVHgTwxt4jvcKGEFEJbE3WZ7TaI+B9t2xT2PHSreq7/dfvp++SsQlEhn76S
         frwA==
X-Forwarded-Encrypted: i=1; AJvYcCV5pyZgRiwSC3omQuGPkOakFSZ6ooFHwtIzbZ+j4lTS4ZQydJBpJHDu5jG5lE3rkq6D8L32i1S20b1zw2+h@vger.kernel.org
X-Gm-Message-State: AOJu0YyXiGEJGa+sdYLWx1Ip6J6yMuSHX2CIwAXYZPTnd2lDAzdyZGA2
	WpNOzFY0CuaEO7PmCpL9EMPftHBENrPB6xO1/S699JeYe0y6KVes2nlQjGDi39qtYFuEpSpoKyT
	UA3pjtsk4fqd8auW/FkNarPB0JcC1p6C4nOT1OtCtVzrBoFObHqeNBbvIrFEuPUVuBGry
X-Gm-Gg: AeBDiesRcQ/nHg+TWItx+niIrE2e4hkPXwRiJ2dZgKmN/wk1CD6LyZ2ko61x0J/7FJm
	W458foknof85ZY1FD/2EMBbuGquQjQsBEFyOB3/hJGCUTmbvlFxtyGBp1xDHBtYB0QikjgcffjL
	XFe+UbWg/C4cdfQhnb4VkzdhKxfg55IVZXvn0M/+OPZZtRSSQeI+2hXhVNl2JpG8LQRv7yYKNUV
	dlm2uwgN4oy13joIVj8MaABmDs168G/xirLwH92jX+1WfUri9uKSl5yF0+Xc0c0i9NfzTahoxco
	pHUkg8p8k295iSY2r4H4K3OcqNhwUTzcpQWcLNygOCHvijgaLpUSDcb+5SYSHkUdCuTctYNLVmP
	Z4WP2HnZeiA162CeL4iYBZFGv7V/hld5EcZc6F9LpnLC7OjNR
X-Received: by 2002:a05:6a00:8d43:b0:82c:dfea:9e2c with SMTP id d2e1a72fcca58-82f0c1dab05mr2927412b3a.9.1775846637892;
        Fri, 10 Apr 2026 11:43:57 -0700 (PDT)
X-Received: by 2002:a05:6a00:8d43:b0:82c:dfea:9e2c with SMTP id d2e1a72fcca58-82f0c1dab05mr2927403b3a.9.1775846637334;
        Fri, 10 Apr 2026 11:43:57 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c32e744sm4036922b3a.13.2026.04.10.11.43.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 11:43:57 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 29/35] arm64: dts: qcom: kaanapali: Drop unused second PDC reg entry
Date: Sat, 11 Apr 2026 00:11:06 +0530
Message-ID: <20260410184124.1068210-30-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: rQffbA4WjatNJ0EOottgVCHM-_mBKh9r
X-Proofpoint-GUID: rQffbA4WjatNJ0EOottgVCHM-_mBKh9r
X-Authority-Analysis: v=2.4 cv=VN/tWdPX c=1 sm=1 tr=0 ts=69d944ef cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=kyxYCa5QF2EFglN99kMA:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDE3NCBTYWx0ZWRfX5t93s55M1yMe
 dwmzFVRPEqh75mMhIgxK3v7GG3SYGRpyoIIU2h0RBLBrfV5Szc7N0rKba5HrQaFr1ivMKfWdqNg
 RRjQ0n+wZGvVTEwbtZDxY9yyJpmSRN8Ui4Z9zVW6KmVV+hR3ibOuJMGuej6hQe7GFAF03y9y4dg
 UkKH0B9GiO/ksn/jisgAKL+y+Q5YKqN2VQayH5RYVhOYEdr+i8I4hZyHmkg7uTf/xFw04KTqkQ5
 LNj5DoVaKOmYxA2Uayv0G1Jg3WLeNoDKwb4Ce/qZylqwAWByAuKSichabTFtyj+uXyJlZvMEmL2
 PpseNGJRUbQ0NGJsVRN62U8d2siHVS8zRkcN2rZtnmtbi6/1mLp/yX8R9soPYXRycIudn6f/LTf
 EQmWAY6gXeYAAPRYf274wm2SwOt4+p1Gl7jKBYT0Zp77z816XqYFNXDzHVL3E1jgirsfQLkElyM
 ff6yuKd0H5TDNPJAoBg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_05,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100174
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102743-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,b220000:email,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0AC6A3DBBE3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The PDC driver only maps the first register region (APSS DRV) via
of_address_to_resource(node, 0, ...). The second reg entry was never
accessed by the driver and can be removed.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 9ef57ad0ca71..7cc4ff48b3f5 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -960,8 +960,7 @@ opp-202000000 {
 
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,kaanapali-pdc", "qcom,pdc";
-			reg = <0x0 0x0b220000 0x0 0x10000>,
-			      <0x0 0x179600f0 0x0 0xf4>;
+			reg = <0x0 0x0b220000 0x0 0x10000>;
 
 			qcom,pdc-ranges = <0 745 38>,
 					  <40 785 11>,
-- 
2.53.0


