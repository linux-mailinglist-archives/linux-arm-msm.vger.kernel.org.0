Return-Path: <linux-arm-msm+bounces-82795-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8653FC78486
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 11:01:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1AEAA4EA8C9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 09:59:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B3EA34B437;
	Fri, 21 Nov 2025 09:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PekJPt4m";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dQZoZhB+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D610F34AB1B
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 09:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763718878; cv=none; b=WUX9Tv9/YxZj1E2chgth3C/2ZNUWaIlUk77tWao/0l7IINpjozqOxVt6V+zqiiJ0WyvscCv3PYgEHGR+LL6bldFLMG0aXywe1xJOHoXPgUunQw0+79vPi9WOHK9nq7IMga1KC1sEqVs+LakX5cE7KrJV7OoIFWGmIfQxO9BDNT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763718878; c=relaxed/simple;
	bh=rhbCnjiVZ0TTKcmvGUj4v6A9mFyk73XyKUdN3mC7yEI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V5UXwgk5dSufQ3yjFG2buAMkcQFw7ZIEOoj4oTqCaAKVB6/+IqKkvLUvDnKmqJv3UvvDEE0kJS8ALNyUcJwFVlvBdY7Tyn+1J1KK7GKQ991iGUgLIGnjGUPX0WAW6SmOT+9ruIv2C3cgdCOG0TbAjpbqCgjatb4RXpqAY9aROYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PekJPt4m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dQZoZhB+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AL6MUaV1637676
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 09:54:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FMNY6dUKPaBgV1lsNjZ5b4KlLB/xNY2/QGGWi/8pwzg=; b=PekJPt4mUTXbZGq/
	ohZat0ujqdywqT1wbybiKicLYXSpw5uZN2Q3cUXi6UNZkIAoVBIJgaIhq/erd3b7
	3MCNIlPp4c589EbxkD675kp2kz/4org5BwRRkmDmDqK/hdIJT0gFH/QkTLHPsikV
	X1oPfOeygbZZCOc+DvPqhpoPq7XzL3vT+ZBSJWnjYreIM+rP/QyGq9nOSyWE2v3l
	ZvrFyMmK7CRHjgPu8YeoYfk6DVQVbo/pb6o8j786d6mlmTOTyYaZ0ehgwpij9w5r
	N9uzK9gHSEqj1ZCCJcgqLdYTmWsILWA5poqrpp1PCR3ld9v9S4ix4+/nMhOGChtC
	4ROjtA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ajagat44s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 09:54:36 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-298389232c4so48222995ad.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 01:54:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763718875; x=1764323675; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FMNY6dUKPaBgV1lsNjZ5b4KlLB/xNY2/QGGWi/8pwzg=;
        b=dQZoZhB+cQ9Vt15sKdq2kqnm6ueafJLzykV/RNBSpheT05gO2qvQo8AlgfCypX8Gq1
         PoNxOwXfX0CZRo0NmUQSSI83XirPWqkXMm3eAziQnm9urI4u77re7yDKpDxkbv22YI5z
         VI7l8ma+ECsNnGu77iZlkell56iG9cEGEoX7gRcDtROLK7s4IjLY+v3tQUc6dFOCxPWs
         tYBzT7soaXj9HRv46BUQIqoJWa1+gmz30C2MtVeo+TAnm2Fp0CRYtKcTgpwT/1wNKT9Z
         27ccUov/fwYvHODhJtfHpgVNZgs210TGmhXX6ZzzfhVlDFZb5VMNio6NwEChKJfOVKg8
         bXqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763718875; x=1764323675;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FMNY6dUKPaBgV1lsNjZ5b4KlLB/xNY2/QGGWi/8pwzg=;
        b=D81lUHxG8AHIuOpdjX9w6v5TwGHNdPXcf9p1Aul9UbMZA9vkgzOOBLQizIpfEy3jV5
         z7MqGzbO0ZpmtbIT+eY/feoLKHSUKjZ5LxeOZOGcl2IJfNPeBKbukEb4CyXquzo06Xfn
         GBGHqg/58JqzrqWgXpffcOmkJcmYEjR2O6wXk/SAm9eBh1L5om6e3rF5BRmWNUv7n3uj
         RLYyklgvpETqgG3oAkeJPT+DIgRxu/+ce22RerU5qPsLgAGgKY8EGlUM+PQvoxfZovbB
         7T4HTbGATNctSD4X9MehRkaOJGcAvYHIaGRDFWzgkub2QnR3U49t5p5HbxV+4jbGphVV
         Rakg==
X-Gm-Message-State: AOJu0YzRkbEu3CKRHLyl1KYBKVESOB8BeLW3mLtxsz8Lsp/0L4xlCl1a
	VykNTXmgoO1lNWQ8UuTjfz8xTLAn3+1cqFYwVRfzmLDK/uQuh1ClP/4jd3BvZU4ihKDrPAxToto
	JD7GUVvvFVolMWnTGJvppUvNOs5p93VAiuB4ajc97KRrlwgGeBTpQqpw173nrGv5yb7/U
X-Gm-Gg: ASbGncugnIqDEKK9So8hEEj5maDW0/qtrW8SYxG9GR/WLl3n5rVqIFJVNmdi4WcsZl0
	RMhSSheiMRf0meNdRPTnVE2QFMGw8QXUwyJA/eU4n+i+7HjHRn9sFD6ftmYGu+dimSqszLuq4OJ
	2erMID13hZXcNRd//JMb9G/XnJqBGBRU0RoUfpz5Cq2ZuEwmbDGoYDPKHB7ymKhMSX4TL6qQ+s7
	vu4MdgzdGC4EsVI1Pwm4XyaedDG9M6+vZZNjp6CLkyZsy/iEMG9zk4/uNwFxibztysZnPWoB4k3
	4Le8n48RUgmv5d6niR6S6a4mQe5pTZao/6Bk6cMenItjSJzsQa931pZgpOhMM4ql/qpbaXq8T+k
	f4izn7rtpau1h+WT3hln6+s9p/JJk7ZwkINR0S34J/8b7MR46XoUATVgqWs7etSwwpdiwA2TuK/
	/3rTAdtwaysi4bh1RSkoLU2YcVXRYlYQ==
X-Received: by 2002:a17:902:d484:b0:295:586d:677d with SMTP id d9443c01a7336-29b6c6925b6mr22850735ad.41.1763718875372;
        Fri, 21 Nov 2025 01:54:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG94lbQ3HNfzEcCY7luvuBmR1NeXA/hNwUe7Wo7QZAo220LSMNBVsNIhKU5nOs9Xaaodq0hxw==
X-Received: by 2002:a17:902:d484:b0:295:586d:677d with SMTP id d9443c01a7336-29b6c6925b6mr22850465ad.41.1763718874895;
        Fri, 21 Nov 2025 01:54:34 -0800 (PST)
Received: from hu-pankpati-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b13e720sm50557985ad.42.2025.11.21.01.54.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 01:54:34 -0800 (PST)
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Date: Fri, 21 Nov 2025 15:23:55 +0530
Subject: [PATCH 4/4] soc: qcom: llcc-qcom: Add support for Glymur
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251121-glymur_llcc_enablement-v1-4-336b851b8dcb@oss.qualcomm.com>
References: <20251121-glymur_llcc_enablement-v1-0-336b851b8dcb@oss.qualcomm.com>
In-Reply-To: <20251121-glymur_llcc_enablement-v1-0-336b851b8dcb@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        sibi.sankar@oss.qualcomm.com, rajendra.nayak@oss.qualcomm.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763718858; l=5964;
 i=pankaj.patil@oss.qualcomm.com; s=20251121; h=from:subject:message-id;
 bh=rhbCnjiVZ0TTKcmvGUj4v6A9mFyk73XyKUdN3mC7yEI=;
 b=w/+N4pKz22xrAmM6SuewO3TZ1Yd7QGlNGGM+9U+1Vk3ElSudKSYyL7qcGv3xIGk8K0XMFgZ2g
 FqM7sj1SUxjBsMOgvdYQeBoInqWSuX6dfnQ/X6qdTT4ZXBpH5y2tskf
X-Developer-Key: i=pankaj.patil@oss.qualcomm.com; a=ed25519;
 pk=pWpEq/tlX6TaKH1UQolvxjRD+Vdib/sEkb8bH8AL6gc=
X-Authority-Analysis: v=2.4 cv=Ce8FJbrl c=1 sm=1 tr=0 ts=692036dc cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=tDdNGmbMoCBSfcdeovwA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDA3NCBTYWx0ZWRfX3wZoWfWfraeY
 jQSQKODrAXe8/EIcgkyZuGbcmNMavkHs+GOL6EfxaKhW+Et2PKGYfTv1FP9QDURTJg2+XNuU1VU
 Dv+RoodIS+JOVeMDwQ9U7nk2KFHU0v+PDSaJHAedrcUVGR4H6m5Hgk2hYWU5nFLFt31GQrzA6Da
 4ZxWH99erXS7PBQoNbg7yx+ParhFoxNhdMWL8jqPNvrcRL3ABNBRjCwcfxGbU3rS8XHLRaHyfU1
 GRA7MdBxilCEd0TQg9YcS1KxFocw1ifvB/b5nbj5bL3eu61kssP+rnEP+XjmJ5C3BPEx9h7rJlB
 8udztfh1nUOe/KSnFJ0S2m4STCFw3WzbGLcNBzn7Qu67WygnxiUp+TtlRhgfjNNmrRCkplgKYXQ
 YF76znuPAntxR56E6IUpg0SXdB3sLA==
X-Proofpoint-ORIG-GUID: b3AeqG2z_qKacmwGREtTnih0j823VqnB
X-Proofpoint-GUID: b3AeqG2z_qKacmwGREtTnih0j823VqnB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_03,2025-11-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 phishscore=0 malwarescore=0 spamscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511210074

Add system cache table(SCT) and configs for Glymur SoC

Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
---
 drivers/soc/qcom/llcc-qcom.c | 207 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 207 insertions(+)

diff --git a/drivers/soc/qcom/llcc-qcom.c b/drivers/soc/qcom/llcc-qcom.c
index 13e174267294..1abfda7a58f2 100644
--- a/drivers/soc/qcom/llcc-qcom.c
+++ b/drivers/soc/qcom/llcc-qcom.c
@@ -182,6 +182,197 @@ enum llcc_reg_offset {
 	LLCC_TRP_WRS_CACHEABLE_EN,
 };
 
+static const struct llcc_slice_config glymur_data[] = {
+	{
+		.usecase_id = LLCC_CPUSS,
+		.slice_id = 1,
+		.max_cap = 7680,
+		.priority = 1,
+		.bonus_ways = 0xFFF,
+		.res_ways = 0x0,
+		.vict_prio = true,
+		.activate_on_init = true,
+	}, {
+		.usecase_id = LLCC_VIDSC0,
+		.slice_id = 2,
+		.max_cap = 512,
+		.priority = 3,
+		.fixed_size = true,
+		.bonus_ways = 0xFFF,
+		.res_ways = 0x0,
+		.vict_prio = true,
+	}, {
+		.usecase_id = LLCC_AUDIO,
+		.slice_id = 6,
+		.max_cap = 1024,
+		.priority = 1,
+		.fixed_size = true,
+		.bonus_ways = 0xFFF,
+		.res_ways = 0x0,
+		.vict_prio = true,
+	}, {
+		.usecase_id = LLCC_VIDSC1,
+		.slice_id = 4,
+		.max_cap = 512,
+		.priority = 3,
+		.fixed_size = true,
+		.bonus_ways = 0xFFF,
+		.res_ways = 0x0,
+		.vict_prio = true,
+	}, {
+		.usecase_id = LLCC_CMPT,
+		.slice_id = 10,
+		.max_cap = 7680,
+		.priority = 1,
+		.fixed_size = true,
+		.bonus_ways = 0xFFF,
+		.res_ways = 0x0,
+		.vict_prio = true,
+	}, {
+		.usecase_id = LLCC_GPUHTW,
+		.slice_id = 11,
+		.max_cap = 512,
+		.priority = 1,
+		.fixed_size = true,
+		.bonus_ways = 0xFFF,
+		.res_ways = 0x0,
+		.vict_prio = true,
+	}, {
+		.usecase_id = LLCC_GPU,
+		.slice_id = 9,
+		.max_cap = 7680,
+		.priority = 1,
+		.bonus_ways = 0xFFF,
+		.res_ways = 0x0,
+		.write_scid_en = true,
+		.write_scid_cacheable_en = true,
+		.stale_en = true,
+		.vict_prio = true,
+	}, {
+		.usecase_id = LLCC_MMUHWT,
+		.slice_id = 18,
+		.max_cap = 768,
+		.priority = 1,
+		.fixed_size = true,
+		.bonus_ways = 0xFFF,
+		.res_ways = 0x0,
+		.vict_prio = true,
+		.activate_on_init = true,
+	}, {
+		.usecase_id = LLCC_AUDHW,
+		.slice_id = 22,
+		.max_cap = 1024,
+		.priority = 1,
+		.fixed_size = true,
+		.bonus_ways = 0xFFF,
+		.res_ways = 0x0,
+		.vict_prio = true,
+	}, {
+		.usecase_id = LLCC_CVP,
+		.slice_id = 8,
+		.max_cap = 64,
+		.priority = 3,
+		.fixed_size = true,
+		.bonus_ways = 0xFFF,
+		.res_ways = 0x0,
+		.vict_prio = true,
+	}, {
+		.usecase_id = LLCC_WRCACHE,
+		.slice_id = 31,
+		.max_cap = 1536,
+		.priority = 1,
+		.fixed_size = true,
+		.bonus_ways = 0xFFF,
+		.res_ways = 0x0,
+		.vict_prio = true,
+		.activate_on_init = true,
+	}, {
+		.usecase_id = LLCC_CMPTHCP,
+		.slice_id = 17,
+		.max_cap = 256,
+		.priority = 3,
+		.fixed_size = true,
+		.bonus_ways = 0xFFF,
+		.res_ways = 0x0,
+		.vict_prio = true,
+	}, {
+		.usecase_id = LLCC_LCPDARE,
+		.slice_id = 30,
+		.max_cap = 768,
+		.priority = 3,
+		.fixed_size = true,
+		.bonus_ways = 0xFFF,
+		.res_ways = 0x0,
+		.alloc_oneway_en = true,
+		.vict_prio = true,
+		.activate_on_init = true,
+	}, {
+		.usecase_id = LLCC_AENPU,
+		.slice_id = 3,
+		.max_cap = 3072,
+		.priority = 1,
+		.fixed_size = true,
+		.bonus_ways = 0xFFF,
+		.res_ways = 0x0,
+		.cache_mode = 2,
+		.vict_prio = true,
+	}, {
+		.usecase_id = LLCC_ISLAND1,
+		.slice_id = 12,
+		.max_cap = 5632,
+		.priority = 7,
+		.fixed_size = true,
+		.bonus_ways = 0x0,
+		.res_ways = 0x7FF,
+		.vict_prio = true,
+	}, {
+		.usecase_id = LLCC_VIDVSP,
+		.slice_id = 28,
+		.max_cap = 256,
+		.priority = 3,
+		.fixed_size = true,
+		.bonus_ways = 0xFFF,
+		.res_ways = 0x0,
+		.vict_prio = true,
+	}, {
+		.usecase_id = LLCC_OOBM_NS,
+		.slice_id = 5,
+		.max_cap = 512,
+		.priority = 1,
+		.bonus_ways = 0xFFF,
+		.res_ways = 0x0,
+		.vict_prio = true,
+	}, {
+		.usecase_id = LLCC_CPUSS_OPP,
+		.slice_id = 32,
+		.max_cap = 0,
+		.fixed_size = true,
+		.bonus_ways = 0x0,
+		.res_ways = 0x0,
+		.vict_prio = true,
+		.activate_on_init = true,
+	}, {
+		.usecase_id = LLCC_PCIE_TCU,
+		.slice_id = 19,
+		.max_cap = 256,
+		.priority = 1,
+		.fixed_size = true,
+		.bonus_ways = 0xFFF,
+		.res_ways = 0x0,
+		.vict_prio = true,
+		.activate_on_init = true,
+	}, {
+		.usecase_id = LLCC_VIDSC_VSP1,
+		.slice_id = 29,
+		.max_cap = 256,
+		.priority = 3,
+		.fixed_size = true,
+		.bonus_ways = 0xFFF,
+		.res_ways = 0x0,
+		.vict_prio = true,
+	}
+};
+
 static const struct llcc_slice_config ipq5424_data[] =  {
 	{
 		.usecase_id = LLCC_CPUSS,
@@ -3872,6 +4063,16 @@ static const struct qcom_llcc_config kaanapali_cfg[] = {
 	},
 };
 
+static const struct qcom_llcc_config glymur_cfg[] = {
+	{
+		.sct_data	= glymur_data,
+		.size		= ARRAY_SIZE(glymur_data),
+		.reg_offset	= llcc_v6_reg_offset,
+		.edac_reg_offset = &llcc_v2_1_edac_reg_offset,
+		.no_edac	= true,
+	},
+};
+
 static const struct qcom_llcc_config qcs615_cfg[] = {
 	{
 		.sct_data	= qcs615_data,
@@ -4103,6 +4304,11 @@ static const struct qcom_sct_config kaanapali_cfgs = {
 	.num_config	= ARRAY_SIZE(kaanapali_cfg),
 };
 
+static const struct qcom_sct_config glymur_cfgs = {
+	.llcc_config	= glymur_cfg,
+	.num_config	= ARRAY_SIZE(glymur_cfg),
+};
+
 static const struct qcom_sct_config qcs615_cfgs = {
 	.llcc_config	= qcs615_cfg,
 	.num_config	= ARRAY_SIZE(qcs615_cfg),
@@ -4941,6 +5147,7 @@ static int qcom_llcc_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id qcom_llcc_of_match[] = {
+	{ .compatible = "qcom,glymur-llcc", .data = &glymur_cfgs },
 	{ .compatible = "qcom,ipq5424-llcc", .data = &ipq5424_cfgs},
 	{ .compatible = "qcom,kaanapali-llcc", .data = &kaanapali_cfgs},
 	{ .compatible = "qcom,qcs615-llcc", .data = &qcs615_cfgs},

-- 
2.34.1


