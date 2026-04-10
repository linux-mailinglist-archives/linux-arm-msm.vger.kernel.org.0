Return-Path: <linux-arm-msm+bounces-102732-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UI1yLR5I2WlToAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102732-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 20:57:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B243DBB63
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 20:57:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3B94130D11DC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 18:44:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3ECA13E6396;
	Fri, 10 Apr 2026 18:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NVcW5yKm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ifoh2vFp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07F9F3E63AD
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 18:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775846597; cv=none; b=FnLUzRKmEPne3sKEYXVjqo4nay6tk/TK6Xc44ubersF6dC6A+wki1gg96o6jcm3yQy1z5iP2l1pH6wrkw7xIQPU5vLPRlKZ5coyGiq1WaHu0B68ofyOatSH0HmDzpod2Jx7nb/lKzr3csPr4MLbyLeLDeEmGtHmrqDIpD4VMQxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775846597; c=relaxed/simple;
	bh=VbQczkdg/Wq/Lm6s61vmfonnmuIDHZnjRJGkjeEEMpc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E7v1V/FFNmj+3EbakAQ/vAEvBhmo6dDy0BAbzjH1NcNxEyiEQ2UsGO+eSvnYTO5LpGrxS2eQtzELFJNvu14yRZILvR9bYWv3Q/cNHoVaXsYalJ7i5tRhu29VZhosi8WBiXoJEL1opuGkkYEkmhBcuONV9Uitxw1fRT+O28VDA1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NVcW5yKm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ifoh2vFp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63AH890d1498616
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 18:43:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=wCarvTqn27l
	EtNV+xySOSgEEb+W/JDGrb6R3dZR3COw=; b=NVcW5yKmmoVR0L6RBj151v8hTA9
	nI+iM+4ri3S1XRAhtswZ7N4+0a040da38cHpxmsNM8xsfjk0Clf/SeGst+E63thA
	TF0k2JTVZaw0Mk+h/hqaD0WfydDtynW/cODFbhJSQODkUmKvYA1tS5mMDl1YBDEe
	cM9dK5j24pui7PNERYTDQlhsEkn6ZQYmAnekzBtWQoZ3FlGf7BBlYsh000nTmdvt
	P3WDKAioqRzF2CGQkte+TnbXnkakhTIQNp/+SiWCh3ro/7SpJ9v8Z1g/TnQtdF7i
	8VMap0LZ3mQvqxIw1NqtRt68l+WSViQ7Tj5cEASuF3XbdNqrEs80MIThqHg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dey5b1hjm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 18:43:15 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82a88a2704fso1116248b3a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 11:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775846595; x=1776451395; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wCarvTqn27lEtNV+xySOSgEEb+W/JDGrb6R3dZR3COw=;
        b=ifoh2vFpXnXYY+H1kgwgXT+gl/OXN0S9ub9N0i9uJnrQABuuSTxxAPO9nJaxB4ppO1
         IEegOraUa9bpFzYo3Zr6XogE0aVONWugj7+4x62hdp1k69/It3E+hfK2H48nzr1tiEA3
         IXwDmgSwHPcEKL2Va6gsw7nw7/lhtRzgZXVJSzjHaKFY93d9OkzECR4YnWn2wIeK0wEj
         5x7d+b7gK8w4XNz+E0wXQU8pP6zAr2ZygL6zixoJ1Yur67UDj0H30usz6osAv7ItATHy
         1sdovREjZj5YjE3xvcn5NIue91vlVcDIKRrqTtCPYvIcWXR25WzMhA5OqRozjc9VM0jU
         G4UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775846595; x=1776451395;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wCarvTqn27lEtNV+xySOSgEEb+W/JDGrb6R3dZR3COw=;
        b=Nh50y/UmV3z3kIZmsle5cYKJNRgLxaUmRNBZ4/40F9yd449UWsL5JcyriZKe6UZ4Bc
         6X73IJWXukuXnUm+URQPMrh1aLCiorMbhndJydcSCT+66ugl6r3UmYeRKdii3KFxj97q
         L3lnA/LNn7Tui0BHRpZ2yg7uFZCrSFx6fqUaqZTtuv3cSmVhNn26zX4mdYTW6fPLnCNJ
         1Lhyn7zDlOBcIXsu54njtZQgVXA8fRbGGAnbOI6r8kmBLNVUo6gp1f9w3s6PbpGCkr/8
         XuzMt500pIINKFm26o9uaSffgIE6bnX+TFxBXG80aWET0Wfig+fe5n7pOziw+m+KBxdI
         mWHw==
X-Forwarded-Encrypted: i=1; AJvYcCVy1NvTKIj0yzhkLiDtSRlbdy07nItq2F52QbTa17KGP1xaqfWj0vARpq1OhjXkbKoEQ1elly6HJ3jg5ApE@vger.kernel.org
X-Gm-Message-State: AOJu0YzD9nkp14n9G3PHXLZWyrQ78UyFywaCNcLhtt+h1xod9qbgexw7
	DHopVSOpJY8cvoJBkP5yXCwOT7P1S/kQdAI6MUfBQuWgScprBtXADHBFae8T90k7kIN8oOtW+UR
	sWfn6X4JT2woAfbNdauRUu2nsaDXBakVas4moojIu3wxCGWsVCOXwm+pKYT09gJZwXPoR
X-Gm-Gg: AeBDiesxw7f9wJFBPcc3YPt331gKKSXhYxldvALo6IWex9J3JpqG/viYPOEHFL9b2RK
	cIX1gsnp11jZ7fBVJhTxkRmfZZOsqw6jsFABVu+BsUamuGzxvAHel/Ccci67CIo1/tGRrAp+UoD
	XxswjpUMIMsBnXDzKBXxw5CmL2zvOqHhrjCkHISjzNZ/lt4/Xdrnfm8aXnJuDCYKhFFeH8U9FhA
	02QpK8o3V80Jtuz63NLUK9Gk7+hoqkRHGFZAIYSUZZMCjTefm72N5bbQ3FI5+hxx9WoXQoWCe4h
	nt/FWIdtu8X/TVwPhPAHPVkwhrHfBRp8isLIMpPTAbvv5Wf/gPmuk/ynP0uNwwjCh4hWAT1OfcW
	KBP28u5dntnsPu7WZfEK8PECusmHGhcOQCgB+IcOdpSjHiqIn
X-Received: by 2002:a05:6a00:a802:b0:823:1444:7873 with SMTP id d2e1a72fcca58-82dd8b7de49mr7714445b3a.32.1775846594648;
        Fri, 10 Apr 2026 11:43:14 -0700 (PDT)
X-Received: by 2002:a05:6a00:a802:b0:823:1444:7873 with SMTP id d2e1a72fcca58-82dd8b7de49mr7714418b3a.32.1775846594104;
        Fri, 10 Apr 2026 11:43:14 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c32e744sm4036922b3a.13.2026.04.10.11.43.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 11:43:13 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 18/35] arm64: dts: qcom: sm8650: Fix PDC reg size to single APSS DRV region
Date: Sat, 11 Apr 2026 00:10:55 +0530
Message-ID: <20260410184124.1068210-19-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: 3hC6SYoj2Pc4H-uF3ymu_S6RHi-Aihq8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDE3NCBTYWx0ZWRfX+039GDxHfq1j
 OAhm1RYzMvR/dtQFIJ2zJ+aAoMpu89j9lyzn45qOINzK9dxAbS4DRuW7h5t4ejiGZ9yQWjrCOb3
 wqOJIplQF0nL+jCAjFxDA0caMXnbeWtQV6VxEgMPz+iWw99M0Av9Gpnj1cQMOorVQm2MRWp33/t
 WznuimIfrynPkAvMXuOi8S5q0kTwrTYA4+/ex2h5KvbF726xqb+7s3b4yASOHt5szAJA/erVhx9
 aRElUqgJ4DpaBeOmgVmkXmamkyQG52W9xEuJ4o6TjMWYrDyNvCsImnFgpZXUvp6s4cEf8KO1sh/
 ubkBDeNV+/my9RFF0EI3OUQw9m0i21iiwPBKnW2HGbQU1hLyr8BH6i2vSpcAErP41pNmpDK+buW
 0ljETomDHPXxpo0PmoawY1CFVI45+SlQvngvANJkRv9yWT+gG9olaACms9oNR4Dpqqg2ivs6/8Z
 cafjSZuPVBzUiFjq38A==
X-Proofpoint-GUID: 3hC6SYoj2Pc4H-uF3ymu_S6RHi-Aihq8
X-Authority-Analysis: v=2.4 cv=VsgTxe2n c=1 sm=1 tr=0 ts=69d944c3 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=oy73fdSuVNde8ymsYewA:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_05,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 adultscore=0 spamscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604100174
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
	TAGGED_FROM(0.00)[bounces-102732-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 11B243DBB63
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The PDC reg size was 0x30000, covering three DRV regions. Linux only
needs the APSS DRV region which is a single 0x10000 window. Reduce
the size to 0x10000 to describe only the region actually used.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 357e43b90740..349e19b429f2 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -5987,7 +5987,7 @@ dispcc: clock-controller@af00000 {
 
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,sm8650-pdc", "qcom,pdc";
-			reg = <0 0x0b220000 0 0x30000>, <0 0x174000f0 0 0x64>;
+			reg = <0 0x0b220000 0 0x10000>, <0 0x174000f0 0 0x64>;
 
 			interrupt-parent = <&intc>;
 
-- 
2.53.0


