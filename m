Return-Path: <linux-arm-msm+bounces-96469-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YBeFCPiRr2kragIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96469-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 04:37:28 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D3E244E26
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 04:37:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8C75530CF79F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 03:36:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56F4F3BA232;
	Tue, 10 Mar 2026 03:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HZUZunM7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gWLZWaFS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 254B03BA230
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 03:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773113798; cv=none; b=QvKwQpyXte0MVpGDDhBE5zpX/CEjuD9faDlV2tSKcZrwKYr4wSPMPLDjO0IgZVkbKWGD4CZXD4vByszh6cjo4cMSmSos2n8+2gTrNM55Ww+m5wtq5wGAH1oCkpkuK5WcSAsec8Vx8akKiuFrccBnCXQYMfnO2gX4sdXD5H1uGbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773113798; c=relaxed/simple;
	bh=Q7s0mqqKWFHHOrkLyxUjB2iWjZt9Rs9T9opL5GXt9Wg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=j819WRXWL7Tn0/VcjUO2UF4m5NeqyurRWd6hnN7d4uIxCLP1R7gE7xdQs46jIzL5frpV4/Tl/jKrTQpQV641q+owih6fo9TzTl09gyLj6yfhpoC5GQnP+aiFo2io5jV8t4UgpdIWAINwpm2YQDWrtlClvwDVyK/tqgxNP7vLUJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HZUZunM7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gWLZWaFS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A2EQ8r2460646
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 03:36:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=S4CmBsoTsTr
	95WUj0nXOAXNdt1TB+ciOmtpXIhXjCto=; b=HZUZunM758rsLHQi4T9oD84MLhx
	XCg79BdPKSCpH6DML1moURMllhs8WYxe0qt5RUIEZI48Wns5fyPUG1FTXydiVUUX
	wY1p88jwfyNlreYK2/VStFXLx3QwmX2PMXjRJmX4M4Ineo3JrBgfmE9mmwE1T3pz
	IrRYfyqNVX5yr3Euh//CkrwzwIozfkdbLvXxN8qqRiQxY1cxV0D+EOYZKvkrC9ER
	P/FjiZb7+7SaIDqVLuNPzjNj7+0sFGKAwWCLNJ5/Na8PvwDtWcrJ8pASET4DPfU5
	t2c7qlQPFdfbh+NWVNDsOEs8SqWebWLkGk+IK9GOeok8m0zpRWcKGPTKU+A==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csyv1adm2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 03:36:36 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35845fcf0f5so14335875a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 20:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773113796; x=1773718596; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S4CmBsoTsTr95WUj0nXOAXNdt1TB+ciOmtpXIhXjCto=;
        b=gWLZWaFSzLKE9JrvmOZJ4MDCVcGxMrEXZHklVM51Z+E2nB7Vy0mSMDuYh+Ou2n3VM5
         8fzSRBD4fTSevdCKpHi7cr8Hr7plC9KiGe0EEX3ijhUyUv3bjc+t11qTmLHyW7CIED4H
         9LB3yHblaHOl1bypj4G4Q1pPagbLrJCqifygNo/FemKqjyKOFTe8IRUWWnbozexjbXHP
         zkezG4GAyCV8yWZvajhHfb/7r2ISfrTBAjTxshGK4fXxc1iCcbO6CF6EVENx1MyFs2up
         mwu2fk8cd6AA0H0WzJqX5Fw9pDBXP8YcFI+0Qqcg6AYfNVGPxiOXMBK0I05s+v+lsqs7
         P09g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773113796; x=1773718596;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=S4CmBsoTsTr95WUj0nXOAXNdt1TB+ciOmtpXIhXjCto=;
        b=AwEKhTV/QvscjvPpPzb3mazSCzbTzNJRBEDP3/SxJrTj0xse34KdnVgWeeiCeuHffh
         s8dPm15nvMYgOF0B/IYXUukR3yyjSoXwXmkeXweI8TQw1cV6bpE5IIchK/ElbGwCQzJN
         JVasbJgUGkAmhT/JYwQarceWtI+MFLKvFkIfD5UIFeFeC1rIB9zDQ59l29Kctl+HMdkI
         W4QYgGcmRZ1AOTuaRgkdLisyber0Tx2NsBkjUGQVumdVkvIl4G7BmnKpdgIiuLmfH872
         sCQpZ46wwwdXnBv/nVm2Fg+0OWxu9fyU9kjikWBNyaWSNZMMwZwEOvsWt1v/97zL5qJM
         BwNQ==
X-Forwarded-Encrypted: i=1; AJvYcCUunPmmUokb5gQtDKvaeMSk9TOEG1KXbLot2WKVi4fPXKyFmqHZhIjW/sH3FTRxcn6KzsxYgVAA8g6olMS7@vger.kernel.org
X-Gm-Message-State: AOJu0YxXCABXbM1IeSncxQAGGAcVTUC1EU63JdDxYrUbICju/NnHbklc
	wMye/Qs7tQOFbniAjvbZ4xuryEi55mZUzQOjpqjTMkwV+bmgjA9KtIYza3q99cYOOgqfQdWZmag
	S6ob6t58pg6Nh+VemOe1fJxZJaalformfav4iz+KUdj55GrfFzbJiHRArKc3t9+bwmV9B
X-Gm-Gg: ATEYQzxipcOB5x7VwNOPoHAqmowsAw1ASP6VmFnFm2+l8p7LSA/8nwR+6EQ1QX6Fsdp
	SItJbneicXICAtBCYfYHwiBwgVv814MQVUi3hirZHQWTWQK4fI8Ssk+L6fD760OXN0UADbcRSQT
	+tnCSnq1Oz+IV27eVkaMlY5crp1nkgdl+2SzRQfF9wxben7A9AG+JfLOSCLAN8pq/ow/JX/4JWb
	msVSxnk73pURW4RPB8DX9+bpDqDxSguq1st9txk8SqbPuPWH3PlP1SPVkvE6QFpY7bqRVp/1aGo
	hPbW0mQwJi1SE5oILUab83j/WTkVXIOjqZoBbvBaDPEMwEmf3aunDmYNdj9m+KSndcKvqDhPJNJ
	cFNbV35pfU9wzNLz1ZobLo8LAhsU3ld01zPY+VzU2IoDmbVz6Iv+3QpiSpCpwJq7khI3ur4wQyp
	+tfc69fYDqZl7Oi1gHdptOQe23vtRjN1czjRPl
X-Received: by 2002:a17:90b:48c8:b0:354:7e46:4ab8 with SMTP id 98e67ed59e1d1-359f08125a7mr1738460a91.18.1773113795757;
        Mon, 09 Mar 2026 20:36:35 -0700 (PDT)
X-Received: by 2002:a17:90b:48c8:b0:354:7e46:4ab8 with SMTP id 98e67ed59e1d1-359f08125a7mr1738432a91.18.1773113795298;
        Mon, 09 Mar 2026 20:36:35 -0700 (PDT)
Received: from hu-sibis-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c739e182d72sm10272923a12.25.2026.03.09.20.36.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 20:36:34 -0700 (PDT)
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
To: robh@kernel.org, srini@kernel.org, amahesh@qti.qualcomm.com,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org
Cc: mathieu.poirier@linaro.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        mani@kernel.org
Subject: [PATCH V4 1/5] dt-bindings: remoteproc: qcom,sm8550-pas: Add Glymur ADSP
Date: Tue, 10 Mar 2026 09:06:13 +0530
Message-Id: <20260310033617.3108675-2-sibi.sankar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260310033617.3108675-1-sibi.sankar@oss.qualcomm.com>
References: <20260310033617.3108675-1-sibi.sankar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: JptxuCTU6VUToZZqBP7jpRdrhrXSXO_u
X-Proofpoint-ORIG-GUID: JptxuCTU6VUToZZqBP7jpRdrhrXSXO_u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDAyNSBTYWx0ZWRfXwZJRPuZ7yxm3
 nmvqmSGAV3KBPb/AyolafsdrDHWmYV/o08BnSjLxgNP+3d4/AgRYJ4AAOVjiW6Qqgiet1/JTwk3
 3dNcUqqeKQv6+OdqbJORASs6avh6L7WWrQLnXaiNgXytS8aMWLqS1s9NgAEdtl+ghucltHGPhBn
 r1oRKIevwt4oeDMQUIYlWsgGzkvlCB693HATAQsZVRLqhnTmHZGgEQtuBgG4Lo4Om9JSpn68fki
 yEmFpLkrIY8Sf1wDFThc02MXNz1P0LsDyHxCz39zGu9VKERLV+/gjTiQXreEC+fdR084NNvzrQI
 nHVaQO1A01G0x978EJfPQ6vtWgfaPkFUNJp49zorlNYysva3As76vpgP+Pbu/30o/Bu1I+4sDE0
 5vztktKnXghgtEebAFFqL5K3dhtnYw/ZB4HI5JX+Ed4xo9gS6UPUgrPi2MZAklNysoJBjgiNucM
 VszIacgaiQGVDlvTYPw==
X-Authority-Analysis: v=2.4 cv=Cuays34D c=1 sm=1 tr=0 ts=69af91c4 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=iOP-JMljhTESenzhlaoA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 spamscore=0 adultscore=0 priorityscore=1501
 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100025
X-Rspamd-Queue-Id: 97D3E244E26
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[sibi.sankar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96469-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Document compatible for Qualcomm Glymur ADSP PAS which is fully
compatible with Qualcomm Kaanapali ADSP PAS.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
---
 .../devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
index b117c82b057b..fb6e0b4f54e8 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
@@ -29,6 +29,7 @@ properties:
           - qcom,x1e80100-cdsp-pas
       - items:
           - enum:
+              - qcom,glymur-adsp-pas
               - qcom,kaanapali-adsp-pas
               - qcom,sm8750-adsp-pas
           - const: qcom,sm8550-adsp-pas
@@ -101,6 +102,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,glymur-adsp-pas
               - qcom,kaanapali-adsp-pas
               - qcom,kaanapali-cdsp-pas
               - qcom,sm8750-adsp-pas
-- 
2.34.1


