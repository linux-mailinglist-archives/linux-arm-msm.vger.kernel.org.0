Return-Path: <linux-arm-msm+bounces-71550-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D521B3FCE9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 12:43:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1C9C420657F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 10:43:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B552E2F39AF;
	Tue,  2 Sep 2025 10:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k5FGj8Bc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36D952F28F4
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Sep 2025 10:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756809774; cv=none; b=rvTkXp9O6kPFpIAkIggG87WJx0lu1Ujc/GcfG0c4XRMQ4UFFvVB6szrnVmKgcfj4a8B9Wddy12r0aSoX2ge7e8O6GR201W9YmhuX3lJjMRXLxBY+20MFIULhc9LZPNJlp7H9mV25WjeWSMnKPCI6NQkbGuHgzznMkY7AI8ER+UA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756809774; c=relaxed/simple;
	bh=viLzRs0dgFeJqxdC5nltzyGMmAHmpEp54dKYBCEvJyc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a6fwQmAuboXmr6Hs/g2t8ni+/4oc1HXm/XbjD+S4cGuvSdhD2EbuTf0kaPAvdEmWUzOGEDYOcIv8eCucvwTmPEUHIUDtWcXOxWRmqzFKCf7kza8eaTP5eWa2Sx0eWaVTKu8Y7TneJVMRztztXhC+RivFZCVkNDTY3FlImk0wpZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k5FGj8Bc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582AV2PA029772
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Sep 2025 10:42:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8HGSFKsLXaVM0YQCxvDcTSEB0RtFGcIdJeQwMuf7cA0=; b=k5FGj8BcmA1eiPhp
	bQChXRO2Bur6Fh3Abwsc5WbKS43zZtdYjhR+gVXcxZ8iE6izst9b4mEIr4tocXqH
	gpM64rn8Tk2zuPKnVTwj2T+KwYHN2nWSJWvVBjBXxJ7v16hMdMGDa0Iag5jZFcML
	nWKtyXfjdbGGxEcxHVW5kkIMiVnJ86XEXqEO0z0ptexxMh0JMah1q0PFDaPzfGM0
	RQhtKehrck1xSC95qAtKUxdiPuJUr5Pr1uf7K1Y4pZyGaEkPuQlemMsoFhhtIZmw
	XhoULg+Uj0XEpri08k9zaukT3nCuBlgHzFsTzMFezCjVacu7UbRzYUDBXp364Y5e
	atzo+g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ush2ycyt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 10:42:52 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b109af71a5so20235831cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 03:42:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756809771; x=1757414571;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8HGSFKsLXaVM0YQCxvDcTSEB0RtFGcIdJeQwMuf7cA0=;
        b=qNh9EvCI4+2TejiuESqJVWS4bsfv44DTyTbe6uadzzXz+DpPHb6+qvXLntVq8IS2xT
         4Rk2LMnvQEdF0qeYXf9bD3STU2XIIGU5nqrY0ag1ap6QFXEKAxEwydFBcilMAkIAkxIz
         THfdy4T+K1po4XPyBO8bqsEgFxlhXT2WEuxwqBd7lAoNbnTwcz7ym/qLBy2FB2k+bcQl
         ZBc0wnw3r+YszMvJsyJzOwuZNY0+ibjaFtkbNxjPvNEpn577j+U18aoF2NeYk3SwzNes
         GpGTKCT4LWvxu76S4t9SaqnqEEHBH0X5zGiLggcBIZLTcqfGuCu2mdWH2+YOPFwCgwXi
         UTlg==
X-Forwarded-Encrypted: i=1; AJvYcCXJKbn5BTtYYt3hXvJxbRzWHlTV7vw3Cf1wUgHjBLZssnqhzxmqWqcnecpYxXq2YlGrv5KLyC5gRnZXH/9A@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1JG4Tm5TPriVpi1nOTjVICmkMTOcZApCpwyE6otuf1cgTCZeZ
	ldsLFPPfpFlBZKlitxSeQ/IcvSm/Tjree0WDQ9Yd+hRJUgAEMAu8FzK7e+draoPBdlAR1GoNxiO
	erGWwWXFpcjUh7RzWKiBhfwqgq1mG4BuQdLse//jRvoNJ+C48uVoM7IuFgclL+69/1NLK
X-Gm-Gg: ASbGnctzHu0mtkzM1iXvmldCq5ZjKr+a4L8fTt2Wb2GUZWFCRw22CyAy9rIv9We4Cky
	eZgTQr3/Wz/ORLyw/DXLRaiSxa/WICegYmsWaSKDfmsKmwuj6wY6DpG+T4z4FLyoaD6g0nGGeuP
	r4Do0RfKDlmZEB6c8XVs0hJsrCj4mSk1g7EGPii5+0E0UqRCDTee6xF9370WL1Dy3W94wbPatTF
	lGAN8XU0weUzA1rvMLZ8bSgNOHPCzU+6XUql0ke3ZdVDJgtuP2o+2TaAfItK8oX7fA3L3twovG4
	W1URiiYN5bDq7UchZt6yUhldsiBv0KRKFYZnJvbzOy9EZc+fvXP6XPS8qGwLWQrE1al3CvAK0nm
	zbxEsZK8BSU9FrgPjJ+H8Yg==
X-Received: by 2002:ac8:58ca:0:b0:4ab:63f8:ef30 with SMTP id d75a77b69052e-4b30e90634emr127554541cf.3.1756809770658;
        Tue, 02 Sep 2025 03:42:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEIa+zdu/DvCI2hhATthcW4/zvfigbUW8Sknvl3mmHIrbuZ2hMWV/w4jclDKRuy1HZUPW0xbA==
X-Received: by 2002:ac8:58ca:0:b0:4ab:63f8:ef30 with SMTP id d75a77b69052e-4b30e90634emr127554151cf.3.1756809769909;
        Tue, 02 Sep 2025 03:42:49 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61cfc4bbc6bsm9385161a12.29.2025.09.02.03.42.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Sep 2025 03:42:49 -0700 (PDT)
Message-ID: <f49b34be-89d3-498d-8b85-ff6b0be01acf@oss.qualcomm.com>
Date: Tue, 2 Sep 2025 12:42:44 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/14] dt-bindings: display/msm: dp-controller: Add
 sm6150
To: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, fange.zhang@oss.qualcomm.com,
        yongxing.mou@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, quic_lliu6@quicinc.com
References: <20250820-add-displayport-support-for-qcs615-platform-v3-0-a43bd25ec39c@oss.qualcomm.com>
 <20250820-add-displayport-support-for-qcs615-platform-v3-1-a43bd25ec39c@oss.qualcomm.com>
 <75ra2ofecqu6tid6kr4hnyuztpl6jjaq2ksyquafyajhq2sa4d@4tkggrdqky7y>
 <8918feef-219e-4e69-8901-367189f5066d@oss.qualcomm.com>
 <28b33851-24eb-428f-b046-b145342fd982@oss.qualcomm.com>
 <75f8789d-9d97-49d9-97b0-908a5692c325@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <75f8789d-9d97-49d9-97b0-908a5692c325@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzMiBTYWx0ZWRfXxgwlazUakvs+
 VxbLsuitURsd9BuvsPdarxtkxgATgxG0Vt7jT62YEYvoT85LkJbYRXcge7IuF/YzEST7iJCB1gR
 TvGWwtHPF4x/oTBbrMsCGAd0jf+DHfuOKF83Px/jjCukwzHk5KwADCZFRPh8yuifgxn2+sWuotg
 lHvCkr2VEdFXRzCUqjAgKwNobtbATKqnW6VTDtbkEdVaHpe/ZQq0ZVcnUaZHS9H+SV8eFpZXHjf
 6ziMaCmhVayMZHy3hdlO1byIx8Dvp4uPtHC+gKkVchqWJtd67jB/+KozxdMk7XT1ASvszxUMpB7
 r9XqJx9L6s8EvFF2/y1cSes5m978MbYkr9VjzurdOmQ4Xn0YfSK3o/ainMQjH7TdToXxQurBxGI
 R6Z2fP8z
X-Proofpoint-ORIG-GUID: ptg0d7uNG4NpDLbopoCosu5gOeSDbfas
X-Proofpoint-GUID: ptg0d7uNG4NpDLbopoCosu5gOeSDbfas
X-Authority-Analysis: v=2.4 cv=M9NNKzws c=1 sm=1 tr=0 ts=68b6ca2c cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=zKpf_v0BVtz8pCFJhw8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_03,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 suspectscore=0 phishscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300032

On 9/1/25 2:32 PM, Xiangxu Yin wrote:
> 
> On 8/28/2025 7:05 PM, Dmitry Baryshkov wrote:
>> On 28/08/2025 07:51, Xiangxu Yin wrote:
>>>
>>> On 8/20/2025 6:18 PM, Dmitry Baryshkov wrote:
>>>> On Wed, Aug 20, 2025 at 05:34:43PM +0800, Xiangxu Yin wrote:
>>>>> Add DisplayPort controller for Qualcomm SM6150 SoC.
>>>>> While SM6150 currently shares the same configuration as SC7180,
>>>>> its hardware capabilities differ. Explicitly listing it ensures clarity
>>>>> and avoids potential issues if SC7180 support evolves in the future.
>>>> I assume, it has no MST support. Am I right?
>>>
>>>
>>>  From sm6150 ipcat, I found MST-related registers and pixel1 clk definition.
>>
>> Then please describe MST as the main difference between SM6150 and SC7180 (which doesn't have MST).
>>
>> Also this needs to be rebased on top of the MST bindings. I've picked up the latest posted revision, but basing on the on-list discussion I might need to drop it and post another iteration. 
>>
> 
> Would you prefer I keep the current patch and update the description of the
> MST capability difference with SC7180 in the commit message, or rebase on
> your series and update the dt-binding accordingly?
> https://lore.kernel.org/all/20250829-dp_mst_bindings-v7-0-2b268a43917b@oss.qualcomm.com
> 
> Since MST support is not yet mainlined in the DP driver, even if I rebase
> now, the final implementation may require redefining msm_dp_desc for
> SM6150 in both the dt-binding and the driver once MST lands.

dt-bindings must describe the hardware regardless of the current driver
functionality (which is unfortunately something we've not paid sufficient
attention to before and we're now untangling some messy files..)

Konrad

