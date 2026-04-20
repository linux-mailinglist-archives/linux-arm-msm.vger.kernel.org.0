Return-Path: <linux-arm-msm+bounces-103645-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6El2G4eP5WlNlgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103645-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 04:29:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B63AE426471
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 04:29:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DAC933064898
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 02:26:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 169C03783CA;
	Mon, 20 Apr 2026 02:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wm5+tB5w";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LHi5z+mx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4515D377ED9
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 02:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776651982; cv=none; b=jYPh/3z1M2Jt442TpZlfvbTJIO4qyzi/g0FVtWz2aLFYIhfpGMbfHGM75myH4Ovz2HBX7/TCepDRep47rauCHH845rAQ1Hyq+SgcHgKSVLV86BUkwW3I1FBPFyj3XotxKz1Ul5r453oXs979KfNC/kdaIMONdwCK0oAMRcsF8FM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776651982; c=relaxed/simple;
	bh=/5a1m6I6NfJxXWkBlWbrgm5EJvWmpe+5B0+24yFFvY0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J6M2bHuVI0IkLuzfjyU4frSjY7fwKOUjFlk6T8NyJsF36WzStrxy3stLS6uXhf4uzJxOZl2VdyTRhlEIRVmmOPwxt8s26MsYI2RL9ONL/wYxapbU22WGHLZbSW6khFNWtCo0z1e8q5lw+cvtVnRwxDeqjsgC0q6NpsRQM+U3Atw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wm5+tB5w; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LHi5z+mx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63JJEbRR489719
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 02:26:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V6EfKChOv/S9Rl3s3ulBfu3o6W1NQgEPPHlL6OVVk00=; b=Wm5+tB5wBGE3VMCO
	dqSFmNN7z7kmyt+AtwWxxozWliGxJKgOm/6wbJBRdBDCMLzWhM4Eu2YLXJt3rHmJ
	R7XTHc7Joq/rWiD0SpIzVocI4Z5J8tiPyjAr06Q+ChieDyJzn/+yJsHldpgiDlIH
	lve/bhs1fkWCBvoFPtDxyX67snP5oG5FQwjqt2ac2upm+hzaLFIFH34uRMsJOj9l
	4yBZI/Ob9AUgIsQe3zA3M72iwv+p7MJwcAI6DZPckS2LqcoAgzEhv6UGJr5w3/nn
	JmJOr8Eij/Y/m/UeM8RuHGcY5mfhGI7P31Y9a358WHuFBXiHXECG9SJhs6Yr9KJP
	mRdmSw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm1hx3qfj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 02:26:18 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2e60238adb1so1232639eec.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Apr 2026 19:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776651977; x=1777256777; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V6EfKChOv/S9Rl3s3ulBfu3o6W1NQgEPPHlL6OVVk00=;
        b=LHi5z+mxizhfE4FFJxzc186HfDaTGZzMCvmKqaNOIPx3Z9k42ipk8O6EGirw2IshHf
         5UKSbIdaC1EWPlwj5qt4fpKbDV+JuD8fLz+ETbJnQ7AZcbOJaLe5f4Ib/Oe8DGuy1QYq
         LntXmi1poIjAjMl2iXNNXBzCgUwAc2aF54sTtfsHy607uVSuh/nijQq4zGJI22rOyqHM
         Ju7VOlHhki8i2A6ZhaS2koP+d/4v2bqLSLhjlkVEVpsGczUXorZMoss349CMRjQs0y1l
         OMZVAYZiDVWHY01Us1DBmRNIdXyxMgMUCvnvU3z4hOz/8psaUDH7AWOuIpGDWQZSXuHL
         6t4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776651977; x=1777256777;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=V6EfKChOv/S9Rl3s3ulBfu3o6W1NQgEPPHlL6OVVk00=;
        b=JvHPh3sX2vFFgZpu8SiBjS8feqYVtL+ryqkbiJd2TbLiwS2bwWFlgBH7qIjx01n/y1
         t2yCs3vKkfCuYXJKeP15L/ljM+HvZWHxJ3ZVBvBFqzvbtshjWN47TPpQVI+eKxYyXQ/l
         7F7+nXZ3P038BP8JRsyqF7YHshBYg6uSlpMO36p6GvJFbTBDKxHO/8JnUx8BaxWIbAXt
         l62ZFwEIi+j6N5bgH8YnMqn0Rw2HbBoQLJyAJguIJLeVgaKh7GZAMeUhFh5HBwboec7l
         FpZUqzlHsSmpMJAryQPoXCXndhYRzrXqVQnsVrz1ynyqDItyIdf37ouwdaJASlKc+8ka
         P2Yg==
X-Forwarded-Encrypted: i=1; AFNElJ9G3Da+puTosBeZv1bWDRdkpTJDJVlJywTpsE2ZKB2kDq9B5Y1FPFkgc6DRyQLreRK42GNReGziwWe4NiTW@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9BIkHwsUg1NYM2IV6gIhpg7Zuw+PR3hiVWahSWxiyQeAiGV7E
	d6sJWGhIjyCBsIuImS6PhNEDs4HAzC0gMY3Jty+/Vsk+YiDmSbpmoke5V2CyeSs12VdEgGLG6Dh
	aIgEBwfrmtfR+MlShL6gf0fCCvBYFlBN6wLvdWJMANKzts3mdMtU+5n6/iAvrmKrPQ53q
X-Gm-Gg: AeBDieseL8KCgGAPWNldCjCD5P0ho5BvpBoR10aVap8PBVC9rP85vnB7cFirnduxmLy
	IG6X0UPmWnRb0N+V3EbJwaC1kTbSjJ4KnjNdbFbNu0sHglrxdHZpieblbW3ftouBJN40d3xLIeC
	6VJn49Vz5YaibUFCYi5S+WnWJrZSOE9RGCkPMfTeXJPZLM/qsqJznDOGLgKbP7mrqEj10/PlU2o
	ZEJSr9qLpm3F2cHN3n0im+f8WURa/7LawquoNx+52oPi3+88axfBKbk7HGqRoTur6I6bFfdOoth
	fJojCfb1cPcGSyTHWeSVXjZKhR2mN75hW0SXIPelnNudShIpoulD7mp5dbGlUZuMS6071r7lxs8
	6MAkXwaGPgnIOPP3rOZyxKFfAIFrMDtupWQQGMLgB52bbSVU5GKNISgcSKEeT5H/0mkWZlqzb2V
	Fbo577rQln
X-Received: by 2002:a05:7300:748f:b0:2cc:600d:2ffa with SMTP id 5a478bee46e88-2e4788392c3mr5384302eec.16.1776651977091;
        Sun, 19 Apr 2026 19:26:17 -0700 (PDT)
X-Received: by 2002:a05:7300:748f:b0:2cc:600d:2ffa with SMTP id 5a478bee46e88-2e4788392c3mr5384282eec.16.1776651976580;
        Sun, 19 Apr 2026 19:26:16 -0700 (PDT)
Received: from hu-fenglinw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53a4a8018sm15299023eec.8.2026.04.19.19.26.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 19:26:16 -0700 (PDT)
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Date: Sun, 19 Apr 2026 19:25:52 -0700
Subject: [PATCH v3 1/2] dt-bindings: spmi: glymur-spmi-pmic-arb: Add
 compatible for Qualcomm Hawi SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260419-hawi-spmi-v3-1-b04ee909cb87@oss.qualcomm.com>
References: <20260419-hawi-spmi-v3-0-b04ee909cb87@oss.qualcomm.com>
In-Reply-To: <20260419-hawi-spmi-v3-0-b04ee909cb87@oss.qualcomm.com>
To: Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        David Collins <david.collins@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, kernel@oss.qualcomm.com,
        Fenglin Wu <fenglin.wu@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-17187
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776651974; l=1247;
 i=fenglin.wu@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=/5a1m6I6NfJxXWkBlWbrgm5EJvWmpe+5B0+24yFFvY0=;
 b=Aed8aqzAbb2QzSosTdomq12q1XJ2seUrCT/4G+qah4Fuxvl/JjOWjVxxVbPZovIMdLRYbF1Ut
 tFwScTjOghZCv3a1Eo4Q3BnIvxDyS8ctjgvjgerHpeRqbEYjJXe2Sdv
X-Developer-Key: i=fenglin.wu@oss.qualcomm.com; a=ed25519;
 pk=hJdt3E7o54lql+miD2GaxwF74cDyhgNwMbmFOZ46bRU=
X-Proofpoint-ORIG-GUID: lyRYGQmlqnDOShidWPKBcLQEHjfDahA2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDAyMSBTYWx0ZWRfX+yE9SChFSvNb
 EIHQOJ13CeO2lrBYlznA61HhEK30XakuvPh1ebA51KpmHax/+nhsbUhQ/dS5+EGxwLN6tq1+VeS
 29fnuPT8YtrQL/FjCe341zDd2HYZsPYf4WJJgeRvp/163G6VHJpGyLpCgK6XExeAr8QpyTs0nrH
 t4lquf5VQM4acc+AQQCcoK6VFcIVjGXXXqTujChQ6WawPvOZWcNW+mpIh73mutR7AMdyRx4TF54
 1tA3HkQ0jskx2RF2V9npyZkPDcLy7frtZq1MO1i4lzBTOmcQxMn+vDU/QV+Ivym1uZf2zdTEkvF
 GO49DK8gEhHjRLqo+yq2bQ6pkfQmTzPygmbxtyCp9OyYxBnO+oo19VmLO6V9tTcCcDI0hAdkzOD
 3y0M94ua7m1wMcibLWR5B/vd+3BulNMwRw4EAmTEpJndJkFk1HGCNa/WfG+bI2Lw37WnsRiaUDl
 9ZRYh6dTATyfXhABQBQ==
X-Proofpoint-GUID: lyRYGQmlqnDOShidWPKBcLQEHjfDahA2
X-Authority-Analysis: v=2.4 cv=RoX16imK c=1 sm=1 tr=0 ts=69e58eca cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=PsuS8QLcD5ISLKS92A8A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-19_07,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 spamscore=0 phishscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604200021
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-103645-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fenglin.wu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B63AE426471
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The PMIC arbiter in the Qualcomm Hawi SoC is version v8.5, which
introduces parity and CRC checks for data received from the PMIC,
as well as NACK checks for command sequences except for read.
All other features in PMIC arbiter remain the same as the one in
the Qualcomm Glymur SoC, with the only differences being some
additional error status checks.

Therefore, add a string for "qcom,hawi-spmi-pmic-arb" as a compatible
entry for "qcom,glymur-spmi-pmic-arb".

Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/spmi/qcom,glymur-spmi-pmic-arb.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/spmi/qcom,glymur-spmi-pmic-arb.yaml b/Documentation/devicetree/bindings/spmi/qcom,glymur-spmi-pmic-arb.yaml
index 3b5005b96c6d..1593a1183a36 100644
--- a/Documentation/devicetree/bindings/spmi/qcom,glymur-spmi-pmic-arb.yaml
+++ b/Documentation/devicetree/bindings/spmi/qcom,glymur-spmi-pmic-arb.yaml
@@ -25,6 +25,7 @@ properties:
     oneOf:
       - items:
           - enum:
+              - qcom,hawi-spmi-pmic-arb
               - qcom,kaanapali-spmi-pmic-arb
           - const: qcom,glymur-spmi-pmic-arb
       - enum:

-- 
2.43.0


