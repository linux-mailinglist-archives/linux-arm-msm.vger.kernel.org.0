Return-Path: <linux-arm-msm+bounces-114058-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xTIpE3/FOWr9xAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114058-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 01:30:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA7F6B2D2F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 01:30:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=JjDplkrH;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=L1GjYdDy;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114058-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114058-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3EB6C302770F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 23:30:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0FCD36EAAC;
	Mon, 22 Jun 2026 23:29:58 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3690368D52
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 23:29:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782170998; cv=none; b=lYLramgcfx6v76tLdka+ejDye1QBmieF9/uXl8zWGIrumeiBqXHPHYk3pY4SFW2paAqDEj0mV1i8xU0DvI9Cf2VXED5qm3PRBfKg/FN6KfPQcOwf+hGRT9hjhYmvOtRTIoCFIBmV/cMl5O/cMnkkHr3KTNqGYbGUm5jJEZvYp6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782170998; c=relaxed/simple;
	bh=ArXcFTxLuJREGcFCQ6n30oBPeFSGAU89A23fYl+ElHI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q/uOf9IcBsoReMhdX90A1IhvUZv2u1h5FV0OMHSOkitu3fG4RnEfmr0w7maemjxbAMUDASWsHoBx0ez1TgrfCH0GeYh/mIpcu/cKR4Oi2tZDYyIA0qjAtqx5AUrEpj5YinC6kfAHoG0DHq0zBZLY1XuOZ4gob0+KlHCSNbZ0rmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JjDplkrH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L1GjYdDy; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65MJcTBF1938648
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 23:29:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/Ca6hcH+dCfbDOMVnB7gBb9Ls6Se3tvGjDS41pm5PUU=; b=JjDplkrHoZ3lXpU9
	iWHOB+4X9+/MHkGAXIIal60oXUT9bhwAkFPGjCBeQiW3pNECnIvMObTKe1AkcDkQ
	c3bs9WjEzhOZE4BKnWi6pcQwZtPU4WV9vtkrmbzjP58YD97tjEXqmJxCTqw7tjHi
	YOCsTp9jyevRUf+pLjxu9kZGL5mzxq8xsWBAFJjuqZRGhyUNnkl39V7wcMzyTsfC
	E0sZA+oKGiTeDjG4HQ+6+NsBpmTRv1JUl4qvQkhXzK5bYv6OO0PG/9zmYOPj8pL8
	IwCnzazXaN0Q5gK98m3Er28iFqU4zOgsgtOHRPI7I8DEmn9dO7WgsUN0+VAZ1inS
	51qhEQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey5yea26q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 23:29:55 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30c03c1dda3so6453101eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 16:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782170995; x=1782775795; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/Ca6hcH+dCfbDOMVnB7gBb9Ls6Se3tvGjDS41pm5PUU=;
        b=L1GjYdDyhPz13IGsRzJP2hH2dIlIcjNOZ30d603S9JXjuwasMuRf8MhRMH7JuXPP5b
         8U+QINwKlZucDo567g52+jJ3oZ8Hfdk8UYPz2KXMbk+1JKi860/eqChCsa/r8y21jQXr
         bgbxjSCMKUbcM1B3mAg+ImrLedOq6JEtVRKoGpskoM9rV2tpsoEflimoDqgBI1frdfyl
         TSmT3FsQubEy9Xe+RZh+5vo8DBXURvQ/zx7mHLLWqYYfPxOS+bW9IWN4LSUZw6kJkNK1
         zu47Mq1NnMxY/B4kqMp4NbFLO4xRFHFUBvgg6y4tnllyUgJAmY7AQM9ZobvlMJYyYNFz
         C99g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782170995; x=1782775795;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/Ca6hcH+dCfbDOMVnB7gBb9Ls6Se3tvGjDS41pm5PUU=;
        b=a8RPeL7kSFemD86t/DgfEVS/AHCjomVqmVnE6WDOFKGNfYxE1ekbx4gBXL57P3FVma
         1sGFRKomupXhG/b6Y3lEjgLhbjJDmiHm7RFALyRHQAec+t8rQA7q3JRA5UgnLb3u30J0
         dJOlHMmKkqnil2DkJnTpS/JyV4GxdbCJ1CoPQmMGDVu+zMm879gbrlNBMx9Go7UnccGB
         ZMpnAHENukNVaqSIgdUKo54ybuXfFdanKmIncEv2Eo/hYpwX6Eu9V0cSMM9Ln+NrHZM2
         3h5jgXiCcpA5Ni+vIi5JTIDPZnoJLNNAkxqlnkrN/pZBt35FTwyilNU0v0mbKjF6/WbS
         cZDQ==
X-Gm-Message-State: AOJu0Yy+cT9ZSfCl+MFADFallP6i1inP6C6o6AZCYmUsB7FIrS3PqGeY
	nZqRoUsTTwenzbcQWVlS9lViN4l65uWLAvu98D3zKI/CTH1MUMSTi0XlVVhZib5PztDGvcY9h29
	QjnrRrezhQ58vZ0zVlfGmzopnLbiJ5DTr1HJ4ZGq/lbhgw1V9sPXFwdzy7sUgzumfH7at
X-Gm-Gg: AfdE7cm47ST9BXFHAA3B1nC3fbpxhWhH0ncekNp7dfENN6JaqM+kWWW2H9lPfpRQWC4
	lDb+Fk46auy3qRXYXCg11DfxvetJSyFRLwWeyonhyNGuP8644vEXCj6QMghqai9zCDyf8BcVsXD
	d5FZHGvG0DISa1MTM/EH/nGzIiz2UH1t3et9/Mk1Lt+hoOqGQpeK/LhmtHaBfVKJGTyJ/z6QoJM
	6F8Hd+YfglPHhabxKsRdDMV1wxf2sAMVUcxCjAMSS/LIpbn02iWxkeaVEFq3neW46u8T8xyTTX7
	C9PDvNVXWz28nFzJnwEXc1eD/HLWi+a/FR+sul2hGPNanMpOE9NSfa2+4DDQUxyXnc2/q2AoOwu
	poSvlzNt62C/v+Smyj27f641o2uYHQ+bqxNP84hCBeDm6PDnIHZs=
X-Received: by 2002:a05:7300:6d03:b0:304:e20e:f5c9 with SMTP id 5a478bee46e88-30c1dc6d25cmr9518469eec.31.1782170994476;
        Mon, 22 Jun 2026 16:29:54 -0700 (PDT)
X-Received: by 2002:a05:7300:6d03:b0:304:e20e:f5c9 with SMTP id 5a478bee46e88-30c1dc6d25cmr9518441eec.31.1782170993820;
        Mon, 22 Jun 2026 16:29:53 -0700 (PDT)
Received: from [169.254.0.2] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c1ba8fb35sm15339727eec.12.2026.06.22.16.29.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 16:29:53 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Mon, 22 Jun 2026 23:29:50 +0000
Subject: [PATCH 2/2] phy: qcom: edp: update v8 power-on programming
 sequence
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260622-glymur-edp-phy-v1-2-814b45089ac9@oss.qualcomm.com>
References: <20260622-glymur-edp-phy-v1-0-814b45089ac9@oss.qualcomm.com>
In-Reply-To: <20260622-glymur-edp-phy-v1-0-814b45089ac9@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782170991; l=22100;
 i=bjorn.andersson@oss.qualcomm.com; s=20230915; h=from:subject:message-id;
 bh=ArXcFTxLuJREGcFCQ6n30oBPeFSGAU89A23fYl+ElHI=;
 b=aeMVAGVLe22u6AJKnx1ltmcsfJgsop7Akk2aX+2UCjqkiXsAtX0+KA80+Nx2/eHzIxMUcLGvw
 pwkxqqcxGk0DZmu/1bsbt5VHAr2/0aG1wShqDjtZ2a1Xc4E9WGC+Lae
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=ed25519;
 pk=VkhObtljigy9k0ZUIE1Mvr0Y+E1dgBEH9WoLQnUtbIM=
X-Proofpoint-ORIG-GUID: JUafNaJoeUvH1-JxM4Wm0dY326sfUe-Q
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDIyNSBTYWx0ZWRfX1TyVN9ulwIOo
 ZW5Qhc80a4TS29siG0KSa0+UVFS+G1BVHQXAhBe8ejN+P7P8d6zuAJcW5ywWpx4V27Fh4EkdnFJ
 M/OkH0TtA59uQdr41e1+sqHCH+p0+r8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDIyNSBTYWx0ZWRfXw90rOvCuCDrR
 Sfw5wge+kA6ALr9bKNfIZYucaYKbhfy3upHBPGQk83LM5N50/Lf2ZtbFdg0w1UpgnXfhOl3id96
 0RrtGnJyHM+JTNwxdwxysnGQbuLMmbD61lg3OKNKZ8k+Aehv0oNAVMSoyUKq5gCmJmn05No8gcb
 kxjPs4UIvIg4bhxEWQ3FtJ5Y8RjLjQtbhrleoirjHixOwqaYRbiqRc3eEaveXeDi0+K7soDKr4C
 CPSa6Q8V27yMMb0B3SSqJs/Of/bLTRtuRGdE9rJIjyxIUBd91520xW/aE6wwusEd/pJnh2PC02e
 7k4cI9EucSgByBMJr70I1jGiigz+OPf0624iR1q9R/OW4v6veM4dGHFXSeMoqevYuNOr3ngOEol
 FLrtLk8FKaopUqygDpTYdSpqE5DDRSQ/k+RHxSU+xJeTJjIQLSaJxcAm3udmbAmfpt8Ef2osyaw
 M6GUCFNGgv1ln98aOTw==
X-Proofpoint-GUID: JUafNaJoeUvH1-JxM4Wm0dY326sfUe-Q
X-Authority-Analysis: v=2.4 cv=YpI/gYYX c=1 sm=1 tr=0 ts=6a39c573 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=tcYNc8zciasqwv5PULUA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_04,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501
 malwarescore=0 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220225
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114058-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:bjorn.andersson@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[bjorn.andersson@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bjorn.andersson@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EDA7F6B2D2F

While the introduction of the v8 programming sequence brought functional
eDP support for the 4-lane 8.1Gbps case, it doesn't entirely match the
documented sequences from the programming guide. Further 5.4Gbps,
2.7Gbps and 1.62Gbps, and 2-lane support are both incorrect and
non-functional.

Update the v8 eDP PHY programming sequence to match the programming
sequence validated on Glymur.

This changes the v8-specific parts of the power-on flow:

  - AUX configuration:
    - update the default v8 AUX config
    - program AUX_CFG2 based on link rate

  - TX lane configuration:
    - add v8 TX lane register programming before PLL enable
    - program interface select based on link rate
    - use separate 2-lane and 4-lane post-PLL lane enable programming

  - PCS configuration:
    - add v8 PCS/LDO/AUX-less timing programming
    - program LFPS/AUX-less timing based on link rate

  - PLL and SSC programming:
    - update v8 SSC step values per link rate
    - make LOCK_CMP_EN, CMN_CONFIG_1, CORECLK_DIV_MODE0, CORE_CLK_EN and
      VCO tune values link-rate specific

  - DCC and TSYNC:
    - disable DCC before the v8 power-on sequence
    - run the v8 TSYNC sequence
    - run DCC calibration after PLL lock

  - Status polling:
    - poll the v8 PHY status register instead of the older status offset

  - LDO config:
    - use the correct LDO configuration parameters for v8

With these changes the v8 PHY has been validated to lock at 1.62, 2.7,
5.4 and 8.1 Gbps, using both 2 and 4 lanes. Link training now suceeds on
4-lane 8.1Gbps and 2-lane 5.4Gbps.

Assisted-by: Codex:GPT-5.5
Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-edp.c | 426 +++++++++++++++++++++++++++++++++---
 1 file changed, 395 insertions(+), 31 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
index 6588419d4860..c5d1fa0ae6cb 100644
--- a/drivers/phy/qualcomm/phy-qcom-edp.c
+++ b/drivers/phy/qualcomm/phy-qcom-edp.c
@@ -40,28 +40,50 @@
 #define DP_PHY_AUX_INTERRUPT_MASK		0x0058
 
 #define DP_PHY_VCO_DIV                          0x0074
+#define DP_PHY_TSYNC_OVRD                       0x0078
 #define DP_PHY_TX0_TX1_LANE_CTL                 0x007c
 #define DP_PHY_TX2_TX3_LANE_CTL                 0x00a0
+#define DP_PHY_AUXLESS_CFG1                     0x00cc
+#define DP_PHY_LFPS_PERIOD                      0x00d4
+#define DP_PHY_LFPS_CYC                         0x00d8
+#define DP_PHY_AUXLESS_SETUP_CYC                0x00dc
+#define DP_PHY_AUXLESS_SILENCE_CYC              0x00e0
+#define DP_PHY_LDO_CFG                          0x00f0
 
 #define DP_PHY_STATUS                           0x00e0
+#define DP_PHY_STATUS_V8                        0x0110
 
 /* LANE_TXn registers */
 #define TXn_CLKBUF_ENABLE                       0x0000
 #define TXn_TX_EMP_POST1_LVL                    0x0004
+#define TXn_TX_IDLE_LVL_LARGE_AMP               0x0010
 #define TXn_TX_DRV_LVL                          0x0014
 #define TXn_TX_DRV_LVL_OFFSET                   0x0018
 #define TXn_RESET_TSYNC_EN                      0x001c
+#define TXn_PRE_EMPH                            0x0020
+#define TXn_INTERFACE_SELECT                    0x0024
 #define TXn_TX_BAND                             0x0028
+#define TXn_SLEW_CNTL                           0x002c
+#define TXn_LPB_CFG1                            0x0034
+#define TXn_RES_CODE_LANE_TX                    0x003c
+#define TXn_RES_CODE_LANE_TX1                   0x0040
 #define TXn_RES_CODE_LANE_OFFSET_TX0            0x0044
 #define TXn_RES_CODE_LANE_OFFSET_TX1            0x0048
+#define TXn_SERDES_BYP_EN_OUT                   0x004c
 
 #define TXn_TRANSCEIVER_BIAS_EN                 0x0054
 #define TXn_HIGHZ_DRVR_EN                       0x0058
 #define TXn_TX_POL_INV                          0x005c
+#define TXn_PARRATE_REC_DETECT_IDLE_EN          0x0060
 #define TXn_LANE_MODE_1                         0x0064
+#define TXn_LANE_MODE_2                         0x0068
 
 #define TXn_TRAN_DRVR_EMP_EN                    0x0078
+#define TXn_VMODE_CTRL1                         0x007c
 #define TXn_LDO_CONFIG                          0x0084
+#define TXn_DCC0_CTRL                           0x00c8
+#define TXn_DCC1_CTRL                           0x00d0
+#define TXn_DCC_DONE                            0x00e0
 
 struct qcom_edp_swing_pre_emph_cfg {
 	const u8 (*swing_hbr_rbr)[4][4];
@@ -122,11 +144,18 @@ struct qcom_edp {
 };
 
 static int qcom_edp_prepare_power_on_v46(const struct qcom_edp *edp);
+static int qcom_edp_prepare_power_on_v8(const struct qcom_edp *edp);
 static int qcom_edp_configure_tx_pre_pll_v46(const struct qcom_edp *edp);
+static int qcom_edp_configure_tx_pre_pll_v8(const struct qcom_edp *edp);
 static int qcom_edp_configure_rate_pcs_v46(const struct qcom_edp *edp,
 					   unsigned long *pixel_freq);
+static int qcom_edp_configure_rate_pcs_v8(const struct qcom_edp *edp,
+					  unsigned long *pixel_freq);
 static void qcom_edp_configure_lanes_after_pll_v46(const struct qcom_edp *edp);
+static void qcom_edp_configure_lanes_after_pll_v8(const struct qcom_edp *edp);
 static int qcom_edp_finish_power_on_v46(const struct qcom_edp *edp);
+static int qcom_edp_finish_power_on_v8(const struct qcom_edp *edp);
+
 
 static const u8 dp_swing_hbr_rbr[4][4] = {
 	{ 0x07, 0x0f, 0x16, 0x1f },
@@ -239,6 +268,41 @@ static const struct qcom_edp_swing_pre_emph_cfg edp_phy_swing_pre_emph_cfg = {
 	.pre_emphasis_hbr3_hbr2 = &edp_pre_emp_hbr2_hbr3,
 };
 
+static const u8 edp_swing_hbr_rbr_v8[4][4] = {
+	{ 0x07, 0x0f, 0x16, 0x1f },
+	{ 0x0d, 0x16, 0x1e, 0xff },
+	{ 0x11, 0x1b, 0xff, 0xff },
+	{ 0x16, 0xff, 0xff, 0xff }
+};
+
+static const u8 edp_pre_emp_hbr_rbr_v8[4][4] = {
+	{ 0x05, 0x11, 0x17, 0x1d },
+	{ 0x05, 0x11, 0x18, 0xff },
+	{ 0x06, 0x11, 0xff, 0xff },
+	{ 0x00, 0xff, 0xff, 0xff }
+};
+
+static const u8 edp_swing_hbr2_hbr3_v8[4][4] = {
+	{ 0x0b, 0x11, 0x17, 0x1c },
+	{ 0x10, 0x19, 0x1f, 0xff },
+	{ 0x19, 0x1f, 0xff, 0xff },
+	{ 0x1f, 0xff, 0xff, 0xff }
+};
+
+static const u8 edp_pre_emp_hbr2_hbr3_v8[4][4] = {
+	{ 0x0c, 0x15, 0x19, 0x1e },
+	{ 0x0b, 0x15, 0x19, 0xff },
+	{ 0x0e, 0x14, 0xff, 0xff },
+	{ 0x0d, 0xff, 0xff, 0xff }
+};
+
+static const struct qcom_edp_swing_pre_emph_cfg edp_phy_swing_pre_emph_cfg_v8 = {
+	.swing_hbr_rbr = &edp_swing_hbr_rbr_v8,
+	.swing_hbr3_hbr2 = &edp_swing_hbr2_hbr3_v8,
+	.pre_emphasis_hbr_rbr = &edp_pre_emp_hbr_rbr_v8,
+	.pre_emphasis_hbr3_hbr2 = &edp_pre_emp_hbr2_hbr3_v8,
+};
+
 static const u8 edp_phy_aux_cfg_v4[DP_AUX_CFG_SIZE] = {
 	0x00, 0x13, 0x24, 0x00, 0x0a, 0x26, 0x0a, 0x03, 0x37, 0x03, 0x02, 0x02, 0x00,
 };
@@ -294,7 +358,7 @@ static const u8 edp_phy_aux_cfg_v5[DP_AUX_CFG_SIZE] = {
 };
 
 static const u8 edp_phy_aux_cfg_v8[DP_AUX_CFG_SIZE] = {
-	0x00, 0x00, 0xa0, 0x00, 0x0a, 0x26, 0x0a, 0x03, 0x37, 0x03, 0x02, 0x02, 0x04,
+	0x00, 0x13, 0xa4, 0x00, 0x0a, 0x26, 0x0a, 0x03, 0x37, 0x03, 0x02, 0x02, 0x04,
 };
 
 static const u8 edp_phy_vco_div_cfg_v8[4] = {
@@ -427,6 +491,145 @@ static int qcom_edp_configure_pll(const struct qcom_edp *edp)
 	return edp->cfg->ver_ops->com_configure_pll(edp);
 }
 
+static int qcom_edp_set_link_rate_aux_cfg2(const struct qcom_edp *edp)
+{
+	const struct phy_configure_opts_dp *dp_opts = &edp->dp_opts;
+	u32 aux_cfg2;
+
+	switch (dp_opts->link_rate) {
+	case 1620:
+	case 2700:
+	case 5400:
+		aux_cfg2 = 0xa4;
+		break;
+	case 8100:
+		aux_cfg2 = 0xa0;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	writel(aux_cfg2, edp->edp + DP_PHY_AUX_CFG(2));
+
+	return 0;
+}
+
+static void qcom_edp_configure_tx_pre_pll_v8_lane(void __iomem *tx, u32 interface_select)
+{
+	writel(0x0f, tx + TXn_CLKBUF_ENABLE);
+	writel(0x00, tx + TXn_PRE_EMPH);
+	writel(0x00, tx + TXn_VMODE_CTRL1);
+	writel(0x00, tx + TXn_SERDES_BYP_EN_OUT);
+	writel(0x03, tx + TXn_LPB_CFG1);
+	writel(0x10, tx + TXn_TX_DRV_LVL_OFFSET);
+	writel(interface_select, tx + TXn_INTERFACE_SELECT);
+	writel(0x01, tx + TXn_TRAN_DRVR_EMP_EN);
+	writel(0x06, tx + TXn_TX_EMP_POST1_LVL);
+	writel(0x00, tx + TXn_LANE_MODE_1);
+	writel(0x00, tx + TXn_LANE_MODE_2);
+	writel(0x12, tx + TXn_TX_DRV_LVL);
+	writel(0x00, tx + TXn_PARRATE_REC_DETECT_IDLE_EN);
+	writel(0x00, tx + TXn_TX_IDLE_LVL_LARGE_AMP);
+	writel(0x03, tx + TXn_RESET_TSYNC_EN);
+	writel(0x04, tx + TXn_TX_BAND);
+	writel(0x00, tx + TXn_SLEW_CNTL);
+	writel(0x60, tx + TXn_RES_CODE_LANE_TX);
+	writel(0x60, tx + TXn_RES_CODE_LANE_TX1);
+}
+
+static void qcom_edp_configure_lanes_after_pll_v8(const struct qcom_edp *edp)
+{
+	if (edp->dp_opts.lanes == 2) {
+		writel(0x1b, edp->tx0 + TXn_HIGHZ_DRVR_EN);
+		writel(0x03, edp->tx0 + TXn_TRANSCEIVER_BIAS_EN);
+		writel(0x04, edp->tx0 + TXn_HIGHZ_DRVR_EN);
+		writel(0x00, edp->tx0 + TXn_TX_POL_INV);
+
+		writel(0x1b, edp->tx1 + TXn_HIGHZ_DRVR_EN);
+		writel(0x03, edp->tx1 + TXn_TRANSCEIVER_BIAS_EN);
+		writel(0x04, edp->tx1 + TXn_HIGHZ_DRVR_EN);
+		writel(0x50, edp->tx1 + TXn_TX_IDLE_LVL_LARGE_AMP);
+		writel(0x00, edp->tx1 + TXn_TX_POL_INV);
+	} else {
+		writel(0x1f, edp->tx0 + TXn_HIGHZ_DRVR_EN);
+		writel(0x03, edp->tx0 + TXn_TRANSCEIVER_BIAS_EN);
+		writel(0x04, edp->tx0 + TXn_HIGHZ_DRVR_EN);
+		writel(0x00, edp->tx0 + TXn_TX_POL_INV);
+
+		writel(0x1f, edp->tx1 + TXn_HIGHZ_DRVR_EN);
+		writel(0x03, edp->tx1 + TXn_TRANSCEIVER_BIAS_EN);
+		writel(0x04, edp->tx1 + TXn_HIGHZ_DRVR_EN);
+		writel(0x00, edp->tx1 + TXn_TX_POL_INV);
+	}
+}
+
+static int qcom_edp_configure_tx_pre_pll_v8_lanes(const struct qcom_edp *edp)
+{
+	u32 interface_select;
+
+	switch (edp->dp_opts.link_rate) {
+	case 1620:
+	case 2700:
+	case 5400:
+		interface_select = 0x05;
+		break;
+	case 8100:
+		interface_select = 0x07;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	qcom_edp_configure_tx_pre_pll_v8_lane(edp->tx0, interface_select);
+	qcom_edp_configure_tx_pre_pll_v8_lane(edp->tx1, interface_select);
+
+	return 0;
+}
+
+static int qcom_edp_configure_pcs_v8(const struct qcom_edp *edp)
+{
+	const struct phy_configure_opts_dp *dp_opts = &edp->dp_opts;
+	u32 auxless_setup_cyc;
+	u32 auxless_silence_cyc;
+	u32 lfps_period;
+
+	switch (dp_opts->link_rate) {
+	case 1620:
+		auxless_setup_cyc = 0x03;
+		auxless_silence_cyc = 0x06;
+		lfps_period = 0x00;
+		break;
+	case 2700:
+		auxless_setup_cyc = 0x04;
+		auxless_silence_cyc = 0x08;
+		lfps_period = 0x11;
+		break;
+	case 5400:
+		auxless_setup_cyc = 0x09;
+		auxless_silence_cyc = 0x11;
+		lfps_period = 0x33;
+		break;
+	case 8100:
+		auxless_setup_cyc = 0x0f;
+		auxless_silence_cyc = 0x1a;
+		lfps_period = 0x55;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	writel(edp->is_edp ? 0x03 : 0x00, edp->edp + DP_PHY_LDO_CFG);
+	writel(0x0f, edp->edp + DP_PHY_CFG_1);
+	writel(0x00, edp->edp + DP_PHY_AUXLESS_CFG1);
+	writel(auxless_setup_cyc, edp->edp + DP_PHY_AUXLESS_SETUP_CYC);
+	writel(auxless_silence_cyc, edp->edp + DP_PHY_AUXLESS_SILENCE_CYC);
+	writel(0x08, edp->edp + DP_PHY_LFPS_CYC);
+	writel(lfps_period, edp->edp + DP_PHY_LFPS_PERIOD);
+	writel(0x2f, edp->edp + DP_PHY_CFG_1);
+
+	return 0;
+}
+
 static int qcom_edp_set_vco_div(const struct qcom_edp *edp, unsigned long *pixel_freq)
 {
 	const struct phy_configure_opts_dp *dp_opts = &edp->dp_opts;
@@ -911,6 +1114,22 @@ static int qcom_edp_ldo_config_v6(const struct qcom_edp *edp)
 	return 0;
 }
 
+static int qcom_edp_ldo_config_v8(const struct qcom_edp *edp)
+{
+	const struct phy_configure_opts_dp *dp_opts = &edp->dp_opts;
+	u32 ldo_config;
+
+	if (edp->is_edp)
+		ldo_config = 0xd0;
+	else
+		ldo_config = 0x00;
+
+	writel(ldo_config, edp->tx0 + TXn_LDO_CONFIG);
+	writel(dp_opts->lanes > 2 ? ldo_config : 0x00, edp->tx1 + TXn_LDO_CONFIG);
+
+	return 0;
+}
+
 static const struct phy_ver_ops qcom_edp_phy_ops_v6 = {
 	.com_power_on		= qcom_edp_phy_power_on_v6,
 	.com_resetsm_cntrl	= qcom_edp_phy_com_resetsm_cntrl_v6,
@@ -942,13 +1161,18 @@ static int qcom_edp_com_configure_ssc_v8(const struct qcom_edp *edp)
 
 	switch (dp_opts->link_rate) {
 	case 1620:
+		step1 = 0x83;
+		step2 = 0x02;
+		break;
 	case 2700:
-	case 8100:
-		step1 = 0x5b;
+		step1 = 0x18;
 		step2 = 0x02;
 		break;
-
 	case 5400:
+		step1 = 0x18;
+		step2 = 0x02;
+		break;
+	case 8100:
 		step1 = 0x5b;
 		step2 = 0x02;
 		break;
@@ -976,34 +1200,68 @@ static int qcom_edp_com_configure_pll_v8(const struct qcom_edp *edp)
 	u32 dec_start_mode0;
 	u32 lock_cmp1_mode0;
 	u32 lock_cmp2_mode0;
+	u32 lock_cmp_en;
 	u32 code1_mode0;
 	u32 code2_mode0;
+	u32 coreclk_div_mode0;
+	u32 vco_tune1_mode0;
+	u32 vco_tune2_mode0;
 	u32 hsclk_sel;
+	u32 core_clk_en;
+	u32 cmn_config_1;
 
 	switch (dp_opts->link_rate) {
 	case 1620:
-		hsclk_sel = 0x5;
-		dec_start_mode0 = 0x34;
-		div_frac_start2_mode0 = 0xc0;
-		div_frac_start3_mode0 = 0x0b;
-		lock_cmp1_mode0 = 0x37;
-		lock_cmp2_mode0 = 0x04;
-		code1_mode0 = 0x71;
-		code2_mode0 = 0x0c;
+		hsclk_sel = 0x4;
+		dec_start_mode0 = 0x54;
+		div_frac_start2_mode0 = 0x00;
+		div_frac_start3_mode0 = 0x06;
+		lock_cmp1_mode0 = 0x1c;
+		lock_cmp2_mode0 = 0x02;
+		lock_cmp_en = 0x04;
+		coreclk_div_mode0 = 0x14;
+		vco_tune1_mode0 = 0xfe;
+		vco_tune2_mode0 = 0x00;
+		code1_mode0 = 0x8d;
+		code2_mode0 = 0x27;
+		core_clk_en = 0x60;
+		cmn_config_1 = 0x76;
 		break;
 
 	case 2700:
 		hsclk_sel = 0x3;
-		dec_start_mode0 = 0x34;
-		div_frac_start2_mode0 = 0xc0;
-		div_frac_start3_mode0 = 0x0b;
-		lock_cmp1_mode0 = 0x07;
+		dec_start_mode0 = 0x46;
+		div_frac_start2_mode0 = 0x00;
+		div_frac_start3_mode0 = 0x05;
+		lock_cmp1_mode0 = 0x08;
 		lock_cmp2_mode0 = 0x07;
-		code1_mode0 = 0x71;
-		code2_mode0 = 0x0c;
+		lock_cmp_en = 0x08;
+		coreclk_div_mode0 = 0x14;
+		vco_tune1_mode0 = 0xae;
+		vco_tune2_mode0 = 0x02;
+		code1_mode0 = 0xf6;
+		code2_mode0 = 0x20;
+		core_clk_en = 0x00;
+		cmn_config_1 = 0x96;
 		break;
 
 	case 5400:
+		hsclk_sel = 0x1;
+		dec_start_mode0 = 0x46;
+		div_frac_start2_mode0 = 0x00;
+		div_frac_start3_mode0 = 0x05;
+		lock_cmp1_mode0 = 0x10;
+		lock_cmp2_mode0 = 0x0e;
+		lock_cmp_en = 0x08;
+		coreclk_div_mode0 = 0x14;
+		vco_tune1_mode0 = 0xae;
+		vco_tune2_mode0 = 0x02;
+		code1_mode0 = 0xf6;
+		code2_mode0 = 0x20;
+		core_clk_en = 0x00;
+		cmn_config_1 = 0x56;
+		break;
+
 	case 8100:
 		hsclk_sel = 0x2;
 		dec_start_mode0 = 0x4f;
@@ -1011,8 +1269,14 @@ static int qcom_edp_com_configure_pll_v8(const struct qcom_edp *edp)
 		div_frac_start3_mode0 = 0x01;
 		lock_cmp1_mode0 = 0x18;
 		lock_cmp2_mode0 = 0x15;
+		lock_cmp_en = 0x08;
+		coreclk_div_mode0 = 0x0a;
+		vco_tune1_mode0 = 0xa0;
+		vco_tune2_mode0 = 0x01;
 		code1_mode0 = 0x14;
 		code2_mode0 = 0x25;
+		core_clk_en = 0x00;
+		cmn_config_1 = 0x96;
 		break;
 
 	default:
@@ -1028,7 +1292,7 @@ static int qcom_edp_com_configure_pll_v8(const struct qcom_edp *edp)
 	writel(0x30, edp->pll + DP_QSERDES_V8_COM_CLK_SELECT);
 	writel(hsclk_sel, edp->pll + DP_QSERDES_V8_COM_HSCLK_SEL_1);
 	writel(0x07, edp->pll + DP_QSERDES_V8_COM_PLL_IVCO);
-	writel(0x00, edp->pll + DP_QSERDES_V8_COM_LOCK_CMP_EN);
+	writel(lock_cmp_en, edp->pll + DP_QSERDES_V8_COM_LOCK_CMP_EN);
 	writel(0x36, edp->pll + DP_QSERDES_V8_COM_PLL_CCTRL_MODE0);
 	writel(0x16, edp->pll + DP_QSERDES_V8_COM_PLL_RCTRL_MODE0);
 	writel(0x06, edp->pll + DP_QSERDES_V8_COM_CP_CTRL_MODE0);
@@ -1036,7 +1300,7 @@ static int qcom_edp_com_configure_pll_v8(const struct qcom_edp *edp)
 	writel(0x00, edp->pll + DP_QSERDES_V8_COM_DIV_FRAC_START1_MODE0);
 	writel(div_frac_start2_mode0, edp->pll + DP_QSERDES_V8_COM_DIV_FRAC_START2_MODE0);
 	writel(div_frac_start3_mode0, edp->pll + DP_QSERDES_V8_COM_DIV_FRAC_START3_MODE0);
-	writel(0x96, edp->pll + DP_QSERDES_V8_COM_CMN_CONFIG_1);
+	writel(cmn_config_1, edp->pll + DP_QSERDES_V8_COM_CMN_CONFIG_1);
 	writel(0x3f, edp->pll + DP_QSERDES_V8_COM_INTEGLOOP_GAIN0_MODE0);
 	writel(0x00, edp->pll + DP_QSERDES_V8_COM_INTEGLOOP_GAIN1_MODE0);
 	writel(0x00, edp->pll + DP_QSERDES_V8_COM_VCO_TUNE_MAP);
@@ -1044,12 +1308,12 @@ static int qcom_edp_com_configure_pll_v8(const struct qcom_edp *edp)
 	writel(lock_cmp2_mode0, edp->pll + DP_QSERDES_V8_COM_LOCK_CMP2_MODE0);
 
 	writel(0x0a, edp->pll + DP_QSERDES_V8_COM_BG_TIMER);
-	writel(0x0a, edp->pll + DP_QSERDES_V8_COM_CORECLK_DIV_MODE0);
+	writel(coreclk_div_mode0, edp->pll + DP_QSERDES_V8_COM_CORECLK_DIV_MODE0);
 	writel(0x00, edp->pll + DP_QSERDES_V8_COM_VCO_TUNE_CTRL);
 	writel(0x1f, edp->pll + DP_QSERDES_V8_COM_BIAS_EN_CLKBUFLR_EN);
-	writel(0x00, edp->pll + DP_QSERDES_V8_COM_CORE_CLK_EN);
-	writel(0xa0, edp->pll + DP_QSERDES_V8_COM_VCO_TUNE1_MODE0);
-	writel(0x01, edp->pll + DP_QSERDES_V8_COM_VCO_TUNE2_MODE0);
+	writel(core_clk_en, edp->pll + DP_QSERDES_V8_COM_CORE_CLK_EN);
+	writel(vco_tune1_mode0, edp->pll + DP_QSERDES_V8_COM_VCO_TUNE1_MODE0);
+	writel(vco_tune2_mode0, edp->pll + DP_QSERDES_V8_COM_VCO_TUNE2_MODE0);
 
 	writel(code1_mode0, edp->pll + DP_QSERDES_V8_COM_BIN_VCOCAL_CMP_CODE1_MODE0);
 	writel(code2_mode0, edp->pll + DP_QSERDES_V8_COM_BIN_VCOCAL_CMP_CODE2_MODE0);
@@ -1104,27 +1368,85 @@ static const struct phy_ver_ops qcom_edp_phy_ops_v8 = {
 	.com_clk_fwd_cfg	= qcom_edp_com_clk_fwd_cfg_v8,
 	.com_configure_pll	= qcom_edp_com_configure_pll_v8,
 	.com_configure_ssc	= qcom_edp_com_configure_ssc_v8,
-	.com_ldo_config		= qcom_edp_ldo_config_v6,
-	.prepare_power_on	= qcom_edp_prepare_power_on_v46,
-	.configure_tx_pre_pll	= qcom_edp_configure_tx_pre_pll_v46,
-	.configure_rate_pcs	= qcom_edp_configure_rate_pcs_v46,
-	.configure_lanes_after_pll = qcom_edp_configure_lanes_after_pll_v46,
-	.finish_power_on	= qcom_edp_finish_power_on_v46,
+	.com_ldo_config		= qcom_edp_ldo_config_v8,
+	.prepare_power_on	= qcom_edp_prepare_power_on_v8,
+	.configure_tx_pre_pll	= qcom_edp_configure_tx_pre_pll_v8,
+	.configure_rate_pcs	= qcom_edp_configure_rate_pcs_v8,
+	.configure_lanes_after_pll = qcom_edp_configure_lanes_after_pll_v8,
+	.finish_power_on	= qcom_edp_finish_power_on_v8,
 };
 
 static struct qcom_edp_phy_cfg glymur_phy_cfg = {
 	.aux_cfg = edp_phy_aux_cfg_v8,
 	.vco_div_cfg = edp_phy_vco_div_cfg_v8,
 	.dp_swing_pre_emph_cfg = &dp_phy_swing_pre_emph_cfg_v8,
-	.edp_swing_pre_emph_cfg = &edp_phy_swing_pre_emph_cfg,
+	.edp_swing_pre_emph_cfg = &edp_phy_swing_pre_emph_cfg_v8,
 	.ver_ops = &qcom_edp_phy_ops_v8,
 };
 
+static void qcom_edp_disable_dcc(const struct qcom_edp *edp)
+{
+	writel(0x06, edp->tx0 + TXn_DCC0_CTRL);
+	writel(0x06, edp->tx0 + TXn_DCC1_CTRL);
+	writel(0x06, edp->tx1 + TXn_DCC0_CTRL);
+	writel(0x06, edp->tx1 + TXn_DCC1_CTRL);
+}
+
+static int qcom_edp_run_dcc_calibration(const struct qcom_edp *edp)
+{
+	u32 val;
+	int ret;
+
+	writel(0x07, edp->tx0 + TXn_DCC0_CTRL);
+	writel(0x07, edp->tx0 + TXn_DCC1_CTRL);
+
+	if (edp->dp_opts.lanes > 2) {
+		writel(0x07, edp->tx1 + TXn_DCC0_CTRL);
+		writel(0x07, edp->tx1 + TXn_DCC1_CTRL);
+	}
+
+	ret = readl_poll_timeout(edp->tx0 + TXn_DCC_DONE,
+				 val, (val & GENMASK(1, 0)) == GENMASK(1, 0),
+				 500, 10000);
+	if (ret)
+		goto out_disable_dcc;
+
+	if (edp->dp_opts.lanes > 2) {
+		ret = readl_poll_timeout(edp->tx1 + TXn_DCC_DONE,
+					 val, (val & GENMASK(1, 0)) == GENMASK(1, 0),
+					 500, 10000);
+	}
+
+out_disable_dcc:
+	qcom_edp_disable_dcc(edp);
+
+	return ret;
+}
+
+static void qcom_edp_run_tsync(const struct qcom_edp *edp)
+{
+	writel(0x0f, edp->tx0 + TXn_RESET_TSYNC_EN);
+	writel(0x0f, edp->tx1 + TXn_RESET_TSYNC_EN);
+	writel(0x03, edp->edp + DP_PHY_TSYNC_OVRD);
+	writel(0x23, edp->edp + DP_PHY_TSYNC_OVRD);
+	writel(0x22, edp->edp + DP_PHY_TSYNC_OVRD);
+	writel(0x0a, edp->tx0 + TXn_RESET_TSYNC_EN);
+	writel(0x0a, edp->tx1 + TXn_RESET_TSYNC_EN);
+	writel(0x3e, edp->edp + DP_PHY_TSYNC_OVRD);
+}
+
 static int qcom_edp_prepare_power_on_v46(const struct qcom_edp *edp)
 {
 	return 0;
 }
 
+static int qcom_edp_prepare_power_on_v8(const struct qcom_edp *edp)
+{
+	qcom_edp_disable_dcc(edp);
+
+	return 0;
+}
+
 static int qcom_edp_configure_tx_pre_pll_v46(const struct qcom_edp *edp)
 {
 	writel(0x05, edp->edp + DP_PHY_TX0_TX1_LANE_CTL);
@@ -1145,6 +1467,14 @@ static int qcom_edp_configure_tx_pre_pll_v46(const struct qcom_edp *edp)
 	return 0;
 }
 
+static int qcom_edp_configure_tx_pre_pll_v8(const struct qcom_edp *edp)
+{
+	writel(0x05, edp->edp + DP_PHY_TX0_TX1_LANE_CTL);
+	writel(0x05, edp->edp + DP_PHY_TX2_TX3_LANE_CTL);
+
+	return qcom_edp_configure_tx_pre_pll_v8_lanes(edp);
+}
+
 static void qcom_edp_configure_lanes_after_pll_v46(const struct qcom_edp *edp)
 {
 	u32 bias0_en, drvr0_en, bias1_en, drvr1_en;
@@ -1201,6 +1531,22 @@ static int qcom_edp_configure_rate_pcs_v46(const struct qcom_edp *edp,
 	return qcom_edp_set_vco_div(edp, pixel_freq);
 }
 
+static int qcom_edp_configure_rate_pcs_v8(const struct qcom_edp *edp,
+					  unsigned long *pixel_freq)
+{
+	int ret;
+
+	ret = qcom_edp_set_vco_div(edp, pixel_freq);
+	if (ret)
+		return ret;
+
+	ret = qcom_edp_set_link_rate_aux_cfg2(edp);
+	if (ret)
+		return ret;
+
+	return qcom_edp_configure_pcs_v8(edp);
+}
+
 static int qcom_edp_start_pll(const struct qcom_edp *edp)
 {
 	int ret;
@@ -1231,6 +1577,24 @@ static int qcom_edp_finish_power_on_v46(const struct qcom_edp *edp)
 				  500, 10000);
 }
 
+static int qcom_edp_finish_power_on_v8(const struct qcom_edp *edp)
+{
+	u32 val;
+	int ret;
+
+	qcom_edp_run_tsync(edp);
+	writel(0x08, edp->edp + DP_PHY_CFG);
+	usleep_range(100, 1000);
+	writel(0x09, edp->edp + DP_PHY_CFG);
+
+	ret = readl_poll_timeout(edp->edp + DP_PHY_STATUS_V8, val, val & BIT(1),
+				 500, 10000);
+	if (ret)
+		return ret;
+
+	return qcom_edp_run_dcc_calibration(edp);
+}
+
 static int qcom_edp_phy_power_on(struct phy *phy)
 {
 	const struct qcom_edp *edp = phy_get_drvdata(phy);

-- 
2.53.0


