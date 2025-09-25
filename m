Return-Path: <linux-arm-msm+bounces-75043-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F0358B9E5C5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 11:31:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ABA813B3BE3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 09:31:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BA9E2F39AB;
	Thu, 25 Sep 2025 09:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RXKzxbAC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CA0C2E9ED2
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 09:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758792478; cv=none; b=BKuplRKAsZd505BiTfPbaXPYZdBrsrJs4IuuW+P/d2ONHFUgjZ90ZNlEsiir8XutgRJi8FZN0sYFcId8ZGRK35NWveHCiyvL1C7OPea3w2svbI6jT2n6jeT8ysF9BEbjfc1RRvaF1Y8J83Fkhi7057V7aPQiP1VFBFUWMsrGOz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758792478; c=relaxed/simple;
	bh=kybbvXhHxELtxPAzzOcOTx6gRpgiCCcD9x5PrtveDbQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=df4oAfMeAWO61O5/vhkc1o547zXD7tvtf35MCelcvOORyzPJ9WCfqxpw8Lb11yQvCYQst6vHz6XmeOoxDIvhbE0Cmkm+AtNEIBLyAwsK3V7Y8bHaVwW57zgTFdd3wVbNYlLsq1DgmpYw8oVFgoL287zyFggYIdnf347bHp3BN2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RXKzxbAC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P29o0J029717
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 09:27:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WUqki5AzViBdF4eWTm2k5POhswMbNALIQr455o+v3LE=; b=RXKzxbACfU6aYseM
	WS/frB2kdxl9qtA/ZbXY6GHtrmGzwQ8xlO4nhwcH+IsJZL1MRxwlXv0Mj1SozAeC
	I0Tz5tKQ5EtLrofZi1ph7Y95gJ2Jm/7Er8Ngny/QDvIGAcxHwfwvMuq27BMP3mZx
	PfkFRWNSjxxQd/jVQLu4a/4M0wNZqt7/6n8n62bC5t2Ds4E7K3q8mrUoqgOxOVS3
	4YI+Psb27Icecc6jEQSytulRebFtycuo4rvkBuTgTtYWvkh3MydV3/WH+1FDGHIC
	+xwUd0LnCRNzA6/F0/shoWQz7T6HQtuoxDH+Xb/q3eVjXHbCLTT8sck5WYMrkyPQ
	qWNYug==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499n1fqf0h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 09:27:55 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-7abea94d621so1842476d6.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 02:27:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758792474; x=1759397274;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WUqki5AzViBdF4eWTm2k5POhswMbNALIQr455o+v3LE=;
        b=vCmw+3eNoDjTnOJqDaocSzVY8yYmkdh/yR/7dfU63a06Dynr4hXDKh/UoezeFnqoV3
         SSDC6MjJHSZTDs6uOGzL0UyKcqH0cQzf3TGOYuyMAvYVsYkvf4y81eahy61peA5oz07g
         vqKyz5KUXUVfSr6jp3MJL1JX0H1rTtqXHtc5rCu6Wzq7nKJwh5eVlBD3/b8KF5K192WR
         skrFDIGWzYz0+8oKRgYF9vQ8ry9ML0REl+1tjGmJaXN7QR/ugJFkQcnIHD92/1KrBcH9
         goHzsGDNawlb3FS30WMvaW/tWK5G/HZTVqT6UJDUbp3kd4+KEaMU9zx+/OsL0GNbSxym
         yf+g==
X-Gm-Message-State: AOJu0YzqpSJ23YhUEkVUdh+cJl+zhGOToWLDIqgERF+5pObBylXiEDTW
	gQ+SdRdlCAP2H5p9OQaPppkb51y028BchlV15b4bgQshyBXbWdSojdVNVKonqzwMgRfx6mHsQrw
	a3CpFpMMfhnlOafDGqGPe6NYIluXi/k3VN1jgRfraMOgHa8vB1vFuhJa5wuEn+aeY5B7d
X-Gm-Gg: ASbGnctdGrgvJHkLp1oMuR9LzBcWnpIcFBByELYfRg9+dnDno329DLxT3mGlX5EBMWe
	Sd3+2Fd+nq6ku9l+1t1KFjKI/dbCiSWkGWxD88Aamqhz/VJvPViybVHh9iTAYwwhGT9+8ZgTrHQ
	ccGv7JeX97SYHwGbtzwkUfsWQxuG6fS79dqppaPoFjganIrv6HrMQb/MAbphyJ73/eia4ykA4rS
	ub5XGx4yHlCfDoGtBHsxxZvRhr2w8+Frmp9eFrvYWHfKzzGGpMWlYGwUw0ei4AQ8lFcLN1EoFi0
	de4lTNTWGiLLNvQ3q+twSqcGzy5jEICRwYB/yF9I0ltI5CtcqTLjRnA1f3ZgDGbKbKiBLzLad9u
	RO0czqkofWT0uAQl2XrYTcw==
X-Received: by 2002:a05:6214:ac2:b0:798:f061:66bb with SMTP id 6a1803df08f44-7fc27ca1971mr29184286d6.1.1758792474014;
        Thu, 25 Sep 2025 02:27:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFNXr6Gkp6aLTf5IZJgLqxFdi09mSj1x0yLj1wpVf5n029+3a2r9XtLvmqiNW/o5lBQYVn2jA==
X-Received: by 2002:a05:6214:ac2:b0:798:f061:66bb with SMTP id 6a1803df08f44-7fc27ca1971mr29184116d6.1.1758792473575;
        Thu, 25 Sep 2025 02:27:53 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-634a366116esm914520a12.21.2025.09.25.02.27.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 02:27:53 -0700 (PDT)
Message-ID: <6626df48-bfaa-48a5-ab50-91422d252e86@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 11:27:50 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/10] phy: qualcomm: m31-eusb2: Make clkref an
 optional resource
To: Wesley Cheng <wesley.cheng@oss.qualcomm.com>, krzk+dt@kernel.org,
        conor+dt@kernel.org, dmitry.baryshkov@oss.qualcomm.com,
        kishon@kernel.org, vkoul@kernel.org, gregkh@linuxfoundation.org,
        robh@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250925022850.4133013-1-wesley.cheng@oss.qualcomm.com>
 <20250925022850.4133013-10-wesley.cheng@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250925022850.4133013-10-wesley.cheng@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: PicKgbjY9pX83XcNopMC2-zO2iprBHCJ
X-Proofpoint-GUID: PicKgbjY9pX83XcNopMC2-zO2iprBHCJ
X-Authority-Analysis: v=2.4 cv=No/Rc9dJ c=1 sm=1 tr=0 ts=68d50b1b cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=rA21lKwlbNzYapJBHGwA:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAzNyBTYWx0ZWRfX8jE6XKtDh6bb
 Y1J6emENBCwuSAV01gofCZKIPlKmRuh+vlMKk2f8TqPzkwV5I0Qx5PgxRmH5Gycoh4mqIpGu6kT
 /7Ekn3ZqBBhmhoM6VtwqX57ofjxNTVgVOZbPMJBktXxTw5+X77pA5AHLNO0R1UYNg2RYgiHAcLx
 fQKK7tfLRk3n+zL6BJgGxhO98zZENHPwkl96Z2BPQCxngTwLOTo4pKVb3pdxyAEGnY1KYyS92hh
 Qs16AjKl4TugHkD3/ivTK1wNDjWfkSRAFQbTyaoiQdlI47Tm3zhex1kzyGZAJyUaoYOyj30WWDD
 D0QY3ZUopP+ZtZFMzYHKoLBKVyb7exllAhuB2XnPIMpHzQJzHLFi1XeeW/8EVGGiT4rZEuTqVa4
 zlMHn+Dc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0
 phishscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200037

On 9/25/25 4:28 AM, Wesley Cheng wrote:
> Some USB subsystems that utlize the M31 eUSB2 PHY doesn't require a clkref.

This is more likely "doesn't include a software-controllable" ref clock

but that's "fine"

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

> One example is the Glymur platform, which contains 4 USB controllers that
> all utilize the M31 eUSB2 PHY.  However, PHYs associated to the primary
> and secondary controllers do not require a clkref resource.  Due to this,
> mark this as an optional clock.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-m31-eusb2.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c b/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
> index 95cd3175926d..f8a00962f937 100644
> --- a/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
> +++ b/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
> @@ -267,7 +267,7 @@ static int m31eusb2_phy_probe(struct platform_device *pdev)
>  	if (IS_ERR(phy->reset))
>  		return PTR_ERR(phy->reset);
>  
> -	phy->clk = devm_clk_get(dev, NULL);
> +	phy->clk = devm_clk_get_optional(dev, NULL);
>  	if (IS_ERR(phy->clk))
>  		return dev_err_probe(dev, PTR_ERR(phy->clk),
>  				     "failed to get clk\n");
> 

