Return-Path: <linux-arm-msm+bounces-59003-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E60FAC0431
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 07:48:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 39E111BA3BA3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 05:49:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E13E91ACED2;
	Thu, 22 May 2025 05:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PjVjkGZi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F06B1AA791
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 05:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747892932; cv=none; b=T1wM9Tso9Piaj9MWK766htxDu5igPdBKWV8GJYokJ8PituG27zMiQiD9cE7kQSAD6tqYkwwWtfDxBv/1K8SD1wWkl0FeecTPPLDFSbJLN96zGJ231XBvvgpZJilH/JJnhmYb+SePE7jeYvYBxlKDFTGsrvkoy99UDG7e+R26YFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747892932; c=relaxed/simple;
	bh=kHwGvfpRcSfgekebHrGvH+4JlYV+j4+tLz9hnEjO4WM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CIoWVnomhT97qEzk3EF4V2lkOlhsuqkK/pAPDS551L1U7h8u/qdusiASxBC9WrwiObPlqEmL9opHLWEZCpoFapmQ/2RFuG128qGrd0hAXWxuk31eLLy/YIVDDGEQDzLkgbpdt1mWXHrQ9G3J7CuCA7RyiU+1poNjBNNDjvjG/8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PjVjkGZi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54LMYsde031003
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 05:48:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u4vHLpr7qMld85Cpj9/eavLWpeLWA5gKA9GRNVpwlFA=; b=PjVjkGZiFT+gZgSK
	oNzDFUKAO0bkqGIznJEuFA42DqSAeh+YTQNOd8aWobD0w8lsQsv+ahr0tTHcURrU
	xQfOLhNWeIsSfaHCVTUINFdSxjViDWb56WF3TxGElGipkXmM/Fet20WV+ZJIOqIu
	ETUemrKbbjjAOWpw5XFVraEh3WWlB6Pn8n/aQv+RjQPn6W3pwc7nm1oeCITUCn7u
	WzC2ND5MLohx7wvIK8lC1cbXswlXj2Sh0r9HR/YsMH3gmKEtCpAa8lYih0S7DjgD
	CYJe8tRfs91wnhCp1SP26hxZbK2ZaU9Wh0LMxZGqQUhIy9P3T3eIWizE59C/yNPs
	vgpMcA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwh5d7vc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 05:48:50 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-73bfc657aefso5731662b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 May 2025 22:48:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747892929; x=1748497729;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u4vHLpr7qMld85Cpj9/eavLWpeLWA5gKA9GRNVpwlFA=;
        b=k0sBG/9qxbqT6JHx4Gy2Rg+r3m+hOJoNfTafHtNtl3Jj3bQF0dNCmGAZPfB/oTI/Lt
         WP1vAHBXjx4/gANeVZfOgH2VCvsN9Vewrz7Lh+aOTm+56LqRlEHSc+rmne1BxW//geAI
         IDmsMqtoAdV83RW7OEmh8bva5KcugMd8ZF9vUtq6uGseOhdaxRZYE09MhExPqPOquJbe
         79AqOQvv3bUUo9U/DulTrLa2zwSZjNhLmeqrgi+XMtkHTNduOYjDGBeOb8uYd6KsjLYR
         SVD1utPwKCqwghpawuMcE8XkMWUUingRrSDp9xBrHnveyvTwcVYDg6o0XlabmTtlssy9
         nyXg==
X-Forwarded-Encrypted: i=1; AJvYcCVORBuILEcEREqfKwfBJEj2Wud0ncjy1MBL3TL1RYkz8ltbSGR4VxbVbLIDBeAbAvqlPW34m/vEZySAKrNj@vger.kernel.org
X-Gm-Message-State: AOJu0YzvOKvrw6x+k50zC8QVhwtcdbsQN3Trse1FBX0NAtbv06G1SN7H
	8F2R9O6hBfYgbL4tz7V4tIIlFHk+ShXXYIgN/8JbZwFxxYhD6etERwHKuAxekn3z0ea68BMb1St
	H63HsyEXwjUfdGqwauJbBNgmr/VGTmes+diXTj/6nVXReSmViS3yHpi/GsgseQ9dnpTmbfs33vk
	Xw
X-Gm-Gg: ASbGncslCCabrpbt86ZIO3FpvIDLnWpClUc8BdPFSd+EPqiTX+u+oufxcYyvwgMtPHE
	BtsySXjx1sHoNsY3xdnPO+cLWHy71fgm2NPlG5X7cyCHZNim4A4V8V4XNonXyHheRhk8q8LsD8c
	cPoxxBOOxeP8G/MJOC/17pGOZdYQNkZ0BcbkAeXAqD+7tgcFU/adiIjVyZKmysITSMQ2O6YR2pg
	PtrJ3Sc8aX6cyGj7tGVjt7SM/n/OzEVfzT/YEgjtMuz9Uflc2rvL2+DVKvLNprKn48uF7fLuCfK
	uFwSoKhrVB0YgaFABX5X2jFVKh4vjbCtzTS6
X-Received: by 2002:aa7:9ec6:0:b0:742:da7c:3f28 with SMTP id d2e1a72fcca58-742da7c3f91mr13611721b3a.21.1747892929490;
        Wed, 21 May 2025 22:48:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGsY64kzMtwnXc1itvu5C3a9SrK0aV09w0OO5xp0bk3Iho6o+8xk1V5tkGCktoAWxnCoi79Lw==
X-Received: by 2002:aa7:9ec6:0:b0:742:da7c:3f28 with SMTP id d2e1a72fcca58-742da7c3f91mr13611696b3a.21.1747892929088;
        Wed, 21 May 2025 22:48:49 -0700 (PDT)
Received: from [10.217.199.21] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eaf8cc59sm10516689a12.40.2025.05.21.22.48.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 May 2025 22:48:48 -0700 (PDT)
Message-ID: <7f1d0db1-bdd5-4d50-8880-c0a1d2df4af7@oss.qualcomm.com>
Date: Thu, 22 May 2025 11:18:44 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] soc: qcom: qcom_stats: Add QMP support for syncing
 ddr stats
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Doug Anderson <dianders@chromium.org>
References: <20250521-ddr_stats_-v2-0-2c54ea4fc071@oss.qualcomm.com>
 <20250521-ddr_stats_-v2-2-2c54ea4fc071@oss.qualcomm.com>
 <jl4g7mutb65ifxuv3covropjntziv5enxyc3lgz2fi7ddu64bd@e726p6by3vfh>
Content-Language: en-US
From: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>
In-Reply-To: <jl4g7mutb65ifxuv3covropjntziv5enxyc3lgz2fi7ddu64bd@e726p6by3vfh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDA1NiBTYWx0ZWRfX6ngemWN0AwqU
 jNbJW5qE03rLUKycScOWMWDYT+qyWKquq2fasirHOVL3DaVcdJgO/lTVfA6UObI2SM7Sm0Mbc0H
 P8OQqqW0Rtdd9wp56p3Ows0H+rb63bWvvins72LUDU7lgjXavptHfOy9QjnnQyWGqUTaI54r00p
 YzCN7YBTBGiIDW7gD/my6n9FZl2HVLOD9PJ5R/Pe3/bzThpZqyIWIInHQWwdaYimw26lY4+NTUV
 A6uk9LThJWU/4kPDhroGp9VBLhw3fJcNBdEPHOTwdCwGEWxn288jLv7FACiWyWB/w6lziCKL6hM
 KmQJ8EAo1jQ6bS8uD3zksaQ/MJr4FuVXy3J8dGdUnpABkuBoB4l6RQZDjQdyuNGKYTMzThuKEhx
 /kEvxQYis+neDsgnjYTXaVGLR6RcnPISA5H17on35fet2UAor1S0+CqxSK15WZgo4Cmkca/l
X-Authority-Analysis: v=2.4 cv=XeWJzJ55 c=1 sm=1 tr=0 ts=682ebac2 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=ARcffcqOct04O5k4gLUA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: sLzP0Lbi5zxQ0v51cm9rwl-byihAt0Gl
X-Proofpoint-ORIG-GUID: sLzP0Lbi5zxQ0v51cm9rwl-byihAt0Gl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_03,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 mlxlogscore=999 mlxscore=0 bulkscore=0 spamscore=0
 suspectscore=0 impostorscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505220056



On 5/21/2025 6:22 PM, Dmitry Baryshkov wrote:
> On Wed, May 21, 2025 at 02:02:11PM +0530, Maulik Shah wrote:
>> Recent SoCs (SM8450 onwards) require QMP command to be sent before reading
>> ddr stats. The duration field of ddr stats will get populated only if QMP
>> command is sent.
>>
>> Add support to send ddr stats freqsync QMP command.
>>
>> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
>> ---
>>  drivers/soc/qcom/qcom_stats.c | 29 ++++++++++++++++++++++++++++-
>>  1 file changed, 28 insertions(+), 1 deletion(-)
>>
>> @@ -310,6 +329,14 @@ static int qcom_stats_probe(struct platform_device *pdev)
>>  	qcom_create_subsystem_stat_files(root, config);
>>  	qcom_create_soc_sleep_stat_files(root, reg, d, config);
>>  	qcom_create_ddr_stat_files(root, reg, config);
>> +	/*
>> +	 * QMP is used for DDR stats syncing to MSG RAM for recent SoCs (SM8450 onwards).
>> +	 * The prior SoCs do not need QMP handle as the required stats are already present
>> +	 * in MSG RAM, provided the DDR_STATS_MAGIC_KEY matches.
>> +	 */
>> +	qcom_stats_qmp = qmp_get(&pdev->dev);
>> +	if (IS_ERR(qcom_stats_qmp))
>> +		qcom_stats_qmp = NULL;
> 
> Don't we need to handle QMP being not probed _yet_? In other words,
> there are several distinct cases:
> 
> - No QMP defined, proceed without it
> - QMP defined, not probed yet, return -EPROBE_DEFER here
> - QMP defined, qmp_get() returns an error, return that error code
> - QMP defined, qmp_get() returned valid pointer, proceed with using it.
> 

Yes we need to handle these cases.
I will update in v3.

Thanks,
Maulik

>>  
>>  	platform_set_drvdata(pdev, root);
>>  
>>
>> -- 
>> 2.34.1
>>
> 

