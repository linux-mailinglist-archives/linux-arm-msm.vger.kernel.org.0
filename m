Return-Path: <linux-arm-msm+bounces-98868-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YHvvORmqvGmk1wIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98868-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 02:59:53 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A092D4F32
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 02:59:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8357E31F4DF5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 01:58:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9A8B340DA6;
	Fri, 20 Mar 2026 01:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hhgWNDEs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S9tUJ54K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 781E3340281
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 01:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773971740; cv=none; b=VoyPTgU4zU5wuMY3HHyg5R46oYi+nZGu4Z8Ok4ul+kU4oKUrExxl4OeXOXwxqj1B72DWUg3IxEPaF60wEyppxYGyzuonOWEuqRHvnLT/zmQ+WNsyR5BHfn0CzJDNIU37aVbR/xOBty/ND4wW/nxzlNQi8l0h2SBvhIslHjUwLnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773971740; c=relaxed/simple;
	bh=9KYQ4mP8r4dJEkonOPAFQaieXV/3Q2yhfdlMr2DFkuQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GHYPZhZBsLhGBlEzir/Q9yn1T9v+3CI6ZO2quTidmUfc/eJAqVWOu0TT1Vxpfmixbj8MOPGA6+DgrBljFpv2igt0kpGqHR4vwInwX/CsmHDkWnVaIw91/iOiwwI68qxqJZZfxpI9oFtdBGZdmvFUScYs3877HKHxtJInm2hdUDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hhgWNDEs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S9tUJ54K; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62K1mois1567541
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 01:55:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZxDQDVAUD4jwRWPx6btZcogiI3FOwvGdejCVTe0Ku5E=; b=hhgWNDEsTVrF38ud
	dTmVNLFEsMudBPWGpyeefdnvI71268pp0zoRj/Vyw/T1FM4AnzzD6fZsca5SD69X
	WAN2hDC3luXT6Nlktf2H4qk/Qm4GrCRwSzfQo+Wc2LlOpWDuUlaZX4r++tOoirYy
	h0SzsOpQ6ahjFm6sxcZLLvhQseaXBW7PlaiDxBAF0dOSu/yJjYRAq/7FgOZWiO5K
	/5sr2uWKO/Smc7Y1oWDEbOElE4aI2EJAe9YUIxcpWurMIwWowS0UFnPzW6XiBuS+
	ZHFK4f2sX0O2NuT0SHgIq02nRcmiopDnl1Hy4z39aEHOPAF4F7Kt3e9pspJx3O5s
	BxUTWg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d0akxkkfs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 01:55:33 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50921f7da67so11740831cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 18:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773971732; x=1774576532; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZxDQDVAUD4jwRWPx6btZcogiI3FOwvGdejCVTe0Ku5E=;
        b=S9tUJ54KlNZZdx3mUNRBLOvDM3KIKiGXrz5Iu4Y7ZFzX8irmvgVEObzh+vOcDgwFDN
         vzAtTSOoHTD0mWJvzEe3TyMCh20h6qPReVwvjSzdP3tDk93A+tmkkie2ZRu/c8sbZ6H1
         4LQ9RK1AxGpXdrvQaEX0x+9y9XenTHpa1HaFlJ8i+PtQ/hrp0I0wTKhlI/0Cs2qqN5yl
         3VU+27uhGkqL2OHZCmWgjYr8dXVa4tVvlf7QVVqpyy/hNSdt5Bel03qRza4FHpYRZGzR
         qNQ6c8rRVfPvhcXYLFs+ENz/IyHI5y1eicBEe6Xw6T3g9+IzobQANPXzMclbmUVRo1HV
         1mQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773971732; x=1774576532;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZxDQDVAUD4jwRWPx6btZcogiI3FOwvGdejCVTe0Ku5E=;
        b=cUE01crqkb1SIReiJ/xTj8cBmaA4gQIb7lUi0wcH19/7wfqAzb16k8sgs6VmsCFhOZ
         nvahURI6hdU1uGYEoGboz31tGk5T8tbhtMUPLk+nJluXzj+3g5QOlz7sp3vBCsPAWDEu
         ERy426zBYODvW2nVzdBUgFib1U4ueQ5nm074rrWDiX1GihsvtSLS5fzqxAEwbDBTC5VT
         Ah68pEguulAem5b8fkBAHG9xvnjZdOclSVOFVdmiAU18W8XY1GJ3GcSmDdXu6Bx7Yt/8
         77ABL30zO2yhDALiU74WpSdy98K5gRzPxPt2fiGC2P9G8aWwrtXg4H4iletcITejIDjy
         BtvQ==
X-Forwarded-Encrypted: i=1; AJvYcCWMblaVH4PwoJVVo0CRQyWVjFlLLar9GzZogiSLYDSYhzLBQYSZCYs2uqyvusCR7NAZjUSbEjo684NbSv33@vger.kernel.org
X-Gm-Message-State: AOJu0YxuK6KuZttKuCWcA6r09J4YjqA0RmFdr7UQd5LLYcDNzzrGJYr9
	4dc296ZZERbIcyqi/FRKMXHMqez58ogDUKLN8DxraYX11W0o9gqZNnexdw9V/MjJ7rfS3/wV00p
	votEku1uLP46bCS6DuRrPO37ZsqEE4R3KArSBInk6r2n1KqBw6ATGb7YVtuoKvrbjNY1W
X-Gm-Gg: ATEYQzzVUZ7frBE7KH7lKX1T+3d4c5wdMdbhsSdM56SMCs3oSTJ9j80xteMRHoYf3DO
	1MBklhEGTV3j0q/+QiCOBzX9JoWfJTz8Kk1zfov0rb0/TP2TOJby3McuBXcGMuqlQ2HlSkLe3eE
	sdTQGB8Ji2gWSTI8imOs417PeaHiGhgmmgyDW1RlUcKdRWrNVHUpWBJfv8cv5NqWvoq2X4vfmJg
	WS5Rt9yhM2EIH3Bxw4oN4tNgnYfJYoBsTCjapKmk+5JaFT62wRn2m5BbgucZcfDTGFk1G7WYxgU
	zx3c4bq+ciBfZtbIDveQ6jl0YQ1fmNaz3rjr3ZAPizjE9guIS/CFaTec2kMBe1SHISl/D4g4msi
	f7XvVzmpPh9CE4bXWtxVxQgWQGhC/w4akHQRXofNaSemqbBlHuhvPM8/Y7cNFW2uXKs9kTcufwc
	B5xGPg94Ve6Bp6jIRtVkpRY/ND2EfZ7kfKyg4=
X-Received: by 2002:a05:622a:178f:b0:509:bdb:1539 with SMTP id d75a77b69052e-50b3744891emr22597641cf.23.1773971732396;
        Thu, 19 Mar 2026 18:55:32 -0700 (PDT)
X-Received: by 2002:a05:622a:178f:b0:509:bdb:1539 with SMTP id d75a77b69052e-50b3744891emr22595541cf.23.1773971727126;
        Thu, 19 Mar 2026 18:55:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a285305eefsm232344e87.70.2026.03.19.18.55.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 18:55:24 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 20 Mar 2026 03:54:50 +0200
Subject: [PATCH v9 10/11] media: qcom: iris: use new firmware name for
 SM8250
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260320-iris-platform-data-v9-10-3939967f4752@oss.qualcomm.com>
References: <20260320-iris-platform-data-v9-0-3939967f4752@oss.qualcomm.com>
In-Reply-To: <20260320-iris-platform-data-v9-0-3939967f4752@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1172;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=9KYQ4mP8r4dJEkonOPAFQaieXV/3Q2yhfdlMr2DFkuQ=;
 b=kA0DAAoBizyKPgIpKNUByyZiAGm8qOajaR0GiLyf1pfu+VnXoI8jLqhJ7WG7IaGPs0RDqUiU9
 4kBMwQAAQoAHRYhBExwhJVcsmNW8LiVf4s8ij4CKSjVBQJpvKjmAAoJEIs8ij4CKSjVTuwH/2fX
 Il2S/zJ8wi/gdULkhsV69go/z8ocU9AHqtW/W62r6N59WLRJFkeJXn6FnPACabPU3886+UKkzey
 8HYMTuSuuj7EAYeC9UEDOZ+Etj026/1p8LO5CqrQUNkwZdTYQ7ZgsIiT5goYQ6VrFRggptjoSDc
 ub/kx44orbvKDr6yGoAOSgd0k/aqs+Oic0qs9653im21peS7Hi/0mlDnHLDH1ALmq+JhjJezNCe
 vgWp8PE59ajFN4FmKHt+5nBXlfRZODDy/Z4mO2cRkUcdtpIwU4OzkDmqPaHcYW9avmWUVzmmwpZ
 aHUY91EsdUyYmIeGh1MEEeCANhJ09+8w5FSKfxY=
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIwMDAxMyBTYWx0ZWRfX6QjzMo5HfKLJ
 tATHwpLhd4jJAb84v5/g9Uu+sAx4HOsXnC1RxmsvKiHX4m0WdXq6hF4oZ5a6qynGzOcbZx3ZAtG
 OtfdC3PG+ybR+pq4YVSkXxpsKcWZQhkCR2mci4GcfdqEezpiVnLPAOyW3OCx1UspNoNTFUg8b6S
 zQ3iewL/U00SKzcUaFqDDwo3NhSPJhbni4aJVerh6opne4znerjyjC8u6d0ibnsJH8S0rFUFUP6
 0zgTV0vZNc3PX1DPSad4/buOhSGfOZ+EZXQ3o8IwB1T7MG/DgOhklhIWHdaM43F1CAL45BXhdoK
 x5UgZGknOf12E3ph1iGjNjO5BJYac8hHPehdV1Zmgn15srjRvfIUV+uXfdOrhH9QmHTOxQJKLi4
 I8Mo29b0Fr2pF3JV2t8cbLPT5HnzsQzQzjBi+ll1pJdlzGJQ8DbjO8DSJVnslRRnM7/Mwu+9yXI
 a5eVnHBAPqwhdOOFrVw==
X-Proofpoint-GUID: 7NymhyEPcj7TYC3J9BrTudM-xJmBA9Xl
X-Authority-Analysis: v=2.4 cv=ZeMQ98VA c=1 sm=1 tr=0 ts=69bca915 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=nz9G3-SO7wN5dIpBwN0A:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: 7NymhyEPcj7TYC3J9BrTudM-xJmBA9Xl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_04,2026-03-19_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 bulkscore=0 clxscore=1015 spamscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603200013
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98868-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 52A092D4F32
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The linux-firmware is providing the vpuNN_pM.mbn firmware for SM8250
since August of 2024. Stop using the legacy firmware name
(vpu-1.0/venus.mbn) and switch to the standard firmware name schema
(vpu/vpu20_p4.mbn).

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_platform_vpu2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
index ab2a19aa9c36..692fbc2aab56 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
@@ -111,7 +111,7 @@ const struct iris_platform_data sm8250_data = {
 	.opp_clk_tbl = sm8250_opp_clk_table,
 	/* Upper bound of DMA address range */
 	.dma_mask = 0xe0000000 - 1,
-	.fwname = "qcom/vpu-1.0/venus.mbn",
+	.fwname = "qcom/vpu/vpu20_p4.mbn",
 	.inst_iris_fmts = iris_fmts_vpu2_dec,
 	.inst_iris_fmts_size = ARRAY_SIZE(iris_fmts_vpu2_dec),
 	.inst_caps = &platform_inst_cap_vpu2,

-- 
2.47.3


