Return-Path: <linux-arm-msm+bounces-114089-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id OtteBJEkOmry2QcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114089-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 08:15:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F976B4656
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 08:15:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=BdHGanCq;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="Hn/juwvn";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114089-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114089-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9F98630492A2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 06:15:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6244C3911B6;
	Tue, 23 Jun 2026 06:15:00 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DE1838887D
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 06:14:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782195300; cv=none; b=azq6DBDwbU1JDo0/s5JiE43AQXRRx3rkIQBq9HTXsPlkjxO5t5TmnVRD434/gXjflhg/sgflkfdz5mXF1NKMjV0+AwZU1rGZY1hm6eLiLYZhfbJ6jYj/oDDyJ+W94y466yGA0pUPcKrzEYlGrw9o4iu5dAt9rnRwAsjQU+8uXhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782195300; c=relaxed/simple;
	bh=MyO9vSxYmW96gkicKMfQpYP2sU8NYxAm2f3g9BjPzFQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ea3ejVDlXV51gI7ct5sCNI4GzAQqBXvfrthXlBK1R/w87RQ9/6V3+rjinMj4FEyaGPy5ZyRBC4goO3ECunBK6/8v6T9S8ZpQRW3NTSCJueZ+DZc/048EETxbRrsdWnGRaO0GyqlAcm6HlG0MDY2woctBLqlmpeGjuMvXYJHLbyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BdHGanCq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hn/juwvn; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65N6CAhn3567864
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 06:14:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SRmFezgGdNXaD4cxRDkq5/2uzdaGtG1vf2sMTlaxZt4=; b=BdHGanCq/fvjWyLx
	lO6xyNjBVc9KBvnM97L9TUbDYCAPOOL0DDuBny+lP08yJS19RkAtX583JoZPDe4n
	2hLR7qPVS7Vw8tW7ebDheHxnY18S9pvPsI/7VK2V76GOJHSQk9YHBEf69/x94lbL
	KxBU8ewuJzxi/dNl9trrmdjr84XyAYwsi1fJqT7eRUneFExZGw6OHjAnluDkZyhV
	/Jv+dX8ffzdhNuIgKUsXr4lcu9Z+Wa6Poo0CP1FsIN0jp3qaQ4GY5U4WAFxeWgR6
	H8hRmzyPn0Avk/XPXtwX918jSIpo7BjBdOFsiYxMFBVnIIf5NcJ1nhg7rsP/zrGY
	P05+fg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eymnvr0a8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 06:14:57 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-36d8719bae6so4239162a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 23:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782195297; x=1782800097; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SRmFezgGdNXaD4cxRDkq5/2uzdaGtG1vf2sMTlaxZt4=;
        b=Hn/juwvnhaXiYHtO0V16zDnM3+QxkPzD/vRX9PYQm78gSz2D5SvXz6df/ZFFW2eMmQ
         3bHYfOXsF4q7Vh0DRW6hkBRISuXgwqvUIoTpDVBelnZLdmo5NVbcD4ODdMu4CFjGFqoW
         jMO46EKUa5SgEvI8FMrt6PC+WD2eECfMIGKbEdr2xf1s2GOX70uyJw9y08AJPSUKycuy
         NTPZYwWj/x2nlua7SK7Tfc7S6cGuB2NUG2qmbh2tKccvDTKVcJuvtB+oXJcXHGxmGmQM
         W20e9RdcU61D49DFd6ZTmpy54NSwM5HwDxJTm89AmI2YxslzTMSHp9ggTH4/dZf552Mx
         BnyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782195297; x=1782800097;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SRmFezgGdNXaD4cxRDkq5/2uzdaGtG1vf2sMTlaxZt4=;
        b=rCKfYJ1fD8IqsupW9UCbWl6mBxEn33fm90XMgB4Yv6DrS7jvFCf1Gn+GsRXuszbWdD
         PsNXycuOk1gYTf4LF/KgawVSQc186eBZC5qqew76kODeTrp6KAdqHZuUnTWCjGYK5x35
         Lv299D/qlfxqm5nda7rRt2dj1vBRIM8WKHEamhgkwG78DPzS7OXTju/ndVFFx16sM5nG
         lsHGyyCTDFTcbFwfTi/xXgHp9sVCs+ttghi5w6JFjaIegN2D2VSfPAzsu04mtXiwSl9w
         m9We25SoWJGTZuafWM+tK5gpM4UPYoWHKUjGdpGPXw1YtuE0Wu4Fb5JBK6feIhSL9i2P
         +SSw==
X-Forwarded-Encrypted: i=1; AFNElJ88pgFn6yRnrdtwyUSFzECQ7pt7oX09WN38BtrCwjFxoQByDZiYrTHjMc2nKJFL/frNfHXLokzZZvl4mAEd@vger.kernel.org
X-Gm-Message-State: AOJu0YzApD9mUUEZY1BosVQNBHE+NEdyA8kQLxiMImdRFryiXsBjcrsk
	dMXwI/iFgnBRj74i5bgSxDDksgWtMpjIeEbt3JJqPEDFCFg47yHgO6wkfrfTnPUaQRJIHRQ/iZ1
	h6GGoUqRzqJhMIUW8l36mrG28g8RRGHFXHp8epw0FPR6ZbFZWhZ5kp7Bx1y7QmmT/8JtF
X-Gm-Gg: AfdE7cnUG/0rrpJdsvc8Yo5LPy0j+tex2WOXhMFfNCuVvtVeuQeK1M6DwCrHXKb0Oqb
	21CZjhaqavQeiECp5t2cAIPWeappm4rV8vPp/v5OTaHBqQZfVgfcZokNnrxUs/8aixFFxFhtc9P
	yUGRiM58i93ND2ft0At9qqmKCDrzJSdyoc73/nhBEWyRl4iL4UsFrYR1qWKj5I40DQheH7hndn/
	6wLgO8Uz9hXCN0Se2Py9wP6UADkkC9hsfRHm7pze7FKNyHpXxi8nQeCGQs3s/9zWJHIqUmQ3iFS
	+WdomjkaaCwCYE6WE/oLUJHTphJT1zGwocqNLXFYwUBx74iW62LD8ph8fNsohbPgxFRL4rCuxm5
	x2EWeST/3VWy6YHwOLGf5WxdSdsZYN7iS8c359w==
X-Received: by 2002:a05:6300:14d:b0:3b9:545d:bff3 with SMTP id adf61e73a8af0-3bd1904cf62mr1456528637.14.1782195296933;
        Mon, 22 Jun 2026 23:14:56 -0700 (PDT)
X-Received: by 2002:a05:6300:14d:b0:3b9:545d:bff3 with SMTP id adf61e73a8af0-3bd1904cf62mr1456492637.14.1782195296513;
        Mon, 22 Jun 2026 23:14:56 -0700 (PDT)
Received: from [10.218.5.114] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8bc2c8f0a7sm9216353a12.7.2026.06.22.23.14.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2026 23:14:55 -0700 (PDT)
Message-ID: <d35fb519-ea1b-426c-be97-d48201eb3bba@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 11:44:35 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/13] clk: qcom: gcc-qcm2290: Keep the critical clocks
 always-on from probe
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>,
        Ajit Pandey
 <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260604-shikra-dispcc-gpucc-v4-0-8204f1029311@oss.qualcomm.com>
 <20260604-shikra-dispcc-gpucc-v4-1-8204f1029311@oss.qualcomm.com>
 <w2y2wz3cbifnko3td3ovxfom26lll3vl5qgulksa7qnuvzukpf@pqlrh23sljsz>
 <f6264995-a6f6-498f-9557-723c39becf1a@oss.qualcomm.com>
 <CAO9ioeUtpSoorLUHXXLEjS+N_AWUtdX2ZD0X+Wss6O0+gwq55g@mail.gmail.com>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <CAO9ioeUtpSoorLUHXXLEjS+N_AWUtdX2ZD0X+Wss6O0+gwq55g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dOWWXuZb c=1 sm=1 tr=0 ts=6a3a2461 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=Z54PLgYRQ6qQMJT4v0UA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA0NyBTYWx0ZWRfX+UbYbPxGigpy
 Al2CR9DayWMi94t3n3ALHUjg8fEDLjabAZBnJfFEtqvLT9A08Jc7UJxw61PUpXgcatsV0I17skL
 LocvhRTi/Dhucx46v/dDiSWOObF7FgQ=
X-Proofpoint-ORIG-GUID: FTcFr1D3MACvnIuPYzZ7oBhQABFlR7o2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA0NyBTYWx0ZWRfX282i0a1z1K2m
 D5qVFlekljOnUYQPcQypdOuEqUd1q68qIMnn56SsWT0ONHx0KvkZYTB6tQaJQp8PBkhRR/zqUiG
 UCdg/JOWYsBRMWg3j3jhtvy7U49xvZPUSaUvhcuJgGkgLkkrAFEvhZMFTl5Zt3ZQVoczCGx3Op0
 htzelrRKNU6I48GAg/ffTfbOCyM72OwvACQPbbBmoTVHPNkcJR86ovcCtiovhPnuk/RdE5URNXC
 ZH54EllyFYKRfM7S9JtRMbfsecz+0gR0N6gwRsT/I+NmShyaQOdo07J5WJxwlFBRdMAZt5tOKAS
 ceXqGiAikybWgSovPJbN32/ztnyV/YBlnogW9Ed5m8NsBXUJTSgQy/Vl8wDJIuTqS3JExnffQQN
 0MKIyu9k21/rfWh/ck9clp/IHz5o4wAOw4tYmTLcWNAJayUrwmd9s4hsy06cw3RAqFF0t5xgn4C
 GNKCaQHd47yyZkE9JUQ==
X-Proofpoint-GUID: FTcFr1D3MACvnIuPYzZ7oBhQABFlR7o2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_01,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 bulkscore=0 clxscore=1015 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230047
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
	TAGGED_FROM(0.00)[bounces-114089-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:loic.poulain@oss.qualcomm.com,m:bmasney@redhat.com,m:ajit.pandey@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 64F976B4656



On 22-06-2026 08:42 pm, Dmitry Baryshkov wrote:
> On Sun, 21 Jun 2026 at 16:28, Imran Shaik <imran.shaik@oss.qualcomm.com> wrote:
>>
>>
>>
>> On 06-06-2026 04:54 pm, Dmitry Baryshkov wrote:
>>> On Thu, Jun 04, 2026 at 10:56:07AM +0530, Imran Shaik wrote:
>>>> Some GCC branch clocks are required to be kept always-on due to the
>>>> hardware requirements. Drop the modelling of those always-on QCM2290 GCC
>>>> clocks and use the latest .clk_cbcr convention to keep them enabled from
>>>> probe.
>>>
>>> You got the feedback, but it got ignored. There is no explanation about
>>> gcc_gpu_iref_clk and several other clocks becoming always on.
>>>
>>
>> Apologies for the late reply.
>>
>> I have updated generically that few clocks are required to be kept ON
>> due to the hardware requirements. For gcc_gpu_iref_clk clock the
>> Power-On-Reset value is default ON, and such clocks are kept ON from
>> probe. As Agatti is working functionally, I will keep this clock
>> modelling same as before.
>>
>> And I will update commit text that the GCC video ahb/xo clocks are
>> required to be kept ON similar to other camera/disp ahb/xo clocks.
> 
> Why? What is _wrong_ with thow they are modelled now?
> 

Usually this is required for the register access, hence we mark them 
critical and keep them ON. As it is working on Agatti with the 
modelling, will keep them as is for now.

Thanks,
Imran

