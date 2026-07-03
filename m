Return-Path: <linux-arm-msm+bounces-116153-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DGTfMVlGR2q5VAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116153-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 07:19:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id DA0FB6FEA45
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 07:19:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=e9bwdtFC;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=iqzutYE2;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116153-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116153-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 08414306ECED
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 05:06:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADAE936F418;
	Fri,  3 Jul 2026 05:04:11 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEF19356749
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 05:03:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783055048; cv=none; b=HFco6Pc9zqGwG9Lg8jo+rVJFXcOkJ2AE4Im15s7WxTC988EQYZqboOFme8JM/WA1XwV7g2scCRUDUb1/9W3NX+Ca3iybI2u1Y8SYTV76dHY+5MXS4f+RGO9ljonI3E5T4s9zqdB/OGEx1MH+agW0/v3or+q9XY8iDF0sQ7F99PM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783055048; c=relaxed/simple;
	bh=s7fSnjoSnd/wINZ2W0kztndmGynq3HRQgtXJQD3txzk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=LaspLneLWvTaoBe/0kkI6FmWu1DuBdyjQgXztGuhMzsdYWm5nTvMgPKGI1UiYOvGWuwlA1WXeuoXx86URwxTh1hDVe2mnRhe94TmMxGt/o9e9HpBA0bR0aV9T9Bf+TsoXOEPPirxOpBaRvfXejpnvmzbzt3mvykKWzuhfYroDKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e9bwdtFC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iqzutYE2; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66342h1f2777648
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Jul 2026 05:03:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=5WyoGsIYKBPK0Ky6A1rZDa
	hRDD+ZrB4ddT2JMWFeFtU=; b=e9bwdtFCzfzxD+f3UogEqveVpuxa6QxcRfSNt6
	Rc0KxrUrGfeZU4gY7KzHjhr6ql2aOsf2TBW1jl1U5QZ/w0Oez1C74hR/aonCz3/B
	uXv6WVNBFaKPzAyk9DUfGqjhsukrnBpYNx92Ji5i5mFrByBMqSzyOhqXkAdu9G76
	CS32JlGXrM8oHcARA/8IZoMmDQf52J6XD18NFGh+DHyMyZRwJ4WL/2frhB27f+I1
	Fg9PMnhsVHZ4Nu7p6yD085kc/E3fJcRcDGlOD+BzwI8jsNT4lPXOWN/KB2HhfT3k
	Rd1C7HGAdyCbFtgSHc7wAkbncqEwhnmbcqvHg1Uit7e6SSpg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5s2536r0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 05:03:56 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38127ae6b99so380367a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 22:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783055035; x=1783659835; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5WyoGsIYKBPK0Ky6A1rZDahRDD+ZrB4ddT2JMWFeFtU=;
        b=iqzutYE2HW5C7bqa/6AhxNLI4s9EjK2U0CRDVxVyfYk84FL3ZkWBotWCFC9wNYDYZ7
         uTsyIzkziKexhtD8fdE4TrDmN+AFmZnEsTNWV4nZF+Ypf/imPqN1nUkxLXI7Jpn4JHS5
         YMRi6UTeBXysVBsuBnE+7udefsuIUkRXoWEIuV713bi5LmNRbkBUN6855ZSrvJLVGiYU
         6x+4ln2ZS/IqT5AA75l5yD+TkJ9t1rqmGdibNDhwWUSJFtlDf9UsRcIMy+J3VwwOcGWm
         HOqkHyaKdtRcB9v5bzbHuEPzWsedHu/pGevz7nfRpvyZuzMlmsdpRfez72f5Z1eEyoSu
         NnUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783055035; x=1783659835;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5WyoGsIYKBPK0Ky6A1rZDahRDD+ZrB4ddT2JMWFeFtU=;
        b=kePl/goVcxeVhLhquBK90/3RqhqJR1fvvfnDec0We/SBpnd7P65nk33s3tO8amvbyS
         lHt3ikoA37OhdKf+LYHaBCNbHgHWxV+r8/xjfOGR/lfR+AJZGZ78YKYCLowpfZVSTDdq
         IqHXyy+grPK2pesiVkJjR4GRFN7N/uUocsCxF2l/6V/QNBDu2kztMfoGoRohRnuP1+hi
         e4O6HB+1kn+JduwzN8+iX+4EUJ6HSrbXyC5jFojAvbgou4sMEFQhA0BG62Cyg2jJXLnS
         krg/pNAonErGI2/ylh22NHaVDdA2Se8s4n8jqdr0tCCG3+cZdRasw4kI9OqgVDBJLay6
         uDWA==
X-Gm-Message-State: AOJu0YxEaBq2zckOMdVK58V2aa21VXwXacUNKIOw4eDwzp+WH6EKXHYO
	XvB8s8okfbr18ZKkG+ca0e4mdyJaWaPd+TFNQAPaaOayoUgekSU+Rm7Q59mx0FNArBzszQtCWdQ
	cbH1gxOFtNd8aSETXQL9c+SCK5r+iA7EWvl51MikE21GBLyJy64DxoxJ0tExHS+TUtyDa
X-Gm-Gg: AfdE7clSiIlmbXVZ7Xm/Z7L7NGFOZgPyl8nH3RUtNwOVmwRXQR2uzPiTAJ2j+APdVFy
	Z0oiRtbrDuEn2Lrn8bkOu3nlBsgoSwDEEG3EjP6/PflWcUW30NGAq+gYVRrtMkr8QTjDTEggAfl
	b1x3/nfBYH1ywXNu8TeGWekvLFfpe5ghr+Ce/w8gfcLBDZ3j5VhbrI90i0yUU+wu4GzirBlFCcL
	rBO+aKXfJgv9OuuRcvvXWSKmrfFwfwSdm184Idmp9CR976oxBNNpALDbA2mOP26lTnyuR19ysEi
	oecqUqGzkFtFhEMoTBB1KKOcyi9e+KZfNzKoPuxGVez0SbAw1LgyUN6CCfVT20F3guSbJ47ci/g
	oSgypJ/uom4QAIBzPcB4VD0ZFXMGKNXDn8hnTADzfKO6lUWzrdcO5z6V/JXVpitUEa9JUn9Bqxr
	QyURi0iLqdSWc/idG4bHQj3MA54m5mVixM5NB7JWOs
X-Received: by 2002:a17:90b:528e:b0:380:9699:ae98 with SMTP id 98e67ed59e1d1-381120f7aeamr3598853a91.8.1783055035533;
        Thu, 02 Jul 2026 22:03:55 -0700 (PDT)
X-Received: by 2002:a17:90b:528e:b0:380:9699:ae98 with SMTP id 98e67ed59e1d1-381120f7aeamr3598813a91.8.1783055035069;
        Thu, 02 Jul 2026 22:03:55 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0b7b9873sm16109674eec.4.2026.07.02.22.03.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 22:03:54 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: [PATCH v3 0/2] Add APSS clock driver support for IPQ5210
Date: Fri, 03 Jul 2026 10:33:46 +0530
Message-Id: <20260703-apss-clk-v3-0-4785e89a9c58@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALJCR2oC/22OSQ6DMAxFr4KyblASZla9R9VFCKZEZYwBUSHu3
 jBIdNGNpW/7PXshCEYDktRZiIFJo24bG7ybQ1QpmxdQndtMBBMhC0VAZYdIVfWmkHuJ8hnkfhg
 Tu94ZKPS8qx7PIxvoR2scjibJJAJVbV3rIXUamAd6Wj2yAaXGoTWf/ZWJ78Q5T66rE6eMxioRB
 XAeK/DvLaLbj7LaxK4tu2sSFx8x/sMLy0dRmLPAl1msvD/8uq5fFsIOEBgBAAA=
X-Change-ID: 20260625-apss-clk-ed39c40ed468
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=U7uiy+ru c=1 sm=1 tr=0 ts=6a4742bc cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=aqkEcFr06yCu6TYfpIsA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: 3sC3kPLUHxMRth3JVdk4bCv7oCbRwkF7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA0NSBTYWx0ZWRfX05nqTg275iRQ
 oLA+9+If+DGfVH8qdiBD5YkjR2cTDMaTRnd2bS1ZvYvARP/aIU2Teq7ozpHGioyakUwq8PuxgOz
 EgTGqPFhGoFnbV4PgQk0wG6k5a5AgADDS/jSG7GcO1QuTz/Uy1BQJFvJvFbOaJaDBistVo5fqID
 BWXQxDKZn2apRsF0tjGC0sadr0bKQYTLzeKEqt9i2eqgoxhtlnOuWf019GdJufbL6EIjq2byHKC
 PL3xx1SlugtJdJbS2sDnCuxsT+t8e95M/MUlRHbemdUD7k5+ivFpusNJK/TiyjE0yEtX/h85nms
 rkYhsf5vgWTR7y/bm6NNL6RPcDI0v6y364jrk6ATSJ3tNlkuwOVLfrhFSQz9ub675fxIzUbCNTd
 BqpMOnIzuD4BKJVaD62e8N3zdCjDLel+gn30BjE0eNEoVzo28U87jW2bBVLQ6KhSXniuaTf4Zad
 ZIv7SIeJyQeIhPfew4A==
X-Proofpoint-GUID: 3sC3kPLUHxMRth3JVdk4bCv7oCbRwkF7
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA0NSBTYWx0ZWRfX/LuzgOdVQY1B
 Yk4znikHLOb9iv94hiBJN64W14OBGV1tTUAIsYjXH/6wnW3w9TeldYd99cJL6fCm6aGa9jH0dHj
 pgItDmWQd4HkNOGUwKUtAStSKy9hFa8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030045
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116153-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:varadarajan.narayanan@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[104.64.211.4:from];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DA0FB6FEA45

IPQ5210 uses the HUAYRA pll for the APSS clock. This series adds support
for the APSS clock to change the CPU frequency to one of the supported
frequencies.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
Changes in v3:
- Marked ipq5210_pll_data as const per sashiko review and to match with
  other SoC apss_pll_data structs
- Link to v2: https://lore.kernel.org/r/20260701-apss-clk-v2-0-776d054ab8c3@oss.qualcomm.com

Changes in v2:
- Remove incorrect tsens dependency
- Pick R-b tag for driver change
- Link to v1: https://lore.kernel.org/r/20260629-apss-clk-v1-0-8c92fe118ce4@oss.qualcomm.com

---
Varadarajan Narayanan (2):
      dt-bindings: clock: qcom,a53pll: Add IPQ5210 compatible
      clk: qcom: apss-ipq-pll: Add IPQ5210 support

 .../devicetree/bindings/clock/qcom,a53pll.yaml        |  1 +
 drivers/clk/qcom/apss-ipq-pll.c                       | 19 +++++++++++++++++++
 2 files changed, 20 insertions(+)
---
base-commit: 533704f3c28c3f5f9e2542aa3a6a326c32e6f5c0
change-id: 20260625-apss-clk-ed39c40ed468

Best regards,
-- 
Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>


