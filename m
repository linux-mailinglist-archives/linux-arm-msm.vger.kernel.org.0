Return-Path: <linux-arm-msm+bounces-65012-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C0419B05735
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 11:55:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1034C17160D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 09:55:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 995F2271466;
	Tue, 15 Jul 2025 09:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m5YS2BWE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33A6E2561AE
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 09:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752573295; cv=none; b=XXHsGpn8JC451r3y/BCitgEpBR2A0NMmw/N7Dkop0e+pwz59sX69wMbK9ZcC3izE8N0E2Ej1dUIsz+CH4Y6ieSnAye0QMq9+dgUTAUHB9MUvXWcsNnccXF+RTsdNqolhq5/DogflarZntvbPBCHlEbnNRYTrsLHdZd6sj2CGiaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752573295; c=relaxed/simple;
	bh=6OVUx+9AwmAwTG1I+KdQVdAktmQDgN5EP4C7NezIitY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DyuRaSGmUPPll0t/EkEF3lmxxTT88uPJUmHoBCTHuce8PjLZhrdwkijTrfb0VSVjN6bxtCUSDQsqtNd5NHQvsJ7ujUrLgOCvAtRzGNDH1MEX3sRE46CoVYhCFrLLAkebGIkklGb/qwKDn9HYFmHiSo5Rde9B0mLLWNUB+TZEUwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m5YS2BWE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56F8ksqv027658
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 09:54:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ix9VuDZeEsjg3KAly3eDP764kZgW3cJT4+AkWYQ4FOg=; b=m5YS2BWEXwTUWNzM
	Ny0qjTcqmh7VMk3IvJ/ykNqT/s22qqoWpXtCfhf5miRg4FVlyl0mUDLeZ9TwhV1s
	xlZzwwbxrY7uIayCVQFvkiVbr2k6q4eUARnUz1iej7Qkt8CXRgwywGRUTf7Gdzsj
	m/Vn2gC0R+I6W54GG7HW2gACmSqqEQnKRzsAudngJqBDDl/muh7QtvQ+WVo/qV+r
	9zlGi4ijehAqP0jAv8h0qy49CZFmVd0y16Hmu+3S62TZx5sLnBmFxR3ewPaWtXGx
	ogXcRleHvisQLl/tlzaQKqi2n8dxZlL2p7qhJtCjcXPhgt3/1R/MS+SLe+gFz7No
	yi8Aqg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47wkrug91e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 09:54:53 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7e2439259caso41673085a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 02:54:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752573292; x=1753178092;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ix9VuDZeEsjg3KAly3eDP764kZgW3cJT4+AkWYQ4FOg=;
        b=l2MeOrDlPY5ylWYRMD+QYTzNOEBAgBVE9E1MRVdTZHuZTgK/SlcZ2UgeAsFa5Gg2I5
         TfnS05kUE1g8dGVW6KyZit0bcCLrivLiWKVWM2gQlZfeCVd3QdvoxDhGwIxa1PT6IHHo
         BHSoIOUBqT9N5RiKX03TrrG/ihMhnz8e6cLtTh9Bt4RCs+C1IfsEezIsTBN3637Wh/c+
         flr8Lhb6Na/HxuPBisqcKHQSly5O0m0OLQ/T5++bQpk1JEn5L/IzqjfvH1aTJj/dp0uC
         HJfhyGslyOf2qrBQh2i8y+jPDPomL4yNStg3K69hop5CZyWRu0spQYJHmgH5fEQE5Ljo
         PPhw==
X-Gm-Message-State: AOJu0YzZ+HqXcOOh384blTrDw8qR7NczDY8ajVfbg8JfQyZdcMLkZ1mW
	03uH79UhRYyBmqOlzV1lPS3MdkuY4xqFp43jKlK231N5SrgSS7AYYEZ9DolJ4ZNlLbLdv9j0Nyy
	fy1jxWG/Tdbptgl++iRMeXrvtXhahi1gA7HUYsJsTgL5CtREbQN1ZKhTDkZmiBMcZdoWG
X-Gm-Gg: ASbGncvqwL6KUEwsJe/De3u8tFKsYQz0F7TZxINUznq+egKbT8Sprgdn5w2TOAlvenj
	bCq/YOA2DRSwCIvD1hITiPOuEhp8TJv2Wp97qtRHbt5/rzx1bTxIcaJ97UBUqknVuM7M7KotivE
	SHFF6XFNNf8Z7r6gmp4L31msJMA4RvsasLvVY+aIiKG4guWtdCHO+CyKcRwfgiIqFo6TvJ5CY/p
	+lG9c8glWx3XT5GvZZENUAgHrW8kjouX/ivQ4IB1TW2S7pksizgx1n+xc4uBCYNVD5+QGo2T7aJ
	FreJV6bo80NOVIjyz4CPqfoKL685wnERyeCx7NFMk+lx8EC5aZ8Wtb8vLIlkoBAN7ImxTHezBkI
	LPArbzKMBa2HN/RAyL5Aa
X-Received: by 2002:a05:620a:2903:b0:7e3:2c0d:dbf8 with SMTP id af79cd13be357-7e33c6fd95dmr51798585a.2.1752573291750;
        Tue, 15 Jul 2025 02:54:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHDVkaPY/EUoM13O4zdHRmjA+XKRxdgOCmfN0kxQpZ1M/8LP2Xug82sWyuGii3UGqvnwGDvuA==
X-Received: by 2002:a05:620a:2903:b0:7e3:2c0d:dbf8 with SMTP id af79cd13be357-7e33c6fd95dmr51797185a.2.1752573291128;
        Tue, 15 Jul 2025 02:54:51 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e82df4dasm977493966b.157.2025.07.15.02.54.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Jul 2025 02:54:50 -0700 (PDT)
Message-ID: <b2f4be6c-93d9-430b-974d-8df5f3c3b336@oss.qualcomm.com>
Date: Tue, 15 Jul 2025 11:54:48 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] PCI: qcom: Move qcom_pcie_icc_opp_update() to
 notifier callback
To: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
References: <20250714-aspm_fix-v1-0-7d04b8c140c8@oss.qualcomm.com>
 <20250714-aspm_fix-v1-2-7d04b8c140c8@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250714-aspm_fix-v1-2-7d04b8c140c8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: fDM2XVYhWPvff3oFKmHqEgNyta-8mhVH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDA4OCBTYWx0ZWRfXyX+dpqIMk4+V
 /3iljMJc1Fy4AwcK4jCSRovYVDr6R1SzK7sFw7hdWP/MPYJUyqy6YIi0+8cTN/fGvdm9Rm6jsjC
 pn+lLePyzO0302amCJwThlwh5rxEsNm73thBDyewMrIxRjUaPxkwk2Ztu65B6QcCvDOiJOZhTv9
 6eyxaUTumgaqJY6dCqxxjdcLQm7yckiBmKYXLmcibt5LAXlNmiUKhvBfoQ/tbMKwPjNAIQvBlTG
 B/nN2GIQNTTIatk9qRDQvOJs6z0xtm5Wckod3U/JCkoKBO9l1JFKljyUmkcGr1tqw0Z5yZnIlkg
 mkyC9pBSBFn1fuogCvT2eI9En3md19m61ioSsgTfjtmgdCJOPUHjego/R/Rsh0oT3ZNrsYPkVX7
 0xDTSmmrcoJCtFWYAaq1GUiNblf8qmwz27RiB1YNsTe7Hf/iJ5dg40x5adUkzCZ0GDMiwlg+
X-Authority-Analysis: v=2.4 cv=WqUrMcfv c=1 sm=1 tr=0 ts=6876256d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=u1rEIhXAyoO4lQmzz6IA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: fDM2XVYhWPvff3oFKmHqEgNyta-8mhVH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-15_01,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 mlxscore=0 mlxlogscore=995 bulkscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507150088

On 7/14/25 8:01 PM, Manivannan Sadhasivam wrote:
> It allows us to group all the settings that need to be done when a PCI
> device is attached to the bus in a single place.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> ---
>  drivers/pci/controller/dwc/pcie-qcom.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> index b4993642ed90915299e825e47d282b8175a78346..b364977d78a2c659f65f0f12ce4274601d20eaa6 100644
> --- a/drivers/pci/controller/dwc/pcie-qcom.c
> +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> @@ -1616,8 +1616,6 @@ static irqreturn_t qcom_pcie_global_irq_thread(int irq, void *data)
>  		pci_lock_rescan_remove();
>  		pci_rescan_bus(pp->bridge->bus);
>  		pci_unlock_rescan_remove();
> -
> -		qcom_pcie_icc_opp_update(pcie);
>  	} else {
>  		dev_WARN_ONCE(dev, 1, "Received unknown event. INT_STATUS: 0x%08x\n",
>  			      status);
> @@ -1765,6 +1763,7 @@ static int pcie_qcom_notify(struct notifier_block *nb, unsigned long action,
>  	switch (action) {
>  	case BUS_NOTIFY_BIND_DRIVER:
>  		qcom_pcie_enable_aspm(pdev);
> +		qcom_pcie_icc_opp_update(pcie);

So I assume that we're not exactly going to do much with the device if
there isn't a driver for it, but I have concerns that since the link
would already be established(?), the icc vote may be too low, especially
if the user uses something funky like UIO

Konrad

