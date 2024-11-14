Return-Path: <linux-arm-msm+bounces-37907-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E88E99C8AB6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Nov 2024 13:48:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 62744B24725
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Nov 2024 12:47:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DFCE1FA851;
	Thu, 14 Nov 2024 12:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="geSCMfng"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB4001F9AB6
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Nov 2024 12:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731588468; cv=none; b=DhQgE5qnjNYs765R8MPY+4MHOagggpeO2f/D5rFF2b5h3UxdzRk9HOcUDuWpc4uaCSkNyJ/GIa1vuL8Sw3snR3/VHtSDUxTJ345+858M7KSZlk8+PNtpij5Va9WAt0pqZa4d29vMYzWacRo3zdmISC9KgWKo1fC7YuNWACNZDXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731588468; c=relaxed/simple;
	bh=RTAd+3XLwNxGPeXfDfmBJBGafJ8wLyA2P1qPpPAMZfE=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=dbsMEykMp0/BfZjwrrjA76hiUEVHA0NXJkPc9bWJFsJpedKYJOw12MMEZVNIgeR+uG8gmJx5rQXxBirlqpzFvkjvm2m/jkYv8Cj+6RnQ/7xD81Qh/2GpSPJjwbasYekupuM7wAgf0qWAyISztmhwLl7SpFiIhr4ywQwkO3CXt8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=fail smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=geSCMfng; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AE6LwAi026127
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Nov 2024 12:47:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TirkE3p4MW042XA9VvghCJxqECC+Uiw5LWNZTmDaOsw=; b=geSCMfngvs5+4/9Z
	5nLUGeut9W9AmVnQA8ac3nFsFJdZVelclqF+2DLmuOjlfo8AF2ZcIQSZKwm5XDcw
	DiLoyz56XfsGzNCe30SDAYx/cnF24SzlN8FSy8QTcjWVi+D+90+SZCMs4kxrOQKJ
	gN/Mn5PkOSdXPSh3TbAJ/DYXF9RqvtMh1mgoTUrKAe6PzZPExTwCgArFm8rvSowd
	wSpXbMcJPcePuWQamp3hwzEhI9yafSbxRBxDnzREyWgslfVAOEQDPnkwHlGl+tCm
	WW6fpPBoijit6+GGssj8ua/ruJTpJIbiKUNUxz1NmoYiFl3uFx330xZbiUALkT6R
	2j+TWw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42va07fgwe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Nov 2024 12:47:45 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4609b352aa9so1290151cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Nov 2024 04:47:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731588465; x=1732193265;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TirkE3p4MW042XA9VvghCJxqECC+Uiw5LWNZTmDaOsw=;
        b=okmhnQS+3ZA74fvNrnuVoulA0U5UhXJVPT3roXC40QwVdJQZA9Nm8fVLnKckhw5rNK
         3UBHvcK5spONIhD/f3pTLfER5kBTR/AIcO+DmFWAk/jnGmDHB/ooyaDq24+u7p7T/RWf
         ZPQUfynCVF9ZiYPqOYhOlYFCwlvtgJmhnTGVBlsYRVPzd2I+AkRByskMeNRN5pg/cKoD
         MxSYz1m0FdeGciZpUjC3RPIFW+ObXTgWt4XAVDskpMVf4qbnzx89wLmLIPUm+F31CHfk
         6jaqU0AozdlbjT7x/0eb+l59tSa7tcjrFbu3rzfAguoRHAL01CZC3eCMSMT/Zw6rgqrC
         kfOg==
X-Forwarded-Encrypted: i=1; AJvYcCUpgCmAFqGTsptTcpSOnReucKGE/SHXEjZXfw93IvIhcgGYEZ7B7aVVmPXNDC+l8HL29YlYugkaafdC8tFP@vger.kernel.org
X-Gm-Message-State: AOJu0YzW/4ykOBC5dpn6rVsGd5L603YUZ7JH+Hx9bI1eQfs4mb9xyWSN
	mEPh6HaKNIXm8fnPAVdstPJKL3MnRrIxqOYYeFvY2r7a/XEg2vsD5EG66Z21t4NHFICMyXsTn2r
	lI8N3dDQYD7Z3njrNVQf7xktqILRyOw3zJ9QGtPqskJHDKkQhUmMV1rAaFgk8XzXQ
X-Received: by 2002:a05:622a:281:b0:461:5f08:e680 with SMTP id d75a77b69052e-463094018a8mr152959311cf.10.1731588464737;
        Thu, 14 Nov 2024 04:47:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEsxDffnRImxMQgqIQ8TXOem5agf/yFgovxPS825RyYZPFwUerfkyI2ebwr6OsoRlLLmIc1hg==
X-Received: by 2002:a05:622a:281:b0:461:5f08:e680 with SMTP id d75a77b69052e-463094018a8mr152959011cf.10.1731588464407;
        Thu, 14 Nov 2024 04:47:44 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa20e046c68sm59057466b.167.2024.11.14.04.47.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Nov 2024 04:47:43 -0800 (PST)
Message-ID: <7e293d68-73c1-425d-ae52-e0893c8e0a61@oss.qualcomm.com>
Date: Thu, 14 Nov 2024 13:47:41 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/6] phy: qcom: qmp: Enable IPQ5424 support
To: Varadarajan Narayanan <quic_varada@quicinc.com>, vkoul@kernel.org,
        kishon@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, gregkh@linuxfoundation.org, andersson@kernel.org,
        konradybcio@kernel.org, dmitry.baryshkov@linaro.org,
        mantas@8devices.com, quic_kbajaj@quicinc.com,
        quic_kriskura@quicinc.com, quic_rohiagar@quicinc.com,
        abel.vesa@linaro.org, quic_wcheng@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org
References: <20241114074722.4085319-1-quic_varada@quicinc.com>
 <20241114074722.4085319-5-quic_varada@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241114074722.4085319-5-quic_varada@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: uXjbHBBZCxEubmmvqFm-0-deppsn9y8J
X-Proofpoint-ORIG-GUID: uXjbHBBZCxEubmmvqFm-0-deppsn9y8J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 malwarescore=0
 mlxlogscore=999 clxscore=1015 adultscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 mlxscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411140100

On 14.11.2024 8:47 AM, Varadarajan Narayanan wrote:
> Enable QMP USB3 phy support for IPQ5424 SoC.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> ---
> v2: Add 'Reviewed-by: Dmitry Baryshkov'
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-usb.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
> index acd6075bf6d9..f43823539a3b 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
> @@ -2298,6 +2298,9 @@ static int qmp_usb_probe(struct platform_device *pdev)
>  
>  static const struct of_device_id qmp_usb_of_match_table[] = {
>  	{
> +		.compatible = "qcom,ipq5424-qmp-usb3-phy",
> +		.data = &ipq9574_usb3phy_cfg,
> +	}, {

If the software interface is the same, can this just use ipq9574 as a
fallback compatible?

Konrad

