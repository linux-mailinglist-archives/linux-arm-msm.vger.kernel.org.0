Return-Path: <linux-arm-msm+bounces-97450-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IKwMLJT+s2mWewAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97450-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 13:09:56 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 180B7282BCB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 13:09:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1D97431D88AE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 12:08:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB5B6390CBC;
	Fri, 13 Mar 2026 12:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U46QA9vv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PQSVGDK1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8A35310620
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 12:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773403728; cv=none; b=UtX9nVjRAj7Fp0Ew/vdtCvp4RdQtpoyOJieKJ9jz/ZGKml0A4S4LXXGMNu025RcBMwHCSSIp1ZapWOwRVF0XJq68Cs0nZBfeyf5GZHM8vrpb3CphbSdY1jjesYrMhoSNSU9JdzcL+rrDubzB1lYALx/QCFxMdIrsYjds3ZVVEQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773403728; c=relaxed/simple;
	bh=AGI1qt+J+7Qs31p5UHAsEWA+8jjp8zQwwy82JnSF4qk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dYX2OAZ9bPJytPa4ZlDbVycnbNSyjjYlE5Vsz8tF9yQ3AxOE9ZWLrJj3N9zpu49smGWI4h/NltOCw9QiKtvN6aXLi2VjHm/NA585MeMmogzIiDIIMEHFBE1HolZuuoIp5EBXR0eHl/aoCQSNnqF1d17XTpFuF2Fob/Cg5X6Xrpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U46QA9vv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PQSVGDK1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62DAsIrC526535
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 12:08:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=RWK211jG41Q
	SnlsskvL2jGr76sZdiXtZyotsC2UXfIo=; b=U46QA9vvomxNe2DWJaNI6jnPKM9
	JeYasePFDnTZM3OmzT6sn83YA1ijbCj6WYXOlu6mlyC0K7tyMmbQerbwcnuO1kXa
	owuV8QEvl634Vz+YeuWSd+4Tl5IywPys4kJ3giCA56AvynkqurfqSv/p3NCXm4N+
	YONaIWMHZGyeU7Sj9NbBKjDqKNl5hEx9JSKjqpPBXmRoYRD7pAq9nfXBF8E4SXQt
	aaYHPVJ+3nawbjTNjw35bNx3NFieTpKVav0ndVI3YJkbPN+mZylhe503bW2SwxDP
	I1osSFq2huckyoHi+bI1aAhHX2LL4fq4JptJbMCH+UQuKEhXY+MzX+B5lrw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvh84r671-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 12:08:45 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3594620fe97so14099028a91.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 05:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773403725; x=1774008525; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RWK211jG41QSnlsskvL2jGr76sZdiXtZyotsC2UXfIo=;
        b=PQSVGDK1cMKl2Z6PpWUMsAaV7i21UHofbYjN9Nm+749dREbXoheHziJDWUr0yLyrp5
         mCua+Tl7sVwYmFyzu8kb0MbRN5Z4EWm+KjQG9sgc9xW3rXou2/ZxebLv1bPuhNaCgsRY
         3rTltDKe/2LgOqHUp0+LUZiJWwwBEFUGnPE6byiLzGdWRWqSsbMcJa/DX9Em2GCIqQnz
         UY/RWwTybdP5rgWanoazhAdFEY0mCHArt0zLO1wNQoyQsrTMRCTnRbrgeSCbYjk8hTxi
         ON7mz7OV7hgjBNWanrukvxMCkBcYcRy5Kwf/Ewxe2G/RPowrZlLF4s1P7nRAXWrTO+D/
         +bxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773403725; x=1774008525;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RWK211jG41QSnlsskvL2jGr76sZdiXtZyotsC2UXfIo=;
        b=clctiy5FjSjmFCv54anEqopEhAtueuJthJ/BiGNxrXC+Biz4d/3ExmEiEEqsbYUb11
         MYG/TJP6/fS6jbQcGV+FlMksQsOaDlCHa+e4c/GtGm3pu74m6ZAR3+RRitFli3GJFi0A
         V/KOyNGATSpWlLeB5lWINfBla7m6SY01K5ykqd5dT2A1+2P63L3NI2RZgCJB/Cx0lG5d
         QjDp00jD1nm39fYZ5jHTI1O+uRZ3KEKLq3po1oFJFoUhsmDUZrJtAzBjD/54GLc3Eqsq
         2IU0GY9zoD8pAGMJAsZ7p3xaotrVMwySj55SAr/nURCiY6Z1OUgiqaFJyqW96AC0aUuU
         MFRQ==
X-Forwarded-Encrypted: i=1; AJvYcCXFhoLjpNvhpz+8MtD+KZXWnQ7anzoBagg3DZNt8c4jygV1hfEwgN81SS/eJd6FKEo52zExahsLP5LWAWcT@vger.kernel.org
X-Gm-Message-State: AOJu0YxEclM5qvwqZvdiwiHmLEyQt+Rx11pVn1y15bAk2WdlW/uCSc7V
	2Rq6/Hf1DD2VG5SGiiMxr3BWzp88FPQxjyc2h7NPM33Sm/w4OJOgOCHs9/DA6M9K6K9wzScSeaQ
	G8YTXH/z9VkUm7ulVBCPi/9n8wU2i2l2Kr5ScLVkL9mle0Nx1MqIzPAeuCFE9eOhPiPup
X-Gm-Gg: ATEYQzzPmWY/796zapbLa0NNV68SORIfrKWvmz+7HGJQ8kdTfexiMsg3AvupTmKcKxC
	//BlDJnghI9Vho2t0za9AzE2ROp6Lf+8wnpCRCSOZtchUQr3Cu4miiv4zVNAdUDWmGUd/Hh8qps
	IxdpaiqgPIxUZvyqvq7olmqszYZJPeMzLq+XmkrL5uqykBLepohpFsTD2vZyuG/0TwCgC9z2tSN
	hkdoFcx9Oem8x9L4HWspvuGW++fwQaLGsdX7Y37EALB5J5pkmw6VNfKVlhs5gnUnLtEJXwD/FuH
	evkn8wLBEDMHJuMPpaOE9pxLoVkNUKamE2UpEkfEmsSqI41QmznGf2CPeDDwjKTWmtHLmTWIHv5
	+Kd5lkYnyASYibntxZHA1dLoYTLKItkLB8l98rCLjV+uACsKLB40wLJiyuA9Vi8wJIu04Vn8c4v
	TGNHfIyRcF2arwgkA6nv5Ie9UAX/dLcabB0nbT
X-Received: by 2002:a17:90b:3b87:b0:359:9073:c368 with SMTP id 98e67ed59e1d1-35a22081e73mr2728820a91.28.1773403724785;
        Fri, 13 Mar 2026 05:08:44 -0700 (PDT)
X-Received: by 2002:a17:90b:3b87:b0:359:9073:c368 with SMTP id 98e67ed59e1d1-35a22081e73mr2728788a91.28.1773403724362;
        Fri, 13 Mar 2026 05:08:44 -0700 (PDT)
Received: from hu-sibis-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35a02e18f0asm8421945a91.1.2026.03.13.05.08.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 05:08:44 -0700 (PDT)
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
To: robh@kernel.org, srini@kernel.org, amahesh@qti.qualcomm.com,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org
Cc: mathieu.poirier@linaro.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        mani@kernel.org
Subject: [PATCH V5 1/5] dt-bindings: remoteproc: qcom,sm8550-pas: Add Glymur ADSP
Date: Fri, 13 Mar 2026 17:38:10 +0530
Message-Id: <20260313120814.1312410-2-sibi.sankar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260313120814.1312410-1-sibi.sankar@oss.qualcomm.com>
References: <20260313120814.1312410-1-sibi.sankar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=OMoqHCaB c=1 sm=1 tr=0 ts=69b3fe4d cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=iOP-JMljhTESenzhlaoA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA5NiBTYWx0ZWRfX1FoiJoArfvqX
 JUTnBRdmuyATA59aQuaXKzMo9JjqduEkfLJLtb5gpC/efdAInnjyCbHFMEIipTuVzh8isSWxXU6
 Q0YgTjLx/194M6ULj9AQsQmajYojiwWYzY9L8EvRl88gIJW+ifbmTILGygxA1uhx0OPWHHrfc43
 SZ0jqegaNDhNHUMNh5cbi5J4JAI0HSlAG2iyuSHUTzxMWe9xwWIxB7PyjsYH2G0x/uiT6WLacoZ
 3Yh3EJIw2wyaWZWkJkQZaqacPtUSod/bvs8pTWRu5Tw4M2guCSvEizFKOP7+P7T3JpJh2F6gX5X
 tNhpGWYHWvk+DR6umrV/LhSn2oyHN7+/pTEGorvR2lvhWZVGtm+uO3X9RfZ26hY9ZN2ClJb6805
 c3owcAnaXpucXSdOL+ZU/4+cxsV8VJHw1T/4gyldrlhEPBiYhfk5jW1Bg2opmPuka1cpP00aByu
 qLsE7cDeQjMsTrjz93g==
X-Proofpoint-ORIG-GUID: 2c-pTvqpz3uocwLfeEqIhA0oUyzjhxtC
X-Proofpoint-GUID: 2c-pTvqpz3uocwLfeEqIhA0oUyzjhxtC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0
 bulkscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130096
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
	TAGGED_FROM(0.00)[bounces-97450-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 180B7282BCB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Document compatible for Qualcomm Glymur ADSP PAS which is compatible
with SM8750, which can fallback to SM8550 except for the one additional
interrupt ("shutdown-ack").

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


