Return-Path: <linux-arm-msm+bounces-90072-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UFvrNg44cWnKfQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90072-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 21:33:18 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FA0E5D4E0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 21:33:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 1C81878BEDE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 18:42:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 253CC41C2E0;
	Wed, 21 Jan 2026 18:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XbvDpOU8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SWTuXGLi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2914037F0FA
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 18:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769020578; cv=none; b=hPoN5USzB+PVA6skAvvG53ydFDvkfAf50S65FVZBsjf1fBHrwZdJMrbJOvvDyeqs5LGVV42zyZxFSeK3K56oq+0P6c7WTbES6zlj73Y8PGGbVrJQebj+q1P+G4Ot5c43gKTWO/EMosLvaYg9piNjd944GKJzy/6V2LXnFtQh0ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769020578; c=relaxed/simple;
	bh=ZJDwIAd9ubN0TqTyRgpQBA5ygn+ZkTIIsUJvbfJB7Mc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OrEx/PBSXRz8MGaAyBtH2LhsCRLKUfFzQi+fvDZC80/J4CG2WL4V0YWgG4k+6y4PuABU+1nWZk17Qlm5kS7taPI2b8/VAx0E/ays9MDvDqK37es5AaQuUwbBA7I3bAyW9vI+dbcrutRleFKSgLr6y9oPr6Ja+UHsvdGN2RiKdUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XbvDpOU8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SWTuXGLi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60LDWvwY2727204
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 18:36:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qdASJwP++iHL0ezr6b9geVxlqJ0ibz7Ub3TyWiBaIqs=; b=XbvDpOU86n5wBPID
	dmE6Rbt4D7ogOT1+ItYrqi/CZAPYAt75c6zD0PR3T2HO5Dj0g3GFJhZkX4BNght1
	VnnferdgfJZHffaV5qf8kNFi+4SBFB8IwZec2T13QelFYlMK6KLJ28bRjzOm6lpp
	/AAxCcdrT/lqOB1CcvBdoD4yV5ZJXGyayywrNnJTI9TUMTOuu7/MmsZ2cHFrecvI
	nmAdv/irzAkJXYA/SEpf3BTjWss2Ojmwb0tILAo9IF5lQAHIhRS96UEvfnMeyetu
	/UGft5Thwtj9bpoiinMhGYn3xjECBRTTRz9q6UJdE95Aovht50qGypAC4za2fDts
	lLIcOw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4btysfs1jt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 18:36:14 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-29f2381ea85so2964055ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 10:36:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769020574; x=1769625374; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qdASJwP++iHL0ezr6b9geVxlqJ0ibz7Ub3TyWiBaIqs=;
        b=SWTuXGLiUdb/LSuZNOlSBWVJBkJdY0k7VHfrM4KAlOaAYImkgdI0Xts9n0bst2d2jM
         95IBQiTDpPxTdkUAsP/cu/obUwyetqmSv2v+ps3uC4inT0pa1pk0AwVBFPmGyoNWhdEW
         xyZSkjKTUlPTIHsC1AUGPQHGT/91bLc+GpodCqV6Kl7Vkc3bDM/H0uk67ic1fP8QwHFW
         hk1v9WK+EAkb4uy2ojmaJpquAi3nnXRBEpP/nzmTo7b5Rh8FOaZrGBr326zyG2ohWeAK
         R8fpicmSsuZZrvCWwrBMRF/EP7eBSSkUUbVsFi++DcRJP4YicXVS1Fz+CKwfRY14YltJ
         vtBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769020574; x=1769625374;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qdASJwP++iHL0ezr6b9geVxlqJ0ibz7Ub3TyWiBaIqs=;
        b=tt9CreIzjOlQw9hxHd6mJRWduSZYzFIjadlZbzTsWbe8lcpdKi1zvbku7hq8oEZRtf
         VAdxFa0bSkTPbupgBP9+taZEGunQjp5fZNbyP+1aj/fuNPawr6kiyr3HaJS3fitl5qdo
         eAadUigpiser2opd88XGzaeOSNiXyu+Yruc0iesXCFink6D9WtJ/SWnRfsprAWt22gO6
         68dBE0xvLV1ryZvLWd5Aycz1qn6Vns043CPFO4XnTH+dNUX3qcSjbekcy5NzqzpqbLVZ
         m6XZoI55oaTM7NzN2hAWi6ly1EvatFfiLK6CarlUTr+pGTirQLDhdXwjCcUbB8P5yvPw
         HIOQ==
X-Gm-Message-State: AOJu0YxtBRdBGYLdtlr8y/xmrahx9BxrRo7N6J1LjM+i3B3QI0ztdQHn
	2RBN00CgCFP/M5s6muksDXq1+aj0m/c6RlonTF9PISkZGxaSjftcBEzwNajhgLQ6DpY05a1Uftw
	RmZeige4QyjY5SBOFH5VHX7kC7PR+fKsIycm4nzXGxFnw/qyuMsZGzILEXXxQ0JaLH1M8
X-Gm-Gg: AZuq6aItb+7HSr82dQDJqZ3ZMx0F6ecZv95gaNCGiIccqzPRTOpv9Wi6zsz0f2OQNZa
	HbfLwJ5P0PbGmgs4gYZYse2cBjh8a756b2Ehw4vcUiFtMmhzkLB/12UrOfxKjS+d2Pq7F3wWaEC
	g6JNmJSy0mZrvu2oLqf1o2ESF3JiRi6yMy9in6XWDqmPMEXa8DuVXJJw3uQGQwf9ro/bgVHj2vC
	QEnoyjK0C/yvVU8qBkye5pRi5dtktfqUgdK/EOBJsMFgc1ZLV+zbhEBvo5Mc7pN1kOklumVlDkB
	Eh/PbXk4s3+QYETA70G4DeYeu1V3b9oQxTHwf4VtS/m3zw3MhVqNJnXewjvje60w9AjiwxQLDvl
	J9llZA3G9CWlPgC+Pl8GMTESedbQiyvlpKXphC5aqAMTm1F4pUQ9xDF3hBYVpSOHSAg5jwiKxbd
	F7IskygTPdWY0A8Lfx5P6fiy+dY0+qSQ==
X-Received: by 2002:a17:902:f545:b0:29d:7a96:7ba1 with SMTP id d9443c01a7336-2a718918720mr173664855ad.46.1769020573884;
        Wed, 21 Jan 2026 10:36:13 -0800 (PST)
X-Received: by 2002:a17:902:f545:b0:29d:7a96:7ba1 with SMTP id d9443c01a7336-2a718918720mr173664595ad.46.1769020573365;
        Wed, 21 Jan 2026 10:36:13 -0800 (PST)
Received: from hu-pankpati-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7190eeefasm159551305ad.43.2026.01.21.10.36.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 10:36:12 -0800 (PST)
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Date: Thu, 22 Jan 2026 00:05:11 +0530
Subject: [PATCH v5 1/4] dt-bindings: arm: qcom: Document Glymur SoC and
 board
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260122-upstream_v3_glymur_introduction-v5-1-8ba76c354e9a@oss.qualcomm.com>
References: <20260122-upstream_v3_glymur_introduction-v5-0-8ba76c354e9a@oss.qualcomm.com>
In-Reply-To: <20260122-upstream_v3_glymur_introduction-v5-0-8ba76c354e9a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769020565; l=866;
 i=pankaj.patil@oss.qualcomm.com; s=20251121; h=from:subject:message-id;
 bh=ZJDwIAd9ubN0TqTyRgpQBA5ygn+ZkTIIsUJvbfJB7Mc=;
 b=pNk3qujcsPoVvA2gkikIEIOwgJya+fZutB9uLnjSpjovuKSH8X2UvSVwJ1rBnjdDpbFXxDO1o
 alV4A7fhNjoDIckVryy1hq/05RWquWya7N/f3t0pLLl+iZ56EoU2osh
X-Developer-Key: i=pankaj.patil@oss.qualcomm.com; a=ed25519;
 pk=pWpEq/tlX6TaKH1UQolvxjRD+Vdib/sEkb8bH8AL6gc=
X-Authority-Analysis: v=2.4 cv=N8Ik1m9B c=1 sm=1 tr=0 ts=69711c9e cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=5v-pcvSp8lN47LZtJicA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: k2t4zHQ-Dh9xsP1fYksyUO4o_TEVQkuN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDE1NSBTYWx0ZWRfX1kXLdi/VeWz6
 fRhtm1hyXx2xgmOR5HIhaPRaDfGApvJV/khih1rWNbyghyxZeVzBV5NNRAREYvWm7g+gl75aGmt
 nU0sdDhDsWVDilTdM0ej8GqickeqclgLv0wYNb7FkiUzd8vEZK4YxFK1+YeyNA4EgBlcb7BcrVB
 xCXoYLgIKZI1UsLHCNeIKkfhSnrncEKG9ODlcKzXvwBHyXauiYxbdRJoPehN6MEFgQmzdASXRTx
 x5r6FW+1esQPQauqqMrXwg4RLiNhdBx1HuLZRmF92TvV5qvEXj3FVTD0ZzXYo2JltusLxrnqPWA
 QLUFsNEHnqhbmay6C5toaCaA6nHjyukyPNlcpI5tawKqKpgQkoxN6lEjflEEPcrRfzbVRfNd3ds
 87ETD73qdNQgBSGDJkkLr9130e7QKM3wgIUqFkd0WUBsCrUDVu8G5OkcqkVOsSL2BHwRLgpFi5U
 SGUEfbbYvImSpyHrtMg==
X-Proofpoint-ORIG-GUID: k2t4zHQ-Dh9xsP1fYksyUO4o_TEVQkuN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_03,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 malwarescore=0 adultscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601210155
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-90072-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pankaj.patil@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8FA0E5D4E0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Document Glymur SoC bindings and Compute Reference Device
(CRD) board id

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index d48c625d3fc4..5be53b50f5ad 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -66,6 +66,11 @@ properties:
               - fairphone,fp6
           - const: qcom,milos
 
+      - items:
+          - enum:
+              - qcom,glymur-crd
+          - const: qcom,glymur
+
       - items:
           - enum:
               - microsoft,dempsey

-- 
2.34.1


