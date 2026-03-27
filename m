Return-Path: <linux-arm-msm+bounces-100243-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QOIQLIlVxmmMIwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100243-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 11:01:45 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AEA33421E1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 11:01:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 36DCB30CAA98
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 09:55:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD03A3DC4AC;
	Fri, 27 Mar 2026 09:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OCo2zKc5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jdrQDARF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70A88146A66
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 09:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774605320; cv=none; b=KFTgboQqCPWKAAdNvBikmoPZldLs8cfqCvByz6RnmuW+BNWGl6Xt1WA1YdbYSVonKCEv1SIbKiQBbuKRxxFbd+Pb2kl2smTVegs8a+CHKFQaIiOlS5zfqIn7FrfQkjvQwQK1FlELIKFX4tb4uMs3XmoOLoa2nB/Evhw55I3QkXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774605320; c=relaxed/simple;
	bh=hzS+BYiiI3Hmw3JC2h6bqzssr7Mj885Xf1Qzyl2Rjwk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IlkrWA3TX8S/JXLxTwmq4DzQvQSqFPotaouyed0fcqiKrpKiIFCpSvSzPwmDYisJuHMWZ9S2osa+RV+V9v/sRgGo2meXEHqgP/Ox/DDCPHDmwQjXQW+zy+OS51IQRd96lSoCBw/kIsEgha1Ae0iyEBHnDEFZ10/MI2kWfg4g9Yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OCo2zKc5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jdrQDARF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R6vtqY298696
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 09:55:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IxpBU7AuYdojfPOBeVct3hQvdxemze4lp9YTaAIaxhU=; b=OCo2zKc51yBxPT4Z
	p5tn9v4qXPdisYf82D+QrvR2/pfyNMkq9NrDgl0+ta53Pc8oqJPwGcCjSsGqaTDw
	yU8UKzeTX7uQ182a0ebasKTF42lTXHqhwpB7ZrzxJH0HJKF/dbGhdHLpexhP1FF3
	iZl42CUNqNicLPU+h4RuE/1V0YFZuf04l2u7hMPlY1ksxv64Se0R3R/T420G4CUS
	vzueMU/T4ESkYMnxHNVwRZYlkVg2A/cXbGPuCSXHKHq/oOnXYnj89sK2ZV7SxQJq
	uRcDVzjky6VYOAfBqfIGxjxeDzbhSaFqPLINGgo33p7nHYrtKaLRkX3u5vA16bNP
	+YTMFg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5bd8tjbs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 09:55:16 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b9074bd42so6089411cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 02:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774605315; x=1775210115; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IxpBU7AuYdojfPOBeVct3hQvdxemze4lp9YTaAIaxhU=;
        b=jdrQDARFFrClgjaMB7vewGV7KT+2ziT0xXZMuwLUzpqmNmFcXZ+VdefBDASBHwVYhX
         1zccsIj2tZxiyh8EnQjPIbegmQUIMOlfD4m5u+mac6Naxuw1bmn6EypnwMjUOc4xOJSm
         VsieWoQp8OIKzEQgrE7lwcwNhnODs6f9BbIo1mZI8zibnteZK6oYPXrClFTohrUNpy5l
         +o5csGcns7JlYawe9Tz30Y4GrfVWj/Zoa/syzNdu7ItgApjHurKVooaxYB7YIrtP7/ro
         QUMXL9rvCz4k9zx3z6n63WDkiEUnAKZ6pC/vTkVWiF94FcNZYQK2H0KVuF+cDW1x3wnc
         rHAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774605315; x=1775210115;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IxpBU7AuYdojfPOBeVct3hQvdxemze4lp9YTaAIaxhU=;
        b=IrKSjwzobbWyO1SJz58fhXLWMlaKMhZP2pkR7llNIVdDksQsoL4WXwK4mHTmiIOYJb
         KOauc1cIBjoOrw7g+h3/d9xbUhg98UPKHoTyLJBvN2MCRRiQ88k3vaHKokfoTuKYIpiM
         WtNlC/MpsrYQX+Qsc94w9seQYufKwgtvfQzppB/xcI39IGiXXPSo21pqXO9warwmrS3c
         pg4tz1IqG55l01h5u0v91vWZTbXNtjHHIZeww4xQM20fIIy/Ays28AaelwvbsyLZDyWG
         uipWkQi8n8uzZ/Hxk73+huMsZUlga0eDAJiPwq2EzX1HTnbF89Hl6iy2BEGZF0a4ApKf
         2DKg==
X-Forwarded-Encrypted: i=1; AJvYcCWgmXhjFF8wYPYUV16Gc1GPscpT6jf4W2/J/FONWF4rAPl29fk4fr2TTmaiCkepzy7yLl0LklCW2qufz6Mw@vger.kernel.org
X-Gm-Message-State: AOJu0YwKngy83LPpneBABbyzzrakzYmvZqzUEjx6cvoFok/SK8rdRfw1
	803MBimbtG4jm14aCWwmpoUNN9tom86wMF81qWy3E4o52XfA7Xpb1n3qPUTcLY4c7nHMe+U+hMO
	ja5nNQ2Jt8ArwRCXFrRLigXCN7jL4MT9HWZ8k+5HEncyUys6ujnspPxRVNzwZxPqXWRcM
X-Gm-Gg: ATEYQzzyOWzNdjZqZWcvi8iTnB4j/rmNv6Roi4SyObfsbZItI9RJi8D/D4HubdMSU47
	OL55/mjeUzf1ceiUstalwWe91tLXCl38nZyj42IKkm2qCXKV54fcOAnpZQYjmYDSyS6VCk4FxI/
	2XGBeIRMHVqaedjeCkisLEiL19yYIq8Q9g4wd4npHHAeiPTHESwXs232QfwkleMTJjfq+/DxJo5
	AtkgG2ob75dszdIE5SNfNy/dlVdG0inr/dzANDYr8/hZGGX/BO5q1+k5i/0sxlxjtwkOFhb7Psq
	KveqOoFhaARclQzKmTxxy2uA9B88+WezYszYMBs22h3wprl0T/pKEGVctEXVsPf6Wx89fcUcVBs
	bbp4+I8NaSVSsevhV/AFXQ516EFA8ELFw8R7/F7DyYD40HjzeXmTFuuqz8PdKxivRI0aAtmNjFp
	VzpKo=
X-Received: by 2002:ac8:57d1:0:b0:509:1bdf:e97d with SMTP id d75a77b69052e-50ba3903e2amr17193321cf.4.1774605315569;
        Fri, 27 Mar 2026 02:55:15 -0700 (PDT)
X-Received: by 2002:ac8:57d1:0:b0:509:1bdf:e97d with SMTP id d75a77b69052e-50ba3903e2amr17193041cf.4.1774605315069;
        Fri, 27 Mar 2026 02:55:15 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b203ef450sm232701866b.47.2026.03.27.02.55.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 02:55:14 -0700 (PDT)
Message-ID: <b40cc518-f74e-4b5f-ad22-f77600fb49b9@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 10:55:10 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] arm64: dts: qcom: sm6125: Enable USB-C port handling
To: Biswapriyo Nath <nathbappai@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Sean Young <sean@mess.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Martin Botka <martin.botka@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org
References: <20260326182821.8332-1-nathbappai@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260326182821.8332-1-nathbappai@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA3MyBTYWx0ZWRfX1Gtx4b/NHAez
 Ooip3jGeiGcDumbyM8qTbZqzqrgR1xNi+5JMNkpWQC5QoehFv7MyHY908Sb/wB3mBdiuKgIrZVU
 DEJwF5rH1rymH3Fg3DtINmvkSkthdrUveCpvForXPfqvZGVZEJAdl9wqTWqQ8QaE+eRlDHMGBzc
 JgM178qx3I45pcVPlKQMJjyQIhX1IjEerUS2sYBBkhQb5VmGdtd4AFkybyJaTfGzZlqQvkKCZHV
 UScmnqBZyUZ3bd2uGJWd8lDm+pIO4xE3dLA8hp9OumFhAGI+7HqwzZ/jlPEaH6tZnKkZuqS4s6m
 c/ZDTwOgr4IgnbaUEERVfFsatDdgGY3TKti9nv4i2GB8hxwiGeLztz9+gaOnAVTE7JyHj163YQ7
 B9YHZ1bAUlcqzo7nNWZvHmJj0ggqy8VFGaZKsTrEBkhzWpPiIcNnCPmE4wZjunU+EsimyIEQv8/
 1PJKw8Tguk4k0BerMHQ==
X-Proofpoint-ORIG-GUID: JfpNb7khlPVSWCwXfxpLAzUeXGIYTFSY
X-Authority-Analysis: v=2.4 cv=BZrVE7t2 c=1 sm=1 tr=0 ts=69c65404 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=Oc_gNG4ld6zQFinn-iAA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: JfpNb7khlPVSWCwXfxpLAzUeXGIYTFSY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270073
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100243-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0AEA33421E1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/26/26 7:28 PM, Biswapriyo Nath wrote:
> On Thu, 26 Mar 2026 10:41:03 +0100 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> wrote:
> 
>> On 3/25/26 7:07 PM, Biswapriyo Nath wrote:
>>> Plug in USB-C related bits and pieces to enable USB role switching.
>>> Also, remove dr_mode to enable OTG capability.
>>>
>>> Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
>>> ---
>>
>> I'm not sure what this is going to do for other 6125 devices
>> that don't have the Type-C infra wired up.. Does just applying
>> this commit alone keep peripheral mode working on your phone?
>>
>> Konrad
>>
> 
> Yes, I have verified that USB peripheral mode is working with this
> patch only by using USB network[1].

Thanks

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

