Return-Path: <linux-arm-msm+bounces-112770-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HPchE7vAKmrrwAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112770-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 16:05:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E32CF6728E8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 16:05:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=YTD6mq4m;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=NxopFWul;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112770-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112770-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1B7C83016B4E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 14:05:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C44240DFA0;
	Thu, 11 Jun 2026 14:05:36 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2045D40B6E3
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 14:05:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781186736; cv=none; b=YJXOVLhsv4hvYrfHYnOFq11RfbbMdSusPVDzlnDISrayps7zEDOaJV4ELJcyUUPiHuHlMlmQiFY24l12JdDLda3NDp65elnPZ7196lM43EPGrZE/NXqBGr0jT9wZDS9/cvr3+gvS04JvSe3WpSHKNKVdZA3LsLsJXlh9GC5sx58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781186736; c=relaxed/simple;
	bh=cnmPhElCTchkth3Ndc+hQDCapDaZ8GQl8BWi+yVn00w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VvipVi2z76cX1olCksrJcHWioYLnfW+flX5AByHuCA8dWcKSzbwbNsrE6i8D2iCb0Dfcrl0cl9HqsBX2W39swiY9PFLo++2MQvctSD0soK9T7a+CyXJPgp231qJdrPgqFAmUY2dDTBVCJ93yu7OceMSmaqesO5oEeg5Mx7KTTgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YTD6mq4m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NxopFWul; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BCT0Hm597882
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 14:05:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KUbjYXUbqTMzIFkJjml7ONlkKsWs7fQp6JNxTiTreUQ=; b=YTD6mq4mrxS9r700
	dr0Xg/ypFRHLhKAh0xa6EQP6J4dLJY+odVzne+36vxt44BJov9uumgvV6SDuGfOB
	suct7j066fcgmhCbX21alTW/miQmW3Eb/FbnnnXQxD5ynjoLvcVeHugydMZZZH0Y
	PS8w5Yrj01D0YIC8X4/adyhAB1jfE4UpE+OrFlZ5cy9seZTaaYtp7NOSiFl9CvtO
	i0wXsxCMXFbB0SmBQNJghLWJA4lntPshITWt7LXdTeMINAxM1UERIOp3TyBL2VJv
	TqrHnbdbzB53mfMKV/bBTFNDXO+EVe/3F78YhfAsoCLRb6AfpTjbrpSjYhHPAl0E
	OAUk3g==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6uus3p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 14:05:34 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-36d985df4cfso9461794a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 07:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781186734; x=1781791534; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KUbjYXUbqTMzIFkJjml7ONlkKsWs7fQp6JNxTiTreUQ=;
        b=NxopFWulzdYVyyPcb+ygTOVmrIp0s+evr2iMdnU4lDoxiGu++uK5ijKnofX3O0u8zE
         cOS2T5BCc4sMTegrP3+swt1FE8Kem4m5Gij7HZ6yv3nfVZYi1xWFxJjvVx2FujXpVk6f
         Cnh+TSXRKl9fPPQAlBgAWKwsX0ZP/VhZbvOHV2I+X+9uywlRI0ghHIVkW/TfF15Pn34s
         hZrqEJz85RVwA3K6Uw/4VQZFbNW2hB4j9/M0iK2mZrCVPL/U4ExybgHqVFeF6dEqGvyw
         tqq0+c4bxsI7ONgXFqljzHAjq0Po7sgzHnRT3mOevkX6wAw/U1Hsa/dFpOdzPNXAzt7e
         rUAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781186734; x=1781791534;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KUbjYXUbqTMzIFkJjml7ONlkKsWs7fQp6JNxTiTreUQ=;
        b=qOYv40Mjizj8cIo83zJxqfxWOKglnvqSmAI7mOV01tQKA7GFFdVWrYd9pY8WEhYxko
         iDOg2fVYSNqdpJuO9A7l20R+XeByUtjf0YOlalYgOHpKEVPzg/ndcjPxqRtnngavld1T
         EzrNAH3GXR415Jn4w2FKxRC2cahNFsi+dUf/bvKFxr+xvReK9s1Ku6zXUfEgllv8WP91
         xHp9OjTUBsRgcNnrhRCWf1SlcDV8sKWPW+oZUt7bi7b1wmd7Bvj6HMowknPoJtWfNV/W
         oHagZ6OdpnFnCs0yamTEdHnUYhCmuNATllBio8S+s8krB2NHcyUEm8OResIk7SHE14NL
         ATJQ==
X-Forwarded-Encrypted: i=1; AFNElJ8hQ+N2/+AFg5GdXR45BRpyyzlzpxDSgro5RYyP/hQWinTYUhRBMmvUXuTy76VxhKyQsEI48kmX/PnXHvYC@vger.kernel.org
X-Gm-Message-State: AOJu0YyxUu6ZueZMl/GS+ssdVWRNNEahUvzuqlZnUXtGnVMQRkJrGkAJ
	1rOXixFPKNyKcUMtUISHNVH49EH1FX9Kul5/tgXAAY4QFPZgVkJn+va4+zsGjlhDDOwWyaAt/aI
	yJI/M9z2GbskFIFiI4tk//rEU7RBOeGT4tGU8qkD8NvhLxZqsZOYE/zRU21avZvskXhi7
X-Gm-Gg: Acq92OEjdB1LQyES2N2ME+2PvVm+mn/G28E4sK8/v7hNGbM45MXpzbj29/hJ/aDKiYS
	vOvw4Q0Rqc0e819cvlqJr0/wH0J/Yx8IV2rgckuWnwY9OPDIlQ25o2sx3j0YaGK4T/6CCnT9Ut1
	Qq/swqlD/sHKYpeQDynC/kS34bp2gs/e4wpPl/qr7DjUyYW9biq5Ab9IB07Nu76Y5t6ZY61JRRk
	HM49bTYQPBCFHjEe01bZW8O36Y5s9RVhBfN/rVvDh0SJdfXWEggqBq+mcP8E1Llk+b3Kbs/5auJ
	5jWscHsHJnfk2kuWtHJiVzviB7X410xDnWcYdf10WTVbF2OjU9ddRjFzOA0jL+fevk0G7J0Jzjd
	jUlUM4hCO/eabB6L8tuv4U54hFAOqTdB0D/LkQ/a2sl8dJDRP4ahNchQERAgYwpX2cbewZLohCP
	hdNElHn380WdxWljWAi2RMY4S7akE044x2VNbr3R3wpmmPL1tA9nURAjcyx0Zb07JjN6Qyu6vbe
	HENehDJHuSW
X-Received: by 2002:a17:90a:d2d0:b0:36b:77b9:5c8c with SMTP id 98e67ed59e1d1-377a62a4557mr3298416a91.17.1781186733588;
        Thu, 11 Jun 2026 07:05:33 -0700 (PDT)
X-Received: by 2002:a17:90a:d2d0:b0:36b:77b9:5c8c with SMTP id 98e67ed59e1d1-377a62a4557mr3298357a91.17.1781186732922;
        Thu, 11 Jun 2026 07:05:32 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:cc96:22ae:323b:9eff])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e64e2c810sm11133831a12.9.2026.06.11.07.05.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 07:05:30 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 16:05:24 +0200
Subject: [PATCH v2 1/3] dt-bindings: hwmon: ina2xx: add ina232 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-monza-ina232-v2-1-e4375ce652d0@oss.qualcomm.com>
References: <20260611-monza-ina232-v2-0-e4375ce652d0@oss.qualcomm.com>
In-Reply-To: <20260611-monza-ina232-v2-0-e4375ce652d0@oss.qualcomm.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Martino Facchin <m.facchin@arduino.cc>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=FJ8rAeos c=1 sm=1 tr=0 ts=6a2ac0ae cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=yPTVd8cUMD2GasGf7IAA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDE0MSBTYWx0ZWRfX5WGZuxTplR6E
 VYSSBuhfdY4vI15ldBoqqXJ7K4mf6/wMQnY4xzNLAazp7w49LgqISN3PMJoLSSwcEk4jLrT/jvA
 6x0f97d4s3n57iVMqi3gY58zUHBFtys=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDE0MSBTYWx0ZWRfX2Her1e7PMj+C
 2mhXzY4T8yfIUwoqLPKqlsoFAgvfYQLnGmRqCVa1MD1wOlYSGkxWDmB17fBs89yqU0DMn6VC1OP
 xIH6RsagAnxuwYi2pFxNylNkmKbUxcCwoequFf93HQ/8YZu1dKjMw5B13EFVGnDFmBUz0dAQ2yK
 e0iZWr9CXkF/mHoRTxj/thHUq2alxq/BmYS9w9DjuFa/ZdS1/f0HuPlxnPPZwD+Vj3qFkemuA9n
 fESeeIuANKCqk97Qrt4M37jhTz98bO3a7U18LI8QDEqeLJUvgnAfhzwFaHX3aIDsZh4YXUXNOsG
 lmaKxdzbY0DOFLmoOnr+5qFM0pnbpkKyfw6IWMPauKTC39txrpCxBwHn7W9JTo72LlQudQU5I7H
 IVZf2PMak6mfiDUjBTrSppTy1sCZDL92MfU304C7mbE2eTOpE5oiAEyyeHhkyrEOCEbLSozSA6h
 /Ov66jncN7B12aFEFVA==
X-Proofpoint-GUID: 9jmWrbyA8nXZzQJH25WWS_KaZlMc6Q1x
X-Proofpoint-ORIG-GUID: 9jmWrbyA8nXZzQJH25WWS_KaZlMc6Q1x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_02,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 priorityscore=1501 spamscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110141
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112770-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,arduino.cc:email];
	FORGED_SENDER(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:linux@roeck-us.net,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:krzk@kernel.org,m:linux-hwmon@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:loic.poulain@oss.qualcomm.com,m:m.facchin@arduino.cc,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E32CF6728E8

From: Martino Facchin <m.facchin@arduino.cc>

The INA232 is a current/power monitor from Texas Instruments sharing
the same register map as the other INA2xx.

Signed-off-by: Martino Facchin <m.facchin@arduino.cc>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml b/Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml
index 009d78b308596ca795bebdd160431bd718b127e0..a79ade3142fa4f36f2ae4655bbf0db8ad84ec13a 100644
--- a/Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml
+++ b/Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml
@@ -28,6 +28,7 @@ properties:
       - ti,ina228
       - ti,ina230
       - ti,ina231
+      - ti,ina232
       - ti,ina233
       - ti,ina234
       - ti,ina237
@@ -114,6 +115,7 @@ allOf:
               - ti,ina228
               - ti,ina230
               - ti,ina231
+              - ti,ina232
               - ti,ina234
               - ti,ina237
               - ti,ina238
@@ -136,6 +138,7 @@ allOf:
               - ti,ina226
               - ti,ina230
               - ti,ina231
+              - ti,ina232
               - ti,ina234
               - ti,ina260
               - ti,ina700

-- 
2.34.1


