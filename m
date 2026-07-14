Return-Path: <linux-arm-msm+bounces-118943-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fDaxN13QVWpGtwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118943-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 07:59:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A392751486
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 07:59:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="oXPJ/Tp6";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Q3EbI5LI;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118943-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118943-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 74DF3302B3B3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 05:59:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 614A93D3D00;
	Tue, 14 Jul 2026 05:59:53 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1200C3CF96B
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 05:59:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784008793; cv=none; b=CiQOuKDUWTp4OZ3UmTUBoZYWIKsLgTJvLSnUj70vvf/9SipgFbce5TQ17MkhSaLQvGT83vDzZzuUvtPtpspbkV+v7JYGS7X/ONT1JmbxK40sYbFOWvN6rYdgDZjm6yXrHzrgum9mRv3veUVDCgM0aglGrFU8RJjOtEkkXoy8VMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784008793; c=relaxed/simple;
	bh=HkumCUVbEM+FuIoAvK4ol7dslBReB0TDdKD9LW/ntog=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jDvS4LDBIQSgmVbtMSdUbZsqggGJn3JyRKWDAsX8bwInEXAnK6TaAT6zOSuc7KryuPwDkei2tD79qSIg7JFwqUnBskY2oMoXKpL37YaAIkPGNI0+h6vQ/l8M15XcGyELnd+0yFI9Z71n/pAUGQJh+V6vXShOhaVhSG65rB053BI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oXPJ/Tp6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q3EbI5LI; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E5DXoa3455891
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 05:59:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HkumCUVbEM+FuIoAvK4ol7ds
	lBReB0TDdKD9LW/ntog=; b=oXPJ/Tp6/ShKP6DS62y1kTOGHUouVgAVjVGD5hn4
	9g03HuRAI6hfN8orHUmyR0/c1rI2FB5c47KqTa+FFgsdaqgqZ6yWOd2hpNUJEPgL
	okz4XnbsJlzS/SOLui5Gs0cfXwUMkdu4mfbJBrH9G3UGvyq2896EnqeZ9KixhAIa
	+jOGDMUUTsLqw7b6e6ijxJZA5CqwXSYXA0MAToK8Y/ortUy+XxlZKuVBGU3xwADT
	4ddTeQ07Nb4wvZY6ufkfe8ZIG8APD7xzR8kEopPEeJu+LIVkzSMKI24pF1OjsGgq
	cAHEItiZ3DjB0+eG5m9oOiyFvZgIa/INTc0slxAhFzms9A==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdesa84yr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 05:59:51 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3811279d51aso1237408a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 22:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784008791; x=1784613591; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HkumCUVbEM+FuIoAvK4ol7dslBReB0TDdKD9LW/ntog=;
        b=Q3EbI5LI5VuUerzTNQrrnuUFmiyPDnyPFFQ7oPMqEADtReowueI3mqM2o/6/9S9xAU
         sa1O0h8KS6hyp1i40um1/BZ22MTcP3zf1JYMP7uaTi4kEj/u2Z1Y2oLnF9nJYEenT6dP
         ANqgPXZthmZsLPYrzEBdVayLnw8GAqopfDWvFTORTyuv0h95yGfhKFicsFem/mHJCB7R
         FLH1DL4ZZJfUDkWzfLe7WFTTg9fBp0471BzYTfVJhdir7VHrQWgeQYXnFgtGbmMRo32+
         exapHfrTKl+jH4fe3hu4B4KWpZzfGDYYGheyPwx9TQzGro8uB8JdkG/aYAqKphaHUcZ5
         Y0oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784008791; x=1784613591;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HkumCUVbEM+FuIoAvK4ol7dslBReB0TDdKD9LW/ntog=;
        b=ARijOg4sBmqwOfoJF3WMDOBNATpHQw8CkdtLYrwuxqI7PbkU+dB/vrzjhqMrdHh4Mv
         03Y/qahdmruaO4oCIZ2xZXuSHNTAY6pJXifCqmIcf0gNzgJZHlTTQHuGTggM2ncl/mWG
         bK7LujtDmLXDTHvPPAaLoNFv2NmxzZ7nAdszxKFDFFM0Yjqsi2Q3GYFSwk/eSJfqGVPP
         gkW3lsBXY7lgw7/jvVLEb2699eVnok0a6RqsT9w0IBvSQPs9WV+9khmvViEqO8j7k1gk
         Qg/l6cZ1kSxEyt4bC9dfL2eVlm5/CGnRk5+wA0ktrNz3BryK9wFNxH6k7Kcs1YUcAKhv
         XOng==
X-Forwarded-Encrypted: i=1; AHgh+Rr6OrJqNcgqBTmFNTzEQ09In08Ihk/lmvde5u3bfxmQqVrtRF7C0Y98x2x7rRI3kpSFB3W2MoY0MdgKxWnb@vger.kernel.org
X-Gm-Message-State: AOJu0Yzow68GLwRdFZtRGWqVTx47udugCQrY6aTqOHdCVFO1xsiyAaZ4
	IypcH4f+4GVgt/Eor0IOTtuuwBE80nnRh2xjL5V5LG39dSKE2f7T0DZ/KP/xzBmzmQBnM8RiiiE
	mu3UVSm//K2PObuFeuSvLlsgr9RXoWoxMQ2KSlRyVXkolBW7NPgwLSIbhWqPaBV5bbZtm
X-Gm-Gg: AfdE7cnMGYvK9P2K2oGn3Xm3AqhGJRmq7E4X+wVTrezhD/tgXnsHaAjCbl1v1g26/M7
	3EA5W2Wdy42MGA5nQXnbCM/ocaDZR5hNuNAkNj2yaaSAEIAZGE8lcK06MN/7alIntMLnZHZR/Vy
	Z5X5tSX4dU1UbWchNf0Wta5nKrdzNaPAeaepJapVmCx5+Lnfwhh5Z/0wf5l/8eHfvfW86KwEMES
	aNbAKNef/HZ+VklEYPLkVF7yiUkc84MQEn4/31AsYXnfX9ubbplk/tNRVTfEmEzl5d65xF9nU38
	Ebj17u307uRFtA2a5TBdj3XkArLzndfETEEjZxRTf9uXAtMpCSOIPZ0dSjRhet2dO3D1YasVulc
	I1BpEa7uVv+RzFcKcNTa6kZD+5h8y9oIy4LaMMlWDRZmGifNLHzQffRgeBpxEuv8/cfBPEV8Ahw
	ZrjPPGoiGnQ8J9fFJKqcoIZJoPN89Dl58jOiaqSXw0
X-Received: by 2002:a17:90b:180d:b0:38e:120d:df09 with SMTP id 98e67ed59e1d1-38e120de0a5mr3507988a91.25.1784008790657;
        Mon, 13 Jul 2026 22:59:50 -0700 (PDT)
X-Received: by 2002:a17:90b:180d:b0:38e:120d:df09 with SMTP id 98e67ed59e1d1-38e120de0a5mr3507957a91.25.1784008790175;
        Mon, 13 Jul 2026 22:59:50 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3120c8e41fcsm42435539eec.15.2026.07.13.22.59.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 22:59:49 -0700 (PDT)
Date: Tue, 14 Jul 2026 11:29:42 +0530
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>,
        mathieu.poirier@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, konradybcio@kernel.org,
        manikanta.mylavarapu@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v12 0/6] Add new driver for WCSS secure PIL loading
Message-ID: <alXQTswtedKG8FOR@hu-varada-blr.qualcomm.com>
References: <20260505102310.2925956-1-varadarajan.narayanan@oss.qualcomm.com>
 <e6311e97-0a26-4412-bcf0-d0313bf52c01@oss.qualcomm.com>
 <4a4e0e9c-8541-4fcc-8019-10a576840109@oss.qualcomm.com>
 <alAEKQzBXqjESAbo@baldur>
 <alSIffOraVCzfboW@hu-varada-blr.qualcomm.com>
 <2ddadbc0-0d67-4b1d-bb49-87c08172b442@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2ddadbc0-0d67-4b1d-bb49-87c08172b442@kernel.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDA2MCBTYWx0ZWRfX3SMK8VJtO1qM
 bJkkkdsGG4ETtS5jCkjuqGdm3rpvCbxF59g7Hjnm+zQSuOVVkRqpNfpmAlkEF+7pibmdBlfCPwX
 EsJW/NBghEiQhUUMEonnouPoP3ZWdfk=
X-Proofpoint-GUID: Dml5ta-Y82puoepjd-Xh31Q0gPzbg6Y9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDA2MCBTYWx0ZWRfX9Pd/DWVrzfJj
 bu77CeNfL6gx1W9/ns6POKXbnVpkiiSdmWcrGPYG4LsHz8PbJCHkNMwA+F3ixmhkG52dLLtksAL
 WKs2f3O1RC58ji4ACytJMyFibI8HoqasRcZvtfDYaN+6PyqEEJbj0oBkYBiEcY7DKT6Tr11QIRn
 RhbCo5pW8kOqPnddYh9M5sJylvxQR/mAfuUTviW6loN+QZwYzsEqWaNuUdozC779lmkhjGFt5nh
 vIaWj/pbV218KEw6+yDIyeBS00U0KZ93Xl0GRDhVCuudikzKXSrL3sBYlVUo3toEvDltkBbDH13
 hnI6709eq/RYo38TRUjY4xEz6j95B5c4BQ/Df8ShBYza6GpSwDZuzEntuOajEooll6Ivw+DfVQk
 1+FJztoZHXCM+BWXSSuhbigKcvft6SSsTCnlalLFg4PhLyT8Gg2n4fN0yYFRx7WUojmFB3GcTOp
 1ilz3kq3t91iT0BaH8g==
X-Authority-Analysis: v=2.4 cv=PZLPQChd c=1 sm=1 tr=0 ts=6a55d057 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=LGtRe-3Fl8CQACRa6QgA:9 a=CjuIK1q_8ugA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: Dml5ta-Y82puoepjd-Xh31Q0gPzbg6Y9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_01,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607140060
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-118943-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:andersson@kernel.org,m:vignesh.viswanathan@oss.qualcomm.com,m:mathieu.poirier@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:manikanta.mylavarapu@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3A392751486

On Mon, Jul 13, 2026 at 09:57:16AM +0200, Krzysztof Kozlowski wrote:
> On 13/07/2026 08:41, Varadarajan Narayanan wrote:
> > On Thu, Jul 09, 2026 at 03:31:15PM -0500, Bjorn Andersson wrote:
> >> On Thu, Jul 09, 2026 at 11:25:17AM +0530, Vignesh Viswanathan wrote:
> >>> Hi Bjorn,
> >>>
> >>> Could you please help review and pick this series if it looks okay to you.
> >>>
> >>
> >> Sorry for not keeping up with this corner of my inbox.
> >>
> >> Series looks good, please rebase on the PAS changes that should show up
> >> in the next linux-next.
> >
> > Have posted v13 - https://lore.kernel.org/linux-arm-msm/20260713-rproc-v13-0-41011cbcda3e@oss.qualcomm.com/.
> > Please review.
>
> And v13 caries fake test tag and FAILS the test actually. What does such
> test tag mean if it was not actually tested?

v13 was tested to ensure the rproc functionality is working. Missed the
dt-bindings check as that file hadn't changed. In future will check
bindings for every post.

Thanks
Varada


