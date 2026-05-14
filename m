Return-Path: <linux-arm-msm+bounces-107527-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8DQGNENqBWo+WwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107527-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 08:22:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 265E653E42B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 08:22:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CE81D30356D2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 06:22:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42B933C3BE0;
	Thu, 14 May 2026 06:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aNs9xl3B";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AQKtzWbr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A31F83ACA5A
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 06:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778739770; cv=none; b=T2TMrdmhA+7/al2GfR9inSZ/yXLrgnF1aSzty+xvCaj+jI8zqrygbGkmv7eO7EMXlCjOtkqY1vdfYleOmRRYaaScCYsUTVlllmw9Mo4t1CEvIV0k0n35GQ2ClDdjSivPKEq+uFML85Emo387nHiVGl/y90u+WVjLDVswVI/ZetY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778739770; c=relaxed/simple;
	bh=r5CNeoyi9PFS7Rp+BVPOhykJh4AQPo3yRx3ClIiQIxQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Cyu2+rzEG0H7bsyTpZZM4lX/975HtvHVJPaL4ERM0F4GZdEpZNvS4FuTaeG7AkJeKL/qsHWbJ36ZRCYC6K5GsBHWaCiJBEcKHAeR0+LguR0F36hIRvbzAqI7uZWaA0tmmIIW4LU5EFF5nnfcrZa1WROzniwTfveK4i46DIFlnO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aNs9xl3B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AQKtzWbr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64E2xXxg1095269
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 06:22:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W6EuO2zZJQMU48rIvtrMMeNXywoABvRlbsWA7IZNce0=; b=aNs9xl3BBfVZl8pk
	qh/mM2TZ+l3EE6a8/fdXpllfxtanJ9H3VVCRl4udunvnOf9QRj7jCje/MErO/MIX
	EB2Heg5Pdt1zBZpILOB50iPJPfQXaPFgp7FZpm5yU6+3Ed4AuAp+nwI28rg1AHBH
	kcuAapxSZuOsU+Y06UeHppMOb2VczDvxFZ+Y8JTMWy1b32g52LTWxUiUYYcuYA12
	lkUMsEmpH5+oZIVLl9QTkvI1D4ANqiR+f5rmusexKE+PWwrI98fV2Su4q0Cwazfv
	HUfdOj6LQ1odnHxu8XzlatQQNb2NHZdVbKcPQjneG5d5cgqNJonxH7tAJn1GKV5K
	UHZ9MQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e563hgjca-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 06:22:47 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c82726f7b0bso2972563a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 23:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778739767; x=1779344567; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W6EuO2zZJQMU48rIvtrMMeNXywoABvRlbsWA7IZNce0=;
        b=AQKtzWbr+4gcO9Rb+V573nq38HcA0I7VeEAtpCuu+FeMtUW7TEnvn/yicnQcP5l1lV
         EiVelVdB8KGORhfAxEeSdQjJCBgS6G4vWvDMYbKn48fSI2eACEa0wspxatCD3izRvg4P
         MkCaFV6igZe1ihm3q3wLjX3AWwnkHOibC+gFIyO4w9kgAU7lyiY/t4wXC3D1tzOjNt83
         86pCavwmiQrTEY7s7OGDKOqTBW1XzqMg3W2IyXr5H0hUC9RfRSvoz0bipBwdIu2QdMJU
         87ld+kvGUAnBAAQoXCsen2l17WBOA8nv0QhxIpWQUvVu3/ejxIlSN3GEK+9BxqhF0kWr
         /iBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778739767; x=1779344567;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W6EuO2zZJQMU48rIvtrMMeNXywoABvRlbsWA7IZNce0=;
        b=FNXfMMmskXTCotybVivOrZD82GFscY6ABB2Z4oaXk4QqQgeDs9FyFWBwFIsS8C6xQM
         gRaqlIKV4d114TA8i4eUP94xWpi28gsn0SuqpPWjOaR0MRgz5MG2OTA6Gsuty/+9Iaze
         yNgxLS+9d/d07QeahZ3wq5VPzFvjUg/W9w1aeEjjksTTNCKEFN+n/AcyRIJ6IfVhWj/4
         D4TNamb9Lcd18rJL44dI6Oua1s1TKAuOGPmBY+s12Yi95pEUQP3M7HmbI661JQrLd27i
         te/g1fWheeOIuo2L4ISneKTqqnuByLv6mrRvNRh/dFTTCIVWPw+ld1nDi/C2lC3HLOQB
         CAeA==
X-Forwarded-Encrypted: i=1; AFNElJ970rLv3kZRvRIc+7hAHAgOsOsmqXJTDVLjygiARDhfOItiGNy5K+WOf73V/Q2pca7miMo4kfdB40dcXupp@vger.kernel.org
X-Gm-Message-State: AOJu0YyNhWBKWFsOtLfY/bi6CqxL5QLdPMMPVFrjIOgae6+PaR+bA3mI
	RwMg0gRc018ORW+eR/+RaqFKstlaLg1hVh2AlVvPmuTauu+/GvqGlEMnt2ZokzsInmwtlHsJqXO
	P7iWD4F/E0WI//80FXChNSe4eEaME3nrkyOsR1DCcsFDDrE/CsdRVKF1ZHG3S9WXCBVEX
X-Gm-Gg: Acq92OGX//EwjuqRXK8WZBaoDNmOMJk/VAHGv3JM6mxwRhHY84j4cKYT0ml/1pYvMjA
	PHitPFRNLyMeoa3r0JIjmj0vy55BadUfU0bMktfIsDTCWH7wqh6hGsER7L+IRtEIzRJZisWLCjo
	8tBqBbmUP45sNmZ0MPNa7ILZgQFC6w1pUsi6EKY+0uvXQWF39HmJhhkBtMAjsX/uoPiChGaRTf9
	pbtnkJg9dCp+IxuLdZZ2Ic0XNSWnUeCfWfHX2IBdE6lD0z5uXcPtUary65xm7YaDok4qNdOTBBQ
	W9//O+ndUdrEUVo66KN7KP8VeNHdEvzku/6BxEgY9zYycPBSsP7BaNQeAAf/oq7EA8ZRsicbeYt
	PZqCT9fwj5+1NKGzQNaVM3ki2WU7D7tEpHCkjVfuIH4RzQHPc9SIBtGWnSAQxUU9ShqtOnmtKkW
	Ruwxf/yNrGfH2K0w==
X-Received: by 2002:a05:6a00:339a:b0:834:efcb:12b4 with SMTP id d2e1a72fcca58-83f0428732amr6709144b3a.28.1778739766583;
        Wed, 13 May 2026 23:22:46 -0700 (PDT)
X-Received: by 2002:a05:6a00:339a:b0:834:efcb:12b4 with SMTP id d2e1a72fcca58-83f0428732amr6709106b3a.28.1778739765951;
        Wed, 13 May 2026 23:22:45 -0700 (PDT)
Received: from [10.217.219.121] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19663cfdsm1803149b3a.9.2026.05.13.23.22.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 23:22:45 -0700 (PDT)
Message-ID: <42ba6ac7-306a-419f-96b6-3427c51ef567@oss.qualcomm.com>
Date: Thu, 14 May 2026 11:52:39 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] dt-bindings: phy: qcom,msm8998-qmp-usb3-phy: Add
 support for Shikra
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Vinod Koul
 <vkoul@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260504170659.282532-1-krishna.kurapati@oss.qualcomm.com>
 <20260504170659.282532-3-krishna.kurapati@oss.qualcomm.com>
 <20260505-gifted-salamander-of-prowess-5107a6@quoll>
 <8cd564af-9646-40c5-a8ef-c7197fb3cfe9@kernel.org>
 <95b567cc-b83c-4154-9520-e624555f1882@oss.qualcomm.com>
 <29571bdd-23bf-42a7-a9e3-918a28c79700@kernel.org>
 <62161822-2365-4ec7-80f7-8660bdadb177@oss.qualcomm.com>
 <40b5e0f6-bc61-4750-9560-bdcc268f0fe3@kernel.org>
 <d52c5039-9431-44ed-9f3b-bb00d03ae176@oss.qualcomm.com>
 <5baeeeed-7c18-46f7-82a3-5bb299ba05ef@kernel.org>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <5baeeeed-7c18-46f7-82a3-5bb299ba05ef@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: XHOW8EESmPPAaAKhurkSHAEdwLHylBDl
X-Proofpoint-ORIG-GUID: XHOW8EESmPPAaAKhurkSHAEdwLHylBDl
X-Authority-Analysis: v=2.4 cv=DewnbPtW c=1 sm=1 tr=0 ts=6a056a37 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=bDX-BmwN5UdOEqwmdTwA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDA2MSBTYWx0ZWRfX4BY6Wxka6cS/
 07nESeODS2RT/Cw9GsCJQrU3kBd8ZZ2VkbCTmfZTg/TvXX54EETEvNDrWZ+051zHU/Cf9ROvRnP
 BVxbRCFAoJsf3f7ZPSPQsXzsT8Yn2lMx3j2ERPFMZ1joGpfQULy8/S2gSO+mQAsMUdv/GI3v5Eo
 y4Qmc6nmDyk1rIpYsrgtB1cK6agBLXBqDURd2v6xZPPVzzCGZhPCovWmexH2yxoJJ4yEw492Ofs
 9reDqxfOPrkZKZK+iKteapHoaIq6+HVP6oJMDl/sWcayJ83ePRvc8CVUkvNOOxBdWR4IHLn2GwU
 eUMmr3GBw5grA7O7m/S6IdY+wdw7aL+irtrk6MGvKa2Glnv6l/HkOXXHpmRfGq+ftNRVJHxkH52
 Fn5wE/3xf+VNX1XMOKG6driFjr6MQW6+kOdcBszRKBNpOVznGtJFRpjtNMzOr7pK201+qIkM6//
 +7OAdp14vuGRqFa6dzg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605140061
X-Rspamd-Queue-Id: 265E653E42B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107527-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.kurapati@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,linaro];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action



On 5/14/2026 12:26 AM, Krzysztof Kozlowski wrote:
> On 07/05/2026 13:37, Krishna Kurapati wrote:
>>
>>
>> On 5/5/2026 7:30 PM, Krzysztof Kozlowski wrote:
>>> On 05/05/2026 15:57, Krishna Kurapati wrote:
>>>>
>>>>
>>>> On 5/5/2026 6:59 PM, Krzysztof Kozlowski wrote:
>>>>> On 05/05/2026 15:27, Krishna Kurapati wrote:
>>>>>>
>>>>>>
>>>>>> On 5/5/2026 4:22 PM, Krzysztof Kozlowski wrote:
>>>>>>> On 05/05/2026 12:49, Krzysztof Kozlowski wrote:
>>>>>>>> On Mon, May 04, 2026 at 10:36:57PM +0530, Krishna Kurapati wrote:
>>>>>>>>> Declare the USB-C QMP PHY present on the Qualcomm Shikra platform.
>>>>>>>>>
>>>>>>>>> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
>>>>>>>>> ---
>>>>>>>>>      .../devicetree/bindings/phy/qcom,msm8998-qmp-usb3-phy.yaml      | 2 ++
>>>>>>>>>      1 file changed, 2 insertions(+)
>>>>>>>>
>>>>>>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>>>>>>
>>>>>>> ... and then I looked at the driver. So un-reviewed. Devices are clearly
>>>>>>> compatible. If not, explain what is not compatible.
>>>>>>>
>>>>>> Talos uses GCC_USB3_PRIM_PHY_AUX_CLK.
>>>>>>
>>>>>> In Shikra, we are using GCC_USB3_PRIM_PHY_COM_AUX_CLK. We don't have
>>>>>> GCC_USB3_PRIM_PHY_AUX_CLK.
>>>>>>
>>>>>> Hence, I didn't use a fallback compatible.
>>>>>
>>>>> This still explains nothing. How different clock makes interface for SW
>>>>> incompatible exactly?
>>>>>
>>>> So I went by the naming. AUX vs COM_AUX.
>>>
>>> The naming does not matter. If the clock is called
>>> "no_one_expects_spanish_inquisition", does that make software
>>> incompatible? Why would the name itself matter?
>>>
>>>>
>>>> Can I use a fallback compatible and in DT vote for "COM_AUX" clock with
>>>> clock-names mentioning "aux" ?
>>>
>>> I don't know, I asked what is different in software interface.
>>>
>>
>> Hi Krzysztof,
>>
>>    I checked with the hw team here and found out two things.
>>
>>    1. Shikra is a spinoff of Agatti and its sw interface (clocks used and
>> regulators used) is the same as agatti.
>>
>>    2. I thought we could use qcm2290 as a fallback since the phy register
>> init sequence is the same for Talos/Shikra/Agatti. The difference
>> between Talos and agatti when checked in the driver was the init load
>> settings. I checked with the hw team and they suggested using the init
>> load settings which talos was using.
>>
>>    Hence both these compatibles (qcm2290 and qcs615) cannot be used as
>> fallback for Shikra.
> 
> Then I do not understand why you are using qcs615_usb3phy_cfg for
> Shikra. You say that the initialization is different, but you use
> exactly the same initialization. So in a meaning of compatibility
> between hardware for Devicetree they are compatible.
> 
Hi Krzysztof,

  There are 3 things:

1. Clocks used:
-> Talos supports AUX Clock since it supports DP over USB.
-> Agatti and Shikra use COM_AUX clock since they dont support DP over USB.

2. Phy register Init sequence - same for all 3 targets

3. Regulator init load:
-> Different for both Talos and Agatti
-> Recommendation is to use Talos regulator load values.

SW interface wise, shikra is comaptible with agatti. If we use agatti as 
fallback, we would end up using the platform data of Agatti where the 
regulator init load is not suitable for Shikra. Hence not using Agatti 
as fallback.

Coming to driver changes, I used qcs615_cfg because it has required phy 
register sequence and regulator init load as needed by shikra.

Regards,
Krishna,

