Return-Path: <linux-arm-msm+bounces-69496-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9604B29B49
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 09:52:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2CE807B1439
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 07:51:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B59DE287266;
	Mon, 18 Aug 2025 07:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CDWxzdKw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67C752797B5
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 07:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755503543; cv=none; b=JT95tSXYxNV7PmyohBEyLkiNWdx8FejJydlDOTgZMeNr/6Kttogdx88nKUP2FDUw5E/GXh/D7vj1LCEPRVzcu98GU4B0x/me60Nv/Ju2AAuZfCVrgNzs/4QUFHXdj5ekrCgZW07oOJP+lEILPWbJJXMFjPU4bM/7dIywwiRZIQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755503543; c=relaxed/simple;
	bh=pgkEKMAueomDIInDqIv7rp4PxkF7KhmnYbTHvcvQgsw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oKwYgiyI+h+X78jrMcs/g+kW7Kery8omDykvNQtr1ocf+jkfFepRBNy2z/hchPd9WQLxU6GP9xp5TSvNGWLpJm0XeiCzxEnQpqs1do3mzarMIOARRTh6XGJf1qOkrzLb+9HTjZw1AJR/V6fJB8Qa14LKefYQFaxofPcb7gcPMBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CDWxzdKw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57I7V6s7004159
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 07:52:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D8DSjaS6Nzqt4Y1X63RBdfnA4n1R0NNiVWDomfR+v5s=; b=CDWxzdKw3ksLzHI1
	QAI6u8TdkTkW49JYAqt6s1P9wlxFrq2ZLt85SuVIsChDo71+97r7wjxelxBud3sv
	1khQvu6V6dICgkN8NeKYp4nl6hi18WGWH7o5r152I5caoIvKxB1Da3C9WE/ChniD
	ACBLMq7Arkz64RNscnslUjO0inkz8AmPJeCptzoODXQ4AJ/bO6cYls26jlXxx0Gk
	W3gIXTr8cYLWSH3/JE+ooe5ENTb82MRMtcw698vX8aPgVOPwqPTGhf5KokvxIOWC
	QvtzWzAtoJxFm7/nJzPugS341qeoPcMhJ14r7XMCLJSWU7Fh4UF9pEIEXEhU4WqJ
	aEPPiw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48kyur81ny-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 07:52:20 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b4738634fc6so1756968a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 00:52:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755503540; x=1756108340;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D8DSjaS6Nzqt4Y1X63RBdfnA4n1R0NNiVWDomfR+v5s=;
        b=h/hSpjGN/DpX//BdCsNwHCFbqm/psC6MDVpnxCFbi0Hs8A6IzMm3liaOupuoJc9alt
         RDs38+12Q8YV3aHiaqTtSUfHFEJXPXA1f3uX8d99zHdddAs8f6nSw1zkhiy5DiyahpWL
         nLgbV2halrx8bwK34aanC22qSfP3Ecue12/dRmhtB9n8j0UNGKy16vaQqKSS1iyEdzvx
         XjUqtFodmy5daGOsdiFJ75uKpZ4da53sIIblknYQWlyj72tzCjpkC7rUTLjZHdMJ1XR7
         pLvyRd4To1dMcuA8cK0G51unFOF8MQPZcnVou23ytmUT7St3ufYa/mXnCCE3GHEAWUFP
         Ma2g==
X-Forwarded-Encrypted: i=1; AJvYcCVSpxatnyKyueKxPMR0ueVskW21K64MS9nayP/z2/UrDbVxz52h9nY5NZFt8DJGcInTwpc7kbXj9cdyu1bz@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8TElKEKGfHV289VHwV2N0XH9unvaIdA8d5XbJ83djJY6/3h1H
	IF2QJ2Dzdhg6N4VYc5dve2NITVWSn6UjZrDiTYPboM57GNK3kuJkEV3k3cg7MR/inARsZXiqO4n
	+YPZLKb05oLD2WUgbg743NG0bgMHdMQzE3zEGwcPQJQbWmNu0VUXkG02TfrTZGEsofRG7
X-Gm-Gg: ASbGncsiu9fVPJJ8Qjf7WLdWhTcg43yVcD1Pmo+wFfceg6GXzdxQdd8wjNYSmUH500p
	AT7L9iU0wn0+p7NUhu1oFRDfmyHuuncMNfla7b1xJmGbaK/U+V7fI5YsCrsWFcEJXSIzKiDzwzT
	Wk7XhBugyXP7H+EaH9uyM7dTp2c7oxSMWaYjkBeC7YbtG3sxPhCDhD0AsP877fM/U2dRY4GvrBm
	/BnzkXYuCg2ZFwt5Ny5vFlLdAX8Dxuw+oCp5LIhNFv54uPSQ96xHwpWnjEPRqFMUHj7wM2semuB
	uqqzKa3vBQDAMtyE02Fa1QuSt+GCMc6hmYkFdCQj+wFY/FtGPqm8JTe9ikPoUQui6sC3eWfkRw=
	=
X-Received: by 2002:a17:90b:180d:b0:321:7a2f:985d with SMTP id 98e67ed59e1d1-3234216190bmr15208488a91.25.1755503539591;
        Mon, 18 Aug 2025 00:52:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGv2ygM0PYT7FNcy0ZmFqjfoVjQ4GvBdacyoCcKsAMMiTB8lssJGuToO/HUfO1DKh2BZxqgnA==
X-Received: by 2002:a17:90b:180d:b0:321:7a2f:985d with SMTP id 98e67ed59e1d1-3234216190bmr15208447a91.25.1755503538964;
        Mon, 18 Aug 2025 00:52:18 -0700 (PDT)
Received: from [10.218.42.132] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b474e146654sm530414a12.34.2025.08.18.00.52.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Aug 2025 00:52:18 -0700 (PDT)
Message-ID: <378d4f1e-ade1-4549-ae15-f15d387876a3@oss.qualcomm.com>
Date: Mon, 18 Aug 2025 13:22:11 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/11] PCI/bwctrl: Add support to scale bandwidth
 before & after link re-training
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Lorenzo Pieralisi
 <lpieralisi@kernel.org>,
        Rob Herring <robh@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
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
 <ycbh6zfwae3q4s6lfxepmxoq32jaqu5i7csa2ayuqaanwbvzvi@id4prmhl3yvh>
 <ec0e3b33-76f4-4ad5-8497-5c8c8b42f67e@oss.qualcomm.com>
 <mrsdwtzz7x6uuoakjr6kymqccfxs3lndplols7j33apbru7jii@tjdljisgaqny>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <mrsdwtzz7x6uuoakjr6kymqccfxs3lndplols7j33apbru7jii@tjdljisgaqny>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE4MDA2OSBTYWx0ZWRfXzBmeMqG3IMKv
 HX+Rj9vj8ltFeSaWTHoL1jpcPnUPMZGnpbFINvm3sr4Jo/Xk5XCF3szaeKQDTmyy0bY2aLgypYV
 adfyIHt0bkH9688N06qGwvzITNWGfr1SLuPm/t6bW2N1FGixGixXT/k7s4SBeFEiUwJuZ3f1VBr
 DfF8Qk6JZCmP7rRIxSSj5z4nJ9RQYfnHgAKqPxhvLaUvKNslpYOlanShl1FWC6HYE8kwJZucxgb
 j6fi1vuAymWajuXJk9dSN2oKIo0K3TNWHhDB1Ldz5pb+Z61XSPD1S7SmTJ0Qb+I7qPdOiaa3mRM
 iRMbPeRkSBNbitMFaDiR2SY2wUzaJBkOIDVS3G08o2XnEsXw7aUMmy9HFvpiSEn524ireNUktr5
 O4FJboqd
X-Proofpoint-ORIG-GUID: 5n6MpApcmAL83hpG9wOedpA5J7E8-0r9
X-Proofpoint-GUID: 5n6MpApcmAL83hpG9wOedpA5J7E8-0r9
X-Authority-Analysis: v=2.4 cv=YtIPR5YX c=1 sm=1 tr=0 ts=68a2dbb4 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=-mV2PR8Q5cfizQaz2gsA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-18_03,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 spamscore=0 bulkscore=0 phishscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508180069



On 8/18/2025 12:39 PM, Manivannan Sadhasivam wrote:
> On Wed, Aug 13, 2025 at 09:25:03AM GMT, Krishna Chaitanya Chundru wrote:
>>
>>
>> On 8/12/2025 10:13 PM, Manivannan Sadhasivam wrote:
>>> On Tue, Aug 12, 2025 at 09:35:46AM GMT, Krishna Chaitanya Chundru wrote:
>>>>
>>>>
>>>> On 7/22/2025 4:33 PM, Krishna Chaitanya Chundru wrote:
>>>>>
>>>>>
>>>>> On 7/12/2025 4:36 AM, Krishna Chaitanya Chundru wrote:
>>>>>>
>>>>>>
>>>>>> On 7/12/2025 3:06 AM, Bjorn Helgaas wrote:
>>>>>>> On Mon, Jun 09, 2025 at 04:21:23PM +0530, Krishna Chaitanya
>>>>>>> Chundru wrote:
>>>>>>>> If the driver wants to move to higher data rate/speed than
>>>>>>>> the current data
>>>>>>>> rate then the controller driver may need to change certain
>>>>>>>> votes so that
>>>>>>>> link may come up at requested data rate/speed like QCOM PCIe
>>>>>>>> controllers
>>>>>>>> need to change their RPMh (Resource Power Manager-hardened) state. Once
>>>>>>>> link retraining is done controller drivers needs to adjust their votes
>>>>>>>> based on the final data rate.
>>>>>>>>
>>>>>>>> Some controllers also may need to update their bandwidth voting like
>>>>>>>> ICC BW votings etc.
>>>>>>>>
>>>>>>>> So, add pre_link_speed_change() & post_link_speed_change() op to call
>>>>>>>> before & after the link re-train. There is no explicit
>>>>>>>> locking mechanisms
>>>>>>>> as these are called by a single client Endpoint driver.
>>>>>>>>
>>>>>>>> In case of PCIe switch, if there is a request to change
>>>>>>>> target speed for a
>>>>>>>> downstream port then no need to call these function ops as these are
>>>>>>>> outside the scope of the controller drivers.
>>>>>>>
>>>>>>>> +++ b/include/linux/pci.h
>>>>>>>> @@ -599,6 +599,24 @@ struct pci_host_bridge {
>>>>>>>>         void (*release_fn)(struct pci_host_bridge *);
>>>>>>>>         int (*enable_device)(struct pci_host_bridge *bridge,
>>>>>>>> struct pci_dev *dev);
>>>>>>>>         void (*disable_device)(struct pci_host_bridge *bridge,
>>>>>>>> struct pci_dev *dev);
>>>>>>>> +    /*
>>>>>>>> +     * Callback to the host bridge drivers to update ICC BW
>>>>>>>> votes, clock
>>>>>>>> +     * frequencies etc.. for the link re-train to come up
>>>>>>>> in targeted speed.
>>>>>>>> +     * These are intended to be called by devices directly
>>>>>>>> attached to the
>>>>>>>> +     * Root Port. These are called by a single client
>>>>>>>> Endpoint driver, so
>>>>>>>> +     * there is no need for explicit locking mechanisms.
>>>>>>>> +     */
>>>>>>>> +    int (*pre_link_speed_change)(struct pci_host_bridge *bridge,
>>>>>>>> +                     struct pci_dev *dev, int speed);
>>>>>>>> +    /*
>>>>>>>> +     * Callback to the host bridge drivers to adjust ICC BW
>>>>>>>> votes, clock
>>>>>>>> +     * frequencies etc.. to the updated speed after link
>>>>>>>> re-train. These
>>>>>>>> +     * are intended to be called by devices directly attached to the
>>>>>>>> +     * Root Port. These are called by a single client Endpoint driver,
>>>>>>>> +     * so there is no need for explicit locking mechanisms.
>>>>>>>
>>>>>>> No need to repeat the entire comment.  s/.././
>>>>>>>
>>>>>>> These pointers feel awfully specific for being in struct
>>>>>>> pci_host_bridge, since we only need them for a questionable QCOM
>>>>>>> controller.  I think this needs to be pushed down into qcom somehow as
>>>>>>> some kind of quirk.
>>>>>>>
>>>>>> Currently these are needed by QCOM controllers, but it may also needed
>>>>>> by other controllers may also need these for updating ICC votes, any
>>>>>> system level votes, clock frequencies etc.
>>>>>> QCOM controllers is also doing one extra step in these functions to
>>>>>> disable and enable ASPM only as it cannot link speed change support
>>>>>> with ASPM enabled.
>>>>>>
>>>>> Bjorn, can you check this.
>>>>>
>>>>> For QCOM devices we need to update the RPMh vote i.e a power source
>>>>> votes for the link to come up in required speed. and also we need
>>>>> to update interconnect votes also. This will be applicable for
>>>>> other vendors also.
>>>>>
>>>>> If this is not correct place I can add them in the pci_ops.
>>>> Bjorn,
>>>>
>>>> Can you please comment on this.
>>>>
>>>> Is this fine to move these to the pci_ops of the bridge.
>>>> Again these are not specific to QCOM, any controller driver which
>>>> needs to change their clock rates, ICC bw votes etc needs to have
>>>> these.
>>>>
>>>
>>> No, moving to 'pci_ops' is terrible than having it in 'pci_host_bridge' IMO. If
>>> we want to get rid of these ops, we can introduce a quirk flag in
>>> 'pci_host_bridge' and when set, the bwctrl code can disable/enable ASPM
>>> before/after link retrain. This clearly states that the controller is quirky and
>>> we need to disable/enable ASPM.
>>>
>>> For setting OPP, you can have a separate callback in 'pci_host_bridge' that just
>>> allows setting OPP *after* retrain, like 'pci_host_bridge:link_change_notify()'.
>>> I don't think you really need to set OPP before retrain though. As even if you
>>> do it pre and post link retrain, there is still a small window where the link
>>> will operate without adequate vote.
>>>
>> Hi Mani,
>>
>> we need to update the OPP votes before link retrain, for example if
>> there is request  to change data rate from 5 GT/s to 8 GT/s on some
>> platforms we need to update RPMh votes from low_svs to NOM corner
>> without this clocks will not scale for data rates 8 GT/s and link
>> retrain will fail. For that reason we are trying to add pre and post
>> callbacks.
>>
> 
> If we are targetting OPP only, then can't we do direct OPP setting from the
> bwctrl driver itself? Or we also need to set ICC votes directly also (in the
> non-opp case)?
we are targeting only OPP, I can directly call OPP API's from bwctrl
driver.

As recommended, I will try to introduce a quirk flag in pci_host_bridge
to enable and disable ASPM before & after retrain. And will call OPP
API's in bwctrl driver itself.

- Krishna Chaitanya.
> 
> - Mani
> 

