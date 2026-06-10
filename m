Return-Path: <linux-arm-msm+bounces-112387-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id B9cNBjItKWoISAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112387-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 11:24:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B1BF1667CC2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 11:24:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="Olvl/u8X";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=fL4w8JL8;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112387-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112387-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9E3B930F8BEC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 09:15:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BE973BAD93;
	Wed, 10 Jun 2026 09:15:37 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A70C73CAE81
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 09:15:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781082937; cv=none; b=FZ9TFJVDrB8UWacH3xId3KQOAIJTParEqCmJNEsggwxhYoG4GYNrjd1qD/MTVumXFU1U/c5TeHobLHOiBXsAM2iT4INcUtInQE0Bzfihm9SHq/JgeT/Etk2qODP66mI+nw5XShopF67qG/kImCkTfXgz5DqITKdhm3UHoLOLRrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781082937; c=relaxed/simple;
	bh=hZcomtwpii664f+hVQ0Lm90qeu1yAe9XyRqvPFvR/w4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Dzsyt0SScUrxlEK5yeZlBiwbezX8mq6QsqP7m2TsSq5hpwMWFyPFPw3tHQ5LidkbjODodN4BRfKsP+efPDtVmZGyy7y3QCdU0zmYKE2DdcJQF77naXrV26qD1bo5epGNG2F4JOFMSz9ulZZGAQC1udcGwrnv6yuODtGH5Zf4bpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Olvl/u8X; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fL4w8JL8; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A7iqWW997573
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 09:15:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Sip0dgLR4BGySyHDaI0mFAbiDm0nM9UBC3biLXvy6Pc=; b=Olvl/u8Xo1jmNCw2
	NyNNxc4/0YW99yeRg3V3+aYudCag50TDO4JaFAFSHtrxTJI4PVtMDdXGCfkeMHWZ
	cgxwQtd/i5iiBHftVlJw/17OhciOAnTBGvkzAzMMZRqp97tEzwPpAEuXeYPR/se9
	kugLBSa5V4VbwHMRbtqvQRzShtFLfXopvK3a5lkDpNaz3TbjwAjZEAdrZprh0qd6
	/nBj0O/meHD3eye1jCdR9x8zBDdqc+A4VqAgYmNs829dstfsZ2+GuzJqFAWbHQuF
	XrMjuMVi5O/j5bvQEu2slN6rU/B/O7pXmxy2R6POouIlai1FKEeJzKA+GmBvdnVL
	y5Rb5A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq10a90we-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 09:15:32 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-915827fb1a3so128200185a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 02:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781082932; x=1781687732; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Sip0dgLR4BGySyHDaI0mFAbiDm0nM9UBC3biLXvy6Pc=;
        b=fL4w8JL8zy7jzglE3TaNFsi3jc8q6NO4rKjH92bug7tm9puaGHg2K4qVafg8qtCegB
         MVtBEjcz3xFOr6lKuQMPy3a1GRVVkWbz5JM18inU+pA3cxXcQxK/hST+vbU+CyPbjEE1
         xq8c36rzMtVrfsDT6CCvXv1U6CkAXR/0Z+XYZTq7UvtlcJOa8wyXJN+nB0y393xgWEc5
         8zaSg4FVEwypO9U3gpD5rNdgMaoOYDlxDGxjoJjqe7kWDljCp7xN9994A1I0XqP2Yc4/
         Tg7RMSR/McKU3347j2RkeLdSFVmhwGzsUMMeDckbfvlUUCUedql72m0QU3MGIGmXvNjH
         CMBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781082932; x=1781687732;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sip0dgLR4BGySyHDaI0mFAbiDm0nM9UBC3biLXvy6Pc=;
        b=R/pVryEetbfTCDfesPS5Lx36GW/imq5R2eI8+yGiOEwuO2bYfLwMdRmHdY+oXnbYcP
         bmDjzJe1ZpT/qJQSfIvEo7O5/QF1ezhMclFue+MoAyl4hEPul2K/8jU1+XR25xrMBPJi
         O5KbV341T2R7c+AXempg+yapaSbd22i1t2q56BspLaIg+Wv8KVEg3j1DED4c1/zhP8Uo
         IvPtlHENl4Dd+vvQ0qW4YNZg3bO0wl32FX6MWO0XzVcK66yhWZcGLdoQ9LcfaJXcWJnD
         TNigeFNCt5UgH5XRx0tYzCRLXMvN6RUCfIlJmHzryRlGtEwlynUsjPFGwyNuo2rJo9b0
         DzXQ==
X-Gm-Message-State: AOJu0YzdhC7x5Anv55pRcaYxt3OVldkZu9tm5GBiimCObhqRTW6T3wx/
	Z3ogDP3TvTz9BDQ84TSk446+Sze2l3lhMuWFB4phGVVj7R5NTuScpygvtUQLSq4YortXrBQ8WuS
	922d+TOW6VB8u+UwFo6Jz3onx7tqpB2xrHLmoHifBZUz/5T7Vhj1pHB0lkVhzYY5q25Rp
X-Gm-Gg: Acq92OFzWQEkjjD8kBLXVdEdOdMJ3tfl9uIZVZ3RvMYKdQIVJZj/0QCtCNEdK1AVA9L
	Ptk434g6tf2tW6UVOJg+5HXkRmjKObqEzusfy/rVRKes+qqbIGmO+TpiiRZNhQ17SUpLglHUuoD
	9mkQzNvsDB6UpDZ7ZWGwalwHJSnog0yXwD/EYtXjgAAbG49HrInsLvxQ+K47miYfOz62aJNKJN9
	114n9DaF3D1OWSL/5JVLmRhp/W7sscFTY3giFww1s0bhx+BJJQsD9uIkhqON1ri5V6dZqerxiWJ
	oR0EWG0Zgu9ZmFXejO70AXzqsL6JgqXPFPF498Lx6KJwmUssTa/JT3hyb33oXpAl2wHZ7E0Ve1y
	W7+WiZbmnj9amwSthVv9ObaaYnmz4C/y46cZp6QuBzuIzbia1oLhDnmbh
X-Received: by 2002:a05:620a:7113:b0:914:ea37:6f14 with SMTP id af79cd13be357-915a9c7736dmr2089298485a.1.1781082931833;
        Wed, 10 Jun 2026 02:15:31 -0700 (PDT)
X-Received: by 2002:a05:620a:7113:b0:914:ea37:6f14 with SMTP id af79cd13be357-915a9c7736dmr2089295285a.1.1781082931286;
        Wed, 10 Jun 2026 02:15:31 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf0517712a7sm1153176266b.4.2026.06.10.02.15.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 02:15:30 -0700 (PDT)
Message-ID: <6c79a38b-1ffd-4693-b54d-78be24a51966@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 11:15:27 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: qcom: shikra: Add Iris video codec node
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260609-shikra_vpu-v1-0-3a32bb38b080@oss.qualcomm.com>
 <20260609-shikra_vpu-v1-2-3a32bb38b080@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260609-shikra_vpu-v1-2-3a32bb38b080@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GoFyPE1C c=1 sm=1 tr=0 ts=6a292b34 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=gZ9Hao4PvtIMPGLi9fIA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: hEfikE-fUyACDm6qH43NfXdz4pgBtET3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA4NyBTYWx0ZWRfX6eC5KDQvq8fg
 IXdnSON7iEcSIUcQkmtGqzsBKtNzMvRffnl9mmwi8xD5kCvzU3YJ8V0Nxz5vST2e7caRNDEUDlz
 /J1KQS8fSyhJvSh0o5CewMWB9EYSLU7MVGqNkDf0COmpB99Rd4j2p8XjY5v8/wJmkvxx8YkuUXz
 wVarHVOXEyn5X9xO/H6pToC7rEYtBog2l+4vPuICOLzk4/Ey1CQh0tYrnATlYptHQjHA62oza/g
 /2h3UtHDNCkEiaI0r4lTKX4THyxdNaaOgGKSYdWlxdhWW1jlxOuh6ZQOlPdoLlsyC4PbU+xLlEd
 7B9UiDz1+r5kqp9W+uYmBXTEl4U3n54nC2GUzdEssni9Z4PS+iup2tNncSPn0naYyN0o9wPjJ8k
 5M0O64Mjq1KChuu7KTVf/U6XlBCgmC0rgxaJp1IlUgN1AmUapL1yxvEAwYHQEUh15hG31l8x9ko
 IViLDwFGsHgHh0oBF+Q==
X-Proofpoint-GUID: hEfikE-fUyACDm6qH43NfXdz4pgBtET3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 suspectscore=0 adultscore=0 clxscore=1015 spamscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606100087
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112387-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:bod@kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:jorge.ramirez@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B1BF1667CC2

On 6/9/26 6:15 PM, Vikash Garodia wrote:
> Add the Iris video codec device tree node for the Shikra platform.
> 
> Shikra reuses the QCM2290-class video hardware and programming model.
> The video node is added to describe the Iris based video decoder
> encoder block, allowing the media driver to probe and initialize
> the hardware.
> 
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

