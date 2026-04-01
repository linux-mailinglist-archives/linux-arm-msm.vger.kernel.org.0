Return-Path: <linux-arm-msm+bounces-101251-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8CNzCrHNzGlFWwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101251-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 09:48:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id DD346376418
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 09:47:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 80931303E7AB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 07:34:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD97C385503;
	Wed,  1 Apr 2026 07:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mtRX4OVu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kO8n27cY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F8E337F75A
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Apr 2026 07:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775028838; cv=none; b=uvkoYDQNAo0rKHChx9DCuUiy2tRdmUV0gqVqmVcgSs0wWeXtxYEqUob45k62DDzq6iaBCtIJGWRjAzFNyDFb3H/UV2n1YcMYuUU0rdxWqyrF62zXTpwJjYUNlIz2yyYlw0vdSNuneIxeaRw7ULla8SEgATrkdUYZOZJxlWw0rQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775028838; c=relaxed/simple;
	bh=iK65w0LjaTQtPQfrKLmgekAJIlm/JBXiAcjmKb5JoP8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=hnWH06loYf8iHMk0XG5RJO4PZsP350k34hkRULGJFn9hUrBvXjUy94XLGaY37kuVQXSzkYM/BD6hMWx1OjIWVb83R9VWi9h0IeMogzMTIglGQ7fozykHa1PcPlqlkPlfBAHA4dgAwqB80hr4vbab5HqUqIAsNnRphAeZLqvUJz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mtRX4OVu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kO8n27cY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6317D9nb718546
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Apr 2026 07:33:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=hPPR2+jvkaHole48wnGcgLBTOBMjVSCOu4+
	iJ7qiB5g=; b=mtRX4OVuC4Ht/qmfYab0gD/tLh/L2Y5Dg2+vhcGjBpA/9bTgmDN
	0MPqJgbRglVwpdFGOQCpNKQDtu0kVz8mHPEzfwT4i4NkJwTJl7CIHtmMoTLsDNBo
	A/9ecNoSuHdXb1G4/J9TM+5JTRFFc6NS+RpPy9YeP9HFb7k9DSWC1ggFhw46BGNM
	KYNjuxU8H4McdgL2ELlWthGirxh6OxdEzz0DApMCk9v7w4tsP7Y5gDrnL5YHJ6Tq
	qZKtDZXegUy75Gsl2hQOK3Ovqa9V4pqsJNegqNfMVkpiE9hUlD1se/d6oNfAMpV5
	wj8S/yde2rXNgYjjNnuE20aRMXhGcbPy4Ig==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8kcstu2r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 07:33:55 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35c12a3bbb9so7131544a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 00:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775028834; x=1775633634; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hPPR2+jvkaHole48wnGcgLBTOBMjVSCOu4+iJ7qiB5g=;
        b=kO8n27cY3NDoIDALUUFvqv2ZxLuFycYz3YExkrWGkzZ/dCrY2Kz4mZ9h0h5vWoSKks
         juIPmOaFHRp3thFvLnUsrL4EAGRpRJStv7gL6Wzl4QdlK+SgUHm4qjxaKS6fvSz3SRpj
         dKhBGRQAYy2M/v7ZqcckzAXf0auAAeQT437LGWbMPeS+5k9ZQ/TeUIffg5vvWI9oma5M
         LkCc2GbmvPyPvYZhMG3p+nbtAxUG01xyLcwEwMJm+BHk0STTPYiGees2AYtUy31LHkLb
         9+U9dynwKpKCispAWpXWd+4OmfXlyyZ89mHxURUXd3NlVyDnpiaZkQxn5S2O2FcMvMKX
         /+kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775028834; x=1775633634;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hPPR2+jvkaHole48wnGcgLBTOBMjVSCOu4+iJ7qiB5g=;
        b=XfqgDCycyFZP++xIlg/xm983AAlc/qhqrsMsGmhFNa9tdHVIIWuRtace6h4/XQGtuE
         4f514WqFLC+ku7dPC4ksQA3P3X1WAuBEnOIFQMZUELrvfjUqATMyXEEZPDw2wHh13yK6
         X+qOmo+FwyapCyj6rA+baU+xD4Q7NiHT2c+crWpt1mtasqUJNaS0iseWT50Hrj/lRpDj
         b7c7oKCook/31iv6q8SPGLLMBZvjw7V8KWWNoLLlu2oT4h8rtZu67splXxz1a+0gtERV
         1eoKsKbmh8H+3s9jNZzg2/u1QjDFYb6sz1cxIBOjgtP9iBRff9HfF73r+FMyXBYegX1T
         Mcvg==
X-Forwarded-Encrypted: i=1; AJvYcCWkdAVKXlj18ZZNy985ALpEEeUoWxjC5DDxQIRALuhPXhyWq73nSLkZvYcSt7KE+cx1efnQsyjvzto7hlVd@vger.kernel.org
X-Gm-Message-State: AOJu0YxVHbAQo1sR0u9eTX51dnCWd7KOg4dohEvYgZYCYG/N9vvWVx7j
	OQ0gLY7LL/4cw4U4pBnQ7zyZVDLxz7YSceGpk0vIVN/T6kTxyhCBhaP/FCIHG5pVCYVus1DFSpb
	yW7plAq8t1mAYVrMZhHuoWTeOeilJEjTuY3Lv/yhXN7LCBXZHLppuA4dQkEbBZrzSllwJ
X-Gm-Gg: ATEYQzzNYlE/ej6ega1HbHoSFbLgRm0+ADo5w0k4aOJFPIxRhxw3iyFi98ktFSJW3d/
	uG5kU+rhNfGXbvr66LUvcoCtXvBMWiwiktFmlNDJt/RHhl6UqkJLoIbsRfCuaZ3j0tZFHnhYsOA
	Hkcb9oVzHp9kLLeZmOhUQxjQHwA5cGBK4vC+NmUIR3l2wrLJluNyWLQdC+moyo4FeTIEzlDuta2
	fggsdPAD8hgECaCPmIGx/sVe4/pbs/DwOzUKll15sdA9VwwnqNJr/oZH1NQ0zBcADWqop34xc1X
	u+QcBSPu7cMI3thIlQDERPUbGYwTXt6i+4quSs2/hYyBQ/72EEglBCR/gW3TyKc3E1QWeHAuYZp
	ot14Ya4210K0kFOHNAg0C11YcZdE68S50GnaItn3rMX+393U1mt959AhWG8AW+w2r4SFZ9q9+U4
	oR6Vdok1Rtek93MgAMcg==
X-Received: by 2002:a17:903:3c4c:b0:2ae:826f:2c50 with SMTP id d9443c01a7336-2b269aa6173mr24687465ad.12.1775028834294;
        Wed, 01 Apr 2026 00:33:54 -0700 (PDT)
X-Received: by 2002:a17:903:3c4c:b0:2ae:826f:2c50 with SMTP id d9443c01a7336-2b269aa6173mr24687215ad.12.1775028833770;
        Wed, 01 Apr 2026 00:33:53 -0700 (PDT)
Received: from QCOM-SocCW5bzXR.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b242690e60sm136623835ad.37.2026.04.01.00.33.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 00:33:53 -0700 (PDT)
From: Jianping Li <jianping.li@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org
Cc: Jianping Li <jianping.li@oss.qualcomm.com>, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ekansh.gupta@oss.qualcomm.com
Subject: [PATCH] arm64: dts: qcom: kodiak: increase fastrpc compute-cb session slots
Date: Wed,  1 Apr 2026 15:33:45 +0800
Message-Id: <20260401073345.478-1-jianping.li@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDA2NiBTYWx0ZWRfX9UwjxFftD9zg
 Zt3lVombw4xO7cY2VzHg2uEJ24uz5gpMi3Pnbi0JKbG1BOpEMHlfFrzK83QrjxgVX2dFEeT/NUl
 tQPxU4b7V1QCFrAuTDiziU54UddVmWABU4ymlt+4E0VxVE9t+Tw3pJCjZyKrHDYJqfVAf0oQBAa
 9HxLiKuG/ONvTvNyuL4A5YI8uc5JtHFFDSrPxPg+fWqCLbgcA/Z0DFksgLTKo5cc/mwUL2tNviw
 lPbW14qYhOE7Jn9g51qDdgdF0I41AnA8nWoFuS/7ElQxX7VQ8UaaLNcTl4zkBZxX+s+8TfDas7p
 hlHQrQ36S1NTXOMiRb4AAmn62aO5+nubH/cpd/kjAB2M1kxtagt4a1yMWTnZ9GvFx1N4WAEoH4Q
 u0EWrY8KAawvwQLRjr0d5XUMv86bwx0dTfkxmjyluhjzKeZzJMzXB6xAudchD/xrOQFs2r1G0O/
 rez0UYEfCGCdckqirgA==
X-Authority-Analysis: v=2.4 cv=KNlXzVFo c=1 sm=1 tr=0 ts=69ccca63 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=hbxEiaAZNVryL09W7gsA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: Fhc11XiLGxKBb9W_aPpIx02QavfFT9Ql
X-Proofpoint-GUID: Fhc11XiLGxKBb9W_aPpIx02QavfFT9Ql
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_02,2026-04-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 phishscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010066
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101251-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jianping.li@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_PROHIBIT(0.00)[0.0.0.5:email];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DD346376418
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Some workloads on Kodiak can exhaust FastRPC sessions when multiple
compute clients open contexts concurrently, leading to -EBUSY failures.

Describe the compute context bank with qcom,nsessions = <5> so the
driver can provision enough session slots for the compute-cb instance.

Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index 6079e67ea829..5bd20909f9db 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -4465,6 +4465,7 @@ compute-cb@5 {
 						compatible = "qcom,fastrpc-compute-cb";
 						reg = <5>;
 						iommus = <&apps_smmu 0x1805 0x0>;
+						qcom,nsessions = <5>;
 						dma-coherent;
 					};
 				};
-- 
2.43.0


