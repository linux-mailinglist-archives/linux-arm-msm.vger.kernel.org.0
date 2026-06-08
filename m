Return-Path: <linux-arm-msm+bounces-111660-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bDSyBVxJJmqdUQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111660-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 06:47:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F813652A30
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 06:47:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Op28MRt0;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=HBGTYaeI;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111660-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111660-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1A37F3015703
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 04:46:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C032B34EEE3;
	Mon,  8 Jun 2026 04:46:50 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78B7F2771B
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 04:46:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780894010; cv=none; b=ug6G9c57jlCpTJh5jfrlF2aXesqJoe0apidrz5jgEUFO+IhUDwcZAp2ESOgLpFPhwiD89WgSGcWDUYOYJASZFvHMJkkdT3SD7ikGqbXB4YiJZZihmHJQ8/mPdWSpTY7atDcI/jv1NASnFhhAUYYDqJb25EFz/5BSOy6/E/CJwhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780894010; c=relaxed/simple;
	bh=/LzMqcu3HHGE5GBV56yl9iCiM+D7QtWOREec3mGMfy4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m5eNVY3qz06zZTwuw+MZzbzAi/HphKTqkCQw6LE9NskVUPJTnjpL2DDvXSxAe2APsp5WnAIyMlJH4jUekmB8rWdH/s/v6BLHJe2e8WMkqxIcjAeyICtJSFtw1TKp1QU6W7DH3tGO8w62EfZmRWBXo4K5stxxdUrttI58Cub93nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Op28MRt0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HBGTYaeI; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6580EAZv1469249
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 04:46:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XaXdloh55VzPZiCRBES2vXV1HkRk8zMeWbdqdMEo94w=; b=Op28MRt0CQd+bmiL
	ZNZK2H2S+JI2Uo5Zd+z0JwD+S2pGVeI2xFxYUG47QfknUReW05Eneb7dYcjp4Mqp
	E29Q/Dn7XPBcWhXnLcCP7s53joLMZ5QxkPYVzTRCZVCwCkYYxkouzVY0vgQKGn4V
	XOT73dxR8EMH6z4ONN2S7U9tJArEdx9TICXESRmfLbM4nMyt2Dbde5wd0Np7BYp2
	9bcqM1UlCIh7F4djL8YORPvbVMIt6ggpaI454jx+L1dXFDleKFhGxRvOgchhXki0
	gNcF8EPfrK3VT9PnpUTXElxL3bYlVrh/Eib71bM3wA5s3M4tUuf4aXwSsAN9ucri
	TC0KEw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emcqgwhm7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 04:46:47 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c10cd7df22so48743115ad.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 21:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780894007; x=1781498807; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XaXdloh55VzPZiCRBES2vXV1HkRk8zMeWbdqdMEo94w=;
        b=HBGTYaeII3fTv0Njehh4iIJaMI9qWDgw6o1TgwE9j8pJ3hcggy0L1ArYN3l4bF68wr
         7ZoLkYZehEtddviKsNvNGTsTwugWveXPBTAqU7pTDoJobdutNF/SxbqQ9WR1fAZftmUF
         lWw1oDMu8IyBrm91z4tJB16Ssavhhd4nDyJtlNWnsCSVG1iyGYzGSxE3CZhszNgrECiy
         2WLNRo0qs1gZhFGbYYoouf0GThUxjcpM2bRW8sqC6agQKxy2qoo8M31FbE2GYSm8EZvD
         1VLLzjoK8xvCOnGQwSZ5Gn0TNHsL+/Kd79C8Lo4YRGA1NEXkn1Q0I6vAci/V4H3bvxjI
         gmwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780894007; x=1781498807;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XaXdloh55VzPZiCRBES2vXV1HkRk8zMeWbdqdMEo94w=;
        b=PiPucF5leiSkgtZxDacliqEdEbkd4no6ggjabPR/ze5+CL14DDicPaiHlHe/k1cO+N
         T1YbPUXiTFKP0oR+mQ43BNg1W+VG9dUJzTLRUL/9Ewepd/N6M5xSiLI0B4rkpkk5ioQY
         QRSVkfJtPk7MMLNFoiKidpA0Ouba6++DT0T/BFX79Tyf3rNdkSdxGEWFHtKmdV7UQakn
         gGUSZn8Qewrzco84qCxlGBwv9FItPSh6lkeAEM9futsW0RQbLTHCdgp7Fg9kqn4J7GtS
         ltRjZ3/9NpDYB6QrNSWM+F7Oe52UL6O84BhMjBcVNpxRHjf9XJnO9JO/SVnRppx9Nn+g
         PTQQ==
X-Forwarded-Encrypted: i=1; AFNElJ8TBpPv20Wvq2A0fpir936EF19BuPjPDleREiTh2ZqoP6XUXQCawUCdJ2LPjQiQnZG1LFjLc8KJRFuyg0g+@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9Jbul7AceFwYf7/sD9PM708xMsYSXabb1+NgTZfTTxpDe6czY
	puEQO9ua5uBJMykyDJzEm4/hPVOxTIFf/FKCe5OA2ny8DiMVneLBhkVypMkswBeOrSGkCSLX4Z0
	5hDdDOrj/qzgq3+YLj/K9eyOlRN+i/Rp+6IE0x2Ll67dxxtmXgjPniK4lHEnCL9bL+WKD
X-Gm-Gg: Acq92OF48WVy4fOmzafLd+jlFFneLLjcPfeTMYyLIwiA2AJ+4/LFT7k+BphmyuE0Gzw
	tqV6GpPZmnJ/DTIkhsW7YJ1cStNzcDIDwGvVXPn17x66WvDMNsAuvaoKMJ/brxtWZRD1YYZhBk4
	uAsoDCC84nYPg6XWxJslvbF3ih9sp6EPBHwFoQAZ7GZRYAvDrdUOFz8gtANDXsVq55psFNRjD+a
	2kw4CfSApIeySHgFYL44E3Li5lUdszwurcR1BO5vJKmZtjVQpIRHE0SSpI6IlKvGjsU5zoT1bSx
	Dfbwguau53nKleBSkk5E+vzA8w3W+exyi7kYBWupB1zJD0y3t4fo8T6VPLTz6L0OfBxvK9kCpUU
	0tcRE641T7WVNX/KfnMqm6fAvXs71hhGGXjq8vESutn0J8nFhcasRpi7ZQLM=
X-Received: by 2002:a17:903:acc:b0:2bd:6e1c:3ce with SMTP id d9443c01a7336-2c1e849512cmr151618525ad.20.1780894007070;
        Sun, 07 Jun 2026 21:46:47 -0700 (PDT)
X-Received: by 2002:a17:903:acc:b0:2bd:6e1c:3ce with SMTP id d9443c01a7336-2c1e849512cmr151618215ad.20.1780894006676;
        Sun, 07 Jun 2026 21:46:46 -0700 (PDT)
Received: from [10.218.5.114] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f8bc5asm173655765ad.27.2026.06.07.21.46.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Jun 2026 21:46:46 -0700 (PDT)
Message-ID: <0a7f8ee4-2bd4-4ae6-ba6c-72b37d6ef92d@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 10:16:39 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] clk: qcom: Add Global clock controller support on
 Qualcomm Shikra SoC
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Brian Masney <bmasney@redhat.com>,
        Ajit Pandey
 <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <20260605-shikra-gcc-rpmcc-clks-v4-0-a0a7bfb44455@oss.qualcomm.com>
 <20260605-shikra-gcc-rpmcc-clks-v4-4-a0a7bfb44455@oss.qualcomm.com>
 <gvqubjzscwvq4nmerwptrnojrui26ymigzs3mo5yqordyfsnx5@zxtjhsntbrcw>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <gvqubjzscwvq4nmerwptrnojrui26ymigzs3mo5yqordyfsnx5@zxtjhsntbrcw>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dJGWXuZb c=1 sm=1 tr=0 ts=6a264937 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=ayl1ZFWQluqbhyEjsXUA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: qUB9h5mLjl7D5m8oC8K4q8UMwCmOB5gR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDAzOSBTYWx0ZWRfX4sXjfTdjCImZ
 xDXCsxsST1lO55OEBJdp32jwqVGBl5Sa+CiUP1Bow/CMTFZEGRPyRXAV1yml9mVgPxekx5TM2in
 UvHi/078X0yJugDjl26toO+/6dkl3zXi2+lHYft9xY7yctktqizWIHe43Lg1Ae4c86aDX2k/vq3
 E7QM7rBddoULRFmNoZO2b9MHo20aXZM9I7QOXp5uSX+WI87J0RJQVkI/iSKpdol6E+tRNRRKAnD
 b/sAf1f77msK4pDunqG07M89vppuIo6CiuCvGFydG0ykgj91QuNxenz+6plpVE5LuAgCl9ST8sr
 iTWsC28KCuUVzuCNd3Btyh26rQ7mWa98gJfdH7Nnas7/BU4nKgUcRW5Wo2F11VTIYXKwzeGlIBz
 xnVYywXQa6vpJuXfqOEDN66cepdRgt22Qi2aQAAq+RG+yZ1o7Mvn/cXjWH22qCGLxnsaIMpf8hh
 zPONrLR6uMMjDkYG3xg==
X-Proofpoint-ORIG-GUID: qUB9h5mLjl7D5m8oC8K4q8UMwCmOB5gR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_01,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080039
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	TAGGED_FROM(0.00)[bounces-111660-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:richardcochran@gmail.com,m:bmasney@redhat.com,m:ajit.pandey@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:krzk@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:netdev@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,gmail.com,redhat.com,oss.qualcomm.com,vger.kernel.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
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
X-Rspamd-Queue-Id: 5F813652A30



On 06-06-2026 05:12 pm, Dmitry Baryshkov wrote:
> On Fri, Jun 05, 2026 at 04:49:14PM +0530, Imran Shaik wrote:
>> Add support for Global clock controller (GCC) on Qualcomm Shikra SoC.
>>
>> Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
> I know that I've r-b'd the patch. But then I also compared GCC on Shikra
> and Agatti. Is there a chance we can merge those?
> 

The Shikra GCC has new addition of EMAC, PCIe, TSC, USB20, QUP subsystem 
clocks. Along with this, several Agatti clock/reset register offsets, as 
well as votable clock register offsets and enable BITs are updated on 
Shikra, and a few GPLL changes are also present.

I agree that few clocks duplication will be there, but it will be a 
clean and better approach to keep the separate driver and bindings for 
Shikra due to these new clock additions/changes.

Thanks,
Imran

>> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
>> ---
>>   drivers/clk/qcom/Kconfig      |   10 +
>>   drivers/clk/qcom/Makefile     |    1 +
>>   drivers/clk/qcom/gcc-shikra.c | 4431 +++++++++++++++++++++++++++++++++++++++++
>>   3 files changed, 4442 insertions(+)
>>
> 


