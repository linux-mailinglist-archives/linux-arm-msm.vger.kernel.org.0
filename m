Return-Path: <linux-arm-msm+bounces-84317-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 069A8CA2E20
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Dec 2025 10:02:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0219430198B8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Dec 2025 09:00:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36E7E3321D9;
	Thu,  4 Dec 2025 09:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PQzV1mCz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B6xgDBKW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6BF7325716
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Dec 2025 09:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764838858; cv=none; b=JN066LLxcz+bBmISy6WnK0UB2P/KiZCS1aQcOuHCmjr7soWoHv23lfzm6hOMJmFQHYZW/IRnd5WFxbf6VJGObWxH94IshhfrlJr1ek4IfdB8gnqO8hGmLGHofQOVfc9Qx6dzFMI90rTPr8osMk9dGESypbuApLiye3G0xJArFpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764838858; c=relaxed/simple;
	bh=5E6S0dPLm8Ohe7mo0eGfVPgrEN2WZZY5ddZJmTz+QlU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YECZItLyHz1iDd/bMWADKf/1xr/A5+gntQ5IXjGPPkpTmHo3nsGXsHmAqBdDwQmJ+NnoFvLa+3UY6W4J8UNXl+1VB9EyYXpyUaF2yUTGE9M2UydadWejvcCnNylq2zPbHSUwuGbcuEkO3tT053eTHHid8gH0zuQDtjNvGE2NgW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PQzV1mCz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B6xgDBKW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B47UAoU996930
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Dec 2025 09:00:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xDXeYOjzhKpabC5NsVejdvuv
	bjmZOnXSM2XSS6y4hew=; b=PQzV1mCzpdwTpYDXeRury8BXIwwWDj9vDrsjPoqm
	EpieC9xHNkxjzdp6cPGm7ghUdxDWj3TiGFV1VSkP034/GDWhkvL4hozSgO9e/iCq
	0xkBXTncgafNurQdVUnIB0yBt+zsiuqjpSB9UKfglANAfLfNjeWFcQYgib6amemM
	38iIxwGn2l+7Gze8wY4BS6P14JMT/m4bK6V8wKE72AfIJ4NSJA41Yr/evp1bBLnw
	1XG1l+tM8CCiPgzsprJ9aJqKmgIt6+qhDx1dWPSfKgf5ELjGh6Yn3rUQ1TFpeJ1S
	oTKAnL8otC4xC1hqQzaCZ6Rlt0qW1cYTTqTn5kUEhMctyg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4au5yc08k4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Dec 2025 09:00:55 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b244ef3ed4so159986985a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Dec 2025 01:00:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764838855; x=1765443655; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xDXeYOjzhKpabC5NsVejdvuvbjmZOnXSM2XSS6y4hew=;
        b=B6xgDBKWBBiVX7KYJ/IZcw0TvJhCWSh3k8zJXZ/h8jUBBZzdpckf4SmYm693cF44Wv
         k+iOysxqEUnuNQtYdVwSgFnbz3XHT8DxMExcTZtyn56Bz1zE5l/iV9kyjgfBYb1KjdZe
         ppLAU3mdcIUyv9zoSZL8xQ2c04vlpQi+aBTM1wvvHykEl3W4+3qhjXi6+ZXquwp61iNr
         u/3K2vY9mkqa1VDn9011VJW9AwGPSaa+aI0u77M0PYDKDfyMCePPj3OcmYX78LP4dGOV
         N2GDihiKOAWU+VsoSZxRjbKXnsqf9p8DOzor5cAqbRZplhU77WyC14v6AuTO6Tc3NoEa
         tKHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764838855; x=1765443655;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xDXeYOjzhKpabC5NsVejdvuvbjmZOnXSM2XSS6y4hew=;
        b=nmZ9MYiu4nzuWmepD/RdxBvue2wBqN1GAPmnkeJoGK3gMoz7M/VpzPytDazRw+qWMz
         48Sur4+V9mX6cUbIit+wdhZCWs/eZWdBfw2SoD/TZytBm3HC/W93oNVgHJDDV/ioz/5Q
         tJbIJbXEqq2PkJDv8yRHyVAcRchzqpDUQCU8yMvfy0C7Od+5UAD4Efgn+OJ69xEVPQdR
         LxO7votEDqySHIkB91yTaJevSi/V7kW1hIdcYLuAbx4/xCgdyhLbAfKXEStm6S6DHr9B
         ZfTdwyUZi64pebK7CZlxnxtgClc00uf+CxWLWz6iP2t44GuLNL2h0Iy83G7TLFsS7OKU
         m/GA==
X-Forwarded-Encrypted: i=1; AJvYcCWG6ZBLm3DNWs2x02qeaLHS7RZULnZ+GiapQllUq4SdiWzjZ3hYdTB5uZj4IC1Rann0vWn727TrUN7R+CAO@vger.kernel.org
X-Gm-Message-State: AOJu0YwGrxvWhrtHf9kk4zew3q479EYm3/ENwb4hk2txKPqoIjGkMOmc
	oQgCqrVvjh2T+kUNRmFXla+LzxXPiyX8zHZ0Lj8nmsJ2kMT2wrnMC9wXuT5MUBa9TX5uaZrQw5I
	rxwgDs82/DmsBRZnKRQR47H4NhauqYXWHHvIyY73QfIWVRb0iXFMuB6XaDyqXJHQ7w3ca
X-Gm-Gg: ASbGncv3BEPfIZgLDF9QV4FXX13kqSi9jFLB8ikrclXQcyhWGSa3Jr91a8CiZKXblkR
	U/3QiN4f9WEtRjQRfeelsvrlJKG0X27FrrMLEHIBX480UcukholaHM5SCJn0AcqoELkQOblK1Mt
	BlD+WhoaHt4elC/Ljb6376/MUQIoOFC7lwRPhViZ6svLDc65eMXsSuQ2ZtvR0qn2bxrVyjmBzMQ
	HlNChgPVWkClhVjZ/Sg/0B179ecMv+tShFk7hyNJ/pwlFySsweinFdPTRS5iiuVr9cu4s98w2rK
	BDPV7FCAl8r7IVpbCEKMa5z2z+zYq210/s5tgg7V7T32Rxvru5FsjMxqPtKSkh/uGMazlIYkjPJ
	45Myl7n8=
X-Received: by 2002:a05:620a:280c:b0:8b1:59d9:f1f2 with SMTP id af79cd13be357-8b5e59273e2mr673426585a.24.1764838855031;
        Thu, 04 Dec 2025 01:00:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF+24TRblZFUTpIZI0DG40sitO+5mbYpjRM7t50v2HG/wx32vXe50kIyvRY4gE0Hkdi4PSaGg==
X-Received: by 2002:a05:620a:280c:b0:8b1:59d9:f1f2 with SMTP id af79cd13be357-8b5e59273e2mr673420885a.24.1764838854507;
        Thu, 04 Dec 2025 01:00:54 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7d331e29sm2050193f8f.32.2025.12.04.01.00.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 01:00:53 -0800 (PST)
Date: Thu, 4 Dec 2025 11:00:52 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sm8750: Add camera clock controller
Message-ID: <rhbqnorbvcnwn246lo42qegvjwejiikicaf4aifxnquaiejheb@yc44y7fyxxsp>
References: <20251203-sm8750_camcc_dt-v1-1-418e65e0e4e8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251203-sm8750_camcc_dt-v1-1-418e65e0e4e8@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=QstTHFyd c=1 sm=1 tr=0 ts=69314dc7 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=DdBtMnqNxkYIvXj6ev4VzQ==:17
 a=kj9zAlcOel0A:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=hZ0LF6YWMy8Vg1z1-YkA:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: 0VG2_J1ceMXUKoJiwvxaWGWgiAYErhWA
X-Proofpoint-GUID: 0VG2_J1ceMXUKoJiwvxaWGWgiAYErhWA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDA3MyBTYWx0ZWRfX8jMSgJ06lS9N
 TxotQGC4CTOapxdqsZdtWguBnKgu6VW1Z+CAdi7lC378mNbIlY9DgbLIFcjN6nJx5FlhU0VgYFh
 oDU6qf+KUwqFRMCG9Uvnufmh+hIWs4g42Odz/hREGeoK69jrx955gSEqurOOyKZfqMwcSBiBB7l
 3Vzr75aXxg2obewM/CAUOKBgw3Gml2IAGgRyNPWoPSTimNhuA1cV/+ZHppAIbucIjfPgBkkJyId
 m3NG84Zh/UsoRe52kwIrTjuK5YwYghMXUwwFAG/F6eZtaVnt5vJmX/xEhwKh8tAB2T4aZgaii/f
 Ss+7C1EJF9G+9xo7WHAA4IYsN98mx08ggcPLqoR8peI3Wicc41fAwEYV3fS3WhIQ2wH3Fm4VinD
 AaKYdAEvIneqtNRwudgq5W30f2NBDA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_02,2025-12-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 priorityscore=1501 adultscore=0 bulkscore=0
 clxscore=1011 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512040073

On 25-12-03 16:02:07, Taniya Das wrote:
> Add the camcc clock controller device node for SM8750 SoC.
> 

So there are 2 clock controller nodes. Maybe you can say something about the
cambistmclkcc in here as well.

The rest looks good, so with that:

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

