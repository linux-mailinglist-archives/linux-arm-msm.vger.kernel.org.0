Return-Path: <linux-arm-msm+bounces-56926-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DDCC3AAC107
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 12:12:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5618B4A8581
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 10:13:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B1CF27467C;
	Tue,  6 May 2025 10:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mczhZz69"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ABFD14A639
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 May 2025 10:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746526367; cv=none; b=UWX7gQjVtZPmDH53IX1+26mYTcf0ULHyoJrg9BrZKoHnX3mkz5KBy81TpImuIuNvbJKjbGoSgmf9kePPdmxz5f8xdh52OX9YYkaNYeOefeHCy1BXXE/iZhqVsnBH9jhp0rgBVMfh4iMzvewcVjCJzwsLJdYiieImJfOthZf2OXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746526367; c=relaxed/simple;
	bh=HJukHi1LkCMcp62xJpzMIYpieG9w5Sw3zreVCk6scfo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r1BZrkamB6vPMHqAjNxiJiew4NyLOWXNWFP/lwAurRe33MKzMp6T4OLhrVqE/ayVYtVUaLG/w5Vm+lUR9qboKABuc8Ja1oZiZdGOyl8F6IJb8UbZzEl8U/w3Vzz+kQ4XvqRKOYtXNsaPRea/qBBTLN9STygHYjhvWMjLoovj2h0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mczhZz69; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5468Y7OQ002555
	for <linux-arm-msm@vger.kernel.org>; Tue, 6 May 2025 10:12:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k3U5Q1/s2e7qAa0fnbs4qZTwxhPTpyKPAzDwJ5zTpYM=; b=mczhZz69HB1x8xsA
	bFl4K6/zEne6ps9qOejw8/Htrkf8XaAgnzYkfpBt/wGwheb1DEgjhaPkZ9XX55bi
	xVo8/3430jIRio26KbLU8ccjFu8lHXQ9G8fa664mFAlyK5HC+Sc/qriV69u6tYvT
	2VVejhUzph+12j3A7JeYt7xUKgMSacENoXwf5VbBb+j5xO3UTqiFaZsseIwtYRCT
	eCRTApGLVnMnE9HlCVuu286npxTQz+GMIJ2Xn25WDhgcIsc00Rwz/yk84y05DXqN
	mhV8S6fHSdkGiSe1MIS/Sa1TMivQLKkJerXQiM7mMV/g9YnjlHh/3Ewgy5ZeZrON
	Dd69Bw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46f5w39t27-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 06 May 2025 10:12:43 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-736cd27d51fso3680679b3a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 May 2025 03:12:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746526354; x=1747131154;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k3U5Q1/s2e7qAa0fnbs4qZTwxhPTpyKPAzDwJ5zTpYM=;
        b=wh9pH8H+Ogg4/PnfXDkNA1JnDACi8CfIiXllWHrC4Z8Jc2VrFnIl25oTAEuQoxglnW
         /ul93IH4kKHnZKVXzcD+yIZx+vd1sZxOXEDhrs2RMQhfU2/kSSivcFkEcleT/262Om8L
         djFqUL5oNuLHq6gL9vrbx/u1Lzvq+jTEC/owLLWCGm9c6Ki/0YoF/5T/mzxYTs7/Ft5l
         o6EgRUhqLzrb7YH74zzsazwYp3zbIHSXl4wgDKqzX+9CCB0S7ICN4mTheYaVmQutsche
         JKtQwR/7IkMu0PQH+ELkayJp4701aL5joi9EZgpYhuR1njae67smFH4+HepudTGMWRw0
         OOeA==
X-Forwarded-Encrypted: i=1; AJvYcCXDRQX+RHaA91+tqzA0kuaUWB0mhkTDhYaDYjACEFkjxdPvDK5swSOmXTtjbyrybZ+UON1DJJqdCr+tLebA@vger.kernel.org
X-Gm-Message-State: AOJu0YyCoy5ImnwhSMEa0U5CS6Dhr59U3qZwxaz1ya2y8l7j4hxnQiGj
	XjtZext7d3CkjWIEjWHPV6rHKPygjkezkuRY1evA7oWguLVkyK92t3KkcAr9WeXmcfcFzSOfoST
	awQ2DkXbGnNig2IJiH36SEH5DoIn/L4Up5+kFSUCFCc5OwlKIl7HOJQN6bgaFhKhF
X-Gm-Gg: ASbGnctt8euTMPw4It+NWMDByN7RFzmJXI7uyKylntR3efds+615ZZdDNHqwRautXhK
	2uG1jGi2kihBEAqWYFwjIkwY/nF9hAbH80rxf9q3MCN4fwRZSBk3waNGq3jZMs8MGLm0EPlJkat
	tGbrz3foo1wA7I7fGCP+aLsm5R4Bkzxzzh1cR1D8PSO734AWRpTNwkwGWQhHb4XZMMbSYtVJ6Fc
	Q8jUOxxkR6TF+dJie1VILEMSdBHa/w17jM87IxQzL8ucmodx0TqYIddta7IZQK29CvQvc3u8y36
	VnjrPACdUcVrF6PTBEX+uUPMW3TxUyQuSM8uZLSR3A==
X-Received: by 2002:a05:6a20:2d26:b0:1f5:77ed:40b9 with SMTP id adf61e73a8af0-20e97eb2041mr16218717637.40.1746526354212;
        Tue, 06 May 2025 03:12:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEhvjkqZaa5GWk2WXy8+Weu8/uaDFvUYvL3eQ4kTQv9vAFiciJDgiA0tYUJjGQ1XP5GX94YBQ==
X-Received: by 2002:a05:6a20:2d26:b0:1f5:77ed:40b9 with SMTP id adf61e73a8af0-20e97eb2041mr16218678637.40.1746526353804;
        Tue, 06 May 2025 03:12:33 -0700 (PDT)
Received: from [10.218.37.122] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74059067f0csm8761488b3a.149.2025.05.06.03.12.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 May 2025 03:12:33 -0700 (PDT)
Message-ID: <14a99ae7-e33f-7160-970b-2097967b8ab7@oss.qualcomm.com>
Date: Tue, 6 May 2025 15:42:26 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 4/4] PCI: qcom: Replace PERST sleep time with proper
 macro
Content-Language: en-US
To: Niklas Cassel <cassel@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: Wilfred Mallawa <wilfred.mallawa@wdc.com>,
        Damien Le Moal <dlemoal@kernel.org>, Hans Zhang <18255117159@163.com>,
        Laszlo Fiat <laszlo.fiat@proton.me>, linux-pci@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20250506073934.433176-6-cassel@kernel.org>
 <20250506073934.433176-10-cassel@kernel.org>
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <20250506073934.433176-10-cassel@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA2MDA5OCBTYWx0ZWRfX600F/80l5RUl
 caGa0xvV6uPDkCjG2ErVJofi0B/tGl2O5AwI/HbmoP1y7BebwMns2h1bO7kktGIEpohabGvV5Wz
 64McgGS0hZaSbhuTclsmSkNqdmkvaUfRj6YVyO8ynakVefmnY+9NkrZivItRlLGkvylCePMRHI7
 VA36U1HL6BGgene7Cyx8g/BXUwjFp5dtWHZjVVHVECypLNrBKuLCUOA72XQDJwlN6U5juLEbdnm
 ZOqknH2dvuoOvnC2LJ+lLuhaWnVJiw9SO14O7VLGyJGBQDbtfV1aB8mTwWwneKYUR4eXrsBNWbA
 Fmq2WgkJhD1p0jwFtQgEixVi+uYy25zE7c9nzXveyAsbQCgVUeBSr+CjG81ncdbEcTbwnsVHQJz
 KPz/GMLYFZW/Ts1espu4eBg18Gs9S/Or+WQuneO6+Pn5cOXdHFYco/9khbzGCzIc3TT8KAev
X-Proofpoint-GUID: 8tK6IGRq8MFG4PV2BeYY9nqKs9DtBNgK
X-Proofpoint-ORIG-GUID: 8tK6IGRq8MFG4PV2BeYY9nqKs9DtBNgK
X-Authority-Analysis: v=2.4 cv=W+s4VQWk c=1 sm=1 tr=0 ts=6819e09b cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=sJz4SpAV8H3t2npvi_MA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-06_04,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 adultscore=0 phishscore=0
 mlxlogscore=900 spamscore=0 bulkscore=0 mlxscore=0 malwarescore=0
 lowpriorityscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505060098



On 5/6/2025 1:09 PM, Niklas Cassel wrote:
> Replace the PERST sleep time with the proper macro (PCIE_T_PVPERL_MS).
> No functional change.
> 
> Signed-off-by: Niklas Cassel <cassel@kernel.org>
Reviewed-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
>   drivers/pci/controller/dwc/pcie-qcom.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> index 01a60d1f372a..fa689e29145f 100644
> --- a/drivers/pci/controller/dwc/pcie-qcom.c
> +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> @@ -289,7 +289,7 @@ static void qcom_ep_reset_assert(struct qcom_pcie *pcie)
>   static void qcom_ep_reset_deassert(struct qcom_pcie *pcie)
>   {
>   	/* Ensure that PERST has been asserted for at least 100 ms */
> -	msleep(100);
> +	msleep(PCIE_T_PVPERL_MS);
>   	gpiod_set_value_cansleep(pcie->reset, 0);
>   	usleep_range(PERST_DELAY_US, PERST_DELAY_US + 500);
>   }

