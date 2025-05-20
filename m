Return-Path: <linux-arm-msm+bounces-58590-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6271DABCE0E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 06:04:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 031FF168469
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 04:04:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7893F1E51FE;
	Tue, 20 May 2025 04:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MzNNnOPG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB88A253F27
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 04:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747713848; cv=none; b=mTJhOq/xtnuNoTppM5VjeLmabGa1mohGML35jPin/XPCeEAYfbdbvTuN/HkBCnyNlkNKJJvmME4fDbDeK6boUE1dVAWpnfCY9wa04/U3t7qPxyrbUS2TU7rfYgGgV1HYJjeTGjkURcs4oqLcWWPUYRCme0a3LOU18E/XO9rCFi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747713848; c=relaxed/simple;
	bh=KMb6HEc989YS4nvOynxObwK2sZg5PsL820yo8xKWB0Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tkkWkIHLrH4z7Q6cyD0+SXNnb8JU9NVooT+jULos9BBHqjQhA1WeAfaFBLREEH3o8o8b22mmlaEJyXr/TypoMGteYlvtcLWBnKAhErfr8WPwp0Nge/lpBIm0kRI+Cqm+PzlJuUn1fXKdf1JEu92VsACYeLhptZAtE5xNkfPDwcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MzNNnOPG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54JKZHX6005266
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 04:04:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o+n9bkF0VD0V2oJ0zneDmypvwTmyRBfAOtjQDo3asjA=; b=MzNNnOPGPyV/g4gL
	Io3VpNxBw/F+jVACkQGvFl0/BXrvWr+zDY5nVInGTf8gLF6kI9JmgqpNIhvKW385
	/4dk0rIZDiP/AkSaJI/8ctqm/DlEUJ/u34ymu+XQVht8xG3xP/CVMbfJ97/sV2ty
	XtDRWnQQW1g0+2xV1/ZDKu8e5VfkbhqBMRLqQ/hKaOyP3IrDlszg/7/nopdJabSJ
	F/j0KWltPyd7FzKWqH7HicCnyYpNHTkWj/w697dOgfd20RcP4u/kqWoqc2EQTMQl
	4zq/i6ns5gO4SdSZMDxj/hYPx6IQ7VTz3SgH40qTZ/2bFLMH621ogpmrmaKabgO0
	cu+VIw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjm4xfu6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 04:04:04 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-742c7227d7dso1493201b3a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 21:04:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747713844; x=1748318644;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o+n9bkF0VD0V2oJ0zneDmypvwTmyRBfAOtjQDo3asjA=;
        b=QUehdIeazTbzO4scbgt5aFUh9Lu9QoJjTcWfUwAoe0GzUmEqlZo0+sm2e2JAStwhKO
         /YnzZHzmpPW9Avu1e9+nY9icqFKsslMc7JnJrxx3hbeetPTXmpM1VMP1pjktInBK5oga
         cUHYZ8bHZT/mfHQnxZIXpHK2MDZFHc0AZ5O+fNOrVOSqXhNv0Y4O0ZSfMY7y7HSEHN7w
         8IIOWSyvYzwUY5F5/xib1qkocjvo48ZrpELoSFJgQdfChZ/UzqRjedwy6+53AYei41jW
         xcCmuJ9sem7VffkW5rbLHJrKmz5BIGsnRDpYMZGgPVz+7i+8IUO2EnJfMlDaQb42x+I1
         w1ww==
X-Forwarded-Encrypted: i=1; AJvYcCWVEmt1VNFpYpieUblv4l2GkxljAVJk5coiob+fQos4WK6tKcBoqpNH3UO7yADs3QgQamAZ7Lv6DBKyrpwc@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6BojJ71xmO1BDaNVfrUFbAVNEdaTEPzDBeF7IDpZsVp6DVkPA
	B3Eu0gmoFoJi4SDEg3mLDL2dt1YLAikq3LP+Co++VQesfvxQSXlmbzXeaTtNcGpKtSSzUSS0XGJ
	bSS6Dt5FaVgrkwpP1AWLjB3tDn1DCNu4clY+GniNRZDjowZXXIGAWq7iG4jYLcZI3vVMY
X-Gm-Gg: ASbGnctkBeyHJ3TCBon90Wftr7EOhFKP6aNbyrgScKzodW4m+9OXdrtAuK7v72aU631
	eijpacsk4CZUK83VUr3zTOoUdh87OGTJy4Bn+NhndzZHny+vf0lQGty90i69tVPZ1PGTOTbl3l2
	bqUBpecAH2RREA+ec3eldp/Wh/TveVtbjHmqgzQgCMuQwuzcKb6b/JEzWrWz+oN1r9f7B5d1zWK
	Hmc+TnQ7zQm1Mxb+dFny0c4swb/VfPY/XXTrP1Qj0L1RFTUigZX/0OETLlz2M56LkoMLPk7693V
	rs5lkmd1eYMD1Af//xSOQw1KEvuLcLQuBQ/lnUCj7A==
X-Received: by 2002:a05:6a00:23c8:b0:73c:b86:b47f with SMTP id d2e1a72fcca58-742acc8da94mr19341309b3a.4.1747713844016;
        Mon, 19 May 2025 21:04:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGtuj7Wq5AEHuJuYXpcnavQTfMcYG2SpoMb7J/CFpeG/fY8muA2u1bn6wkzdg+/GXDT/INQfA==
X-Received: by 2002:a05:6a00:23c8:b0:73c:b86:b47f with SMTP id d2e1a72fcca58-742acc8da94mr19341277b3a.4.1747713843631;
        Mon, 19 May 2025 21:04:03 -0700 (PDT)
Received: from [10.92.214.105] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a970d777sm7243378b3a.68.2025.05.19.21.04.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 May 2025 21:04:03 -0700 (PDT)
Message-ID: <48a98603-d2b0-c279-6b04-0c89baf32d05@oss.qualcomm.com>
Date: Tue, 20 May 2025 09:34:00 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v4] bus: mhi: host: fix endianness of BHI vector table
Content-Language: en-US
To: Alexander Wilhelm <alexander.wilhelm@westermo.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Jeff Hugo <jeff.hugo@oss.qualcomm.com>, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250519145837.958153-1-alexander.wilhelm@westermo.com>
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <20250519145837.958153-1-alexander.wilhelm@westermo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dIimmPZb c=1 sm=1 tr=0 ts=682bff35 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=N9GNhs4bAAAA:8 a=EUspDBNiAAAA:8
 a=QTSRpw9t3mQaVZ-RB_kA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
 a=PZhj9NlD-CKO8hVp7yCs:22
X-Proofpoint-ORIG-GUID: aHSE4kLmjozlxgkwLEWFPmes8VcLpvRN
X-Proofpoint-GUID: aHSE4kLmjozlxgkwLEWFPmes8VcLpvRN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDAzMSBTYWx0ZWRfXxkxpITHHG1BT
 Ux93PmM1+wvnL9xSeGlHxmHpdMzPZivb1f9lbs7+vwTLzdBpAmqX6ZiqrNc3N5Gb6EA+421yQVg
 WMTHXkidKb1RUmg36vyrOFzq/zFqT8jdugtT+uO81f8HsfFNFpzbxOXl5QQQZZGsqSgf484wDVt
 3iGjdzeiZOZifuBEl+VZEM6Ew7nTbllBiKhwaG3HUBsGOUtCK9JtKS02Z2Vmh+6hp0SkMKcwiyk
 tMzanOZvB1dTCmNVmCup/vWvnIHl4OSCL6NOI8SPwR2GB60+3wGJU2cVl/cv33tKIC34rUUPSgO
 VZFtV65EIt3+4Wb+XykhreZesgjqRSO597RR7F5NU3jGf5Ex8N+QeF1Xv6N1tFZEYUcwzuKImRN
 QxmtYEMXp398Ko+nCP/E+uK1TUg88bbsIU1UnwB1ad7Y0bHdE3x+lw4/P/aukF2lZ6BWcmVQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_02,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 clxscore=1015 phishscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505200031



On 5/19/2025 8:28 PM, Alexander Wilhelm wrote:
> On big endian platform like PowerPC the MHI bus does not start properly.
> The following example shows the error messages by using qcn9274 wireless
> radio module with ath12k driver:
> 
>      ath12k_pci 0001:01:00.0: BAR 0: assigned [mem 0xc00000000-0xc001fffff 64bit]
>      ath12k_pci 0001:01:00.0: MSI vectors: 1
>      ath12k_pci 0001:01:00.0: Hardware name: qcn9274 hw2.0
>      ath12k_pci 0001:01:00.0: failed to set mhi state: POWER_ON(2)
>      ath12k_pci 0001:01:00.0: failed to start mhi: -110
>      ath12k_pci 0001:01:00.0: failed to power up :-110
>      ath12k_pci 0001:01:00.0: failed to create soc core: -110
>      ath12k_pci 0001:01:00.0: failed to init core: -110
>      ath12k_pci: probe of 0001:01:00.0 failed with error -110
> 
> Fix it by swapping DMA address and size of the BHI vector table.
> 
> Fixes: 6cd330ae76ff ("bus: mhi: core: Add support for ringing channel/event ring doorbells")
> Signed-off-by: Alexander Wilhelm <alexander.wilhelm@westermo.com>
> Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Reviewed-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
> Changes in v2:
>    - Set __le64 type for dma_addr and size.
> 
> Changes in v3:
>    - Improve the clarity of the commit message.
> 
> Changes in v4:
>    - Add missing fixes tag.
>    - Fix commit message character width.
> 
>   drivers/bus/mhi/host/boot.c     | 8 ++++----
>   drivers/bus/mhi/host/internal.h | 4 ++--
>   2 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/bus/mhi/host/boot.c b/drivers/bus/mhi/host/boot.c
> index efa3b6dddf4d..205d83ac069f 100644
> --- a/drivers/bus/mhi/host/boot.c
> +++ b/drivers/bus/mhi/host/boot.c
> @@ -31,8 +31,8 @@ int mhi_rddm_prepare(struct mhi_controller *mhi_cntrl,
>   	int ret;
>   
>   	for (i = 0; i < img_info->entries - 1; i++, mhi_buf++, bhi_vec++) {
> -		bhi_vec->dma_addr = mhi_buf->dma_addr;
> -		bhi_vec->size = mhi_buf->len;
> +		bhi_vec->dma_addr = cpu_to_le64(mhi_buf->dma_addr);
> +		bhi_vec->size = cpu_to_le64(mhi_buf->len);
>   	}
>   
>   	dev_dbg(dev, "BHIe programming for RDDM\n");
> @@ -431,8 +431,8 @@ static void mhi_firmware_copy_bhie(struct mhi_controller *mhi_cntrl,
>   	while (remainder) {
>   		to_cpy = min(remainder, mhi_buf->len);
>   		memcpy(mhi_buf->buf, buf, to_cpy);
> -		bhi_vec->dma_addr = mhi_buf->dma_addr;
> -		bhi_vec->size = to_cpy;
> +		bhi_vec->dma_addr = cpu_to_le64(mhi_buf->dma_addr);
> +		bhi_vec->size = cpu_to_le64(to_cpy);
>   
>   		buf += to_cpy;
>   		remainder -= to_cpy;
> diff --git a/drivers/bus/mhi/host/internal.h b/drivers/bus/mhi/host/internal.h
> index ce566f7d2e92..1dbc3f736161 100644
> --- a/drivers/bus/mhi/host/internal.h
> +++ b/drivers/bus/mhi/host/internal.h
> @@ -25,8 +25,8 @@ struct mhi_ctxt {
>   };
>   
>   struct bhi_vec_entry {
> -	u64 dma_addr;
> -	u64 size;
> +	__le64 dma_addr;
> +	__le64 size;
>   };
>   
>   enum mhi_fw_load_type {

