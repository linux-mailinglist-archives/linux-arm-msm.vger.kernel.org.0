Return-Path: <linux-arm-msm+bounces-109814-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GIJIE2aZFWqNWgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109814-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 15:00:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C7EF5D5F1C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 15:00:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1E096301ED2F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 12:55:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B87F22157B;
	Tue, 26 May 2026 12:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HYzDduqe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a5R9Sruf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D548B24BBF0
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 12:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779800115; cv=none; b=bqTlGfZn9GGY9puGyDTKYjnmvNg2skEBRtT6358qp9DJzaAmSyjuGLN9eRW3B3sGQbPZovITyQ1+Lvou8V6RCyjctKEpMi5avyROWZS/zqLLp1N9PkqVbyJe2qY7uE39sNv2kwGNGNZdjVONORDXhqyxV3fVfEEDvkOi+y4wR4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779800115; c=relaxed/simple;
	bh=E8K8gxQ/TdZcVbxk2ueWju5PhjMe1cZYpqIaYJ69NV4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hnMT0Ied2geLXZI50Z7uwggrGi/HH0iUb9A94Ee3ptBy0jbKLiwf65IQpdLLd3dpnvv0rfYcesdHLWdD+AR6pdfJz+oouhuNSsMIWIsbcBgFfy+/1pdiKpN+s/7dHBD0EvBOj+bTJu6NGkLXYVOfwuhjeJCNKJHsJej7lESoCRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HYzDduqe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a5R9Sruf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QCsVAx2411673
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 12:55:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ag+ERHlpaRZe4pAnmXb0B1hS5kaPrwHjfIHQ6RiEcmM=; b=HYzDduqeKyoKFnef
	aQL+jikR0NzEeR2p6v7uww8wiqvzHTqq0Bdr+V8zRPj+rODUaCVV4gH6WhGzLgHP
	pMZf2mm4DeYOznyOLqEkpuLVHCqb1gVWOzyMoWgUJnC2tId51ikemC6ZVy+b1cDp
	lJXNeZphzr6aXS7GrQ7RCVyw6gSeY4qKbgepbrb57vZyr9z5tWxcumUBIkJWukdx
	Q999OQzBtjg8KhlCconLXbj0eSyp1nOFks7eOjlGYZl/5RikuQpGxN16ECXZlcP9
	C4MGlaMGIQh270qd5T3IsrCGiSn+eu5XmH7GQMIa6HkANDWsXL7tk+Jf376dcpn9
	llIITA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecqync34k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 12:55:12 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2baf7378ad0so111520645ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 05:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779800112; x=1780404912; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ag+ERHlpaRZe4pAnmXb0B1hS5kaPrwHjfIHQ6RiEcmM=;
        b=a5R9SrufMIq8eUsS5mApyR4ccDFN2R1MQelqV7kmaWkB526Hv86aVoUh+CBsff6jqM
         iSh+Eqz+9ieI/ZrWhrskuOGkl8tayjQRWpzlk9qo0YaI1XdDEzjakRk1JXkaWdehpRhW
         StT5/h2moZkovJCYA36W0s/4CwihTM/RFKQRSKCTJQ1io6uva+WOoRZNzamNly/9NXtl
         b7sUbBwW5KuGp37usrRJxcNDCZFXXfEV0eqPgxY11aM1uY4+Wk59fLMNy3zszEI2gKy6
         pUEe5zzqVu2WIvLHqn0gfNh0M8Z7PUVthNjPIO/wvuzRxBQ8gNSx1v+FZI9p/WblYKCm
         mkBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779800112; x=1780404912;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ag+ERHlpaRZe4pAnmXb0B1hS5kaPrwHjfIHQ6RiEcmM=;
        b=GhW7lFKLr3ufHgY9G3NwhG4vLUDHqbsvyPMjMFu6McOVgqOIgkGp1p07Nkq8dVol1B
         REVF64d/8GpeDTrRVb09OEJqf0qym6fxqRL47ii8O6p3k4lCwat0cVj7lHpYhh9IvECV
         M1aKtgAV5ROjp0dGFUrs0K/02UWxM/Te3ih7mO6m9XI8+rac5UC+o04AfNkn1lXoIkPJ
         BJT3G+O2qrDRNgcpVwfenav2LIv77d3IJtgf7B5Jcm1K/XtsSSFAy5Cy5jZ20TintpyV
         I8OuqSGDi3P3lM6jiNqzm/iy0p62UASbCQwfWj4l41XIiHPS2H7+Uv5bka5nDUIP6Bnq
         jcuA==
X-Forwarded-Encrypted: i=1; AFNElJ+LT/uvkKL5m/A1/77SqIH4ExFGZS+8K8WGWrGQ7Z1YezTkjFFld287zXSe70ZziiVOZ6z8BI70+b8Njh6o@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+CoLIuIVUuffX0P5gGF6OFGX3lkRB95yGgJU/RYcIKQyJvDqS
	fVtAnGgmTAaH/AgN7pWFby3sb6LZXOqcdSEGUPuT0b+pUtXHWKr24boIyGPFCG/zBnZSEzhFEPl
	+Crrgli/mM/WJZsT+GSYzypeEbs/CnAtgoiSV8Jajc/vIhtv7bSF1HQ48h3o8VMeE3/RA
X-Gm-Gg: Acq92OG4nYddm31+ig2EinFGhTqDsNuNnSWSMX7KGjSkkq4RR8+MRzA5VdCcSc2EmSV
	eje0+t+gqAJT/Qo80aWibCPx48YdSrAEyBWX0/dcHjqV4aMm+uWqhh22gWc3zE8vYO1IjBgkPU+
	B+Y9vN50GRezAjzXgtBeoLrg74K1RWzuRPsQ1MOio29908rYjBYOd+3eSg0l6FUOLrbgN57pW2s
	RtAZS/LEfRpiHQKKafTE2PSpB/5n/OdgklK1zmiuFu+a5fqrrCTRyeSZU/Ly8xtcmP8GbnnXW9u
	gsvegFRnyyfGzXIyE4rRFrEZQssoWxA6TfvvhCJByPfghm1r81qsVlpZ2IAQEI2jVl0ReLK14LZ
	8oDWnSWa88cpKWRoLPzF5YQerSSgG5IUtg8Fh+g7o0d6LmrqlPNBM
X-Received: by 2002:a17:903:3c6d:b0:2b7:86be:7673 with SMTP id d9443c01a7336-2beb0366450mr191747275ad.6.1779800111728;
        Tue, 26 May 2026 05:55:11 -0700 (PDT)
X-Received: by 2002:a17:903:3c6d:b0:2b7:86be:7673 with SMTP id d9443c01a7336-2beb0366450mr191746875ad.6.1779800111285;
        Tue, 26 May 2026 05:55:11 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58e4fcfsm129000165ad.71.2026.05.26.05.55.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 05:55:10 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Tue, 26 May 2026 18:24:45 +0530
Subject: [PATCH 2/2] clk: qcom: gcc-shikra: Add support for the USB3 DP PHY
 reset
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-shikra-gcc-usb-resets-v1-2-6d9e7fee2998@oss.qualcomm.com>
References: <20260526-shikra-gcc-usb-resets-v1-0-6d9e7fee2998@oss.qualcomm.com>
In-Reply-To: <20260526-shikra-gcc-usb-resets-v1-0-6d9e7fee2998@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=Wpwb99fv c=1 sm=1 tr=0 ts=6a159830 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=T5k1B2oZpLT1qSJ_dCsA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: LLkiUHb6lU3a-sK-MWtjkUJaXAlvWnFp
X-Proofpoint-ORIG-GUID: LLkiUHb6lU3a-sK-MWtjkUJaXAlvWnFp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDExMiBTYWx0ZWRfX36PVPzxBCnTY
 9iZcfRxJLEZLHrRJv/xiDIyfWgF2r2zuOLescIVD8+gZFyCzXaBK5sbNRbzrBuvGjYmYuI9fNeo
 ixvNn/cS6x8t3nqzKiOu/yvBEH9e7OGfJOid/BK2W67uWBbTEDvx648Lyx3Mk5T+vp47snGWA++
 krKby4zXK5aDrpEfaMHnzKt1jQT9fiWzInKgE07Ol7kXHwqQnKEu+47YS2IkdeO2XIhBQ/gr3eB
 b0dZOQaiEQi9pwlka5JvWNQNIjl7Wo7gsELFixYUwED2dTSMII5679u6A6M59Fn5OOPd8gaVX8J
 kCFsRvwQlJ+UX9JgY/7+Fgk+5njwBRb1zapUmgoJslUnb82q8CxT4THgpBpjxCXdGhEYRzkDRea
 1CsX+yALgTKMPcW5RxxTBayNoPQEpjbz93kMqW9Ih7VFURJ2tkFuUv3YS2/3HKMV5i/bfohFOxM
 m3PEqVJrFXmdGmK903g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_03,2026-05-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 impostorscore=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260112
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-109814-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4C7EF5D5F1C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add GCC USB3 DP PHY reset support for Qualcomm Shikra SoC.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-shikra.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-shikra.c b/drivers/clk/qcom/gcc-shikra.c
index fc1c90e7e7469818a4372e1bc192761096441221..f323ac5c6400c430b1c92cfc4f7a1550abf08de9 100644
--- a/drivers/clk/qcom/gcc-shikra.c
+++ b/drivers/clk/qcom/gcc-shikra.c
@@ -4331,6 +4331,7 @@ static const struct qcom_reset_map gcc_shikra_resets[] = {
 	[GCC_VCODEC0_BCR] = { 0x6d034 },
 	[GCC_VENUS_BCR] = { 0x6d018 },
 	[GCC_VIDEO_INTERFACE_BCR] = { 0x6e000 },
+	[GCC_USB3_DP_PHY_PRIM_BCR] = { 0x1b020 },
 };
 
 static struct clk_alpha_pll *gcc_shikra_plls[] = {

-- 
2.34.1


