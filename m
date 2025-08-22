Return-Path: <linux-arm-msm+bounces-70460-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E4AA2B32392
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 22:27:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5BB231D62C01
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 20:27:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0B2B2D6E43;
	Fri, 22 Aug 2025 20:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="owXANOZe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0074E2877F5
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 20:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755894419; cv=none; b=p8jP6F9h1gNNUcp2qDghYJvxiMmIJU+qWwGKvcH4/pbqdSagz+hA3ICNQStD7DUCIVOuG3rbZvrz8XRv8mGeOdgPzrS7Zo+UsSecfOZRf2WTIn5+UvbJ4GGf1/eWZlBvyT9u7EkhLXXsGXGhox7D6NgEnDOBibxM0cG2lKrxg4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755894419; c=relaxed/simple;
	bh=r+bCRhwqqwoB96EGu+SOIw3M/48tWE3cWj2qR0ZkJ4M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=j0HNGUHuam5s1qhFooMfA3yWd8N1cn3j6QVLqu8b+/VoGjj6xCRBPN4simI9g3mOtXChhQRG5lHP0gQaXzd9Gep+S9w0xOFB8w5h0ToUehrHZLOwxiwR9HSPaI7qmxRbTDQjZKwrcSetIrfTwLRNsUMx2wTSN61jaTI4iucdT4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=owXANOZe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57MHZnBR025484
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 20:26:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=UgIXFJkpO+RIibSdUx0jxA
	E3y3S+KknfeJwPxQEopYM=; b=owXANOZeCtAZGsKEHwDz8foML/ifHtGy2CXVRG
	+WmtyUipbdvcF1DO5RTp+/zbunZDBpbjJcpuV7v2QAwINyGNluq5APg4KwHkbMjI
	8Bk+hiySA1YdzR3UKuz8PK9c7olTGhk1QCxVIEjACsIIcnd/6m8wxM2cK3V19j4m
	CBpvlJItwTdNXaQg7ZRg3rIDkHPaJ8uz24xxrWa/Cl8UqgG81w+9w5Qo/oYDqBzn
	IcSpRrRk+L1iw6INmiOOEQbNWY9z0fb8BUFK3yzOp0uNZyuIFtDm1x3IrxJJQ5Vw
	cpP0eraqPjhNbgqmGbtAt+E0v/trqoVKlrVLJ+DFMWV2+WdQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48pw3cgdd2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 20:26:56 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-24636484391so12826765ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 13:26:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755894415; x=1756499215;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UgIXFJkpO+RIibSdUx0jxAE3y3S+KknfeJwPxQEopYM=;
        b=sGeHNnwPx09tLBsg/m60mWEBUvCqBqPT6j7p2+c9do2PGGkymUrbkTGitkClcebLWN
         RtsqrD4C8yLzGLSZ2lpxAyyfGnXm6CQIRG30TQMsWqMBq8iPOjIf9V0U5GFxvJTjIKV9
         Sc7mvWzPjTM6/5NAV6GD+JbJRpUO90dl1xkgSxsEf81kPGYLtBBjnu6fRGdR6Q6F/5QH
         AypBM55EFMwRg61Qd4Blief5gDFp6QZkgQM3ivvuEm0u+FSAUhoa1oWVEiA1+i3PQkAC
         oM2RlnV4dwLUDCe46xgPHv55295q2YbFQ1EDvvZ31i49xcRtvczlyDhmNuhN/nDUk+hM
         UvhQ==
X-Gm-Message-State: AOJu0YzEAqLQxGtHXsvp/2Y3HD49Tu2mMSZNLBfhtD+NwS6Hy4YNgYOc
	8Dih5zcySulyWDToyKAAORhSypOEI77ZMcCr2AR7WGAg6VAdC7PL1BdDfYPrk65ykYCs95f779x
	9BfjSUCIhdk3nLQDjVWelvPFcNE8mkakMiqAbtzF/eMsA/LsVEEMEyxGZ8Mi5Bp4e2SvV
X-Gm-Gg: ASbGncthnQfcbFgwCdkep6sr4yD8+zsfzb1x6YzY48LaLReO3uvMSvRZF5R3u4hNQn2
	y8B5Hv8Jiad0ox5+HIV9dJLWOC83EM6fSSuBrP9XhFRKGzaCgFL3JYdhFBx46hRGKHzjWEjv+9y
	I9mkYkkzrZySczvAzvIDOXaJuiOFatgcvcKVs4qUu88fCUBBy1dnJcQXuBn2RLYAuOM53NDHpFe
	qkJmdM+gh0c04AAtY9AACI9amieEVgBQCGA3xtfsz9sKYW0KZXob4/DT0q1jnXUBBzz+IUTVRv7
	CCmmOo/nvSXMy5Ok2wYDTVScKuDVTCzX7A6tJ4JQ0LCGEp1fQLyUaApX7iNI39Fk+PxmkBMuO5v
	EmUl/Wr6yX/VtJyhb55WMe48onw==
X-Received: by 2002:a17:902:e841:b0:240:3c62:6194 with SMTP id d9443c01a7336-2462ee52164mr60159085ad.20.1755894415329;
        Fri, 22 Aug 2025 13:26:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG47RS/L1I592eDMrwsjo+HxwT/fuLxsPYqoHAKRchQq78tSDNlrkN00v2RNhPxUTPJiWeE0w==
X-Received: by 2002:a17:902:e841:b0:240:3c62:6194 with SMTP id d9443c01a7336-2462ee52164mr60158755ad.20.1755894414862;
        Fri, 22 Aug 2025 13:26:54 -0700 (PDT)
Received: from hu-kamalw-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2466889e111sm4335005ad.145.2025.08.22.13.26.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 13:26:54 -0700 (PDT)
From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Date: Sat, 23 Aug 2025 01:56:39 +0530
Subject: [PATCH] regulator: pm8008: fix probe failure due to negative
 voltage selector
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250823-pm8008-negitive-selector-v1-1-52b026a4b5e8@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAH7SqGgC/x3MSw5AMBRG4a3IHbtJ1atsRQw8ftyEklZEIvauM
 fwG5zzk4QSe6ughh0u87DYgiSMals7OYBmDSSudK6NTPjajlGGLWU65wB4rhnN3XCZFVlRl3mM
 ChfxwmOT+1037vh/t4qtzagAAAA==
X-Change-ID: 20250823-pm8008-negitive-selector-71646975befe
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        johan+linaro@kernel.org, quic_skakitap@quicinc.com,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755894411; l=1517;
 i=quic_kamalw@quicinc.com; s=20241018; h=from:subject:message-id;
 bh=r+bCRhwqqwoB96EGu+SOIw3M/48tWE3cWj2qR0ZkJ4M=;
 b=2yNUz1i7l84ts1ajeYFFAYgXjt83VbihnQUt81z5xL2suioZk9jrw5w58DGXXRAvfwxUMTEch
 vReY+SKATQfDoeRAyfOhPa/PUUHVUrJ8CC1R5DErdME+ueN4002sshn
X-Developer-Key: i=quic_kamalw@quicinc.com; a=ed25519;
 pk=XbPE6DM5/mJi2tsiYwMCJCZ4O5XPMqColJRlGVcM7Hs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIyMDE2MSBTYWx0ZWRfX+lVChioeDhQL
 7eUSm6qS3x0BGjBDUXZrQ8Ah+TzP9YBgv0mxmH3ZmXyC7MaUj+cysxOfhkZk5dFi4zg+DERt6Yf
 RAfYYXOqM7XiSbmZMqaspRXn9XNKSkJm2lN9NtjqBdlpVa1wdWkXE5XIk/9Fjf9f1w29fqc5bKx
 36sjJ/FIMU0Q0RFDR8vfVHj9v3Ti78Ga6UREn8Edf3V8uASOIu3wGXmxKbHMTht+OQH52VlGSOP
 ivUh/E43iohTSwT6Kie5EADHZVwSQphc5gW9hoOmRL2Ga228Q0A6eehWBPoBMp3+l1MpH6+hFWO
 XgHBkcU96xTOEc+OWvQhDWmrpzBS/tNZTTxKTwItJqy0AxUVaE6zQdn2Pp8tzRJnHCUVb4D+30E
 Pd5KaxCn
X-Authority-Analysis: v=2.4 cv=EJ4G00ZC c=1 sm=1 tr=0 ts=68a8d290 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=qP3kmwz9wx84Yj0DIhIA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: _MpJ_E9gQ4lFuVopZ8JX5FNC66Wsmd5v
X-Proofpoint-GUID: _MpJ_E9gQ4lFuVopZ8JX5FNC66Wsmd5v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_05,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 adultscore=0 malwarescore=0
 impostorscore=0 clxscore=1011 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508220161

In the current design, the `pm8008_regulator_get_voltage_sel()` callback
can return a negative value if the raw voltage value is read as 0 uV from
the PMIC HW register. This can cause the probe to fail when the
`machine_constraints_voltage()` check is called during the regulator
registration flow.

Fix this by using the helper `regulator_map_voltage_linear_range()` to
convert the raw value to a voltage selector inside the mentioned get
voltage selector function. This ensures that the value returned is always
within the defined range.

Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
---
 drivers/regulator/qcom-pm8008-regulator.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/qcom-pm8008-regulator.c b/drivers/regulator/qcom-pm8008-regulator.c
index da017c1969d0cc2c6347b68c37518ea8a7ab44a3..90c78ee1c37bf9bf69f43e0bb7798fed94590e95 100644
--- a/drivers/regulator/qcom-pm8008-regulator.c
+++ b/drivers/regulator/qcom-pm8008-regulator.c
@@ -96,7 +96,7 @@ static int pm8008_regulator_get_voltage_sel(struct regulator_dev *rdev)
 
 	uV = le16_to_cpu(val) * 1000;
 
-	return (uV - preg->desc.min_uV) / preg->desc.uV_step;
+	return regulator_map_voltage_linear_range(rdev, uV, INT_MAX);
 }
 
 static const struct regulator_ops pm8008_regulator_ops = {

---
base-commit: b9ddaa95fd283bce7041550ddbbe7e764c477110
change-id: 20250823-pm8008-negitive-selector-71646975befe

Best regards,
-- 
Kamal Wadhwa <quic_kamalw@quicinc.com>


