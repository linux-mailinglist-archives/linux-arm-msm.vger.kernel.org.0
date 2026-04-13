Return-Path: <linux-arm-msm+bounces-102892-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8J+9Fkep3GkEUgkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102892-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 10:28:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E73753E91D5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 10:28:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 56C163004DD2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 08:28:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57518392C5D;
	Mon, 13 Apr 2026 08:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IelQ4kck";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HzJsjeN1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 212A637DE81
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 08:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776068933; cv=none; b=k/v4FfQ9001SxU4yB+pde9Lig1eUNcz9A88m+2CZnRZ/HBTlMnVYOy4rZu7thY9ykCGmZV0mGXgXuJzTvMYeDRfOTAEdoSgKkJVyIC4vxywHaXDUf7vo96oP8+zvOemsaHqhbHrBvyQNOksqoBgiG8nnZHShA0qoasY5ryS0/BE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776068933; c=relaxed/simple;
	bh=u70DmloeYG9B8atDr14Mh+dhu99umOa48nnxsXQLips=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mwiBU1rNGDqqddvqR/8WCDD+iJX+MvTZdYIonmLvDO/DW46LbuIAxTxmub1jHtuUBN4d8u/9V1OSLIQER4SvTmlOUq40VcQpDA37mj7FV1n+vqktSNxNalALw0wUwxM3md4a3DgsSwZPylKiBORAaz0EFkEn+KZgjp58d1BmfNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IelQ4kck; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HzJsjeN1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63D8Fr2M677692
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 08:28:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VLMdgLtUvVjpvadR/itTGoqc6ZbV9fFT5xXG0n1J018=; b=IelQ4kcksmPHlwWE
	sRIbHx/MtDfOYCRBVVe/jxNnE45VPMAXyQzYEdBWkNeuhVQyosgvao9m4MIMhCHY
	P34gyf37Knae/mtY/GmWXbkF3jrhFFS1wZ9skyQjzXXxLtOVbFosyzyqZ2xJCPXJ
	H6WGjzoAy19GK7vMG8g2lheuPVVIHakRNRnZRf2caw3eLJ6VJ73wXJY8K78S7nuj
	vg3jGm/av/1xQCLdnNRAgscDMeQVi2tvljYKFfCkS8yhaRtk0YJFx4sntish+Ncj
	4Qy98mhaBtvOnQeRENir8hB/IuGEzpkUA1xnf6CctX7F9B3Cgdij7dhnw9nUaFAh
	XzlYhg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfffhvd4r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 08:28:51 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8d0095b0d80so119844685a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 01:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776068930; x=1776673730; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VLMdgLtUvVjpvadR/itTGoqc6ZbV9fFT5xXG0n1J018=;
        b=HzJsjeN1NsDssVct1bxYtmSQy8lXPt3yvY7vilkrYWOEfesohmaZx7AoYT7QFOY8tY
         Fzz63009mVm1ryMHL98nH/ETX5M+YnETp/cpJjiT0ElS5Cf4aO3xgv/xI1xSb99Ww4UT
         izQSPhP0+mPJauV5r3WTq6oqWanKM+zTK2jubmTKHOVApjL0cvfZbwVYpUz6pmtHM96i
         H/e3XEcxRCKJHUhh3DJP//lzr4W+GCwlj6K9YEd8k8GC2PXemnOggnHEIZrKNg5wkfx0
         KbRyl6LuaE+GiJ7fNvOjbjJ0YOfHrLhmheccnkzht/PJkCtrPnVOoNg1MDRsihuKbisc
         m2CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776068930; x=1776673730;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VLMdgLtUvVjpvadR/itTGoqc6ZbV9fFT5xXG0n1J018=;
        b=Q24L5V+8tA2wLI9kOwhIEUn/QnemcK90oH7BB6l1HPtGLmYDonVBiPjQMjs2pVIjIQ
         foErsoyaK16HmUyt9jYpcz0xU8I9gT2LWpRydbPBrkk9r9s9/YEtWmsbTKKLeXV1Mipt
         dapdrH/9xN5jU29MnJ4tGjjzuw8pMFYqieOQahhS0TTMQm2fdN/qcYU1iJ1QW9Af7h1W
         UYAnmhBJuigdsuJEBnyTN9uQ50wVtOC94ZqGIpjQxsmXiWMZnBZ1SODwiRLWSQdH6azL
         lbfhd1rBZxllUnaaOZgeRD67PSfxRxQ4R8rB4kS8sxYxf6lVs4HBazjjSTHAJAulTO1G
         wLKA==
X-Forwarded-Encrypted: i=1; AFNElJ/cEiLbzZ7BYChgituZpQUrbP0uyrV7Us27cfndbaZWQ1YzM8wLMZy4q6F7pqs375KYgbDDx1NVEow2KBSY@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9NIR6lWEfq97IJgApnWPD8w8cXjTDjZUZj8+iBdnE4Dz3r/t4
	i73+AxMKSeZ/9bsiCDZWbgHCyxI99SXFcaGW1oFxB/beS4qgiTBSCLZtfeb1H+bWh3vT9Lauc/o
	m9JpDO7Oune2OiiAcK1MziJsYLSycXxHkFWBDZn7SnoS3TtG1qO9ecGAR3/ObuJhrJox3
X-Gm-Gg: AeBDietTncnzWqtg57sB5XfntWn/+7UKj4PzY9JIEkyuRYh73Gdxg827pv9+JebDYLp
	DeGBGO1n22f17WRshVh97gstv26BLLZWeKHtnZuuprnWffgpwQ2qo8HmI2DCEmRI+odz7YzClAQ
	CDglyQDxK0niLH7WJb0KdryHDl8sAX2t5C6BuC9cfF2ZqPjkbYREwklfhU0dg0jqa9JCdt0l6WU
	2sAkYG+Nt1FShZmCGVfgyyGU3EZefV2qXt9urjX33+kXWCt5D+0q+UVEfKe1KLtTtAGITNZx4+J
	fxMXgIzkb0UEKdGfO0X4hC97xutuGC0m5vViU101QMFnp7dwx1PatvP46jjFZlwhRAAY2BKUOaD
	NLQeTQ807PObXFrS2m6j4GxTFZ1JU4JyJy4269M9JQCV/TFv37vv6UBiL4RNQsGINy8aTTgHqt7
	5TFQ8=
X-Received: by 2002:a05:6214:1d02:b0:8ac:b4d5:50f0 with SMTP id 6a1803df08f44-8acb4d55df5mr10040836d6.7.1776068930562;
        Mon, 13 Apr 2026 01:28:50 -0700 (PDT)
X-Received: by 2002:a05:6214:1d02:b0:8ac:b4d5:50f0 with SMTP id 6a1803df08f44-8acb4d55df5mr10040646d6.7.1776068930083;
        Mon, 13 Apr 2026 01:28:50 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6e5c5af1sm283525766b.39.2026.04.13.01.28.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2026 01:28:49 -0700 (PDT)
Message-ID: <338935d9-055a-4f0f-a591-0ed07c471e7b@oss.qualcomm.com>
Date: Mon, 13 Apr 2026 10:28:47 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/35] irqchip/qcom-pdc: Split __pdc_enable_intr() into
 per-version helpers
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260410184124.1068210-1-mukesh.ojha@oss.qualcomm.com>
 <20260410184124.1068210-3-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260410184124.1068210-3-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDA4MSBTYWx0ZWRfXw3i3LbqceXs6
 yBKfRO+7OInM6ZmWsO4FLEjS2UUPTRrnoUTCNHxGIH188cUQdWcmWt/KY1w2M998xRwSu6DAWaU
 xc2s+/oZmvOnbLM7YkjBOHE8pdv/Rnj8saLflqjTvLUHPGrUYkRPbBAz+q3uUFSJCadkdToxMr1
 5fPlY4L7q0C62eQdV6/MLPHEbwIt1GqGAzcuZ0rqRc65qqZLgdmPBt1mKA75b7sJV9u15gMPUn6
 XqPHRSGW8LK38SjvGy//nBs82NIzuyl1BXXt50vKIgXjcj65bCZFwCs7364TcikLguHKUuoIwEY
 fg1Kz4xHAESNfUxuGZmazhGq0mOfbBPvr0nQqstRHE8Uww6k7zX7LX1YaUAHbCkv51rrSH/z/+O
 IJLgIu0fdKV5uw3bQ70/vVWIujd3ZPA3tmOp1gN0gCvfRzBDxbYoKPujrg3c6fWJ0EUpaurc0Kq
 SvrEWDyd2VNdxNyfhsg==
X-Proofpoint-ORIG-GUID: 5Bj8TEuO95CEMLpCh6vba0pc6hTkjYLB
X-Authority-Analysis: v=2.4 cv=FOkrAeos c=1 sm=1 tr=0 ts=69dca943 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=7VHkyeIEd6B37TvAa9YA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: 5Bj8TEuO95CEMLpCh6vba0pc6hTkjYLB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_02,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 clxscore=1015 spamscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130081
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102892-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E73753E91D5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/10/26 8:40 PM, Mukesh Ojha wrote:
> The __pdc_enable_intr() function contains a version branch that selects
> between two distinct enable mechanisms: a bank-based IRQ_ENABLE_BANK
> register for HW < 3.2, and a per-pin enable bit in IRQ_i_CFG for
> HW >= 3.2. These two paths share no code and serve different hardware.
> 
> Split them into two focused static functions: pdc_enable_intr_bank()
> for HW < 3.2 and pdc_enable_intr_cfg() for HW >= 3.2. No functional
> change.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

