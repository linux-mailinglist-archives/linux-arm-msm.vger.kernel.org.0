Return-Path: <linux-arm-msm+bounces-63551-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 86EF8AF7C79
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Jul 2025 17:37:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3A899164719
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Jul 2025 15:33:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF07619F120;
	Thu,  3 Jul 2025 15:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ERuujuKv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 451C41E4928
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Jul 2025 15:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751556781; cv=none; b=Qd8Fmh72dDhm44vgourrsLQy2Uh/6uXX1j9U5ShphIGrWVGASov/XxhS6iXszc43uMkv+16i2Qhm+neHzdKmRrA/LdxpX4sp4acSVAIVOHx+2Uz5ZG4wLr1lLy8rRb39K79gIFWlUnuhHGI3PMY2OEJlc5x/GhFAOpxIN0SgtpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751556781; c=relaxed/simple;
	bh=Y2wHdzMkoJpTGZjYvb1zaxVVxIgGPm4mgWwkVnd7HDU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TsMUxxx0FKljWm+rnvtZa1m198nay1NnPnChlOGJIGcpO+Nh6hbDQC7USjQTpQZDbQKwnupyAbMmefI2kAr8tcn5nhvxRep/Ejf4afdlzfliJ90o9dkUYVtyu8cqE2QhQ2YUqqs5BalGQUszhy4xUVli+yLo3yEKA5KUg8rvTYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ERuujuKv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 563DXYYb006750
	for <linux-arm-msm@vger.kernel.org>; Thu, 3 Jul 2025 15:32:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wvvGW4Ha6hjLFZe9ISe2jC6fysqV1hVJbJSvtVGuzD8=; b=ERuujuKvjS/U9TZp
	noGfeXXFZKevkHNhE0cHEflu3eTuvJOGmBT4x1bIOzJx9/ICh0XjqBybOetaEWUo
	L6LuiMsiNS/dRpeM8FAdWGqMsHwCp8CKqRv5EMiuPXIyFFCb2LWDzx9WxdSWY+5k
	pHr8Pb5QrzZBxPxpXohyNTt7QM9nKyUsWiR5iK7nIyXqhbZzzs2zXIBYtPDbXT7k
	fH/q7UTj3sQQZrtHUiEY7V9BLSY8DPjNOVmDzCoX7IZP1pWW25DhffxSPqq1nUCV
	KZX8GTuoxJFb0o6E1G09+gAHfK7uvc6K1+NVpc3ZM5OcFXRl3EKRz03J53/5qG+k
	dpLqYw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47napw373h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 03 Jul 2025 15:32:59 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d097083cc3so207073485a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Jul 2025 08:32:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751556778; x=1752161578;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wvvGW4Ha6hjLFZe9ISe2jC6fysqV1hVJbJSvtVGuzD8=;
        b=Bac6bWcjEw76Hiz54P5mMhU3R6UJi6WzXcvkOro1woPtZWBmtyVIWEZx3HLhAEgJnX
         vn4Ut8RYEzpemaEsFGByOTF88JniU7Yt3w7R4AH0RPjN+lg2FxnJLTwCCm6OSOCT0YeG
         2+zuU/Y5y45aVrsxmJbgIEzfOORJz4pg2tigdcvrjT6QnNazhiNqqIL+Rh0+XOqYW0dW
         V89nrpxycjyKfM1kPoSRb0X90oWPBUoWLiwlLjPnN+7AmUMfsGENjD3Ah2UHNMxQTU5j
         ditwbbuCutbUZ0mg5th30dbIhNOmcqq7DnGV4gW/cW3DItqFytgWRNmoaDkYehI/3bQs
         /grA==
X-Forwarded-Encrypted: i=1; AJvYcCWh6afud5NoocEC9Ovl1RUSI8B0sgFUQnJwjmJpqmUtkIiG2sViwDJEhMTdGzPNNw6k45cMswgprz4VmEHb@vger.kernel.org
X-Gm-Message-State: AOJu0Yzi9lJ35FbhBWF3HhooxcOBzYIYvPEkcLxrRBMSlTUNj92hdDpO
	grDvvF+8wbnl+atZx2omsWX8w0ET7EatNxDRAFaNMNCipFxhzRKvoDFJyAsOuVY4GwBlg4d5x52
	RV9TaQkwEe6fm1GtPo0J0yNbqIaCZbb3T7Aphwra2rn0mNNOxgqCcJURE8VBUFhWec4s5
X-Gm-Gg: ASbGncuREaASo/0tEthJmnhKG3Q2xJnMv02JMh4O4IGuxzzkKxy6QoWkH+DpPMf+VUs
	kdNS4b4+D6cc61fBzX1SjNqAdNKROw4dhVZ7RW88MoSMjtU+SXV3YsPCV8iFYW1k0HIigxxD0uX
	VHckOvQ9UMHXgPk/PqVwVHKD1DIY9nbsnwc171BHnbxKD/2Cmtw2bznUuDIzOBjojzDx9gmcc4/
	99nqTo9kiE6BWIwTxHS7MFWZUvEF0aFY8keqJhuJnIVeJAsiLbaP7nIoB6wstBiYnIyr8A09bL1
	/ZywjwxP8ZhRzW6AuhtwO/XkZDwLgDvt0mcdwS/ZGF5uDd5lvreGezeNpWlVTCDGXwMlRRjTis4
	OfqT5gg==
X-Received: by 2002:a05:620a:2788:b0:7d0:a0bd:d7ae with SMTP id af79cd13be357-7d5d3f0201cmr128301185a.5.1751556778124;
        Thu, 03 Jul 2025 08:32:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEgKXuQm2xeDUpFVPOnRJFFPBfy1u3PKJPqnXeNMitcBiTnYYl0avZkvqAQKwR8Y08DzgmQqw==
X-Received: by 2002:a05:620a:2788:b0:7d0:a0bd:d7ae with SMTP id af79cd13be357-7d5d3f0201cmr128299885a.5.1751556777554;
        Thu, 03 Jul 2025 08:32:57 -0700 (PDT)
Received: from [192.168.1.106] (83.9.29.45.neoplus.adsl.tpnet.pl. [83.9.29.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae353c01201sm1313575966b.97.2025.07.03.08.32.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Jul 2025 08:32:56 -0700 (PDT)
Message-ID: <d1973316-d6d0-443c-b155-ad8890b8c971@oss.qualcomm.com>
Date: Thu, 3 Jul 2025 17:32:55 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] bus: mhi: host: pci_generic: Add SRIOV support for
 PCIe device
To: Vivek.Pernamitta@quicinc.com, Manivannan Sadhasivam <mani@kernel.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vivek Pernamitta <quic_vpernami@quicinc.com>
References: <20250703-sriov_vdev_next-20250630-v1-0-87071d1047e3@quicinc.com>
 <20250703-sriov_vdev_next-20250630-v1-1-87071d1047e3@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250703-sriov_vdev_next-20250630-v1-1-87071d1047e3@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dIKmmPZb c=1 sm=1 tr=0 ts=6866a2ab cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=qmfFy4ndMtQ753Zl/n/b/A==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=aC6bp7ebQdJ3EfGykbEA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDEyOSBTYWx0ZWRfX1dnAerjYcdQP
 b8Ef7Y0E/FeivrYG/edJaa08+nEQ3ANr0ooI4N4Jh+8JGUU/XRD3umCO9CrCUFccTujpUsWIuPy
 o3lfqBf52cAZf4WqfR5TzFrTiI8vT4rBfyqxo1Bcwm2PwPOsYrrS6CTwt/jxfoF5KXpgQGljiFj
 beiUeMbjOZtyRnOZYeey+nzq9Y5amjAkQuZj65/6vHrciDOR4Se7O5xuMM/GgagRtqhxOjxdNwz
 gSzPMjg+XHDppZkGtMu3s/0CvhsW5nBmo9S/4Jfp03PZzbKHgaNdWG/cvGocb7QfwjdHXXqflmE
 cprkO4IJ+QTuVxSJpaFE1JUvegTXNFGQrWkYBf6gxmiAJbNQl2vO+nZIp4qpDlPmu1YJ3TJcqOu
 WCi/GgrMBXF4VZY24ASJlCsJ3o4k0AwA1lWKiyKUYn8fzfK3U51CMDfHVBiR2ZDiOKu7USDR
X-Proofpoint-GUID: OQ6Ghc-6rILbieM1eCc_vwXr4Vu5KsHb
X-Proofpoint-ORIG-GUID: OQ6Ghc-6rILbieM1eCc_vwXr4Vu5KsHb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_04,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 malwarescore=0
 impostorscore=0 mlxscore=0 adultscore=0 mlxlogscore=999 phishscore=0
 suspectscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507030129



On 03-Jul-25 17:09, Vivek.Pernamitta@quicinc.com wrote:
> From: Vivek Pernamitta <quic_vpernami@quicinc.com>
> 
> Add SRIOV support for PCIe devices.
> 
> Signed-off-by: Vivek Pernamitta <quic_vpernami@quicinc.com>
> ---
>  drivers/bus/mhi/host/pci_generic.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> index 5c01c23d0bcfedd23f975e99845d5fa88940ccde..3e6e2d38935927cf3352c039266cae7cadb4c118 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -1607,7 +1607,8 @@ static struct pci_driver mhi_pci_driver = {
>  	.remove		= mhi_pci_remove,
>  	.shutdown	= mhi_pci_shutdown,
>  	.err_handler	= &mhi_pci_err_handler,
> -	.driver.pm	= &mhi_pci_pm_ops
> +	.driver.pm	= &mhi_pci_pm_ops,
> +	.sriov_configure = pci_sriov_configure_simple

If I read things correctly, patches 2-4 are strictly necessary
for the device to work under SR-IOV, so this patch should come
*after* all of these fixes

Konrad

