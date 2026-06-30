Return-Path: <linux-arm-msm+bounces-115364-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id i2vZAAecQ2ogdQoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115364-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 12:35:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 772DC6E2F1E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 12:35:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=CrReYOPO;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="Zuln/Mx/";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115364-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115364-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0813930F9F09
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 10:30:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 659A63F0A85;
	Tue, 30 Jun 2026 10:29:48 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11F043F1658
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 10:29:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782815388; cv=none; b=O5M1y4RRwFXhDSXOanTHxvy4iU0xBW3Ke5GCuc+FSxOp/ILdT15MBmuIh5IraQ6alSzlEwgyOImfDy2afqIMO8EiIg9zs5zLzIP/EEyE/M8lASVPlaDI3PUonsSKCbz8MIibtmdxmwCeNfpfukgr3XZU5/fquSnrtW47Ttegmzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782815388; c=relaxed/simple;
	bh=JHWRXvwmSeTOmbwGnLOsuT0Bx2T1EIUFvdkZow20AXE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G+rcMRCB4x4odAXs5XKHR7nQAL8uZI0+55pkypJg+9wHc82euna+QvDR6AAxO9fjI9XIO9yiu3kucEsOHO40MINYZIUriqMdhpEjzKQlasTqThNrmXEZf3iAGzJKf4dylprjO2f0sSqkHzXHAJBc6/4S5D9p7ODyJ9QOVvdedoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CrReYOPO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zuln/Mx/; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9muU91604516
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 10:29:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XlYsuIGZuofNKg9UNzfroS1rGi/nK+bOboWBMSKVwlo=; b=CrReYOPOizaRMOtQ
	aaHmDGF0s0/RPlzrp4zoq8ksqDyRDmskSlWiB7j1akzgtsgtLtd4aOhJB2PnsM+K
	XaNEj4F3yzchJPArzkdQSaJ2K2V+OOtN28I8b06QZD4jJDPuVngd0D3oyd+Vf1NM
	qiiPsQNIG1rl7PLQg4rAtiB5sDE8mBeX4h5hjO4YLJvuu0dn48aY8FErNNAB6Gf8
	IHV+A0umSFg7LhYMeYj/utpRVfTaxnHxY2sqmJuhcmL50rZOGO1DB4Vu+3/4dW2p
	+KfoiyP1oMbvXVaynBHqB+RIK3qVVpFlcsXF62stwrJ/0+jfZIULFirYHwHCnfbd
	MNLU1g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f462fhpmv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 10:29:46 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51bfa45b280so3114191cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 03:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782815385; x=1783420185; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XlYsuIGZuofNKg9UNzfroS1rGi/nK+bOboWBMSKVwlo=;
        b=Zuln/Mx/44nfNqD/0SZh4vliqIJ5GS464FYKrxq7W/bKjBJfcsWaOi96xOIDf0btlD
         5BFddG6757/t0Cfa/qhGWjHov7U65FxXs21FmIBUZcNz6P41iPOyoTm/f9kzGhZTJT7y
         QdZ9KMTCK/TOpNvQ9I2cdc4wbOp1rD0R5a4nYL1z3fnOxVEy9PrbqvZr5wlQNH1CVM4Q
         dwd+Hgza/QGSeypdAAoo1L7j36uqNwOfGEZq/JFiiz2sMBUsqGjf7/KQEwHlypuypOD/
         8rvkzpuB4WHkhRUTcQzTyR6kfgiJAniT/EHLoETH4GMzNCs/WiPLf5tVrfuwlLjLBcYH
         5rbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782815385; x=1783420185;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XlYsuIGZuofNKg9UNzfroS1rGi/nK+bOboWBMSKVwlo=;
        b=arDqcUq7rQ+3Bap8hh5FYwZORQpfdoSHTf0dwYylkJzM8O0mB5K4ju8WzU0mjpbEZw
         1vHLf+CpdqcYI9Zc+O7wzE6bpQZioU7GuS1wVkD37PKCuv4Nh597s3sMzPo8w/RE0KxF
         mYeEojB3/6ddgzBXZqLo8UrlRLVMuyYu/ye2MQsyiNVGjO4HIVlJpGXDSbDGKqZ8ya6a
         8SabH0Y+8DQ9V86DkSP/BY6iU0XWueQa3piCKnz+DPe0+9/LSjEA63keboOd+jdJkXpT
         nGw5ioLclm5dBzcZuKYGtxmE0SUXVZTuWyyE9P0G2gFmu4bEm0eUyvE6RvPUa1RW8NMm
         PxZg==
X-Forwarded-Encrypted: i=1; AFNElJ+IW92S4IwGzStR0aAe/xEodNvaPxyPJ1vnJavCMOiO3r06O8bB8gSZ88PrFzVpWty7VGv6HOBooPL+xiB+@vger.kernel.org
X-Gm-Message-State: AOJu0YwrVw63mfY4bogAXybZWnSAo4E/KHZWpTbE7HTOxHaqGGzfOpbw
	9RqWfvrRMiKra8d79iPfyE9dLUk0iY4Q85H8CtokaLU4iCdhPq8CG5Q9BeTfFrKOVdbj/UXRXla
	p4X0VAt+16fxwyAnAfcFmKyF1uwWTzP7fd9RxQMW1TFz0+PvJKkv3mSFLLVVZX+kUamDG
X-Gm-Gg: AfdE7ck6EYoTq8Ml8l6ma40ogZPGE4OsxLqwM2/Vfidls9Bfiba2609Kg0vQYZ2Wr18
	aru0EU8L4yFV3zSzcoBvqGr7AHvbVsjBhTulOIXSUru5Py9o3mZ8X/ehkma6YhpA3OxwYZOKWbO
	SeziJ9aIiv/uq7DzZEmTBZuUANbRY23ETb0m0duY+nwvtEnlFc4DL5KwIyMdZWc+qgLAR1BhkN9
	yX8X2JOzCso9wS7sopcjI5losxtRoGVNGo1TbxYYS4aQQI4PD0oLv4btMDREq76POoOjLS3h0zd
	WwrzsQGcpofZWKeonx6nb04uR0GoASZChMBN494BuTNycuiZC5wqVoadlSAbtGcbyZZ6ik5UEW+
	4qJPg9QXR38TGCDku/IDbGKKscr0N9pu0uBs=
X-Received: by 2002:a05:622a:44a:b0:51a:8c9b:64a5 with SMTP id d75a77b69052e-51c109079a0mr27106321cf.9.1782815385347;
        Tue, 30 Jun 2026 03:29:45 -0700 (PDT)
X-Received: by 2002:a05:622a:44a:b0:51a:8c9b:64a5 with SMTP id d75a77b69052e-51c109079a0mr27106041cf.9.1782815384782;
        Tue, 30 Jun 2026 03:29:44 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1288f4d90esm100637466b.45.2026.06.30.03.29.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 03:29:44 -0700 (PDT)
Message-ID: <cbfb770e-0e27-4254-a3c0-6011e8eb37ec@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 12:29:42 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sc8280xp-huawei-gaokun3: Add dsi panel
 DT node
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260630042229.277799-1-mitltlatltl@gmail.com>
 <35f13ab2-cdba-426f-bf4b-36f53ce1d4bb@oss.qualcomm.com>
 <CAH2e8h7p-i3epbxD6Ks-ru2OP+qY6nYXA+Fm+Luexo3cZ2Eucw@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAH2e8h7p-i3epbxD6Ks-ru2OP+qY6nYXA+Fm+Luexo3cZ2Eucw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDA5NSBTYWx0ZWRfX2edYePc0P9zP
 TgBTyuahlveGabfq4hRPy9pqH1uGn7Jbiv3j9gcYj2sq7DYcT4UDTnGOE1HN/E2dpzVBrW4kmXc
 /No9U99vav46VzHw6WEC76S0XDq+ppf2cm5DPz9SeAA35lwFN84hFCGLyNKB4RAo4wObhLZIjYN
 c+fhAQwNMdx8jHQh45KnKajl8BLk8w1QyCW/b72dR6V/TD6ufbZ8znOwFxZP1a0MqhWbCO0u13J
 QZmDHvMSWKdju9jgJ15O7pkM1n5UIvu5C3WHB9pzkCoU8wcVc7RCv8ATME3iC4zaYKq7xabq2FT
 wMFDRSS/lgXtcOGZfSM0UI+BNDwsQUgjR8z2yQGNZNCKl+sNTomYDNfo6c1sxT0tAfWuLNgCY1k
 4xPm7uIEypntpPB8PcHkr0EpSJcHdmkY7mGwSFgQ/ocNhcHc+of+nEaEu4f3kv0o+I9MPztOBGt
 MNB99XxYl1ufPzVs4Vg==
X-Proofpoint-ORIG-GUID: Vr5u7QUsI81q8NMiAr8u3QLdfXlnwNpz
X-Authority-Analysis: v=2.4 cv=JqbBas4C c=1 sm=1 tr=0 ts=6a439a9a cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=K0VU_phB8ntNZSznENYA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: Vr5u7QUsI81q8NMiAr8u3QLdfXlnwNpz
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDA5NSBTYWx0ZWRfX225vokkOxKzh
 glqSGDcLookLFfWq1s479Fihq1B8mq3XCPyMhwplORNpO1NmCl0Re9F0D4Ilb+f0lA5skPZnlG/
 tU2a92MFwle1W38HUViJWJCsJuCnpNo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 bulkscore=0 adultscore=0 impostorscore=0
 suspectscore=0 phishscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300095
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115364-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mitltlatltl@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 772DC6E2F1E

On 6/30/26 11:28 AM, Pengyu Luo wrote:
> On Tue, Jun 30, 2026 at 5:18 PM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 6/30/26 6:22 AM, Pengyu Luo wrote:
>>> DSI panel driver have been added for a while, so add the DT node to
>>> enable it. vdd{a,s}-supply for dsi, dsi_phy are blank since the DSDT
>>> describes the wrong, no impact after manual disabling these wrong
>>> supplies.
>>>
>>> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
>>> ---
>>
>> [...]
>>
>>> +&mdss0_dsi0 {
>>> +     /* real vdda is unknown */
>>> +
>>
>> L3B: DSI core 1.2 V (both?)
>> L6B: DSI0/1 PLL and core 0.9 V
>>
> 
> Yes, that is what I saw in the DSDT, however, I can disable them
> safely (hack the regulator driver to add a sysfs to handle these
> regulators), the panel works well.

L3B additionally powers CSIPHY2/3, EDP0/1, REFGEN (probably why it
ends up being on), UFSPHY and USB1_PHY

L6B additionally powers the same components, minus refgen and USB

Konrad

