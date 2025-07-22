Return-Path: <linux-arm-msm+bounces-65994-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C197B0D2AF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 09:23:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AB7241C247D4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 07:23:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F08CB2BEFF1;
	Tue, 22 Jul 2025 07:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TVzq1frN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55FA82C158A
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 07:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753168955; cv=none; b=binYeDfCSVl7RoTsQiQ0CE19H2j/BqjCBgI2IdbhegAuTSeBrKO7LNNtDGnO0/eiRIuYh/bAn4A80szAMaUJKX0cydiZTrXiZBxs3eFvE7+pyVyP38f8X8WV+QCF8MTs3M4FaW7B6OLWNfN+rcieb4cyaJYzUTI16QfuAiixTl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753168955; c=relaxed/simple;
	bh=flVURwsSNZtWM0+fUgJqZKMxwfIi346lSujUoU8vBq4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iXqZtjLlLck86tuKKSVDaWzo8h7lMVJPUWwFiBxWiGzaiCYcph1q0kCcwDzJqzEPXeN0hrVdiQ7IVkVzy3PWjy8rC/cwuOom/sb+HJICLw2ukz/Hu0pc5EFlMr1eOxb+6+G+4ANcXOwQ3IWZgz/YiW2Tjnj2CJKtDx90TUmdneI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TVzq1frN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56M4XmV7015762
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 07:22:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z6ZwzV2fRLwP2rYYHbwT2Ikl/JBdsp6+MNb9lNC0zc4=; b=TVzq1frNL/SlSxtN
	WI+DdaVgz6Hgu1dXskmqVouqvahpmof/0OcnvL5kL65WYFsihlhnXTMxd5b7PDpS
	hRONCm69aDPDhuB34dNDT4mgIrOkPtc9h+UN+pqPnt14S1WUNzT5JaEmiR/55vK1
	Cfqa0LfPtFoxvqj3jZ2W1mIEMuUWsI+POp5dUBJqFhp+5tc0cE2Um8qxBCD+XoEI
	9J6i3JkXoR7bqPkdr3XnKIFt8S+n13rMwfomdNVnE7T/fkNftGYKJdkXMUCewhZA
	PdHJeUNUbaDwsulrdYQ4trXIV4URkJg3+94H30MxIXQMSmQvmLyw86MJJPT1p8ns
	3aPo/Q==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 480451ga6y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 07:22:33 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2348a5beb24so1580855ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 00:22:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753168952; x=1753773752;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z6ZwzV2fRLwP2rYYHbwT2Ikl/JBdsp6+MNb9lNC0zc4=;
        b=l2pazz8+3dCSIhmAil11KtygO8HuPrGYf1dafOYipG4HisN62StcXqATyszDkknSzA
         zcE1F47KpdLTmabeq4/o6kKvfqDkcr9bsBoToAM9fcj4qawfCkNlCT0ngxUoJfxKMgD7
         TqsEKTz+pIR7hdcJ02bVE+ABjfQcgVj6ujGX/0G8FDgs32hekd0ZAHxKS5ed6R60US8b
         Y25KM6spwDYEQEsB5IU6Mo1Y9LGAyOarwFvLY+Y9fVbTf0JpARrxpMfMCULn9kCE/nED
         QQlQfBZWy0DfoLDqOoJZu0uORjkM52u2VbDcl+A3JFnI3ZyoJON8zMJ//tLLYy0dZJpp
         Sc6A==
X-Gm-Message-State: AOJu0YzVvOv/M1O1jaZxeGEkTOkmSPZY7QXCPuTg2QQxO63bemlxG01e
	JzkSjDE65/hIRPmXthE48NzK5fsEkhr177gfqH4HXYRmScrUW6TuO9mK8dBrZ8Nx37AAz0o7jfR
	4Sf7TKbjCJ9guVpgJjzR7qxRrcTADs4z+/aUUMxq7OCU2pSA0yIFd6yK7dkwEh7MZ9jpd
X-Gm-Gg: ASbGncs50T9jxL+zoWTLKeZUdYzex2CldoQyA7Safw8xzqhLmRsBOdlEwnhFiLD6XHX
	CacoUECiR3RXakp3NEcue0Y1MI4LF6CLX3/BODGkXyE8GNLG74vR68oac+p84aweIUpYmB/g2Jp
	VBHUSxTec8O4FLpiPnLkkEYEQ5oXP72wXvdnRhvkmhVQ0XVpzmAKZnI1Z4zaBRjwHuyTxm5LYLu
	OPWEAiglePp0x35dM9xkB0L1CPEqGniBoAfqNg+xV9deHOO6IBMfjL23ZZhWAo9d9fmG4nR+4c9
	M9h+5INp3HwYpQQxFgHGDnLCFPnC4fctYh9nxpDSp7Aru5DZYbgLUBYx4pbj9PNjzeF6q6J7iiq
	8mfyXtwTuSl16PHYQCi2aKSIH73hI6cCVv0H/BIImFuhqwN5nmqbu8Op6
X-Received: by 2002:a17:903:1cd:b0:235:ed02:2866 with SMTP id d9443c01a7336-23e24edf70bmr137444775ad.4.1753168951885;
        Tue, 22 Jul 2025 00:22:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEPbIpYG8v2ydgpk9/Rt6e8nvbsQWG0NcHT8nsJPhxyTxGZd676+Q8C/tNJcrl9ABEm52u2QA==
X-Received: by 2002:a17:903:1cd:b0:235:ed02:2866 with SMTP id d9443c01a7336-23e24edf70bmr137444575ad.4.1753168951408;
        Tue, 22 Jul 2025 00:22:31 -0700 (PDT)
Received: from sziotdisp01-gv.qualcomm.com.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31cc3e45e6csm7490753a91.3.2025.07.22.00.22.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 00:22:31 -0700 (PDT)
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Date: Tue, 22 Jul 2025 15:22:02 +0800
Subject: [PATCH v2 01/13] dt-bindings: display/msm: Document DP on QCS615
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250722-add-displayport-support-for-qcs615-platform-v2-1-42b4037171f8@oss.qualcomm.com>
References: <20250722-add-displayport-support-for-qcs615-platform-v2-0-42b4037171f8@oss.qualcomm.com>
In-Reply-To: <20250722-add-displayport-support-for-qcs615-platform-v2-0-42b4037171f8@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        fange.zhang@oss.qualcomm.com, quic_lliu6@quicinc.com,
        quic_yongmou@quicinc.com, Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753168937; l=986;
 i=xiangxu.yin@oss.qualcomm.com; s=20241125; h=from:subject:message-id;
 bh=flVURwsSNZtWM0+fUgJqZKMxwfIi346lSujUoU8vBq4=;
 b=lFF3TC9IzWFZbCphEU+PcIbJicZ2nH4+jooaIfp3H+fpT8Ugr8/Lcb6A7g1w4zevBtfnOQzlG
 sTyaMHC/WnDCxaIyrA03rD90NFGzdqeY660ykfSFBWrYsobnqaFRMrc
X-Developer-Key: i=xiangxu.yin@oss.qualcomm.com; a=ed25519;
 pk=F1TwipJzpywfbt3n/RPi4l/A4AVF+QC89XzCHgZYaOc=
X-Authority-Analysis: v=2.4 cv=EIMG00ZC c=1 sm=1 tr=0 ts=687f3c39 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=CFpH1fyJroaNsTO7nwQA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: iHx2xc88xLrPDNPGRp9pSjXdYhg9eJiE
X-Proofpoint-GUID: iHx2xc88xLrPDNPGRp9pSjXdYhg9eJiE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDA1OSBTYWx0ZWRfX30ewg7rcnAHq
 0HL8lIzOdarUoRaItJkTOeW0O4Qrqoe0+iFAneuJrkTP2gFfH+OVC3fGqEfkelUVy2N4B9BSDSh
 4jQkMfpiX7yF6qgmZqYbS7AbjDu3mBgWHQn7BVlbIjUBYqwQHtJmxvP6qjoJsG1aF/Odw1VTodG
 BZrMpOeSkJDuDHRxMjkbpSkQGaR2oykD/cn21dd90VGXbIK52VYBFBexSY2FDfsxfLgQak8QKp2
 t6ojsWDyY63L2eOOqJiR7xJpdvWl8GXKiH+1DJnQyX+dwvKnlQKBQqe1vGyhCFRSf5yaoqfqhhx
 4sY3oWNWsinQxn0DJdJXjGw5qRR7+uzQ9gPtQ1hRpwlISMNGJgfAJD9uxtcGBAOlLSrS5XdfCEf
 c9Zey19aiwvn2O06Sp7xEh5QNpdgatNFV+4+6oPVC2irFzlx9lfeRwQDJqa0HVZk2NqEBOKx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_01,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 mlxlogscore=921 phishscore=0 mlxscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507220059

The QCS615 platform is based on the SM6150 SoC. Since the DP hardware is
shared with SM6150, the compatible string qcom,sm6150-dp is used to
represent the DP controller on QCS615.

Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index 9923b065323bbab99de5079b674a0317f3074373..996d0132e084d401db85014a1a4e445d00d62ed8 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -27,6 +27,7 @@ properties:
           - qcom,sc8280xp-dp
           - qcom,sc8280xp-edp
           - qcom,sdm845-dp
+          - qcom,sm6150-dp
           - qcom,sm8350-dp
           - qcom,sm8650-dp
       - items:

-- 
2.34.1


