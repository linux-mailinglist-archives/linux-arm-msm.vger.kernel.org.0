Return-Path: <linux-arm-msm+bounces-80772-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E2939C3FFD9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 07 Nov 2025 13:51:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E23E9189C216
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Nov 2025 12:51:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAF3B2798E8;
	Fri,  7 Nov 2025 12:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R07YHRsC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P8GTThdy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 320D9274B42
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Nov 2025 12:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762519826; cv=none; b=DoKSE4rWgXYblg14pO3qsDMJS5rB16ia4qVIQDj8g5H1rPSG8lliKFRv+KbS9mRMbVhjlVmN2coqks1u2zpm76t7f0PMfASvx1Ji/9zrpNkNeE+dEs/KdnXoxt3mWy5AlH1YC/xjHj/izHq8uVk62jl3Tq89p6Nm8FUnQgu0zXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762519826; c=relaxed/simple;
	bh=zeWYB/uHFiuMhvMeKzZ3Ot32f3NOZRgSZBTJMMmrrtw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:Cc:From:
	 In-Reply-To:Content-Type; b=avGbUY7WadNd/pzo1m0UBuDAK8ar4o0HKMOtBaPfFAniy6JPIN1zC+vwLFhRmRn5T3jKgQzmn7XiecdmfeOV2+9Q1MMkU8VSf7mNRky72V/8QHMguHw2YWenA+t3/pY3vwzqzRGjufo8cfX35ji2ZE70TILFtDahbATfAO9/Bps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R07YHRsC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P8GTThdy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A7Bf6bS2853983
	for <linux-arm-msm@vger.kernel.org>; Fri, 7 Nov 2025 12:50:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FFWlBbQrXtfKdvLNfJPe1PwigVnsbb4OrNwL2mo/gfw=; b=R07YHRsC26JtM1ec
	HOYNPhzPlluUpsxpQeOTrvGiQkztLNlC3IXgQygEkcidcJA82er6KIAHyJFhT9oi
	qq+W6iLZm3Wl5/pS2kKV3i1REiz6LC3vHQKtq3dJnuR8ZXRBBtFSoM3Ob6W/BGAF
	NWcPXEEPgRQflQ647W/QdcQKgtpas2h19TPrATvRf09o+Mb5vhDY5kr58o1daENx
	zdeVz7S346ASjndt6zRoGDlzTMHu3YplLDt+YN2MXJw79zW2vaJ/kBUZno0HYKGj
	sfic5ZNKAUsW4o5vbn6ayeaLpQz9LuXFKPy5jXupBD2xc2f7TIG+rqAdm5Fv4VtT
	9vMzHg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a9g3xr5bg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 07 Nov 2025 12:50:24 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7a675fbd6c7so951045b3a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Nov 2025 04:50:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762519823; x=1763124623; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FFWlBbQrXtfKdvLNfJPe1PwigVnsbb4OrNwL2mo/gfw=;
        b=P8GTThdyBFTkNh9FwjlwDke5REs5DPe3HefkrJgMKncYbSq2Lh3X3ZNFDhfsJ6B5S4
         phV54q8rdRu3m+Tj/OQoJXjXjJE0Op3cvbR6+8I1u64Kr4D5gBIJ2+xtzn3VKYy7eIAp
         PnYX/eiwt2T48j6X5CW/28SheLPPSv8tYg98BXObNHeQqRcJDRoyeMzo3BduwNQ8E3Bu
         /cF6ABxtHdPeVRTf6jz8JJAwnO0zanT8+KKMX4dGsDo1x1FOTVo815lAlJUVSBUjF4Y3
         ZIV9ZXQTBXkTwT//FJIUv1l6mh7EH0RuHVc6B4Srg7OjZLzGGUl3r+5FrG6jkIT+RZz8
         5BGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762519823; x=1763124623;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FFWlBbQrXtfKdvLNfJPe1PwigVnsbb4OrNwL2mo/gfw=;
        b=LH12PFUxNKHGQSEY4ZUq0roUQWsQsoAR2/KcViJYNMD9qABx8sQ1yGvoMdLZid14xh
         hfKYZtMyNvwjRtadcqU7ZYImSF8GuA7p394BBQEKlfp3FkgTQPuhfSWm0+zuHD3c+w5J
         lHY+3z40xsqgum99s4rmA3D448dkpY1WWPfbQg88MRPbqmLqqrnwUcpql5T3tmSWzKXi
         NlgfiRqkPthgV0FJ6ImHLfelW8PaPqxicRPn96iWkuZzm0eazERa9VBXUOXHsrhLbfLT
         AEJdUwu0QBsNiAIR+lTcSXTy82CzB9zvcVZ68sWCBkafIDgrgFjl/4L9kJrXIM8zoLrz
         ANkg==
X-Forwarded-Encrypted: i=1; AJvYcCXzrra+jejx+3eUMJ4KPnDFSTVNwKLOYK5iu539es/MdWrI1ruR+y6YEhjmn6AedWKdNtzakyXwY5pm8YHb@vger.kernel.org
X-Gm-Message-State: AOJu0YwSyvQsdNMmwzdA/+tqvPYUQQPVV73+VYZaTLP2hmsUA6+X3/DX
	gMlFn5c3FX0KRACcvqpkZF4NYjNV3px7Q3h4BeZZ0bTderdxAilwvfFnEJ7Cz+xV3zDIo/KO6c4
	2G9Cqsweb1mBb/kwan6wJSK78xJEwjtIIzWBAa9n8K7gHNeFyQsxcKzrBSj9t93J41/KL
X-Gm-Gg: ASbGnctu45VRZUVOIC9SSnQC/Yvxbxr88WH8S5X1PRoZIYz0wX2M6EHaNe6168pT7wD
	ESevGLa8jYqgIVDl4DE4qAHlhTW7QdEmuQmKyzhKqqr1ndtMpTJBa39PJWB6ePJb4gH9oCIdD3P
	wdn9+5g2WwhUKYdZ0kUl/95NuIkbIB8gpdcHRVPYfpwNjpvCYei02NZrf5I6blmpfBRlcbk77br
	lwiOX/kTL0icGOWb8myZcAD+E2ahNw6uQQbFtyN8cZopJyp68ToUF7LetmwJEximKQBg5nmZV8e
	Ba7J8qm00KI8lr3cQI072igFB5zb8hQJcwerhFMTSC+gGTAjQO+UyMa9m7b0Yw+I4tmgYshV9JW
	lTGaIcd9wYdGyiSgQ0uPOMGSP7bUSSIdHquuIA6o=
X-Received: by 2002:a05:6a00:3d0d:b0:781:16de:cc1a with SMTP id d2e1a72fcca58-7b0bdd7103emr4538923b3a.32.1762519823445;
        Fri, 07 Nov 2025 04:50:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGwwYzDQO4dQSZaRlxC94ZzzXUKhsv/ejCAMVXEFhZwCkrDVDZeY00hfhwAWEsTh8Cnz9wt/w==
X-Received: by 2002:a05:6a00:3d0d:b0:781:16de:cc1a with SMTP id d2e1a72fcca58-7b0bdd7103emr4538882b3a.32.1762519822909;
        Fri, 07 Nov 2025 04:50:22 -0800 (PST)
Received: from [10.47.204.141] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b0ccd56de8sm2941038b3a.68.2025.11.07.04.50.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Nov 2025 04:50:22 -0800 (PST)
Message-ID: <4a205c6f-5438-4843-8ff2-b3bb7f3b9958@oss.qualcomm.com>
Date: Fri, 7 Nov 2025 20:50:21 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: SM8635 Porting Effort - PCI-E Card Doesn't Show Up
To: philmb3487 <philmb3487@proton.me>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
References: <xAsYX3yZX3laVVaqB8tdxUoTWM3jFlYudJ7j62r-6redf_OJgS_eY2mEypJ0Ma8B26RKeCqQU2G7pYTKapYx0M0rPAEvdpA2oyOs4XA8tcE=@proton.me>
Content-Language: en-US
Cc: yintang@qti.qualcomm.com, yyuwang@qti.qualcomm.com,
        zhichen@qti.qualcomm.com, miaoqing@qti.qualcomm.com,
        zhangq@qti.qualcomm.com, stonez@qti.qualcomm.com
From: Yingying Tang <yingying.tang@oss.qualcomm.com>
In-Reply-To: <xAsYX3yZX3laVVaqB8tdxUoTWM3jFlYudJ7j62r-6redf_OJgS_eY2mEypJ0Ma8B26RKeCqQU2G7pYTKapYx0M0rPAEvdpA2oyOs4XA8tcE=@proton.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA3MDEwNCBTYWx0ZWRfX8XzjBBmSQg8Z
 HCnl3CFh5w4mrzvi6+xrqpiY/kxGcYObfKTZYH5Df6/NEnYyX6YkV9ZvWIVUirjyF2++5mUINoZ
 ty5BHI7u7LskIUnGUIZX77zLo5coK6k44kx2IU7bzy7twIUD31gKpxEz5LhYPO7geekR4zJiqMm
 30vtzw5B72Tw7mwsVGypORMOSg8exL0txpUrEH3OG42x23X6wsW2uMHGZiP1fRbdTgdL9UFqIBk
 wIqUi3xw5dMuOq2lYwnFg0S8Jl6KOiKlF6Z172VrprVkC7hjsmvHV20WuLB+5hJdgV0tQPGU4rs
 HPI2VSJvcxr6ciAXEuzYoMCcNCdaBqBmz89v7rpK1rvibtyRc5g6u6pnH2ShLuO6wQ3XSYqV/xI
 psid+1FT4oXCQKhufNjts8WMa/8wFQ==
X-Proofpoint-GUID: 47-1Vh1lryOT6hFvV22u46g3gLX7pEnh
X-Proofpoint-ORIG-GUID: 47-1Vh1lryOT6hFvV22u46g3gLX7pEnh
X-Authority-Analysis: v=2.4 cv=Q4TfIo2a c=1 sm=1 tr=0 ts=690deb10 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=p0WdMEafAAAA:8 a=pvdlRqWQAAAA:8 a=OuZLqq7tAAAA:8
 a=puU34nIJ1s5LwbgnJBYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22 a=tRr4bHXEJ20fZlr3Elhh:22 a=AKGiAy9iJ-JzxKVHQNES:22
 a=poXaRoVlC6wW9_mwW8W4:22 a=pHzHmUro8NiASowvMSCR:22 a=n87TN5wuljxrRezIQYnT:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-07_03,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1011 lowpriorityscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511070104

If you are using WCN7850 on Snapdragon platform with upstream kernel, at 
least I think you need to set PCIe PERST# and WAKE# GPIO as 
GPIO_ACTIVE_LOW in &pcie0 node

Both PERST# and WAKE# signals are active low according to PCIe spec

You set to GPIO_ACTIVE_HIGH in 
https://gitlab.com/philmb3487/muyu6.17-dt/-/blob/main/sm8635-muyu.dts?ref_type=heads#L496


/&pcie0 {
     max-link-speed = <2>;
     perst-gpios = <&tlmm 33 GPIO_ACTIVE_HIGH>; //PERST#
     wake-gpios = <&tlmm 81 GPIO_ACTIVE_HIGH>; //WAKE#
     vddpe-3v3-supply = <&vreg_wlan>;
     pinctrl-0 = <&pcie0_default_state>;
     pinctrl-names = "default";
     status = "okay";
};//
/


You can change and try again


On 11/6/25 07:24, philmb3487 wrote:
> Good day everyone,
>
> I have been for the past couple of months trying to bring up Linux on the SM8635, with mixed results. It is gueling work, very complex.
> This is the first time I use a mailing list, please don't yell at me too badly if I did something wrong.
>
> I have a wiki that explains those results and what I have done, it will be easier than typing everything here.
>
> http://muyuwiki.ca
>
> The reason I am writing today, besides presenting my project (and also Alexandr Zubtsov <internal.hellhound@mainlining.org> is helping with this), is that I can't get anything related to the wifi card working.
>
> The wifi card is something like WCN7850 (although the DTS specifies a WCN6750 for the bluetooth chip, I'm not sure which one it is in reality), it sits on the PCI-Express bus, but unfortunately there is a complex sequence to bring up the device on that pci-express bus.
> I've tried so many things, poking the GPIO, using the power sequencer driver (pwrseq-qcom-wcn) and the driver for pci sequencing (pci-pwrctrl-pwrseq) which aparently calls back into wcn sequencer. But nothing wants to work :-(. I'm pulling my hair out.
> Take a look at my device tree, could you tell me what's wrong? I know there's a million things that are wrong, but let's focus on the pcie node.
>
> https://gitlab.com/philmb3487/muyu6.17-dt#
>
> Thanks-Philippe
>
>

