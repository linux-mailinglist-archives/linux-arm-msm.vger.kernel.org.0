Return-Path: <linux-arm-msm+bounces-79909-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA59DC259F5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 15:41:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A421E3BFA8A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 14:40:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A56A34C9A2;
	Fri, 31 Oct 2025 14:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cl3fuCcq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BUvh9BTT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7022434C821
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 14:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761921646; cv=none; b=Li0EjHqPllFqjSqjd34t4cazmBNwws2oYmF5pmmEQ3WvfOV2nCq2WtK+GctHMWs7GUXwdlaBeSHPekvxKXA9zff3/zytWQ2UHyI8/zMzQc8vBAJeaR3a/xjNgtrnbCpNBV9e5Qo5eGTrJ1BP1bjp9I7K+LQ95goiGCiLI4YsjaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761921646; c=relaxed/simple;
	bh=1WjeL52Ou5NBeKCANEfpX7bxhAFnFSpBFQ1ir5Aps24=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qd33Af4DxEwvVdYKXjgX8F2/GvyXBK3VodjPfNonAgKyB4gb9aVMLOL13eyHZxRQuyVlKskV3+gYn2oKhtcsH6MSrXlGDnXhZwea8aGiX9vbuVUY4kRYH56gTPZ2K17Bzgd3f0yF5i+fI0vQ5USL8mT5C3r61ZqF/xNDQvkJJc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cl3fuCcq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BUvh9BTT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59VDDrIj1827335
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 14:40:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=x6u3aryrAWIuWoxLABamr7dh
	kWuzvuraC8U4rGQdnls=; b=cl3fuCcqncR2Tai7Am7sixA6EAvM1UqEpDf492cq
	CV8LT/JoTCODQ9BvIi5am5bAnuQUDSA5ONGc7P+UbWfs4IBjiYDYt3BEuSGaW/ue
	M6RE+pUc7zSemn9UI68lPt7QusZpo5aXf3vSHgSy6QU2EEmoweCgOtX+u24K7TbA
	cSvWEoCRx32H97SeEzvXwosr4IsL3XJUd3Kd5tw4NUKRjfswjgjGBvvn3A/UogN2
	PBd08b0BXxz9FstY98MQBzXvkeRgLXkwQVDz2N6xCJ6KSK4uyZ6FVyJ8N2P0uD9a
	NEO0FcEnX9dWh1xtQvyuX0wk1O7/ekcXjOTu0XzjPAV6DQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a4p11sk9h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 14:40:43 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8803b5dc9b8so19816956d6.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 07:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761921643; x=1762526443; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=x6u3aryrAWIuWoxLABamr7dhkWuzvuraC8U4rGQdnls=;
        b=BUvh9BTTxYyOVnahEKSCXsN1Y/VgdJzGBiwNjS1FSyRDcwLJztHvwtMF3YS+pprvvY
         fyD24soGnkojZcqi8QIn5yeeBMWBNG5poo0fDmh9CvhJJTqKTWkszclSfNUTi28bwHnd
         tVn8XaYdKajd8ipbW6D8oZ6lqAUNg1EJ8xFy5xZKPRJhZ6e8Fk4hQw/ithJt+3bAgBXY
         on7RssZiLNuc688EYV7GiXb8m3HgsxDbmxQxpa4NpS+SJ50KmskWtGqBOt6jRlHDklW/
         JLp2Iu7TuhvkGfrILmw95ZkLRJvW+3xBKgZuI72OdxmUUZ/q04OxBgtH2E72O2iHAyv0
         WMRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761921643; x=1762526443;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x6u3aryrAWIuWoxLABamr7dhkWuzvuraC8U4rGQdnls=;
        b=jizyUE2GMypg51onevfZoIEPYHLwq7miSVSZtRg5fwYO6qgXG2d3jgIzETK1JTB5Cu
         FJa2y40uhXXvZtJQnbUWU7bNK63wIQUWryNmNHp4tMVmaNeVIMYVlg/+UROW5xSwKt4i
         qS2js2Hr0pGJDmm7uvIJD7xdnNkzvNPLu1EDyTHBHQ9w/xt25YH4rYvckdLoVyGhuHde
         yb9oailly6bKajKcClQezJE2IB/vL3RJDlyby7IxWnXp6hb/sz6iQ3tgIHtQ11QAoLxw
         ozM5L4x3NBjzQGFzCS6Cx6Qsetdg4Q6tuggEuSngMYEGSSd03j+oSJQyBb16aEc8BGD3
         OgMg==
X-Forwarded-Encrypted: i=1; AJvYcCWt1lGNtT05OAJxIRthewrAeCEMQyXUC1qMRpVT2a1f2lNVsePgz6vSdBIzdilabJ+EAWkEUJqMtT0Kblt+@vger.kernel.org
X-Gm-Message-State: AOJu0Yybjj+EWGI309Uvt+bKlm37jcuvDyLo3S3ijzihzDPtsLLc2U2i
	w+9S4LKz4OVxDpUh5QBqoiGtv+dez9XcnOr/mC3qqUe9IWMNHPW1mEN8yiNY5Et88qRrALR8LIO
	ERrakYtDlCM3Z+yVOWak6wjS8Vpu/dQiPVhOVTepaBEVjqJRfYnE5Cj95AQ4k4Xh0K+/e
X-Gm-Gg: ASbGncsrWoRASMbqX2v0pIMpQVM0GCivC84ba7i4ftwNRdKBGoK2oNfIQkj5juFg4GF
	OBSY07O5L86hIJmTBfT5jfUOTyzOLzO7uUMIiouVpmZZjvQjkaONRd892x++/u1E0xR9pLg0IQd
	hIszShoHEQ8pyAF2Rs9eP3SLIyYbNcjRY+EGSrDjDoN0OSalOurGAalZhjCINdYV1raTm6uxyaU
	vbtjDh8gjL3SzfmsJBhYtzANAvYnwZzdgQSydut/l/9qonObkR9xnn/2vZ863WTLmvRNBZpOVyi
	b+UOjsHZkAEB9yhM0zOiuR/QzUuedoEaICFmVaJhAEo045wcFuWDGrVfoGTIWc4bDjKWg+3LTAF
	ImlyUvWLr8yXhyaWWzkxhoY0k9rliyAQnrLA6eEnGzOjsCcpnZ4iiwYEQGhqD5CX/H0wto2DFd3
	RxhZDbsWCX3Dyo
X-Received: by 2002:a05:622a:987:b0:4e8:85e8:801a with SMTP id d75a77b69052e-4ed30f8737fmr49106331cf.40.1761921641975;
        Fri, 31 Oct 2025 07:40:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE2+ettvTm/rlPxr5+QDWURz0RmtxNkaZagWptKT2OOfzSE65n8XvrjFNhfMMIWI1cGq4DZQw==
X-Received: by 2002:a05:622a:987:b0:4e8:85e8:801a with SMTP id d75a77b69052e-4ed30f8737fmr49102621cf.40.1761921641100;
        Fri, 31 Oct 2025 07:40:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5941f5c27a4sm531517e87.106.2025.10.31.07.40.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 07:40:40 -0700 (PDT)
Date: Fri, 31 Oct 2025 16:40:37 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: hrishabh.rajput@oss.qualcomm.com
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 1/2] soc: qcom: smem: Register gunyah watchdog device
Message-ID: <jnm4djtfiimdj52cg6cfm2kki3munecvbq4rilmqwg6be5y2tx@kxtrthcnee33>
References: <20251031-gunyah_watchdog-v4-0-7abb1ee11315@oss.qualcomm.com>
 <20251031-gunyah_watchdog-v4-1-7abb1ee11315@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251031-gunyah_watchdog-v4-1-7abb1ee11315@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: vLn7_8PMd34aJ0kSUDfjcBkeZj45qZ-j
X-Authority-Analysis: v=2.4 cv=RbCdyltv c=1 sm=1 tr=0 ts=6904ca6b cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=kq2FUEKZF3Nr8Tfa17QA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: vLn7_8PMd34aJ0kSUDfjcBkeZj45qZ-j
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDEzMSBTYWx0ZWRfXxqIvNOywmOHe
 0nB0GTv1VpMHA9WWPqLV90RtBwHpGTgEQgTtf55Tv9f1I9kwK5JLU9IJySYDWKOiyOxs6D2dJb7
 WK5LTsD/0GlKEprpQ/oKENVge3AbgYBQZH6mRDc6ssmfSMSXmuKMxjGnz4kcunuEAPZmqONNIkf
 x4rjazA0Hzkq5+WNnCbEcL9VMRg/h2mXvX435J2r2WQA/CBn1V75SLJc2Y/eIX8cRMJg+TddDv1
 A+y13geOHCZ7f1L+2QX/xwc5Ov4BhqLVeAKIEzrKjNMaE74j0C0uBAMtxFjVq7ieOCoxF8rbhdE
 Y7T5JG72YfLurGGRL3pyzBz07cMOUcrsBcErrtHcJR0kMz6ZTgVKXjSQ3T6PMwkWH49xR2xi/19
 ZlVVBBMyC3l1req/KLI+TlhFFo/jxA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-31_04,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510310131

On Fri, Oct 31, 2025 at 10:18:13AM +0000, Hrishabh Rajput via B4 Relay wrote:
> From: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>
> 
> To restrict gunyah watchdog initialization to Qualcomm platforms,
> register the watchdog device in the SMEM driver.
> 
> When Gunyah is not present or Gunyah emulates MMIO-based
> watchdog, we expect Qualcomm watchdog or ARM SBSA watchdog device to be
> present in the devicetree. If none of these device nodes are detected,
> we register the SMC-based Gunyah watchdog device.
> 
> Signed-off-by: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/smem.c | 37 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
> 
> diff --git a/drivers/soc/qcom/smem.c b/drivers/soc/qcom/smem.c
> index cf425930539e..40e4749fab02 100644
> --- a/drivers/soc/qcom/smem.c
> +++ b/drivers/soc/qcom/smem.c
> @@ -1118,6 +1118,34 @@ static int qcom_smem_resolve_mem(struct qcom_smem *smem, const char *name,
>  	return 0;
>  }
>  
> +static int register_gunyah_wdt_device(void)
> +{
> +	struct platform_device *gunyah_wdt_dev;
> +	struct device_node *np;
> +
> +	/*
> +	 * When Gunyah is not present or Gunyah is emulating a memory-mapped
> +	 * watchdog, either of Qualcomm watchdog or ARM SBSA watchdog will be
> +	 * present. Skip initialization of SMC-based Gunyah watchdog if that is
> +	 * the case.
> +	 */

Should this also be limited to the platforms which had the particular
version of Gunyah?

> +	np = of_find_compatible_node(NULL, NULL, "qcom,kpss-wdt");
> +	if (np) {
> +		of_node_put(np);
> +		return 0;
> +	}
> +
> +	np = of_find_compatible_node(NULL, NULL, "arm,sbsa-gwdt");
> +	if (np) {
> +		of_node_put(np);
> +		return 0;
> +	}
> +
> +	gunyah_wdt_dev = platform_device_register_simple("gunyah-wdt", -1,
> +							 NULL, 0);
> +	return PTR_ERR_OR_ZERO(gunyah_wdt_dev);
> +}
> +
>  static int qcom_smem_probe(struct platform_device *pdev)
>  {
>  	struct smem_header *header;
> @@ -1236,11 +1264,20 @@ static int qcom_smem_probe(struct platform_device *pdev)
>  	if (IS_ERR(smem->socinfo))
>  		dev_dbg(&pdev->dev, "failed to register socinfo device\n");
>  
> +	ret = register_gunyah_wdt_device();
> +	if (ret)
> +		dev_dbg(&pdev->dev, "failed to register watchdog device\n");
> +
>  	return 0;
>  }
>  
>  static void qcom_smem_remove(struct platform_device *pdev)
>  {
> +	/*
> +	 * Gunyah watchdog is intended to be a persistent module. Hence, the
> +	 * watchdog device is not unregistered.
> +	 */
> +
>  	platform_device_unregister(__smem->socinfo);
>  
>  	hwspin_lock_free(__smem->hwlock);
> 
> -- 
> 2.43.0
> 
> 

-- 
With best wishes
Dmitry

