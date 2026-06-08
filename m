Return-Path: <linux-arm-msm+bounces-111936-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tJ8NHYH6JmpxpAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111936-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 19:23:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E310659318
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 19:23:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=QAVg628P;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="FgXBfl/a";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111936-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111936-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6815B303F69A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 17:21:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5A4B3D6CA6;
	Mon,  8 Jun 2026 17:20:55 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C502D3D902E
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 17:20:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780939255; cv=none; b=nuW9uaMwd4ujS9+9GTV2wLY/mCJW2NBpSAXC8RGt3VZK+cmivKjCHtj0yWwPCMlsTPTLjeoY5scEfRo679zhgDEpFMVPoo7378jmwIHWo7plrJASUFjVu5yn2E7aZtqZ5Dv9SCDm20OggEPSBmnoju78yIbnlA80OFWhQarlWs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780939255; c=relaxed/simple;
	bh=OMLP+uCENoAFecLoBJilbqGTAnWIIlg7uB7y+iEierI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BFRROyHBR51Ts+w9LXOG4iK7kooTMqv1q/K8XP1InOy8T4ny3FrcBSquoaJchIiT4AYcaNadQXsp95iiHiKhEhOoNPprNeKPPmRPBn8yp81M7TEKVOL0I0ACKGm4bvbEmbUGlwN/oYDFIm9K4lyPhyk4JkvB/FLME/HjrYR2H4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QAVg628P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FgXBfl/a; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658FFWO83479132
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 17:20:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=V2sa5Dvnjol
	aVGPuM8QeMt0IAdF0OTIT4oFME/COs60=; b=QAVg628POzrG7zt3KSIKtKL68OW
	rmtBx9jdbZPm45NozJZchs4HyY5qVubhnxqig+ij24v01h2VhDSqdfgigr6Nfhc8
	XJ+jB1BiGR0heUXYg5t+RSShM1Aa98W4MP2ukrSqUPSomGln+y2fsDu3Q3C4OVQR
	r+cEVWg2kqESTTGC/BMn1plMBLGz9llIAaNUj7rYlnh74+xOk2MtOP8tx6n5j45B
	zhi55bNx50PyXIpGVH5pf48Vd9EF5PABXXc4zr8EUC2hRRMVNs+nd+N4J6NDg03N
	M/z43iZQuCRtWhz9acvCnsCUIU9+DTN2J4gXCOvscFMgazswZ5qCLl25qIw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enxx413gd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 17:20:53 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-842211d6e48so5349171b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 10:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780939252; x=1781544052; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V2sa5DvnjolaVGPuM8QeMt0IAdF0OTIT4oFME/COs60=;
        b=FgXBfl/aY2qtQ7YIOG8CjayIVkwOeWwYfM1nvOCzZXgqu0rEbdoKSXB2KRbreChids
         MeTwbs68j+1s016fIXXwtCmSmD6qjGe/FLAfyb43HJsVklqsNRSpm/UY5epsgGiGZohS
         5UJEyf7VtFQAQ6dqjpEw6OhO+0uTSmgBKaudJQEata2cjNLPyMX/2keppRiAlkPowSTh
         TAaZfCR0btcCMKEwXqLeKUs+eRztdfxzLzkp4dp0CpdNlXthWnz28nxM9SwDh4Bml/r0
         +M6FxVtO7jcX82w8zSZLOt/J9nAoak80QoxoeTqh1ghW8abOgyrkU6ei37Szf8+CT7i6
         FlUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780939252; x=1781544052;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=V2sa5DvnjolaVGPuM8QeMt0IAdF0OTIT4oFME/COs60=;
        b=k1wAxwRbJ0Hn/dJF5XnnkV52ru7eYthe6kZZoDXoOIzcN3JnNqZyiHz6YqJelwE70D
         GI43erBy8lWODwdXLI6z/Y8xJvAKcklBIFZcy1xey2+D72jw0UUyYdVbyDGchn1c7YNh
         blzv7dkVPLAWD3Vl2h9UoOKAVtCyxx6w9KI1eQfiZY03s2owYDeZVDyAEMY2VySH6L2T
         S4CNIF0jH/BUn3w1QfVQfhVO9kyBaELFNNFD5Ne6U3btiK9vZWUjPEbSsMPgN9StETx8
         UVIk1mXl2SlOvrhkV8VYV4Wp1T3J4+Aoe9ukHw88d21fPM0xO+I2y//ieYUXWiPXWfBQ
         zLcQ==
X-Gm-Message-State: AOJu0Yx7wASz0upK8+V8vL9Xv1bLx4+/JxgCGr7qT8sW45YpZUtcv/co
	zVwXEWYhZnEKpq/yEn0MACaRiUNm9yGirC3RyrY1w8Zfpg5v4t/oxontA3kLxXG3qsSPcftcw07
	iz9KLkUnonnmPPWLzrt/i/iLoOUXEQVV1z8Ih5l7W/ML8w7JNaiFfWnBCaGrB+I8poEzN
X-Gm-Gg: Acq92OFoxyAhwEspeCBk3dpH1LhpS+6JuVnjCD7sfUZITs3afUIfeX/7aP5Wjp78nlH
	NP+ZeByA+SbQcp4EABdcU5sCf9eole6gd+5RZiuXZQMty055i20KpXWxlwQPOmOH1ZkvIlkqco0
	5/vPxAJRIEH8HV/wLXpVAf4OmQrYWDu5TxYIKLNw8WSvuibAXEUunQ8RaqF1Aj1yvx6vcWLrQE5
	dNZC7N6FUY7+UFlf1Qso2zWxgPzwFM9KKdfleNcU0PVDv2RxDBt6twGOK77AcEFDn1wRBswcGJP
	wvrZhgRvy10sS0iNCohzX9oLgMrz1gy9KLXIixSr1MTdrd6j6QrASkzh8tG51ed22NQ+VHiP3dO
	iAlkS56zmUUSEZoWqC66/T32UAo8VdMtP3NBatgR+PH/yUgSpyEQ6ypc9H/2HmWGUzDUX
X-Received: by 2002:a05:6a00:114f:b0:842:7e7f:2914 with SMTP id d2e1a72fcca58-842b0d837famr15464846b3a.4.1780939252527;
        Mon, 08 Jun 2026 10:20:52 -0700 (PDT)
X-Received: by 2002:a05:6a00:114f:b0:842:7e7f:2914 with SMTP id d2e1a72fcca58-842b0d837famr15464822b3a.4.1780939252106;
        Mon, 08 Jun 2026 10:20:52 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282221059sm17590409b3a.7.2026.06.08.10.20.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 10:20:51 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/3] ASoC: dt-bindings: qcom: Add Shikra rx and va macro codecs
Date: Mon,  8 Jun 2026 22:50:21 +0530
Message-Id: <20260608172023.2965292-2-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260608172023.2965292-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20260608172023.2965292-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=cverVV4i c=1 sm=1 tr=0 ts=6a26f9f5 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=oREbJnUDou8kn3UKV8gA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: 0aYXA1p9tFQY1--4SMD-cStftuVZ9uaV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDE2NCBTYWx0ZWRfXzcMF9qBFvbC3
 NMV3DkFbmdvyD8Pln7e0Ah9BGE2juXq0mparC258doeIpQqcUDaNHYNsR1s9Ct4mIDWdmjmtNYW
 lQTb15pX4ToRQKsAUZvrI6dWHALTiTcmQ9H3pfuNNcVeEYoM7LiqAuaIRdnODhK/Jsm24RoYAYZ
 LbkI2z4gl2lM2J8qeKmnxGub4E1u0lRZlH8peM1Ieav/PTB4pzFEvMhDJDUiG9cmE2cB2YDOYIn
 w4pej8DOKcDWTT1+iolh57ir/Xuj+1RgPmMiOOphGAAxOAOPBDWurr1o3UyrwiKXHvOmJSQLb3r
 Z0q3eck3WW1gn5/IBTnzrWRrSIM7rh39WShq3hIBZp+JiKXuKKTfgbFA8W0MOMGUk/E+7LGrmVG
 +zQnSwZJwUedPPLnmZraupruLBquFbvQjiVWZdVMAo9dSPTQmfrsLa+4JZDh09RAoHdIx0CU77s
 iRkVXJ0/r+Qlcc55BMA==
X-Proofpoint-GUID: 0aYXA1p9tFQY1--4SMD-cStftuVZ9uaV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080164
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-111936-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:linux-arm-msm@vger.kernel.org,m:linux-sound@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[mohammad.rafi.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mohammad.rafi.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0E310659318

Add bindings for Qualcomm shikra rx and va  macro codec.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml | 1 +
 Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml | 1 +
 2 files changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
index 2eed2277511f..07fe0dc51801 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
@@ -19,6 +19,7 @@ properties:
           - qcom,sm8450-lpass-rx-macro
           - qcom,sm8550-lpass-rx-macro
           - qcom,sc8280xp-lpass-rx-macro
+          - qcom,shikra-lpass-rx-macro
       - items:
           - enum:
               - qcom,kaanapali-lpass-rx-macro
diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
index 5c42b2b323ee..d43adaa2fbff 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
@@ -19,6 +19,7 @@ properties:
           - qcom,sm8450-lpass-va-macro
           - qcom,sm8550-lpass-va-macro
           - qcom,sc8280xp-lpass-va-macro
+          - qcom,shikra-lpass-va-macro
       - items:
           - enum:
               - qcom,glymur-lpass-va-macro
-- 
2.34.1


