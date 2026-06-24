Return-Path: <linux-arm-msm+bounces-114402-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jgo9JIIsPGrCkwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114402-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 21:14:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 006A66C0EF0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 21:14:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=bF+SPQ2C;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=W17gggOB;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114402-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114402-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 23435311CB03
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 19:09:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99CE6363C61;
	Wed, 24 Jun 2026 19:09:50 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F3F6353EC0
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 19:09:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782328190; cv=none; b=DelwsGG3yxqa8gg0EcVAbyZnWdvOuQyniqolNBEWD1ZgG0ND1ZiAs+pOx+DU6OcjKYrm6IzzVLEZfD+2wOXGRaFH1J50xYyNCTxzT5FwqUxGs5YFU514s+Jx+rl9K5M55ZpIq+6J5H0vdi0hdmQi3KkCXYhm1neLHPy05vxkQE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782328190; c=relaxed/simple;
	bh=pZjAai6dEQC3bvSotCI7iAkjjujhp7ETnZsAk9bKWHQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dkJKaM54QRQEJLieefcSduxmixgRg+d1Lz1V6DCi/LxjCQeOOlPkqxZXbUT2Y6f3CX3HHnksx8ksFhJ03dMHGy3GdgS1GUVzH27lWCRkFdAaUz160wWXsFQsr+Lw5JxN8yhq/ZWJUbWvcZiDjm/rcouv5y2X5V3yEG00DtwpawY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bF+SPQ2C; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W17gggOB; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OHj3Bf2137605
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 19:09:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=uDR+9U1ts+c
	QizNgycSotwpO/qHrSVlMysFDU7FIE3I=; b=bF+SPQ2CcIzedhl2DJTfSCdZhfQ
	KFeffNU1ZFF4YFS2s0vo3AMcew9KO4gtrpJL9iiKMHTlTW+81p6GQk3bEUt4C0V6
	+Q9xylCGMWLtl11Oo5XGKDg+eHF185ERgVo7KlvbWwzQS+qQNA0aAayjzDaCS3LT
	eTUXsRo9KbE31uJBloixT5bgbkwkkrAFBXJlBEWnYcXksWyEFfzQVBBrlJ/u24/O
	+YYSJ5upoV5qrbd2c2wjk9QMo0DB45uiHvCQpr1xbtZ2VHOMiWjuSsjFtTY4uNbS
	1KRPhUQRZ/PCVsG8JAEqw7Da8Mht4TCIVOagoIpAhg6s87O/BhL4DBPATFw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f06r33n52-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 19:09:48 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-845438fbd9cso1382812b3a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 12:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782328187; x=1782932987; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uDR+9U1ts+cQizNgycSotwpO/qHrSVlMysFDU7FIE3I=;
        b=W17gggOBxRk6N2AbblqHafdQWg8dhQ200eEDb9WS8G2Usik0YkKooGUkGkWhsMTwii
         3IyqYatkiNQxwXekvGWlhW3QCq4MAQ30AbMsJ0KGa2GdxeVd6ghQHUxEtv3guH3KqPcE
         sO8UZVvYqM7k4wvTjKpReWRscZ0vPVvdj5kpEmJzuW04hHTZ5kG3Xv55/khWcxlaUdAJ
         KuwtSjkRZWlZqOqucCquJrFvsr/LngfiBJIUzXRJKcAby27D/kFNck0uVMwdWJvmqqmL
         I+E7ftARjrRGI8+OOCHi3QnQG2r0wpk2xfO6t3pw0sPbmb+MmURa0qd4y+CFD0fOxgEX
         NAmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782328187; x=1782932987;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uDR+9U1ts+cQizNgycSotwpO/qHrSVlMysFDU7FIE3I=;
        b=ZtkbHx9+q0+YlVMq8gklIl2iaECikl2VJ3x/W9i+7Ciat5VA4eOQGdGYeLJebc9Kl+
         qMbsVbIg9PBPmxGzQabyZiZbsgU/wn1WyxutXfHQnQVJSpWP+7I3eIySQSps302+VMsn
         WLHuiKWkTZ2v5IYP4PrdO9XqI8NOia0/pfwVa4JiN0aC/q0m8mzNF1X1XQvmnGBWw2WA
         I6Rsz6ndbl5hIILsvY08fmVwAfhpzBtouWhsRvJLCvSttOYWP8EqQq51TZzFe6a5HD58
         0woJGvRONOMC5nm/Zr0rm+YM1S4tf/B1r3oBPu10jfjJro9dbO30DWhh9P2r/Z1RZs98
         wq8g==
X-Forwarded-Encrypted: i=1; AHgh+RrRxfcgbM2iWS9QJUwliVCarJFHkCu4/k34ImWe0srZAduvSFH/Lgz9MZQY6xLWq6OhSVnOsmDFrQoAZ6cJ@vger.kernel.org
X-Gm-Message-State: AOJu0YxEG+4E/GFCJvwK68AQwJva5Y8K6DYd6SMAyDwyeB7NThrWp1mp
	SahUy29rzdcZWeUyJCiw5p1FyG8YSEQ5YWPypzdAqKXE2DNlyWS3qagzwGDp8FS3UmyYE5oJLnT
	UcCIoIERhMyfGhlkm377mTsrjhfmYKgdvayWPzaKHWdgZWQQyN4/MWbAdakEDw5FF4jOi
X-Gm-Gg: AfdE7cmbYIVQFZlNn/MsaRgtYyAtw40Y0kLnUlDs5RJYaBIfvRJRRyrBY4aWEsCi/r7
	l9+PenMjbJIWNF2oXbcMW/+4ziJn5L/xFqMHwXoXlSU91XrR/WSecBaIo62sPzvm0VIQ8iHoqNA
	2V9TReunqpK4kom3fKUw/popS8zFxNeGVFoJD1jjIYXp13qj7ZA6ijB5eZtuWsrf+TS1qMV0k2m
	EqLJzUs6OnWw2QJueaj+hN6klBVyJY+6XCOZGz2eaV3iq1+MCD9Kv0UsUD3I2zmPsFr5XP5L2Uq
	XRnqbhPaROwL/DG55cOzD1BHSJl6zJNs60ifZg1RJnOcT0WChujREDG1z8lRQTRX0YdM2+ScRgL
	//4QeerE/ChFof6bzgbaxTXCCn5dAzPafuZzzgQ==
X-Received: by 2002:a05:6a00:140d:b0:82d:62ed:b01d with SMTP id d2e1a72fcca58-845a2ca4fd0mr5532329b3a.45.1782328187325;
        Wed, 24 Jun 2026 12:09:47 -0700 (PDT)
X-Received: by 2002:a05:6a00:140d:b0:82d:62ed:b01d with SMTP id d2e1a72fcca58-845a2ca4fd0mr5532299b3a.45.1782328186739;
        Wed, 24 Jun 2026 12:09:46 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a412e5e9sm2932120b3a.54.2026.06.24.12.09.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 12:09:46 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v4 16/19] arm64: dts: qcom: sm6350: Add minidump SRAM config to SCM node
Date: Thu, 25 Jun 2026 00:38:27 +0530
Message-ID: <20260624190830.3131112-17-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260624190830.3131112-1-mukesh.ojha@oss.qualcomm.com>
References: <20260624190830.3131112-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDE2MCBTYWx0ZWRfX0Bu9GQP8CAI7
 HD9wDjCCZ6Nsvx6wckFALnhpxOiYAozjmDyltWLbGl92eXG0QW3E36DshbLSySsomsjvj6+o8gp
 eIGhZ71vWiwBGjjaBk3e0LY0LhtuaS5G5YOozR9ijy7f9sA1Nrs64Tojg+GHoPKsqIY5Oz6nc7Z
 pOM2aNll0El4KRd8XxrBcOTh0FId9IB9dcy86WdjP4DJ7ZMmAzCKrloaSMNzrg/1MMy10D5IS1I
 q+KlvdpUcGE7//ohaO93USf53sHbF4RJ3bE0mJrp/G/KtCOQUKISlv/PUIgBFX5/718u8fJupfN
 5bjiSLZO3c+c/jAIGzzTVmjPSDS88G7wlhTNcruQaGW5Dbds0EZOmThux+mCSz06QSfjkJnY5xQ
 LNDL3SHfjHGQM0BD71N5af6Tfo82uQ==
X-Proofpoint-ORIG-GUID: C8Qu2zxbD-bPc7z9hYA54SqCtJEJTyBB
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDE2MCBTYWx0ZWRfX8cHrrYlKJ0Rp
 EwcPmx6tqO7tRZgMGJKMcdMCMmfZnybjoSZZy8CMxEVBJw0fLRheuXE4cjq1pAj55YLFoFXQRtE
 LL+H9/uq0V984NghxT0OVoqq5MNgkI0=
X-Authority-Analysis: v=2.4 cv=ZM7nX37b c=1 sm=1 tr=0 ts=6a3c2b7c cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=uif5S2Ty6xZypC2F6NQA:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: C8Qu2zxbD-bPc7z9hYA54SqCtJEJTyBB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_03,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 spamscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2606240160
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-114402-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,gurudas.dev];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:robimarko@gmail.com,m:linux@gurudas.dev,m:cros-qcom-dts-watchers@chromium.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mukesh.ojha@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 006A66C0EF0

Point the SCM node at the minidump config slot in the always-on SRAM.
Boot firmware reads this word before DDR is initialised on a warm reset
to decide where to deliver the minidump.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm6350.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
index d6adf68563cb..06892ba22875 100644
--- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
@@ -363,6 +363,7 @@ big_cpu_sleep_1: cpu-sleep-1-1 {
 	firmware {
 		scm: scm {
 			compatible = "qcom,scm-sm6350", "qcom,scm";
+			sram = <&minidump_config>;
 			#reset-cells = <1>;
 		};
 	};
@@ -2808,6 +2809,10 @@ sram@14680000 {
 
 			ranges = <0 0 0x14680000 0x2e000>;
 
+			minidump_config: minidump-sram@1c {
+				reg = <0x1c 0x4>;
+			};
+
 			ipa_modem_tables: modem-tables@28000 {
 				reg = <0x28000 0x2000>;
 			};
-- 
2.53.0


