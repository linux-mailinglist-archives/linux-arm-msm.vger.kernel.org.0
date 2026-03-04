Return-Path: <linux-arm-msm+bounces-95232-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AN2KEL55p2kshwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95232-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 01:15:58 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B13D11F8C83
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 01:15:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0CEA4301450B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2026 00:15:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A348F29D27A;
	Wed,  4 Mar 2026 00:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RK91ZTyt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LTm9/rJ9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5069A292918
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Mar 2026 00:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772583353; cv=none; b=pQS/QWBJzuvp29ee5yf9dGbccAi1Qp7I6wxlOt0T+p14AAxHhhzAn7F7p7IWfb+LhuwX7pxJWQXEeLHDyz9IwUHzgDE9XGSuYVlwwmPrUzVjesVg/Spe4EKUjlSxmuQB81V+/DkYiEHksORRZTAnbM8KwIkG2pT6xtHJOLBoaN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772583353; c=relaxed/simple;
	bh=FT5Jcmw+E2K6MU0i93c6hzYTSgwHXhLgnQ3a0eUdHdU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SlytAyJGBQ68VElz+Hdtxkh8u/OFnqicWlcNWvXFq5m9lnEDMgUYbysh2tUyvhfgK2/fm+XZwMXpAtHWCUl8YE3q6BYAIh6UNy4FgOdRR1LVOd/MSlG/x8M1IzBGlkHKe39eVqXt7v1jTurdsx6KuEUCQ3Bx9uReA+GSJmIEQwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RK91ZTyt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LTm9/rJ9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 623H0XFF687015
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Mar 2026 00:15:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UwGhxPVXr6fe1FFLz9NwC8zGdlVRdL/GDhYMOcQDwmc=; b=RK91ZTytpuKIA/Cf
	M5wrv6LlER5g4R90DbIjx4a2PzB+BWLrBacSibwYvGXJTcSZHp+viPGGfO82lcCc
	oq5jfbdpxGFA7A22pZN6CRXqvfNIu+9SdGgiCfEUK6to3CKINXamF8dwsMG8x9lj
	NBR3DnoEXmRaDxbSe0kz0dZ57yfqFe3KHu76Tx623i0L9FK8+5SFTHMqcAIAGrgU
	ExhOh4XLY7zVvECPKruq5Hb4JEHkB0rom4TnisK50zoEfagvEPPIKlVMXkkPzkJH
	Kh98DBCS0Dqw68GGa+/Eepd1IMMboi3/wUCdqPv6WUhqa3CKawD8NRv7jzdxnyQJ
	e09v9A==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnu3nb937-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 00:15:51 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1279637cf55so107145856c88.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 16:15:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772583350; x=1773188150; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UwGhxPVXr6fe1FFLz9NwC8zGdlVRdL/GDhYMOcQDwmc=;
        b=LTm9/rJ9CmYNr9VajeZ0jmFqlIOldLW8fPvpx2OBH8Z9F+7PlBghHENeJ7YUWjc3ND
         95Ier0CLmeWCNkr2wpRRuDb96U6VdxqWtzGuuTBhsPCheI3s67LXh4/qI0BrAx7wQBjQ
         JZCm6+X62JO0vteypD2LIFtOhvp4BUpgQiD/Cjs8WOlyU7eT6z2CZF8y34agOmYYwRkC
         3xmcIwI894WJmVof8opw+sKt47Vlqd/mORhq05mdveAvJ/J8ME5Hx8xwQlpot6iHa4pL
         Fb0vbfKgxvwgNntUJ8KEoC2274a8wS+iXH+O1C35B3M35fHCH3b8Jmvtig2ljkWNlorR
         cMjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772583350; x=1773188150;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UwGhxPVXr6fe1FFLz9NwC8zGdlVRdL/GDhYMOcQDwmc=;
        b=e48AeH6mJwXxFR0mVcZDPzZZfpWRpnRWj2nNb4Lu732MSdqqW2RiV8CfIuIatNLK5y
         mONXZpFNUxNdfj8QrfGl0lj5cB1SFKhESK50SiNCXqiLsgTzptT5I5Jc4X+IZPFN9Vvp
         /KaK0w0pIwhtOaKvwskVosh5PlyKcFOnKY2n0U8uiKUbRSKjHQGj4XUZHGtN0qd4y09R
         ejoErh32Say29ncavPpNkaqK598Otkfeh9KXsq5bC2PVwY64BGK0ra6CVAqF4naEb4A8
         3yhoA1IehcFauuzqncbRsq8A1FQj+KE9BulFL6u2v8Wze4Vwfc/givLAOm04JQmjRTFm
         UqBw==
X-Forwarded-Encrypted: i=1; AJvYcCX3K0okcAmyDyl4KHGnNcDGJLiWZpfRiDhSMBgADVnOTvjkSWFCBLOdX4JROZZBDDZ0bzLPeKRJ7I7phTU7@vger.kernel.org
X-Gm-Message-State: AOJu0Yyh0ZZ9/Oyu/VAoNfyqS1C3ChnyyMozBmXbM3cktob8KGFaRiNl
	IMCNAgGOrA12xPP/PnX/aJgEY6lQLBTvibGhK/WXwcpeEUKHYv9T/9qCBrwymPy9ekN8VOnp38l
	IH2SCElNDDWHgSzNsPD7sjaW8czlS2PavV90lH18Osx4AjTKKuLpTRE9u91d9jM7P7R7Q
X-Gm-Gg: ATEYQzy0ACQEqPj2R5raiVtjcNgh5evfKyqLYuJeQZ/ez9dyioUmBh2x07GANhQQBqg
	Sj0+3vIPQ4+HmUJD+mFq/f9DhrBKDTqn7Ie+CDffrvu9kkYnImIyb9E9Jd0BOUzKuLx45+n3efA
	zmVCZlw1K/e/VgMaZcNGtX9+SxLDeFEwE/artiDVDXM+V6gVrUTokHNEWTTXLFJLQ9VsWcLCD4D
	uJcpuiEEfWx6fCmUjJIp8xTK6qo7NROQpdM0C4NXBxxE14gKa39NQ2JWyRQLX191A6IU+nu+E0j
	LgBLVav2e77xViK1zBMsTpotmCSr0vNox0icctGf8AxqFJ/AzbqVQF1ooS9QxD5r1lBCc8XHu1R
	0xz4SxmCfT4zKVuaiOO0QDBtS48S5Ny4DykJMgP2t0i1XXbfvuURjYALw5h2279myx5HvBi+KJG
	gM
X-Received: by 2002:a05:7022:ba4:b0:11b:7824:5c97 with SMTP id a92af1059eb24-128b70ebd92mr40090c88.40.1772583350078;
        Tue, 03 Mar 2026 16:15:50 -0800 (PST)
X-Received: by 2002:a05:7022:ba4:b0:11b:7824:5c97 with SMTP id a92af1059eb24-128b70ebd92mr40065c88.40.1772583349495;
        Tue, 03 Mar 2026 16:15:49 -0800 (PST)
Received: from [10.62.37.55] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-127899dfc47sm21089438c88.6.2026.03.03.16.15.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 16:15:49 -0800 (PST)
Message-ID: <ce21e223-3262-4a1c-ba1d-22c35f18e6a2@oss.qualcomm.com>
Date: Tue, 3 Mar 2026 16:15:48 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
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
 <8e7c2036-74de-4f21-8269-8e2b24323753@oss.qualcomm.com>
 <39828202-9f48-44f9-9f28-574f141e2ee9@linaro.org>
Content-Language: en-US
From: Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
In-Reply-To: <39828202-9f48-44f9-9f28-574f141e2ee9@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=JaexbEKV c=1 sm=1 tr=0 ts=69a779b7 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=CgQL4hy3QgFxKJLL_JIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-ORIG-GUID: y_KCXshH_EGJ3927DTWCQBYAWs5JlAYz
X-Proofpoint-GUID: y_KCXshH_EGJ3927DTWCQBYAWs5JlAYz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDAwMCBTYWx0ZWRfX1/AoyA+qk6OW
 qzrEiqWEVkM6Bl3fiTjC2TIkKN9Zsaa4f+KJi4m6qmZj1i6I+2pQCXYixHrowwNM/xMrJ9Hdczk
 mQHvWLJ3dd+T5p9JhP50paeCBOPwOGdhx9OmsicavITFJLew8VV4apUXvUU0tyfsn2qNhe53dks
 vRcr5cgpngMv4icVzN+hIaoSyiVJyswJ6IUas6jfsmHoDNCBIbrYHFGF4xpmn4J1dTkmnGF8sFr
 F8agtZysddjvznlBxpY4ZQ1qYI3sLfjbtMNnaijPdBVK0GGp6FpSlfLVxaZLYeSDRDqIPR3ZGCR
 A0lAS+gTuVhgXODrA6LrzxCFLTAcUvMzBUils7NlDRO+rQqICG35ABSnGTcfiU2XVFGRiyqJgJT
 k6CpEIs2r7O3MEQJ/PohgwpHbsGsM8Lq+2oorBrMxBpvQwHQ0diBKDH+C0rf/RdcfxkgdbMBqp9
 Fc7IZSMd2AyhwRPDUGw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-03_03,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603040000
X-Rspamd-Queue-Id: B13D11F8C83
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95232-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vijay.tumati@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action



On 3/3/2026 4:02 PM, Bryan O'Donoghue wrote:
> On 03/03/2026 23:50, Vijay Kumar Tumati wrote:
>> Sure, I was just giving an example. I haven't looked a lot into the 
>> IPCAT / clock corners of this target particularly. Someone needs to 
>> check the clock plan, 
> 
> I mean, feel free.
> 
> understand which PHYs require which power domains
>> and add that in the following OPP table and as for scaling you can use 
>> the same RPMH levels for all those power domains. Btw, if you had 
>> defined the below OPP table for TOP GDSC, I think that is wrong. It 
>> only has two perf states (on and off) and doesn't need OPP scaling. If 
>> you look at the Iris driver, they link only the mxc and mmcx power 
>> domains to the OPP table using 'PD_FLAG_REQUIRED_OPP, not the GDSCs.
>>>
>>> +    csiphy_opp_table: opp-table-csiphy {
>>> +        compatible = "operating-points-v2";
>>> +
>>> +        opp-300000000 {
>>> +            opp-hz = /bits/ 64 <300000000>;
>>> +            required-opps = <&rpmhpd_opp_low_svs_d1>;
>>> +        };
>>> +
>>> +        opp-400000000 {
>>> +            opp-hz = /bits/ 64 <400000000>;
>>> +            required-opps = <&rpmhpd_opp_low_svs>;
>>> +        };
>>> +
>>> +        opp-480000000 {
>>> +            opp-hz = /bits/ 64 <480000000>;
>>> +            required-opps = <&rpmhpd_opp_low_svs>;
>>> +        };
>>> +    };
>>>
>>> ---
>>> bod 
> 
> Yes, we should scale the MX*, that's incorrect.
> 
> csiphy_mxc_opp_table: opp-table-csiphy-mxc {
>      compatible = "operating-points-v2";
> 
>      opp-300000000 {
>          opp-hz = /bits/ 64 <300000000>;
>          required-opps = <&rpmhpd_opp_low_svs_d1>,
>                          <&rpmhpd_opp_low_svs_d1>;
>      };
> 
>      opp-400000000 {
>          opp-hz = /bits/ 64 <400000000>;
>          required-opps = <&rpmhpd_opp_low_svs>,
>                          <&rpmhpd_opp_low_svs>;
>      };
> 
>      opp-480000000 {
>          opp-hz = /bits/ 64 <480000000>;
>          required-opps = <&rpmhpd_opp_low_svs>,
>                          <&rpmhpd_opp_low_svs>;
>      };
> };
> 
> csiphy_mxa_opp_table: opp-table-csiphy-mxa {
>      compatible = "operating-points-v2";
> 
>      opp-300000000 {
>          opp-hz = /bits/ 64 <300000000>;
>          required-opps = <&rpmhpd_opp_low_svs_d1>,
>                          <&rpmhpd_opp_low_svs_d1>;
>      };
> 
>      opp-400000000 {
>          opp-hz = /bits/ 64 <400000000>;
>          required-opps = <&rpmhpd_opp_low_svs>,
>                          <&rpmhpd_opp_low_svs>;
>      };
> 
>      opp-480000000 {
>          opp-hz = /bits/ 64 <480000000>;
>          required-opps = <&rpmhpd_opp_low_svs>,
>                          <&rpmhpd_opp_low_svs>;
>      };
> };
> 
> csiphy0: phy@ace4000 {
>      power-domains = <&rpmhpd RPMHPD_MXC>,
>                      <&rpmhpd RPMHPD_MMCX>;
>      operating-points-v2 = <&csiphy_mxc_opp_table>;
>      ...
> };
> 
> csiphy4: phy@acec000 {
>      power-domains = <&rpmhpd RPMHPD_MXA>,
>                      <&rpmhpd RPMHPD_MMCX>;
>      operating-points-v2 = <&csiphy_mxa_opp_table>;
>      ...
> };
> 
> ---
> bod
Yes, something like this based on this target architecture. A couple 
things though.
You will still need to have the GDSC as a power domain and attach to it, 
just skip that from registering with the OPP framework .

As I mentioned, if the RCG, 'cam_cc_cphy_rx_clk_src' depends on MXA 
(actually, I just checked for X1E80100 and it seems to require all 
three), the children of those (all CSIPHY clocks) indirectly depend on 
all three power domains. Additionally, This is the RCG for CSID and CSID 
Lite RX clocks as well but we can deal with those when we refactor the 
CSID nodes.

Thanks,
Vijay.


