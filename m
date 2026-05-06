Return-Path: <linux-arm-msm+bounces-106138-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SAjBArll+2kbawMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106138-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 18:00:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CFAF4DDC28
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 18:00:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6C2323064CE0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 May 2026 15:57:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7E4048AE23;
	Wed,  6 May 2026 15:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lUxvZK/P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jIKjr2P7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19360401A11
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 May 2026 15:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778083003; cv=none; b=PXMRrM2EHav3lkPyTm/KOjIpECeMvvvw+ChhiNXarU88TAoCZ00+ud53UBHUvjs8blfv+aItC/1y1A7okn+X0tubXz73CsWv2eSDeIvjfsucE8jPZZ//1EqcZwfrJv8CBPTWuplsqHxsFKVSNLBWwKHzF3vNG28oWqM4qj+bPZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778083003; c=relaxed/simple;
	bh=slFlcG18qKmRJPdDvfi5FDwm64deTGUrtGeGdyAySDI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sLDL/qaiqMHCEVCP9P22KOxSlYrMhKxSfX/+D4/W0LAber+g2vQmvmZQHpPN+ZNua6FhJdDfO3p2+L97me3U3lfxL4pBr3xUi2J8dBf4h7rpI1tHe7z83vGi8r/XY4QV5mzbyo630oAKpEXbl2D3cduIJuldFYmW949Jwo554/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lUxvZK/P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jIKjr2P7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 646A04a31985937
	for <linux-arm-msm@vger.kernel.org>; Wed, 6 May 2026 15:56:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0hbrdNEm+roBJyCislrqsmK+OlBVhAX1OhZtfM4e7C4=; b=lUxvZK/PdTXLb89b
	kOoFZzfSwhMEpLuomTDMDCEb9V9gM+reKqMbt8imv00LFL4ox2+0XRRxQQKYs4H/
	NETs2OgFotrUI2GcCrm7MF+nNG4n0jtg7T7bvOAZuMSXHRJO+7I0Ap2ACljVhWsI
	3yk+jVM3ctQiYEa2TFQR/v2V0wb/DS9nkAU2PlK8Dg0TqRLSTlO0wAWbN58oJyjI
	yRpcUQDms2KpkQk5y7fVN0D4TpOkiK+tRcE3nDm+ezn4J175nyy+POEhuepbYwjX
	7ILtgxrunRAwI1Vk/7/V5qzBGZU3w8n/0FS4FbXUqyywjAhnMywFnbo+musI0766
	x90uCA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e03gp19j4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 15:56:38 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3568090851aso15835804a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 08:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778082998; x=1778687798; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0hbrdNEm+roBJyCislrqsmK+OlBVhAX1OhZtfM4e7C4=;
        b=jIKjr2P722tkurHjHV7xJofcCGFSsSiVhkBLM9r7JX2TYjtVT2va5NbJDtA6cvRNy0
         /odua52NzkOUhW4cUmSUxUKD0W4jj6Zo4EwSNLzWCp98vpG8X152kq7zRAmucmqmXAg6
         3akokDbb10zFfQrWPGBK9CoDoReRwLaHX3+FfBYup50lgedc1R9NTSZGTnEBra1HrYWT
         uvjTt+gc1yBOTuot6dIrKINR0y+fSn3CB8f7iAjZBooRO59n1Lt55io+Fa9QaxrHWiua
         g1Gde9ziCYWVDGkfHLrmiifdedEqLnRj/r5JTGvkfLtftG/wK1mmk3cmKqiEKfWBRe35
         zuwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778082998; x=1778687798;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0hbrdNEm+roBJyCislrqsmK+OlBVhAX1OhZtfM4e7C4=;
        b=sShnVRLDS71FRZhYyWAtmuQ2bJF+sWQCgvrVBZbwCOX/jjgx23AL2JvFAYkap/Vm4G
         ezr3UW91zX0VyqA+waVE1frIzsx1E58/jrXm6MZlkOf1vSnJTOKT3z7GQTsNIQT/LPug
         3xrXbRJ1DfIT9bANWM07eOagV2czwpJThzu506BLVQXANNZok65yO2zYw/fr/l1SGUaS
         qqTL1kk71TSJI45coWy9lAd53ouvqeyJaNyM5xU8GAUhNZf06R3tiJ7z+XxsZVCUe5ai
         my32NoQ+XkuNFVO72tBveq2IQR0cDNCShlpezNzeWMnE8kC0nB9X3HO+VCFlENYYO7lf
         7SAA==
X-Forwarded-Encrypted: i=1; AFNElJ+0TqbBk5LGmN87i6wtdQW9PAtRCSu+fM2lb8a+RwoPJrsgk0DlbCvLI2dDMYKSucGA74AvxMwCohvrwW8e@vger.kernel.org
X-Gm-Message-State: AOJu0YzpJfFljL4/eqQpZPuvFASx62h9AXODA23zS0qWWmkOBzpkWExn
	uY3HqMG5hT4gK6HAN70yK0MdRPD8HjY7xdaTE/y48zoTZa+icYUUD0iUvENk6n33z0bo9mn2A96
	7S4RpQO9g9gd5xyuSDEASNGVJeQsLNBbXWbasOSy5dmGm1LRy/hhEDTf+OeH/ntTlkCus
X-Gm-Gg: AeBDiesdWwFWA57x25P4l7ppFobe0M/9aaXc523iLk1b3GznrFjl/K9v/c3OWQbY4hT
	4IXESugJUGVxSwzDN85+CKhiohh/EincgVKv7r1cTcZZoWMOfEaD7GKsSqKAs/cfCJTjGx4AmjI
	CW3pIiPV+YHwy0UxPwd+i3nOdc69zYkELijfRScb/KvAtSSOkfHBGBwW8ie+GnM9O2WgKLANxkQ
	hmhow0hkElMxzB5a6MioxHV45xXKxN7WTnoHtF5TxChrK2/3bdZmu52XqU17lb34390QG17ghuB
	TIxNM3a6MuBOcZzaFvVoqKq8yQ/5rfXB8h6w4yPj96IJNeKaB1aHKmZe5kS2M0bPH8jo9auwOsw
	qKMKMYaU/vs4LxYivJPt7pNh1/YDHzClyasoqZCthuY6bqyswuI5H228PU0lgAoAd
X-Received: by 2002:a17:90b:520b:b0:35f:b293:7ac6 with SMTP id 98e67ed59e1d1-365ab3e6379mr4145721a91.6.1778082997968;
        Wed, 06 May 2026 08:56:37 -0700 (PDT)
X-Received: by 2002:a17:90b:520b:b0:35f:b293:7ac6 with SMTP id 98e67ed59e1d1-365ab3e6379mr4145671a91.6.1778082997424;
        Wed, 06 May 2026 08:56:37 -0700 (PDT)
Received: from [10.204.101.47] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-365b4bd8debsm2886209a91.2.2026.05.06.08.56.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 08:56:36 -0700 (PDT)
Message-ID: <47413644-1c3e-4668-980c-e60f7b8c1352@oss.qualcomm.com>
Date: Wed, 6 May 2026 21:26:29 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 12/13] media: iris: Add platform data for glymur
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        iommu@lists.linux.dev
References: <20260505-glymur-v4-0-17571dbd1caa@oss.qualcomm.com>
 <20260505-glymur-v4-12-17571dbd1caa@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260505-glymur-v4-12-17571dbd1caa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDE1NyBTYWx0ZWRfX7SCfJr5NtyrA
 ZIc2G6yz5XPups/1PhUeA1KLPCC0KrCkxDOHRzlnmrPkkPPiYA4brXKwOQGOVGE1sSCtT+GZ2uW
 yltNyEGzcTctBsA/oxW9SVdtpdOyZKmW4ppiH4oiNB7f6LYE0HOljTF97MwLIXWB5KGZra/XaBw
 JLzzZn58RfGYb5OftAgcPTaH/pcOa60b0CwEFL4L0TA4nFBYKUKWhyRp/CBOJEyeqGwFrEySMkx
 pm2Xa3xvMDmz1LrMqY7FQ8Jgvp32Z92AfELN9z+iPW7dBN0YNIosoVPpcdLfjv296m2PDOYaxqw
 EDXp2/CBagalFbSzz6JUfCm/D6O1WMfih1OjNFFa/8YKgjdeR5uYZMJCA5nWy+Zlkdz0xOqL/Fj
 ewAvkCX9iuVRo012ey5EgEuCGT/mpr+4FhBHv/xRCt3q26RzCg/kNTVWmZivkTKgccitfqes0tE
 wqGhtETPGdvP1dIxL+w==
X-Proofpoint-ORIG-GUID: jcCvuRsbxetV8KXJrzJa8xTctxVNy-d3
X-Proofpoint-GUID: jcCvuRsbxetV8KXJrzJa8xTctxVNy-d3
X-Authority-Analysis: v=2.4 cv=W8wIkxWk c=1 sm=1 tr=0 ts=69fb64b6 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=2SVvIUmmVaN44YnEgAEA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605060157
X-Rspamd-Queue-Id: 9CFAF4DDC28
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106138-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,linux.dev,kernel.org,linaro.org,gmail.com,8bytes.org,arm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]


On 5/5/2026 12:29 PM, Vishnu Reddy wrote:
> On glymur platform, the iris core shares most properties with the
> iris core on the SM8550 platform. The major difference is that glymur
> integrates two codec cores (vcodec0 and vcodec1), while SM8550 has only
> one. Add glymur specific platform data, reusing SM8550 definitions
> wherever applicable.
> 
> Signed-off-by: Vishnu Reddy<busanna.reddy@oss.qualcomm.com>
> ---

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

