Return-Path: <linux-arm-msm+bounces-108220-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gJk5L7IhC2reDgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108220-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 16:26:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 18C3C56EBB5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 16:26:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C11183006023
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 14:15:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7388E481672;
	Mon, 18 May 2026 14:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IJ9b7bFA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RdjpCfgO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AC7132E13B
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 14:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779113725; cv=none; b=QOD1OntM+C+XE8MuWJhU8J/Ki1gBvzkDaVwRzPllrCjg1RPfyJM/NgFYD2Gda5h0F7TgvTiHfFkmkuTCgmgXUOi24hppTPZmgOvzek5e5dRGYsSNa1woV3pLG4JAv+8z97B0YpIe3784nLHgjtc2g5KGEXsObha+uyX8kA/PcAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779113725; c=relaxed/simple;
	bh=TN+RB4MvwPNVjTQyrOZFsnKn9SeIOzNa7rKStzEAP60=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jeEFZHZEPLDG9/+r7yPH2wTlt3whA/gh7eiCOpiWwtWKNAhaAm0qd+ipbKC96Bo3vIwHwX5ekHdY9ClKz3nywev0Dm5w/hUbZDE4s5+zhYGEve1VbxASlL1scvZcUCOHZA5IoHaqC/i47rTwKpGclMFKmuaxWMVPAqmjA6vZ0SI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IJ9b7bFA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RdjpCfgO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64ICFuap2700959
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 14:15:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tl5cNuX7Q/EbJEBDKEJHU8Nft3cHRScimLTBtlsFjco=; b=IJ9b7bFAeMpd+FjF
	HnelMReAhJzkanlPDuAR+teQUGers9J7Zm+ABfthhX07bh1Vc9NxWJ6LodphBJlC
	kalNdJjr4FWUtP8gxZVN7XZdimWtPEQFDFylsCWPljAECp+cK504vDcpbzHSwg27
	ciL1j398fRSEi/OjY1q0cHY1LOryCmqztZLsYSjMUWunnWr+CJOG0gmGE1zq2UQN
	YIXnXeR+yjSWx/Hqn9DuyAeX8yj+Zlw6cxXS5E9HYLv1iJdZW7qhYpP4mcl1GfzC
	CmI2BrqrSnry+0cUDS+09kki8WVyQFg/tqW8mg6wm76oTtbYsQ+RF5fAvloNPAGq
	FlO5dQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e82megef4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 14:15:22 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-6313443ffa2so119933137.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 07:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779113722; x=1779718522; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tl5cNuX7Q/EbJEBDKEJHU8Nft3cHRScimLTBtlsFjco=;
        b=RdjpCfgO17VROALjGIzVhekyfhuQEJMnmgknIg7s0E+joJtqPKQd9fox4i+sjVkd7U
         wOFPy0nNM1o2sX8aa2DhCu3EEUsHlv5JQW9DVc/dzbXG3ebzDkvZxFLwpcJLUB9p1eNx
         kLXh8rARqeFtNuD/O0EypY3nmdsC5oBGV6DJpH6VW3z+JoEEinpFNpm8seRNyDipX4Sd
         Q/03hnrygUj930pS7G4agJs4tQ9f899ruZ1TxYRyaiurOEqYPrv+HI7dQsf2oVUli70l
         2NZGbQEyh43XZv8uy+aUADML9yCiASl1XLFktBqTQpe/diioGt6fiSNZDFA8xfzYCDzM
         dvsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779113722; x=1779718522;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tl5cNuX7Q/EbJEBDKEJHU8Nft3cHRScimLTBtlsFjco=;
        b=D+Uo3p4PT1Ni/SVYDDmKcl4pSfWnSiuKaeC5rmLo8/VbyOxm/WdNhm6ZEZ4gcvRZqa
         M9/EaHAASEdWLsxRiaYdFxne3Wmzw1h0PbKuSoBeAyPjM7znUb9Um+c3o5mjwNaHjK6N
         R1fH2YYglF0Iiq48q0cvRLrGhW1S8yMKLwkmCzaZTf5a/BbNBrT98mrq+eRXm6xPrs7K
         be03lL6qSU54L5LMvlKN/NEX50naWHsOs4GHVI3BRqjaYe8elhEVjtl6TxSU0j4rkeUg
         mRMpaKmTDyXG11BNy07zfnPohU7F2mMP90cz6okNN3bzi6N1qQqMTzuFYouNXKSWbmKM
         /aTg==
X-Forwarded-Encrypted: i=1; AFNElJ8d3AMF2Dr9g1aZgTseEK7RmjIp0Bk4wg/+Fq0wdV8qZMTar2A1cP6M89J9zY+G3vjdXSe1s2yN3Vks4K4z@vger.kernel.org
X-Gm-Message-State: AOJu0YwA1uSLyutLSlYdbVBWtmX5NT1Juo6aMf02a8dCkKbKHjrUmkN0
	WZl/AQFyin4AnZhOHTzVFw32hrDEmAEMwL0fbgjtLpAeg+WuddmnPne0Y9i14/YOFveZfufO4Sa
	XdmV9X1RYSsPMsrDUD02DGCEDKTM3y6X9b60Pokx5C9CbqG+v9GfMFUM1zdtSZrR/2S2E
X-Gm-Gg: Acq92OFmPAYwt2jWsEX3ZmKM0neUHwQtQ/u4mHQAoqrqqxYvgwPqFKM26BTJr67Q2jN
	W/M5Y9Skp6KNrvs/ec9XGdMsZ3GstxV2IQGJw39YdWwbGiLZtTyPLrIBUlwkFaoqNxq/5Ieyhi1
	jBgxoBvTo9849SNN16nCzq9lBOH6rrdiYvUaS3QQRKgO//8SAO0pGXlrEnTWIoBY5AncXQUzaFS
	osLHldhUEjF9aQhEgMCxj61+/0+PfArkMS2hoLZOtwyrwj3RVJZuSlXZvu0dT7cU80UIfhITWhV
	ALZQS5kMqWyvYcfcT/rTTXNHsXJtpTkoqyWRQEjXjIaerStt/TWCs/0E9aQL23HzXWu3NZ6Mcyt
	6qw1OzgvIEKfUmbgQo+mPOB9VsOYV7ntpj6RknpNfBJ0mJ2deQFd6vz8Epcc73VJS0Hiz34s5mc
	/NbQo=
X-Received: by 2002:a05:6102:1242:b0:62f:46c:40bb with SMTP id ada2fe7eead31-63a402a0379mr2115116137.5.1779113721958;
        Mon, 18 May 2026 07:15:21 -0700 (PDT)
X-Received: by 2002:a05:6102:1242:b0:62f:46c:40bb with SMTP id ada2fe7eead31-63a402a0379mr2115097137.5.1779113721214;
        Mon, 18 May 2026 07:15:21 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd7bbae7a93sm132624466b.22.2026.05.18.07.15.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 07:15:20 -0700 (PDT)
Message-ID: <9aad8e45-b0a5-4c59-8793-8c0747d8fafa@oss.qualcomm.com>
Date: Mon, 18 May 2026 16:15:16 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] phy: qualcomm: qmp-combo: Add preliminary USB4
 support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, usb4-upstream@oss.qualcomm.com,
        Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>,
        Mika Westerberg <westeri@kernel.org>, Sven Peter <sven@kernel.org>
References: <20260518-topic-usb4phy-v1-0-71d827c49dca@oss.qualcomm.com>
 <20260518-topic-usb4phy-v1-3-71d827c49dca@oss.qualcomm.com>
 <4nqlpu7qfptekyn77sd7sdn446stgn3v3lw2356bvizrnvjgnr@czqgivemigt5>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <4nqlpu7qfptekyn77sd7sdn446stgn3v3lw2356bvizrnvjgnr@czqgivemigt5>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Tr7WQjXh c=1 sm=1 tr=0 ts=6a0b1efa cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=KUSMMZrqeANCeUtcB44A:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: h_WCHHWEbLawIjgRtIor_KhKENdjTLuk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDEzOSBTYWx0ZWRfX8zinl8FdyuPB
 Ek7Yw4R/DgrGg+Llp2xu10JKdg97bUqetVqtolqmbu6PiPsNEE6tHdrPBXQfnZYpdOAOpt0PE3i
 1PEXh/SoMab7acXox6Cf1SYN2i9hMP+qRGX68UFw57Mp6JvnQixmnybYmb8nE78ZFezV5w305jP
 bO1w/K6vQ5UJqlwM4BfRIq0Nm1b6c5jKhSQJ7uBSHmqTcUBAZOTZxQ1zcNk9UtoOkoQOv3aZDGq
 PnEaMv4GQGY3kmSA2YuRrQ5z76R69lInF98N/sZhYglBdG8NzkiFcXeI4uDCxpsszj/budyVqN5
 y/nxlpBeYg+90kM8Rg38LMXzFyzXWaylKdCuLMhOJDMoK5sbkBCnssFOTnW6LP6x37rdPTMTVJr
 FRMaBzAAmKgTuvTew8aTxvcK8rKf0DCFokx2lZIx6zuA3pQIt3WEItwJQMD0KXMgoveaAxHDrP9
 RFYspTEW9xPE446nzsQ==
X-Proofpoint-ORIG-GUID: h_WCHHWEbLawIjgRtIor_KhKENdjTLuk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_03,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605180139
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108220-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 18C3C56EBB5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/18/26 3:57 PM, Dmitry Baryshkov wrote:
> On Mon, May 18, 2026 at 12:29:50PM +0200, Konrad Dybcio wrote:
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> Some Combo PHYs (so far only on SC8280XP, X1E80100 and Glymur), come in
>> a flavor called USB43DP, which as the name implies, features USB4, USB3
>> and DP signal processing capabilities. In that architecture, USB3 and
>> USB4 PHYs share the same USB_PLL while featuring separate logic spaces.
>> The DP part is roughly the same as on the instances without USB4.
>>
>> The USB4 and USB3/DP operation modes of the PHY are mutually exclusive.
>> Only one USB protocol (and flavor of pipe clock) can be active at a
>> given moment (not to be confused with USB3 not being able to be
>> tunneled as USB4 packets - that of course remains possible).
>> The DP PLL is still used for clocking tunneled DP links. It may be
>> turned off to save power when no tunnels are active, but that's left as
>> a TODO item for now.
>>
>> Due to the nature of USB4, the Type-C handling happens entirely inside
>> the Host Router, and as such the QMPPHY's mux_set() function is
>> nullified for the period when USB4 PHY remains active. This is strictly
>> necessary, as the Host Router driver is going to excercise manual
>> control over the USB4 PHY's power state, which is needed by the suspend
>> and resume flows. Failure to control that synchronously with other
>> parts of the code results in a SoC crash by unlocked access.
>>
>> Because of that, a new struct phy is spawned to expose the USB4 mode,
>> along with a .set_mode callback to allow toggling between USB4 and TBT3
>> submodes.
>>
>> Thunderbolt 3, having a number of differences vs USB4, requires a
>> couple specific overrides, pertaining to electrical characteristics,
>> which are easily accommodated for.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> ---
>>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 392 ++++++++++++++++++++++++------
>>  1 file changed, 322 insertions(+), 70 deletions(-)
>>
> 
> Overall it looks good. The major question (after looking at TODOs), do
> we need a separate submode for USB+DP / TBT+DP?

The problem space is as follows:

After a TBT (collectively TBT3+ and USB4) link has been established and
we have a link partner, we may (based on the HW capabilities and user
config, such as kernel params but not only) start or stop a DP tunnel at
runtime. On Qualcomm hardware, the PHY is kept in USB4 mode and its DP
AUX lines are not used (instead, the encapsulated DP AUX packets are r/w
entirely within the USB4 subsystem via a pair of FIFOs that Linux sees
as a separate DP AUX host)

Then, on hamoa/glymur specifically, any of the 3 USB4-capable DP hosts
can be muxed to either of the 2 DPIN ports on any of the 3 USB4 routers
(and each of these routers is hardwired to one of the PHYs).

To underline, we have 3 DP producers and 6 consumers. If there's e.g. a
super high-res display at one of the physical ports, or a long
daisy-chain, we may need to use 2 DPTXes to service 1 receptacle. Then,
we would only need one of the PHYs (associated with the router that's
wired to that port) to provide a DP clock.

This, along with the normal (logical or physical) present/absent status
can change at runtime. My plan is to use phy_set_opts(dp_tunelling=true)
or something along those lines to toggle that bit as necessary

Konrad

