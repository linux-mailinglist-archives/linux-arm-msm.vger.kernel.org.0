Return-Path: <linux-arm-msm+bounces-61557-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB7AADC5BB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jun 2025 11:08:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BD0301898586
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jun 2025 09:08:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BA16294A0A;
	Tue, 17 Jun 2025 09:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IFsRawMu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EC3F293C72
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jun 2025 09:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750151241; cv=none; b=VwVEdFXOfsZ3NJJyD8kV3yn0R9+vcQh4XisWjya7pYNftw/5UyUAvjZDdre/MuihYC4R6jWX8CZSKX7H5UOoEKkwbOYP1X3Hh1TxArvUPffOi0DLbI6DrFKg/Ev/7AGVf2HXKXYyUEH7lg12udRd4SKPEJEryPJLD2IQlXCGjsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750151241; c=relaxed/simple;
	bh=I+wt0YP4rxgHnKOC40/aM4YftA0E1MwAjBk+q7eSAFw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZKMScpjz3JvJ6u6Pcw6UdmJwYwl5fAXjYH5QKjRur35VoOiXh9H6d7LjPsqCMpJNsObjY8osXdbJR+Q1SSU3RW6hFVmLCvk4k0fK04h5JKYP38xX8NrzOFWRp7vt45Jr9TMM/QO/SqWc2idCnEJD+0OMkj3bFF1rL6XweqslBoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IFsRawMu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55H7v9U2027925
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jun 2025 09:07:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=pC+/Jc/xnvj
	uhS/vhXW0LK87Vtyf3CLSWvcyQpqNldk=; b=IFsRawMu58dMwT/uAZjGcZnfzqg
	hq3bfIUs6UWgVcW4biNKvPCtTskkifaV+0iJ8zK9JzDZ24v2JL2fkUrT3d+qt2+4
	u1GrsWbn7InCpjsrH0iWiorIAspSJkyYZK0aTPPBGa9cdzTI/M9Qvsvo1lF14LOZ
	iwxkNozNhTC8LqTh3Mo6Zv3QdfN3lFsP4y1TImIYK47oaViVCjznvMw+Z7cYeMDG
	IxShuK7wvCNaq3elMPDKeDwWiYiE7BGBRC8YUZThQKct5agzkgkYX7Y4TD6DV5nC
	LT8e6Sg18OKTrWduYCEspVeELNenTdhn6qur0l+p5I3GUHGu0EMgSNWhjwQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791crqj0h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jun 2025 09:07:17 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3138e671316so4338989a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jun 2025 02:07:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750151236; x=1750756036;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pC+/Jc/xnvjuhS/vhXW0LK87Vtyf3CLSWvcyQpqNldk=;
        b=Z1SRc8gY8jMJiRvhSHlo1R6MY8FO5UibQ2xqW0djn1bIfnGWO4AUy/CO5HcViyihNw
         GJrf1fD/6U/ey81KdacNCWp3lBndO3Is8bRMUfElCwhgwgjnJ58aQsfQRcmsz2/IzBxY
         46QNi1NmTUyZaxU44s1cTvh7dHsTyy6GuFS3hW+PfPJMIqQZnHsU/rPo5AYbPvYMgtu+
         UQWXGL9Nh1lH1AKrjosEXHPWDiZPZDyIpm7+e9SObIvszarko4D9Ml311gLSO/jL52K9
         R7/QjiJKUPi1YnH8YUFn7LXxG7rlL3b/oz0x6g0aQJmTTn4kkmVx1OB7cH5sCsqbtWZH
         tzcg==
X-Forwarded-Encrypted: i=1; AJvYcCVgZaqZr7Z06sePdeIgWnGts7RFoh/xGwIaqTMwBugfQMmR8dF0SZsKGyovNiM+h0m9zEjBL2AtXS+4Xtwx@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4KiKwst2CbN5MMCwOfodiJJZ4GuDRF5Fga3iuG4F45WAaTOib
	v/PhTlqc1cLcn4O1aIGOxkRTakVfVm+9w846DBIbvatZHOalW/xLXG6tt5CCTaT2sKyXtCNQgaS
	TNrDAzI9kvCx6AnxWPPx1ciTsm/6I6uy7URBqQom1/ahsWdOqQDzcmhfUhQvQ/N55kGYw
X-Gm-Gg: ASbGncuZpVJSBC8T0BaKH+mlUpreox7vNToOv8QhOTNPdV29OFepPWp9Mnh5cA0RoPy
	0UY3/ZRiG4rM0nUM4BcEFgcqIpzw8j213vVg83BGVYoqgRqDrFlAsjDnSAY/5XuYR0Ity0VzUcT
	q0GJjSJte6zYnJFbgsqVkaYM5/DWU++YF7xTiPfjodjvizAvbdlKzSx8xEmDfJrvc0Fh9Fzw9gv
	lWNWjDm5WXZ8iDiwDuEI6BhQarnV6U0YR4RH3AtOrCXfWt7UqyMOjNrzrAI3OAelKTTYi5UK/1j
	WmgOjRtVvSSZcxhMEBPTx2fJDNMeL9I1naUjFwdcgu2QydVq6fhfXEFSisIywA==
X-Received: by 2002:a17:90a:e7c6:b0:311:a5ab:3d47 with SMTP id 98e67ed59e1d1-313f1be18c8mr19885665a91.1.1750151235690;
        Tue, 17 Jun 2025 02:07:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGYtJl9iERnvAsYVcp7IsNfFfm03vWEkJgaCuPvHhgljsPO4XBA+fuCm40CFdv2tSyTdm0tsw==
X-Received: by 2002:a17:90a:e7c6:b0:311:a5ab:3d47 with SMTP id 98e67ed59e1d1-313f1be18c8mr19885615a91.1.1750151235176;
        Tue, 17 Jun 2025 02:07:15 -0700 (PDT)
Received: from cb9a88ed5d41.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313c1bdb39bsm10017370a91.20.2025.06.17.02.07.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 02:07:14 -0700 (PDT)
From: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Mike Tiption <mdtipton@quicinc.com>,
        Sibi Sankar <quic_sibis@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] interconnect: qcom: Add EPSS L3 support on QCS8300 SoC
Date: Tue, 17 Jun 2025 09:06:50 +0000
Message-ID: <20250617090651.55-3-raviteja.laggyshetty@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250617090651.55-1-raviteja.laggyshetty@oss.qualcomm.com>
References: <20250617090651.55-1-raviteja.laggyshetty@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: bNHz2IRz-5t1sUKfNIqKaFRJ17CkI9ag
X-Authority-Analysis: v=2.4 cv=BoedwZX5 c=1 sm=1 tr=0 ts=68513045 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=jqyGqifOumdqABPgMEcA:9
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: bNHz2IRz-5t1sUKfNIqKaFRJ17CkI9ag
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE3MDA3MyBTYWx0ZWRfX3iY8FQjtR+gB
 PZtQ+6UE7TtuJxZD5xUJCXX04tNw+nXppkvLa2RFMob3LDfEzH7hwbE0iCdGDEKD65KFW+bPZkg
 m1EJ5Otzfc9/bO9FD5OJjxofl+Rf6FrpT95+qxMXcXaAkaDWhQXTyJ4TmjY5x8XNG16Lr3bD4bd
 rUlm+w6DV9IytdolGzpzgOt+1ig717YAG/F6UMJBxHxO4jSk0PESSV+B7b7J4/32BWZpBnIsYLC
 8dkFZZkUwtqeHdGIZPUKA+j44KXoKlz4YIK3EeIle0LtfNAwCp5ZuK4uCYtTRfQ/qDiTk4tWQ2k
 89Cw6djBtO/W2fR4tnptYhwrew4g0c5JuAPAqZjGvb4gw446zOz805gLxUiewC4rknKvPkLkOKx
 5fMRN/ok3ynTDzywDfbzWfxYHbxkud+0QdRunxSLzNxvDyhvUK9ROQ4hsz35eqZ+1Kkk6kGW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-17_03,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 mlxlogscore=999 bulkscore=0 malwarescore=0 priorityscore=1501 clxscore=1011
 spamscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506170073

Add Epoch Subsystem (EPSS) L3 interconnect provider support on
QCS8300 SoC.

Signed-off-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
---
 drivers/interconnect/qcom/osm-l3.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/interconnect/qcom/osm-l3.c b/drivers/interconnect/qcom/osm-l3.c
index baecbf2533f7..d8f1e0a4617b 100644
--- a/drivers/interconnect/qcom/osm-l3.c
+++ b/drivers/interconnect/qcom/osm-l3.c
@@ -270,6 +270,7 @@ static const struct of_device_id osm_l3_of_match[] = {
 	{ .compatible = "qcom,sm8150-osm-l3", .data = &osm_l3 },
 	{ .compatible = "qcom,sc8180x-osm-l3", .data = &osm_l3 },
 	{ .compatible = "qcom,sm8250-epss-l3", .data = &epss_l3_perf_state },
+	{ .compatible = "qcom,qcs8300-epss-l3", .data = &epss_l3_perf_state },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, osm_l3_of_match);
-- 
2.43.0


