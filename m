Return-Path: <linux-arm-msm+bounces-104581-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KB5KGnK47mmMxAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104581-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 03:14:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F88B46BD88
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 03:14:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EE6C930097CA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 01:14:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A75424169D;
	Mon, 27 Apr 2026 01:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V3a//aH6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Iwh92LsB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0805D23A9BD
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 01:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777252463; cv=none; b=MQ5urztO8mJS2aFzLE0rrYk6DreOwPSTsLsYSvyopusOSubeybreuuDPq3Ot5VMisixNcoaFG9RP/5ujOmTTvST2iauCMwadNYqpnw9L7NqyhdLzdYnjxnR86VUj2T0GQ7xFU491N2nSbOSpcrEkzXx4lpNm0O8AUKQd+gwXn1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777252463; c=relaxed/simple;
	bh=RQMiJZbD8JiAWtXzG/O+xIZUUaIwgOwac2VhY7DE7dc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=D21GKUlVewG23CjbtFYbCQBS3axmhnELBepn/ExrL7RBGvsh48BIv+jX9W5EKBz4XU6KvqmgJ9rY6HVyoZBDOJLa6wEGYT+GrbBGT2IEBerJCGKP4idWTZnjHBspFvJ/ojrFhQhvQDbpVddEAHHZQO9J/iFR43NN+Qe1w3T0YfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V3a//aH6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Iwh92LsB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63QKrAta1437632
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 01:14:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Z80lSspytxoBStc+Bff9vvovYe+tabmP27X
	GmL7C+bQ=; b=V3a//aH6GQqhbZIQnw3ujfNWu88ScBvSQX5xus9kG1cYULKq/gC
	r1dx9/UxQiXK6D0wOuHxJ6H1Z8jxW+Awpv58wAg5mc/U54SrHtHAPx3WytfaFO1R
	AttV2QH8q+T78+zesawQ3rvJ6hlyeCSrnTlH6/bo+TzErLibzhvBOQkSEPt8EzuR
	fi6H61UGeKaASwBokbGkE0H60QATK6R119ORxsvumgDKdVbKpAvYW1qtPfXoWsew
	f/I7+yRRQV49rYpWBfdwR+v1Fr6OFjcCdb0qoup5seApJvuoyPvzHPF+3MaDf03f
	TNtHSC1fIlHqJp4vsQoFtIreHFfuqbcmyjA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drnnf3v06-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 01:14:21 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2cc75e79b97so26866754eec.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Apr 2026 18:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777252460; x=1777857260; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Z80lSspytxoBStc+Bff9vvovYe+tabmP27XGmL7C+bQ=;
        b=Iwh92LsBtajMKeqp3S+PaifU2PHHfw0BFfoh+9QEjwkt68IWwti/Z6a8T/Ie9v6KE1
         n30jRFLbj0ccfngAwSN4nR1dIUUU/KzcQJwAldkWBe9ikA0WK79exM15/eIKbphx6sj1
         IHuNVm2VfPwAdvjvtVvR8UsKZ83mO1YegYYoX/4CK0VMq1SzySq4ZRcBkAKmqXANUGkM
         0fQNmEbqgem+t6bo+qIjCMSXLH+uvOO03kj4uFq29cQ/7zrT7gI9sbY8NQ+IhCjSPe+X
         IWt3iq4DwcW06ZfW1EWVqvfVUCUki++/m9eN0uNE74NN/hD9pzVcK4CFDZXKZaybCSnu
         VzKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777252460; x=1777857260;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z80lSspytxoBStc+Bff9vvovYe+tabmP27XGmL7C+bQ=;
        b=iM7gOHS1dEdnyHCDCoa5vJzsIwnbpRuqEDmBKvglufd0gPkupohjDR4MuR3CDGptRl
         ZOGCGypcgbXxsnFRG8cfExs7JXvYI7MCuzGMkdYqRV8g10cupuPWxewe+K25TF8penKo
         HKF1qIJHChmqmp8ZHch8j72EPkwidTz8ZoBXl94dxiw3oypDblx4oU/xNysmgqH+JtB6
         FJIXsZg3gw2JY3SjHpf4xZUKhcpjfLECE5uaw7EawU7HtJn1/Uz3/TPkn1Zaxu1rLsq2
         DoEiV7PugYHtOWud9Tciut4zBtk+di6WjRKljI6fyX6HsfsJ8D9DP7TMWEMUWVqfCQMw
         +DvQ==
X-Forwarded-Encrypted: i=1; AFNElJ/SvM6a1x3MmeZL2XQlhXKc65ydCz9GjcjiQQq2bJ0L5QNGUPis9zW7ia3yGJEfNBlnwNcNGXewAKTY19eI@vger.kernel.org
X-Gm-Message-State: AOJu0YxmjhCN6iELq5XNF8PlPtEPEA4zQjPh2i89VzFqc/HJdvqIOFWO
	m6q+A6MxNoUYD7ao/D5npeVbicjXqlW/soF04tv/2x2SageTZUErHD8sg+ILfRcSKydawt7kCDN
	sC3uJEvYLxU/BZ91Cnv+uXELdl3O/B+gIEfFO+BHktQWUNwmAFbofENDGIjNFAFhNfZzS5mfyLs
	FO
X-Gm-Gg: AeBDievQwVBxFKT0AkmFAXrxcDT39Nh0AG3Dh3I6rP05iVutVwWmsPPCySqxIPziQSZ
	Rypu2biRC4Qe0SxjiLvnRq7+5EvvWitM1qGplrp+GC2mz9/WIXKnwZzn+D51ULowroMAz31ZI/m
	6SzibH+ccHCoJQTEm8YHBgjsKuJa43tlm09WbEfmBv95XeAjlU4pKdwoEVuA7W1tIWrE0qmH8t/
	Mn1k5XH9ISpoA65knN7DP6L599gBX/AvLKZ0TK0xm0+y1qAV3hk5M3jRMKb47XSDtZZc+V3/onq
	5eDhItkFk2rBwyH9CeDdUzta+X6hz7+LlSxYezdTrPTqtxQXkePQAixzeOJUAyG4QAWpkIt7Spe
	EPGXoQBmAwPPF/MrwCv39gS9DB8dEA+83sMgCuUA7UFDs0QRF1gR9oe/CW9A3hCoDXPG01ySN/n
	rAbv28ce8K8EDHK/8/
X-Received: by 2002:a05:7301:eb0:b0:2ea:5057:a304 with SMTP id 5a478bee46e88-2ea5057b8d2mr13777324eec.2.1777252459975;
        Sun, 26 Apr 2026 18:14:19 -0700 (PDT)
X-Received: by 2002:a05:7301:eb0:b0:2ea:5057:a304 with SMTP id 5a478bee46e88-2ea5057b8d2mr13777317eec.2.1777252459515;
        Sun, 26 Apr 2026 18:14:19 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53d2cfd3esm41744370eec.21.2026.04.26.18.14.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 18:14:18 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2] dt-bindings: firmware: qcom,scm: Document SCM for Nord SoC
Date: Mon, 27 Apr 2026 09:13:46 +0800
Message-ID: <20260427011346.230844-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Kv7HLH4uxVghZN8VTFId25kiIWwVzoUd
X-Authority-Analysis: v=2.4 cv=Y5rIdBeN c=1 sm=1 tr=0 ts=69eeb86d cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=FSRre-L6ib6GMKEivIYA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: Kv7HLH4uxVghZN8VTFId25kiIWwVzoUd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDAxMCBTYWx0ZWRfX+zxNBj7lTWkO
 Oj0Hr3TRye4gmw1nTPIH5Q4XXZfaTgqnUufqyeSpxFGJB2ZuN7jzBlucPc3q8bLULnylhDJXANA
 RJ4U5UUubwttMbay33qJLD6621nqPR7VNLGw5PiULfBQRFcblw8ndPvFP+2HprNuBZHJnW5ILbx
 xUrWDqp2cwZLsK3lBo1S0uO86hmAanci+SPE0muD6Z09uokIM6IlRKOXvMIiklfNwXr8uGkwBsC
 TBM3yQiOTn0WvuBgCPohviTncqfmSaYnuYAbART4CnX4aOkovOTBj/9x6rYBzedZAzj4WjJRwtQ
 6ztTvSq9XWmEUaRUxYJJYgag8m/YNR3p0z06CkDthVrQX9/KkjvSyRSm6WYZOGLRgwZCkgbpcGi
 EvDcUWEC9R5Aw/HFjUygzRUs3Q5W+cSwmzQLEQ7OH3ijZLXauQY//p5kw4v8EHnNfawqLCTmcxb
 j9UDzfalaOTUTCR2F7A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-26_07,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 suspectscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270010
X-Rspamd-Queue-Id: 9F88B46BD88
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
	TAGGED_FROM(0.00)[bounces-104581-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]

Document SCM on Qualcomm Nord SoC which is compatible with 'qcom,scm'.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
Changes in v2:
 - Improve commit log to make the compatibility explicit
 - Link to v1: https://lore.kernel.org/all/20260420023243.1239927-1-shengchao.guo@oss.qualcomm.com/

 Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
index 7918d31f58b4..c9590ecbcd2d 100644
--- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
+++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
@@ -49,6 +49,7 @@ properties:
           - qcom,scm-msm8994
           - qcom,scm-msm8996
           - qcom,scm-msm8998
+          - qcom,scm-nord
           - qcom,scm-qcm2290
           - qcom,scm-qcs615
           - qcom,scm-qcs8300
-- 
2.43.0


