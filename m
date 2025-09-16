Return-Path: <linux-arm-msm+bounces-73736-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B63FB59B52
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 17:05:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BB9EA16BA12
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 15:01:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B3E635A28A;
	Tue, 16 Sep 2025 15:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MnTqs0m0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D23B834A33B
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 15:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758034819; cv=none; b=e5WDBdhcQz+k95Kks/1M4aincY/fgrdhjBk1pB+Y+yt9j9nvwsaif1Xy/uXDrTr0HzKMtGQpze+RhQAffYwauoAybXnqreZxEDY0QA0EZ26aaBFejjB2aYq6ErOv/1TqAfqmt13O5IN/XYeBwteXFhmitar0iPG38T4D4Uc9EYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758034819; c=relaxed/simple;
	bh=VITe518dJvceZYXI5Zs5G2EbxFecKGbskjkdUpE+OBE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R9wX6Cg4+WrXCCf8M+9GRqqQ4IVxuwaAwGmij7TC6mAzsn/KBxsNkXlJO1xdub5rG2X7hpx7gq+zFHvPQBz6sVwvgw6PpvLUwTn2JnRV0RqH3kXW6XmpQcdfDtnUpKc1mbP13XrA52MIhbtD67MW233o5jAwSYcnG/rSxdW1OVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MnTqs0m0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58GA2oQR005547
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 15:00:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B8o0rUX3vuCCRx+XIt3VRsCZEuZbtOTNGliDlDNmyC8=; b=MnTqs0m0BQFkF5uo
	i9LaohX20Vl8eMhtydS4Y8FPYJhLqReF1+E8l1lYLYf+tCGVg0KZrXDWlXs6sDsR
	1hMDou8T0H0I1KAnrn4XJs5sgBOzFqImfV3R7U0Al2Ca+z7UaoxpdXTti4A6ZAbB
	s6GlxwOZnzmrr0kyfE8dKIb50859LFiC1cUTczjLjt/W7tFun+TgZdbeNb+nSZpG
	AZbtBCXjN4IxCNgqZk1D4Igq335tJ9HVTwyWW2EQfSqOECPhFr2WPlfi453KRhMt
	JCXKOpg3A+Y9ZsCeN3Zuh5DnMOYdtB3HglZPRwkXOHZ+eC0PpTS9WOSkB0zV58PO
	/uIjQg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4950u596a2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 15:00:17 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-244581953b8so65255565ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 08:00:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758034816; x=1758639616;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B8o0rUX3vuCCRx+XIt3VRsCZEuZbtOTNGliDlDNmyC8=;
        b=cSeM153bV9PYcJ/qHPbg7E2+EuSvF+2RerfotOWjf5a2H0v1x0VzUx98QVBmwEGQAr
         QUww/2gcp4jK73QJnl9e3tFrp65JT+r5zYvHigcbpGzUQp51iUgx5HB9Y2+LSXIhEORl
         r3FCoGQhL3IdX0m85FV24GbivwEgir+zp+jRJWfI4i0eS1WBRR/mHjVwt7DZ3qTaxRb8
         pZ+JOdOMEYsyBy1J2imaMUohcLNPJDdnTfNZWTDEgHwQ9vLjGrT4/olpQb7IxpjAPvHJ
         5I3hh/cxJUnag8jONNFz4Uw20rUqoHuQ8fS1wW6asGFvLIuMk+ZmDhPWD1a6NLeNUQFN
         5Nmg==
X-Forwarded-Encrypted: i=1; AJvYcCX5iAk8u+JkHlmkYAFO+EdO4QDnRmb/Wzd6d/GgnAfyzKuzmERfuE32/EubuACxrj784vUJ6Ss30eeBhTPc@vger.kernel.org
X-Gm-Message-State: AOJu0YzGfq9yY3No71YLD5wHogsf9YF0oCnBYJiCRoHBIVCwUYCVG8kW
	QYkLCVzdjXEMEqrnSRi7hT4P64GZvqbdbFH+2UdE9E3S4DvTTPpoTnfvJDBKfcPOpYbYkmX2IAD
	Cyls+BzyzSIAQ7YrpaJWysahbCVvn+VjeL4jqAss8J69s8C6kOnkXiz0mFxXoD4KG13QJ
X-Gm-Gg: ASbGncs0Wj/2GRpixQDpWRdcO9boIQNUSM/9j4N33Ie+z6nA5/FCfXbKk3midLwLDux
	8A3qCp2GavHfgdbgAWlsggG9vE6gWNN1jhZET+6EzWKtZORudpoSYe8kwtKwMYpivAtUxyEeRPC
	az78V36XrfBMmiA1m4qSbzbAUGeQ0ibDkTeR/9UdoItXOHVJzK/m8QLTvAZ+Yhv2kUF6xvB6TXL
	M39tP9Jmf3HJQUhi8fkRVS3V3b9v93seednVZzqX5TKu149t1e2enCuBaup1xf+SoQB7C9CQNLW
	WgvlMFklRbztOutDDegT7hbw6/tIxwjWpEKhecjY1noHOHO/HVNMJq5aU41gtipD2rTk
X-Received: by 2002:a17:903:2f4e:b0:24a:f7a1:50c6 with SMTP id d9443c01a7336-25d26e474acmr191844165ad.52.1758034815498;
        Tue, 16 Sep 2025 08:00:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFnw+Uwp2QJ+pgYTFNW0n9rgW10ooTfi2mixtIM9GmU1l5WTOC9wSvj9pEC52bbnXIrfCo21A==
X-Received: by 2002:a17:903:2f4e:b0:24a:f7a1:50c6 with SMTP id d9443c01a7336-25d26e474acmr191843395ad.52.1758034814786;
        Tue, 16 Sep 2025 08:00:14 -0700 (PDT)
Received: from hu-wasimn-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2651d2df15esm74232615ad.45.2025.09.16.08.00.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 08:00:14 -0700 (PDT)
From: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
Date: Tue, 16 Sep 2025 20:29:29 +0530
Subject: [PATCH v6 07/10] arm64: dts: qcom: lemans-evk: Enable Iris video
 codec support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250916-lemans-evk-bu-v6-7-62e6a9018df4@oss.qualcomm.com>
References: <20250916-lemans-evk-bu-v6-0-62e6a9018df4@oss.qualcomm.com>
In-Reply-To: <20250916-lemans-evk-bu-v6-0-62e6a9018df4@oss.qualcomm.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc: kernel@oss.qualcomm.com, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        linux-i2c@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Wasim Nazir <wasim.nazir@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-e44bb
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758034770; l=993;
 i=wasim.nazir@oss.qualcomm.com; s=20250807; h=from:subject:message-id;
 bh=NIyml1MlGj+Kf1AvBGjrERl9vMVGWIsWbRk5tvoG0bI=;
 b=enpnufxvvX/x3jsXtCtPfnox8ZuwvUDUthNXJbnpsvbid5A8yO0r4f+UEK3C5tW9XdoCSjANo
 IUqf2MYDo9EA53ORwebFmbPqjriF2gSNjMB2H9CZVDHO6HMHFb8vQ7n
X-Developer-Key: i=wasim.nazir@oss.qualcomm.com; a=ed25519;
 pk=4ymqwKogZUOQnbcvSUHyO19kcEVTLEk3Qc4u795hiZM=
X-Proofpoint-GUID: QB-lfOfAjAF1pQEPs0yNf5rxG-8d8hjT
X-Proofpoint-ORIG-GUID: QB-lfOfAjAF1pQEPs0yNf5rxG-8d8hjT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAzMSBTYWx0ZWRfX1Mx4DBnaacgS
 W2w/mIPjYH1u61gUPyy9hnR9M/arQse/ZQIa9LTkSiy6hK6SN4eXegl47DkB5PU0bJrg4pwzya0
 ADqFxtseSSXoT2qV2Kau56gH3vCTUUEsujXsovJw8JSW4jd2VUMALQSyTKKOUf1UTo32n0VjLz7
 bPwGL/ZPHaWkJD91msoICRk4OR6EYAQleMGTK6RNoecbD5wSkyCQihrfFpFcUTARz0wu/R+YXYw
 FK8KabUxIxGz1jAQqAFJSU+tbXHOsZlk3q5+EcXEzAd+tZSyveI0CZyEW1++VOWOlf5S7TOWAcZ
 I9l1HfBFuGZOZPo0NL3YzWf2c8S7sjFLNA7gcvMELd204Y577E3HhNLaDVYfvrKN2NcUcS8zfOv
 TeKY5zjx
X-Authority-Analysis: v=2.4 cv=JvzxrN4C c=1 sm=1 tr=0 ts=68c97b81 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=5Avgj7R_EIYQh5X_CpQA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 spamscore=0 adultscore=0 malwarescore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509130031

From: Vikash Garodia <quic_vgarodia@quicinc.com>

Enable the Iris video codec accelerator on the Lemans EVK board
and reference the appropriate firmware required for its operation.
This allows hardware-accelerated video encoding and decoding using
the Iris codec engine.

Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index d92c089eff39..5e720074d48f 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -385,6 +385,12 @@ nvmem-layout {
 	};
 };
 
+&iris {
+	firmware-name = "qcom/vpu/vpu30_p4_s6_16mb.mbn";
+
+	status = "okay";
+};
+
 &mdss0 {
 	status = "okay";
 };

-- 
2.51.0


