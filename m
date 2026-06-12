Return-Path: <linux-arm-msm+bounces-112859-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ihWCAv21K2oBCgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112859-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 09:32:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EA9CB6773DB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 09:32:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=mPPjoMfO;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="bU3iR8/H";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112859-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112859-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E153C300B28E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 07:32:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E3F33D75A0;
	Fri, 12 Jun 2026 07:32:07 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C44A6360ED8
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 07:32:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781249527; cv=none; b=Vs6nlP2HDYI8xG88yVhDxq1ky4UgUh2z8LaeQX8xZ5nXiPtgqLsPfkcin9HXir4gDUNxXpmsNMXEf/wpNXUrnTiwxxGa3qXh8L8TF0irDsSq81D69T8NGzhvkxEfF1rhtQ8YNn9bpBFrM4qAGEEIZHAEtEhNrOLkJ1ujvbwTwMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781249527; c=relaxed/simple;
	bh=T3pJhMSkxWslrK2cMqFWBnYqYWWp3AHVzi92QE8YUFQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lPcVhblYGbDm7MqqUCKVSidG0qC74T/DulvFm9eZGjrV/Ixiy/u2r+S7WeRfKvb2FKFHmkDEZnTWNWxrKDQT7WrHmUfrSBu83Fk5jLhVf6IzYUQZtqh1/OU/sM51FMdtl8By6e9i9QvK2mlkVWlaMlxRivFz/2h2kWFs2pK9ja0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mPPjoMfO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bU3iR8/H; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65C3Briq2506216
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 07:32:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=37tiZOsanjd1N+Fp39afaSRg
	h1QXMtS7eaw9kok6fs8=; b=mPPjoMfOA/nIeTB7be1z3UYngcQpbS2cNw2W8Zzz
	9l+lya/wp/fkyrIb9vcIFh9e2aVjsRZzHsMv36FMApMvUMLhKMUiKHncI4lWO5kq
	IwzhhVBA3lchaI5k91HQGq5aLiVNjzgYlXsgcQdKzmxzic7DsloEVXMyloDa60QC
	wPcatE2uKuFe4a5oKHU0oUjK0BWAtVVOr6pZ63VhXKQYXUT5bUWLj+Er6Oj6wIYZ
	kqdpVoJJHtHTD2MYbYYCMuvUd6SKQSL07Hp9TEMTfYvGPTsb9IOLRDGwK92AlX3n
	mI/uwKiAwxqusqY68Wi5qSjHuO9p84SLncQECeNjm3WTEw==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er1cbjgy0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 07:32:04 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-9661acbf65cso727224241.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 00:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781249524; x=1781854324; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=37tiZOsanjd1N+Fp39afaSRgh1QXMtS7eaw9kok6fs8=;
        b=bU3iR8/HUY4BwglMU6jI08rOuiM8gkbiLtPVfrXcsGNm1GAUMqmW5q3nhey7BFGMdD
         cwdn0qXItoCC8ExQe3ChY5eSj/qOficbGZOfplxatZWWXsGuBhPLdDFWEg9cqqJ1M2Jr
         p+pHUXXEzcX5EqUKB2Pv08/nFgogSKR/+tid19VDlLLTl6XvtdCYrEheY6fphhO5J8f5
         +3F9SMMyP+LfSGPVszQ22grYChmpgV+LcABD2IJWw7lkIlya9DvR6eTqhZf5ZSpJmEPO
         zQ/DFpGZEu8JcFcqgu/VAXSsvLquS6LnPI/ZOUsr+VPBcEr/KAyqnnjRCw5XXTzhgNsN
         wCXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781249524; x=1781854324;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=37tiZOsanjd1N+Fp39afaSRgh1QXMtS7eaw9kok6fs8=;
        b=oA7tENIf4uZ64z2NcpGZtiYCCjaJ4q9ygUv5zWjt74tWPfOGCLR9YmrpKdJOlyQNac
         Whg2GBOlzpEwENtdUlHqSKAvNZPI5/VoqFAN/AGB8toFS3v0wNYVS0g3nYg37PNRb39Z
         SdNaou9ZkfvooFomj1rIBi32IxehEn9vSmJjqZePe50wNAofOgFGJAxGIyQv2u8lPVxq
         Ru1wIFM4j3eC+pmN376t4ujTTsXfLsDQRdZZCiUodKG9KYSzmFaUvpcS3gkGHsi4luC3
         XDGpGaf/cyWfzrYGDW0Y4r0D1fofAYTzmNUyRiRpoc1NQPlXEGlQCWqUILawS9MgltLi
         A+Qw==
X-Forwarded-Encrypted: i=1; AFNElJ/Ezv9rpcjKr3b6jt7tSZ6iQbG2G7juXbZBA61BXFSvNyJPECo4CVGFwaQTKufwOGMKgQehT/oLnUlnpWTt@vger.kernel.org
X-Gm-Message-State: AOJu0YxKLJT6bibROmVFmqRFyJBhzpJmhPXpVq+0Vc9s4zrb9J06dM71
	F4sLgRYSIPA7atLAm4ps1y00TguWPKbtN6gE0abcy0o/1kcO0P3nK7PsEw9MqeRkZOVS33Bw+C9
	Pkctrwjc8aw0RpGHRFDYmAeVMQ/S4X95WrQ3LT9BK+Y6elqLYI5LALAIxj2H5WIXNpk7/oSZHN/
	P2
X-Gm-Gg: Acq92OHvaGf5rPhY/CufRGUuv9XHtJ2qTEW/mnydFL+85CqWA9gQzDe91EgPa/L90NL
	XKNkQ3V+rq4FK5htHYc9RMJnRmoI6qMLJr9MdTcaA7lVpAOBGLXXnt0UdGwxbs8ZO9ay4F77+kM
	jeewt9pfG9tWzXvq7A7wDo+y739tuKnP4SjebQFZ6bESbbekBfn5QzaDvI1OChmszLfzJD02FTD
	TMMqFUknq4cNRgGqFSB7zbGm7abhdy1MSpCsZSPNRqY8HpJjwGIZC6FwTkdNQzFZjpQgdKa8HUg
	D9NO/Rtje5EO8Vtd1gnJQWG4uABrLr5DVo/jyA/0LR15JuUDg4DvXn8XvL/VtfE6iVJ1WYzK52V
	aviiPG14QVS0+AgDGlT9u+vg3W2ZCJuJ/y30jfO+zQ8EltKSCMqFBSAhlGZCLE+BfI6hfU6T/kQ
	dI+0WYfCsELE0dksIRKSmzS7A6ML8fC7cI6Zc=
X-Received: by 2002:a05:6102:2921:b0:62f:5908:648a with SMTP id ada2fe7eead31-71e88df0a4amr699457137.28.1781249524033;
        Fri, 12 Jun 2026 00:32:04 -0700 (PDT)
X-Received: by 2002:a05:6102:2921:b0:62f:5908:648a with SMTP id ada2fe7eead31-71e88df0a4amr699444137.28.1781249523528;
        Fri, 12 Jun 2026 00:32:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39929aec5a1sm4319721fa.0.2026.06.12.00.32.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 00:32:02 -0700 (PDT)
Date: Fri, 12 Jun 2026 10:32:00 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: haritha.k@oss.qualcomm.com
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        manaf.pallikunhi@oss.qualcomm.com, gaurav.kohli@oss.qualcomm.com
Subject: Re: [PATCH v2] arm64: dts: qcom: talos: Add passive polling-delay
 for gpu-thermal zone
Message-ID: <vlu7l2vo5jf7bmmnqca3nkt6szbqcxrc3nhbcmimavf6xcmztz@cu44f2ku4iwq>
References: <20260505-qcs615_gpu_cooling-v2-1-1ba42260b29d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260505-qcs615_gpu_cooling-v2-1-1ba42260b29d@oss.qualcomm.com>
X-Proofpoint-GUID: HOKdK_dcEYWFQE8T0FeAYAbdKB5wK0RF
X-Proofpoint-ORIG-GUID: HOKdK_dcEYWFQE8T0FeAYAbdKB5wK0RF
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDA2NiBTYWx0ZWRfX/hTpJMcnts1/
 G5DzRqitWHLvRSdiQ0zkTaGXE6D5d8AOcus8mlU4hJdMfvoBNAV5QfPJtl7pOtd/iMkyp9i8x9e
 jJTdt5QJWuwS4bPYbAwl4XQG1xbTUvE=
X-Authority-Analysis: v=2.4 cv=S57pBosP c=1 sm=1 tr=0 ts=6a2bb5f4 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=5C3irSmljBUfJ0kUePkA:9 a=CjuIK1q_8ugA:10
 a=TD8TdBvy0hsOASGTdmB-:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDA2NiBTYWx0ZWRfX4K4tFHaiaGux
 JBAWlZ7VrI8g0VquO28FSLd18Y2YJEgMDhWNt3bMzCqXf7xxpiU8q2Qg51kut6okaMCgivbWrVT
 uyUssIwSR18djCu1y2POtuS4kASn6I3n9k5T3GiNE19wZ1kIfQsusprrrMG4AusfH8oWea3cZjb
 FUKVaaQShAPkC00F/DN7cStNODHaX5didoNWKVWdgUBAxONTRiNZPV29kE15BiKvl/uSY4urY+t
 rPerCMprRsMkd/xxRo6DHEBbsTiTEc5J7DWl5fR4GhZ7rzS+STOJMowmJOW36R0nFaviOrkIeAV
 xYZxSvoI7Vw+rVQTwt7tzv/nWR2/RpUBJFnSf0+ZzINyo0xjpZVrnFbgn3JYWWGjQaBJriq7pno
 KMPhI3GyuMEMPH0PI60XlfK8Ku9X+NJSsIsTXL71bsU9Tzp+s6ME1kDei4V3t2mnBshDd6Ak1hR
 tkPnYcTrGlRA6BaWX7w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 adultscore=0 phishscore=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606120066
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112859-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,msgid.link:url,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime];
	FORGED_RECIPIENTS(0.00)[m:haritha.k@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:manaf.pallikunhi@oss.qualcomm.com,m:gaurav.kohli@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EA9CB6773DB

On Tue, May 05, 2026 at 04:56:17PM +0530, Haritha S K via B4 Relay wrote:
> From: Haritha S K <haritha.k@oss.qualcomm.com>
> 
> Introduce a passive polling delay to ensure more than one
> "passive" thermal point is considered when throttling the GPU
> thermal zone.


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


> 
> Signed-off-by: Haritha S K <haritha.k@oss.qualcomm.com>
> ---
> Changes in v2:
> - Updated commit message.
> - Link to v1: https://patch.msgid.link/20260422-qcs615_gpu_cooling-v1-1-d5a984ac29e3@oss.qualcomm.com
> ---
>  arch/arm64/boot/dts/qcom/talos.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 

-- 
With best wishes
Dmitry

