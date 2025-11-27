Return-Path: <linux-arm-msm+bounces-83606-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 63265C8E9B2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 14:52:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 775D14E9319
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 13:49:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C677F21D3C9;
	Thu, 27 Nov 2025 13:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m+RiO1Lb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iyv/rBwf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69ED62D9ED7
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 13:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764251387; cv=none; b=M8GdFkt3JipP6WGfXqQZxJh1a7ccUQI5dMP3bDuJhT/HJrmxtTqla/WoTb2QULUixZyRrI3fuBv8oEvsOF3FnJY1gYr4XDt4FNiILoTERe9zcfMO65FyOjwUOXj3hXxKCEl6vyURC/7kXeRWIYzdxz1zKqAJw8OQmWB6kzHqc2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764251387; c=relaxed/simple;
	bh=XHIdDZgxY1jB11+/ksCNdEHLyCWRaKHhvpg57H5fig8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JfDahLmQIA8wCwic4xPK/3ub8GtMrXDi5A2UPxAaIgds1IaECTdTlgoeZMOyJYWgbP/84wlfrUIS/b2peeDQCXCmByDKcFCaZJTUexhjPNxx43kuxKmFBMuXslh4GmuAFEZ/M3ZqWmAo3GYYfoAhcuzmjao0hn79lsvtB2mdsfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m+RiO1Lb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iyv/rBwf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AR9xQwJ3840054
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 13:49:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AR6yH0an7GidcnrKjR4ZhTcqGkaYPDHpx9kK5ujkdK0=; b=m+RiO1Lb39/L/PVi
	pc5q8avwta3lOO4V6m5Oi6qRxUGjeimHwULrEzI1paECIa3RHdEBAlMSwaWVKtEP
	Q97EJxoofKlVsH/bWhW0yUmMfSSMx4NvZGvtsxkI2AzrHB7iBaxOrvn0VGI2fkKd
	fLODbRILQFxCicr4D5BdQjgEjdDOiM4SbsbzRMb5VwDIGouCX883G4vedrmsg5br
	rBDKonvziKngUWbFgB+ryORjhB7wS8DtmChi/RWG5wejBmFL0kdHWjY8kJt/UUJW
	noBzwvgRTeIVC50Ip6d141J6tsoRpvirNcVPCNqTC3K+CH4XKLGRwfiC4mF1l2Py
	TobU/A==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4apdj09tqh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 13:49:44 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2982dec5ccbso15852575ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 05:49:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764251383; x=1764856183; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AR6yH0an7GidcnrKjR4ZhTcqGkaYPDHpx9kK5ujkdK0=;
        b=iyv/rBwf005mxND/vVoaYFDQFHSyUGAYiMJ30HxCCSD42ZV3Eg3EvlCV7H1bnx8OXA
         hrbzmjEahhWEs1e3JNiIqcv8K7d+7Ow3xRIROznd/m+neRbD0evXX6LqMBav7tRo7O1C
         lljDALDyb8MDUSDCrOXK+fzhOksoddxIh4oLYzF4ngiovvulv1d5t/cyY940pXR9WhW0
         0VDVvCBMUohZpx9MtO9UHA16I6Ynd+EXw4lQkdxvAEXtLW8U08vme17f21ERIjK97ro7
         VmMJ9XoeKG4mtk/4UgrXGGAiUND4MZtzXRat8SRasfEg4rs7gHEZEjiL4zIpYq3LfhNU
         eilA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764251383; x=1764856183;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AR6yH0an7GidcnrKjR4ZhTcqGkaYPDHpx9kK5ujkdK0=;
        b=F9CcOd15Ih4JIgsN/vxvh3cFG8fCpL+4Xcne+8p+vI9Tb3zX6BqofgcLgJbh/DUOle
         opYsoy21OK9tvW1hAaYl+5M5izUUTv+mU+l2hFcY2+gWkQCA1D/XxAihoQVqT/4Nt2Nd
         lu27Tc8nEYrQ9tKBMTJM3UHZ75qDZCDvml+IavVFpdG7runA9y6gjhehkKjYtMYJ4/Zb
         sG0sLeWvaRH0mk6a6Z9oGTJTZqnHL+Ac8l8qX1Mgt2N4albtMAITPq5zjc2mWZrizOtw
         KF1nZK9yiW5b5XZUjhb0Q81+Uo+tp2MVag96WroQCyS5y7mnCI5O4xGo1qmuw9D5V6nK
         fMrw==
X-Forwarded-Encrypted: i=1; AJvYcCUEDaR54+vJQJsvc7tM0w04k0QfLBAVgeoE9kOjC7Ph54t0q0Q0C2E7Oe9R+OuqtDN6p54peP5ikQYQMhwi@vger.kernel.org
X-Gm-Message-State: AOJu0YyN3YIThmTdh5uZb/OHIAuCTuskbemqhvzaylbnsWzYJAYAeL+Y
	L22CdNBknsTt9pN/qSvHMv9MbncSJa0zF/mjJdl0zYEFgYc8hsBS2oD4RdXiBT1qOMOcq499bbZ
	DGs0QNxW4U7JFYxJ0IMoErAuMMb4ZNGbEqIHPpz+h36mLFWXr8OQNAVcTJbQfms2NNxyq
X-Gm-Gg: ASbGncsb7BC4sNlgBX+zNBZAZTTYYd7I+jM5GHhrEeVVCRHucO9l06bMUF+5l+6X2G+
	uxIBmlH+tMGujxT0doUwrPerj0Lz3miFPtVbfITpuL6+8dwJ6H7mgIhqZMUhrADbUNMyfWhljSy
	w6WrhbGpBAN5dwzvPs3fbIbt14xlv9GhjNl810lZ3FVsSC32X1tZsvszQtiBthkCCX1rU4kyTT5
	XY7MPtzkfylWTJzzMv0rAyxXDWTdynuKrb6fRkvaVNVFlSsmwQxsF4nBSqd/yD37aFYDV+mkRuy
	kv4Uv2jBfKxEU0M41GuwLdFCJn02lAt3b+4hoxKm+6MWwfChRLZaZUPp8dc7IAcgrQjYzRlW4Ko
	+FHuFsPteNjEynZ3lqqB6hmm2MxWL4TjgDfH5eXpZHA==
X-Received: by 2002:a17:902:cf4b:b0:295:7b8c:6611 with SMTP id d9443c01a7336-29b6c404112mr252808655ad.15.1764251383085;
        Thu, 27 Nov 2025 05:49:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHgUSQMUcI60gfX8yv8UpPZMvZdOsY7hbpI6g9P7Smd5xtU7F6gsO/GvmRqiF64el/MfTP7Yw==
X-Received: by 2002:a17:902:cf4b:b0:295:7b8c:6611 with SMTP id d9443c01a7336-29b6c404112mr252808245ad.15.1764251382457;
        Thu, 27 Nov 2025 05:49:42 -0800 (PST)
Received: from [192.168.1.4] ([49.204.106.218])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bceb27527sm19050035ad.60.2025.11.27.05.49.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Nov 2025 05:49:41 -0800 (PST)
Message-ID: <a5392c29-1097-4b7d-a8c1-3536c8f46bea@oss.qualcomm.com>
Date: Thu, 27 Nov 2025 19:19:34 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 01/12] soc: qcom: geni-se: Refactor geni_icc_get() and
 make qup-memory ICC path optional
To: Bjorn Andersson <andersson@kernel.org>
Cc: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, psodagud@quicinc.com, djaggi@quicinc.com,
        quic_msavaliy@quicinc.com, quic_vtanuku@quicinc.com,
        quic_arandive@quicinc.com, quic_shazhuss@quicinc.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20251122050018.283669-1-praveen.talari@oss.qualcomm.com>
 <20251122050018.283669-2-praveen.talari@oss.qualcomm.com>
 <c4qgjg3npsi6dkvqyj2z5drd7mfg2w2o4cjjcgepxdsrgiyiic@qdpkcic56iwv>
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <c4qgjg3npsi6dkvqyj2z5drd7mfg2w2o4cjjcgepxdsrgiyiic@qdpkcic56iwv>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI3MDEwMiBTYWx0ZWRfXxEsgogrWDWiu
 V15Ga2NkdeSxMWOBW8X0dLxY0H/6BHghWC4sH74wANmsxBGozoGe4Q+O00OEY6JBxlguipu1/Z5
 zFKcqXZA0NlwiMItSWu0+0xygKo6OE6BayoAjkXY7HhbwqPzwEYzK79YcKhMg2Zibx8VwY598pd
 +qkNcNm7eUPbhBHzkQ0KJmz5/RarSfKpwH85R7gI+fycMryqm2XSb7Uz5PxFjTNc4bYK02R5pBJ
 nt/aWkTtzfSe7KT4At3Thqq+xm1yxXi5fnbWrkNKIhUQ3CnWJo/1Tvbx2fgC2mQyjP8Hz6R9qAx
 cKHHWuZm0M4hCYV2QbJvUtYgNQH7Hj0tTXuUe8ZhzPuMvY8AXnpw3g+CjEiBxq95aJKBfzORfcM
 LEt3wvSUa5lyht+NZM2HiFoYLpFJPQ==
X-Proofpoint-GUID: QduXNLBDOYiBsNLDiyM2NxpB2SAbHOQG
X-Proofpoint-ORIG-GUID: QduXNLBDOYiBsNLDiyM2NxpB2SAbHOQG
X-Authority-Analysis: v=2.4 cv=PJoCOPqC c=1 sm=1 tr=0 ts=692856f8 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=knFCEH6M0+SSkFC620ieTA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=0ubc-UyFceJAKQbUBzMA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 adultscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511270102

Hi Bjorn,

Thank you for review

On 11/26/2025 8:37 PM, Bjorn Andersson wrote:
> On Sat, Nov 22, 2025 at 10:30:07AM +0530, Praveen Talari wrote:
>> Refactor the geni_icc_get() function to replace the loop-based ICC path
>> initialization with explicit handling of each interconnect path. This
>> improves code readability and allows for different error handling per
>> path type.
> 
> I don't think this "improves code readability", IMO you're turning a
> clean loop into a unrolled mess.
> 
> 
> But then comes the least significant portion of your "problem
> description" (i.e. the last words of it), where you indicate that this
> would allow you to have different error handling for "qup-memory".
> 
> This is actually a valid reason to make this change, so say that!
> 
> 
>>
>> The "qup-core" and "qup-config" paths remain mandatory, while "qup-memory"
>> is now optional and skipped if not defined in DT.
>>
> 
> Please rewrite this message to _start_ with the problem description.
> Make it clear on the first line/sentence why the change should be done.
> 
> E.g. compare with something like this:
> 
> """
> "qup-memory" is an optional interconnect path, unroll the geni_icc_get()
> loop in order to allow specific error handling for this path.
> """
> 
> You only need to read 4 words to understand exactly why this patch
> exists.

The "qup-memory" interconnect path is optional and may not be defined
in all device trees. Unroll the loop-based ICC path initialization to
allow specific error handling for each path type.

The "qup-core" and "qup-config" paths remain mandatory and will fail
probe if missing, while "qup-memory" is now handled as optional and
skipped when not present in the device tree.

I hope the commit text above should be appropriate

Thanks,
Praveen
> 
>> Co-developed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
>> ---
>>   drivers/soc/qcom/qcom-geni-se.c | 36 +++++++++++++++++----------------
>>   1 file changed, 19 insertions(+), 17 deletions(-)
>>
>> diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
>> index cd1779b6a91a..b6167b968ef6 100644
>> --- a/drivers/soc/qcom/qcom-geni-se.c
>> +++ b/drivers/soc/qcom/qcom-geni-se.c
>> @@ -899,30 +899,32 @@ EXPORT_SYMBOL_GPL(geni_se_rx_dma_unprep);
>>   
>>   int geni_icc_get(struct geni_se *se, const char *icc_ddr)
>>   {
>> -	int i, err;
>> -	const char *icc_names[] = {"qup-core", "qup-config", icc_ddr};
>> +	struct geni_icc_path *icc_paths = se->icc_paths;
>>   
>>   	if (has_acpi_companion(se->dev))
>>   		return 0;
>>   
>> -	for (i = 0; i < ARRAY_SIZE(se->icc_paths); i++) {
>> -		if (!icc_names[i])
>> -			continue;
>> -
>> -		se->icc_paths[i].path = devm_of_icc_get(se->dev, icc_names[i]);
>> -		if (IS_ERR(se->icc_paths[i].path))
>> -			goto err;
>> +	icc_paths[GENI_TO_CORE].path = devm_of_icc_get(se->dev, "qup-core");
>> +	if (IS_ERR(icc_paths[GENI_TO_CORE].path))
>> +		return dev_err_probe(se->dev, PTR_ERR(icc_paths[GENI_TO_CORE].path),
>> +				     "Failed to get 'qup-core' ICC path\n");
> 
> To taste, but I think a local variable would be helpful to make this
> less dense.

Sure, will do it in next version.

Thanks,
Praveen
> 
> 	path = devm_of_icc_get(se->dev, "qup-core");
> 	if (IS_ERR(path))
> 		return dev_err_probe(se->dev, PTR_ERR(path), "Failed to get 'qup-core' ICC path\n");
> 	icc_paths[GENI_TO_CORE].path = path;
> 
> Regards,
> Bjorn
> 
>> +
>> +	icc_paths[CPU_TO_GENI].path = devm_of_icc_get(se->dev, "qup-config");
>> +	if (IS_ERR(icc_paths[CPU_TO_GENI].path))
>> +		return dev_err_probe(se->dev, PTR_ERR(icc_paths[CPU_TO_GENI].path),
>> +				     "Failed to get 'qup-config' ICC path\n");
>> +
>> +	/* The DDR path is optional, depending on protocol and hw capabilities */
>> +	icc_paths[GENI_TO_DDR].path = devm_of_icc_get(se->dev, "qup-memory");
>> +	if (IS_ERR(icc_paths[GENI_TO_DDR].path)) {
>> +		if (PTR_ERR(icc_paths[GENI_TO_DDR].path) == -ENODATA)
>> +			icc_paths[GENI_TO_DDR].path = NULL;
>> +		else
>> +			return dev_err_probe(se->dev, PTR_ERR(icc_paths[GENI_TO_DDR].path),
>> +					     "Failed to get 'qup-memory' ICC path\n");
>>   	}
>>   
>>   	return 0;
>> -
>> -err:
>> -	err = PTR_ERR(se->icc_paths[i].path);
>> -	if (err != -EPROBE_DEFER)
>> -		dev_err_ratelimited(se->dev, "Failed to get ICC path '%s': %d\n",
>> -					icc_names[i], err);
>> -	return err;
>> -
>>   }
>>   EXPORT_SYMBOL_GPL(geni_icc_get);
>>   
>> -- 
>> 2.34.1
>>

