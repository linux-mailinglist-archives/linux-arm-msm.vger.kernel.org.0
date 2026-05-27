Return-Path: <linux-arm-msm+bounces-109976-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sEHRCiO+FmqPqgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109976-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 11:49:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BB3755E2195
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 11:49:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 77E5D3006B41
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 09:46:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97C573F20EF;
	Wed, 27 May 2026 09:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="baETDlz6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IbP+mcHr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33EBD3EF0D3
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 09:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779875113; cv=none; b=a1EaJ4t5YZxlH04K5R8AuOlFWu+Q1M4flrcoFIwNgDlY+gTzAySHllQfQs8vsenEjoBE5xfKhsze9BfgH6ITR0A+w4tDXZ5+M5rjT+quwRtDvYys3+GUauyMYRupxKB54jxFNRVnZJOyadWwOLQ5GzNzPBQVAxhTLwmQnVr149g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779875113; c=relaxed/simple;
	bh=Z5KLOcuo+O04wmv8KxzSxi6rZaz1FTu2qWuFBQvSiQs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DQQdEJC68r7NZKaW+LWnkozyjg1UhskhtC/YWLhey+cmO003Ma1BjbEhfujjYmTQEBuAEmy7qernUoi+/YtLzBAIJFoYb6HpquTveHf5hJ8oXXQl2fH3+t1V5HHj2uyT9Z03632d2k7QPbR0Ul+8Of/867kYKQ4gwAJFjyFqfqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=baETDlz6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IbP+mcHr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64R8misT051715
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 09:45:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=P0HxTS2O/NQ
	Q0vt6rMiUS7KU2iSEK8Prggkzl9xE1rk=; b=baETDlz69ltYeCf88Ue9Yu7+EoF
	/wJYxCjnuR/OGjp6wlaRNozb8fmYigztrzBsinmBFot0l3B6pzn3uk9ObsTESZ6g
	Escr1zCSAxKYXvUAh8LsEVxzdZHVAC/svMP2qSi/iJSnDIBb8f5cRhWsR0keXX9R
	GTAn2wMU3kzhE4ZlCKhTbIQig5P/xrDX3b2XEn1LpkNOd248MtdLD79ziqwtKUf0
	9uruI4sde6ta+xtgiYFVAZai0O7xH78CF43nVccIPpykB/EqcEWBfSfKJ40h43xT
	NFWRmLrNOfXkE11IOnl2Fs+JJY8Zx4aTa0vy5GzseK499kOe1sS4V6VTJzA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edg5paxh9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 09:45:11 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b4678c6171so127521105ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 02:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779875110; x=1780479910; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P0HxTS2O/NQQ0vt6rMiUS7KU2iSEK8Prggkzl9xE1rk=;
        b=IbP+mcHrAEvOWWXbqEJI9FjSIhIam5S3bIU6SJMSQR1VCPk+vgsD4HN1ej4vMnQHGZ
         DEGO+qFwdr+tbcIFYIbbgZMg2wBcqEKw6bAWPSz7eXuDTwcNtpePClZM9pkLcTI4rS5E
         nrddGF/Uy64Fp0FdXM9bWqSHPhL0V2ccMfIFdSMpERe2MlLpc9K9meLqqog9tf4Xl2Rw
         mSOmhzj33k7EDPcBpIlm4OGRMu1n2Pu+aEyHY1ee/ajnzsuFstq5xybZJSFgaOwJoGSy
         bD9ZOx7vvNYmMuzPlfL/vBojYT9ix5pZ85vgR3fXzSCq4XoTZ1epKr2XfV9MgRRQFwqw
         hFhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779875110; x=1780479910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=P0HxTS2O/NQQ0vt6rMiUS7KU2iSEK8Prggkzl9xE1rk=;
        b=mFpc9LH4Fr6EtE9yppZsKR1g1ujeytkLdckW5SqIrgGo9Be4XrCm0E8Gbi6HZXm9Kj
         HqXJs+FL/IMdxSMQSsGthQz9EpA0/cEZRz7em5jectixSjYQWvb2noJ9kzQmbv2lJmfj
         I8PhxCC4iMWYOhvopdz9CF7wsAKvRJm6wjq+SZCDkIpZtuIjabaXPtc39PMOaIipCjl9
         BeYvzMzgxCztAa0EA+eHBTIN7T0U8RjSY9R0i5Eyo/7iopUwnY4Hmj8GTth2sBWSfFFz
         hhjxbfo9wVhe16EgL/2/279Dx5mUdOVIYxYcqCZkVO4Wj1TYaU+i1fsPiA1IYpwZoXmQ
         mDOw==
X-Forwarded-Encrypted: i=1; AFNElJ+3DPQX2rDzX99OBWZ53Z4XwWxrHHQPrcUj1+RFvuASzGOwwj6LURBUToZiZXBgQuimjkVNLvDC/gnzpZZ5@vger.kernel.org
X-Gm-Message-State: AOJu0YwnPF2B1AMcDlpi3LjNbxR3BCSdMcOJ/VT1Gohre71HWCW0+Gx2
	W7burCpE/tYMEiZezFmIrvSHwJjOiZhiXC1TV3pNX5EaqG5tFyBxJ8xwKmIyyP6f+Y00xStQXBz
	7OsZ9d74/VSm/sL4JKp5hO0C9FatD1IFxZMVPs8LTLaEXjfKU8nC7XNkwZbmLcTlUcnII
X-Gm-Gg: Acq92OEtpPBYOePyVIZ6xmNhx4FyO9NdJFDCXzlElNKlTJeSe/ehFFGYTAhtyuHUyxw
	ORMDIZhmpexwXZ1K/ImZ3/rDQIsjhT2ozDbtIqK6zyDA1jJ4vNuBR28/tlb2V0j5REnMo4kRqw7
	XRI5S8TAkFVjej4FcWCLggoJl/S/61PZjNNaDKQLaR9A+dRzXVsh/r0LNrXZoBz/f2qzqB/6ko6
	74P0o2oarXaZhR7vkwwjwMXeR8ndfshfUcw/0vdthF+bRvmKeQRMkjpGpcPEJJ0wGD2CwRGp/8/
	YlrVa1SI9uGYYOyI/NXCsjcbePWZYZ2zPU9Z4TitqjhdwqtdbDXuHk/VYqPS8nku/X+7uX5nUfG
	pgppUDpUqEnAYf7p/QeBhW73YfBspwNxppfuPll8pe+stoAmcfB3QPHmMqmI=
X-Received: by 2002:a17:903:3c6c:b0:2ba:6bd7:8f00 with SMTP id d9443c01a7336-2beb06e9eecmr241630175ad.5.1779875110460;
        Wed, 27 May 2026 02:45:10 -0700 (PDT)
X-Received: by 2002:a17:903:3c6c:b0:2ba:6bd7:8f00 with SMTP id d9443c01a7336-2beb06e9eecmr241629715ad.5.1779875109924;
        Wed, 27 May 2026 02:45:09 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58b386esm154738185ad.44.2026.05.27.02.45.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 02:45:09 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 22/24] arm64: dts: qcom: milos: Reduce OS PDC DRV span to 0x10000
Date: Wed, 27 May 2026 15:13:27 +0530
Message-ID: <20260527094333.2311731-23-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260527094333.2311731-1-mukesh.ojha@oss.qualcomm.com>
References: <20260527094333.2311731-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: bgr6ybdtCXUIvSBrDUJ-e75ZXD1_Uqu5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDA5MyBTYWx0ZWRfX1f1kI7wnNi6e
 Sji1rgMthdF9ZGMUrJL/tI2EXD9hzumvucmXcU/NK2GcSm8EdD9097PqfA9NQmzqsir4bi/QbbK
 +aVIsHcVTTCkJFMzZxTnjuY82pr8tlNZx3UOhHX3LZSc4HOLp2IGgFpx5QQuzKF0RbB19saWjA5
 uHJcMeTIykgt4RktK8DYXZOiVUERpn1jb9wNOU6CZyYycfVExp90jbKZTAfmUu7/oyCDZWtHgOJ
 b4caGK5IiWoV2iVhG1SArokpjTXuwpHyYzl5pWQhQp45Uv+uiA8g+H6cJBM5jxkfLoNGsV92CTE
 I3/SMw0xAV0Cq/HrzU4cEz+qM3IW68tVqvA067pesYe296Z/TfCKhuZD7y/NcAKlZ+KAcV47HsW
 ytoFTRn16nQ/q0Qmtnwm4q44wxfjz6TGgVGY2Iad+XdvRz+rjY+IZknus+vN5bxWYzr9a2iBsXM
 jqgqNxXezGGF4YRnnnA==
X-Authority-Analysis: v=2.4 cv=I95Vgtgg c=1 sm=1 tr=0 ts=6a16bd27 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=n_GZHfCU-2Mwq8LGfpIA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: bgr6ybdtCXUIvSBrDUJ-e75ZXD1_Uqu5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_01,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605270093
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109976-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[af00000:email,b220000:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-0.996];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BB3755E2195
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The OS PDC DRV register window on milos spans 0x10000 bytes. Reduce
the size of the first reg entry from 0x30000 to 0x10000.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/milos.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qcom/milos.dtsi
index f09b30ea96ee..4e5cd0f29ec9 100644
--- a/arch/arm64/boot/dts/qcom/milos.dtsi
+++ b/arch/arm64/boot/dts/qcom/milos.dtsi
@@ -1980,7 +1980,7 @@ dispcc: clock-controller@af00000 {
 
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,milos-pdc", "qcom,pdc";
-			reg = <0x0 0x0b220000 0x0 0x30000>,
+			reg = <0x0 0x0b220000 0x0 0x10000>,
 			      <0x0 0x174000f0 0x0 0x64>;
 			interrupt-parent = <&intc>;
 
-- 
2.53.0


