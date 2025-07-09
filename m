Return-Path: <linux-arm-msm+bounces-64236-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 06107AFE91F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 14:39:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4B0B85A3EA6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 12:39:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD52B1DA55;
	Wed,  9 Jul 2025 12:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="drdx4gKN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42B9B2D9EFE
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Jul 2025 12:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752064796; cv=none; b=ESONrzeer1YIkJfP97y1tLtD4wyOSkAvL/Ny/i/2UiPBcLvmRHJ67pZ3p3ZAnSZ52IRxtaJ8Ca+NLDGqfnf5ut3jZd8NrOuUvPlbhfL2Da/wZ2KHjmsC1MbG1f9uuxUghilTUZFedC8uMKfsBSbxXR6FNzRVzBqw0nqxwzf5TfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752064796; c=relaxed/simple;
	bh=CzTpBjA2vitR+omBvLXiUIC3L2PGyotOkHTVKMqAEec=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HabgPN0+p3xNDhVTrf/frLzDyUQWXl8fb4f0g5A1NtnSn6qusTpPWlFsutiN5eC+LU00PsIK1IzDn4J9qwQbmCj1KzZREY5piq21ghIT2B3r3eh7nOzCESndb8MluopFlhY6f356/838zKjogagDPUM3evPEMCHDQVgGEBTlgFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=drdx4gKN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5697ldWh023230
	for <linux-arm-msm@vger.kernel.org>; Wed, 9 Jul 2025 12:39:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E4JeUBjGXjiulqpr8ObtMjmD+OAC5jcVrNpe3NW17TQ=; b=drdx4gKNJBEiVjKa
	pFzbQ5pKPXyrrXPMylxglnTaYC5rvnvPvEE1jIX1VOgObjerKAlkVUWIs54yaTKa
	giz5vaoOdlDUKMe33JGPz0AfkwTmcZPVIqUXcK0ErkBHlXYs3qNgt3++8qHm3v9I
	T5/8IK5yLxUgE+xYwVH0F35FHemlOeqr3kPefKSspmdYFAZs/EqoC07NJmEVBfbT
	TXxl9uEJPQtU4+rMMp3hSiRd59vsUycUOF+tWFSF8PFULdaXg6vEz/XRwY4o40zX
	UWB9CXGSkN6rm/V/BTsByrL/83AzAQjznWIiPCxd0XqU+lUxatm1B3Fw+tt0OgAg
	uE5KfQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47smbnrxnt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 09 Jul 2025 12:39:54 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7489ac848f3so8327469b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Jul 2025 05:39:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752064793; x=1752669593;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E4JeUBjGXjiulqpr8ObtMjmD+OAC5jcVrNpe3NW17TQ=;
        b=BK65Sv1JbyvM/tcYAMq0dKmfRRAdfLhoKorudGDjJdD/udqCNTarFBI6pyN9HBtn1G
         rqQ8vVjMf/aokLlwlXxz3Y6TophyVc1yMOJuWV6+Q6gXxtslZUpEwcxbmRvUvQJILOy8
         Uhe6RUzKmZFRiyrbIcrjwEqotm5P3HiqzMsOQWvdZjcXfb5y0QG8azd3OfgAtYX5pIg6
         8CaYT9HKd80wZw9BNhI5VhL+al0pPnidvhtd8Lg1eKLe4v70M21eLRqvGMRlf8Ys7t2N
         5dI9zDGP7Mx1Qf+nQae4qDh8Kk4FP4ATSWk6bid7p2EFW4OVE/oKjk5ocH/2ytTkTuxS
         KFYg==
X-Forwarded-Encrypted: i=1; AJvYcCXJ/NzMeezvtCGLH67fqSyuwfZrS+31j6PH/s96cFq2N1ACHDkbOeo9A/Bziue1jf5YGc+0w2jpwGt6myKr@vger.kernel.org
X-Gm-Message-State: AOJu0YwI2vVgl0LiMxWGBR0VH51sUgyFdI9MNiPvR1Vg3rIgItz3pQW3
	cOXJPF1cz7yYUT7VpFU7prjUphWVe1VZgmW5rYD1nNTAEos7mLJF5iS/WltTzFG9Wes/Ru4m3QA
	4mObs9/+OtRD1XITxFXhr2JnFKEka3Fcnfxq9Jgt7wSLQBI9oOIdFBOZYuEIm5NH4Y4Y5
X-Gm-Gg: ASbGncuCj4zZ2WTO0y5xn/H5JU28knrFKuYAFv1KEUmR9+mjBG8g/8E0VmMz1riuj8c
	UBOJMgXIegTBC3B6W1v1+3EhfNWZzY0Q15zYvNcIM09nVBOKKt7dV77hwpftHE15b4dnvmXY0Fp
	IcD9HnGllZcd+CM3nFcVIaz6r35j8MkRZbwWgbJjTE7plG3tdQS43fp526MxIOroH8L9pVsmzeb
	AFZ5nqhNTykLufbxPCmlNN30EnRIW8QDQn1jXVmvzJeHSt4xUWdjblRAy92UHOWaE+pGAhLsEoC
	ZBmLvjmN87a7R5awJM+1qTvpEXBg0jE+Ue5T2vwkGvh5UhHISc3y
X-Received: by 2002:a05:6a00:2445:b0:736:35d4:f03f with SMTP id d2e1a72fcca58-74ea644856fmr3569749b3a.6.1752064793498;
        Wed, 09 Jul 2025 05:39:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFK7VBdZMMbsnBq4tAIekTkIsp6YkexavIr8EuGi0wWr9Tw52la/RWx1TJ63OSStOPaGoyV+w==
X-Received: by 2002:a05:6a00:2445:b0:736:35d4:f03f with SMTP id d2e1a72fcca58-74ea644856fmr3569718b3a.6.1752064793079;
        Wed, 09 Jul 2025 05:39:53 -0700 (PDT)
Received: from [10.218.37.122] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74ce429c46asm14970330b3a.129.2025.07.09.05.39.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Jul 2025 05:39:52 -0700 (PDT)
Message-ID: <7ed53821-c86a-41f0-bb99-ff43ebedd680@oss.qualcomm.com>
Date: Wed, 9 Jul 2025 18:09:48 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] bus: mhi: host: pci_generic: Read SUBSYSTEM_VENDOR_ID
 for VF's to check status
To: Vivek.Pernamitta@quicinc.com, Manivannan Sadhasivam <mani@kernel.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vivek Pernamitta <quic_vpernami@quicinc.com>
References: <20250703-sriov_vdev_next-20250630-v1-0-87071d1047e3@quicinc.com>
 <20250703-sriov_vdev_next-20250630-v1-3-87071d1047e3@quicinc.com>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <20250703-sriov_vdev_next-20250630-v1-3-87071d1047e3@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA5MDExMyBTYWx0ZWRfXzK8tcma41ElH
 tFXNPhk7MCZaamkiGOOzE0E0ljOwsYWYG9/JStx608ZBiht/TkxRSeisip2t5rlVB2ZQ3pDisQu
 Irz37nXMH4W60+N8Fp5KMFU/C52bJUBl+lLBsqliMC85zRtRwPUGkqTKhoWaVtfBYHJjNpWvikh
 juVnfXILnjy39aD3yNZxExernpES3nhw+cAjdA0VJg+eeWumdUKKzKK2KD1c7mW6z1Ob6mzNR8q
 kmjy+yhr9Tb54uva+1x6/C+uALlg+IhiHSl02kWzaal9MoGwmUpdAzIggHc5gsIBvXpUBLE2MB/
 nUwZaY0kEhwUZz97Pbynyzw5iXh7W+GZD/mN/gsfreg01OLK+M84BFszIEsGro2lEiIlKPc5QP7
 MlmgH1n4DQiJpvrWvAkohgg/CtH2/f4z8l4Xlk7Q/rZ3K91OZu4oZeollWeA18QfV59iMYOr
X-Authority-Analysis: v=2.4 cv=QM1oRhLL c=1 sm=1 tr=0 ts=686e631a cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=zv_5qE797hUBxoToDSIA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: aexjH024te0UQonj1XrMJxZGmR0p51xz
X-Proofpoint-GUID: aexjH024te0UQonj1XrMJxZGmR0p51xz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-09_02,2025-07-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 adultscore=0 mlxscore=0
 phishscore=0 mlxlogscore=999 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507090113



On 7/3/2025 8:39 PM, Vivek.Pernamitta@quicinc.com wrote:
> From: Vivek Pernamitta <quic_vpernami@quicinc.com>
> 
> In SRIOV enabled devices, the VF DEVICE/VENDOR ID register returns FFFFh
> when read (PCIe SRIOV spec-3.4.1.1). Therefore, read the PCIe
> SUBSYSTEM_VENDOR_ID to check if the device is active.
> 
Reviewed-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

- Krishna Chaitanya.
> Signed-off-by: Vivek Pernamitta <quic_vpernami@quicinc.com>
> ---
>   drivers/bus/mhi/host/pci_generic.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> index 22de02c26ceb946fb618d962ac8882d2db1be6b4..938f37d306a18b9a47f302df85697f837c225f0d 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -1025,8 +1025,10 @@ static bool mhi_pci_is_alive(struct mhi_controller *mhi_cntrl)
>   	struct pci_dev *pdev = to_pci_dev(mhi_cntrl->cntrl_dev);
>   	u16 vendor = 0;
>   
> -	if (pci_read_config_word(pdev, PCI_VENDOR_ID, &vendor))
> -		return false;
> +	if (pdev->is_virtfn)
> +		pci_read_config_word(pdev, PCI_SUBSYSTEM_VENDOR_ID, &vendor);
> +	else
> +		pci_read_config_word(pdev, PCI_VENDOR_ID, &vendor);
>   
>   	if (vendor == (u16) ~0 || vendor == 0)
>   		return false;
> 

