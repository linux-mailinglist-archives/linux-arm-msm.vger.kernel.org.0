Return-Path: <linux-arm-msm+bounces-84075-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C94B1C9B84E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Dec 2025 13:52:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 735EB3A72C0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Dec 2025 12:52:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22BAD302143;
	Tue,  2 Dec 2025 12:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M8q1hUPZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PdA/+6dv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FAEF2FF65C
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Dec 2025 12:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764679954; cv=none; b=eG/PPTILjH3m1Wc2RBqSMfQDa0s0jjGlUxbFgVNIgJ4fNKbyshJLXKOhPeQELl++2nUPiJfcS448OELLU+Jr8IGJE2iIYWmqXtg+0mNa0dwgz71YeHVjqgeTtEnBi+4ou/VSCimJsDYp2VH4RoDxvgWv+bsx1lVSI9gwkQpwmw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764679954; c=relaxed/simple;
	bh=lUnth6A/Txt1PdGaElpixXDZzJIyqNBZtxrEK3t/+/0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I3ZIVh9i84QwMbXz/TgWEmutObAdzmOsreugmZkezhX3FMy2cCQTzvdwArs6HUmthkiAa5nhQrx25KZFzHphYUcrPCub4CksPl6DdvkiIb2ZMYXPISYiMca9gXW7EqdjO5lJJMam/tRPwCqMDoCyFeTwm3wv0HnKLR+SWBGjRNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M8q1hUPZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PdA/+6dv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B27MwEG2583916
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Dec 2025 12:52:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0uXfv8xyHmOp3Z0fUiFjX78LDqMMTBkrMHGlSlf0BRc=; b=M8q1hUPZcAQVptlh
	U5krduPoKJV14yC1cPSqxHS9BNxbFltEYXHqkW++wq1Y+A95ZEXH2VvpdTF6N69V
	mu0vxmsLy9SqPoQ1TEY+uhFInGuK12DfBujma6pqwx9AEJtkHHz8wttWPLaxM7ip
	vZo72bkyOOgyPhDybQeYdeCMzjx9dAwx9+K1TjROgX7tfdmJHljOLVrcSgvH9Irq
	0RAQJaWC5z6/ieAuKKUEJT69MGOaW7u73UchvIHVsoEQZ+9634OZjx7wcF5aZ7wr
	vf/thlx7SkBFsVfW4faGwfiAR8dHu30vW4DSN5NG8W0W3hhjB4BQ34NoI7aXf6yF
	AbkF9A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4asup3gyt7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Dec 2025 12:52:31 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-297e66542afso144227575ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Dec 2025 04:52:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764679951; x=1765284751; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0uXfv8xyHmOp3Z0fUiFjX78LDqMMTBkrMHGlSlf0BRc=;
        b=PdA/+6dv8jqJ/3CuVkN9ywgZyWmN2xJZ8tG/eeZaNiqABgI1SUnyhCtKxaOdnVGueW
         6cNUyOR/Fh2TAwsJR5GFhgITY8WdtX8zx14xcBtXt/T378xy81NoEZmi/AHMEh/4ckeZ
         F4cYBIWVn1RCZqRR/PLEGQXhtwsaSVrVwTvBcjIMEbp5cM3Rgs3H5v2kAyc/ZzqZYbZh
         p2JiD+SNEOjwV7516hBjSkddtBuKJGl5pXoa3YWtH4qeSek2BHD/0dljX/LJ5YWoCimT
         6fDZUc3X6ukExvNzMaiDmN2QSJp3X9kt+ftoKvLz1wMZxSZen/qMfXvTzcMT4zjdol5p
         cNUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764679951; x=1765284751;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0uXfv8xyHmOp3Z0fUiFjX78LDqMMTBkrMHGlSlf0BRc=;
        b=wvoTNokNA/5ZQ1nvpe8Z0fmldYReHWzsfjzwKET9RyMBB1sbvwOpvtM1zrOlF8RSAG
         s3tBjjJA1AegPJ9y2bMsvdbpOGw7Utfwg7jhVfVROeaixvWZ+sDx8M6LOo2eEYWGuu3b
         /bdFJz7H9OJ+PA8bMFV0+/UUC+68HPu29ZPLT0WI2yFwfGxaLLCOeHH7ezRtPw388zH+
         O/JzQyDK5djJieRScWRCGeBAMhxIhu5+cjM2tmo71FiUKe3JVctyw/IYJh/yItLlqRhL
         cTG1CCfdjrcU9qtWan/yKjUjn4LRvL2ShRnhaD2b9aCWYujiYwRuQou396XCcJnDiJtB
         5ttA==
X-Forwarded-Encrypted: i=1; AJvYcCXjqhhx3i1h1k8z95KW12Z1xAsd9rXfD0EMCyV8ZxTFd6ChHSI1MalD4nv6oTQ9Kujq3VEaB2HF7Jd7WxE1@vger.kernel.org
X-Gm-Message-State: AOJu0Yzm1Oea04J/qMp3HqdutTT5kYGAf87QQudUbHjFwBk29TVqQkVc
	wuflb/OqdkldgCCqdSk7p3QQuqY5P/N+2lx+3xZN0IWQNJc0Nngup9qQEanFbYuYDhzd5lf9lv+
	cj0APdMTWaME73geKtSgrBkIPaD4biYUqdz/TJaJB8j0bHdYrnPMwhR+assfE3BqPyxf1
X-Gm-Gg: ASbGnctJBChHSnLS1yXPk5U3wa/rLQPD2Kzdr9/Zj1G7bmgYObH6a8r3/M2D3Q5a+8Y
	Jvgoivi7zwDE4IoCL/C20XcmMsgggiVssMeymvoDdVXbES4jlaEWt9mfgUQgob9/sk+oC+VYvWf
	OWNhrRLcdPNk1+B+wIAHPpKgONOCRnBuUlaGLIO2j2pJcnYY6aCOHGlfz/62MWRaLNpC/Xreksp
	kIAh6+dQJnGCHd/dk4TY/aT/j0ji4p6fZZ3T3RYv/Q+F4PSrZANKHJ+wUkTPiZVRY+zFvrwlDwO
	+xl3GVIZ1NIrqVrK0lqe4+OGr69AG2JwADKFEYUmFRIxdUY320xM8XJ/Sq8lBtq2RZAzrrzMj9p
	LqW75QflwDTy95TeI+CNNDKyrpUIiVJCzKjrv
X-Received: by 2002:a17:903:46c8:b0:295:1a5b:f406 with SMTP id d9443c01a7336-29baafb7f5amr358466965ad.25.1764679950455;
        Tue, 02 Dec 2025 04:52:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG9uvxcDWIDCEWQNq6zeW31SIzmTNxSm4qwGwodVcLxYgA8TFMOkeYw3qK4NstkUxZSlDmmFw==
X-Received: by 2002:a17:903:46c8:b0:295:1a5b:f406 with SMTP id d9443c01a7336-29baafb7f5amr358466545ad.25.1764679949754;
        Tue, 02 Dec 2025 04:52:29 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bce40ac99sm153431305ad.7.2025.12.02.04.52.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 04:52:29 -0800 (PST)
Date: Tue, 2 Dec 2025 18:22:24 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v10 2/3] firmware: qcom_scm: Support multiple waitq
 contexts
Message-ID: <20251202125224.yh4o3p2i6kjfjxdz@hu-mojha-hyd.qualcomm.com>
References: <20251130-multi_waitq_scm-v10-0-5a5f2f05a417@oss.qualcomm.com>
 <20251130-multi_waitq_scm-v10-2-5a5f2f05a417@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251130-multi_waitq_scm-v10-2-5a5f2f05a417@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=MaZhep/f c=1 sm=1 tr=0 ts=692ee10f cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=sApyqco6S6YuPa94Mp0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAyMDEwMyBTYWx0ZWRfX+e273Z81wCmJ
 eCC/qnTBIFioJEML59Czu52+8GNIDMebAe3x4kVYRxBObK6zMer4PahIimhnQ7BTOuhUqfBhVhS
 jKngi/+pPQK6eDRd8qpeP2XRbRrWTucCJTFps+aKM79sx27fFtYOXg3SW8dMF7e7qbA/nveE/jL
 hW7+OzV0a0Psq9rAYCTParWDSsxxIk+T0EFgSSXfjyQWJ1yNO5txUaKCewO/bDUMiJH7GYVFHpw
 6ltyrcoMgJr+gzstSQXJ/0dDbs7b2uVeZRm38Zl2iIz+6N+++5PWznxZKYPDoXzkhkih+WP6wPA
 Gg4r5ay4W6Z7DNg9YszDkZ25ipkswSeVxh1CNmp/hUkbG0MXQ2Gksqr7vriO5T6ySCFgBemOuqq
 XWuYVHBj9GKWteYlR331rp1Vw6zr0w==
X-Proofpoint-GUID: 1oUchrQYktx3X4uBuTliVkAsx_mCRlYX
X-Proofpoint-ORIG-GUID: 1oUchrQYktx3X4uBuTliVkAsx_mCRlYX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-01_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0 impostorscore=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512020103

On Sun, Nov 30, 2025 at 08:11:03PM +0530, Shivendra Pratap wrote:
> From: Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
> 
> Currently, only a single waitqueue context exists in the driver.
> Multi-waitqueue mechanism is added in firmware to support the case,
> when multiple VMs make SMC calls or single VM making multiple calls on
> same CPU. Enhance the driver to support multiple waitqueue when
> support is present in the firmware.
> 
> When VMs make a SMC call, firmware allocates a waitqueue context,
> assuming the SMC call to be a blocking call. The SMC calls that cannot
> acquire resources, while execution in firmware, are returned to sleep
> in the calling VM. When the resource becomes available in the
> firmware, the VM gets notified to wake the sleeping thread and resume
> SMC call. The current qcom_scm driver supports single waitqueue as the
> old firmwares support only single waitqueue with waitqueue id zero.
> Multi-waitqueue mechanism is added in firmware starting SM8650 to
> support the case when multiple VMs make SMC calls or single VM making
> multiple calls on same CPU. To enable this support in qcom_scm driver,
> add support for handling multiple waitqueues. For instance, SM8650
> firmware can allocate two such waitq contexts, so the driver needs to
> implement two waitqueue contexts. For a generalized approach, the
> number of supported waitqueues can be queried from the firmware using
> a SMC call.
> 
> Introduce qcom_scm_query_waitq_count to get the number of waitqueue
> contexts supported by the firmware and allocate “N” unique waitqueue
> contexts with a dynamic sized array where each unique wq_ctx is
> associated with a struct completion variable for easy lookup. Older
> targets which support only a single waitqueue, may return an error for
> qcom_scm_query_waitq_count, set the wq_cnt to one for such failures.
> 
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Signed-off-by: Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> ---
>  drivers/firmware/qcom/qcom_scm.c | 74 ++++++++++++++++++++++++++++------------
>  1 file changed, 52 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> index 79ab1707f71b0157835deaea6309f33016e3de8c..ef3d81a5340512a79c252430db5f09cd8c253173 100644
> --- a/drivers/firmware/qcom/qcom_scm.c
> +++ b/drivers/firmware/qcom/qcom_scm.c
> @@ -47,7 +47,7 @@ struct qcom_scm {
>  	struct clk *iface_clk;
>  	struct clk *bus_clk;
>  	struct icc_path *path;
> -	struct completion waitq_comp;
> +	struct completion *waitq_comps;
>  	struct reset_controller_dev reset;
>  
>  	/* control access to the interconnect path */
> @@ -57,6 +57,7 @@ struct qcom_scm {
>  	u64 dload_mode_addr;
>  
>  	struct qcom_tzmem_pool *mempool;
> +	unsigned int wq_cnt;
>  };
>  
>  struct qcom_scm_current_perm_info {
> @@ -2247,6 +2248,23 @@ static int qcom_scm_fill_irq_fwspec_params(struct irq_fwspec *fwspec, u32 hwirq)
>  	return 0;
>  }
>  
> +static int qcom_scm_query_waitq_count(struct qcom_scm *scm)
> +{
> +	int ret;
> +	struct qcom_scm_desc desc = {
> +		.svc = QCOM_SCM_SVC_WAITQ,
> +		.cmd = QCOM_SCM_WAITQ_GET_INFO,
> +		.owner = ARM_SMCCC_OWNER_SIP
> +	};
> +	struct qcom_scm_res res;

nit: I know, it is not something we are following everywhere in this file.
Move the `ret` to here to follow xmas tree for newer functions

> +
> +	ret = qcom_scm_call_atomic(scm->dev, &desc, &res);
> +	if (ret)
> +		return ret;
> +
> +	return res.result[0] & GENMASK(7, 0);
> +}
> +
>  static int qcom_scm_get_waitq_irq(struct qcom_scm *scm)
>  {
>  	struct device_node *parent_irq_node;
> @@ -2278,42 +2296,40 @@ static int qcom_scm_get_waitq_irq(struct qcom_scm *scm)
>  	return irq_create_fwspec_mapping(&fwspec);
>  }
>  
> -static int qcom_scm_assert_valid_wq_ctx(u32 wq_ctx)
> +static struct completion *qcom_scm_get_completion(u32 wq_ctx)
>  {
> -	/* FW currently only supports a single wq_ctx (zero).
> -	 * TODO: Update this logic to include dynamic allocation and lookup of
> -	 * completion structs when FW supports more wq_ctx values.
> -	 */
> -	if (wq_ctx != 0) {
> -		dev_err(__scm->dev, "Firmware unexpectedly passed non-zero wq_ctx\n");
> -		return -EINVAL;
> -	}
> +	struct completion *wq;
>  
> -	return 0;
> +	if (WARN_ON_ONCE(wq_ctx >= __scm->wq_cnt))
> +		return ERR_PTR(-EINVAL);
> +
> +	wq = &__scm->waitq_comps[wq_ctx];
> +
> +	return wq;
>  }
>  
>  int qcom_scm_wait_for_wq_completion(u32 wq_ctx)
>  {
> -	int ret;
> +	struct completion *wq;
>  
> -	ret = qcom_scm_assert_valid_wq_ctx(wq_ctx);
> -	if (ret)
> -		return ret;
> +	wq = qcom_scm_get_completion(wq_ctx);
> +	if (IS_ERR(wq))
> +		return PTR_ERR(wq);
>  
> -	wait_for_completion(&__scm->waitq_comp);
> +	wait_for_completion(wq);
>  
>  	return 0;
>  }
>  
>  static int qcom_scm_waitq_wakeup(unsigned int wq_ctx)
>  {
> -	int ret;
> +	struct completion *wq;
>  
> -	ret = qcom_scm_assert_valid_wq_ctx(wq_ctx);
> -	if (ret)
> -		return ret;
> +	wq = qcom_scm_get_completion(wq_ctx);
> +	if (IS_ERR(wq))
> +		return PTR_ERR(wq);
>  
> -	complete(&__scm->waitq_comp);
> +	complete(wq);
>  
>  	return 0;
>  }
> @@ -2389,6 +2405,7 @@ static int qcom_scm_probe(struct platform_device *pdev)
>  	struct qcom_tzmem_pool_config pool_config;
>  	struct qcom_scm *scm;
>  	int irq, ret;
> +	int i;
>  
>  	scm = devm_kzalloc(&pdev->dev, sizeof(*scm), GFP_KERNEL);
>  	if (!scm)
> @@ -2399,7 +2416,6 @@ static int qcom_scm_probe(struct platform_device *pdev)
>  	if (ret < 0)
>  		return ret;
>  
> -	init_completion(&scm->waitq_comp);
>  	mutex_init(&scm->scm_bw_lock);
>  
>  	scm->path = devm_of_icc_get(&pdev->dev, NULL);
> @@ -2451,6 +2467,20 @@ static int qcom_scm_probe(struct platform_device *pdev)
>  		return dev_err_probe(scm->dev, PTR_ERR(scm->mempool),
>  				     "Failed to create the SCM memory pool\n");
>  
> +	ret = qcom_scm_query_waitq_count(scm);
> +	if (ret < 0)
> +		scm->wq_cnt = 1;

#define QCOM_SCM_DEFAULT_WAITQ_COUNT  1

> +	else
> +		scm->wq_cnt = ret;

Since, we are not erroring out, can we do this as

scm->wq_cnt = ret < 0 ? QCOM_SCM_DEFAULT_WAITQ_COUNT : ret; 

> +
> +	scm->waitq_comps = devm_kcalloc(&pdev->dev, scm->wq_cnt, sizeof(*scm->waitq_comps),
> +					GFP_KERNEL);
> +	if (!scm->waitq_comps)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < scm->wq_cnt; i++)
> +		init_completion(&scm->waitq_comps[i]);
> +
>  	irq = qcom_scm_get_waitq_irq(scm);
>  	if (irq < 0)
>  		irq = platform_get_irq_optional(pdev, 0);


Rest all looks good to me.

Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

> 
> -- 
> 2.34.1
> 

-- 
-Mukesh Ojha

