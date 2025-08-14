Return-Path: <linux-arm-msm+bounces-69122-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3828B25D0D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 09:22:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 466075A342A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 07:22:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 185E7264F85;
	Thu, 14 Aug 2025 07:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AWiPrWap"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3CE323A9BE
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 07:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755156148; cv=none; b=r8jARck82zzkjnj9DcTpOqfouS8h90eZf4J2FtZn69bteDVvIbbwOCefvJLVCS/1zka3V9exnojGZePgrIBbSwkvDHM57e4Ww+7S1UPHuAZI+h3MHth30bRzJI/xGxJp0c/kcPV84XI/aulYuXzDcEy6QpbZEhJB+DvSfxoKG9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755156148; c=relaxed/simple;
	bh=Xb0ChfIllunQ9/noWHgHerT0uL82KmjGEGaefQ+BHJw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ZmMcWNRPbwOqEt5ry53FJYPDUljLebUgnL23/ECD+ZWtXxTKNasFdcsCuu0bnM+silwi/NlSUJHOBPyfFNTo824vAUZzvIsldP+BC1SjwY2jxLQR4Be4s0qDAjY0mc7gPEwwyLnlxacMQxLe+7ycArMHCzYppBfu89R5Z9juAOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AWiPrWap; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57DMYkjk025691
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 07:22:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=MnT1zdkBq5Ly/+u/Ng12sc
	+/8iUYbKTBTdeRJ7Coetw=; b=AWiPrWaps+f0CqdkqCfWGramuh7shykOv78hV5
	sOlZaMgbPOVJBysPN9DZUXguz1vWwJiVIlSnbGVNj0BybQK9hbYjL/YReqZFgHPO
	r/v7OP8UPPRA5YkjIEBu4JHUg6wfpVUglaFeQFfrWCVYIBfwqgKgmPzIW16QSDdj
	58FnmHZ8nROJtDEloOFpu+mh+lllmuTZKuO6IHY7WsOL89I4xsJ9Z2764g0EKD+m
	Fr40r/lukj+pC6cODGNXYCuT7pN4+BKouZI3Vv17jqlKLEJ4tdsn0UgyseCSUUvS
	gzr9cZgCqB3v5oTd2zLQoJ9BWndytKRZfu3ya7fXCWl32w2g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dy3gep3j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 07:22:26 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b109912a9cso30152691cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 00:22:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755156144; x=1755760944;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MnT1zdkBq5Ly/+u/Ng12sc+/8iUYbKTBTdeRJ7Coetw=;
        b=H9IJ8yuEcTk772ODmMCNSIdtuLrogyxy1RW6kQ5K+OmHxEVGCxY85rs0WbdJertcdD
         +I2JFAd6rLxANarEogbeE1LnvOdgPiNb/aw9qjI98cg2fcZ+bozdqG5Cq14UwMrkdnCm
         sllIO4x/IlKDzGlO1J4vNIAxWeSgtSieSWRRn7f4iFIKBD407s24z4cruxOBHENTAhC3
         +1BCX6gRBIUJsojXRyLeXLibgc5aYkIXtKn8lYQHobtxDOwcBxcq2IayjBac0PnaVkI5
         Ws4FnRpBDKyYDnkuykTooi4qT41e5TvJP7K1xxIB2zQ1z75yizoPu9DzdYrMYQTNjJcc
         WeoA==
X-Forwarded-Encrypted: i=1; AJvYcCXyeAb1Yv64fNO1rsqTYr0yXd9QZTcfIYjRlhtoWRl5NN+zU2dAW/iS0xoRPs74JqhYu32dDvQJNvac4nnE@vger.kernel.org
X-Gm-Message-State: AOJu0Yznel5+kQMrU+pH5xVYT4oNeA2FmAyy5vVj+UMtTBSqSbJdIEjA
	sPSCQABQjmUwPDFd4V1pEA5HSM9BxHZq0Pg0fNQFunR2tKOgVqSOeK1fg5Ar1vtkYEr9v1Ueiwp
	ygu8kCNgbGMtjZQguNyyv0z6ra2WPE8x3R1khvIw1vB8AYj5MspvLV1XxWV5yH39UDSDOcXAMNb
	dt0D0=
X-Gm-Gg: ASbGncuIoxUjr4qruNiZ+sgE20GAINA8Sk+oCqw6xhk9JmFfyXP3bJtl749pVfNjOzl
	QS11rstNw6lBQ4pyGRzaV/Ra6nYcQemdaItZxeOGk6pYFFK2O0/h84dwpKMzNowONhbaVGtk6Od
	fEeFUuif+OZ6HShBbDT7C2Ri9jhqAFSXhBimc40atFnLmCLhtIXWLBWG/2/TTZdruDhA83nELcB
	qVxRnrSe8idyvOAlzFoyCB6cfck4b4Bm/g9YWj45BIADe290Nh64O/G0Jb8C3L84AzmEvoqEnrz
	dcu5sE56V9dh6B2RkbAwC1brqJXN8pggoJ5hntD14MYXmWG0NBliemDerMLXzcVu44nwI1oDFUk
	cXmGSe8k2QCDnXR9vnioCP++D4ol/8gKxn+9W05LB64z5RXgY5Nps
X-Received: by 2002:a05:622a:a07:b0:4b0:7b0a:2a48 with SMTP id d75a77b69052e-4b10ab22239mr29514931cf.56.1755156144439;
        Thu, 14 Aug 2025 00:22:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHb3VwlSaDZILHus8O8KVQpaUO65K8gcN15rQT2Aok46dv65U3XR+AaISmMxzu0iFe1TWgqcg==
X-Received: by 2002:a05:622a:a07:b0:4b0:7b0a:2a48 with SMTP id d75a77b69052e-4b10ab22239mr29514731cf.56.1755156143950;
        Thu, 14 Aug 2025 00:22:23 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b8898bde5sm5648258e87.3.2025.08.14.00.22.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 00:22:23 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 0/4] soc: qcom: ubwc: more fixes and missing platforms
Date: Thu, 14 Aug 2025 10:22:19 +0300
Message-Id: <20250814-more-ubwc-v1-0-d520f298220d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKuOnWgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDC0MT3dz8olTd0qTyZN0UU7NUk6Tk5GQj4xQloPqCotS0zAqwWdGxtbU
 A8tNKmVsAAAA=
X-Change-ID: 20250814-more-ubwc-d56e4bccc23d
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=947;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Xb0ChfIllunQ9/noWHgHerT0uL82KmjGEGaefQ+BHJw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBonY6uMeIzm1lyX9BWlQIfQdv5CbDOChdnHncIG
 HQlQH09WHmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaJ2OrgAKCRCLPIo+Aiko
 1bjaB/9DTi3kETUeajlqCnkurREx7K7Qm1orGwfmzZQpdAhKtOPSO0YQ7Y7p/NQHdMzfmBUpKrI
 lAD67KyTJVLeDTJ1TTH+UoW3FnMmc8pHdwFno+6l7V1iZexOeRV1cQKE77+PsQqTEuedcb8JyG8
 D1ph8klHW1ba5c2TblPSxwvgPhhqdqG58gkgfl//JsfG0Z/sMEP14S+0GTv8m6IDkUDdlwsy0H/
 HDrto+zjK87cFKg1Ln2v0XvJACe6CZ8HoD6vAQjuxnZhfyEDyNc/stEIsr98J/LXHeHqyfFXo1r
 h+zuoASLIicwiJVSuZizyxnXGcIwu09hMoNOi5Jk8X4F1nYz
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=X4lSKHTe c=1 sm=1 tr=0 ts=689d8eb2 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=KpN9Cobk0z5BVES1_GMA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAzMSBTYWx0ZWRfX6Im0jmXvFAoe
 5acaFtkCmOYT1BIZLF2bkc/b9L2EiclNNLzU5TFYLqQeoU3B4s7DWQ8J4+OCw8E94JcLY12kiNU
 EXKjYYiL3dL97zv01CUmfJJcwXSRtLT+bz5FJq59cl7ZbPPtLxeNxYCGyH4WfvP3fnV0iuUxPTh
 SCRunTXliHwMGZaIaV3vlf2c9+rv6B9++bhxFzlizB9WMeceWb/zHp5KOZo8iCUWq9J0bleh4OP
 tMRqiv5HtowoBS1tvBweKYpo1YQVGKccOD+ono1VutNhOXDpVAyDQHcDY9NYtjPJMXOKU1oFMDb
 7ugyaFT7iu4OsApZLa2uA1KgbC5RNQpaFifTxDyOPlIQG1pbfQGbSRJtCQ7xH3KNnBNdPn2Rxw7
 XUW35Xzt
X-Proofpoint-GUID: 46f1eT4LLb6se-cdhgg9MjxgLwsU4F-6
X-Proofpoint-ORIG-GUID: 46f1eT4LLb6se-cdhgg9MjxgLwsU4F-6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 adultscore=0
 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090031

Add missing configuration for several platforms and correct
configuration for several other platforms.

Note: I'm not sure how to handle MSM8956/76 platforms. MDSS definitely
doesn't have UBWC support. This doesn't provide a threat for now (as
MDP5 driver doesn't provide UBWC support), but if we were to switch
these platforms to the DPU driver, we might need to filter them out.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Dmitry Baryshkov (4):
      soc: qcom: ubwc: use no-uwbc config for MSM8917
      soc: qcom: ubwc: add more missing platforms
      soc: qcom: add configuration for MSM8929
      soc: qcom: use no-UBWC config for MSM8956/76

 drivers/soc/qcom/ubwc_config.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)
---
base-commit: 0b6974bb4134ca6396752a0b122026b41300592f
change-id: 20250814-more-ubwc-d56e4bccc23d

Best regards,
-- 
With best wishes
Dmitry


