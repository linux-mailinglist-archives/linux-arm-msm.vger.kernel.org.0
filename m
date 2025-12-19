Return-Path: <linux-arm-msm+bounces-85815-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 73310CCF48E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 11:09:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 39DBD3043806
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 10:08:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE2092ECD1B;
	Fri, 19 Dec 2025 10:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hYg3U4+I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AzC+Hk6u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82F702E229F
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 10:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766138914; cv=none; b=AIUAE0Au7hXvnKci/EgEc07G35/2DoLwy0WVSlkoQmr36z/LehHSiEL88twgV0TMKR8A9vCT5I1MR6ZZuVn+0IbKcxZLUPRsU0g7Pc4wmUk+fPOuHiMRjEu+NUuuH532JU1hzHjYd3+zCDxNW/rxu+poOnOfXrrUkYsLKz2ZVIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766138914; c=relaxed/simple;
	bh=DOOaGvO4aATm/FIZvF6KzTxzN+v3ZrLfCE66Wvpw1V8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gCg98YnOELKOTzAL8VDmMUH4PRvaVBbdN7eOZps9aFGB38ZryaZj+Xb2/K1UeOQ/WSk5Ovzt9FkH74RKKZhPHLw4UWjeOr+EOwih3BMqMtJYuXhvfP6bZrIBApgYyzXG1JDUf/VY84cmtBw+xzjIUo2iyVXe31VefqvXsUpd62Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hYg3U4+I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AzC+Hk6u; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJ4cJSE3700758
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 10:08:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IFjLzdXS7WFARFCvGYmEmxcoIhULzoVNQ1ypX49ZyX0=; b=hYg3U4+IPM2FZJwq
	zRbjJ1sL9qTa6t7bpNClH1+XaEcV6OauF9SzPKRKusWgLZQ1K9auSfxt5R8GsUzf
	6Sy5bvSLL+hn2x1INGuzMjdAXfDq5PqFEdfbgO0s4I040MSguV0ed6Pv0aohTYrv
	lX+osfdDr5xVTZ0m3T3YCU+quqveYXBnpyPqRbAdjfVc7DDF91gMkVcDOzi+lUqV
	Vl+D7GmaoFeN75FqKjLCR3TycKMxsbk1jQsL4HYA7nyDbNLO0B9qEEtH5BqP55/a
	3GSUdTOhURb/adaNps5ovvVRKuQKL6EG8RQmGd9LkuY8W2NqcncIGHU2Sz/cym0o
	kmSLOw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2ej6xr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 10:08:30 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4edad69b4e8so32955891cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 02:08:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766138910; x=1766743710; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IFjLzdXS7WFARFCvGYmEmxcoIhULzoVNQ1ypX49ZyX0=;
        b=AzC+Hk6uG4GuOWOoO7lFYg5AoEvEGYd5/sES23/DZxbq9eR/cZSDx7VQVIgVnE87uY
         SJ2lBU1/3enLz/YOJaXcMmqq4XLz0BwAk9oJcj0RrZYcf+5COFdY7Dy+di4CN1yn50oD
         4m9ddMSvz8WLYuhZd32CzCU53eYxn0QQJzet9dPXfeLkwqO5hKL/TMRYPn7aodRVucJO
         /DTXTe60SmNtNoR0KyWGyCsoa8M5QHh/UYE+rusP5deyH/zCooZQH9G6vW11y87A/cgy
         dz57or7bnvuce8ub+JBPI0qxFr4eK/oV8iJtUvcEwj0VQM7oIqen8Sl+Ocjx2hbL83xJ
         3Ibg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766138910; x=1766743710;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IFjLzdXS7WFARFCvGYmEmxcoIhULzoVNQ1ypX49ZyX0=;
        b=W6zmChvJH8HzqWCaszHDxnVKFOtW0ByJQYp1CKObiBlmgXBhXoZaj62hNRfiHCIZPH
         d6h7bgmuJOLWFXzm2YhufMGBP0dMzZkM/eZ1BGRs9CXlTn97Mlwknvf95DpsDfXaBC0c
         6GiogteL3JGVltw9k2TsEvh9odBlHVDZhhRuiEhEzm1tDSHVFI6Km+eXNEQOXuLe+URE
         aVnTAkv2Uv3Z0UOesYtO5F323gRt6esO7AHNBImFriXd+pORcjGCJ4ywQiSRwEfh4TVH
         9/KMVmlwRmnAP3JoUEqnuiceUSoZrx4rHaJgv3PooGxKXp/6zzQRYN/vr1kF55Ax28V6
         CDdA==
X-Forwarded-Encrypted: i=1; AJvYcCX30z598DOIir8sLXv2fkyE73AIebfCYTSifC89K0n1pCcpVsXA6oStjgbybFUHP951NhKZOue1fNjuNJNR@vger.kernel.org
X-Gm-Message-State: AOJu0YxuS8/176/LkJHjZKck2ARL2TP8nHGxBW5ESvnmdSerS1ehQYNA
	7APDfV3rwg71YGxsEwYISElzE7CUjwUwqcn9eu8fsOAOvvcLV0w3w+Sj2NzLwRNvOk2FZE9cY5m
	tT0Z8aooXeqsSNQdnbn/XO7hoSEMM6ZdGYcbMT7SsmC8GGbW/q12AvV6lnVzfsHcEBKxI
X-Gm-Gg: AY/fxX6otZo5/0AqfBX0AEd6qcZhiqOWtSSW4sRHFn5DGRWH+1Jfb5fQC68AoBRdERx
	dq+lcxnuIyeZt4Ixtuyd6UP0JckBYkIZS4tdMI0VORJd7oRsGvJLalI1vnirStTFl92myGIBKG/
	FiofQSZWx6WS8glBL4nRe60nDhEJ+si29GYbui5N4FlS9CLmkCKkZ9A3qu5nGE9FR5dRaInPhsx
	wc50Y31saGMIav6u0j+mjou6e8q64YycmGmUv27PYFWEa6KGYKZyRWVNrOawfQmoV6XjO3bqCFo
	+vc1kzO/r3GzBdt4AUxYWWodSzBvKTkyTMbU6o5RQugniNqBNhFoCgPD/PpXpEgpO6ISHkbc9yi
	O+ag4iyZNrO6O5wB3QTDGzsw4Hns1w+YmOhZ8WA==
X-Received: by 2002:ac8:7dc6:0:b0:4f1:8412:46e2 with SMTP id d75a77b69052e-4f35f45578bmr97165341cf.29.1766138910014;
        Fri, 19 Dec 2025 02:08:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHc8+g1QsJHtXxcUo099R0j4nSIa2xzIfiFZTkXGHWGmooPljDcI3xhv7ZIU8YcjS+Wh1RWlw==
X-Received: by 2002:ac8:7dc6:0:b0:4f1:8412:46e2 with SMTP id d75a77b69052e-4f35f45578bmr97165091cf.29.1766138909640;
        Fri, 19 Dec 2025 02:08:29 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:a48:678b:dad2:b2eb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea82f6asm4209571f8f.27.2025.12.19.02.08.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 02:08:29 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 11:07:42 +0100
Subject: [PATCH v10 03/12] dmaengine: qcom: bam_dma: Add bam_pipe_lock flag
 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251219-qcom-qce-cmd-descr-v10-3-ff7e4bf7dad4@oss.qualcomm.com>
References: <20251219-qcom-qce-cmd-descr-v10-0-ff7e4bf7dad4@oss.qualcomm.com>
In-Reply-To: <20251219-qcom-qce-cmd-descr-v10-0-ff7e4bf7dad4@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Udit Tiwari <quic_utiwari@quicinc.com>,
        Daniel Perez-Zoghbi <dperezzo@quicinc.com>,
        Md Sadre Alam <mdalam@qti.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        Michal Simek <michal.simek@amd.com>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1407;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=yhm3Q7whQ9gDjS2DZY31DGTD5RR1FJpqK58rV1DDyQw=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpRSQPpJf506/e9fSbiImN4c89jPXJ48F6G2GRI
 dB/Id6WGWSJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUUkDwAKCRAFnS7L/zaE
 w7MvEACyVqsMPwz28FGKEH9CvUi6ZkY9Yu8a0NxKlhP5b0YL6qU1x9graqHiWz2fZW48IMAXk42
 JVPjkCZ6PHSDsiLSouOWe2aBcAsuj+s0eR+gfH0q7yMskiDbViPS+QN0CyO4B2oGf593SQB4UMw
 C6W58b/LyPtmPWPsBxOAHiKb+ZLc1vruZruGXeI84LMM0nuUStxsq+OmlYP0cOb3dFSmUOHK1Ey
 LOjPYUihDfhm8Xn9SL0rPBAQV5wa7RYPjsJxm5DZzkOdlVMpCj2dnyqZ7z2ZNBXjzoHe7o34vZv
 r8o4Exd+5NePMqYwPH03k9sbI4fm/f/n+BQhndYnnHqMZdRHtdMIx8DR/ijE3HSSQ4wTXOWMwc5
 yzfkHqNQvxdGIDf6H6/0b/G9EI/iuTDqR92JCvCsDiMA6Pwjuc5q58itf4Br/BEVIj0N/65N3js
 2dT8olKkLHBgYT4Dhw416DvF/Eopo0OIvF5vHARrLIGP5yoHdZcXpAsTfiSpNtGDpL20bKDiQZN
 tG4GC8WlpWjMzyQlY7wxNp6NfdnbNq4pU3I8Ow3cM8ktZZnNd14bPn0MV+0Hz38h5eTOIQiE8S1
 uLM/vfjvJEmUGNYcR7MM6jHs7DG/UmUlp7Rizrjr0IuGZ499a0qlsV9PNmUBozE8gf9SUBdyWSx
 P26gJNzJ3j0gnRQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: NIvHUdNeAKxa0ppRCLS_HfvR3nbptAsa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDA4MyBTYWx0ZWRfXz6IJ+wck5Jyc
 H4xLS19mGrhxo5bSaTYOkM7wG0p6vcxKpNSwqIFgmb1041rCEmWu/xjzUv8kNfj0cCAmvxHJfTG
 utu2JvU/ba1G7DFYWSiItT97XgZQR8jXAKn8klTAF6nfWVi05rbFnWe5w3EjUpQ0Z4jJdKkD8+R
 iCSmO7BRcIF1ISfeXMIv8GXWJk38+v/rGwQuJKpXHXV5OhLTssJNd8y8pGqzb9ovFVyPr7S6PuA
 LIxKPmDX2yz9WLn828d++t51zvMVy5U5pJjM1b98Zrz34h01sIEnA8HlW4h+2QnuYqTaB9NvhKs
 wXT9o4xIMkCAT/4rf7+c7B3X2zEvzjG9IBkYdVUMeOGsj24Iy/pxDyWaJYvXL7a+g2Yfa5fGC6q
 +I9PijoKeWPWk90inS+gc5NsjwxwDPgC3aVTsrGX98a3zcc4fOMY81meaG8xneIm8JREEm1uFL9
 8dbWnh6euBkfLHqOl/w==
X-Proofpoint-ORIG-GUID: NIvHUdNeAKxa0ppRCLS_HfvR3nbptAsa
X-Authority-Analysis: v=2.4 cv=EabFgfmC c=1 sm=1 tr=0 ts=6945241e cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=ZSnkYuKn9ZpO9KHknGoA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_03,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190083

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Extend the device match data with a flag indicating whether the IP
supports the BAM lock/unlock feature. Set it to true on BAM IP versions
1.4.0 and above.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/dma/qcom/bam_dma.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
index 6f78e6b1674a0ff3deef4c3d1892a978555b3807..0ce9153da67032dc8ce910f68d1f80019d8b29f4 100644
--- a/drivers/dma/qcom/bam_dma.c
+++ b/drivers/dma/qcom/bam_dma.c
@@ -114,6 +114,7 @@ struct reg_offset_data {
 
 struct bam_device_data {
 	const struct reg_offset_data *reg_info;
+	bool bam_pipe_lock;
 };
 
 static const struct reg_offset_data bam_v1_3_reg_info[] = {
@@ -180,6 +181,7 @@ static const struct reg_offset_data bam_v1_4_reg_info[] = {
 
 static const struct bam_device_data bam_v1_4_data = {
 	.reg_info = bam_v1_4_reg_info,
+	.bam_pipe_lock = true,
 };
 
 static const struct reg_offset_data bam_v1_7_reg_info[] = {
@@ -213,6 +215,7 @@ static const struct reg_offset_data bam_v1_7_reg_info[] = {
 
 static const struct bam_device_data bam_v1_7_data = {
 	.reg_info = bam_v1_7_reg_info,
+	.bam_pipe_lock = true,
 };
 
 /* BAM CTRL */

-- 
2.47.3


