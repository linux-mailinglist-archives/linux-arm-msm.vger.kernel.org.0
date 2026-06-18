Return-Path: <linux-arm-msm+bounces-113794-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wpjLIDopNGoiQQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113794-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 19:22:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E9CA86A1E59
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 19:22:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=BcAiT0Ss;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=khiLVkNg;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113794-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113794-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 05ADF307B19C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 17:21:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A5782EAB6F;
	Thu, 18 Jun 2026 17:21:34 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3027B347503
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 17:21:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781803294; cv=none; b=HFGgexEeWglCQO6qzJhc0BwIcMDN6OQs7lbVtEwxKl8GhgcHS657g0ZuFlWM6rP2CHqcke8l1zY1x3zNC+AXwAiRHdjQNr6kCUs20QwEhpyblRLO16ram4sI9rp/YIw7U/C1AplMt9IcViaYKUxCpQMkhO6/EYiM2aeA0zMAQrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781803294; c=relaxed/simple;
	bh=YI/Mex0URwAgKluiKtf+SUQ9oQRwcIZMu9IZBJRRJdY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FWHfX2E5eISJD8phE4Q6+/opRaswmx8M1DgaqBqzNX2Xssic/gyO1vLVsYXHBP+EpzzMCZmSQ5fUZS/MzsL+lG+N7qVF/TvH16G6gCFRLJyGfPA2/Wyhiz6d6pNSE1LZF3dSB2AH6JTI6AMNl8V+uDbODd5zTVQxtG8Hbu/Wmc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BcAiT0Ss; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=khiLVkNg; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65IFEAAj1559615
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 17:21:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sgjqfnwWknIzSecqro1/qEn4Fj2XfAEkQHDgkyYnuEA=; b=BcAiT0Ssy1ECh7Il
	B8J8mEfxQrSOl9tk+XyhEEZn4K+k0nXzEGO8AAWID0HEOCiM0iEJjxjiGOt7BI92
	RDX7mqcF/U7GYw3S9uijXenRFgV9OAKVpM6SucyLCnWK1pP1RyS1xcJ1tgR294Dy
	fL9SEhfNtY/lo+JT8d2mvjfFtmZ6CCm/Sykvf+oHkwA0aZd70IY9hvgQdp53fKZE
	BvGEFDCRPakx5IOxks5z2GOBAr+G6SKpJKWLgymSlYYNlNEdYHJnnNWlgJ7PsST0
	NgvDMC3L9gyn3m+Oa3XKScD+dx5prwwpqfZV7nbD0nIPICeBVksoN7/KpH97yx2j
	XuSXZg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4evdn41w1b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 17:21:32 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36d98b6f019so1347843a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 10:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781803292; x=1782408092; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sgjqfnwWknIzSecqro1/qEn4Fj2XfAEkQHDgkyYnuEA=;
        b=khiLVkNgsw6H6SWbmkGxqtl+xqbax4tr+K+pWFOS2WzH2BaRm0X9Wf8bscKoUyETHc
         O6rx/gnyICFyuzV4xfQAXVebrXC2eam2tfVrpCRGGIQujYj9GsVQq/5jddsYu7kWah2l
         EDlgQCo9fxK1I+r9laEVh8oXMB865uUvDXgOc3bo3WOXKPxgYF3dr4BQE5lvpHnbdMFr
         bjqKp/UqssgvARA1Cuw0d6rByJXv7iay0VEr8vpjbcCe2p42LIimb081jzQ28/pwd/ts
         uZnbeD4W6/OR/daBQepCilKPfBoPD4++n9BV0P8GczQxiJctrMereh0imyuauyTbynSf
         yCNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781803292; x=1782408092;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sgjqfnwWknIzSecqro1/qEn4Fj2XfAEkQHDgkyYnuEA=;
        b=PFtlXK9nlqYhMz56WYj8Yw3bZgz3IKza8b0JrEzse8Q+x1f7PDU6nsp5LOHePKggQt
         Un+v1vSg97xC6IgcTuolgsR2yqDQ23JSsZGvc/HQMcKCGpgHHOxd/F0OhXMiC/Og6TNj
         7cYO0Ya1bODkK8wYBRWpqUzMF5QDn+aKdMgxlabuvfo2ID23LMFNePjs8tvqgYulOGDT
         CPp2aurEyzxmw/9O0c/Dmc7D0OdLTFLHPxbV2TvwtaHEb9mL9NFO4LmmcM0/o/lvsaEZ
         SzQ5VKCDxjRSKf6GayMSPIN8CBL67+fgS2DE4W7rbBTj47KFUeFig5K3J9nOYdJscyO2
         zSNQ==
X-Forwarded-Encrypted: i=1; AFNElJ8qCovBGoPIdKzeIZnk0U4J1xtTNxwqwJBLNTjSg3YgfPk+iI8i7kfDGkKV7ryHrHNX7Nmu6E7lsY/mE3Vz@vger.kernel.org
X-Gm-Message-State: AOJu0YwUb/X0woLbzfS9khD8/tV9En622Cyxg0hbLp7Q3AaJiPvxxlDE
	4YoQwjNX8BxJLIWGIcksm3dKgtBHyg1RhxHlhjd4yt390k8ZcsVM94Pvj0bM4oH0VxHsxCRxjBQ
	qEppX1oeycfJPf3RcQ5Aoi2OE2ZwcX3nT4VP3NFJCxGrNiwmmn+KOaVArIZQtq3Vj4aUke2xvhi
	Yl
X-Gm-Gg: AfdE7cnUOn0h9q+iRJrwsxvGk8pisyeMMs5HphM3TXHZkzhpb/AmssBZohJfOIELeB2
	rjJtggPsRs7RMo30YHCUsElRNN9xJImdC4dISkwcB4Qcgj8zljiWHpzkFrxSKWumK+6D7BES9W1
	cxnyx4JV4X1iNDe+YRAgzOKRh6kBms/XlqHZNfrkN2Y92J7RdtOyVKoDhPUB9cq6oYAI8JXNSPa
	fi9o0YrmhSeeqa9LqB3oeTXaMCCFZ67y5hvm90/vqGpT0Fx9leRe/nOKglkFX7X+MIYwZznt/GR
	Wn8t8DqKfAOkyR9m7HHzj/L5RSZfvrES9nw0oSpFlKvkEOPXmMpj21Lnyxwy4VMC9g7zosNsRFS
	zpHCUTcX9UJ8GnUxs/0UB/buWjJr38xiARFg=
X-Received: by 2002:a17:90a:f94f:b0:37c:543f:b83 with SMTP id 98e67ed59e1d1-37d15dbec64mr385953a91.4.1781803291772;
        Thu, 18 Jun 2026 10:21:31 -0700 (PDT)
X-Received: by 2002:a17:90a:f94f:b0:37c:543f:b83 with SMTP id 98e67ed59e1d1-37d15dbec64mr385902a91.4.1781803291241;
        Thu, 18 Jun 2026 10:21:31 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37d15df8b8esm187129a91.16.2026.06.18.10.21.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 10:21:30 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Thu, 18 Jun 2026 22:51:16 +0530
Subject: [PATCH 1/5] dt-bindings: clock: qcom-rpmhcc: Add RPMH clock
 controller for Maili
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260618-maili_initial_clock-v1-1-d6ede0352113@oss.qualcomm.com>
References: <20260618-maili_initial_clock-v1-0-d6ede0352113@oss.qualcomm.com>
In-Reply-To: <20260618-maili_initial_clock-v1-0-d6ede0352113@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDE2MSBTYWx0ZWRfX/hQaTWXdDSoB
 lvEA2UAsCjbjdwxPOr50CFc9sKTQVRzAbroIIp7JsHwu56iwPK0M/+ND+3j/ZKk2DewwbK53Qyj
 JRA8qC1duow9lKryb2Xl98R7Am5OG4BArV1lVstadwRNRrDcC6GteQ8TtayaBIZkQkZvnUD+mXl
 2MNKYifK4KQ1QV9qtLXqpOT0eZ24seG7Aev4Yd+4oatrx9oZxe/6quvWp3GpBoe0iqzkvCYFcug
 A8F7+GLqiwtzy5yK+zKYj1qydSYPsdjdRuQFIbqTAM3PwWNbl6opE/g/mV0i6eyJC8fVbpcK9Wm
 +9LuYR5aCEoJBO/S3a9shukGiNowd7zR30RSbf9avftecAHb27AXAxPjBnWZSbzViqg43hF2TwC
 AtPKnHH+o03TZIfHkIn4W3v37NM5UYD+ujkt1aMWfOwL0Id+qzszBM3eGIogiwQot219IaNMz32
 C7/Z2guN1wbwqEXWYbg==
X-Proofpoint-ORIG-GUID: 5u6ewsKCAa0hWT6ymOhRaPp-Ef6vx9fF
X-Authority-Analysis: v=2.4 cv=FN4rAeos c=1 sm=1 tr=0 ts=6a34291c cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=OozyDhJeiyY2DhU_uTUA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: 5u6ewsKCAa0hWT6ymOhRaPp-Ef6vx9fF
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDE2MSBTYWx0ZWRfXyrebjI6epfvd
 EmtPioKRtfKVwEq07F1VBtG6KxmOg6JCGorBfADQ7kftMu8teVAXjdHTN+S49K0QuX6qmAKEToc
 grsJAa3pilSPI4Yk3QSFDSbFIfhPLAg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_02,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 phishscore=0 suspectscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606180161
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113794-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:taniya.das@oss.qualcomm.com,m:vivek.aknurwar@oss.qualcomm.com,m:ajit.pandey@oss.qualcomm.com,m:imran.shaik@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E9CA86A1E59

Document the RPMH clock controller for the Qualcomm Maili SoC.

Maili SoC is a derivative of the Hawi SoC and the rpmh clock controller
is identical to that of Hawi. Therefore Maili uses the fallback
compatible to reuse the Hawi rpmhcc driver.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 .../devicetree/bindings/clock/qcom,rpmhcc.yaml     | 65 ++++++++++++----------
 1 file changed, 35 insertions(+), 30 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
index d344b33860429527246484560823074f52a9159d..2b446aca5207c9cc2922635b0539f2d2f926ea0a 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
@@ -16,36 +16,41 @@ description: |
 
 properties:
   compatible:
-    enum:
-      - qcom,eliza-rpmh-clk
-      - qcom,glymur-rpmh-clk
-      - qcom,hawi-rpmh-clk
-      - qcom,kaanapali-rpmh-clk
-      - qcom,milos-rpmh-clk
-      - qcom,nord-rpmh-clk
-      - qcom,qcs615-rpmh-clk
-      - qcom,qdu1000-rpmh-clk
-      - qcom,sa8775p-rpmh-clk
-      - qcom,sar2130p-rpmh-clk
-      - qcom,sc7180-rpmh-clk
-      - qcom,sc7280-rpmh-clk
-      - qcom,sc8180x-rpmh-clk
-      - qcom,sc8280xp-rpmh-clk
-      - qcom,sdm670-rpmh-clk
-      - qcom,sdm845-rpmh-clk
-      - qcom,sdx55-rpmh-clk
-      - qcom,sdx65-rpmh-clk
-      - qcom,sdx75-rpmh-clk
-      - qcom,sm4450-rpmh-clk
-      - qcom,sm6350-rpmh-clk
-      - qcom,sm8150-rpmh-clk
-      - qcom,sm8250-rpmh-clk
-      - qcom,sm8350-rpmh-clk
-      - qcom,sm8450-rpmh-clk
-      - qcom,sm8550-rpmh-clk
-      - qcom,sm8650-rpmh-clk
-      - qcom,sm8750-rpmh-clk
-      - qcom,x1e80100-rpmh-clk
+    oneOf:
+      - enum:
+          - qcom,eliza-rpmh-clk
+          - qcom,glymur-rpmh-clk
+          - qcom,hawi-rpmh-clk
+          - qcom,kaanapali-rpmh-clk
+          - qcom,milos-rpmh-clk
+          - qcom,nord-rpmh-clk
+          - qcom,qcs615-rpmh-clk
+          - qcom,qdu1000-rpmh-clk
+          - qcom,sa8775p-rpmh-clk
+          - qcom,sar2130p-rpmh-clk
+          - qcom,sc7180-rpmh-clk
+          - qcom,sc7280-rpmh-clk
+          - qcom,sc8180x-rpmh-clk
+          - qcom,sc8280xp-rpmh-clk
+          - qcom,sdm670-rpmh-clk
+          - qcom,sdm845-rpmh-clk
+          - qcom,sdx55-rpmh-clk
+          - qcom,sdx65-rpmh-clk
+          - qcom,sdx75-rpmh-clk
+          - qcom,sm4450-rpmh-clk
+          - qcom,sm6350-rpmh-clk
+          - qcom,sm8150-rpmh-clk
+          - qcom,sm8250-rpmh-clk
+          - qcom,sm8350-rpmh-clk
+          - qcom,sm8450-rpmh-clk
+          - qcom,sm8550-rpmh-clk
+          - qcom,sm8650-rpmh-clk
+          - qcom,sm8750-rpmh-clk
+          - qcom,x1e80100-rpmh-clk
+      - items:
+          - enum:
+              - qcom,maili-rpmh-clk
+          - const: qcom,hawi-rpmh-clk
 
   clocks:
     maxItems: 1

-- 
2.34.1


