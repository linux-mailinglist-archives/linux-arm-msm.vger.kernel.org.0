Return-Path: <linux-arm-msm+bounces-111059-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Mb+2IdWgIGrv5wAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111059-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 23:47:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 214B563B734
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 23:47:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=dtOMp8RS;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ONrGrEAb;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111059-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111059-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4AAA73011375
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jun 2026 21:47:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63B253DDDB6;
	Wed,  3 Jun 2026 21:46:59 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30E4838B7B6
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jun 2026 21:46:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780523219; cv=none; b=K5uVZwVS7Hij1kmZFf2NjHsdZH3Us8fDbJn2qujdwY4sAiw+nFeMzWpQHx46PpUF8yNtMhQi4SccQgl83Aydd8RegKrv6m1dHAVzitL5EyOy6aFU4xb5wPnJCISoVjDCPimxX0MhbOk9ib0Kt9xXHVkG9skbw4sjlPgN6IIGLD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780523219; c=relaxed/simple;
	bh=oeYALUtDYRkyR7oPwz2HFEy/K998aAgoV+N/hPqd17k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TFiNkCTVxf4GecXlnNotCfcJqH6I6AHV0OO/DWLRHlEee4TNQ3/Nl6HiO6GHJ+6DmaUkczKhDRa3oQLrKnoIx7INbyd4ZGnL60mH3pwIvlMzOpBTLsPuxem+aaE2m5FhVJ/kEnpfvkk7LOkuE2tWsU9dk47et+4+bMJ5gxOt/EY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dtOMp8RS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ONrGrEAb; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 653J8H8Y2076164
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Jun 2026 21:46:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YI4SVhkK6E0eWN6DtYQRlG4n4FVt4g9e2Fn1B2lcMFM=; b=dtOMp8RSacUZoCYe
	efjvGKC+HAT7c4p7w5nn4raTde7oWIY5XZlQgiRfGawn8NrHS9oFSxPGWbOR1n45
	MIZnFNNphA3PwHJNnaqkyKQSIK6zxhABvK9/wHqTMtJrHLONWZHrEWFLYYefwj09
	reHvVmClMJxAzr1vpptI5H4u22+dosRl3wOs1LuywneUwJcp8lTBZ0/P8WgWcC6I
	KP1E8waRuSlG2krZMV8ig9P5eGZ5C7AtevDb0q4h4v6C9zj66jQfX8+DWkkmNgpD
	Yjzss6O8AOrKmUya8ylbqjE63vsZC6XfcZKGKh+EYD8hxIEnX2jFes5RTuD4BNiX
	u5a3Lg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejev1bta4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 21:46:57 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-304f23c55b2so5725407eec.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 14:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780523216; x=1781128016; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YI4SVhkK6E0eWN6DtYQRlG4n4FVt4g9e2Fn1B2lcMFM=;
        b=ONrGrEAbG47obKukUm9JCF4K0xSgJ7sAEhco7EMWcG08HHUV6bx1/jJXYgPreQo8xM
         B4u1O1htL2fecOFJoah6jRi1Tgu0+nQtZYDpQBmwwkhSNDi2yUWpAYWJR3Cr3q7nzYVN
         V+5YoWty4mASFuQAa8JGI3uz1+EDxBzVlFNll3iCAisIkg14r/dQ0FzFlh3PVyC1LjGI
         yN4hAfjjehl1IKVsuYl9LKo2tObYidSLU18O9n3QsrB+eoBSinymMaCpVdgr3E2rcC4T
         7NqlmP0sNoXpH0oDG/AzM8pjsFt0EC3TUT7Cdg2nvZwNvwnURSvfAbPJ6qsUz2v/8pjW
         cQOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780523216; x=1781128016;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YI4SVhkK6E0eWN6DtYQRlG4n4FVt4g9e2Fn1B2lcMFM=;
        b=KmDtoYxP0hoN/h4CjAu/jAidhNR/T7Ka42cZyq9JydhQ5FjWY1oHt66gW6PbyTLCJK
         3/I4auWeWmH1idOkn9SDy2SWOV5j4WJaKJ40F2fBgE+eJpRlqMSgtmeLY28UFjjjIftc
         oSH+rL+0yddw/k2d0V9vOx6BOowJd8yVyyUzg/H0LgDCxf6p2InpjmnaSC/BIBkyLcSO
         Hc85g4BtdsC7LMvBztCyzGELuW/zvXjgArKlYjKUY64k7JKgzzaqJhFam21VpjxYh7uv
         2YxOKwl5IBZp/4yjypgTjj1F0wPDZf6wGBByrhKNPizePC+eM8VWNarjIDsI9FNVuhXV
         0pDg==
X-Gm-Message-State: AOJu0YxOCmk3dhgvr1U4hq2WAYGF3mWoC0Ms1L0e6OkY/Q2jqBbonwpf
	S0H7SQKPpEGjLhVnFgfXJ7BNd+6wJPlhDI5DQHZ64RugNMsJTRZjWMukrH1XPWdtV3lETZU7auz
	OL8PgTbRG/rCKBGXmt8Xajw4y/VzQP3X36Q/p0SGSokbv0FibErKb2NaAiQLXraaPr3cJ
X-Gm-Gg: Acq92OHpvFVcF/fvUfeU4ygciGYimQitkTtYcIPUF1+kUc+16S1fQq0Q9rsYP0ZqoC7
	ocfkXeGt631+r0AM5BN+1VKVi2S4OidoumTxohZH7jKQEdykccFA9Zjz5GgYuLms3ewu7mFbCAi
	iNT/BtlUWrCoM7d4f6ofc2M6ZLvHdUSeyWwGd7dqlvBL1yjwuZBHj4zZY38TTP/BTivkpVuyajk
	Z06rhESOLUdDg/xmKue3Kb5ozM2j13DXgBb7NbVM/qsGwPpFk9s37pfKEEGB6esztZw5vCvjX1d
	gGWZbjJkkcm1HD+eBjkr4KUY9gnnS43w4L+bKJ7b9ZVVBPK4v+FWWrHYGvO7++3645O/OtO8GMl
	a645FuG4Zi0PqzyAeyv96ScUmN4NdbW+J5eP5U+mgg2ZkjkXuyrwbnK9K4I9VYF8X2CJI1I7dQR
	f1gAXMS0O5qmg=
X-Received: by 2002:a05:7300:7250:b0:304:997c:d4b6 with SMTP id 5a478bee46e88-3074fb4847bmr3287894eec.17.1780523216045;
        Wed, 03 Jun 2026 14:46:56 -0700 (PDT)
X-Received: by 2002:a05:7300:7250:b0:304:997c:d4b6 with SMTP id 5a478bee46e88-3074fb4847bmr3287882eec.17.1780523215500;
        Wed, 03 Jun 2026 14:46:55 -0700 (PDT)
Received: from [10.62.37.26] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074db85e10sm3362286eec.7.2026.06.03.14.46.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2026 14:46:55 -0700 (PDT)
Message-ID: <21facbaa-c001-4e82-954d-f2f6838d41b3@oss.qualcomm.com>
Date: Wed, 3 Jun 2026 14:46:54 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vinod Koul
 <vkoul@kernel.org>,
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
Content-Language: en-US
From: Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
In-Reply-To: <29e8491f-20e8-4082-8943-66bee7e3af1d@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: NDdZaRHq3wRAh-lu0o--V0azgI-v3rIy
X-Authority-Analysis: v=2.4 cv=PNE/P/qC c=1 sm=1 tr=0 ts=6a20a0d1 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=R4he3g2KxIACXk2nk8MA:9 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: NDdZaRHq3wRAh-lu0o--V0azgI-v3rIy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDIxMiBTYWx0ZWRfX5PPyxxslxUBY
 BjRtsWwFZHtvFBPwuEq48ZbMMH5MkVbuXhUzPwZoj9E5/Vm/6v8ag0lxtePGayZbwxPIkVbIbNd
 tzQTmFmoQa5oacluycodJXPhnS70GCfsDQ08JZl6Fm8ffuyhEV/X8KUaV0lUwjSh7ttZMXyYyfG
 qORTrLrxHWK2d8g266GEvVWH64ykzk6v4R4K+Gw7RL5g9s/PwGA+AFv4UX62k5gCcgueghUSRGf
 OOkTMYoQ4U4X00KTsNYNfFT3PGTphZa0zjHkS3RlQLjhANDPboEL4IFZT/nzMuS8EqvxHc0Tqwf
 sSi7+EsXo7YfcsWNS+DmiV+TJNNsg6/ho6bLcWRa+8AJILk1a8r0nVnAuSfmF8HkO3FaLcOzHkZ
 iGD/360y4/YyuvDJsrbXBjo8827c0WnrPaUwlL9zeifNEJ7S2kb3PyujJo+OCva+NeSXeof7YY6
 UXgDdDQxcvmYIuBCT4g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_06,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 malwarescore=0 spamscore=0
 adultscore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606030212
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111059-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bod@kernel.org,m:vladimir.zapolskiy@linaro.org,m:bryan.odonoghue@linaro.org,m:vkoul@kernel.org,m:kishon@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:neil.armstrong@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[vijay.tumati@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vijay.tumati@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 214B563B734



On 6/3/2026 2:18 PM, Bryan O'Donoghue wrote:
> On 03/06/2026 21:51, Vladimir Zapolskiy wrote:
>>> Actually, one more thing, Why isn't TITAN TOP GDSC here?>>>> +
>> If CSIPHYs are true subdevices under the umbrella CAMSS device and well
>> described as subnodes, then likely none of power domains are needed to be
>> repeatedly described in the children device nodes, since this information
>> can be obtained from the parent device by the driver.
>>
>> Technically 'power-domains' property can be safely removed, I believe.
> 
> The policy is to describe the power-domain dependency fully since DT 
> describes hardware not software architecture.
> 
> Also for a very practical reason a sub-devices can probe/run 
> asynchronously of the parent device being active so in fact we do need 
> to describe the PDs fully.
This makes me think. When the PHY devices are made the sub nodes of the 
top camss node eventually, we can discuss for somethings to be avoided 
in each child, which we can come to later but for now, you need to add 
the top AHB clock as well in the PHY node, Bryan.>
> ---
> bod
Thanks,
Vijay.

