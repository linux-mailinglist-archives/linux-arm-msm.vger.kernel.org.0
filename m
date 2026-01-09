Return-Path: <linux-arm-msm+bounces-88306-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 96183D0AF64
	for <lists+linux-arm-msm@lfdr.de>; Fri, 09 Jan 2026 16:37:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6E1EB304155D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jan 2026 15:32:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3AC5284674;
	Fri,  9 Jan 2026 15:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jz7rQ+3Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BQFy16UP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9376B248881
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jan 2026 15:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767972755; cv=none; b=t866T3DeoKhwzJNqxw5AxZCKEB2E9nO1Tt5PX0Kn9uwlC5B7Alui1DjOsB2Ep8OPYCjbG5R3S5KJidiCPHCq1btKdT/4yzwq4/mt49f6gvzMQT9BETC+5525jKlbrpw8/FvZrz0cI0z8wVzVgrvyZ4BsRtYh6U638+KhSrkXytg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767972755; c=relaxed/simple;
	bh=/kY/nCzz7XipM4D+OHx1C1hWjORLAj+DZAuJ7h1zWvw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lUTlPtM45n0HbjRsr3nIWc7JaIKYuwljZk2mL4iaL5WPvbMnIym0NfT/dtylxDSOWPjqWsXaHsXW5LTaVva0Dt1Yxg0I4qoL9ehb9opQH++4iH0Y1kFzhiDGrgD5DG76bfXRtxqX647rohPetCuJwpYPLx/pUvLHJH0P0TD9x0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jz7rQ+3Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BQFy16UP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6098XQhE822858
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 Jan 2026 15:32:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bbDYGHJo1YpAWv7Ekwvpg5SDMRw5uszse6WBwKheUV4=; b=jz7rQ+3QASlEJknd
	DakZQscX/uMlnFcfeTcsBqYsCN/8RET4KtzaUZioLhNb3neMDVjAKtVk+IB5RCJS
	tyOqepatV5h+pXTUL9CQ9uJA50YyOufBWrqcVwq8JR/17tIN/fBQMsD8wS06CgGP
	V8j4ARo4u/uDCAnHRcJfvuilLGPwz6VAkaUEq5gw7wuKRZ97+4lw+aoy94wuZzSo
	RtBbbztLO9aq4W31hi+zV52/5OwhsQ6XsSCcUqBGbCYXp8oGZQp7cFi88jejMgdj
	c/pAV77csMKQV9B7D0+bIb9NnBWeEcxzgIyzbns42PYe9CPMeYihghGt6vtpD/1o
	iaVRnw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjx94h7a6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jan 2026 15:32:33 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c503d6be76fso4282288a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jan 2026 07:32:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767972753; x=1768577553; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bbDYGHJo1YpAWv7Ekwvpg5SDMRw5uszse6WBwKheUV4=;
        b=BQFy16UPiDTtHLFN2zQEDkBn9lD1B/U7tiOz3X/38ypfnwrouN7BebluXoF7vxMKrC
         8ama98KMe9lgepbMvVebxeQ8M5GgXqQLbImxhIFw6hGGw7D3rWgihtlPMP27Vw5w8iQl
         aJAlw+19cUYpj3KwwsKyC4rEmcqyn0zsVyf6I5BJm0ZotfMOsOFFKjS8g9H+iu815BiS
         ry0HsYuH/3B7sNWpcD0dN99DZ3iLdKq53ovUuIdaQmW8/cPdrPULFDyLnuJDG+7CfVcc
         AN+iwGG9zgbHCFQdZz8ZBJyt5376qUMRKkcnDfTjf4S38rQOwrZy4VCZzCDnIp374RtS
         5S3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767972753; x=1768577553;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bbDYGHJo1YpAWv7Ekwvpg5SDMRw5uszse6WBwKheUV4=;
        b=cVAsdoWu/86O4MvmnvM39Okdi9WHJY/r/6vqUKu3nJcOSxRwf59EultqSWEdy5cCkW
         alTS5wVq5S5i4pMDy0TNi+uQFpQTdnHrtD9QDeiaDT9uJf9uxkT+STlBDen7swPyvjKJ
         BuK9OaXdAxUmXznIBG94bfx/nsWBoYtWbZPRmoqS6miulwsSVn6qwSGd0XqzqIad1/3Q
         QlHn9WCPzDDHnZMI7wemdclFXPEk4G2xRspQGl4gLsBfP1XaR7Iv7+NC0dqJW8bX2NTD
         bxdISrm+7CPZvP3dYWEgVqM7A9sn8+py0IKg1tJ8FEsbRwz9f3oDYTuoFo+ki+Nst1BN
         v/ng==
X-Forwarded-Encrypted: i=1; AJvYcCVpci3dLiVQ9FJ9JyM2hgbkuYt3n6zQaNx/KejyBy+adODpI71IYZE5b4zGlrIUieVbHTpnJlkOS6odX/LV@vger.kernel.org
X-Gm-Message-State: AOJu0Ywg6JSN/LaF6JEVWBSOeIS97QCT57kWlWbiVJddW2lZc11D/RaW
	10FHHgSIKmWaVS1YHyhD7Nzi9sYtV4E6/TiE+1rD+GFHaGjxhlcWCJfQPliDtsefAQWTy43VRaA
	anV6FfgexIor2nf05IZWx5m2tcDBMkBojjlwpjvlhkRhh40aFYUzGZA33SjGTLOJWQwLP
X-Gm-Gg: AY/fxX7CsqHz+0D6AhmbnzcsxUfbsIZX5uA4ya1QD5eDWIlYVCD004o4k4e6QBQ27yd
	b6t4BS2eFSq/pPjhS0KFmEQwauNEu8LywfJsZPSi0wgtS+A5TFByjIWgLuGwVqBL5hs7QcEmg+I
	noJ61Gf2rhSs0raZExnwYkHJ0PNQugEWqBdqwsLl97KUFOD6dY2tBliyWRdVhESK0lOpmqoZaeh
	IPLlEI2tA8Lk8WrvQ9bsiSuz8+u0Jd6MhRyBs/pINwEBldH9mUxcGRMHpO4OV1IRL4ZgoV7+LTk
	iFJ7/GtrMM74oB1Pkf0GkSps24/NQ7q9h7NYDuCVEAQs2h30/Br23yDyYpZpbJC5mSn+YH0qFbo
	n0U5jE/1dtJj8t90GwetPEknK/939xUSp7mmxdd7kB71Z3lImU5n0N0uPWbvlObEn+EkihvA2GA
	YDpcjw/2ysiXKOl+Vrt0WwLYIOy2Q=
X-Received: by 2002:a05:6a20:7352:b0:366:14ac:e1ea with SMTP id adf61e73a8af0-3898fa09be1mr9503032637.80.1767972753069;
        Fri, 09 Jan 2026 07:32:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFMu/YAZaGy8W3Jf240LoNSAxEKcf6xqLbZeddAYM3aiSJ6VgHPp4V+sxtUdmahoUKDx+cG8A==
X-Received: by 2002:a05:6a20:7352:b0:366:14ac:e1ea with SMTP id adf61e73a8af0-3898fa09be1mr9503001637.80.1767972752476;
        Fri, 09 Jan 2026 07:32:32 -0800 (PST)
Received: from [10.190.201.90] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c4cc8d29521sm10947460a12.23.2026.01.09.07.32.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jan 2026 07:32:32 -0800 (PST)
Message-ID: <fad41515-4b43-4b64-ad0e-1c656333e6a9@oss.qualcomm.com>
Date: Fri, 9 Jan 2026 21:02:27 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: dma: qcom,gpi: Update max interrupts lines
 to 16
To: Vinod Koul <vkoul@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sibi.sankar@oss.qualcomm.com
References: <20251231133114.2752822-1-pankaj.patil@oss.qualcomm.com>
 <20260102-fiery-simple-emu-be34ee@quoll>
 <aa62b769-4be2-4e6b-b2ca-52104391a757@oss.qualcomm.com>
 <aWBxbNpRIAxQ6DDu@vaman>
Content-Language: en-US
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
In-Reply-To: <aWBxbNpRIAxQ6DDu@vaman>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RN2+3oi+ c=1 sm=1 tr=0 ts=69611f91 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=t1bloCwPabEWpEwonywA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: Y5bPDyeGKL4iH6WHg881dQPeSFTq8-0o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDExNiBTYWx0ZWRfXzNtkI0Ww0olh
 EyAzRaXtf0ZCs3PcAdt8U55q1Kwz+p/MkA1CJUpcPgD/oPLiAfGwcC9ySfenvfdmEn/nI1Ww+G/
 ZOGN6JampSRmrdKLd3jg5bAnmv1Wg2UHXbPMdBlCN4gpLo5M71BRP0+44teQ2wc7wppN+UG4LYP
 bJsvSqFnqI0W3mBUN3yNOzE8s2huwTK/CRancgVgfigXFsa8ggw/Dqh6DhII9B598iLkkK1q9YY
 HImuNjRCJCIsH+sU35X/1Y8XCstOG4qlhw2BPmZw/ArmnIVLCzpHq7bb7CRYxwrpGkvetG0ZXtS
 K2Rac5uwAkh03VoYZbANE+2yPUbEaj6ldfGyZULNFAty0xJDv+Ofki/zDFsEEQ1tt4yPWg8NlVw
 Mm2bE44v41tIlGPAOoPCgFslYyn0C2lKjftFKpkoIOOMTQuvR95ZhLWjnq2kINpLq/48qnqJaxx
 0eUmJ02HxZZPLTALNEg==
X-Proofpoint-ORIG-GUID: Y5bPDyeGKL4iH6WHg881dQPeSFTq8-0o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_04,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 impostorscore=0 adultscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601090116

On 1/9/2026 8:39 AM, Vinod Koul wrote:
> On 05-01-26, 12:29, Pankaj Patil wrote:
>> On 1/2/2026 5:57 PM, Krzysztof Kozlowski wrote:
>>> On Wed, Dec 31, 2025 at 07:01:14PM +0530, Pankaj Patil wrote:
>>>> Update interrupt maxItems to 16 from 13 per GPI instance to support
>>>> Glymur, Qualcomm's latest gen SoC
>>> This has to be added with the compatible.
>>>
>>> Best regards,
>>> Krzysztof
>>>
>> @Vinod can take a call on squashing, the glymur bindings
>> have been applied to vkoul/dmaengine next tree.
>> Let me know if I should resend.
>> Lore Link- https://lore.kernel.org/all/176648931260.697163.17256012300799003526.b4-ty@kernel.org/
>> SHA- b729eed5b74eeda36d51d6499f1a06ecc974f31a
> 
> Sorry I cant do that. Please send update based on patch already applied
> 

This patch is based on the commit pulled in linux-next
Clean applies to the present tip

