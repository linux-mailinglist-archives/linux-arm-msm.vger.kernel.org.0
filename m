Return-Path: <linux-arm-msm+bounces-79082-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 63045C12B50
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 04:02:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4A5D44E33CC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 03:02:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98C8B2165EA;
	Tue, 28 Oct 2025 03:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CVIb7nRP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 097E61DDC2C
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 03:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761620536; cv=none; b=D60F81/JVvycog5lVh/A2nwwZTVmtUvvFtl8TjBsLqRs00YE5XAqGMJzVigj3UN5wgWTcUqp7xXVTPqaDNXZcsWDMaBwMAz1RjBR1REmwwa2i7rQQEhgNR0Ukx5MEzK7LZWMZiG6n8Z3N5+/+qDa2/UdJyd+xLD/uHOIIKaCgMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761620536; c=relaxed/simple;
	bh=J97EGj37o1LYAf64oQGIuCna3MTQqEBoZLlajyaxXGM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dZtfixEi7k2cuNlEvo5nQd4H4ktxh4dxBwBHr1+eniwcxwUYWk5Xsy20mwMxCno2//bObN7PBjDzRd/iySh74zQlYu+lx2FDgr8XHPIu8o9yzMRk9dy8TcLdF9xxIAsK1+daMNWBrFW8Tx5Ct23ljGFI3OZrOwBcvmhbbafbdQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CVIb7nRP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59RKjtB33813156
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 03:02:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mZT/6+ObGcxpNvzNL3larcNaKCkvBwUwpJYv6W7bOhk=; b=CVIb7nRPeXQ1xUQF
	GSBi0Ve6BZlknIEfrbX2UGzMgJqeCLiOz9nrOyxmMs9+cWdHXsSK5gu5JEcuSaj0
	qj5ZWOTEzszKdFELKzf+W3AeBs7XgIbzl+w1H60i5H1ngjN0JptREGRuG32Ygtku
	B4ClVxo8D1h2gSBvTj0OUkbcXEcT6gBqNDESFgXowrFOGh64jX7Aij6ylxuztoxy
	T2JeMRilZCOS7QKUsIO+9xlN6dSwiRAzyjHIgM1nP/lYlAUYOrczGBQOaCnCwe7Q
	vtBEqd7b2wEGQlmcT8eAJhg7ZxMeHl75dZ06gS+hji7PPN3WOwttsWb2I7ZE9kls
	7Oewzg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a2g2frsne-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 03:02:14 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b6d00539bd9so188215a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 20:02:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761620533; x=1762225333;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mZT/6+ObGcxpNvzNL3larcNaKCkvBwUwpJYv6W7bOhk=;
        b=JzsxO6jNNt31RmIwblJAkzDWurzzpENBZZRUG82MYuuAzl5O39rB9UlIkvp0/yn6HN
         slRsfB8b1H79TLw9VRQdFaM9VjaMBnFgiIP0C51F+lwGWDiOT8dGXqxjtROJpimka0Hh
         gnNMv/9titptu1UCWE6MADtpFRkZjjMHP6L6lvQ8Pyz0wrbMIHsj+7Tm/+yRHol3Rwut
         408GnneEVnCMPlIOMo1OsSr+O7zWNCbNFOA1pD3apkqPkMF60SNxdwusEV5gdxzXc6NW
         FBqeyu08xJeWkqfJ7Re56jy2K1+TyOsBhMIyMMR5+rILYI/KOHqYkpEH+HAHl8fzC5Kz
         C18w==
X-Gm-Message-State: AOJu0Yw1EibCVVylD11TwL/JXcXPmO1B7GXuiBgfwc4cXPG7qUWjzzr9
	C81JNFDLB6AOAHvONWgbmLH6WQ+QcD6eecytDvglp78xokwjy9zO7/r9IsoMKgmP6Jhp/4/c80n
	k/PhHDL+CnWTr0KpOT4Wu49P402O/Mrg4NXUo4IXpk3M6XJaouCZoY24aEGoaM9mzrBVu
X-Gm-Gg: ASbGnctSdaOsouGK909FyEGEIfWIldwETsUc6OLSu4576baf3rfz3ndDBSr9De2N0M7
	uBXUoYNXlEwt6k2h5CpUKyi55zcxPlG1+CmkluNHQsrWgYTKB1t0lNf9Xh44O9u3d5Ki9nmqlVL
	mGSX3aQi/rqO5q5kXuUqtXg+gd9RijRVET4pMrcEnBlfEAFF2UzExlx3G3h3QjChWPIHe8728zu
	gSN0VfVRJPdVGYEnYzZ+nSnMPH0S+qsr2L9n+PvkhiNBpa+sDEXObDiiU7Uc9tMu6lj3l9sVWMO
	lZg5tsP6j0EXjoGaa5eUWHTGO03wboZxU5xkT21Eb8Q8fguC6EaQ+fq5cu9bZ0OlMS3QUGt3S5h
	PPKg9viT0Ni8VXEXEIhGOaXcZ0+6605Igh0Jz/BDRZBTgcrpMmgj/vQ==
X-Received: by 2002:a17:903:2c7:b0:27e:eb9b:b80f with SMTP id d9443c01a7336-294cb37880bmr12041815ad.2.1761620533205;
        Mon, 27 Oct 2025 20:02:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGjH2jcjwExR9ZejktFCScAZsb46EVXd09cixcaCyHqdEG80lz4FVfKGqiyH60DFpO/NfhY8g==
X-Received: by 2002:a17:903:2c7:b0:27e:eb9b:b80f with SMTP id d9443c01a7336-294cb37880bmr12041495ad.2.1761620532610;
        Mon, 27 Oct 2025 20:02:12 -0700 (PDT)
Received: from [10.133.33.249] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498e42f5csm96570895ad.104.2025.10.27.20.02.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Oct 2025 20:02:11 -0700 (PDT)
Message-ID: <07c5c404-e2a7-418e-af5f-dc7c4df9f2f6@oss.qualcomm.com>
Date: Tue, 28 Oct 2025 11:02:07 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: interconnect: document the RPMh
 Network-On-Chip interconnect in Kaanapali SoC
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>,
        Mike Tipton <mike.tipton@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251023-knp-interconnect-v1-0-df13182aceac@oss.qualcomm.com>
 <20251023-knp-interconnect-v1-1-df13182aceac@oss.qualcomm.com>
 <57bc950a-a62b-4218-99a0-86c570bba6db@kernel.org>
Content-Language: en-US
From: "Aiqun(Maria) Yu" <aiqun.yu@oss.qualcomm.com>
In-Reply-To: <57bc950a-a62b-4218-99a0-86c570bba6db@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDAyNiBTYWx0ZWRfX7VWE1eT6ef15
 WgNS3oQqhCb9hDX+6g5S7Z6NEp8mBi5bHpZ93uAOTjUSRnHEvtmV1yjh3/qjOvEHTOTNrQYzMlH
 NFtIgZ2FO68cyTimswKrFjlhRY9IhpP/iH2c1BffKTqmmA2bdhEprFu82+uYIAxlacFnPZUnDxx
 Ff/7OQ8cwDZULgzq5DXcQVR+96zEnU9gP5oEdbK2jyj2YELMNStV3jiQJeKwwSzYcLpKQM427zK
 lJKhuvX+9Lc5kYXLoQ8c+gqvJ3VQWG6nsMb+vTk28ZHx385VGZaAaGyrRi3KWLf4FVkhgdAbUhe
 7qbpzcCmKz5oDAuk/JsbKw0ARqAUhAY4dbQcoC3DoQy8RuyUjlaZiqRHRvMcEnI7OMMJpSNf2kT
 8A597S6mAC0lywpbZMQvomsiVb//vw==
X-Proofpoint-ORIG-GUID: irhhz572jHhWxNmjSESra7vFg5eE9NnE
X-Proofpoint-GUID: irhhz572jHhWxNmjSESra7vFg5eE9NnE
X-Authority-Analysis: v=2.4 cv=FIMWBuos c=1 sm=1 tr=0 ts=69003236 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=aNDXB-n8nvUMI_014rgA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_01,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510280026

On 10/23/2025 2:23 PM, Krzysztof Kozlowski wrote:
> On 23/10/2025 06:39, Raviteja Laggyshetty wrote:
>> Document the RPMh Network-On-Chip Interconnect of the Kaanapali platform.
>>
>> Signed-off-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
> 
> 
> This cannot be tested, so there is little point in doing real review. We
> already provided guidance - and it is documented in your internal
> guideline document - what to do in such case. Please follow internal
> docs to decouple.


To be more specific:
Please drop header "<dt-bindings/clock/qcom,kaanapali-gcc.h>" and use
ephemeral clocks in the devices example like
<&gcc_aggre_ufs_phy_axi_clk> <&gcc_aggre_usb3_prim_axi_clk>
<&rpmhcc_ipa_clk>.


> 
> Best regards,
> Krzysztof

-- 
Thx and BRs,
Aiqun(Maria) Yu

