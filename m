Return-Path: <linux-arm-msm+bounces-111758-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xqUtDZaFJmoOYAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111758-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 11:04:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C8C865459E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 11:04:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="Hz/bSFty";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=SXxy9FxV;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111758-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111758-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3972930BFEE1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 08:48:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD5313B14D2;
	Mon,  8 Jun 2026 08:48:30 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B78503AFD19
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 08:48:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780908510; cv=none; b=NqT/vJJT/WJ4dY4zUvO8RO4V+pUk6wIbxjtHBflrImG+AJ5v4Mb06wFWndmlHn4bGqKw4HW4lT0Ede5F9RyEHV/IjMNt8UNiMQTaXfD5I1YKu/CeeUtiDiQ5ody3V8JNbDLkT1jd03FkJRGDt0QsbTBJvalSFP54xP7h1Rz1fpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780908510; c=relaxed/simple;
	bh=xeSQHPitzN8ohDKs18l6esrdselqsjwFIBvIjhevBqI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WkgmNxhs3QHZq3R34miKAm60NT+0VfR7gmf+LuMOeptyinZ95SmfSS/jY8PSA2yze1ufuD+aZxv8qNVMhN2LyhS5JllOzhJGKDejlUKOtRjy36wZm83zrjRr/1DxEyRTgJ5Tt9+Frp41wLDgMr0n52ZVCh6LxcY1vl3jXww+eIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hz/bSFty; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SXxy9FxV; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6586OujN2384705
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 08:48:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wVm4TdG5n8U+Jqzsg6ytMrzaYYKYP9UWAt7EIHGxQss=; b=Hz/bSFty7HgdrBau
	e5hogukicKy1U20NFq5et88eBdyW+eCgZeJMxZNvbH9FoXoUiXlXZSvpNjFtabG8
	4w/e8cX+l1yrjNeRVSWXMPGauu5jpTu+mrrTVDB4cspCNyzi0yBjkdpCGRsINXqY
	2c/iLWUg3iF2WkxUHeJcFteUh04Oo86xEixQfM9Lz6U57h/mILAYFCJRjiLX/jy0
	Ndzu9tVc7CyC7ux64pD6wMju0IiWRvQsIewn2mJKzcloUCLf88V+sYl8YLrXgXnw
	MMHLfzspsHuJQm27nCWCpA3M+ZDdgjMDLDInILza3PnSwXp95/sV/HLVb5xP97Aq
	NSceSw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4embs1esnm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 08:48:28 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-36bc380fbf9so3991376a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 01:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780908508; x=1781513308; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wVm4TdG5n8U+Jqzsg6ytMrzaYYKYP9UWAt7EIHGxQss=;
        b=SXxy9FxVXD/YTdBZzy+v891TFC6Us9XeG7MjuRZrwbu5kmQBPtSGoWBUjuRP4g9lc6
         heZKLdoaX8cjftS1gjBMY+02a5SsLb6bjepdaRQJ9KAnqsvXQWZNTlVg1D9SfAai6wCK
         wNxJ8lTpM111xDWLO4Pi2bjBmo6tLC16W+kxCgn1k7veUfwY6QflfajfJCZSN4c5DPaQ
         kEe/VnQ2c06ovi6bDvvCvYqYacslInkROU+NnyLAT5UAcwPv4gdXyojfhPLyveqAUuCR
         G2M6sJWIIs8qlocuSOykfQAiRq8UNoxliN4oSV7lLn2fXVXQZMGynAzcf1fo3fz+/8Qi
         CjDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780908508; x=1781513308;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wVm4TdG5n8U+Jqzsg6ytMrzaYYKYP9UWAt7EIHGxQss=;
        b=CDP5BDqX9v5wzaQ4oFPqznflLeoJ0grL9xou6+9NeFg77YMUcfTpcEkWc75+mCXl5B
         9wSMOl5/rkUQXp54lfbuYJsJPqD2sNlWKXPxE+sx9DyRqdH6uoxiTeuRaO9nPF7jFIK1
         igBKaYo6ZlM4Br0zeViKs0Ubpv6L0KQrgPHB/mOKqGMbAuknM7DbbwetcNtwZf5GaNFN
         Zn2ELQkLZNhwMQY5eD0Cx+E7jUO+QvgPcP4YWBxP5rmuTM6d9pzchQSnM9jaNNKuNMjW
         5TQXF4xpX8hKHzpkqoezoosJrnT8Hgsi8fjcsSnEx9VGJLNXv1QXNAu8HJ08ZL+slebT
         qisQ==
X-Gm-Message-State: AOJu0YxeDW19OfQ8AFxlcLzDfladn38/UObE2C3eObbBajKwq/6dfhJG
	nq8aOQQZZUydJ+WE1t5W1q+D3KT7N7Vj4Ija+i56KyFMM/cS6veHBxQYfGWq/syXYrm0EqjHyvy
	jR45WLoGHTM21Wk5XF9VPt/747S6M2G3YhcDWDYz+SaBZr2015C3kpzBfDE74Evk9N86f
X-Gm-Gg: Acq92OExX67fw9EP2wTF1IRzPpylMQb/jS9Ln4hM9smHeef9oCjqgbLqAV0JrsWc1GS
	3NpjrthoDz7CeZnOKESuYFv31Ijcn8T+qVRqC1j91Oy76y52COfdRrzisSAskrbaGldAlxPq6fK
	RJHOxfsPSY8dnH9gptE4MJobNMtzY5uyljO8JHWDdVIsP4HP9qWlaazavTUVb8NYBupiieJywkG
	Sx2JnX9zI+LDGJ9nR4gogGPP8hrp2RlsEF2mOqXd84Q80MWT84MTymuOXFmc8JAMiduWtvvxcdc
	bP4RW/SLeKjB4TJFeNQhmq2Ng3yiDotiLLFFTM9b/2ggfEOolwbHffA5XXHpPU6r3FOMdXRbj1T
	8vynsaPYCqlBEYe9CLqETNZmW9RpHHJuce2ZExKj5Usd34IL8GyZP9512PWgiR4Zev/Q=
X-Received: by 2002:a17:90b:5111:b0:36a:aa9:eea0 with SMTP id 98e67ed59e1d1-370ee6437b0mr14861341a91.4.1780908508250;
        Mon, 08 Jun 2026 01:48:28 -0700 (PDT)
X-Received: by 2002:a17:90b:5111:b0:36a:aa9:eea0 with SMTP id 98e67ed59e1d1-370ee6437b0mr14861329a91.4.1780908507777;
        Mon, 08 Jun 2026 01:48:27 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f712de91asm15070198a91.16.2026.06.08.01.48.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 01:48:27 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Mon, 08 Jun 2026 14:18:13 +0530
Subject: [PATCH v3 1/3] dt-bindings: phy: sc8280xp-qmp-pcie: Document Eliza
 PCIe phy
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-eliza-v3-1-9bdeb7434b28@oss.qualcomm.com>
References: <20260608-eliza-v3-0-9bdeb7434b28@oss.qualcomm.com>
In-Reply-To: <20260608-eliza-v3-0-9bdeb7434b28@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780908496; l=1706;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=xeSQHPitzN8ohDKs18l6esrdselqsjwFIBvIjhevBqI=;
 b=Sjyye9YT1bQn9mJ6+4RYuHC4tZCv5yvYzU6sZBbvTxZEUl7v12HTT5cSIJN4fkklVSTLMO3l5
 PsDZ6EIIgh8DlCs1TsOCS31yAStdP3uvP8PqWbGxiPtn0dFkAOO6eJR
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA4MSBTYWx0ZWRfX8BbqlgFcqAxr
 nfUgnn+LaoBKZpWpnAArv5NWN9efZ0zmUhYZ9CquYjtqhLZMMFuIOix/hi1qZNTt07MH9z5HmFe
 LzrD5GXLHrmQD326t7KtI2aa8j6TMufsvzH2rLUoikoW3UU4AjElehWQ/sgmrgBQMNg2j3m4ZBV
 wR1+cL9ZhVa2EJkiPbeabXiKnM6m5bfarSRyAvsMcZyDT1LajUyeLxrDxTwxrvOkDGR0C3bbGe5
 /+dHMZuCpijfSzRYuVsXhS6vza5XWR6NLTWWjkbsZMs9U902i9d8UF0hPButDfjCfCRtHm9mPut
 5cWa/eYh4kqgsstSbjsbjy4BGgkJpZwII8EfWnMRBoBtcw75Goa1IX4Q5bX2a/TtKqpCopOj0y5
 EVSQswC4TQitFeQu2N4U5nUJ20XK+maZ53S8QWY1kHg6cn+UHY1kndlXv9vCtOEt2T2gubUUzp5
 B6ZoIhJz75QJNaEfObg==
X-Authority-Analysis: v=2.4 cv=CeY4Irrl c=1 sm=1 tr=0 ts=6a2681dd cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=d5_U1CTwwdyySJRbjq4A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: 19dh1oY7J9G1b6CwKPOOEZD93Xcn5R3c
X-Proofpoint-GUID: 19dh1oY7J9G1b6CwKPOOEZD93Xcn5R3c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080081
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111758-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:mani@kernel.org,m:bhelgaas@google.com,m:andersson@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pci@vger.kernel.org,m:krishna.chundru@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9C8C865459E

Add compatibles for the Eliza PCIe QMP PHY's, which supports Gen3x1 and
Gen3x2 configurations.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 .../devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml         | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
index 3a35120a77ec..be4bbc327982 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
@@ -16,6 +16,8 @@ description:
 properties:
   compatible:
     enum:
+      - qcom,eliza-qmp-gen3x1-pcie-phy
+      - qcom,eliza-qmp-gen3x2-pcie-phy
       - qcom,glymur-qmp-gen4x2-pcie-phy
       - qcom,glymur-qmp-gen5x4-pcie-phy
       - qcom,kaanapali-qmp-gen3x2-pcie-phy
@@ -181,6 +183,8 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,eliza-qmp-gen3x1-pcie-phy
+              - qcom,eliza-qmp-gen3x2-pcie-phy
               - qcom,glymur-qmp-gen4x2-pcie-phy
               - qcom,glymur-qmp-gen5x4-pcie-phy
               - qcom,qcs8300-qmp-gen4x2-pcie-phy
@@ -206,6 +210,8 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,eliza-qmp-gen3x1-pcie-phy
+              - qcom,eliza-qmp-gen3x2-pcie-phy
               - qcom,glymur-qmp-gen4x2-pcie-phy
               - qcom,glymur-qmp-gen5x4-pcie-phy
               - qcom,kaanapali-qmp-gen3x2-pcie-phy

-- 
2.34.1


