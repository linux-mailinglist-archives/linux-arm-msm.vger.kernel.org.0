Return-Path: <linux-arm-msm+bounces-117760-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JE5vIgF0TmpENAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117760-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 18:00:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF0D7285E5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 18:00:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=dWMuxsfp;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="iMRO/ZX/";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117760-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117760-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CCEC43122A58
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 15:47:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5650141CB3C;
	Wed,  8 Jul 2026 15:47:21 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDAE041CB3F
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 15:47:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783525640; cv=none; b=h8vbbmRJCBNeYMfUNR0yjkfHqKJaISwYyxed+vrHR7CSS19y0oKLeCiBmUmJjpVnDOB9lMuPADb2ZlkfEyZr4HZ9vnD/BDuKF3HcOb69rbIrT+hbH2zZIP/gtiAqmpNy/JOaJuUFIClp5t/ALnRPCtu+XneK1QMHsp6kwUfB8Ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783525640; c=relaxed/simple;
	bh=Ay+Ukqa3pzCDaC6oLtgtPlXNXQzu2WpmsfhmZGnE6tM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y0rsqiiaG5ldcSItycA/Q++roGY07KupgXKumf8ntd6yQonGfd+tR015OvyXIvbkQP3NPIaVFiq5h0Zt/QZOCjeC+yfS6XIl/I3pKkLSA7zz3Uqu1Lft7PiRscQ+o8sl8v+kr543KuKSDWOln0JoNLoutrncQtFcjfJp+fsSV7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dWMuxsfp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iMRO/ZX/; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668C3j4u2759369
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Jul 2026 15:47:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=sx7FMxQAqFR+iHVGYKMVEDh3
	O+yKM78hrnZrIOQBhoM=; b=dWMuxsfpjQaHeGXIcIx3SxqfZmvh8VPG9GXRb70Z
	TBNsC3thjdWSizfnvIFg0vIzQFVWwcqmbKL9YGjkyWfMFp87TOumsX75ldtTmjFT
	6kdUUHKG5fqQcAVwErxNoglDiCpJM3xNmItMGGWTmSVGlc3hL6tCvbFq2CDFLLyN
	Kvvh2KRa0OwafRfBCvj1vX4ifWUJmGGMtBnpHFD8a0jwFVaSQFueCIqpJTPdrkxS
	V0tgtPhGW5J8yFYNh17KQkRETDs+wEis2UIQkgLlOL7+AbAjgX6N5xKupnHsHrO1
	TwjTYCY2mz0ijzRbTJqSwwMFM+uHioQyby620ip9P/BtgA==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f95e5w983-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 15:47:17 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-9674fead9e3so176081241.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 08:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783525637; x=1784130437; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sx7FMxQAqFR+iHVGYKMVEDh3O+yKM78hrnZrIOQBhoM=;
        b=iMRO/ZX/6Ue7VNIw2j2TMbx+MIiVuy6szYgIBUQdkfIwDvbZXtXcUIfwyZnhFbO18i
         QI0KzLps1ARknRfUCUHrDvJuISZ8bgPLM6K8w7RP8H0DS68rKiC0HTuDCfr0YLLOJWiI
         igK9pYz6LMgMMQi7WfmT/xQdTMGuiXRCK8pfk68NBnQt8TtZyqy8tKc34cSSx/jSwKtT
         389doBjEiJ6DD1KZUwWy3sMQrEG//AEJL5q4hGABipDpCFB9UP7BPzgyzwBH8F7/YQJk
         n8I3brUx6/Q1rNaFSP5uit1EcCDjbB63O2CMxb/Wh+6N7PoPAtu0QBmVamNEsV656nWR
         TZzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783525637; x=1784130437;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sx7FMxQAqFR+iHVGYKMVEDh3O+yKM78hrnZrIOQBhoM=;
        b=egjbG6sJU3JEWkKFMQa8JNnXMjAp7MeI/hGADKKYmha3+PonI3L5Q3aBpxGgTo0Bau
         UdfOxhJhuI+Rdh8BPOH3RGsAuOoTBkwdkIbn9zpn+2BSaDdoLP6v17R7VGtZnZosCCJx
         iUrvlzxi+9dCUcYd0D7dKeqR9kTTWexKr8Sq287yE3aeifyCPDEMJb79aSdVZ9X4gQWw
         aVkVIxh/JQMZVxhi2Uz82afmbyXftjx3XXnrdNuWVrgUOmFkHomqRRr7Ppmz+9m0njxr
         /OwhzB2PF/1qB0W9WsHS4YIZZcP6z8U7qY1oJ3fac+2A9CoolnQ59iUK4/EGs77FCGyR
         Ai/g==
X-Forwarded-Encrypted: i=1; AHgh+RqcydZ8hD5fYzPU8v+eDN2NmvBKgzuiBXkAj0ndYpdKqe7d5nsFRiirwfrwovYhFMCPT1zmIjIjwASW7bbu@vger.kernel.org
X-Gm-Message-State: AOJu0YwxrhAG4QU7TPH47zJE9p4XiOD51kdlXWCEyu3ACxg34aM/rBsZ
	5bNUcqfRLp860mNKp4hm7mAc87R8WsbVJxCXOwVI6DoYy4Kb9PzzaZCGe5b99WrQSZTFbExkVXg
	voGNdwtal3HcLc7KHOmpgrCCVa+ECy4zg1G/R7AkgMgfmJGFdP+ye6zZzLGo/fVSAcbZp
X-Gm-Gg: AfdE7cl0WRdE5sKCPwgBbCI+f0Wqm9aXldql8e43kR3b83xXkQZSx3DC2eAMlq66y8C
	TgfVM2EZ0IgrqcC0eGtSR4d9+/s8KQcQa+EYH6KzXYYcz9R+lLGj1fo/ccB1NONQQjTQj8PHK29
	+5GsNSxDaST2DQJfyHBCp/vcLImMpvCF3VKRiIqyZDcGHMPkqGiKWEaiIsuQCtaPja25tJ75TWh
	DGkMe5Y3MMrp7bda05ok1xYDGq/iQo+otuUVPhig2Wgcew6TyFu/NWmQeWUtD7JxllLMJ82Nhf3
	tGyrysEGyL69EuQMVfxLsSWiGBZ3gfllV2LC2+mXnHpD+WOqIdwztYujsxcOO0KL719i9bx3+aG
	ANrkSP2RKRnER4ol7J47+bElaQkZ3XH/VH8T3PQUjHwz8DLMgxoq3UaYVMTYU9w7VBGnoMW4UeX
	KrpHHtgzKIw4JmDaUCEK2xvffx
X-Received: by 2002:a05:6102:5984:b0:738:be73:55e0 with SMTP id ada2fe7eead31-744dffae44emr1608161137.12.1783525636299;
        Wed, 08 Jul 2026 08:47:16 -0700 (PDT)
X-Received: by 2002:a05:6102:5984:b0:738:be73:55e0 with SMTP id ada2fe7eead31-744dffae44emr1608142137.12.1783525635802;
        Wed, 08 Jul 2026 08:47:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed136f8e7sm4659097e87.15.2026.07.08.08.47.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 08:47:14 -0700 (PDT)
Date: Wed, 8 Jul 2026 18:47:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: monaco-arduino-monza: Add GPIO line
 names
Message-ID: <wp4u6kmfjekku3ug7andsz3weyyeqeqxulv3btedou37jhyxie@4x6ncfiqqix2>
References: <20260708-gpio-names-v1-1-9162105b9971@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260708-gpio-names-v1-1-9162105b9971@oss.qualcomm.com>
X-Proofpoint-GUID: 4yklyETfNZx9aq5BjWnwmFrcSMXr-kTF
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDE1NSBTYWx0ZWRfX8z++rhiMWz8j
 8W1of03vuRkIuGIoY1Qq0eJrwxk/MN1yRDWMZzCzkHrl1cPfEt8I1vsDW3DyipDkilAVBGS6HPm
 QaAw/5VRiEtpDvc5KW5qxctjfyczyWQ=
X-Authority-Analysis: v=2.4 cv=CNoamxrD c=1 sm=1 tr=0 ts=6a4e7105 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=F2uzNt_Jvis__oCUEkcA:9 a=CjuIK1q_8ugA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-ORIG-GUID: 4yklyETfNZx9aq5BjWnwmFrcSMXr-kTF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDE1NSBTYWx0ZWRfX6sxi4xaBPy3E
 MPrqntEbvz/1xoRu7tbiVJ3ZtxFHOm6AiwgalRE3cfE/+23mEUXmoQu5aOd2oeJUd2XxbcTYDmy
 PlMPBaJQlLGfYQiAWvqCJRTlHx0awcozrQP6FoJJpKNyBpl7+shjlkdPf7HUy/RWonkL6hbN7vx
 7jOh0G0om7bxWWbjg3n/EWk9VYJPS2erDFzgXEob2iJjkteFlyJsyWI/5xOxKjMB3I9zsgxsLTR
 AA13dHlhavDUjQJVxqzAApli8YJWzJwngnUvnUv7hv28ES0mHqi9Ihk1TF8K3U/4tbtSfoTc9Jw
 56KcKaqI5ojthvSUK5DQPPvTTSFmCNEjoIY25fLg0NmCnqWRhdgJord2W2atVRQC/M+03GsLJQ9
 IveLSDrgvs8SPFvtAVLEeRqobYiOOLKzHdEXJj6Mkvz5DSdnlC/l84TCqbgSntRQSXYPZulXuI/
 caPnKJPA9s/WEbf4iIg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 phishscore=0 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080155
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117760-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_RECIPIENTS(0.00)[m:loic.poulain@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AAF0D7285E5

On Wed, Jul 08, 2026 at 05:34:21PM +0200, Loic Poulain wrote:
> Add gpio-line-names to the tlmm node to document the PIN functions on
> on the VENTUNO Q board. This covers the different headers (JMISC, JHAT,
> JOMEGA and JCTL), the flat connectors, and the SoC-to-MCU interface.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts | 28 +++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

