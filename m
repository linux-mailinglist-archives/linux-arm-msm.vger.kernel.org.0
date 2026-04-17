Return-Path: <linux-arm-msm+bounces-103500-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uGsLOpb94Wn50AAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103500-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 11:29:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A43F41944A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 11:29:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 44DEC302263A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 09:22:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0A59372EED;
	Fri, 17 Apr 2026 09:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kMwJZvYD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MXQM6pCp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BC82325716
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 09:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776417761; cv=none; b=OZv5b7id2ysAAFuc6duSyheJNq8Y0BDuK8D7GuN7L+IvrMNvBxsOxkjgVWMILW91ynaNIcHdXaJGbadDS+oo1vGoqC06jGGAZi+yEO7tMdPbAP61auX+5mOoCmCp8UkwKVn5gpX4pyVsVgaSnWEmLj++hxEL8knZ+E1QXO8q8UU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776417761; c=relaxed/simple;
	bh=O3zila/ZzXdCtVZV3F/hDT17khok2Nbf5KQ4nJluz7k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T9/NkkkComlkFU14o6KgJJWXiSRq0QFwTPeRcA+EWdPuc6sFGgTQ4FzovlpDiGXMD5LQr7xbxZlAGGJ/o63rBkRpZoJ/lcQS0A+DqqDE1Bh0YcxNwx+0lM+Mzs8Oe2RkcMQqO7ldPyaTbrvJix1SzG4mOolGDOq6K7u4BjLgIsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kMwJZvYD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MXQM6pCp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63H80YWf065744
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 09:22:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	618EE27hGTuXzJEXrKjDPcINKm+g78qgGdhJxKekRlk=; b=kMwJZvYD4S0IeblN
	lVfexvLKXpNDL/UCANmOpZhhSKEjyW24uEbRb1AuNNiqfgtWcva8avaEF+r1eqsq
	3mYcS6iNLduSsSHskOKYIw8PUhqSiAOm6a6UM11b4ZWHUBbD4ZiEn3fvYPzDDPmZ
	EZRh97CcMsVWDIpZQugeRZLGUUrv+5/AqmIaQiKl5ZdCVnZsn1oF+X+yI+4OXi7O
	IOZFOPn/2vcYw2yKUFtKGsxnm4G6n86DgMZAfAnvmGTjQA+OCyrkEXHftmcliRC1
	QV9bK3Lkwf8e1ll7whTdosE2L76Bm0tmlmqgpv4r1QwHbRjR9UzykJvvk6s0CeA5
	yHKdSw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dk3af31fg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 09:22:39 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3594620fe97so1510077a91.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 02:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776417759; x=1777022559; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=618EE27hGTuXzJEXrKjDPcINKm+g78qgGdhJxKekRlk=;
        b=MXQM6pCpHIpYbydJ/rvqeybsWPrxeavjf2C6Zrudfln3VzA9e7KMDH9Vy71xvK8p8S
         3gBtq9S4XwssNXIB8mS/uiVOOVvXDM9A5W9pug/uEYO4RKImP9MC+CUPHT/F/BxDAXXF
         z9cidh6IZzBma7ndPhJtr+8yL2UQIFrtPQ/8cCmAV4eMYqZptxKgXSUzHXEXFbx4d8wk
         iG2x2eRS/74T8WHFiXEayL2kkPtTKEuCh3DqI+jlqIsOcwYEXIsfHd7UKzI7h5Gc4Ur0
         mBwO4MvLAHgr1+6od/B8UoeLK1xqju37BHX+IDZKhXsG9ovqTnd1Jdl1kHcN6iSsUh/f
         f9JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776417759; x=1777022559;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=618EE27hGTuXzJEXrKjDPcINKm+g78qgGdhJxKekRlk=;
        b=sGvr9rg5UymVuceUXGHbQWSat7WY+ePdlfd183mg/UaAs3jVADdjVgDCYWtzVG6dsv
         slV4lDM3mwZAntfK1QzY/bdBXptVeAugQAKT5uIUjo5C6CiRIDrtUXxCHmNRQlzCjlFs
         AqkkTJCh7HkXiWWNH2Q0m+Ad/TV7lVnV9FIrXN+AaPR0DQf1POVzr6T8SX6Mj+tNu6Cs
         ALA2bv0JlhdksHMfwgPKdWcniSawJY8R//Ag1EmTJLJoz0qxPJXfmFkEGC/baNnijHUR
         vs/2han6f3J+NtVM66YrLbbXSrXB5ZijAfAtjRxC5zuzDMYt3jXoE9W5DGCewvJIpaSc
         2dwQ==
X-Forwarded-Encrypted: i=1; AFNElJ9j5VEuAPiD+dJt7eY/MmFyM7xJ9/yHzbO9hFQfxkllBlwW8LwPuSt6HTmoEGczLLa6FqUGHvNzvBpynDZB@vger.kernel.org
X-Gm-Message-State: AOJu0Ywk03/3wrLLPeva6wjuTgRUM+mAncwfONxxH7QNV+ut7NB0zcK1
	ufrXaqbZ7WZQ4i6EcTqIdH/qWp6EL3uyCULWq/6QrU8D6ROhawewQvYHNbz/JRZ/SzeAvQ/Vm1l
	ezVrJAaO7j2aBFXd4kIAFIMJB/3NnIYDGnImIQ4jJg6H+MsfQvtXUsMNuByeZ+MiLf8Bl
X-Gm-Gg: AeBDiesZH1HRqQeOdV6t8oOytuxQ0UFhooeE9sE5mizlQL/+RKcR7j1Zej4ma8z06mf
	A259R7n0DU52EsLVz6kfmmtFvMb3jiCFWFt/G+GPaCOMeeYFCBtMuORCbwZVqbZTC4517DCmLsC
	GEzxh/XXB2V2c48uZ9L2qon+MheU2zt/6bO/2ictFvYrrMbp0kyar/aW2NwFRqix2mVeA39WDAx
	lvtPwrUuiSMFBvldoNunPqlQ57bQklxsW08G7yJIVZFisJpHHeqHUAxQ2W8COKVBVZw9h7EXCAg
	GGfHxbe4WpDn6opODTtWT8cb8/AkHxBZwcpMJQvGAtWZ04UFeTXcsfcgvgb+xWXGVbK07AXn9QL
	hLEwqHm3RWKipJwnzNYXpALnYNZlzkw+qWcCIYF9rMcerR9IHd10vBI/qYzf6gQ==
X-Received: by 2002:a05:6a20:3d12:b0:398:8870:b58f with SMTP id adf61e73a8af0-3a08d6eec7dmr2234619637.14.1776417759052;
        Fri, 17 Apr 2026 02:22:39 -0700 (PDT)
X-Received: by 2002:a05:6a20:3d12:b0:398:8870:b58f with SMTP id adf61e73a8af0-3a08d6eec7dmr2234588637.14.1776417758576;
        Fri, 17 Apr 2026 02:22:38 -0700 (PDT)
Received: from [10.217.223.121] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c797703be34sm964756a12.26.2026.04.17.02.22.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Apr 2026 02:22:38 -0700 (PDT)
Message-ID: <b8f781b0-f7ba-407e-8603-ca504535a894@oss.qualcomm.com>
Date: Fri, 17 Apr 2026 14:52:32 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: glymur: Add crypto engine
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260416-glymur_crypto_enablement-v1-0-75e768c1417c@oss.qualcomm.com>
 <20260416-glymur_crypto_enablement-v1-2-75e768c1417c@oss.qualcomm.com>
 <653fc8bb-295f-4f1d-b9ac-a33e0d8a933b@oss.qualcomm.com>
Content-Language: en-US
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
In-Reply-To: <653fc8bb-295f-4f1d-b9ac-a33e0d8a933b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDA5MyBTYWx0ZWRfXy/8o04KbCV7+
 YlP6ygaxi3DnQMxotkxTVmAuIa4nuzbUApfZkB75Dr6SmHuClk8H+O8IkkutXY2fJhHZbY+/Gqv
 fyGaRI1Gl1iLSdpJsH6qjXOjocmXncqHntr3YQarVN7de3teXb5/ctLAnhQpDES8ACWCK4Q+b2C
 4dtPd8bJI2xTbnnb2Y78uX+xGsJypt7Y9++XvFX3Gq5eMKyu3qh/1zLrncO3PtwyHY6cKSkokMN
 6rYuHjS8Berk4ps7LiHLgiDwGjvF/WyoI6o4yGRt4coKWmvFKqWw9TtiAwB4YtaBhLVc+TTLjQP
 wJtKT5IxvQo51VxoBJ2eyM/UPKfxaaN4QTHumXResYZ6A6gUKs+WGUU2jv1bqjZcfqTZUctkIpV
 9Y1O8WYZCOXh5ocvEESW6d6HD6DKtUdyzJOO4gtSU1f+2+tVGbywOqNm/BX7szifklzpYgHXUUQ
 tIoQakE53Ag+6INy20w==
X-Proofpoint-ORIG-GUID: P66WZ9cou11EkszVQqoqGoBxGNHHqbEb
X-Proofpoint-GUID: P66WZ9cou11EkszVQqoqGoBxGNHHqbEb
X-Authority-Analysis: v=2.4 cv=DfInbPtW c=1 sm=1 tr=0 ts=69e1fbdf cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=RzAiLgmaXtKTj2OvRzIA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_04,2026-04-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604170093
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103500-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,f10000:email,qualcomm.com:dkim,qualcomm.com:email,1dc4000:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,gmail.com,gondor.apana.org.au,davemloft.net,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[harshal.dev@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6A43F41944A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On 4/16/2026 7:10 PM, Konrad Dybcio wrote:
> On 4/16/26 3:07 PM, Harshal Dev wrote:
>> On Glymur, there is a crypto engine IP block similar to the ones found on
>> SM8x50 platforms.
>>
>> Describe the crypto engine and its BAM.
>>
>> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/glymur.dtsi | 26 ++++++++++++++++++++++++++
>>  1 file changed, 26 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
>> index f23cf81ddb77..e8c796f2c572 100644
>> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
>> @@ -3675,6 +3675,32 @@ pcie3b_phy: phy@f10000 {
>>  			status = "disabled";
>>  		};
>>  
>> +		cryptobam: dma-controller@1dc4000 {
>> +			compatible = "qcom,bam-v1.7.4", "qcom,bam-v1.7.0";
>> +			reg = <0x0 0x01dc4000 0x0 0x28000>;
>> +			interrupts = <GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH>;
>> +			#dma-cells = <1>;
>> +			iommus = <&apps_smmu 0x480 0x0>,
>> +				 <&apps_smmu 0x481 0x0>;
> 
> It seems like these aren't the right SIDs on this platform.. Have you
> tested this patch on hw?

Thanks a lot for catching this Konrad. The correct SID pairs are <0x80 0x0> and <0x81 0x0>.
(I hope I don't need to pad them?)

Unfortunately, I could only validate driver probe on my limited ramdisk environment:

[    4.583802] qcrypto 1dfa000.crypto: Crypto device found, version 5.9.1

I was waiting for Wenjia to run the full crypto user-space test suite once. I'll update the
SIDs and wait for a Tested-by from him.

Regards,
Harshal

> 
> Konrad


