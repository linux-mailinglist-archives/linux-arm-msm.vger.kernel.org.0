Return-Path: <linux-arm-msm+bounces-117127-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Ka8pDVmTTGrZmQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117127-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 07:49:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 989E7717961
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 07:49:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ZZBOJGyy;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Kk9Yi4Pz;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117127-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117127-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D8D7F3039252
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 05:40:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56CA6386429;
	Tue,  7 Jul 2026 05:39:50 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E157B3876C1
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 05:39:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783402790; cv=none; b=VqoYS6J1SFBPdydaFro5M3CyX5rLvaRA9TsxS0u2iGlX0y8FK8GJXw1Lbc2ghLwKBsRdbmouGY40Yt02a1R9xXtDEqa0k/N1v/ZhvQilYllH03Me8RtQefqAM9lZ/yP02LFihywajO59kflmHOeN81F5yZUSeKguQyRjK8MZAzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783402790; c=relaxed/simple;
	bh=X2kVkngOoCYbBXfNxwdIGv46Mf5xJujGo6Rws6X2rz8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZOZAZO4sDrjB6jQORdXmv0KsYGBwjNMXc6n1/614+KvDGNyI/XcAYPCuyWfUedhT195H26lQ89j6S4PPd4Zw5bHTRIOBFxIZWkN7NpObnBwgaTNB3NQyX9TLcCKox2THCGAIgGzYZg7LRwPgKVpRJ/xeQ5K/bNEfbsdF16vb0kI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZZBOJGyy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Kk9Yi4Pz; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667497XT2498908
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 05:39:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PsFzlIWDFW9ufDJ3y8kqOTwL3T/qjE2N2Ba9kxqY9L8=; b=ZZBOJGyyIdQ+k3Xs
	B8ufPh8VDIAjkZceS5Kp8fsEj31YL42T+42IbzUFyZ4Xe9JjMozB6/BG8f3vcQra
	/wtX0s+ajO48sTUiTe4z5rPcDnAfyUoLEXXuv6XS3/hWB2LuduX74fRZXxReP0av
	XfV3fg6jb04J4JhvJKlwZ+lMCHR+U6CJDoLQCP8AGIGASRqCabDUusgvREIqYuuv
	i8QafkKOFtoC9P8pEzKItlJv1LgK4sy6UI17Fp6evgG652tfTl6/cKyKeoVbk0fD
	bYsFbGvR75hqkiFn1foyaPhvq0pMNbhva+JPYZVRULy0HtZ3zC3g96YmY9X2k1jU
	tYVgTw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88hscsfg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 05:39:47 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c89704da8c7so6451407a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 22:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783402787; x=1784007587; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PsFzlIWDFW9ufDJ3y8kqOTwL3T/qjE2N2Ba9kxqY9L8=;
        b=Kk9Yi4PzjGzZ/VWfrwxlEiATS5nf4a/FwikC0t0uqT7ycC382zaJdYk+eXw3chl5KZ
         UsGHXiV4OPwBAWACXuW1WqT173dHFckDyRMqtiZ2z2Vl9mFlEYxuCXk2eKu7FFE/CMpa
         WlLrt5Q9OUbj5z6agdn9oChPo6cEoQEjahuJm8+VHaVZGFF/0gf9mfWkeIuexEPd9UjT
         Owbm+ok+HoAspDSamGiunBQ2e+yEBB2D7q2cGgVt+qveG8O1dUdGTy75YrN7l2n0EGGg
         jlf9iB6fNjklBahSWq+y/v/2F2Xud65X4Wg/fa3b5CmN9ZQniRUt+MET8qxDI/xEeB4R
         VaVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783402787; x=1784007587;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PsFzlIWDFW9ufDJ3y8kqOTwL3T/qjE2N2Ba9kxqY9L8=;
        b=LlFtfaOjwNV0uIQIP0Vz+bo6wHZn1hrDHI6mmGCeQISJJTexRun8olTHqTnV3Ky3PZ
         6uHLYOq6FofhdBsZ4pPVQ0DcZzGUeouWYrpZ5CEKYez1B2LbokIsTC9w3hdCK/CCL0OY
         YUWzwCr1LjqM+YlvJHuBTGx3KHjPV+DCreytESkwZ6JdnLU2FE1H2Wcgt5g3GrJk/pvo
         JzVc2gcidCVl/wC3fcrRNUHxNsVgp/0Fg+8WDl7JTyifHf68w3rKwZi3qtJak/+3zqB5
         /0VkswF43wB4L8ffm/ql0jRy+9Ko4xLTNiB5g9+PE+Lei5+v1FRNK9r+KN94SsjV+s7C
         mo+w==
X-Forwarded-Encrypted: i=1; AHgh+RqM52ZGp58oosDbS4D1FiKoWBh+K4HanXGp5aPBPT0+lY2rBkjMS8iBoRrmaJrgQzfwAUIiXZKn4rcWqZWD@vger.kernel.org
X-Gm-Message-State: AOJu0YzPhY7pKynitRpbYiJko5vr92tWK4a48AwXaE7lZ6Akjdn4Zui0
	gS/BC2C22FEha4QgOf7f3gJt27BFHdkXR2PoX1kkIH40Q5VX4CtcoohtLJLcHZtSLX4UdC8HQvW
	2f3FiC1/hkriTLnCLnAAUi8suun6sAGOA+wJoxApceOWsy26KEHF15D/b+ptRAe17YzzR
X-Gm-Gg: AfdE7cmql+BYf4F+TArjn+TWdKinrluJ/cXdvL5VnyAAPbwwV775wevtjAnfaujHXhJ
	L8J9jquNzXFBf1gztpzuf9fqSboBWtFnuHGCINkxjcbwgOT4YNO7/HsyTrdU6tY2MhqshUQoxnk
	HxxFH9Un0mjRaxSc9DlOf65dAfp+lK9BA8eQnk9OEgmQl5iymFtlYrDnfEv/tvtOUImct9s4TK5
	sB/v063MbSfldVmdRFbQMfwJxWW8/u63Iy9otG++Smk1kp6MqrE5Pc2rOEkoSHYEEijrEIA+8wl
	CNlmhTxCGk3zOMAOPwE81yqlKJ0BX71YELuOP+K2tbffnsQkO8+y05IgkClmQJ/f1y2kDi3i+yc
	TC3BliQHY27cdh9k8tGoc8J99ITpr6yX1u/DH+afCT/SyX1MH2dbSs9FqxqQKCHpU6woxG9r5Aw
	XltubQ
X-Received: by 2002:a05:6a21:7d04:b0:3bf:a9cb:b794 with SMTP id adf61e73a8af0-3c08eff110emr4454001637.53.1783402787025;
        Mon, 06 Jul 2026 22:39:47 -0700 (PDT)
X-Received: by 2002:a05:6a21:7d04:b0:3bf:a9cb:b794 with SMTP id adf61e73a8af0-3c08eff110emr4453972637.53.1783402786623;
        Mon, 06 Jul 2026 22:39:46 -0700 (PDT)
Received: from ?IPV6:2405:201:c409:b03f:6d0b:bb83:7a67:4093? ([2405:201:c409:b03f:6d0b:bb83:7a67:4093])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5b3643ecdsm405895a12.24.2026.07.06.22.39.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 22:39:46 -0700 (PDT)
Message-ID: <86812216-76d0-473a-b1d6-a7a923235755@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 11:09:39 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/9] dt-bindings: PCI: Add bindings for endpoint gpios
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Konrad Dybcio
 <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org
References: <20260630192236.GA222338@bhelgaas>
Content-Language: en-US
From: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
In-Reply-To: <20260630192236.GA222338@bhelgaas>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: q4HOTM27ehqO6yinSONUAjmcnW-hAcNB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA1MSBTYWx0ZWRfXxwLvUNdh6zsC
 kGHtVCUXJTfH3ps6eapygj0oL4ntc7aphzPUivomGAAG1jwVmMVCyGlr7F1jNs0YWzASoXk/FtP
 SpBd/+cn3FyNm2yOroMidLkIStS5n6LDQtQaLbm4IcRDX35/ItvAEhu/SSYgzIvvQQ3OAAnEpSc
 1XnwiMc++21Cr9hSoqiVhhKKX3mhwoZV/iteXQs7MuykuLbw8aYxQxg1bLTUx5pg9Q4VD67Kjm7
 OVBWIFnqhw60BfuPeKtAwseB0MasWVqotWITJiMnxfT8a29r+fEBq0yPn4bOqgKhqUGAKjCO4ao
 /NEQM2Fkrxud59za2EA3Pc7+SE6l+SCmKhS55QJb9LVWQOfqHAaLo0BALg6lHZnEZLU4dZJerYp
 diaw4dLu5ze12dRvCYADeRSo5kK4y0mhPOqslPHUt2D24BGUvgO2SRRFRtuA/E6L0Q0VDld1S6Q
 eGAjHGM0fOxR4/KZ+1w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA1MSBTYWx0ZWRfX1+ekBtB/Yrph
 tjYR/7kGuLjMWbeZWnddETO+XYBF2B0snY+L3PaO899NxNk+PXeomMj62drwdDc7ZFkxEFQEQ8i
 k2wAHdwFGovyzqg4cNyA1/a51UunPrs=
X-Authority-Analysis: v=2.4 cv=XIwAjwhE c=1 sm=1 tr=0 ts=6a4c9123 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=8PoPPqR4NMsTHzUpfcoA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: q4HOTM27ehqO6yinSONUAjmcnW-hAcNB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070051
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117127-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_SENDER(0.00)[sushrut.trivedi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_RECIPIENTS(0.00)[m:helgaas@kernel.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:bhelgaas@google.com,m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:mani@kernel.org,m:andersson@kernel.org,m:krishna.chundru@oss.qualcomm.com,m:brgl@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pci@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sushrut.trivedi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 989E7717961


On 7/1/2026 12:52 AM, Bjorn Helgaas wrote:
> On Wed, Jul 01, 2026 at 12:32:45AM +0530, Sushrut Shree Trivedi wrote:
>> Add devicetree bindings for TC9563 GPIO's which are
>> used to control endpoint power and reset.
> Include context in subject line.  Regrettably, previous commits to
> toshiba,tc9563.yaml don't include that either, but I think something
> like this would be good:
>
>    dt-bindings: PCI: toshiba,tc9563: Add endpoint GPIO bindings
>
> s/GPIO's/GPIOs/
>
> Wrap to fill 75 columns.

ACK'd.

Sushrut


