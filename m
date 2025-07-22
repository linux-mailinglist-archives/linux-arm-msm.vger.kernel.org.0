Return-Path: <linux-arm-msm+bounces-66050-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E71C2B0D7A8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 13:04:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0BAEC1880820
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 11:04:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A3C32E11CA;
	Tue, 22 Jul 2025 11:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gTRM5A+Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54B18298CD7
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 11:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753182242; cv=none; b=K9NHwSL8tooJdmUGcy3sQ2nm1wK869hcgA0ewn5L/yaJJ4XbYNyxpxqauQmdTtDHJKEYnNYQ8tzh8vwcJFSb66tohXOXT8ti8mmRkA1AJ4F4b2Btxjg6/S1rzPzoa4It5CFP24j0vqx8ttV6G3GeEeltGCI2ECOXy60egBQXqvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753182242; c=relaxed/simple;
	bh=kWCUG31bkJ6dZkQu4ecUTQJmDb9akcJNyNVIFUvX4So=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=CwSeSp/syAxabQb4fMUj2fXXaVWaft/ZEd9UQKJ6x1wXp1nWaIAchdTveoED7a2U0HPpK+8pNSvGaOlSKsXNRugXGhuaCeVVsPwtYkMyvdjUcNp013Ynw4s28s1AVn4or0cnvVJBYQPzHmq20ltblqraugzKXqWp9+TUA3ith98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gTRM5A+Z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56M75UXs015514
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 11:03:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jCcIy69ciDOUcVdtD2bZCMzRk/SyBUFRLG70HN1E2+Q=; b=gTRM5A+ZXBV1LYZH
	oVBmEosxHP33U+7/2sCjFSscWe4nGK/f+gXjn5xNeKKUV1yqF6yNb7EFMn0i8LRR
	16mhIwk9iplEJHanlgtA783cn44423NPSDypNTK0L/GbZUsgmTL96QEYBUm2ko7+
	CCrwFohoQJjQPt91kyCR0aCn/iyGBgFhB9XNH2kIRlEqGPsCnkJC7LxqSY4jPrOK
	iKo5zANUOwW6Vw3jcKypisxjmS7VHgiZciDZS5sxKjBkPOG7Frg4d/zFg28Spfp2
	khieEqYk/0ri3+2XImGWUKMe1zVosO5/wq3L5wzBpx7TPhMmX8RXHM7QrMGYc6kr
	cbL36g==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 481t6w29xs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 11:03:59 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-75494e5417bso5051856b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 04:03:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753182238; x=1753787038;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jCcIy69ciDOUcVdtD2bZCMzRk/SyBUFRLG70HN1E2+Q=;
        b=CIo7pk09+NQsmq+ABQDsIIBgBOghg6NTnB5dDThM7EJdv4GAAjQ9NGEUj2lK6+QQjV
         u9CU38AMykEYweR7XkGIwsV+eqiTUnY/lcq69bVJHxaWbbHTzOhTD3o+71kdistbdc/U
         v3kIh5esD4a46hapWZrzNovpS6AGxh4rXINUEiLVqaHC7R5PkGREnpKbY36lRJo/dE4N
         8NX4mrTthNPkA0DCsFcWqV6TpXqFv/Yt6ytxgW+F8UXwUwaBpLNuqpayWp6YrYHXjr42
         91NE9CS+Bu/siHhDwU53odwvamB34KMrgCiKtu5UWe6MxweUqyvn+eNrN7XL2WWBfV1b
         7QOw==
X-Forwarded-Encrypted: i=1; AJvYcCUdZem5vTjiBIdfRjuR6eUuFqNff5nqbHKdVqVJs9ofyA83hVCSYQkFwuCID+V12nqy8J889zLPQ2iYHUaN@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0mN+OOv+0hj2ZtBsnCYV3SryCXFTKp4sflYAOdBf/fW7MNpDb
	2gMv2B+VZNlD8MrhX+rTx9B98JlI4SQPO0tmPhRYVyuTNggR6ZEt0MzXl6tDOucf+nFgr4cPU95
	39UFE5Q5xqEsklg9qfXIeJH9c1NUS6KAFS0zr9QyIp5JA8DdA2eLsiR0t6wfT8kG3O931
X-Gm-Gg: ASbGncvLThWwF3+RbNF0vvq5Sj9/WoNTYpf22OMwDIzwYWNdzDDJGkmZkPkRqkOgRa5
	byRfqxR79qak2BPkZGVhOek2qKu1/XsO/Nh/5tIrEWDyyARO1M4Bgr/jqpML6U3T3jdA+PPqfuM
	VsuNOQmVeUA5MQKipul0fAtr/5jbiLQb9We42GybTYZPtqtR0LTxk5auFySLchBQ6Xmjj1Ra2Sk
	qtb+/2bs6vCQbslIncLx0SAcNlKOObH0a9/dE8F62GsuvlFcdAly0EWg2/llkmhzMZaCQrmolKX
	E92cGTUTZG4/4kTJhHW5NVDZbRw3ulHQwLhWteYJ5HgMBB6Jwb0MrSsQPT9qyKGY0/aeGvUPog=
	=
X-Received: by 2002:a05:6a00:1817:b0:736:5969:2b6f with SMTP id d2e1a72fcca58-75ed156d03bmr3761907b3a.6.1753182238338;
        Tue, 22 Jul 2025 04:03:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHgZIDkCUV2AXz/9PK4/a4NCij1DJxFB71Da611o7fAf8jI0CKXgwVrcrLnlMSH3ym9h+L+Lw==
X-Received: by 2002:a05:6a00:1817:b0:736:5969:2b6f with SMTP id d2e1a72fcca58-75ed156d03bmr3761869b3a.6.1753182237848;
        Tue, 22 Jul 2025 04:03:57 -0700 (PDT)
Received: from [10.218.37.122] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-759cbd67ed2sm7293938b3a.135.2025.07.22.04.03.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Jul 2025 04:03:57 -0700 (PDT)
Message-ID: <d4078b6c-1921-4195-9022-755845cdb432@oss.qualcomm.com>
Date: Tue, 22 Jul 2025 16:33:50 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/11] PCI/bwctrl: Add support to scale bandwidth
 before & after link re-training
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
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
References: <20250711213602.GA2307197@bhelgaas>
 <55fc3ae6-ba04-4739-9b89-0356c3e0930c@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <55fc3ae6-ba04-4739-9b89-0356c3e0930c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=SPpCVPvH c=1 sm=1 tr=0 ts=687f701f cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=UU_a8xXafIRJjp1WqNEA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDA5MCBTYWx0ZWRfX0kcouL+EgEwN
 r815sY23tZBBgxFRS0b/0KjjcmZTG2D49sl0sOeKBBi9wHwzb2JOfc+qdwVFYhmQlzkSKts4ChK
 iAOylEMF+vLzL0YEF+EhZPTI9YoH1uCIJ0AprKFh9lPqDJ+RpKzJNYIGUO8zO1+tef0Y1lJxHMZ
 gvo7uwufZwQlscNydRTratfJ+53tfR0vRI2iAehdnqihzN44qRJWfHVWhcYJ3RgQwloZs0XvnLo
 WFge2x1PElYvqQhXuaim5opFTOqb4e9WfgFNM7oGssePIhJouD2gNz12qdeIgxBEZlcaD8LgbZW
 rXNUSIcG/+jl77DJw4Ghugcqp97qyOc33BvzLgEi+MQ/HMMRuz574jfPeq4p3TFFm1J+zzy6cLW
 lfXzLtoKTDddabPxowrMGNKs449yZ/3BHUnwDHaK8oSvTqsXyvE0bDzTZFt9fv45FxaLMquR
X-Proofpoint-ORIG-GUID: ddp9Lp78H3z088tHe1mty-dl6ybeF5iO
X-Proofpoint-GUID: ddp9Lp78H3z088tHe1mty-dl6ybeF5iO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_02,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 mlxscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507220090



On 7/12/2025 4:36 AM, Krishna Chaitanya Chundru wrote:
> 
> 
> On 7/12/2025 3:06 AM, Bjorn Helgaas wrote:
>> On Mon, Jun 09, 2025 at 04:21:23PM +0530, Krishna Chaitanya Chundru 
>> wrote:
>>> If the driver wants to move to higher data rate/speed than the 
>>> current data
>>> rate then the controller driver may need to change certain votes so that
>>> link may come up at requested data rate/speed like QCOM PCIe controllers
>>> need to change their RPMh (Resource Power Manager-hardened) state. Once
>>> link retraining is done controller drivers needs to adjust their votes
>>> based on the final data rate.
>>>
>>> Some controllers also may need to update their bandwidth voting like
>>> ICC BW votings etc.
>>>
>>> So, add pre_link_speed_change() & post_link_speed_change() op to call
>>> before & after the link re-train. There is no explicit locking 
>>> mechanisms
>>> as these are called by a single client Endpoint driver.
>>>
>>> In case of PCIe switch, if there is a request to change target speed 
>>> for a
>>> downstream port then no need to call these function ops as these are
>>> outside the scope of the controller drivers.
>>
>>> +++ b/include/linux/pci.h
>>> @@ -599,6 +599,24 @@ struct pci_host_bridge {
>>>       void (*release_fn)(struct pci_host_bridge *);
>>>       int (*enable_device)(struct pci_host_bridge *bridge, struct 
>>> pci_dev *dev);
>>>       void (*disable_device)(struct pci_host_bridge *bridge, struct 
>>> pci_dev *dev);
>>> +    /*
>>> +     * Callback to the host bridge drivers to update ICC BW votes, 
>>> clock
>>> +     * frequencies etc.. for the link re-train to come up in 
>>> targeted speed.
>>> +     * These are intended to be called by devices directly attached 
>>> to the
>>> +     * Root Port. These are called by a single client Endpoint 
>>> driver, so
>>> +     * there is no need for explicit locking mechanisms.
>>> +     */
>>> +    int (*pre_link_speed_change)(struct pci_host_bridge *bridge,
>>> +                     struct pci_dev *dev, int speed);
>>> +    /*
>>> +     * Callback to the host bridge drivers to adjust ICC BW votes, 
>>> clock
>>> +     * frequencies etc.. to the updated speed after link re-train. 
>>> These
>>> +     * are intended to be called by devices directly attached to the
>>> +     * Root Port. These are called by a single client Endpoint driver,
>>> +     * so there is no need for explicit locking mechanisms.
>>
>> No need to repeat the entire comment.  s/.././
>>
>> These pointers feel awfully specific for being in struct
>> pci_host_bridge, since we only need them for a questionable QCOM
>> controller.  I think this needs to be pushed down into qcom somehow as
>> some kind of quirk.
>>
> Currently these are needed by QCOM controllers, but it may also needed
> by other controllers may also need these for updating ICC votes, any
> system level votes, clock frequencies etc.
> QCOM controllers is also doing one extra step in these functions to
> disable and enable ASPM only as it cannot link speed change support
> with ASPM enabled.
> 
Bjorn, can you check this.

For QCOM devices we need to update the RPMh vote i.e a power source
votes for the link to come up in required speed. and also we need
to update interconnect votes also. This will be applicable for
other vendors also.

If this is not correct place I can add them in the pci_ops.
- Krishna Chaitanya.
> - Krishna Chaitanya.
>>> +     */
>>> +    void (*post_link_speed_change)(struct pci_host_bridge *bridge,
>>> +                       struct pci_dev *dev, int speed);

