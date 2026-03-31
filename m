Return-Path: <linux-arm-msm+bounces-100999-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GPBqLTmRy2kuIwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100999-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 11:17:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 497B9366E04
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 11:17:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 808AD30292D3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 09:17:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF60A3ED120;
	Tue, 31 Mar 2026 09:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T4t8gOZq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h/P3iT+m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D03363ED109
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 09:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774948656; cv=none; b=JQHf7QB2XQ2h7DUtkwPIz0HU1iYjfo4lttX00OSslRLDF73FuX7/GRVDSAF7sTDjz7VXQnMAAADSnzIx5XKekVtE4Vg59C4hbENqct4bg/aRwxZIhY//6jGsfnBuNpyluEu/Bsmo+50dUxj8TiSGXBqwuJiLNJCCP/YAoaLjMTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774948656; c=relaxed/simple;
	bh=JSIM/1zziQ+S4js/C3wMYQlDMKpyS/ppmWTqSdiK8PQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YX0qyUb3c35x6NKlKsyCNX8BGuBsDFJdSRHiZCZJlrLaNZwxZyaEChIZp1O+YqQaVvxI70Lp6uYTZaz7DIROBH9LfUPX8TfFwnlFbC1/Zfb4aesCjgZMECsvnbmvOuZ0HpbHHadieaGifLis/5+huICVbxHzAo8x4sYtao+41lE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T4t8gOZq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h/P3iT+m; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V5aUQi1841164
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 09:17:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=7ccYDg7cwwX
	Lw+3otD7WVW/2X37CRQFF/HPOHPWrVwE=; b=T4t8gOZqL3M3aAsEOjU9ydTcXLf
	Hk+gyCVd5y4XxsUT/Ab3ubTgBjAMxZaD7yTuVnUTUT8Kq9F8nRLMdDfHrH6OhB4m
	OXWWSINtm1jRTLkDEZdgrnAURQgav5i/Vvcmt3bIfAI97UiwpMGJltJnZb16HJt1
	QQgL0NYKhGVx7VmxH5dhhvOTh6wSeXMV5Ag0SyL18HiVzTylMbF3d5EBZFaN9sTn
	9SS8I9GRNTUgu4pAEWMvNrxNkrD4UKsJY5zKV1cE9kY8R+/cm9Q72kyK2lAZlwr6
	uk4qc+prLzFucVM2MLIG7LYEzyPZtctX46EM2o6iYAJwiyD80uYV/FPMjLg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d80rsjapk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 09:17:33 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b274f94f8so86379401cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 02:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774948652; x=1775553452; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7ccYDg7cwwXLw+3otD7WVW/2X37CRQFF/HPOHPWrVwE=;
        b=h/P3iT+mVjJ/4Obfidx4snbZD49c4EJxglnVo84OpDJNGzvkW+n+hmcuAtlS9M9E23
         y1JSQxx3eUWKtRWCSqu0z2KedbK+sh/XZziwLdEQUBvqXsJda0zUWcfVQLow2vxbpxBP
         3hiefsD60CNWyT14AWWsbOUktLKMwyokenalnAXqOTNhAIFTN5MN0p9GcAApKJvFb0BF
         n9aBgM7cTUmpRzwkEMFRkPeBI86wwdOKOONMXlU6j2BzdM2lew4E26OTE6K5djUVh653
         QHDJqyWSrACqRumieuOoxGE2LQJOa6QQ4DARh05NEkpMm54+RmukKvzt6nw9SSXQGc2x
         fKXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774948652; x=1775553452;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7ccYDg7cwwXLw+3otD7WVW/2X37CRQFF/HPOHPWrVwE=;
        b=ShciU5abpknUMJ/NJ+xLVM1/c3MHePgS4HJ3XhoufeQIGyAbQkCvFXNS4wBn9ZtLOT
         S1GRUXeEmT4CtcEcggjtNfRAwoQ5M6Lg74tidHDF9JvSmZNYrtQv0uj+kzam4reEXsz8
         FOINzoh4jq9ne4HHt4MbsNMDDZooIyPmFyVCxc3AsvhutlUoWMYVOCiBpUVXxzih7s8k
         5BUP/BsSQCttbGvGi4KWJjU6PWyy6ibKepvdWcftp8gcj26t3x9RwtLnLTibFdf00SMT
         4+IGQKabwVoU4eCE90pZDaM4lGSUFGst/vzT10JmlKVNZbpdSzFfy0y7jnLUVOgoYZPo
         sjiw==
X-Forwarded-Encrypted: i=1; AJvYcCW+/7m0F+GbbKOpTFH+rkKeOiDtmDSd3wqxR5pxuYIT70JY8bO2j/FFZFLcCkY2lLyDHw9nK6TNo9+LXiN6@vger.kernel.org
X-Gm-Message-State: AOJu0YwKR71+nY373HlIEk4JaxoHsbk+EPA1MQJkOdlLRK1sIA2a+b7c
	Us0ZUG4hd9gitcls0iK70iaAwEhCT7Lw2eGbzYtvcSCXtzO4/9Q1/ZlK1kat0EOv7lh4VNMEp0W
	r1aEo9KB8zCy3j6tKxaSy0r+fSc55z5FXvaQxlXXSDoGAfP5tUi+7yDCsuVMqji4o/8uP
X-Gm-Gg: ATEYQzwEOHRU2eBffDe8TAUTDeq6CncQ/xDunQn+oufLcp1Di+Jke/FpqEwvFQGV9/B
	v0qb7BK8cQIttyVfbuFR58qPFgAJub475pBcwSia6Qhywn9WAhFptx6jKKh9gQecrn9txLSEXgD
	3E8FjLYT3OWf8aTRABrg+3mdo9vfR12CL5Z+lOcWMHJ2c7UHp/SKJGGa52boi1LF8cmiIaq5cQL
	hwKAL1T/2ieoOrb/1ENt+6RxlYJ2c3ylz7kWBHLrIfhJ3Yz8fJ7sSz0z/V4d1ZBKJJK+FtK9boz
	Fj3Qovhzdga9kXDrKAbvqSgZpkG39mk5/GlXclYI3k+BkXEJN8I50syO3yNxl2mTmKTCAYFi13m
	K3gXWyA73yMYt02PzF6hTmEIlYdMVN4zvDE9q
X-Received: by 2002:ac8:58d5:0:b0:4f7:a06d:c4df with SMTP id d75a77b69052e-50d2c92fa59mr35427701cf.33.1774948652000;
        Tue, 31 Mar 2026 02:17:32 -0700 (PDT)
X-Received: by 2002:ac8:58d5:0:b0:4f7:a06d:c4df with SMTP id d75a77b69052e-50d2c92fa59mr35427451cf.33.1774948651495;
        Tue, 31 Mar 2026 02:17:31 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48880946cc5sm135815e9.13.2026.03.31.02.17.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 02:17:30 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 2/2] clk: qcom: Constify list of critical CBCR registers
Date: Tue, 31 Mar 2026 11:17:23 +0200
Message-ID: <20260331091721.61613-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260331091721.61613-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260331091721.61613-3-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=18390; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=JSIM/1zziQ+S4js/C3wMYQlDMKpyS/ppmWTqSdiK8PQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpy5EivxyAXv/PseRB2rPa7IEnw7xou0qljON0A
 Hze1Xf8wRqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCacuRIgAKCRDBN2bmhouD
 1xUCD/99nlXXXTXtA7ePJceS+uzz9C7GynJ3Rbd6oV8g+w7QM/o3KRVElTi4PKe/i+E/Y6g4DjK
 BCA6KyVYLCi9nNfus97G/g/il4hTn1I9ZXGu52Q6RLBbPvv01ShT1qP99KM4z3Mdz7ybSxrnuAT
 KfQPW1XdMvAOAt4owtO3eR29CG/KiIWGVgNkiLag+ZBmYWZMrskhxoUhml0tr96PigGhVtVGuvQ
 0s2ZfVzyLQtHfdbMLo6yABe3T6AW3uWoVr6ygiDIiiY+r09Ta1NZPJbUxkbf0gqnHNaF++nkk6X
 SWXRsd3y3xJFYNalL/82r7MQfo2oeGp88BZSH4zi7mjiDF+fB/Yls8fyYH2KzvGPXLtcGiiv4Yv
 9FzFwDXlH3TdImYFLEsrAvRoSuvKaGXcukO3Z3TsEGqsYCwuwBeR76CHwTyk1QVPJGRxAch3cxE
 JU/7WacmoVHnVcQsblCkAtIMMh/pnXNbGEoG5bHOGAPnFtOktzhkI0SaGefOUzJkVcl6lf87Mdv
 U11w6Ai9QqG+RI9FyGkFlhzgyp1FvgnyLJtCJNXmka2H21WXtOo5iu37hX30u8Od6kmxoaTO+t3
 U3qYB7EZzF2qO7HVDrEGlh9rsH+Ih63qGqld57OpSCNATxXavajyfoaVF1m9xcMDX2OSHt1W6fx CVtrEPwgnOHY+cw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ikxuMVSXSzDU6Bi8fXfyqhbzoGVsP6Ih
X-Authority-Analysis: v=2.4 cv=VInQXtPX c=1 sm=1 tr=0 ts=69cb912d cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=j6FNNbI0-hDOaWdGd2EA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: ikxuMVSXSzDU6Bi8fXfyqhbzoGVsP6Ih
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDA4OCBTYWx0ZWRfX1H7qW6Hm9TdV
 pyzfbSt1Sx57dGVI+kGz++gqzEmlQW+rxxOOIDRvxfaQzdAYGbtXL0ZrownU7REZiKceDGfInIp
 50EQKLC1YBtzYjClkBfiSgN3EhOZ/PCUCSKDwYt9uNbmHzFR/oky96176FVi0NZsCRAikWxmheV
 p6KhLml40HB0v+miY96Mn8p5RILs76hjbP8uI4MCJUowLycpIQItKFDzYt4v3QTOSZIidI57YII
 qWNUPPWFd7iRtvq0NHAcLtsMLJPkr1fuwu3QP605vqS4MW10Y/cacVRaTlVAgYWPs7nYRWP5xnG
 C7vAqL/WtXJgKjrCO2RUTxhz8B13eIYDRFW+BDK9Qz8eetttUWYv5GFila4mmYcOni/BUrp3VU/
 4zvmMWjFQ0GdazWwhqCQLiMY7qUBdiPOmLcGZTg9/1w3e/NHf1bm+ayXy5jeHRZYOiiytNE7MZv
 RKwa6c3h46Rsf8k3CFA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310088
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,gmail.com,foss.st.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-100999-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-0.999];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 497B9366E04
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The static array 'xxx_critical_cbcrs' contains probe match-like data and
is not modified: neither by the driver defining it nor by common.c code
using it.

Make it const for code safety and code readability.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/clk/qcom/cambistmclkcc-kaanapali.c | 2 +-
 drivers/clk/qcom/cambistmclkcc-sm8750.c    | 2 +-
 drivers/clk/qcom/camcc-kaanapali.c         | 2 +-
 drivers/clk/qcom/camcc-milos.c             | 2 +-
 drivers/clk/qcom/camcc-sc8180x.c           | 2 +-
 drivers/clk/qcom/camcc-sm8450.c            | 2 +-
 drivers/clk/qcom/camcc-sm8550.c            | 2 +-
 drivers/clk/qcom/camcc-sm8650.c            | 2 +-
 drivers/clk/qcom/camcc-sm8750.c            | 2 +-
 drivers/clk/qcom/camcc-x1e80100.c          | 2 +-
 drivers/clk/qcom/common.h                  | 2 +-
 drivers/clk/qcom/dispcc-eliza.c            | 2 +-
 drivers/clk/qcom/dispcc-glymur.c           | 2 +-
 drivers/clk/qcom/dispcc-kaanapali.c        | 2 +-
 drivers/clk/qcom/dispcc-milos.c            | 2 +-
 drivers/clk/qcom/dispcc-qcs615.c           | 2 +-
 drivers/clk/qcom/gcc-eliza.c               | 2 +-
 drivers/clk/qcom/gcc-glymur.c              | 2 +-
 drivers/clk/qcom/gcc-kaanapali.c           | 2 +-
 drivers/clk/qcom/gcc-milos.c               | 2 +-
 drivers/clk/qcom/gcc-sc8180x.c             | 2 +-
 drivers/clk/qcom/gpucc-glymur.c            | 2 +-
 drivers/clk/qcom/gpucc-kaanapali.c         | 2 +-
 drivers/clk/qcom/gpucc-milos.c             | 2 +-
 drivers/clk/qcom/gpucc-qcs615.c            | 2 +-
 drivers/clk/qcom/videocc-glymur.c          | 2 +-
 drivers/clk/qcom/videocc-kaanapali.c       | 2 +-
 drivers/clk/qcom/videocc-milos.c           | 2 +-
 drivers/clk/qcom/videocc-qcs615.c          | 2 +-
 drivers/clk/qcom/videocc-sm8450.c          | 2 +-
 drivers/clk/qcom/videocc-sm8550.c          | 4 ++--
 drivers/clk/qcom/videocc-sm8750.c          | 2 +-
 32 files changed, 33 insertions(+), 33 deletions(-)

diff --git a/drivers/clk/qcom/cambistmclkcc-kaanapali.c b/drivers/clk/qcom/cambistmclkcc-kaanapali.c
index 77adb453ab21..6028d8f6959c 100644
--- a/drivers/clk/qcom/cambistmclkcc-kaanapali.c
+++ b/drivers/clk/qcom/cambistmclkcc-kaanapali.c
@@ -383,7 +383,7 @@ static struct clk_alpha_pll *cam_bist_mclk_cc_kaanapali_plls[] = {
 	&cam_bist_mclk_cc_pll0,
 };
 
-static u32 cam_bist_mclk_cc_kaanapali_critical_cbcrs[] = {
+static const u32 cam_bist_mclk_cc_kaanapali_critical_cbcrs[] = {
 	0x40e0, /* CAM_BIST_MCLK_CC_SLEEP_CLK */
 };
 
diff --git a/drivers/clk/qcom/cambistmclkcc-sm8750.c b/drivers/clk/qcom/cambistmclkcc-sm8750.c
index f0d7e3b7c532..5df12aced4a5 100644
--- a/drivers/clk/qcom/cambistmclkcc-sm8750.c
+++ b/drivers/clk/qcom/cambistmclkcc-sm8750.c
@@ -402,7 +402,7 @@ static struct clk_alpha_pll *cam_bist_mclk_cc_sm8750_plls[] = {
 	&cam_bist_mclk_cc_pll0,
 };
 
-static u32 cam_bist_mclk_cc_sm8750_critical_cbcrs[] = {
+static const u32 cam_bist_mclk_cc_sm8750_critical_cbcrs[] = {
 	0x40f8, /* CAM_BIST_MCLK_CC_SLEEP_CLK */
 };
 
diff --git a/drivers/clk/qcom/camcc-kaanapali.c b/drivers/clk/qcom/camcc-kaanapali.c
index acf5f476955b..af5486418492 100644
--- a/drivers/clk/qcom/camcc-kaanapali.c
+++ b/drivers/clk/qcom/camcc-kaanapali.c
@@ -2600,7 +2600,7 @@ static struct clk_alpha_pll *cam_cc_kaanapali_plls[] = {
 	&cam_cc_pll7,
 };
 
-static u32 cam_cc_kaanapali_critical_cbcrs[] = {
+static const u32 cam_cc_kaanapali_critical_cbcrs[] = {
 	0x21398, /* CAM_CC_DRV_AHB_CLK */
 	0x21390, /* CAM_CC_DRV_XO_CLK */
 	0x21364, /* CAM_CC_GDSC_CLK */
diff --git a/drivers/clk/qcom/camcc-milos.c b/drivers/clk/qcom/camcc-milos.c
index 556c3c33c106..409d47098c10 100644
--- a/drivers/clk/qcom/camcc-milos.c
+++ b/drivers/clk/qcom/camcc-milos.c
@@ -2104,7 +2104,7 @@ static struct clk_alpha_pll *cam_cc_milos_plls[] = {
 	&cam_cc_pll6,
 };
 
-static u32 cam_cc_milos_critical_cbcrs[] = {
+static const u32 cam_cc_milos_critical_cbcrs[] = {
 	0x25038, /* CAM_CC_GDSC_CLK */
 	0x2505c, /* CAM_CC_SLEEP_CLK */
 };
diff --git a/drivers/clk/qcom/camcc-sc8180x.c b/drivers/clk/qcom/camcc-sc8180x.c
index bd06d271928e..016f37d08468 100644
--- a/drivers/clk/qcom/camcc-sc8180x.c
+++ b/drivers/clk/qcom/camcc-sc8180x.c
@@ -2829,7 +2829,7 @@ static struct clk_alpha_pll *cam_cc_sc8180x_plls[] = {
 	&cam_cc_pll6,
 };
 
-static u32 cam_cc_sc8180x_critical_cbcrs[] = {
+static const u32 cam_cc_sc8180x_critical_cbcrs[] = {
 	0xc1e4, /* CAM_CC_GDSC_CLK */
 	0xc200, /* CAM_CC_SLEEP_CLK */
 };
diff --git a/drivers/clk/qcom/camcc-sm8450.c b/drivers/clk/qcom/camcc-sm8450.c
index 430b436a673e..1891262a559b 100644
--- a/drivers/clk/qcom/camcc-sm8450.c
+++ b/drivers/clk/qcom/camcc-sm8450.c
@@ -2915,7 +2915,7 @@ static struct clk_alpha_pll *cam_cc_sm8450_plls[] = {
 	&cam_cc_pll8,
 };
 
-static u32 cam_cc_sm8450_critical_cbcrs[] = {
+static const u32 cam_cc_sm8450_critical_cbcrs[] = {
 	0x1320c, /* CAM_CC_GDSC_CLK */
 };
 
diff --git a/drivers/clk/qcom/camcc-sm8550.c b/drivers/clk/qcom/camcc-sm8550.c
index 8c42ae7544aa..34d53e2ffad7 100644
--- a/drivers/clk/qcom/camcc-sm8550.c
+++ b/drivers/clk/qcom/camcc-sm8550.c
@@ -3517,7 +3517,7 @@ static struct clk_alpha_pll *cam_cc_sm8550_plls[] = {
 	&cam_cc_pll12,
 };
 
-static u32 cam_cc_sm8550_critical_cbcrs[] = {
+static const u32 cam_cc_sm8550_critical_cbcrs[] = {
 	0x1419c, /* CAM_CC_GDSC_CLK */
 	0x142cc, /* CAM_CC_SLEEP_CLK */
 };
diff --git a/drivers/clk/qcom/camcc-sm8650.c b/drivers/clk/qcom/camcc-sm8650.c
index c0055fb08f62..9dea43e74cb6 100644
--- a/drivers/clk/qcom/camcc-sm8650.c
+++ b/drivers/clk/qcom/camcc-sm8650.c
@@ -3533,7 +3533,7 @@ static struct clk_alpha_pll *cam_cc_sm8650_plls[] = {
 	&cam_cc_pll10,
 };
 
-static u32 cam_cc_sm8650_critical_cbcrs[] = {
+static const u32 cam_cc_sm8650_critical_cbcrs[] = {
 	0x132ec, /* CAM_CC_GDSC_CLK */
 	0x13308, /* CAM_CC_SLEEP_CLK */
 	0x13314, /* CAM_CC_DRV_XO_CLK */
diff --git a/drivers/clk/qcom/camcc-sm8750.c b/drivers/clk/qcom/camcc-sm8750.c
index 9b6d49981267..6618b074c90e 100644
--- a/drivers/clk/qcom/camcc-sm8750.c
+++ b/drivers/clk/qcom/camcc-sm8750.c
@@ -2651,7 +2651,7 @@ static struct clk_alpha_pll *cam_cc_sm8750_plls[] = {
 	&cam_cc_pll6,
 };
 
-static u32 cam_cc_sm8750_critical_cbcrs[] = {
+static const u32 cam_cc_sm8750_critical_cbcrs[] = {
 	0x113c4, /* CAM_CC_DRV_AHB_CLK */
 	0x113c0, /* CAM_CC_DRV_XO_CLK */
 	0x1137c, /* CAM_CC_GDSC_CLK */
diff --git a/drivers/clk/qcom/camcc-x1e80100.c b/drivers/clk/qcom/camcc-x1e80100.c
index 387420533125..81f579ff6993 100644
--- a/drivers/clk/qcom/camcc-x1e80100.c
+++ b/drivers/clk/qcom/camcc-x1e80100.c
@@ -2434,7 +2434,7 @@ static struct clk_alpha_pll *cam_cc_x1e80100_plls[] = {
 	&cam_cc_pll8,
 };
 
-static u32 cam_cc_x1e80100_critical_cbcrs[] = {
+static const u32 cam_cc_x1e80100_critical_cbcrs[] = {
 	0x13a9c, /* CAM_CC_GDSC_CLK */
 	0x13ab8, /* CAM_CC_SLEEP_CLK */
 };
diff --git a/drivers/clk/qcom/common.h b/drivers/clk/qcom/common.h
index 69c4b21333e5..6f2406f8839e 100644
--- a/drivers/clk/qcom/common.h
+++ b/drivers/clk/qcom/common.h
@@ -28,7 +28,7 @@ struct qcom_icc_hws_data {
 struct qcom_cc_driver_data {
 	struct clk_alpha_pll **alpha_plls;
 	size_t num_alpha_plls;
-	u32 *clk_cbcrs;
+	const u32 *clk_cbcrs;
 	size_t num_clk_cbcrs;
 	const struct clk_rcg_dfs_data *dfs_rcgs;
 	size_t num_dfs_rcgs;
diff --git a/drivers/clk/qcom/dispcc-eliza.c b/drivers/clk/qcom/dispcc-eliza.c
index 60de3c743621..479f26e0dde2 100644
--- a/drivers/clk/qcom/dispcc-eliza.c
+++ b/drivers/clk/qcom/dispcc-eliza.c
@@ -2063,7 +2063,7 @@ static struct clk_alpha_pll *disp_cc_eliza_plls[] = {
 	&disp_cc_pll2,
 };
 
-static u32 disp_cc_eliza_critical_cbcrs[] = {
+static const u32 disp_cc_eliza_critical_cbcrs[] = {
 	0xe07c, /* DISP_CC_SLEEP_CLK */
 	0xe05c, /* DISP_CC_XO_CLK */
 	0xc00c, /* DISP_CC_MDSS_RSCC_AHB_CLK */
diff --git a/drivers/clk/qcom/dispcc-glymur.c b/drivers/clk/qcom/dispcc-glymur.c
index aae60291b55e..c4bb328d432f 100644
--- a/drivers/clk/qcom/dispcc-glymur.c
+++ b/drivers/clk/qcom/dispcc-glymur.c
@@ -1921,7 +1921,7 @@ static struct clk_alpha_pll *disp_cc_glymur_plls[] = {
 	&disp_cc_pll1,
 };
 
-static u32 disp_cc_glymur_critical_cbcrs[] = {
+static const u32 disp_cc_glymur_critical_cbcrs[] = {
 	0xe07c, /* DISP_CC_SLEEP_CLK */
 	0xe05c, /* DISP_CC_XO_CLK */
 };
diff --git a/drivers/clk/qcom/dispcc-kaanapali.c b/drivers/clk/qcom/dispcc-kaanapali.c
index ffdb4de3a33e..42912c617c31 100644
--- a/drivers/clk/qcom/dispcc-kaanapali.c
+++ b/drivers/clk/qcom/dispcc-kaanapali.c
@@ -1886,7 +1886,7 @@ static struct clk_alpha_pll *disp_cc_kaanapali_plls[] = {
 	&disp_cc_pll2,
 };
 
-static u32 disp_cc_kaanapali_critical_cbcrs[] = {
+static const u32 disp_cc_kaanapali_critical_cbcrs[] = {
 	0xe064, /* DISP_CC_SLEEP_CLK */
 	0xe05c, /* DISP_CC_XO_CLK */
 	0xc00c, /* DISP_CC_MDSS_RSCC_AHB_CLK */
diff --git a/drivers/clk/qcom/dispcc-milos.c b/drivers/clk/qcom/dispcc-milos.c
index 17ff10cb2f6b..dfffb6d14b0e 100644
--- a/drivers/clk/qcom/dispcc-milos.c
+++ b/drivers/clk/qcom/dispcc-milos.c
@@ -906,7 +906,7 @@ static struct clk_alpha_pll *disp_cc_milos_plls[] = {
 	&disp_cc_pll0,
 };
 
-static u32 disp_cc_milos_critical_cbcrs[] = {
+static const u32 disp_cc_milos_critical_cbcrs[] = {
 	0xe06c, /* DISP_CC_SLEEP_CLK */
 	0xe04c, /* DISP_CC_XO_CLK */
 };
diff --git a/drivers/clk/qcom/dispcc-qcs615.c b/drivers/clk/qcom/dispcc-qcs615.c
index 21974e2574f5..637698e6dc2b 100644
--- a/drivers/clk/qcom/dispcc-qcs615.c
+++ b/drivers/clk/qcom/dispcc-qcs615.c
@@ -739,7 +739,7 @@ static struct clk_alpha_pll *disp_cc_qcs615_plls[] = {
 	&disp_cc_pll0,
 };
 
-static u32 disp_cc_qcs615_critical_cbcrs[] = {
+static const u32 disp_cc_qcs615_critical_cbcrs[] = {
 	0x6054, /* DISP_CC_XO_CLK */
 };
 
diff --git a/drivers/clk/qcom/gcc-eliza.c b/drivers/clk/qcom/gcc-eliza.c
index 9356c5bf0a03..42a83be34e01 100644
--- a/drivers/clk/qcom/gcc-eliza.c
+++ b/drivers/clk/qcom/gcc-eliza.c
@@ -3005,7 +3005,7 @@ static const struct qcom_reset_map gcc_eliza_resets[] = {
 	[GCC_VIDEO_BCR] = { 0x32000 },
 };
 
-static u32 gcc_eliza_critical_cbcrs[] = {
+static const u32 gcc_eliza_critical_cbcrs[] = {
 	0xa0004, /* GCC_CAM_BIST_MCLK_AHB_CLK */
 	0x26004, /* GCC_CAMERA_AHB_CLK */
 	0x26034, /* GCC_CAMERA_XO_CLK */
diff --git a/drivers/clk/qcom/gcc-glymur.c b/drivers/clk/qcom/gcc-glymur.c
index 7a199e1bd493..2736465efdea 100644
--- a/drivers/clk/qcom/gcc-glymur.c
+++ b/drivers/clk/qcom/gcc-glymur.c
@@ -8538,7 +8538,7 @@ static const struct clk_rcg_dfs_data gcc_dfs_clocks[] = {
 	DEFINE_RCG_DFS(gcc_qupv3_wrap2_s7_clk_src),
 };
 
-static u32 gcc_glymur_critical_cbcrs[] = {
+static const u32 gcc_glymur_critical_cbcrs[] = {
 	0x26004, /* GCC_CAMERA_AHB_CLK */
 	0x26040, /* GCC_CAMERA_XO_CLK */
 	0x27004, /* GCC_DISP_AHB_CLK */
diff --git a/drivers/clk/qcom/gcc-kaanapali.c b/drivers/clk/qcom/gcc-kaanapali.c
index 44275bac095e..6e628b51f38c 100644
--- a/drivers/clk/qcom/gcc-kaanapali.c
+++ b/drivers/clk/qcom/gcc-kaanapali.c
@@ -3457,7 +3457,7 @@ static const struct clk_rcg_dfs_data gcc_dfs_clocks[] = {
 	DEFINE_RCG_DFS(gcc_qupv3_wrap4_s4_clk_src),
 };
 
-static u32 gcc_kaanapali_critical_cbcrs[] = {
+static const u32 gcc_kaanapali_critical_cbcrs[] = {
 	0xa0004, /* GCC_CAM_BIST_MCLK_AHB_CLK */
 	0x26004, /* GCC_CAMERA_AHB_CLK */
 	0x2603c, /* GCC_CAMERA_XO_CLK */
diff --git a/drivers/clk/qcom/gcc-milos.c b/drivers/clk/qcom/gcc-milos.c
index 3438fb9039ee..67d0eee8ef35 100644
--- a/drivers/clk/qcom/gcc-milos.c
+++ b/drivers/clk/qcom/gcc-milos.c
@@ -3152,7 +3152,7 @@ static struct gdsc *gcc_milos_gdscs[] = {
 	[USB3_PHY_GDSC] = &usb3_phy_gdsc,
 };
 
-static u32 gcc_milos_critical_cbcrs[] = {
+static const u32 gcc_milos_critical_cbcrs[] = {
 	0x26004, /* GCC_CAMERA_AHB_CLK */
 	0x26018, /* GCC_CAMERA_HF_XO_CLK */
 	0x2601c, /* GCC_CAMERA_SF_XO_CLK */
diff --git a/drivers/clk/qcom/gcc-sc8180x.c b/drivers/clk/qcom/gcc-sc8180x.c
index 35c2e9d555b8..e6b7f1a5dcef 100644
--- a/drivers/clk/qcom/gcc-sc8180x.c
+++ b/drivers/clk/qcom/gcc-sc8180x.c
@@ -4647,7 +4647,7 @@ static struct gdsc *gcc_sc8180x_gdscs[] = {
 	[HLOS1_VOTE_TURING_MMU_TBU1_GDSC] = &hlos1_vote_turing_mmu_tbu1_gdsc,
 };
 
-static u32 gcc_sc8180x_critical_cbcrs[] = {
+static const u32 gcc_sc8180x_critical_cbcrs[] = {
 	0xb004,  /* GCC_VIDEO_AHB_CLK */
 	0xb008,  /* GCC_CAMERA_AHB_CLK */
 	0xb00c,  /* GCC_DISP_AHB_CLK */
diff --git a/drivers/clk/qcom/gpucc-glymur.c b/drivers/clk/qcom/gpucc-glymur.c
index 824b4e09c3f9..54cc3127718a 100644
--- a/drivers/clk/qcom/gpucc-glymur.c
+++ b/drivers/clk/qcom/gpucc-glymur.c
@@ -560,7 +560,7 @@ static struct clk_alpha_pll *gpu_cc_glymur_plls[] = {
 	&gpu_cc_pll0,
 };
 
-static u32 gpu_cc_glymur_critical_cbcrs[] = {
+static const u32 gpu_cc_glymur_critical_cbcrs[] = {
 	0x93a4, /* GPU_CC_CB_CLK */
 	0x9008, /* GPU_CC_CXO_AON_CLK */
 	0x9004, /* GPU_CC_RSCC_XO_AON_CLK */
diff --git a/drivers/clk/qcom/gpucc-kaanapali.c b/drivers/clk/qcom/gpucc-kaanapali.c
index 94f0feb254b3..7f6013b348ad 100644
--- a/drivers/clk/qcom/gpucc-kaanapali.c
+++ b/drivers/clk/qcom/gpucc-kaanapali.c
@@ -423,7 +423,7 @@ static struct clk_alpha_pll *gpu_cc_kaanapali_plls[] = {
 	&gpu_cc_pll0,
 };
 
-static u32 gpu_cc_kaanapali_critical_cbcrs[] = {
+static const u32 gpu_cc_kaanapali_critical_cbcrs[] = {
 	0x9008, /* GPU_CC_CXO_AON_CLK */
 	0x93e8, /* GPU_CC_RSCC_HUB_AON_CLK */
 	0x9004, /* GPU_CC_RSCC_XO_AON_CLK */
diff --git a/drivers/clk/qcom/gpucc-milos.c b/drivers/clk/qcom/gpucc-milos.c
index 7a8a3917db9b..1448d95cb1dc 100644
--- a/drivers/clk/qcom/gpucc-milos.c
+++ b/drivers/clk/qcom/gpucc-milos.c
@@ -500,7 +500,7 @@ static struct clk_alpha_pll *gpu_cc_milos_plls[] = {
 	&gpu_cc_pll0,
 };
 
-static u32 gpu_cc_milos_critical_cbcrs[] = {
+static const u32 gpu_cc_milos_critical_cbcrs[] = {
 	0x93a4, /* GPU_CC_CB_CLK */
 	0x9008, /* GPU_CC_CXO_AON_CLK */
 	0x9010, /* GPU_CC_DEMET_CLK */
diff --git a/drivers/clk/qcom/gpucc-qcs615.c b/drivers/clk/qcom/gpucc-qcs615.c
index 8233136db4d8..91919cdb75ae 100644
--- a/drivers/clk/qcom/gpucc-qcs615.c
+++ b/drivers/clk/qcom/gpucc-qcs615.c
@@ -459,7 +459,7 @@ static struct clk_alpha_pll *gpu_cc_qcs615_plls[] = {
 	&gpu_cc_pll1,
 };
 
-static u32 gpu_cc_qcs615_critical_cbcrs[] = {
+static const u32 gpu_cc_qcs615_critical_cbcrs[] = {
 	0x1078, /* GPU_CC_AHB_CLK */
 };
 
diff --git a/drivers/clk/qcom/videocc-glymur.c b/drivers/clk/qcom/videocc-glymur.c
index 4f1ad0db30e5..bbf13f4ba82d 100644
--- a/drivers/clk/qcom/videocc-glymur.c
+++ b/drivers/clk/qcom/videocc-glymur.c
@@ -467,7 +467,7 @@ static struct clk_alpha_pll *video_cc_glymur_plls[] = {
 	&video_cc_pll0,
 };
 
-static u32 video_cc_glymur_critical_cbcrs[] = {
+static const u32 video_cc_glymur_critical_cbcrs[] = {
 	0x80e0, /* VIDEO_CC_AHB_CLK */
 	0x8138, /* VIDEO_CC_SLEEP_CLK */
 	0x8110, /* VIDEO_CC_XO_CLK */
diff --git a/drivers/clk/qcom/videocc-kaanapali.c b/drivers/clk/qcom/videocc-kaanapali.c
index b060ee34e8a4..b29e3da465e5 100644
--- a/drivers/clk/qcom/videocc-kaanapali.c
+++ b/drivers/clk/qcom/videocc-kaanapali.c
@@ -741,7 +741,7 @@ static struct clk_alpha_pll *video_cc_kaanapali_plls[] = {
 	&video_cc_pll3,
 };
 
-static u32 video_cc_kaanapali_critical_cbcrs[] = {
+static const u32 video_cc_kaanapali_critical_cbcrs[] = {
 	0x817c, /* VIDEO_CC_AHB_CLK */
 	0x81bc, /* VIDEO_CC_SLEEP_CLK */
 	0x81b0, /* VIDEO_CC_TS_XO_CLK */
diff --git a/drivers/clk/qcom/videocc-milos.c b/drivers/clk/qcom/videocc-milos.c
index 012a13f8fb0b..3cce34e8c71a 100644
--- a/drivers/clk/qcom/videocc-milos.c
+++ b/drivers/clk/qcom/videocc-milos.c
@@ -345,7 +345,7 @@ static struct clk_alpha_pll *video_cc_milos_plls[] = {
 	&video_cc_pll0,
 };
 
-static u32 video_cc_milos_critical_cbcrs[] = {
+static const u32 video_cc_milos_critical_cbcrs[] = {
 	0x80f4, /* VIDEO_CC_AHB_CLK */
 	0x8140, /* VIDEO_CC_SLEEP_CLK */
 	0x8124, /* VIDEO_CC_XO_CLK */
diff --git a/drivers/clk/qcom/videocc-qcs615.c b/drivers/clk/qcom/videocc-qcs615.c
index 338ab803d56a..3203cb938ad1 100644
--- a/drivers/clk/qcom/videocc-qcs615.c
+++ b/drivers/clk/qcom/videocc-qcs615.c
@@ -283,7 +283,7 @@ static struct clk_alpha_pll *video_cc_qcs615_plls[] = {
 	&video_pll0,
 };
 
-static u32 video_cc_qcs615_critical_cbcrs[] = {
+static const u32 video_cc_qcs615_critical_cbcrs[] = {
 	0xab8, /* VIDEO_CC_XO_CLK */
 };
 
diff --git a/drivers/clk/qcom/videocc-sm8450.c b/drivers/clk/qcom/videocc-sm8450.c
index acd0928be1f6..18b191f598b5 100644
--- a/drivers/clk/qcom/videocc-sm8450.c
+++ b/drivers/clk/qcom/videocc-sm8450.c
@@ -413,7 +413,7 @@ static struct clk_alpha_pll *video_cc_sm8450_plls[] = {
 	&video_cc_pll1,
 };
 
-static u32 video_cc_sm8450_critical_cbcrs[] = {
+static const u32 video_cc_sm8450_critical_cbcrs[] = {
 	0x80e4, /* VIDEO_CC_AHB_CLK */
 	0x8114, /* VIDEO_CC_XO_CLK */
 	0x8130, /* VIDEO_CC_SLEEP_CLK */
diff --git a/drivers/clk/qcom/videocc-sm8550.c b/drivers/clk/qcom/videocc-sm8550.c
index 32a6505abe26..4e35964f0803 100644
--- a/drivers/clk/qcom/videocc-sm8550.c
+++ b/drivers/clk/qcom/videocc-sm8550.c
@@ -536,13 +536,13 @@ static struct clk_alpha_pll *video_cc_sm8550_plls[] = {
 	&video_cc_pll1,
 };
 
-static u32 video_cc_sm8550_critical_cbcrs[] = {
+static const u32 video_cc_sm8550_critical_cbcrs[] = {
 	0x80f4, /* VIDEO_CC_AHB_CLK */
 	0x8124, /* VIDEO_CC_XO_CLK */
 	0x8140, /* VIDEO_CC_SLEEP_CLK */
 };
 
-static u32 video_cc_sm8650_critical_cbcrs[] = {
+static const u32 video_cc_sm8650_critical_cbcrs[] = {
 	0x80f4, /* VIDEO_CC_AHB_CLK */
 	0x8124, /* VIDEO_CC_XO_CLK */
 	0x8150, /* VIDEO_CC_SLEEP_CLK */
diff --git a/drivers/clk/qcom/videocc-sm8750.c b/drivers/clk/qcom/videocc-sm8750.c
index 7e77822c132c..e9414390a3cc 100644
--- a/drivers/clk/qcom/videocc-sm8750.c
+++ b/drivers/clk/qcom/videocc-sm8750.c
@@ -392,7 +392,7 @@ static struct clk_alpha_pll *video_cc_sm8750_plls[] = {
 	&video_cc_pll0,
 };
 
-static u32 video_cc_sm8750_critical_cbcrs[] = {
+static const u32 video_cc_sm8750_critical_cbcrs[] = {
 	0x80a4, /* VIDEO_CC_AHB_CLK */
 	0x80f8, /* VIDEO_CC_SLEEP_CLK */
 	0x80d4, /* VIDEO_CC_XO_CLK */
-- 
2.51.0


