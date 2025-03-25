Return-Path: <linux-arm-msm+bounces-52443-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A964CA6F3A9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Mar 2025 12:29:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B11283ADCD8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Mar 2025 11:29:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2E4F254B09;
	Tue, 25 Mar 2025 11:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hswChsry"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B999254866
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Mar 2025 11:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742902184; cv=none; b=AFZ18SLoOLhlW1r/6VpRMb5ihz0ThiGAls8RNbPsgG3SyhRRxOAbU7QeGLYy1hBAe3likzcnj6VKC0u7RroS/hPCuyyuAvsx/46YZ78EcBaHfMH8GF8sqBC8oVxEO0PH1yPK2e2/beBbUgyjI8YrhBmesGAnYX7jf/J29/N5Svo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742902184; c=relaxed/simple;
	bh=jzaTLKgPXg/1h8OKaR7eOqQXP1uAjIG0fBFTIjt9+D4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t+Eqnk4ag3Cybio/nnNprM/Lj+vo1MumTfYPtojrc0b40liFBzC7ZIk6BvkxI82qrXRmtctUYSNAdZ5xk7NCCA/y1Y6J0/weKKrZTSCup6gaT9aLHNkOWeiGj75AxZ3vvMKRBVGixZKqdqapm49GtbZn1LfH1EZGCi7n+xL6AHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hswChsry; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52P5vaWt018766
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Mar 2025 11:29:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wVFxJzi8/lwuxxcRq8n+KCJaooAZuyuxIjSQGw+9Oc8=; b=hswChsry8l4kA4Lq
	ayFgqOyo5APynvZBR3PyUbfgJvFa4bbif0xZ1dHWQ4iGN2wwFipjDmc0vXUZW2ij
	fNntv0F2fchrkoG3Anp5lHa2f0O/L+x3RP5SZeXqEgMJjovtXpf8EIdw97yLqVuX
	6y9OBiYVhXKOzgHsr+cCei34YE8UXBXu56VZB3/ry998/gE0LF9auDpuXfmghDl/
	r9g8A2bqwTK7ZPJO+xKI6MHNv2EBesE5IIDLjqTAyA8JG5M4G1kxVEbCHVavFj3r
	z6gi8Ovg8m0UQ0yl3enw7wQdptaXzzjsbtDOmB4lp/Qf+6P5eJTRIiv3WHetTMok
	+/Ne2Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45hjjnquxt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Mar 2025 11:29:41 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5af539464so189696785a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Mar 2025 04:29:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742902180; x=1743506980;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wVFxJzi8/lwuxxcRq8n+KCJaooAZuyuxIjSQGw+9Oc8=;
        b=csrgTAK59IjBmJC6xcsQ91V9Kk0nHbY+nqijUBx5eFVBLtafVkSA57Tr+kt9ZiI2Ji
         C2HrfWo+C3/V1rDZ44JNB4ld7MiegeS7Q/m37ZN90soUhJHoQDnYLsabKgOa7BkKjdqb
         HvMX+ojh7kLcN2B4IVm7pQhKyvP4+rOZlFwF9rvIvknl6hF53m7ep1FZ0BZl9Vh3hznW
         SG0bLv6caGAJQHPia4xiVL6MGVpjyqRxkRikYLgjS6A17Jfl2Z4w2nmoIQzJh8h3qoG7
         0yTh8/ClPMIerhBZDXBB9jDGpR+hVS9YZwrwDq/URjHUKul8BZOmMdEAcoGOAu6pPogW
         zeSA==
X-Forwarded-Encrypted: i=1; AJvYcCUukZ6VrnNlN/VGw5WyvQxVXmMxpEYEZ7QRc5STP2ofxIE7gdeiS91Oh+7WjEwM3JlFGOLff4fweN30A87Q@vger.kernel.org
X-Gm-Message-State: AOJu0YxDCEYleU8pDgL94RFCN5Py/skgc0BWwOFa0MQWaMzdZzq/Z8Rc
	0FKNwe5OUPV9JS51mV6aNn2lsHIEXKpeTmABC5z6tRQEgDJQLPADzOrefBA6jKANq9BnJOUtRqy
	kDem6FLKqb1mgi/IO7xcUbCQ/0mhzt7ddkICypp2b4RcJi2MTQ0QlHYGM4kcQ+mXE79GUxffD
X-Gm-Gg: ASbGncvfmU5VWzEX4WH3wc8VgRlkwZjXPY1iAgqkDMDj2vx8/+6JF7JxRZW53cjMI/6
	WF//TI3iBNKMdktUBTH8WDynQP5fzg6Tp9JoX22DjFt8a7kvhcKi7t7SA7GerxeXOLa7VhtfCWt
	sfz0ImH8kAbje5G1qZMkejYD+iH4HD5CQ/LmZs7LJlaD+L52QyBMQ/tV61jNXll4B0ur68j1Uwn
	++h8dYwHtvvJW9sTqP6miun+3wOnSm9Niwlw471mHh1Hc0Rk5+Oz+lcTLW/tBoVMku0znst6Rrm
	h9VrSiSJZqhudgZMpzHaFePFPHo2As/dx8sP/ivsACMFIbyXjSKpGEbN2TceLLM704oXHQ==
X-Received: by 2002:a05:622a:28d:b0:475:6af:9fc4 with SMTP id d75a77b69052e-477513d8167mr14908541cf.12.1742902180495;
        Tue, 25 Mar 2025 04:29:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEMmiF13ilq7yTbZW1TEyvgNhMVeaBnQRt6C3sGaNzXAK3mTk/weoMaltViWpUtxtDzSTL1hw==
X-Received: by 2002:a05:622a:28d:b0:475:6af:9fc4 with SMTP id d75a77b69052e-477513d8167mr14908311cf.12.1742902179977;
        Tue, 25 Mar 2025 04:29:39 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ebcd0c76c4sm7549423a12.56.2025.03.25.04.29.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Mar 2025 04:29:39 -0700 (PDT)
Message-ID: <7d74ef63-83fc-4c19-a247-d779cdd4e482@oss.qualcomm.com>
Date: Tue, 25 Mar 2025 12:29:37 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: qcom: pmic_glink_altmode: fix spurious DP hotplug
 events
To: Johan Hovold <johan@kernel.org>
Cc: Johan Hovold <johan+linaro@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Clayton Craft <clayton@craftyguy.net>
References: <20250324132448.6134-1-johan+linaro@kernel.org>
 <7f161a25-f134-44cd-a619-8f7b806a869d@oss.qualcomm.com>
 <Z-Jr7MifpkR8cL5B@hovoldconsulting.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <Z-Jr7MifpkR8cL5B@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=fNc53Yae c=1 sm=1 tr=0 ts=67e293a5 cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=u3giuUM6ARgIoqdfjbwA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: Y4VTL0-60yqkDf5bQrjPnBKZ3u6eyCLl
X-Proofpoint-GUID: Y4VTL0-60yqkDf5bQrjPnBKZ3u6eyCLl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-25_04,2025-03-25_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 mlxlogscore=999 priorityscore=1501 mlxscore=0
 adultscore=0 spamscore=0 bulkscore=0 suspectscore=0 phishscore=0
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503250080

On 3/25/25 9:40 AM, Johan Hovold wrote:
> On Mon, Mar 24, 2025 at 08:21:10PM +0100, Konrad Dybcio wrote:
>> On 3/24/25 2:24 PM, Johan Hovold wrote:
>>> The PMIC GLINK driver is currently generating DisplayPort hotplug
>>> notifications whenever something is connected to (or disconnected from)
>>> a port regardless of the type of notification sent by the firmware.
>>
>> Yikes!
>>
>> Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> That said, I'm hoping there isn't any sort of "port is full of water,
>> emergency" messages that we should treat as "unplug" though..
> 
> Seems a bit far fetched, but I guess only you guys inside Qualcomm can
> try to figure that out.

I tried looking around, but couldn't find anything like that

> An alternative could be to cache the hpd_state regardless of the svid
> and only forward changes. But perhaps the hpd_state bit is only valid
> for DP notifications.

The current state of your patch seems to be a good approach, I think.

Konrad

