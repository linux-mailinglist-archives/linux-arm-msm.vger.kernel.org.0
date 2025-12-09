Return-Path: <linux-arm-msm+bounces-84748-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B416CCAF306
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Dec 2025 08:46:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2B2F63006DA4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Dec 2025 07:46:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B6AA19644B;
	Tue,  9 Dec 2025 07:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RziC3WK9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A7reH5PB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DDCB274B59
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Dec 2025 07:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765266378; cv=none; b=L6EnO9N1KxO0e0T9RjQexXuHBtmHp6LQbS6M8MOfCasWo/JJxeWK0EvvwDkeyEzMAp0O0WNZgMGkCd5hqnleHUarVx5BSrvH3KfDjB44KQwDcICQXczOVEIaz1b3RgNMgilXzdB1MK7rDPBdKpNrhx3HiWyuDShoZnDoYVN6amQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765266378; c=relaxed/simple;
	bh=zSjSfhLRdTIU8BBxxkLWTk9CUyGDXGpCuZZ9in7y3e4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aaF7tYBbHemclBO6BFbgoEbafUODZVLf3eA0ZZpzDE6LzTV4pTadAnbxL2w/0zPnkZhA/5Xm1cSNLOv7dCwCKDN5w8GK2daBV72t9ixfhAIb+/KBbxRaB6qWNutp/PNQzbLNInZHBdkmzA/uOG+0J8YLzApz6F80H8jSDPkVeCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RziC3WK9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A7reH5PB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B8NX3Yf2715887
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Dec 2025 07:46:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=gPwhDkGbteQmCOYFrC40h1pRMleripl0ssB
	7axPm/9I=; b=RziC3WK9lhehPMFjiGL77oWjnPWpoYwRDKI94207kXKrkXetBLh
	netYEd/pvmXSHf18MONkkBNCOGl7+Vk+LJI45oJPhAXADo6kwZZV0dCREFK8HGA+
	UyP1Vy9GYpOGx/b6TyKmQw0gZpOIA2nV6dchtBTVrJkDSeGkOFoIqIgb56Z1a7gs
	nHEUSN052dGI4rf01uP/r4sWYZTJZffPAeWLwliJBKZQ31yAFBsRdwK8rbpfX14K
	KTCTP5vWZHKxS5Sr1m6ji2ZvQCSFmOMD0eVV25fwn1fseNSJ+9/qTUYdIrS+3TQU
	BlaPbHzAjF8/jD/W1VvOeLL+9XQrQKG5JIQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4awwfrb84v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Dec 2025 07:46:15 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ed79dd4a47so122456391cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Dec 2025 23:46:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765266375; x=1765871175; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gPwhDkGbteQmCOYFrC40h1pRMleripl0ssB7axPm/9I=;
        b=A7reH5PBfu9LZ5f5MATXesufksaFknT1LwEBQ20JP70oziRcHbiEU6ETHS7kFwU8o+
         mzxDbfIHJfEMe4ChLHJyEFhjZiGCePM08LTkt82z+aVjo0i0qfSED7S2Duoy7R2Z22M5
         Ae/ns6qxoqXWYu6Xrh7diCCy554lKL1XqPgpMgX3X9D8HgGs8DmxPsyFkTMujI8vkhvn
         9z0GSJgcOgz0RWK3+CFptbZdjzEPlFtGe6MxPPzSkhMRCNE570iWImODi5fd4xIn/P7e
         akgHA6kjDC+VU9WMnF/UlWZ2P8q91qRExzVnATprXUXuMIpHWqzfYpjznL/uqbFu527x
         Ee5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765266375; x=1765871175;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gPwhDkGbteQmCOYFrC40h1pRMleripl0ssB7axPm/9I=;
        b=b3XdDeqOvaoLow9tpaOh/RjJuiT/mwVFE6WNxSmIkAW68Q6U4g8pTnl1NVWrvM5Yiy
         FrLxsh8uGAb8TuaDMfgGq7m8Z4q73pN4irS2cYSoqogLPCuKVtDoLGe7sofbTNvuDrJv
         250Wb0Mcp1OBCbhhX4Gacmmw3vCmyAgyWF4TmsqPum6VkJlMLv+ysbvNwdy9L3e04tq0
         D1NG98bCGx63q2dyrpcVbidMFgw95fVIqyNKtYmTulw289a1phUzfr9ZYw99FaCyCJ/W
         HIbTbjI2RvadxQGBIEL3Ki1OtMstJjbvhAVLyEjJ1IgG3CHc7M4uFPfgoDwVWrL4vhAj
         W4sQ==
X-Gm-Message-State: AOJu0Yz13AJulOWwUZ1Wffz1dNsMIN2OuoioLcPzPSs+oT6ipwyhkJ//
	05a5kFoK3H3GEL5NJhtBJvSiD90VQErwKLHPUETdhGHD1oRpW3YgqdhmLdBzryQlCJEVYy4z/r2
	bCqKVvHrjwgmgrbEsrqh4ilbEmJR2Byp9Sq9DsUuQ07YK3/gRiemToldi/5plLmIpXFOA
X-Gm-Gg: ASbGnctMmvX8CIttEPts+5pzhvCawnKVdrjNvSaxygOz+x6aku7eGDs86iVBUqZ23nB
	K9L5MwwVvjxMdBf/bZWV0N6ZdrCU2g/tn8SUMpIaGRDAiV257VH09hUtGZ+Wv6nn6HlkKc1n62j
	t2POX4ggtCim4/+/qMrHRrfLXzN1KlvqtdLLIKoKGzTRhN3lCnNSYn7IQnL6+0G9VUYVp3czjon
	glsLurbzuvCytfRDhaYDtuJ13euuKKB2fhGanaRdZfpaCpm5oaoec9cMCw2S67hugQ4dviMMQOI
	h3BPVvhLqrqSzJ3VNfxM+0yyLOU/xMaDpQtoBr0N6y7etPhVN9EyQYXL/Ri/xdkATFP00j3yc9p
	TW5HA+/b75uUSLNgx0BGm0qVu4kbX3m067dyOH1NjD8ZFNlJAnQkg5S7wlBxTY2w=
X-Received: by 2002:a05:622a:4c0c:b0:4eb:9df6:5d6f with SMTP id d75a77b69052e-4f03ff249c6mr166374461cf.74.1765266374802;
        Mon, 08 Dec 2025 23:46:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGbBd7PPQauSL8dpdoTYAFOk+PpQ1DOycswDXpQaWrzGDAuWZVL0RKEFZ+faoEHt9JRCfOfYg==
X-Received: by 2002:a05:622a:4c0c:b0:4eb:9df6:5d6f with SMTP id d75a77b69052e-4f03ff249c6mr166374271cf.74.1765266374442;
        Mon, 08 Dec 2025 23:46:14 -0800 (PST)
Received: from trex.. (125.red-79-144-189.dynamicip.rima-tde.net. [79.144.189.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a7d367dfbsm13488995e9.2.2025.12.08.23.46.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Dec 2025 23:46:13 -0800 (PST)
From: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
To: jorge.ramirez@oss.qualcomm.com, andersson@kernel.org,
        konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] soc: qcom: smem: handle ENOMEM error during probe
Date: Tue,  9 Dec 2025 08:45:37 +0100
Message-ID: <20251209074610.3751781-1-jorge.ramirez@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA5MDA1OCBTYWx0ZWRfX6DpSDuqC7XuB
 N4ziEiseCA5tDUqYIX6JDzVWtn3A0kZ32tzpus55dF3/JOJKDXm9b9ZN+O4/RCfF4m5sf9hMnVV
 h3m0DqSiLhLTQrFJB7CXFa6l2AF53QtC7NzWI0QOXoNedM7YHckGJDjpNSMRDnXHre96DSyQkMj
 If6oGQe/yKs3HRc9qktBRBU/8HmHiaUaT7cPxEqfY/wAdg1ZVA97Uk+byhr9/tf1k4UUMiycdbW
 fwduFXoBewyvx8vRAsO618+WclRApVORenLpVGuPG3BXJKNHEd9M8pA6JI8CyiQVAO6LbeU8gUN
 u9j8avNpMHFahos25rkhakbwQuaGKutM/3RfW62qAk0C2ZrsNJT5ZgE++tfB8xoTqZRdCGrfdUq
 5EYuN/dsH9gP8IbP636ujSSCY3nYFQ==
X-Proofpoint-ORIG-GUID: nlwUyga0gAPByQzsY4kXSOIa9PvpQyx9
X-Proofpoint-GUID: nlwUyga0gAPByQzsY4kXSOIa9PvpQyx9
X-Authority-Analysis: v=2.4 cv=fsXRpV4f c=1 sm=1 tr=0 ts=6937d3c7 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=QCpOfKHlYVe8AePir1+hrw==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=CavFr5ZQKKrJYSdha9UA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_01,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 suspectscore=0 adultscore=0 spamscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512090058

Fail the driver probe if the region can't be mapped

Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
---
 drivers/soc/qcom/smem.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/smem.c b/drivers/soc/qcom/smem.c
index c4c45f15dca4..e91dfc123af2 100644
--- a/drivers/soc/qcom/smem.c
+++ b/drivers/soc/qcom/smem.c
@@ -1215,7 +1215,9 @@ static int qcom_smem_probe(struct platform_device *pdev)
 		smem->item_count = qcom_smem_get_item_count(smem);
 		break;
 	case SMEM_GLOBAL_HEAP_VERSION:
-		qcom_smem_map_global(smem, size);
+		ret = qcom_smem_map_global(smem, size);
+		if (ret < 0)
+			return ret;
 		smem->item_count = SMEM_ITEM_COUNT;
 		break;
 	default:
-- 
2.43.0


