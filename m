Return-Path: <linux-arm-msm+bounces-111957-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qN4ELFgNJ2pjqwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111957-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 20:43:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 9463C659D0C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 20:43:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Vb+5NiyN;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="U/ESYooL";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111957-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111957-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C367E3006B78
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 18:43:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C2813E51D2;
	Mon,  8 Jun 2026 18:43:31 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67E7E3E0258
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 18:43:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780944211; cv=none; b=ZyEy2qFMPva3m8vormCPmsiBAwzOgxxYT63FvKxc2lS+OlI5eHUW2OLZkaTOIk0uwsqXHN7i8Qe34LWTGL8oq3CsQdtedjj6DqUgk/OzVD5Fns3SYlaJKdf9FVdEU7uFuoJ2n+b0ZDHD8ij0klfmDIoTqQVTZqOZHtb6WSdm6vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780944211; c=relaxed/simple;
	bh=XrTiGoAfj95ZNVlfxHtjtlmUqJv9XRx7IJtBxarrPnQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r5zIZB1ZG4JK5jeYdTyzddChJVQK0osrt2WGPG7+YJIAKtRI/iE4ZbHMlDNEQuZtepgVtPq7P5m21NreCNwcEH7U78NRZpvUZ+lrjvCktttSCnhT+6gG1qDMzZCszfHx9A/W/XwwIfhTEGljEnZV7uYxEuCcWemItAVo1BNBdXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vb+5NiyN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U/ESYooL; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658FFSvd4017162
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 18:43:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Plr6hTzFD6LbDZNeKPjpGhAAeO93r9oSiZKDt2c59H8=; b=Vb+5NiyNxznEyJtl
	l4PuNB9RZ3Bv0pBTGl8aCbsRL3qwtEfljk5lF4r1QqZ7JPnEZRiNIxs1IPce6/LL
	C8hBPQwEanaLG/qn9mtl0SWguf+ZmtMJDKFlACLCn+6pS+A3mHf3+zDxTqB4gbOO
	b3tlHTLUBJmIxK0g8ZaLf9C2QUJsNkj7e9E+YmEiIeF/Bg3WOstY+kfdSdGv9iwW
	dDGhOAj4MopmEFvnK+qq6SHxKtdeXJ2ImhbVh3PRWvJiR+YFGbVgyvBX0jQNLyHy
	zMg7j7dnVW9gRG14afbcmBNP13Ax551WjN10pve/hMCATRXT1ffrMjeiGu/ksyLK
	F4fBuQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enun8jf3e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 18:43:29 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c0a99db8dfso54637355ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 11:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780944208; x=1781549008; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Plr6hTzFD6LbDZNeKPjpGhAAeO93r9oSiZKDt2c59H8=;
        b=U/ESYooLWt5YuqqNIv3+iVkXk4HbMOu6MOXhWXAyi+D22RTwyR5cSpWACmRk1qn3FN
         lOYFEF1Vwr+9dFL1gyWpfQwISl/1sWb50bexRI0fGO5td5zH/xc+hGESvO7RvV7cK/GR
         XPlhWJtbc4eSnyNF8ipcA27JY8U8/SIfMbARSvcaa7JEjkFgKgLJbDktI/QxR7vjtl9m
         cgQONgXZJ/0tBoxAtnqM/auvFChRwBL964PgkFF9H6HFkv6tqqiVwRasYWsqsUE3a+DF
         UN3xm+h1gRH29H76rI/+gQhuPsfOQ16jepOeAEQEteYDqPV7W1V8t5kELNgWS4vFg9VC
         lqgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780944208; x=1781549008;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Plr6hTzFD6LbDZNeKPjpGhAAeO93r9oSiZKDt2c59H8=;
        b=dnyMgFpGgJJnVltqoWBDqf0gs7khZlXZbP3xqKlG/9XWvMVOjcp67MUHttBJmR91Hm
         cdzHFFbakWDXKMrEiS79VWXmAX/Ow3hoaq8p6PYtdl1m0MeHYVALR0cQ8zKGlbhDczdq
         1/Nyj5iuSZNoI4I9gE9/Rj1a3rKLh14o0232n1dApo9buUe/U3OsbHeZ6h97XkpyyIQm
         YY9WCVU8tT2sRVKBt4mG/Zt+PXivPza33b1V9RQD9gEeV3lg09gqOv8iZtH6e4xIfaTw
         evdXUiT+8WjpL+vbhSmC0L7T/WebaPK5GsRDLFEZCkKkOIHdQqTU4BmgVsyyGexOWFMH
         48Nw==
X-Forwarded-Encrypted: i=1; AFNElJ83zA4Vwgrl9wv4AUY7SjUebZHSdqMZJ+8Eu0DqEOjQdQLAUIO8RN2KXgPhmC9Ux9dKkZzAZP+MX4uvKYQp@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1CX0B86xKs8VlqSvbaf4SbPAOXTRfvP8ys6fnVEuBycA6TcE6
	vwctdMODZHrGnt/JZjQlmiBmUf2965rm2XBh07jqBuMI/4SBYKGDylvQX1xW2u+Ob6y0Keq/tmx
	up5r2cmzMOT4Ru5OzCMGe6SqTUr43ZvmDFDPmUrcXdBE9kWfqjm4DUzZ8vJh8pvXNpbve
X-Gm-Gg: Acq92OGi8w2NdMOoX31rKtcTNgXENWJtkwDXS8TD5wmSPMAdwNCZ7HA52aYWtV8T5iT
	1Q7gbJVdRGU8rhgeV2ztNID9ieK14D+utbU50dWAVy0T2tBXrntfLxPpMDQ2PRcx8HSsFCP9CzU
	b2gHxWrfN9cUkbjfS5pHjv76cO5JU6kqUI2X6VxdGbrH/nJDzyqXGEa5fBpiTtfdxUPHVxo5wpI
	sIKGj2Psf9Nqg/VjzMfB3fnKDj85Y/2FOL6EWjjQOf/Fde5tWMQe6Kz75WYvkgpLiIwZngYWwdK
	qQAfXxhTQWu968bGCBui2eyzoHCcgezDmgcujn0LC/Yz35+tRQK+b6g14F5QbUs70TvDqkgWqBD
	qlV6hfH5TbJn2r1ilXyzz9bSWPks99XDxkvMfmTItpJ8PehHePMpMaCsB1ibK+4Y=
X-Received: by 2002:a17:903:244d:b0:2bf:800:19f8 with SMTP id d9443c01a7336-2c1e7e500eamr172871515ad.17.1780944207840;
        Mon, 08 Jun 2026 11:43:27 -0700 (PDT)
X-Received: by 2002:a17:903:244d:b0:2bf:800:19f8 with SMTP id d9443c01a7336-2c1e7e500eamr172871105ad.17.1780944207411;
        Mon, 08 Jun 2026 11:43:27 -0700 (PDT)
Received: from [192.168.1.10] ([182.65.158.84])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16649fcdfsm245047595ad.78.2026.06.08.11.43.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 11:43:26 -0700 (PDT)
Message-ID: <11c2d639-d2b8-487f-b627-f507bab25d60@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 00:13:01 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] dt-bindings: dma: qcom,bam-dma: Increase iommus
 maxItems to seven
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org
References: <20260521-shikra_crypto_changse-v1-0-0154cc9cc0de@oss.qualcomm.com>
 <20260521-shikra_crypto_changse-v1-4-0154cc9cc0de@oss.qualcomm.com>
 <20260530-spiffy-glittering-quail-dff199@quoll>
 <289a5bca-5491-4fc2-92d9-1102aa664021@oss.qualcomm.com>
 <f9a88104-9292-4cef-af48-58a722194b4a@kernel.org>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <f9a88104-9292-4cef-af48-58a722194b4a@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDE3NSBTYWx0ZWRfX+NzSzw3/nQFd
 radyLHOF1Of5Q0SGDwm+33B68fnqFWDa9Na+ARc4NIRNNlwDNizH5/LtTEyLYhKY6J+mLQyWAY+
 /hULWOqBWbm/BTbK1SQJ/wPEdx0VZkY5GothB4uqwj4Ku0rRliX8+YTRfuI0z9RcqPT5m2LEv+e
 6wy5yoJenFAGl/Q/RxTwqljhTMfJWRVVy3f5d++9Elv2R5sCeXyWMnkBLt7IsOymhDVk+qn025l
 2x5Xhd6bmAfCnKV4cClp41H+J5En/fEt+SMAO+q2szFSzg98m+NtCBuTo9nultbTyMsv7q4XifA
 GmJJYlTik2aGuD88bXuZDs+107/imQx8OFPk7pmN6arcJHeyJqKvD+4rUwFH2nIvoqsSVoSeIeW
 8OYffU7EJVHPUPgL2z4ZWe8EgFYKBe5EzMyqvJ/aHE/oPhUdXvRNipHhGu8S0N57NqXUVkRnXOp
 w+5vEvuowFx3AbXlrgg==
X-Proofpoint-ORIG-GUID: WqBskgP3Yj0NOqAakVvBp1wj9IpXGRNl
X-Proofpoint-GUID: WqBskgP3Yj0NOqAakVvBp1wj9IpXGRNl
X-Authority-Analysis: v=2.4 cv=Z7rc2nRA c=1 sm=1 tr=0 ts=6a270d51 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=wKfY90lum8W+SP9crs9F8A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=gEfo2CItAAAA:8 a=3IJvv1DdaQ7zVQMhPnMA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0 adultscore=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080175
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	TAGGED_FROM(0.00)[bounces-111957-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:herbert@gondor.apana.org.au,m:davem@davemloft.net,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:vkoul@kernel.org,m:thara.gopinath@gmail.com,m:konradybcio@kernel.org,m:Frank.Li@kernel.org,m:agross@kernel.org,m:harshal.dev@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-crypto@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dmaengine@vger.kernel.org,m:conor@kernel.org,m:tharagopinath@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[gondor.apana.org.au,davemloft.net,kernel.org,gmail.com,oss.qualcomm.com,vger.kernel.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,devicetree.org:url,qualcomm.com:dkim,vger.kernel.org:from_smtp];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
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
X-Rspamd-Queue-Id: 9463C659D0C

On 07-06-2026 13:43, Krzysztof Kozlowski wrote:
> On 06/06/2026 22:59, Kuldeep Singh wrote:
>> On 30-05-2026 16:09, Krzysztof Kozlowski wrote:
>>> On Thu, May 21, 2026 at 06:47:11PM +0530, Kuldeep Singh wrote:
>>>> Shikra bam dma engine support 7 iommu entries and not 6.
>>>> Increase maxItems property for iommus to pass dtbs_check errors.
>>>
>>> What errors? There is no Shikra in upstream so how could we have errors?
>> dt-bindings updates are prerequisites for the DT changes of ice,rng, qce
>> and hence updated bindings in patch [1-4]/5.
>> Also, the commit message mention about shikra and DT change is also in
>> same series.
>>
>> I hope this clarifies.
> 
> No. Please explain what errors we see now.
I need to improve my commit message a bit.

Since, shikra defines 7 iommus entry and bindings say 6, observe below
error.
dma-controller@1b04000 (qcom,bam-v1.7.4): iommus: [[31, 132, 17], [31,
134, 17], [31, 146, 0], [31, 148, 17], [31, 150, 17], [31, 152, 1], [31,
159, 0]] is too long
	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml

I am attempting to update bindings firstly by increasing iommus maxItems
as a preparatory step so as to introduce qualcomm crypto DT cleanly
later with no errors.

-- 
Regards
Kuldeep


