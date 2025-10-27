Return-Path: <linux-arm-msm+bounces-78850-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D434C0C4A5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 09:25:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1200F3B748F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 08:25:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E4F9199FAB;
	Mon, 27 Oct 2025 08:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mfUx5/xt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DD232E716A
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 08:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761553543; cv=none; b=UjPLNQXZFxIw+Y8YUON9ZqFsxjF4cWg8QvGwcUJuxaHQ/QWcdFJIG/bYW+kFXfqDnKd+C+JZnlnORHIOxRFQSHIJWFAFsUWfRmPnqJ93PN0wole+g0N3msNdUeLuZqccRHN01zaA80nsnQbFvkstBvUwC0RYfhWkkRVLjq8esJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761553543; c=relaxed/simple;
	bh=s4/hEnLDptpri3LLhBNbmPdbIKv3lBAyCY4x+nkms1A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LiYxhZXwkrhRRz3Y0A+QLZReYFnSyEIMD7QeaJfdG/Ah9WspNvui2iy3qAJG39qMtpENjqi88VQEnW1BhMDi6X1nrUaPCJSF0w61rFopolEg5gfUaFUHMSznX/A2eMWuIlO2/3Fa6Bwr8DsVv36JTf5jlQ7flxvtdrLCBh79Cz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mfUx5/xt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59R84C541003532
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 08:25:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Rsb5IoKjQNN5TuHEex46Q/ZW+nK+3INVuz35ePkitGI=; b=mfUx5/xtkaV10vGm
	8STGARjNiwYeRqX0bwBI6nbAxM1A0AsGAuM5ibwEdS3wHqDp56/oQMXN56nSVWMI
	I6x4oEnzNHDHxrQxp/mpGIBJJFbbr1lpJrzzbJMU4n3MkwmOYorWC05mvEU7NVOp
	W+BTO0vjq9MDUsCzpAHIGoB8Ee783w59+dU0t5Sq8eaOz1ihkQgkUWKDnjxBy7/S
	QzQoMbfCxcAiE7xu25oUYgwBv1UqWOMjG0oqBbFj1W1eR8bP9/4lChyZcri5lEwI
	Bm0elhYmdACDw/b6xCBLRxZZt4ab8gjLOkaHqVudwBJNVzphNAhI+bs1CX5BzWF4
	9/zZ9Q==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a0ps13sjk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 08:25:41 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-87c103b902dso11525236d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 01:25:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761553541; x=1762158341;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Rsb5IoKjQNN5TuHEex46Q/ZW+nK+3INVuz35ePkitGI=;
        b=bXLGMbYfEcOskVpQld835CPClQigh261+RKosmwcsOFDvrTRklZgU7T7r7DEEDerdc
         zDOzfLbUFoniqNKUDDzsooJzNo2rPp63KKh87COTuJAgDH40/1CGtydARyxn5gbRw7CU
         IeCdMOlw8GvcnHtsT0vp++bySHBmwLUMV8s+3LmdzA6cm6kX+e6RrI43vKKB2U4/+wp/
         uRQjM9gyvGHnVQEFtRBo5eqW560m5sVQT8/Nx/DjAsrjfkEwNIM4YRySYStEiw2Bx/AU
         LvvI2ytiyutOSOaIKNGOBY+GP38Fm/KyLDf0B7Kn3O62GI+itymZvsWkXFybygtHyD4X
         ZCBQ==
X-Gm-Message-State: AOJu0YySufV1LdaZ27Nfa/2dDCe/st7f+wjGkfh9rHP7L44z0J9SaZLg
	pyGj+ofkusDhv8oOSWE0uwyqrKbMY8vWOOQ4UyncMFFJ+404pbuVSznjdbQlKv5h8CCq0wyTqx/
	0UcPakUGyGdH98nVc7SH2Y2XlrLuqf0aE8pyG5cNxr5XoFt+2jfddXFpq36Dgur/6c1QC
X-Gm-Gg: ASbGncu+JHnW7j25SQp6fEjMDRUJX+YDQrj4jQqlC7XzClb2Wg9VxRIzQB9oMCLHw2z
	A1QeFAi6UmNM1gItHFcdCSkLBsG6yXee75xNgSoay07oqs/VvMhLo7+E6w+BaeyQEpHCT6/3Gbx
	RM8TN7Lr3iDNqu1W7toqfxCCP9HbnItkZ8Ir2x2lzyKu8jhXuYCfaeA1f4Bb++w8C/uVR1jWTks
	7eKi9KkX+dVnGGesz5ixJlQKDH5/ZQdL1PMAHH2IVdxtOeDTQ0wv1X9vnYebYx3dwDySjGt3s/J
	4RmY8BayCPGL2HFSbAiKA3DDe0Nyb/WqCjpAOoRcCLtIYI05ltofTx/iJdCwjfvmrvGTDEo0x5A
	PCT/f1mwEz4n5BTYk5UCpxvmuNLa+vu0kJApb3LTsc+7kPyMA46bt9Nq3
X-Received: by 2002:a05:6214:f05:b0:81f:3abf:dc1f with SMTP id 6a1803df08f44-87c206aa6f8mr294428556d6.8.1761553540642;
        Mon, 27 Oct 2025 01:25:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFWO4UfxTU1BX5oTeeqL0Gs4K66cPeHuRqQeCNBm97cuVqGohCsQt/0ok7E7/fOVHrIRAJiJg==
X-Received: by 2002:a05:6214:f05:b0:81f:3abf:dc1f with SMTP id 6a1803df08f44-87c206aa6f8mr294428506d6.8.1761553540138;
        Mon, 27 Oct 2025 01:25:40 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d85359c0bsm704420366b.24.2025.10.27.01.25.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Oct 2025 01:25:39 -0700 (PDT)
Message-ID: <daf0055b-7caf-4ace-8a06-071468273a37@oss.qualcomm.com>
Date: Mon, 27 Oct 2025 09:25:38 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] phy: qualcomm: m31-eusb2: Add runtime pm ops
To: Prashanth K <prashanth.k@oss.qualcomm.com>, Vinod Koul
 <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20251027062458.1411096-1-prashanth.k@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251027062458.1411096-1-prashanth.k@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Ju78bc4C c=1 sm=1 tr=0 ts=68ff2c85 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=k3wdqr90-_sLWsnx9DcA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: EXlqnYkxfNy6COcqJf4km9WXqJnDY6Fz
X-Proofpoint-GUID: EXlqnYkxfNy6COcqJf4km9WXqJnDY6Fz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDA3NyBTYWx0ZWRfXxwvf1fCfdxgJ
 cxpc1RuqCBdDFTNaI4JG/ujg399P+oVKcZrlXEoQtRYHLnKd1DozVvg8Cq+8Qmun0/MmlmeUrHQ
 02zTqHdLMcx2x4XV52lcZNuY79OVee66z8IlIOZqwhfF+vDxGjnqSQ7IQgoTdQ73MnnWYHNblRf
 JNlfOeCNMq8Vsy+8thgwo77psu0URls9qvvfKHlrnBEUdFqenMUmNG6+rf+IJuqW/JW+/6IPCjX
 Lvki78UsR7in77XPKgGZVl83lRQqL1QdveLWdmGu372XthyUHm1jemuHLNOgzSrI9ZxOxwcfevk
 +fhWbudHzddgsWIcTzq3vy0qVghXi+vIv5yNGSDqDtiyejI+/O7U5Gn7FGtWwYw8/ZRdLqWuw9K
 zRrUeDNbB8QFFq8zXgw1Mdl9nWbg/A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_04,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 adultscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510270077

On 10/27/25 7:24 AM, Prashanth K wrote:
> Add runtime power management operation callbacks for M31 EUSB2 PHY.
> Enable/disable the clocks based on the runtime suspend/resume calls.
> 
> Signed-off-by: Prashanth K <prashanth.k@oss.qualcomm.com>
> ---

[...]

>  static int m31eusb2_phy_probe(struct platform_device *pdev)
>  {
>  	struct phy_provider *phy_provider;
> @@ -270,6 +298,17 @@ static int m31eusb2_phy_probe(struct platform_device *pdev)
>  		return dev_err_probe(dev, PTR_ERR(phy->clk),
>  				     "failed to get clk\n");
>  
> +	dev_set_drvdata(dev, phy);
> +	pm_runtime_set_active(dev);
> +	pm_runtime_enable(dev);
> +
> +	/*
> +	 * Prevent runtime pm from being ON by default. Users can enable
> +	 * it using power/control in sysfs.
> +	 */
> +	pm_runtime_forbid(dev);

This screams "this patch is broken" or "there are bad issues" which
you did not describe at all.

Konrad

