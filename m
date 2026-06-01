Return-Path: <linux-arm-msm+bounces-110672-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yDS4BEDPHWrHeQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110672-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 20:28:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 804CF623F4B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 20:28:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1A4F430D4E10
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jun 2026 18:23:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C9C63E1D08;
	Mon,  1 Jun 2026 18:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q6Z6BO6Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f0S9Yx66"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 345263EFD07
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Jun 2026 18:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780338172; cv=none; b=fUab1zG3aSPdx2TtrteGEVO+BqA4+5wa+81fJ2S2SgUnplaQTdSRzx4QP5M9t+evUt/yyUIdKXQ6eomloPlNg1i2r0fqUnkkGa9CbTltyp3OoVK5lFB6nHfnG/XuU3kYdlUOQWMPjOriLKbnkkANGLPV38m3BR89QoJ7za4FLoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780338172; c=relaxed/simple;
	bh=rLybFr1nm3KqTJtJoM4+U3ZrfAsIkDs2LbS3+BLktrE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fs/6qQS6479iYqM/wyhC/6F7Z27ibrKUTPaZHKHZbuAgQFhyN5cJKvZALFWc8T1SXfS1sBlW15YahkEsVGCZ9MwsyWhagQqJWYRNzPCI4S7bn3KyfTzSxuRnhsR6ix5E56iB9ktddWxM3bF6cpxcnLwuuwDvbTxAwl1SACG0fHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q6Z6BO6Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f0S9Yx66; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 651F7C0S3563632
	for <linux-arm-msm@vger.kernel.org>; Mon, 1 Jun 2026 18:22:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PMyEHNl/fqkgrWTiyaG6A/NMiRKAiN12ZYqWIjYuh2s=; b=Q6Z6BO6YzYxgofrB
	h9fcXdXTiwVpsMFTafucIiGSPhKeIAFHxL1uoEyFPKg6FD3MLtfj4oa4M86yWW2P
	9mkVUKROE2Q5CSuc6JDfNXs262q86KJJxjok4/IV+tznz8VT/e0GfrA2lI29+bXg
	PXsjwP2rpJOXSKkJ0eiiFtImsylICy5AJByoAj4wlhKHuY2vRDRyBC158jCQPDeU
	waz/isnHkp1Iaq2L8XIxCjxBId5sr8ZjgO/jzu+dLVAp8Ir6RTgPrjgv2790xMJr
	6DFvml/fbJ8a7Qx0pkb3rN8p4fEjVJv8EtcM+my4J/VEfVXAOWb8vRWB84KNOSff
	bhXA7Q==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh6rxtjju-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 18:22:49 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-36bbcd40642so2610453a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 11:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780338169; x=1780942969; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PMyEHNl/fqkgrWTiyaG6A/NMiRKAiN12ZYqWIjYuh2s=;
        b=f0S9Yx66s8+QIfdnF9ca6ykeHhTsZyIPWH8ADdZH/aRyHwTvmBOxzyJVsWN0S742y+
         5QIfKd86nSBFi2ts1fDdXrn2EcQwkmCoRjr44x+7eCCO4Vb63xKygJzk3jkMf6cCq6lZ
         j2Bns9gYlJzjmMu+nh1Kr/VC/UTIq245cdlOnxywyzBFULE68EuGenKlySohgjQiatcN
         aM753a/YyhcfMBkDgtNwoiDmLV4DU6D7+ygBIYD/nT6Xps5gpJ0NNrMOwvTFnbG1stNp
         3gAeo28X42JgOSnc8lIRlqh0LjHC9BmzxRgLskva5uz/hRlRgaHstUaepgxJaNWKAAIb
         e12Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780338169; x=1780942969;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PMyEHNl/fqkgrWTiyaG6A/NMiRKAiN12ZYqWIjYuh2s=;
        b=nGJ7OeYoU8l84nWWmzcAoL4C6h5rP4qfO9jJS8+WPXzPnWihNDkIh9N6ob4kyxlYsV
         HY95kTCRLrWYBETZX8xQiZN7+oBf3g5hIG2Emxa+5mds9nPJWUQA1IAZAd7PBM6H/HZb
         AE08/bQ2pXeFnODgduLUryIaW1HADTwsMDk7oiKbLBuwa3k84QxtqV/8RIUM+036wkKl
         dLUzdMyOBFszvKNn9ETGgEjg1WjSp+COqubMoGLerPIm5rMsFzHo9iZ+sclgx87ZMBBw
         EMSEWL7eGM59sqHpGST0FISsJg7agm4wCFm9DumhzPZ6D/jYgAIBwLgaRzSkjdwAeoB9
         yLVA==
X-Forwarded-Encrypted: i=1; AFNElJ/aVEM+ZhbxoythhPUjxcv/3lGveSFjIbeWUsITFsfymf6C1aN3odJ4OMju5mxotvDzpZyoavzwRVK3pcJc@vger.kernel.org
X-Gm-Message-State: AOJu0YwNPiUgAvdv63xgf/9+a7YNKHCabtLD3barEL2UCl8+lNUOgz8T
	cvvozNpA7leGXgF2q6xJ0Gkovt570uJUNkmQ/pwfKYy69GfTbpZDSrCM9vqo2e2PclNgbcGt4Tm
	TsNF3wAZzJW5Lya7GvzyHepkZq1LYFoKsaYo37Rn5pDjLq9d9gW7V+4yD+K2Gi3G0U0/R
X-Gm-Gg: Acq92OHOnt/Ky9uOgrKvNsbghRFOS+lMghRYGIR79I+o2CjV/gvYC4eGV+nUc8Rv7yd
	60PjGDb6gFOV8hUSeDNN91L7l8zDy2l5MT0PxHI3vZ0UngoKfahsIXpNKKurPXzDu28tH7lxeZj
	OQ5pwHqkKiuuq2GTB8s1BIj1gwsGiMky61ZU9taeXZd4AuzZEzKMd9VrUtxXQV9nwzN7tq64/bR
	04nXFNKaKGKg68OoL6MNuIW6ZMCaBx7A/bdJxb1mpnQdRhF1dXy7xzJ+gLS/EVM4rT8jNzZfh5X
	T2cJWP0vymXaEJ2IEBBu/eZp7oLwq1Lp2MuDGB+/mJL5ZFwsXHJIL/PADYffOkqHcfcZbMeLPxX
	AeN3wpjZuI00yASeW7/cU0WYbquXKmnJu8VXt3hkyGE8OUBaAIhEHLGLktqhIuik=
X-Received: by 2002:a17:90b:2d4d:b0:369:7421:b36f with SMTP id 98e67ed59e1d1-36c50206e8dmr11910345a91.21.1780338168854;
        Mon, 01 Jun 2026 11:22:48 -0700 (PDT)
X-Received: by 2002:a17:90b:2d4d:b0:369:7421:b36f with SMTP id 98e67ed59e1d1-36c50206e8dmr11910309a91.21.1780338168388;
        Mon, 01 Jun 2026 11:22:48 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36dd918f069sm326613a91.1.2026.06.01.11.22.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 11:22:48 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Mon, 01 Jun 2026 23:51:31 +0530
Subject: [PATCH v3 09/12] clk: qcom: gpucc-qcm2290: Park RCG's clk source
 at XO during disable
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260601-shikra-dispcc-gpucc-v3-9-61c1ba3735e8@oss.qualcomm.com>
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
X-Proofpoint-GUID: lVuuvPe-wkgrXawkDdgL3c0TipDVA0i4
X-Authority-Analysis: v=2.4 cv=dsfrzVg4 c=1 sm=1 tr=0 ts=6a1dcdf9 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=zEYBLtLDRKTvQvC0xrIA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDE4MSBTYWx0ZWRfX52gRBklV4+v8
 gM2EoHtBYlw1AoVebgSrZ8pTZaW7VJQv4eakD3vezFdfFBRPJuPoWHho5ZY/zZEmWK2Lf+E7XBd
 tnRmvLYcyRInH1amgHGlYG/di7gHkGYOt6zYRmAYdxh6OPRoP9PdL2NPCBTidhci4GZ70DkHAs0
 49ANyUJKhaXSkarWG2WZytBfC0Qpxm7uXA0hfW39edW6R1P0VL7imafxp/moohRWixp6McJayXB
 QYF8TYahdXHcBgOJJ/TkyLP7GzNJRqt+n+05KzTS2z5BAbWBAABq0bHN3UWd0NHhdFTp1FIlv2Y
 mxC6m1lkmcjSDmvLjs+Chgd76ihlgbVUSh/+XJGoqRw+nieAA6yCRJy/Za+OF1c56rHKdffOik0
 ZZer86GfM0zubf49c60zGAAmWJJWYYcLvwIOlFNa1QSFRhVwMgJ3giL4FENqMRfcdUmVN2y3V/M
 kbaQEG+N4OFT75De6ig==
X-Proofpoint-ORIG-GUID: lVuuvPe-wkgrXawkDdgL3c0TipDVA0i4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 clxscore=1015 adultscore=0 impostorscore=0 malwarescore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
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
	TAGGED_FROM(0.00)[bounces-110672-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
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
X-Rspamd-Queue-Id: 804CF623F4B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The RCG's clk src has to be parked at XO while disabling as per the
HW recommendation, hence use clk_rcg2_shared_ops to achieve the same.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 drivers/clk/qcom/gpucc-qcm2290.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gpucc-qcm2290.c b/drivers/clk/qcom/gpucc-qcm2290.c
index 1c8ed12f6bf8154596d031347540ef621314edc6..2150b94ad0ce5146c47ae21fae4deccdaba20673 100644
--- a/drivers/clk/qcom/gpucc-qcm2290.c
+++ b/drivers/clk/qcom/gpucc-qcm2290.c
@@ -144,7 +144,7 @@ static struct clk_rcg2 gpu_cc_gx_gfx3d_clk_src = {
 		.parent_data = gpu_cc_parent_data_1,
 		.num_parents = ARRAY_SIZE(gpu_cc_parent_data_1),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 

-- 
2.34.1


