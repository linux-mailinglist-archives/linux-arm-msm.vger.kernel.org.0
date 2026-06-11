Return-Path: <linux-arm-msm+bounces-112726-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sZ6SGR+aKmp9tQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112726-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 13:21:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F26AD67143A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 13:21:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=flqtm16o;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=UWY5jL7V;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112726-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112726-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 356FD3203DCC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 11:17:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D9E73DF01A;
	Thu, 11 Jun 2026 11:17:08 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 138583DEFE2
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 11:17:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781176628; cv=none; b=oXl33kHuQO11rG4P3EVmRqwMzmDdFj412jxwTRulp3V8ISB3RcUDKhRbzQr1Ff2SufdQibJTwp7RN0v8OVK94Kdy6VyjYfd+STIWwd92pf3pIyxdmyvaYF3DSfcnohN8WPMA1Pci2QmSuR+p2WzRcNnOP5IQhqcmXI/GIRSD6Nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781176628; c=relaxed/simple;
	bh=4Likmpkqm15YMxIxaBfIhwNTmly6yPNtLnW60jEKZOs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xky5HUey18qJOv5xw+iQfyMFb649WrQ6F0eOrA2r2M9A22HLZrbkCtwy6fz9v1B9PUln3SuoQyx689ZQmvkJUUGPlx2zrT6HlVvaay9YDewbxalICo9ykBXpjA930ltjS6/XKntqD68xqIuHQ3Fvlo9+gteq5BeID77qe8seAZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=flqtm16o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UWY5jL7V; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BA13F6299799
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 11:17:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SeMld8SDJI/XqRhHtzoXqBrAAPg+rzif1zA7RDuIoWc=; b=flqtm16o+6YnEzPR
	0px0uUhhGyRpPFFBK7qMSAScbuspXXkBZVaYSsQf7rOYFO/DlMEPJnS3M9soS++5
	0DtXDOH8yCrkr2lgMed7PS8P7cdQCf/YNShtwF4qSJFCFQ42isEObd50rkt7ST4B
	eYwCBMv8Kw/z49c60HGJ6uuiXaOri1b0VFrYTr73QFAkfGKKxOKfvsHooem/xtrv
	9cpskSrKloSxu1PatPfYGpCPCl4FFslYbWReI9QZMTbEG5SNeWhNLaLpi0ox6gDf
	rLVm+K3OD5fMW3n+lejldUQR2amncZArKp52cFzZxtYK4FCkQyfl5die35bfNXJl
	Ulm/Ww==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe703342-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 11:17:06 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5178ac43d27so21928181cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 04:17:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781176625; x=1781781425; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SeMld8SDJI/XqRhHtzoXqBrAAPg+rzif1zA7RDuIoWc=;
        b=UWY5jL7VsiYrIDpw2gn8nyzFCYoEuoRLWDo4HFXulR4w/DLgef4Ju8+PfU0jLGYcKx
         ux3NWxbUPfBvM0Bkj5dRN9MUfAcCNd30bmZ5TWtnUat+9slgL4kZnWgttHIxjRa1ELIn
         QJgUqcPtv4iOqJc7LMAFOO9S1stGyvOlrYsmI5lIjP8EOobcBwqtaiZw3+ib0qZFnbno
         1M0jlLQmNEnGDUc9W/Foxm4fin8OEtsWINUtvC+Aa1+Al7VTovcSZT+2lpWVLu/hvmz5
         80D4flP1wtI+xrtrJmpjbwhfhiNmu3LhE68beniTzYef099cQFpaUDUQvXMMDcQnipyp
         XtVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781176625; x=1781781425;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SeMld8SDJI/XqRhHtzoXqBrAAPg+rzif1zA7RDuIoWc=;
        b=i2I9m5wwAfVQSw2AF5YhLgZsg44ZRg8paJtKFYI9Vf+4dxTU+GCTaCMsUK2TDmC22+
         A7XPGTj+Bjd8S4BvNv1pcncC8Kr94+b3fkTS4v+HwacVvsg/gt6YyxyANzLeG4Klf4jA
         LMUenU9ETs3GfbAZog28JUZWIcZwyK1EA78Y0J0jtC1Qu9eeTgCA3IpnRoAxINpPxFrt
         zTQmlSxAGJofljjQ5dCDInp9LUnJaDGfK5qPoaiDXFG97Z461lqJ4pSRKCncpU4I4/Rw
         MlNlPfltHJ9M4EGwvMiWJDMleAksMNSwY0xmlzXCgRaEIsGTzwG6N453ElKf4xb0auqt
         CbXA==
X-Forwarded-Encrypted: i=1; AFNElJ8La+hQFtd/WB/Axhy9WnMCdAwBDvHYsuy/O5XsCiSrRS6MUpgphvcCbAF7XlbCCVfNSckCt11xzuj7jMV1@vger.kernel.org
X-Gm-Message-State: AOJu0Yz27kgr8w97cppH8hQu24zFWCRptHiyyINTskB9R/SAaa/20ZaY
	CNTR3kCKq6eleRVfjb2lSInnrTXLWUHBLR/x+nsYtz0jvfyi9qiMxgJF4ryGmf+QwPyeZTW6hbJ
	M80jM/igWSrn8V9mQK8srL7EwrAnzHHVPJfcBDOPp76sFq+g5jcGdPXTgKxsYV258iXWO
X-Gm-Gg: Acq92OGXsIX8Z4CUjvxK2bMcZq288anXmh5LOL0eg8zQKbsrEjoXH5/jlxRUjsbaSR/
	nv7qoXb2zEgkEYPH1GMva9xriy30OjTuMEO7Yi2SATzcpOOPtuCagOJfwUyUC6FFASazSPkuSLC
	mH/+5YwLa//cBfAIVNAqg5vDBizyRVIFlgp051nedWaK3YaSeLd95QtA/mgEIRjgW9m/6YBmoMW
	uGP4pFdrvRLxBgwzxzkA9xilQBTiDDS+/LxNfJsieGjXgG6s7mftYKcckl90fD+IrX20qv1TZvw
	oNoCOqlq2/BspLl9y3+D0X7iztFM9OflemtS45+agyA6lWlUcwlBORzCCFfTGx3OhGDqveq9pjU
	ntL9JQcmV3fkYc7zSXFtp2YcVa0sK6sI9ap5DOAY+sgbtXOzjvsZUEFnW
X-Received: by 2002:ac8:5a82:0:b0:50d:ec32:b84f with SMTP id d75a77b69052e-517ee1dbebamr22368921cf.3.1781176625253;
        Thu, 11 Jun 2026 04:17:05 -0700 (PDT)
X-Received: by 2002:ac8:5a82:0:b0:50d:ec32:b84f with SMTP id d75a77b69052e-517ee1dbebamr22368441cf.3.1781176624788;
        Thu, 11 Jun 2026 04:17:04 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfcb668c9f4sm52273066b.56.2026.06.11.04.17.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 04:17:03 -0700 (PDT)
Message-ID: <3d0f0b12-9bec-42b2-b8e8-264c6da0fbae@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 13:17:00 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] arm64: qcom: ipq5018: Add GEPHY RX and TX clocks
To: Paolo Abeni <pabeni@redhat.com>, george.moussalem@outlook.com,
        Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260605-ipq5018-gephy-clocks-v3-0-f232d9ca0966@outlook.com>
 <20260605-ipq5018-gephy-clocks-v3-3-f232d9ca0966@outlook.com>
 <850ba1ab-78fd-45b3-9411-97d50bb02ed9@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <850ba1ab-78fd-45b3-9411-97d50bb02ed9@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ivrE6HzYvGm7vG-tyr9pdyyRzLuS_sFj
X-Authority-Analysis: v=2.4 cv=B9eJFutM c=1 sm=1 tr=0 ts=6a2a9932 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8 a=U2a-IiVJT3C1q4e4PUAA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDExMyBTYWx0ZWRfXzjqh/ofZAraX
 ekcW2pAGPmGhhk3JPuzxwgs13njKhVZ45yxCXJ+mJEjUVxKLe7P6DOSX9lsLajgQn68tvdvzwrh
 Yybs3VzjyikymD7EQfAtvjnonjMA6lUuVWcLRTthDibJFXyjYpIymmnMXTSzdaJVXeQWx4NJqvh
 9x3gmf34Dt2exsfD3d1yVFkQRKiLY22/Tat5RF72gWOI1uAmqvPczElT0jd1pFPevGxxMW6FT9x
 CSanabSi3+rNbR3jA/nLzogW3LsW+ySRw1FbAmvvTHx3qwFHpJvMt/iX0urpKWKwvJTpbL+TMiW
 qMsXdY8n3+60EtQEbdL9mKhJPSiKnc3Mi9F9kg8nbCIQUo0gxxNpNc1c8jSAwuIRlfKxQYb9LBC
 rnVr5y+pCsu9EtAp7FVtMNfvJkgevoJqacbp4e1SOQrlqhFDo3X5hDqw35rMBrKl+9MFRGKz67C
 T+/4yLiGzovS/57m7SA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDExMyBTYWx0ZWRfX/Df8U25x4vOL
 hI6e/pOGZ4BZ/vaN6JrSYeR5pQceVZ/vO80lABMw7F1F04TB0fz5hkPDPIjysA7BCIM2DOCJ5tQ
 ujS+L8uP4jyP9WLUcs7iMDJ2B/pK7eM=
X-Proofpoint-ORIG-GUID: ivrE6HzYvGm7vG-tyr9pdyyRzLuS_sFj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0
 phishscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110113
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
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-112726-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[redhat.com,outlook.com,lunn.ch,gmail.com,armlinux.org.uk,davemloft.net,google.com,kernel.org];
	FORGED_RECIPIENTS(0.00)[m:pabeni@redhat.com,m:george.moussalem@outlook.com,m:andrew@lunn.ch,m:hkallweit1@gmail.com,m:linux@armlinux.org.uk,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:f.fainelli@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:netdev@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:ffainelli@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,outlook.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F26AD67143A

On 6/11/26 11:28 AM, Paolo Abeni wrote:
> On 6/5/26 2:41 PM, George Moussalem via B4 Relay wrote:
>> From: George Moussalem <george.moussalem@outlook.com>
>>
>> Add RX and TX clocks for the IPQ5018 GEPHY to enable the datapath.
>>
>> Fixes: f5f2b835e316 ("arm64: dts: qcom: ipq5018: Add GE PHY to internal mdio bus")
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> 
> I think here we need an explicit ack from arm people to take this patch
> (and the whole series).

This one should go through the qcom tree

Ordering shouldn't matter much, given the context suggests the
PHY either never worked or worked by luck

Konrad

