Return-Path: <linux-arm-msm+bounces-87384-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 623B1CF2599
	for <lists+linux-arm-msm@lfdr.de>; Mon, 05 Jan 2026 09:16:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DD353303833C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jan 2026 08:14:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67965306B02;
	Mon,  5 Jan 2026 08:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AEjWzkeJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Da29QZH6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8E7B30215A
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 Jan 2026 08:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767600874; cv=none; b=n2P85QcNoz18sWd1Z2YRQBuRwjc1o6urD50d62HfjtdIejZuMSAGQY/JTZ9Bx1swKSkPLgvsDJXAc8qqOQ7lu+srLFa/KlEghKVgKA+0lDOLRAmmvoxrfyv4nUuSdYQd+GPdG3141/eRxDd5r9xFqdOwpEsTRajmnda4HWDayCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767600874; c=relaxed/simple;
	bh=iQgnY4tsOzShFSo7WAUmSz6XrB6EpkXakU9TrvblBqQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hQ+3e+V7mMBjBQnPGPQ8rO5Pve2TQqsY0kEKg/Cn34HiysBuoH5e10wV+1SBZmmT256m+6cX62AkryP/N5jE/PYrqv41mrnQsDzWzyFH4hnrzZH/nyvsS30cnpHsThrnUaCsgxnmg3N1pArGZVKF5jv+Tmf/2CZhL5WNJYVzLlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AEjWzkeJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Da29QZH6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 604Kvv6l3627123
	for <linux-arm-msm@vger.kernel.org>; Mon, 5 Jan 2026 08:14:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Knhs8IKzgA/n8eZfM4YQQbHrb2riHOCrLcAUD8rcnII=; b=AEjWzkeJnXtiuWvA
	9K7CIIeLRGgNAj4NJPQnNqUTMGdJ+nTcVMSp5R2dJUg6KqxoDADWaC2OW57IL4Nr
	VVDoS7AE4zsnoSf/gqciO8FZukcajLb5lUImBFzM++zmFYarGqIeyhP7N4N4gUHN
	CCwh81afDEcIegdWf2BoFk/slj6nP8RTkM7mxvfniEowEvJ5YIfqfTOlT/snBLAM
	9LLJ7d0tA3gPM9gDBnLT3cFlcqAJhIMtGQar5VJq71Q6/FYGZ4UJJb+dTMhAbmTx
	KXb7G4GjorRvCBWN8LZnfsa5UCXeWNCTbfOGXtHJE3lXNtGvq9qR1CAi+3GMwVRu
	Qv0dHg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4beuvd3qhx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 05 Jan 2026 08:14:31 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a0bb1192cbso287071195ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Jan 2026 00:14:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767600870; x=1768205670; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Knhs8IKzgA/n8eZfM4YQQbHrb2riHOCrLcAUD8rcnII=;
        b=Da29QZH65SFBHFaSj62vxxg/+s9zmnKQiSh5g1bDLcz9bhLF9hXO6Fk0FJBYA4gg0F
         dWx6a1D23s4Fmh0kDuPzux0sL1lgAkswTBCKRHdDcVxuFRXr1WSmpez5DJ6MuMxKrZil
         9LXq/6T+NL8mdSVoCE62RuuGYItquDIONeD3QuYnapWMlocA9YGv/V5XahMH57faTI5B
         9q5KLHCzgQRProCQsl/8ud3LuGu05bEcDnqWFoBapsTUK9Pwi4TKBG8POaZ0AekYpnL4
         2iqjK7tiYWY2Ppc29YLHGUPd5KRlFN00H3lsDZXBDJhCXMN8elRhA2BEedZO4gu6ITE4
         CJmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767600870; x=1768205670;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Knhs8IKzgA/n8eZfM4YQQbHrb2riHOCrLcAUD8rcnII=;
        b=UXf1IlwEy2G06fVQDhN6Mb+vl4AwoChW0EzAJZzjIfAjP+V7FxbM+aHGpEmnLISgzC
         8VeIphlbZ852zFNIVGXlAvCK1pg1ZemDS/xCp216EjPL6Iu/MTyLLXUgHG3EwKSbqLO4
         P6FtUqhbqI8NVi2DK8+4Ea4A5DMSHlKYUOgeoDVUpywi69zgSLaXfJZohy19evgOK8an
         7/7PpYp/L2Up4YHHYvMswCs/fWYhK1hGuAWHNqFYcvLtsG95nnwp1nJnMC7X7WnZ/R9o
         fESxVLiqDCwwD7n6Ts3JgVFPu2gu2kjzY2xtLx4L4n9vrQG3yV4QM/ybfJKNSpc1nJXs
         mThw==
X-Forwarded-Encrypted: i=1; AJvYcCVyhpwKplCWkehzFGv0aHdoPdNEyNu3cBVWGvFaBmwnUqC2kWlQRiJg1qqtqtfQr1vpoXvJlBrzD4HTElId@vger.kernel.org
X-Gm-Message-State: AOJu0YzfuF1/zlUx/jkJlgwAXKMwCSwDSvoj+5h4hHU+lxwxi4GJeSGU
	HklUOR+atC1aoDOjS2KmtzNt6sg0TJuFnlq8YQUxUnRuFr8/dL5fT5Gg4r/M7J/kokw4R4yLGCl
	lFgx0kQeLF1zXcKbGYGvNe4onN7nQplfmWm0ToiCc7UntABffkZ4tM111rtu9xj/h6aOW
X-Gm-Gg: AY/fxX78QrvRlcEaU0H3doOnygPEsnU+7mcViTD+bC+K87oiA3MJfgZBSkzII70XBSA
	c+Mdnv8RCLzdoAsgauJr+5eMO+cpLRW76oO13Kz0Vm3ILKxyRg/T+sWRnKPZ/5oYHLZ89VU05Iy
	MF8isNGJbYySPDWbZDDiU+rApv9kUU+CWhlQ3MzD067TCipDNdg38cG/f67KLoPEFlLr582WXNA
	g4nKU5tYDW7eijIwx9Kk6/a9cWn+iDFDS0cdYhuAAtlMHMSPYiqyKJgXNLXIEXwDB0Y/zOP7gFA
	TyxU93ommEmJNJJHdSJIy93yMKuqJ8OtXWOZzhH5EEl5RHvBGVNZntPwGh2SXsPtOy5UYecEY7P
	N4tMHnEoly5PIGP+bTa0oVE+UmwA3WIRuEMAHLvRwtfsysikit48=
X-Received: by 2002:a17:902:ec8b:b0:2a2:c1a3:63df with SMTP id d9443c01a7336-2a2f2830da5mr499135505ad.31.1767600870435;
        Mon, 05 Jan 2026 00:14:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEZI5oU7cvHuyxSVZFYShCuld3qOUBm0+t7A94kkYYSw+mc4FnyDDkRFTHl/35PeuZ3unmeVw==
X-Received: by 2002:a17:902:ec8b:b0:2a2:c1a3:63df with SMTP id d9443c01a7336-2a2f2830da5mr499135335ad.31.1767600869960;
        Mon, 05 Jan 2026 00:14:29 -0800 (PST)
Received: from [10.217.216.105] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d77359sm447042285ad.95.2026.01.05.00.14.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jan 2026 00:14:29 -0800 (PST)
Message-ID: <50d07f12-9a22-4120-a658-e6a462b9f8ee@oss.qualcomm.com>
Date: Mon, 5 Jan 2026 13:44:24 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 2/4] scsi: ufs: qcom: dt-bindings: Document UFSHC
 compatible for x1e80100
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, martin.petersen@oracle.com,
        andersson@kernel.org, konradybcio@kernel.org,
        taniya.das@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com,
        manivannan.sadhasivam@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
        nitin.rawat@oss.qualcomm.com
References: <20251231101951.1026163-1-pradeep.pragallapati@oss.qualcomm.com>
 <20251231101951.1026163-3-pradeep.pragallapati@oss.qualcomm.com>
 <20260102-rapid-abiding-parakeet-d0735f@quoll>
Content-Language: en-US
From: Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>
In-Reply-To: <20260102-rapid-abiding-parakeet-d0735f@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 9XStgGCi8BC4ASiulp6rwwyD5tldONwU
X-Proofpoint-GUID: 9XStgGCi8BC4ASiulp6rwwyD5tldONwU
X-Authority-Analysis: v=2.4 cv=OuhCCi/t c=1 sm=1 tr=0 ts=695b72e7 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=hz69ntJn8m3YF9laBZ4A:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDA3MiBTYWx0ZWRfX4PfgYUt0L/dV
 QvNQHOpyTvOK5li7fb9eA1RMkPvQ98Wubh98ugmjp6dlE3KjrAeBMrqARsdP/qxvFFqzW3NnrXu
 0O3xWtkIxjTFP+PpWHzEwBst52E5WdpDAlpnVOBn9pYBHBdKDa+61v8Z5WyGFXPnx783lOsbZiS
 xW2uPXHluAIdnGPyA4w9mP8WAJjEq765IBtVANu/QFQbTTeZKzrG92bPYbdguwrD2BuIeVFIr3N
 P7VJfLVm9BgKCVClzx/JBRmi4xU6TRhp9CrNBKHryzgUbIolYQ86ThbjpFyA5FNCl0lW2ZvTqrN
 B/PcB0YVULc3yA+OpXrNjlqQDdJWxPiv/gy1eF6s9Oz6gfYMd0VKxCtktWfX5Rg/Kkv8sbffTaj
 eQ9nKs23BRN/D1laP60NMx0jHlnfNd17SR5oKCF7jDjIBkmZnoPqJQSWg+stj0cFbRoe+ncot16
 tRGwFhWRQyUZchgOTpw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601050072



On 1/2/2026 4:55 PM, Krzysztof Kozlowski wrote:
> On Wed, Dec 31, 2025 at 03:49:49PM +0530, Pradeep P V K wrote:
>> Add the UFS Host Controller (UFSHC) compatible for Qualcomm x1e80100
>> SoC.  Use SM8550 as a fallback since x1e80100 shares compatibility
>> with SM8550 UFSHC, enabling reuse of existing support.
> 
> Your last sentence is redundant. "Make devices compatible because they
> are compatible". Why are they compatible? Or just say that you add a new
> device fully compatible with SM8550. Write concise and informative
> statements, not long elaborted paragraphs where only few words are the
> actual information
> 
ok, i will update in my next patchset.

>>
>> Signed-off-by: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
>> ---
>>   .../bindings/ufs/qcom,sc7180-ufshc.yaml       | 38 +++++++++++--------
>>   1 file changed, 23 insertions(+), 15 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/ufs/qcom,sc7180-ufshc.yaml b/Documentation/devicetree/bindings/ufs/qcom,sc7180-ufshc.yaml
>> index d94ef4e6b85a..0f6ea7ca06c8 100644
>> --- a/Documentation/devicetree/bindings/ufs/qcom,sc7180-ufshc.yaml
>> +++ b/Documentation/devicetree/bindings/ufs/qcom,sc7180-ufshc.yaml
>> @@ -26,26 +26,34 @@ select:
>>             - qcom,sm8350-ufshc
>>             - qcom,sm8450-ufshc
>>             - qcom,sm8550-ufshc
>> +          - qcom,x1e80100-ufshc
> 
> You don't need this.
sure, i will update in my next patchset.
> 
>>     required:
>>       - compatible
> 
> Best regards,
> Krzysztof
> 


