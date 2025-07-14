Return-Path: <linux-arm-msm+bounces-64877-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D665B048D0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 22:47:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C185517D69C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 20:47:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AAA7224228;
	Mon, 14 Jul 2025 20:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QCqaR3go"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFD76341AA
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 20:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752526055; cv=none; b=IzPSDvabUoOKbUAGEpCDV7MHYXUItOF8a7ZYV1kIhjX5nHDMz9Atz0MHje1NUnPFFbfOb4yPINKAf6pJM+VKBac/uIMqb7glOkDvu4Zp8V17LBBg/CjdqQbGzyuyZ/tbhbdA5nqol0wHo7fhf3dKOyuKuJKPblaLPAsYSOJyeVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752526055; c=relaxed/simple;
	bh=BGb2iBka8bIFERmezVZ2AmArgnDd6RKKxILjH1YWDSI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uolOrWH6jSA7ysbcgxfRpkMy3OrJuqJSxRa8pG2MJTgtJccaCoq5XzZHAofA7Ceg+jap7QextE0BvPPxzTpEy0F/KSEwvZjJ8gBRCGc2eop0sYjAK86TNr9SwNJ2qNjsdsGIsTlM/K6OuhsjS0klKWnFEW3mepWTilxZol1L618=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QCqaR3go; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56EGJsTk015971
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 20:47:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+6szoN01qMvtkgP/ZIMTwafHhBz2p79aT5gKKnIkfmQ=; b=QCqaR3goC9uClZUN
	Sb5eRIzhmsupAAJFCFty6dx6hBZ4YqpIZfsEaFJqM8+0ry1182YC4irqZb6HZ508
	Vnqp+HnzmKE05YHDPb8HoJWs8yvBuEZJnG4II2mL47ZPUvwHutyWFXFZ+DXKWj5Q
	akZm25lAydQUDkMPyiyHPCvqwQIRCjSgGvBSYmkQNQLI56lIi+peZcDmYCslzCBo
	/Rl3jhM5MfQT6yMfHJpFqphCUnAcNy673QE4bMVocznxFnB+WRIH17GVk8w1FwXl
	8NaE45EuYVwrQoBHubjWmlFCA61W5g9gToXYNaKlpSmEDJui55kbkk26kwed2lJn
	xnealQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufxawwhe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 20:47:32 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-74b537e8d05so4068616b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 13:47:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752526051; x=1753130851;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+6szoN01qMvtkgP/ZIMTwafHhBz2p79aT5gKKnIkfmQ=;
        b=CnvFZ55Vm/DrK6wI5/TMpDzq1RjSlncX9m0R7Q6IQrxTsEfOiBMd4CjSAzqqN2j1HQ
         8vL6r+X8dUi+LKKkb6e+WryZEHr+qRdd9IpXn+/YkcuWpTUxNu74J0SO/7ybH9YaG7qr
         PukJHRcHCWyslz6AweiUO1y4QRZsqUkrLCphoxZ1gvxLye2spl97L48cjG01VmPP5HB4
         dEALRJNgrrBPEfw1EN4AaKh5pBa/5waPTXgsjOpzwB1EVwaYAcLoiNnTqd0cVCMkFJS0
         oC+qNODWHSAm+i6f+WTISrpyg7XdSjnhUMwMYjWMHNP8W3sQWLrub8rrepoxZoQ5HjZB
         AMTQ==
X-Forwarded-Encrypted: i=1; AJvYcCVrIF+Y19nGeZA/zSqLcwSLDu0EuFuIuDP9pGTf5tnZ62uAi+UI6dG5tYGhWWQjlA/Lze5Z8SSON6AsKzbB@vger.kernel.org
X-Gm-Message-State: AOJu0YythDqECLPqA4NdUbOO6KmYA7my5thzs/36BQkaq7U4FGZeBhZo
	rNkOjhMsiFMgvaFRAqArV82jYi7aaPHahhYh7IbP7jfmyZ35YwsPV0T7H4EVYmxUWiHKHG7Fpkj
	PRkFG06FW2gJ953T+Apu6Tz9syDTIZW/eovPpncriee3Sia+v3k7KBMjfjiRl4L9y9vTO2rntjX
	Dy
X-Gm-Gg: ASbGncsSkfIZiqsGVP9AYOf0sw0eU2L3IDJxZj8OgoPv9QHT/4QalM59UQaI2VLVRzf
	9utqgwaLmjg7obWH2iC3uf4ciL13k/T29X21xMJF/I8c96dZT+2JK+5gsvhx2KurfrmNlg26oS9
	O2WYmg6qo8iDLdJ/sE66I86pwXslWy0QmyC7TO4DixTOt+zlAWb03n0V0lM44UM5yGfwQr52gJU
	yiq/1oBCPRycxGj+eedrowQxmVsR1nRYq2eq8RhigioW5URgZe3hFooUch21vqEPoii55UIoA4Y
	Hd7p3ZmWaYmfvhdp11ANxWvbbSzcfTW1Jl8DJO4JI2MdCvgcP5/dn2K0MCC/Tyns/ES7NT6p5bM
	pEYNTCgq4/RksZsdvheuPDw==
X-Received: by 2002:a05:6a00:1821:b0:748:ef04:99d with SMTP id d2e1a72fcca58-755b41ab6f6mr437042b3a.14.1752526051355;
        Mon, 14 Jul 2025 13:47:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGh+Xikax20uVvqGMWirr1Ngeo4M3PY5vi4JIlcDBOfp3FjPa5Y+BJ4IdduqjZYXlTEboQ1uQ==
X-Received: by 2002:a05:6a00:1821:b0:748:ef04:99d with SMTP id d2e1a72fcca58-755b41ab6f6mr436999b3a.14.1752526050905;
        Mon, 14 Jul 2025 13:47:30 -0700 (PDT)
Received: from [10.134.71.99] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9f1a841sm10684116b3a.86.2025.07.14.13.47.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Jul 2025 13:47:30 -0700 (PDT)
Message-ID: <b6b51282-7ab0-4cbc-a12d-86f35bcd6ffe@oss.qualcomm.com>
Date: Mon, 14 Jul 2025 13:47:29 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/19] drm/msm/dp: replace ST_DISPLAY_OFF with power_on in
 msm_dp_hpd_unplug_handle()
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Dmitry Baryshkov
 <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <quic_yongmou@quicinc.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20250711-hpd-refactor-v1-0-33cbac823f34@oss.qualcomm.com>
 <20250711-hpd-refactor-v1-4-33cbac823f34@oss.qualcomm.com>
 <rmlgjr3fzb7dmnwmthf5bj67wb6fkcksmn3ouchzsvhhgxiv7h@vwcieejcufr7>
Content-Language: en-US
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
In-Reply-To: <rmlgjr3fzb7dmnwmthf5bj67wb6fkcksmn3ouchzsvhhgxiv7h@vwcieejcufr7>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: isiVVUGjS4uOKNfv1CiKJhpqE5gs2KVL
X-Proofpoint-ORIG-GUID: isiVVUGjS4uOKNfv1CiKJhpqE5gs2KVL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDEzOSBTYWx0ZWRfXwOgHOrjd5IlX
 C40mfU9dTYqAPpFfacVhJURk0eqcaRc1PKGlpvG7lWendwizqdnSfd2Zk2/2vcuoqdCsrsZl1Q2
 noWTzemcP500v2aWEh7/NGzXjdw6dG9DpGZx7p98zACqIhUwTpiurdoQpzT9s67SsenHqn+3yQe
 dr45aHxGkeuIGwA2pwG5L8Wl+Azkak7EYJdPkeKPwq4JRyd4W2afjOGAd2kEk470LQy49l69G5i
 H751CVFM6K2SatjE2xW+HXarUHMinfu6B2gcNaLRVmK+4VQGhPPPRo5dVTNfb/TyuurfaYJdM3e
 OwevNyAIYC/M/R0i0M9+TnLPKzfkTv1kZi5X9+ACWVVRdQ1/J3jUaHx0ZVUYQqZTPqp5TBXX2Di
 ZotP/3+8ihXpLZr+NjPSgkgbUmHFZDMBGz6767sQRCVy/YvLZpymGFB59a/OAUn5JTLEsvd1
X-Authority-Analysis: v=2.4 cv=Xc2JzJ55 c=1 sm=1 tr=0 ts=68756ce4 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=e5mUnYsNAAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=a_MUTpskHjF2EEzg2GEA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22 a=Vxmtnl_E_bksehYqCbjh:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_02,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0 priorityscore=1501 adultscore=0 mlxlogscore=674
 phishscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507140139



On 7/14/2025 5:27 AM, Dmitry Baryshkov wrote:
> On Fri, Jul 11, 2025 at 05:58:09PM -0700, Jessica Zhang wrote:
>> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>
>> msm_dp_hpd_unplug_handle() checks if the display was already disabled and
>> if so does not transition to ST_DISCONNECT_PENDING state and goes directly
>> to ST_DISCONNECTED. The same result can be achieved with the !power_on
>> check.
>>
>> Replace ST_DISPLAY_OFF with !power_on to achieve the same outcome.
>>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
>> ---
>> Note: Taken from https://patchwork.freedesktop.org/series/142010/
>> ---
>>   drivers/gpu/drm/msm/dp/dp_display.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> Please squash all state-related patches into a single one. It would make
> it easier to review and more logical.

Hi Dmitry,

Ack -- I'd separated them to keep the patches small, but I can squash 
patches 4-16 into 1 patch if that makes it easier for you.

Thanks,

Jessica Zhang

> 


