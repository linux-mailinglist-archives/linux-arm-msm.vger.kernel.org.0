Return-Path: <linux-arm-msm+bounces-91165-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oCSOB6tHe2kdDQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91165-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 12:42:35 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8162AAFBCC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 12:42:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6F0B1300F175
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 11:42:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CF24387591;
	Thu, 29 Jan 2026 11:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d1pWEYYg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iNEQ06uE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BD43387583
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 11:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769686952; cv=none; b=uSydU0/tCmfuNvhvL94EmkTim3VHvjI5QsL5Kqxx7s+SaD/7u+UXSrsJhuDMnXWypa9l34QHz8wyrv8uYB1S5PmBt7nsEIfaRpuYZByrahuSDHyJNzA0Hp9gJmqyC7SFNVZLFHdzV+WRELq606Xfj7IUS6XuP4uwnfB641JG09g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769686952; c=relaxed/simple;
	bh=HMqTk7Tws8eXheDRY8AgZidLkId47RYldm3Bykauok4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DYJclln+cpTGZdp3Knb04KnPb0pQGhiNI7XVzuGXYvnUYQxgNg57s+O9uTpkWKtWZSefVBVQfqt39CVHvvfNyfeu0FqlnTfn0ZT/ENpry4QUg5JI1do9HmbKOFp7zHWSUoOZroykknk9KY2yEeX6Di08phJHn+xA1vl/eBLRF/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d1pWEYYg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iNEQ06uE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60T9vMYk2059987
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 11:42:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GeSXX6wKleWl5Z7X6sxwKQnp6NH3hoPLooOb4T1lgR0=; b=d1pWEYYgCn8oTbhQ
	E4ozxwgmCvpemSFT9m3IxF106HvMXweUNYE9YaB5qKVhoTbY4aEpWzuQbGn8s0CI
	k7tYra5AXijldS6xF1R94rgW5hGr3WTD/Am0WcJ92vozrlgHMMrgd/5/RmmzXI07
	P19VY7rPK1dPOAaEM+j8L07s5uReVgygwFTjAFcRLC0HjFyjhcfyMYG6FqML2ucx
	ZIjDJoMcxd6pp3k9ojtu/zaROnKJ1aqg7Wp42HpBy4wDUWpSczKeqSlw5xwUBc0Q
	PFAzjwPa6SDGniGWcfevxarAWkFOtRbGHrHZBc6kzx3SUEJsT/l3312j8n7h8+gz
	mBVZnA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bypgrk89e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 11:42:30 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c6b48c08deso30109185a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 03:42:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769686949; x=1770291749; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GeSXX6wKleWl5Z7X6sxwKQnp6NH3hoPLooOb4T1lgR0=;
        b=iNEQ06uEfOEx3Tk4KQE9pdIuHICPkxGexxC277bKd6KiAKLbrX7N1Q1/aRZQv/eK8H
         jfAzUPLCadgaoNiebW1kCTll1EuGj3SJ1aS5Vl7j7HqPQ5v+eDfVfuKHsSQtRsx3Wz+F
         Ayloy2hhsBFy3wypl6a9ZP9TI0b/VLWH6wXl2qGa9r0cexsdXp8LeOuEveMg5jWMeHzU
         1lM1pwnLNJGFSF0kSLuHHSta+otar8hU53FqAH1hee3ZyWCyj3QTe66B/zmHQ3sqif4j
         6oAoKEGyH2tNIlXHSobfopL6Zu7CcCE+mDNHa33Zj8sxTe2zqA55PhXRxyrGWVEHiEaD
         AN1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769686949; x=1770291749;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GeSXX6wKleWl5Z7X6sxwKQnp6NH3hoPLooOb4T1lgR0=;
        b=p2P/xL9eh2SML5CdTf/Bh/LgUXDIojBDaR7azj0X4bHQ9WBys+jxedyAz+bCw/1646
         2Ohjq98hhXPXQV7DHiKQy8Vvg8Z775XIm6pRtCT1cJlFcZulJwSQ2GvLn/nalw81OqcQ
         ZJJKXIjCjxEk79BzE5dO0pu8G+CsXltT+nFJbN0pP7QI/QNSRz1mPWtOpTyn3/g56ruU
         RE3MmrbaTHlWNlZS6lqDTqlN8cCW/80DZIHa/3PXVsABKph7GrjacN9mz60lo4x+O+mQ
         8FrUAK9Eg01r6Otjgu21WvuPd2f3kjKA077luN3qgEQ3sP59rYh7lFs787i5/1lga1v8
         Uv6w==
X-Forwarded-Encrypted: i=1; AJvYcCVJK8z5O1beUBt27XxmLljDiKiiW9KoL70ho2XWm2b2veUM6LcTvRRWLqCHknGzoYJ/GDm6e3l6BcjiwQ0N@vger.kernel.org
X-Gm-Message-State: AOJu0YzZ2XInemHH2hUCkpRKRB6RCFp/QMK75FnpkkrDrAXbRBFHHv9C
	sQp1KcXuB0t/C157LHqj4XdCsdJc8yaFptRMDxO/tsqU9QZ/5EMQoDFqQtnhp+dYz+ihff7xxkQ
	olHqMR14RwbacNrq38L4oGenONcWsaFEcvqM2DheUYHWQAkCqTetxBYiHV+UI+ZQ9x00K
X-Gm-Gg: AZuq6aJmjUOx4KmYcDUiW+gsqgtep1fU34queIKNhUZHtlrxRh43ivbAvwtVrCxqNH5
	eh3mbo+1lF3B4A7LpkvDU2GQLHRvvirVu7JnFrMbxv28Dv70Ssyqs1maVSUtMW59BxqHS3eLvZc
	0CVq7DLu4i6MTdlFr0lwN4umuBnzRx17Zs7EzhFH1d7UdXG6poGzeTxYxHHXaNC32mXaGwNmowY
	lqaENaYChwd3NmPiyzLDoPU+OTJtohyRoi8evL+zsep7GOEcAfvEH4KTsQw0piQV2ho55CXQRri
	ByC/IPgQ088gvQzRt5UksOLwXvWGRduStC4yNli0gyhyi5utg/wtxUo0oBsp8A3U1nOa3GvpeT5
	2OYF5AZ7b1AbRDalLxBytNIFQ2KZPjepvOtJTv4dLY+r0twfrbxiE18CZuM4ZM8ByOnY=
X-Received: by 2002:a05:620a:31a5:b0:8c5:3892:a554 with SMTP id af79cd13be357-8c71ad00279mr318782185a.3.1769686949287;
        Thu, 29 Jan 2026 03:42:29 -0800 (PST)
X-Received: by 2002:a05:620a:31a5:b0:8c5:3892:a554 with SMTP id af79cd13be357-8c71ad00279mr318780585a.3.1769686948838;
        Thu, 29 Jan 2026 03:42:28 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8de8c93c11sm59859666b.28.2026.01.29.03.42.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jan 2026 03:42:28 -0800 (PST)
Message-ID: <d9fc3b0c-7fe7-4845-b55d-ce6d0053f48d@oss.qualcomm.com>
Date: Thu, 29 Jan 2026 12:42:25 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] spi: geni-qcom: Improve target mode allocation by
 using proper allocation functions
To: Praveen Talari <praveen.talari@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
        bjorn.andersson@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com
Cc: prasad.sodagudi@oss.qualcomm.com, mukesh.savaliya@oss.qualcomm.com,
        quic_vtanuku@quicinc.com, aniket.randive@oss.qualcomm.com,
        chandana.chiluveru@oss.qualcomm.com, jyothi.seerapu@oss.qualcomm.com
References: <20260122151008.2149252-1-praveen.talari@oss.qualcomm.com>
 <20260122151008.2149252-2-praveen.talari@oss.qualcomm.com>
 <847290c3-d5aa-45cf-a75b-ff119b608433@oss.qualcomm.com>
 <bece7d32-5f62-4ed8-8dd1-0de9102648cb@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <bece7d32-5f62-4ed8-8dd1-0de9102648cb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=d7T4CBjE c=1 sm=1 tr=0 ts=697b47a6 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=BLqC3yjj2PmRytsJ8UcA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: B2WsYVbwPwSf18R-wrGMly80CGNcgtzo
X-Proofpoint-ORIG-GUID: B2WsYVbwPwSf18R-wrGMly80CGNcgtzo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDA3OCBTYWx0ZWRfXz5pEL0+mIzsi
 jedq078/BZmtDgp2FVVtrVUR3y6pf48lP6AkoXMftcsDW/XNUWcUad5Te0dHRngAOpbZDkTnvBJ
 ZlraDp39mGyPRAY4Lzp7oFGRCbKgGHt53OdxhlE8Zu/7Hj5zq/f4AOhej4SX1hrFHN9M9IO5ZVh
 Z7VzdeGhMceZIoUO221WUIGS8qpeir2Ggjhw6GvPoMciIpuaWwlgih/XESDAwT+8FzBVSMO18xn
 2ttJQ42XbeF6y7P32lAEJkGI520zJ95f3ggNUOI2+RRuieKKem0IdEoxOSLV/yXD532o/oUdfC9
 qbn7hisHVLm/xsatYXGDl8CYz0KIFezmXmrOwk9/rtpqYYs2nRC+n63agIjFrqEvVw3Zc9OfVil
 YFGXK7Tz3yEiN8aSeEzoiRuKJQ525XWD3XB0a2koZjlZ7npffI2kI3VSqr/mP+EnMaqpZgo9pYF
 XU9xUByiTw9Jz7eWljw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_02,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 adultscore=0
 malwarescore=0 impostorscore=0 bulkscore=0 spamscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601290078
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-91165-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8162AAFBCC
X-Rspamd-Action: no action

On 1/28/26 5:32 PM, Praveen Talari wrote:
> Hi Konrad
> 
> On 1/27/2026 6:45 PM, Konrad Dybcio wrote:
>> On 1/22/26 4:10 PM, Praveen Talari wrote:
>>> The current implementation always allocates a host controller and sets the
>>> target flag later when the "spi-slave" device tree property is present.
>>> This approach is suboptimal as it doesn't utilize the dedicated allocation
>>> functions designed for target mode.
>>>
>>> Use devm_spi_alloc_target() when "spi-slave" device tree property is
>>> present, otherwise use devm_spi_alloc_host(). This replaces the previous
>>> approach of always allocating a host controller and setting target flag
>>> later.
>>>
>>> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
>>> ---
>>>   drivers/spi/spi-geni-qcom.c | 15 ++++++++-------
>>>   1 file changed, 8 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
>>> index 0e5fd9df1a8f..f5d05025b196 100644
>>> --- a/drivers/spi/spi-geni-qcom.c
>>> +++ b/drivers/spi/spi-geni-qcom.c
>>> @@ -1017,6 +1017,14 @@ static int spi_geni_probe(struct platform_device *pdev)
>>>       struct clk *clk;
>>>       struct device *dev = &pdev->dev;
>>>   +    if (device_property_read_bool(dev, "spi-slave"))
>>> +        spi = devm_spi_alloc_target(dev, sizeof(*mas));
>>> +    else
>>> +        spi = devm_spi_alloc_host(dev, sizeof(*mas));
>>> +
>>> +    if (!spi)
>>> +        return -ENOMEM;
>>> +
>>>       irq = platform_get_irq(pdev, 0);
>>>       if (irq < 0)
>>>           return irq;
>>> @@ -1033,10 +1041,6 @@ static int spi_geni_probe(struct platform_device *pdev)
>>>       if (IS_ERR(clk))
>>>           return PTR_ERR(clk);
>>>   -    spi = devm_spi_alloc_host(dev, sizeof(*mas));
>>> -    if (!spi)
>>> -        return -ENOMEM;
>>
>> Is there a reason you're moving this code to the top of the function?
> 
> When CONFIG_SPI_SLAVE is disabled, the call returns NULL; therefore, I placed this check at the start of the probe() function.
> 
> ref:
> static inline struct spi_controller *devm_spi_alloc_target(struct device *dev, unsigned int size)
> {
>     if (!IS_ENABLED(CONFIG_SPI_SLAVE))
>         return NULL;
> 
>     return __devm_spi_alloc_controller(dev, size, true);
> }

That doesn't really matter since spi is not accessed beforehand
and it'd return a NULL if it failed to allocate either way

I'm not sure this is a concern nowadays with fw_devlink and
friends, but today the allocation happens after we get a clock
reference, which could throw an eprobe_defer, which I think would
cause the memory to be de-allocated again, wasting cycles

Konrad

