Return-Path: <linux-arm-msm+bounces-61556-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C0ADADC5B4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jun 2025 11:07:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A2A9B178572
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jun 2025 09:07:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC7DD290DAC;
	Tue, 17 Jun 2025 09:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V1KirzYT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50B19290BD3
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jun 2025 09:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750151232; cv=none; b=Sdv4EAbC3KW44YBZ0pq9C6558M6HUWyqCKMCPKbpvMkc+EZWXD4IYI5AatNSXdc6G7ru9pkOeEQK/OYfty0yNH/T+k6johqBDz0CIIqEihrr9mhobbyquwtR4Slu0KaaQeBnn+tmOYu2A49NHLotjZGDvhLeNj7dEUOuYCZ4R+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750151232; c=relaxed/simple;
	bh=Vn5omH7xMvt1iEtCLJWJvK4XrcA+3vcYMlQkxOXLM/Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PqQru1iriWJFWEMsfWTZ6MvihEFiu4Gdd1Imdspap/+ooO6LNVmM7C6102F+Vt2Evwy6fGEkLEwvRzvocAUlO3q9/sJ32ZECIYZksKskMVFOstN6lxsQyRME7JjweFO4/Yx1OIk7tOdyrdTKV6YYAyx1cOCGivLLX2KNPuO8YX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V1KirzYT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55H8ZiBK030215
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jun 2025 09:07:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Qly2EdwvT9V
	KNW+eXeSW4hrs+ShzHfZ0sLmUFke1LiY=; b=V1KirzYTdvewPve4ZhqqrTPVYAh
	mR1kMmckSPeVElmcI24KcJbXd8tH6RKYDWkGlaYzNM9W0LSeqCDEbux+idDTi4z2
	vKTJRXKaiisaRl2n/Dd2A48lUSsengNgNHMm6+9bVpEFPDA0e/UMQ3OZcb7nmBHV
	1klalkHEX14NbZG1X+CI8PibVAdmq8o6IZGwuGMAav0xikj4QZwTl9ZIUIqm5sO5
	24WeqDLkrTYX21MIN6bfbQyon2eXQxU3CYubO2R+QFTq9yueB1IiJfkNmnJuUwEt
	/g+BSkoPsxdaNnIuiaplrwBoxVGDFECNQV2Xi1Lt5RLS+93EXxsElpu+mHg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4792c9yqhu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jun 2025 09:07:10 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-235842baba4so45335065ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jun 2025 02:07:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750151229; x=1750756029;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qly2EdwvT9VKNW+eXeSW4hrs+ShzHfZ0sLmUFke1LiY=;
        b=HJwleL2nbswIXUkLXgic0hlv1Z/lgHkX9KXUPR6NiFnrmSk99JcAICec43Y6klFOg7
         lApAKOliEYIw9NGKROfuHQxPzR763nCTSjIMpGvApR2+ebYgP9XJ4Nfnvlj2DV6YprLd
         VUCYASPPvfKTotYfC8V6FbkEUVfhRXv5hC8DjjYrS0+052gFguAsNEFXtzSo9Wg80WKq
         cP4tfuTUCeZ7FcKij3rQvZbNSz69OkbMyMvgo5Bk6U5rKAw5q6BLybUyjlZ33nloZ2K7
         8Wa7kJDiW2alQM4NW6AzBDEbIv7CHtvlZS2NbrBcAAUHyJUpa9IYkYmB2zGd61oHUdJr
         VUbQ==
X-Forwarded-Encrypted: i=1; AJvYcCX9Ii/JemSZQh5eh+YJ+4YwmJb6aWhJm3ghBNGIHnamlWJ9eqMwVZZG8DI3oHXbe0mGhjneB4kS9fTbpfM2@vger.kernel.org
X-Gm-Message-State: AOJu0Ywk0qaQR3VM5a7qzpvwnCpaJ380sDczDEQ4gnjYijD8KoLBG3+t
	IVGnufZnwUrUZmd7ius4Ie67bDFwvWQtQkOLB5uWxk3UY2IDfXTrJhTAMVzxPKDZZRq7YYKuV9c
	R9xgE0L5h7uXNiu7PwlHpWndYmARqu5Kbk3k34DZ3ju+3oiud2CwxHhcgX20b9tZWthNr
X-Gm-Gg: ASbGncsxExTrLvC7YrBPIEtSKIVbfEhYXpyMdcD3/aIqIqbPDt5lofGhXsgRjeRJeO9
	XPhMARAwWDw66QYOOMWP7BG4EPVH6Ccfx+t20G7NeIEZfs6f5zomclT1J3uMpRsxgpZbzNZb9y+
	iREahCfAxzlbUIonDk7rM1JE2g0vK60LrwvPokpLoM1SGUaU/IdbKrXY5grENyQ47+TZNWL5gOP
	J3MW/GCtHKz2iMJ4VrCO4TJqKTYnPrRX0jGwZuWwY2EDQF0PU7hujIJHzsnfFMC3AXrdC1VCGsu
	jRGr20M9CVAlQCP0EKZQHLd78vXQiLG8fGXIVeUBTJwIxWnXB7PIPWJoDJ+G+w==
X-Received: by 2002:a17:902:ef45:b0:234:a063:e2b5 with SMTP id d9443c01a7336-2366b1224a8mr179419775ad.30.1750151229661;
        Tue, 17 Jun 2025 02:07:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHOtX4HvuLhem2kJyZ83xaYVvt9E2oOIf3GftGjva6d/NVHBthTT2N3GFudpNlTYUanrft4LA==
X-Received: by 2002:a17:902:ef45:b0:234:a063:e2b5 with SMTP id d9443c01a7336-2366b1224a8mr179419395ad.30.1750151229257;
        Tue, 17 Jun 2025 02:07:09 -0700 (PDT)
Received: from cb9a88ed5d41.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313c1bdb39bsm10017370a91.20.2025.06.17.02.07.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 02:07:09 -0700 (PDT)
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
Subject: [PATCH 1/3] dt-bindings: interconnect: Add EPSS L3 compatible for QCS8300 SoC
Date: Tue, 17 Jun 2025 09:06:49 +0000
Message-ID: <20250617090651.55-2-raviteja.laggyshetty@oss.qualcomm.com>
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
X-Proofpoint-GUID: YZTKDcazYKvPIiuxuLWPPfPI4lNnKRrr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE3MDA3MyBTYWx0ZWRfX179v+t0uf3Fr
 kmhEN30zeqBpOz/OHz12ENzQ4iW5YhBXQ39qShv+1QDDPAvewQVKeVad4DxB5oIM/4DRyiuF09U
 D1DgNu9W11rsjsug0kUpBvXJlC23pewy6k6HJezTsNBCPvWDp3GLkFa2SGb/tUkecx0HSlMclt6
 xfS12Ay088qBuyloDJVfUR8cbnY5LaCFWYwb7UBzp8+F/jqfJuUr+azYQOhkLBkrRLcbZtBumQt
 iq2NPVPVRIxPuDzsDZc0KjBloWpLvRcaqe0+zUsqWxw6K9r7dswaNEetNwx+IKvKuPCE4SkmXAG
 woGOzOhgT9878PKebWltIrb/EhInzfRHA79NZXQGlvwol7q/1eGhb3o88u35wY/MAbV2I/lUBcw
 rw/3nyGdSjZZNc0HJ4M1ZE18VqOJyEuwf2vuer1oIy4Gmr+nUko6cJqK1q1axsW26T7TrgEz
X-Proofpoint-ORIG-GUID: YZTKDcazYKvPIiuxuLWPPfPI4lNnKRrr
X-Authority-Analysis: v=2.4 cv=etffzppX c=1 sm=1 tr=0 ts=6851303e cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=n01AJKLZCHBDCBjb8ZAA:9
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-17_03,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 impostorscore=0 adultscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 bulkscore=0 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506170073

Add Epoch Subsystem (EPSS) L3 interconnect provider binding for
QCS8300 SoC.

Signed-off-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml b/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml
index cd4bb912e0dc..64ad3898abb6 100644
--- a/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml
+++ b/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml
@@ -35,6 +35,7 @@ properties:
               - qcom,sm8250-epss-l3
               - qcom,sm8350-epss-l3
               - qcom,sm8650-epss-l3
+              - qcom,qcs8300-epss-l3
           - const: qcom,epss-l3
 
   reg:
-- 
2.43.0


