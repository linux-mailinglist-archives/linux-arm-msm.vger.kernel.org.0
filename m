Return-Path: <linux-arm-msm+bounces-109894-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aASFMcrZFWpYdAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109894-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 19:35:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B1145DABF5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 19:35:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ED2F230F18DA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 17:13:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 310FE403EA3;
	Tue, 26 May 2026 17:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fP85kTQw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YGUAHtbE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9D64403E82
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 17:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779815595; cv=none; b=i7bWyuP285OQu5uQF0S84FZ3a4GM3wd5u6AFsjSej/bQsoBlzmy3rQVgVBfuSnH7ki2Co+VO46ArpJhlnn+v+3ksTcj0oSYVslk+5+woMeu60NdNea+PepYsy8dGDXmo0fQ1YbOc6FKCbC6BtE8Q/0TMgxs0URCkjNruB9hby8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779815595; c=relaxed/simple;
	bh=uac65xjlQks8nBNaxDifvO7AVmUW4BX94tfMWeRps9U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WTDpGpY84FE7DJl3qaKt0oK+DUQf7BkWgVAZDoo7ViSu81qkb3TZ43LqqLwK6SJQ4Lll5nmgCvdNKMYJbbzeV+rOU1BZhCE07MfdXk1rY2ZG1sS3YnknQ5ydh/z2RenjLETuYllh8abqIwTEWcJXPy4BF40arzvHMHLIdNAZf88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fP85kTQw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YGUAHtbE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QH12mT1752097
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 17:13:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	myApPVC79MUKSl1wI2Gc0zirfHAtnCQO6eIvLGQumqo=; b=fP85kTQwAjLmK8j4
	Bt/s9gGVLLQ/MLsVdLGS3ORhK3gKJcWIahzQeokIqZvMK0hye2ZrxAO2J/DOOkw2
	nU6Pchy7qH2n9CHEDOnbIryC6yk6NNEzllAJxoHB4t5O078E9QVpRCJBLS0U2flD
	iNZFW9U2Bzh/0dJv9hfw8gDLh/KAISaVS2Fr9KR63wxsozGbb2UktqHF1f6wMw/A
	QoC+vx0JqIjzuOITbfA9TmjYbJDks0JXkmIpby/XIIxFxvPKFLVCe9JTPeSkJOab
	w6PTPnUKm3JTU8UTtT7WplL8MQO2mfzklkmBuqjPRYYQbmpBkn+llp5tZLDzu/Zi
	s4XK7A==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edd5ngu81-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 17:13:12 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-83eefe4867eso5447375b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 10:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779815591; x=1780420391; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=myApPVC79MUKSl1wI2Gc0zirfHAtnCQO6eIvLGQumqo=;
        b=YGUAHtbEpEUTtpQniexhH6ex0mwXGasMN40+IiZ6osm6rFHXvz6pK/79tQvyIPzdzC
         tlpnfrSwul6eUQae4HRExYGzxoe2um6zxkYW7Ez1s2AH6umicmwFN9+vuHXQ+Cum+5JV
         0zXvTSbEBt9yNXxWDp6uBmn5OmMro/L/BhR+K8zd36egFaw4flXsBU25GHdjhF6P8T4b
         MlOfLPCnk/P5kv3X/I8rwP13W1QIDQEE3bJ5ERhdSOKgzUEaEmDQoL5XTdaj1SjA6uyF
         aN38OqfWeDp7b+TDMzRhML2TeRNihqEpPDVepEwGCQpA33wAQN0R1VIkLxtSc62oy1z7
         XMSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779815591; x=1780420391;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=myApPVC79MUKSl1wI2Gc0zirfHAtnCQO6eIvLGQumqo=;
        b=jmcbrXPO0w6fTWnYbY89V3iWKUSPiItc9z9d6kj3cKPIv3lnBYyP8UdsGhEF6GQly5
         zkAxuG13pc9mk0bF7vWMI13SbxqzqJsB5PYriPodDPGUUlVHN0z2Zfv0VMko9yz5bDqp
         Yqo6aDNf8dg6TXsE8tb7pQVbKT0dJtDONPIkFWRcnGtoMGMr/CndXi6PA9y990KTQZBT
         PuxtK8Zor5aUmo8JZno03Xjn3T3NWNmbNBMyM3InZjZdpCANpS/fygM4XIL5a5FT19gx
         awfRTYz+TG3fklH3DCB1h3KbOBpMpYNnSzlKk8ZgBix4ny9NYsW6JWBYj/qhM2kxVhgU
         AELQ==
X-Gm-Message-State: AOJu0YzO5SkzQ3yNypB9dhEdX6Ck3KlLmaLwFGe+746uYIbwozSaJvPR
	wyIaq9JxKXWDC6/wjTdf/4GP+B5Yck6VwdWEak/bdM79bPgomVUNIPMCVyTd/AMHToNt5QjSnX/
	v2XgxVd3AKY6ger9Nr6AAR3FVUz2jgBt+5kL7o3Ds8uqv96hXEtY5RQOhASCEG549cpkj
X-Gm-Gg: Acq92OH+XFGP8kRS1ToVD7YN4uezon/EulrvMqY7Kkn0Dwtbj7XoxwF8tX/tHddDCT+
	aiQ+3mn4HhqWR59B7ES2y1qBefdzPSYe8UMN1pJAFfnSvhW6pqw7CKS+ogM3kjDlSKK5IYLciyx
	K4n0kib1tuyjwiMOm47cjNGFgPZ0HDXdJ9kpxKzb9BJmUqFYu2MF+q3/YPTd1SBVIdJTlTV+rGT
	1aR9HsfsKfJEGM08LWY+1ZXqPo1O6gkdRNYQNheg6QVOZQlrkgSqpHFa5A0expz/V+rqSD2AXQM
	BL9acsfhsPfS0fFRLAqZjFy8UygcR7yc569lGyqMPctoWy/n/EhJvxSAlcpa/V6Hb4Zc8oefDT9
	l5vwSIpexZOdBabOjmdPa+GDSOnb3fJkegDiYi5dDzq8gbKE2CFaD
X-Received: by 2002:a05:6a00:2da4:b0:82f:85c8:fc19 with SMTP id d2e1a72fcca58-8415f314ba2mr17283033b3a.11.1779815591517;
        Tue, 26 May 2026 10:13:11 -0700 (PDT)
X-Received: by 2002:a05:6a00:2da4:b0:82f:85c8:fc19 with SMTP id d2e1a72fcca58-8415f314ba2mr17282999b3a.11.1779815590996;
        Tue, 26 May 2026 10:13:10 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84165009761sm15736235b3a.60.2026.05.26.10.13.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 10:13:10 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Tue, 26 May 2026 22:42:46 +0530
Subject: [PATCH 2/8] dt-bindings: i2c: qcom-cci: Document Shikra compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-shikra-camss-review-v1-2-645d2c8c75a7@qti.qualcomm.com>
References: <20260526-shikra-camss-review-v1-0-645d2c8c75a7@qti.qualcomm.com>
In-Reply-To: <20260526-shikra-camss-review-v1-0-645d2c8c75a7@qti.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: PgtdQDg2PRQ9nXgiUrapFOPPWDzidaNj
X-Authority-Analysis: v=2.4 cv=TZ+mcxQh c=1 sm=1 tr=0 ts=6a15d4a8 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=phzA4CzYhpZqrDFsW3YA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: PgtdQDg2PRQ9nXgiUrapFOPPWDzidaNj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDE0OSBTYWx0ZWRfX0HwNxnGBqLLb
 Dfvdt4pfidQr5KLM3XY9QYMhHSbkOpsVl1BCJjwDLT19E6F65GjKPHzufB+xYROAZJD333WCVuS
 nyCKm8aj4pWkIU+Iv8KqE6AU1Y7PkE1wlEP5UxXDnzBA3q3uVvbTutjmkBjClTEMHJ4dCoE181+
 zhOhas4S53v0kAT1vTi0B2xqXbtgoW/Kc05IhJ0h/u2QoBtVbC/JdGKgz/8wQj3dd5bNxL3mP36
 w/sUKRqFRohNfMmrsLsfDEBIsng+EBuE99GpDcypsY3/XpPxCc2gyhXqqkJVTLOfquB7VDFq6eU
 6t4BF/kB41O8iJr/SbWs71IRjR1YH96dLak0vTqWpq8pQfp08QuBquBp34kd35E7CS2kB8igR0K
 9hRzy0Jj+pfU3UdsdntOXc82fk+Ob7k8rC3Nf/veVMVAzPFzI2XbmHLWGlizT3hbDBJAoRmMvyH
 inVmgn/ejLM0794VMQg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_04,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 adultscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260149
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109894-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,qti.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,oss.qualcomm.com,nxp.com,pengutronix.de,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nihal.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5B1145DABF5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add Shikra compatible consistent with CAMSS CCI interfaces.
It requires only two clocks.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
index 7c497a358e1dc8cec8b31c17bfedf315e4e00606..c94069afd8d06dbb08ddd6b49e2de7dc7acdc29a 100644
--- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
+++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
@@ -35,6 +35,7 @@ properties:
               - qcom,sc8280xp-cci
               - qcom,sdm670-cci
               - qcom,sdm845-cci
+              - qcom,shikra-cci
               - qcom,sm6150-cci
               - qcom,sm6350-cci
               - qcom,sm8250-cci
@@ -137,6 +138,7 @@ allOf:
               - qcom,kaanapali-cci
               - qcom,qcm2290-cci
               - qcom,qcs8300-cci
+              - qcom,shikra-cci
               - qcom,sm8750-cci
     then:
       properties:

-- 
2.34.1


