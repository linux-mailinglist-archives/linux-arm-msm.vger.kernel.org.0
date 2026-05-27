Return-Path: <linux-arm-msm+bounces-109973-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aHCLLd+9FmqPqgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109973-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 11:48:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B5EA5E2105
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 11:48:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7592A302FA6F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 09:46:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 488DF3EE1E4;
	Wed, 27 May 2026 09:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hTgc+9m6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i0br3CPR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFD353F0AAC
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 09:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779875101; cv=none; b=jkVsOjr/FHQ8c64W96i4f0leepz2t/74N0f6CxF3UzP654lw1E7bMrIh0S4HE//0LVy2aKuEZAP0Jhs2opGVmOjatSckQlmQhP84jCG4jkGrtX4zGNvil9Z4XrPscWjS1RqC0VyqOWon2wYwndvTbuRfmeOJySrZd/Pw/vp8FIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779875101; c=relaxed/simple;
	bh=paZ1VgKY/PWrYrl9OfLF0AXbdlU0uMS6CSshSEaH8jU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jOh01LabFUdBlIhwp344ETRdJ4+1Td22a+lRsLXCArncZLzLo5Px2GBcXe/NtUlAMHUCaopiFMZnPNTMmPp5vDmKBWgo1r+c8ikUrMNCnRw51NgMzAyE+5TWFBJDst0y78wvXZza2mZbYOzvtfgJ2yc7I/PdEZEz0WVXPpAPYvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hTgc+9m6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i0br3CPR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64R8me9U2152942
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 09:44:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Sb6PvNVK9vN
	wLF68HWvMgWbl824kGzgEkn7lQUwIrGw=; b=hTgc+9m6IIdfEEnwfsstw+BGK6A
	7HHCV0pqjVD1F4esVuXma3cNa/9FaiUDPc5pexzP0HvfQpvfUarDtauA1Tz7+eML
	682facLQ41aysQlUQPgb4fBjwb/dtODaPGl+Eq5R3X7pAyJhXTOqWNtd9mqDgwYU
	zHUpNZCawVORd4l3SlLm39uLKWfs4akNxbDAyhkpjH50yfBU6CVA8Tk/I5Ekch3m
	u/1eRTghpxBgKUPDEAM0kekJDd4a3efXaAewkpOIlaEKe2iu2X2+wLOyQuJn282B
	G5Y826LFuBx1FjyO5aYscJ43k2FtBQTolgIP1kqbbGO//UlZQvIy/rwiylA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edu6rgt98-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 09:44:59 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b2ecc96a9aso130009565ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 02:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779875099; x=1780479899; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sb6PvNVK9vNwLF68HWvMgWbl824kGzgEkn7lQUwIrGw=;
        b=i0br3CPRLxRv9dBSrlnmysX2YKVKAINIWFZNc+wk4srPcB6yN95A+l0A3DdBR0vEjg
         leC+RF9yUvMl8dIs/YhzI+fucGJ3U9pluiMIrdZt3kFGgMHhftKBYRiwNq88LjrD5YCf
         8IFCqy0RxgWN/d+jkXdrdS/I1C3JXRtpLI/LZ4NuskSBu3TLIP79wBkpiwoYTuMaa8Js
         t9spNflV5FdDVFaj8k35C5SprVjJqCwlRvFvWIyIkCmEG25KPrhhWWW/0BRPhzV61VJK
         0nRsUcOUudO0AGlvOja8s73rhj24NLenTN9o0nsUnAZe6S93v8uZbSP6jBeOBbM3Jc4S
         dNaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779875099; x=1780479899;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Sb6PvNVK9vNwLF68HWvMgWbl824kGzgEkn7lQUwIrGw=;
        b=bEmWQYxTs0/R9xBvTlfP9fJHTTeWwbcs0hY+/aak7fHwBcHLu7l2frbOPuEml6KbdG
         oKlbY7KLhDq9APErs688g9zuoeLv393KCZAdYl28flJSjNkgok6HzhagIddfhM3CUgBN
         pa+dbwDLD622hU/m3sYnEExb0I6vOjuc+UpiMx38UZLhJKgh6N7hul6MYpeDK6UOROAb
         XVS4SaRKd5Vq5JCQ3afsy0USJqLxxkEmLVYl7SJaDEEVVVqJcqI3/wIk7K7qMNoMCD7B
         t69TFbKbGMaBNfJ/UXHBgxzAjClSxDNw8JEZYCcD1z29VEYzbEOo2vt/emX4tnT+2Dn8
         eDEA==
X-Forwarded-Encrypted: i=1; AFNElJ9v66QjAzzFygNVpfUaRDMZFvzha/GbwkuCFjVrVidpVBzxrTgl5eGQMv2KklGzJ/NBf4SxkFhktMWZO1Ac@vger.kernel.org
X-Gm-Message-State: AOJu0YydnPZvPVFBRH5GGKO6MUvbg+ZP0vWEjdn7nbXc2koenYa6VTSN
	AN+PdxpsiEfR9EfAZNe1z15AcF/xpZpI8686IEXN73jSwi3UBUYpR6odJAGNIkci858wc6IRhXp
	0c7ZjH/QrfYIn5xsZ7CuR/C6EmhGHzVrXfO2A4uZB8R7b+OfGntAIv65+fduFSB8vbrbm
X-Gm-Gg: Acq92OGu++ytrCK9U8Osdm8UhDcHcczwEmpQ+5sOuQzK5wfZlN3cTUXihZMYGTfaQZL
	T5hDr6EPy4pvhfuCfHi6eiLkpoT/M1AfTbeqj1bTKTxEOSsZcIDAwmNGp1JgceY27GDgTXqaV5C
	TYKPJ4yr8RswzBY+YjTYmdNhPsRMhlW2rI6f6tYmie24I2bHzM7+i9SXHjRgz/18PYbeuN0lw8D
	gkQDqntCVSOPs9G0q2mVHo+w5Oy0hB4IISRrPH516yfVkkJTiBKvckli+HMfYKgjAIkPbReH9JA
	pvPexYWve4dKXLzznaV+Yvd70AhuKJEUIAnFhZ+teUzV+obIzoDqIg/1e8Dzvnvoy6SZRXMQsqM
	Kki9AteuUo4gSWoShnfxJLhkg7NRIbLDP4r2w6fQSV7ZWA7at
X-Received: by 2002:a17:902:fc4d:b0:2b2:5314:e96a with SMTP id d9443c01a7336-2beb07b5d46mr241734195ad.34.1779875098552;
        Wed, 27 May 2026 02:44:58 -0700 (PDT)
X-Received: by 2002:a17:902:fc4d:b0:2b2:5314:e96a with SMTP id d9443c01a7336-2beb07b5d46mr241733965ad.34.1779875098021;
        Wed, 27 May 2026 02:44:58 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58b386esm154738185ad.44.2026.05.27.02.44.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 02:44:57 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 19/24] arm64: dts: qcom: monaco: Reduce OS PDC DRV span to 0x10000
Date: Wed, 27 May 2026 15:13:24 +0530
Message-ID: <20260527094333.2311731-20-mukesh.ojha@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=MoJiLWae c=1 sm=1 tr=0 ts=6a16bd1b cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=zdDIsRo0uCqYaFkay3AA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDA5MyBTYWx0ZWRfX+QaCXK3lFI2v
 axlNJ6GkigyNdttpU1CGwf5E0b6r+nLkNDZ5hbrRxH+l6oeoNAAErq2qK8uJTjkLvAxsY3C2vD6
 TeEd1WeHbEWhETdVl4V8BzS36mLtH/ZGVcjs1NI3sq+jNNa67mOfpOvlccIMYMyDTynDGD8/1g9
 4xy64V+RMKhnbIVM1E7mXWQ+UNQQO7ea+wAGwgwcM4j7QB3BsItnf7oIqo/XfedfzDAmn09xn95
 8xp3UP7LD5yJtQHr1Lm1FQIWUkfCT6XlVqzWGGwLCqmr7WtDSsugibYoGUCKjAJNlDOyobvvGk/
 SRL/HEm6Jf+CaHBvOMa4jrpzW4YZpTPimn6YXHgqDCJTfsVs7WjQu3/D8azjr2K9i0dGDFmD+2A
 ITbdSY9SGvUq7WaQlMI9yNtUamVG/NpnB0GEvbE3toPt+/HMWyKRBob65ukw/5tPzYYyq8KH++I
 qlaIXBr8PtPpvKd2txA==
X-Proofpoint-GUID: xYe4f9jx8UPFlJYwzLEnFrE-1EPcttBI
X-Proofpoint-ORIG-GUID: xYe4f9jx8UPFlJYwzLEnFrE-1EPcttBI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_01,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 clxscore=1015 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605270093
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109973-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,af00000:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,b220000:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-0.996];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6B5EA5E2105
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The OS PDC DRV register window on monaco spans 0x10000 bytes. Reduce
the size of the first reg entry from 0x30000 to 0x10000.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 7b1d57460f1e..62903daa9cf2 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -6073,7 +6073,7 @@ dispcc: clock-controller@af00000 {
 
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,qcs8300-pdc", "qcom,pdc";
-			reg = <0x0 0xb220000 0x0 0x30000>,
+			reg = <0x0 0xb220000 0x0 0x10000>,
 			      <0x0 0x17c000f0 0x0 0x64>;
 			interrupt-parent = <&intc>;
 			#interrupt-cells = <2>;
-- 
2.53.0


