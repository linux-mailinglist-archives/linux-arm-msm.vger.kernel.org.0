Return-Path: <linux-arm-msm+bounces-58593-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D47ABCE27
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 06:12:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2DAD2189B160
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 04:12:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A13B425A34B;
	Tue, 20 May 2025 04:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lywcwxId"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52385259C98
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 04:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747714337; cv=none; b=Ok2kXfh2QWqyNCh73GsNHVsXdQfvGdAJmxF6yMYxmR1ctbHKcs837JrcFLekFp25dxOsM+gUt+ccc2prjvDeoYsq0/iUsNQ1ypP8f/S6lrvBg8GcxkqWh7+mHJXejOPK0Ub/zxenLO1Y9M5hUsaskQFzYi7KTMr0XgjD1sO4sLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747714337; c=relaxed/simple;
	bh=AA5z1Iv12EICjBiN6kqrFqLyeWGwCCQ1jyhoLxGEHpU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VmsOKL5kWln+2+O3DuqA0hetIs+298KmSL5sHeRjCi/I5RQkjtkbLvfT9xeC8wCUlakC3Jt3kdoytmQlP4KKffHmsw3RyM/lQQ4uRAGcIq7hnCt54o+d5Oq7TZ6JIRZeY5B7h3icbIvnCJ+l/Pq7Kj7L9h6ESKRbr05rxIJSZbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lywcwxId; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54JJOLhQ012060
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 04:12:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K3tXKNyZNuZQgUCz+o2yPQ/bI2CEVtZtYjF3TqmtdC4=; b=lywcwxId5OmbcrEh
	/CJqR1sA26WgjKj0WAtXnpSsrQwYfBonv/giChvR+jIHajB/VGcR68mBjrdLQ0NM
	cl2NxTMuRbWyqyqm12gPwb+FY0++nlu4jcsU/NwMZw/pimxeUo92OhrlfRiynK/M
	++t0uan5lGrEB+fyfI6D3Mk1cgBdbo8ata8BQa67CDleiLbiZ7G+QmJSr/cCc3DG
	5yztyiOXyaZTQEMa2vT6fSSvr2EfwOwcUPfZpjtd/Tq6N6vgfbTAi9V5KEjSdF+P
	uhYAOSlAJxKKA0pVNfoWgcMFBkOF50LdHMMeotam+IePGjH1Y5LZRwf+0+z6VXtC
	onRlsQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pkr9xeq4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 04:12:14 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b26e38174e5so4987999a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 21:12:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747714333; x=1748319133;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K3tXKNyZNuZQgUCz+o2yPQ/bI2CEVtZtYjF3TqmtdC4=;
        b=ZS2r1F2WVLXsKH7QTD+bta7OXU6YE71GoY95sPAI/skJNjzMo9eEOtaNWb3OyWABUk
         pP5PTGoRKdsAeGAn8707KPvHOyBJooZWQsp4WC0BCjPxsYiE2BCJayITGNZEeBqCfalf
         R7/dQzLYgjAsZJCQVdbZVbuv6EE1YAYn1sNtEe771w6LSdfPeUD6d+lWPv87BM3l0MsK
         s6LfT20dsidbMIj/ATY0YlnQ68lCzP1FfHbY8fP8o5KLjvWliwu4t9S6JWzSAreaGWgd
         CCFbUfs4qSZo3xlpNBPI/9/iIbNLDlTLzOO67jGQPxbjWup+6cSuwaA9jFilsINZ48JF
         aOFw==
X-Forwarded-Encrypted: i=1; AJvYcCWMessEpN9lQTcTnoHcRBOBSgRfbQAZBY0T49x9/bQ0B+dBKUvKWfNuVrfL4hjWRISZCoL98FXq/lfCFVI5@vger.kernel.org
X-Gm-Message-State: AOJu0Yyvv6NuO2s0yqIIE1gh+RC9lNyqAQlOf8ntBIVvHtOMsXecpAaX
	ljeeKDWOdM78a8UXgpvIN1YexOS0cFPHKt81RL+KXcBGjHDsFI8yMHBOuKoUp73SD9HTYEii3+d
	PqjsR/0KqVMl9ezo+DmSn3fxuwArFKJow/G1/C88+5xcYWukrXHS/G5fT6xq1usU/ReZ+
X-Gm-Gg: ASbGncvVOtuLCn2sFx74U6jfTyPkz7ZvYBLL/75XUAIIpp+LcK2zLktIkQEkDRr88cd
	FOOkqQDGfWYUPFDchC9ezsctUnteicdNFyyLGVSptArBr9WtRiTtzUVmr7VWqCngkGJGVHJpXnG
	0e7TT1FK1BaQ+co3tAkFiDzqlTX0g2GKEbcpdfP6wOSPxdzY0PQotdSpkGxV81Oi3o0BiBbwsZJ
	eoRGuqHR0qh03IhEPZUZ8Az3OFJe0OQ1HrfIgYCxswCJezsFZqx/CFStNVIXCuNmUubeyz7uAHL
	QUa/FfDLZyEkYig66N7krYuDJ5FFYRXy7MC15y9Z6w==
X-Received: by 2002:a05:6300:218b:b0:216:1ea0:a51a with SMTP id adf61e73a8af0-216219fffedmr22921465637.38.1747714333306;
        Mon, 19 May 2025 21:12:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IECTNHl0XI2RQjqcne0zYA1ZVA00vadeEtwniXUnY/EXFpPQMXaSNaBx2qH/VBg0UrtXPfDsQ==
X-Received: by 2002:a05:6300:218b:b0:216:1ea0:a51a with SMTP id adf61e73a8af0-216219fffedmr22921423637.38.1747714332879;
        Mon, 19 May 2025 21:12:12 -0700 (PDT)
Received: from [10.92.214.105] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eb082c66sm7092530a12.60.2025.05.19.21.12.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 May 2025 21:12:12 -0700 (PDT)
Message-ID: <b3d818f5-942c-1761-221d-af7d7e8f3624@oss.qualcomm.com>
Date: Tue, 20 May 2025 09:42:05 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3 04/11] PCI/ASPM: Clear aspm_disable as part of
 __pci_enable_link_state()
Content-Language: en-US
To: =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Jingoo Han <jingoohan1@gmail.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>,
        Rob Herring <robh@kernel.org>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-pci@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>, linux-arm-msm@vger.kernel.org,
        mhi@lists.linux.dev, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org, qiang.yu@oss.qualcomm.com,
        quic_vbadigan@quicinc.com, quic_vpernami@quicinc.com,
        quic_mrana@quicinc.com, Jeff Johnson <jeff.johnson@oss.qualcomm.com>
References: <20250519-mhi_bw_up-v3-0-3acd4a17bbb5@oss.qualcomm.com>
 <20250519-mhi_bw_up-v3-4-3acd4a17bbb5@oss.qualcomm.com>
 <649c2bb2-d9a3-66ce-8bc5-2735195aaa5e@linux.intel.com>
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <649c2bb2-d9a3-66ce-8bc5-2735195aaa5e@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 8ANgdT7YIxKauZBweC-LJzy428cHHTn7
X-Proofpoint-ORIG-GUID: 8ANgdT7YIxKauZBweC-LJzy428cHHTn7
X-Authority-Analysis: v=2.4 cv=DdAXqutW c=1 sm=1 tr=0 ts=682c011e cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=cbGetAF2pF-RjulI4vsA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDAzMiBTYWx0ZWRfX11R8ekapA2JD
 8iMllr9od1yMoPy28zpqYOAx3R5JInTUC9VMZKg2xme0bCxUAXkGUdCbSnPrptTJHXgMUt8N2sl
 2ePesq9GW9VTDQMH3Zrb3ZrM8HinO/u7lLoN6b5DNIkSXF7WDVneBlo6QZhv3fq+/WsKq9xpFCZ
 /9i7kTF5Z11IeK6PEKajK3uGuyRw424zJi/dVHDTYKHq57IYT4AgYC13AIxa4XC24/Nrsya8qu4
 9CVA8fB88pLPqHT+ZNNX90NroBpRpDbRZmTDDYad4lWyvXSAl3Qh96EEzDc5CPLEtxJ5RxEGOi+
 /JAmUkO0+3WcYMA7bamQIFv1U02ZBvit5ZoZBjhtBPyY4oxr5umViIzUalq1VSuxUBpJffP4Nx4
 349fUQgQ85c0GlEkRnV2YxArxKfgmLrgdfT7DzRvseHAFRJ4kQsEQS8A3XbK+wXrooxq391U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_02,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 clxscore=1015 phishscore=0 adultscore=0 mlxscore=0
 spamscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505200032



On 5/19/2025 6:51 PM, Ilpo Järvinen wrote:
> On Mon, 19 May 2025, Krishna Chaitanya Chundru wrote:
> 
>> If a driver wants to enable ASPM back after disabling ASPM for some
>> usecase, it is not being enabled properly because of the aspm_disable
>> flag is not getting cleared. This flag is being properly when aspm
>> is controlled by sysfs.
> 
> This sentence has broken grammar/is missing something?
> 
> aspm -> ASPM
> 
>>
>> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>> ---
>>   drivers/pci/pcie/aspm.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/pci/pcie/aspm.c b/drivers/pci/pcie/aspm.c
>> index 94324fc0d3e650cd3ca2c0bb8c1895ca7e647b9d..0f858ef86111b43328bc7db01e6493ce67178458 100644
>> --- a/drivers/pci/pcie/aspm.c
>> +++ b/drivers/pci/pcie/aspm.c
>> @@ -1453,6 +1453,7 @@ static int __pci_enable_link_state(struct pci_dev *pdev, int state, bool locked)
>>   		down_read(&pci_bus_sem);
>>   	mutex_lock(&aspm_lock);
>>   	link->aspm_default = pci_calc_aspm_enable_mask(state);
>> +	link->aspm_disable &= ~state;
>>   	pcie_config_aspm_link(link, policy_to_aspm_state(link));
>>   
>>   	link->clkpm_default = (state & PCIE_LINK_STATE_CLKPM) ? 1 : 0;
> 
> I disagree with this change.
> 
> The problem currently with ASPM driver is that pci_disable_link_state()
> and pci_enable_link_state() are not symmetric pairs despite their
> misleading names. pci_enable_link_state() should be renamed to
> pci_set_default_link_state() and if the symmetric pair is needed for
> pci_disable_link_state(), it would have to be added separately.
> 
I just want to know what are disadvantages/side effects having this
change here, we can use same API to be symmetric with 
pci_disable_link_state(). The drivers which are using this API has
already option to specific the ASPM states which they want to enable and 
they don't need to call pci_disable_link_state() to specify the states
they want to disable.

- Krishna Chaitanya.
> I've some (rotting) patches which try to do that, in case you want to try
> to solve this inconsistency in the ASPM driver (I can send them to you)?
> 

