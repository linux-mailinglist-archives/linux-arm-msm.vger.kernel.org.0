Return-Path: <linux-arm-msm+bounces-82323-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F10CC69DB5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 15:14:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id BD32B2CDFA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 14:05:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1C57316914;
	Tue, 18 Nov 2025 14:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fokxcU5Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QlyIXdtq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 169E42C327D
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 14:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763474683; cv=none; b=EgHV+7haTQ4yCHc1JDbfoQVU498f3Zf+u0U1sLyHKLuUoGd5CYcdAOVLDDiupyBeyZk8fvnrnau50mGzXM7Gw2Ke+J0kfVbg47KNXj2ke1ICjCTlGuSRXdUV9x1k3u6efQ+dVk6IdBysfwR8HEsLwHfG7oybEnr42Ss2EDiY5kU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763474683; c=relaxed/simple;
	bh=Q7+haChMoxZVgNnjOOIgYZJvNkqMyhGzjP3c4d93zG0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V/BnS3prDwLdseJnnvQ0Kcq7P9fc3tmQLFCwfKJ1GrmtBAK4N2X4FNRY9Fz6+5eLVHG99qpK/6g6QRSOpegnlgagxYiZNzNgZvZ1qOwqbPnefjwP1bibQKn60bNmu6DPLQfWqw8bSl402/wtXoNjTZhILILnNSEfPreIGrgOaC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fokxcU5Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QlyIXdtq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AIAxdMv027662
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 14:04:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TuxJPUbB3G7x2UER5YSdBk+4SqSkYmbQVqXfwbZf/Qw=; b=fokxcU5QLMTlgo81
	UWlJNhS0Cl1Cx34+Bm6An7nZuW5od0dbI59sdgyutOzAQZRtHaVCPGcQhJOytzcy
	J4vAyq5nFg0oG/MMPpz9bkaw7mKruvV9EoWsceEw+igLOlNIzgTJGColyU2FFz2b
	V8B6AKT2Ldpkhg6Cfl8qiZma+xpxrjCGkFHGs0xJCHlG957eNBeafnakoLtEiRH8
	slQEd0FuiCDPhb0T8ZYE1UHbDQYQoi+d9Y17mtr31aTE+vr4aIDjbxE5sRht4sor
	159OiLwc2tyASNv8WHAi9bVWujJk9nTiVjYfeYpacKgJBrSORgafTEU7UKwSA7sS
	8SbnYg==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ag77t3a4g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 14:04:41 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-5dfb8e7d182so901958137.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 06:04:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763474680; x=1764079480; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TuxJPUbB3G7x2UER5YSdBk+4SqSkYmbQVqXfwbZf/Qw=;
        b=QlyIXdtqBaapA7VTyDyiuiUwrF5TbslwRusB4MCYLUJzVV3rAwO5rQfK5/3aIGmalr
         oUqlip5DrtqllzyADgoXuo829AdX9QwkI4qCRw8CsSqwVJRTu71HTjNzRcpc7MSnloc6
         Tf9wPzCBiiJvg6pp84YLBTpnJXpk16lpk3Bk9E5jk6n0E9iIx7AW2pHx/swLy9v/ZxRa
         vu4ZrQjXbtZRrTeH2RyJhFgizWna5pFPwbB0nocux2PcL/Wq7kLITckHVO1qhSwYNRxo
         fIPBiYtl9C7sAdw7BgknzYH7NgS5UX6WmXp6K4oHNltxHChKy79HoApNJmW/iIr1ZnNv
         SDgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763474680; x=1764079480;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TuxJPUbB3G7x2UER5YSdBk+4SqSkYmbQVqXfwbZf/Qw=;
        b=hmCytjjHB44EYAULQ6jQ8yMPUq2QKNF0hiiOIftyaoN2ST3nAodokkriWvCEcCNn52
         zaGMUrDNEK3J5fN2FHLOBFUG3QbYarkhB5kMDF03eMdVtOftLMjIRZtOqHPfxNtFZMy/
         +LDrFfiZ29AXBlU9q06SFUd+Qrkdaq5ifQgmzlANHRfBN/8n+z4IlV/RQymaWqQVqh7B
         A5mrbJfYJKO57G9qeZ35V7nLzpMeAEfNXhADBNm1Ri+GK3exkFDyTC+Mpacn3xaHTLQz
         eY5bh3xr+0XByBxY62tQshve5g2OUYOZmyH2HPaU5TmbiBVN9kGOl/wyuOPJaHjDY5I2
         WLjA==
X-Gm-Message-State: AOJu0YxX/FBbtMd/dm14F28tqjsgEq1gZnrkKqERRAlUTNIRcYDltolx
	6m1b2TDC6CFyTnFeAueYX7g+wBoAkMt8O4NMPUneNAQ7qEJify4d9fvK8IrdGsy1jG5tbj87+Wy
	yONWAWMejNdvp9Ukd5paTv60CTpI+Z22rb+O+A1Jb/gaNLS3gCwERpOF56JwiK0mQHTDK
X-Gm-Gg: ASbGnct6EOdWDG+DG9OsMWcFtFKkHLQMoGjZbeYWDuw8a3tceoZRrStKbF9StasO6GL
	PCnUlQwGZ0dnDEKnfHJEOav4CNeVpGEo4wEYn5qGb2AAr6SLti2xjbxg0YqA61bgE4Ko2MVHiRv
	u1AELHtUPg9IldqftN22YpFw1Uxx7tYkpmOvHvXmVt2kRzCEmSUjUUxDloxSIklTVFfXzDPsDHs
	xEKLzo3ODDSXQANZg1MrlMf7l106fZmcDINShyPq/ittr0eXVF75rQHnrYl2XWpE18U2c/aKP2/
	dOB3//iE6SBS1IAfgIoOI9xBk0b/GEMxyL/jl184wPEtHeN+OjIhuZoF6n+kE1eJSiFw5M5+Vic
	ONcpSs6+YgrPesrCCOm2YoSKhh+xFYGjBwKpGTmIA0rCQhjVJVNu5x53NBnZ2wYsLAEU=
X-Received: by 2002:a05:6102:951:b0:5df:aa69:be98 with SMTP id ada2fe7eead31-5e193d0ab7fmr372198137.6.1763474680205;
        Tue, 18 Nov 2025 06:04:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFQGzvXSwZpZPNLSEPbENMSSFvZW+jmFJY3wy2WWlOPnirPhPFmyrsfmOoFg1sPz5BYihtVzA==
X-Received: by 2002:a05:6102:951:b0:5df:aa69:be98 with SMTP id ada2fe7eead31-5e193d0ab7fmr372161137.6.1763474679521;
        Tue, 18 Nov 2025 06:04:39 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fd809ddsm1378104066b.48.2025.11.18.06.04.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 06:04:38 -0800 (PST)
Message-ID: <7bf64ac2-b793-4343-b6e4-41a88cd1295c@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 15:04:36 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/1] Bluetooth: btqca: Add WCN6855 firmware priority
 selection feature
To: Shuai Zhang <shuai.zhang@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org, cheng.jiang@oss.qualcomm.com,
        quic_chezhou@quicinc.com, wei.deng@oss.qualcomm.com
References: <20251117021645.712753-1-shuai.zhang@oss.qualcomm.com>
 <20251117021645.712753-2-shuai.zhang@oss.qualcomm.com>
 <76edfe9c-1302-4e63-8bcd-ee7dd55a128d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <76edfe9c-1302-4e63-8bcd-ee7dd55a128d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDExMyBTYWx0ZWRfX2vlFSto7y0/4
 ifeJC5Pe9dYUFdi+SjF1B4FOzxr6B4yqdVPyTLG5TWxEOCkR9XJO/HEK99vhHNYjPlXzOyqH1og
 yv66RP89dgt3xCWBEkAEpw7xsyRwDJlvdaf/nfrY86zuy6Shdg5Uuayp2Vx5AXrbfmhYc6t5/Ai
 a3Yjfum4xn8gKrH26up0vIS11xTsGikR7CaT5/6ye/xMJ9nKK+Ajs/Tpdbzdzt7w7nnxwpMjV9x
 dTiaZtBsot8cpRap8Ouaw7MRiSS1jJQyTc3Xap2GtWhFojkQHC9Vh6mYFpbBQoL0IgkyxCHHGXc
 vTrZ3dSy4hfzEP4t3+QgilFNnU62ew4f7E+9XtKETK1Ty5DtNSR+z4/0v/xTmZqrf4SETN3KSbL
 uI70W/P6bPyInJ+Ch94yQhIz2sabYg==
X-Authority-Analysis: v=2.4 cv=EPoLElZC c=1 sm=1 tr=0 ts=691c7cf9 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=55LQ_9fuPLE9N9XlFToA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mR9NimCdDvMA:10 a=crWF4MFLhNY0qMRaF8an:22 a=HhbK4dLum7pmb74im6QT:22
X-Proofpoint-ORIG-GUID: 1M_-SSic3vrgj1x-vDbLF4pIq6J6MpIE
X-Proofpoint-GUID: 1M_-SSic3vrgj1x-vDbLF4pIq6J6MpIE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-18_01,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 spamscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511180113

On 11/18/25 2:44 PM, Shuai Zhang wrote:
> Dear
> 
> On 11/17/2025 10:16 AM, Shuai Zhang wrote:
>> Historically, WCN685x and QCA2066 shared the same firmware files.
>> Now, changes are planned for the firmware that will make it incompatible
>> with QCA2066, so a new firmware name is required for WCN685x.
>>
>> Test Steps:
>>   - Boot device
>>   - Check the BTFW loading status via dmesg
>>
>> Sanity pass and Test Log:
>> QCA Downloading qca/wcnhpbftfw21.tlv
>> Direct firmware load for qca/wcnhpbftfw21.tlv failed with error -2
>> QCA Downloading qca/hpbftfw21.tlv
>>
>> Signed-off-by: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
>> ---

[...]

> Could you confirm if it has already been accepted?

Please familiarize yourself with the kernel development cycle. You sent this
patch yesterday, at a very late point in the kernel dev cycle (rc6, normally
rc7 or rc8 is last) when maintainers generally don't accept patches.

https://docs.kernel.org/process/2.Process.html

The branch your changes will land before being queued for torvalds merge
the following cycle is likely:

https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth-next.git/log/

which you can watch yourself, although normally maintainers respond with
an "applied, thanks" message

Please also trim your replies, you included a whole patch as context and
only added meaningful text at the very end. Please also don't top-post.
I see you're doing so as a mannerism, but it should generally be avoided.

Konrad

