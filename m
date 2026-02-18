Return-Path: <linux-arm-msm+bounces-93260-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oAA6FvmXlWk1SgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93260-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 11:44:09 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD311559A2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 11:44:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 11518303F44F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 10:43:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF3E02FF661;
	Wed, 18 Feb 2026 10:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Sbf+xaUJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="an6Zdzox"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DB532FF662
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 10:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771411438; cv=none; b=DsSED8sYUXACZiOnZeynNzP44JA3lJrCa08f6tsf99TnN8D4n8ABbqMlFiP1x9Y6UAcppWFCcCo1hCAquetBtvoiTErfn84Izidk9+22hm6VAKWhaDNTrQ2ozXtABdTjcKhv0bBxKiHcyYEtarf6LxF+4YGdYBDQ/eOPHo5e8To=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771411438; c=relaxed/simple;
	bh=CopvxxNkM7kjvRWwvpJ+sLt1fow2PoSRI0Gib27WbLM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EB/iT2MAXVuBdy+ncYnal6mioe0SXUG8Usj20CEOfHbIhQPb7CPy6MHJTwsUyxYFfm0xgMPnHyAqemjNRRT4toqROwd0bq4djZzzKkttWQ+w8H4nwH4t6diGL0/UcT98hW+RM6Tww64wzl1ZiKXmvioGYf6wULJY1jdIXqUt5oY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Sbf+xaUJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=an6Zdzox; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61HN6DRd413501
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 10:43:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GFHCDVeXqzSocek9Oamx0QPHuDAbcbIGztd1bhWXtT8=; b=Sbf+xaUJtmd1fRUw
	67fCGOb/HZtY3a7QVnMokgQCP6G3df//KLV/HpgQYNeG6ThPwJ6IXg4G5vQPXmfV
	BmwLE3IV/LCqXLHfXF6mIb5bqRv778hIQ3MOZnQSei+4LFdrqOdlme1KszEsCKMF
	zKQpqdSiNDYUuGwq6dn5XLxU55r2gjbD3jPYMl8NFbvNah8a99r+O+PahgrG0K43
	qgOXTdgPcN4bswkj+J52tXYtoZyjfdzf6KEz4LvmSeWBFQO0nenuivLu+rRx7qgI
	19AkxhqcE+TwqUBcIExSRsI1hRAQ9J+9NLEHnnh6NPB+5jVFMO7oLTn0yTOncWRm
	lhIpHA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cd1q6sffc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 10:43:56 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb3978cdb2so374009885a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 02:43:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771411436; x=1772016236; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GFHCDVeXqzSocek9Oamx0QPHuDAbcbIGztd1bhWXtT8=;
        b=an6Zdzoxh8oztMdfTL4YOraj4IRVTGXStsQzL4Qi7R9Ig+NIBkTHSfzrk+iu2ki3+u
         TnviSWsRqFWck76MBsck3DoQ8ZgwWrBQMG7K5pRolFCyvHrHP4B5tyBN1O9DQtJD8d+L
         P9fpH4YQlacf0J9mYagL+T7xG1XV+rxFlafO8Tgy+xKwqgrLDumQQuPKQFjSdpHBvycQ
         1TLG17QLWgJ5emvdvma/8FJAYa44lyWqHRcnzz+VpJiqBmKhJRDHX+x3DowQbOjlYaS+
         YSI5kqvMjgcJjM2FMITgJfEY+pRISckQe0jHhwORxmT+u9KjyW4u4PuSthl4q5RUUDjJ
         9g+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771411436; x=1772016236;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GFHCDVeXqzSocek9Oamx0QPHuDAbcbIGztd1bhWXtT8=;
        b=q6F57Cg6XSa1RkSZHkvVV0mNd5oc6yBoXsWVPhaNTcAGfbph2L2a4FXiGG6Y80PDuz
         tPeLoknuZDGbTabhPJuIa6klS/45Xiz28wMJAasC4L6FSfa+gElWYwHlrvl4XZFgEgbG
         f3QnXLCLjJdYyLrZszntS0sRljZW0MxtWOPeiM182w9itQwJJBZ0DBHFNLPlgEiMf1du
         MnWVMOUAgMzSj6Ebkrs/twjOEXtWkwg55Wv0kf6iB5YhEUzGHc2mq3wXHAJTRuAmtc30
         cbr1r7nvks9iAHR5S716keh5CCa0MUBBzc77aYeEJriv4/Idj0sVIpgv+L8nhS7dcXB4
         /YSA==
X-Gm-Message-State: AOJu0Yxw5rB2JkGaMtiEgDLr19hIH5OptJT3z9Ugp9lBPI8vTYux92w/
	AtLwpnpQmiBtQtr1xpeGXKKP9CKaQ8bXXft5GoHGJsrksG55twKs9tlSY4TWXQXJq5AkkxEZkWW
	j6LAgzfc8PizHQfQUhZcrfFX9tguJh90jwkoZn9zY/L2B4xe0Mpjpo8I2GiLWOlDFtDRk
X-Gm-Gg: AZuq6aJmu7xwFmx6mC/iSnyV2OfVezIcJYbXv67vti7OXrN1c67Z6q+tulm/rX44Owt
	xhj/GJyjMw5AXpLQOp0LrDZSH1gUMI2iQLOJI+bZQEOiH5WDtU71eP/kcxyqQbEn57Ol/o3VExa
	Dlkwd12eM93m2tS4f8rc9Bs5gkqrROm2yCaqaV0MehEw7TCmxyHIkhI+f7wJb/GguKts9AL/e1H
	9CCpwMZ0lwxPcV+g+ZS4FtVW17dLXFcT1GgIANWRrWT3k4DvZeik3/OiHJgSl7hL1X6hbQA6fR1
	oSUxaQozPbljy0/lsjz6TyT2ARKZmVOK7QYCG2LrAmBTOS8Y7XU3jRjeQfEVinDQ7Z8aK2Jn1Mh
	sw8GFRkw0Xop3HtnOJFFxqHfhBRRFQehRrn/pos8B6oebiUCxKas9XGUNO7VZBzF/WPo0l9E7Me
	BID+0=
X-Received: by 2002:a05:620a:1a19:b0:8b2:df32:b900 with SMTP id af79cd13be357-8cb408303c9mr1661995185a.4.1771411435896;
        Wed, 18 Feb 2026 02:43:55 -0800 (PST)
X-Received: by 2002:a05:620a:1a19:b0:8b2:df32:b900 with SMTP id af79cd13be357-8cb408303c9mr1661994385a.4.1771411435440;
        Wed, 18 Feb 2026 02:43:55 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc735e579sm446421866b.9.2026.02.18.02.43.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Feb 2026 02:43:54 -0800 (PST)
Message-ID: <0ab7afc8-e821-432b-bcf7-6c18357326df@oss.qualcomm.com>
Date: Wed, 18 Feb 2026 11:43:52 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom:
 qcs6490-rb3gen2-industrial-mezzanine: Add second TC9563 PCIe switch node for
 PCIe1
To: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260212-industrial-mezzanine-pcie-v3-0-1e152937a76a@oss.qualcomm.com>
 <20260212-industrial-mezzanine-pcie-v3-2-1e152937a76a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260212-industrial-mezzanine-pcie-v3-2-1e152937a76a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=K60v3iWI c=1 sm=1 tr=0 ts=699597ec cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=FfkM9IfYcGvahPrPZG4A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: IwCGgdR53rCHW2f82BX-UnSRlKnuPfsS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE4MDA5NSBTYWx0ZWRfX/YwMBT1CQ4qd
 lvDLjezjPUDpQ2cZ7QyD86P8k4kd6LORuLT1o34QHnLhO2qW9Z8iuObrsjHdrvEwrch5/wq5971
 lW4RQkP9afXAvEqXmihyQCXGv7rodY35Cm+xhbm8Yv71aecGXR0RHapNg8D9aomvY5+vlZt4vcF
 UW5MrQkmgQlDwBwbGXd5ZSdZ0GkDTRD3ZZu7gDRNS41rSW2DW62Zdsi02uYnGfpwRNWHWU53+r0
 13C+0kRMnqKQz7GnFnPntOvIBl4wzvCz7wJWywLs0Vg/0Blj96g+z4dZT/eKG8yjP0fdk0lIsN7
 NpsDOoNX2O8lUpjVVErLgNlNI1ak63FE0dYhpZAl5K7zHxq1MtrbCoSxntC98Ai2XkWXGJTunDP
 3C1hjlpuk/tprMvWRR4brlLv101jqWkv6qi/niIfxEWUAHzY5jeAp6ltlyFnPX2V+lMCD7mwm+y
 8F4wpzbr4e4+vGsXJ/A==
X-Proofpoint-ORIG-GUID: IwCGgdR53rCHW2f82BX-UnSRlKnuPfsS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-18_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 spamscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602180095
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-93260-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DAD311559A2
X-Rspamd-Action: no action

On 2/12/26 11:44 AM, Sushrut Shree Trivedi wrote:
> Add a node for the second TC9563 PCIe switch on PCIe1, which is connected
> in cascade to the first TC9563 switch via the former's downstream port.
> 
> Two embedded Ethernet devices are present on one of the downstream
> ports of this second switch as well. All the ports present in the
> node represent the downstream ports and embedded endpoints.
> 
> The second TC9563 is powered up via the same LDO regulators as the first
> one, and these can be controlled via two GPIOs, which are already present
> as fixed regulators. This TC9563 can also be configured through I2C.
> 
> Signed-off-by: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

