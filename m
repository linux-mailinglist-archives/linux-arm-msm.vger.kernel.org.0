Return-Path: <linux-arm-msm+bounces-52690-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A0FBA73FAB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 22:02:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DDDA7880223
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 20:58:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 418071DE4FC;
	Thu, 27 Mar 2025 20:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KXNif2IX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 584241F8758
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Mar 2025 20:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743108905; cv=none; b=cDwrIRCGGj20kaA8AvQ+ubGYSCFXWM9zqRvsoUE2jgZLDt06MctDiiqZNHRjlG4zgMPiTdxqCY69VX+ui2dUUqV61MSxOQpo8lDjNAsZQq5N8fbDE1+uxJuLQ2eMaEdVqIRgMcNbGBEp8XHUs3bKapRu41aGf+Yrhd/Pn+Reo9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743108905; c=relaxed/simple;
	bh=GF+tNhKS0NGKG7yfNhdANlS+zkLxYeaSGBHz28Zf+iQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qE37rfFyS52oFrMDH7R3JKnOgy/x+EG1Db4Ly9dXdI/GQ1O//5UbomKMxBm6wvNZG+mVmsrNz/p4eftVuxxFUHw29IMluFu08sAa8TuXNPQo/BcMp1NNt9sOfhfA/y4ie47MldI9otLSQXlo0yn8bDwZH5zimMN1GINaI8WyHSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KXNif2IX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52RF5Krr010210
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Mar 2025 20:55:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k99KWcn22Kv/BaD8xTy7Mazz2sRmN24Z/pfpwI8GlMU=; b=KXNif2IXs6T4Djn/
	i4sM9DKSyVvH1fKzAEZJVJldkXS6Qty8lC+9fgcl/9n2eVj+E0dzOoqSyyBRMKEN
	o7HrNmi4hGeLJITabnjdmyB0wOSfsZEjpLJ+qRew4K6nftXk8FOnOi3de/kL2UoC
	4+90Nl5Wle0uW5AJ3uYlAOimfgIUJZ7D6fKgRsBFSGxcQ7ARAtUSSxh85phkZJJy
	YFnaK51X8BGC4dmFYDeq/lhA78GGFat/hcOKlOhSfw324/XMjbCYPjkGvgoffcAf
	IZJ+e7ydyEOOGkarMmGjI76ll+yj5/P9pLmNd8j8uyGnjtrbUka0EFuMYEX39yVK
	q7w5qw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45kmcyhwdn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Mar 2025 20:55:02 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2ff605a7a43so3460073a91.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Mar 2025 13:55:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743108901; x=1743713701;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k99KWcn22Kv/BaD8xTy7Mazz2sRmN24Z/pfpwI8GlMU=;
        b=e5yJYAYT/aI5jC/zlYb2d5S1Gv6sE6QYOqsRta5cZowvxcgkC1XG5qX4FrQ44+z50v
         AO/0hTSYGH5JxgaNM6F6ReBURhlgXFELH0UTUvwGXl22VeMXZiWQZxO9ji7paX9B8mmg
         fWDDDPZkrkIsZU0Hwn9pLxvsGNQbi4HrnNSE142huzdXfsz6HLQIPK5u4iFiQG113DDE
         s+wFbyKs4ouCr7YIw1HKV6On0IWG9XwJlEVEvHRJawRwaFYuSbTW30TV0QoZJ7Ajkgna
         6jgtKqEagSK7j3jkAp1HQQ/RKA2Afms6UPbfUyVitDUvSW2M38QI5BkAh7uOA0cuIzDs
         pSxQ==
X-Gm-Message-State: AOJu0YyRxYmLn2+dRhutcqODrYVgqUa9g4YGyLcqR3eaqpn1Mb4UaioF
	Jb3PqljdRbt2TO6dRGXEFpRhaljFrGSIOwpxDTxS9jjDUIII7vujekdrvysgiXbMiYs19IfaFQU
	/5qloqTjpp7a37qUpGy8cdbbitZiM9N0FPUuXxOFdHmFj4NpaNjuxBceTxYRgZd1b
X-Gm-Gg: ASbGncsgsQZAoEorTdC1cDqXM+M1WdLFJruS/wTnx6clxnlNxqE7RtXAS+Vw6Noi2I/
	0W/55DtttDMflIrqvfW8jNjscuOcQ7Th5KYpN/ZMFT3o5qw93/s/ZnG6ar/r25wt2PutEbFbwP2
	3ji5Q/aNjCxipreYsOThDmFckZxNJMhEU7jXUpVEQdnYVFa04pm7a2ektA8WWavj0trpOtGhUhM
	Ou3hAZrjkD2C0FMNq27vK/fc7UkqohTREsAHVdAz+YrorngcsY6U8VbctqW4bVQAQhw1tpREIm7
	8tOyIWY6eAjnQbWp8U+GnYieGwwWph5DxNRzgYcXFtOawitG96KzINoCAlXgyANUpjFoyjM=
X-Received: by 2002:a05:6a20:94c8:b0:1f5:79c4:5da6 with SMTP id adf61e73a8af0-1fea2d47f34mr7718531637.5.1743108901429;
        Thu, 27 Mar 2025 13:55:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHasiOtfj/2S9UBpTwqjAT0yKrB460ri2h4Rfh7vrVELdUg7mprX2fAHQbXNDqTRU1adHUsPw==
X-Received: by 2002:a05:6a20:94c8:b0:1f5:79c4:5da6 with SMTP id adf61e73a8af0-1fea2d47f34mr7718502637.5.1743108900938;
        Thu, 27 Mar 2025 13:55:00 -0700 (PDT)
Received: from hu-molvera-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af93ba10da3sm330889a12.66.2025.03.27.13.54.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 13:55:00 -0700 (PDT)
From: Melody Olvera <melody.olvera@oss.qualcomm.com>
Date: Thu, 27 Mar 2025 13:54:28 -0700
Subject: [PATCH v3 1/4] dt-bindings: ufs: qcom: Document the SM8750 UFS
 Controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250327-sm8750_ufs_master-v3-1-bad1f5398d0a@oss.qualcomm.com>
References: <20250327-sm8750_ufs_master-v3-0-bad1f5398d0a@oss.qualcomm.com>
In-Reply-To: <20250327-sm8750_ufs_master-v3-0-bad1f5398d0a@oss.qualcomm.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Nitin Rawat <quic_nitirawa@quicinc.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Melody Olvera <melody.olvera@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743108898; l=1192;
 i=melody.olvera@oss.qualcomm.com; s=20241204; h=from:subject:message-id;
 bh=3CU4DQyV0/viVrQ8BNTaqxvwVFs8M8ct8Q0UrUVEtQ4=;
 b=gqI/dFoFrkNVxeJmU5J90T6vfTNx9vZ8rcCOnnp3O7svt/u9Pvnx+oSGeSMskouQHh6L3BdE8
 Db8F++0eobjCxiqXnj8eFbjnYd5Tzz1pNDnJXl8tzkcoqCIMJIGBQ4Y
X-Developer-Key: i=melody.olvera@oss.qualcomm.com; a=ed25519;
 pk=1DGLp3zVYsHAWipMaNZZTHR321e8xK52C9vuAoeca5c=
X-Authority-Analysis: v=2.4 cv=EZ3IQOmC c=1 sm=1 tr=0 ts=67e5bb26 cx=c_pps a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=u0-Bzi-a7h-vFBLzmccA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: GlNpZaYCv1nPpicglnOgFz5yPwSI9yjZ
X-Proofpoint-GUID: GlNpZaYCv1nPpicglnOgFz5yPwSI9yjZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-27_04,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 mlxlogscore=834
 spamscore=0 lowpriorityscore=0 clxscore=1011 bulkscore=0 phishscore=0
 adultscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503270141

From: Nitin Rawat <quic_nitirawa@quicinc.com>

Document the UFS Controller on the SM8750 Platform.

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
Signed-off-by: Melody Olvera <melody.olvera@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/ufs/qcom,ufs.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml b/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
index a03fff5df5ef2c70659371bf302c59b5940be984..6c6043d9809e1d6bf489153ab0aea5186d3563cc 100644
--- a/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
+++ b/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
@@ -43,6 +43,7 @@ properties:
           - qcom,sm8450-ufshc
           - qcom,sm8550-ufshc
           - qcom,sm8650-ufshc
+          - qcom,sm8750-ufshc
       - const: qcom,ufshc
       - const: jedec,ufs-2.0
 
@@ -158,6 +159,7 @@ allOf:
               - qcom,sm8450-ufshc
               - qcom,sm8550-ufshc
               - qcom,sm8650-ufshc
+              - qcom,sm8750-ufshc
     then:
       properties:
         clocks:

-- 
2.48.1


