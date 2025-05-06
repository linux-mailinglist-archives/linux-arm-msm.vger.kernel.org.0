Return-Path: <linux-arm-msm+bounces-56925-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6663CAAC0FA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 12:11:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 528F01C2401A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 10:11:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDE7C19F489;
	Tue,  6 May 2025 10:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hj8ZNgiB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1710426B2BE
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 May 2025 10:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746526279; cv=none; b=CuMGlHzcIRc23Sa/t0DDHgmDHzGmHKBTNhjXUeSRKMmsKknfdhjeICqlgwDJ1PP9LlHrDX9RYoL2yGYCdCA9Jb+hkfmk6JXFl4haSehemtjn+UnV1vu3C5MY+PjhRQL/6V0QgkYBsnocCd7LwwMCw8U2heqAZu2UD041h9KLTJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746526279; c=relaxed/simple;
	bh=s4kCWQW0ZTSUK3D9Sel80Aj9ycpFDOTL8zaBmcgdIy4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V4uSXl9NTtM6F4PhH00QLcdaMDPgEYq2o+OZo7ugunZdKS90fVw3dCNq71bd6bS7B2331pxMcX0/9CloabM85tA5ZdIc5y6T/sC8em2h4RKo8v5e34NEFCZSt44HK6WjDLJogTstE/dwdLSJaK9vYIAMLz9sFFNA9nJnqtP4iK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hj8ZNgiB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5468FFdf013247
	for <linux-arm-msm@vger.kernel.org>; Tue, 6 May 2025 10:11:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R357w52RG43euLotJZLwo3ITJzb0YVqeRsR7WnNZQZA=; b=Hj8ZNgiBzlrftr5B
	F+oKgx4tCDOcM1tQqPIvZHCiqEr15MbOTxiwMhHU82RWMNigam7Teb40Eu2D/asU
	PKPDwUmjbqAoFMZo0rD4VLv/3iFyruY5KtalAqf3r7S7w5IwRF2Jvh2aemELD2ib
	3KOCuuER0o6U6reqHQo6PkohBdQEbNCg8znnLWCPEJF/Fgsf1d0GWY84zdpYvfyJ
	YIdu0moxqFuh1W1jq9f0RfGZj/Yczb4xc7mCSo62iDen3d6dVBlfAZ2rpoJN88Va
	LPqTCk0Qf3+ppW/iNn2gQIWvSG0uvwAiJBlFL5rviN+cOcsijOEWGKdZd3M6nOW0
	7Xnzhg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46f5u41uwn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 06 May 2025 10:11:15 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-22e40e747a3so3664645ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 May 2025 03:11:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746526274; x=1747131074;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R357w52RG43euLotJZLwo3ITJzb0YVqeRsR7WnNZQZA=;
        b=G5gXht5cskgbM9F8oTyIx8NBcIxlT3A0K8bZ4pZORt3f2Pa7hZxRflyJGEJLkqg6aY
         gfl8UUE5sZBihq4NCBPt39lU2WFwTyOEu2N26T2xdJpldKm42aDZIeWbiiwCNzAXQBR9
         0f1z2FozQ3N9wudAxoQZFhrpiWS7pZpItRKcqYu8kWSbBtd85xs6UOgmXCZsE2bfU5ds
         tB38yQJ7mgcU6Su7WvXs2VuWH6chCWWWzyYE8D1Y/2Fw17RW8HcfVvD+WHFcV2bocJAY
         vW43eWokTNFeg50NqajeW6eLQOh/ftWsgdTGdzVGiW9js2tIYpJHP7puujJBF9UXbQah
         rexA==
X-Forwarded-Encrypted: i=1; AJvYcCU+bjeg+bBxNqMDgcwQsurbfN5TBho+fzkCphOYux01BA8KGTjNEhpPziJPdXjV9lms4QK5gDstwJsjY/fX@vger.kernel.org
X-Gm-Message-State: AOJu0Yxi2F0OYsW5ktu/d2PJqSBi38vb8bQEw0B0wCm6EtmCRCm2g9ga
	2FOsJi2zq64u4LKM7I13dkLZkfLiimdRLHcu3QkekNObNSbrJ+uuBM7b6QXQ+hPOuar8jqgK2zI
	H71JaHTkWlfsk+cWikB3wveEYXOY4pqIQGmXyPaq8d5mvZlU8Is4thhXmw2XGQkv4
X-Gm-Gg: ASbGncs4ffd5CVGsXDZPTAiBVPV+2aB9W024fK7elfkqJ8pfkn+7wHGqGRjYL7GP/XI
	H8UvewL0gpR+HrH1wBR10ipU2ZShbakdoeqOTzq+rNHDppGKGYFBin20BB4nMNd+V0Ae1htkUY7
	xv0mLH1StLtNrnxsFlKRhUJhTZp0+w7rC/PPydyRedOqon/ctKyHJrAKlvLxUI7wbkU5PTF/yeK
	gwazLfamt5sG5CmM3MazyvtAfI2K6jPqo/qL9uudmBpsLMjU+iVOSCFk6qDovV5XH0dn6YkN3+C
	NYam/C+9VCTjx9tNpPWefp8GhE3lcA3dhtoNLBA8qA==
X-Received: by 2002:a17:902:f682:b0:216:410d:4c53 with SMTP id d9443c01a7336-22e1036be29mr230061395ad.41.1746526274376;
        Tue, 06 May 2025 03:11:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH8U/guIu0vbzSPfeTmdl89koUVyuEsL/oTZLqYtIdxTjXuLx/PmEC/GmoUm6x6tbynQ691+Q==
X-Received: by 2002:a17:902:f682:b0:216:410d:4c53 with SMTP id d9443c01a7336-22e1036be29mr230061015ad.41.1746526273933;
        Tue, 06 May 2025 03:11:13 -0700 (PDT)
Received: from [10.218.37.122] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a3484bc23sm13457073a91.43.2025.05.06.03.11.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 May 2025 03:11:13 -0700 (PDT)
Message-ID: <99da4243-3e55-3aa0-5657-5a5d2a4415cd@oss.qualcomm.com>
Date: Tue, 6 May 2025 15:41:07 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 2/4] PCI: qcom: Do not enumerate bus before endpoint
 devices are ready
Content-Language: en-US
To: Niklas Cassel <cassel@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Krishna chaitanya chundru <quic_krichai@quicinc.com>
Cc: Wilfred Mallawa <wilfred.mallawa@wdc.com>,
        Damien Le Moal <dlemoal@kernel.org>, Hans Zhang <18255117159@163.com>,
        Laszlo Fiat <laszlo.fiat@proton.me>,
        =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kwilczynski@kernel.org>,
        linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20250506073934.433176-6-cassel@kernel.org>
 <20250506073934.433176-8-cassel@kernel.org>
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <20250506073934.433176-8-cassel@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KcfSsRYD c=1 sm=1 tr=0 ts=6819e043 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=S-OeyO6ZCgE5XVXCpeMA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: DZRbjJZfOUx8O5hyQVvOhbcIeDr0B6pc
X-Proofpoint-ORIG-GUID: DZRbjJZfOUx8O5hyQVvOhbcIeDr0B6pc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA2MDA5NyBTYWx0ZWRfX1gXRgp72Q8cb
 OskDSyBBLWatX5Y/nujtRvkWLem5CKi+y3vCR2zZIGvxb0wnjJMd7Gg3FGDhcamp/v8JyhXcx6F
 XBWKmfYTeZFvi1r6C97KzogIQiKJFMz8RxTp4BqVf2nGg9sOBjmc0E5u4UJG0rzcBZJTex4XJ8a
 aTIUKW/uJHYHNbuHnziQyAm6LdZEXqSVvCRxNYYy3rk9r+PcFKcvtUYWxu2nx4Y94V9ZLpaEAcO
 3PjY2PJnnMHxTQdspfDL3shIoKBgeFBJ7vHvJoD2/UNwu6O1SxoAvZBmkmSW4clk8HwTrvYsj2P
 7ErtXGjsfxSi+LZdBcDhYL0MmrEnrgHu7QkfDcVtd78CfmQ/VoYeX+khXHCe3Q04XfN9NUOcUHI
 jZJPk968gXELRN1bvFuqSd24524pCXUnLOzdwNomATQ09dUw+gXn/pewNFYxharvGbg+UKnR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-06_04,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 bulkscore=0 mlxlogscore=997
 phishscore=0 impostorscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 clxscore=1015 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505060097



On 5/6/2025 1:09 PM, Niklas Cassel wrote:
> Commit 36971d6c5a9a ("PCI: qcom: Don't wait for link if we can detect Link
> Up") changed so that we no longer call dw_pcie_wait_for_link(), and instead
> enumerate the bus when receiving a Link Up IRQ.
> 
> Before 36971d6c5a9a, we called dw_pcie_wait_for_link(), and in the first
> iteration of the loop, the link will never be up (because the link was just
> started), dw_pcie_wait_for_link() will then sleep for LINK_WAIT_SLEEP_MS
> (90 ms), before trying again.
> 
> This means that even if a driver was missing a msleep(PCIE_T_RRS_READY_MS)
> (100 ms), because of the call to dw_pcie_wait_for_link(), enumerating the
> bus would essentially be delayed by that time anyway (because of the sleep
> LINK_WAIT_SLEEP_MS (90 ms)).
> 
> While we could add the msleep(PCIE_T_RRS_READY_MS) after deasserting PERST
> (qcom already has an unconditional 1 ms sleep after deasserting PERST),
> that would essentially bring back an unconditional delay during probe (the
> whole reason to use a Link Up IRQ was to avoid an unconditional delay
> during probe).
> 
> Thus, add the msleep(PCIE_T_RRS_READY_MS) before enumerating the bus in the
> IRQ handler. This way, for qcom SoCs that has a link up IRQ, we will not
> have a 100 ms unconditional delay during boot for unpopulated PCIe slots.
> 
> Fixes: 36971d6c5a9a ("PCI: qcom: Don't wait for link if we can detect Link Up")
> Signed-off-by: Niklas Cassel <cassel@kernel.org>
Reviewed-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
>   drivers/pci/controller/dwc/pcie-qcom.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> index dc98ae63362d..01a60d1f372a 100644
> --- a/drivers/pci/controller/dwc/pcie-qcom.c
> +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> @@ -1565,6 +1565,7 @@ static irqreturn_t qcom_pcie_global_irq_thread(int irq, void *data)
>   
>   	if (FIELD_GET(PARF_INT_ALL_LINK_UP, status)) {
>   		dev_dbg(dev, "Received Link up event. Starting enumeration!\n");
> +		msleep(PCIE_T_RRS_READY_MS);
>   		/* Rescan the bus to enumerate endpoint devices */
>   		pci_lock_rescan_remove();
>   		pci_rescan_bus(pp->bridge->bus);

