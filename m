Return-Path: <linux-arm-msm+bounces-104589-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cXdTHbW87mlQxQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104589-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 03:32:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C35A246BF3F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 03:32:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5AFED300F5D7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 01:31:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D55CD258CD7;
	Mon, 27 Apr 2026 01:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lYQwuzsl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OJhVawof"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 650CC25FA05
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 01:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777253500; cv=none; b=QkABpp0ZZvDnnh1qXYPAQGXsuuZCMRG27n780CpDxN2OF1aScOZK+kQq0uyIraV3LbDbdV4Kt76P1hYXngZXFivQNRKRJNr+hfipxknQ1lYQ+/biSwqwJJjZz8ZGctmJKAwqXg3njz8XutjZOkqMV5OGNQCiT8uS+H4msZF80aE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777253500; c=relaxed/simple;
	bh=GMmcn+CVvliit5mGd6Y0/iKeyYddLwRd3s2aVazKWbc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OF+6psmov61/cgYHDTb0hr8078LJSdO2c9G8BeBHnL6Wtzxjvr3bjaSHdUxu+tf8P2PeICsAQPhJWOawgerpctQCMr8a13UfAdSQSvGCwX6nlILcSWyWc7BEvN/jWp2d+5nyQxIZG9Y5dfdL9WsGZHrXhbFDv0bvSg4N6RQcsko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lYQwuzsl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OJhVawof; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63QNgruT2540636
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 01:31:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=11+wJCVGbqH
	Fg8+Qau8Gh/1gOG6th05BId0D3j7ZQ8g=; b=lYQwuzslmgwiNHpn7lMKv5N/KwQ
	xRudwaUKa2kiEqtaEQ/leO7Bvrs/irnoMBCJZea8EfAgxUR4S64Gyq4/S14PdOsc
	ftA0EdC52vZ4qhr3qWBtJeuWkkZQQNGx60farJf4+kk7JurlVrVh506s+WU5q1xD
	dkpuJByIOBFNfcbyhX5F/LtMY7Iz4/SvEEQYzKtQbkYtEfAGgylvK93toRiyclBG
	11COuDIAknIJAuv6QfwbaoYycUD6J2JHsllu6XkjsuDV9aAgoPOh+btgHlk4dhrx
	FCjMI6xl0OUtM+u9i2BSeUqlWygH32+i8b2Et8if6WnILLCncqdpgJyrAeA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drnmr3wmg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 01:31:38 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2bda35eab74so8662671eec.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Apr 2026 18:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777253497; x=1777858297; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=11+wJCVGbqHFg8+Qau8Gh/1gOG6th05BId0D3j7ZQ8g=;
        b=OJhVawofm/S4BMWClAc5MsAN3CfqK+wecIhKkZnWFNQWnaVy2X0FMpKGpakGASUBiJ
         ykw1tD7p6Hu6zSUudWmfuyTci/CnkkOz5XyQgh/tEOX/LA2pA6hMowaYPx0yeqzPCKVF
         v2tefHOtZzzcmxTPmweu6zsLl318D9D87NAPTBfhli40ugZ1A3sgA9h7Aoj+AGypNtCt
         b0Zm64DOOQ5lRw0ccPq6j8UZmsv0D+/a6Wn42uTMnBPYCjIxQmh/pmOYitZC2GCVFA0Y
         ah3sFaRsNQprBubXVwbdYUUB61ddwO1p31ytET7SrPNc+Xwm8nrA2KRTPUPYjtrIuKZt
         /j9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777253497; x=1777858297;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=11+wJCVGbqHFg8+Qau8Gh/1gOG6th05BId0D3j7ZQ8g=;
        b=Vq2ycGZ2jbwHLKzU9YWqzkagegGyOYFW+uWO3sgBujG8CdhiZFCDPYxH6cS9Ksdo1o
         5JMCKk/qjmsjjtb715Nl60GJRj+mqLP1t4yCCHSuDMTlx+ycjrXEKrfia0eNmx+ig91r
         /4kCQVs9KujfZQ+CxHe0kYOlEK8OL5BGW2ilG7WdnyjEmIW2XwgYZ0onNvzsYY/j2CLu
         EHFMU/d2to+uwOsntKFiLo/D6UoYh+irfXauuLBQ89QCJ5LLiEvTdpcXN2aozRzAILpw
         /jWra9ZeHJC5EQpaGY+O1xsP/xTv4+Vb/MXBQ3FMQsIY5e1eEcBQOr/UKIBdPjs8UXuV
         KfoQ==
X-Forwarded-Encrypted: i=1; AFNElJ/hQmypmEdtw8kqW2P3QfPfy5EQvrg+ChjdAxWvs4CaPUDxUKd/yOf6zW7Uq8GmeGHyGF1IybkxAiHpqgvY@vger.kernel.org
X-Gm-Message-State: AOJu0YxhI8phdQsc9KhyrN3gov25EyV2NvTIZL6tpqrw+totXeOpHkHP
	/yEHBvRMHfH+HqSZPZZmtQF8rSzJObPRbfRW3RSN2LJ28Ddu0MBMLpEF0LBXSDUGdJxcBwMMOWx
	calayugxAm4Dva7BzLcJPduT/R0zGbLjBenKJaJQslcRcgfyy4yQbgsEepgKXEwkBArXs
X-Gm-Gg: AeBDiesxzBT/WkRG1Tpv3TVGlhbDREoSEySVrd36EatURhNj4WA9hGFqfp3wiN/vowv
	zpgSxhSxW9ox+qm3lqncdKpVXNo38WQdAKNt4SJC2RPJkf1EYOpS2GvBlTGKPSfABxLG5SW1iNQ
	S/ozFbIKmcx7CHo33n5Zfcr+znxVWQpD1BSZxgvWmRxcXZNBHZCPHGlDwEOc8k8Tq1i51JAnL7E
	g0xsok6aOUsATgaPsJofaVAPGp9KA3fUsw7BNmU43lFRD3nJr6FQW4BsWMA1HyCGKeDKlRYyvbk
	VtbyzJONOLVQDqRdTYRZ3lJOyCzLQfVZY08vXGLNpgg8FVWr8otWjtoWncYf211YITEoXnl8xyW
	on0EPrv4ytNkYWoYz1EvXQVvPpj7fcIrIzOoXpbMO/KmHhcLcVPU73AnmgbmlBQtrOKDPy644mh
	tgMwHWcBEq6Sg4hT+Z
X-Received: by 2002:a05:7300:5711:b0:2c5:c532:1fe1 with SMTP id 5a478bee46e88-2e42c15ceacmr18576873eec.3.1777253497370;
        Sun, 26 Apr 2026 18:31:37 -0700 (PDT)
X-Received: by 2002:a05:7300:5711:b0:2c5:c532:1fe1 with SMTP id 5a478bee46e88-2e42c15ceacmr18576852eec.3.1777253496801;
        Sun, 26 Apr 2026 18:31:36 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53a4a8018sm52749042eec.8.2026.04.26.18.31.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 18:31:36 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: "Martin K . Petersen" <martin.petersen@oracle.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Kumar Dwivedi <ram.dwivedi@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-scsi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2 2/2] scsi: ufs: dt-bindings: Add compatible for SA8797P UFS Host Controller
Date: Mon, 27 Apr 2026 09:31:15 +0800
Message-ID: <20260427013115.231731-3-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260427013115.231731-1-shengchao.guo@oss.qualcomm.com>
References: <20260427013115.231731-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=aqCCzyZV c=1 sm=1 tr=0 ts=69eebc7a cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=ld1VxiVWUvbaCiqNsT4A:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: p5rBcUaEzH0Oj9FPFa1G-ERDa4IIS5b_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDAxNCBTYWx0ZWRfXwf3GXNRte/JB
 1gkjdnr1gYNFrqIiJY79grAPAARloO16ThdDmeuF8FMl+6xG/WrfNCArMyWKHSokr95nK4qjDRh
 NNeHugcvF+KrYR2r1tFM+NBoJuwXC2rz1Ve/ALJpxntc/5vGPWaHvgxIGl56M4JqdRhVpjQF1YY
 9nvZfQf5rrkn4bdNY90cWuhrBQy34K3g1WK7+StfdqqTlaT0PtFKAfx38g7RsPKQInTdp5QfTfb
 TYKixNbqiUWHnullOr6h5OkZusl25lXIFVhrQsWupY1wnRn9culyJw+M1lvZ9eY4pK1V5ea3VQ0
 78y0/S6kQ+ptqKkLqhdQI0szco/d0C8/pq1RJS8ti6U42MxSQq/8ccRm25jgei/zyUuOAw4tSr/
 uWwU3ETSc42HShEg86R1JzsDJ1r+raY7DYSkBF2LiSlI3oyFfIS3ny3eSzbODwJjuFwQTvuHkgl
 wDZ9tMBl6+DNzIA9zYA==
X-Proofpoint-ORIG-GUID: p5rBcUaEzH0Oj9FPFa1G-ERDa4IIS5b_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-26_07,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0 adultscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270014
X-Rspamd-Queue-Id: C35A246BF3F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104589-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>

SA8797P is the automotive variant of the Nord SoC. Like SA8255P, its
platform firmware implements an SCMI server that manages UFS resources
such as the PHY, clocks, regulators and resets via the SCMI power
protocol. As a result, the OS-visible DT only describes the controller's
MMIO, interrupt, IOMMU and power-domain interfaces, making SA8255P the
appropriate fallback compatible.

Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 .../devicetree/bindings/ufs/qcom,sa8255p-ufshc.yaml         | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/ufs/qcom,sa8255p-ufshc.yaml b/Documentation/devicetree/bindings/ufs/qcom,sa8255p-ufshc.yaml
index 75fae9f1eba7..db165a235cb6 100644
--- a/Documentation/devicetree/bindings/ufs/qcom,sa8255p-ufshc.yaml
+++ b/Documentation/devicetree/bindings/ufs/qcom,sa8255p-ufshc.yaml
@@ -11,7 +11,11 @@ maintainers:
 
 properties:
   compatible:
-    const: qcom,sa8255p-ufshc
+    oneOf:
+      - const: qcom,sa8255p-ufshc
+      - items:
+          - const: qcom,sa8797p-ufshc
+          - const: qcom,sa8255p-ufshc
 
   reg:
     maxItems: 1
-- 
2.43.0


