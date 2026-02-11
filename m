Return-Path: <linux-arm-msm+bounces-92597-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eGt7Iw9ZjGm9lQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92597-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 11:25:19 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2399D1234B1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 11:25:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D27723024A7E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 10:25:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 782CA367F5D;
	Wed, 11 Feb 2026 10:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZGY0kZ6h";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FKbbIUnP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED210126BF1
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Feb 2026 10:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770805509; cv=none; b=Wz/FqgwRvJYqTPLXLhJwI+LZtnIhw1RSiJZJ/1AvMAvlC91yD5axij/fmGrzJNeQ37thYN6O+6zKFEO8i1g6H+8IKOjip2GYf+vlQpJbNBpHX18s/hrkHWBm8eBcFB4XIBnidF0xCNHYxkisCmLRO8vUk+Fou01qqrHsjx2dq+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770805509; c=relaxed/simple;
	bh=Cl8ck0GuYNDR48oIXUJNz/BULGIgVDYNWMtl2wLzWKY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=elV5T6bVPD5oVX2YQJIuAKfWyDIs198UArOnQDw1AQCCY9bBQXNZmmWsPOuFBW2MVsythnkEPfVmt7f8YrwW4jimut4W0+vNQBizagDTZTr9sYi3HDMLSzkletD7bfVZ/aYBWI09h5IhJLuqRz5Fz03IHyuR/VxAiFcQRTcfqjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZGY0kZ6h; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FKbbIUnP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61B3cROW837936
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Feb 2026 10:25:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d/+bh2HNeeTdt5zusNux5prvurN0Yp81hH0VAMMHLrE=; b=ZGY0kZ6hAeLy9bLL
	i/OTmeS5JZkxDjGrH03rq/Ny7F5hqGP9H6QRR2ev6+BiEs6xr0YJTy4FC5hd9qMw
	dnFBreBAqT7bRJA5wNs0FVjCDwi8dStKQ/lbQn1AkWTjktITU3WLvhC8acuc6DeB
	Q/10QprokpGSreAvfP0RgqMZSPR+myA6ND2QfHKnWlnvtJvTgY1nh+WheQkIQtpt
	AaKqMcSacyYzuWFQxZS7BN2UlWU9/BEhZKGodnOu/2w7fFLsVb+bPnoJkzAgF8wK
	mEjWLCYSCpf//XwXlERKcJtyL63NYXH5qIWK+IadIHZ4pL3UByIL229SzztViD2w
	5IDk4g==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c8j1t969t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Feb 2026 10:25:06 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-824a0ea2025so158251b3a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Feb 2026 02:25:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770805505; x=1771410305; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d/+bh2HNeeTdt5zusNux5prvurN0Yp81hH0VAMMHLrE=;
        b=FKbbIUnPaJ8E88+CcGII9xmpPo96ZXDy6pGFx/PVLGpVAMEhQm2KIJk4PclVRuoA80
         6F8M+m092K2b/lZ9Hu/IPR6qaJ0+L1I8wh6fF+3WfOiMGz+sCB25dMFu2YnxfATgPbSa
         +AiSfTbl6sV8mlj/fIyGP4dcxoopi7E13BHmvWWGwZTKXAVr7wDG2oHFVu1JEnj9ghCZ
         Q5XGMJ48oqelp6R39vcC7J9uzdWNt28J73TJHsTUtr9yxaUyXg5VuptuS7DKbIOulKEt
         W8qR+CLTCpRQn9loJIx6U6kJbRa9cMRJCE/wRrLf/ehtF7FuQ6r3xx+4HcCamKaNEURZ
         TfBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770805505; x=1771410305;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d/+bh2HNeeTdt5zusNux5prvurN0Yp81hH0VAMMHLrE=;
        b=Uw/HvNfq9lJmbUmWW38uO1N8SBqMo9et7CJcpZHTa3ygXWz/yhuFcdmJie5FaVR0AC
         +NE3RUDm+MDd7EnsDVD+kEMswTjKa3XRo1FkmjUcSvyKVOI7tStkj7MTQphU5HgrBKeL
         xAxU/kO6RpVBKQODTquKyeCT0lGoSsS4jQuiWplwXqGnArLghtyjxuO7Y0d7tWYA9R1p
         DgVRxD+LI+spKCcGERpiANovAfyLxPNcoUM3ehVkVlhAe+D6sQe6HSWlWopotP4k7GvR
         SwMNkmpj3dbXnzhUe+wR/tbUXVBzgEkT1J62HTeZdyJSqJkuOT4e/FRd/FS7LOIhv9Bv
         C60A==
X-Forwarded-Encrypted: i=1; AJvYcCW8wv1jZSCu9W6YdO7ih7RBlEJfxJ5Zrb2rrnLj0YCybG/1Q5c7vhevYEO++l4Bql2oX07id+6BsHLqnwlU@vger.kernel.org
X-Gm-Message-State: AOJu0YwtzdGEj5FffEIKxhtvhrEj6fMCP+xOK6upPMdXndlM8SrVB3hl
	5zRX4Fu9OffVEU79Wp5hQDSHglcKw05lLqySRBZq2aJqm+H46yCsUgehF6jchALOYY1mHcl8OXb
	B5JOFoVHWzlJgDH9QPU/MODIliwXoY2fSp1aFt/ffU98k43ZN9AvG66wqznbmfjv8DsX/
X-Gm-Gg: AZuq6aIEBmLD86eKeL9T4Em6Bt5HVeF3Qhqmz6bzWCaZm+7uXdIV/oCrhMGE4NjymS9
	dO43AbviX+SeRyE/1r7R7Xdkdnd7VO7R7yVOhVUrB1hf8ggRzkXSSIp7j32tCaUWJ1NcBHNk79l
	1krwbM/hgogEtAdenqzPO8lS/NPSp9fyV2AoK2VXJtxWHjjbL0EVeJReD89aic5BXN8t3cCvVnh
	m7cZxUFHb2YwnLN1wXJNindNineIHpTN4X/KU8ThbbPz/UVk3vnd1UxBdQ9I3VN4a5Rp1XciON/
	cqt4he/9kejH8gRnLUGwELAfor1/6ACI0TeP0R8nbYhsF834EqcgntL6JkQjy3we3uBsXEQcaut
	xiZsjOqghW3uyHvocngKbpP2W290KfhL/QUzfh0nSXX80ezn9x4rwpH4P2w==
X-Received: by 2002:a05:6a00:3407:b0:81f:40e5:34b6 with SMTP id d2e1a72fcca58-8249aea26e9mr1918583b3a.15.1770805505545;
        Wed, 11 Feb 2026 02:25:05 -0800 (PST)
X-Received: by 2002:a05:6a00:3407:b0:81f:40e5:34b6 with SMTP id d2e1a72fcca58-8249aea26e9mr1918573b3a.15.1770805505110;
        Wed, 11 Feb 2026 02:25:05 -0800 (PST)
Received: from [10.217.218.153] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8249e81976dsm1990933b3a.52.2026.02.11.02.25.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Feb 2026 02:25:04 -0800 (PST)
Message-ID: <d24a947d-6b6e-4393-b0b6-1e9281f8a0cb@oss.qualcomm.com>
Date: Wed, 11 Feb 2026 15:54:59 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/2] net: mhi: Enable Ethernet interface support
To: Paolo Abeni <pabeni@redhat.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org,
        Vivek Pernamitta <vpernami@qti.qualcomm.com>
References: <20260205-eth_vdev_next-20260204_eth-v7-0-f85645210f81@qti.qualcomm.com>
 <20260205-eth_vdev_next-20260204_eth-v7-1-f85645210f81@qti.qualcomm.com>
 <59e7518f-65b2-4d97-ab81-bf64af758d00@redhat.com>
Content-Language: en-US
From: vivek pernamitta <vivek.pernamitta@oss.qualcomm.com>
In-Reply-To: <59e7518f-65b2-4d97-ab81-bf64af758d00@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjExMDA4NCBTYWx0ZWRfX5vOFUAVa43bo
 fJRfqEb1pC/5Eopdy+ePrYNCDtohOIPDAno37EwxaEC3h46b6TjJ0r9rSgmIFrrg2VSeNFL65RN
 ZGJs6SBSYaYMybVJOrcNuhlIcxZT/xmlQ8M+qx6ZdPH0bM4Tq2Seq5JXtLjHjY1bh0f/Ww+0B9F
 S6OsXv8zmGRofcoWgo+IAkPMObB5cQZHIESqEfK3T8xYYanJz183iWkaRPSvSts7VIDhB1OlAoL
 MJh5rfAqUqpkMXy4ee/dKdNDfL/+Pd5rN5g47UGt1bb4KjKMp+ouNhgjUcZSmlWqkCzGsO9ywFY
 8I0cA4rszHI1yZRLev/LyJkOIt4d0BkB42LbHyyVjoh4JLnE08NA1t91b7PS0weUJLqKtav9XZE
 xDQo3oi/bjqKjA96SOvC7jF2pfBEeLOOYE+5U1NazddDMOdTlY26QWn192td683AT5WhEPJ6LG5
 lPmcxUiBWb/e6CRLe5A==
X-Proofpoint-ORIG-GUID: RG1LrCa5zMrct9vLIvOcy_G4JyTnMoqu
X-Authority-Analysis: v=2.4 cv=cabfb3DM c=1 sm=1 tr=0 ts=698c5902 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=KKAkSRfTAAAA:8 a=yHe4pzvUYGwmH7u3AtQA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: RG1LrCa5zMrct9vLIvOcy_G4JyTnMoqu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-10_03,2026-02-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602110084
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92597-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vivek.pernamitta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2399D1234B1
X-Rspamd-Action: no action



On 2/10/2026 4:13 PM, Paolo Abeni wrote:
> On 2/5/26 11:34 AM, Vivek Pernamitta wrote:
>> @@ -4,6 +4,7 @@
>>    * Copyright (C) 2020 Linaro Ltd <loic.poulain@linaro.org>
>>    */
>>   
>> +#include <linux/etherdevice.h>
>>   #include <linux/if_arp.h>
>>   #include <linux/mhi.h>
>>   #include <linux/mod_devicetable.h>
>> @@ -38,10 +39,12 @@ struct mhi_net_dev {
>>   	u32 rx_queue_sz;
>>   	int msg_enable;
>>   	unsigned int mru;
>> +	bool ethernet_if;
> 
> This is not needed, instead you could check !!dev->header_ops
> 
> /P
> 

As this driver supports only Ethernet and IP net interface types.
Will remove the ethernet_if member from the mhi_net_dev structure
and use net_device->header_ops for interface-type checks

