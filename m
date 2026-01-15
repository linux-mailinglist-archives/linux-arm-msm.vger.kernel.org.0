Return-Path: <linux-arm-msm+bounces-89175-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 467ADD23A1E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 10:40:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6A99F30A18E7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 09:29:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7B1335BDDB;
	Thu, 15 Jan 2026 09:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Umef+Inq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AMHE9UqL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65B77347FD8
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 09:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768469308; cv=none; b=gH/MvCg1hx5iiq0JefwJNPjVJOw5o7z0kgIC+fRVv23xiIh5wuBUIvtBbCRE2BhswxZxVGYK/Txd99wHtKS8BqwYsNgJqZOZs+kAiXXK93+Rp5ffvp3ShGZmAOGjEwcgyosC949f3r/H/WitBirrueF9+fsb36YU+QbwKqcaY/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768469308; c=relaxed/simple;
	bh=My1fBcYOJahtcVWu83tUb+BFOAQ62WcHLViUm6slC7I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=G4npbI+ymejg8L0VosnT6iZKqVPnbc6uE1W/eL1aveBRDYpJV2tKKcvyFliBTEkny75u/ickUGNQUPzzkiS8n718l4frjNpPfJy+IQm387SI3g06JQ6HpW3VmBjqT9CYR6p09KBfhId5FKzDcPWAY6NK/RV3+oIDvcYFqyAoIT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Umef+Inq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AMHE9UqL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60F6fwr83419619
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 09:28:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=tf4dNBy/KLh
	WAf/5SoedaBN7FYWOkjyT2K3kQyqfwiU=; b=Umef+InqOBFJnu5Z+DcXMfZ8ZkI
	llgTB2EeNIeb/ZplW98yyTUzhpYVrIy9m0v3OXsZN7fMwDeCXC10ZE53QdvqIY31
	kS/Ar0b/Krd6+JITa+SWqjx+sL3NwMhlx/77ozO0inXGoh75HzuWiGjTi5BPUl6k
	VvQ9/KUcLXojbalqEsS+yOUjUb0xA+5yf0MAv96WNXZrseN5TX952KBvlUYRNONR
	refiu8rxvWbxH6MpdmnvrKu2fSICMwQdm1/WBGzi/9vw4vwuizUXEikbAMx8VcR3
	ueT1T6jffJkQRCp4bGmia+G1cu2SWoYMKPZSrhf5gH7Bde2WgFDPYHX1N4A==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bpjj89x71-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 09:28:26 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-88a316ddbacso15833306d6.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 01:28:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768469306; x=1769074106; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tf4dNBy/KLhWAf/5SoedaBN7FYWOkjyT2K3kQyqfwiU=;
        b=AMHE9UqLYlOZ9DLXK7Oms613BCNyf2J3JVyBNfIxxVz2Q1yrNj/J78qsc2UEqKOyV0
         zNQocC0N5MsRnTYgyUlroIXpxL7Jk4OY0jqUMhiC/J57M0OzObxHHFD2nH7SvPpbcHcv
         dl9oF6jzeSf6eqPqJG0we8vdn6GBZiZEB7OOdVAFn9qGoje/NeD+1iRNlFgcxCh7Cc9y
         Nkry29c1QOQ6xW9rnkPglSGEs6yenOYZ9TvZAv0UPLBiyDk7zXCCct/s1F9LTlfyBi3K
         qLPkXkCb283Addxfw0P3jPTx6Pefjev0OWySgtQ8pSyUnfT93hH2ByIFvMx6+5s9gjSc
         oa0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768469306; x=1769074106;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tf4dNBy/KLhWAf/5SoedaBN7FYWOkjyT2K3kQyqfwiU=;
        b=sbkrLVQOfmP0NQmmvLeWpYnd018MO2mM/AGPwDzACVS7en+7od7sz7z0FLUXG93Clt
         CfNv4Ai4GeQEghlBAHwHQhYxJ8HF2XXXKvuhcAnHxr/GHLggoBokPC3SZ9ZNVwC6/SGJ
         XMUR80X49tAX5tVtFG2X9DtMntHD/0dziyRO/ADS7y1Zt9inXj/yYORRkN5nkDpgrvzo
         vNHza3QlAjZHnJ2RPSMKONSViMLWzRYmz8I1Q2KhZe7i3ZbbII3P/L+XgwvZDvn2TRaP
         xCdAaxB2HYFqyU30TV8bJkr4hYcibNrgj0iO5p8nqnZjk0DU0Zuuj9Z95ADOmZMPKXbL
         3lOA==
X-Gm-Message-State: AOJu0Yx86ZRehnWi6Rz8NXOxWDaw/VDeeU019zdQJbjrLR9ysJDvtby5
	4diKFKM0j9kYUBdndv8LhKmOlKqsHSGUTWXWy8BkeSxiH/3fCybuFiNWc3yhrq7VWQ08m26yVAu
	Ywhw2pOkWUH3cPPUJ6FMuLg0iDizYIfA8RyF8Vg4CWfk0Ki17ySFx2UeYqzC9lDzn4leH
X-Gm-Gg: AY/fxX7prMilYgAPLf5ZA1S6KM5B/vHgCYhQn2hFV6+iqVjeSTNFvyGaCiHXhAhdktf
	aC6eK+idFXLToR+Y5yV1LhJk/tfGa79DADLjb/FrJrJ/TD8lVlak8peLVqI/kTJ682Xum4TSLmf
	tOTxaH9BD1/B6sBdnDqYZ2wx6Y8A8nAyxgVNyikIOQ3TUoau+xvvdcubz9XVIHQoi1kDk1jfbSt
	e7e56GxuT6HuekdCiE3ZsyMRcML/gRB3O8WRCAv0btq0s4JiX/mmNtuvWJgKHz3bVzzJ43JlAgH
	Li8lMOIFC0wFMoX0/9mx/M3fzEXlcnoEEtkAOCiblJPcWqGTagPpg6IKgMcAxgeqUDWx+sy7+/i
	/vbuz5fjFnl7Q75GSQM2ZjtLkR7FAtDeLVfG89LoSmBpQ5jkkVVpMU2ABeNW/RV3pXo4=
X-Received: by 2002:a05:6214:21e1:b0:88a:42b1:2607 with SMTP id 6a1803df08f44-892743de419mr94011526d6.36.1768469305653;
        Thu, 15 Jan 2026 01:28:25 -0800 (PST)
X-Received: by 2002:a05:6214:21e1:b0:88a:42b1:2607 with SMTP id 6a1803df08f44-892743de419mr94011076d6.36.1768469305230;
        Thu, 15 Jan 2026 01:28:25 -0800 (PST)
Received: from yuanjiey.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-892668a2419sm64388416d6.30.2026.01.15.01.28.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 01:28:24 -0800 (PST)
From: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
To: robin.clark@oss.qualcomm.com, lumag@kernel.org, jesszhan0024@gmail.com,
        sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
        simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, neil.armstrong@linaro.org,
        konrad.dybcio@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
        aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v6 02/12] dt-bindings: display/msm: dsi-phy-7nm: Add Kaanapali DSI PHY
Date: Thu, 15 Jan 2026 17:27:39 +0800
Message-Id: <20260115092749.533-3-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260115092749.533-1-yuanjie.yang@oss.qualcomm.com>
References: <20260115092749.533-1-yuanjie.yang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ZbiPFJ0KZRQLb3Fnm25kQQRI321i-1qC
X-Proofpoint-ORIG-GUID: ZbiPFJ0KZRQLb3Fnm25kQQRI321i-1qC
X-Authority-Analysis: v=2.4 cv=EIELElZC c=1 sm=1 tr=0 ts=6968b33a cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=vv4ZX1vSqPLa4hud_FIA:9 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDA2NSBTYWx0ZWRfX5bYFwK7YdlX/
 7mtvhruD546YnFHH3tTwztxCteWFMnzf3cLBjhaayEuPyyVBBZ4HJSHDjJ1X9CDTDoJweXHIPEf
 Smz7UReEZqhy4oKTFjK+Mglbkgd4h/nh8T1PV6cTmSnGAEAc1cwO3uLOnxI1Z3qIiOGxznyH118
 Tt/RuW+sfYXe+TlqJzxU1t4m+SR7xdn93WCXrRmnK0WDVUdEceBkWeMA2AglcAZ8V/KpiSaQEBA
 /6gtFKocQX/317S00YGq2AropdukFRfqTymO4MYsAZVeOYe8nwDBcseA6i5C1OcqGmO1ZO+k+Al
 BaDHrxGsRvrRfbP1yI9k2BpE+E6c/gw8fHNvVpKCziUS2Ggr5M0mzxR27ci9w30CQKXOS45z1Vv
 YlQOdFbgvfyNRZMOtrKMWEcQOMy1bTdQ1wK5785Tdp/R+Wd3BOuJTOHp7yvRThruzg32lhdbs6q
 uFc0ZP1TYuR6N5zgNhw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_02,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150065

From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>

The DSI PHY registers on the Kaanapali platform differ from those
on SM8750. So add DSI PHY for Kaanapali to compatible these changes.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
index 7a83387502da..9a9a6c4abf43 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
@@ -19,6 +19,7 @@ properties:
           - enum:
               - qcom,dsi-phy-7nm
               - qcom,dsi-phy-7nm-8150
+              - qcom,kaanapali-dsi-phy-3nm
               - qcom,sa8775p-dsi-phy-5nm
               - qcom,sar2130p-dsi-phy-5nm
               - qcom,sc7280-dsi-phy-7nm
-- 
2.34.1


