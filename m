Return-Path: <linux-arm-msm+bounces-68639-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA86B21BFE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 06:06:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 921811A21F36
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 04:06:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5AE32DD5E0;
	Tue, 12 Aug 2025 04:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YCQyUwCo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 422FB29BD8A
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 04:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754971561; cv=none; b=aGwKgnRI08rSSJhpRQGDob0CIQuowsMXzLhXtIffcZhwoL7aX2CdlcmgRJZuSOasAxbixtdNNP40q7e92pUCvOnijkIlKPLnolJFUIMAdpEpzr/LG8VPzIpvxr8ZC/06Ao01w6MdbSQo5LAHI8kfcjtGFs4EcwLpPo5rFAaZ7iY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754971561; c=relaxed/simple;
	bh=WC3xKRFbFoIyAD+juOEawzsXMLiazvMDa0Q3SLNHV/E=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=k4f54+JkDX9mrjogOfKjdEG+JAg394HQQrgegPl5NI/hGPX9qQgwAOGpEco1wDI2OSLnrM5c6q0opODfifZBBKfwv2FoSfAK8JLufrD+0mKOoNsMv1Vxnnuysi8SJ/SiVf9ZaAurzV5dEFBtpNYO9BXpT1PZ+pK55wqi7Sn8X5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YCQyUwCo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57C452Ux013107
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 04:05:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TVdaV7O5QbbmRET9jFm6kPgE4pGSGAvlJcTe/DiS6tc=; b=YCQyUwCo8ud3Hlpb
	Z+pLydzPldhjjQuanYvej4qNij+OKrtrtcINy6rdFrCDiN1i4Fn/QYRB1X2Odbww
	CbtafMcIIQaP8KN/nogqHFaKbqiyhnv2sAc0p2iwRakDEtt7pqO1yZAHGoIM41Mv
	RfRj4MToOyady+6MqfAxuf+Xu6UIvP57D9MV4t0cu5QWrWXPZguHZj2RYuEbSUDf
	6rbFHera3SLa1IKluTBqmiFa/5NvyzqNrsu1RcF8UMpyG6IPsbaBJWXhelvooHt6
	TR+l5nn+1zjJFqLw61eTxoucAUpi9Nh3DJ7Digt8dIHh2UU24ekPxAzCmiUyLC9d
	6u1AVg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dupmpun5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 04:05:58 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-31ebadfb7f2so4842754a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 21:05:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754971557; x=1755576357;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TVdaV7O5QbbmRET9jFm6kPgE4pGSGAvlJcTe/DiS6tc=;
        b=JKf1zo7wfjyxM+6NpZR/MyGGUskUUPnoSteJXC4+nxaRsDa9Yc7Iy0Q1DmLpbkXwku
         of+wefI6FhEpFZ1YyQLOL0hoDFNf+6whGoZCaW48XbTdzmdE1DImUu2b2xzjmPe7LfAB
         BzsCH4gJSAGrh2ga4hAdFxaPN+xHBUVwWXoJiT/z7FCCrJ167U5ssdIramzy9hC4j0Qa
         dXCtcTOKvwjttr352Y9U5ROavO/HyiLRvGiEeq/IvFI3LvxHNtrxtKk4a16uX36DJXt2
         iOAIqXC6DYdwuWhJTt9yuMWa5RCtSkmMCpg6P1T2tL7Z4Q6GU7NgwOeKsTa6HrtOSBwq
         9aZg==
X-Forwarded-Encrypted: i=1; AJvYcCVCEV6UgvSVhKL3ajhuPoV5B9oT552Rh2DH/10oFRIG5yw6mhv64uNFpPGSRN+US9bnLQ6uXvSju1WMg241@vger.kernel.org
X-Gm-Message-State: AOJu0YxlPBAIlKTu4wKvDoHs32+eKLy30jBmsaQEMJsYA2ma+kQ18QV4
	QN14R8ZscI4nYlI/cilRnSQWDdWmDUuDoVxcniFdmwdJBa5BgMR/N39KmC2kS3MSLQbRNTprbEh
	A5tdzMvUvpnSc/TOClsiO/N8BOBTdOv7YUqvP/LpzIh+bf+n7bkBKJ9ScLN7RJhnqwf3A
X-Gm-Gg: ASbGnctk7QDFnSUG+8UAWie9QMu5VFmlW/boQPXxTViVlo/abtSLEvDTMg3uJ3Q7k3T
	WVYsMhYk+u2kbDgfNRxfZGnRYIX7Y36Ls4Yh3/0hjCn1EVfOflJfT2DK+qINp3NrPwKmGltCC7M
	VieVolLQTYVpVmovDM6mJbL0iZKPD3t5J77RYd9BHIcCEwC3KtSQWZLlBEqKkoGGDz7UVY7OHd6
	NwQQiXn9Xw3llM+euq0Ai+EC3SRk+3/SMD/ZDp55Mkow/KZDbTDKOjIOzAj4ghhTsyak7OnQ+Yz
	aKvid7CpVGpNBm5l6T/Z0gtzcCYtw3ZKm1cXiQhhRWII7PWlUewXK0iZWVNCkBzxqTZCOh4ODg=
	=
X-Received: by 2002:a17:903:2985:b0:240:640a:c576 with SMTP id d9443c01a7336-242fc232fa2mr27392795ad.15.1754971557486;
        Mon, 11 Aug 2025 21:05:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFWpOgn5/oSzjBCGtryF075Bdr0I0B0VxEDiPRvky8kDJfG/nc/HyC5WphsedOMXvkIvnZC7g==
X-Received: by 2002:a17:903:2985:b0:240:640a:c576 with SMTP id d9443c01a7336-242fc232fa2mr27392415ad.15.1754971557017;
        Mon, 11 Aug 2025 21:05:57 -0700 (PDT)
Received: from [10.218.42.132] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241d1ef67aesm288305795ad.6.2025.08.11.21.05.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Aug 2025 21:05:56 -0700 (PDT)
Message-ID: <68a78904-e2c7-4d4d-853d-d9cd6413760e@oss.qualcomm.com>
Date: Tue, 12 Aug 2025 09:35:46 +0530
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
 <d4078b6c-1921-4195-9022-755845cdb432@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <d4078b6c-1921-4195-9022-755845cdb432@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=bY5rUPPB c=1 sm=1 tr=0 ts=689abda6 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=uIe58MKiAmNDZ2YlfJsA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: fXR6ixFjL-UkFIMacyMuQUoSSmNahriJ
X-Proofpoint-ORIG-GUID: fXR6ixFjL-UkFIMacyMuQUoSSmNahriJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAwMCBTYWx0ZWRfX7N/JHRn+zWCV
 v1LY/nb623AYSa2tzA6s0CGiUz1vZOaJp1PghMiX8s2/nB30jj+MHlEfceA/f1f7/Ss7sudPgK9
 Kwsk8bx3eqAKYlK6nyuk8QVdtMnzJBr8qnnYB8v63NH2PecgvtLmy2xl0F0XNYMhXfIzy+kCDaz
 tEU6dRzBiJVlzOGDsTuv/as3zLfHzhegLbqBOGNonqDIWXP872iWSvYVcgt8bkkcizQQseDken0
 vGiErlaLPIzsE2/Tqbpqi85piojBcSThh1Ct5FKs3kM/L8lalEI7ZXj5Ft5hmYOr2Rr4zcyPlAz
 UcUzCBxM3/88T6nGMciSB7c5AEGEwgPQTMKEl7//MH9BgLF34CvBcZFu9oVb9h6t65MnjOSMlj7
 CkpgiuAi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_01,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 clxscore=1015 phishscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090000



On 7/22/2025 4:33 PM, Krishna Chaitanya Chundru wrote:
> 
> 
> On 7/12/2025 4:36 AM, Krishna Chaitanya Chundru wrote:
>>
>>
>> On 7/12/2025 3:06 AM, Bjorn Helgaas wrote:
>>> On Mon, Jun 09, 2025 at 04:21:23PM +0530, Krishna Chaitanya Chundru 
>>> wrote:
>>>> If the driver wants to move to higher data rate/speed than the 
>>>> current data
>>>> rate then the controller driver may need to change certain votes so 
>>>> that
>>>> link may come up at requested data rate/speed like QCOM PCIe 
>>>> controllers
>>>> need to change their RPMh (Resource Power Manager-hardened) state. Once
>>>> link retraining is done controller drivers needs to adjust their votes
>>>> based on the final data rate.
>>>>
>>>> Some controllers also may need to update their bandwidth voting like
>>>> ICC BW votings etc.
>>>>
>>>> So, add pre_link_speed_change() & post_link_speed_change() op to call
>>>> before & after the link re-train. There is no explicit locking 
>>>> mechanisms
>>>> as these are called by a single client Endpoint driver.
>>>>
>>>> In case of PCIe switch, if there is a request to change target speed 
>>>> for a
>>>> downstream port then no need to call these function ops as these are
>>>> outside the scope of the controller drivers.
>>>
>>>> +++ b/include/linux/pci.h
>>>> @@ -599,6 +599,24 @@ struct pci_host_bridge {
>>>>       void (*release_fn)(struct pci_host_bridge *);
>>>>       int (*enable_device)(struct pci_host_bridge *bridge, struct 
>>>> pci_dev *dev);
>>>>       void (*disable_device)(struct pci_host_bridge *bridge, struct 
>>>> pci_dev *dev);
>>>> +    /*
>>>> +     * Callback to the host bridge drivers to update ICC BW votes, 
>>>> clock
>>>> +     * frequencies etc.. for the link re-train to come up in 
>>>> targeted speed.
>>>> +     * These are intended to be called by devices directly attached 
>>>> to the
>>>> +     * Root Port. These are called by a single client Endpoint 
>>>> driver, so
>>>> +     * there is no need for explicit locking mechanisms.
>>>> +     */
>>>> +    int (*pre_link_speed_change)(struct pci_host_bridge *bridge,
>>>> +                     struct pci_dev *dev, int speed);
>>>> +    /*
>>>> +     * Callback to the host bridge drivers to adjust ICC BW votes, 
>>>> clock
>>>> +     * frequencies etc.. to the updated speed after link re-train. 
>>>> These
>>>> +     * are intended to be called by devices directly attached to the
>>>> +     * Root Port. These are called by a single client Endpoint driver,
>>>> +     * so there is no need for explicit locking mechanisms.
>>>
>>> No need to repeat the entire comment.  s/.././
>>>
>>> These pointers feel awfully specific for being in struct
>>> pci_host_bridge, since we only need them for a questionable QCOM
>>> controller.  I think this needs to be pushed down into qcom somehow as
>>> some kind of quirk.
>>>
>> Currently these are needed by QCOM controllers, but it may also needed
>> by other controllers may also need these for updating ICC votes, any
>> system level votes, clock frequencies etc.
>> QCOM controllers is also doing one extra step in these functions to
>> disable and enable ASPM only as it cannot link speed change support
>> with ASPM enabled.
>>
> Bjorn, can you check this.
> 
> For QCOM devices we need to update the RPMh vote i.e a power source
> votes for the link to come up in required speed. and also we need
> to update interconnect votes also. This will be applicable for
> other vendors also.
> 
> If this is not correct place I can add them in the pci_ops.
Bjorn,

Can you please comment on this.

Is this fine to move these to the pci_ops of the bridge.
Again these are not specific to QCOM, any controller driver which
needs to change their clock rates, ICC bw votes etc needs to have
these.

- Krishna Chaitanya.
> - Krishna Chaitanya.
>> - Krishna Chaitanya.
>>>> +     */
>>>> +    void (*post_link_speed_change)(struct pci_host_bridge *bridge,
>>>> +                       struct pci_dev *dev, int speed);

