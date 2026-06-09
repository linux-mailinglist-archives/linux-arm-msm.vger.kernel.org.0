Return-Path: <linux-arm-msm+bounces-112072-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nhLYIkfaJ2qG3QIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112072-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 11:17:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 81B5265E372
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 11:17:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=eDhxZMh4;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=CbNKDlbQ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112072-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112072-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5A322306EAE0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 09:01:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F4703101BC;
	Tue,  9 Jun 2026 09:01:24 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CBE31A6812
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 09:01:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780995684; cv=none; b=ZL6DbJe9CD6TVm+77kIMxIb2vE2GaQB58yF7/fOVnOggXniomNqfUtI5PITwwBoyWISs1k+RUHtSTVEUOnm8zfmZiVc4CSMQ95i0t3zruPDcDgVuCcDZd6kpMhe7692OTjHHodAbkDpJMtfSktB4XnIpB6cIFV8BPG5F7U4lejs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780995684; c=relaxed/simple;
	bh=zzzN4Be2NFEgK4QWInZ3gxPwLCwSAylSgffkByOEduk=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=aqDfIfGCeLlxoFKx4VatvI6m+pWcH6AWdrstVGfNWCgzoeH8dayTQZ2nMWbxQby/SXWjT1uQn9zAdkMQEHHzu9fVwNZO1RAl1uiYFOk96o9ypeteChZhvwiQrvt9+8gOYQ66zH1gDzXzpPIlws1VTEwCj0wfTM8mMGdIiNxHmqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eDhxZMh4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CbNKDlbQ; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6597rvwi1587729
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 09:01:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fhdJx7tJt2646CGv9afkB55pu+a1qaCKdEr9oqg6cXM=; b=eDhxZMh4nvqtE5ZR
	2dhGU3psVi2PrdczaAozi5upPCNeF5tl5KGWASfUYD1MaBFnP75IBv3yQsbtlU8w
	bjTJDcP11C3R7lce0XzyGKTtqjF45UgWT74XOgZxak6tj58Fo7wBr3wVJFyjKl0w
	JIulpIFh69whmz5l6DBbeKeH3i2uCM+6x/SpQFSoe1ZRXZnLBTq0tyoenFpWl2t/
	hqmP+pNf14ZBoP5Zt4TrdIX864vOY5kIcBczgdOvVx682WTUlar9pfwdM3Exyclv
	eHPIJbi2udR1/XDsIaxA4vs8/k0RbYgD51nK2HscDIuDyx9si1Y2WOv1Q+dIAsHK
	EmuzmQ==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enw5m5055-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 09:01:22 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5a1a5b0e0e8so308647e0c.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 02:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780995681; x=1781600481; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fhdJx7tJt2646CGv9afkB55pu+a1qaCKdEr9oqg6cXM=;
        b=CbNKDlbQuO52JpUZ/KxzkQ6BEmGLQSdPibTMsefk78zEuV7OIOWXw9V1ZVQIIeZZTB
         hUMjxFtgOg0DwcEdtfrQb4rb3ndI/m5TLWXLBcKgxoC20jgOretZZ/MagaUtljrZoiIf
         yzVYyIMMbVHrQ4+jr9tosg1QTxyD8G0d2goqomfEfA7wIy9Dyh5EFELwZ84UUPBAEnG+
         903wzNun6LWIN/2VO8O+jmxypkbB39m6zFv6fwCADIqOOFd6fdZ4S89JJm9G2HiPBzl0
         UC279aZgwG3jNcv+lb/N9VniRupgYo012afk3xcaFIOnPqtTFExNk704YY3BddxdkZ84
         2nyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780995681; x=1781600481;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fhdJx7tJt2646CGv9afkB55pu+a1qaCKdEr9oqg6cXM=;
        b=PR4lxWxpe6u7L4RiqdPKyYUSs6ls632WW2Kc4Ndd/m1CdqzffTbttSmVX67sj8BrPI
         0ENcCHWwQGRB+5bNEpRbTVU+De14BmgbTDQSAqdH+R5PlzFPk5QKNWBLrw/3QV1b77v4
         3ZQMec5XE9qdoBB0Ftj8yfHMMx3RC/TV10kDyB4dFaRs1AQiHxhfjDJ2b7HRbtZOSZu/
         Zmkef4YXqk0hw/+JP9oQ0zke/BZMTND6XZ03ovs9dPpIQDrgeABGSGrVQ8nyRT0yHguW
         1+OXncRoEM8A3NTbxHeiwW9FSIMMc46TckRIFLQAXM02hDKd77Gpz/2fegX6rLnG69bo
         0Q+g==
X-Forwarded-Encrypted: i=1; AFNElJ957eoj+1GKG1UDp1vsRo3NNwJSimccLdX39ixwvXEonnWe4Zf7ew4euucfeFzBEODVU+2xosT9oAvDAi0W@vger.kernel.org
X-Gm-Message-State: AOJu0YwG+pOyyJDOY7nC6jPgn3UWfxpkroFiwIV3lmVEibkC5X/R/QCP
	LrSSZWFlZoN05vMNQ1SjS1kiZO+3m9eayQokY6r21+piTyMhY9efknJXIC/kL3TZHLv6RxPiyg9
	kuN25z9RjI04ijveA5X3CsSO3kvMZtzrIv+N82vxMC4s25KITdAwkXSz4kX7vGyO7PNrN8z/AUJ
	3M
X-Gm-Gg: Acq92OH2aCrVFIdu6pG0F0WbKI8YsqFHaOy3JACsmbwoQz12dOxSMMQx1VtkM/mmWo4
	Aw0Y+CZnjytts04cJKk144YA86Zrvy5ln4H/WdKWaQBW+nso+fORNdUFtPzBXOODlPBrpdkEh0g
	Q0ZzyVbKiXa8CWJvbjMVltzXqjwLuZ/snEYml2Y7mlsR1+k3QQ3aQfDLGbAoa4Boq72JGiSccez
	qA8LbmkOtg36dwMrFuKSc3WgOKLfwxcFPl9ZkDajBkIOq9XHcl07DQzck6Dl/fASjDfjYFT1Obw
	vA/o3G+d4vdgfP0eRWlxdIa3g8qlc0sDs3k3pJrb4MM/HbngvS4iD8ble5E0q2vSHBjli7lJkOF
	+tg13o5c6L2xIonDo3ZRCtJ/d/piWc0ZcLXLUhXa/xQngIMMTdGiNBkrP
X-Received: by 2002:a05:6102:441a:b0:634:b9a9:c082 with SMTP id ada2fe7eead31-6fefa60bb05mr3021107137.3.1780995681272;
        Tue, 09 Jun 2026 02:01:21 -0700 (PDT)
X-Received: by 2002:a05:6102:441a:b0:634:b9a9:c082 with SMTP id ada2fe7eead31-6fefa60bb05mr3021075137.3.1780995680842;
        Tue, 09 Jun 2026 02:01:20 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e65b55d81sm8352120a12.27.2026.06.09.02.01.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 02:01:20 -0700 (PDT)
Message-ID: <35c7513b-6aea-48cf-aea8-da8604616601@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 11:01:18 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: mtd: qcom,nandc: Add MDM9607 QPIC NAND
 controller
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Richard Weinberger
 <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-mtd@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260608-qcom-nandc-mdm9607-v1-0-4639a0492274@linaro.org>
 <20260608-qcom-nandc-mdm9607-v1-1-4639a0492274@linaro.org>
 <20260609-quirky-rat-of-criticism-aea1fe@quoll> <87mrx4b164.fsf@bootlin.com>
 <aifKejyF7n6QsI9h@linaro.org>
 <a6b17b9a-f639-4a7f-adb6-d0c9dbd31e68@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <a6b17b9a-f639-4a7f-adb6-d0c9dbd31e68@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA4MyBTYWx0ZWRfXyyVBZqAmYKlk
 UNoxR6h04+Z++wxTJuWJQYfdkmTK6EIkSNDnOHjhr1EyO6mlq/0OLUtCgiTy1naiDXmh8YeMTgt
 Nx/YqN5OPW6RZSCY2H2PJZizk15wO7YDATp6TqPNRIgq3D/KLTiJOxzcAMgIn08N5HqtROlaN/u
 ObWfYDoSIssw4n+7wB9N4U8y2dbr/sx2gOypGn9l0AwkuEGsDnORP+TA/Va7mG3vYVUa/reZbGK
 JHpfMqVJ5v7hZ6cmg/HssgN+rUTfJUmDguEHdUTPEYeEkSX9KiHGshPN3Q6j1itx9T6Z7R8M0s/
 fC4Qr6ju1LkdH4za7/K2qtjwj6UZQ6pfnneVNlryrOUpo6HA97Qi0k2n9ZdUkzZR9+B8JovpGLe
 PpOgO5dMnpjiMcxEiaSKFNEN3XqwTVgN7LXl6LFoBV7LjjcugzmyQxCgi2YSRbOjkeWP3QoAE3/
 FEp/TwpUKvwYhxAe+aA==
X-Proofpoint-ORIG-GUID: cxvZ5Doa2kgOzZ5DVBcPthZyvPoBp_bV
X-Authority-Analysis: v=2.4 cv=UptT8ewB c=1 sm=1 tr=0 ts=6a27d662 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=f2xlcQsDh-InlZPZBw4A:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-GUID: cxvZ5Doa2kgOzZ5DVBcPthZyvPoBp_bV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 clxscore=1015 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090083
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
	TAGGED_FROM(0.00)[bounces-112072-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:stephan.gerhold@linaro.org,m:miquel.raynal@bootlin.com,m:krzk@kernel.org,m:mani@kernel.org,m:richard@nod.at,m:vigneshr@ti.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-mtd@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
X-Rspamd-Queue-Id: 81B5265E372

On 6/9/26 10:55 AM, Konrad Dybcio wrote:
> On 6/9/26 10:10 AM, Stephan Gerhold wrote:
>> On Tue, Jun 09, 2026 at 09:52:51AM +0200, Miquel Raynal wrote:
>>>>> On MDM9607, there is only a single controllable clock for the NAND
>>>>> controller (RPM_SMD_QPIC_CLK). The same situation also applies e.g. for
>>>>> qcom,sdx55-nand, but the corresponding device tree (qcom-sdx55.dtsi) works
>>>>> around that by assigning a dummy clock (&nand_clk_dummy) to the second
>>>>> clock ("aon") that is required by the dt-bindings. This is not really
>>>>> useful, so avoid doing that for new platforms by excluding the second "aon"
>>>>> clock entry in the dt-bindings.
>>>>
>>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>>
>>> What is the problem in giving twice the same clock? If this is what is
>>> done in the hardware routing, I do not see the reason for more
>>> complexity in the binding?
>>>
>>
>> I had that in my first draft for this series, but this would be wrong
>> IMO. I suspect there is no QPIC/NAND related "aon" (always-on) clock on
>> this platform at all. I'm not sure about MDM9607 in particular (maybe
>> someone from Qualcomm can confirm), but a similar platform I was looking
>> into at some point actually had *3* separate clocks for QPIC in the
>> hardware and none of them were called "aon" ...
> 
> gcc_qpic_ahb_clk (50/100/133.(3) MHz sourced from PCNoC_bfdcd_clk_src)
> gcc_qpic_clk (likewise, sourced from qpic_clk_src which is sourced
> from GPLLs)
> gcc_qpic_system_clk (32 KHz)
> 
> No clock containing the substring 'aon' in its name on this platform

Looking at SDX65, perhaps the 32 Khz clock is the "aon" one after all..
The NAND documentation says

CC_QPIC_SYSTEM_CLK - Always-on timeout clock (32 KHz)

Konrad

