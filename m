Return-Path: <linux-arm-msm+bounces-57653-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B1D9AB4893
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 May 2025 02:52:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9137E3B79D3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 May 2025 00:51:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B4EC155A4D;
	Tue, 13 May 2025 00:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dtlLxhxP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2637C13AD1C
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 May 2025 00:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747097519; cv=none; b=umC54H/Xi77JTb3WwY6hFxd/EhXw0Pxckfa1sPBqHxSXUFqzBtkmEl24QDDAL/Bf/09REBMJUapb4aK2eSxJro3oAW3O2EO5uCpbqLItYt25YmYcH0Ay3x4IgImRyNGNZcsk4mJSiX6yR9GFcoiV6trvcLuFDhsd4vMTv6eDEa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747097519; c=relaxed/simple;
	bh=ISOa3ZCbxtX7ipo/JbZVu6X6if1MdofJKSqsmf7+MQc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=toQlDm5OEO3iVY0/7EC0qJ4UEuIpMzNF6TRl7pAx8abHZwVWtRerJu+gtELFyuTDUUlXN2xWfF5aOvasm2ATC0eZY9IWeSOms7g0Uk4IRqq9IMkRO9aKiLSYVsipOMpsyfFsXJGAm6ahOuFPUOhKsMx4J/XrzZvDKdqyOuAXtQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dtlLxhxP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54CH9t36008801
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 May 2025 00:51:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nDxnCh60vPRm0VjC+SEPBrB9nieHT7TeGjez6fD9ygY=; b=dtlLxhxPn2XMVCYo
	oBCJze/nCwkTtAcCvlJNANubuzSz8NWtgV9xoE4d2i68FXKROu1JtGQ12a6NevCN
	6H4RVHHXUWfy/oZWMuYM4vGGszPqMsheGu+7G2zAd/XvdO1HElIuZfC++nyQWJIG
	h48LK5kbgl6Vg5+EYchWXkeo0G3exrM/33dg9lTq/2dnSXRemtnTFGqLtGYibIrM
	5w5USV+7K9oPPrwdF7ROhlaSLsu/IWGIbmTbE5Ql8/8HVGVQT62VY1NTO5qmTseN
	B2hvBnBKogA8vf3rGQBGAFhYp9pjIxeFuwC0pCsQV3sR3nlD5Wj7luL9bq3WLFuH
	sbR/9w==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46hyjjnwss-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 May 2025 00:51:56 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-30c371c34e7so4169527a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 May 2025 17:51:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747097515; x=1747702315;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nDxnCh60vPRm0VjC+SEPBrB9nieHT7TeGjez6fD9ygY=;
        b=nFlTyQeCtOOj6/TgLcrGHewsXN6Hqehmkk8n/oNlEvrIf0t+xD7H27YYnXM58ciTBA
         w/XJkTTqvo9bQsAV0/lYwoUBvRS+3Jx8f1qhITny1NCO2WIAvemHRvxgn5lqKAxHxSqU
         8M9xrHyRvWC85vs569jmshoHP1k8/6AYwmOGnlR9yJN0kRwBsygxaiC0PmDOMdoW9ahY
         mL6Pivaxt2UqwvAWczeHyqn1i0z4Ex4gcHA7nFEZeUlltaI3XvTG9innRpEI+aDrRlOg
         T+0UJyNOAwOI0tDpfbZU0if0DVWfE/g54mReWuqXLijDemyTWTdjfCfJchb/nYIRsj4y
         lJoQ==
X-Forwarded-Encrypted: i=1; AJvYcCXlRZY4B5QsT2bxQgT6g9lbjM4QYK2LLZ0CaMZVOHwQkuSGLrdhp/GjQOFznrBS961mm1yf65I6+Gh9cIcF@vger.kernel.org
X-Gm-Message-State: AOJu0YwFWZHnQ0RbGSIll5bFc8TSUwCLKJ+fciYphY8fCOysOZhJJKUH
	JfGPcAiPEDXXuvFuckcCNQBR/Pc5s9gPntDxG1znVsoJi0SLPL90jsZqS9dz5VvSlOSHbjT3Fm6
	KHkq+2al8CA9phTfTByqydQbl6bLeLrRfgefjSfnhEXcA6bggswKckFzEOPP0cW+e
X-Gm-Gg: ASbGncscteyu14oCU+yVlK1Agh11aX1emuKSGM4APHODPC0sGJb1U5h1uscJDwOaBl6
	asX4sm6HIT/1koRpamI+up+5qk2zKlIRpvxV4Mk+0gp/NBh4zlA9sXD8UMCEEjrHEKk/nS0RSq2
	iyvKNAZiOZLGP1hueb2dcfgFMRNRxsC11Ih8mPz16IbJeaNiidQv0hqgs9QbkxUTgJlCjYLznnN
	hSUzwTaKfsqknTwlfNGoQUHqPeJAt6rjaBU6rWY+nSunnWB3tfH25YsVEBtgaY0ydqrZ79VC0MN
	kKy3imIQnS8MmkZjjJKV6WsTM/7nXhSufBzv1piKJIg=
X-Received: by 2002:a17:90b:184b:b0:301:c5cb:7b13 with SMTP id 98e67ed59e1d1-30c3cb1c698mr22067239a91.3.1747097514865;
        Mon, 12 May 2025 17:51:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFgI6nMT44t5MQgKZdPXQhBY+IX81QIicq5fXG0Aagtqzgle9954lEiXp0HQo8l3ppmVUtRuQ==
X-Received: by 2002:a17:90b:184b:b0:301:c5cb:7b13 with SMTP id 98e67ed59e1d1-30c3cb1c698mr22067204a91.3.1747097514374;
        Mon, 12 May 2025 17:51:54 -0700 (PDT)
Received: from [192.168.29.92] ([49.43.230.199])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30e10188161sm153717a91.0.2025.05.12.17.51.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 May 2025 17:51:54 -0700 (PDT)
Message-ID: <accbe6ad-52d7-9e4f-c5cb-de7f67b5c990@oss.qualcomm.com>
Date: Tue, 13 May 2025 06:21:45 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [RESEND PATCH v6] PCI: PCI: Add pcie_link_is_active() to
 determine if the PCIe link is active
Content-Language: en-US
To: =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: linux-pci@vger.kernel.org, Lukas Wunner <lukas@wunner.de>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Rob Herring <robh@kernel.o>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        chaitanya chundru <quic_krichai@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Jingoo Han <jingoohan1@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>, quic_vbadigan@quicnic.com,
        amitk@kernel.org, devicetree@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>, linux-arm-msm@vger.kernel.org,
        jorge.ramirez@oss.qualcomm.com, Dmitry Baryshkov <lumag@kernel.org>,
        Timothy Pearson <tpearson@raptorengineering.com>
References: <20250509180813.2200312-1-sanastasio@raptorengineering.com>
 <84ce803d-b9b6-0ae7-44fa-c793dca06421@linux.intel.com>
 <9b662513-2c71-8829-3ec8-c789a919809a@oss.qualcomm.com>
 <195d17db-6573-181f-a592-195f6fdbeee1@linux.intel.com>
 <ffaa3bc3-b8b4-6962-40d6-6d4784a47c19@linux.intel.com>
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <ffaa3bc3-b8b4-6962-40d6-6d4784a47c19@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEzMDAwNiBTYWx0ZWRfX480EM695qEOi
 PXIO0Ss4jN1jMF+H1e9a/sCOAlsYeG0ShxcdTkwcDPe5zXI7DCtVm2guSrG9HYWlH2G8uhfELO4
 wiK1Sq54vae0lnsV97EslTce6KA6oFXYbntqIDLHAg1RexkPdKvFPQE7vvlg+XANejLboG0k0wU
 zE5l1l6MDwNcy1hsMtbOHP10p7Fyt1VirdC5gJ1kFsRYBnpX8Zu6LxM34hv+UkCKqL7Nt6tF5la
 pLuqmfuW3fyIkI/NVOWECa9SFtP4uO5Bgv4l+KLdkwbSrL5Q7SI9nZa3h4epFRIA/FAMHZX2aGl
 Y/NAAwAq3Z1kyqv1WT81ao6M7akJBApf6UUvfAm7C2MJXYcPW59+Af57NSdZRYC/J6IsyerkSNZ
 EQjzXSJ2idQnOpN4CV9e2hioi+0v1kMWE5qdYPc0tGatP/yTkZhl+V/jcr+cxkeFVYT7XeKx
X-Proofpoint-GUID: cqCaIWcIugQngOPKySV-r-k8P5q_bbJT
X-Authority-Analysis: v=2.4 cv=QuVe3Uyd c=1 sm=1 tr=0 ts=682297ac cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=m9Fid+qPLYWXQ4ltJ96dlQ==:17
 a=DLE-xEQoUa54y48t:21 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=_AprYWD3AAAA:8 a=b57Cl375s4j98VpQt8QA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22 a=fKH2wJO7VO9AkD4yHysb:22
X-Proofpoint-ORIG-GUID: cqCaIWcIugQngOPKySV-r-k8P5q_bbJT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_07,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 spamscore=0 phishscore=0
 mlxlogscore=999 impostorscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 bulkscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505130006



On 5/12/2025 10:54 PM, Ilpo Järvinen wrote:
> On Mon, 12 May 2025, Ilpo Järvinen wrote:
> 
>> On Mon, 12 May 2025, Krishna Chaitanya Chundru wrote:
>>
>>>
>>>
>>> On 5/12/2025 5:20 PM, Ilpo Järvinen wrote:
>>>> On Fri, 9 May 2025, Shawn Anastasio wrote:
>>>>
>>>> In shortlog:
>>>>
>>>> PCI: PCI: ... -> PCI: ...
>>>>
>>>>> From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>>>>>
>>>>> Date: Sat, 12 Apr 2025 07:19:56 +0530
>>>>>
>>>>> Introduce a common API to check if the PCIe link is active, replacing
>>>>> duplicate code in multiple locations.
>>>>>
>>>>> Signed-off-by: Krishna Chaitanya Chundru
>>>>> <krishna.chundru@oss.qualcomm.com>
>>>>> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
>>>>> ---
>>>>> (Resent since git-send-email failed to detect the Subject field from the
>>>>> patch
>>>>> file previously -- apologies!)
>>>>>
>>>>> This is an updated patch pulled from Krishna's v5 series:
>>>>> https://patchwork.kernel.org/project/linux-pci/list/?series=952665
>>>>>
>>>>> The following changes to Krishna's v5 were made by me:
>>>>>     - Revert pcie_link_is_active return type back to int per Lukas' review
>>>>>       comments
>>>>>     - Handle non-zero error returns at call site of the new function in
>>>>>       pci.c/pci_bridge_wait_for_secondary_bus
>>>>>
>>>>>    drivers/pci/hotplug/pciehp.h      |  1 -
>>>>>    drivers/pci/hotplug/pciehp_ctrl.c |  2 +-
>>>>>    drivers/pci/hotplug/pciehp_hpc.c  | 33 +++----------------------------
>>>>>    drivers/pci/pci.c                 | 26 +++++++++++++++++++++---
>>>>>    include/linux/pci.h               |  4 ++++
>>>>>    5 files changed, 31 insertions(+), 35 deletions(-)
>>>>>
>>>>> diff --git a/drivers/pci/hotplug/pciehp.h b/drivers/pci/hotplug/pciehp.h
>>>>> index 273dd8c66f4e..acef728530e3 100644
>>>>> --- a/drivers/pci/hotplug/pciehp.h
>>>>> +++ b/drivers/pci/hotplug/pciehp.h
>>>>> @@ -186,7 +186,6 @@ int pciehp_query_power_fault(struct controller *ctrl);
>>>>>    int pciehp_card_present(struct controller *ctrl);
>>>>>    int pciehp_card_present_or_link_active(struct controller *ctrl);
>>>>>    int pciehp_check_link_status(struct controller *ctrl);
>>>>> -int pciehp_check_link_active(struct controller *ctrl);
>>>>>    void pciehp_release_ctrl(struct controller *ctrl);
>>>>>
>>>>>    int pciehp_sysfs_enable_slot(struct hotplug_slot *hotplug_slot);
>>>>> diff --git a/drivers/pci/hotplug/pciehp_ctrl.c
>>>>> b/drivers/pci/hotplug/pciehp_ctrl.c
>>>>> index d603a7aa7483..4bb58ba1c766 100644
>>>>> --- a/drivers/pci/hotplug/pciehp_ctrl.c
>>>>> +++ b/drivers/pci/hotplug/pciehp_ctrl.c
>>>>> @@ -260,7 +260,7 @@ void pciehp_handle_presence_or_link_change(struct
>>>>> controller *ctrl, u32 events)
>>>>>    	/* Turn the slot on if it's occupied or link is up */
>>>>>    	mutex_lock(&ctrl->state_lock);
>>>>>    	present = pciehp_card_present(ctrl);
>>>>> -	link_active = pciehp_check_link_active(ctrl);
>>>>> +	link_active = pcie_link_is_active(ctrl->pcie->port);
>>>>>    	if (present <= 0 && link_active <= 0) {
>>>>>    		if (ctrl->state == BLINKINGON_STATE) {
>>>>>    			ctrl->state = OFF_STATE;
>>>>> diff --git a/drivers/pci/hotplug/pciehp_hpc.c
>>>>> b/drivers/pci/hotplug/pciehp_hpc.c
>>>>> index 8a09fb6083e2..278bc21d531d 100644
>>>>> --- a/drivers/pci/hotplug/pciehp_hpc.c
>>>>> +++ b/drivers/pci/hotplug/pciehp_hpc.c
>>>>> @@ -221,33 +221,6 @@ static void pcie_write_cmd_nowait(struct controller
>>>>> *ctrl, u16 cmd, u16 mask)
>>>>>    	pcie_do_write_cmd(ctrl, cmd, mask, false);
>>>>>    }
>>>>>
>>>>> -/**
>>>>> - * pciehp_check_link_active() - Is the link active
>>>>> - * @ctrl: PCIe hotplug controller
>>>>> - *
>>>>> - * Check whether the downstream link is currently active. Note it is
>>>>> - * possible that the card is removed immediately after this so the
>>>>> - * caller may need to take it into account.
>>>>> - *
>>>>> - * If the hotplug controller itself is not available anymore returns
>>>>> - * %-ENODEV.
>>>>> - */
>>>>> -int pciehp_check_link_active(struct controller *ctrl)
>>>>> -{
>>>>> -	struct pci_dev *pdev = ctrl_dev(ctrl);
>>>>> -	u16 lnk_status;
>>>>> -	int ret;
>>>>> -
>>>>> -	ret = pcie_capability_read_word(pdev, PCI_EXP_LNKSTA, &lnk_status);
>>>>> -	if (ret == PCIBIOS_DEVICE_NOT_FOUND || PCI_POSSIBLE_ERROR(lnk_status))
>>>>> -		return -ENODEV;
>>>>> -
>>>>> -	ret = !!(lnk_status & PCI_EXP_LNKSTA_DLLLA);
>>>>> -	ctrl_dbg(ctrl, "%s: lnk_status = %x\n", __func__, lnk_status);
>>>>> -
>>>>> -	return ret;
>>>>> -}
>>>>> -
>>>>>    static bool pci_bus_check_dev(struct pci_bus *bus, int devfn)
>>>>>    {
>>>>>    	u32 l;
>>>>> @@ -467,7 +440,7 @@ int pciehp_card_present_or_link_active(struct
>>>>> controller *ctrl)
>>>>>    	if (ret)
>>>>>    		return ret;
>>>>>
>>>>> -	return pciehp_check_link_active(ctrl);
>>>>> +	return pcie_link_is_active(ctrl_dev(ctrl));
>>>>>    }
>>>>>
>>>>>    int pciehp_query_power_fault(struct controller *ctrl)
>>>>> @@ -584,7 +557,7 @@ static void pciehp_ignore_dpc_link_change(struct
>>>>> controller *ctrl,
>>>>>    	 * Synthesize it to ensure that it is acted on.
>>>>>    	 */
>>>>>    	down_read_nested(&ctrl->reset_lock, ctrl->depth);
>>>>> -	if (!pciehp_check_link_active(ctrl))
>>>>> +	if (!pcie_link_is_active(ctrl_dev(ctrl)))
>>>>>    		pciehp_request(ctrl, PCI_EXP_SLTSTA_DLLSC);
>>>>>    	up_read(&ctrl->reset_lock);
>>>>>    }
>>>>> @@ -884,7 +857,7 @@ int pciehp_slot_reset(struct pcie_device *dev)
>>>>>    	pcie_capability_write_word(dev->port, PCI_EXP_SLTSTA,
>>>>>    				   PCI_EXP_SLTSTA_DLLSC);
>>>>>
>>>>> -	if (!pciehp_check_link_active(ctrl))
>>>>> +	if (!pcie_link_is_active(ctrl_dev(ctrl)))
>>>>>    		pciehp_request(ctrl, PCI_EXP_SLTSTA_DLLSC);
>>>>>
>>>>>    	return 0;
>>>>> diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
>>>>> index e77d5b53c0ce..3bb8354b14bf 100644
>>>>> --- a/drivers/pci/pci.c
>>>>> +++ b/drivers/pci/pci.c
>>>>> @@ -4926,7 +4926,6 @@ int pci_bridge_wait_for_secondary_bus(struct pci_dev
>>>>> *dev, char *reset_type)
>>>>>    		return 0;
>>>>>
>>>>>    	if (pcie_get_speed_cap(dev) <= PCIE_SPEED_5_0GT) {
>>>>> -		u16 status;
>>>>>
>>>>>    		pci_dbg(dev, "waiting %d ms for downstream link\n", delay);
>>>>>    		msleep(delay);
>>>>> @@ -4942,8 +4941,7 @@ int pci_bridge_wait_for_secondary_bus(struct pci_dev
>>>>> *dev, char *reset_type)
>>>>>    		if (!dev->link_active_reporting)
>>>>>    			return -ENOTTY;
>>>>>
>>>>> -		pcie_capability_read_word(dev, PCI_EXP_LNKSTA, &status);
>>>>> -		if (!(status & PCI_EXP_LNKSTA_DLLLA))
>>>>> +		if (pcie_link_is_active(dev) <= 0)
>>>>>    			return -ENOTTY;
>>>>>
>>>>>    		return pci_dev_wait(child, reset_type,
>>>>> @@ -6247,6 +6245,28 @@ void pcie_print_link_status(struct pci_dev *dev)
>>>>>    }
>>>>>    EXPORT_SYMBOL(pcie_print_link_status);
>>>>>
>>>>> +/**
>>>>> + * pcie_link_is_active() - Checks if the link is active or not
>>>>> + * @pdev: PCI device to query
>>>>> + *
>>>>> + * Check whether the link is active or not.
>>>>> + *
>>>>> + * Return: link state, or -ENODEV if the config read failes.
>>>>
>>>> "link state" is bit vague, it would be better to document the values
>>>> returned more precisely.
>>>>
>>>>> + */
>>>>> +int pcie_link_is_active(struct pci_dev *pdev)
>>>>> +{
>>>>> +	u16 lnk_status;
>>>>> +	int ret;
>>>>> +
>>>>> +	ret = pcie_capability_read_word(pdev, PCI_EXP_LNKSTA, &lnk_status);
>>>>> +	if (ret == PCIBIOS_DEVICE_NOT_FOUND || PCI_POSSIBLE_ERROR(lnk_status))
>>>>> +		return -ENODEV;
>>>>> +
>>>>> +	pci_dbg(pdev, "lnk_status = %x\n", lnk_status);
>>>>> +	return !!(lnk_status & PCI_EXP_LNKSTA_DLLLA);
>>>>> +}
>>>>> +EXPORT_SYMBOL(pcie_link_is_active);
>>>>> +
>>>>>    /**
>>>>>     * pci_select_bars - Make BAR mask from the type of resource
>>>>>     * @dev: the PCI device for which BAR mask is made
>>>>> diff --git a/include/linux/pci.h b/include/linux/pci.h
>>>>> index 51e2bd6405cd..a79a9919320c 100644
>>>>> --- a/include/linux/pci.h
>>>>> +++ b/include/linux/pci.h
>>>>> @@ -1945,6 +1945,7 @@ pci_release_mem_regions(struct pci_dev *pdev)
>>>>>    			    pci_select_bars(pdev, IORESOURCE_MEM));
>>>>>    }
>>>>>
>>>>> +int pcie_link_is_active(struct pci_dev *dev);
>>>>
>>>> Is this really needed in include/linux/pci.h, isn't drivers/pci/pci.h
>>>> enough (for pwrctrl in the Krishna's series)?
>>>>
>>> As this is generic functions, the endpoint drivers can also
>>> use this API to check if link is active or not in future.
>>
>> Hi again,
>>
>> Shouldn't the endpoint drivers use the generic RPM interfaces, not mess
>> with the Link state themselves? If Link is found to be up using this
>> function, how does that prove what's the state of the link the next
>> moment? To me this does not look like a very safe interface to be used by
>> the endpoint drivers.
>
I looked to net drivers, I see there are places which use this [1].

> Now I even noticed that little detail got removed from the kerneldoc while
> moving the function. Why?
Shawn, can you add the removed details back.

[1]: 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/net/wwan/iosm/iosm_ipc_pcie.c?h=v6.15-rc6#n178

- Krishna Chaitanya.
> 

