Return-Path: <linux-arm-msm+bounces-78747-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A82E1C070B6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Oct 2025 17:45:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0845B4038F2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Oct 2025 15:44:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64248306B12;
	Fri, 24 Oct 2025 15:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iF0tJPBo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE84B2DC787
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 15:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761320686; cv=none; b=dNghpsuIh8aRJ7ziNs4sUK5y/FMlUfSzVJsySF0QJjb0kZvIUatVjliX7ZAcV80aQUilNHnHW3AVpGx6KsgvMbdnR7mSBRqeQ24J/U2d52u2AL6dpGrpj2ZLJZbQcnQiIFavi12K3vMsIF3XmBZZDnfPoqvjh3JEamnl8ITeFpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761320686; c=relaxed/simple;
	bh=BzlFR1sP1LDfQnnqVDneaWvFJahhmEcC/MtNUN+39ow=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eiGY3910LeIqrO4Udo2/KcUUU8axvVM8UVX72UXauOu1a3YJi01EAip3kDn7I/1t1vmlCivp2MJJ83jJKiplkjGtecEFNhDasEBbaEL63lv6sITYGfkpVKU+sCqus9TKAMcF4jbtS77DtmUBqAnKRjCLj1f13/Lp3SqZvrE0398=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iF0tJPBo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59OCXB27017764
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 15:44:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RsSIFOmPwOHfjKgaufxErN9BuxGH1hiiSVvvEFdeNg4=; b=iF0tJPBo7tivlT9j
	X+fqeHS8Rs4DZQz14wcCn53jSzoIqO5bF0p9DEMxaija/ThZbcObPxbhJiE9peGQ
	58Z0Z2A5ZBft8IjHJiVPghwENeecPSdzrGihxFsRUj0u350iuTUTannpLVuT1/HZ
	toR0UUtX+aqfd/xj9YCSP4V0OyqJdzBIIwH5hWq0nSjsqwPuvjNDDILkXuUkR2WI
	A1wipld5nQ7CQjd/htIEi86dMLveLc4/0YIBoAY23uVBKeahV2Iqub9NEPz7VnBn
	KgX2JLIbKzgNj/9ssPQ3b+i+hy1j0JKO/cts0ln2iJ1JWEgmEW+D6GgRdB4X0QMz
	KrawDw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49yp6k3rg3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 15:44:43 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-32edda89a37so1736707a91.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 08:44:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761320683; x=1761925483;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RsSIFOmPwOHfjKgaufxErN9BuxGH1hiiSVvvEFdeNg4=;
        b=REPOEe/HiY5zAC1vFBmf9l25yQ92GaO6CCgpBcB8pcRB4fXjdiVIsrR4zbVxBe3A14
         6HyWaBE6Cw84qKpx6OE4jkIWQCRRlcPD/6eEdID/Rzp8bMw1ocJhARKu2qeENtnr/yFk
         2Ki5eBc79qfV0s6l5ywlrPYPa/wXysDDwrgdvluHIAPaYCeV+Cdu+vtin3jjOEt5jqjc
         IB6Q2qAmYTcA5kyORcBi+n0Dcll3L11MIM7TbpO+0XtK62FrjHTfUKOpfCzg5P74Elgd
         v/qYsrAC33bABY8ddhqfhTPhzqSxjvRi4+8J1uwiB3M+hNvtjXEpJokqzLwWGos0sSPY
         acsQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxzPXccruGp3+GATihGUgeksdL8GKDDjXl9TVT+/5H77q81BZWiFTTVhRLVBzTakK+D74+W0iuRbrmOrYU@vger.kernel.org
X-Gm-Message-State: AOJu0YxAs7+LlePtmPxm+5pItBFHNoKNjdeHUSM28hiCqt7ApBdJHLjS
	QqCEBmSCU9Lir2lmigF7C3Udkef4hAzwUG0eTleIuRxLzLIxctkmOhKjrWdKzPpw2USzoi3cX7C
	eNDMwJf+RksxnDhPwHbKbOnVOJYIHZS6/+2Jz6L8W3kHgjaKWiPjThPhNoZeLr8iTFZRO
X-Gm-Gg: ASbGncvYYwMsbWGwgOI/N2igu+66VotwlaDZKqeFE4zKWcvs0dcovFx2cAoi2w9Uix1
	g4ETF3K+tcY7xWKurV2OqoSjgoI2r17L9MlDC8mdRKglsXqN9zh2G4dBT6yj5znXwwD+DSGRaBf
	o9Q+CK5z/wJrtrdanvXYAj+JTuU2EPtxEX56IGZsDYhs5DQcPXuEyRgQ19g5UGc0Wh7IRSiHiUX
	SVBaWzQs4hzDxscx6ZFCCKnqwPGg4mvrtxpd2YQ149Z5f+fw3n7MdvT4n2ttIxhN6/rb5wFnirx
	ystNUtJS3tAU/oOSf6p4FT5PQj6jn70Rz1KC6O0Zbmd+3PdZVRcPfh43+585feM1MW/pFO9f6kH
	9hFXCvUM+rbBWhzIUhbiTBg==
X-Received: by 2002:a17:90b:3a46:b0:33b:b0f7:fdc3 with SMTP id 98e67ed59e1d1-33fd65ca640mr3482670a91.8.1761320682856;
        Fri, 24 Oct 2025 08:44:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHoydupJwYWbjfP4d6gKx6bLId6YhXa84WjCyAv6FuMrHrk33VGVoOGz0iiaQM3Gv/lfWoJJw==
X-Received: by 2002:a17:90b:3a46:b0:33b:b0f7:fdc3 with SMTP id 98e67ed59e1d1-33fd65ca640mr3482638a91.8.1761320682339;
        Fri, 24 Oct 2025 08:44:42 -0700 (PDT)
Received: from [10.204.104.20] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33faff37c14sm6200687a91.2.2025.10.24.08.44.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Oct 2025 08:44:42 -0700 (PDT)
Message-ID: <7cc6b184-e192-4d57-ba3a-82d4c7069fff@oss.qualcomm.com>
Date: Fri, 24 Oct 2025 21:14:38 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: Remove Jessica from drm-msm reviewers
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Clark <rob.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Rob Clark <robin.clark@oss.qualcomm.com>
References: <20251024-remove-jessica-v1-1-f1bb2dfc2e18@oss.qualcomm.com>
 <fe898b57-2b96-4f8a-8f27-58dca1c11ffa@linaro.org>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <fe898b57-2b96-4f8a-8f27-58dca1c11ffa@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIzMDEzMSBTYWx0ZWRfX3cMRDb1KxG9x
 tnUAGmZUBOWrf0INaW8fVH+9nYObi6ulqCO0rHwFojY0UrfN4T0FERCY1aGgvzLZBAN11+1ef9e
 pA8yuIdyLqUPm7Fs2hvtpnn9Me5XZnOu0ERM/hfkSgfibOWh1+ev1wlIwoYQx6QagE8HZW4dsvF
 taLTVfP/FdLFFtP0zV0oiKvKNSVNNh4EKzzXYQfog0eRFmmDO0qjt1vFiO/1uYKukRKNugeqDab
 fYfz63hsPKtB6QtEuG2+lbzLCjC8QhSg6idsGAfNLT9zSpoK6n336ZMgbg7LQAY22EhIWYmvjw/
 DLpcpULdoGGy0Dz5sBOHFRqjxMKj1x5Afb13J1OcXSzUS2yeVD1hOEoplj5pbVsPXX3KWIZB2Gp
 KoWcPAKhdg11ItgDFqcpmgJjNhsRPQ==
X-Proofpoint-GUID: hQJJjGy0fQbKRkJHFXVdpXQ5IICn8Chx
X-Authority-Analysis: v=2.4 cv=bL8b4f+Z c=1 sm=1 tr=0 ts=68fb9eeb cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=tVI0ZWmoAAAA:8 a=-IAwFrDFS_yr-AoREdYA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
 a=-BPWgnxRz2uhmvdm1NTO:22 a=HhbK4dLum7pmb74im6QT:22
X-Proofpoint-ORIG-GUID: hQJJjGy0fQbKRkJHFXVdpXQ5IICn8Chx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-24_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 spamscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510230131

On 10/24/2025 8:41 PM, Neil Armstrong wrote:
> Hi,
> 
> On 10/24/25 16:56, Akhil P Oommen wrote:
>> Jessica has left Qualcomm and her Qualcomm email address is bouncing.
>> So remove Jessica from the reviewer list of drm-msm display driver for
>> now.
>>
>> Cc: Rob Clark <robin.clark@oss.qualcomm.com>
>> Cc: Dmitry Baryshkov <lumag@kernel.org>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
>>   MAINTAINERS | 1 -
>>   1 file changed, 1 deletion(-)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 5889df9de210..064aecda38cf 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -7889,7 +7889,6 @@ DRM DRIVER for Qualcomm display hardware
>>   M:    Rob Clark <robin.clark@oss.qualcomm.com>
>>   M:    Dmitry Baryshkov <lumag@kernel.org>
>>   R:    Abhinav Kumar <abhinav.kumar@linux.dev>
>> -R:    Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> 
> The email has already been updated in drm-misc-next, but .mailmap change
> is needed now:
> https://lore.kernel.org/all/20251002-quit-qcom-
> v1-1-0898a63ffddd@oss.qualcomm.com/

Thanks. I didn't notice that. We can drop this patch.

-Akhil

> 
> Neil
> 
>>   R:    Sean Paul <sean@poorly.run>
>>   R:    Marijn Suijten <marijn.suijten@somainline.org>
>>   L:    linux-arm-msm@vger.kernel.org
>>
>> ---
>> base-commit: 6fab32bb6508abbb8b7b1c5498e44f0c32320ed5
>> change-id: 20251024-remove-jessica-1abd363a4647
>>
>> Best regards,
> 


