Return-Path: <linux-arm-msm+bounces-103651-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YCRnHgqj5WncmQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103651-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 05:52:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D10C34269EB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 05:52:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4402A3015461
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 03:52:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 215EC37FF7B;
	Mon, 20 Apr 2026 03:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IWuCFuKF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KRE+D4Ss"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0B4D3803F2
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 03:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776657135; cv=none; b=sf/NXPAubZxiNkvswnXyArWIoz4xyB/wyEa5gTCLydT0RFDcwhVNvTtInaBhL3ba+H8wG27cAiSSMXjMeMGa2MtE41zypGRdUOnR0CM5FqB3v1JSCeAyLCMZci5Xjm9LF3eiZ5Xa3j17UjJQiyrNHEvzFMtuuDiJqvzh+mTqe+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776657135; c=relaxed/simple;
	bh=B0XLqXHUgBZZJX90mTOCc3uPsZWSvR4krbaDfNJTfmE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mebhy4ZTa5wqNS0RBiFPtCFO9LINiS2tSa+0KEFwbRU2s3jnoJvRHeGaYaMFBjtYqxHs6lYBtMyhC+uXpBC9rrEyvBAhoZTMzvUKcQAQI/SOJ9iB8zqr5QzqXvc1HhImYfgomzcWNCeCwi0zM5b3jqJWgc4XrXg4+alkDJEel5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IWuCFuKF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KRE+D4Ss; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63JNnLMW638159
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 03:52:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=pVhGmAWyYmU
	7/TxyYDl95sQD/qE0Y/S45u7/+wIjVZ0=; b=IWuCFuKFqaBfPBQHphHR64DR3LW
	s34yVbbrLFpcHeBYXyPUufWDryiqxeYBKMTD3997vA/MsObx+NwCbZjwXwQJHmd1
	BiQv+VgrK3bpSGnKUAWuppPzXOUUrQBkSDhudz/ZNQJEsBnBXgGYjCAC6SWwBtex
	oHIC3QB25EVaBda0sCaJRhpLeE5+zZQBkewR4RB4wQ3/iEv9IUkCPCFLpRd2zdMo
	QI18wHRnm0n3ilCGQ9kPWe8AFMfKHAacCksLzawwNct0lW23K8EjvySqQGtf2t/X
	u7KgffGmDZ66VSbIMjGrccDfpa7OthiUoUWxpHkPK2MlFwf63vXaqkvd4uQ==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm261uvj8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 03:52:12 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-12c8de02a4dso1819426c88.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Apr 2026 20:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776657132; x=1777261932; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pVhGmAWyYmU7/TxyYDl95sQD/qE0Y/S45u7/+wIjVZ0=;
        b=KRE+D4Ssfcppb/4fhwviYTUi33Ub7B3HBCukZRLpQs7RzJ75tRfET4Zy8KVi1fiQ3v
         oNyaHoL7to5H9DtlzsOIrDu2JrSPwvX/2E5yru4CHTGj70vjfPq3VOHnENrNXcnIhree
         snadlwMlclYr/wba5fqhbvuO9p6y9wWaYIdCYi73N2Pd4VUXmGC8DBoa4YrTRWqIHK/M
         lcFVAy+w/T2/FotFXEoDWTFP5H040sM7ArRhallS4hZ9GZe4C0NFOIrVzfM7RpOkdshf
         OQnPbGHAynunE+1Riq4ZJniuvWgfeUIzkjNrJ9UvfNI6mTgQ6T/f6nNb2A2umFp7YiqT
         bNWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776657132; x=1777261932;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pVhGmAWyYmU7/TxyYDl95sQD/qE0Y/S45u7/+wIjVZ0=;
        b=qjXHwtJN7/5Ol9Ccaunsz3c9Fe71teQQfRivlPcuoYVUuZBTVoKFIlZydJBg6g7uJf
         pYAYrbmVv4D0AfYv4qzPdFdPj0kIaINRzrH5pK9ES62eR957FwTlDXxBn3Fm/LdiIe8Q
         yHqSV06DGwfztsNITTLiNHKnVG++OhUs5TN3curtWJ+b6lI92jHjwatOk3+EU2WUwazT
         DKBMtjAq7nuK414cxMGZ8fXUN9W7iEcEp8RTURZpqTqjTYxg/UEslkC1z0S6ZC2cp2/t
         E7x7zWOV4rO3buateof1czIEWK6JJIV+09HZUYni3BbvvBRgHERSlu4Eos6nQ1BSehTz
         hEmg==
X-Forwarded-Encrypted: i=1; AFNElJ+pOhSL4PDq7ZHcK3g150eiGmMukYLnHBPkd8VsVCkbv8mqUx6wcFun4+aeyvsw0TGrWIKS7uk9fkhMfUPt@vger.kernel.org
X-Gm-Message-State: AOJu0YzhRI1gw9zW2nuKJdsZN/FoIJeFzz1tFoJT0o4mCLp1W/Qm9dzP
	8U2p6sbbotcWZppP8CODtIyNPZht9bnpjbvqEIEPqHxOPcABUeG2Nu+trrsLwSUeo633eIMYlkM
	jf5msFzKh/sDi1UJ0P6qBDVG5dDW3mxKSjaE7bjsfq8hTeE7XjMwYqHjymu47OzZDNYsK
X-Gm-Gg: AeBDievATrjNIkhuewjYrcD7IQmzNFYpuku71u+ec4YIWbkYPd1wzAorDtOYhqqBRR1
	LvDwvaJzkvftg7YMFRGrr7OSE8fmHrmfErnHyrpOGsiHOvkn+7EY72YsnkA8mQAKF2J9U5U0GG1
	xBfAOMu9ufBp7WhBDcZK7dX0YfBWLVsNJMOwpKkdb/UvMJf6Y1FTfYH9HCmLXGbsDQq7reziecg
	wvi/Uh9xXGgVPb4jnF2tcRBK6R17RwYXXQAuremuhVW7bNPU4QIYtwhpVU7x5oaDqpX7xBTNDzH
	gkDPQbn/qzi/g2Ng4npI9Vvr/f70SricqFgTFSwYqvmZCvoVEFK391t5NcQzhZsnItOZb+axDOn
	NFgxVYiagG3GcIKj5I91nOZEuJSwZtRgJAxs/txNjqKzth9KfYEaEYzBu7KU1TZmGGqtyd5daAq
	iTotf0Rp2kFJi/CBmy
X-Received: by 2002:a05:7022:30e:b0:12a:949b:b9b with SMTP id a92af1059eb24-12c73f99c7fmr5985487c88.23.1776657132362;
        Sun, 19 Apr 2026 20:52:12 -0700 (PDT)
X-Received: by 2002:a05:7022:30e:b0:12a:949b:b9b with SMTP id a92af1059eb24-12c73f99c7fmr5985470c88.23.1776657131814;
        Sun, 19 Apr 2026 20:52:11 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c74a20c55sm13056111c88.13.2026.04.19.20.52.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 20:52:11 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 1/2] dt-bindings: mailbox: qcom: Document Nord CPUCP mailbox controller
Date: Mon, 20 Apr 2026 11:49:31 +0800
Message-ID: <20260420034932.1247344-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260420034932.1247344-1-shengchao.guo@oss.qualcomm.com>
References: <20260420034932.1247344-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDAzMyBTYWx0ZWRfX82pvtYE1umv+
 3lIYupp/ItsxT3G8DHEh4vO8F8QTglCYB+1EU2SIplM9cGTrrE+Cu3lzTdp47xf/iwzQpTGZQfl
 TZapZz+XVOEs6ISndlMS02UG+fYaIIyEhrBob0HZEUE6BnKeErei1lBQybVP/Kf6fsv83Sc8NvO
 HbfRArCayVEOnVvDZsgvgVBXshLhld+9g4Aq+m/nog0fdI6zpNX3/U3Hl5JruN12mWxj0jBPfcy
 gcAhME++fTD7Me6dBzrQRPdhKnZ1szxxh2321ZGrQkJ8yJqSzGQAXiOrpxtP5/8KL4cvcBbt2br
 4bIFeADqc5+npf8+6QDsiLhmCYGxz5rxSq6SBEQ1ez2IR2VjLfRIWv483koZpAxCuf667VY27KR
 TufUGrS59psTYQUxGG1i7yhISh47sBNutxh9HQDynoy8XwAdGfYtiVQM5z0Qs9YACAd17fm1VB7
 UYBTYANp0iVHrdaF3xg==
X-Authority-Analysis: v=2.4 cv=dcywG3Xe c=1 sm=1 tr=0 ts=69e5a2ec cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=gsWVsoWImq32ZgTqCxIA:9 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: -EpBR6fmbUZkMn_CVWdUIhW6mB5Ixcrf
X-Proofpoint-GUID: -EpBR6fmbUZkMn_CVWdUIhW6mB5Ixcrf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-19_07,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 suspectscore=0 phishscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200033
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-103651-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D10C34269EB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>

Document CPUSS Control Processor (CPUCP) mailbox controller for Qualcomm
Nord SoC.  It has 16 IPC channels, compared to 3 on X1E80100 CPUCP.

Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml b/Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml
index 90bfde66cc4a..2dd66a88c186 100644
--- a/Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml
+++ b/Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml
@@ -23,6 +23,7 @@ properties:
               - qcom,sm8750-cpucp-mbox
           - const: qcom,x1e80100-cpucp-mbox
       - enum:
+          - qcom,nord-cpucp-mbox
           - qcom,x1e80100-cpucp-mbox
 
   reg:
-- 
2.43.0


