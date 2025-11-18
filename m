Return-Path: <linux-arm-msm+bounces-82193-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 70FA1C67DF7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 08:17:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id 3218F2A1D7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 07:17:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C17992FD68B;
	Tue, 18 Nov 2025 07:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XldyVQWT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dO4922dJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FAA22FD1A1
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 07:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763450241; cv=none; b=iV7hloreE595RwbzflXtOT3R7k19P051rKF2hvmtF9cV9EbypydIz/npFkeh/8Tv4Vc4K7WX5/g2JJeYSkt2r4e0/S4yT6c/PUJWXuME1IaQJz0jOeClbY+leiMPtm09iMXMVczIrVVL62H28LBRJGCX3V/zK2g5eavvCci6lk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763450241; c=relaxed/simple;
	bh=1sHC0UwVVr1uwS8Q4dv1DDDeIQRkEFp5snpvfPQCymQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WbrhfZRbgK+b1RB1a1r9H2ZsrHi32znSO1WdXrTapyygJC8YCCoOgVY0F0tyOApbCpsiL9ty4KmxIA8ngKZAs1SYXJ+Bov4t07sQ1/K1d6FODWkfCdNLFhSAhWLNVjoeJZbXKAbcCcIXJ11VKJYu7yyalNEKX4KX9LN7tZcnaU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XldyVQWT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dO4922dJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AI1MKgK4166706
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 07:17:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wQlufkIMG06hgf7XqBGCgD5Spw3+VerKIv8n6vLCr+w=; b=XldyVQWT2lbBe11v
	5n90JZWHZiGQOQDy/Od+v+PN1yzWSDdWmSuQdwAZWVQLfcXB/jqSX84bqNDzsbbp
	A6Fc5zeQvkE82qeS/M3np1Uoswwo6e8xS9HGyUtiv3sUOPx6tvKixftr7Dexo7NK
	oCv67XvPRzrQRUUZNwPuhvBlNNA7OfvmHnKBePWENYXHAQptPvvoN4y35SUdk/Vt
	2Woryze8EpZk20OsKK9wtGdxTrHMtW9+rcL3nVTa7boMj9gdBhuKZvBYSfq9QiiS
	ApA13jiiO4/JZ86VV2syXKvpuK0xmCsjHMyxDPOf2PJSFdKtGWBIqY/CAgc4OcQV
	UMcL8Q==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ag593tkj0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 07:17:19 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-29557f43d56so64981465ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 23:17:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763450239; x=1764055039; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wQlufkIMG06hgf7XqBGCgD5Spw3+VerKIv8n6vLCr+w=;
        b=dO4922dJLqRiU7aOIjynnl77gUDJes8XzoaZ6jLdVo21Q4xqiDnGgqYus+tcE/ZDiX
         ShRNK7xuMkbwXlqlhy8wWnPffWaMXevWzsm3SkSUjs9FwDDc8kKgzRbEHyuuvpF6GQR0
         EhGlMmlI9oJiQRQAzGeoZomqsEOz64/zRm20CTdwUp7qUApMv5I1pdrqJvQ1BBsiOGaK
         OKYELAxhOVWxaCCndaN1rsw7HwWn7FnzAtTs9sjz25Gc1YiRj8TToJEINz9P8QFQsh/Q
         fczA3OSK/DlGqLFfkBS3jU0F59QpsNV+NOSpXi9nigYZffQGSBqm5ElH0mfdd6+iYEEL
         MT5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763450239; x=1764055039;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wQlufkIMG06hgf7XqBGCgD5Spw3+VerKIv8n6vLCr+w=;
        b=GkMtWHL6wssc5pQ2w1xEtLuOJqZawFfkqnl8GMh7dTuknqIVdHzXcMO96b5UjnZZTy
         BF925bMKusWZFKAWUwEbmzeZz0+fHqMvvCXZSzjOvuod65Q/J8THGvD7qE96XbXe3wP5
         1aCsX/s6UcDcx04sA88X1x3mO4jxsMW0BSQePQDVbQPdVFZAUxYbvL+VRGQ7zGEtiTQI
         iaQOByPTD2dWvXMGRctQteAE/ICVgkP2kF2TR4q7YdjowW8VBTlfVSTfcdqlAKCuGgyc
         hmLHi9G4KvRazY5c5VjYSKZ0eDpt8OjPf/tk/QfCT0IGH5u/qKsBRDegu0szuoXwtHfQ
         zRrQ==
X-Gm-Message-State: AOJu0YxrUyWhWXLgIJ8EQf/LeU/nWIhDuRyw9P+C+oZQWCDIMKNT+Y5d
	kIEGC8a7+ySbBugFe8XLEkO3JzVFNEwJxQcHvepidPI+a1c7zYNsL3EjHzU/7N7w3Dv31aW1iBz
	iDnWX0S31IJL6W8MT0cpd+YH/VBby8GwrYNksxyeoOSOSLEJTKJgmpzcDuv4SHcNlI2Lv
X-Gm-Gg: ASbGncsuMOL/4Hwa8XUntzHk8FpJyu4beCN6zUjnx2tZ6zZGTxstM1NzfobBz/bnjNq
	fJ/MAzWWUYR4RwVYIyzML/n8ndFF7mb92igpwpUCR70W1EKebfHspCxCJAjcJAqV7zA4q7UwFhh
	OvjleyEwNK68ePA84rkwdSXwjxzQMPdMCBojRZzwc78X+R+4B3yPqHbUvFT/zTvxQG98BqIrdqb
	74vRLYOeMtn+CAqV9vw6pnMshT6RP9wK0+jlOJ9gzj9XPyhY2U8lm17G24KVGJnvwTvYyOvi3jF
	ffoESr2s9jP0iBauL8G9tj6bvfoxgdRGdOjPvNRImSA8DkTue97LGeXA/q8DpR1VAElz723pWK+
	rQYDxDcc5Jh41s+EdR4X5jjuQOdoRtPek1g==
X-Received: by 2002:a17:903:3c47:b0:298:35c:c313 with SMTP id d9443c01a7336-2986a75f3camr183720855ad.61.1763450238957;
        Mon, 17 Nov 2025 23:17:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHOM35Z74eyPqKFWR25yKr6fKKJcJK6FbOocM2TrUkwY9uR2CPRB3wvxbrYNAsIfZOMJ566Jw==
X-Received: by 2002:a17:903:3c47:b0:298:35c:c313 with SMTP id d9443c01a7336-2986a75f3camr183720575ad.61.1763450238470;
        Mon, 17 Nov 2025 23:17:18 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2986a60b116sm129955285ad.79.2025.11.17.23.17.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 23:17:18 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 12:47:05 +0530
Subject: [PATCH v4 1/5] clk: qcom: clk_mem_branch: add enable mask and
 invert flags
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-sm8750-videocc-v2-v4-1-049882a70c9f@oss.qualcomm.com>
References: <20251118-sm8750-videocc-v2-v4-0-049882a70c9f@oss.qualcomm.com>
In-Reply-To: <20251118-sm8750-videocc-v2-v4-0-049882a70c9f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=AKSYvs3t c=1 sm=1 tr=0 ts=691c1d7f cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=uR87BbDKUCx-STIg3aMA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDA1NiBTYWx0ZWRfX5JLZ9sZPi17o
 Rj+gBy4IiVpkwEUPkKFCNzGiNDymNcQYC9A2oB8xWvqlPfE4H2dBnQRMmGGIojDtIc5hb7qrmSN
 LkAcvoEnRQZNRzmp9y0Grm96msJ/8UN47k2wZKeKso4AMI0TGHoMf9kacmqT9lZJKG1BT5ZyZQ/
 uZLmD+5RuuSdS9pfFjote3ZqNNXJxU1Qh5nrfyYc+HTdhYy1g7NxZSUhqLOJkw+o8YeTkCnyM8a
 6aJNv3RrDUXix7zz+k7L1CVUBC/YHORd1HKPhQ6sqIXrzg8x0WPk/CYfE87P2Pljw2guDZwMZ2w
 uf6jlgx8rKDDHKsWu53YrsPhEN+unFz28KjM0xpxWsJZoAN9sa3MhR3rvFeEumE3R/PkSKcVJ/o
 jBTs7it12EeTtWnmsYVeoEPOxm5B7g==
X-Proofpoint-ORIG-GUID: 4o0410J3y66CLxxD0wuW1ssN3GM9Ztlf
X-Proofpoint-GUID: 4o0410J3y66CLxxD0wuW1ssN3GM9Ztlf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 bulkscore=0 spamscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511180056

Introduce mem_enable_mask and mem_enable_invert in clk_mem_branch to
describe memory gating implementations that use a separate mask and/or
inverted enable logic. This documents hardware behavior in data instead
of code and will be used by upcoming platform descriptions.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/clk-branch.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/clk/qcom/clk-branch.h b/drivers/clk/qcom/clk-branch.h
index 292756435f53648640717734af198442a315272e..6bc2ba2b5350554005b7f0c84f933580b7582fc7 100644
--- a/drivers/clk/qcom/clk-branch.h
+++ b/drivers/clk/qcom/clk-branch.h
@@ -44,6 +44,8 @@ struct clk_branch {
  * @mem_enable_reg: branch clock memory gating register
  * @mem_ack_reg: branch clock memory ack register
  * @mem_enable_ack_mask: branch clock memory enable and ack field in @mem_ack_reg
+ * @mem_enable_mask: branch clock memory enable mask
+ * @mem_enable_invert: branch clock memory enable and disable has invert logic
  * @branch: branch clock gating handle
  *
  * Clock which can gate its memories.
@@ -52,6 +54,8 @@ struct clk_mem_branch {
 	u32	mem_enable_reg;
 	u32	mem_ack_reg;
 	u32	mem_enable_ack_mask;
+	u32	mem_enable_mask;
+	bool	mem_enable_invert;
 	struct clk_branch branch;
 };
 

-- 
2.34.1


