Return-Path: <linux-arm-msm+bounces-110936-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kk+bK+MQIGqHvQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110936-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 13:32:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5274C637187
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 13:32:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=IzSoM0RR;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=d184VGCJ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-110936-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-110936-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3337F3106C12
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jun 2026 11:11:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9690F44BC9A;
	Wed,  3 Jun 2026 11:10:59 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69EC244E04A
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jun 2026 11:10:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780485059; cv=none; b=s4P7Nc3dHcfqNsQtW4qakzgSkb8cRVEn1jjOnIbSQxFdBCzQjbPIzkPDiZ8UjY+yp/i80i162X8B0jhg4uiOjbuizQc50I2CghNbqor9vQtzJVQX02/hOnozAAYO0N+W0MTQZS8Vv3iVrghs5WI6SKI/Gi5jk24e+J23sC3mP8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780485059; c=relaxed/simple;
	bh=1dObgRDzgUT8dRxMLMRa/R9TRzn0laSrkEbhmpC0VyE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Nt2QWXywn8dtShS5JbYZ4fa8Ptv3inKzY55jwKPgwE0yhF3nu5hgSfoPdAIfXoktNxQY2YOTaPxjLz20ITXdqdHJAciCZZTDjaF0TmmEk5pFDsrlNZgG+82IcE7o7QN5mTBH4rncQsZupmt9a0m66gxZKvkKxXPN6/QcTaKnFn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IzSoM0RR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d184VGCJ; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6536RIOI2076177
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Jun 2026 11:10:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HGgysCkU5Fxr4iYQeCoa2SkvebPhhyRsY+oXXx4ZaWU=; b=IzSoM0RRdKxOgb2+
	GBRNaAckI0tbIx9U9k2mFDbmO1w8IYfgB8ZolDD0C4zsGRs3eARPbKsFcxLGMo4U
	1YwfxjC2fsJOdVg05iyOfKr3oEXobRrhNELmzRLHvJo0BrxUgSRdmBIVqEUPQxEU
	zxqsCkNDH0l0KdfLtNQ2mMN4jgSHoY79ifJAI9eTcH+r2VcvyoewHc+K2QM8oAr3
	pdSIMX1c0Ec5p13XY05xPAiLNYvKlAqjMiPAy9CZ806O8LkEhBfvkHfQomeK/FZ1
	z/m1qDc0CKTlDAKfqdWi/1ctG4pRIVhIMc7dmLBtq0ZoWhcrvco7A7nXtYAfCT3c
	gfvcpw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejev197yu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 11:10:56 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c0b35fa876so46612095ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 04:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780485055; x=1781089855; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HGgysCkU5Fxr4iYQeCoa2SkvebPhhyRsY+oXXx4ZaWU=;
        b=d184VGCJ6Q/4hUU6u1jutY9LIycxLeTh/JU8xwvA3QS1j5TNHvH7CT+aryW8IZ2rDB
         G/yKnJ2w7u1SdZRP8NLw8kwFTtoom1SdgIsl2c3wG/iIsElW7+9Ut23N7YaT9uODG319
         DDHwfjm5bAw+iBU8cCwLpF65+B3HNox0dDBAkNXF/1FmvvjqKUhHZBgN+O+J2mFWu1wV
         wkt0J+SxLwuE7e0uQah6tQtchVdjdTCADUSfNjyIO5qjCZ4diuOUirdkWqjU1Q194qBe
         UK1o/dVRVV9OC+q4jJ82tn5SPuIPklOJRxsXQY4KkHz95hl6u5JLu6cyGUMn8vlWuTNR
         kOUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780485055; x=1781089855;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HGgysCkU5Fxr4iYQeCoa2SkvebPhhyRsY+oXXx4ZaWU=;
        b=ib9GLxduFrlaapilRgC2OwSQKxFVRFIOqGH/tFiPKoqps1OEKxL9uIQu/FMpsAtTYI
         LHt+vUb4C0YIQxA8W63mQOG8JFV2jGqFudCuJc2GYvdhusrRbNfrO1+0HVfHuCBFgSPN
         vE027tnRk+jM44NWKjYF423YaCFMXrLHl2te3exRLmU526IyReH3b3Y6z+b1PJSAaqVn
         juRF96lwzxjut912a2tgcmkLixGKK+/c1P6gthcTcaLB+HccjS+s7lSoAnD6s24uc/F6
         d4WtewltvDZ30LYb+JCIGYjRC7+GXV2KDL5Dh9v/YaOQ/Y1lkNRZg/jq7TlYBhJQFnKc
         GWew==
X-Gm-Message-State: AOJu0YxlWC1hYAoOUdjw/6YcLgIxyBm0zC55ycL148A19jo6Wotzh/Ut
	N6inWCZKU9MHVDEFDkhJYmtunJ23qaLPtGblmyE9vGHa92EpQAzHphMCks4wK1r3rYxJsFo6itR
	UWN64ZPR2A2LpFUaur4YNG7vmyPKsXu+dZ6FQzJ7yG+GSCv11ggpCtEWhdFK1CHQ8BJ/7
X-Gm-Gg: Acq92OHr+FiSOwLMTAKXzgHavXX8JwjtzGzlUCnpBXzBcXHzig6Hg3+1ihx35eIkSSh
	UUOEmA4Sczbsf549kTN7Pk924tFs/mW1SKO4XJpfxx60i8yGEDtpjYIg1dTCLwaKUHEYxsdoNrZ
	wxUnu5at3eoJrATsP08IMKwP6Cw5q/z8XqMVhX+1C8PYMxGNjP5DQUHoiQKGUkdRRZsdxBHPS05
	B4tAcMxgkQVe4eOJASBDZ5Y0N/K/YFNBVU0TNivAX/Q+vH1QmW+6GPf1yYTnHx3/QjrpyebDn+B
	dFxe3rGpIvGrbnrPBIRAP9lgXSyGuBooil7dGahq8lhIZetoi5zAhg+dsT+CgdQ8gWQrBVKJLai
	fSaECbAcGEYn3WXBgLw2Jqrrt4D/EWls0dN9WnDHOr9vxgsRHcO/E/AA=
X-Received: by 2002:a17:903:3888:b0:2c0:ab82:6b9d with SMTP id d9443c01a7336-2c163fb26ebmr32182725ad.29.1780485055409;
        Wed, 03 Jun 2026 04:10:55 -0700 (PDT)
X-Received: by 2002:a17:903:3888:b0:2c0:ab82:6b9d with SMTP id d9443c01a7336-2c163fb26ebmr32182345ad.29.1780485054984;
        Wed, 03 Jun 2026 04:10:54 -0700 (PDT)
Received: from [169.254.0.2] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16609e636sm22148805ad.51.2026.06.03.04.10.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 04:10:54 -0700 (PDT)
From: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
Date: Wed, 03 Jun 2026 11:10:37 +0000
Subject: [PATCH v2 1/2] dt-bindings: interconnect: qcom,shikra-epss-l3: Add
 EPSS L3 DT binding
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-shikra_epss_l3-v2-1-480cdb5abc85@oss.qualcomm.com>
References: <20260603-shikra_epss_l3-v2-0-480cdb5abc85@oss.qualcomm.com>
In-Reply-To: <20260603-shikra_epss_l3-v2-0-480cdb5abc85@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Proofpoint-ORIG-GUID: A_74V5iP_x8_BWKH39G_TLbDwoGYHnKa
X-Authority-Analysis: v=2.4 cv=PNE/P/qC c=1 sm=1 tr=0 ts=6a200bc0 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=_8IM60h0k0ddrWA-9CwA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: A_74V5iP_x8_BWKH39G_TLbDwoGYHnKa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDEwNiBTYWx0ZWRfXyKM8jGsn5ooW
 WTk4+YngxXKMkG3UyWxAoOz0gOiKjsOVDj7o5CAmw3g/6majisI87tjWrfLy6P7VkD+pP3MwDyQ
 6gaqGQrSm8YiWoVlrsvC7aDn6n2dROIzMlczk3w0M4GBIple91IpafFYFLF4r8Wtyl3NmTHuO8L
 jLU4VBC6nb7U2/ehcWeU3liI08ONViyAdPy8QkwvfLnOypNujO/tM7X2RYmfCu7zYWIHu/1OuIU
 P4SPoCCxSpABY3mBw/4pwRvtfUcbqmH/eckZ1s3YfQdT69++aR1ILHMl3v66LcrUJYcyWnbPfF6
 69Bc/m/8HnvSBusS6bXPb/cWe/W+5i24nTvJUbrBCfm1Nmhw/ngoRnmI67cTZIAqTxGki03o3E3
 /Gg2U51kbii2bF7noGR8nEFZGs0nk9dzicdgt7j4W5Ua9fH2H01XpLPXBNekKO5lAvrxG+JyShd
 DTkIkhdRsCcZW68ToXA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 malwarescore=0 spamscore=0
 adultscore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606030106
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110936-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:djakov@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:sibi.sankar@oss.qualcomm.com,m:komal.bajaj@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-pm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:raviteja.laggyshetty@oss.qualcomm.com,m:odelu.kukatla@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[raviteja.laggyshetty@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[raviteja.laggyshetty@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5274C637187

Document the EPSS L3 interconnect provider binding for Qualcomm
Shikra SoC.

The Shikra EPSS L3 block is similar to existing Qualcomm EPSS/OSM L3
providers, but supports only up to 12 frequency lookup table entries.

Co-developed-by: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
Signed-off-by: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
Signed-off-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml b/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml
index 41b9f758bf8b..3b8ebe17a976 100644
--- a/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml
+++ b/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml
@@ -17,6 +17,8 @@ description:
 properties:
   compatible:
     oneOf:
+      - enum:
+          - qcom,shikra-epss-l3
       - items:
           - enum:
               - qcom,sc7180-osm-l3

-- 
2.43.0


