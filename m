Return-Path: <linux-arm-msm+bounces-112222-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gYhILNYxKGqm/wIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112222-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 17:31:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id F403C661C54
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 17:31:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=CQsVtw5g;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=aKFNsB2A;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112222-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112222-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D2CDE322D498
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 15:14:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03F3B480951;
	Tue,  9 Jun 2026 15:12:59 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 874D648A2AF
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 15:12:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781017978; cv=none; b=cgXcOW94OU8inVrQKsPIJEvV26iLPOdIZGOKslttjP4cN34l1xn+ewmwSZJIAhLVuHZfJzKRotzBrpVReYZYly1ZMiGi+dqBtFbMr0Wai/NPD2efkixGxuFXpjtZbMnbEPD6C9HlviM+aCtACkzqhqJjgxTRUrMQGN2W0C+Jctg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781017978; c=relaxed/simple;
	bh=82rPiIP0YAvXOj5cPODTD5NH26/JVRVCRNihB4/5Qlk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LPRHNFFINCvaNB2JoSCXPikXriIv0s2QhURH3HY1hk1H7EeHnM8LTRabbgoxet2QaiJclveJScfa9gOGXFbNZyJqq1OXnPdD+Nppfs+5YBpl6D1Peta5wp7Vt5XakzXVv0uZnNN5mc2AaONcdJ8D9V3deYykFzRP/hRpr0fatIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CQsVtw5g; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aKFNsB2A; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659ClKDR652177
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 15:12:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mhOnrD0Ngw0/aZVLSpJGyyv3d0d7bAPed3nnx96ANaY=; b=CQsVtw5g95+5D2dA
	hKo2dx1+w5pfI9J68sboglEg4VakcxYgph2dDRff6Arufpcbd3B3PLJjZsrR2J0D
	7E1lR8GU5YEnB1Q4l2Q48+6WAsyO/htAZYYvKqES/RCWHQMq3133zab/4K8ATR5M
	qJJgqsvhxgnjPWj1QMQx/088Vum6PuFOyTkkCwcJOXDMg6d4XMxbQYTpbS2DIU+7
	BrP1YI5nBhDgHgpPcbiKGYMCgB4VB/vOM7Qt/5nh3ENLGXsMEyTOw08EGmMzNArk
	csdKjuqgWNu+YAA1GlhdQlpD+G/2YpSXlW0DoHGxnEHwdjJ22C60ltenCZPU2/+A
	yrJ6lQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epf0st19r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 15:12:54 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9156dc90fdaso152449785a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 08:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781017973; x=1781622773; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mhOnrD0Ngw0/aZVLSpJGyyv3d0d7bAPed3nnx96ANaY=;
        b=aKFNsB2A2IIp9i6ICMml5FSsfx1rsO5gCXOiqCNrONNJSDNqDK8ZrYeb2NNx3XaDz2
         /23MowkIjcjfVm8UgmAT6pma1NirAIZtJMnv92czuL/6DtldtbP4FFPR5Z+iEztQmJt3
         lQ8S+AFtZEKe/xZ6r5uX8XNu+/kTIGUY64cCaycUbvUu5CC0hKCbelE8W5vVBDjzeeQG
         nF6IxhHIxTuO7sTVrU1McKy3zzEwpDM2/cf353nTBahM+HzF+dwKi65gvKuNXckPvyfy
         lZqsZhJwxU6TJzsrVdHGAtHn1EBair5djxw74mi/fWsr5CgEaj4yk4dz68IJDNX9QgtX
         vU9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781017973; x=1781622773;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mhOnrD0Ngw0/aZVLSpJGyyv3d0d7bAPed3nnx96ANaY=;
        b=VIYAG2JjhllOfHRFTwISzZPDcd6xJkoSUYs2aPiSIgV7R5lmFeL115sg0lkUPLjy22
         MAGJD5FOBUvXxox7bFkZ+6C3EUtlQ4CHdqa0ohvre0wCww2LVmCi1y/VioUyM3cWokGI
         IjiUaw+yN9An6vTN72XU/+M2a1sRAj3pro/Zce0kVSsCXbRJ96FcG/iOXHrZYrpwfOgP
         enp/1Z35q0olSxN+JRzGF9fGUd1NaCRNtT8Pf/iq7mg5mORNkwKxlQCRvVHRd3jqrrs5
         zr5sSdq8OVzHKUFrp1xehjnNIrATJbDsoLJQDYJx8yglSrZ2AG26ZKdPPY9mAyi+9kB/
         QlLg==
X-Gm-Message-State: AOJu0Yyf7n9fFDQYxrOemKS5T89znP1xHWNoR3gen3bRtOZS2xgAhxaV
	WxHhl6HMKdJkjc6Z5VrZpe47anYU/AaRnf7h7n8WDwqxkh207xWfNx44xnZb/ZHsbcLEm6nHuO6
	iZ0IyKric+jdh50Aw2zVuYn64ZsU9em0cqaMhYjYs6fuuImf4X204axwKVF47onq37MT/
X-Gm-Gg: Acq92OFEUYjvllrg2HiUIMFdA8BSwK1eZ9ab7CVPuCmYGCkB7FPjHuu9h6SqhXyDOWy
	D4zojsfBsJpXaOWVji1HF/UOJr0AObz6Zhg/A4S54AMjgCZwm7cv7tvkhg4+cuzsylxrxnIZU5h
	SLMT91GlMwd28rlRtvps4b+ihydoDEHTPqXRE/gxy8I38islBkoYpU9qD/yBlTFm71cLIBWOmkI
	rAWQBttPieay0YeEpD+8S9FVTUqwlQo2GCuOxJM6Mvzk0uKKy1BHFkRNd/49fAa20Dat0tIdBLG
	r1RgwtH2OABr86FdsavQBWESiHK42AwfjccuheaYIZEQEUIk+dCXjWALNK3GdOQPDGLcKFXZcu7
	oB/SxT09G/lYkTr8MNpbWXyeczH+89vIzVKEh0L1FalzXVIxKioyNJ5A8
X-Received: by 2002:a05:620a:4042:b0:915:8055:3f9f with SMTP id af79cd13be357-915a9daea76mr2004997085a.6.1781017973358;
        Tue, 09 Jun 2026 08:12:53 -0700 (PDT)
X-Received: by 2002:a05:620a:4042:b0:915:8055:3f9f with SMTP id af79cd13be357-915a9daea76mr2004987585a.6.1781017972545;
        Tue, 09 Jun 2026 08:12:52 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6914f3b583bsm4849171a12.29.2026.06.09.08.12.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 08:12:51 -0700 (PDT)
Message-ID: <cca7e305-bdf0-4ddb-b299-aa25a183e229@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 17:12:49 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: ipq5018: Correct CMN PLL reference
 clock rate
To: george.moussalem@outlook.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Luo Jie <jie.luo@oss.qualcomm.com>
References: <20260521-ipq5018-cmn-pll-rate-fix-v2-1-04b28a92e0f2@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260521-ipq5018-cmn-pll-rate-fix-v2-1-04b28a92e0f2@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDE0NCBTYWx0ZWRfXylyudTEsHmNR
 jQi1ZfB+IasgAV0v+cA4NW+sKT3L65Mfh0GYLP12jerQYbenWb5LkNA2osoE549Q6BW/nQDDf+r
 xGOQXPjq7LOeQJF8yZa4HlAnaUoyfNsX6tpgLAphjYardqffnmG3Y94eEoQV0DmTGWN9Wb27Hrx
 H4Y/hoQSiISEQeM3UBe2h63OKoM+bag/CSm1r8UihLbVhsU9fFovxqBDhy7cHVBtnZJwhdKCug8
 Z1bwi52B+KQoyG3lQ/mSxKzS1saga+fTKpF0BEv/bPZzaFjFE5BEYDx5MEjHozd3TbTWfIrONgk
 jQv8vfZ6VZarIHoHeGT9UX655K8oZXO4YgXZHsCBD3rMsPBaocPiqxeTceU4JweZu8wAAHoVO1+
 ZWETf3a7oYbQL0jgFPBQchLSoXPY5//gOav5ImaRy6xdygKaRt379+iiZawvJmf2T1wEv9SQxRx
 XWeB7jG/K/vTqXEVZTQ==
X-Proofpoint-ORIG-GUID: 4OzhXqhFLe07erh7wbUjYc2Y_HxPfWkb
X-Proofpoint-GUID: 4OzhXqhFLe07erh7wbUjYc2Y_HxPfWkb
X-Authority-Analysis: v=2.4 cv=GeonWwXL c=1 sm=1 tr=0 ts=6a282d76 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=bC-a23v3AAAA:8 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8 a=uMLbdMa3B9XRMCKcfW0A:9
 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 malwarescore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606090144
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112222-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:george.moussalem@outlook.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:kathiravan.thirumoorthy@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jie.luo@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,outlook.com:email,vger.kernel.org:from_smtp,msgid.link:url,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[outlook.com,kernel.org,oss.qualcomm.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F403C661C54

On 5/21/26 9:55 AM, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> The correct CMN PLL reference clock rate for IPQ5018 is 4.8 GHz.
> 
> The CMN PLL driver did not account for the ref clock divider which is 2
> for IPQ5018. Therefore, the computed rate was twice the actual output.
> 
> With the driver now accounting for the CMN PLL reference clock
> divider (commit: 88c543fff756), set the correct reference clock rate.
> 
> Fixes: c006b249c544 ("arm64: dts: ipq5018: Add CMN PLL node")
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---
> Changes in v2:
> - Removed line break in commit message between Fixes and SOB tags
> - Link to v1: https://patch.msgid.link/20260519-ipq5018-cmn-pll-rate-fix-v1-1-3c83a173c27f@outlook.com
> ---

I have no reference for this, but I trust you.. maybe +Kathiravan
could double-check

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

