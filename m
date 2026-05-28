Return-Path: <linux-arm-msm+bounces-110083-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qNEXAAsUGGrKbggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110083-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 12:08:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 97EEA5F0368
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 12:08:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3F9CF307351E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 10:07:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDF4F3B635A;
	Thu, 28 May 2026 10:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dwzFy/dx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T4j2j3bP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FAF1399015
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 10:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779962862; cv=none; b=DkbnHL5kC2Wk23DTCwQnINX03oomeK+035cI/zk2gEyVXEBRcsHWmlFOs38s0juHuHsFpEooCF0HxSwI+8F8C4VT9SXwRvkYj/jJNqnvcxurxyajabWYF3cnP6PmEELM08q/u8lG322xgJYxUBhxvLHR4QCpC8OGXVS3gDNpg34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779962862; c=relaxed/simple;
	bh=9iDney/4UaOp4gyAQJJgqYiksjkSOYt9Vy7GvLh9Yzg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c4IghNlzhL8WHagjrUZH5KmklIADMM/sVhbw+vWTHHBsjxhS4qqs/KqrU3kbmx+W80kC+3ec0YMM07cddHJ2Y6Rqq9haNgr11avGgugs4q1nXlk/NZtyKqW/18IGVmJDEDWi0qqsWtFvr9iAU0Q5EkMggFbRucX8LFonyWWyKeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dwzFy/dx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T4j2j3bP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64S8vbGF1697234
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 10:07:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AFmrDdVLwIZRpxtw0b8WZQHqbC7uM4wElpvELfKZF90=; b=dwzFy/dxDSjeZe1i
	brzIoaqpVs1KQRON13rLJONOW8itu9kDmSm/IeE3bRYRuJmlgRMtVvizREiYIAUD
	x/rLreYicl6Nj6+JcFT1D8mAfCU+h407kKHNPNuqBf/h11APhXVVoYUkd1dcR7IA
	Zn+k90tVdM/K7COfNGyGXbU/5m0FocIbwcDvoOfBPn1QftMZccQyznpHfOzMQ5+8
	jLW5cNyimstN4w3b+xcbsZ/Z6V5BtidvOu7z/3Xj7N3nERU5Qd8d93e2yMGrhX8x
	PK9lA5IoxplNmHbRkxK4Tfk5+NX3ClAl6yulptV8SWJ3yTsOgs/2l4GDgjI5T0x7
	9w1zVQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ee7yajb2e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 10:07:40 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-367bb9caa54so11665908a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 03:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779962860; x=1780567660; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AFmrDdVLwIZRpxtw0b8WZQHqbC7uM4wElpvELfKZF90=;
        b=T4j2j3bPoMECNcAhHU6+sHUzfMTQGSrEwcB7hkTtl0hpFE0HhFdobppkgZfjGh1P6u
         5YONvfSEe/C7GbaOVYMt0CfDT18mHzX3jVq+Aq9bP+I1PW2ndKQ5bbdeYtgBPExydjEk
         78t0niIxpSPIMGaOzby3o4IK1HYExfcZWspwaJhUI9DeKCHynzWClauCM6IFep3sCSqk
         OdeIxuihfxKE5R79E2HpQjPNKpAxeVJKAqTIghTi/f0BBaLDHcjlsIL7WTF51KjoRr0A
         DHekwrN62WVS35jRuAnCSlclSR4FMuv4Dh6T3hYPLNBTbDNUDVhPMvxQWLCK4zi21vjX
         PSaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779962860; x=1780567660;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AFmrDdVLwIZRpxtw0b8WZQHqbC7uM4wElpvELfKZF90=;
        b=nV4sxPdv9AmumByumA3JkLaUu/YW4rdh16HraRV4+zoSWPIpnoJHQF1zddw1jYNX4D
         x5ojkN59SAlt+ihcmXRdwc545xQgGwZOQLkZaBD8ZWPARNudonsExkZBvf/tS0kqVqnV
         w0jm+0XwXWu1EqzpxUbqtie5X7aAtOioxgo7Ynp/SHF5afb8nAtfC1HyTHiALNSxIJlq
         Egp3GpsTQRltvRQo+KLd8ofaT46iHblwjt97zbe9KwuJfGlqokPdlQF/3LJyJadPN6wa
         MKEgPQEFJqfrKSPee0Dv3jgY64HmW6fkgWelRXxcjGLCfl37lpmo3bd+KdnRx+2gQluA
         /rsg==
X-Forwarded-Encrypted: i=1; AFNElJ8Me8cI4E00DDbzqp7j0vAvWsVONHMvkQHGxdfUQ91bhIEfH8fPm4Unz7LCoYhvDDJp7px9pV9cXAIENGB2@vger.kernel.org
X-Gm-Message-State: AOJu0YzVoWho2X7rXk0VC9XJyCAd1BAWJNLauayG1S7hIFSA1EZxg/gf
	vdSwP8Z+GB2AMQNPcL+CNOnp10j2CoXLv58nZhX0i/HeCl4ylv2wXg3pKZKB+urLEyATCick9pS
	IgNYhoInaHVLbjzNxe0O86cPyn57R29gGHVkx5eYcvdmO8zNDATo3ca9eA2mHyVh9+nlq
X-Gm-Gg: Acq92OFeEJnNW2FrtSQ3/tkMIsUKysZWd985CBxfVv6L+22VpeLEPwYmbdRFDadW1QT
	V8eXnymSiY74WMFAetzH5q3UT2oMCvkiyViXRhxTGUwMqzgeteQKdEJ/8Gwf473rzavOEhWtv/e
	kVAF8sGP7T38CipMOI0mHGg9CbGTm/8cytFyPd4U5Hdss3HSkXFMhqxy/Wcvp9N8AoYniRHMJHo
	TlG4v/8+gjOF3EYyty1btnR4ds+xCtZm6rp287wopFM51gIyssmEDP1Kg3prX+G5uhravsQ4PQu
	8+mwFXwaTMurBueD7n6qDvPWjwx/RPtMgW/TsZ0Xejiy8rB+9FavhQIwnko7+F6di1KV5BzmJ1s
	gEBWOqjVRV5IDbMicZd25Z/MAq+pydpJys9MzTyHE/nhnn4Q2k0W+rt74DS9wCYc=
X-Received: by 2002:a17:90b:56ce:b0:36a:cace:a4b6 with SMTP id 98e67ed59e1d1-36acacea4d5mr17921120a91.9.1779962859820;
        Thu, 28 May 2026 03:07:39 -0700 (PDT)
X-Received: by 2002:a17:90b:56ce:b0:36a:cace:a4b6 with SMTP id 98e67ed59e1d1-36acacea4d5mr17921064a91.9.1779962859303;
        Thu, 28 May 2026 03:07:39 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36b7e38af60sm575296a91.1.2026.05.28.03.07.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 03:07:38 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Thu, 28 May 2026 15:37:04 +0530
Subject: [PATCH v2 3/5] dt-bindings: clock: qcom: Add Qualcomm Shikra GPU
 clock controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260528-shikra-dispcc-gpucc-v2-3-953f246a0fbb@oss.qualcomm.com>
References: <20260528-shikra-dispcc-gpucc-v2-0-953f246a0fbb@oss.qualcomm.com>
In-Reply-To: <20260528-shikra-dispcc-gpucc-v2-0-953f246a0fbb@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: YH8phh9Df8FydQjGE002lxLHWti_mJ7m
X-Proofpoint-GUID: YH8phh9Df8FydQjGE002lxLHWti_mJ7m
X-Authority-Analysis: v=2.4 cv=E/r9Y6dl c=1 sm=1 tr=0 ts=6a1813ec cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=tQxzmpfZ-Uf8aLjc2qgA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDEwMiBTYWx0ZWRfX9n27HXYAHSma
 +p34Hfvo+Sn3e+jVdCGaN5mppecosS+wKxOYJEu/LEj2DYam3oHwLUENkk4U4TG1acvcfW5eGVp
 3u0mQ6r43eviozA+UFz7M0FHMRG1qzonlS3hVrDMu84Wh/vTuh/8XKo9bpSI/Gr3dwqy19jCBi9
 MEiZ0cbWsCxPjlOhSZirFdQdcSEqGtji8uubEo3ChNzVO3CpmJxxoGs9/IQOgw8nDCMz8vpUI5p
 vla0IvIWd03i1AmYbz3TKvjDHYHNaiyB1fJlotd5AOipAW67h1XoFW0HNqlAzPPddGXxM8ha/MI
 RRR7GBOJMWGv+wUJKpNB6f/6iuIlBDIWjD5E9uLAQ5NyHFj0uUd8KAHWpg/gwDk+TDSHs+5kpqg
 5nTlnklY9sU6tZxiaZWrWuwTGHiy5ydExLj24Ucvx00faBslov7dJTOY9BzGHL1HabbzmUtTYeJ
 mL21/O6zonpNIGmPqnA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_03,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605280102
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-110083-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 97EEA5F0368
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Qualcomm Shikra GPU clock controller is similar to QCM2290 GPUCC
hardware block, with minor differences. Hence, reuse the QCM2290 GPUCC
bindings for Qualcomm Shikra SoC.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,qcm2290-gpucc.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,qcm2290-gpucc.yaml b/Documentation/devicetree/bindings/clock/qcom,qcm2290-gpucc.yaml
index 734880805c1b981a1c899d85435f83f4f3dd3ea9..1bd70d091fcd7b6d7805ac090aaf840a415c123b 100644
--- a/Documentation/devicetree/bindings/clock/qcom,qcm2290-gpucc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,qcm2290-gpucc.yaml
@@ -18,7 +18,9 @@ description: |
 
 properties:
   compatible:
-    const: qcom,qcm2290-gpucc
+    enum:
+      - qcom,qcm2290-gpucc
+      - qcom,shikra-gpucc
 
   reg:
     maxItems: 1

-- 
2.34.1


