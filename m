Return-Path: <linux-arm-msm+bounces-84545-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 62000CA9FAD
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Dec 2025 04:32:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9556F31DC808
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Dec 2025 03:31:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0067A22D7A9;
	Sat,  6 Dec 2025 03:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ISUwJ69r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TH89GiAW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E19E21E087
	for <linux-arm-msm@vger.kernel.org>; Sat,  6 Dec 2025 03:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764991886; cv=none; b=ph9NnnccsuwHqPbR4rM5D2Ih+NUlM0ETjIRD3tTnQed+xii4yFD8l/xmqk2kJ47/OxmnVmgXA8x94EHkluv9s1nFHEEHOOWVq/+UllD60F+D2qf7qyO+DVjO3gqpOSpuHJQjWSFW6OHrYpwiwgtkgTcLsXO83wxFF9M1GqwrqUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764991886; c=relaxed/simple;
	bh=tZDUog6lNKVKPYGBiNqGYHX224UmseDtPFHcP/G1/jA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EN8Z2x1VxHBcSt4gjUXPk7c7sNhRuLfP/uB1hOvDySMMoehuzEuMMcx7KTO5KovPDD4tSe501uUgwQu0cgLcA5nxk/zeZQk+4cYb6gPYWWwS0qo45aNFtsopv71Ox0PlnZjtEef5LhwfNhzvuV535KlUBxkjNgTYG1U9rGeUI1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ISUwJ69r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TH89GiAW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B5KYHqA825944
	for <linux-arm-msm@vger.kernel.org>; Sat, 6 Dec 2025 03:31:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Jd8K2GOuhr1t88wH4EYraA5x
	kKERr4HZOlt68e1bdTQ=; b=ISUwJ69rn29uvLLw10xH/2zfu75u1AhobAPcb4Ot
	udC4cFs7XPhJ32QwD3Ef8wh3UhnjppDUGC7+bU9j7nfEzy2mE9Ub3Mbp9inxMX0X
	LQzB8hbw8a/wLW9hKTYc3psxc3TWx0uaallHc/fW8g/wBMvbXFq8vEm54Hj742uY
	ZCdb+DYZbXFUKiMvzcfE+Uk7paUhsnBYkuKf7pD5Y0ZHlj5eSiutM9iYq8IZrXsS
	cf4831+6RGIt1hECk8kRpwvGpqUYtYFBJ5aHR+jPgoFUGTF04/8lJO2pKS8TZBuT
	RUf5As6h/4s9aEeCXGid/6BGAZnJPCP+Gkka2lXHqTepwA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4av6hu0rb8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 06 Dec 2025 03:31:24 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b2dbf4d6a4so663975285a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Dec 2025 19:31:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764991883; x=1765596683; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Jd8K2GOuhr1t88wH4EYraA5xkKERr4HZOlt68e1bdTQ=;
        b=TH89GiAWG5oijkW6bBlTO+FnU576sA/kD1T5Xz0xOG8WomntXUSuhV8urEmse+x+tO
         zRHxYjstIPyKp8vLJ6LUro17lGqNY1L6V2HdA5qccnGOM2PUFWo2V1Yv1nXqMrsXDysj
         2uY8LVKk2YKU/RJG9I19xn/7rLsVWvS6ujPELA87Fqg1yGZm+qvPpDLTH9PpEzNPuh1j
         CFEHeyBTZwrzmxl8gYrz7LzjEh2hdq3WUi/bIV0RsuBuomOUZP1ZCriH9S/FD5z1c5GO
         3rNKVMnjFDkrmKXPNnqbSWg12iLpDe2ZoQO94geBw3M/DuGmvn3O29H9H8az0t9wx9aa
         KS6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764991883; x=1765596683;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jd8K2GOuhr1t88wH4EYraA5xkKERr4HZOlt68e1bdTQ=;
        b=sxCeU8Aaj9qejlhvqTUTYa2GBbZXa0PucxQFuvn5l7YFPh/VblmXlewKcx/gPtm/Jb
         kEbSoD6ffhU61ZbViYCmt5/fmWTtBrafQK33IXaaqiT7dg8zigPjQc5bMH+2ENExI3li
         VMhNUL1OKLfH5mykGpTJDWEY3vfEneffJh+yf1amtytI30bH+2ajyHS0R7LyXfthBuOW
         E0AH4KsOtQR7Mt9lrUiccH4LjDu7QGYWaQhLMDOESjLICuWim8NKgoxmhsxzcJZhhkPI
         0MtV3L63DpkL3IAQ2bhO9ICASRRDp+ZQ0gE+yQ9nh4bnp4vdmQS0kqdIxozBikKLQmtp
         DYcQ==
X-Forwarded-Encrypted: i=1; AJvYcCW66/jKHHCtY9oKt7ZzHXAyEbR0C7KE5uJe+7VDA/l4DB3AsfRaPCcW/7dhA5I+UwzHqqm4GV3zUTgKBspw@vger.kernel.org
X-Gm-Message-State: AOJu0YxwCben5sQNgfJgSdX7i9fr51JEbxJZpH7X/VNjtvJ7D8rWs3Ak
	n2z/YMaVCJDfIbw5pYK5TRMzVQrZRHlHiyrV6QrvG8036tcIXsbadGwB/krJYsH6Q9zM8MYp1St
	Rbq0jbtEIBS/1p1PLG4GH8TsRtRxZ1je9NZ7viuUr9Yy8FBbLgd1tJaxwv3RcrjUqgPw5
X-Gm-Gg: ASbGncsx4q/8LZkPUsJ8F9GAY4KM6mnMCgPPWmPq0KwahwbwdbI2tMQAA/5ls0wIf/r
	L/97ibqA6HFbvrIvUR1fYJKwaCRjCxCARqtYl+QQcBuyG96JNJd5LWsQ03vwnvlJUK4yfKNPb+v
	i2knUPVYxP7np2m0QXR17OjGLQ+8SgFYa6GeZyFc/SAp8XvhqMWr4D01ClehIDoVRZ203bv+QmB
	qfj3oyywtF5tG1yR3eDJRudhbiHqZXgN+tUelbUvP8aBzCman7OwbHLviMsdLuMOKijEW/IEPyu
	UC0+p58LJ9qmTDYJowrq4BbsQ7EQ8jqPTjbCm5wj6bOEVm0/dmSYtLADVB0ISnSPsQ1x/Cn/bbI
	fD4dokBEu0MRyPl1B00AKUiPLeNPt+84q9zmDz3b2CyVMRxgb9oJOcArQ7GaNgJ91KkxyN3R1db
	KR3eeejp65fkdH8VQ0rzmxYkU=
X-Received: by 2002:a05:620a:19a9:b0:892:43af:ba4b with SMTP id af79cd13be357-8b6a24ffd23mr189640085a.29.1764991883302;
        Fri, 05 Dec 2025 19:31:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEq/WTCdX0fKoZ2a2azt1sU2iXBXTs6gQI/MKqx6/FpzOFSetrd+1fb0pJIcD5wp+8nvtWg9g==
X-Received: by 2002:a05:620a:19a9:b0:892:43af:ba4b with SMTP id af79cd13be357-8b6a24ffd23mr189638585a.29.1764991882924;
        Fri, 05 Dec 2025 19:31:22 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37e70596be1sm19423201fa.25.2025.12.05.19.31.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 19:31:22 -0800 (PST)
Date: Sat, 6 Dec 2025 05:31:19 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Xin Ji <xji@analogixsemi.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 2/2] drm: bridge: anx7625: implement minimal Type-C
 support
Message-ID: <kozspjah32l6czhb6kj7jba6vz2wbqldrhw6rov67ujlegrbby@3aeqmn2oico6>
References: <20251126-anx7625-typec-v1-0-22b30f846a88@oss.qualcomm.com>
 <20251126-anx7625-typec-v1-2-22b30f846a88@oss.qualcomm.com>
 <aTGJXAnlkK5vQTzk@kuha>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aTGJXAnlkK5vQTzk@kuha>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA2MDAyNyBTYWx0ZWRfX6ZHLK7u1fF33
 6DyhJCZXUUvwn+al8xn9WkLleZS7bj2EK/tQHDgRTcYMx0Mh2ILMsMoZjSn5pqQtzSLUyPAJ1oM
 H5Lb/T9dno3Pea/wWbF+rc9Gvcz+5obfJ3Y0ER3cGFAmvhZ/Xx2J6y/PqZu3d8l1inMgAvQe7h3
 oCmTgFWT9A1Fd2pFq3oPEnnPIZCpUsRPdAfba8a/nQDJ29gW+Ip2/M93AP4OCHNhOgCtFvFzdm3
 hcGdL5jGqcAeOE7NKZSwebd4h+w7CClG9SeTO+DBKIXbQaBCVZkX0iev0WVMr3yKBp1MgV7/r//
 fjCJeUgqpofCsgPrhCpqKVn4GcgIM3mAhT8SgExwfEuslaqpwCOHcQV0HtZFp7Ivj2G4ES+J+OM
 Kf9PYSSZ8UKlaKLUiUA2gnx0jnzFjQ==
X-Authority-Analysis: v=2.4 cv=NPHYOk6g c=1 sm=1 tr=0 ts=6933a38c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=QyXUC8HyAAAA:8 a=tLDSqiJ-wK1CsxduB6EA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: BF3SnYiRgqOrN9u-iw-s-0AbgUg0R26i
X-Proofpoint-ORIG-GUID: BF3SnYiRgqOrN9u-iw-s-0AbgUg0R26i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_09,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512060027

On Thu, Dec 04, 2025 at 03:15:08PM +0200, Heikki Krogerus wrote:
> Wed, Nov 26, 2025 at 11:41:57AM +0200, Dmitry Baryshkov kirjoitti:
> > ANX7625 can be used as a USB-C controller, handling USB and DP data
> > streams. Provide minimal Type-C support necessary for ANX7625 to
> > register the Type-C port device and properly respond to data / power
> > role events from the Type-C partner.
> > 
> > While ANX7625 provides TCPCI interface, using it would circumvent the
> > on-chip running firmware. Analogix recommended using the higher-level
> > interface instead of TCPCI.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
> FWIW:
> 
> Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

Thanks!


-- 
With best wishes
Dmitry

