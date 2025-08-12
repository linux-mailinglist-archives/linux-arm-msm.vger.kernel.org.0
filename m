Return-Path: <linux-arm-msm+bounces-68717-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C64CB2232A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 11:31:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B298516F709
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 09:27:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFE622E8DE6;
	Tue, 12 Aug 2025 09:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Llb51V61"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB6512E8E1C
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 09:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754990844; cv=none; b=najY1D8Ulp8BCPi8TXnZBFqPyoAUqkUAGrS/JBxsWkK5W/wFa06aHfcYv5qnzqJy3MI809nJvZck2bFmVRvK65sEec/rr0h8JT8k00sdlNguEdRZP8e7HERPWNET97IBsbWfCrJ6sSC6wUU/RcFAUi3/qBJnfrF3AzBJgJuHGoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754990844; c=relaxed/simple;
	bh=c9w5DaCwevdS8Zl6bzjQ1GF90LNgwle0F+O5Q9ZhWPc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IduM6/OA1+O0mrZ6zVjDyUzF7sqFSaQCV+t2yPILOalZHIal3z0TP5iXWBSa0aRrBWedzuX6u+Rd4pCQo103Uwxe3K950RuT486GJiL7EkXoUKPTp0dqNIJOU2ytkZj7Ry9xakAntg5/yQvmu2/ib0KVIKyZ5sBbC4Pk1XqrOKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Llb51V61; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57C7NY2K008265
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 09:27:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x1XZQXAHzUdSPrv2me7BRJkLC13h5rEiUYCH9W9cUAY=; b=Llb51V61WCalqt3U
	csS5zlgRdsQaP9rirsXjehj9wFrRWoIpzwoN3a/ZvbQW6GSOFCKjVihIPpyiLtvi
	6ZvbckxLxMKjQliSiJ5d3aWZd/ToSK0xFP7AHWe2q5D5k5ltLLIEOyPyMIXtEcY8
	fF8Tkw12wXduLk07blc+IsIOn7Yf8XNNYMmPkxfVbBN8fIR4FH++rtxie/14+M8q
	cM2J/wm2q+gUKlWjcss4eTuc6D7iq9ukljkMQeLGpkLYLAj9jl176Z+z48HFvego
	XiIVlxp/hdhgqgcOoR0AzSl6mbmx5ixHr1ImmmGtd7N6Zt4OWa5CcbrCFZwE+wEY
	Ldg+Bw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ffhjkdj5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 09:27:21 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-70989fdb7f6so15701666d6.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 02:27:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754990841; x=1755595641;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x1XZQXAHzUdSPrv2me7BRJkLC13h5rEiUYCH9W9cUAY=;
        b=NXB4Uo3aprj/lkvVawjiUIPRWpPVW698aSLVeoFhKQG9wxmp1zwgH0+KfEHPsKU05i
         YiwhvyO2YB5tzEwzYTgH1slDlIsxh+zY51l6jWowOXNIPyEobHhia/6iO2KlTJ3tlfPp
         sG/J7EKdXt6TcqBKhaezDSmSu3xVaAOXnPWGp2luSDJXLUvrBkdGXhSYA8MWRUa7Et45
         UWUzE4+wEPjEkoefXlia57GxQrJZVn+UseAmgkAAG6sAVZI2RocxpqCQlAl6MMOeFjPK
         1zHtrZSQTd1AW6C4Ck1g5dtv6MZcs7lr5nyxBNs9K24AIFHIcbBCpnowkRoCByQ/52r8
         UCYw==
X-Forwarded-Encrypted: i=1; AJvYcCVl6M78kkJcBGogHnLZB237xeZ+sZngFbLg2hFdK0qvH3qIP2fdvKODFfe5Tsml07wWrlBcvI04LvIIKlzk@vger.kernel.org
X-Gm-Message-State: AOJu0YymoeCdZ0VXOcVGIJrHFMLUxNL8gC9hK37/ag1HrB3uCRiY9aGw
	5Gqkl9AqSeiZCw94+D18yAdNsoRpja5p38MP3dw/hqYSSsC3bw7Wpy5TW1d/4ek1WGCohubKU6v
	OaxxwziyoEp743f3brw2gnl6t5X67mDiBGC0FqNcTu/J5M9S0fuuwP51nKQHwttCqcobB
X-Gm-Gg: ASbGnctdn5Po0Wx+YYG3rkKZu1rUQrxGEtdpImP4XsutHfhNrHtgtY87+4J0fZbO3/W
	BvKxI804JwL/gydksJ+Zna/9SSbgp+t4BbwXys9Gdu+dJA//OkSvzIymQkGa/RlHBneNNCPhsiV
	QDlYpWm4Zbd7fPboTzpV8YvogDlQtmU1EqtQJSCH06hOEGa8R0T6KqqPeFikSSnXRPocNEjPfc5
	voSAWNLR/JdtKItiIYJN+O0UmMJpFfSKu4GQAcMrpQQNw4YrXTWp56TYDZCRSsz/UqtFuIfioLi
	a7qk7iSLziZdoCz9dm3caPrjgGwBqhWkicepzHDz5yLok1TjLRsO6RzlZK0PmXWSY5EOsEboSQa
	EWjD13B22Sz5Zu5Dtig==
X-Received: by 2002:ad4:5c6d:0:b0:707:4daf:62f with SMTP id 6a1803df08f44-709e250c0f5mr1924816d6.7.1754990840774;
        Tue, 12 Aug 2025 02:27:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJKGm+UhBSlPdpnKeF86J93B+AqDA/p+7hYFKAOley2I+WUeLVMJXey9VyfTdFfRU+b7jZRA==
X-Received: by 2002:ad4:5c6d:0:b0:707:4daf:62f with SMTP id 6a1803df08f44-709e250c0f5mr1924686d6.7.1754990840317;
        Tue, 12 Aug 2025 02:27:20 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615a8f2c265sm19700788a12.26.2025.08.12.02.27.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Aug 2025 02:27:19 -0700 (PDT)
Message-ID: <3939605c-7335-4401-ba32-b88ee900f1d5@oss.qualcomm.com>
Date: Tue, 12 Aug 2025 11:27:16 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/11] PCI/bwctrl: Add support to scale bandwidth
 before & after link re-training
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bjorn Helgaas <helgaas@kernel.org>
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
References: <20250711213602.GA2307197@bhelgaas>
 <55fc3ae6-ba04-4739-9b89-0356c3e0930c@oss.qualcomm.com>
 <d4078b6c-1921-4195-9022-755845cdb432@oss.qualcomm.com>
 <68a78904-e2c7-4d4d-853d-d9cd6413760e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <68a78904-e2c7-4d4d-853d-d9cd6413760e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA3NCBTYWx0ZWRfX5Tel/eBnF+Oj
 tXB925gXzq298UHHp+CJtbrvpt7YjfMoid/vVuLkRHGHYzSKTifv07bMfsdQrEeTl76ncWX97aY
 vzJv1BJH41/nWzs1F4+dIybsNAf0AzaMShyiIma2zj88qosI2QltP9CkW8C0yEEDWRHIW/Xz/64
 76MjA0Bt44Vp2C019sCx3hYjaptjqod+dm5pKcYk0Zd5An/SxL4b4UvRcBSQpDkefOi1xY3gMlH
 XPx1V9lJlH7f1ldULJ9j9L1RwLrpmes89Q7gaPvx8Kx7Gdg0KjpOFiQirC4fQbamNx0W7yyvCPm
 gqau6KyLWPdIFN6L7FrvFHYosBTwKUIvH4iJdo4Mqf3iM/FWX+yyCjJaf9GmSl/XqCaGT9XKjrv
 EJss6+WN
X-Proofpoint-GUID: J5cwQJmGkif3MAFkZNL_STBVb0mO52w2
X-Authority-Analysis: v=2.4 cv=TJFFS0la c=1 sm=1 tr=0 ts=689b08f9 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=PSSt48hOBszhu4C4aVgA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: J5cwQJmGkif3MAFkZNL_STBVb0mO52w2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_04,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 clxscore=1015 spamscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508110074

On 8/12/25 6:05 AM, Krishna Chaitanya Chundru wrote:
> 
> 
> On 7/22/2025 4:33 PM, Krishna Chaitanya Chundru wrote:
>>
>>
>> On 7/12/2025 4:36 AM, Krishna Chaitanya Chundru wrote:
>>>
>>>
>>> On 7/12/2025 3:06 AM, Bjorn Helgaas wrote:
>>>> On Mon, Jun 09, 2025 at 04:21:23PM +0530, Krishna Chaitanya Chundru wrote:
>>>>> If the driver wants to move to higher data rate/speed than the current data
>>>>> rate then the controller driver may need to change certain votes so that
>>>>> link may come up at requested data rate/speed like QCOM PCIe controllers
>>>>> need to change their RPMh (Resource Power Manager-hardened) state. Once
>>>>> link retraining is done controller drivers needs to adjust their votes
>>>>> based on the final data rate.
>>>>>
>>>>> Some controllers also may need to update their bandwidth voting like
>>>>> ICC BW votings etc.
>>>>>
>>>>> So, add pre_link_speed_change() & post_link_speed_change() op to call
>>>>> before & after the link re-train. There is no explicit locking mechanisms
>>>>> as these are called by a single client Endpoint driver.
>>>>>
>>>>> In case of PCIe switch, if there is a request to change target speed for a
>>>>> downstream port then no need to call these function ops as these are
>>>>> outside the scope of the controller drivers.
>>>>
>>>>> +++ b/include/linux/pci.h
>>>>> @@ -599,6 +599,24 @@ struct pci_host_bridge {
>>>>>       void (*release_fn)(struct pci_host_bridge *);
>>>>>       int (*enable_device)(struct pci_host_bridge *bridge, struct pci_dev *dev);
>>>>>       void (*disable_device)(struct pci_host_bridge *bridge, struct pci_dev *dev);
>>>>> +    /*
>>>>> +     * Callback to the host bridge drivers to update ICC BW votes, clock
>>>>> +     * frequencies etc.. for the link re-train to come up in targeted speed.
>>>>> +     * These are intended to be called by devices directly attached to the
>>>>> +     * Root Port. These are called by a single client Endpoint driver, so
>>>>> +     * there is no need for explicit locking mechanisms.
>>>>> +     */
>>>>> +    int (*pre_link_speed_change)(struct pci_host_bridge *bridge,
>>>>> +                     struct pci_dev *dev, int speed);
>>>>> +    /*
>>>>> +     * Callback to the host bridge drivers to adjust ICC BW votes, clock
>>>>> +     * frequencies etc.. to the updated speed after link re-train. These
>>>>> +     * are intended to be called by devices directly attached to the
>>>>> +     * Root Port. These are called by a single client Endpoint driver,
>>>>> +     * so there is no need for explicit locking mechanisms.
>>>>
>>>> No need to repeat the entire comment.  s/.././
>>>>
>>>> These pointers feel awfully specific for being in struct
>>>> pci_host_bridge, since we only need them for a questionable QCOM
>>>> controller.  I think this needs to be pushed down into qcom somehow as
>>>> some kind of quirk.
>>>>
>>> Currently these are needed by QCOM controllers, but it may also needed
>>> by other controllers may also need these for updating ICC votes, any
>>> system level votes, clock frequencies etc.
>>> QCOM controllers is also doing one extra step in these functions to
>>> disable and enable ASPM only as it cannot link speed change support
>>> with ASPM enabled.
>>>
>> Bjorn, can you check this.
>>
>> For QCOM devices we need to update the RPMh vote i.e a power source
>> votes for the link to come up in required speed. and also we need
>> to update interconnect votes also. This will be applicable for
>> other vendors also.
>>
>> If this is not correct place I can add them in the pci_ops.
> Bjorn,
> 
> Can you please comment on this.
> 
> Is this fine to move these to the pci_ops of the bridge.
> Again these are not specific to QCOM, any controller driver which
> needs to change their clock rates, ICC bw votes etc needs to have
> these.

Do you even need to set the OPP explicitly? The global irq handler
already does so on linkup, and you seem to toggle the link state in
the newly introduced helpers

Now not all DTs currently have a global interrupt, but that's a mass
fixup to be done anyway..

Konrad

