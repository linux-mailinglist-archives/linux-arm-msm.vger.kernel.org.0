Return-Path: <linux-arm-msm+bounces-96802-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gD2iJ8TJsGk8nAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96802-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 02:47:48 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F7825A7FE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 02:47:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B802A3152959
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 01:47:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 501BF27FB25;
	Wed, 11 Mar 2026 01:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eO271O+p";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q5WL/SSQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D89491A3164
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 01:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773193664; cv=none; b=JN80RV4TqGRPSqebVVHpqx6Ah8nSfwVZY8vLN1iQgixjmLCXanSEKlbo9xiwM3byEja/wA873sIVsB1ySwCvsOC3qQdkINGVHif1FDw1zSeyk3R29x7Z4lsgMtYbfrRdEy3NCjU3+1iyTdW4QAou/qQt/M7T+WZHFAdqYErF4mI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773193664; c=relaxed/simple;
	bh=zSUWUPAs46XLNNnK6CyzBI8zL6TuErcz0k+5R0BNoCo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zsqrb+wv+GhJaL8N8BdQZwtAJLKqISNXxJkdl7noKBu4GHXQJdUr0cIz9EqqEgYmCH5TvpmiNM15sYA5bK2AUi0DGVcHSARvQSKdNkCOtXWhWSWgAiw9QgFgS651QJvZEX+4Ur4ITc6kL44QsSMDl7NFaR5XuCFfKqB7idK/R0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eO271O+p; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q5WL/SSQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62AJ06lS3893001
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 01:47:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JIVT57SowEfFMepeOGCDAj6rTq4EE1pUwY2R9E/rurk=; b=eO271O+paj65f68Z
	27SypoFfCFLT22Z5HYQlcY9rln7Czy+MK7gTgqlF/0dxrafQVU3fnyy+uq5gpFFk
	f3OPgqp2Ze6y/OuyKfqamj4gVwwtrIbqvUI/scWfEz6PPVT34IKJumpw96vTeWv2
	6seCoskJOoeLhsI0YwNZhjj3c31qCX05nEY67QAYTD7s+R/XemUlfNz1C/gkGgHT
	ERuLB88hv39ttNQJ3vH1HniMp8n2R4W1dZXmCMk5nlgIAnm8/htzn4tleL+/a1L2
	QlTN47bei3KwAc0W5JIzDXyjCfqf8pXzJ72xRBDFLwkL4LtKssbrb5rXZKKdAPSq
	eij+Sw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctkmytmfr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 01:47:42 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50921f7da67so128859981cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 18:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773193661; x=1773798461; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JIVT57SowEfFMepeOGCDAj6rTq4EE1pUwY2R9E/rurk=;
        b=Q5WL/SSQ5KXJdSIdW0ILYrNWDCKzoTkpZDo3nswJMvelMJTIy1GW2IMFdhP4khUQJ2
         nfvOftqG3ZMi4zQXwv91hhY3QoKkNCrNOU6Ndc9pXxWGB/7VKRbuEuCT4Nefc80u9vXo
         r7OT3tT6z03L+WPwz7LGkNcXK9/jH/hWtGUpqyJj3Ps7dmU4uLtz6F4VZOSaqDnsw/2G
         YLnNNHeG7h/fj7BbvobroRMd31gax7ahn/P7sF4NbjAQl0PwQvP3V4SGVqfzjJ+9Vv2E
         wUwfLcYO1frnXdv99c7I/hL2oE6u8SOp0xm/6AHnO6n+ZrqMXZJjA7b5MGz5SVq0BVyL
         YB2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773193661; x=1773798461;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JIVT57SowEfFMepeOGCDAj6rTq4EE1pUwY2R9E/rurk=;
        b=w8OQnK8SS6rJ0DGCBsdAJ38kyp+srSLKXKHZeilujR7f1hbxuzPJDjTD+pko5MvOiN
         I3bkvJpTsJ11uENNC3ItrUEzxRM3e8QbGuTcckb7Jbuw4wcNm36a5IV4Ih0U/guVtV9v
         j1xr2X65MpePTWmSHH0Y5eOEau9/x65kZWd2I5GkYtSFaOWwMQea0E/SgPJxUGxesL0/
         jYCXSdIbuITlmesxVoHSJSZVaNiCNsizb2Bs/HmFhGo38EvdG1haFmPKr17syM0nb+71
         V56yGcJ9XYBqkW2sChEnLMxTthZGNubm2gw7+HfPTU0kLDa92Kme5QgmKjvK4DdU4cT/
         mDOg==
X-Forwarded-Encrypted: i=1; AJvYcCVgNbAKK5QYbfOuxbQdwQQPiRQ2iEP6T6bVY6VR2QSVkw4rbBW+DTh2jv9DpXLmBMcLytojldyjV/eQIcus@vger.kernel.org
X-Gm-Message-State: AOJu0Yxfnf5lpbLcbS6ZT2XpQL+KBVInnqjYTZqWKK0kWFGWBq6m3IwB
	7AlafWPKKOnWloFBUO/g5SQDydHg/aZ5Lsg5T40sqqhSXrguL3Q+7LTYFB6AI7Vy9bgDqIWhsTM
	/4TwCTNiO6i7eqA09BqDb0Hv1aqXmUJxXjqYaUJ5pUk2+mOpVaQ6FcJBcFV0J+52KStuH
X-Gm-Gg: ATEYQzy7tXmW0WZfFWQiK1MkgPwngYfU+jEfs08mWs3bEC/xnRn0H9WK73wBg4yurP/
	0yVDUKxjDDIDg7DEAxIgXw43b3E+4Iz3ciXEL5LAOqxfHbpmHtqpQ3VmXR7NV1DAn1lCa8KYP0T
	412I0nE7nv5FkxbYe3ewJvskLsgRhC0s7jAsWA8x7gygOfpoK4VN4AR7eqKSA3FR69zYucBtoqu
	8TW8eiuTV/pR5+TaklHw76g8r4d3PAGFCZNod4gwPho0gsBgdyz3NvrvJf2dxHp6Fa+gr8AeWdC
	A2f1BnVYCSbpt4CVWDqmYU3MQ+SzEoJLO83eAN6ncOQ4bUMAouqOQPRcqf+5ds3tJO7XwG00gwQ
	AsqOxumiOUy+eOWdQtThaQMM6Osz5tv/A1hXQqo9vciq42fdaUhFS4C3/jjUCmbR5w+b/RKuck/
	BGnASVBXsoF4jNsZNrmsIQZ2wOvcC/g3QCan4=
X-Received: by 2002:ac8:59c4:0:b0:509:23c5:fcec with SMTP id d75a77b69052e-5093a1f49b9mr11130601cf.68.1773193661139;
        Tue, 10 Mar 2026 18:47:41 -0700 (PDT)
X-Received: by 2002:ac8:59c4:0:b0:509:23c5:fcec with SMTP id d75a77b69052e-5093a1f49b9mr11130451cf.68.1773193660695;
        Tue, 10 Mar 2026 18:47:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a15635786bsm132132e87.61.2026.03.10.18.47.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 18:47:38 -0700 (PDT)
Date: Wed, 11 Mar 2026 03:47:36 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 4/7] arm64: dts: qcom: Add back Xiaomi Redmi 5A
Message-ID: <txp3q5sesogonrbl3lrtntj2m4rkv25rab7tdehzic2rnzdyg5@lr74knjgxydr>
References: <20260310-riva-common-v2-0-3bfc23996857@mainlining.org>
 <20260310-riva-common-v2-4-3bfc23996857@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260310-riva-common-v2-4-3bfc23996857@mainlining.org>
X-Authority-Analysis: v=2.4 cv=RYudyltv c=1 sm=1 tr=0 ts=69b0c9be cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=OuZLqq7tAAAA:8
 a=BQt7vz7TcYvtT9m_v9wA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-GUID: OR8b2QN80-0GpEXaEVnGmd61RFxCNFX0
X-Proofpoint-ORIG-GUID: OR8b2QN80-0GpEXaEVnGmd61RFxCNFX0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDAxNCBTYWx0ZWRfX3/WZKJ9niKXZ
 qo4VYMf6MuXGDiEgRS/ASy2Vz2LSSDGA97qC+vdzQyyUta5zbg6gCQK3+D1iaZr2+ctLFddbMeM
 zjwIXfy58C+u86h75mNgUZFNWHwxx3g6gx3SWGlgcn6PuxNvxmjtJ3FxaRIdNBXJW2kzep/o3BM
 Ksl96XX7+4hojfEVQCORZKdp9RaLBoJ3XKOtP5EpCl/k9iwkbZLZaSyNIwPEILH7/F19bXCvbX2
 GFCUm/tL4xrwcTPVuYsc6wh0FEJQIEn7q22t+WevI2bV99skQDgYBog3c3k8xvhXoBPJhsZqWMS
 dQkQTvnscRP52i4TbwcepPOjvTVu9D6+w+ZGKJ6bmznUXRr7QKvOff1EgOFC5CL18C1k7txB4Gj
 Q7C0VJ7RXN2lx6pRMcU8Jmzx3rg30qLQOc+nNM74q0iKHLYrUmD5if3Gigs2RgFOI9fo2r5xiRx
 0tq3xEn/fZlR/yMaSZg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_05,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 malwarescore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110014
X-Rspamd-Queue-Id: 48F7825A7FE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96802-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Tue, Mar 10, 2026 at 06:21:34PM +0100, Barnabás Czémán wrote:
> Add devicetree for Redmi 5A based on msm8917-xiaomi-wingtech.
> 
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---
>  arch/arm64/boot/dts/qcom/Makefile                |  1 +
>  arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts | 56 ++++++++++++++++++++++++
>  2 files changed, 57 insertions(+)

Please squash this into the second patch.

> 

-- 
With best wishes
Dmitry

