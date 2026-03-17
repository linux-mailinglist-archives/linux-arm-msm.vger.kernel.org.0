Return-Path: <linux-arm-msm+bounces-98114-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mGadMeweuWmbrQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98114-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 10:29:16 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DE9B2A6B65
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 10:29:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1B88532E1D26
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 09:22:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A59D235DA42;
	Tue, 17 Mar 2026 09:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IBjqnnLi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kbnf9CC+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62C9835CB7E
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 09:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773739295; cv=none; b=rVzilXv5s3hrYNZyaabKMwjRFPB0ADDgmMKLcsXLzMjhObAW/YT7SvEz4lEO/7K5b0FPBVJqPBp6btOk1O33B3jnW95TqNiliS3R3qHac2hinV2LmcQMwY9zpuwK9jX8hPYCMCh1wLwZPTynCjJ8hsSSquWIfRQma8bV//udBlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773739295; c=relaxed/simple;
	bh=mn3vp2GeE4VYgG9OnPMhnQiQ0TVYi4qOkzgc8W0I0jE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QrT9Sbonoa0oqdVH4qRTDAEofk9/K1yCDPYm7HEUsRLsFjZc9H/LscH9yE3Gg0tcg0SzaAjpSqxwgdflK0WTjv3uQ9x2JOmGaCa/Fkfdu5P4+OdWNoA///fKWhRFs5qc7cb1JLTdxYmPbKaY+9EKNBc52oy5C5+I95U2gsROOTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IBjqnnLi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kbnf9CC+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62H996I44022277
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 09:21:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KflmNQXpDp+B1vYqVCrRq7N42vfr2cm4gnAe7kporG4=; b=IBjqnnLiCVC1yIxa
	K/Op6QbHBC2NFkL1SExe/+AWlMgF+peKj+o19zXqn4xukhywjos3o4WKY2VD9H4N
	Pg3bXMY73g3arozcnWK+otNzV06RLTqlCgXE5q1wrbx6y/Veaw2o8p8rBYPy6U3Z
	1YeN8Iaeu4kS/F8wCLGn8B2Pwgz8/On99gcEv0AJfcfpZULu2bvLlSuwwFiZCaAw
	dpaLJondhl166hCLOu2Q3XYb8eC9JuqH+Aj0pqMbNfUJqpMEyn53s1uJZn+PXCqK
	NtgvCYwKfN6emoN5Je3a9XaHQRF7aibho4cq5WbxegeA3LGK3oHZJNH92aEEElmZ
	s3JcZg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxn3fk2fk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 09:21:32 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35b8da51b3eso3185470a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 02:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773739291; x=1774344091; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KflmNQXpDp+B1vYqVCrRq7N42vfr2cm4gnAe7kporG4=;
        b=kbnf9CC+KIgiyAXc6EhLkHXOoYoEdQ+6lZQ866ugRBoJoesgNB6J7i81crE/ni+Qp6
         D0XWWb+VjeEZ9i7dxs3/UVAsoDIHn2Q5Oe1HSaOwRwvSZdwndATRquH7ZW3fWHeu6K+x
         y6cTdBIJEM5dwxNKjMgTQqFh6tMJlL1fdEsLGfzExEKsEM1TvEqpbUJ+mLP/deoy7k71
         O/RGZ31o9tfNXfrpz6BJGDY2PnlXsA4NxSakGsD6fsiWZ/CgLeUyvHOtns3gxHn1NF0h
         l9bmIPJ8erV42L2htFgaYusmVI20Z5bfS41Lxocu7f4IoABL3ZQmRxTJZrWZO5pQWkgr
         VNCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773739291; x=1774344091;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KflmNQXpDp+B1vYqVCrRq7N42vfr2cm4gnAe7kporG4=;
        b=UJ5p0JB6ERPbQFuzyWJwKODO8pPPjLeLM84T+OrghHDFQrNensWxnxIdh58sRsKeuf
         zwx0gkTAK9k07Ju5Pyp+GOTm5dcvn9ry2R4Y5VPhzwlZHRT/FPKlVPrhxHdf+vWw9IVz
         npOIQjbZMuMz4BHU8tfJG7zotsdZtHj/0hqEte+I03vgQPFA11rYbSkyXJJ02SwKjoh6
         mquuD01EPD2alt3TLKVQHSYQpVuVvClMGOTCvGh0DYWFy+xhv3SibLk8H3K9pzsJSDAS
         WPTWfzh9jejXmQzA7rK3FP4uz+bwBJPXmyPeOeSSPu4ySfg9t1jfVAmvGBCPQsd0Aukh
         sY1A==
X-Forwarded-Encrypted: i=1; AJvYcCWuZvP8V+Mk+ttwARJveruBSOl+6XjGITtLLtgdR5ALcdAEV+XCL4Coe3uxQ1yncxP1PASEoZES1O++e7mi@vger.kernel.org
X-Gm-Message-State: AOJu0YywLnWFQhbZEzY4BFqPyKwnWMb33O3eP4uX8yJY/qexvJw4blUH
	esd1pfLMehbGu5EEtnqaNdvLL5147AYMN7PU5Ce0Fwmrlnr1NAdsNBxdp5DSMZyEgGrI97VuXW5
	bIQUWcKxkgwSfhKmNyRH47K69UGLUMnzOB7hWzGlgVi1v6SNGhYCJqtWub9YB/aMJdZbU
X-Gm-Gg: ATEYQzyn2afjTUAz81+g82ktnbKgyPlfsjGgMVJxgjOzSEmLkocmVo3mAL/DIVu3y99
	ULr3OiQGfGkKZdYRA8NweqwuSqtvu1Ci21G97b8/+OIS0efGMbrvx5w699OBJcFLLmpAcMtpq9y
	wbrfgFy1ydnXDI2Lz+w+s19Wht3b3b6YIBbz5IVh+d2jPor8N7jTI4AB1K/ZEtrgDI+Cc4p5aZ4
	9XrIV7k0ybEmbuzKqN3J8Yi6DveIVoT6CnMY4Ve9C4OfnGbucKgnvAv1DFrY71Z5UtqfroYHHXQ
	lUyPDh1Y+hhQ012BSrJlGUaeLj4pkcX2vPNMXbB24/GrTk5EiRvkRz/JjSTFdKrNwZYD/hb4VB7
	ouu9rpGn83Sa1xv766gEuJ5S5Ih5jh8Dokm8CVgvJTOLW/30=
X-Received: by 2002:a17:90b:2686:b0:35b:9ab6:1d4e with SMTP id 98e67ed59e1d1-35b9ab61f12mr7133824a91.28.1773739291192;
        Tue, 17 Mar 2026 02:21:31 -0700 (PDT)
X-Received: by 2002:a17:90b:2686:b0:35b:9ab6:1d4e with SMTP id 98e67ed59e1d1-35b9ab61f12mr7133804a91.28.1773739290700;
        Tue, 17 Mar 2026 02:21:30 -0700 (PDT)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35badbcdaa6sm2331968a91.15.2026.03.17.02.21.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 02:21:30 -0700 (PDT)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Date: Tue, 17 Mar 2026 14:50:41 +0530
Subject: [PATCH v3 02/12] dt-bindings: crypto: qcom,ice: Require
 power-domain and iface clk
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-qcom_ice_power_and_clk_vote-v3-2-53371dbabd6a@oss.qualcomm.com>
References: <20260317-qcom_ice_power_and_clk_vote-v3-0-53371dbabd6a@oss.qualcomm.com>
In-Reply-To: <20260317-qcom_ice_power_and_clk_vote-v3-0-53371dbabd6a@oss.qualcomm.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        cros-qcom-dts-watchers@chromium.org,
        Eric Biggers <ebiggers@google.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        David Wronek <davidwronek@gmail.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Alexander Koskovich <akoskovich@pm.me>
Cc: Brian Masney <bmasney@redhat.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Gaurav Kashyap <gaurav.kashyap@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773739265; l=2093;
 i=harshal.dev@oss.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=mn3vp2GeE4VYgG9OnPMhnQiQ0TVYi4qOkzgc8W0I0jE=;
 b=FeE5ZqbJvz3uxUXrsgHJcJZp18l0b/x5yjyqCFcT50hfVZuKnCshbOihBpNkExh/YoQMBrYlb
 WsBpyvY38HFB2x/gWsnl9E7ibcAUtsg4kS8iWnU40UnzmBtdboUYaMt
X-Developer-Key: i=harshal.dev@oss.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Authority-Analysis: v=2.4 cv=C5bkCAP+ c=1 sm=1 tr=0 ts=69b91d1c cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=_NrYQG9o62cfQ7DVPTwA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: aYKawuixPt0anK_lZRWM8-IUXpPYx_1R
X-Proofpoint-ORIG-GUID: aYKawuixPt0anK_lZRWM8-IUXpPYx_1R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDA4MiBTYWx0ZWRfXwZM8K9Al2DQT
 SIneHmPUOVf5HFEl2OVSNrJqj6qim+W3PR2y9ydQVpOBXEBVl0R10kXcmAb79Mrr+xWDIgKWGFd
 pS2++pK5n9BYJcs4InsIOuL0DhvSvgtiBe3iMvo/+JAi4UPy2nqvzOlcoSmplogROF/8yxf9AQT
 VWI9JKqjhDUKcmBxCZaD0IIZEUiGVhcVTIe2U93VfhbxH+4wGDgQUXnhwnQhy1BToWbzELdInC4
 KYdqGUXa4XHM8SUCsuXK/RTlYXHa69E4Uk04c7AIshlBVEyCpa4Ypksgr+QI1ROox26kgpg57NQ
 GI0mFU7zHpigDWGGIXiErpj8J9pV9osoKXCW3VQ9Ib4qCiVyR5chyIG1defkV/ynH8Gld4mYOKm
 wbSzHwKPUmYApgaPbbaskn1cI9kS+mH7hAE7w3VPxQlWg/0T6fJaUuz1sl14W+3F/VAWR/CCxVh
 xMIPIOb5mTisXZzOzig==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-16_06,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 impostorscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603170082
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98114-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[gondor.apana.org.au,davemloft.net,kernel.org,oss.qualcomm.com,chromium.org,google.com,gmail.com,fairphone.com,linaro.org,quicinc.com,pm.me];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[31];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[harshal.dev@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5DE9B2A6B65
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Update the DT bindings for inline-crypto engine to require the power-domain
and iface clock for Eliza and Milos.

If the 'clk_ignore_unused' flag is not passed on the kernel command line,
the unused 'iface' clock could be disabled by the kernel before ICE can
probe. This leads to unclocked ICE hardware register accces being observed
during ICE driver probe. On the other hand, If the 'pd_ignore_unused' flag
is not passed on the kernel command line, the unused UFS_PHY_GDSC power
domain could be disabled by the kernel before ICE probes. This results in
a 'stuck' clock issue being observed when ICE attempts to enable the
'core' clock.

Therefore, both the 'iface' clock and the UFS_PHY_GDSC power domain are
mandatory resources for ICE which must be specified in the device tree
node.

Fixes: 618195a7ac3df ("dt-bindings: crypto: qcom,inline-crypto-engine: Document the Eliza ICE")
Fixes: 85faec1e85555 ("dt-bindings: crypto: qcom,inline-crypto-engine: document the Milos ICE")
Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
---
 .../bindings/crypto/qcom,inline-crypto-engine.yaml    | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
index 99c541e7fa8c..ccb6b8dd8e11 100644
--- a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
@@ -54,6 +54,25 @@ required:
 
 additionalProperties: false
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,eliza-inline-crypto-engine
+              - qcom,milos-inline-crypto-engine
+
+    then:
+      required:
+        - power-domains
+        - clock-names
+      properties:
+        clocks:
+          minItems: 2
+        clock-names:
+          minItems: 2
+
 examples:
   - |
     #include <dt-bindings/clock/qcom,sm8550-gcc.h>

-- 
2.34.1


