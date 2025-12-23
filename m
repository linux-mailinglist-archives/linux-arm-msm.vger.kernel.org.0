Return-Path: <linux-arm-msm+bounces-86369-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF08CD9E5E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 17:08:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 81F473040774
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 16:07:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5ADDA2C11E2;
	Tue, 23 Dec 2025 16:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lxqpnrKs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ej3orwc4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4F692C1580
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 16:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766506071; cv=none; b=J1bjAXtPbR24P5akATC3xm8tmpvyOii832D6MuXend8UOVtPW+W73q9b+xqClkn1pvwhinT2lba1snL12HEv/y/4A8xGS949EYX+fDifMG9/7Mb5GjWAJQNAH8lbz/uXI88HTIobN3foey76P2w27fZsQdkIavDaNU6eERAHpVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766506071; c=relaxed/simple;
	bh=YdD5Kq0TZf1TYKtFanhPoaAha2bwUa7ZAco99EdeE30=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SXbrP9l6OvbRVhFCIYK00BEkw6fj2mRQ73oLElL4OAJfRpAAtIbKVEZg58S/dz2rWJxnuPtP15T+EZgEicQw5w4b2ZFH+ou3/N+XN52MaxVbpqwR28hWAnLR8nRvKcLt9ZafmTdx9qyz+sYulJEeijEJJLZW6wKDWFHf77+0MhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lxqpnrKs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ej3orwc4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNFr1N94134029
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 16:07:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kbtm09XgsnHXRaYbnO3t36Ix
	nxTu+GwnF6MLf76D5Fk=; b=lxqpnrKsS27cpUGKjROT3DCFGQRfyFc4EHtHPU3o
	1aLM0WtZolzWCjdq7laXK69n0goUs3k6/WlL0KUleWpBX7gKKcko8kQ62ZePOnqU
	I2Kn66zunwtbOS2+WrDR+H8NHfCuapn0yH/Ny+oyEijh3Hf3z8K2KOR7VzsOuEEs
	fMxiu87lxO2dMdeB+jtAT0k/6usml49X1Y9D8LBCgO8K/93nyUx9dhulS12xckE5
	9Fng1qgAPc9gF9BvL9NisyALUWBJsBQEYX5WgXoZqJHIn7FyRQV9UXJRDMqy6MiD
	Tp5dxCcNluXcPWLymfp6pV6kpKLhJF6biumL9Kw116g7EA==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7x46r1vv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 16:07:47 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-78fc5b493c8so35203327b3.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 08:07:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766506066; x=1767110866; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kbtm09XgsnHXRaYbnO3t36IxnxTu+GwnF6MLf76D5Fk=;
        b=ej3orwc4oArrcdyIAYdJT+Ax3FzRlH3JqPYyHkkBsWT2DCqNeDcUGkk2f6iUqqWIKe
         1M1nZ9ePAsN6Zg5mldh27TX6gyRTGG9ftNWZotcni2YjCPBJMW1FZP8HCeCfx4DDWszH
         ajIelx1CBzLg11cpYlhe/otCYBAZkxinhXWwSCi1o8J0tVLbgoGalw/bDftMkQMOY0R5
         yn5xoxVTwUoVEhlICDciISUU1f8+ZUe/X47Lr2auVMJlYp4ZxvkHXjYceV8hz88vHWgu
         oIcUiyHLcNCvbmXXAaZdc98+A+lw7TkyWVDdEZ7C+JBCP5S2ACREyn3JYKdXsSENNz6R
         t95A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766506066; x=1767110866;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kbtm09XgsnHXRaYbnO3t36IxnxTu+GwnF6MLf76D5Fk=;
        b=lOX2xwgMr8Dohs/OysGLI9irHTFfR2TcZ7+bMv/GWZC66NcEMrI/J6nWdAjRXfOtmU
         XR8kG4aiT75OtjCn2EBjSmcMmtwHvbAccPnmqc4/4+eVKXogyQZSYsnPycmBQ3LIft21
         IYeHVXvb2pDixXw5sknjM/VnJkYFyIX1qoHdWDvCoz5Mg6gMsRkdi6IeH4JXesg4cTRT
         szCTaixjO/RljHb60sD7oHv1MhHAvllYjVwTv7yh/Wlu6r9zJA9q8nFbHKkv5dPqHrbV
         I2g4qT6yD7cbw8+HOPfk2eWmsVgU7GlpjF+vhf8oqSrXtTiSX9YEvwVpNH9/Wt4TbK34
         TZqg==
X-Forwarded-Encrypted: i=1; AJvYcCWGqOL3b0m7GAnFdWvwbRdhl4zVAGkPeVWjWyQKBVU2YIrvVz7Ky4IneovgCuxgBR5Fx1EIp41qA0uFBo0s@vger.kernel.org
X-Gm-Message-State: AOJu0YwVoxiHZU0xkl9vilDkB3B+JYzHQQ9mpx7dztWSvuqP5pf5LQKc
	hiOwH59bloCs2unQOkwuWM0w8/esGfmcjNbM05odzLXODpkHcDgcn6zya3eliytp+kQhlQrYpae
	Ym0WWgIjx5S5u4ky49PFnphHAxty7seSnO8/DHVaZM9UI2WEYecNUnaBmuC9WQFEyEHtl
X-Gm-Gg: AY/fxX55w6Ag9g79T0UCxoXiO1LYbNPT4yJBDbYYspHynEhlrwBfd2MD8Ws2VlOXoxw
	T8pkvackA98rp9oozG2qP1WIvjmyTueBS8edwpmH/8pEoFtZgpY28ItVwpGoLQbVKtrvXceTmH4
	tyNpugiMitOKbwr/dt2iVEM+WcrfTFs7HZ1v7KFuF8HaPT2r7K5EavcBb6Ck6VoOBrsrf9+K5B2
	SEooEEFHzxAgci+G2TkYoKNfoq8owuSWBzt3FVQkzbzkDQ9xeQXhH8ZyI2FJfLqG7Tt8u/R3ysi
	AnO3sE1zKQ5mSsrwk8xnOSlLSWjxrVadWmkmZpghkWa2sjygqK8mSiK1EDyEH60i7SLquVLrY3T
	Y0aBWj6iT5FhVzbaQs69k2A==
X-Received: by 2002:a05:690c:d1b:b0:786:3ee8:6703 with SMTP id 00721157ae682-78fb417c7bbmr116684497b3.48.1766506065944;
        Tue, 23 Dec 2025 08:07:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFSHQuIo3pRz2riwwISQLa/iVvhExEFa9vzYsYI/lDVGWXoCsnaqj3YhJahBtrnysEZI7FYqg==
X-Received: by 2002:a05:690c:d1b:b0:786:3ee8:6703 with SMTP id 00721157ae682-78fb417c7bbmr116684247b3.48.1766506065469;
        Tue, 23 Dec 2025 08:07:45 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b916adc61sm14291553a12.31.2025.12.23.08.07.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 08:07:43 -0800 (PST)
Date: Tue, 23 Dec 2025 18:07:42 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Wenbin Yao <wenbin.yao@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abelvesa@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 0/2] phy: qcom: qmp-pcie: Add support for Glymur PCIe
 Gen4x2 PHY
Message-ID: <mzs4x5bme6oewfptxx3tt5cdwuweu4vjptvd64ika5p5i7kj74@3iqgysicqugu>
References: <20251216-phy-qcom-pcie-add-glymur-v2-0-566a75672599@oss.qualcomm.com>
 <aUq2VWecmWRNX139@vaman>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aUq2VWecmWRNX139@vaman>
X-Proofpoint-ORIG-GUID: eVBPdQAYWRSTe6K-8z4Qyz8ZdbSBZwlP
X-Proofpoint-GUID: eVBPdQAYWRSTe6K-8z4Qyz8ZdbSBZwlP
X-Authority-Analysis: v=2.4 cv=aOf9aL9m c=1 sm=1 tr=0 ts=694abe53 cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=DdBtMnqNxkYIvXj6ev4VzQ==:17
 a=kj9zAlcOel0A:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=kz76AC6XHOyiVgLuqU8A:9 a=CjuIK1q_8ugA:10
 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDEzMyBTYWx0ZWRfX0o+tpSc4NDz4
 Nh6xZ/naFFDONJi/xnOPHfNvhIvrcrphaz45FGGGjoDQwQvWKtjsuvLrh3s20XP8b+/yTcfJCtK
 JGgo+1N0V9Bs2YsFRsfeYPLwqkh9ONpRU3BO72PZQPvq9bLptsnRwc//ZilER6t+rC8ixAnkPtm
 YeiUHbr5PTJ9TndMCyTS0PHqNU6clwSHDq0c/ya7CGvctXtCU7smDZgC2jD0HMJc7m/O2sSnYLJ
 Y8UW1jIvz4sLzrLMgwp+XYZdPVrwRKS7Mx5+KJVFRsLV0YlrMsqMNXmOTTf+RmbZeMWSso7VyMq
 o9v62Pd/HHJazJbCrIlWhMiC86hX+HuLjSx+5v9WDQ6XavDUs6iPDb9V/wjInStRK9lXblFoyoJ
 t5ErQReyEYqBN8WrC48yAWSbEntwLWC7u5qamVrV4PpUn0mU1FkVwe0/eez94//rcaip35OcS1t
 6nkkLmXto/aJThqgAlg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512230133

On 25-12-23 21:03:41, Vinod Koul wrote:
> On 16-12-25, 10:25, Abel Vesa wrote:
> > The Glymur platform comes with two PCIe Gen4 2-lanes controllers.
> > 
> > Add support for their PHYs and document the compatible.
> 
> It fails for me now. I guess I picked up bunch of patches which is
> causing this. Can you please rebase on next tomorrow and send
> 

Sure thing.

Thanks.
Abel

