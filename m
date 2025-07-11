Return-Path: <linux-arm-msm+bounces-64646-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 96693B02781
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Jul 2025 01:11:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D9FFD1CC15F0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 23:11:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7E3F223716;
	Fri, 11 Jul 2025 23:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fQy/grzz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F9112236E1
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 23:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752275426; cv=none; b=gKbRch2Ws53YcT+7G+zh/fiYxW3SPm7sPKEbIdd8Dqmm9zhU2HYCMAaioRQ2AJnTkWDoKTAyB1b2qvgps4sV0Ac3/VC2d/S8Z7LOseXGnjYlttOe66h2JhDSLjjhlQDPdUGxGO+5yrVJWZuuZ8z0zOamdLN0CJss+F065F7Xgl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752275426; c=relaxed/simple;
	bh=aMkT7VCR7/G5eL1+EN+sboSxvDAd1jJ/UJlcZ65dpqY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BEwJqnz0jnjwTcr795gee6vqao7mF17ng/l+IsIoIavx3+BNx/LbYIAMBg7/Zi7s+kHPMu2jMWNgbl0wk/MDsZBlt8HZUQ7fhTk6fLP8/3VH91eZJaVW+YDqQq3ax+9STGg/B672cSgk7hQ/go723igzApMj6m9XDCKaaUG8aU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fQy/grzz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56BAvGTU026222
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 23:10:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iJaNlSK/GbStS7lb9/17BUr8ds+mo5PWyFhZUdAGzHU=; b=fQy/grzz9xiKmQcY
	a9nS7NT6LgbLz1F96MqwoPoiXvRywypXDx6Sf08cSwryd9uFUVSiYqrOewsHCQ6K
	ZTYKYsQjPHxnBbsnvU2S3LSF9TADqJmEn0byQFJZkdELEI5dbfSpKsFRvr773BEh
	nhtbO+1wzVPcUyf3bkj0rIxAaFy0ra0lNI6u1u988q4kH/DEWPGZy95Vw6GlwYaE
	GbNeMh9C0hOz41mTHqQPMHBeRm8byif+HdRWmxpbx8XOYFgV4ZRLWLjMecQG1CAr
	xUW/C5Dicr/7KlfGcn9lxibMFkT1V13Wt5QPZoG1dAASuem8fVd1/DzwkLSHO6xp
	6+5ajQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47u1a2hrv5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 23:10:23 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b2c00e965d0so1917306a12.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 16:10:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752275416; x=1752880216;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iJaNlSK/GbStS7lb9/17BUr8ds+mo5PWyFhZUdAGzHU=;
        b=MtGY3J0TKqrnTV5wlN3qeKRumgstxmQfxOCVHzEnsMrwxMcSWPuTPSDIDnOW7ndB7H
         93eWH/DFalXl63TBPvtYy56T+wVRrOZPuo9vzgc6Gc32nPlYSe3BB2+eeA70D2BguQ5g
         MjodbrLom9V/y1OrbrJoPb5zlNptaedk8h8DKs5EbUOu0XnuA6tejBD8dDcaklp+2Wsn
         3xzjfHjBzzxmkrrDyJKdgbOFB9KPATtQZ6/k9sQNZamWIJ28KuplW9B5hIc6dgbUTfz5
         GgLu65l9VbxJL7M3v66K4hvuBgkKKNCtQhLzK7cekc99vj6Uf75U9dqn3a+qquUAxpTk
         5PEg==
X-Forwarded-Encrypted: i=1; AJvYcCXD2aQucF2FK3JINF8DOwSFxKZHrx00hyyVT+Y2AuULvP29RvN0EdWG3C6FMGfhdqTxmwHlikAWWu/9AAC/@vger.kernel.org
X-Gm-Message-State: AOJu0YzWPcq1HPrQaJbY3w5yWIHSijdxkmBpfU7zwNEXpiy8EI4Gzg5V
	6V7/6mWptTjkvMHrX/U82Q7u6wFKCGT111ng+dnceAOyOvAoeDBHi5uryniplsZ27HTDPRpjVo2
	sQvP3hH0ABy3dhxnl7MJDsHWd9kw45s3C++UZgjUTlmb4QDv/x/5lcj/EU5Ll0TOuMdLJ
X-Gm-Gg: ASbGncvn4xe+ms8bwtVoVLLJLIjJIabhEN8jGmfcC38DVj2FQxoirna0YFy3V07XsC5
	p5QWVerDyyfFqeNhTB8Z/AIAHg3umR3pFv/xoAtq4Tmt+kq1WeDzJNvePrjpmhEaCyLosNxbyrN
	KvekK8nBc7bfU0GvPa6g1nVd9xEaRMj/tFKO6Nu4w5YU5qnjrey3ibv7LhErGSrJUHRljIwr+jb
	eJgAkY6aud7sJK9AzGzzsPPtazWovuMSyaXVpVR5Z+xg0dlGY3SPB4JXHKDCxH1t4M+G7lrvBIf
	Hyi2VOEu4peySZT2DCa9nJSXUN7bx+mi9rDQmMVN9QjObrW3Ni34NfG0mSf11Zq4Cwyu
X-Received: by 2002:a17:90b:580c:b0:311:ad7f:3299 with SMTP id 98e67ed59e1d1-31c4cd9d001mr7043592a91.25.1752275415652;
        Fri, 11 Jul 2025 16:10:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF7Z1TQfgkE3r2PMQwTwfxQjj0gjR9UsVQ1UbIMeevZFsnCWlYfrpvPY3URH71qwyKf5RhBCg==
X-Received: by 2002:a17:90b:580c:b0:311:ad7f:3299 with SMTP id 98e67ed59e1d1-31c4cd9d001mr7043560a91.25.1752275415267;
        Fri, 11 Jul 2025 16:10:15 -0700 (PDT)
Received: from [192.168.29.92] ([49.43.227.1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31c3eb467d7sm6197116a91.26.2025.07.11.16.10.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Jul 2025 16:10:14 -0700 (PDT)
Message-ID: <0bc51460-f25c-4607-bb9c-0e317e362201@oss.qualcomm.com>
Date: Sat, 12 Jul 2025 04:40:05 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/11] PCI/ASPM: Clear aspm_disable as part of
 __pci_enable_link_state()
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Lorenzo Pieralisi
 <lpieralisi@kernel.org>,
        Rob Herring <robh@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Manivannan Sadhasivam <mani@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        qiang.yu@oss.qualcomm.com, quic_vbadigan@quicinc.com,
        quic_vpernami@quicinc.com, quic_mrana@quicinc.com,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
References: <20250711230240.GA2312867@bhelgaas>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <20250711230240.GA2312867@bhelgaas>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=MKJgmNZl c=1 sm=1 tr=0 ts=687199e0 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=4nqOr+EkFiuPl9GB/B4vcQ==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=P-IC7800AAAA:8 a=nqD_WAsoW_ZkbJYGnRIA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzExMDE3NiBTYWx0ZWRfX8wQG1KhC7nH3
 VE9k+7oieZFgu4Bv8sh7FvXe99IZE1Z6vg/A3oT630uHR9Xc90QGMKtbdSzBeF6xhjflzBNc671
 gOTfXVu4rsIOL3W8Z06Wa6nA4nQuxJb94MLOmJIaIbJt7fU5WUkIaGBvNHT7MbnbGw9j1um/FEX
 CFFQI60SQ6yK7KNt5aouwkEKELbMqWh8PJf53o4vZVtbTjFLBC3DzCwcdWyd8oHU/twGOEyHODG
 4AyQQHBjvFa0pn9i6Fi9tJKvxM//2JuCjOkfp34q3ux6w0cS0VYRJ6wj6/XKD5OzvWS+LVcmyoo
 fj7z8dqwN2eMnMpMUDV2dqspkXR9wTWD0eBykIGv2CbKzb98PhPO3zuOGpiEj7r5NjST1LpmHU1
 sPtUJjQN7utqVdyJAczKSHVtDOiM1aokeRc3T6oRDspFlprPednIfBeag7TUV0Fx2yzR3dh0
X-Proofpoint-ORIG-GUID: TOsPlxTOmfpkrnR8IsJj7KrWOuln1k7F
X-Proofpoint-GUID: TOsPlxTOmfpkrnR8IsJj7KrWOuln1k7F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_07,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 bulkscore=0 phishscore=0 mlxlogscore=867
 impostorscore=0 mlxscore=0 lowpriorityscore=0 spamscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507110176



On 7/12/2025 4:32 AM, Bjorn Helgaas wrote:
> On Mon, Jun 09, 2025 at 04:21:27PM +0530, Krishna Chaitanya Chundru wrote:
>> ASPM states are not being enabled back with pci_enable_link_state() when
>> they are disabled by pci_disable_link_state(). This is because of the
>> aspm_disable flag is not getting cleared in pci_enable_link_state(), this
>> flag is being properly cleared when ASPM is controlled by sysfs.
> 
> Mention the name of the function where this happens for sysfs so we
> can easily compare them.
it is aspm_attr_store_common()[1], it will be used for all ASPM sysfs

[1] 
https://elixir.bootlin.com/linux/v6.16-rc5/source/drivers/pci/pcie/aspm.c#L1595

- Krishna Chaitanya.

