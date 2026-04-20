Return-Path: <linux-arm-msm+bounces-103656-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KEWPA9yp5WkCmwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103656-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 06:21:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A56D4426B57
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 06:21:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A26FF302001B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 04:21:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 296733815E2;
	Mon, 20 Apr 2026 04:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CU+o/bLT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GAADn79O"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B82141760
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 04:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776658897; cv=none; b=TwOHkMGhqQx8PvuI5nyVfJeIvVoqmjjqc1Tw+EQ/+aEVAoO0lpW8vZhsr19Os/CPfrS0lliVgLUKifPjtRyU15Q+pPOyjtDeOga87I96IbdBt1dngYfTILIj7n7ZThy3QcWu5vlsRfoWuhOHRXmgNbCMUm+0OBuRk4J+SzVsqbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776658897; c=relaxed/simple;
	bh=9zk2e0pX60sa98Q31J8tqnytS6SQBvDq64DeqNlhcuc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=th/AQNxE3Azytb7MsY76gHHNf/O6bM3pdWaUdlu4SXBStcmPlZ39Qc7rPDPMQWdTI+i8vMa430244TQ6d3ZMfSFNAtnopVD2BawZLbBNtOqFFyQ5Vss5aLsTUmNvDE4F2fg+h9EtKkBOGrzdPGWBAXjtQkQSopz2faKVjhVNs34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CU+o/bLT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GAADn79O; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63JAjRw9713525
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 04:21:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=qaM+GPaTDpokAo4rJuDE8WVmWv/fVcxz9V7
	7vFiuogw=; b=CU+o/bLTq8+2zcePFRHjj6YzPwmZ7ZGe03zS1B+vq6xSzKYW19S
	laerRBlOlyDgDGoXovGSCKmp3d+WBabWout3G6aqx9iEJl6cGbgvZvfhj2Sj9xsq
	3a2e2DC0emqo9lkgiWmw+MJm4Z39i7yyNG6czP1mLcqpCRMA9Fh6e3TonW3Ibd+g
	Mfc431oClDfbJmimnEKDCkrE2TwslqCoWP/GktMyXCvWz/t5HP6mtiABgr4jn5Un
	R2H4wJ25p7p5iY86MGdu7uAEBxpBNv+cSS7ng1Wuw4xMh9BqKNs7B/Mxqbzi8OhM
	sP/2/1MM9BtvAG1YiFOr96hWO92SYlMg4RA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm19fv143-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 04:21:33 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2cc75e79b97so2437620eec.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Apr 2026 21:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776658892; x=1777263692; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qaM+GPaTDpokAo4rJuDE8WVmWv/fVcxz9V77vFiuogw=;
        b=GAADn79OEFpK9OleedY6petIq1FdXfKPI4180ko8UoHGyIbf8ogjB6RoWBeGGhyuuL
         tgaK196P1w94epDW+41oL7hDqhy7l/zrWcsmPtF6b9cPxeZRhSukZzewPWQwYG9hs+Bq
         VZgCfve/mkaq4a7OqmIHug2QAy8DyF1CjR109pB2OF6xLEBirBXXueDqIZNnd8A4LlHa
         GjdGgs8trvHtegZS/xZVqtdsXEjpveSQ5HJBguVeSKHPYvLk4EuM02Zb0ay2fcAEJ8hL
         IfnVdDAYpFgAatwLB6qF3O51uVaZxqT9RXuvrEFwNMRal9rYQv8woQoUFAfWWA5sWCtv
         at2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776658892; x=1777263692;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qaM+GPaTDpokAo4rJuDE8WVmWv/fVcxz9V77vFiuogw=;
        b=sjhCosV9ua50b12I70n3QOqnXkQCVECJUUVxN4Z0DyCZE7vecxMhP42d9IrcREKnbf
         uzK0rx0kMNJYsFt9QTeiCgbubtV+wjMNRQbEd1/tra9E523n8InsmGQHxkPbGCPYxqrb
         RAWT5aW1ZrDbGuJ8ba1t0Z6psWdevcsP6Yxs+s+aPpTc/Sb8b8+itP9jk0SjhjG5mRpK
         pe3fSckupbfdE0nS202y9VAdFiLSTy1mPfmJXbImghA7BTk+9Lp4+Zkog4Z/eMGA8x2j
         jxiRDqIFWGMu+N0YoYi7MJL1ThME6buvXLbx0Gvdh2SnNU2elmjrQdIXOFwY+TasgKgg
         bikg==
X-Forwarded-Encrypted: i=1; AFNElJ/6wORRydUnGQewc3s+vJgwJEinr9idQ9xH1DMH0IRKeC6M6Fg2SPT/0MoVxaK3SISkq/A+QXxFHPMe1pav@vger.kernel.org
X-Gm-Message-State: AOJu0Yxa0XeYidhUQvwUPmnM5PMDFOEwhUloQBNZbyqoFFIFcrFYJCuf
	Kg8HHas1+Gk9DkOebCfMiXx5hfUcNQ7rI3MhSGnlL//WnddDnv9dqwIiTpTLByzUNpSCfLgZgkE
	8TWDj3UZqLDRxfCjCTTLnkp/grbcTyVpEANva+nsYx55iCexcBtRMjuo8Nas/V8gGhMN/
X-Gm-Gg: AeBDiev5Tkd6Cp+jtP3JSBDR7AInFA4EP6C16KdxfsWWZiDX8DGPG4q3yWzCziJtPPz
	8VR77NhiYsPn70eIXOqfWGeLaSbg2I2NRF9bYiG4TvZtGtXF4OwEn5VyP83VmIFx7QKVpBarUxD
	C1qrjj7kIGQdNj2KQNi5rrpnfAa16SNLKcXQ903chozbMdKP56HXQfj+mvJlYsU6iiqjvOGLR7p
	ewlPoIAQxWF2mcSs/tk+LLEqa5dRb1GATGr3MOAdE3j2WVM8tFhmymgC9llLizGwYTDt2I9IcsV
	eNiP3zxUmtTWUTnSQVOdBIL69GSWv/qmBT34OFT5cAI7z95p/a2A1dtGWfwou8bNFYB/fqDNOxv
	XVKtTTWaJpO7keInps2F3JVNK0v9zyp2LPDxmjdGgVnUfE1+oYLJ4kBE4PhvCGmPRui5joQIKUR
	J7l3bYgR8hXN/7OYbB
X-Received: by 2002:a05:7301:1e8c:b0:2dd:c066:bf7 with SMTP id 5a478bee46e88-2e465772629mr6262849eec.11.1776658892334;
        Sun, 19 Apr 2026 21:21:32 -0700 (PDT)
X-Received: by 2002:a05:7301:1e8c:b0:2dd:c066:bf7 with SMTP id 5a478bee46e88-2e465772629mr6262839eec.11.1776658891805;
        Sun, 19 Apr 2026 21:21:31 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53d4bdaf7sm12340216eec.25.2026.04.19.21.21.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 21:21:31 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH RESEND] dt-bindings: mfd: qcom,tcsr: Add compatible for Nord
Date: Mon, 20 Apr 2026 12:21:24 +0800
Message-ID: <20260420042124.1247995-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDAzOCBTYWx0ZWRfX4duvJnJl5Cx3
 G0CpjXyGoZcpOQCB/3hGrzdcoTtOjz7Ke3QicXdv7ySih/fXOLlfKlAOAaY7qpXauIMzyhUiVyG
 +AWe/E5M1MRE2YZZa+qbpLew82cUFCXy8VU8Mv/z0CvB1Eada7HG2NU6rxunOGCgzXHhee57lZq
 pBL8eNnbUr3YD7VeSjrDv/OJhj1rMUEz6GS5t0LZjxey3SCiIKBEnd3kMFgsA46Br5Je7JqUXnn
 xzBg0e9qxRtF080fu5EjXcaGn7HlPBECeHFLGM5czdT/wKkWZ296cGX3dwroi9Vr1eAgmch0bjn
 4qHZ+q/GXbQFXC4bicu84lQEBNWS53n5SecdS87eS8b4ge+kTOJWq3lnAMvffgOTZSopx/YrKNi
 M5EimcoLwiuZdBGNDnuRTrauSzKnc3t4Oxfgms4SbSZwDLbUCkSyj7UZPMpqH1dM7ABgdUwhaop
 vHz3K3kA9VO3pVKQpcg==
X-Proofpoint-ORIG-GUID: M-CwvIG44vGW7FkXXtxsIkCNU-f8cQzt
X-Proofpoint-GUID: M-CwvIG44vGW7FkXXtxsIkCNU-f8cQzt
X-Authority-Analysis: v=2.4 cv=FMorAeos c=1 sm=1 tr=0 ts=69e5a9cd cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=LjGnC7tzK2yCY8HLVSUA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-19_07,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 priorityscore=1501 phishscore=0 adultscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604200038
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103656-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A56D4426B57
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>

Document Top Control and Status Register controller for Qualcomm Nord
SoC with a fallback on syscon.

Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
Resend to add my SoB.

 Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml b/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
index 14ae3f00ef7e..23317d1b381c 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
@@ -19,6 +19,7 @@ properties:
       - enum:
           - qcom,msm8976-tcsr
           - qcom,msm8998-tcsr
+          - qcom,nord-tcsr
           - qcom,qcm2290-tcsr
           - qcom,qcs404-tcsr
           - qcom,qcs615-tcsr
-- 
2.43.0


