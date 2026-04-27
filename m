Return-Path: <linux-arm-msm+bounces-104612-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KDzJBLIE72ma3wAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104612-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 08:39:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EEFAE46DAF0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 08:39:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 09ADC3006686
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 06:39:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A61B237AA7A;
	Mon, 27 Apr 2026 06:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C32//Zer";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OjeDkX58"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20D3337B02A
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 06:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777271972; cv=none; b=Z98iWfefXLx6YvCX3Ue6/+gXTAqwLXB6fty1r42OK1rQrZmdZGSQHwNolVyslp77ROoGPccTmOLpgxJHaNubeu0gxYPTEWbxY1IhGrHxflfI1dlvu2uXYhPQcbo0PU8vSAZce+f02eNq8y0Ne/j041hVsZc5wQi5jMGNqKhqvOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777271972; c=relaxed/simple;
	bh=hwRRAH8UAYgLO3zo/Wqo17qjWrWog7hnbtAUy+Wu+u4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lTUIGjMk5keztMaNqC8S9vLij9eGZ6Wo3fJLzXzhWmziVFaEE0XlTpvwPQi5EcApy9THu78a0nzc6XnaPqz0HmXR/eQAxv8O/nc7rivkJRIC3eNUVbuxVf8QuLe58JZCi3yUJyiIzuM1ReFl9IvwMd2E7qN45QGijTeYg6YjMD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C32//Zer; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OjeDkX58; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R1xRPR047771
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 06:39:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8Hc0hzYvnf7Enn+b3y97rEFqe8dZnu/3813t2l1Q7ag=; b=C32//Zermcpsa+jx
	GsUJtf59SDcBxsoUyyTcCKLD79nVwErA3LUsUuqaYb+6zmF2amaSZdba5EtMxMZf
	n6YTA4t3ZP8nazR0BfpuOVoeFo57agowX+gosTdfJxyxfSj4w8jEtUbuBK8dzung
	lf2QsRpVhSxK08dbaSuzo4VIGjgWKJMKQ2lG4ujNmlVUPUlEFoLytIZPrWHGZOR7
	Mei/cvTwNJKzXS8BYGOSl3HHKQMuLYiUVkv/Uu2heDI1PSS/keS1NhShVHN3t6/b
	6RTLHYbIDt1Co63t+nckKycSNSJXVals1qajElQPsjxNaVuTBxovk4pRKAlMCG7u
	bBG3FA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drnkxcrr1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 06:39:30 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35fb969a4c0so10774919a91.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Apr 2026 23:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777271969; x=1777876769; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8Hc0hzYvnf7Enn+b3y97rEFqe8dZnu/3813t2l1Q7ag=;
        b=OjeDkX585M+rwXdZ4w44WNKgatEJD66weXMX+/UXjGr7bdBRj1eKMPVuMHEwUUpAca
         wHMHO5UYBXMuq88/maSHKmyRE/7nkp1V6LKh+JlbOsgHEUA8vCYcC6pP76savw7vsYLx
         2jGwPQonEIN5MmNybaTjkZLUwQGlIbLf2vlliuHZOy5M5Sl+Gwlr9L+8izSOW0mGnE4K
         ic1ZkDpT7JSnYRgKOYfZyf9m0CNy6l9uNmfJekvsqA/yFpAqPBtCFyiLE+YXZ816bp51
         QyyBbHOWGFf2MkRdluBoVqceq3anisa5feH4JzXFCR6wGpbFYlM8YPIksV+67t6UK7Xh
         Gz4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777271969; x=1777876769;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8Hc0hzYvnf7Enn+b3y97rEFqe8dZnu/3813t2l1Q7ag=;
        b=bkldqEb2trkRcqgV8m/PIiRHwBPOepdG+OUq9sfdRLQWoLz6OFHIPN/M4qCme9ARdA
         cjpaSSAtZVUfyvqHF5BTe/+jy1c7qEFjpKQq/6mN4H0LJHVSKm5ywDFiMrBXLkhsGQTo
         T9x1iJJWf2K9VLUik/RGNbWBJksVMS+NKzPPE6xBNHwo0RDuxveszKkl9slZ3s8A3v4t
         TV38wF9Kxcx2bhToS99DVM6xMuljZpPY7Uo/sLY0jkKr8jD43KVomkP/X2TRvqtwAwAe
         80TfYnbyImX5fEdrykzcrM27EF1SIiVHcFOr3TYqnfaWi7ESJpmjvo+Due5OpbccP0vV
         AK0w==
X-Forwarded-Encrypted: i=1; AFNElJ/1z/cvMGxjRuABKcL8rUEZ9ILCf/GBFYh5QHHwfiT4j32USMwsz0+NHvnwd2UpZ5F8PBXF1E8cS/jmS79F@vger.kernel.org
X-Gm-Message-State: AOJu0Ywz5p1hYGnWyHFSDL0nWXP/5cx2goKHfsaB7gQN+5xgTnqnCNhZ
	ISQWjx3DHepmrWMy6pGzZEqvX5zIjr7NESC3KE22GnjuYyyOF5MenuPTZcTXaagUr6T4EjAGGl7
	AAGDxobB75fy+HTTYj841OcRoYqAZcXafFq6s+LmQgNQNMc8LQlP5jvDmd/fBT/2GjcSw
X-Gm-Gg: AeBDiesTgDO4jzfVk1iUOL7b7xmfRoVgpzBvZNzJ56jTh3Y+BYg/FsCoGDJy1HlYykQ
	Cd60LYoC+RO76RAjaBJ808HUCMrRE5A2iNRl7UrpOqHH+0bW1RoaYEMFJrcq1vDp2ua0hx831ox
	Ks1lgGIEsSKyLmQqLMpVY/qVeEnEpjAGJC1ZdUOJvScYyhq9HJKSX5M3a2U9/LfF51ZMuST84Pk
	4hEQ721IBTIJCbjzHuOct9zg0Pgw/SXxnEGPJakCqyPLgyIn437Zk0/MWUXu3ycPb3MgAvZhPGu
	tiU4mxZwIcl8WTcF6Cbip5dJh1R11s/sPTF7iJPaWdHoNiFY/+Bf+97qn6YQJX24bb6Na7EI8Sg
	LpfOUBRImeQbFYhK4dLzv1bZiHStS/jEQGEd09ky8AA2FE/ZZkAgxRaVV
X-Received: by 2002:a17:90a:dfd0:b0:35e:30bc:96ed with SMTP id 98e67ed59e1d1-36140402361mr42035911a91.10.1777271968397;
        Sun, 26 Apr 2026 23:39:28 -0700 (PDT)
X-Received: by 2002:a17:90a:dfd0:b0:35e:30bc:96ed with SMTP id 98e67ed59e1d1-36140402361mr42035867a91.10.1777271967886;
        Sun, 26 Apr 2026 23:39:27 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-361410a7ab7sm38628234a91.10.2026.04.26.23.39.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 23:39:27 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 12:08:57 +0530
Subject: [PATCH v2 3/6] clk: qcom: common: ensure runtime PM suspend
 completes on probe
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260427-gfx-clk-fixes-v2-3-797e54b3d464@oss.qualcomm.com>
References: <20260427-gfx-clk-fixes-v2-0-797e54b3d464@oss.qualcomm.com>
In-Reply-To: <20260427-gfx-clk-fixes-v2-0-797e54b3d464@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-GUID: Ngh0aOPrMiUUYM0Lw6F0T0_2qYHnYDoW
X-Proofpoint-ORIG-GUID: Ngh0aOPrMiUUYM0Lw6F0T0_2qYHnYDoW
X-Authority-Analysis: v=2.4 cv=TuPWQjXh c=1 sm=1 tr=0 ts=69ef04a2 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=b5psBqh-k-Y8K5vD8YMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDA2OCBTYWx0ZWRfX8zbdELnmRaDJ
 05n16yeqbjz/fBhc23ZTHMZJxDNjC3+EubDPQZA9HyC5m3wJT1isrQIQVdlv1Kmi7Tq8ofdwNK1
 VDgfmLmYhG+Y03srKcZbw02C/AnwFuYVT9qKRywUJo+CPVdGg/3+PKw/1HgOdbCO894RhZM/Gt9
 Ca8lRM4SMgEjX7KNbFHCg0/iJgCiai91jdUfWtVeAVwOV+C/n5P9l0rDUBw9vKbqB+jA8yoorDt
 v05F6PPweP6WZ9zi8XII1XGeZCxJGY9JKfAoH2JSkpjlyUM0gu3+CAerx4tDhX981njjkTo4PgG
 KQXL7cGD9jYvYJLAzf1KACeZijqw4tPp32Z2Od5UJD1n0CmwHBGY31O3XiCM3mJ2iuJvhM2Lgti
 L3Rn8HCK1BryrZ/4xKO2k15P8RZFXe4s9g5DEVkhkjUfiUy6uBU2mVPvZ3OaVUV/tBn3lwXvpMs
 +bzxHOIWY5mFgfm3l9g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 impostorscore=0 clxscore=1015 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270068
X-Rspamd-Queue-Id: EEFAE46DAF0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-104612-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,oss.qualcomm.com,poorly.run,linux.dev,gmail.com,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

When the clock controller is probed with 'use_rpm' enabled, the
runtime PM reference is currently released using pm_runtime_put(),
which may return before the runtime suspend has completed. When the
clock controller device is registered through this function, calling
pm_runtime_disable() immediately after pm_runtime_put() prevents
the runtime suspend from completing, leaving the clock controller
active and the HW rails in the ON state.

Use pm_runtime_put_sync() instead to ensure the runtime PM “putV
completes synchronously during probe. This does not have any functional
impact, but it guarantees that the device is fully runtime-suspended
before returning.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
index eec369d2173b5ce24bc1ca860d2ac1bbdce04524..2c09abaf1d2a15b7fbbbfeb67c03075381185a00 100644
--- a/drivers/clk/qcom/common.c
+++ b/drivers/clk/qcom/common.c
@@ -428,7 +428,7 @@ int qcom_cc_really_probe(struct device *dev,
 
 put_rpm:
 	if (desc->use_rpm)
-		pm_runtime_put(dev);
+		pm_runtime_put_sync(dev);
 
 	return ret;
 }

-- 
2.34.1


