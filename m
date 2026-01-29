Return-Path: <linux-arm-msm+bounces-91118-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2DKeBjr+emmHAQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91118-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 07:29:14 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CFBE2AC37F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 07:29:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 26B4A302E7CC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 06:28:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1AF43793BD;
	Thu, 29 Jan 2026 06:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dmfflDGz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hHvd0mzD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67A1B378D8C
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 06:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769668128; cv=none; b=qIvFJ6x0CVjr0i/scvTevqZ9PXDRvLC1ThOEs1owv7HTKlXBWlOEiE5wegOeZnwKjLEhv3QXDSgS83UduWViTm0oKjY+E4VHQQpN/rKipgXWNwuOcxJq+76nNTFUo9Ebh0fAvLC1sXens4XoWsj85lkQmFe1G+l+Jn15zfbfbB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769668128; c=relaxed/simple;
	bh=o5lLsWt3mICtdLm2+yGfKd61T6gO3OFVH8wDJZs1HNc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Vwph4VJL9Nz3d6Fo+3PCqrf4ZaT8W0gqF2cs02Bewot+GNp5e/nXUD9RG138V21K4y2KTRZuWIJ/OS5a8qN4PydHBgdau1Hv2fR8yfWD9o4pEVhYvmHsfK+FpUXsu6aDkr+qgt5DnkIfry3V6BByTGqRSc05nTEvIBLMLHfFjeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dmfflDGz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hHvd0mzD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60T2osJi2664007
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 06:28:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=d4AzBH6pR9N
	V0nVbaYE32uD84Y19t+AhC5+VO4bqmUM=; b=dmfflDGz2xBF+BNocDH/WMakdD5
	rRzmys1YoE1x29HoKcW2RbvPFmLLQ9m8DLYods+Bf3q5a2W3XEktxaPJ4NRMkyh1
	KO58XaRAO7ak/eh/9ZWAot/4ApdN+qDfx+2ZIKZ5XLDGaPwE+F2nbNuNkKHSWLbL
	FodS+0W1JpHpNvIiwFAo6YbMlGU3DIsbIUmb2Ta0I58omoLFfj1/iiQRfnrE4ZS1
	dKqX0YUQ2F+Cf8+HbGP4d0m4xZ5tn49Mmk/QlQBJDUuAiS8dcRcrWbsluADoJpZX
	seayhrKtMsSA4d8IiitXpoLDDrwGOVhI66WVVmUJ5/GZzhovGcZOy1WcZUA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4byphgj3sk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 06:28:46 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-352c79abf36so566849a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 22:28:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769668125; x=1770272925; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d4AzBH6pR9NV0nVbaYE32uD84Y19t+AhC5+VO4bqmUM=;
        b=hHvd0mzDZD2MUsSY/WGjcbyskrPSvfmGGF4wh0aXd0R/UNwG57Uhh+69zyAx21xVbr
         b1ZFABHxbQpV641KXIQQMS4tlgvUrZyqQ3Fu7AYYrDKWMNNJjACU9+BJ0o4J/ucQMuuM
         1vcO1luANEb0oq69ugYDu5/ur6cghbmipAAnDQUzbwFdQgLH1ghMsTZFRTiyoEXhrbJj
         mecUhPaVWzWwgmb5KpjuHVOLYnqpSTY7gq9T4OcJ2f0MZdpHVAc2GjrbFkkSeEtF6vE7
         pSiAO3Ur7dFAkf3kUuDKx0654RdT0k660dzjNWl/bXLWMYLvO7M+s9qN3eYlsfFzGBZu
         6Q7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769668125; x=1770272925;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=d4AzBH6pR9NV0nVbaYE32uD84Y19t+AhC5+VO4bqmUM=;
        b=YHhPihW13mGxWz+jlm2jly1UFt4LpQZLeJ0iwpOD16AG5XVFQs/1q7UugV39Do8a2r
         vGyXuWnipPvupnq+ZAjh4TSZpxEr4BrpGIMI2KlQP/3SZZfj13I0UC0SiPuLh/hKEn37
         mu9De1rVHBm3nqh1m59ZyUVktm1psH2qw4lCN6H2/7xKjr1Pw2TG6v2kGe8GD+OvU5/n
         xJP2X85qWP3KlY+rgnUDJzOUSt1jo1CvH1iVHmuR33Q2fJ2OPPtFvIBlLMBuL8809I/U
         H1HmJ9eD1Op9akgNCAFU4e9NnS/HBHNbX7Lf8ywfsDjstJnqDtWyDXoavh9moB9DUjq8
         GlLQ==
X-Forwarded-Encrypted: i=1; AJvYcCXvZHoC5UeZT6IEENy9hzfGD+IT+b+P1WsDelljAKiE+/Ef+O6n0Bfjw32YhGBHnErtHJ6lOIxDFwA31ClK@vger.kernel.org
X-Gm-Message-State: AOJu0YznFEnYxlYBBR8wq322cY5N4QVf8w2iZKlR8t7AaULlJVDs4pnf
	qLo5boRLrypjlA5k1EGIL429O3FjcWWkUFBbbf3f69arnCqVijM2rTVxUXKLNA5HagkFl5yPQ6E
	kL66csvNdSpaQz/W3CxWbowJXL1PkFWppRWelKhdey6KFJxh0nrFYesg2KHtEer/Fv2Ua
X-Gm-Gg: AZuq6aLx92hN+f0kpq/LJibpSGl+N6m71q6prmPsIGtJ4KfQBszhQfhBbtq8RGHvSA2
	WtLm/AjcMRf/I61hMXHNDjovX5QD7QlCQoVIo7vc+15ecERU3Jrh9W0g3u5kLm2ZFqSxqJYBV+J
	qaFHlzvaTTnxkkZQndo+Gvi/JAcyfg8SikyaXbTn32g7nynjr8ecLBFBRC+VNep2+R1C1GMgQI6
	bqNKi0NnA2jHFrZJz76NkByfKGAEwKVj6+gmY3RrM/+lDclzaFYNwuXV0i2fLDqxutjSvaEX5qv
	RM3r9QQBK5dXn+Y9Yv4r1cnjzLCJ+otR8gANbmiIkwadbR0YRHZPpqCRKv+ZPBu1P0e3XjdKDKd
	FikpBuzXsTMhlAUh3fAPS061vmIUw4DCYCzDSv52NMJiJi9N6PfUwTPlPoOUYwqThe+UVsVHjjc
	pGHVYLGt/lXStUO/CCKKJBNRAWe3YhHUy5Zhc5tew=
X-Received: by 2002:a17:90b:3c11:b0:341:8491:472a with SMTP id 98e67ed59e1d1-353feccaa21mr7322380a91.4.1769668125400;
        Wed, 28 Jan 2026 22:28:45 -0800 (PST)
X-Received: by 2002:a17:90b:3c11:b0:341:8491:472a with SMTP id 98e67ed59e1d1-353feccaa21mr7322363a91.4.1769668124971;
        Wed, 28 Jan 2026 22:28:44 -0800 (PST)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-353f612917csm7215943a91.8.2026.01.28.22.28.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 22:28:44 -0800 (PST)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc: sumit.garg@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: [PATCH v3 3/4] dt-bindings: arm: qcom: Add IPQ9574 AL02-c7 eMMC variant
Date: Thu, 29 Jan 2026 11:58:24 +0530
Message-Id: <20260129062825.666457-4-varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260129062825.666457-1-varadarajan.narayanan@oss.qualcomm.com>
References: <20260129062825.666457-1-varadarajan.narayanan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 6fzlJhxgXnx5On9yov02_2QkSnxqkcaP
X-Proofpoint-GUID: 6fzlJhxgXnx5On9yov02_2QkSnxqkcaP
X-Authority-Analysis: v=2.4 cv=J/inLQnS c=1 sm=1 tr=0 ts=697afe1e cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=okxJcUns-7FWwRFb3XIA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDAzOCBTYWx0ZWRfXz0t80RyeFvt3
 MS8MGDZWCWYZ8IsQMF99hB9YAn3QQHS9wGvDW5RyLEGJrY+JRy0cafDYMswTdwy8ipv4AxHHfwZ
 TWPuIlwwNB++gdVKZqR/I9N+wtMhWHS5nBYDY1x0U8uLM2ohWCG1AUY1LvLnkGS6KgwJ70OvSYC
 ItXvp7Y8hYp1OBHzpFJkcpQfUoe8jmBjhIYG/VPGAcPeiu132lCALGWr27jCTpBuduktaSHPKAA
 HeqUvKT3e2I+uJlBauMtdc2tjmXVYiUgzmtLt4lYgJjCIPT+9x1IpuOEFztC9dVweCwNA+Npz6t
 w1ZSUgBHM3/Cg0IZCVHwTkok70eLPQAfSh0nHXtdHqyYx+GU2qoG/c0VeD846q1tgeYFgEs/pLr
 vjg8HZxXlhl9gvy4vX8YMXG7JjDtCQYJY2PyE3B78XbJC0rBocOWqv/SjRovd3vbU7hd7JyBY04
 ANXffuAs0pBXsmn9zgg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_06,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 malwarescore=0 impostorscore=0 spamscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601290038
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91118-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CFBE2AC37F
X-Rspamd-Action: no action

Document the IPQ9574 AL02-c7 eMMC variant.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
v3: No changes

v2: Update dt-bindings to include the new variant
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index d84bd3bca201..28f9a6a166a6 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -323,6 +323,7 @@ properties:
               - qcom,ipq9574-ap-al02-c2
               - qcom,ipq9574-ap-al02-c6
               - qcom,ipq9574-ap-al02-c7
+              - qcom,ipq9574-ap-al02-c7-emmc
               - qcom,ipq9574-ap-al02-c8
               - qcom,ipq9574-ap-al02-c9
           - const: qcom,ipq9574
-- 
2.34.1


