Return-Path: <linux-arm-msm+bounces-67939-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F54AB1CAB5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 19:26:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4E12216AA9A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 17:26:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A70C5293C45;
	Wed,  6 Aug 2025 17:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fFeiiefY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A80C29B783
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 Aug 2025 17:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754501162; cv=none; b=IqELjPTs/6tGHYljezpD3PN5GkT5eQ2ACBwVZdrtZ2rz8YwdnXIPyNqpML/7pkxwV+s309RxP/F3ApUVvhQ9H12rGRb/BgJeelmqDr5G1ZYCsKhVbnRBSyr1i0CPPVkIfY+LQB3pFOciVtq56s4jKHdQZivYq/YWkUbqb6I3cQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754501162; c=relaxed/simple;
	bh=/1A3AZW8hBz+ePcaAFDA5TXb4qWtbB8oRxr6QzIn/VU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a4DKJ+Eeh3hvJcu2vAZRuAcrwjVZJcV9eq8yJjiW+rGYiDLvaFjQ+Zph1AWbHViqwHgfcNuYe5CftdlqNDPqBqiJwCpc1mTcsgWtQR9rDwSfoWnVZ96njEN9WFh4E1nnwyHEVO3GJUc8ENHUIoCOM6ydlhvxU4btxGy28Xl9670=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fFeiiefY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 576ES4tZ004895
	for <linux-arm-msm@vger.kernel.org>; Wed, 6 Aug 2025 17:25:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=J0kwO+XKJcI
	CduSLZe6gBnukQxiZjQuG4QBPhp437sQ=; b=fFeiiefY0RsI7pQ1xUM5u4gvUfC
	83C+d83g5mv7YxoOeChfwb8U6FcoCHJAajZKntZMZ/PEFXGNfIOvgTvFJgsI3vdp
	dflKyRh3LP9tA3V70uHXknA1qzw8Fsgw54FLafJmjFjOHgUP75PrM1STzDQF8/kY
	OZHTfvNtcJyd7gZ540hzsA6pOabNTPUMZjpSUQaQVIyXsQdIdWT1/woQMSVwhWre
	xsHW5Sy22MVuZYK2e4XdU0EIsSzISkDNHmw9YjvN7s78wC2mQDXqmAVvl9qbMQro
	U4dEAzfeQl2TDcxZSEJyjNQvNpj0gfVti2l3cWlI0Y/KtEyLCkdsnPLfWqA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48c8u20huv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 06 Aug 2025 17:25:59 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b3bde4d4d5cso28426a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Aug 2025 10:25:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754501158; x=1755105958;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J0kwO+XKJcICduSLZe6gBnukQxiZjQuG4QBPhp437sQ=;
        b=lUzE0nhHyx8VwTyOMM2rFPAWFr54zTx92DpSJ8lej3uusUCP/R/8NXebOYCWu8RbXi
         VEQdjXeNeOAxrdGnLNhIR43gcE+uZDNyvpgRf4A25POVOU7vj9orlbxdD3N6qNWQCcjH
         CM5UR+69Sj7rV8H46gCDCt/6FeTLGrYzkTF5iH4QUvzqnRez6gZR+v+EC+1+VbDnWJVc
         T7f0fbA9Enb8Pxc8cy2SPbdyfUUq2G6EM+S+M3YwlVos6G/HaBdkDhUrc2XU+27DAP4X
         fgIYM0lB5QmVW485Zya/aduqMQgvdloEmL6RdHrxa+zPjBEYUKqe3HnX+cESahTRl0vr
         Kg8w==
X-Forwarded-Encrypted: i=1; AJvYcCUTV75GL02ErsV2Mg+2AI8Z3mVLpe+222Atr1PlpMzadupNUbcG9s0SC/S93svivxX9bdrsY51BFAxXMamp@vger.kernel.org
X-Gm-Message-State: AOJu0YwWyPlbpaeJJjt/31qLNwkTfYWDFmL2OMXMHa1a8zQwJR6WLCEb
	sSyTNmK5hLbHhqMzTQIrK20l+xvMvej2yAt0dBEzC/mafNG/ek7NGw+xiw5jsqRUl6QNfrYTqSm
	R0a7ARALuqZGl+xZK6z5TBFwWqul276yU5S/aV5XBU3j1AKhJC2iPiHDG8hl+JRVKouQb
X-Gm-Gg: ASbGncviKeCrU/9WPCSDoLuB7EC5y682UpcEJc9+LOsPNfUDTXanqWKaa1EKz6gc4Sa
	BXPtZ+TzOIMnjwD40XdSptpFtMejp4TOQzco36x6NMDaUQbNoNxW5PPFZbO9EBenhSuAm2LsjX2
	9TLGIUIh1Ab9AZE7w4ae5aV1SaQ74ab/ajXsRncplJt97a7kKFO+KMjHjcoNMD0fARmllGaHSeG
	POvd0m92OwRcgZMHDjn141+LWEt8618vw4jl+KvqXVzAB6Plq8fe6pC8mExR8Ht0mxxnjaesmci
	jEcKQQOcpBd5YRO8TrCKuB2xg0GNWeAH9v1pT6eZxVbtZJSf2MiXOKYAo8SGzbR+lLw=
X-Received: by 2002:a05:6a21:3282:b0:240:66:bfbf with SMTP id adf61e73a8af0-24033169926mr4584781637.32.1754501158240;
        Wed, 06 Aug 2025 10:25:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFWT5d2tLsPvTIuVLyXkccfQ0kLVQTUDC6+FpAxVXSC8J88CHJa3SlQ4HRxGVe5A5eMdXLUqg==
X-Received: by 2002:a05:6a21:3282:b0:240:66:bfbf with SMTP id adf61e73a8af0-24033169926mr4584732637.32.1754501157738;
        Wed, 06 Aug 2025 10:25:57 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bcce8f417sm15866210b3a.44.2025.08.06.10.25.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Aug 2025 10:25:57 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-remoteproc@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v2 2/4] soc: qcom: mdt_loader: Remove unused parameter
Date: Wed,  6 Aug 2025 22:55:29 +0530
Message-ID: <20250806172531.1865088-2-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250806172531.1865088-1-mukesh.ojha@oss.qualcomm.com>
References: <20250806172531.1865088-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: DnitvIe7mS3bFxCD1fVHBmNFNn89SMEf
X-Authority-Analysis: v=2.4 cv=Q/TS452a c=1 sm=1 tr=0 ts=68939027 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=qLU0tmo_xPokh9XVZMUA:9
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: DnitvIe7mS3bFxCD1fVHBmNFNn89SMEf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDA5MCBTYWx0ZWRfXx6/D7nAIs3Kf
 8TwTxE7kge5nVWjWmHQqB5bPOYxu+uAY6MVgQOpUbA5JOfnAEMQLAbtJsgsdlYyHdHGR9Uq5/Uu
 85HHzAmfbYuFa+nIKzs+XlsYq3YoRq+g33aGLJk1LHd2PURx2kKzpo1tyaOKndhvLZLk/v4i13C
 RmdYAeY/G5Bp2BY68z30Bf259LgZZ01CYBV8ZTMehe9ay5CijkIi/1RWlJD01uXHf5JYGMwjHfr
 W2RbsLkzUavnIS0uFDvUhBo6v3hTvvTkUeC9hlJQZyeakI35Rv3glfYRkZEJzbNvEy8B5w/vCVQ
 c4Fl15TYuqEwiRdhtf9KvsXPMCxMX3vjFE3ZpKOQtd60VE3+IQOAFe6DjjB2oD3/NJ6JF7P+q7K
 i7qBH6aK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_04,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508060090

commit f4e526ff7e38e ("soc: qcom: mdt_loader: Extract PAS
 operations") move pas specific code from __qcom_mdt_load()
to a separate function qcom_mdt_pas_init() after which the
pas_init variable became unused in __qcom_mdt_load().

Remove pas_init argument from __qcom_mdt_load().

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
Changes in v2:
 - Added R-b tag and its order in the series.

 drivers/soc/qcom/mdt_loader.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
index 2a14ba9b0fb6..63af3e97c93b 100644
--- a/drivers/soc/qcom/mdt_loader.c
+++ b/drivers/soc/qcom/mdt_loader.c
@@ -333,7 +333,7 @@ static bool qcom_mdt_bins_are_split(const struct firmware *fw, const char *fw_na
 static int __qcom_mdt_load(struct device *dev, const struct firmware *fw,
 			   const char *fw_name, int pas_id, void *mem_region,
 			   phys_addr_t mem_phys, size_t mem_size,
-			   phys_addr_t *reloc_base, bool pas_init)
+			   phys_addr_t *reloc_base)
 {
 	const struct elf32_phdr *phdrs;
 	const struct elf32_phdr *phdr;
@@ -459,7 +459,7 @@ int qcom_mdt_load(struct device *dev, const struct firmware *fw,
 		return ret;
 
 	return __qcom_mdt_load(dev, fw, firmware, pas_id, mem_region, mem_phys,
-			       mem_size, reloc_base, true);
+			       mem_size, reloc_base);
 }
 EXPORT_SYMBOL_GPL(qcom_mdt_load);
 
@@ -482,7 +482,7 @@ int qcom_mdt_load_no_init(struct device *dev, const struct firmware *fw,
 			  size_t mem_size, phys_addr_t *reloc_base)
 {
 	return __qcom_mdt_load(dev, fw, firmware, pas_id, mem_region, mem_phys,
-			       mem_size, reloc_base, false);
+			       mem_size, reloc_base);
 }
 EXPORT_SYMBOL_GPL(qcom_mdt_load_no_init);
 
-- 
2.50.1


