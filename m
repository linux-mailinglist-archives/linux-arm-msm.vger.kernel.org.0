Return-Path: <linux-arm-msm+bounces-113089-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mfIAD7KXL2rpCwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113089-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 08:12:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 87568683ACC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 08:12:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="SPj+BG/l";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=AtNjoS4w;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113089-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113089-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B75783002B62
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 06:11:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C6873AEF2E;
	Mon, 15 Jun 2026 06:11:18 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3397A3A5E71
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 06:11:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781503878; cv=none; b=Nz20vEyaIChvKXNBT/nkhPTq3Otlr5a5DvMkYYnlbfDhG76vLgbuPPkVV5ZFmRfLyWxFqKEPmBRz2W7PPvrIZEFH/4yzyLf/XDrcaw6G+PwGBPy7IoJsARBGkcDOCc+UOKNnuzyKHjWtOvp8FLBxJNcXlYPC4pQMtt6FO7DrBAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781503878; c=relaxed/simple;
	bh=fzjJzwjz485Saj6HPlarx9ASscbSys4xUoYsx+i0r2o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a5EXXxCQfYE15ovltIg3ekeylvd10pE6itULXFdX+roYKLDsqnogrO2uiwcddzEyneDxLpnW4LXF/RA8YtQE4FT13KHSdon2MwoxbRx1TfBXwuj8aeA64zZDPz9piPh1YGMvG6yQIzfCE2i15Tt5x79JKGPY0+WIGAJzDdRcnXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SPj+BG/l; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AtNjoS4w; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F1kOTW3224586
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 06:11:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	a4+w07/l4/bmAUktfokBZha649b6R1Y9vFgu2axoyDs=; b=SPj+BG/larudEZzU
	5vnucjaKmg36z2vXouXE2woNUU5bl+KJGjwFEQeLWbhD2N0bEp/3Wmvskp69RhQw
	DQfTWWUu1fGWAuOl8EnjN3b5nNyVCS4hXAWt+iSATUOwwc+FTcElDf/tgNX3OQOU
	lC7pU+67u5inNugb5NzkiFUnYTWTFOnBUoLoDaX5oeeUfWi99weQBANvCpjTEdhK
	GQ0vFwpnLFPWpvxFIHk7KMaoOxaZjn4j1tliv2juY67vkG74WaOfettF7HMGnwsl
	sPBCkF0V8WIU1mGK3tYa3y9LqBqzxqB20DyhCmACPPX2k6Y92BJMuuYs7lGKIWJW
	irfsQw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ery7u5tdu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 06:11:16 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9158f2c4b55so496627285a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 14 Jun 2026 23:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781503875; x=1782108675; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a4+w07/l4/bmAUktfokBZha649b6R1Y9vFgu2axoyDs=;
        b=AtNjoS4w7KaavrYsSApCScvNiBxDdt/Np3ml0yZOgIfJUp9mUg5nGspHxWtKY0MVcH
         xMdSjN28jjzmB2NnBSInFexUPCbyzD3NykdDElGmOCOi/mcarAsYTKbnhyV7NM5JsFCK
         zl47Lpxk2bTNkui8WqLcrpMyPOyW8QSnJlTHZ/lOsXbI2Yv1d4fsjcjIbI3n+RhSe+84
         uGab7TQTrY4/siamAOICIyTJRlBEnMd3dPDlhwHKLbmQTVyk2q8BRb3UvtrNIgOzdogO
         9k5Sx8aOp4tyG43SPK8a6R3vYX4y84gWd7oDHDnjwLWj1NzfmWrn7TLg6n/Z+Ld1KAyR
         S6vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781503875; x=1782108675;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a4+w07/l4/bmAUktfokBZha649b6R1Y9vFgu2axoyDs=;
        b=lO12Y/PXO7pEI7o/YYk+nGtahO1U8A1yKLCOMmgCU0etlfL3rG0LceKVi64qSOqXE9
         K+71VdTlBJuJ1ziXhPyiSaECkscCtHQcx73oWfG3/qou9VfNWV0I9sIybEEuMgY0ZbET
         p3eDHDMBJuB9mgCewu8aKryq3gI51CkPHNsGdxj4N9c/86Fyh6KkdV8nkeSlK0Te7cwY
         8RZg6XHH6qLgo1PiJKXBEyY3jOh3aR+8//yGJu2Qt4xSFybAjBAZOmVGm/qszepEtFx3
         iqxU9ppN06FEDNpuvp/WVNjnxL0zVsmk4lk1XE//+GUcfzA2UtWOn4p1xOx7Ha991Zrn
         p7Sw==
X-Forwarded-Encrypted: i=1; AFNElJ8ZAy+hqQa1mnjZmG83LHoZJ+9f/+SNqeworzT2s6tDoqk1ktEDX9QBGBQGglp80Mmame8P14okaj05nYhr@vger.kernel.org
X-Gm-Message-State: AOJu0YyH6D8OaQ3wh28OEJLjoHVh2zevL9HBVXIznrKzUfnIWjKSMoHE
	PbecCti794+WXGvxhI12jlKJR0Djb8yVCNSLRSCOxvtvco5iDuGo+d0YbwWcoQydj+xSGQOXLgl
	UKLchye5NTb/ds+eCCJe6f+TI8xUR03Ao7xVgl+51UEE9nD0PGavfN2p6ZRqOcyui6hGC
X-Gm-Gg: Acq92OEwJAzh1eV8mmIlxN5Llj6L3IzynrUt88YH1YGeRJ1nodobD1zohpVZJHchzU0
	WT29ACUcQUx/6Kcwwui9TkGUWWbUDIXSsK5ehvLkRui5uLw60Sfd1qM29CMjFPGKdMyMY4gC+tD
	+qF9A0zQg2ri3H65ani65xgacl8VK3vkeeS74IDXsYBojc1un+L6Tkt9qE/igIJ74FxCXH+BD8O
	fhawYF9mLfETQAH4R5qAOl45VoSxovucGbzbFeNR8/zwWgLWDDd45Lp4JXzUZs5gtUoku6mC+6D
	re/T2WsJdI22Xkg/GzcMj3koByRLy6KM0mjfLldPuHlcMooFa9uKojCSB9ApMFOy7VMfhUyVKWO
	pMj1dYhvHdNwpqWhPWZcyIWmS47TkdqA0JEIYEMfrgHNgTwLMw5fB/6SH
X-Received: by 2002:a05:620a:440c:b0:915:9de3:226b with SMTP id af79cd13be357-9161baf7dc6mr2006476585a.18.1781503875492;
        Sun, 14 Jun 2026 23:11:15 -0700 (PDT)
X-Received: by 2002:a05:620a:440c:b0:915:9de3:226b with SMTP id af79cd13be357-9161baf7dc6mr2006472885a.18.1781503875073;
        Sun, 14 Jun 2026 23:11:15 -0700 (PDT)
Received: from [192.168.0.172] ([49.205.249.212])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6937919b556sm2791009a12.4.2026.06.14.23.11.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Jun 2026 23:11:12 -0700 (PDT)
Message-ID: <a0a74410-e729-4e82-9fef-d72115bdd801@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 11:41:02 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/16] media: iris: Add platform data field for
 watchdog interrupt mask
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
References: <20260612-iris-ar50lt-v4-0-0abfb74d5b3c@oss.qualcomm.com>
 <20260612-iris-ar50lt-v4-6-0abfb74d5b3c@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260612-iris-ar50lt-v4-6-0abfb74d5b3c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=F8BnsKhN c=1 sm=1 tr=0 ts=6a2f9784 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=1BxbLvcILuCGMxPr/bnfdA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=sQl9ibgnB-ql-ZCiWtgA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: qsugrQ3KbucRtL9kh-o2IAmRn9S45EaG
X-Proofpoint-ORIG-GUID: qsugrQ3KbucRtL9kh-o2IAmRn9S45EaG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA2MSBTYWx0ZWRfX72zqb4eBHZcK
 eeRLtsp7+zaxNfE2gS26OEL/yGHEG9Umybpb5V1OGA4s85TdFCGDtbk3qtKj5IL1h+CJ2v0TlH4
 +PBAcltPle3h2y3h0LEe0Y/bVtej9mteGsIvM3GvM0PcFtH+TyEE1X0+famkQ2jF6Uswl06CI3Z
 bLnN2jUC9N8mTj5pawPgO/izGhD7hjA2rOH6Yi62wuGGhiCe6lCUt7ycIfuUOv+95vWXukPErNU
 DMUGGDCClqiz5pHIwnogdGZ+FQxCSdRweSmv/zMHZD0fEDY7K51NJVe2A8MZ3CDHrbVjIIJ6lAa
 nbEuDIjLwB6cs3xmBh4BUDHpQ2OMGlfgFp8CznlEopwn1qfEdAhgTniYb6kvB2V/1pZMtDHZrTY
 JHUYeo5eYDY5pFJb8vjSiq0JCh1nNy5pFnLjDJ1RfOpIZRpqI4VN4sIwOYyxQEMP4RNmKjA2FE4
 lEm430CG2iHnSr1A17A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA2MSBTYWx0ZWRfX0VRqSQQ7A3ny
 Q7jCqHO0WI/fOD4BZu0sZSRkWrLfbj3TjsDzMq9EmIS73ggzvJh1JEp3MIQV9kHs1DM9E+ZYEBm
 +1h2i8rvo5v80BfzPw2x6DoB9g+kPYw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_01,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 phishscore=0 impostorscore=0 spamscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150061
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113089-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:busanna.reddy@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[vikash.garodia@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 87568683ACC


On 6/12/2026 2:55 PM, Dmitry Baryshkov wrote:
> From: Dikshita Agarwal<dikshita.agarwal@oss.qualcomm.com>
> 
> For AR50LT core, the value of WRAPPER_INTR_STATUS_A2HWD_BMASK differs
> from the currently supported VPUs. In preparation for adding AR50LT
> support in subsequent patches, introduce a platform data field,
> wd_intr_mask, to capture the watchdog interrupt bitmask per platform.
> 
> Signed-off-by: Dikshita Agarwal<dikshita.agarwal@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov<dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_platform_common.h      | 1 +
>   drivers/media/platform/qcom/iris/iris_platform_vpu2.c        | 4 ++++
>   drivers/media/platform/qcom/iris/iris_platform_vpu3x.c       | 6 ++++++
>   drivers/media/platform/qcom/iris/iris_vpu_common.c           | 8 +++++---
>   drivers/media/platform/qcom/iris/iris_vpu_register_defines.h | 1 -
>   5 files changed, 16 insertions(+), 4 deletions(-)

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

