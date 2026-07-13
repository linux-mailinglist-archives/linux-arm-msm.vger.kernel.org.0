Return-Path: <linux-arm-msm+bounces-118739-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VfyaAETDVGpTSQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118739-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 12:51:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA46749FF9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 12:51:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=A+kFtuhG;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="Utvv/NL/";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118739-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118739-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 740B3304D444
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 10:50:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A0793E63A6;
	Mon, 13 Jul 2026 10:50:22 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3236C340401
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 10:50:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783939822; cv=none; b=V5TXJJVEjYUJoHd0Syx6wNx5y7qylgh2Wspt4prOCZzMCw0CecXJ6TjFZKukfCa/O9aQPeF3rEbIZ++RTLDOiPRu93mu9/g7X+sSbsxR6QRqJQpqbk8TE7VNrYdxirfoJeWqc4lrRNJl2g7UVPHmdUfXPFnr9m1dY0ZZUpm+Vv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783939822; c=relaxed/simple;
	bh=Vh2sWX1iyHi9Tw+t86WJ+jfswAcvxYFSL2CPGjT58ZE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e6tav0N+aoyBQVpxspwVNcZnXRF+oAyILqbN4lDkQtJHrr6hz4tmLAUcet4t4gtKMu8zJjT4SuLuHYWHyTohWwMJKZkYirFY9QMMZXHlZcY2EIygDlvFBwFdhvvn1E8jwDFmkKA47FTaHI5oceqcNTi34QajVkwpih6MI0bbwDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A+kFtuhG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Utvv/NL/; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D98r5D793136
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 10:50:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OEf9r2CGUDDvdRTVlkeJE3LCyB6+x1X6aW6SrYpfnPM=; b=A+kFtuhGIQ5g3B9F
	8Ys+YJmsUnQkhIhiE5p8bOrhfpd7AeMzmnJMRZlzn7QCnc6xRV7EyvtLaYW72R3B
	ZTXe/SzZ9mnWr861xgCXBL6R4HLjk1iqO7v1NmYYLUqI3WLbrCWCDoizg887Jpv9
	S/wOed+SL7F1rgnrACNDt6DqKVWqE1wPO7TNY1FLpOCmg+l8kCUjZNmHPaJIhQAo
	mYdnUlYWDBvBG7yUSD3LPdmhy/HRG4BZqUQgvj/qRTWkguNL/VCUJ+7+RRKxWU68
	NVFj99ecao53OOM+L4fMVGd16NWGmLjH0kqd2N2vXZuULhzckXI4EME5EKl2+JnH
	pJQC3w==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcw4qrb8r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 10:50:19 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-903694fd3bfso7766086d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 03:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783939818; x=1784544618; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OEf9r2CGUDDvdRTVlkeJE3LCyB6+x1X6aW6SrYpfnPM=;
        b=Utvv/NL/GX2lFK5hLXmMzXbVlxikUTOGVuZTEqvaT8ElmOU5SJ1BNHUHarL/iDtNlU
         wMeHRQYWoZ1ldvXTNL+9tirbYNqu8cdiyTdwfqFVlVr0nTtL85MJ8xabNh5bPYNsuQzS
         Mtj4SSaUK5WyLKIwjvuUg+i9kGUsIz6kjtPgpAXPEWRJqWiW2bosCqY/C28yVSYu9DsN
         cSdhJYr5LriDXyxOtxUHPBrXw8fKFxuK/Fu/hYDUhslKxpFOTvdreMOTdyXN7uGYRTS/
         b5KWgwVMKRvFPXcIxO18d+f4HKB7ZNSvEsI4MBv5/el1AdzFm4TqbVcQt7AU+d3ocKAA
         6GEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783939818; x=1784544618;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OEf9r2CGUDDvdRTVlkeJE3LCyB6+x1X6aW6SrYpfnPM=;
        b=MJImBzR42jRd5sZodbAj0zm0ciyYnvLAWsRB2CWh8WxgiVClKaKKMLhSHmlvRl7+Wg
         QemiuYAWNLjllKufuYBPWS6SIbjD26ToCSVwLTDExTqR5D677aOAia5JRGucr61eQDy8
         N9SxSA9Ps7kP5yQqnCwrpCvw4A/5qXqNEnE6WqyUhCqLyNiRVBVQovWISPp23BN1131Q
         /kBFWtGKsgeQpTC4xr9DqbP9OxzlC15S1HyIOm5a8TVLsI2FoPXuNywlU2NG/noT5JKP
         /XylABB3KflrJKvdkAX1Uv3HdRvYXWOnMtZ+WXBAaUV2h5iM5p6EqIzBNONAptGOox4X
         lw9g==
X-Gm-Message-State: AOJu0YyuJIqjfjYWdbaRJ+TUSvB+z4Idndd3puJ6ZHit5KlwCYG0Iz2a
	OyvJbLOgjuESD+7onkvhPkVePo6JM3Tmfb4fqTIIsfZXn43RmAHyrAj6F2ohsKusz/ZFY28u+uA
	V1oY2p8WwMZgzgLAf5r8WHkV8E7Pgoy1umvgXuuDkqZ1oAkbBvWqHaIjUnJDocolOCBzw
X-Gm-Gg: AfdE7ck9SonCX6zO1Zw0YM7Zg4YFbFOS3bleNGeOUIiP6cr+l+yp+VYnScvstYH8OCp
	OchP1/VhOLasM6eUGJG9mM3JT+SKHdpbnX168V/BFqUdo6AOLFhLVJs6O+I6b5b3m5ZNxe8KVtg
	SWvw5qZ/5RxVlpADrrZUxJ0ob/buzHl4xpZOXcUrVeHKqNv7CNPnOCNO/Quvk7kfHua+yNwNWaf
	ARChbi6o3hrwIydNSgS3SmzJLOQi9SMKMvbt/vlOK4gCEPJhRKyxI00Ep2AJKMCl8tR0urL27T3
	TVvO/ZbPB8Uc5MIz8HD3hzlCQGrpLik6oWK77Q7JxvD6Igg8HPPFLQheWUJCEKpZW0ocUh2JilK
	Lq0gAv31jl/2osgvg0IbuPuN1q+tIdvuzv10=
X-Received: by 2002:a05:620a:440e:b0:926:e8e6:3c28 with SMTP id af79cd13be357-92ef2cb409bmr567814885a.7.1783939818513;
        Mon, 13 Jul 2026 03:50:18 -0700 (PDT)
X-Received: by 2002:a05:620a:440e:b0:926:e8e6:3c28 with SMTP id af79cd13be357-92ef2cb409bmr567813285a.7.1783939818123;
        Mon, 13 Jul 2026 03:50:18 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15e19cb6c0sm631526866b.26.2026.07.13.03.50.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 03:50:17 -0700 (PDT)
Message-ID: <6052772a-bcf0-4e23-89c6-9516a6f68f20@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 12:50:14 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] clk: qcom: dispcc-sm8450: Fix
 disp_cc_mdss_mdp_clk_src ops
To: esteuwu@proton.me, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Danila Tikhonov <danila@jiaxyga.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260711-sm8450-qol-dispcc-v2-0-fc1a07ac5601@proton.me>
 <20260711-sm8450-qol-dispcc-v2-1-fc1a07ac5601@proton.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260711-sm8450-qol-dispcc-v2-1-fc1a07ac5601@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDExMiBTYWx0ZWRfX+Ov84mctmkUQ
 EFlEi2GEV1fzPTabNVYb1tFL5Nt8u8z9j32vjEV0lkInWnD3Y9jIdbYRMkM0oOTqPi7qufhowgR
 Ux+RoARCvm88sMzhITN2RBEC7ljjOS2gRMb/X/u8Y1zqLlJ0NYRKx3arpMFdY6mQXucArnLvrbs
 nTJHKfRL+FoUIuRfBfMvLdoyhRvoaaX4I3etVJwSvfmV+94RF5jJo+t6CJy+uwFo5oU+3N0CyQ5
 L4v0J3up/xLqafQATDXfM1w6pCCXyz0ehxln1Qf82oDwDWYQDCp1n2yuIEpjkbbi29HI2WGAMtI
 he05IFBvFAn79e5ub/0VasOKXNSNUsn1SuU6MZTZZN0T0BW2Wp8YI0C9IFE5O2M8GPjXXZTUePA
 DJq3AGCajmhTtGVz5+py2ahJQ2GcnFcIYhD/LVGqQIwUeZ88O7vreqiqUp1psckqlo4hxVak6xB
 uYXPrw0kcwSJ+sOvmZg==
X-Authority-Analysis: v=2.4 cv=HJrz0Itv c=1 sm=1 tr=0 ts=6a54c2eb cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=LLcCrvt9GrqY8lSa8nIA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: 81DdI-0kZ5PEcuRhaYwO6Uh4Hwi8TU5S
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDExMiBTYWx0ZWRfXw6wjQfPimkIh
 8rhjzFMcwodK4WJYXqtaN6kF+4lfzZbKntFQSHLk8bLE3TerKqD08FSenV1hSFt/R2gVaiUsmWL
 u9sq1uw3aUxaXCb0hGdghopyDlZWmDY=
X-Proofpoint-ORIG-GUID: 81DdI-0kZ5PEcuRhaYwO6Uh4Hwi8TU5S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130112
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118739-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:esteuwu@proton.me,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:lumag@kernel.org,m:danila@jiaxyga.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:phone-devel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6DA46749FF9

On 7/12/26 5:10 AM, Esteban Urrutia via B4 Relay wrote:
> From: Esteban Urrutia <esteuwu@proton.me>
> 
> If the clock frequency is changed at registration time, a flicker will be
> visible at boot.
> Switching to clk_rcg2_shared_no_init_park_ops fixes this.
> 
> Fixes: 16fb89f92ec4 ("clk: qcom: Add support for Display Clock Controller on SM8450")
> Signed-off-by: Esteban Urrutia <esteuwu@proton.me>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

