Return-Path: <linux-arm-msm+bounces-70287-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52ECFB312AD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 11:16:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B132DA0549D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 09:16:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CD0D1531C1;
	Fri, 22 Aug 2025 09:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="idq4NFJM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C1BE274FD0
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 09:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755854158; cv=none; b=HaG+bqwsYjDt5BkvpF+3fr5H+UvV7E3BOaWfhvsod6g0w2abK36B3gxi35/NPnFCDmh6YomcU4isfh40T2UWQKPHCVBiWdqIu6Wd4Dzy4gHZQmZTbw0V1C9c8Ib7K+xJEsKWHLYJDlXZinK+fOHfILs3Hn/aoeycy8dOAvtT3xE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755854158; c=relaxed/simple;
	bh=CR0b2qpCl7xTZdz+j9G328pzRVF08m42rB23Y1CiaaU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Quq3uihAJha2fpj0lRbgGV1fFFlZ1tg8cKOQ5mOXep4roSzo5ZjMbxZAK9vq0GXRpw2EDmxviEdDBOOf10vuf9NTigjpD1cqnFC1OGQY2/FfQBZ56/Zk2UaEJVqrW2ivkWsUqz+9xpbEQ1N1EAHO4XEgDEUx+dTSicr2ru/iwSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=idq4NFJM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57M8UH4S000975
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 09:15:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Owu3/M/QJUQDNXTeSSRokvKyc2i7GLtBqRsTbdP1fWA=; b=idq4NFJMc+tr/fdY
	zWuINNDSyNrAvT9BXHQj5b99ZSok3elH6zqi3IHLPMeWmX26zrhet9z5LUclHbtw
	obed0iqjKVwyCDlGJMkh6gQ0FSBtZ/iVNkjUvzkeVphjA1uIcC+7rCRvvHwmZaww
	WLxOIu+ASuEZRSUxH71hlXnvt+PAS/RiXuzWfCu1i1JmsKGT2O2UnFIHttGLy3Zg
	M+3QNv1v/ujmjupYAv0GH780Rc3K8RMh1oHV1tuq1RU9+iqG+6WLu3uokrmWlLYX
	F41BR2d3aFGe0RMahjQ81w7nqRMEky6DWSwwAYA8TCK6A6tlWLyQv/2BWQ7NWpMx
	O06wHA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n5298nkq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 09:15:56 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-70d9f5bdf6aso3911406d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 02:15:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755854155; x=1756458955;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Owu3/M/QJUQDNXTeSSRokvKyc2i7GLtBqRsTbdP1fWA=;
        b=SZG9ygu13Y/dGPy+wZ9r9DLfi2gYUakoYfm1KlXbJo/8N1WMuHBVGdZuyU1f1lazMU
         wWIR+NHhm1UYFYPZ7stWRuuNq6png2pna3QHjrQdEMvVqfuuMoocoTPNNPSU8Yukk09o
         1BCwARzRjChTkBF0436cBukAg9AfbY6iXzeVWHTo2t0+WioutifJVQGGSCf4Tlj39JGi
         WNBII7AybeqdgmZHLNJNucQF+6AEz3enF6h5FdTBachS5H241mvs+nKpRMKbe6recyBo
         IYm4PlqCztwQ69imzp9SI5IQRAxrx/CN9qDIr74osTwJxnPGe/PraS3k5BRJs8TibHb8
         w6Xw==
X-Forwarded-Encrypted: i=1; AJvYcCWogM616TAOBf9gg5lZz/LMzWTdbc1jKzccgQtNwHXfC83MrMeSS6uSdz1tgm2mh/H0I6iC6E8WyBFSsE3b@vger.kernel.org
X-Gm-Message-State: AOJu0YwY7E7jZDU7uU/PxVSmeGQvL4++cUgmkz+gJ1wjH8uAVN7dpi29
	lIRK6E2Di65Px/ttULWfH/jbL8rzcfdMhE0LDxBZ+1U/yNW50p15hX88nwWvKbDVDhNR+n1SVfd
	m3GDqrC2AMRsE+sMlH8EIsHC2LTvWpKrijeMiRpMPfar/EyAS4Sul/It6MvxVR2LY9OlUS9BR16
	L3
X-Gm-Gg: ASbGncs32dRrY5Ld+rdD+zuD7c555ZcRYRTlt+6GF508awPBycJMFzFYjuYGxlKXwdK
	fTWImr/yU9AayT/VJX3+aJl8eiviCtAF9JR9FrCn4b+GckTs0a7VZzMGy5GRFDNzIipCuCnzM5x
	itywgNj28bJM8aR2brjhd4LwAXCB2V3qorIyJfjN4lDSBwsBp9oaDAnb1ImRhsrI4YaEzDf/EAf
	e9341NGiEjqxLjZzXcvIFF9G5TlXBSN0+RKisYyN1LjElPXB8QHdjVRP54t+g/Lyl9OcvcEEmwQ
	/etpmwfLsd5f2DgQWxAf7ngCWPKcEAHLWloGPiJ6rzngKwEwsuJPD+hieiupDPj5k4a0PwIS2IL
	LafsyPFUipo7AnWxMfA==
X-Received: by 2002:a05:6214:b67:b0:70d:6df3:9a79 with SMTP id 6a1803df08f44-70d97243921mr26581386d6.57.1755854154747;
        Fri, 22 Aug 2025 02:15:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFy6Sek65h6xKz1DLTC1s5MdUClmKKfK9XaTQ1Rq47IFeeZrXNrNYv71xD4mfgWHSn1waZlmQ==
X-Received: by 2002:a05:6214:b67:b0:70d:6df3:9a79 with SMTP id 6a1803df08f44-70d97243921mr26581156d6.57.1755854154151;
        Fri, 22 Aug 2025 02:15:54 -0700 (PDT)
Received: from [10.207.49.70] (84-253-220-51.bb.dnainternet.fi. [84.253.220.51])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cef35fb15sm3412573e87.52.2025.08.22.02.15.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Aug 2025 02:15:53 -0700 (PDT)
Message-ID: <761c97bb-ee90-4ace-acd3-08349831aade@oss.qualcomm.com>
Date: Fri, 22 Aug 2025 12:15:54 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 2/2] phy: qcom-qmp-ufs: Add regulator loads for SM8650
 and SM8750
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Nitin Rawat <quic_nitirawa@quicinc.com>, vkoul@kernel.org,
        kishon@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20250819222832.8471-1-quic_nitirawa@quicinc.com>
 <20250819222832.8471-3-quic_nitirawa@quicinc.com>
 <ger4kizeltjwalfuwu4dpfjiskrv2okgo5c7d6n3pb24yaxgfo@nkcndblyx3il>
 <xir3u3hlmcvfu6uasijz6g2oialoasmuu4bno6ctxpscqcebz6@6kw6xpm5bxbd>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <xir3u3hlmcvfu6uasijz6g2oialoasmuu4bno6ctxpscqcebz6@6kw6xpm5bxbd>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ij_6OCFVHpvJlhIl1oep-aC81Hi5l1So
X-Proofpoint-ORIG-GUID: ij_6OCFVHpvJlhIl1oep-aC81Hi5l1So
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX1crQp+a0uiZR
 PqnK+PQWXcy507DJKsSyvWchsRxBPRiCCBM7R+Fdm5B5joQqVT+h/GGCmcio2xyeF/931QFmgWq
 jN6PMCoL0YdRFZlueJypItB0Q+WMUL+hFzb/k1Hv5K1MxngxF82Ri9EWg5ZkH9+kNuMT14Asz3J
 cc7O31/UZQgHPfL4Grh+Te23QxxspaCI7ve6RL9dvNvmYxYalyeViSxu4XSMdGjzYM8DaQ1OUbn
 KCTNznL0rLMnXwZXNQbaggi8G/7bJMdGWZC2PwWK5o3OaMmJVA04TDKMiRt4DsysoEC/dDVmlow
 QKaJfu5U5aV6vl8T/DX0WGNADFAbrrM0prT+Y1oW1nd+LU35eJ76EeYF9PHsljYoM4+iGAWlLlK
 g8T09zW+tY5FuLs2Xeu999PH8iudhQ==
X-Authority-Analysis: v=2.4 cv=SPkblOvH c=1 sm=1 tr=0 ts=68a8354c cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=JdIsBVl79nXNK9flUcZCTw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EhswbOTC6dfh6Ow5hwMA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_03,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0 phishscore=0
 impostorscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

On 22/08/2025 11:53, Manivannan Sadhasivam wrote:
> On Wed, Aug 20, 2025 at 03:49:31AM GMT, Dmitry Baryshkov wrote:
>> On Wed, Aug 20, 2025 at 03:58:26AM +0530, Nitin Rawat wrote:
>>> Add regulator load voting support for SM8650 and SM8750 platforms by
>>> introducing dedicated regulator bulk data arrays with their load
>>> values.
>>>
>>> The load requirements are:
>>> - SM8650: vdda-phy (205mA), vdda-pll (17.5mA)
>>> - SM8750: vdda-phy (213mA), vdda-pll (18.3mA)
>>>
>>> This ensures stable operation and proper power management for these
>>> platforms where regulators are shared between the QMP USB PHY and
>>> other IP blocks by setting appropriate regulator load currents during PHY
>>> operations.
>>>
>>> Configurations without specific load requirements will continue to work
>>> unchanged, as init_load_uA remains zero-initialized when .init_load_uA
>>> is not provided.
>>
>> Can we please get configuration for the rest of the platforms?
>>
> 
> Only if the rest of the platforms require setting the load... It is not very
> clear if the older platforms share the regulators with other IPs or not.

Yes, they are usually shared. USB. PCIe and DSI frequently sit on the 
same voltage rails.


-- 
With best wishes
Dmitry

