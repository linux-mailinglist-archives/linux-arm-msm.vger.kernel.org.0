Return-Path: <linux-arm-msm+bounces-57797-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D7EAB6337
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 08:33:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 27D6F3A5F48
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 06:33:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 112A5201004;
	Wed, 14 May 2025 06:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qgum9RVd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72D1F1F8728
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 06:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747204410; cv=none; b=ORWj9ChTBzHXPuEK86ISDv8y5Ct7TgsOMSgPpsH64FDzMNNgEkIjVQuRkhjVOqFG7oQLyNJIxlxNI/Y+eDKt5y6ccvvCjJdUoPCcdf+CjhfpGzOdKbVZTJWrReQ1VhIK9n4sm5R+pZEVxNjmJV5wXuc4GSiFwww4Pjfiwkc8SvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747204410; c=relaxed/simple;
	bh=JgpoqlmhPbga+iSpI3Dq8T9wQi7al707Y2vBFEX1SHc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KRErTpwMMhbYMo16wjvmIG2UPRMVGJ6tUfRKV6nF6SZZtxUrZmFMdKKJ3g2JrGsms0iCGYrUPfIAY8FgBeX9USb81DwlCiV5gRa5jbkIm7n8CjkDUSObacQNpcpbNDw/JDNk346L/G/o0D3aOyxpEYSozod+cQnLYktguZDgP2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qgum9RVd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54E3Oc7l005921
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 06:33:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B5/9vS4FRS/VQGDmtMWL7u/M6hqf8gvfjYWZW3i0Gc8=; b=Qgum9RVdjs2zkR+i
	e+oEfIDzCrFRwrJwHknja+NnTYGUe0kfBGaxE/kcH1zG/HAgklYoRDOwP9WbKIer
	JsempM+UrVFDW0Ca2k6zuHTR3YlTCCeGehDU8P880C6sn9rTz1C17HS1IJkgknwl
	EMbX0ZmrTikpz8hny2XKCvYV2IUuFi4JSMIobRfrCD3HsIhMxv+A8kMvaRSj+3sm
	NVCUWEEkQnKoEsoLsdpf/TVzw03pnSRTjgfeQYWsb/Jxv+yi9STPWZqzAuqpBffr
	1ffX7foKv+FP8pLkITytCg+xFIiiSi+DWt90BfNQaIFiFVrYDKj7i2ZQI/HkSZ1O
	o/x1lg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcpsnf7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 06:33:26 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-af8e645a1d1so3644110a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 May 2025 23:33:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747204406; x=1747809206;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B5/9vS4FRS/VQGDmtMWL7u/M6hqf8gvfjYWZW3i0Gc8=;
        b=sEoJtFtQpPk+vBiRbEMITxzrOyh5yGEfwuz0CgI9U/FZqBd9XrMLXwKFfu6r53QVZd
         bOiAg+38dBlc/VCtzVLFqR2jWOvpg4zmxYyYVxGkRTyGYfeTy3iuKuuRX6hNYNbBl2yO
         l40u8lSLg2Ak+tDJ9F2t7wBzqXuBnEtAkbzv70nZ3d4BigiMUeCVOtd0+2mu1glDvPN3
         ZKLWXqLERlJKKACqIj3Mqdua+w3pHEppP4KJOral8Hpm87rdTIallVgcVXwqtOUXYRyD
         s9ufNQUBt+wRxuOGgrtepcpA0ffLuuCbjuB/7EuiMHw95ofseBVd6bnw72mBOymd9QU2
         zOLQ==
X-Forwarded-Encrypted: i=1; AJvYcCWNzQmmP+IkYZgbDUkMDKjZHkiBEHeIJtPguC9BuD/QVhNEudR8Eofwm8OXo7yWBKopD2ioalryZLVALPqV@vger.kernel.org
X-Gm-Message-State: AOJu0YyTuhZwojfiv3dXrkFVQ5CezIZ3VifmmwesJNHSVUNsvgRvU4id
	C3nFfMslyNa/hajoOG9gM5HqY/o6NvQIQUbYv1uDXEqDtgXl2uIzKSXs2DiBA8P0Vx3eMgSNGWL
	O4mUo4vv3U3aEavvkW71qKg81ub5piwqOyTmoAn1K/wKVdcn7xkzwMU0mstPzyvzG
X-Gm-Gg: ASbGncuAOF1Ss3snbcKO8u+PiEDB027DCfcpPnBP3XogyCTkJj3mNHW6sPoR1PN4uX1
	TTmFKF5Q51has8JFW51MUi0ahYsZSyIqArzNlq5UP4MJMcE3eR0ElD//oNoNKjFvm+5RGx6E3PD
	99Gm64NAMyLXTgpkqjqWg2e8HZ6G2oI/VsLdZDgB+xllhxbnFhOSd6bpkEnxI2VYOr4twb9cF9o
	WhtxuLla+RUaP/Cp7AnpGmDYIKm6HZweZ/r7wY0ucgfFmkp1EX08RGKH+1elOPt3QLKsaKPhP7f
	BburUTcDQYpp6jRkArkEC/VvL2IKF8ZyidzMywf3Ug==
X-Received: by 2002:a05:6a20:2d2c:b0:1f5:72eb:8b3f with SMTP id adf61e73a8af0-215ff11a590mr3261476637.24.1747204405606;
        Tue, 13 May 2025 23:33:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IETSoI9iwfk9eb2Ld/QSv1BSUXn0GR0U4QVFH399Z38VQi+OSfnyJ8EGrjE5OEBrun47fcpcg==
X-Received: by 2002:a05:6a20:2d2c:b0:1f5:72eb:8b3f with SMTP id adf61e73a8af0-215ff11a590mr3261433637.24.1747204405177;
        Tue, 13 May 2025 23:33:25 -0700 (PDT)
Received: from [10.92.214.105] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b234941baacsm8298049a12.14.2025.05.13.23.33.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 23:33:24 -0700 (PDT)
Message-ID: <8899a562-2efd-9a63-5fc2-2972f47a9296@oss.qualcomm.com>
Date: Wed, 14 May 2025 12:03:16 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v4 2/5] PCI/ERR: Add support for resetting the slots in a
 platform specific way
Content-Language: en-US
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
        Oliver O'Halloran <oohall@gmail.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>,
        Rob Herring <robh@kernel.org>, Zhou Wang <wangzhou1@hisilicon.com>,
        Will Deacon <will@kernel.org>, Robert Richter <rric@kernel.org>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Marc Zyngier <maz@kernel.org>,
        Conor Dooley <conor.dooley@microchip.com>,
        Daire McNamara <daire.mcnamara@microchip.com>
Cc: dingwei@marvell.com, cassel@kernel.org, Lukas Wunner <lukas@wunner.de>,
        linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org
References: <20250508-pcie-reset-slot-v4-0-7050093e2b50@linaro.org>
 <20250508-pcie-reset-slot-v4-2-7050093e2b50@linaro.org>
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <20250508-pcie-reset-slot-v4-2-7050093e2b50@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: BGyIv0SIGDBUbxoD5C5kKWzWYH-uviQK
X-Proofpoint-ORIG-GUID: BGyIv0SIGDBUbxoD5C5kKWzWYH-uviQK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDA1NiBTYWx0ZWRfX9rG/DabQ8gUq
 8suVxABQWNKyD35dd0TfyMPPu78KSXad3U5V78BCL/XzpnyS2YLYZgJqNoEh03LXam8weu61UkF
 SzmeDyg2/ZNUZ8q/xeayBmgtBLZbxPslNpFhOzhLYZo3eI7s7ZlyJDVyj47gFOf++Ff/r2ieQQA
 pyhJeL+YvOldYJ1GN5DkIH1Us9HSI5I2h53Kd333nEDqavH8kfDpX6j7n7r8FIVg+XARABYbyqi
 r/0QvjlV2mbI48DPwmvFb/bvq2uF3ZZBzzSyuBfoPr16VM32NOeeGI57vqwCtUGOT5i89zSPV9w
 2EhzRaMhxVPwiGTuq0AiNojFO/2DXYAZDg01fZq0wqQmAvmjpqfdhpqoCUkk1vYBae3OTcF+9El
 LOI9zJ3feo8miRg9U99modV8sGsWeKD1TzcybtvEVN7wDHofoReOdZTERSqt26aPBhHKDNWc
X-Authority-Analysis: v=2.4 cv=KcvSsRYD c=1 sm=1 tr=0 ts=68243936 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=ljfrh_M9o-RCrfJy5NoA:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_02,2025-05-14_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 lowpriorityscore=0 mlxlogscore=999 spamscore=0 malwarescore=0 impostorscore=0
 mlxscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505140056



On 5/8/2025 12:40 PM, Manivannan Sadhasivam wrote:
> Some host bridge devices require resetting the slots in a platform specific
> way to recover them from error conditions such as Fatal AER errors, Link
> Down etc... So introduce pci_host_bridge::reset_slot callback and call it
> from pcibios_reset_secondary_bus() if available.
> 
> The 'reset_slot' callback is responsible for resetting the given slot
> referenced by the 'pci_dev' pointer in a platform specific way and bring it
> back to the working state if possible. If any error occurs during the slot
> reset operation, relevant errno should be returned.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Reviewed-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

- Krishna Chaitanya.
> ---
>   drivers/pci/pci.c      | 12 ++++++++++++
>   drivers/pci/pcie/err.c |  5 -----
>   include/linux/pci.h    |  1 +
>   3 files changed, 13 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
> index 4d7c9f64ea24ec754a135a2585c99489cfa641a9..13709bb898a967968540826a2b7ee8ade6b7e082 100644
> --- a/drivers/pci/pci.c
> +++ b/drivers/pci/pci.c
> @@ -4982,7 +4982,19 @@ void pci_reset_secondary_bus(struct pci_dev *dev)
>   
>   void __weak pcibios_reset_secondary_bus(struct pci_dev *dev)
>   {
> +	struct pci_host_bridge *host = pci_find_host_bridge(dev->bus);
> +	int ret;
> +
> +	if (host->reset_slot) {
> +		ret = host->reset_slot(host, dev);
> +		if (ret)
> +			pci_err(dev, "failed to reset slot: %d\n", ret);
> +
> +		return;
> +	}
> +
>   	pci_reset_secondary_bus(dev);
> +
>   }
>   
>   /**
> diff --git a/drivers/pci/pcie/err.c b/drivers/pci/pcie/err.c
> index de6381c690f5c21f00021cdc7bde8d93a5c7db52..b834fc0d705938540d3d7d3d8739770c09fe7cf1 100644
> --- a/drivers/pci/pcie/err.c
> +++ b/drivers/pci/pcie/err.c
> @@ -234,11 +234,6 @@ pci_ers_result_t pcie_do_recovery(struct pci_dev *dev,
>   	}
>   
>   	if (status == PCI_ERS_RESULT_NEED_RESET) {
> -		/*
> -		 * TODO: Should call platform-specific
> -		 * functions to reset slot before calling
> -		 * drivers' slot_reset callbacks?
> -		 */
>   		status = PCI_ERS_RESULT_RECOVERED;
>   		pci_dbg(bridge, "broadcast slot_reset message\n");
>   		pci_walk_bridge(bridge, report_slot_reset, &status);
> diff --git a/include/linux/pci.h b/include/linux/pci.h
> index 0e8e3fd77e96713054388bdc82f439e51023c1bf..8d7d2a49b76cf64b4218b179cec495e0d69ddf6f 100644
> --- a/include/linux/pci.h
> +++ b/include/linux/pci.h
> @@ -599,6 +599,7 @@ struct pci_host_bridge {
>   	void (*release_fn)(struct pci_host_bridge *);
>   	int (*enable_device)(struct pci_host_bridge *bridge, struct pci_dev *dev);
>   	void (*disable_device)(struct pci_host_bridge *bridge, struct pci_dev *dev);
> +	int (*reset_slot)(struct pci_host_bridge *bridge, struct pci_dev *dev);
>   	void		*release_data;
>   	unsigned int	ignore_reset_delay:1;	/* For entire hierarchy */
>   	unsigned int	no_ext_tags:1;		/* No Extended Tags */
> 

