Return-Path: <linux-arm-msm+bounces-104806-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MNcjLwap72mpDgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104806-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 20:20:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 220494786DB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 20:20:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E908930A2BE2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 18:16:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FE953E274D;
	Mon, 27 Apr 2026 18:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UBb8du5q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GhnoDFnA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 271F031159C
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 18:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777313780; cv=none; b=PcCPgtfY2kgd+SQCBsmRMa6KiY2Dk44cZ+0RSeUGRSktHE/AlYzthRRMquE+WS6L7Es5R9tq+5pKfY4m2WfRsW0liP17IDzjkYO9Qx2rYzJice2/8Ecb23qq8bM2wRFiNSru7b5HKoQUveN1YC+Yx/KvIJjWkhldlhU5Yr9Xwto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777313780; c=relaxed/simple;
	bh=YprplocZURA1lKVLjcB+psbpqSxBxjQw83uHxzj/+9c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DXE6RxTZzftFVstDHtRymGRbgmLfvSLrwx6JgRWl0k51jq5aj2WkpVCwpJdlFvJyWxSXH2fRQ/kn1tYolmZKlunt8kuZIzyhWCfZoRStuEY9vYrFYQAM/qoz/CcjMcEWfCsfcVlNAdk0Mk8NzG+a9gjHV+VE5n60NpSjS8gtyA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UBb8du5q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GhnoDFnA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RDMMfQ665743
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 18:16:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=BxPqoSIfk5SgqjJr+ogyo0XMyzNwZ9IP9oz
	1ubebmgg=; b=UBb8du5qyegAl+J7udmO7dJa7C8XwFjNDEnQUA3MqV9J+KcvfHG
	/2/mD1LGRCJQlblAlHuX/VjilGRjr2wPXtNg/Mm3Pfk1ESSyWI2yBzpZrJ5tp4/9
	gePi6dcC0ETvQ2fj2f7wMUJxT52HnI1tOxZcRUtph83h5oqW7RO6IXs1xxo0IvwR
	pck71eX3n59Tj9+cHkCn6xH+rbapoqHSQ1rJk2XfqXMmb/aQ9AjBoJFWh55sjzpJ
	xc+uUzdQD3m64NRLKbjIOvkXMEIth+b4h4V7qXvT2fpG3r0Gl42z2HCSLjtlYEx5
	+q356O6rh7jWASpI05XmZQSyDz1JtREQPSg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt30n2q9r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 18:16:18 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82f07078ff0so7120031b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 11:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777313778; x=1777918578; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BxPqoSIfk5SgqjJr+ogyo0XMyzNwZ9IP9oz1ubebmgg=;
        b=GhnoDFnAyrLKMgzGNbj6Y6VcX92h0qnavk61uasW+/jyS1umTg+nVuAvzk/gFmT7W3
         +F/z0fjW5a7YCDOgXcV19qBi2yxWYU2fvNgJHdjtlmk5enEr77XSVw8AUlmlxUQQVtzZ
         bfY/WYlRRp0RIkrw42wB3fM/JiqUKr0HzUXxRqKwanK+JPXYm1R+I+CvngnUExPpNbKo
         eykfqJj94/Q9ZiuGibkqM5lpZLfRP+z0YZYqRf6gFsbtuFgg5g61tnXCPFhMDxeRrIZJ
         dV9kR+LtED2BNeN2xT9g3CFKJ3crK+Cd8RBAsKfC3exnwT9DldkQSsABHxxoyLQGFL0g
         AhsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777313778; x=1777918578;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BxPqoSIfk5SgqjJr+ogyo0XMyzNwZ9IP9oz1ubebmgg=;
        b=QMOmQH/Q3YnwU9D+QGg7ZFq3sEGMYCzINIqC6nr4StcjLkYdjdbZUNlpHx5JQ/HcDa
         yKPb+TcwUctP6zLHWa6Ca3Abk7TyTraUFxEtnz4JMKKFtFDr9dsRJGk/2ctCHiLo6cqf
         FL6qiYKaWm8A2cbczJziQyEkk8jEV24BvPNGjTpxgY5+WE1h7ju3z518BmxWyMyeKgtJ
         /4/6IwXnB89DENtIzzZUwgf5NoFaxeEstV7RqMoJV+52dCJVp2GzzgyfesBoABMQDL7T
         ldATWNs8i9Ewr4WvB/Sq5VuZVl2RANMW6x0MUO1HyjT+eKsWJDq2f6Ye96uilZ+OV2My
         8B8g==
X-Gm-Message-State: AOJu0YwmG97Ml0MKxAeXl/COjZLP/XZzvbZ9n9r96sWT81iP4yWRSRX6
	9IJlqLbRTkjUnDwnHnj0E0ixngdxL+sV5XLZQVrJMXOOsCJ234NmSlx/do4lHCNTGA8MlKi4pxy
	ulmWdLQdLtcA0/no+RW04u+tXLItLozRZNRuVhHCOZSfpiwTlU+xZaeQ04KAfAiCDmKTU
X-Gm-Gg: AeBDies2gtD6TD7Mk2A+/EUDNN6/r4iqxs1GnXlUJL9D3M8gj+cOJ17TS+WL7V/559L
	YWXGheXMbans5yGFBRAJFgfj4x8Ov+/4PLZMrcFgKJUKbeHPRJSjckl8/GxBTLl5tN+9QgOjSpx
	s6EocFNDMUXzk+opeOHLLdA67usn/1jgYTkJVcXEAME4mzSNtviXvugKE6KFnU/IydLp9Xwn6re
	O1kB87qReMvvb1vqd3TD5GctEMIFeGpC3HyHCsifl1CAWShLdshDm5LyPLVqAOqkGEZVE/DlFDa
	p70m/kJrxuOSHtms4EwyMpSzSM/MM5kHOITB2k42CphkrhXUAj2f8pm4N9RYNuab9SAII0NK+YV
	VEH0kAa4OYEv6wuZy/k20q0W2NoY0uVJh5roW3P2oyG7pKIWPLiosnrOBpOw=
X-Received: by 2002:a05:6a00:ab0a:b0:82f:5dc3:b376 with SMTP id d2e1a72fcca58-834dc265f94mr83137b3a.25.1777313777604;
        Mon, 27 Apr 2026 11:16:17 -0700 (PDT)
X-Received: by 2002:a05:6a00:ab0a:b0:82f:5dc3:b376 with SMTP id d2e1a72fcca58-834dc265f94mr83095b3a.25.1777313776918;
        Mon, 27 Apr 2026 11:16:16 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834dae1fd83sm154353b3a.14.2026.04.27.11.16.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 11:16:16 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: soc: qcom,aoss-qmp: Document the Hawi AOSS side channel
Date: Mon, 27 Apr 2026 23:46:09 +0530
Message-ID: <20260427181609.3648384-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDE5NSBTYWx0ZWRfX2UrPnlsQLFIN
 7cf2oKh/KBEmGQOBiY4rAEV6glaMwaojwxCZw4AQy3q/JVqDpV/AkQlvBw0rT43hYfQ6GuRs5Ae
 pDxHIAjuMzt25UAaDESbgEN23ebhM++xtHvmPa3DwoO/IXoEUxQashDFaznO+klhJNB16YNibTL
 xQ4wp+o60qtIEURUKeKhL7lS4mJNYkMP/UVF1ZC5Dc5Q/yq3r9j07NLcFRazN/d1WvbyjmDWWk/
 /nydiiHoofIUC9ug1fRWDm3g17OijpuUGo4pQc2WpnANQslLS8o7rHXggr4WOtPyJr6btoQ8uCQ
 m8MkE6J3uXT0uE7nqDBLv4xllm4DGs9dZs/3ZtegaVzUc65dZ0OHv2PvS2tP4A9PuS3MKE/dUzk
 ayY2Qm6IaaxjnGQD1afQ5mkbveMkiJGCtWIqIrChCWU9tZeYpHoJuHlwoW+TeAsVYNmjEPx0lIo
 5AdSjIcYfI1B99DtwDA==
X-Proofpoint-GUID: yw3deoZZoCRY7upKGy7jN3CM463SDhGt
X-Authority-Analysis: v=2.4 cv=efANubEH c=1 sm=1 tr=0 ts=69efa7f2 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=M8R6JNo6oyjcFb5i_SoA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: yw3deoZZoCRY7upKGy7jN3CM463SDhGt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604270195
X-Rspamd-Queue-Id: 220494786DB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
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
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104806-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]

Document the Always-on Subsystem side channel on Qualcomm Hawi SoC.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
index c5c1bac2db01..c8f95ae563ae 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
@@ -26,6 +26,7 @@ properties:
     items:
       - enum:
           - qcom,glymur-aoss-qmp
+          - qcom,hawi-aoss-qmp
           - qcom,kaanapali-aoss-qmp
           - qcom,milos-aoss-qmp
           - qcom,qcs615-aoss-qmp
-- 
2.53.0


