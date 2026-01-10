Return-Path: <linux-arm-msm+bounces-88372-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 81448D0DC0D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Jan 2026 20:42:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6018B30A88BB
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Jan 2026 19:38:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EA702E0B5C;
	Sat, 10 Jan 2026 19:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c1V10UK/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Tv7+TlzQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A70A299949
	for <linux-arm-msm@vger.kernel.org>; Sat, 10 Jan 2026 19:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768073897; cv=none; b=lhUEpl6ehr8cep3MiXtJoJUhnLPDF5jh9Pk+3ikuvx7RKXB0li4U9Lo7l5GscCZx07SRIdBeyrANKbYt4lKJxzjvQE7nWbS084KYiTYKNaY3bvtEZlKqeQwM0ILBJ2JtrNyXjIj4OycqkV6I/xvfmsxyydWE/Gt+NdKa0uiNnS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768073897; c=relaxed/simple;
	bh=JslXq2UN0h55ZGQKK6W5GartLCm1dfjuGB41CNjkyvM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jp71x7HFd62dkn5LXyPlM2Jl8G8bhYgtP0xE0uvvWbZDtoMP04rJmXu71FT7o8vO6h/GpvCkIeVTJ0CSKxthcJxuGk0wipzC8m8Zy0/puGOCoEJyYFS9Nrz87PUhgVwInCuryTqGBgn53sl3cN+QtdvmrvHf9/lDt/qDqMTrSdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c1V10UK/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Tv7+TlzQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60A6dlr73555395
	for <linux-arm-msm@vger.kernel.org>; Sat, 10 Jan 2026 19:38:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WX+tpGOx/XtA3egSToWa4xfPKV46G8xjtDhhWctRh90=; b=c1V10UK/4Z7EOUEL
	VubWdwbGMKEsMipAXSUStR+oQKY7IVA5K9MHTFKF8s/1oZ9ZEoTpGrebj7LiAdqZ
	gDkbpBDZcfjFKnBFuRgXkuE7uzQ2/maSo/pFN+hI1onRY9wNjyk1fxvTWQG/iD3Q
	RNX0wCtUMJPaMZF4kqdB+DDROPlCPQnxALABJrZg5DpvxBmEIgQe4cIz+fe45K/H
	wsbxGo82Phzgo0vb1VnYW84uVP9650YV2R0dC53O0iDTOQL2LyXwYPXPJtKqoNUt
	LTj+9VCS3qLTVLPR5C6Maafl8hlM8fXK9XSK7HYfpwkTYYbpQkr1vrzBdfL7kAiq
	8Niplw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkfhah3sj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 10 Jan 2026 19:38:13 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-88a3a4af701so141013886d6.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 10 Jan 2026 11:38:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768073892; x=1768678692; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WX+tpGOx/XtA3egSToWa4xfPKV46G8xjtDhhWctRh90=;
        b=Tv7+TlzQZjlUAtUI+ECysb9xTIpowXmvNqEFuYvZOC5vICEbZr2HJIswd1uKYYKpKG
         nFiTOlbUZ4oNu9eNDFh2mIai9DW1KVGLliisT90mSVf5wYzPqHyO9dip6xIW3OPPhuf8
         22RruYZ8Uy+RNT0BZnatenkXKtEzIIQVlZ/46+4zQWnkvKPXHZ+34HQEWWOsrpRGhSoQ
         TZyRK5czjqiMVYjwqLIjFqnLhJl/Mis3qJldlOLqL/wZX7y+vEKoWFuYbU7AeFcESpr9
         UDx/9I+LiQNjYitiuny7YJ/WNyGTi2MRD6a+8Orh7jZAizWqEedjrLphwxZIv9O35Ov/
         qlDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768073892; x=1768678692;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WX+tpGOx/XtA3egSToWa4xfPKV46G8xjtDhhWctRh90=;
        b=Zvv8QofoiDakiGgSxgjFrtugAybjOx/9nq0wUgsiCBaCHT6tPMV+Sre9ekyTtJlQOH
         sBtLmbVg6ODD/DPNsmu0e20tVq5WYXm+hP+S9Q8LMHiKQ1C9S/aFe3jJCGRO54kb+/Cw
         JEJJ8UdgQl0ZlFali/77RKaR/FlYmyGww1xExbnsk/KURd79KoRs/h8vjnJw2qQqhfq+
         5IytCICZS1LMbLIARbm25qbvacY6OAKHmdsSgBpQ5Ys6yuiBW2FxxAlqRuHQcWVzjmv4
         T1j/i+O3z9VUAX/Gkvz72nF27+qZUuKMBfKSjPyhM/Uy1YQeSUW4mXARwqrinxIAg89X
         IGHw==
X-Forwarded-Encrypted: i=1; AJvYcCX70cpWQ8EwFRNnVehLdRdT/EgvIK9tvzAld5ERYg0tYBMW2CMc+35wW7JuYQmxqMa1U3qTdjxF3C3MoGg3@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/fS0CZHz5wcmSmqwOc1Fa7XyEcx74b3WQ/oCVDLjzBmM8C9c6
	RaicqzeU10VyayVEEJhUAycjioZD/4nGDDXXE0x6Fao3UL8wR0mNxfPtGYQsKg4Xeahi2wRVr1K
	sOzVzSrgB+T2hCvPUZfzgDyWtaw5CyCW/9VwKmvVL/q21QqnCgksk3WjSsqgs2/u3mbGv
X-Gm-Gg: AY/fxX6QEQMveLHpvGouZTHU2EEG7xdKhz4L1e8ErRxhIfGXFJHObblIx9vWOhpWU4m
	VfIOfJzTdhZvTIfj8fNSew42ceaBdsF/+tTnd1uTYCmHBahdJ1sH8Zdcfw3G2rfEKhX1YKa/IJi
	onM4VleQowGVXsM3L+0oGUjOhxHiuKDtFiinMUhFmyVkVVtqD8HoE5fR2BggEmSZ2c+KG7tTe65
	bSx43Hohh5lrc0YlxmiRN/u/3xwfW0H4pOgaLEGK1a5tVqlIwFAjPooG0LilS5dWVi6yyznIBo4
	fIuzmNqfF0GdL6agxR69Ytszbz7taoAQbCkLEt2+9ckemRiUbLsUNbEJQFKCTqQzcOVmqaK7Jut
	+tbSSxhz7RMt406IWQlYT1iERuFWwwWWFrO4NiKT39oIcED+auNtW6nenGVW2vba9vKur4mhX4T
	4UE70mPzbJadH0mQHbgElxY5M=
X-Received: by 2002:ad4:5968:0:b0:7e3:cc6e:3c89 with SMTP id 6a1803df08f44-89084270b69mr217618786d6.56.1768073892500;
        Sat, 10 Jan 2026 11:38:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IECeV6PNptdKbFZIIGvq91wxzn+Aus3ciw0GrkSflBtIOmUWwgKzzKf5agxfyj92y7TK4QHFg==
X-Received: by 2002:ad4:5968:0:b0:7e3:cc6e:3c89 with SMTP id 6a1803df08f44-89084270b69mr217618496d6.56.1768073892115;
        Sat, 10 Jan 2026 11:38:12 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b65d0f6absm3539700e87.42.2026.01.10.11.38.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Jan 2026 11:38:11 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 10 Jan 2026 21:38:02 +0200
Subject: [PATCH 10/11] drm/msm/mdss: use new helper to set min_acc length
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260110-iris-ubwc-v1-10-dd70494dcd7b@oss.qualcomm.com>
References: <20260110-iris-ubwc-v1-0-dd70494dcd7b@oss.qualcomm.com>
In-Reply-To: <20260110-iris-ubwc-v1-0-dd70494dcd7b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1301;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=JslXq2UN0h55ZGQKK6W5GartLCm1dfjuGB41CNjkyvM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpYqqUNvcF+p8D3B3QRC8FSeYNjnIpYwnquqU/d
 9hcYY8M45eJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaWKqlAAKCRCLPIo+Aiko
 1SZfB/9ZRCI45bpqc/DRBI659ZGLEIRrafmzdVFMrFYbxdM09ocXLYE6qaempIc6CfhkqVsz63h
 M8N9L0NnAADdAbLKM/cb2NF5wV+ZYT6hO84trAB3IeziCx64FjWpU/xbdTZQZYmCpFD9doXruqV
 akdyqY9fQ2BPYpAdqu3vmDV7EmUcVABo5ki8FLdI4o/eCbpvFrm8MRA9yddaE8weXm1o2Vk98/N
 aDZ4zQHoq+le9fRJ8254bJKU2Pq2yhqBrnXz3OsyPaRr2I54yVXTfSRzCcUw3LzTsDNIJWK7j7y
 UxsDTmxpaOgAXIw7+9kNFJBaW6tgdzayNJ/hF1XZ+63weYoN
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: fptIcw7F29yz6ScJjvXGD0dfUTYSplou
X-Authority-Analysis: v=2.4 cv=bOEb4f+Z c=1 sm=1 tr=0 ts=6962aaa5 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=F1F9tmq6QbaLjm51Hh4A:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: fptIcw7F29yz6ScJjvXGD0dfUTYSplou
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEwMDE3MyBTYWx0ZWRfX7lU5BePjSGs9
 eWUQ9K9a1r1jzph0Rhcz5tOEKlGj5Y8j+L0j5CJRi2ZgbCLDKGRzW6jOahPHTJHPSrnOl7yE+Nw
 KvlMVrVNpMB6cimF/EJryHxbEuPPQ/Ob48eykN5u0ROr+kD7bGUaympcN/VA1bPbeZ0MKhVB0Yl
 lD1rfFIP2EAepxPXnYPuuhH95hmhlsfUVn8yz0pRzkZ4dI8aAx9vpsbjplCN7LZDeS+v7UJGZN+
 6nvodgCOcO+jBz6ytEUsczV3rtj+kethgzeKuAjIu4tV87V/4NR/cwsDNHHhLkKTi727K3ovWiJ
 qqKZsSTXN3pUFg9KBJgBvALSNV6XnCBsrJHLVL9BaLsR4Z9FQsOteW+CreIvZEaKi5QrG6b4mwS
 rP3lKk2X6kCKG7O/Ptc8oZRDqvTQF7orWpAECojTrkVlkNHEFPzMKF0S+ON3uXtPFGZ4s2dSj3l
 K0k8YOXggw2GKkk1uAQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-10_06,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 impostorscore=0 adultscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601100173

Use freshly defined helper instead of hardcoding the checks in the
driver.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_mdss.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index bf9a33e925ac..da266753df69 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -175,8 +175,7 @@ static void msm_mdss_setup_ubwc_dec_20(struct msm_mdss *msm_mdss)
 	if (data->ubwc_bank_spread)
 		value |= MDSS_UBWC_STATIC_UBWC_BANK_SPREAD;
 
-	if (data->ubwc_enc_version == UBWC_1_0)
-		value |= MDSS_UBWC_STATIC_UBWC_MIN_ACC_LEN(1);
+	value |= MDSS_UBWC_STATIC_UBWC_MIN_ACC_LEN(qcom_ubwc_min_acc_length_64b(data));
 
 	writel_relaxed(value, msm_mdss->mmio + REG_MDSS_UBWC_STATIC);
 }
@@ -193,8 +192,7 @@ static void msm_mdss_setup_ubwc_dec_30(struct msm_mdss *msm_mdss)
 	if (data->ubwc_enc_version == UBWC_3_0)
 		value |= MDSS_UBWC_STATIC_UBWC_AMSBC;
 
-	if (data->ubwc_enc_version == UBWC_1_0)
-		value |= MDSS_UBWC_STATIC_UBWC_MIN_ACC_LEN(1);
+	value |= MDSS_UBWC_STATIC_UBWC_MIN_ACC_LEN(qcom_ubwc_min_acc_length_64b(data));
 
 	writel_relaxed(value, msm_mdss->mmio + REG_MDSS_UBWC_STATIC);
 }

-- 
2.47.3


