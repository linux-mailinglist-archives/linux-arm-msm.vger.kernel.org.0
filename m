Return-Path: <linux-arm-msm+bounces-83363-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 07841C8806B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 05:16:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2EA204EA521
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 04:16:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F62B30EF66;
	Wed, 26 Nov 2025 04:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fJZ4FhCv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PdArKtSC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81F4B2248B8
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 04:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764130575; cv=none; b=Popm4tY5bnnBcDdd+Qa9KQAKzbf5OsAIG0hVYUIEr33bkdKn99BDQ+Z51ioMPthfqQC+tdI7MjpMHgE/8WBVqG7m2nJIElj9FKK1t70mm8dCHgL91lG/pUiBV/lH0024a4h6UB1t2//FVDdxi0RtPoxbRaLcgRG/FXDyQzGTgpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764130575; c=relaxed/simple;
	bh=G93MIfdTXt/2FkU81R13wl6SypJAvDPKSmrCGWLQ8Vc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KHD7vJqxM5z5RdCOOSA5LDbJNts7HHMO+xThHWsbQsh4P9tJpSADnhteFhR5Lx4GSpvVHX6lRWRsihE4b/j42mUmXedFYSyNmlYWmr74TFwsoH404weJW63xtl2I9FxhaZf5skI87VA2cFfPlnj8F2nKStkT6XSBOtDtxVek1Lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fJZ4FhCv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PdArKtSC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5APGThJO2655532
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 04:16:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8TXowYIQki5pu5LXX5RGzCaVrmTqBn5V1ZTgaMgjuMk=; b=fJZ4FhCvrdAW3DDR
	o9iP+9cBKfgIS8IrPsZNG1tvBZC0yJnhx1N7+OJSCgRGceWzxndQ0nJJ1HYpSaiO
	kIkJOfc8DqMxAGSw2WGAfDxU5OdLdt6hvms4xsqxmd9YTd76QxM+fgQ0jd3bTpj5
	3WIilKNucbscTTrPt7VMTSzBQTGLlpj3nzfUCyML5fX+uA8pxu45XMpAc64PMTR3
	lNOqq4MTHQVNmaavfNkqUyLHAEXVCDV4Uu6we179MpLMNF1jKQ0wpPmx0FGNRqIj
	y0khUAI+7ingkxUV+UcWGYzW3CyLv54O9yE0KKXzw8T+r8eS7niRL3akCm5sDCo+
	SGEoZQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4an9fxu062-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 04:16:13 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-299d221b749so140912475ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 20:16:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764130573; x=1764735373; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8TXowYIQki5pu5LXX5RGzCaVrmTqBn5V1ZTgaMgjuMk=;
        b=PdArKtSC2WkTc/zORIdcRb00h/PXMP/jcwBYI0MUj+wIVrsYon3tNc/EYqD5Bc/E4l
         X5PuTSq9HeRQHzY98HRE20aUFNN+clT35tigPSEVRGdTZVxWFrWCYs9Gv2T8RUuOGRhF
         QCFlxs/BsQvHR09BcXYkfEtACRS+nRpbAcplTnQsxT512Re99uiNyzbWJCzzfjoAx98p
         TGaEikAKlmIfUBzh40QbZirQ7yb+gjpf0SepUubaJTDlstRgG5xrTY8+RBNHhtWM3OzC
         Efm3DFbyMaxJJtRMjpX/5n3XNglYZksfw3Y+sIe7Bik4G8GA0dA7dZ3FMMLnis3AFJyj
         w43A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764130573; x=1764735373;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8TXowYIQki5pu5LXX5RGzCaVrmTqBn5V1ZTgaMgjuMk=;
        b=AjkZe1ui0kl/BUD/bSrzdrAz9gN3N02kdv9SpILkEjjeGZ0CwIwAyU6KZfEGxrRurb
         ICAEQU1C3yaEiAkj0uuyJi44VAmTE12goy8XZyLyCUJbMEEUyYcNStz06ATQNJdTCOR4
         kaI6oyA7kJrrUUzWxVTS2GpFULJAIohPJUWzxAOvB8PKMdy/6xaUe83ruAaRL+2L9ZHH
         mI8xMgTrQd0XH4qoJCZ+TozEspWMLAS998qjs4Bu8I7rcFaekmoIyECzhlZsxv+LzzR8
         6eKVR6Id/VV0KRUmavQ80IWGHF/QbU4tXenHUQ37Yo9WLSDmV7PABSIt6W3Y3f2c0FXB
         SeqQ==
X-Forwarded-Encrypted: i=1; AJvYcCVNn6d3wkutC2R6UY+IRhGIlVkvL5AamuvZon/BlJrnrUm82XWxuM8U4TSan5OKxosTws49bSfYYDHaccgR@vger.kernel.org
X-Gm-Message-State: AOJu0YxYcBOiHSgxrGS7lsmxq5R95OHMvJ5hM+4oA4ahIQ54+WqWwFMC
	ZHUral97cNxjIPvWOZNdS2pwjPbepjvony8493zDnp+0oGlJoXNB7XJNnVzIyfK7MsPEqs9s45X
	RabB3aUWwvTu3rw8cESuTnpPfSbe6D90wt3fo9+xYXKK5t/c1+9p3X9Roa/mlfOWE5iqE
X-Gm-Gg: ASbGnct9Hj1hMypFRXMWbAF2RQ334p5saQW8OpTvYEi4e/DJzU08GE97FNdVY0Cs5DA
	pVPhwevs3dRKBgSbL7ew4XBYMWIFYYWs1pUBX88syBLneJZSPPUnH1e5oJuq11Gat3rHP20A+G0
	G6PZ5frM2PboVS40G61tj2Oi8F2lK+h0GMtjm3mJM7G3IH6xZEiRb+kmLnNqDfaTo02czliLOZx
	M8Lb3C+gkubZJiatrlZFQ0Zc8MyuNhW9YjSZU1dTp1/xshqa2+fkb2vto7cKporTMLRM8TKeUxf
	4sMYEmaJRNVWDLkNW/Drpua57XQ8zhRMK9zcs/zdu0GH8CEPFzfGyBHvJ9T6cU0Mh56OE46bORn
	dTAYRGBqWTyvaIAZ+6xHvxDQKbT0qeuZRt4KLxu3V
X-Received: by 2002:a17:903:1af0:b0:299:d5a5:3f7b with SMTP id d9443c01a7336-29b6c6b87bcmr193002535ad.53.1764130573190;
        Tue, 25 Nov 2025 20:16:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGdF8pYjUWie8FuBc5mrz3q/OCV2CGlX1j17mHpac1kPPmDSFc/gvxGHFJa7kUpdLkQZvk4LQ==
X-Received: by 2002:a17:903:1af0:b0:299:d5a5:3f7b with SMTP id d9443c01a7336-29b6c6b87bcmr193002055ad.53.1764130572708;
        Tue, 25 Nov 2025 20:16:12 -0800 (PST)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b1075basm179300125ad.21.2025.11.25.20.16.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 20:16:12 -0800 (PST)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Wed, 26 Nov 2025 09:45:51 +0530
Subject: [PATCH 2/5] clk: qcom: gcc-sm8750: Update the SDCC RCGs to use
 shared_floor_ops
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-sdcc_shared_floor_ops-v1-2-9038430dfed4@oss.qualcomm.com>
References: <20251126-sdcc_shared_floor_ops-v1-0-9038430dfed4@oss.qualcomm.com>
In-Reply-To: <20251126-sdcc_shared_floor_ops-v1-0-9038430dfed4@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=I6tohdgg c=1 sm=1 tr=0 ts=69267f0d cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=CIqSYa-xjCW48oPHQIEA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDAzMiBTYWx0ZWRfXwyTihBHyXo1t
 zPf5VZ0iIHpX/YPp2GdAW+BvYyXyzDp2SIt+u2HQpi/0CnWUnPjwztut/IlUSCQ0Jo1NENgDEoT
 bjJbQowb4Pu0E9eY5ZOUbrQyXVOERoIcXmiFH9jGyea/zQvfgTqjttE/wOTSk1ndI9PDxzEeqQh
 ZHssCg2jXE+Qi7bNrY7WyyUxjUJBGtPujPbuF7eELUsOEkIY6B3toTOxcUMI1PsGezqpsaV6yCM
 segymv7qlkBMkwWi9m3UMForxTErT+sH2vjKH5WrMtTFzf3vmHmgxEgULlqFN8FPsFLwxIT7yTe
 +ZZOQZJMZ5f0tvkREtfsUuIXn+rjpSGyPNuaHGdLA==
X-Proofpoint-ORIG-GUID: 1dHnJKnqhQVYSZsJKXweKDFZEq5XaI31
X-Proofpoint-GUID: 1dHnJKnqhQVYSZsJKXweKDFZEq5XaI31
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0 adultscore=0
 malwarescore=0 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511260032

Use shared_floor_ops for the SDCC RCGs so the RCG is safely parked
during disable and the new parent configuration is programmed in
hardware only when the new parent is enabled, avoiding cases where
the RCG configuration fails to update.

Fixes: 3267c774f3ff ("clk: qcom: Add support for GCC on SM8750")
Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sm8750.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sm8750.c b/drivers/clk/qcom/gcc-sm8750.c
index def86b71a3da534f07844f01ecb73b424db3bddc..db81569dd4b17de1c70ab5058d4ea186e08ce09e 100644
--- a/drivers/clk/qcom/gcc-sm8750.c
+++ b/drivers/clk/qcom/gcc-sm8750.c
@@ -1030,7 +1030,7 @@ static struct clk_rcg2 gcc_sdcc2_apps_clk_src = {
 		.parent_data = gcc_parent_data_8,
 		.num_parents = ARRAY_SIZE(gcc_parent_data_8),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_floor_ops,
+		.ops = &clk_rcg2_shared_floor_ops,
 	},
 };
 
@@ -1052,7 +1052,7 @@ static struct clk_rcg2 gcc_sdcc4_apps_clk_src = {
 		.parent_data = gcc_parent_data_0,
 		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_floor_ops,
+		.ops = &clk_rcg2_shared_floor_ops,
 	},
 };
 

-- 
2.34.1


