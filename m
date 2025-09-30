Return-Path: <linux-arm-msm+bounces-75532-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81451BAB635
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Sep 2025 06:40:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B7A007A5B74
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Sep 2025 04:39:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44363248F7F;
	Tue, 30 Sep 2025 04:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NJhhCOqZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87200222560
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 04:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759207242; cv=none; b=gnQgODnhYJ/KikEtiVtHJVSSJKqBJdUX1gKMU7pFIENurD5ZCn5Z0VX6aKLlqsCL+yNotVZgGSwymywRqDcD1UGFGyrPxqi9bKQrdtDPk2v1zlwByPiU0u/fd0XtN50eLAoAV4H3xEESqWyR/3qarVgNyz0FG4YVMR3GNrXk68g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759207242; c=relaxed/simple;
	bh=PpVmMYSb+/tXTMGNCXlspmC9JlcWSE+EmOiw9BxPBco=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YOmk1lPxRsn7Di1IYFzOjx+ctjvi+Nls3RtRi78rYt5Gnnvz5tT86PNLJr7Cj5/xWyeg4KrGPHB7iFJWYYTMUwmRy54diAcjjledrVkfHXe2TxEnFxSwxPQPd2udqpsUGoqcQyxKNpjZn22Eeu0+Gm3M5H/vSVu0QoENFthJk8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NJhhCOqZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58U4HjIo009556
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 04:40:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9otk/yGXgsUm0pXvg0F1/ZcIsa5wQIuaLE+2nOJ/oEw=; b=NJhhCOqZw8CRTxSA
	5ZJvcIEy8RSG5o4+4tRgPUI+Db6XpniPWM0DmJ5mv2cWDSduU4Do9/LQbo8pX3NV
	doJhS9/pVq+BH1cy7xNCiAgOpLze9Aquk1mTNuPvyazcYjQGlY7kk1MQ4WtHROP0
	1xkwlAnKIxsIuOLtn6/HhF11Bj8KhgcbdvFwDTljjc2wXp0CA8lXP9U7+6YQGnOj
	JVJ/569zFvQm1YtIeLiJxLl8An8OCHskF1JfrQUhB255au6HhPArm5VK9GofHTdg
	YhGq027steHn5jCQz/n5zqAgVuERLOD1f52o64LE6WUSaYm2gAoy2NERh9JrQzpc
	gG0NnA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e977qdb8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 04:40:39 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-268149e1c28so50807885ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Sep 2025 21:40:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759207238; x=1759812038;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9otk/yGXgsUm0pXvg0F1/ZcIsa5wQIuaLE+2nOJ/oEw=;
        b=BRRr5CYeiJBXSrdCP9pQfqDhhTSRMgDSZf0HnLQzXd3iIQkO4LF4hXSn89elU4xjwY
         G05281fYCbsppGr0AK5NEK4bwTmhY0ykowzeqnfwF4W8tsp232onOYDZZXddyGsEn1ZH
         FnumkGILpIpPmXOBHJmiCVuZX9BH/hQL44JRAF9OHdQKHSi04ZVOne0KNiyB+kEV6wo4
         xvjlmgwTnNu7SNIXp/9294wX1Jy002BSLdo9rBbVUPsCJX2vBfckw/G2aP7qtB+Tqng1
         tTzJ3N3bETZGbUAERYYQHns+dBGHU6Dy2HStXnWtBj55fZmZeJFdyOO4fCm7N5i6jWTw
         Vp0g==
X-Forwarded-Encrypted: i=1; AJvYcCUn/LMFJlFZPp/PyD/OCIkfejdnKiz5pkn3ndlemRK4ybFbuK6cxuR7yVK/AZvuyNa+/wlrQwg+VANjG0xA@vger.kernel.org
X-Gm-Message-State: AOJu0YzMs1najgDw3fzzBi5bgoiuUd4o7hqyEjPWT2DlBqpoOXm7k9RL
	0WzncNT8hYFLIOEVOhb6LtgT32HLpCCM7i+B1DcLCgXX0u9Pq9UJvrudFLATwRMCiyKs6powbpZ
	0RSDVmr5ehLmnZ/kBthwniZyfZGQr9vcYr9l95xrToMdnMy7PKenSv1nACyfLTMcKn04w
X-Gm-Gg: ASbGncva8qO+9M6HTPIIyMrboJeQy6sYjTqOenSw67rb06I4qhuJPOt/GLt+egj92nb
	dliHPdrdeuGO+xnGH6eiQoETrd21lZSDpYgetIdhijm20R52I649ML92hpuspuCq31AQJKhGbcE
	xrYr0MjDco1vJI9/LQ9PHJLxPuuiNNbQCflUCb+7XDZ+ckAZiYNBrF+Ao8oAaF5CNuXC/4C9awH
	Y46VcqWh5zKP3ogdyDoffEzySI84bkt8c7Fgfjbi9FwQ4/apoFKazeTXECvrCFtjBm2yYzIDbS5
	kuSCaoRMYzYW9dTMvHl6k8sfCcErLBEqSttN8XHYWerStee9zx+g3alnRg72ngaKoT/f5RKqwnO
	s
X-Received: by 2002:a17:903:ac4:b0:28d:18d3:46cb with SMTP id d9443c01a7336-28d18d34807mr26815085ad.20.1759207238519;
        Mon, 29 Sep 2025 21:40:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEHurZVJdThhSMRhfXgQ+q0mqPgl7u6/CKCTRFKAXoWSFaDtn5ulaKgD9EWxKFZKgpufC6A6w==
X-Received: by 2002:a17:903:ac4:b0:28d:18d3:46cb with SMTP id d9443c01a7336-28d18d34807mr26814245ad.20.1759207238067;
        Mon, 29 Sep 2025 21:40:38 -0700 (PDT)
Received: from [10.204.86.68] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed66d43b8sm146897755ad.9.2025.09.29.21.40.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Sep 2025 21:40:37 -0700 (PDT)
Message-ID: <37ac6311-bd88-4b8e-bf78-06fcdd8bdf6f@oss.qualcomm.com>
Date: Tue, 30 Sep 2025 10:10:32 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] misc: fastrpc: Add support for new DSP IOVA
 formatting
To: Arnd Bergmann <arnd@arndb.de>, Jingyi Wang
 <jingyi.wang@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
References: <20250924-knp-fastrpc-v1-0-4b40f8bfce1d@oss.qualcomm.com>
 <20250924-knp-fastrpc-v1-1-4b40f8bfce1d@oss.qualcomm.com>
 <969bdb49-0682-4345-98f7-523404bb4213@app.fastmail.com>
Content-Language: en-US
From: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
In-Reply-To: <969bdb49-0682-4345-98f7-523404bb4213@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 91ZZDykgcK2wO_UzstuhVQWgo5T8lrUa
X-Proofpoint-ORIG-GUID: 91ZZDykgcK2wO_UzstuhVQWgo5T8lrUa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDA0MyBTYWx0ZWRfX6RNLmlOI6S7K
 KIC22ogfMfsxoekcdrFU5tZbng0h3Ssw/q9n9L0+1b+KfIfpVaIXlJV7Bkcr7rhe5JSgOl0OHIt
 4KTAeU2I8j1hO3YLo1N+arbF1sbqMjJzW6upiWyP7WND0XaWkgrSY9WnwxPXUfctzhRvybr4l8Z
 E/ssx9Oi1RaRJfoKI+9dlkBCEhk3OpFAY10usV62UZJMdY1iCga7QPAKAbRZfxD4KtNqY8bR532
 Z7S15wTKBDqnsxh9Td6kO4o4OwCfs15tzsX5hEzW9uNHTAPzWJdhu8n/mqZWUBaxRg+z14fFfH3
 nWQApHPfjrq6f4M3vGPP2+IJLvfg+FRrz8xoPBbgkyDxJLTmM3hUdOmbMB46lYeAYhMRSomKzuD
 qINmYNfgW65hIGnH8oPKvfLfwjrTzQ==
X-Authority-Analysis: v=2.4 cv=Sf36t/Ru c=1 sm=1 tr=0 ts=68db5f47 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=bqvQEXuXJtI6iJ33JrsA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-29_08,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 bulkscore=0 suspectscore=0 adultscore=0 spamscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270043



On 9/25/2025 11:54 AM, Arnd Bergmann wrote:
> On Thu, Sep 25, 2025, at 01:46, Jingyi Wang wrote:
> 
>>   	dma_free_coherent(buf->dev, buf->size, buf->virt,
>> -			  FASTRPC_PHYS(buf->phys));
>> +			  IOVA_TO_PHYS(buf->phys, sid_pos));
>>   	kfree(buf);
>>   }
> 
> I understand what you are doing, but the naming of the macros
> seems a bit confusing: dma_free_coherent() and the related
> functions are designed to take an IOVA argument, not a physical
> address, so calling IOVA_TO_PHYS() before passing the
> address sounds wrong. This is made worse by the naming
> of 'buf->phys' that is not a physical address at all
> but already transformed twice into a dma_addr_t and
> from there into a dma_addr+sid tuple.
> 
> Ideally the SID handling would be abstracted behind a custom
> dma_map_ops implementation that treats this as a custom
> iommu, but if the fastrpc device is the only user of this
> address format, I can understand you want to keep this as
> a local hack in this driver.
> 
> Can you try to come up with some better naming here, and
> replace the 'phys' bits with something that is more fitting
> for an iova/dma_addr_t?
>

I will improve the naming for better clarity:

- Replace buf->phys with buf->dma_addr throughout the code.
- Rename the macro IOVA_TO_PHYS() to something more appropriate, like 
IPA_TO_DMA_ADDR()
>       Arnd

Thanks,
Pallavi

