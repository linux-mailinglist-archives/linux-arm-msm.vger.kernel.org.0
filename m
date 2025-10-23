Return-Path: <linux-arm-msm+bounces-78500-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 74E15C000B4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 10:57:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 77ED24FDFF1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 08:57:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 851CC3043CF;
	Thu, 23 Oct 2025 08:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pBU9ZY1U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDBA7304962
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 08:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761209846; cv=none; b=imZks8RQURwBF8aSG4LoZsve4R5GCpMYkJDMpZUjVTYm5Gvgm3LNWfD3IAEJTqyADlBMsHIym+Wq5uqS3fTPl5yo/eMMMVYIFBP/0NVRU6zf0Ahy5L4ksq99FuBCTD1wPPqWboXTpH+I9DrliGc6E8J0UubNLdJ19I3z6BLCK2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761209846; c=relaxed/simple;
	bh=GN8FHCsrsPnDNWstdMgMgM/l7uURXyrK0WDb4zEmAmE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bPnVECrQqob9S+8C+LSUmSLomsekH0YdFMtOdFTLvGVZdCqKsFNBn2HM2l4NjE4sdSmnCso3szUNDg+kHFzl8yJ6SRY1sK1xzTetNdWjYy1AXW53jD3iJMbnwmJ8+UrJAEWQVadLYtFpS5rmxUyAP1YXNhhfqIk6hG4TB02yN20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pBU9ZY1U; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N7Us0l027193
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 08:57:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yGLPkdsVaasKwnR6ZtrxVHVvAanH3ZikRwOR3VNhX1c=; b=pBU9ZY1UM7qHuYvh
	nRSr+rR21jVYqn0+Vo/i2VtWVnH4i0xpxsbekNd3ZutuSt3Wi2WMa5Bfl9BHlXWg
	pJBORb5DQKUsqH+D3xBSP3Vwi9JJhOkV6hJAr05Nd/UC7MLx4XcjF7voqQ440/BB
	JmzQjLTFyftjIOX8CWr/RF4H2QVGywxG/RqHimPKPDTQQe283cVaFR4eDy4LGm+e
	eyP5XKzVqiWzqvtb+QoECRputQ+bDCpDxMtETDG7Xt/+b5eihr9PI9bYx4+vS94A
	c3oaPnSRP0/9szRWD3QSl2llTp3rx3/2l7wNNZCdlfB+sDC8rPNtoqh9OH1rXuC5
	caR7Nw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49y5x8ht5t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 08:57:23 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-286a252bfbfso16746605ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 01:57:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761209843; x=1761814643;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yGLPkdsVaasKwnR6ZtrxVHVvAanH3ZikRwOR3VNhX1c=;
        b=AFckFraz58Hbe+LF4S5+HZHnjLN0jZNR5epgIjLEcHD03i+r04vUX0h+d5uoQKnz/a
         rQ3f5Qqq9YVxqk+/v2oC0w+69FS1oV4Ya/9ohjhEkQPxUTuOb6z6zhhffBuJOhymY2m5
         Tl5UhWWlgB4a/p8PdYP0DrqhRfb7jdloXQxBIz2iSgcDilX4O63NB0+XPHX963S2H0ZF
         SBb8z/j5V6hTbrO0dS/SwwumTbemBRZ/WBEwZpn9SfsCc3ujrt7MsXgwjQWuJzJ2Gl62
         lkMcKUiWF91VSSQB+dLNhm7t3Biv+6AAbG6Yg1xZTwIwp5kXCSMCM1R6rGluNifHPMua
         M3Yw==
X-Forwarded-Encrypted: i=1; AJvYcCV67ZsH6qiysH9G0gfW2TI2EGuUnhwXDUPymQPZwcjA7CVN7azF0wuSUNdSEGA1bi1txZGFxEM8AvuEm767@vger.kernel.org
X-Gm-Message-State: AOJu0YwqZzgxf6RpvpBOXKEDii2dRiuRV4mjdltb/VAtzzQhqvCJdXXH
	QB4WVIk4E2R0xx+VlFj6h0JsUkPxJFo4qyKRArLPv4KJLpXnJ1ktmZLPOFhUOcgi9Ho2yxKlxnX
	DUyX0jG+4Ljbr6kvY38kTrT6zgifKg+M0BiAwjganN9Z5h4WYBoxvw94jd/AbavYo3gcT
X-Gm-Gg: ASbGncskOwlV+gpj2nxfmaOOSbuiJQxguaIjZoysGrHLqLVjoVncgo+32cDg0Rau9Iq
	DpJM+S63m3uEWJEiw1HDLNLITI1LpC0R98coWFTcCjxprjD4OTKS3Lxutj4O9N00OXIQxEswLNy
	HkOvBWHalHkxEQkV8Z9BFxYrK5aFgQAKOTvKODQfSu19+Je06uKYBw2D386ryPvZmsMc9Aekp/s
	Tzwfh6hEUzeSw67OsiJkxuxhscYzvREONhrnN1Tl38zuE8739kLdn2CYpliW1LNbKPGQiUJx3//
	o3MNySsTF8HuJS1o1UPE05XNpA0IPzTc0nrACMVXE5auu8lurTe192JAXYemD/yZU1lzokMUZAw
	1rsI68xSHJLntrS375CGR09o=
X-Received: by 2002:a17:902:8696:b0:290:ab61:6a4a with SMTP id d9443c01a7336-290c9cb6289mr200060385ad.13.1761209842702;
        Thu, 23 Oct 2025 01:57:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGn+sb0Mvygut+Ymh970tn+M8ZVtZ/Q8b0BK2KOaDZWHjuN7b9AbEljFsPZ1XZeFM9t8iBkRA==
X-Received: by 2002:a17:902:8696:b0:290:ab61:6a4a with SMTP id d9443c01a7336-290c9cb6289mr200060255ad.13.1761209842268;
        Thu, 23 Oct 2025 01:57:22 -0700 (PDT)
Received: from [10.217.199.21] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2946de1a6e3sm16303325ad.52.2025.10.23.01.57.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Oct 2025 01:57:21 -0700 (PDT)
Message-ID: <cb361d77-6845-45c9-b418-67649880495e@oss.qualcomm.com>
Date: Thu, 23 Oct 2025 14:27:18 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] soc: qcom: rpmh: Add support to read back resource
 settings
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251022-add-rpmh-read-support-v2-0-5c7a8e4df601@oss.qualcomm.com>
 <20251022-add-rpmh-read-support-v2-2-5c7a8e4df601@oss.qualcomm.com>
 <litd6qcxuios7uwwcrz55ea24kj26onrjo2aekouynsce6wslj@vatjbulg64mb>
 <4831d12b-a42a-464a-a70f-e0e40cf4ae4b@oss.qualcomm.com>
 <5c0b4712-4a54-4a1a-ad73-dc3bdb21a0ff@oss.qualcomm.com>
Content-Language: en-US
From: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>
In-Reply-To: <5c0b4712-4a54-4a1a-ad73-dc3bdb21a0ff@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: EERwhaHBln7t_ODoN6VBDjbwpKCDWqNe
X-Proofpoint-GUID: EERwhaHBln7t_ODoN6VBDjbwpKCDWqNe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIyMDE2NCBTYWx0ZWRfX42fGAzTZXrEZ
 XT8/3mwV6ppabRpCS9xL8GXMQTs+BrZ3JrmVq4Ycw/sdRmreQKl+ROK5eAlpbQdFFfNjbx7ebQj
 YjQ2R1rWr9xjQ9/fAIYnMOyV+b81Cj4MiiVCszo6X59T6gUGoRYt2d2c8hmbw1rHsv4yazjvod0
 HCI6LXXtFpgGB/mtcHXpUisbjLDC2ejAhrHjuKb65ZMWQf0l4QdlT820O8dpEN6l10AJSKxDx+d
 LHW0OhHYTkuu3arQlOnaktuw5fkTJ0lr3GpHE8VzhsMx5Nwmpz+wrYyOim8QTDaw0R4oQty4hlT
 dYktRqiq/+1tCPXMIRwhAY1vWJ0/wgceG2YMmrqK6nnLFkc4ADd+pqpFlM59dNbI8A4OcTwP6SQ
 jvGRq9SrDgZPhMrjxPrBEC00FV9rcA==
X-Authority-Analysis: v=2.4 cv=UOTQ3Sfy c=1 sm=1 tr=0 ts=68f9edf3 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=YAA2XIu200uozTIaui8A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510220164



On 10/23/2025 1:47 PM, Konrad Dybcio wrote:
> On 10/23/25 6:46 AM, Maulik Shah (mkshah) wrote:
>>
>>
>> On 10/23/2025 2:51 AM, Bjorn Andersson wrote:
>>> On Wed, Oct 22, 2025 at 02:38:54AM +0530, Kamal Wadhwa wrote:
>>>> From: Maulik Shah <maulik.shah@oss.qualcomm.com>
>>>>
>>>> All rpmh_*() APIs so far have supported placing votes for various
>>>> resource settings but the H/W also have option to read resource
>>>> settings.
>>>>
>>>> This change adds a new rpmh_read() API to allow clients
>>>> to read back resource setting from H/W. This will be useful for
>>>> clients like regulators, which currently don't have a way to know
>>>> the settings applied during bootloader stage.
>>>>
>>>
>>> Allow me to express my disappointment over the fact that you sat on this
>>> for 7 years!
>>
>> This was a dead API (even in downstream) with no user since SDM845/ 7 years.
>> Read support was eventually removed from downstream driver too for the same reason.
>> There were early discussions to remove read support from RSC H/W, due to lack of users.
>> Its not realized yet and all SoCs still supports read.
> 
> Can we read BCM states from HLOS this way too?

Yes, Any of ARC/BCM/VRM can be read to get HLOS/DRV2 votes.

Thanks,
Maulik

> 
> Konrad


