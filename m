Return-Path: <linux-arm-msm+bounces-47769-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FAE4A3293C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 15:55:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 35B2D3A15F3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 14:55:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F9BD20E315;
	Wed, 12 Feb 2025 14:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mNbYHnKc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5814271800
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Feb 2025 14:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739372150; cv=none; b=bVv9KWBP+XiGvZxLqtcXHNKpBGpwIC18bR0sdKpDHPGzrzSK976UKfWdlHwBw2qDDNgjZuRmsVxejE/8dS9d/e/27eJU5MC7Fqq7LTfKuzfHAWVpfnBC/EWjj1gWjXiKxptlXrGrvxNQ9wPdQgpjL86gnzUeVYMnpG8Ffba1XJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739372150; c=relaxed/simple;
	bh=sSNGGMrE8T93VSmrATsF+z40Eu00MXY5OytJCnZR0Bs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hCOhA8WXievZ7gzIMyi2s48q2wC05EtdYQGHpT0N/4kkssuq4yQkRDPSITvpgluqtCWFVURa9zz+XfaM5idTFKoIsuGoURb8ULpls9bp0K12HhJ20a1S2llNG8y8iGjHytt3nT2P4ShqxLa3296wc9Kcg7AwftadN5PD+OIUhF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mNbYHnKc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51C9q6AX026400
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Feb 2025 14:55:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	916SG1gUix3A397XCQBzpFRlo+xOPFmr9pt67nE8rRw=; b=mNbYHnKcBEapiMyo
	OgQ00QSK00iEYIFe1gA9+kkY4g+oBVPCAeKMN1AY6x2CkFUdyV1LpYOIe2oz9DXB
	VWLERufiieWfXEEwjAGVRPF7u64DZRcYii/+7nPXreSwXmT2VG5z0H0We4ZLSCgQ
	X62zBeiwXvOGsakEJZHrX89TeKKQmskTdsSleL0HUKb35q3eDr5xORgaVs/sqe5b
	17eLhrY6LlwhzEskYeEPxzTviaHOyDCvPZkhknRugy10EAuxHXAtJOwKbuS7Xq+g
	sPn5cTF4KhOmtgzovuUlqyrHup/sjJ3kpegxgOn+86wMm4RDPPMxS99DNKbo7l3R
	Al8U7g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44r5j5c3u9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Feb 2025 14:55:47 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-46e78a271d3so10724791cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Feb 2025 06:55:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739372146; x=1739976946;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=916SG1gUix3A397XCQBzpFRlo+xOPFmr9pt67nE8rRw=;
        b=SYAWu1n82rWYfk3GfLtAWeCd4YIPqU9sTWBHHM3h3hY+BLKpeq2ZYOHDAuKq+wqEVC
         L9L0YIRZcryO24u3doUlZ9GT1lKG1eVTL0nvpmZAGF3MqbZnwu1tPN2bwj3AsKfvTDR2
         EwwYu/BANA/H2bMaSLmFdtxMQ8Xe0QL7/md3f/+rXHbON5FEJroC0uo7NOJrdFzl/ct5
         j+ABSZtkuzLmiYsPKpHkjBvjesEdWh7IiWfC2zcDBy08HoGt+F8t5AEFmDp87NJ7fyOE
         NOOX1+ZshW+yofyKaipxUOi2+dzva6xfEwnVQTGp7UiIh/KNF2tgiKzAnjFfN4d9ZBYW
         9gRA==
X-Forwarded-Encrypted: i=1; AJvYcCXhCi0ndTouj6W5nU5dKFli9T/JQeh6+6UsdPh62+Ghla0jJI4eoWW1ZodTAqrrPmZyr7sV3QhYZZWAfqou@vger.kernel.org
X-Gm-Message-State: AOJu0YznDdAo7hoV/LEMY7/+3yzjRxfw4Dgo+h9LseS1+DJ51a3Xy3Wj
	LpEnIoXafzDecqsXBhjUe0GlrooT26CCYxlhCLzMgs85+GtcanXBa+wJK1deEjEkZrAFtUCGnYF
	HqpfxzLBCSX065zu6rVVSDF/a7vXOnlQbLIpqAu5jm7/ZJsclrR4tdbTNMSO/ok54
X-Gm-Gg: ASbGncvWbtuvowHAotC6kEZO/l0XNjrKTV57c850FvRETZFqZWlVCXzYnIFPnCHYzxL
	vjcE+YLDeP4xUCzHm4Qv4z7jDpf6yy+TzdPbvxyBXAEIZdBGZWXOhwLieJCeak23sx8NrjVGLxQ
	h9hhwq501aQKXGNAmSuGRpv4XveXHl1OWg+gVzygLpsWycpzkyX1OtzOOPRD2VmEbkvt2IljuZW
	gV7CGgI1b1ZXsjbsOTjswkF/UTl74gJjU0cNABEpYkQufFJVH4QxUctCpJnAJbkVwDh6zm6DUq/
	R4wq7skHbDh5mcHdo8+u1pIybYo+tAeIQhe83N2j+EPKeq9YP5GLVnat78A=
X-Received: by 2002:ac8:5dd2:0:b0:467:5d7f:c684 with SMTP id d75a77b69052e-471afed5648mr18796751cf.12.1739372146460;
        Wed, 12 Feb 2025 06:55:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGzLBeiKZSyJ9lZh2Y7PO+RFQ3dmGp7ZGFUJgrbKrEQTQdh86uIFfhpBmJIWx0PHK0HA9YHAg==
X-Received: by 2002:ac8:5dd2:0:b0:467:5d7f:c684 with SMTP id d75a77b69052e-471afed5648mr18796541cf.12.1739372146109;
        Wed, 12 Feb 2025 06:55:46 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab772f49361sm1279167166b.33.2025.02.12.06.55.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Feb 2025 06:55:45 -0800 (PST)
Message-ID: <f7a220d5-6866-4770-93a0-66e6d7b49491@oss.qualcomm.com>
Date: Wed, 12 Feb 2025 15:55:43 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] phy: qcom: qmp-pcie: Add PHY register retention
 support
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        "Wenbin Yao (Consultant)" <quic_wenbyao@quicinc.com>
Cc: vkoul@kernel.org, kishon@kernel.org, p.zabel@pengutronix.de,
        abel.vesa@linaro.org, quic_qianyu@quicinc.com,
        neil.armstrong@linaro.org, manivannan.sadhasivam@linaro.org,
        quic_devipriy@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250211094231.1813558-1-quic_wenbyao@quicinc.com>
 <20250211094231.1813558-3-quic_wenbyao@quicinc.com>
 <7deghiadmomrz7w7vq3v7nkzq2kabq4xbhkouswjrexif7pip3@tvjlpvuulxvp>
 <791fa29e-a2b5-d5f6-3cbc-0f499b463262@quicinc.com>
 <fwfxhy535nm7227wzlwlojxyxrr3ond5hmc3njqbcje3usfh5t@hqrnbpmdqweg>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <fwfxhy535nm7227wzlwlojxyxrr3ond5hmc3njqbcje3usfh5t@hqrnbpmdqweg>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: KXotK5XyzMGmE_bjmT945i4u-CR5pk70
X-Proofpoint-GUID: KXotK5XyzMGmE_bjmT945i4u-CR5pk70
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-12_04,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 mlxscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 phishscore=0 adultscore=0 spamscore=0 clxscore=1015 impostorscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502120114

On 12.02.2025 12:07 PM, Dmitry Baryshkov wrote:
> On Wed, Feb 12, 2025 at 04:31:21PM +0800, Wenbin Yao (Consultant) wrote:
>> On 2/12/2025 8:13 AM, Dmitry Baryshkov wrote:
>>> On Tue, Feb 11, 2025 at 05:42:31PM +0800, Wenbin Yao wrote:
>>>> From: Qiang Yu <quic_qianyu@quicinc.com>
>>>>
>>>> Some QCOM PCIe PHYs support no_csr reset. Unlike BCR reset which resets the
>>>> whole PHY (hardware and register), no_csr reset only resets PHY hardware
>>>> but retains register values, which means PHY setting can be skipped during
>>>> PHY init if PCIe link is enabled in booltloader and only no_csr is toggled
>>>> after that.
>>>>
>>>> Hence, determine whether the PHY has been enabled in bootloader by
>>>> verifying QPHY_START_CTRL register. If it's programmed and no_csr reset is
>>>> available, skip BCR reset and PHY register setting to establish the PCIe
>>>> link with bootloader - programmed PHY settings.
>>>>
>>>> Signed-off-by: Qiang Yu <quic_qianyu@quicinc.com>
>>>> Signed-off-by: Wenbin Yao <quic_wenbyao@quicinc.com>
>>>> ---
>>>>   drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 91 +++++++++++++++---------
>>>>   1 file changed, 58 insertions(+), 33 deletions(-)
>>>>
> 
>>>> @@ -4042,16 +4057,22 @@ static int qmp_pcie_power_on(struct phy *phy)
>>>>   	unsigned int mask, val;
>>>>   	int ret;
>>>> -	qphy_setbits(pcs, cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL],
>>>> -			cfg->pwrdn_ctrl);
>>>> +	/*
>>>> +	 * Write CSR register for phy that doesn't support no_csr
>>> what is CSR register?
>> The registers of PHY.
> 
> So 'CSR registers for phy' means 'registers of PHY for phy'? that seems
> incorrect.

"Control and Status Registers"

Konrad

