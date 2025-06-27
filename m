Return-Path: <linux-arm-msm+bounces-62770-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F7AAEB780
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 14:18:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 271081C414D9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 12:18:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1D732D1309;
	Fri, 27 Jun 2025 12:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U5WY6yM1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62EA62C08C0
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 12:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751026672; cv=none; b=YCUgAdJf9jQNUmY46CdJBfBLYlH7/wlesoDHB9Sx1aSGlN2CxR5v0PFL5txO5JgmPkHXbmSoWOhIATXN7zr6Iwjd2xY095tS8LzOXI45a2u5eSepzv9y90NFFGzjaXuYh8jRtV5i00dFY8nIglqrBjENEsY7tRj6wzyWLQjl8Sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751026672; c=relaxed/simple;
	bh=v3QX3Afeas81e+EF6HMBDd25NmIGUj7jDZzFi1LVFiw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rhEg1QDIl0jHkHSHjQQNoEatWPh0ntbkpGaeEGswG92d5j78ZbeQMLTFMLHcEjMm4s6WS0J8MmT0VLJ76wq3uzvKATboY2+T9zo/kwFtTX2OZEvxCkupFs33tmqmfJqLuofXi6p0/8IhPE9WpDvgiJLoAFVNM693/xm9qD1yak8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U5WY6yM1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RCFxQq032644
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 12:17:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Pr9vUYesZdm4JzIlIsCSYX6P
	YlYwaZmzrAy5ZexrtfE=; b=U5WY6yM1dhlx0Of0UNFdAiBxbIAOQc7lrHb3qBem
	OuGa3tvA6A5dhVqc/F333Y8zafGSUUrGH89nRNEEdPT3NfegSJqK+cPbwVfq5W3v
	YPfDjNRi5sXgt5D4Ea+uPbvcU3SLwCY9EkM8wor38iucF/faJSZfVrvbcVGonoXN
	9BOXveWioMZjuxqUlgCOEzCGbWgnVgtYqdhAxGQnRPd1dX+pdJKEyRrSRczD1jAV
	CZg68Hmk+YG8VnMrF//fU+oMeoGV0idyawDkqKTbBiSfME4uIBVDDZ2wJNMopZth
	VYijwIKzR+9Qg6F2jj8UX10dM/lAxbjoIJQmXg4XeVrLKw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47g7tdgspm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 12:17:50 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d09bc05b77so326521285a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 05:17:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751026669; x=1751631469;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pr9vUYesZdm4JzIlIsCSYX6PYlYwaZmzrAy5ZexrtfE=;
        b=MHSMJfnAJmfkZas/k5tBX8svGTyUWdvzUuts/XDmkV9aOZWMTunbdCgr2Wi8cKkB2A
         3Rj1m8pvkIEZVc1eA59lfuPbmx1N4UpsgoDq+9wlgXEDDiZkdCwQBwe73ORrBZGCMw1t
         oiouq/428c536+TWvo+GPIpxJtygI5F8msLuD7v9cwLXXbEuCs9cHW6dl6Cl0ABmoQHB
         ldGenyr3kSfIvuTu3BkBJ9Fabr1IoOmYRbHu/NF2hOoG1RFE+7D6scjBIaQHnqHEknM7
         re27uDcgdKVyQeNINUFcus5dn5LbD7zJfJobKhc/epVsESdiZGRYqpuZ2cMHgiv9yJCM
         jP7w==
X-Forwarded-Encrypted: i=1; AJvYcCVeEQ6v2SjlQMb1oTOfyjHA226SE+1gI6oe1n8RTdTaJqhRot15KZqLP4JBkFYqSQdJK72i7QG2hMKSBepQ@vger.kernel.org
X-Gm-Message-State: AOJu0YxiCXt9IqmVzXFH/24hYomy6qjKMYf5WkrQauqjhc/20MoedClc
	r7xvHjyqJfGqORG6Up5rmfRIcabdstKJOXZoPUheamyhvD6+mqhYplkQ6Faf8ToSkXeVf2c0Ngz
	L0sqOMYDakZ7+CB3Csn9q7oJbd+oDi1DRLt8pu92H2hlN81BDLk+mi6VVVp6dqqAmC+MM
X-Gm-Gg: ASbGnctu6oZBUlwvzwyhMuS/cEhoOpvCl3+6AQbunawSzNVayJRZLosdnI4rvz4NF/w
	b26VcdnihHeUSqH4n0Xbdx35nBNXxQWFGsVhQfTqhM4uy1N9wL7DZpjo/E+2el5RltxiD1/oByl
	zFYzj058IseYo+1+FbJZKCoB6pY7ppCAZMGLmPHpwUxt9HWD9FMbwnx0jjkR6tWSEyVpyGD/U/u
	zm8VPmzGc71ZEKhaqBuqbd+gN8EhN82VCs/uBYsHPdkKyT9gdtvAS4kMubDEXsCTV/wZ5NV81v1
	E/EwrlzI9OZr8N2xtPlHGYkTBUk+kES2bvLXU0Pnk7Au5P/UAyPG2Ue9ZayOLqYZDf93NZbZ2Ai
	tlRWS3/W3y5SoVBhYqmnQ9RlZZ9ZBgu6Hwho=
X-Received: by 2002:a05:620a:454b:b0:7d3:90ab:814a with SMTP id af79cd13be357-7d443966499mr465534485a.24.1751026668865;
        Fri, 27 Jun 2025 05:17:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE53TuiHemyVlZYqUBDNjkg4jxX5jzW+V4B37QnmG5/oOpb/IpF0dKKWh78cykDpli29uTTeQ==
X-Received: by 2002:a05:620a:454b:b0:7d3:90ab:814a with SMTP id af79cd13be357-7d443966499mr465530985a.24.1751026668406;
        Fri, 27 Jun 2025 05:17:48 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2d6559sm423661e87.197.2025.06.27.05.17.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 05:17:47 -0700 (PDT)
Date: Fri, 27 Jun 2025 15:17:45 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        chaitanya chundru <quic_krichai@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Jingoo Han <jingoohan1@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>, quic_vbadigan@quicnic.com,
        amitk@kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, jorge.ramirez@oss.qualcomm.com,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v5 8/9] PCI: pwrctrl: Add power control driver for tc9563
Message-ID: <lc4kdlyxizslok5dhesv5midbgrmvrke54auklabtlzb33hiqx@u2racokpm7zm>
References: <20250412-qps615_v4_1-v5-0-5b6a06132fec@oss.qualcomm.com>
 <20250412-qps615_v4_1-v5-8-5b6a06132fec@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250412-qps615_v4_1-v5-8-5b6a06132fec@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=CPYqXQrD c=1 sm=1 tr=0 ts=685e8bee cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=iCQUm_DZnflqCqe5PXQA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDEwMSBTYWx0ZWRfX36f51ja+p7iz
 YwUU3SoXonoxFpRflZ3iU8pNu9UlwuQhEmQAWB0S2guIFKcsTZXDjON9QpJ8sWkGu5QFkJdy9xh
 p862UYoqQqp5QsVMtEVp9u18Y+ZDfLBwLXXDxxf6XAMF8CnzLf/e9NVMNMXc6+CHjW63US10I/W
 DMeITnW9UONbi8Xhzhb7SD00aiwxcoUn7/+Ohyrmq2HrT73K+lYpEfeh7WVAM3xTN7dKs14KdB3
 T3gIRQfxrnUeGUQdscJaUnmWlwxP+72WO45hesOcUSYLddhZQFywmOC3NaLv07amy/d/ZxPDi4d
 p2ZdV8SgzDTf8+4e4IKctlngqKi4ZHuRngGtOeFgzrL4iJ1GppyR4aZh9gCiQ0sZMYBv+dnGrnz
 ni6vzGbDNPoejV79+6cJa4xfDI/VCh5YNdbNJIkDVWdavueoav4SJLYcvZ3Jta7M/UC912zs
X-Proofpoint-GUID: 4p51UPev9WJkSYgMJCV59mhWd5GHTkHz
X-Proofpoint-ORIG-GUID: 4p51UPev9WJkSYgMJCV59mhWd5GHTkHz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_04,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 mlxlogscore=999 lowpriorityscore=0 malwarescore=0
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 adultscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506270101

On Sat, Apr 12, 2025 at 07:19:57AM +0530, Krishna Chaitanya Chundru wrote:
> TC9563 is a PCIe switch which has one upstream and three downstream
> ports. To one of the downstream ports ethernet MAC is connected as endpoint
> device. Other two downstream ports are supposed to connect to external
> device. One Host can connect to TC9563 by upstream port. TC9563 switch
> needs to be configured after powering on and before PCIe link was up.
> 
> The PCIe controller driver already enables link training at the host side
> even before this driver probe happens, due to this when driver enables
> power to the switch it participates in the link training and PCIe link
> may come up before configuring the switch through i2c. Once the link is
> up the configuration done through i2c will not have any affect.To prevent
> the host from participating in link training, disable link training on the
> host side to ensure the link does not come up before the switch is
> configured via I2C.
> 
> Based up on dt property and type of the port, tc9563 is configured
> through i2c.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> Reviewed-by: Bjorn Andersson <andersson@kernel.org>
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  drivers/pci/pwrctrl/Kconfig              |  10 +
>  drivers/pci/pwrctrl/Makefile             |   2 +
>  drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c | 628 +++++++++++++++++++++++++++++++
>  3 files changed, 640 insertions(+)
> 
> diff --git a/drivers/pci/pwrctrl/Kconfig b/drivers/pci/pwrctrl/Kconfig
> index 990cab67d41332a8508d4150825c621eb86322c5..d14ef2b0ffd84f9a8c4266fdd57a27f7f3611ca4 100644
> --- a/drivers/pci/pwrctrl/Kconfig
> +++ b/drivers/pci/pwrctrl/Kconfig
> @@ -21,3 +21,13 @@ config PCI_PWRCTL_SLOT
>  	  This is a generic driver that controls the power state of different
>  	  PCI slots. The voltage regulators powering the rails of the PCI slots
>  	  are expected to be defined in the devicetree node of the PCI bridge.
> +
> +config PCI_PWRCTRL_TC9563
> +	tristate "PCI Power Control driver for TC9563 PCIe switch"
> +	select PCI_PWRCTL
> +	help
> +	  Say Y here to enable the PCI Power Control driver of TC9563 PCIe
> +	  switch.
> +
> +	  This driver enables power and configures the TC9563 PCIe switch
> +	  through i2c.
> diff --git a/drivers/pci/pwrctrl/Makefile b/drivers/pci/pwrctrl/Makefile
> index ddfb12c5aadf684cf675585b1078ecb7c24649cc..5d0163c75878d5bf702bc6c892fa31bfea5a95e3 100644
> --- a/drivers/pci/pwrctrl/Makefile
> +++ b/drivers/pci/pwrctrl/Makefile
> @@ -7,3 +7,5 @@ obj-$(CONFIG_PCI_PWRCTL_PWRSEQ)		+= pci-pwrctrl-pwrseq.o
>  
>  obj-$(CONFIG_PCI_PWRCTL_SLOT)		+= pci-pwrctl-slot.o
>  pci-pwrctl-slot-y			:= slot.o
> +
> +obj-$(CONFIG_PCI_PWRCTRL_TC9563)	+= pci-pwrctrl-tc9563.o
> diff --git a/drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c b/drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..547c764a6f405a676216309ef6ebcaffbbc3f1d6
> --- /dev/null
> +++ b/drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c
> @@ -0,0 +1,628 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#include <linux/delay.h>
> +#include <linux/device.h>
> +#include <linux/i2c.h>

Missing #include <linux/gpiod/consumer.h>

You are using gpiod_*() calls, but don't include a corresponding header,
which breaks your driver on arm platform.

> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_platform.h>
> +#include <linux/pci.h>
> +#include <linux/pci-pwrctrl.h>
> +#include <linux/platform_device.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/string.h>
> +#include <linux/types.h>
> +#include <linux/unaligned.h>
> +

-- 
With best wishes
Dmitry

