Return-Path: <linux-arm-msm+bounces-99291-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WBg9KvNOwWmhSAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99291-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 15:32:19 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 306C22F4B09
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 15:32:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F1E1A3198069
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 14:11:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF8783B19B2;
	Mon, 23 Mar 2026 14:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gotw1UUJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NLnQOjl/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D6463B0AF0
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 14:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774274962; cv=none; b=SQIjZ6m53uks3jk+dCFMwLAOBX05utFUJp0mTm5x3bbmNlgz52YRA3zwoTs9uOkTouhKg5MiK+saN2kSAVMwnXf03VxAuIT0GQFUV4OuTMCCvmBNCRMKGM0vTP4417S5UdlcXs38DU/0moT0h716K7RcbuUVlPrehlpumIUn+MI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774274962; c=relaxed/simple;
	bh=/m+5W3oksIBY5ci5bS0bARrewEORtmGEJBmpfMyskuE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WWZSLQKeYdiKnrboSDlgpUxRGsRIvkYrjZS4a3vCfX9qAryfQqYmQA6mQ/FlXsjQ6MhCnPbSYjdw9dNAWhDvaTJUDboXLUsHslo1c/Jf9fJ5fbKTe0UAHuIAuTWRZJcAS11ihIt7pBB/P6yAlyDXpfVaU/nkLkg1HIeN1Vpe6ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gotw1UUJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NLnQOjl/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N83irn1364063
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 14:09:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7y0lYDMFJUqZrtd6RIbE64n8l8HgKjJixyalYogdDLo=; b=gotw1UUJJgLh+d3U
	eYNt3NZsDLfiqM2rbbUnbafpgWytI/HbgdcRA0hK9/Pinv7AsVcnhwnxkmrdXtIF
	pvHWEkHprAoxfeKcH2Y3ogkQsMu+VZbYS5dqhPe6Sv4SmRoO/MmQ9g0zqFBnOScJ
	QbiVMSPP+Tyhaepp4QdlpCEfL9afTpWoQLRTL87m18A9EqGpeDqg18I1wwS2Hkmt
	zNjrW371nPCP2nPtILcF0E0v5Vj3H8+tWOua9fbpMUZA1csSfnadu1YmDCQDUXBm
	rp2avxjQdQypgKz4NOIEWnid5FcJPQtQYYD/aWmNROt4NdZGwb2cWM+M0enAALvx
	P6ixaQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d31p799b7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 14:09:20 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b05370ec01so286237955ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 07:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774274959; x=1774879759; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7y0lYDMFJUqZrtd6RIbE64n8l8HgKjJixyalYogdDLo=;
        b=NLnQOjl/he2vh+i2/flYuNIw04Hlrrryb4jlHbuQ+9Dih5h9AKoR+1Ro1AJSx29cYb
         Pn3G8o3Vm+X1vJGObrZaCqMnTEHjL+dScLp4mxmngqsRK6COMHMbPJTElysKfQLP1Zc4
         i5Hf9hfD4oJ5sg1BX+UVfxLnBwUPIP3/Jugh/ZQurxLArAStPRFb45YJEUw/SpefWeYF
         lIsHnK/v3e+KCPz9XBxIAe8SVzHOtWJfHBGO+3a4NcMmj6179rfeuPklstNGSywlQDbb
         1Kwf/hMtSEufgimODJCqTD1bWjIXZJUG9aNXs+FMndvYBGL/K+omQX+WCkGwrMtkdN5V
         vN3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774274959; x=1774879759;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7y0lYDMFJUqZrtd6RIbE64n8l8HgKjJixyalYogdDLo=;
        b=kfFFRZfaNj98M2u7XVe9jzGgIYFGWW4elkRmpWgnrKg4GfqzjuarqN3Rjg2AORYgpS
         eDPMy+uiFTeqxYToFK/zvvR+d4DPe3YpaR/oLim6o2kzpwlU8PeGPgnkKlNy8Y8bKTrB
         L7uCGE9zDyC6fWipqysbiq36W+X7tldzmkXyXcpry9BAqj9nNnAttgR5jjJ74ldcVfN5
         z0zz4qCdjzBjitSato5MQOckUbdGcee6F36dXIrANet0+4Bjh0XjZbk7DaeUjbV9h7ai
         aHVIldMB0crBEdgb90hxipuM1ziIu+1zvFmZj61Izpd2vrzYHeZWeckucrxcQHQVmYjL
         318A==
X-Forwarded-Encrypted: i=1; AJvYcCXhNJ6Q0AEgFYSo1NcUKLm1AP0SanaxQNT0w6hdnWXtx+bidjG68YSmt0jFjqU4Wq+/r+0j60ei9Xg3mdA1@vger.kernel.org
X-Gm-Message-State: AOJu0Ywo83iT5t9SZLzH8iRV46HKH5KY0yuJ47tz5itZD4+4K66lxRbA
	tfnaEY/6redzjtpZe7BGBy6PSFCdvkaXU1PH+MdZ7NTgmJpMQnLT6J5UO0WMtbB19SY9r3AUqbz
	48srzUHXGuqM447fnAnRlP+J8D4vUMYaPZqya0M5pYDCcJ/q3V62rtIlVJwOs4/maFg0q+0fq73
	7jkKutqA==
X-Gm-Gg: ATEYQzw6jHl+5AE2kag4/6hRouPmGQc+QkCGap0m8+BOSSZYWVpuBLkGypZI+LHr9aa
	XQ1c/fhwTTWbAm4TTROM8daUgqPWp5/GE760oIJShV6HbkgHZ7P2WIRFS7Gg53gb8uBMOfNglwP
	wHapdtWm07KTJPdrMpYk6b2UY+IMnfOYKKzngHSXd4R/VXUzZ9yVTLMgGJgMG/D4UjgrnbYPoY8
	Ahxu4FH0Ka5YrltX9D399S3VrC7Ixf3qbJ4aFlP7G8TF0YjkIQxpza3dk6DPK7enJRDnedq2yzn
	XcgcQgqFlqjUnk/XRb+WVvQP8rFkfgRGTOg7o/uNph8d3J389CEYelo+0elt6eM06Mnb3TWOJaN
	H2Ey4QLgBg56PfBL/Bd2MH0f4hb7iGnDLz1NkOvSOv8oJ/2l9fy71YlEClVPFJZUgdCP9kwc1AJ
	emaiZha67J
X-Received: by 2002:a17:903:22d1:b0:2b0:6e8f:8e85 with SMTP id d9443c01a7336-2b0826d73e8mr125777115ad.5.1774274958796;
        Mon, 23 Mar 2026 07:09:18 -0700 (PDT)
X-Received: by 2002:a17:903:22d1:b0:2b0:6e8f:8e85 with SMTP id d9443c01a7336-2b0826d73e8mr125776695ad.5.1774274958149;
        Mon, 23 Mar 2026 07:09:18 -0700 (PDT)
Received: from [10.133.33.6] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b08366c443sm145231065ad.56.2026.03.23.07.09.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 07:09:17 -0700 (PDT)
Message-ID: <d8ab2410-8d67-41c2-9a11-384f4a6a8f07@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 22:09:08 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: glymur: add coresight nodes
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260318-add-coresight-dt-nodes-for-glymur-v2-1-d76e08f21fa5@oss.qualcomm.com>
 <ef89e328-fda6-43f4-b40c-8834d16e2cfd@oss.qualcomm.com>
 <7972211e-d735-4401-ada9-b83c7b96b612@oss.qualcomm.com>
 <a73af369-b122-43d2-b28f-e97ab33352c9@oss.qualcomm.com>
 <f28fe058-d1b7-4d4f-8751-54117aba95f8@oss.qualcomm.com>
 <acFGhpVWaHZtiyTq@baldur>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <acFGhpVWaHZtiyTq@baldur>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=RMC+3oi+ c=1 sm=1 tr=0 ts=69c14990 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=vii5j4Xdnaj1KWSRWHEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: 5MAE1a3TCys7GNRcjZHSK0D8NnB_qPS7
X-Proofpoint-GUID: 5MAE1a3TCys7GNRcjZHSK0D8NnB_qPS7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDEwNyBTYWx0ZWRfX5ZmC+eJ1WIhU
 ixiBLaMGh/7SXrwUxlapjtvDoXF1SLAv+D9J0UEzxYUFgKHrPgH8jx4Ivx7CArKtPEaofkPTY6F
 tmRIg3OBxJPX46JSSEc6CPg5mCT+Dsgwfs1oEmg8PwiUa/f9xPc2MVkAiMkSXE/LA8Y0ueFCbMp
 sRMCooYRvJCRFYnONZ6mDf1GB1ktx5Uqd6FRxjuFT2s5qYI9gprTgLaBypIFVRmneJdgE6/z0Ne
 1Fr2YRgn10yWePtYepnybuFqSJT0nzya4bUIEkDwrVCKoFwm/4JVkIQ3ENcwne/JCj+Et5QmY8Z
 5zUgXDqAVK+sKDlo7w3UDmKAAMTTE3nKFbPcqUTQyrgccvK17YDVQUdXGTqoWiCQLulF+24y1/H
 aOT+vugMRtisyecVGBU3b1K1PEzjgqepvVUN5P7zuuW5/y2ryPExOZXEELKHy2uzzOqqPOqM045
 pDIqmeFVuFCV0LyG7pA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_04,2026-03-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230107
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-99291-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 306C22F4B09
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/23/2026 10:03 PM, Bjorn Andersson wrote:
> On Mon, Mar 23, 2026 at 09:27:41PM +0800, Jie Gan wrote:
>>
>>
>> On 3/23/2026 9:02 PM, Konrad Dybcio wrote:
>>> On 3/23/26 1:30 PM, Jie Gan wrote:
>>>>
>>>>
>>>> On 3/23/2026 7:05 PM, Konrad Dybcio wrote:
>>>>> On 3/18/26 12:42 PM, Jie Gan wrote:
>>>>>> Add CoreSight nodes to enable trace paths like TPDM->ETF/STM->ETF.
>>>>>> These devices are part of the AOSS, CDSP, QDSS, PCIe5, TraceNoc and
>>>>>> some small subsystems, such as GCC, IPCC, PMU and so on.
>>>>>>
>>>>>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>>>>>> ---
>>>>>> Changes in V2:
>>>>>> 1. removed two cti devices due to GFX block is down
>>>>>
>>>>> i.e. "because GPU is not yet enabled"?
>>>>
>>>> Yeah, these CTI devices have clock issue for enabling due to the GPU block is not yet enabled.
>>>
>>> Do they need the GPU to be online, or a clock from GPU_CC, or
>>> maybe something else?
>>
>> We need a specific debug clock inside the GPU block. The debug clock only
>> can be enabled while GPU is online.
> 
> What happens once GPU has been delivered, but for some reason is
> inactive and we try to use this CTI device?

We will check these devices again once GPU is available. We also will 
cross check with AOP team if there is a clock enable/disable requirement 
with the specific debug clock.

> 
>> Also needs AOP to support enable/disable
>> the debug clock.
>>
> 
> When you hit such dependencies, please write and contribute the patch
> (in this case, you can do it in a separate patch/series).
> 

noted. The capability to enable/disable debug clocks is supported by 
mproc dt nodes(aoss_qmp). It will send message to AOP core to enable 
debug clocks by configuring a specific register in AOP via mailbox.

Thanks,
Jie

> Regards,
> Bjorn
> 
>>>
>>>>>>       - cti@11c42000
>>>>>>       - cti@11c4b000
>>>>>> 2. changes two TPDM devices to static:
>>>>>>       - tpdm-cdsp-cmsr
>>>>>>       - tpdm-cdsp-cmsr2
>>>>>
>>>>> They were TPDM instances in v1. What's the reason for the change?
>>>>
>>>> These TPDMs havent clock source for accessing registers. We only need enable its ports to output trace data. So I have changed them to static-TPDM compatible.
>>>
>>> The registers are clearly physically there. Are you saying that we
>>> (currently?) can't enable the clock required to access them? Or is
>>> there a design defect that's preventing us from doing so?
>>
>> It's about hardware design. Some of the TPDM devices are designed as static,
>> means we dont need access the register of the device for configuring. The
>> trace data of the static TPDM is enabled by default, we only need enable the
>> port of the connected TPDA device for receiving the data.
>>
>> I have tested these devices with Jtag attached, so I didnt observe issue
>> about these new devices in the CDSP block. (Jtag will provide debug
>> capability for all debug devices) Also cross-checked with hardware team for
>> confirming these devices are working as static.
>>
>> Thanks,
>> Jie
>>
>>>
>>> Konrad
>>>
>>


