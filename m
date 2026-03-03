Return-Path: <linux-arm-msm+bounces-95227-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GPViCLJzp2ljhgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95227-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 00:50:10 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 77DE11F877E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 00:50:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E07A6308BCC6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Mar 2026 23:50:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 513F53750A0;
	Tue,  3 Mar 2026 23:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k/kkHosK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EfIqbFqA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 298BD372EF4
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Mar 2026 23:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772581807; cv=none; b=OfVT5nRqz1YB89SLU8meRHYye5I4OVjcuH8exdkagyQg4Z7XOJhEP3Bid99MU95roxOWPsFwMv9JO7eC/7gFvGMy8N/+tF8pk30faaFwr/5ZplLLnly/bOx1HoswE39nuV9gIdan3pCUweBHKX5Xw7lHFQqRxipCZiT6PUNsnu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772581807; c=relaxed/simple;
	bh=17DO/aaM/m3ftdShmzj/Mm5JSnrdIVovbEXiCjDzh5M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jMdIJ2sC6ToNVXOAB3ivz3oYAfBG/0OZf7zFmA/99QmY23SZQLhE6yl0mKZgZVYhVJ1es0KV4XPeBYNQE/BevJ99V8a3QOHgfEnNz7C2OzaXmS4pE83+Tqd3Mb6xkwUcDBj+imztX/MrQbuoRuOJquHVb8GZxiMjxC4HzJmSSxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k/kkHosK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EfIqbFqA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 623HBGI22786691
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Mar 2026 23:50:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PSQYl+DYj9/icAWsCiOj/vArBBpEwz/JOcfkETWeZN4=; b=k/kkHosKWm4MCFL+
	+B2B7KOhrZF0bgcZbPim0nLB73JCdPxEJLgYYABUKt8MrTgfr7u6ONUSC4a1DgGO
	TSBvPsaGca5ASjf4z71s/OwqFmFlpcQA4YYRQXoyopevDwUJ3+hoNyOnTW5WUAnD
	hEcTvDwwSVE08pBOqCUtkb0UKOB/D1O8zv6dbLAA9RvLx8DqX9xj5PLqVnoUjTI3
	zNEj9Jz9g8Pzh5jQXn/Ez5YMIPOiLtUEIMu7yT0eGiUo5vdovrxW8+YQNavKZRDW
	ENUY/28Goct8t4ExS5UzcZgCC7utd1ea9gu2fZ6Vtxf8wyzMuhX6zknvu7MEqQiY
	h02Wew==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cp3tvh9wv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 23:50:05 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2bdff07d8f4so4501716eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 15:50:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772581805; x=1773186605; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PSQYl+DYj9/icAWsCiOj/vArBBpEwz/JOcfkETWeZN4=;
        b=EfIqbFqAAYcfNY6QlyL6IguniycaPAjsLPTiDi+tgpSOLxslZDycvCzicIz9TFn5RC
         waxDMMY9pP5akizx741UJxU6NA73cFF6mvq0dmLQm6J8Xws99gwgd1qn8xPTmLY8EpJL
         JpTlVj0VaoDS3bwA6cfHgw3xTyKAKxmGDc6z17mJ8Vh2sTsL9nvVH6B3SQjmQsaufki0
         YimLD8e8p5Pig2PhWue3BCPlTp9+ZTSd+tgPVJBt6af7X9NgJgzUJejpLvGiNWUuys9v
         w4oCbF/f5W2F+spDMymnORyVXmbKHQw72hSqiIazaFuW/11Y5bmER3jC1tzMzGiZrEpN
         /Z4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772581805; x=1773186605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PSQYl+DYj9/icAWsCiOj/vArBBpEwz/JOcfkETWeZN4=;
        b=vxH2GZNKntRAD5S7CMZOTLbUVCoqguOrdiktAH1EZSsBzcUGTw99Howgikjbu/9r+C
         qrs38WdSgxm/W4/QH94VJqdY2gFS5dXwW1iff8cKPkHCZegenaXFGQLk+XrS6RONzzFp
         lHH9tOBabqLASJ9SGo0x44ENndZPPbtukoA/1hNcPflHDk/NuemjvvfQ1qncDVODXS7a
         1q2RP4o2vaOxll0RkLphJhw4WWVtIyesHgwPdwgIxuBwKtF+LcMOLBV8xeYbX49dF0Sp
         94rcV7SnqdSXZyKHPsEGgziPwVEwHNSfCRlzInx9CKk4ucNTV3mZ5arWdgfhTrvn9yYI
         g2jw==
X-Forwarded-Encrypted: i=1; AJvYcCX2XAYXMM7tLwsthOX0JPOoagfdlWkEB+LFu1pk6LBfojPoYNmKGooeTUj7GCZHCbCYn3NmvhWpQklWuPz0@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7A2EQasKICIOA9hTLEuZ686/CeFLHYkdqFoQpq4QChX2uBwIE
	yQYx6qXnujmZw8bfWhdapnTC0OMw5KCMTDvYpm6gdD2KmhJbKDZtpZ5uX74LCfz6W1jTo3UCMhT
	W2yZMHTV8SaVncbtM5WA2rgD29JUvw9AfxeIyp0zKH0dkY7n8qhuNwfy4RP64cfNG3e2K
X-Gm-Gg: ATEYQzxdwp/za6cu18AbGAEFQypJ/mZ2wwkan9zUkE0KBPyD/DBCKFUuIpfw/DPSi/+
	YQYBVYmX+Va8WK3gykyR60GjrnwVqJ7q45EatlmTFNyn0CPgwaDQ6KSs29WtaWkVypwreZoRSxu
	9gZlZ8HocM/li51DV5RfdBAFATiGYrhbiRhgEsGfxg4n9C3NZLQQ/lX89VcNy5cEd2EzXbqYwA4
	Q70TmfACkAh1+XXk+8Q0969zXxAjJiBK67oX4YRQoyYc7y3+3e5ioUH5qjtinApscaoU2IQnyWT
	BwQg1qcBIhRNdTV09oLyFKIxVsYFUaEi/n1l9QPQ9hyJF0gw+bc6HxGahw5D60Q2ersEoQgky6W
	vn7eUt3Z0FFWLwcsn5he3pUWHYKrhGsfUWjKBqefyIUdWlxY2lota9JmV0pIXVVigQC7ySwa9OF
	Nd
X-Received: by 2002:a05:7022:622:b0:11d:c04a:dc5b with SMTP id a92af1059eb24-128b70daf02mr9265c88.30.1772581804622;
        Tue, 03 Mar 2026 15:50:04 -0800 (PST)
X-Received: by 2002:a05:7022:622:b0:11d:c04a:dc5b with SMTP id a92af1059eb24-128b70daf02mr9243c88.30.1772581804023;
        Tue, 03 Mar 2026 15:50:04 -0800 (PST)
Received: from [10.62.37.55] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1279cbd1993sm8610682c88.2.2026.03.03.15.50.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 15:50:03 -0800 (PST)
Message-ID: <8e7c2036-74de-4f21-8269-8e2b24323753@oss.qualcomm.com>
Date: Tue, 3 Mar 2026 15:50:02 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
To: Bryan O'Donoghue <bod@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vinod Koul
 <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260226-x1e-csi2-phy-v3-0-11e608759410@linaro.org>
 <20260226-x1e-csi2-phy-v3-1-11e608759410@linaro.org>
 <4pFL6wOeTKUt-Zq4YbjqJdacMgUIPSYJD-4-5DcIMEZ1sM7JsNFYcSv1bd7ZRVOklTsmkEfxM2b6tTflmiECNQ==@protonmail.internalid>
 <c85fe457-c140-441c-93ed-342dce32e604@oss.qualcomm.com>
 <03b44922-72d5-465b-96e1-97a19655e97d@kernel.org>
 <4440a3a8-7281-4bea-bb84-7a9d19ef7ce9@oss.qualcomm.com>
 <2a1155bd-7dc5-4ed8-b1eb-ddfa483c75ca@oss.qualcomm.com>
 <4fea7117-ebd3-4279-9973-3ac4f2a78835@linaro.org>
 <bfTUflirC2qzMSllq_4qHGr3GL6TJ088yNF4lCBtjCoc1sXqz0KcfYyWuQv6TeRtP6GdpqllNp4ipl4Qax4xwQ==@protonmail.internalid>
 <f031acf1-9a03-42f9-b61f-b6fa6bf9100b@oss.qualcomm.com>
 <dde5f82a-9ff5-4f7c-9ef9-470aad17c9d0@kernel.org>
Content-Language: en-US
From: Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
In-Reply-To: <dde5f82a-9ff5-4f7c-9ef9-470aad17c9d0@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDE5NiBTYWx0ZWRfX1nlqG9ZHSoYe
 01bNQaH3stDQhlRllHwWTLzvC1jL4uTtTWeqrqYL0dWpk+V1u6WzJppZGGFWc582L0tykksOQ39
 P8Ao2rNccKL6eDBvyfWVDwjozF3XvD+UEauw52WADpTp3gkLm0z2IPwcg0x6ME7cgF6C5bZ5lcZ
 y45MRLzAxUA3/61mTqUPqPu2Udfi3+cmR/z3tsIjyR8M20V/JyGYr14ZV40skKkvABvHb05Izsa
 +ex6oEuQo/K0Nrgk+tam1FOMTNvUIQFGCCgjc8X/Cka1EybbnLob8qjrwTzMy+3ZVj2rmSypidF
 7rHV125mJuvL9Oy3ixpOn6wf02yx7rz+qUMkCM7daG3OEYK+22TmbqtRQkr93Nu5oGoI9bBeuFn
 9mISM0j2FEunsoko+dQJkR/jQ2wvlGyXvwZOEMAlv6D09XcU1CQfpqKCm3mUs+yjahGQpVqR8+3
 wKD7YnAf3x45ytlFDGg==
X-Authority-Analysis: v=2.4 cv=VYv6/Vp9 c=1 sm=1 tr=0 ts=69a773ad cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=U-kwclmyVS-SegT1OQUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: 6I5u35EGOAGogUc67VGHHQ3d1lmiBJFq
X-Proofpoint-ORIG-GUID: 6I5u35EGOAGogUc67VGHHQ3d1lmiBJFq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-03_03,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 bulkscore=0 adultscore=0
 spamscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030196
X-Rspamd-Queue-Id: 77DE11F877E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-95227-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,aa00000:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vijay.tumati@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action



On 3/3/2026 3:26 PM, Bryan O'Donoghue wrote:
> On 03/03/2026 23:17, Vijay Kumar Tumati wrote:
>> Sorry, I do not know about videocc.
> 
> I think Iris does those itself see:
> 
>                  iris: video-codec@aa00000 {
>                          compatible = "qcom,x1e80100-iris", 
> "qcom,sm8550-iris";
> 
>                          reg = <0 0x0aa00000 0 0xf0000>;
>                          interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
> 
>                          power-domains = <&videocc VIDEO_CC_MVS0C_GDSC>,
>                                          <&videocc VIDEO_CC_MVS0_GDSC>,
>                                          <&rpmhpd RPMHPD_MXC>,
>                                          <&rpmhpd RPMHPD_MMCX>;
>                          power-domain-names = "venus",
>                                               "vcodec0",
>                                               "mxc",
>                                               "mmcx";
> 
> Still not getting an especially clear picture on what _levels_ you are 
> proposing here for MXA - here are the three opps we have for the PHY.
> 
> Sorry I don't get how turbo is coming into this ..
Sure, I was just giving an example. I haven't looked a lot into the 
IPCAT / clock corners of this target particularly. Someone needs to 
check the clock plan, understand which PHYs require which power domains 
and add that in the following OPP table and as for scaling you can use 
the same RPMH levels for all those power domains. Btw, if you had 
defined the below OPP table for TOP GDSC, I think that is wrong. It only 
has two perf states (on and off) and doesn't need OPP scaling. If you 
look at the Iris driver, they link only the mxc and mmcx power domains 
to the OPP table using 'PD_FLAG_REQUIRED_OPP, not the GDSCs.
> 
> +    csiphy_opp_table: opp-table-csiphy {
> +        compatible = "operating-points-v2";
> +
> +        opp-300000000 {
> +            opp-hz = /bits/ 64 <300000000>;
> +            required-opps = <&rpmhpd_opp_low_svs_d1>;
> +        };
> +
> +        opp-400000000 {
> +            opp-hz = /bits/ 64 <400000000>;
> +            required-opps = <&rpmhpd_opp_low_svs>;
> +        };
> +
> +        opp-480000000 {
> +            opp-hz = /bits/ 64 <480000000>;
> +            required-opps = <&rpmhpd_opp_low_svs>;
> +        };
> +    };
> 
> ---
> bod

Thanks,
Vijay.

