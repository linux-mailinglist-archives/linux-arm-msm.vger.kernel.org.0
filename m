Return-Path: <linux-arm-msm+bounces-86656-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 87ECECDEDB9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Dec 2025 18:43:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8DF5B300796F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Dec 2025 17:43:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 271AA242D84;
	Fri, 26 Dec 2025 17:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l4E3dFT9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h1lJrqf9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C8A5226CF7
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Dec 2025 17:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766771005; cv=none; b=axKHx2JyANttp+0VXzRRGBYjoeorpIdAbrSgUJ/k3wKjv3HgirKaMc/ApEOT1XytTpbpD5LLOORkTso6epQNzHGfl4uiHJjLSTe16z7pDF64Kc9B/5s2Vy9mcv72fC9WwKld1Sv2ZVWlNBYZT4KIOWgeu710GGBCNO4kJaDQaB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766771005; c=relaxed/simple;
	bh=pMwS+utd36e9Yg5OgVGLgnE1YXI0WuQ6EiRkS7w1YIM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aXQr3AI1ENXC0xzbxz0r+CmOIMANUM09y8lC9LWuyX1d3qBLunuTzyRTFUmjYZDYZdO9k/uR5p11ad2FEl06QkPG5v8VHnYnL9YM+ssZaw8ohOh/hGjYFwrlvsj93feHpOBsDAPdKSnyXxqF79GL3o3d6+FMY8NJj3Vik4rxZWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l4E3dFT9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h1lJrqf9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BQ8bafU1011827
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Dec 2025 17:43:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F4NqpVTRiKVuQ7I5ifzbbzEDREezQsL4/KWTobEj6Vs=; b=l4E3dFT9Gv5gemGB
	drCRIzAW+fSm3SNCfyGhHRLj7eT2xgmjpuOWtOBPTGAGi34cSwuRZh5mRd2QPSpT
	0DrdKUIHOho1HnMTGGGt/+7E8IVwoWXjweibzMaR3s6H/VxOEiS8JMHyRUEiauII
	0oFsnA/Z+slU/YkB0KlUQiCFYifXGfKmJTezJc3AGo0QpTdlwsLAvLShm4TgE73i
	+mMm84lxHnCQhKYd/t0HoMMxcuQ6THLK1nZj/ssyFEXohnp7SOWZ1ChOWiTMAjTz
	Wes591hmivj4nfOITF+c6/rALNsIcl6dbZKBoCY5caH8fl/UJAdp0uHocHV2AJlf
	enHQ4Q==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b8kywmcv7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Dec 2025 17:43:22 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7a9fb6fcc78so6440255b3a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Dec 2025 09:43:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766771001; x=1767375801; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F4NqpVTRiKVuQ7I5ifzbbzEDREezQsL4/KWTobEj6Vs=;
        b=h1lJrqf9cZoNGTMWvNCTiZ6ZmsyQcbvyajBSOXRZFO1MyB1kt1JsmBxX1H2Shq0+8i
         UKeS8JmshgrdeiXilR8ia7x9UnHLcMprSTsbikTooeoVqKp0emSSizarm2HZjw/GPRP/
         00IpUSFh8GYxnGWkDm0OhGRovRA25YnRA7Opa2AYNDJJmpeWo9LPBBuYnibiSTjGRAHI
         v6ZulyFJr0bRSyiH1pYEGJc9Dx06e2KQ0b4gPAmvYEXErJ2whIPKM0FwGbkvKwZrePiI
         mroQ+ihy7d6jtCt6xhHsnpboX64TX8kzZEtc50WPa4XCXChMPsSGRhJDXM2mtwH5T9yn
         yZiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766771001; x=1767375801;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F4NqpVTRiKVuQ7I5ifzbbzEDREezQsL4/KWTobEj6Vs=;
        b=Osx9WbFwhGhGWgOuZz3CU0l/SO8wRjHsK3c7hYcbiVhFQDuROOKnZhRmh5sNqVlLY+
         t+c9AqBwD2dqppQuOG8DJZolebACQUGTY98FRHMdlBGxcS5T5ehU8JHpYO8FBa8wQYvb
         repvOx8u5tDkiihkpSuhXiQ5mm/s1YxFOph2N4gIF2VwzO3krRDwDVXS2zeMLXo3mKdv
         PH1eWFlJIxcAAQ3SNTtC2gFfQCe8rrIPJDO2gkBZNlJgqE2B+fxZUqsIjjegDNBYkppq
         ZqzuAGD+pAjZBo3nIfTbs7i3/6+YCmMJJW6g9K+ZAPuuBUnM4IIkL+hHGC4dWYXgyqH3
         1oSg==
X-Forwarded-Encrypted: i=1; AJvYcCVWmleoVDWuX2/vzXJpBhh6V47AEeE42YzMaCFTYKqxJsPRCnq+6e3wzhLOpBHyyE4FyyUpWzNUp/eW82Kq@vger.kernel.org
X-Gm-Message-State: AOJu0YxwiV85ABcxE5iZPcNHGphc89/1UaNlXpgOhtLSXaNbb47Fldzy
	s8oPq/NFtgSeqj+u1o2BTgO4xFpDnRrcHg+msmnrnKONPJAJNAkOAaP3Ga2Ias1+vZpH519XYn7
	g3FzF2zSs/dDjsf8FtnImLL57hfYLe5tkKMUOizPjgioQMyGCH+AmJ4zfbjOf46JZp0pT
X-Gm-Gg: AY/fxX6lW0v+VaMwFOKfxR1jDYKV2wl/x/eSs63IIri0SxO+x9+1T/rJS/0MOduWHTM
	rRh9rVpRRjGsq6VIzqr8Rb8tXse5sj/xVT96JWMhCB54C3UFS+fAOAtgyhoCcio1+0EYFtN1Zz7
	BqaAv9fpnVZYh6rIfF7Qbowq8XK5c1zoZL2BEvyauLoue8TXR8983+Bi9u4AM0hxOIvp1NnUfDM
	Hm03+3SO/pAcq3y9GoBQE2ebJiuDOJHvmLTpRuZMlBQThSYNxXdmktejUtdKV1qtA0J4AdwmpN9
	lS5KqM6rh44eWy3fBG1qXTkqIMevZRJdYp2OzlwohDIMI1PF+vai9ku7Fgv2kX9mSQoMA7N9kjf
	sZgO+BB27WmjDxo/scIFGNvSAxtNHCq+0weEGzedUI4p73Zw=
X-Received: by 2002:a05:6a00:a88f:b0:7e8:4587:e8b8 with SMTP id d2e1a72fcca58-7ff65f78970mr20195843b3a.43.1766771001403;
        Fri, 26 Dec 2025 09:43:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHd4IvmZG65+GLnTEifQO998dR1YjFYkql5T9+0hFHqnBt/Nzt0rs330mFqM+4Qc2VXCwcsOQ==
X-Received: by 2002:a05:6a00:a88f:b0:7e8:4587:e8b8 with SMTP id d2e1a72fcca58-7ff65f78970mr20195812b3a.43.1766771000879;
        Fri, 26 Dec 2025 09:43:20 -0800 (PST)
Received: from [192.168.29.115] ([49.43.229.201])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e797aadsm22697380b3a.61.2025.12.26.09.43.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Dec 2025 09:43:20 -0800 (PST)
Message-ID: <aaf20c5c-0cbe-c1ba-c749-971ddd5b0351@oss.qualcomm.com>
Date: Fri, 26 Dec 2025 23:12:52 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v18 05/10] dt-bindings: arm: Document reboot mode magic
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Andy Yan
 <andy.yan@rock-chips.com>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srini@kernel.org>
References: <20251223-arm-psci-system_reset2-vendor-reboots-v18-0-32fa9e76efc3@oss.qualcomm.com>
 <20251223-arm-psci-system_reset2-vendor-reboots-v18-5-32fa9e76efc3@oss.qualcomm.com>
 <9483a6f6-9834-4ea6-8f94-e7e158bf68cc@kernel.org>
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <9483a6f6-9834-4ea6-8f94-e7e158bf68cc@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI2MDE2NSBTYWx0ZWRfX4F0P0sD5KkiQ
 TkxgN7GHCI7o46HucNPwd+hnBaoCcm2p18U/zjrQipQ+LBRoh7Yax1edx3VmYXQApqxm5hJF7Su
 mOX1xTzIxqv6opr9TpIbNyOJfd0w9fJiiqNb7fumg9yfESlHjw7/oB3xtyE5YBGFP0ToxVp85+w
 8H9P8DzjlwG2fJ/COvRlyQGBthFfL0gfxJ+bWTtW1WAyfyYDYu5QYf+q5kHlbrbchBikdhWD8/r
 4CfimtJlEbRJcuYAXhUqU6euqh18uvkOawq4DQ8W/5RlF9A/QwOuP/fbbzjX8bF8SLw/dn8Ildh
 x45T0xJRGu0OvMvYv/7ta9ccc1BVRsxA2zS9VGvH6aNlTSUW/SiQhDCve5BEsGKpgjTLJaOEfG8
 FN1/u93DbjiYE8ipu9wnWYola5VOC3kRQ9XEu85XCPuZXiW0vDH9P6zGLdVxZ899kft6Plmqawz
 OmD4CHUyUeIrXr3Fh1w==
X-Proofpoint-GUID: spnMHvHv4r-xVWzTRtqzZYlKbzQ7yWil
X-Authority-Analysis: v=2.4 cv=MKVtWcZl c=1 sm=1 tr=0 ts=694ec93a cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=VfCEZ76STn+8o8daCVmC7Q==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=DO7WzgAb8V_MQCx-KrYA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: spnMHvHv4r-xVWzTRtqzZYlKbzQ7yWil
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-26_05,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0
 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512260165



On 12/26/2025 4:37 PM, Krzysztof Kozlowski wrote:
> On 23/12/2025 18:07, Shivendra Pratap wrote:
>> Add bindings to describe vendor-specific reboot modes. Values here
>> correspond to valid parameters to vendor-specific reset types in PSCI
>> SYSTEM_RESET2 call.
>>
>> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
>> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
>> ---
>>  Documentation/devicetree/bindings/arm/psci.yaml | 42 +++++++++++++++++++++++++
>>  1 file changed, 42 insertions(+)
>>
> 
> 
> Please use scripts/get_maintainers.pl to get a list of necessary people
> and lists to CC. It might happen, that command when run on an older
> kernel, gives you outdated entries. Therefore please be sure you base
> your patches on recent Linux kernel.
> 
> Tools like b4 or scripts/get_maintainer.pl provide you proper list of
> people, so fix your workflow. Tools might also fail if you work on some
> ancient tree (don't, instead use mainline) or work on fork of kernel
> (don't, instead use mainline). Just use b4 and everything should be
> fine, although remember about `b4 prep --auto-to-cc` if you added new
> patches to the patchset.
> 
> You missed at least devicetree list (maybe more), so this won't be
> tested by automated tooling. Performing review on untested code might be
> a waste of time.
> 
> Please kindly resend and include all necessary To/Cc entries.

sure. thanks. Will make sure on this.

thanks,
Shivendra

