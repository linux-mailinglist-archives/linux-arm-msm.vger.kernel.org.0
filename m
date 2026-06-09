Return-Path: <linux-arm-msm+bounces-112044-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fn2fJdbJJ2ru2AIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112044-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 10:07:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4635F65D914
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 10:07:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=VbxeN0sF;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=fzSBdA5n;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112044-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112044-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 37B8B30F603C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 08:00:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB0653EA960;
	Tue,  9 Jun 2026 08:00:45 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A00303E8684
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 08:00:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780992045; cv=none; b=oq6ayhEQL6UbM20vVQVI2mjvGC/QMDY9/6DGY/EtlOrKwfxn10r8ygPsTN0OBn4ivEjReKKauhnpyhiSJ8mDhnjrQgedx6wpbyCvvnRPSHoitV3tdCRBX/1hgnFYLhfaFTvAg7n6dwfAQnHXJa894gCsd+wWEIJLk/PGkbFgqpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780992045; c=relaxed/simple;
	bh=kbRwuQ9nZ2E+SCI71TauiFrCt/9q8ASgqi1sojHFVAA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CUc7Nny/1LWoRneHWXM5ySSxiCaE6/p0IMHuwIllWoS9UkfN7xfp+ykoCKkmEj8HSuJ+3s5D/aGtMicBLWLZuy0c9pE/2jBdIm4VwZnTkTY/YA4tR2jvIkL9eFSoElV5VKcnWmOhmRbXAzzGk1wmmUClVdNIu4Hft2cyY3m5uHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VbxeN0sF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fzSBdA5n; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6597rVxe2040392
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 08:00:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JPjkYIgd6uBVjiXZO+qeuxFAyB9wTKc5Tj3EFD8yRO8=; b=VbxeN0sFMOtHB1kL
	64AnNv3LRu1Rw+29V/UB6grT9xkhjeyqAnGkY5jd182sNKvcUis2yFjt/a/cDD6W
	ShcLNryovNwsjIo+FAs5oSP9ClJLW+6gymN4D2iAD6N/M1xYtc4fRJRbxdKq28h0
	aAUds510ROaMg+YSxQXR4xUBanUEFI6VUfKmA3rEosjg3fgXTFQ0EIa9sg9vTk+z
	g8NUnpx9jEtEGULP1UYS89Leh0aCoxi2ikmqwLfMIhvzmR96vARlhmvMPWqZ2K80
	e87QA55Qkm0g3PqdcdIK0vcAyK5Wg0CePGZH/UOgE7fPUo1bAQn89N9tq/PLf+qY
	JwhQJA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enwsvcpgc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 08:00:43 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5178ae66ff3so86319291cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 01:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780992043; x=1781596843; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JPjkYIgd6uBVjiXZO+qeuxFAyB9wTKc5Tj3EFD8yRO8=;
        b=fzSBdA5n9pS7yBpMolbsVgY7dP07QhMp3+Tykwhhv01YfEs9ov/oBe95us9Ubo25+9
         jq3f0vXOTMLFFQy4mT+VL/KhITIzSHv9t96T5UG/It+JmabBNBlEgc/EkFnGWbtMLJo6
         IS5vXsbnDon3jCYeqYavKBiXwj31jzM40YyC79pEKq0V0gZCupkyjrCAdOH/RwkUH0Ix
         uTXOstxjQpS5Gq1MgMeKsGC9ibeO95Ua1POBU4R/tSx265s151G7EbaII2ZmVqOQKxuP
         4mGPPxkUrkX6Eke1mBm/7eEl58qurUK0YdNE7XjEz/dKmyPdBmBA9Sfxm0Rev/bXxFfb
         ZtRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780992043; x=1781596843;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JPjkYIgd6uBVjiXZO+qeuxFAyB9wTKc5Tj3EFD8yRO8=;
        b=fOFG7uXcFiUSpN4oxdpQIsi229rNqeNZjKgYqBTL1NDyTAh2Oik6MNz8aagFQzAcPD
         XMzI7nE7lWqk2XBWORrEwXFkkB77n1RckbD2BjkG1MUiLVyih/Jh7+HcBJxYDSIZZ5ui
         gC+I7ef6x1QQk+B4AmrMSe1mRr7edUf+U6bzOTnMbhTPW6lSgFSxpzIEW2F+3cZb43Uu
         h2K6VTp8C1wqfL80MFyVDHb5v0+BxXWWAMoWPlimDxcYrblO3Rg7X8nYPMdH87VScHyJ
         MtA2yMvX/MUTPWugqrDV6UjimLswx5uEkeJ0GA2CXiqEgvcrEVffP7I4D1AF/Utz/WY4
         I8Og==
X-Gm-Message-State: AOJu0Yz8/J6VsgNZ+OySitoU+zfp6aO98/mMaKhE0BxLN+9fpmMARNfC
	uWc1HAEzcpprqwpumcjYyRJ68juXJYzpd33AKHkbmxPkPMvjcc/SedkfZPuqXzgORJwiMmAf9uP
	En/zuXrZDiSlxmGiFIfVpLPrNodvDJdYaERObZpb+hqovpMG+Wk7AbTyb1XimyzUT5Wf8
X-Gm-Gg: Acq92OGO52apJ/G31cLCihJ6ydE0q6cFaArvySWcVZtc6/ufZaGPK4JgH0iwSIRbHen
	dVv3soCU0GuEddT5T9tkRFGYyK5lOwwhPfWtj5M+NWLIbcuRHdhbG58kKEjZVfZSJeeMyE++Tuf
	zxknUkJNxZ8cCE/QVys9PdAaV0Vwn/zeCXUBkx0/zY/8d4Y63WglsqREfdHe/u+7aej1QI7BaYy
	KaK586gpuRjkLlExuC69kGwY6wg5sZuY+foymkR2xp21QvT3rGNBlOt8KiZRvEZe+m8kW7wCDs8
	5Ym/Z7u0e0Kb7n6NPHGhJhJFM8+FOh7TCEkZPttragoQK2+blSMJhwEWdqTV0s6T5cTP9jkobcN
	8DF9eAURQg5882oJinw1+v851bBXm6qEZgHYs
X-Received: by 2002:a05:622a:4087:b0:517:8f2e:5d84 with SMTP id d75a77b69052e-51795a82bc1mr278417391cf.3.1780992042957;
        Tue, 09 Jun 2026 01:00:42 -0700 (PDT)
X-Received: by 2002:a05:622a:4087:b0:517:8f2e:5d84 with SMTP id d75a77b69052e-51795a82bc1mr278414211cf.3.1780992041273;
        Tue, 09 Jun 2026 01:00:41 -0700 (PDT)
Received: from hackbox.lan ([86.121.7.18])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f35fb24sm63605930f8f.34.2026.06.09.01.00.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 01:00:40 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 09 Jun 2026 11:00:17 +0300
Subject: [PATCH v3 1/3] dt-bindings: arm: qcom: Document Eliza CQS SoM and
 its EVK board
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-eliza-dts-qcs-evk-v3-1-b4e9b033a6dc@oss.qualcomm.com>
References: <20260609-eliza-dts-qcs-evk-v3-0-b4e9b033a6dc@oss.qualcomm.com>
In-Reply-To: <20260609-eliza-dts-qcs-evk-v3-0-b4e9b033a6dc@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1104;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=kbRwuQ9nZ2E+SCI71TauiFrCt/9q8ASgqi1sojHFVAA=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqJ8gh3TRIa3bX2f/KI6d+UqzM/18d9yHsx8rb+
 //D+k0V/U6JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaifIIQAKCRAbX0TJAJUV
 VgXWD/sFKc2yMInHC8MyDVv8FuDeQ9OYPKQ/pMJnBXmeN8rnsK51koqNsGedPTjT8Gxej46UgBV
 OpOLvMZcP2vBDbC+xlLoWlnE1HvrhRwXWbLEwmxk3gP0bjurcfuLUVqxnAz8uuV+iL/buH+3th2
 fl4uXEO2tT9TWLnKTk7PyQ+b/Fp6PHCjDunujk+lI6SKu6S1/SeO6Cf8AQGOCZRC6GsMk8wo3T7
 FjU+6gTdRiJx0xZqgyPRFqQIHyI7N25PWBwZpB7ryysX0WSPmReaAA/sTg81jyQHSaR0zb9pByV
 kcQpxwpxtcWeNM+vjjXvOhxP1S/n5kLiAUBgKn++x5M6hcbj8DGC14eJPzpQW8MjQMLHy/qgMAG
 rl/7s8Ts7HgRN4yO2xvjmwQMFHQoeH2Rju5gbS/4nQuFmP0Bvqst6El9vsTo357eZR3fHIEv02R
 YI64s/Swt2IyLu9BENOm8fZT0VTvLklQHQJZ1YXm8sG+9vTX74YxcnDypIjr05Yo03s0vlebh0B
 WuWmER3yVgryIrwPL2TD/BUyf8tBCTovQptTo3/dEEMzv8AM5kOFKovX0lK78qQEpo280EQHVGJ
 nBdGWdbFxu5y/JHlZO54Cj9rtjgTcW4p4uNPQkl7yweuEglt7S69XiC0YhkrlbwQCF3UzBOXWQR
 ZkECsRbBJB7Vc8A==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: V5xX4NvMNrtVkaiHvPeBKGKY2EaNnDp1
X-Proofpoint-ORIG-GUID: V5xX4NvMNrtVkaiHvPeBKGKY2EaNnDp1
X-Authority-Analysis: v=2.4 cv=dIaWXuZb c=1 sm=1 tr=0 ts=6a27c82b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=BSZ3G9h0/EKbgBlQZBbU/w==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=oLJjFz4unEmQByRrzroA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA3NSBTYWx0ZWRfX3HAZUwg7ztOv
 3N6H8PoA5l1Oju3tGH695J/6HFeqmIkADaf0UcyCakG/bHRJ/wMsw+SMI1naPvo2f6TypnAeo0q
 5Tp400k2s2lz3XvkxPXSite7uPpL3QnpbVX0ML/EtdO+wG2eZ2ujFUSmJ2NrTTSQx4eJIOOaY71
 A1jNVsJTutf3SOS98YaW6iM1fYQscsHf9EA359J4UEjniIES1+h67IwZ/PyVi5h46eziGnErxya
 PjkyPdYQeFDEF0Twb2Nk7bXNADIzfQDvNkQ0lo30ufneoIlrXneZs84KuUpdprJ4Xdg4F0zMRph
 Wm+iritIR9gzHrjN6l6Efy7PuF396WSGND6gfABS5qka6MsKm5VAl1naN4xPn8r/0ofSFL26MVJ
 VtdwK6u5ILV9ed/N7ZQgy3R8zvnhwVq6iy+TxEJd08oZ0cs/4PkytU4/nQcDJgTvApdyujvoc+5
 WlnqI477S2NoXpyvIDg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606090075
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112044-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:abel.vesa@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4635F65D914

Document the compatible strings for the Qualcomm Eliza CQS
System-on-Module (SoM) and its EVK board.

The SoM is populated with a CQ7790S Eliza variant, PMICs, LPDDR and
eMMC. The SoM is then connected to the EVK base board, which provides
a multitude of connectors for peripherals.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 50cc18a6ec5e..bf7df33c1da8 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -61,6 +61,11 @@ properties:
               - qcom,apq8084-sbc
           - const: qcom,apq8084
 
+      - items:
+          - const: qcom,eliza-cqs-evk
+          - const: qcom,eliza-cqs-som
+          - const: qcom,eliza
+
       - items:
           - enum:
               - qcom,eliza-mtp

-- 
2.54.0


