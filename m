Return-Path: <linux-arm-msm+bounces-118811-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CkIpHF39VGrviQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118811-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 16:59:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 05BA374CB1E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 16:59:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Of84Rvx4;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=XFHlMXHz;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118811-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118811-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 39AD130D43C4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 14:54:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0119F438036;
	Mon, 13 Jul 2026 14:54:40 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB53A33B6C2
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 14:54:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783954479; cv=none; b=uGn7NyswOm0fMZiwMJmq4pns/pmT0/xgAuJcmR2FY3gCr8pDB+H1NwbCSnAwW8OcTVcrgY+282eFlw9wQinpzk/am6bmrZSXUCfZRGJzMI9sloSlSnGaenwt5VYnwxqitKO1DuucxVK8gbj+7rAm0JpaVW0hqAUO5sl3sNYV824=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783954479; c=relaxed/simple;
	bh=X7A8BvifHg9AJtoStT7CZzf1oH5NsdlyLLNOS9sNvUo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ajmJzjCQbaNsa2D45uNUIKZk4xWgJTsy/o6dhJL6FTC47OBCl6BhKdjBK2srDGudVsXKNx/IRw0th6HzhNr/LmD6uz5KwecGZKrD1DoykgKw4XAWdsQAgYZy58vGUNgT4Z+8WPJdYwohi0ob9vm9R5KIJZy4b4cAgKrOm9P+SKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Of84Rvx4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XFHlMXHz; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DCE3q41561386
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 14:54:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Lu5u9GFsbziq+/TkOaetbPmiQkrUsx3PaJxt/gHkQ94=; b=Of84Rvx4SMgY/gTY
	wFfMgFYAflXrxMYUmShV03sowxcrcRemNNz1EMjHWRUlupmmBNrVAyXCeQR7qW3q
	XuVRD7HssOxYadGwO4cXLeTpezLehGVR9A1w+qqp+jFjNzJNFZTaaOhvKAL88gPc
	moYemZ1qA3IuYOhx2IBm806zvWXNyoQAyDPam0wHPLJ9ogcYNgV925mPjaZ+GeNj
	9DfaYqSLon4/X3+CjupEGJW9gl6m139bs5Ybm7I/8Pq3by2XvFTZIccXaOyjm22y
	jJ0ZfmZhSFQd0N8/sPwlvgb4fek5YbFw3ftqIZ2jQvhAVJCEhCLVsy1PU0uMfXsc
	tjxVgQ==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcjn3b43u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 14:54:36 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-6a374e480daso4368399eaf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 07:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783954476; x=1784559276; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lu5u9GFsbziq+/TkOaetbPmiQkrUsx3PaJxt/gHkQ94=;
        b=XFHlMXHzZYdiNtrnhHLyvyXT6bMxContCEBky9BKb7u8P2y1K9UeIy58wncDgxCf7g
         mWpx0tf55SpZ2/TruknHAM64afVHdz1n9pKKOCpJjGx1t7h/3EZCTA2PkvkOGd9UZ2yx
         YraFhHNQmqmjfg9R59r7EvxKLHpj4qVDqbJ5W/nV2eqsV05HvbxmTwYEUzzwAavlxjJN
         rZqorxb0Y/bDpOi3SXrrrqn9liRB47HvGplB3pmrPV3KNIPWXRKY76QkwduIoFsvy9dl
         ClYvIg1AOz2JuQ9BPaCzp43w/w930D6dIgaUYAlTL1wpTc67UdCJ+jfYWIEAi799xOJD
         Df+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783954476; x=1784559276;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lu5u9GFsbziq+/TkOaetbPmiQkrUsx3PaJxt/gHkQ94=;
        b=s6y4/VMH3ZzHnLPl89CvA2zsFwvdtcrqhtvTJLmmrKTmcUDxw7rDF7RregI7XZpbz/
         2gA5ST1Z1Pfb1lANoveuNpWPbbEp2Xfdxxoh6RsLuhJyzLVf7+uSe9ALCv9L6UdTuQgu
         So+daofnC1cbG94r/cs3cnI4ZnHc0wn9iZIYkKAvf66hrND2nJyGpk1e79IgVH1s2mQI
         s+WR5WRwze74GaWrjBdjuEbGruDeLOoURLI+1ZPg51dVJaEJlkOU6KoRFEkDLgvJm2h2
         C63yy/atvPRyRkKj2257yumwoaJotzDerlYneYBHKl7njHhHx6zAVCzIkr5puDFJ5tS9
         iAyg==
X-Forwarded-Encrypted: i=1; AFNElJ+9dOL1IdP6/qih4swRJ17z8SQluIIThIAJ5tpLi50Ts5af+Jgs9pMfUFfBHr6u0DProVKsp4YVUsfOEWPr@vger.kernel.org
X-Gm-Message-State: AOJu0YysGAVmAK4GpCVHGxgGEOJeiY+6Lzs6mISq98z0+RrXv2WtjKhk
	ewi6JKI5t/nhFl/iNEHpYB1n2vBvLK04SrHLE2fe/LXNPstiP0/uKcbzm3rBLYb/5nWB9TNMJJS
	b7us9BDpudqMLY/ITAyjRRjJGry8sG7K+gRCpsuJx9eo8I4DI0OW/FoLRj2Vg26K9gcTs
X-Gm-Gg: AfdE7clodpYIiZidk8f6SOdPVtf4+FM2gTHqEbmb7OEPnos4aOh0FzgF76lp2vBXcL3
	EN4sCCLAUgjyVJ9kzvUcxpTav4Qme0Q89MbW9oGkC6GFZ8hqLm+2PUXzJWg5LujNLx3kj2/YzQZ
	qhUYXIQBlo2s+YNe8+527Hlx35IgtT//34CShn7enQwhKCPrq6GknMYQ264i/nfIlTLtrz/m76O
	XSlmfDRtlKOHyTuMABmoSVgy5HK/aQ/P4HffabR8jFKOkV19ZvLYriH9JzmlofJhP6V+9E18m55
	R0xJrJZAX8ING8Wzzh0CBmTM9+gHg/MZgm/Tmw9CqKdxw1ew4jnOTxDUz8r/tWsjM8i/fMq/MCw
	VBhWjgMCCgwkBgugDeWYyVfmN8KutT18qvTM=
X-Received: by 2002:a05:6820:4c0c:b0:6a3:7681:1f0d with SMTP id 006d021491bc7-6a39be3c2b6mr4863004eaf.21.1783954476000;
        Mon, 13 Jul 2026 07:54:36 -0700 (PDT)
X-Received: by 2002:a05:6820:4c0c:b0:6a3:7681:1f0d with SMTP id 006d021491bc7-6a39be3c2b6mr4862983eaf.21.1783954475641;
        Mon, 13 Jul 2026 07:54:35 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6a38e9bc8casm6728746eaf.2.2026.07.13.07.54.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 07:54:35 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 20:23:43 +0530
Subject: [PATCH v7 05/10] dt-bindings: clock: qcom: document the Eliza GPU
 Clock Controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-b4-eliza_mm_cc_v6-v7-5-4d91bcef50eb@oss.qualcomm.com>
References: <20260713-b4-eliza_mm_cc_v6-v7-0-4d91bcef50eb@oss.qualcomm.com>
In-Reply-To: <20260713-b4-eliza_mm_cc_v6-v7-0-4d91bcef50eb@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDE1NSBTYWx0ZWRfX0AKQwNjeHX4a
 g30JymZ+ZRolEvMHeLSqL00HlXEare5syLmOI5X8l7kdoRDV13X1qHlZFdUY3XMdh4ilKLMNJN4
 599MU8XoedC7LWCMfPKTgVTR2oGU1kQpc07knos9KuBis23dbV0+L5ZHfwMbAiddR/Y7/dveWd3
 Jr4KOGJ6LZfCsH0NhWoCDASZ4jF+Zz137h2USReJaKDT70jn3VS3X1ldiHO2bQlmH0HdYTdnOwh
 5lcz+hdVxIk1YA8kTWiPeeMEQANUGCti6Ke3vDyShCA3rlnmiZQr5q4gmsDjzK8HgKs16jisU5P
 4S6c6WIAfMHyY8FEvb+KI++/f4HCX4qxuJ75Bl5iXrDQ2gsAbp84O7eenXDyem0LWUnlK7VupOr
 9cLg16OeiCiMoGd4H8Ip1pwQnRd5nYnyw+twCOZEevn0La3XrX2Y4MJhCM/6Vbzjc2l9QP+/mm2
 OIjJQewoKxxu3etBfAA==
X-Proofpoint-ORIG-GUID: 7nUj5vMMlcVTa9GRGRGl_pEfnUocZdwl
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDE1NSBTYWx0ZWRfX9rvvtz/4XM6a
 MDP7NBDYkQPKugm2jBVwHLKmCDa1h2tKUg38hwJVe75CjpaG+/1gs+fHKPOl0+Qyez+VlAPkuZD
 lMAXiCHec1LF/xbJ98k8Uu2381mDDTA=
X-Proofpoint-GUID: 7nUj5vMMlcVTa9GRGRGl_pEfnUocZdwl
X-Authority-Analysis: v=2.4 cv=aaJRWxot c=1 sm=1 tr=0 ts=6a54fc2c cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=eqSiwPykCNIpSPSkj8oA:9 a=QEXdDO2ut3YA:10
 a=WZGXeFmKUf7gPmL3hEjn:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 malwarescore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130155
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-118811-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,redhat.com,fairphone.com,gmail.com,foss.st.com,oss.qualcomm.com];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:luca.weiss@fairphone.com,m:konradybcio@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:dmitry.baryshkov@oss.qualcomm.com,m:ajit.pandey@oss.qualcomm.com,m:imran.shaik@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 05BA374CB1E

Add bindings documentation for the Eliza Graphics Clock Controller.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 .../bindings/clock/qcom,sm8450-gpucc.yaml          |  3 ++
 include/dt-bindings/clock/qcom,eliza-gpucc.h       | 51 ++++++++++++++++++++++
 2 files changed, 54 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
index fdbdf605ee695637512ce4f98c9b6fcfacb9154f..734bab762a30800bda94c726f48013679f9ec542 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
@@ -15,6 +15,7 @@ description: |
   domains on Qualcomm SoCs.
 
   See also:
+    include/dt-bindings/clock/qcom,eliza-gpucc.h
     include/dt-bindings/clock/qcom,glymur-gpucc.h
     include/dt-bindings/clock/qcom,kaanapali-gpucc.h
     include/dt-bindings/clock/qcom,milos-gpucc.h
@@ -30,6 +31,7 @@ description: |
 properties:
   compatible:
     enum:
+      - qcom,eliza-gpucc
       - qcom,glymur-gpucc
       - qcom,kaanapali-gpucc
       - qcom,milos-gpucc
@@ -71,6 +73,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,eliza-gpucc
               - qcom,sm8750-gpucc
     then:
       required:
diff --git a/include/dt-bindings/clock/qcom,eliza-gpucc.h b/include/dt-bindings/clock/qcom,eliza-gpucc.h
new file mode 100644
index 0000000000000000000000000000000000000000..c3d9b7827325c5b8db696d1d95b4876e17c01c83
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,eliza-gpucc.h
@@ -0,0 +1,51 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_GPU_CC_ELIZA_H
+#define _DT_BINDINGS_CLK_QCOM_GPU_CC_ELIZA_H
+
+/* GPU_CC clocks */
+#define GPU_CC_AHB_CLK						0
+#define GPU_CC_CRC_AHB_CLK					1
+#define GPU_CC_CX_ACCU_SHIFT_CLK				2
+#define GPU_CC_CX_FF_CLK					3
+#define GPU_CC_CX_GMU_CLK					4
+#define GPU_CC_CXO_AON_CLK					5
+#define GPU_CC_CXO_CLK						6
+#define GPU_CC_DEMET_CLK					7
+#define GPU_CC_DEMET_DIV_CLK_SRC				8
+#define GPU_CC_FF_CLK_SRC					9
+#define GPU_CC_FREQ_MEASURE_CLK					10
+#define GPU_CC_GMU_CLK_SRC					11
+#define GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK				12
+#define GPU_CC_HUB_AON_CLK					13
+#define GPU_CC_HUB_CLK_SRC					14
+#define GPU_CC_HUB_CX_INT_CLK					15
+#define GPU_CC_MEMNOC_GFX_CLK					16
+#define GPU_CC_MND1X_0_GFX3D_CLK				17
+#define GPU_CC_MND1X_1_GFX3D_CLK				18
+#define GPU_CC_PLL0						19
+#define GPU_CC_PLL1						20
+#define GPU_CC_SLEEP_CLK					21
+#define GPU_CC_XO_CLK_SRC					22
+#define GPU_CC_XO_DIV_CLK_SRC					23
+
+/* GPU_CC power domains */
+#define GPU_CC_CX_GDSC						0
+#define GPU_CC_GX_GDSC						1
+
+/* GPU_CC resets */
+#define GPU_CC_ACD_BCR						0
+#define GPU_CC_CB_BCR						1
+#define GPU_CC_CX_BCR						2
+#define GPU_CC_FAST_HUB_BCR					3
+#define GPU_CC_FF_BCR						4
+#define GPU_CC_GFX3D_AON_BCR					5
+#define GPU_CC_GMU_BCR						6
+#define GPU_CC_GX_BCR						7
+#define GPU_CC_RBCPR_BCR					8
+#define GPU_CC_XO_BCR						9
+
+#endif

-- 
2.34.1


