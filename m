Return-Path: <linux-arm-msm+bounces-104837-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oMaLAwvZ72l/GwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104837-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 23:45:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BF9D147AD68
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 23:45:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 69AF1301DD98
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 21:42:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57A9D3A1A4D;
	Mon, 27 Apr 2026 21:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iusfDWls";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vsz+OR+S"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF2F73A2559
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 21:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777326163; cv=none; b=cjaKuV3LuVRxKElEgxlS6WyF4FKBbzQd/2LKAZ41j1h9am0Xpc8jklOBag/vuUNaPNsb8x9wOIf3EHcgfkBKID5jxoverFO3oPlE2ZV1VYVH3k2HjUq6lnMIPxMK66061kMl2j4Jz1F4fSVyPPfJ9UZsxgGe2XeFoTO8qA+G8pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777326163; c=relaxed/simple;
	bh=plsVpfSVc9eCVFj4w17K3FYCogRULKzyFMHGpg/aL+U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OALWujxZDN7m/8UZTanz2KdADcPlIekeiU8CNjnkT8pNQK3Wez/hA1FVIQwlnv0l/IlLSB872Jb4SmQFPnVMSaL3hu0b/AY17Ng9Uul+b5gc9GenNu9HLMPVrqRynX5Hr4VNz8yI4aBxN1neC2pqCU5wRAoSy+cQn4Kw3tSStm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iusfDWls; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vsz+OR+S; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RDxZSS2913806
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 21:42:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=zDhnhJqpd1p
	k5h8F7DDf/5AtkUKccW5CIznmywuGZ/M=; b=iusfDWlskwX1CDJUcdtKRQ1wKIq
	arymvLyqQ35b4Ou2gburKq7c+EaKOG3I0Xqn7OjS6onrcVJNRYeLoBaMYqgYtA8c
	BEwLuOJb9gad1NBrrsHsGI047mjrnHsC1X7quZpTTYCJmX9P1cuD8eBpdvywSm+B
	bloFTmIUSdp+ww++HAnqchO8bYTSpYhWxYAE16cHBvzr7NrWVsk4P/RGKNSs66uD
	9Pr7WfOu5RqLyYeT2z4tagJB1m3dK9pMNwZmjtqBs+Lnqf9SqJiA7gDtz9vmbdi3
	qKs7Mx9oU6kvAqam4Ho//aPoZsv2dQSadiwNMUp/6o8Y13mwh9AWVQxlHpg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt26xkg5p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 21:42:40 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2bdf6fe90a9so16888336eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 14:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777326160; x=1777930960; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zDhnhJqpd1pk5h8F7DDf/5AtkUKccW5CIznmywuGZ/M=;
        b=Vsz+OR+SKEbyvN/td4KTb80KrkAyAbA2GhkzsdHdNyDuNDnybxWPsh6pQ8eGBvMjmU
         7vw+wK9KD7KAPy6fW0+3eml7PAEefcGWx2KIdQ8ycMFDejUpAY/YrFZqiqLdZq+mct4n
         0GDmh1BstYmcIlqIO0F2eZLODGRbzmxsWsaXYFrZ8FRHFr5nhlN2Eoyb0NintmJdjqte
         HY4s5oRFCBWyDoBE+kKiuFHM1J1XgIUU3GfWy63oPOmVPj71BkaB12RDyvzJghRo/2Ma
         3ruzDGjebNDSlWuA8C/jldsfPGLOcAXUjnE1pQlPq93eCAb63kU+CDflsw+ksl4W7joQ
         oiOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777326160; x=1777930960;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zDhnhJqpd1pk5h8F7DDf/5AtkUKccW5CIznmywuGZ/M=;
        b=KKu48i6h1bZAIiIOP+7DLXbphvFwn+8WEwSpDB0q0Z9/E5XHWMRZr2f9lb04jaYEl5
         D+kI0T+b/n+biWQVB5is5+c3QLtHZKo69Q8fKbaGMVGWTbpi3/0WUvzo0E8N3p8A/YJd
         aneRtzMCmcfGWBkI7kOSDlsx1H800upLhT5X6TPN2yxdcc7HdBmk3vs7LfkLGq+7dLtx
         I7shh16mquRwcu1TYD3hdxCv1bHkg5HmiUNJiLA2eIV0EPEhWErWQcYrmcamO0OC9A5K
         j2TXBNU6Sc9HEz3296G4Wf16hOFsgKu9QN8mXEOGtPq7xi/Y0a38t9hVx+6KSq5Bi8Lg
         RcQg==
X-Forwarded-Encrypted: i=1; AFNElJ9y1BDzh2hFWVPBlblPQYLXdj37TROpNSDJXqHH/38kHpMTtQ1q8zRanbuvDEkZ+Ng/LtdLIWZMs22xxYtc@vger.kernel.org
X-Gm-Message-State: AOJu0YwLcyKXkuxkcBrQN4Hf3ggxhc2r2q4C/Lj79zTRPVfBAKRc9RyB
	Q/KBCdvFOJTMWARq6pv2HMV5JXarukeyEfT7Mx2MLyLNLNdu9hngA+XkCHNuyYABrpPncLZZ0bk
	p7hIaKtlAcIFeQkT8O2/uRZpHrNU9tyUjT6ckEy5x+fhNRSFeeC4ShD57kjdpHfxppkFo
X-Gm-Gg: AeBDietCHIpjqxFbb1siQ0xlQOJspfDeCJ5enSGwHlc6l+LIJB9JCpKewWvHg5vhRFS
	8abZ3Z4dDV6C8/0ubuqIlSmNhEylZB3deyNRy6q3sVB5bhPYc9uVDVeWzPzanK39gmfm3ZHQzu+
	fuuJVD3Q0ztGU++Z5SujzLy+MWOaj2u/BMxAGKrvYpBcStPYWjB0IkbGr96RE94wJ09dTMEV4vO
	ENFwNbqd+k+tWhKEr5NVBn/crAied0hf6/Rvewo1+3HfFsybbM2UP0XqS2u6TOj1tAeT9y4yYyE
	UL0iDCdMtGQyvtHJl1La8iUA6oa95QNTpMsaYji0ft7I30f2JK4wygpwlIyBUREsG5c9NlGCS+K
	sSaZTZVTRlvbdvlFACFPAyokMcgZU7qt8Myfinbjpr8FbXiio18/FcWX6HhhXJaNOofHlW/NmiZ
	oUGxQ94UfkZA==
X-Received: by 2002:a05:7022:11f:b0:12c:33dd:fa15 with SMTP id a92af1059eb24-12ddd9e4256mr312346c88.34.1777326159497;
        Mon, 27 Apr 2026 14:42:39 -0700 (PDT)
X-Received: by 2002:a05:7022:11f:b0:12c:33dd:fa15 with SMTP id a92af1059eb24-12ddd9e4256mr312300c88.34.1777326158799;
        Mon, 27 Apr 2026 14:42:38 -0700 (PDT)
Received: from hu-rraheja-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12ddd927bbbsm653119c88.2.2026.04.27.14.42.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 14:42:38 -0700 (PDT)
From: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
To: vkoul@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, robh@kernel.org,
        neil.armstrong@linaro.org, gregkh@linuxfoundation.org
Cc: dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        abel.vesa@oss.qualcomm.com, wesley.cheng@oss.qualcomm.com,
        krzysztof.kozlowski@oss.qualcomm.com, ronak.raheja@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy: Add Hawi QMP PHY
Date: Mon, 27 Apr 2026 14:42:14 -0700
Message-Id: <20260427214217.2735240-2-ronak.raheja@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260427214217.2735240-1-ronak.raheja@oss.qualcomm.com>
References: <20260427214217.2735240-1-ronak.raheja@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: xTioy24Gey9wcjlW7NyxK5fXC8Mlq5F_
X-Proofpoint-ORIG-GUID: xTioy24Gey9wcjlW7NyxK5fXC8Mlq5F_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDIzMCBTYWx0ZWRfXw64SBJITnqDS
 kxZOvsY/kYWh5lCiMEIOUvNbjSUkOo9Ox3jzEfrg8eW14b2oRNfOy0pbsjrWN5Q6bzMYuFB25e5
 BPLEroRTWUeLtU801Jml1CRJ0xPDz92yrAM//+Gcyht07ElnsVIXstPPJlygIev1HO5JZLPZyFo
 Wuu7RnHk96iG5KPhekz5z2r0pepQlqEN2y2YStkrNgNCLoKp2bGNqT/pzIj8hFYUjxBW7gZ8oO8
 K4CbFAZyt+CdyJk4C0hV/DonXiopfpiqabBVtzhToX+S9OAEVvwyPApvW3V9K8yeXgCtrJK8/jn
 EJdiLUvxrHD/NEn+mhyrTXMKZT//gB7l7WcW58gI1fh2QFZfyHC2cKTR+7vJtGAUxe9KDGtXUS4
 AV/KIVs+tKvIl0ELgocO96Iyi2Lg5iK8SX/xAv7A9ldmr/KM4QWwigb2Yeo2xBNmu2sN+xbe203
 wc7A+6Ze77Ice5nBzhg==
X-Authority-Analysis: v=2.4 cv=FM8rAeos c=1 sm=1 tr=0 ts=69efd850 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=8IMiPDtIn6OAJiDpRukA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 bulkscore=0 phishscore=0
 spamscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270230
X-Rspamd-Queue-Id: BF9D147AD68
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TAGGED_FROM(0.00)[bounces-104837-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ronak.raheja@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]

Document the Hawi compatible string for the QMP combo PHY.

Hawi uses a new QSERDES V10 register layout with a new COM AON module
and hardware-specific PHY init sequences compared to previous targets,
requiring a dedicated compatible string.

Signed-off-by: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
---
 .../devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml  | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
index 3d537b7f9985..7a7059c659be 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
@@ -22,6 +22,7 @@ properties:
           - const: qcom,sm8750-qmp-usb3-dp-phy
       - enum:
           - qcom,glymur-qmp-usb3-dp-phy
+          - qcom,hawi-qmp-usb3-dp-phy
           - qcom,sar2130p-qmp-usb3-dp-phy
           - qcom,sc7180-qmp-usb3-dp-phy
           - qcom,sc7280-qmp-usb3-dp-phy
@@ -205,6 +206,7 @@ allOf:
           contains:
             enum:
               - qcom,glymur-qmp-usb3-dp-phy
+              - qcom,hawi-qmp-usb3-dp-phy
               - qcom,sar2130p-qmp-usb3-dp-phy
               - qcom,sc8280xp-qmp-usb43dp-phy
               - qcom,sm6350-qmp-usb3-dp-phy
-- 
2.34.1


