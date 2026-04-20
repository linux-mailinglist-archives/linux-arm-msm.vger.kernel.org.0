Return-Path: <linux-arm-msm+bounces-103653-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uJDNKjOl5WksmgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103653-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 06:01:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4647B426A74
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 06:01:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id ACA7A30022F1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 04:01:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DA223803E9;
	Mon, 20 Apr 2026 04:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WMuM1Ti+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KYLSHufY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 212AA2F49F1
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 04:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776657713; cv=none; b=nyHoi4l9+Do0u+b5jQm0WJtfaEnb3s7oA9C0ba8ukmlOTe9pn1WJJlYfIPX7Mjd+eaOtIL1ecxNVBj5LWwIW+fDwV1jJQ617TCimc0POAUIM/kzj0Lip6xDaHnQgB51AnPfewu7Kr9MbscHmyCJ5yOHDCYALv308wVbT6V4qHfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776657713; c=relaxed/simple;
	bh=n1XXq3Sj2kgWgkpZvXMGiXRLCpGWBn5viw8jwqinmSw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QLN6ZnaIMKoBv+fVLlve1lBfennaHSN2dBXg1nXreTzxqoM+HW2Ao3QZF49/aBrpQQ20i7tRHmu+of5YWh7R9xuJJ7pa+ECpDdHc/MksHxOJhh75YOprEggG/Tt+K9Mw//XxzTJS7eszGVfA3BaPli00UyoMMRygMsDoOplSqmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WMuM1Ti+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KYLSHufY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63K30fXK3371400
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 04:01:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=kwj4SJqKW0R6yOI9gTikppMqyML4lTNSnA8
	BGGeKyrY=; b=WMuM1Ti+rLF7OdC8y+9xkS8CrVjJK9il8IYoqR/s2QRKX6EQYOz
	VjzMGdjhKkL6K3cW5fp8S1RxvDS2nbQSdCaquPoVI44WeLoNrHDyrHbKKI/2X2zj
	scEU6cuuZe5QNvPD2GPMxLSV6wnqiKK7qd3NIh0WELV/wNnbm8/nz+RUt9tEUKgw
	qROZBuk6DPiF6Km3zh+j0VfG2MvEJODqIw7Fy/R0YYllyxjzTjwzZT4JUiSzuNhn
	OkYUoWo/V87CfXgQzY72g6J4NcPwi8ABOiIqhlAWHp1h09bEaR78howJFFEIPyzX
	wHq+dxHziFBuYOP4fygo+eQk5/y2Kki91FA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm2b73v7v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 04:01:50 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2ba8013a9e3so2546752eec.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Apr 2026 21:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776657710; x=1777262510; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kwj4SJqKW0R6yOI9gTikppMqyML4lTNSnA8BGGeKyrY=;
        b=KYLSHufYfwyHOc+/XH70H7rt1A8fkAFglnCxvNOd4+7xLeQu9A1KEaIc473UDqpPI2
         /2GW4TZU+OTd2AR7i4/wUdvqO+EpTMXv8ikoPTrSSk2gvruSemvNCe4uTuovib+5jy4s
         AmZrRWVhVdzxnYdOAaa3Q5lXvKnD1xa/ksJfsKpiOjWf1MqfM3pkNt33SvyqsCzQhnlR
         ja7YyLYOujofN8UqifMtcj4k1FmQGV+mBeWoWWzsqoBiOZGyWf5Iq7cJmsd/uYULP6W/
         FQpiJL5xr/o13UuslhH9TME6UbTl7Aje3uSM7dMG6PUIbYtqSXHTiz65uVWvVPG85RwD
         43Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776657710; x=1777262510;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kwj4SJqKW0R6yOI9gTikppMqyML4lTNSnA8BGGeKyrY=;
        b=eM1hvOvMk+xi5w7Jz7QRT4FBEXp1LG5Ad8Pb62YN2T59dc4G9tL1Ku11AexB20IINM
         qQ9MMF2PoiDGrnmTqWdzmVCJO8E4sKHEV0rgcovyYU62l5uwgTDpJBB1VMw3OJ08qNdW
         Pwe6omJliXdWBmgMxOY8/4ZE/ZpnEe+uTkWugTpb1T/ipByacwbFdBQ+KUyXVm0MBG1S
         vTa4sqDn+K2B4DjiNhxEZqijRIF380CVCt2D6otuCZ2K9l4Sp+ZlkKEkLW1/BbdDi/UY
         VMEkoHlyE3PJSkAdDPDX5Mp3o6yt8RLzmr8T9Ffw5rHQTh2580KmNyoSyBXT9XC8y6hz
         XxeQ==
X-Forwarded-Encrypted: i=1; AFNElJ/YV+JEJpdsl6yib0DP4u3kwATg1W+v6qOYz3d4qGNPlzYMp12I4U4BeXy7hou8PqA0NCnjqnSeEm+2nhef@vger.kernel.org
X-Gm-Message-State: AOJu0YxDj9e2R+w3sB2aaKXanOpXjlPpPY8tY0ESP6AH0kWspBOWitVT
	5TzmnAnOrTwIySgfPMiDcqORjmbNXc0+iCaJnudkVmwV+Bdz9iE5nZ3UxSvECYh3PJrXDJU6A8n
	j8akkvT6UE5T2/sI+0/dWmqxzXAwwWZdNg/3eE24OgHVRAIuPy35jgyuBnMIwlh3r52F+
X-Gm-Gg: AeBDietv3oBa3Li6UKJm1H62ivyJGJB72AIZt+OVTO1zge1bzi+Bi2+OBDkje5kvIET
	wZ79srVLx7ycBnLukvYlEz+QLa6Nc08cxv86/BmTheP314/2FPpKx6Xq9PQIONQ9pFuEnh0Qpf4
	52iPsDzCYCBulNOFjEGQS9Gq27zmOsDL+evWzZ3JKjkdYy/KeLrPMIj55x9k3GDfS5NaqkBv0mc
	w7kb7n8RxY9yb6LFIC78GZIVz+m5XFbs70jR5rWZQYyXN9pDg9vXBp8QaOOKXSCEcDwDPkRnrYY
	h50RoNDHWC3tKNC4BvIr0bjGQAz12SgLeHLbQTimRNrHZoU2IHl9jSyTViDhlyIssdTuzY/juuK
	oOFLKKdSdTQw7rDGj5xg8i7ANNkL3cpO8fJQc17KkdTgk1crlaxqvV0twPC6PUPvcHuysvFhAPN
	IPVLpFWSm6YWMra8Tx
X-Received: by 2002:a05:7300:ac8a:b0:2d9:bc8d:f62a with SMTP id 5a478bee46e88-2e47873aadbmr5692619eec.16.1776657709970;
        Sun, 19 Apr 2026 21:01:49 -0700 (PDT)
X-Received: by 2002:a05:7300:ac8a:b0:2d9:bc8d:f62a with SMTP id 5a478bee46e88-2e47873aadbmr5692603eec.16.1776657709422;
        Sun, 19 Apr 2026 21:01:49 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53ccd2564sm13067693eec.18.2026.04.19.21.01.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 21:01:49 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: mailbox: qcom-ipcc: Document Nord IPCC
Date: Mon, 20 Apr 2026 12:01:41 +0800
Message-ID: <20260420040141.1247612-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=KZridwYD c=1 sm=1 tr=0 ts=69e5a52f cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=fGUInmM-9dm275hkU_IA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDAzNCBTYWx0ZWRfX7pwvgmTWOne+
 cM0ZGElUIc+t5nQP4XrXU/oOB6n9d+pqnH4iMfJHeK3Yd8CaFB3X4epY40bIMqXBlV7HrhZWE83
 wVMkkMJquW9Xr1SKTRD20jB07hA5tpuZuLqVjCOwtEK13E8gK/X41hUhh64MXHtjYsPVHKIbH0F
 NT8QG/R4RhlAxGT/+UH2n7kvtuVoPUbc/UhsDT/xAyQTjDZS4z33VDR4AkV/fJ3Oaiu19wpJoP+
 6qu0qB9soITpcGYcbXAi3flJIrfgjjfqzVJ26hmWE9MpbbSxYGaedN/9CyLXO9Km6pfflK3I84e
 XJJa77DpWqznmaCQyRNX1CkC85GDsuxL+Jjbzn+ENZtt2UWMzk+zgZoJ+ND0gfhiz+4NbnsQrUE
 Cgx0dcY3LQUQUfSsiukQheuQZeC3DooXWWAyIM+1/sTMma0GiXHvoU6s3kNloyDXBCccNBmS3Y8
 C9cMB4CUzoq98jX5f0w==
X-Proofpoint-GUID: 527UvTcPJElwnwFK6mfOtPMocK9gZ21p
X-Proofpoint-ORIG-GUID: 527UvTcPJElwnwFK6mfOtPMocK9gZ21p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-19_07,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 spamscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200034
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-103653-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4647B426A74
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>

Document Inter-Processor Communication Controller on Qualcomm Nord SoC
with a fallback on qcom,ipcc.

Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml b/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
index f5c584cf2146..0a86230a2b18 100644
--- a/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
+++ b/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
@@ -28,6 +28,7 @@ properties:
           - qcom,glymur-ipcc
           - qcom,kaanapali-ipcc
           - qcom,milos-ipcc
+          - qcom,nord-ipcc
           - qcom,qcs8300-ipcc
           - qcom,qdu1000-ipcc
           - qcom,sa8255p-ipcc
-- 
2.43.0


