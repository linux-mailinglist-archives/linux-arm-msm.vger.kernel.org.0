Return-Path: <linux-arm-msm+bounces-111120-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NwmbD9UMIWqa+gAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111120-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 07:27:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 498BA63CF5E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 07:27:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=hmVAjKsd;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=F+qBT41Q;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111120-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111120-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5EF57302419C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2026 05:26:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A10C63BFE40;
	Thu,  4 Jun 2026 05:26:53 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07F2B3BE65F
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Jun 2026 05:26:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780550813; cv=none; b=uXlVBtmWzU561d5Q8ARYKreqHAFQB2vyW7ObfmqPL76wR22j23uX4oxN9KZzoe1xFQTbWU0+lRi1C/KEK1qHjfDu16CTNRf6KJ52pBj8ucvhxl65tpHj5TNOfvHmUiYM2RXqkAzbo01N2eEakpaKe5PZOcRXLZiAx6xI7BcxdWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780550813; c=relaxed/simple;
	bh=9iDney/4UaOp4gyAQJJgqYiksjkSOYt9Vy7GvLh9Yzg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AxV7+NYBUWe/yZXP8DYzj+ZS94nFuOUWDAUmojoFeAycwwIl7khbyPymojbKzcffCiR0tKnSIaQL6J+JtD2PX+JedydEkF0Yic6g6SyZ7SZcQNs5/pC197OEfFgP818v9BgBsw53ygwtk79hzhXwxU09dzugwdBb/cXd8JL2xvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hmVAjKsd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F+qBT41Q; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 653LfPAo3242117
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Jun 2026 05:26:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AFmrDdVLwIZRpxtw0b8WZQHqbC7uM4wElpvELfKZF90=; b=hmVAjKsdVxEFlHjc
	ysMv6bgDRHL+YM6itkKc6vq0rAiN8h7XYMlXEl7W4io9H/UjogLMINwY+sYkZy23
	V3twBR02KqKfjKZJQ+2RFiHkY2tQX+tM4OZAkH2L5JSiM/9mRObPvSBpfMMNyi2L
	t6KgAijahIgtOu/n2MvdBpwXUC4Lt69s7W4iJGfJhU42fb1VD6S4zYsAExM6Oy4V
	Ck7FNMg8MdllYLcTL7RrIlwccHQ1zTAstwbkPdpjWRJqhqE5+K+bN7uek3+HTLfc
	CWa89UKHMCONa+Q1sLG8LZtlCJcfQq7S1Z/00PB6nc5C16xVOQdhMeAfEcv+YATy
	UOf/JA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejvd09a61-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 05:26:49 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c85edbb10dfso218207a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 22:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780550809; x=1781155609; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AFmrDdVLwIZRpxtw0b8WZQHqbC7uM4wElpvELfKZF90=;
        b=F+qBT41QU4BuF4HUCmbGa8jdhS5u2t5B/oBIwCS3S9H+CA9MXbxSWg/3q6X8u8Fa0K
         qxP+zxEgfuXxFHaj1xEiooY9V6bxby7LZSWut0x0iXvH2yBKtLIxXeGzW24uklsdV1CE
         92f+CKeBXgJpwbMuGn6DauDj4M7D5bdKovLip7E8kLKNjzrFAZJzvPKOTa7bk0DnOaDr
         3C9AQebPJnDu12Uqck7mTM/ipNaLCs9cynUiQvuzlM+Zv/FzRhA0nds7A3cIohbodeNA
         ZSUMBm8sACXX1aN1uvQPTZ8GauM9I34CafeItbJC1DfGMFQnlsxGyaehcDPHvePqm35s
         tiig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780550809; x=1781155609;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AFmrDdVLwIZRpxtw0b8WZQHqbC7uM4wElpvELfKZF90=;
        b=iOz6eZMicSi6wVaax+3dM/382fEvQZ1ZT9+fCQH0cH9Rm+cuJNgz1JfEvDd4r6HsEK
         TKnjMRKoAnXAcHDUPY6nF06v2UgSJ3CWLI9/cnfF24GYrswlUR9L7gx8n25EDH8zRHdF
         JBIbwwB1OXh7YLFg9F6xnD+gaQ5QldtPM5doDakUvpDAiYrP+oGZpUGCdTanQv5iRo7h
         iw6dhj9FZ4rj/ECqL8Yb0CfspYtoTeZH1zaP8x72jCzpbNlefs5gIrPlZtCADgTyU7P1
         j2FOmQvXoTslbo8um22v2dlbO6z1U1rAIagLstUu0o2adJed8Us/UbgjDcKWhrTJC1A9
         ve8Q==
X-Forwarded-Encrypted: i=1; AFNElJ+kF/3QL+90P085lURBNDjV0BznHSQs0wguuUTyPfBlYMGIiwzoLE8n/CfpGNkf5GgSeyyYje72HWxU5MEM@vger.kernel.org
X-Gm-Message-State: AOJu0YyH9UEe/LxdWTBt6Mzd4hH7Stp0jF03JEOvxatR3TeWMV2lzmio
	GIFmAtCkbJjF6tbFxl8Amk/5t1VvhnnjGObCS5f0a8dFcdUr5i691OUxeILotO6jFyaMu1Gm871
	Tz8PTx9h9b1gA6J74+V6Wcw/59xyeeiOPB1Iv/A4ZylMMY2Lcsrx3Ka2dW3GkoDxlcvqL
X-Gm-Gg: Acq92OFLkuGkCJH/L0rL4LkjKBFRyDDEC31gv4ytrjfMVsWVgUPblQ3sAFR96ptDIiU
	0BJZCutacmeDziIiv7FM6uE5HphZVhI8qzyy11G/jOoAFJMHU3FegXdwcj2iq8aeu7oylEL6G8L
	h2LvO3bQQFvBbfi8ICliUXOT5ihzmc+QJlN15eeEytDNBUXhbdXyMDAlfUTOafenMttl+TxUi32
	s9jlnRccDhqzFtfgFNA+ZwuJGQth+ycw4aZYoxRE+0gcNSzObr52OFz4WVy5YnhfjNQFchu/WFL
	ySvEew/tIO8xUMS6EhhqTivJRZ8gQ4wZM+Fe0mi8ODrlUkmzJgEsJDYnDWZ4PzV3tEqulmmosMl
	r4VpNHKAC6K93X8stJdeFbhNKdQ72WNKjCEJzCgL9WUINFJH+QDV+ipp4QR+3Bz0=
X-Received: by 2002:a05:6a20:4e9a:b0:38e:92f6:9ab1 with SMTP id adf61e73a8af0-3b4b1ff2723mr1938599637.22.1780550808949;
        Wed, 03 Jun 2026 22:26:48 -0700 (PDT)
X-Received: by 2002:a05:6a20:4e9a:b0:38e:92f6:9ab1 with SMTP id adf61e73a8af0-3b4b1ff2723mr1938578637.22.1780550808487;
        Wed, 03 Jun 2026 22:26:48 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842820e8e6asm4493678b3a.0.2026.06.03.22.26.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 22:26:48 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Thu, 04 Jun 2026 10:56:10 +0530
Subject: [PATCH v4 04/13] dt-bindings: clock: qcom: Add Qualcomm Shikra GPU
 clock controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260604-shikra-dispcc-gpucc-v4-4-8204f1029311@oss.qualcomm.com>
References: <20260604-shikra-dispcc-gpucc-v4-0-8204f1029311@oss.qualcomm.com>
In-Reply-To: <20260604-shikra-dispcc-gpucc-v4-0-8204f1029311@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: LtByUIJiNLEPlxQMv71S3UtYPexyNoML
X-Authority-Analysis: v=2.4 cv=M8h97Sws c=1 sm=1 tr=0 ts=6a210c99 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=tQxzmpfZ-Uf8aLjc2qgA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: LtByUIJiNLEPlxQMv71S3UtYPexyNoML
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDA1MCBTYWx0ZWRfX9wbEmBIXxr77
 RWWGGFNUwx5mPpDrGIPy3N9qGTve3+NG96mKbAixzZLT7RN/MOmuWASiu9MhJOmNkhg/lwI5nCU
 cf7mk8ce5kbQuFpoZsH4yBoncaKSs1yWgiTgYcx1nXrSyiK9GsOBOe/bNvjq+RA9C4IUXBGc4sN
 21FR7PwOeggp49DW8U+NFccFlmHAbhhaXkMdv80w5K3gfzxn1TPfPPQ3ZWKbhe3uraBpEAQgxiA
 bpIlyQrb/1C0Xx/rWENta7Z01F/jhZz3RaIE+QhuAMQVHKA32cZW4TdhqTFLOkPyZkHmdfJC9pU
 qV3AETfFV5OXM0a/AL+b+wZd6YTU59rEtQvK8yGxalUb165O9X6/0H11nCJIBRw3GUIOURpBXL0
 XS4vTlklycg0vY9TL/2+NYOJFkObBwp1V8JHAWvvYPA3EA4udX4FE4Aq2/GBxsSxLFAw1GWbhtE
 ZNanZZZiKLCf4DmVn6w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040050
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111120-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
	FORGED_SENDER(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:loic.poulain@oss.qualcomm.com,m:bmasney@redhat.com,m:ajit.pandey@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:imran.shaik@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 498BA63CF5E

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


