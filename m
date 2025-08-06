Return-Path: <linux-arm-msm+bounces-67941-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 097D9B1CABE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 19:27:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 638DE3A1A48
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 17:26:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EC3B29CB52;
	Wed,  6 Aug 2025 17:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a1ETTCVE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AF2329E103
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 Aug 2025 17:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754501172; cv=none; b=NveV3EdfQWohIMSWQ2JTsb0tXVpllE2VvudqHGt0vFoY9mvIOVjNSlXtww8G3qTR/R7oIcaEm5elL/QNPkEi/9+rwIm7mblCeZF+L5bm/+e80GYx3gj2ihYH0tzF+858O6ejJNMsARYarvZl00zspQA6qyQ948vSCY8jewC7xj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754501172; c=relaxed/simple;
	bh=ISijb1E0+ZD77bkKk24Ne4W33w2AVxTmXoDiNWMIs5A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cpHIk4xwv/tDCQ44V0i3dTGhuWhK6/71wcqAA+TFSVdRIXbkzita7mrnQ7QjS6oKDgFgVs6jxWdCTWDYGs0Vj8IwyyZe9VOoOFr1hWcijt0r4MlWstyTig/xT4CVkcAlwi+PcwJR3P+515naebm2sl1WmfwxQ3+yfHKg6gl4eeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a1ETTCVE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 576DwglD010345
	for <linux-arm-msm@vger.kernel.org>; Wed, 6 Aug 2025 17:26:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=5V4MfdEEJjF
	qpxnuJxY+w9W+JqTRsjaxsk3+BJSZB8s=; b=a1ETTCVE3M5VttGfMhCLvribLSA
	V4YlRLkXvHdLKyegh+w89ShSkseZsFeEU3LABX5s/QN+a5Gr5l9xBneU8bCPju24
	3L23tP2zJUvKmYeqraXw3oBhtCpPf3rm3LRZtwY1FkHHKQtu6cyRjj3atDddp3EQ
	zm1IIko37h2pG/INl1SpHLGs29wu7NgosGTwYSU0AVGiuSO5H+Ux1Dc3MFr9Gwt9
	B5FGrcZc+1WxNsOeA4PnhUXLPGNSHjGAlkswAm5cueZziRrEh/QHb6EB2Z6o/4yh
	rRrJkhkD5+sSN7CcxrerbMd4onb5CxSMJtOe3Bn20Qye74m7zuJylCDNgqA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpy7uk5b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 06 Aug 2025 17:26:09 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-76bf8e79828so274298b3a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Aug 2025 10:26:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754501168; x=1755105968;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5V4MfdEEJjFqpxnuJxY+w9W+JqTRsjaxsk3+BJSZB8s=;
        b=HeQq9W85pnMPgOdjcd3r47lshi2osEoel2bnNMf1vgpv0jZGaIa1nOdcgGp/j2AkE0
         Vm578g+RfRtnhxSpTwS4v3HnSGmeDzOAm0l21jJwC8nZcO5R+60jcDJGe6EtEBoX6HVr
         QPg7oQbKfSkcyaMepIfHEBqA5Jxta2swvCy7WDqgKzJ/SUXYK+LxsB+QeYMtOZqjRPB4
         DcVWqXcGbhoWzlKD2KwXLnxauEQ4udVFgwJfALB6sfFMP/pqyBYLOeuP3MTpKlN3BSFC
         EnoUDW4xDGqmTk7DI8+VVJdv7oBdzY694xcv/d1XlQPx9YACjIA8ZVlg0FihxWcZ24AQ
         Vaiw==
X-Forwarded-Encrypted: i=1; AJvYcCX3DS0d7aZ9x00j8VV48QPw0L50hep5jWzCI3BREFDaSfXzmaCUxewjbfP5LxthmwgJE5JUYcPtKa7P8sqD@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+oL/adt4eoGXFv3aqG1tV8c8ozCV3yYNHANKptKC410ZbdSm6
	5cJCanlqZEIbSSRLvnECXt+Zpjvc0r3vT8KUl3kXIX3iaz39Ik/5W45ZRBpRey5IiBRih3s+Tk0
	oVf+VzZgh+Xi8cldDaCLRe7/FeQjS/VyFu+W8acGPtg97ge3+gZfyoh6sg1hUIJ6/Pfj0
X-Gm-Gg: ASbGncv6LMtSZmxXKazP3T532NG/+w6qUcs86+UJTMoPIZQ4DRtZ+WmuxC2OA8S/9QJ
	e5ghp1PQdqRAUPeT5feHID7cFgI2rFjeYu16VHEeL1EXkp57MWyX+0369kZ5x0Di9FD8pRe8Gfp
	ZPbdjj4hJ1JwaD/By2ACgvKejrYlrhACDY1TpxV4MSYCUcJByeWA3+/Vpl0lnK39d+HdvqBoIO9
	bLN+IMOmqxxWYy5jTjlnwOzz7DftlY8Xa57GRIQO+7vfd9e17ThNL3WfuAanfKucL2Q+qRIcl7R
	lxXX2C7Dw8KhhLAQme0B8FBO991WlC3wFzn8JxRVGBv7SnyiismxkVTuLvygG5TASiM=
X-Received: by 2002:a05:6a00:8d2:b0:76b:2c12:334c with SMTP id d2e1a72fcca58-76c2b06edb7mr4844985b3a.23.1754501168302;
        Wed, 06 Aug 2025 10:26:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGJeF+hA3Sf4UAVGOsX40s2DjOot938v+1PjGjJpA2MdTWEdlqDKL/EvOlgI7sVXx1RVnBAQQ==
X-Received: by 2002:a05:6a00:8d2:b0:76b:2c12:334c with SMTP id d2e1a72fcca58-76c2b06edb7mr4844944b3a.23.1754501167795;
        Wed, 06 Aug 2025 10:26:07 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bcce8f417sm15866210b3a.44.2025.08.06.10.26.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Aug 2025 10:26:07 -0700 (PDT)
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
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 4/4] soc: qcom: mdt_loader: Remove unused parameter
Date: Wed,  6 Aug 2025 22:55:31 +0530
Message-ID: <20250806172531.1865088-4-mukesh.ojha@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=Mftsu4/f c=1 sm=1 tr=0 ts=68939031 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=QQi8RNdjS96tJPzaHcwA:9
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: bBfSTrbzuptKjqyH2kPE2EK7Tqm57Jd2
X-Proofpoint-GUID: bBfSTrbzuptKjqyH2kPE2EK7Tqm57Jd2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfX0fj3IBhvEz+2
 TayevLoATslaPGr2fKwbY+SiKL8XMD9cax1K9ndsZDAWTScqMCdSppTSXEIA5ALvdfjqirZO1rR
 shDk5T16NhQt3Bn3meX5WdB0lCzTlRjgRfMIKMfvKihZQLnXjlTZo8owGTwSLFttNaSmzU3Mha2
 s4MWmZ1tLXvU3wOCd6WEabTHktAeO0oj8yR3blZGNxzNJpTrX3+la2bfEb9jK0YYl9BfPu2rV7P
 haL7mmmPr79jNdeRRJgEGjoMmLNLNgI3bAPpH/VNQfEsQiwdCAhitGtht6rRkyHAAft4AFOSOh5
 KGweSJdF8R4OGkxuWxT1FwIpDLsx6KWc/m0hhmTCx0zHi9qxzFLxP6p/YbDHFHdVfb8BDZbs5Bb
 K8FvN2RE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_04,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 phishscore=0 bulkscore=0
 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508060009

fw_name in qcom_mdt_bins_are_split() seems unused now, it may have
used in the past for logging it but due to code refactor this parameter
is unused now.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
Changes in v2:
 - made this as separate patch.

 drivers/soc/qcom/mdt_loader.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
index 145bd1374f07..8210fb3dd51a 100644
--- a/drivers/soc/qcom/mdt_loader.c
+++ b/drivers/soc/qcom/mdt_loader.c
@@ -302,7 +302,7 @@ int qcom_mdt_pas_init(struct device *dev, const struct firmware *fw,
 }
 EXPORT_SYMBOL_GPL(qcom_mdt_pas_init);
 
-static bool qcom_mdt_bins_are_split(const struct firmware *fw, const char *fw_name)
+static bool qcom_mdt_bins_are_split(const struct firmware *fw)
 {
 	const struct elf32_phdr *phdrs;
 	const struct elf32_hdr *ehdr;
-- 
2.50.1


