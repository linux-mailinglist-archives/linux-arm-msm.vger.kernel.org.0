Return-Path: <linux-arm-msm+bounces-90876-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6CB6GDgSeWkcvAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90876-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 20:30:00 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB2D99DBA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 20:29:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AD52E306AEEA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 19:27:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A3C036F404;
	Tue, 27 Jan 2026 19:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UYHj4j5/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JWg2hO05"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28BB936EAB6
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 19:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769542048; cv=none; b=PG3qy/86XK49thomEDQItgVCw/k2mRK0DIm/6gF4IX5GbmPC6wjpHGa0s6zX8dY0X+F+Cq6H9ZmWrtA2aFBRLx/JXX8ZMaj82mP3UFf5mYGMnT6UYnJsbV3U+gxQuylOz3rP1qiVCe5fCqfeCIp0BOYD0knQv/ygRp8XP9/VXL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769542048; c=relaxed/simple;
	bh=4oyhsvL92/W6SaipuEPDVxPDMNpnID8mT8emKAyjkSA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Vul/zq9Im8vF3Mi70S+OQpDrmRiiKOuduA6W2Uk/qO3hNfFoQrUOcGsOIjb+9JFdPOTIPlqR4JqIOucE9bHIvzfIdwSEs/4qtrIUFMrrwSzzelG47c5EedtXql/yKBirpTovIMmaynPjgVhsmbo7KjBGz3LGildKdI29NbtREZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UYHj4j5/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JWg2hO05; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60RF6U0s2379270
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 19:27:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R2bEMfrvG+BG/GFJ/bryXnEyoZu75Z9QE5XgUVO7MPo=; b=UYHj4j5/kpnAINPE
	T3un1S+7SbF7+OmqRM6P0WhuVk3OmXRLPNTzaoLOIJ4UcxHTwQcBUqCBaOTwr95S
	KDLgblvdil+o72DlG4hO7IQwXBJkyS4HY5HvTkIzaVy9ZS0VJgLF3XkNroeZUaJm
	oGaa5J76//22XuHsYXyR1uLsqX6aNQodmmxBhBWbYCabWSCdQOYwGHfiFwMO0J7V
	5nApYB+BKizUHTT2whd32aBNeS8YH7m7pEBICNuEJU/KCFfIDCI41IS7otBUk3tZ
	MuNFPooc3u7MY2gIT0mBVjffmPeaks9RQ0WhUvpRPQZ4gDZ9u+BgaHghY7kLVSC4
	qh38NA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxsjrabwh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 19:27:25 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a7b7f04a11so27950805ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 11:27:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769542045; x=1770146845; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R2bEMfrvG+BG/GFJ/bryXnEyoZu75Z9QE5XgUVO7MPo=;
        b=JWg2hO05879upO1Bst+dLGD4o1o7YBh9p9hzsR6WL95SbXiibOcI3GwMGldMie6sqh
         Sf/4m4Ta5TSGA9psEliMR3qP3Div7VrE9aLKt/zhk3rCi9aiKVGdjUjC59OU/ke2OUIV
         qddIZKM5vziMVfHnPRY/icArLcShZdJXxn0mk4RJIXT5sUnIrk64olciRNgMVOsKSVPk
         pqEWjYezBOykmclPnYGnbs+HFWpIx0KtSNH2cppaCdY/b8luVf6NTXHm1cY5mVDeY7LG
         Iu/EJ9quFOR6SvJGhF2z70DTLnoG5bKMYWdgceazsFEyoMxIMNNvca3Rr4+nvmg/BRVP
         sywQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769542045; x=1770146845;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=R2bEMfrvG+BG/GFJ/bryXnEyoZu75Z9QE5XgUVO7MPo=;
        b=v8TuD0wJVCyWVwLoya0tIkoumzqeQe/XYaNYqB5ss2U5I7CU0ca+Lp1QOAm38+G4tn
         h1IHuw4jf6irH8HUizCbb9DOfOEgar2sm+WfQlwIfHeGZ3ty0P3s/J0/aP412E+wN408
         4dFihY90GCBiT/JmxFvI1jG2PyCxiF4KKkS5NRjK7SKo84GAQhsldGNUKAkuHOaRVMPA
         SOXv/xN5X99veYvrojU3Ll4bYjthFSjpCQQ+C2O2pDvtVMff+Jaa5x4ck5I5A+36U3GV
         cR+stwUn6JuyyuctRuWHmJ3hJq1vc4j+IfShGjG43hUeHmA+xNDqvG0Qc0roabwi6DhA
         nVoQ==
X-Forwarded-Encrypted: i=1; AJvYcCUP6Teet28eCvGIAZsgDrYVKKeCHq+sEf27Aw1vHO155sXlxEr/LxxBEKZlcE8o7oMszqSdM5dH4OmwAx+t@vger.kernel.org
X-Gm-Message-State: AOJu0YyAqNQ83oX9CfQaporETZxlWsjSy4MTLtDqWswAPIELIp3odRHJ
	qIT25qJ0cJmG4rYFtchlvetBOsMQ+szP0OrJizUB3LbHBQt8xuttTWlT6DqE58yTSesnOq+l/ei
	M4QFkhMueDuA38MOzpPwUJJbcP9B0hExizKnQoRuv/ILwB2MNQtmo4gtNTxU4QhQVfs/E
X-Gm-Gg: AZuq6aI2AnakAnpLGmhDWRMzHtj3F8hoU2NHoNSP+TXpopIbhkT67uv4tLZF0PWAY64
	jKh0zfTFOI6jEkXxzNS6UEIM++g3Qe2HM4LltSy1UNhpa3wDdaX43jagoaA/edw+bcxTQNR3e3J
	6dN4VSqOt89fDALq7M7oPbiAa8hP6IVA2KAJnhzVs3jsO+eevisPRN75HoGDfbpBkYsxFiJWsuz
	xDnrdNn9ecVOIRuKc00ScwRUc/2ySQxrusJpyhcD1JtPeraxz/BkmAeOSdZeqE8OJEWxNex8L+F
	LPozlmHdDgLLS+yhHS/6N4+rYKqV8kXEgmGk8P5L4ev/9ebe6877aaS+MROlNgOi3J/KpaXpK2V
	2ayKrO7RJVtat71milb8B9mkIAcBW0LPnrFlT/K5P
X-Received: by 2002:a17:902:d4cb:b0:299:e031:16d with SMTP id d9443c01a7336-2a870e193bamr23418595ad.33.1769542044692;
        Tue, 27 Jan 2026 11:27:24 -0800 (PST)
X-Received: by 2002:a17:902:d4cb:b0:299:e031:16d with SMTP id d9443c01a7336-2a870e193bamr23418335ad.33.1769542044206;
        Tue, 27 Jan 2026 11:27:24 -0800 (PST)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b414fc4sm1322225ad.32.2026.01.27.11.27.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 11:27:23 -0800 (PST)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Wed, 28 Jan 2026 00:56:39 +0530
Subject: [PATCH 8/8] arm64: defconfig: Enable VIDEOCC and CAMCC drivers on
 Qualcomm X1P42100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260128-purwa-videocc-camcc-v1-8-b23de57df5ba@oss.qualcomm.com>
References: <20260128-purwa-videocc-camcc-v1-0-b23de57df5ba@oss.qualcomm.com>
In-Reply-To: <20260128-purwa-videocc-camcc-v1-0-b23de57df5ba@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: D5Ij4jA6UP5J2W9TV-hOFznBet3mPLqp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDE1OCBTYWx0ZWRfX9zk7+on9u18l
 +SF4SV0q701JQ+gIkbXyh6Pa6uvxfMMl9P6oH1aUG6won0ntMQI1CHUc5cOiYpCtsW+UgT09tHG
 HWQmZnSz8/tsXNw3LeRlux8QtBKoXX0RTSYSbeEYItTtE5MWUKStKEVtyvcOxHuvmHyAOV0/BTY
 GDZZvrsKbSJy+2lM5Qj/jp0FlK2JHEQtxqv7DJWJ3C8ziS4zKITHZNHrttEmGdpssgXuT5BKIrr
 K4cNsLHNL8fWB7wbcala3Yab0Xx57OUiZ8dR7QjcYZCa++r2fDUyPjTnRvN1kBoTsGSLGoGIyPX
 l0FlMPnPLJmCp4MSvc4D7gHCC2owFwqv0GPdEIC1z/7/3jXBkLZzPyR6AP+DYmFFGcZhVG6D9mM
 dXxKtVKVrRzGgQRkGoRDvJddJHCTcX3wJ/ber/F/F6Mfz6wZt1KlnJA6dQm1N8XiTC4zlkpK2b+
 jIXWEvTD7iuwN6TCOuQ==
X-Authority-Analysis: v=2.4 cv=b+i/I9Gx c=1 sm=1 tr=0 ts=6979119d cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=rO3wVDe-YCVyVCuK1RsA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: D5Ij4jA6UP5J2W9TV-hOFznBet3mPLqp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_04,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 impostorscore=0 bulkscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270158
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90876-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jagadeesh.kona@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DDB2D99DBA
X-Rspamd-Action: no action

Enable video and camera clock controller drivers for their respective
functionalities on Qualcomm X1P42100-CRD and similar other platforms
with Snapdragon X1P42100 SoC.

Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 7a6d7e70d38352a3eda4a39c39a9549508b3b944..50cecf05027e6de754771b9ab5195216f908f859 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1461,7 +1461,9 @@ CONFIG_CLK_X1E80100_DISPCC=m
 CONFIG_CLK_X1E80100_GCC=y
 CONFIG_CLK_X1E80100_GPUCC=m
 CONFIG_CLK_X1E80100_TCSRCC=y
+CONFIG_CLK_X1P42100_CAMCC=m
 CONFIG_CLK_X1P42100_GPUCC=m
+CONFIG_CLK_X1P42100_VIDEOCC=m
 CONFIG_CLK_QCM2290_GPUCC=m
 CONFIG_QCOM_A53PLL=y
 CONFIG_QCOM_CLK_APCS_MSM8916=y

-- 
2.34.1


