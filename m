Return-Path: <linux-arm-msm+bounces-64916-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 69380B05076
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 06:48:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BB498189D698
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 04:48:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 369F22D29C2;
	Tue, 15 Jul 2025 04:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lTHCMFWJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7211C2B9A4
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 04:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752554881; cv=none; b=NOrxXBOVlZCkXJ2vYSYf8bbsz5BJs3Ks4KXMul3wIyj3WJMU6B0wPQO/r1X/ukRSxIU0kQWfgvacOKJNwgjwdlkU/DNQlmNwHrBYVjWVMaxHf4PYkOriMXin1oWkRSIrOPK3V6oPuO9Hnld98ekts559tWr5bgqHByCfAuSd/gM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752554881; c=relaxed/simple;
	bh=X5WcdvGOR4ZnxxgkKRanPZQzRvjeUHxMPCMuzd9RT9M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WBCvkvlJb470a0Qvlr2/7wqUXD/GIb9VlbxLT17Sb5mcJ7Nidyxy+/6jdUY3fWBp6jT0I81YPlxRzHryPcP03JfNYym0YXXcCo0zphkH903bmbJZxFH3QPHFNQcvMcCS59yLiWeQmAgpR9xV9DEfIgKtGzkR1W/9eQyQeucPS6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lTHCMFWJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56EGIJLH007836
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 04:47:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1G81B60xsleyJTfUNHppUdfBzYqz0JcVfIPyN+RmVmM=; b=lTHCMFWJPCu8e0E9
	V/AAabygrTtorP9ChfuHJ9QbaufTRbwAtIY2Rnsv6uzT8ZS6xO8bM8WClCszfr+3
	2UESTZeWJreQfs82l6td3wsLsNo7xAOgkgkMFCVK1nxaq0nL16cVvLakSs4lN89J
	WI/HZUoYudLihQS+dLl2FY30gwZV4AIZufsJl3kaOVET2/9yrljJ0YedI4ElPHlF
	nypIZuCALT0fhRhoUCP92kBc2JHq8t5L8/TG0IZzx2QRtDJhe4uc8AqC8RkeqZUF
	csLwdvEUN5twDhMSZpwg9ST71WieDwSh9lhcEKT1jzmlpYdexbtdvTGQO07ozx5H
	+o57kw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w58yhnnj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 04:47:57 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-74ea83a6c1bso2256462b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 21:47:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752554876; x=1753159676;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1G81B60xsleyJTfUNHppUdfBzYqz0JcVfIPyN+RmVmM=;
        b=mYP9T1akwVFOMWeVUcLxYS/I56Bb7WNzOIVni91HHllTJyhXuUwfuMh6Oazfv4znjK
         AO4d8CO8e0ja4dx6GcOQXMJfuHqLkbZRrs0IwJXHBzC8dQPQg1HbfyBOunVgD9YiPrYt
         11S0KNM7XPdnszPP1b0V4ww6T4Cj6UXZb4zuRDN+bIhJfli+inZ2G2qxv2648TrR1dep
         VW7F8aLpsbjyb9zSW18cgtYScJKr/ZU0aeAbnqcFh4lIkBzlESLVlenU7K8N03yPONuX
         2jjvnO8QtgNlmFQHsyz2LVtgRtsQLeYY2GDWBGBWZF7jdlLs23ADhxno0mzLKjkoq+zq
         7nlw==
X-Forwarded-Encrypted: i=1; AJvYcCVeZFlb9F/174vWS1kLLSovwvFpO7A2ZJGPoUzdzrC6jPJw8y2nFX7IWJveQ2/vQtHpthWqpAO5MglvYfX+@vger.kernel.org
X-Gm-Message-State: AOJu0YzNfa0H5HVxDQby223vzOJy3p0+llf/ve90e1PLyjqikUf2qANu
	D0aOvb4vkBht2xLyJ037RZzqzJpy4p8BJdD53hLdl+8ckZbE7kPQgxtAewD7kMTImlfaCVhukss
	bVkkEiN6X5usQhfLeqXSVRiHOwzXVF1FJwuR+y9UcgVmTIK33Rg7gODT47UndgddMHSEU
X-Gm-Gg: ASbGncu1LCDTC4OyTir2CXGcJHbnw7Ejc0sFmo8i+GRcXhTwi9DDIoDANcnltQN2DzL
	i6ta1EdvOlPKsZFHLyDJyhbQrfqnDOBeBlp/c4VmM2LIq/T06nWoO6bP/gQXP9WFbuvKi2SOS5+
	KgT12Za59v7UNTqccYWepp6rll9+RefR0I5YqfJDt1r9jiQ/jO1tLA5wxaAAdSin0i5BfCNfRgi
	mfNc9U43q17cZTGTBJQbYnWGtG9fEdAW+nx9SEhrpymxk4Fi4Q7StHUQgmK1oH60b6sUBockEmL
	/LWsLYKcUJn0ZN/5benBemxm3kin96oJ1oJLHRJ893+kTy/pBqdqO/ElEBiKKCFrRKPKuQ8=
X-Received: by 2002:a05:6a00:148c:b0:740:9d7c:aeb9 with SMTP id d2e1a72fcca58-755b4cb576cmr2345379b3a.21.1752554875850;
        Mon, 14 Jul 2025 21:47:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFLw7QsQsRMoAC5kgpjcNQia8kN0Ju9KrU7l9OxO3SkPSGi12dP1bd89nTq4dVCoxD0vfJycQ==
X-Received: by 2002:a05:6a00:148c:b0:740:9d7c:aeb9 with SMTP id d2e1a72fcca58-755b4cb576cmr2345327b3a.21.1752554875237;
        Mon, 14 Jul 2025 21:47:55 -0700 (PDT)
Received: from [10.219.56.108] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9dd5d30sm11715343b3a.5.2025.07.14.21.47.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Jul 2025 21:47:54 -0700 (PDT)
Message-ID: <08a0b50c-76e3-5c34-22b0-74b8d20c8e63@oss.qualcomm.com>
Date: Tue, 15 Jul 2025 10:17:41 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v10 01/10] power: reset: reboot-mode: Add device tree
 node-based registration
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Andy Yan <andy.yan@rock-chips.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Vinod Koul <vkoul@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Elliot Berman <elliotb317@gmail.com>,
        Stephen Boyd <swboyd@chromium.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        Andre Draszik <andre.draszik@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-samsung-soc@vger.kernel.org, Wei Xu <xuwei5@hisilicon.com>,
        linux-rockchip@lists.infradead.org,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
        Macpaul Lin <macpaul.lin@mediatek.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Elliot Berman <quic_eberman@quicinc.com>,
        Srinivas Kandagatla <srini@kernel.org>
References: <20250710-arm-psci-system_reset2-vendor-reboots-v10-0-b2d3b882be85@oss.qualcomm.com>
 <20250710-arm-psci-system_reset2-vendor-reboots-v10-1-b2d3b882be85@oss.qualcomm.com>
 <5zlix4hfxkz447g6e6imjlatmnf26pvunnsmfkol7mhvropq6o@k7wr6h4hyqtg>
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <5zlix4hfxkz447g6e6imjlatmnf26pvunnsmfkol7mhvropq6o@k7wr6h4hyqtg>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDA0MSBTYWx0ZWRfX6JQ1VDL7uRzT
 juBgL6UQSe7ipA543rZ6E9OgGXetdUgz2FjUFjEYJcvMaJChG0osYHt16i1PSvO9LZfyt+yI0D2
 iYZXDp8HVw83NIi5DLMMUepCd4CgmQtoidP3HExWracWmdwIwka/Mz9wW3v026N8fpQWHgbbNSB
 /5tTwERQ5UWP1MQK+vLm5E6j5FDaiDEsEAUwZuDSewokC7pb4lGnmoIsPx6wJeeZ+KNT9cfPLVZ
 lK/CbsSbzqQWLtVtmWQpyNFxkF6UYWZ1NUftUSVcw8OC4xlvFmTWbTzkMIjm2i9bIUKxaQecGjf
 qlc0eqUzaYb93kL+VsDkXcriNBpethv0JKjl0HmXokKO9hs98hFOftguEhpitEXLMFgNRLcjaE5
 6RWRg9wjXaPNPgGUJuQ+qL+H/5WZ5oQ9rHVSzwNxk7INCU13Cy80Ut5B8PyFXTLRb865xb6q
X-Proofpoint-GUID: 9qZ1PThtgBpHdLBCXJInFU7RXCfCzPWt
X-Proofpoint-ORIG-GUID: 9qZ1PThtgBpHdLBCXJInFU7RXCfCzPWt
X-Authority-Analysis: v=2.4 cv=Or9Pyz/t c=1 sm=1 tr=0 ts=6875dd7d cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=w5sRTUNUNuywR65qw8YA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_03,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 mlxlogscore=999 bulkscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507150041



On 7/15/2025 4:41 AM, Dmitry Baryshkov wrote:
> On Thu, Jul 10, 2025 at 02:45:43PM +0530, Shivendra Pratap wrote:
>> The reboot-mode driver does not have a strict requirement for
>> device-based registration. It primarily uses the device's of_node
>> to read mode-<cmd> properties and the device pointer for logging.
>>
>> Remove the dependency on struct device and introduce support for
>> Device Tree (DT) node-based registration. This enables drivers
>> that are not associated with a struct device to leverage the
>> reboot-mode framework.
>>
>> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
>> ---
>>  drivers/power/reset/reboot-mode.c | 23 +++++++++++++----------
>>  include/linux/reboot-mode.h       |  2 +-
>>  2 files changed, 14 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/power/reset/reboot-mode.c b/drivers/power/reset/reboot-mode.c
>> index fba53f638da04655e756b5f8b7d2d666d1379535..61f647b23959789a313f3af0bd967abcad45fa43 100644
>> --- a/drivers/power/reset/reboot-mode.c
>> +++ b/drivers/power/reset/reboot-mode.c
>> @@ -12,6 +12,7 @@
>>  #include <linux/reboot-mode.h>
>>  
>>  #define PREFIX "mode-"
>> +#define pr_fmt(fmt)	"reboot-mode: " fmt
> 
> This wasn't really tested. If I remember correctly, it should be defined
> before the first include.
yes. fixing this in next patch.
> 
>>  
>>  struct mode_info {
>>  	const char *mode;
> 

