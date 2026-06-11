Return-Path: <linux-arm-msm+bounces-112749-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id L0XGNi+iKmpFuAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112749-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 13:55:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 784B86718F9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 13:55:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Vs1+TR8u;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=TQvpyBwB;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112749-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112749-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4EB73319ED7F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 11:54:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C274A3C199B;
	Thu, 11 Jun 2026 11:54:47 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 904953C10A1
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 11:54:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781178887; cv=none; b=f5964JDwAHuj5I9AtICSANOo5T8qjwRJV+uB4RK2ieMGFgxvuYnIUEP7m0LL6VmA5DXa8BMFewDlNBLKpW4NQ6qXqU9ukJDdP/MzeHtyOl2sFdIFDpgjOragADRtNgWG+zq1EEdQyuydoFtURNHtpv1PgJJAwZ0Xquec0MuTnu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781178887; c=relaxed/simple;
	bh=aGzMDiq3cXRRQ/rhHELbsPnJZmxLWFamWZhd4QjjA7s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tvfdN8wX5e0vv31ur0ikLFRg2EI8JqF4mYh9fvfDBbxsM10zMV3OaKBqAqhX21HzbQSAeQI2RTjlu8ZnO9zlUAF2Z7D+i1N9BPnhNnvshm1GAQb1sE+pGHCIe5rJ03vDAN4DgsLQo73auhpunSmBLSzvcy0KN935F2Vr2NFb/WY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vs1+TR8u; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TQvpyBwB; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B9xEWv263737
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 11:54:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jW5HT6ZuExf9aRitTp/TQw7gkO8riJN2NQLF5cnnH/8=; b=Vs1+TR8uABKi9vdf
	EaNT3+3T3+ivWOG518iWwjstcT4N/16Ogs2Q6NeLReXD27OBBtcAI3Xq35M5ogH5
	p7baLPTsZlpUnTHyNKmgpCRTWr1XTC38e7gscqeFk7Cz6mFWaCZicobTdQj7YtZ4
	UWMAIaBI+x6jySlIt5TSHVHT4yMsTv0E6eLw9pIruBDsUg2AP06luMK3I2mcStxT
	+/Esz/eCMPjhOaGw/50ArjckxNZTea4LNhwgu6M/XzOXHqJNMNpNGbV5jKatcCd5
	mKNqj1p3ijlVbRbxaf8v447s02XjMRmeQAnBscDQebqcWggdRy8CxR2iMtPdpgjg
	glfxiw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6uu7rc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 11:54:45 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9160006de85so26599785a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 04:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781178885; x=1781783685; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jW5HT6ZuExf9aRitTp/TQw7gkO8riJN2NQLF5cnnH/8=;
        b=TQvpyBwBeDCTdjxAIEmheNYBKBdHt//+tB+d6FbWRnSp0HLZraIte3FVk58Z5sHwzE
         qeva+QzDXck6CVhyuPE7ZvZz5g9KQ86/ZxnruEUSGAO9UHRR6xzCvQ6uzewWf+WlvygJ
         9nbEBEg5AhcqMzNwzR0Ibgs22pO7s6twQZSRHFWtgVjWECfF8S22GvhIyAe0xyhFinkH
         F/UASn3YgF8A+CvmYkJVhzfjoNgALUGR6xg2FNDT/s3SIh0D64UljQgYkuj+7KmksiBs
         UtSDpxYf5/O5+6eMg9ksmHIxiExARAmgljjIcshMNhdZfC3kK7/k1Xqyjw8l4S4LdCkX
         r+BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781178885; x=1781783685;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jW5HT6ZuExf9aRitTp/TQw7gkO8riJN2NQLF5cnnH/8=;
        b=lbzrKZ81r2SLmRujjOcGUK/3GUU3SQduWirlvf8JvBodFOmckHgyyip2HGt43zYH9L
         9++kbc3QKiKlRYvFNKo5ShOQAsS23wqzGaqe0I5VSlWGhV0/3vMFk4mEY2OAzvtLg/zS
         XPew2Ku42zUXY2gz8/gi75pfYAq83/q1iGHTCYanqag8/x0QvHe6Vh99UchkPrvFZH0O
         9kLvmzjr3nNlFu1dOCLkJGVPGbxVkoYRcBgnfOhKc2l0EuHqtURu15Uq34nu1HpUiRry
         x8k9v1mk4m1NcKndnTE8av/kb5umoMbKYXAsRKDDl+HB+Jtz9AOsvwwhdKPS5MIQ7YTH
         T2Lw==
X-Forwarded-Encrypted: i=1; AFNElJ8TPYCttVZ7VdNlYSMV7a9U9t3q7Jzs0q9l/A2GY+LJgPrdo4BgM89M36spXlYhdncQGp+V27zTX0Jnr2B9@vger.kernel.org
X-Gm-Message-State: AOJu0YyOT3ZeIm+iCr2K+VIAOrRqQ6n0ik5821xd8AT1QOBh94QtEvWz
	t0saEC0awVoROux6BiNXlthV5as/op4z+p6k5TzmBhhiE4/JntbIDgAYFp/IHqLOf3/qp1GBkes
	e/zFq+UuKetHSz5hh61SjCOGb8Ga73sglUlFSRwZMpx4B4pGURWkS7kY+RZGyVkhkztV5
X-Gm-Gg: Acq92OHswNeZx1x7dCbjFFaDay1mLUm0uv5ueu+Ch0G8cmbOzyBKiRBWCUdJXJu2qPq
	i5tsFf5Q8LFFBDoIGK4BIjTQH/5v38Sk93Wi8H55H92cEtcApdH39QBR4Iw5oE8xmpz3z2MCWlk
	48+hnlrreuCS27eHPi7pC/mrAsaPLWtC2TziribjOQqOBh2r7u8zyXs8uXVe7iuHpJJazw2kiq7
	yXaQ3L0ze1ahcXlE7I5zxCjFc18KvezzQ2XEM4JbCXWhFIa7w1Xf9abWUr3i0Y67lm8nMaKfDhU
	U3fSIkiytlC3iDfRSVfO4u5sdJSruSoC3zeupj8Z8dou7pUmcqGLJ1or5j/2LV63I6+A1wRDgyt
	ZbleQwwBlZE6N+l3iDeEOkRO9MUBvlF8AruCZpvI5VlWN+wJKmbNKIThU
X-Received: by 2002:a05:620a:4553:b0:8f1:9e59:2208 with SMTP id af79cd13be357-9160acc6f24mr198783285a.4.1781178884879;
        Thu, 11 Jun 2026 04:54:44 -0700 (PDT)
X-Received: by 2002:a05:620a:4553:b0:8f1:9e59:2208 with SMTP id af79cd13be357-9160acc6f24mr198780185a.4.1781178884422;
        Thu, 11 Jun 2026 04:54:44 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfcb5abe4a9sm55098666b.46.2026.06.11.04.54.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 04:54:43 -0700 (PDT)
Message-ID: <f492327c-7ee1-443f-bb11-b78af0eda207@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 13:54:40 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] net: phy: at803x: add RX and TX clock management
 for IPQ5018 PHY
To: Andrew Lunn <andrew@lunn.ch>,
        George Moussalem <george.moussalem@outlook.com>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260605-ipq5018-gephy-clocks-v3-0-f232d9ca0966@outlook.com>
 <20260605-ipq5018-gephy-clocks-v3-4-f232d9ca0966@outlook.com>
 <36cd63f4-749e-4b09-b8a6-cbf6924dea88@lunn.ch>
 <SN7PR19MB673634FEEF98FB8BCBBB15979D112@SN7PR19MB6736.namprd19.prod.outlook.com>
 <471a21f2-7ab0-410c-861d-5722a94b127d@lunn.ch>
 <SN7PR19MB67363B4F852FB37071637A299D112@SN7PR19MB6736.namprd19.prod.outlook.com>
 <afdced5b-73b9-4214-a94a-c13fadd39dce@lunn.ch>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <afdced5b-73b9-4214-a94a-c13fadd39dce@lunn.ch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=FJ8rAeos c=1 sm=1 tr=0 ts=6a2aa205 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=C1GzXxPXE202J-4HI-EA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDEyMCBTYWx0ZWRfX8RMs4p5Jd1BS
 y5Xq6pBwd5x7RHkjq8UfybMQvF55902FXVOb5hW+f1/USJCtd/CLFarfYV43QvuOeGmENgiQZ2v
 d5vkUWiU+smnDlNMvKi9uLuBu+U+Bi0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDEyMCBTYWx0ZWRfX3r6ibTc49bWu
 fJPqFkvUBB/GtXw1POU7y2kCNcYt7CJoId7lhmu0/8XqVvw3Au6oi0MXTeNqSQLjP6ORbx8KGJq
 V8DolwS5IOR+iSncI3xZ0/RQHcv000sqiAd8T3W4SXCosE3Wyoc5CYhad17Amt4sl6wmLA/JzsF
 NHbkcmrUwXZnktKgbg7Krf2INo+UV++BzTycAHuaxJMdPmI+gv2/MlaTCSwyupmtcMU92mRSy3o
 ZHvrfFPtnQ6bTKrsNZbfpaG/k7B5hNq1JROp/FMcbZWUHC+pN8miP1rPmZKP30uu340tJ+heGw9
 h27Xlm2q2Psq58msOYYLW+lCM9h3FNP29Wu1Dta32aAU98atko5ED3uwIqk9j/s7mB8v0t+x1O9
 4jL4LEU+EDltjZVr6peE+TNP/rGuTWTyRbfUKigpPABdfDJfsmqihtyLo0GfIhT2d1Dtc34cGAM
 M6SiEIbJJmMoWiwpsug==
X-Proofpoint-GUID: 8cHM1JT90hB3qelmTqfHHKKrZd2uWyPJ
X-Proofpoint-ORIG-GUID: 8cHM1JT90hB3qelmTqfHHKKrZd2uWyPJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 priorityscore=1501 spamscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110120
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112749-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew@lunn.ch,m:george.moussalem@outlook.com,m:kathiravan.thirumoorthy@oss.qualcomm.com,m:hkallweit1@gmail.com,m:linux@armlinux.org.uk,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:f.fainelli@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:netdev@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:ffainelli@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[lunn.ch,outlook.com,oss.qualcomm.com];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_CC(0.00)[gmail.com,armlinux.org.uk,davemloft.net,google.com,kernel.org,redhat.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 784B86718F9

On 6/5/26 8:14 PM, Andrew Lunn wrote:
>>>> This PHY is integrated into the IPQ5018 SoC, connected to the first GMAC
>>>> (GMAC0) and probed upon boot. However, this PHY is not used on all
>>>> boards because an external PHY or switch can be wired to the SoC's
>>>> second GMAC instead (through a PCS). So from a power management
>>>> perspective, it would be better if we can disable the clocks if there's
>>>> no link detected.
>>>
>>> Humm, is link the correct criteria? If the PHY is not used,
>>> .config_aneg should not be called. Why not have the probe method get
>>> the optional clocks, but leave them off. When .config_aneg is called
>>> for the first time, enable the clocks?
>>
>> Will check if config_aneg is called and test accordingly.
>>
>> ip link set eth0 up/down and cable (un)plug do trigger
>> link_change_notify, and based on the link state the RX/TX clocks are
>> turned off/on properly.
> 
> You are talking about something else here. You say the device is not
> used. If it is not used, .config_aneg should not be called.
> 
> This is a second use case, the device is used, and you want to limit
> the power it consumes, when there is no link. Do you have any numbers?
> How much power is actually saved?

If the PHY is part of the SoC, keeping it online would require some
more hw to be online, so it probably sums up.. I don't know for sure,
I don't really work with the router SoCs

Is there any prior art wrt enabling/disabling the PHYs (not necessarily
clocks specifically, but say power supplies) at runtime?
A quick grep only points to this very driver, which gets the regulator
during probe, enables it and never turns it off

Maybe +Kathiravan knows more?

Konrad

