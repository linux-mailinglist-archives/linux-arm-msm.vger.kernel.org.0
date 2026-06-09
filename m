Return-Path: <linux-arm-msm+bounces-112187-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dhBfGxQdKGrV+AIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112187-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 16:03:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 716D2660D2F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 16:02:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=WuS5faaK;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="gf2Ye/LM";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112187-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112187-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 256683044C94
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 13:57:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E875442EEA4;
	Tue,  9 Jun 2026 13:56:53 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB69C42B753
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 13:56:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781013413; cv=none; b=aLPqLdxovGNrgEEDIwfXJv2nl1tjMG8u1W2Eq4wcjkftxqzmftIb6Y2JgDpPSgLLvXmTwR84aqzPMybc0MPtROKbE0R9PoPZnqCEXClocdUeCG82PTZgrvf/4lqWwDlHnIQBSv71eaIPAjBEsG/1LBqsgbxltZP7wXn/0hy36bE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781013413; c=relaxed/simple;
	bh=CcTmWN8DXMnz0bJC6LqxK6vabFMTBrDgJ9RFOo72kwA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KxOR4WKMy2H8XxaBBCkHQAtI7ldsDL5CvKWqyxm78IBaJ4GoYJ3mkcE9bwFvl+SLDB2JiGByyQZBU+DdQzBedvjVemxiEopO8r52Uhp3Ph/82WEnCWWl7W3J5WjjXGunZ8jVm0zazgEGkuHNZELlPMOqf896v3AyVsxB9+20lgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WuS5faaK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gf2Ye/LM; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659ClaGM2694056
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 13:56:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mQFDbwlJhHCcC9ke64p/rWctFC1cP9UborZW73WRcTY=; b=WuS5faaK+4G0mZQn
	U6/kr0u8p5GX7ocW6M3Ube4BuASGWKKawEZqTYCc2RXxdK0dR3g+5a68E0q2F7ST
	P0m9Ru0908pbzu68tTlZTVV7o51t15bZQagrt6P5n1MRm8vInyXhhazXXYrTN/pK
	mgCQWnNwUcDHJA5uBGoYWrIB9SSEm4FO5UWNoA2WIOswdzvCDwhxn4of+QLWLw4z
	aEJ2M1mVHB1RB2mo9bxvGcNBCm8gwSy/3RCgT3c9sKwErrxR487DRW4+ilGrXz4z
	3bBvPKk2tKm/EvkYxCw4+3+S+O0lO0nRAIg6APSh3qHrEp01PqMV3sRzxfBrV5pf
	as63fA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epg3v17r7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 13:56:51 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9157b3e5182so77638485a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 06:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781013411; x=1781618211; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mQFDbwlJhHCcC9ke64p/rWctFC1cP9UborZW73WRcTY=;
        b=gf2Ye/LMvnk08jnI+hp25zUoMJnSgdHAgJ3qVUxUxHFbMNGDILKBRNAJ8ogLsbchrg
         XGZrZ5/fcN9jr/ykupFlffY3sF6thKGGSuVg7wMpoSxbjV5hUAHd69tYVvmgHjKAoBgI
         4MPJIhKsj1R/9ZfIaAZE9uhaDutkpahOhVBmEX2BrEsoSlGkKYKAOmVN9LdyzS0DxSWT
         0oLNeSy0PuXNs5hmKmH9FVu7pQVr9EIXKS2dv4v7BlifjDp+Cz29a3HRwSRbEsGFCd0O
         rcnEIQsUxc5qWZzhvOoHISPMI6S1peYvY9FwgFbjF/Tu2VIzrr2SOPk9fWBtuSHcjsYU
         dXYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781013411; x=1781618211;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mQFDbwlJhHCcC9ke64p/rWctFC1cP9UborZW73WRcTY=;
        b=EqAQRc2xw6WX3rhbysVT/cIzAiQKyS6o1YGJm6WxGr5iDF2+rCxDekJtOrVx58iZAA
         2a9wMOJgPbmwUoedxpvG7nH93kJK+//2ya506K67FkV7DzgxP5EUXo/dCbMoToABx601
         TDeX3xuIYQ4Loj85UOv5/yw8clHkUNs5F1hrPckZ/f9JK/pNjSLMQhGzG56mz9SO6lTN
         gfnu/Un5USNtfKFb90uDlNAQdCG3L2eUtrrSA4yijUDxg0uDu4k0Sq/y/i/ysHJUiA04
         4jxX5kmU7/BfMA5TyJgmpYkOt4+0x37lqdHw0hmmfkE0DGQ8K4oRQvoHpPwbLPxsxRY0
         SrAA==
X-Gm-Message-State: AOJu0YxgKP7oilMpHjx+epPdozD6ZsTStFWaY1/kV1HcjGWEX1VDoMb8
	4kKaHynjHyZRkIYRw3kpvYmSihPWT3Ib7lQ9MI7t1LvpYRxhK+AfgLfgOyjHbUMJS2jIkag4MLC
	qn0cx/rWaR/ESkabrbPaUOhQZ7gBImFO5Pdq04b1uXBmd8VzinDp3qJXFZcOf6L73sgvM
X-Gm-Gg: Acq92OEuykMkh++pz/0SallLBw70/r49O9XbXLzD6KGse6RYfrGGE1/CghKAZBEPNEo
	9Fg31n2pQRE3oh4nWPONf+0usjUmuSyKOT52/8NYjzvmyAOky2fYL0HQ0PxR402zl/gRssu6WRN
	z7wTtaZqvZdBJOYrXOOzh3oqduovMQHiWcejFhP+I2Qp9chHkKg3hmSP4RVubi0uvu0CZZMY0os
	QO9eje1GQczW5H+WwsX0odBDJJCwjgJ9NXTku67nhRFO0152d7e8TM/FKx7h5hnLsOpCvvpWXZK
	3iyhg1CQQ8JuKkXBe2vTG2QXefKRUKk0Cz9HEGclC2knBCV5fnGGAPfRTQnNGljkni4F6Wk8WGm
	+c0tP35zTebNIjCH+79trFLYuJi94v07gOhtTjx6/rILn2X3sHOM2RbrX
X-Received: by 2002:a05:620a:1727:b0:915:54b2:582d with SMTP id af79cd13be357-915e6dfa301mr268372985a.8.1781013411110;
        Tue, 09 Jun 2026 06:56:51 -0700 (PDT)
X-Received: by 2002:a05:620a:1727:b0:915:54b2:582d with SMTP id af79cd13be357-915e6dfa301mr268368285a.8.1781013410622;
        Tue, 09 Jun 2026 06:56:50 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e64e29c0esm8900211a12.7.2026.06.09.06.56.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 06:56:49 -0700 (PDT)
Message-ID: <335238ae-c476-40e6-8639-44258fefe988@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 15:56:47 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260523-x1e-csi2-phy-v8-0-a85668459521@linaro.org>
 <20260523-x1e-csi2-phy-v8-1-a85668459521@linaro.org>
 <rpnNMsR9GY8gbynzeBO8Zm61JAOq3ubt6sp0x3WDPPwkMAJzlcofECD1kabN-IUoK6sSwP5P6l28UIZLFCOpjQ==@protonmail.internalid>
 <dda32577-04e0-4507-acaf-a5694f4f31b3@linaro.org>
 <478df3ed-d4ef-43aa-bb84-e2075798542b@kernel.org>
 <ec98ef2f-02b4-4086-8b4b-07b6953dbd20@oss.qualcomm.com>
 <514cf213-5778-45e1-8d70-d3fe27991fcc@oss.qualcomm.com>
 <7JNJ4dUNz4ennJ5dkzhfLSuVo72JpfZAbprICPRqlRYnSzVDJw6x3h-1nESd_PK-3us9f1V3qOiLiywsTqP8vQ==@protonmail.internalid>
 <f01c0e22-4e5c-44e7-9ea4-4bc8d53aea2e@linaro.org>
 <29e8491f-20e8-4082-8943-66bee7e3af1d@kernel.org>
 <5ca611b1-0663-4975-bd56-b1343851e5fd@linaro.org>
 <83c12dc5-fcb4-4089-9917-9f0fcc4f940d@linaro.org>
 <1b107aca-a857-4e58-a763-39c82af67747@linaro.org>
 <67b6f6ae-bfca-4afd-adfb-6ec1741105d8@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <67b6f6ae-bfca-4afd-adfb-6ec1741105d8@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=St6gLvO0 c=1 sm=1 tr=0 ts=6a281ba3 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=UD-L-AWZVG7rN1av56QA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: uhCgDqrNp-GSmd2P2J67jGZO0i_alXYd
X-Proofpoint-GUID: uhCgDqrNp-GSmd2P2J67jGZO0i_alXYd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDEzMiBTYWx0ZWRfX1paxi0WLR0g9
 CiToX01+kmc1o9PWQHy2mBNcZCtFpdGa7F+h4WrBaByM8jOGKh45UO600vp34DFrE9i9gl7wHe4
 +XRtS2akw7EXS6ew7H4yPj3wBxRG+FpNuXrE38hy+4AmNWQLv/psNDwj9HLGcJRPf1jMY6H/WjP
 a+NGEi7HQBhy9ZfRsKReLeBtGS1ByPRQFrRRKQIfFsWqd3QmwA6dy4lJ+2Y7hSJjdP/GXPsrvgm
 NKb5qrOZ3sKiywN9+D2Lxy5d4UAlPXm9OwLwhymtfkSnRRIzBnYuVhld3K8pmutffehcACByCtQ
 +D/GCPAwkKSqdkCWrsbdAoCto8cBD+sMqpLImItg2LxjIF1+i7iIWEkSZBthtPo1/cQmcf+6Wbp
 acIM/azdHF1mHtNbnlhSuiwNuLG3m1ONM0mUmiGQYWlOAJl34LseV5wC9Gcd2sSW3GIv2LoBKfV
 Y/yX2WHzjzNy2tk7tGQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090132
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112187-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:bryan.odonoghue@linaro.org,m:vladimir.zapolskiy@linaro.org,m:bod@kernel.org,m:vijay.tumati@oss.qualcomm.com,m:vkoul@kernel.org,m:kishon@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:neil.armstrong@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 716D2660D2F

On 6/4/26 11:06 AM, Bryan O'Donoghue wrote:
> On 04/06/2026 09:46, Vladimir Zapolskiy wrote:
>> On 6/4/26 03:30, Bryan O'Donoghue wrote:
>>> On 04/06/2026 01:07, Vladimir Zapolskiy wrote:
>>>> On 6/4/26 00:18, Bryan O'Donoghue wrote:
>>>>> On 03/06/2026 21:51, Vladimir Zapolskiy wrote:
>>>>>>> Actually, one more thing, Why isn't TITAN TOP GDSC here?>>>> +
>>>>>> If CSIPHYs are true subdevices under the umbrella CAMSS device and well
>>>>>> described as subnodes, then likely none of power domains are needed

[...]

>>
>> CCI is not described as a child of CAMSS, here the situation is different.
> 
> CCI probably _should_ be a child of CAMSS given the design we are going for here.

Yes

Konrad

