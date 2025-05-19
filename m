Return-Path: <linux-arm-msm+bounces-58426-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A91ABBB93
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 12:58:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3632217C14A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 10:58:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4F0F201266;
	Mon, 19 May 2025 10:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nqPlFKgD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25898194098
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 10:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747652323; cv=none; b=X775cyhwkwwabO0HIAH1NvkpcECubXqLpnQ2G4ZxteeAcod0bEbjlPki8Pi0yiB6pXe2QKxNfAn/fa8i2oxMMmSx/YPjPBMIr+jyeZh4rO+u0MjWO6LOMwcI//Rd4YzYks2f9Ql0wZRVz0RJO4sPpOZlG4CCuL/6jha2Rjjrljo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747652323; c=relaxed/simple;
	bh=dt18pC1pgXdhX+AIm2Nrs967cIN/phk15KUSiKaaRqY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kE93QX4tUSVq39jdrtfWpQ+7+1A5rwaIC6iA/bPDTkda3l8ofUyZ2UuFAF101GceDNCUQQLlGCRYKcmA+Y2rW/zeoC8Ny+ACaL328n/VQvV+WyMJXkKDedE2V/Xn2NafLwp58oL36PXNBrEJlR9YIGQt0tQTR+j1UnmSUn+mr9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nqPlFKgD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J7GcMN023185
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 10:58:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ezwPMR8BMohMqjYrOQ8JruSRo2RSohjLEs2OJOIJnhw=; b=nqPlFKgDtcJTNdC2
	1oP9aMoBx6nrqnnJuWQmxp9B/vOaolIc+Y3A+WYU3zrGgijg7O9nkhSNFpIELShO
	rxdId+AzFZNx3mLnOpaf10IUFwocrgMhJxRzLgR0369oRH40eFekjitj26vqTKNn
	xaUCM9AOwRPNjO+JxEV5hWzbhasn/1x4TehHUSOdyPrRQfq+vV98NtLR8umWg0Vi
	01Jio9f9Xm341DOyopowtH4P85xG8AAXv4gX4dyYwIcpiaJupIzDj779bPoFMvSp
	chKwifU1Wa8wHIBtSlZnKdBOChD7kHB/maCTALbzBYUbky4IfNJoWpcb2cwSZqFt
	JbO1Wg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46r041rn35-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 10:58:41 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-231d7a20b31so28819465ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 03:58:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747652319; x=1748257119;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ezwPMR8BMohMqjYrOQ8JruSRo2RSohjLEs2OJOIJnhw=;
        b=IBLRciNhDQCf4qRipuZL8oN6NJQXqlYRTUnliSCDLP/qeqFL7EhCf96AQdOkWV8lEY
         Si245YzV70mfXglIWr2a7J+vY5WaByDaNog/IG/5X97SISHUp9k4+S0GDFQmh6e9qsB+
         9faaotQPPl+HXgR9YuPRSIkSyF7gMzF/XqxbqISYNHIJ6Zb0rUyksRdc1qe3a0Q+RkKs
         5YYQqDmw6OowJPelFtJYdeaWh5GnLd0OxPKIdBAILyajLhw+aBZdV6Da91lApVR8HPF5
         4sLNelic89fO/7b0GjLFdpV17ihIaDDjP0MiLhO3kYz5Fnueqilrp7QHaHUpzWHktY87
         v+ug==
X-Forwarded-Encrypted: i=1; AJvYcCUW0Nmoth8TBuAtB+lGb3RsF97jQMfy3ZrxGTw3loSuMao4GGR6WhVq+K9GxMXDz507C4JrlgSm25oHbfIx@vger.kernel.org
X-Gm-Message-State: AOJu0YxBr7AjUGTJBlLhoBikhZR1qMkADA01gtryMFdZvayPyAoKjxl8
	bmoYjpBwYUJWxty1QHVu7QmOXrPBliJOEkjAmsZnBMunVdHENfsul8TusL9xFtobxgxWUeyahce
	k1jgqoMCDS8iM/w9HEZf7LoN0lKX8vsDXlNiWV+Z80CDZsKAbjfpJxbBPqoeMxR4lGWlt
X-Gm-Gg: ASbGncunEqZSCcnH+hZuHGppzbDjupPV3n6RGEpS3cTIPnczFfIYI67gl25pTIc9Zc7
	Vdtza4CjZUp/wzVJlhq44emQfKhU7+PRs4ceyoYbizFvvWgxo/YWhbcCUUNyrZ2tP1fqjEhlWKk
	If9h3uBlQvtC4sAVy3pZGVCOiGSxGEZIWgLjlZkkrnUbOwbdfuxrs62rZVZz9DqHDYQw2vccjOg
	AvWwf2i+bU4DLUv29oV4aYZHMkaYmv7rrMIaL18dIkhAh8oVqA6E+SMNV0snXU4WXlM3iclmvo4
	8bmq/H9sEDvJHyJfvGaBhrocMYXlc0s8IJai9A==
X-Received: by 2002:a17:903:17cc:b0:22e:5389:67fb with SMTP id d9443c01a7336-231d43d9bedmr164170395ad.7.1747652319372;
        Mon, 19 May 2025 03:58:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF3EdjbB0W7Ag5YgVP4lwZ+LArL30OC7oyQH+NM/5K3jhYFi8kBt1aEKqOsDIaJb60GH8INTQ==
X-Received: by 2002:a17:903:17cc:b0:22e:5389:67fb with SMTP id d9443c01a7336-231d43d9bedmr164170195ad.7.1747652319028;
        Mon, 19 May 2025 03:58:39 -0700 (PDT)
Received: from [10.204.65.175] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4e97db8sm57252635ad.110.2025.05.19.03.58.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 May 2025 03:58:38 -0700 (PDT)
Message-ID: <dc67df54-2a19-4318-acd4-b96b8549b64d@oss.qualcomm.com>
Date: Mon, 19 May 2025 16:28:34 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 5/5] misc: fastrpc: Add missing unmapping
 user-requested remote heap
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: srinivas.kandagatla@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de, stable@kernel.org
References: <20250513042825.2147985-1-ekansh.gupta@oss.qualcomm.com>
 <20250513042825.2147985-6-ekansh.gupta@oss.qualcomm.com>
 <22uccyp5m2szry7bpitqcav5nlvwch5eqh4mdacfedidgrnyhx@vsjobngwdkmb>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <22uccyp5m2szry7bpitqcav5nlvwch5eqh4mdacfedidgrnyhx@vsjobngwdkmb>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDEwMyBTYWx0ZWRfX9ybRZqjyMgdI
 WUpg4FKArli/kxmd9a8A9QeKbHGp7u+NhqiHBYTfcGVDcM5VculgJle3cguk8ySW2GLmbehPC/0
 GfdRVDBD6UceSQJCh+To7HT0Q8GUWiJBvz6YO1TrWF+H5+Pxe9L1KHEjd9kf38SyaUeimzt3UBD
 lMciolmA6gar5kkxVB+mfOnwObbdMyb7r5j8S+WdWKEzocJbnFfvmArHv+XXu4Pilb91XwvqdnK
 R/JV6RjP/IVNhPukmkdwVZ+SmF3S0F9gl41jfS6YZTT9imYg7lUsuLTL25t5JG8jsb2BrJxi8hQ
 sC5FQpCT8cHNWyo93kINQyRq0ABH1iTmRVLWmH1+FmBE7u0oa9Nnn6ufD2nK1lza4CZc/RWpehL
 izVt8x2DfD88mdT4NACOAdqnGfOaBhSJCMdK6ub145I17Nma+oDyr5mG/SPHJl+pn8jhGMxw
X-Proofpoint-ORIG-GUID: xkgFiacetfAQmeFZ6zWtZfLcvYXCPv_P
X-Proofpoint-GUID: xkgFiacetfAQmeFZ6zWtZfLcvYXCPv_P
X-Authority-Analysis: v=2.4 cv=HIjDFptv c=1 sm=1 tr=0 ts=682b0ee1 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=zJRMy9OeSTis9rFUpe8A:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 mlxscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505190103



On 5/19/2025 4:22 PM, Dmitry Baryshkov wrote:
> On Tue, May 13, 2025 at 09:58:25AM +0530, Ekansh Gupta wrote:
>> User request for remote heap allocation is supported using ioctl
>> interface but support for unmap is missing. This could result in
>> memory leak issues. Add unmap user request support for remote heap.
> Can this memory be in use by the remote proc?
Remote heap allocation request is only intended for audioPD. Other PDs
running on DSP are not intended to use this request.
>
>> Fixes: 532ad70c6d449 ("misc: fastrpc: Add mmap request assigning for static PD pool")
>> Cc: stable@kernel.org
>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>> ---
>>  drivers/misc/fastrpc.c | 62 ++++++++++++++++++++++++++++++++++--------
>>  1 file changed, 51 insertions(+), 11 deletions(-)
>>


