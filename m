Return-Path: <linux-arm-msm+bounces-110664-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4OR6MyfOHWrHeQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110664-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 20:23:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 934C3623E13
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 20:23:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DDF7A306FD99
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jun 2026 18:22:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 712713E9286;
	Mon,  1 Jun 2026 18:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="itk9Vcaa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Tu8dpUxg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 351FA3E8358
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Jun 2026 18:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780338134; cv=none; b=Aso2fqSwE3FnsKKrdA0i7ryVuCAdhU9tEbHUoayMeF2hnZrKimrMQ1Mo0V5Jn0dnSi+F/gn7jCxDkdndSjn92JuzEzmjEwvZvgQL9n29GtH39+vSxpmR68FozCZ0HVj7kviTvyNvEaWnNu05D8NH33v0oS4TQJjekKnMoTAqo5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780338134; c=relaxed/simple;
	bh=B5z29ywrBKYbX7HkV5T+1ROTV9fAvOR3TfGmv4njIVU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uW1msQGAVy4kpaq6oA7fprfO9wmzNox0Umor8lQJrcbKgfC7M1oQdckfUeCWTrBxK3ufmnoy290vcBxM/Ozxvjhyl/oRDvvomyttLgvyp9x45dUT4cZC98V5fvTpjJnODvTkfIgAw2+hmTJs8a9Kft2aOFjDuRXI27SBZ1phP68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=itk9Vcaa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Tu8dpUxg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 651FeZdF3372584
	for <linux-arm-msm@vger.kernel.org>; Mon, 1 Jun 2026 18:22:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EZxgtPE3V36We0kq/nIqe2bKsweupeP7AxqN5pPOXwg=; b=itk9VcaamUx9pmFR
	2VCZwTylg/UUaEMJ8FiCUYmPWk/DxgEG/PGx7R3aG2xYceUcjG3vjbYtJPfncyz3
	eEVJCvMOxTDQdmCcG82w/SbiG8m5kI39u3D2QU3mn5Vg8AdwvemEHyHjr7EpVN+N
	sXPNup9q2TRhl432NR22cI1yDERbPF5u6TzRiVe+MW5su8Bd6J6CsYjOzXqHG60k
	73CKkcOtKr/co3LIxhr56acnwJSkl0dqg8Q8tU/FUiFh4Vr2MZy6P5pW6/FBYy+J
	2UKGCD/x0p1hD56gexKoQ/rBQdtH4qBHoeMU6IUKX4f5o6RDCDlFyaXzRjEoWEAt
	tR4ACA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh7jha9ag-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 18:22:12 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-36bba9b849dso3437618a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 11:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780338132; x=1780942932; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EZxgtPE3V36We0kq/nIqe2bKsweupeP7AxqN5pPOXwg=;
        b=Tu8dpUxguEiApCNU3suiF0uNXDpqLCNrKzOXumkZisx0POOcRbLpaZ8ChbFo++0aN8
         74nWm+9jMgOp2kkgVXp59pNY8rXXhzTYQTvgwYJc7Sx4WjstOmrWStV+ROWVyEL/xroe
         TqeJOo3/78GKL/2bfOQXF5qjhk7cugxtFW4WlBFee26O403CvRhSlP2ypMpnVmM8X2Zg
         1igHTCU5bXTzy7BJeJaZt1+5mGAShGDjD4blbp881jFG6jz3JA3o7NzVHmnXq2q9Pbmv
         EqelRjBwnzlEhO3exv174SnQOHE3DXVS9BQtJlyiNyrfVkbe9UGXs20RYlLASX+G8BrL
         gbOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780338132; x=1780942932;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EZxgtPE3V36We0kq/nIqe2bKsweupeP7AxqN5pPOXwg=;
        b=FZKak6fFRRNT0eof6Boz4BC/MboHe734p8+qpZ/dsz2UAVlksw7wPhJA7BaZPW0MM4
         5+3D8ew+4nf/sd2n2qSUx8BqW/+Vskx8p+TaxOeXvmP8zVcKewIY+F4kMlBoEkMJs1gF
         ofxZGGCCyc3vWbJaIR9+D34L8/IEyVykERAMwsuMSPbDPpOCNsxrUONgHxzDfDgOk9Ki
         /sf/tHdLDuEC5nkDPetja1KUMVPZuRXUCqIkUl1u7UNtCKq1RCPhx0LpNMgpFxTouge6
         MEwk0mqIXYgkGS5n563amV7C1dched/4nBcq5/a5BvR/Myf6SfdC2Fb+Sy645MJofF4a
         ZBvQ==
X-Forwarded-Encrypted: i=1; AFNElJ/rnrMc+amfQGFGYDaVPpPhICvCe8GOgT3IbWF9HsKate4gB2+8NpT3RTq0y1W1/gtrOIpRQXegdIoEEmr3@vger.kernel.org
X-Gm-Message-State: AOJu0YwQindKt58EkhTYZ26bWHxjBgHScdyOeo3GMe1FuioRG02j+PGO
	r7uCHrEIXIfaDme91uVlgFfc3qTujPLhVZyDSiRBbjaqSJCLWF5wWZggYBqmTMyxRm+QLhJDL7Z
	u+gCx7giN7kwOxNwJj4I5gX3G4gN1HySRIfOuAG7eTXMOuw1H5oPSfVGymMLtkQeFlRuj
X-Gm-Gg: Acq92OErcrKRpHcbzhPP0bZCbVZ90E7E7xfPh0FBwL2QLj3byf/9FunwJ49iZ4Sp2f1
	TX1erpJ9m9+JKRWP7NL2b8BWqS/TTXGa/UdryLwCGXDeIqGcvOu26yg9BGrae/hcaopl9eJ/FZb
	a+yIDNI0EkgHb0pz6IxHdw2h/Zck6euBCOJPUFOUzUYCH0DCdw9SoiNUxVD/a7nSC/Z+zpFdUiv
	TNF5Lvuh3SgYSokfEwCwkq/8LN0XN4pXZQIlgn9+Sf/fmmSWGLcmYJ0ZXATSZ/ETZ/IoInNWYLq
	d/iilKAP7XEk0mLuZXfe6TRBmRseizYyFSUK2DeKnP5v36ePmcjm4b792rSO+CBFnycOQTis8i/
	FhlH/V80vsx14Pn0RIt6F4LUG1kMnkDzjhj2fKSMwLgzCBc8EruqzhTM+G8ACYUY=
X-Received: by 2002:a17:90b:5704:b0:36b:93f7:a903 with SMTP id 98e67ed59e1d1-36c501c74f8mr12420757a91.18.1780338131703;
        Mon, 01 Jun 2026 11:22:11 -0700 (PDT)
X-Received: by 2002:a17:90b:5704:b0:36b:93f7:a903 with SMTP id 98e67ed59e1d1-36c501c74f8mr12420718a91.18.1780338131265;
        Mon, 01 Jun 2026 11:22:11 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36dd918f069sm326613a91.1.2026.06.01.11.22.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 11:22:10 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Mon, 01 Jun 2026 23:51:24 +0530
Subject: [PATCH v3 02/12] dt-bindings: clock: qcom,qcm2290-dispcc: Add DSI1
 PHY and sleep clocks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260601-shikra-dispcc-gpucc-v3-2-61c1ba3735e8@oss.qualcomm.com>
References: <20260601-shikra-dispcc-gpucc-v3-0-61c1ba3735e8@oss.qualcomm.com>
In-Reply-To: <20260601-shikra-dispcc-gpucc-v3-0-61c1ba3735e8@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: Gfky0Dfu1SMwdfZYfenRxSBU9zLRayQE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDE4MSBTYWx0ZWRfXwJbqpIJp0mu6
 Agw9eT2yAScXMKvR8PMXgdwvJy5yLziNjC+OLJ4U1ZgXYquhKprNnupCW1BdYMgzMpvLsk20TRE
 10yFcH60tnIGEcnzb7/8cT1/FwPPe5npf85OuBHO8XehSusTSsIfiEHLdiKSPcZLqvyzcGf/lPW
 a2cTOiEHh8v8c/Wepclg2fFAw/G4OmV+4nHCk5eF3DQY1bSNU7LLpcj4Kxm95td/npn+SpnVGkf
 C7Iw7Eo5OMtUDHGXUSayxQwabmCkgICqqDIf/Z9QCsY4duX6/AqdYkVcK+tLfOZtUdIWm1gA0x5
 OYvpjBmHy5pFF0MEvVOAU25Nz62U1FrpV1MWQBWiGHTLu0/muDSbWIcznZj47o8/C56bVRWxqXk
 gR23BEwBBOHUWVLWMTcGimxbyiBWvrgzX27E+N3Tap6ARS4HRApk7RVGH4+i1YEw83G0dDjZJzk
 7riTOEdckII0Z6tC0Eg==
X-Authority-Analysis: v=2.4 cv=YuY/gYYX c=1 sm=1 tr=0 ts=6a1dcdd4 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=z-ZRDpFp9XMTG1_t9IYA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: Gfky0Dfu1SMwdfZYfenRxSBU9zLRayQE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 phishscore=0 clxscore=1015 impostorscore=0 spamscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606010181
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-110664-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 934C3623E13
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Update the QCM2290 DISPCC binding to document additional clock inputs
supported by the hardware, including DSI1 PHY byte/pixel clocks and
the sleep clock, alongside the existing clock list. This is an ABI
extension, and existing clock inputs ordering is unchanged.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 .../bindings/clock/qcom,qcm2290-dispcc.yaml          | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml b/Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml
index 4a533b45eec2d8e7b866c3436bfe6f80fcd714fb..24f2cce033f6e109b65a79553fba5295eb9adf3a 100644
--- a/Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml
@@ -25,8 +25,11 @@ properties:
       - description: Board active-only XO source
       - description: GPLL0 source from GCC
       - description: GPLL0 div source from GCC
-      - description: Byte clock from DSI PHY
-      - description: Pixel clock from DSI PHY
+      - description: Byte clock from DSI PHY0
+      - description: Pixel clock from DSI PHY0
+      - description: Byte clock from DSI PHY1
+      - description: Pixel clock from DSI PHY1
+      - description: Board sleep clock
 
   clock-names:
     items:
@@ -36,6 +39,9 @@ properties:
       - const: gcc_disp_gpll0_div_clk_src
       - const: dsi0_phy_pll_out_byteclk
       - const: dsi0_phy_pll_out_dsiclk
+      - const: dsi1_phy_pll_out_byteclk
+      - const: dsi1_phy_pll_out_dsiclk
+      - const: sleep_clk
 
 required:
   - compatible
@@ -61,13 +67,19 @@ examples:
                      <&gcc GCC_DISP_GPLL0_CLK_SRC>,
                      <&gcc GCC_DISP_GPLL0_DIV_CLK_SRC>,
                      <&dsi0_phy 0>,
-                     <&dsi0_phy 1>;
+                     <&dsi0_phy 1>,
+                     <&dsi1_phy 0>,
+                     <&dsi1_phy 1>,
+                     <&sleep_clk>;
             clock-names = "bi_tcxo",
                           "bi_tcxo_ao",
                           "gcc_disp_gpll0_clk_src",
                           "gcc_disp_gpll0_div_clk_src",
                           "dsi0_phy_pll_out_byteclk",
-                          "dsi0_phy_pll_out_dsiclk";
+                          "dsi0_phy_pll_out_dsiclk",
+                          "dsi1_phy_pll_out_byteclk",
+                          "dsi1_phy_pll_out_dsiclk",
+                          "sleep_clk";
             #clock-cells = <1>;
             #reset-cells = <1>;
             #power-domain-cells = <1>;

-- 
2.34.1


