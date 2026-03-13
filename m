Return-Path: <linux-arm-msm+bounces-97429-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iBDZEJXps2l6dAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97429-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 11:40:21 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 04EC42819B0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 11:40:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1D1CD304D559
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 10:39:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 919BC39182E;
	Fri, 13 Mar 2026 10:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hLteN+d4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A09kisOC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 192FA38F642
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 10:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773398340; cv=none; b=hVpzPUUByTSEG1YpqX5WPFwpiM5Y/MKNxtJuxpc3KT3SYeSBOQsvhdISWbfXWcpWqluirtpa2gX75d9mVEEVQaGofP1T0jMwrCvQI73UILZzxycqRzGCmN8XCYXrr3KyZqjgfHV/heuItOeczBRr8TSxtfOPdQq3f9lsDxGbJbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773398340; c=relaxed/simple;
	bh=+1CkAGQlfKBa2d7xyuFDDNbRSbYkBjLrdPIzj5HUjvY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g5VeAU2gtK0eN+3c9Yb0QG0AH19kOVh8JDgJGkvZGhBJivGxU49UO1ERFz6Hr4UZS8H7VT0Xx4AGb2g4LU7XZaRGRgFO9iDkw1E7etMquMK6hvWw81HUQg7Yf/YVzN2o0fJ2kTtP5Go8khvHFsCPKdSIJgevCyjiLYEudpS32jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hLteN+d4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A09kisOC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D7iLuR2262548
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 10:38:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=K6GF2IwQdB0
	l51Io87rwbIqOiKi5HOQtvyaiDj6u4EM=; b=hLteN+d4siFNl7cbZx2UNk/A3T+
	qdz0oE1JBQPGbv4vvc1tFz3DE+nJ2OXKQFB2AAMup4Updb3zuBsu1n6rWKrDrCmF
	Ngk9UDAJnb0bHjIoDX2/jQ9vRIbYZmubDvGNqkXMTsX760sJz5PfnLPOQkGOgIJt
	LGAP+eRd2Jm7ikCvfFrnrLtbzv0f6ubwshr1JL3zVm93ymTt5cEmEi8FUoGBRYEU
	gYAVRTEmB3BR4npTjv2O6FvRVr5Dgegzx0xU7mU6jRgrwB5C8uwX2rHLPT18o3MX
	68hkcdJHBxVqyQDXO9ThYXpfV+eUUcyL803dGojE+zI52eXXxGiXVV4nOdw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvef4rmaq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 10:38:55 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd84943c76so2114639985a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 03:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773398334; x=1774003134; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K6GF2IwQdB0l51Io87rwbIqOiKi5HOQtvyaiDj6u4EM=;
        b=A09kisOCbqlJsEUy+bEz8VquiScsYy5UaCcKpCcO4OUbiSiQGeiCpjkXw2yOlxXfia
         vX6hE2hOFoGZMi1nPK51lzzYDnRr4Xl/AmlXa8fnEyccl0Lzv4Y8VS4deZc4VEtmqWr8
         2A0KrtTFESj9IT+llJYyKwZg5awaxzxhFnCQWYiEQrnYySsTDM36mXLzluAUxANQrYsH
         JotGEGHEBWc/XHSRcbt7tWsKgmeubxUDWW9L5P50eant+WwaJYdMRE0DroZG09dOX8Cc
         8QsNjVZwwOn80/moKTpdyq4nBcDRghNtzXFiYxZulvZZ3vk7zltCdBNUPOW/WuTEwC0p
         EMDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773398334; x=1774003134;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=K6GF2IwQdB0l51Io87rwbIqOiKi5HOQtvyaiDj6u4EM=;
        b=c793yDCYeQBvUyVIPGQ2XxtHD3IrRsh9HpmrQD2mxufazR6hUqJhnbJWLfKTW4tRja
         Jwwh7JZdTWMW77IvcLXdYxBw5of51dYkZO20k4pv4WcKJRm2sgS9az1XUHFOkzJQpLJl
         ILqLn8r2ia3NIEKISKgDPkT2DCw142dewi161zUDCyjbSplqJXNmZBIvfF4b8q/7bjZ8
         gOWX+/rKwWM8oHI7maN7xQlgV6ItoiHcllcMkuWtHzloCNt/ezGtdf+MMgpTjy1DfLD9
         FMwLHWp0idrlXusIqPSL5wdv0fQ+6AEQkxZgOaSOwza0aDhF8RpSY80qKKOG/lX/c1Qi
         It8w==
X-Forwarded-Encrypted: i=1; AJvYcCUA0Qe/5IWIjQg4M2b9nbsoY/35MrdmZRZMPQc7V2uzariKhSV6FcsWLx8GzKtRLknQpEeFicPXRX5z2pxH@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9n4AVfftO5mwPhE6Gge2hYRPp4VI2I2KTqnQrb+n3kdNiauEZ
	nMsNQXjWNuKXJdUs3KuAHYwa9cEZiby/hwmuF3QYTUp3M25aoCFdN09eIlUIcV6pqo4gFgxkrV0
	K4wjmLqPE3NO8ydv+f71LqkpAe30nHCc0Gf/rkhhHYagDeMWgnNS08C8vNvjBsrB78CSR
X-Gm-Gg: ATEYQzwB/l1D37hcHfFm/bFLWBHYgy1c4F6yJmE4CLybYtoDSG5S37k99iPoPvkJyi3
	Pm0c+Um0yw5UhjQAx9+2oRPJ0PXX+cqa5fKZUTMaNlWPYd+n/nS2OwIPRLcHXa7A+zXEasdN3gR
	xhzXDm5626zSr3CMcCbSmZczyJV3rUUXx0QW3gNIcqzxF8jobv+XlX4msPqdNPlOSUKlG9ebZye
	SHsQf5pz+1VXDO0CNO3wQMwW1yKWwy/qRw0kXyq1mgNxkG6NsVZJnVqHrGsMkUKO2KcFZI0j1pG
	U0gqqu0uxfZsEHIOrTudLn1jgQUwqaOfaHPuPgMvZFd4ICb8su+KoRqbxnyICA9iCdsp7IpR80U
	C2jkDrM99ji4wNXuKpylifJN2+Xkm8IaPgf6a9AvNR2gARY3aSMRopbE=
X-Received: by 2002:a05:620a:4101:b0:8cd:9020:f041 with SMTP id af79cd13be357-8cdaa88d537mr749685785a.34.1773398334039;
        Fri, 13 Mar 2026 03:38:54 -0700 (PDT)
X-Received: by 2002:a05:620a:4101:b0:8cd:9020:f041 with SMTP id af79cd13be357-8cdaa88d537mr749683385a.34.1773398333594;
        Fri, 13 Mar 2026 03:38:53 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48556426be9sm20183445e9.9.2026.03.13.03.38.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 03:38:52 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: richardcochran@gmail.com, r.mereu@arduino.cc, m.facchin@arduino.cc,
        geert+renesas@glider.be, arnd@arndb.de,
        dmitry.baryshkov@oss.qualcomm.com, ebiggers@kernel.org,
        michal.simek@amd.com, luca.weiss@fairphone.com, sven@kernel.org,
        prabhakar.mahadev-lad.rj@bp.renesas.com,
        kuninori.morimoto.gx@renesas.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org, Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 5/7] dt-bindings: arm: qcom: add Arduino Monza, VENTUNO Q
Date: Fri, 13 Mar 2026 10:38:20 +0000
Message-ID: <20260313103824.2634519-6-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260313103824.2634519-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260313103824.2634519-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: bBKnYXIM01Hh4sQXbwOxHpAbYjPemEA8
X-Proofpoint-GUID: bBKnYXIM01Hh4sQXbwOxHpAbYjPemEA8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA4MyBTYWx0ZWRfX76rmf4AiDxe1
 OFVJwIFD1GVK4KZB7GOSluwib/px/7VWnE50GDkN9+GnuBYEu/B8KiqAJ/8XKR3061xCilqar1U
 1yL+ZSIYdBhAiveTQxtzlo6vvAu6wgw3/JoNG0BJjWUzo3JItcF3HGOoggwEqWkBZsn1hbu5OIE
 SnJRdT7+IJyWjcFFz9UebRUgtRcvuefE2wzPT4bPb4Un1l92SU/bGbBPeQS2yCKVKVDciAMb/Cd
 6Fg30c5bi5y0hyRySJPQ0jzkhB4GUcAXibfBSZk4TIRkzkpew3xoqMpubsHiKav+f281H8KA9LI
 v2BHIlmfdiDGz5GjkKBF+SInjHv+jVp0ka6SyBjZ/oV3TX700943RySbv/Y72jl0laqd6m6cMEJ
 K6HEK5uwgkIrIWQ6XIICPYJVEty9JdN2YXTt/4FgRj89XeY7EezJFTbmS+vReWjWkConAAuSYaD
 8oyraAFlMoUlQEew7WQ==
X-Authority-Analysis: v=2.4 cv=S9nUAYsP c=1 sm=1 tr=0 ts=69b3e93f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=cYMVCVoaxOtvnoqWShsA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130083
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,arduino.cc,glider.be,arndb.de,oss.qualcomm.com,kernel.org,amd.com,fairphone.com,bp.renesas.com,renesas.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-97429-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 04EC42819B0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Loic Poulain <loic.poulain@oss.qualcomm.com>

Document Arduino monza, VENTUNO Q codename. It combines Monaco
based SoM with STMicroelectronics STM32H5 microcontroller.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Co-developed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 153664da91d9..b93297520bed 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -888,6 +888,7 @@ properties:
 
       - items:
           - enum:
+              - arduino,monza
               - qcom,monaco-evk
               - qcom,qcs8300-ride
           - const: qcom,qcs8300
-- 
2.47.3


