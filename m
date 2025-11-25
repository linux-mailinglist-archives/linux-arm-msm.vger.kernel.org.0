Return-Path: <linux-arm-msm+bounces-83185-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA36C83C64
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 08:47:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 8A8D634C44D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 07:47:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59D2D2D8776;
	Tue, 25 Nov 2025 07:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kVTcD1eD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JLsHNoXf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 584AD2D0C64
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 07:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764056805; cv=none; b=mMzgfjx9XIWpXRFluDh+e6q1yIkkgCzFndYpQVSwpceSHoxjwJP+zzriC7VTMtEX8TTlPi53oPq8B2dt24HWH3ozbgRcYuTfRFG2yA4RSerhdP+yKvYxXRdiHb04L99lJZJP0zEkItLeab3RQWK6ObzuXbt8H0eteHkQ+91H+zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764056805; c=relaxed/simple;
	bh=QCMPkGvI00SdOOIIAt0foNAq9brGxYJ1NVOkH+31Y5Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JbRLVhcPd5o+dILuCl9WJHTbkDdI9gNGuHVJnsKg9YTixQhQc6n88xTraNgDR6FJadvvHZ5HZ1wN1h2rzZXXKw2ds8T4xvAveRkMV9DRW4ThBhwbQTWp7PcSZDNYSFyYPwL6zZh8k4Kh8AF16efcDyEMBechQfubHQRvAu/3Xuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kVTcD1eD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JLsHNoXf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AP2ggHc1847635
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 07:46:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tGSYligo38IiMEIE59phcGW5xTKWQfWNdO+5JNVxV8Y=; b=kVTcD1eDq0RzawgT
	gJht4fN/ePXTovcaLoBp9D1nA7w+xb0Pbf2PzD0q7jGvc07AnjkWezQShCrYfZSY
	hB1yjHz8Bv0juYnCzWuIFvWf+2Ggj5J24wO67jXREZvjqDBQ/3ce4KWFtqEdQdpg
	6PBPx5xcWCO7YU9307nUiOsJFJdmkcwv4nvVaH6AxksziSl0FrUOeUs+X8wdEYdQ
	tN9MsxLngTrlCMSnA6CH4tgkat8DmcfvjhBxaNoBe2rhijegBv7KplnrNt35Bdti
	ILXcXKXpffhdLkrwXggDs3iETAwNxqeWYgPJ062OyfsjTos7XZxn+x7htH0+CSiD
	4XznjQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4amu6qa726-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 07:46:31 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-bd74e95f05aso2909256a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 23:46:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764056791; x=1764661591; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tGSYligo38IiMEIE59phcGW5xTKWQfWNdO+5JNVxV8Y=;
        b=JLsHNoXfw3MFv2a9nXKYQcxCm892B0370Hmd+HVLsyWgOVKqVMGjq7I9lUW8qQj70h
         hrsnG4aVkLGyvicejXkMSqqQaGQ7jKUjJJ/+sEjREi4n7j2CrHM+/LZMm8bxCGi5c/R6
         PjOWMYOymWb1xV61bzeiVrkxkIymU/UiqDMRexrFUHbJcG9+kFAPLtAIXzZqmzYCyWTd
         jZZr3FoloruoPIEs4kJoKwYLRTQC2Qbb86+W4CMSfR+0I1t1xkFfpNx7k7PydpHU9lQI
         OV8/lfD4ycS/Bf8yzakFk9tG5FLEQ6Ap0jOaw8IJWr4qTMUKYy5wh/B5Qy6jJJ5JQOEj
         /IlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764056791; x=1764661591;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tGSYligo38IiMEIE59phcGW5xTKWQfWNdO+5JNVxV8Y=;
        b=p1RChWMPCcPRuqbgMi4fihHcKPoqTq4nENIPqF69bgcUnjTTYPZgz8Yfb1kefmfgXi
         K3BBsYyaNaCKhmpg1J7Y3RxqIcBSI/l2v8hTLOrBaTa9pumYcJl5y9vuQy7+WLVLqHCb
         vdBNNhzGsHo9xVc1256qETC9bW+ZrfUcZ1jYWQF4cYnzrNICgJ4ndLILgoaE0H3F2Hdn
         CJEu2X+BS+/ehgDQepwtPwaC3WHa2U15BDj8TV28UEMqAlxsdBwcIjD2mdSv/CJHeV0J
         b32wkR5fkadrDjjQmagx4tkuK1D1twEZyfjRZQdNPfw2eFah9sju12G6/+2og2z5ojhM
         CQTw==
X-Forwarded-Encrypted: i=1; AJvYcCVbbrzV7Fr7peaa+9NQZwKtoCh+GSh/SuARv7tySvLSgTCwkwPglG4oSkxSi2grqbiuzGbjSrh9MR/YSu9Z@vger.kernel.org
X-Gm-Message-State: AOJu0YziFXoOW9fAZA0i5HDThla2v0g9dqb3aGRuv++cWgCBD/htSUpI
	VFixmqLTrznIwjvW4xJ3H+6O5+RMbPrk1AvwPbFn3I0RPWu/fdXXpLGiZTZaKV9xdHLNMEuXQ9w
	ymqkPlUi3E7Y5HFQARWjDbTU1LRFJFzSs7+URl8Zo90+d57Np3O+SftPm5TdtV9XNrPLm
X-Gm-Gg: ASbGnctKwg5fWPoNuNJDV7Devk6ZDF/H9CoXPc6Iy+jYTkak5GT5HJoRdzUXaSnbJjS
	fzfMlIf79OqId4RuEJTYMZj0mT1lL2trdG7hX7MN6O7Q1haVH1lOt7wXrT6Z1EE7YQau6oBpbKe
	SRrsWXysTn3swNtwwZA5KiGyNPtA1Hjw+fgnvyoceyvVAjIgiFbRtGuo+mqGrGMFQGIqzPAjC4Y
	0odrk4zOPTKwLIt8+ozfxSsPP+MkK5xhpyQCM0pL0T3QMMfbfhyEciskQHpNGHYtyAZCT6yhrPb
	LUnCACjCKpjPRfq5aorvFSi/05v1Z8q9vtV/oxKEZrpyHAa8TIEUqaY+ThTT6Xxr9qVc6YV4hMG
	x5peGdFyDAZWr05EfvWaCaRuRxTlvQR8wG73C
X-Received: by 2002:a17:902:ccd1:b0:281:fd60:807d with SMTP id d9443c01a7336-29b6beebd3bmr186763435ad.2.1764056790644;
        Mon, 24 Nov 2025 23:46:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGpcY+LTrdMispJgMCPMrQOkoWK2hoXiuJzz1juJntXFwcdexj2zY7+wPz2DZXapQjBJaHiww==
X-Received: by 2002:a17:902:ccd1:b0:281:fd60:807d with SMTP id d9443c01a7336-29b6beebd3bmr186763195ad.2.1764056790033;
        Mon, 24 Nov 2025 23:46:30 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b107cc2sm159434445ad.16.2025.11.24.23.46.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 23:46:29 -0800 (PST)
Date: Tue, 25 Nov 2025 13:16:24 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
Subject: Re: [PATCH v9 2/3] firmware: qcom_scm: Support multiple waitq
 contexts
Message-ID: <20251125074624.apkpvvxothxgla75@hu-mojha-hyd.qualcomm.com>
References: <20251123-multi_waitq_scm-v9-0-0080fc259d4d@oss.qualcomm.com>
 <20251123-multi_waitq_scm-v9-2-0080fc259d4d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251123-multi_waitq_scm-v9-2-0080fc259d4d@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: RaZMmUxzcscsvKSRuGZhutZP0DJTswB8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDA2MyBTYWx0ZWRfX7bvfnzAu6QgG
 WPSe5bXjBUid4B1MLngVtDODmgOnQUEBzlvKJkU31pHoSzaHZb8TztFgjJZQPS1pQOEOYtYAWac
 wsS5NqgKiFc2rTS9NyK2Ol6Rm/4KKz2fB5Tb7VBSdzDq3l9M5lqEjylgzJp4K0F+MjiN0HWRoNH
 rj+z7AEzkPbwjigzk6vG5p/7d9ePdavS0K12EAoogiwkV3/Cdx0Mf4ENnMtI3L7pasbLHXnwZo4
 jcjpZpUnNB+T/Pz7Ic4whHeHa8lCt9ba0KgUKtNdSvm+NbyIeCS6hUiV8hSGg5aTgFFzFwGgEo/
 3Rh+JCO4PybpOHTPPHqjdX46IZhe2VFek8QaA2RMre3OjCtjvE39B4GGpJxISRu58U8JTq7Wp4S
 CoHarHCdc+o0Aj2mWrC/ecWrYw2U0g==
X-Proofpoint-GUID: RaZMmUxzcscsvKSRuGZhutZP0DJTswB8
X-Authority-Analysis: v=2.4 cv=S6PUAYsP c=1 sm=1 tr=0 ts=69255ed7 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=sApyqco6S6YuPa94Mp0A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511250063

On Sun, Nov 23, 2025 at 07:49:31PM +0530, Shivendra Pratap wrote:
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
> Signed-off-by: Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> ---
>  drivers/firmware/qcom/qcom_scm.c | 76 ++++++++++++++++++++++++++++------------
>  1 file changed, 54 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> index 28979f95e51fbee94b84c1570a4d88a76f72db4e..149c2ccec2a5ff77054178fa021fd0b721d9f8d7 100644
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
> @@ -2247,6 +2248,25 @@ static int qcom_scm_fill_irq_fwspec_params(struct irq_fwspec *fwspec, u32 virq)
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
> +
> +	ret = qcom_scm_call_atomic(scm->dev, &desc, &res);
> +	if (ret) {
> +		dev_info(scm->dev, "Multi-waitqueue support unavailable\n");

Since, we are expecting this to pass only for newer firmware, do we
really care about this log for older firmware or device that does not
support this, dev_dbg if this is not harmful..

> +		return ret;
> +	}
> +
> +	return res.result[0] & GENMASK(7, 0);
> +}
> +
>  static int qcom_scm_get_waitq_irq(struct qcom_scm *scm)
>  {
>  	int ret;
> @@ -2280,42 +2300,40 @@ static int qcom_scm_get_waitq_irq(struct qcom_scm *scm)
>  	return ret;
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
> @@ -2391,6 +2409,7 @@ static int qcom_scm_probe(struct platform_device *pdev)
>  	struct qcom_tzmem_pool_config pool_config;
>  	struct qcom_scm *scm;
>  	int irq, ret;
> +	int i;
>  
>  	scm = devm_kzalloc(&pdev->dev, sizeof(*scm), GFP_KERNEL);
>  	if (!scm)
> @@ -2401,7 +2420,6 @@ static int qcom_scm_probe(struct platform_device *pdev)
>  	if (ret < 0)
>  		return ret;
>  
> -	init_completion(&scm->waitq_comp);
>  	mutex_init(&scm->scm_bw_lock);
>  
>  	scm->path = devm_of_icc_get(&pdev->dev, NULL);
> @@ -2453,6 +2471,20 @@ static int qcom_scm_probe(struct platform_device *pdev)
>  		return dev_err_probe(scm->dev, PTR_ERR(scm->mempool),
>  				     "Failed to create the SCM memory pool\n");
>  
> +	ret = qcom_scm_query_waitq_count(scm);
> +	if (ret <= 0)

why 0 ? even if the SMC passes, res.result[0] & GENMASK(7, 0); can
return 0 ?

> +		scm->wq_cnt = 1;
> +	else
> +		scm->wq_cnt = ret;
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
> 
> -- 
> 2.34.1
> 

-- 
-Mukesh Ojha

