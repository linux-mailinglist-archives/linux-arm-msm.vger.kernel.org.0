Return-Path: <linux-arm-msm+bounces-109199-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EN6FBEASEGryTAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109199-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 10:22:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id AA2A95B0749
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 10:22:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3F024300E005
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 08:22:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 822CB3A75AE;
	Fri, 22 May 2026 08:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W+VoYilU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jUYEyprb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 249F83A783D
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 08:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779438130; cv=none; b=Fjw0dV4xUYOnCFLIJmw2zqOnknrE7+A2mBjIrPomfjYgYjaClc7xsjvu9m9NY2doDLlB6QoYfOvEGDgtTj6TvaetjFLeuI5X1IofnX75TlE59lsnZYQFxxia7srWMV3O9gmfhHT5ijT4Ta5xB7mpZp2pAxiGy71xVWzRVYXIa2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779438130; c=relaxed/simple;
	bh=X+JZGdmHTa+yImR9lFGIGG0JCJFj1fpBHVnJUsdElNQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CYEUP8u5mEbGqe7Y7Y7QQG3Ws8TaubkhGENQKz7Dz/ceCXvxx2js6W7lpo+oBoL6RdqjBkBqJLqjd3J/GecYGmfpkFqy3cFeLzYf0FCQNSSOrofLKvzRx2q4WsloXN3ND4UQ+/cpVcXjtxb1JcZiQH6at7Wnpt/W37g41PaPQ4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W+VoYilU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jUYEyprb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M4Al4S2765202
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 08:22:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/UiZEin/CWLczHVZ/BWfU1j5gZYKxKRp02pNX4UGT9g=; b=W+VoYilUErGeURA4
	zorey+mVaIAtbttEJ4qbdsI1jSsvzNwRwYL+eS6+2xhXTygb4QC3LwManhCnXlsj
	7LL5+QmsqX9JI92RsnoQ3NkP7+FILeKm64E3cBEhDYUv8o1kOgY0LG6Haz2+0yEN
	AtfZXK6a18g/eVzsLyCHYfLEGRNOvqFGRmaxEKSN61xmdLSa3ivM+mczg6CgRJj5
	WludiZ28IpHQl5gNH4qi+R1wltJqB775KslYlcudx6uTGSGEFGjDnhwkWNV82QGn
	PxFZvDFDA27GFPmy91gbbJgJGWsW1M1gkMu7LopFNMnCbS4dERb1Jj/kXZQXBs56
	KAavHQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ea3u7uxeq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 08:22:07 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82f7bec24fdso3618574b3a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 01:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779438127; x=1780042927; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/UiZEin/CWLczHVZ/BWfU1j5gZYKxKRp02pNX4UGT9g=;
        b=jUYEyprbagYfpRh7BqmuExdy88LKLUdSQQuxBJ4CRuWWUnHRNTCbROBf7dwOCzjXZ6
         Dird/8Ju1/KptjGJrPUFbXZXziXlCsq4AK+H2GPDLKqz5Le9sprjHsAG1LmePXc10Byt
         WVdhuU/M/mdz6Uj61CD83pTWG9mSsJhgGM0jWo4jOIU25IWc1r5CQOT75fn7NrpC077x
         74HFMzDSlOlYtx39LwUQBDa08jzLHT50FoA4J1SIepapf2ZFaY6ss8nQHbpxD5jQ/U71
         z0bcxlOji4r1gQ/r83fRKUXQ3S6g+yBp0NUQ5uAoBDuxsMJ6Tg98jn2OTQ2fROkBg0+k
         o9tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779438127; x=1780042927;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/UiZEin/CWLczHVZ/BWfU1j5gZYKxKRp02pNX4UGT9g=;
        b=IF63ukK6kf8eC5q2t2M1Gmh+ZnAtgl5QjWBYX5ZzLy4Gep/fq3e4yYsez9fRGmqMAZ
         L6VIYO7c9d0Qj5pzj3fCGRirNmXoUTkgsdJv/73jF8r/9A1MXnps/eJNygT+rYsPsRuT
         qonXosmBkzbmP4o5ZYSyvNyqoksU91LKLRJFig1XZKXNLQvpax4OaY5cJZJIAzWztcdt
         CpGbrgfa9+HFY/42yAvdtIL7UuDiwMfJwsAIu614kj++j8QJRwnt87sCk1lM+EGQztWG
         H0I/ZqbEBTJ0yWEgPuWByVf/732RYEbil8AmtTRX428Z5OQ8+5vdjEp282ktPDJ7mNs/
         GAeg==
X-Gm-Message-State: AOJu0Yy6aY4IQBm/pprO3lPAZhjmInG2quIbggsJC36cQX1eik6r6Zg8
	pHZShWZ3y1uEbzHxA3MLEa/3Y88P+T5kmXn6OXEBTvc7Q+jEUiHSTNapBzMDZl5yD9jaUNtE4Vs
	2A1xa6mOjBo9w1Sx3+xtxt/RfFOsmumXaGKMKrC3CsdK0KhQzIoY0jPgkvSxVC3+HU60=
X-Gm-Gg: Acq92OEKwnFk9TvxBv9oD/dkGiTEZWVgkarcoC6ajeyO/LM2Ke7+WFRLNjgNmnVoXpX
	hMc8A42ftk9xFcijUD/5OD57KOxu8vdJEMYJGhW9kN7/f/kpmHHkEIc0e2fH9Hh5E5wh9NdANf3
	fDKz84GFalGVbY52bnB9h8DyhXsnAbwMQll6UY7FBmq7h55US/7acUzEpRy4l2QdtWBSpxeiByz
	oYconOsiTGoqfH/4RIJScIcI07TMHYwezJLcoesq7W1njYhF9L8w8AUHQKdoS6TCPC2MxW4CwJg
	zr54g6kmKCnXzZQyKeds9J7b2FKbfPWHgM01i3PKZOsfnwlH7whKL6zq1CjaN1thEUqGnobQbwo
	TE2F1ciEHKpuaqJR8SVwbCligGoN55pe3bvh+7Ge0ObjZ0LuyadM=
X-Received: by 2002:a05:6a00:2d25:b0:835:3f51:72fb with SMTP id d2e1a72fcca58-8415f5aef23mr2812334b3a.12.1779438126999;
        Fri, 22 May 2026 01:22:06 -0700 (PDT)
X-Received: by 2002:a05:6a00:2d25:b0:835:3f51:72fb with SMTP id d2e1a72fcca58-8415f5aef23mr2812293b3a.12.1779438126382;
        Fri, 22 May 2026 01:22:06 -0700 (PDT)
Received: from hu-kotarake-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164ff3e00sm1431407b3a.54.2026.05.22.01.22.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 01:22:06 -0700 (PDT)
From: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Date: Fri, 22 May 2026 13:51:54 +0530
Subject: [PATCH v3 1/2] dt-bindings: power: qcom,rpmpd: document the Shikra
 RPM Power Domains
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-add_rpmpd_shikra-v3-1-632838e2428a@oss.qualcomm.com>
References: <20260522-add_rpmpd_shikra-v3-0-632838e2428a@oss.qualcomm.com>
In-Reply-To: <20260522-add_rpmpd_shikra-v3-0-632838e2428a@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        kamal.wadhwa@oss.qualcomm.com, jishnu.prakash@oss.qualcomm.com,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779438117; l=969;
 i=rakesh.kota@oss.qualcomm.com; s=20250919; h=from:subject:message-id;
 bh=X+JZGdmHTa+yImR9lFGIGG0JCJFj1fpBHVnJUsdElNQ=;
 b=BhOwWKcZXaj+bii894zWz2DgvnRh8vw3KUhq0PJSU0/K11QS72WJXCZS9TcVVOFvTiwoPsRZk
 1rwtcnPhDC1B6fK51EyBVuvyLvGSQlcaTZKTzKzZYOwDvq7IKna81Bo
X-Developer-Key: i=rakesh.kota@oss.qualcomm.com; a=ed25519;
 pk=dFhv9yPC8egZglsSLDMls08cOvZKZkG6QQn1a/ofwNU=
X-Authority-Analysis: v=2.4 cv=aIXAb79m c=1 sm=1 tr=0 ts=6a10122f cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=jkam1OttE9FODJyLpI0A:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: IEOZ9XFcEXLa7pktK4iRCmzgmCPYN-dI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDA4MSBTYWx0ZWRfX04JRkuTGITPW
 IOMdDxbacaeTFkopdZlZuz13wbMMhPl0Y05jEXO/pYe9S6iB40Stem1t6SuP6p8cttGt9eBTCiQ
 xQGMkhDeJR5IdXhnEaXhzrKdPJ+j1XINIL9/iLE72MDANVAeUTh5olGgjZewxk0GqBryuVUghTF
 fk52rIPTeX/uMPmxiy85vKnugfuYbYn3w8vWI+0DlKjQx6CaXKbBs87GqJPXAF+++dPwMM1Zhkm
 5fpMN9uUo7lDQD3eZDEoM9MAEmiZi6IK/j/sIqghls/DwQ6iywinWn9uTYyDDd65XCSUVv/fK5z
 0p+XcfK1OeAnJjdf1FO2+xGmW54HuEX50ZTtqSGbxnlHISvJ1HsofWIRvL0FJCYy45I0/40l6+9
 QHgEcTBqPDHOunbojphZ/Ytk/U9IRNMbPDzYrq1I3A+yBS8tdht8hxA1YLEWZf3db5tJTh4Fdik
 XRB5zflFamwZZcitJxw==
X-Proofpoint-ORIG-GUID: IEOZ9XFcEXLa7pktK4iRCmzgmCPYN-dI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220081
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-109199-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rakesh.kota@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: AA2A95B0749
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Document the RPM Power Domains on the Shikra Platform.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
---
Changes in v2:
 - Collected Reviewed-by tags.
---
 Documentation/devicetree/bindings/power/qcom,rpmpd.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
index 0bf1e13a99646c0325b03fc5b3297ebada21cdb6..1abb4b733fe79dfa267e953f48219093ad759330 100644
--- a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
+++ b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
@@ -55,6 +55,7 @@ properties:
           - qcom,sdx55-rpmhpd
           - qcom,sdx65-rpmhpd
           - qcom,sdx75-rpmhpd
+          - qcom,shikra-rpmpd
           - qcom,sm4450-rpmhpd
           - qcom,sm6115-rpmpd
           - qcom,sm6125-rpmpd

-- 
2.34.1


