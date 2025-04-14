Return-Path: <linux-arm-msm+bounces-54143-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 22304A876DD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Apr 2025 06:21:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1D02516988B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Apr 2025 04:21:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1283199EBB;
	Mon, 14 Apr 2025 04:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MI0jWEIL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CA9C19048A
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Apr 2025 04:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744604507; cv=none; b=bJFU9l7dC6cS03QRmIND/kQyQHE/4SnWLqNtZDwrJPTeU5V/JwgHM1wkZJsuI5zJnlm6iLVivNRJdZz5rE2z2bUQ6gYXF70PYV9399KUR2tXPTevytxq01ocEABSu7k4S7x0nMgAMx062HiXQfLtp87MZVK0LcHzOLFi1wWxdwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744604507; c=relaxed/simple;
	bh=TQ2XuJsuSjCYY9Sr0D87ughaklctGZthjIEj5rhAbrY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u+CquIRucmT/GdUINwukLvStFD6rPrfNQDQH00RwsfBYjR8ryICU7TSzEuLFTXj97t/B8JU3VvhkfuDV2WwVQbvbiO37y743VPn+I8PYoOuX4uoCSMOWTe0myWh7seDqh0FTB4OJ2/Bfqd2uifIsSX61JQIm6h+kOOCMVXjExqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MI0jWEIL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53DNsAL8030372
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Apr 2025 04:21:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v1062Qb00rdFXbKWOZt6famOxoqeq892jzAre1MombI=; b=MI0jWEILVHMt2AcS
	XFwlhBQRn8gK7noR6O1l4pt0l0XCxTsqqVLbNRIPp02OBaeNC6f2OyhxMcsL20cM
	OObdLxHf1NUAhGLCxCPqSKBYbU7eqZuCA0XV5hKyHnYhvWZKhJvQ7WUlWm52dqB3
	VptvArV8r9NeJZ4U40FqqLs3LY57WRaV3LmhAsG5qVdHOGvSxVBVzT+CjMpA9jq+
	R+5WbhWOHclg7eVoTMdB6TNR5J98ZCXSELa0UumVlk4lwRZMHJETnt+tWeVYAe2u
	11T5FPVPyf8CmSggkefbHAa+cJ97dqAVaeFj6Gv8plAthzCdB3pUuT68HqbSGJRo
	X3fX4A==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ydvj3erk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Apr 2025 04:21:45 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3055f2e1486so5951618a91.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 13 Apr 2025 21:21:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744604504; x=1745209304;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v1062Qb00rdFXbKWOZt6famOxoqeq892jzAre1MombI=;
        b=wWhpZ63AgLdYogfUXZ3qCn8qQvV4ppuu1P6fFAh2OdtdQIQcY33t32Pq5x7mKDa8b8
         Y60hsFjNFDMrZey7TGLziAg5t5SG9/imVah0W7iETcbtshoNoLgpDsTj+lH7lIp23A6J
         VE9mbbGdn/uPEkmD8fENXUKzm54l7LdOkil+wDtf373Mr7B8drqX3bCkK4HquBx2sdwW
         4xxC2qgn9T5eB85SybNMJdn9qQRzG3me0mzHr5Qzgn3ry/OC2+WGN6mU0Kq95HtklCaO
         sM2ePJFAHPhQ9q/xFHPunNGE9ZmVC6KwwcUo6pCftQJqe++VWgzbrrb3F7slW3EZ2ock
         AMEQ==
X-Forwarded-Encrypted: i=1; AJvYcCVLXsmsxiKognGlUYblhrbWeLPed9yvP+rKaxjsJSxBmQ/Yuq6cLXUyUWgDEb7h1h5N4R6CzpfaHPfqXtqa@vger.kernel.org
X-Gm-Message-State: AOJu0YxxONzqtSsccUuqVQx1HsbuI5KeS2SNzdMFQIQA+m63Bc0RfVAw
	q2HvgF0GmwqOfcnD5hveoz+tXShypW2OR3u/xpkmHo/EOANFnzyNkMRgpGt67imDig6Q3xRGHNI
	WP30ekZhMRxDbka5FFDVQRYgpL14kbfPIasiI4hEfhpHEyFvXEBPppOM8Ws8CfRsS
X-Gm-Gg: ASbGncsPNLG3e3REThUp2IwoGRcCinWIpDs8UvXuvv9HNh3nCynZtySZIQNfamIlNbr
	2N9RVYb767hIY3lW5XH6OB0PLPJkboAzTvsjSvGbSEb5QHPytJ/BclyxLzdWP/7AJsX125L0/IY
	66B9HR6XA8oPKL2XlukWGBiQrUVgOmpXzOnhoThhVFbVGDJkbxC7jTUgCvR0YjuAoAUMO6llxvn
	ZIdTbRW7YmP2//Ppn3x6QVoUgsgTmYFXIt66wNR5kwurGbeD7FM3wP0PPGMx7jaDqWNYMlmLBzI
	ucpO4k2U42ZrzSKCLDgYn2mD+TA0JE6WYhawINqFoA==
X-Received: by 2002:a17:90b:3808:b0:2ff:6608:78cd with SMTP id 98e67ed59e1d1-30823646b04mr16670434a91.9.1744604504087;
        Sun, 13 Apr 2025 21:21:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHgLh9KbrEwTxyAmeC0D1o+Gbjg5afrIg3u0yS7IjiKO0bk4BGXPzyV29VIQvaXYKiAsiEiIg==
X-Received: by 2002:a17:90b:3808:b0:2ff:6608:78cd with SMTP id 98e67ed59e1d1-30823646b04mr16670397a91.9.1744604503461;
        Sun, 13 Apr 2025 21:21:43 -0700 (PDT)
Received: from [10.92.199.136] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306df403d40sm10120276a91.49.2025.04.13.21.21.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Apr 2025 21:21:43 -0700 (PDT)
Message-ID: <9cc84d20-90e8-069d-db0f-21386c5b0a98@oss.qualcomm.com>
Date: Mon, 14 Apr 2025 09:51:34 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v5 7/9] PCI: PCI: Add pcie_link_is_active() to determine
 if the PCIe link is active
Content-Language: en-US
To: Lukas Wunner <lukas@wunner.de>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Krzysztof Wilczy??ski <kw@linux.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        chaitanya chundru <quic_krichai@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Jingoo Han <jingoohan1@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>, quic_vbadigan@quicnic.com,
        amitk@kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, jorge.ramirez@oss.qualcomm.com,
        Dmitry Baryshkov <lumag@kernel.org>
References: <20250412-qps615_v4_1-v5-0-5b6a06132fec@oss.qualcomm.com>
 <20250412-qps615_v4_1-v5-7-5b6a06132fec@oss.qualcomm.com>
 <Z_njmA49Gda-m0aH@wunner.de> <Z_vw_i1P_Y2gCYrR@wunner.de>
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <Z_vw_i1P_Y2gCYrR@wunner.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ZIrXmW7b c=1 sm=1 tr=0 ts=67fc8d59 cx=c_pps a=vVfyC5vLCtgYJKYeQD43oA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17 a=DLE-xEQoUa54y48t:21 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=a1gpy7YTC9TOQ5gj66gA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: 4l0DsO-qkYwANh3e4jLHWYF29t4OoF-I
X-Proofpoint-ORIG-GUID: 4l0DsO-qkYwANh3e4jLHWYF29t4OoF-I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_01,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 phishscore=0 mlxlogscore=720
 spamscore=0 impostorscore=0 malwarescore=0 mlxscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504140030



On 4/13/2025 10:44 PM, Lukas Wunner wrote:
> On Sat, Apr 12, 2025 at 05:52:56AM +0200, Lukas Wunner wrote:
>> On Sat, Apr 12, 2025 at 07:19:56AM +0530, Krishna Chaitanya Chundru wrote:
>>> Introduce a common API to check if the PCIe link is active, replacing
>>> duplicate code in multiple locations.
>>>
>>> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>>
>> Reviewed-by: Lukas Wunner <lukas@wunner.de>
> 
> Looking at this with a fresh pair of eyeballs, I realize there's an issue
> here, so unfortunately I have to retract the Reviewed-by:
> 
> pcie_link_is_active() differs from the existing pciehp_check_link_active()
> in that it returns 0 not only if the link is down, but also if the
> Config Space read returns with an error.
> 
> In particular, if Config Space of a hotplug bridge is inaccessible,
> 0 is returned instead of -ENODEV with this patch.  That can happen if
> the hotplug bridge itself has been hot-removed, which is common with
> Thunderbolt, but also on servers with nested PCIe switches.
> 
> The existing invocations of pciehp_check_link_active() do the right
> thing if the hotplug bridge has been hot-removed, but after this patch
> they no longer do.  For example in this hunk ...
> 
>>> --- a/drivers/pci/hotplug/pciehp_hpc.c
>>> +++ b/drivers/pci/hotplug/pciehp_hpc.c
>>> @@ -584,7 +557,7 @@ static void pciehp_ignore_dpc_link_change(struct controller *ctrl,
>>>   	 * Synthesize it to ensure that it is acted on.
>>>   	 */
>>>   	down_read_nested(&ctrl->reset_lock, ctrl->depth);
>>> -	if (!pciehp_check_link_active(ctrl))
>>> +	if (!pcie_link_is_active(ctrl_dev(ctrl)))
>>>   		pciehp_request(ctrl, PCI_EXP_SLTSTA_DLLSC);
>>>   	up_read(&ctrl->reset_lock);
>>>   }
> 
> ... pciehp_request() will be called if the hotplug bridge was
> hot-removed, which isn't the right thing to do.  The current
> behavior is to do nothing.
> 
> I realize I steered you in the wrong direction because in my
> review of your v4 I asked why pcie_link_is_active() doesn't
> return a bool:
> 
> https://lore.kernel.org/all/Z72TRBvpzizcgm9S@wunner.de/
> 
> So I sincerely apologize for that!  You actually did the right
> thing in v4 by returning a negative int if the Config Space read
> returned an error.
> 

Ok, No problem. I will revert v4 patch i.e returning int instead of
bool. I will wait for few days for any other new review comments.

- Krishna Chaitanya.
> Thanks,
> 
> Lukas

