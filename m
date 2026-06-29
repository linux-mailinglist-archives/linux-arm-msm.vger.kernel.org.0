Return-Path: <linux-arm-msm+bounces-115019-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NO+ZEl1cQmrV5QkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115019-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 13:51:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE3A6D9A9A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 13:51:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=eCy7Msgx;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="eT5f/ztF";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115019-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115019-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3ECBD301C93E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 11:51:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED5423FD152;
	Mon, 29 Jun 2026 11:51:53 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BAA53EBF18
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 11:51:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782733913; cv=none; b=da4+JYDLM/rv4OmIS7QzZKcLJB2byke5y/WMJyoGd+yAcRb7guqb+RF3kpWflaeZbv+j5aciPP+RNUcboKAFjmRO8UsvRfc9NmaCd0p7c52HBVa45KM8s5EsfiKNmykNff74kJUfrXmlQArCqG5fLbmZ7uHEt5aMZDc3afh47Ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782733913; c=relaxed/simple;
	bh=SQfUKUlnEvyUcJ9FMoDbCcEIG5v0GHLdITejt2eWMYo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TLASJnk0gDlI+P/Jpesb+crDtB6irErBXk3upOtTtut9cBlRIg9PR+39vWZ2w2iNBEzi4S87AMQ6Mc0GpljDAFZSHZ+aXiUGA9wGyGbn5z8zWrOzbQyJeUxYF6Txpjv4sQp+ykwP13bGUHUko8U8KVYwJRQ9iMydoHNUfhLrGBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eCy7Msgx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eT5f/ztF; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TATRDq2592780
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 11:51:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cGLeaDWCQtP+UxuayJ4J8uBL/QTOyyZsye6nFMc1d/c=; b=eCy7MsgxNAxabOCO
	eXnBOjdidcwQQSpOQYnRlChGb1Z3DB4Szzy1BGgZiIHcvjUPZG5IWoCVrZ6G3ueB
	dXbKw197x3KZO/pjVIhl2ocKhn+6lEhwXeBfhpm2W4cTtJFlj3yNd17u+e69qcSC
	AJTPwTV4U2r3ekNSXg0Lg0loSfUATJZrEYsZ4oqTRZ1/plNQZN7WmBFYW0rj71Ek
	W5iwKlivyxlrHtyO48itfhRUasJ3oxMA4pMgl0yWJQJ000+KxkjFxEguW/kNGGl8
	JBN6z/EqxUvvpUBTwXZau9xws4BrS5h4XEsiv3hwkllax1OUC8BKRvZc30hENOCj
	a6Y7wQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3k7vhft3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 11:51:51 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51bf599c27cso638841cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 04:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782733911; x=1783338711; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cGLeaDWCQtP+UxuayJ4J8uBL/QTOyyZsye6nFMc1d/c=;
        b=eT5f/ztFRgVtadfI+MCHg9VQ/NmGd0nh3hgU0LSiOlLbhkODOa9b8oxjELzCMy/4Gy
         ARBwhnC/GQ6wt2MzldK02OQk87/AbTJ8QTRe2qLOMBD4kxG7mLnnMc5r/Irjam4fxcwg
         0RQWyQpRNXmAl8shA/KP2EMnYF24GUB6UIwF0l3Mfio6fkxGBM7LdGCLxzNc7fZvq7g3
         S4y6yNnWuI++/hU7HWSSRq/scicE16cFYalSrp6OsGNo8l/yKTOH7KHxus/MHj8duy9U
         5R1Hoq9UgwLXFZSGVkGMG6mRVePPLMdTwgO1G90rCbD0oP5bcFVuhyZ/wMkeuCbOZxA/
         UJEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782733911; x=1783338711;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cGLeaDWCQtP+UxuayJ4J8uBL/QTOyyZsye6nFMc1d/c=;
        b=cDyvwyx9QGvlpbyFYpuf3QFPNJy9IUvbBrmOBg3oV1Elmfi6W6FGMzoWrAXq+hK1x2
         43OLGsa+c0oxiZsKepFSAeAUzilr4OKLg6NxFnIothY3vRrYWp7aYQj9L3Siy6d15Hlr
         1nRdhWSZnkmhu7QHp4ikjlq5hsV62+zzRX915pZydosB/sxjabsKtjM6BBsHqya87RPz
         rcxg1tGq5IpCBFXQ5spMoesQdvm8HPvz2ORW7F+zyLEirR+dmCdP9gSI8p5YArME5oRx
         9YugLLQ8c+TbkBEQJDZQgSukpHzEUoaQ/wURiztZR3Sn54+T5qgFlYNchMl0lypilSw8
         URfw==
X-Forwarded-Encrypted: i=1; AFNElJ82G36uxYzvwgckXuXSYvaFJCRSi/p7Bfidh/BEPnJ40nxH0Fa67GrRzpayit4ink1zO3ZhbUlp4xFV7GD6@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4eF491bH2pZpzh8GSCytffoujc+drsOjZhP5NiwpCbosKh+as
	77JQwUGU11VUvDdalb6Tb1bU0lCgtb3YA+c5MxN8Qt5BBLQ015tUMB1LJAhxdJAWSmySYB64Lb/
	y6GQZOrFiCYuMiFJOH07tc4elYQhNjQik0Z9HZSTrQ2hMSqbtTeIMf36Q0QC5ow1wulqI
X-Gm-Gg: AfdE7clTQ0XBUX4mT5rqZSh1y5txdE/QjdkK1yNby89VLBO2ShfV28vdLW49ef0hIWm
	o67brzHJF9GsybxsmjwUis5axdgXpGg313zEpSIIbrUaR27JntAmwmX9xNcCBjZGFI0yOmZmoeT
	cg39av78o0rAjwiTeQqNuJ/iry4qwrtQVWVnxt5zsuCaNaGZ0iVeUwcoREE0PdM2c0BLoezMZ6f
	ajElCxXSFST7WlUPlorfHUIPAitnXJ2zgofsLB505KfVAxd3yjb4+MVH47A/Nd9uxaRcGAib18p
	9ksf2IB+SAb7wEz1oaNIsRdY09Ph4GG+9KeSv/7k+DQh+cOAOPeYR9MHGGCbyv0sZnF7wC9//gP
	jCUIpo9tYpvzmiGbqs8+ysMGc7IN7YrSZHeM=
X-Received: by 2002:a05:622a:211:b0:51c:8fb:fa47 with SMTP id d75a77b69052e-51c08fbfae7mr8780751cf.9.1782733910788;
        Mon, 29 Jun 2026 04:51:50 -0700 (PDT)
X-Received: by 2002:a05:622a:211:b0:51c:8fb:fa47 with SMTP id d75a77b69052e-51c08fbfae7mr8780401cf.9.1782733910231;
        Mon, 29 Jun 2026 04:51:50 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c124f1723c7sm259578966b.26.2026.06.29.04.51.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 04:51:49 -0700 (PDT)
Message-ID: <a8d05fb0-69c3-4905-9b05-e21bb6f3be2b@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 13:51:45 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 5/6] arm64: dts: qcom: monaco: Add OPP-table for ICE
 UFS and ICE eMMC nodes
To: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulfh@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260609-enable-ice-clock-scaling-v11-0-1cebc8b3275b@oss.qualcomm.com>
 <20260609-enable-ice-clock-scaling-v11-5-1cebc8b3275b@oss.qualcomm.com>
 <d8fd7888-cf7d-47e2-8e77-3ba705c88502@oss.qualcomm.com>
 <ajjmXMKdWzae5qqk@hu-arakshit-hyd.qualcomm.com>
 <dcd6f0e3-46a6-4f57-b4a6-0b9362b1a8c4@oss.qualcomm.com>
 <86321e30-2bee-41bb-9d63-d0e6ab4154db@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <86321e30-2bee-41bb-9d63-d0e6ab4154db@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Iv1o3Oxkxar0E8xl4VXRQElJyKm-DKTp
X-Authority-Analysis: v=2.4 cv=CqCPtH4D c=1 sm=1 tr=0 ts=6a425c57 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=DUC2ZapgCAhEJWWdRLYA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA5NyBTYWx0ZWRfXyhjF/ZT3ry9n
 TWnZNrubp1I50ZqEWn7oqLU9iQToWDrCCANo5IgJ6orIgAxKk1ya42m8MNjEbxdM5XVuPw/J9E9
 dXMPacCQ2b1OxvU2McOxKP6qCRO08WA=
X-Proofpoint-ORIG-GUID: Iv1o3Oxkxar0E8xl4VXRQElJyKm-DKTp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA5NyBTYWx0ZWRfX5EkRhg/iRsfR
 /x7YDxkvaiODan0kBL8jdx/KryrrMWNo2NB7nhszk1MZZtBPByKoFbJRgXPoSwm0oxz2fYPWjgn
 DbZYg5BdU7UgosAWdcIVOuoBAxY3gxpvTOaNhTZSHKMxs3fNslJ3CgwidIH0UUANLdRzMaJB1gd
 EHt2zQJAut2nf8bjyBwOs9HXwQIgopC5DhYu5I3cOZYqhHBSo8ZLP5o1qQfX/ODNwC1tXDWYVKf
 mz80P6MFoL02xbSincd3USXVBqCeOrYLM7gMHJMJs/mlOBpmB+fhmsO5JSV71daOvK9Jiu+zR/e
 BIZolChKUM+e1g6hmeUZ4bfUAZD7onPMIInHirqfI6Xmoy/hIlh4/wlG1y6UeRA/aK0VVYtUgTo
 olOluC/0iZI4E+j9EF0px6jvAe+4iNig6sbhouD3fWePLXq55RLfw1srK15yH6Phuh9m4d6fDlu
 RRV79R/Ld0Oq9mVXcig==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290097
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115019-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_RECIPIENTS(0.00)[m:kuldeep.singh@oss.qualcomm.com,m:abhinaba.rakshit@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:mani@kernel.org,m:James.Bottomley@hansenpartnership.com,m:martin.petersen@oracle.com,m:adrian.hunter@intel.com,m:ulfh@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:neeraj.soni@oss.qualcomm.com,m:harshal.dev@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-scsi@vger.kernel.org,m:linux-mmc@vger.kernel.org,m:devicetree@vger.kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
X-Rspamd-Queue-Id: 9DE3A6D9A9A

On 6/29/26 12:24 PM, Kuldeep Singh wrote:
>>>> Since 75 MHz and 201.6 Mhz require the same power level, is the former
>>>> OPP any useful?
>>>
>>> Yes, both use the same power requirements. However recommended by the ICE team,
>>> the DT should include all opp/freq supported by the hardware.
>>
>> Is there any reason at all where the OS would prefer the lower OPP?
>>
>> I think you at one point mentioned some dependency vs the storage
>> controller's clock frequency
> 
> I think Abhinaba captured all possible frequencies(even lowest ones) as
> what the hardware currently describes. It's upto storage controller
> running frequency and let it scale ice clocks to higher/lower to it's
> max capabilities.
> 
> Describing hardware based information also avoid revisiting DTs at later
> moment.

I agree conceptually and it would be easier to agree fully if you
gave me an answer like "this is useful when XYZ and ABC because DEF"
instead of deflecting the question to the obvious fact of the
hardware supporting that OPP

Konrad

