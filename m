Return-Path: <linux-arm-msm+bounces-92933-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +PiEB+MEk2nF0wEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92933-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 12:52:03 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B1344143258
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 12:52:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E99553004DCD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 11:52:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E950306486;
	Mon, 16 Feb 2026 11:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AfCTX9ME";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SRsrXLaF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21DC9303CB6
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 11:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771242720; cv=none; b=WGtk56SWd9W6gHjqiNMUP2Q4Dlm/6XDV0E8K+wzF01rzDdL5KeK10Xrc26cRUf8aN29l8dyIGhBOp4qrMNTIXHe2fyzpa0XNi8A1jzMI8WIXmfpNnJkK3TSD5zgxhf7F33BZwLc0ZuiHcQqUWIU/mUiC7lOPCWFg8Oip/5oElx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771242720; c=relaxed/simple;
	bh=lsXW5opOWhQlqRG1iRQ5F60Z9k8JnXVM3dVm1ROB8dE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h0T4ZSRtScOdW0DBk2msRedF5DZsi6fnojhXrFxew/GLScyZw2XkaaS7hcHB77LL87FpnDjZFmdj8xHSbOjgBu5f9ydSb3ahK7iftXufiTfHNCTdFPadDWvXGqCZDT3/Cu/eqK2DzQzJIiNybIZ0hEvpjV/FMIOTkuOLTz9XppA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AfCTX9ME; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SRsrXLaF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61GBaJEF2343792
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 11:51:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZWsbyWXAc4HA5wnDoMmc+gJTPZ+3iX+irjxaCxYqnLM=; b=AfCTX9MEFi8gL8xB
	7pTfXolPys2rhszHa3qYLqlPspaSXgSA+JtVmP1zTtItR1cAc872k72/xB35S0nq
	4B2Un9Yn+nPtQ5AEkiMxhQhpgaqOEnHHME9ms9C/iMbpFZ287uh4FX2tnub1X7B7
	5PJcXjtN4nReBCTPY07o7u5IwZcqZNkT2Wz8WhY8YiRZJhh4D+hcQ123EvhshTMk
	f7mEEMrNge+7SqDun5TJ6aZ8kz3macqg3PHZ7CR0a2WY1SM5bf7abhqsHhuF3Nt3
	mM09lZm4SQkZPRrrI0Y68qquOoMotJzLkwN/SAvf61ABq9/sU0vF6v4jREn4AI6f
	w58z3Q==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cb6bujntv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 11:51:58 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8960257db65so21631886d6.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 03:51:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771242717; x=1771847517; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZWsbyWXAc4HA5wnDoMmc+gJTPZ+3iX+irjxaCxYqnLM=;
        b=SRsrXLaFeJlVu9CQUFYZm9KDvaTmwQ1pkjDOCGXcsII+yjccvXHeQFYuX3hQncGqWV
         DElED2+eEnw7awpEsoaUlIi90zOGDXY+zWoCLe4AQ+K4oLsFSXB4flYTym5KFK1uB59V
         xDXqaddp15+GLwICmeClNbV6humiQ0+usDbSXjkhJeCb/XK3/ysw5G4x9Du44WHaif0K
         sPOLL/HJ2fKIbG5wrJSEAUCb25WUYWwOz5umojyYIiV9E593O3rvIGBhPVJ+pna/Lf30
         zVSvzu+V/RmlfMCWA6bSDme4XQ+sqHWC6dv74to3g1+UzdGuui2aD2JYaj9g0O58WyBq
         P/WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771242717; x=1771847517;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZWsbyWXAc4HA5wnDoMmc+gJTPZ+3iX+irjxaCxYqnLM=;
        b=bSTUrsny3eqO5+nTMgXEFcQ+DoB5OgDnWThou9v81EbvmN7ybaSRu5xgnbqwkzghCZ
         JMK0TndizoVumZeFFo6NxVIc2qJpfGTetTHAtUlyDV9lIYPYDnIKMbLrzESrygw+FOMZ
         xvU0iML/FmDqV1E67+HxPvvDAzIEkzbvRDfEenTZMsNwAgHsbEJogTGJCrwxQlUlB3RH
         e1PuT8nIIQq50WQyXiqUiglGu1rMnyNGlM9T0ltJ9CjtPeWn+vEx2Q9Kp5Se1zrQIWjQ
         DQBlG3Dir+nx5WcHADPtFh4iMuQdBYavr2VU1lCIluOmZsVPKpRmvZtH0rHEulXvdVot
         pbzA==
X-Forwarded-Encrypted: i=1; AJvYcCWBW2u9zE0Hu2kY8+wCtPgSemi+6Ydmu1Ks4KgT0kd0UpHDblleanRzC9pB8aX9ThwcybcBUqNB+2GAd8CX@vger.kernel.org
X-Gm-Message-State: AOJu0YzLp21F3Vg5t4OBlWxUpi7bT6dD00KyXWlqmECmL4LVOmiq84EX
	nqhZ8fcdmo1aZhxXc/PKGJofp9NjX+Y+38785MSgouP93JMgdpR/Enc7VQbEKdpBvHSlxzdIJ2b
	2sKn2jTlomWLRVZfRpKOYg7auAWs/vtAZ5fF2ltawMDWUIniZ+5Rd5NqIvF/3354bwmKK
X-Gm-Gg: AZuq6aKyOYfkg0aL1pWoSQULfvbL6+HR0Dckp1g6MdxLRAj8HnFeWQAnAIESoD1Jkmd
	pekcIo6aoi6RZCBA0N0JtqndfexqlQwbYp6Q3pLWCebmwOOiiNMxs5l82ASAzpES2J8u15KhTMx
	EwaTuhnegz/3UOy5tWOCTd/pcmD15GO0CUtFcgdynpf+Da2hbPWpj9W8fF0uToH5O3q1X5NOlZF
	1BoKFHNL6ruWI+fCON+DpOb3ddNwwuld4btrOec6PZ20AVsgnKE8EFnNJrvXEc2XLN+KkxrrK/I
	duaAVIeq6qcgqRtgVygh8YC5F5djKk74Izfwq7Swv7Gq49EYA4mrPaWDa97+UiaNNE6bKuqLJK3
	8hj42pkJOQpYf0myYUJf7zL9I/3Rm/gxdke9OjcLw9WumXuiDqqmVAcwRjf6pjU/+GD3Bg0eiWT
	wGUqo=
X-Received: by 2002:a05:6214:4782:b0:896:f6c3:8213 with SMTP id 6a1803df08f44-897347b05c3mr110532476d6.3.1771242717145;
        Mon, 16 Feb 2026 03:51:57 -0800 (PST)
X-Received: by 2002:a05:6214:4782:b0:896:f6c3:8213 with SMTP id 6a1803df08f44-897347b05c3mr110532356d6.3.1771242716738;
        Mon, 16 Feb 2026 03:51:56 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc73f102dsm247760666b.26.2026.02.16.03.51.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Feb 2026 03:51:56 -0800 (PST)
Message-ID: <bd85e184-4786-4b0a-a5ca-c1709f90f897@oss.qualcomm.com>
Date: Mon, 16 Feb 2026 12:51:54 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: monaco-evk: Configure USB1 as
 peripheral and USB0 as host
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, swati.agarwal@oss.qualcomm.com
References: <20260210152548.769951-1-loic.poulain@oss.qualcomm.com>
 <d7a6c220-a6ff-4cf3-8c05-762785a7f21e@oss.qualcomm.com>
 <CAFEp6-0hq2tnYG4xaZ_EBFBBk3Vdp+Er5nCn7HY0F4v3yGumLw@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAFEp6-0hq2tnYG4xaZ_EBFBBk3Vdp+Er5nCn7HY0F4v3yGumLw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: jwRNSuHLJIt0odv5UrHihIGH_XpfH3XK
X-Proofpoint-ORIG-GUID: jwRNSuHLJIt0odv5UrHihIGH_XpfH3XK
X-Authority-Analysis: v=2.4 cv=M8dA6iws c=1 sm=1 tr=0 ts=699304de cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=iLl1GrVLFy--1EQza-IA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE2MDEwMCBTYWx0ZWRfXz34lBw1jY/zJ
 YDGXVuWBUNv5HVn9vOdiyimJyd6Ip6QofAW/gP9W6jlOOzv4Wbnc5Fr1ymfjq8Wqq5FWNDjlt+h
 jvbKGL7d7fS3eOSfU8s9lngnCOt4yeZp6MKRl7oEeUIRucIlhTWlpRm1kPyr9w0u0ePtQL7hPzh
 RQNonCzQc2mpRZQ0YUG+85edtTTWP4mBvU6a7yw+ndlum2f0frSGBrYaOpAw+7aNyzfNrwAi96J
 kCLtSF1TiFJk4Inm7D5R8n7MtRpeqCSZfG2Wa0uqJ1VEPM00ZspzTCU5dD37Hm50ZwosAfnDZfP
 koElTzsNkvDcUsJawb+69ZgHb9KmbxZpy9O8xUNtvf5DZinrEspB9PofUn0n3mNlJGIYh9rQJyu
 FCu/arzlXNSekEVMBiMlYlm6/OgTbsAfTvxPQNg5/u4jcEmEoJ6FQAn7F7iSvmqb9ZlcFO+Fxqh
 oWIIbqMworASACJSkqg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-16_04,2026-02-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602160100
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-92933-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B1344143258
X-Rspamd-Action: no action

On 2/13/26 11:30 AM, Loic Poulain wrote:
> On Wed, Feb 11, 2026 at 3:01 AM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
>>
>> On Tue, Feb 10, 2026 at 04:25:48PM +0100, Loic Poulain wrote:
>>> On the monaco‑evk, USB1/HS is routed to the micro‑USB connector labeled
>>> ADB/JUSB2. Enables that port and configures it in peripheral mode, as
>>> expected for ADB/debug usage.
>>>
>>> USB0/SS+HS is also repurposed into Host mode so that external peripherals
>>> can be connected to the monaco‑evk, allowing it to function as a proper
>>> SBC (e.g with USB/HID devices connected).
>>
>> How are they repurposed? Is there a DIP switch?
> 
> I meant that in this case the port is configured in Host mode rather
> than Peripheral mode, so it's “repurposed” in the logical/functional
> sense.
> 
>> On 2/10/26 4:25 PM, Loic Poulain wrote:
>>> On the monaco‑evk, USB1/HS is routed to the micro‑USB connector labeled
>>> ADB/JUSB2. Enables that port and configures it in peripheral mode, as
>>> expected for ADB/debug usage.
>>
>> Is there no OTG pin routed from that connector?
> 
> There is indeed OTG support, and Swati actually sent a patch adding OTG
> functionality:
> https://lore.kernel.org/linux-arm-msm/20260210155329.3044455-1-swati.agarwal@oss.qualcomm.com
> 
>>> USB0/SS+HS is also repurposed into Host mode so that external peripherals
>>> can be connected to the monaco‑evk, allowing it to function as a proper
>>> SBC (e.g with USB/HID devices connected).
>>
>> What is it routed to? The DT lacks any topology description
> 
> It is connected to a USB switch, which by default routes to a USB
> type-C connector.
> In the alternate switch configurations, lines are routed to internal HUB.
> I guess it would be ok to describe the default config with Type-C connector.

And what does the internal hub connect to then?

Konrad

