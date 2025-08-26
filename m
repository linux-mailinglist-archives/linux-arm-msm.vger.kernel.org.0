Return-Path: <linux-arm-msm+bounces-70940-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C5F5B37219
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Aug 2025 20:21:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8D0B41B27E7A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Aug 2025 18:22:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BE0636CC73;
	Tue, 26 Aug 2025 18:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="auS89GN1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF8B236CC75
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 18:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756232491; cv=none; b=Q+Wus3v9g3669j4AB55pwD9ZG6Wxjl1SIxnxSfomnhUl734KRWSz/z+VvnJ+/p/AHHC7X7n1/s65sKbKbq8cfihk2TcMZInm3DIptO1P99B3T0aNsUKKlRuDZufjLFTR5XSdz9MuM2EKtQBBACcIrr7TPOYTUTAErlMTRmE1JpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756232491; c=relaxed/simple;
	bh=JxYcgKcmhaQur96n/POTBQUFznkRKuR1GNH5Rn9msRc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AsnG2DNDFsf9UkroxI6PUPjHqe2hN5R246C8968JThC99y1mtw3/mhKgs4ixJsMMfpHupHr9YDN/TcfaVDmlNSeUKC0ks/dorrarvsl+QHerYiZF4NSsibzt/Lo+w93/tFcQT0sxWx1cTIBGkuKrZsnct4xplmisO/q3Dbjv10o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=auS89GN1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57QDQ3Di008821
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 18:21:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eL0QgrgRy3cWfotIYWgvsMBQYI7kvhF7uQsBTion3yA=; b=auS89GN1MxwKhY5Y
	eyute2YrIR2oGMQkEgnhXLr349CrCx2PQv7B//8ltmJTQaDC0MBQ0C9hNLDX6aDC
	r92r6tipLqBldJHRVt+fG5WqwOS4HIrJ8UWtdo8Qkp1IWNVQ/WZq9NF0K1w/OsPi
	g8JOoNmFfyBx0DWHh297CVA2vMkWcVx3i7k89KC8jz09tOY6Hpp0evY9vbWbtXco
	xfGvVToEDb7/5QCKhASJvgtIvhlr18z1mpQvgyJBcEdt1sGVKGVGsaFpy/CCP3t/
	BkFSKCRYLCl3BuHc1/QKqopukyWVdrzZGxbzOYUQMP1YEXISMnjrKLkBOzvZdkg4
	Xgf18A==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5w2t3qt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 18:21:29 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-76e2ea9366aso5368387b3a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 11:21:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756232488; x=1756837288;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eL0QgrgRy3cWfotIYWgvsMBQYI7kvhF7uQsBTion3yA=;
        b=ReEOm6TLSuKPWlBGR59KASQ165Tiy4IjzdkNypZ8sx7IHKNZFYKrzsI3lM2ob6IO5e
         xO9a3B9+bYzKmCsmZsYv+c3JVcQ78uUn6ZDrkQkpDHikkjukuxZyBQaTsD3+Wty6d4Zd
         SjvaRPsjM95D+6JrNeB7ESTHLHm2JeAKmj2xOqZcPZ2AcKpWh2eCgfi3wrxnqe0avpTR
         B0UmXzMpfEh9TfF2GDhfsDypBTf5SZ60Sgz2iZE38TY0p1h0YD9u875pMMAStGwOOSFq
         TCTSm+7DdkVx9wYrKvtGCOV3jTAGCx1u2N+ADH8n6xznFrZFO7L8IxdWu0iRNUpgV7wX
         dFng==
X-Forwarded-Encrypted: i=1; AJvYcCXEKXxD50o3ynEHe9PwkxcDuosDZHYapYzMLwPNzneBEbdLs9phowV4ANH9chxsb9EYnphi5Q37dl1MIrPK@vger.kernel.org
X-Gm-Message-State: AOJu0YxEQzCvH3BED7qM9WolU6RmXl0w3qgyHD0LschVswnXYR803d39
	cvCrdW1H4BX1QRyDNSTKoEkieiyIZhE6KBZVgul4OOyYtN4OqWze+PeI5XyPz92IMEw0paFDOT0
	00ypwErz1pO6kRWqF0RqddcuA2m2kVkkO5todCZ01s3HgoBPfQ5gtmqk9S7svuodHm3/X
X-Gm-Gg: ASbGncs8wNFwSqTcJ88JxSZCmVCnermtxjoVrOgYqV5DncZu5VCkDyML9XS8BwIndkZ
	y3EnzZfH+g81AZTzE/V4PSHFc90kBMLaxqyx4lHeN7zBD/avnltedxIFDccUqkA+7rnbYIyTHF2
	2cgZcv9V5TxJf/YdURydBJ+04aLgIS6Yuczp2941nTI/K5yhImmZx5yGiSfZapHr0OVyxvQPGoE
	+tA4g3oGrHGZKmsQXod/9CqmkVFd1SJqnB2dZbN8VrvvysO9sLDODMHqiriKI0mJxDocJ9wlmqv
	Dekx3xU2i92W+MUg+XCADD3Nj0PylJjj7y7FXGnOkYxCf0ze01AbbQ7YbXWE0Th/Ux4Q
X-Received: by 2002:a05:6a00:14c7:b0:770:5987:5b3a with SMTP id d2e1a72fcca58-77059879144mr10408757b3a.16.1756232488294;
        Tue, 26 Aug 2025 11:21:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEdbni7xGAlaDwJvZNQie+3PflKT30+F6qVX4DcxiW8gpRJHQkgNR9tu1A3N7ospcq9hZ+02g==
X-Received: by 2002:a05:6a00:14c7:b0:770:5987:5b3a with SMTP id d2e1a72fcca58-77059879144mr10408719b3a.16.1756232487815;
        Tue, 26 Aug 2025 11:21:27 -0700 (PDT)
Received: from hu-wasimn-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77048989fe6sm9881803b3a.51.2025.08.26.11.21.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 11:21:27 -0700 (PDT)
From: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
Date: Tue, 26 Aug 2025 23:51:00 +0530
Subject: [PATCH 1/5] dt-bindings: mmc: sdhci-msm: Document the Lemans
 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250826-lemans-evk-bu-v1-1-08016e0d3ce5@oss.qualcomm.com>
References: <20250826-lemans-evk-bu-v1-0-08016e0d3ce5@oss.qualcomm.com>
In-Reply-To: <20250826-lemans-evk-bu-v1-0-08016e0d3ce5@oss.qualcomm.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: kernel@oss.qualcomm.com, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        Monish Chunara <quic_mchunara@quicinc.com>,
        Wasim Nazir <wasim.nazir@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-e44bb
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756232476; l=1192;
 i=wasim.nazir@oss.qualcomm.com; s=20250807; h=from:subject:message-id;
 bh=vYOX3rphXNqw4BaZtF1OQs+qVbxZRa6V2tNPd8V2s/o=;
 b=d02cyucfOmtC1y0r5qc+700gCtMeGv1Xx4u39k3ipECsmsgdJU/b+YdquOEEBuIb8Ab8VQ6ha
 UCtR4syOGZqCio2iFgsKBjK6ubiSLuHnl4u9Rq4tQRTIQi0rS8U9uTY
X-Developer-Key: i=wasim.nazir@oss.qualcomm.com; a=ed25519;
 pk=4ymqwKogZUOQnbcvSUHyO19kcEVTLEk3Qc4u795hiZM=
X-Authority-Analysis: v=2.4 cv=Z/vsHGRA c=1 sm=1 tr=0 ts=68adfb29 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=h4M2rFpPKqSdi5wqdTYA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX0EjqM6eg64cn
 vP/Ac5h7iZ0GKeXk9bq+YMfzRFE6lXS5MVvWzGTZOXYHBOwsxHsJO2lIs9eR0NIq0b29FqV2n98
 142cXwqVGSOElCBiKJX3bYzft1fp7FDitESY2/UJ2IaTHmWrr9yOxBxsrmpAg3GJ+ziyHx77lQT
 RkARi+ilItpETXgqpjZ0t/WSrpdURlBMo0MECj4XOgkk/uqpwZfCjCrAstk1ae5nyEzzZGrWswt
 07dZeL5OUmOHQnbeVhX6cVABAEDZQmJWq3nruoxITOvtDMDDKGbBAl5K4iUyeV9uP2YAv0fkeSB
 SscKlCRw+nYtvdCIiRlXvemvSkxU2Er4QSDUSHtfv1zTqzAD26WvUwcE/+iMXd1M4wJThjVYqth
 mvZBQddB
X-Proofpoint-GUID: jnnRxzYDhftoWgUgNpNXkPk6afBIc8GJ
X-Proofpoint-ORIG-GUID: jnnRxzYDhftoWgUgNpNXkPk6afBIc8GJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 phishscore=0 clxscore=1015
 suspectscore=0 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230033

From: Monish Chunara <quic_mchunara@quicinc.com>

Add the MSM SDHCI compatible name to support both eMMC and SD card for
Lemans, which uses 'sa8775p' as the fallback SoC. Ensure the new
compatible string matches existing Lemans-compatible formats without
introducing a new naming convention.

The SDHCI controller on Lemans is based on MSM SDHCI v5 IP. Hence,
document the compatible with "qcom,sdhci-msm-v5" as the fallback.

Signed-off-by: Monish Chunara <quic_mchunara@quicinc.com>
Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/mmc/sdhci-msm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
index 22d1f50c3fd1..fac5d21abb94 100644
--- a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
+++ b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
@@ -49,6 +49,7 @@ properties:
               - qcom,qcs8300-sdhci
               - qcom,qdu1000-sdhci
               - qcom,sar2130p-sdhci
+              - qcom,sa8775p-sdhci
               - qcom,sc7180-sdhci
               - qcom,sc7280-sdhci
               - qcom,sc8280xp-sdhci

-- 
2.51.0


