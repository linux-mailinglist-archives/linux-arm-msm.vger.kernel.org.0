Return-Path: <linux-arm-msm+bounces-104815-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CKdIAye172mlEAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104815-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 21:12:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A50B479205
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 21:12:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9C96C3035D4D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 19:06:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A5693EF0C0;
	Mon, 27 Apr 2026 19:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hUpRdZxb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A4boBoLm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CA803EF650
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 19:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777316791; cv=none; b=UOeEdoEiyCsLv0ed/1QeauvIave+ELOG3jzoeycVs/cqv/zsYMUoqzPt3mtwH0d3EKYIn3gpX0+UU101/rsjKvXG3Te5AaEdn1VzmpWaX4zwrBSdZY+E1o8yiao3v7/y8Dp00VlaDJrhvyg/fKI2Zly7pHcFon/NzfRhI8UV0oA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777316791; c=relaxed/simple;
	bh=5aNRN84OKFOh5IPvThdbtzj9Bgy0czm9fuZD8TrdrbM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C4UW4+nfYF1RXH87JsMXtHnY5RthXBQdbB1IE3tJOa3eob25Oq8PITQj5iFeEzrs9CJe+EZQ4x4QRnWwKuhhi6BJ/BGy+jdt25bz1UGoTi01d+/0VCQoDPlPfY1HKeP9SG++FMPVTqPz12aHuxlMZb6P4Yz0cPT6BQO8RQJYJBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hUpRdZxb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A4boBoLm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RDthNw241446
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 19:06:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Mt2hqVDHRpK
	IqINyb4FsXTJqc6aqWI5lx9jihlodcdk=; b=hUpRdZxbxMrirtnBLZe+srErpO8
	3ipw31vmkt8SLIsz18pmMFszlRZkOUCgG79iMw4cFkdI2v1bDB4n2GPH87pT1E+D
	mtiDGA0bDpyNJCbStTE7RhgbxrRwcgZKR8NW9wPex+jLAASl4M/UrKWup0Ab0jqL
	BwQDMxqPYc7rLdr2nQcHN4E2Rrv3RA/WMlur0/RIaw1slSNLAi59k54xoTRfcFT3
	9oP5N6GUaKB1/zWMw2YO1xUyocJ4uqV8khZfQCLaenF+XqGOr3jCBFnZ5gqRNsD+
	G/0iyrS7qN96o0JFOV529ZF/uUTmVJdC+UDvwEzcgQMVQcUwag6HfTyVyhA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt946s69j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 19:06:29 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-354bc535546so10823908a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 12:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777316788; x=1777921588; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mt2hqVDHRpKIqINyb4FsXTJqc6aqWI5lx9jihlodcdk=;
        b=A4boBoLmhrzdrGfx5AijcWXnM7nZxbscXbMGSnV/GC6G/y5BYvcgruY0FJZaYHwtTd
         9/eVJzTg05p1HqY/7JXwPbNyFm39UjmKRldvsieNZ5RWu6V9Ww9CfHu5tvyRswaXvA/D
         Gn17nTGRsuEJ0yBzaIdypXVQvQlYWx+h9nXGPIS/J4vktoN1QISXjHUtMWHSlMjHwgng
         65nKU/GdNCvdboJGP28Z1cwswt2ab+ZfcIrG7Wi1CrHklIOe+JngIfaKBOAwJA6VkC9h
         AdPwZn9t/d81TyN7CwgL4WuX8Su2JaUJfdRnpLC9Svak3hmAcizcFbNuFlFnvsVU5XlG
         qftQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777316788; x=1777921588;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Mt2hqVDHRpKIqINyb4FsXTJqc6aqWI5lx9jihlodcdk=;
        b=schmUAF38zZ1O3TeE/iiOq+5zaYEocgHYgdCZcb+UVpo+1aebMCiyJDkknKxXJDaRA
         XrmjxPyuBMlAnKuWKpypS3Zxy3oJ1K51XgpYv8wUVKSg/onzyvFMCZ6EiOWQ9Yt8VzdO
         IJpbYXgocmwvMD8exIul4hAo2dX+H7kySJ4iIJkY7npBAdZsBxM3iJ7NbVFZH+8tcQ0M
         goDCtQc44vQdnGwAd5w+i529NKp6rvT8jm3euUzXOBBM+oQUiL3AJmUnSZpLV2b/GCif
         rh9mlTjL/CthujqmsleA2r5dydEtAQ3t+qodjpK2egyfx3Wt4k3U6/x1xE38DG31R9Yb
         8XCg==
X-Gm-Message-State: AOJu0Yy27QImhMKhVzY4SX94BVF3U+NFAd+BQY3yUYULHFYIDc2GfBZY
	SoO7avb258seyDwhBgpa3EB77Vp/CKpua+0NSIDJRwt7J2lbAyc/OrG9VIvIE+Q0ZWgktzxkxrD
	wfcvDgCE4HB9I5lh38X9xEs4toOIxvsZm0JE7NMyQy/9bjPOC8ntXrXMpTmpM5zUvyUQpuNVq9Q
	X4
X-Gm-Gg: AeBDieuvQbyoOJE2tYKEwiyT5kb60U8oHymgoGy5FIsE4sP7RV3Wm0T1NlMXgSSJPk5
	8FEE4BmyYEI4S2dKjbtmmjM9Sbjb46/BEWJpXzRisjHocpAZfNUf7HiDv3T3VKtxiPAwQU2Jd+t
	5uWZwNhACRqTOZM/eHbGQADDtLWAUk0/7lFoyQYqKa5MK95fdJBoj2QckpLY1lhewEvDhOnCKh5
	v/z1piLMLm9TIWJTuxE9XDiyeN13Fa+u3YbvIw6pLmYIw7avzKuIuHNl4qndGFPLpVIgWGx2XJe
	do+CAPLwIoYlrmTCwXVJ1aBLfSyoF3h/1/MO6pxsGCiixZxWjy3/WDW0q9MM3ggWV9wDqjMbMWD
	M6+X9b0WeNE1jpXAyP/CaRld6jrd6EAh8I3zGoF8U+1ivblL9Zv4sf6UlOXY=
X-Received: by 2002:a17:90a:e7cd:b0:35f:bb33:d727 with SMTP id 98e67ed59e1d1-36490cb851bmr284246a91.20.1777316787984;
        Mon, 27 Apr 2026 12:06:27 -0700 (PDT)
X-Received: by 2002:a17:90a:e7cd:b0:35f:bb33:d727 with SMTP id 98e67ed59e1d1-36490cb851bmr284227a91.20.1777316787443;
        Mon, 27 Apr 2026 12:06:27 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36490aa527bsm87306a91.3.2026.04.27.12.06.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 12:06:27 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 2/2] dt-bindings: remoteproc: qcom,sm8550-pas: Add Hawi CDSP compatible
Date: Tue, 28 Apr 2026 00:36:14 +0530
Message-ID: <20260427190614.3679937-2-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260427190614.3679937-1-mukesh.ojha@oss.qualcomm.com>
References: <20260427190614.3679937-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=YcWNIQRf c=1 sm=1 tr=0 ts=69efb3b5 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=0pp5giOrAzlh4QsvPMEA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: yJuuLTMHYDj8C6UegPNfJvntsm7Dtmld
X-Proofpoint-ORIG-GUID: yJuuLTMHYDj8C6UegPNfJvntsm7Dtmld
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDIwNCBTYWx0ZWRfX1EGMBnd5bmjp
 RLHj1jV1JpliVaPErowbOs+thMoTXkcUsjtLSaPUC/K+oIaL/yoybBEDIYyHp4jOPDQq6zbx3Nd
 cVMWugltbAXlJlxerlCZOwQB3k+fa0a/yolHhhRiI3vgtjDTEVXRlUpSFIcfUcLi9gKL88jdFd8
 FcyDRAkVPLZ6njN/Mnt307PkNmzGJtGVCdCjutTbv15I4A0PvGkdNXlC6t+wMV8sdNi4nDuRFqX
 h4ZRG7lkXlrr5LMsTA71w3DHcxlEaeE7UlrardOSgjF9D0p32PluKAYsfpQKdxxQdnzvJ2HOL7M
 LciLMwJxep8V4/gGGlLyxclE5rKRuyNfR6kYhKfJq8LeX6Im/1xPLk9he8D9NDdea0ogOTf4aMb
 S4Ptr154tssV2vlki/JdTlOkPOOl2xx61CgI83C76yYHAigL6PX/NfgXTyutlySVd66/FYlbGSV
 vrVzTIl/UzoNNAt+9rA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 spamscore=0 malwarescore=0
 adultscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604270204
X-Rspamd-Queue-Id: 5A50B479205
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TAGGED_FROM(0.00)[bounces-104815-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]

Document compatible string for the CDSP Peripheral Authentication
Service on the Hawi SoC, which is compatible with the Qualcomm SM8550
SoC except for the one additional interrupt ("shutdown-ack") and
similar to the Qualcomm Kaanapali SoC, "global_sync_mem" is not
managed by the kernel so it remains unlisted.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 .../devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
index 161e9b55cb3e..9f30a38152a3 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
@@ -37,6 +37,7 @@ properties:
       - items:
           - enum:
               - qcom,glymur-cdsp-pas
+              - qcom,hawi-cdsp-pas
               - qcom,kaanapali-cdsp-pas
           - const: qcom,sm8550-cdsp-pas
       - items:
@@ -106,6 +107,7 @@ allOf:
               - qcom,glymur-adsp-pas
               - qcom,glymur-cdsp-pas
               - qcom,hawi-adsp-pas
+              - qcom,hawi-cdsp-pas
               - qcom,kaanapali-adsp-pas
               - qcom,kaanapali-cdsp-pas
               - qcom,sm8750-adsp-pas
-- 
2.53.0


