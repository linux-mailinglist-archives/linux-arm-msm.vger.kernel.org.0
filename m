Return-Path: <linux-arm-msm+bounces-75666-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E27BBAFE6F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Oct 2025 11:43:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4767C194192D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Oct 2025 09:43:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDC602D9ED5;
	Wed,  1 Oct 2025 09:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I+n5OKMU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 675192857C2
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Oct 2025 09:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759311772; cv=none; b=AOjtEv/P1FPwosEGg4RSzHW4+1DRu7KfSiL3TRSDVrCcHKZq1Khki2MAGyMmKwDT3/1/D5cZPN455H0tvyZzahm+tARSdwnzcgowNBIBZWe1Xu4Qq9LP1Zk7qKpXrzNgUni1vei2NqOo6oZ1AH6OrtqrfogDU5dR8IRwlrPT5HU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759311772; c=relaxed/simple;
	bh=VsR2+PVDtYE3652lA3AwZ1sGcmyKJ3prqssc5PDRjC4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QbKbmdUmEG/Efda+tnHLDxk0dBBeJQojF3MFw/COKBjQ3xzN/PpZzUECwjXtppwtL5a2VmSrPPMOyVmUT3U/Jee1JH60jTvGB/wtUPWr4fl/wEC2LpKSE6opZnW6OIuoAlIZMmdQafqwEOCgxagoWPDrvylDHnRbjmI3Xl7QvNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I+n5OKMU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5917Kdci020531
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Oct 2025 09:42:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DrFdWv2iBXIeKGrs8bhA1iCXbL7rFu1+yvVc7NJeApA=; b=I+n5OKMUkidLe5KE
	FKY41O6FT+NOSTD3fVg7zfK9P0z/Oy7XDmVMCH/z8HlggB3VRH/pX14CgqI2C/Au
	eKCk9BSIimln+2Ru6iyNhiF/LuwE5369SbbAYW5GOZkZ8yJi8/z/ui6vn+xCxAu4
	+j1UNEo0kGlz6mn6VfNAYxTfGZ8tSZ5dltVVXOP1crz8uxQsrCwMgBW8nJ4gZveD
	JPZG+as3j++DJYL7FumuTOc3DA+Z3AA+319vfnwwA++FUwLItE4dsvYUGd3H++vA
	+gXtTwbzxMDAPw03FVhGVWuNWHDXuZjlORgH53XetkQ7oqNDeSKiLlpMUfJTvyk/
	hV1/Lw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49gyu18b3j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Oct 2025 09:42:50 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8649a8dbff8so114182385a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Oct 2025 02:42:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759311769; x=1759916569;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DrFdWv2iBXIeKGrs8bhA1iCXbL7rFu1+yvVc7NJeApA=;
        b=d2zk5BY+vTO81bYZC1yCjjQFLZJKD4tX0j/7MhaCSaFR7aOYmvD/8PjXuWoucQHI/Y
         w3rpNZaOnT23IyKh3ZXXorrEaUdXQJyiELL8F6O1g9pWsduquSVsYQW+9eV8C802UQha
         qEdZoSUvCPz+XtN2NL7bzjSwHzpO59q78bbZvhB7hMzr1xjCCxIQd1D02Sz7xVGwUOa1
         Y7+cpwKYXyT3emRzPFEwycgtnfYxnT/BR4D+H/yXUuVkIWD7ZRmxd2xhk2rWeZk5th+H
         8wWTt6OqLAcIl0MEmKsNAdXSmG9EtIiBPH1ZXEsNxArEbdYF6jr17w20XmwfY4tCkujn
         LGQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXPXREZmoYkM74Wy5oUvZHKmeXhpE0bvD/rLH3TAPrrVTTdkWV2zb9v3ZZqqogAjw9azNTlYlr5XxD60L+X@vger.kernel.org
X-Gm-Message-State: AOJu0YwkSozngH6KV4psaSafqByqY2HC8R1buQNQ+LI4vI6Zd6VOtxw4
	HFgAZ4xVlgK7ocyVblwpR+JKJn2bePgfffl8ONncU8vqcHQ3XW9rmSnLcNGn9nVOVuUtS7GyjM4
	cJSL5oO+hmC5VX32pw60DczEu2G/uJgXhirE02YlHULQR1ufd6FANl0tM435Ta9Hao/THJvhYe+
	NZ
X-Gm-Gg: ASbGncu98kb59/rfp+L4nyfaQL5peRKB6tTxSwYNCAhDiuQwiGJNYW4Zdp7L2WvvopT
	pgfb/I+i3iKjj1X/uGs2PMrX4nztKZPnrr44NaZLMJ5QpWEygbrHXMrXNXlY7xs9L6rN9jdPZBu
	+Zbym2or7d2cql1jF2+2IkgUijEzDcTKv+ig0Mxn/D7fmts5FMfj2B3Wsmm5TnirBzT8H3vgDNr
	+g5FfadqqxEKrpAM5k0MCihS44bsxjITQGQMXdrN3yeRaNUplH69NsDlrRAvjX3wy02rIpwrlH4
	hvzhGVb1eVl1CYwj9I4qOT56zQ4DyxLtxtrD6Cm53W9i9ccJa9pEuEdxLwW2w/o0LrUypRa+7dN
	P6gSvVF/UfPuBr8NBiAOpbFHRhlE=
X-Received: by 2002:a05:620a:d8e:b0:829:9017:82b6 with SMTP id af79cd13be357-87375760480mr275829685a.8.1759311769129;
        Wed, 01 Oct 2025 02:42:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFSVWdZDNLhL7AkKEv+Ngs2uzjXJ5e/rNt3228AfvQUdNC5wR/kdISKu4lF1ZjtYbb//8x8wQ==
X-Received: by 2002:a05:620a:d8e:b0:829:9017:82b6 with SMTP id af79cd13be357-87375760480mr275829085a.8.1759311768591;
        Wed, 01 Oct 2025 02:42:48 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b3e89655b09sm628793366b.77.2025.10.01.02.42.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Oct 2025 02:42:48 -0700 (PDT)
Message-ID: <a31ac6fd-929f-4001-8199-1b8730ccbadd@oss.qualcomm.com>
Date: Wed, 1 Oct 2025 11:42:46 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] usb: typec: ucsi_glink: Increase buffer size to
 support UCSI v2
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
Cc: heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
        lumag@kernel.org, neil.armstrong@linaro.org, johan+linaro@kernel.org,
        quic_bjorande@quicinc.com, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20250924232631.644234-1-anjelique.melendez@oss.qualcomm.com>
 <20250924232631.644234-3-anjelique.melendez@oss.qualcomm.com>
 <t3hfr33t76ckecatro5gheycb2phnch57m6zzdpm44ibykbubd@e6nffasyetib>
 <4cbcf312-7697-4725-8fd8-45f2b5b0584f@oss.qualcomm.com>
 <6kbkkiwsp3hzu2u6uezelwufooeeh7efrcc2buydpbziuhr5px@xdp24rhfjqyf>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <6kbkkiwsp3hzu2u6uezelwufooeeh7efrcc2buydpbziuhr5px@xdp24rhfjqyf>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RfGdyltv c=1 sm=1 tr=0 ts=68dcf79a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=K0chv5zXbCjWf1o7A30A:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: V_6DYRn0OULiBs5MmRHHb8CBjcB5uvSP
X-Proofpoint-GUID: V_6DYRn0OULiBs5MmRHHb8CBjcB5uvSP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDAxMDA1OCBTYWx0ZWRfX0YvXKqwUFJYB
 vDH/DzUixM7cs6myjsVpDvLPu0hbzOFWUKe02Ki2NSsbiL8+jlDeHqVLYl+qrozYzo//7SJlzSa
 Bb9OC1MADiUuyPa3FchpcwXYRdrODJ9bnSdIHNag1yexsdejp33DsZdmfBy3aDaAaMULbU3ZhMx
 IsjJLLgnlLvgujLrDey3H2nZw+JD7El+7aCRp5lHtJzjJ5ff+dbuLyVr6jcmyqKf09mzJntPACG
 04kDc9U+bY5UKaSS9rJbGHGpLgSA7IFd/KTgkedAaudDp84RValBnSDcZUVTnuhHvAFouNKZjIM
 ARdmdcYuz9JqOEChPk0qyNZhMI+1bC+Y4Jsk372plN0kRnQ7PiwhXVdgZJvivAacqFaxUaSReJn
 fw29f8AGkvHmfn+47c5UYNkYLGO2vg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-01_02,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2510010058

On 9/27/25 12:07 AM, Dmitry Baryshkov wrote:
> On Fri, Sep 26, 2025 at 11:19:13AM -0700, Anjelique Melendez wrote:
>>
>>
>> On 9/25/2025 2:43 PM, Dmitry Baryshkov wrote:
>>> On Wed, Sep 24, 2025 at 04:26:31PM -0700, Anjelique Melendez wrote:
>>>> UCSI v2 specification has increased the MSG_IN and MSG_OUT size from
>>>> 16 bytes to 256 bytes each for the message exchange between OPM and PPM
>>>> This makes the total buffer size increase from 48 bytes to 528 bytes.
>>>> Update the buffer size to support this increase.
>>>>
>>>> Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
>>>> ---

[...]

>>> I'd prefer it to be more explicit. Define an union of v1 and v2, fill
>>> common parts and version-specific parts separately.
>> Konrad also left a similar comment in this function "This code keeps the
>> 'reserved' field zeored out for v1, but it does so in a fragile and implicit
>> way :/" (https://lore.kernel.org/all/df671650-a5af-4453-a11d-e8e2a32bd1ab@oss.qualcomm.com/#t)
>>
>> So I figured I would try to get thoughts from the both of you :)
>>
>> We could have a union defined like so:
>> struct __packed ucsi_write_buf_req_msg {
>> 	struct pmic_glink_hdr   hdr;
>> 	union {
>> 		u8 v2_buf[UCSI_BUF_V2_SIZE];
>> 		u8 v1_buf[UCSI_BUF_V1_SIZE];
>> 	} buf;
>> 	u32                     reserved;
>> };
> 
> LGTM.

+1

Konrad

