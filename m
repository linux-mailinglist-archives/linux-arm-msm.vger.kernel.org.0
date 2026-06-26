Return-Path: <linux-arm-msm+bounces-114677-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PrBYHbmMPmoqHwkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114677-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 16:29:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 114AF6CDE81
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 16:29:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=KWlLs0Aq;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=O8fMmnv+;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114677-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114677-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8362B3024B59
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 14:29:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 502FA3F86F4;
	Fri, 26 Jun 2026 14:29:10 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C1E63F86F8
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 14:29:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782484149; cv=none; b=UAqqyMRvA3uMJhxmD84AdGjXgk/n+m2E2UtptRIzlEajAQ0Yq/Kmq+XJS79kLC1Hj5W3iqDx+olaNmFXDouh1A0XzJuEYjqRsDbCtJhTgb2XC4g1qHGY+qB/We69DnPyZ3dgZvBlCRfDf24hPjMdIoBN//JKI27iq2ub3TUOrVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782484149; c=relaxed/simple;
	bh=AB+GTcl1o/ZMDBuERbDpLhIle+9RFK/hgUm39nWcIxU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mzYj5EqdJUOLa+uIPqC/ddBemr1ok8zpLhW3pGgwMGhpDVds4HhMc6lBytxhqfn4z6SYqQ9plUgwQAYj+aoSNglSv4KiwafirpGUdTnQMqtXHrtHvLxiOoYwO7jpXYSpoDjkluxlXKZkO6JnowoT1WHi0IeVpz+o0RmuJ4H79Bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KWlLs0Aq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O8fMmnv+; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65QAcj652239434
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 14:29:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6KoXdf7c8yIFK3RBoE1eVqiW81sTwkSyj8rODkD/LDI=; b=KWlLs0AqBc46ktpa
	eifBVrPHksPB6eCH0ohP2IWaIwtquL2DZvv3sPBJudHNtO/RxalGVdCz/N6oI3wr
	kOqwzo6iLCa1Zu9p2t/4o+pYc2nxOCblSZcYlmLMm1Hbw7NhD2ODwsI1wpwPBlU5
	2K7Zg6ChGxpcbDAifgq0qagkev8Wn5aUcPzGKAaNsHOehHZ+0AE8/zQ3zZJiU0Lw
	1f0GCbcJlptG9MDEIvUhbBXAhe/nlX378yph+Nvt5Li7pebt4aWmf6vfFhxOCZU6
	NxgkLXMwYNOSDb0lkNYITkIU0K/fs81lNqeaTuQco/BMxTFODvPCOpM33N8ZjBJN
	t/9MrA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1fgc2tdq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 14:28:59 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-734f236d7c2so39323137.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 07:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782484139; x=1783088939; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6KoXdf7c8yIFK3RBoE1eVqiW81sTwkSyj8rODkD/LDI=;
        b=O8fMmnv+cZ95tJO5vd9kGbjxNf9fE1Kv2nvdU4kOvJZzxBzdQ9CWfESSFIOY4CkNg/
         HlEi5xJyDsBsLekF+zC/3Krsh7p5/fMXlCPvfpVtLQIIPp5KbBfb/tGLnxOaIQoXcK5F
         5twX76zqgZgGPt4joLiPe0jl2ObkE+OoqHz//4A31gJm6TY8vjhgc4zK6W2o83qGKzQZ
         zYDcrRViv/4pU/Of5Nc8RNlcEG4z/zTez0aHQVadaaIx77C+QGfSkq7wF9C/hl0b8zD1
         TTd4VwHZOWgUmQXMowl6CZqT11y50HnWkzeSO6ZTHFpzLUiQw1qbuTSIc99WAjvZLevF
         sQhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782484139; x=1783088939;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6KoXdf7c8yIFK3RBoE1eVqiW81sTwkSyj8rODkD/LDI=;
        b=PZGepBw1k+oRq1c73Z3j1m0zyOMzf8eJ7z0OmOYke19zte+yxVuy4DBsWgYGCbDx7v
         2eNMWTQ9JZ3TBdf3/2jxL5IxlEg9qZeDgENoBcsALzHJvJYro8U22XJfb38qvtmmIgjK
         lREKfHQewbV52tXbQwPkVZYMO6gqNF7ceqvKzXVxCgXrjAv3idjCF9qw7YidUEOFdmdr
         MlLVXMH0GFbY5f57D3vC3GsKmJRyT39O/NXAKsCnMBs/NytkMkNSHQ4apZk7q+FEvYAv
         T8okWOW/nm8U0HOMtLaQ4OFmS4L9zJTazPTJfNPKuMGAP0GeGnGHO0vghNbOlx9QIJtL
         NYfQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro5NPsRRkCd3yWY4Bixy5z+3AFIURnpzMz2JU5w9I5nj1Ap0Xi+j5+7aomm2MPdXZ/iAdLhHN83aAcnOPJr@vger.kernel.org
X-Gm-Message-State: AOJu0YxJts73WmDpeu52w8UBe/ASVdC0bKWFpRhOqG3g+O1t/76q6ytU
	0LEIS+awmR/ORwYrH5EJyoD1gERfBZsvWdocK+5mlqzZ1cOvkDBBIHp/l6Z/aDO9KYGdR3mBsBs
	MvyiyaUySZ0e4POtJhDQHAM3h79tvXUcAIhVBlWupj6NGYNrwhaCBsdBIOvrLkSpesxjCS5KQ2c
	6o
X-Gm-Gg: AfdE7cnPGqp/UqUiKjxEAcf16zaf3o+BOz9fj7BQ+qxo8X7mEW28wtlenwRSNBB4TQu
	Lyb+mPv8xw7NzKQBjt6cK++NkMTEvtQcM9fJFN3gYlTtRP3w/FTsbx/Ll9MhFNHqjtV4gMFz5xH
	SsE2C+/q1jw1QtN3cho50bGNmTUAER2Oj8nVeqaWUEszgFxIevtniklqhynNTE3A2XUjD7l0Ba5
	GN0iuZK1G+Pv42ANxu4OFe5cguNPr9R/Au3ZJy8/dx8LopirYZ1lO2oNjHPisi5E9XYIzNZQCNS
	Z02/3XGSVy5mC8ThnloJuwzXdncR/yrAvYvhPDjqIstQFVnCHFtibbsWx3mVcqlwuPPhaiYIhMv
	cV9YgXHVLu197fSvaqx/gEVXRdP15xN8REDo=
X-Received: by 2002:a05:6102:148e:b0:6c2:7d0d:e09f with SMTP id ada2fe7eead31-73433e3675amr1248991137.1.1782484138844;
        Fri, 26 Jun 2026 07:28:58 -0700 (PDT)
X-Received: by 2002:a05:6102:148e:b0:6c2:7d0d:e09f with SMTP id ada2fe7eead31-73433e3675amr1248986137.1.1782484138384;
        Fri, 26 Jun 2026 07:28:58 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-697f4bd36adsm2993408a12.27.2026.06.26.07.28.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jun 2026 07:28:57 -0700 (PDT)
Message-ID: <dcd6f0e3-46a6-4f57-b4a6-0b9362b1a8c4@oss.qualcomm.com>
Date: Fri, 26 Jun 2026 16:28:54 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 5/6] arm64: dts: qcom: monaco: Add OPP-table for ICE
 UFS and ICE eMMC nodes
To: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
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
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260609-enable-ice-clock-scaling-v11-0-1cebc8b3275b@oss.qualcomm.com>
 <20260609-enable-ice-clock-scaling-v11-5-1cebc8b3275b@oss.qualcomm.com>
 <d8fd7888-cf7d-47e2-8e77-3ba705c88502@oss.qualcomm.com>
 <ajjmXMKdWzae5qqk@hu-arakshit-hyd.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ajjmXMKdWzae5qqk@hu-arakshit-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDExOSBTYWx0ZWRfX2b26LH9f8/9V
 YXWENuP/EgTerswB2lnsISbrdL4Zs0Yz5aqOn86Wi/cGJf0OZqoZhLtGGbXK3yKMldmKQvYJo7H
 gwCBgHRicWXmbnlar5MAtWch4KUmIZM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDExOSBTYWx0ZWRfXwoBEqf522e/R
 RxgzJlaRYm4abP+dIJPH8gAnHRy76tTqNnjD01gre9EaW/lmyTEKoXwbtv2V0nu8YXS8KzvVOmn
 0RLdMH1jXx6FH2J+OHX4HTeIwki//1F+rK+Eu+OTbZs8BK4kXw0q7udOVZEU09yUW5/QjMppqFw
 jjdTUTNgjYV+JUccQ8cMbxtfZDwdGg3hzbAaaC/gVtLFKNdEQo2cj37wVw/1kpFLANFdWZ0kEES
 DbT32JnJguj9YnNyweW58SzAuGFEphKWd4MlS8J4K/DsNxVUiZg2tQP1DuedKKxkJYd9MjJqaXh
 amLPdkF58FgpE3ZDGLyurIGrEiYK8eBSueKDxm20wtaSx55CIWDLY6ISoVcdHDT5I6If7b1oFzO
 JQdOGyW97WdxESQlTOt8xkJONsxXlwMhzJYqZFuNR/hhil7i51blpDLWjh2MPykMAPLBWl8HYea
 BAsbnOGOBa5WvKXqGBA==
X-Authority-Analysis: v=2.4 cv=O4oJeh9W c=1 sm=1 tr=0 ts=6a3e8cab cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=wUXJofhvmvxpLSIlt_IA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: ns76LF2iJL_qb65UQbVh2IqU5Cc_JRr-
X-Proofpoint-GUID: ns76LF2iJL_qb65UQbVh2IqU5Cc_JRr-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_03,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 bulkscore=0 clxscore=1015 phishscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606260119
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114677-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_RECIPIENTS(0.00)[m:abhinaba.rakshit@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:mani@kernel.org,m:James.Bottomley@hansenpartnership.com,m:martin.petersen@oracle.com,m:adrian.hunter@intel.com,m:ulfh@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:neeraj.soni@oss.qualcomm.com,m:harshal.dev@oss.qualcomm.com,m:kuldeep.singh@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-scsi@vger.kernel.org,m:linux-mmc@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
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
X-Rspamd-Queue-Id: 114AF6CDE81

On 6/22/26 9:38 AM, Abhinaba Rakshit wrote:
> On Thu, Jun 18, 2026 at 03:04:57PM +0200, Konrad Dybcio wrote:
>> On 6/8/26 11:47 PM, Abhinaba Rakshit wrote:
>>> Qualcomm Inline Crypto Engine (ICE) platform driver now, supports
>>> an optional OPP-table.
>>>
>>> Add OPP-table for ICE UFS and ICE eMMC device nodes for Monaco
>>> platform.
>>>
>>> Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
>>> ---
>>>  arch/arm64/boot/dts/qcom/monaco.dtsi | 37 ++++++++++++++++++++++++++++++++++++
>>>  1 file changed, 37 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
>>> index a1b6e6211b84d0d5008231c55613a0ccd61b9450..d9298d8b7874b8669b2cded2a28a99dce6eadbda 100644
>>> --- a/arch/arm64/boot/dts/qcom/monaco.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
>>> @@ -2742,6 +2742,27 @@ ice: crypto@1d88000 {
>>>  			clock-names = "core",
>>>  				      "iface";
>>>  			power-domains = <&gcc GCC_UFS_PHY_GDSC>;
>>> +
>>> +			operating-points-v2 = <&ice_opp_table>;
>>> +
>>> +			ice_opp_table: opp-table {
>>> +				compatible = "operating-points-v2";
>>> +
>>> +				opp-75000000 {
>>> +					opp-hz = /bits/ 64 <75000000>;
>>> +					required-opps = <&rpmhpd_opp_svs_l1>;
>>> +				};
>>> +
>>> +				opp-201600000 {
>>> +					opp-hz = /bits/ 64 <201600000>;
>>> +					required-opps = <&rpmhpd_opp_svs_l1>;
>>> +				};
>>
>> Since 75 MHz and 201.6 Mhz require the same power level, is the former
>> OPP any useful?
> 
> Yes, both use the same power requirements. However recommended by the ICE team,
> the DT should include all opp/freq supported by the hardware.

Is there any reason at all where the OS would prefer the lower OPP?

I think you at one point mentioned some dependency vs the storage
controller's clock frequency

Konrad

