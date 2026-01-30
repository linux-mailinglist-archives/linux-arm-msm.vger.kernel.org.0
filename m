Return-Path: <linux-arm-msm+bounces-91220-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YKypK335e2n4JgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91220-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 01:21:17 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D11B5DE9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 01:21:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A9C8D3005310
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 00:21:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B12C827AC31;
	Fri, 30 Jan 2026 00:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bELdswTa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iBnEP0bE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BA19279DAD
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 00:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769732471; cv=none; b=LtYY69TW5i6UajRomlntbkDETClw0WdvkJTcxOIa4FEDRwMJxZN7tu3KAiI1sg6c1EWOvAqcTU+93d3agf854GbJ+ENGI4XV2DlfvsY6wHY/BX2WVtHvTSzqyNBmylcy3wBNjWyIV6koVN01pSmV2fRnOGzugj3XutSD9HYWTS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769732471; c=relaxed/simple;
	bh=nbJBIm15Ji1XwKk/v/G/rXONVRy1EyJBStzCCuIeyac=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ufUcsxGLlmHw3PG8QLhPifN3mgyEpDMJaHzzsuHWE9fB066nwcR35xaH3iI854/uobELhDy9f4PKMfIXBTei3yP7AU7eiRVivDVN/Ni//vK/YjmXGHAnlt2mMBLdF2kS1jafsH4uHKPfZrIlOoOcrSAeTv1hYpa54+9/+glfQSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bELdswTa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iBnEP0bE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60TImjeI1036637
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 00:21:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iRA2nAXRxz5YrufMBs5S030c
	Uo0x/I8unim1ur6B/e8=; b=bELdswTaQxcWnLmEgsaDIWLX1MYVNkJcANsO34FF
	DecrEX9YtKlVy63Q9m1pe/O/RRTXs1u25UNsVS4iKTj/MOzrkL9ffrc1VqyLm9Pf
	QOXiA8bud6NKuQmX1j53bbmYi4JJaGJIZHsWvp1ev3cEGBpBDVFX36SAK1jgftep
	n/VBE/vQX33x82LdgBJe9fc1UVcqivvcnyaMPGNZZi5p9AbFls+J4spcr4b9+k4M
	8fzWYHL4Y67BWWfDBJWmbVL4u6YO5vdJ8A4tCl669ywfGALaJ28JF1ccIWcZbgYO
	zvc/hqBndqBgGxW6dgFUkdi7GF98JZ9/kJ3RdRQAxp5Wlw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c0d5frspk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 00:21:09 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2b795cff830so8869547eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 16:21:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769732468; x=1770337268; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iRA2nAXRxz5YrufMBs5S030cUo0x/I8unim1ur6B/e8=;
        b=iBnEP0bEyja2nF2rOAr/+ktobXHn2gXsa6jeds+ZONC7OshQyo3I71t8y3w6+OWLnm
         ddDueOOopWky+pfVzCGgL9i0pGIR5fTJsU1T3o9yCJD6qdZcI4iMWJKdGOYvyS/RkDUR
         qgfTk+SxWgUDPfWCZop8so+jTNhve0EES+V3d1/l+tnq/cLQjf6Iim1uC7qEr/mLgBFg
         mlMpY+IjqAIqXLJWA+zY212Zrjl6CmPVCUi89HKw3T/ChXphKS2dXl+wmewsY/4UqzCD
         paKkmkczQP02/OxFUN+kjqpA8S/d2UGqVWzvHDp5GbySrUQDbSN/ECwCLFZehC2UOpr7
         PeGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769732468; x=1770337268;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iRA2nAXRxz5YrufMBs5S030cUo0x/I8unim1ur6B/e8=;
        b=BeJOoktckw44f4YWIfiJG1HerVuMsao8b8IN0s3omOC0x5Vs+IZN9zO+PTeaaT2WrS
         o/+0V9/WOQPeaJBqwjw1xpukTqHihL4ZJVacBdCmc9HNwl95PE3Dk45pUT+pk5vtZ1ao
         jOn6i8DCur2md2D0feFWJt/ym6iPtngi3TpvVt3eSIDZxHv4mtg5kZjFKSw/1uXrCE1B
         2UOhsKgrb1XU+DyT60iMcHsCZRsb3bXDFj4LZdQW0GeAJZS6yPndqB6Fl+iH96O0qjOA
         CikYy6GMGcY7MI6Inpyh3pdk0H0mToT+y4PbkEFQtTWLKl1TtwqcOWjGiEbioKQ/d+Nm
         YT3g==
X-Forwarded-Encrypted: i=1; AJvYcCWL1W4Y6dl8uPkY9v74hWetr1HyaxqodHc8RQ7czzOTnMN8AxQOvDFX1DHlT5GDCETySiLou5MyBN5rn9TR@vger.kernel.org
X-Gm-Message-State: AOJu0Ywwv26WCr3jdoHdtI+ZsvtzzqxZfXiWHZHNVHRYir28sZVQpxsY
	kaqU4V9SCkicF1V+xA1HjU+WxEA8agDxnDfCr2pYVv4whlq4HDJfNBTUer7MOAVU21yfrvJXScb
	b1omjddf4jkYviWweWepkASiTV6W9gkpww0bQvp4139TV4Ykb7E+anjwGw3o5LCEjhMAY
X-Gm-Gg: AZuq6aKywkFegkJai0w5pdd/al6ipVV/hDn3IIZ0dJRtMaNUHlIMgdTN9heubHMtUEf
	iHEQgqYIeWsbaXYGFXqZujEDeAO+B0BHqJF9ws5tplhfJVdQn+E6jkq/4vVHmuWffoyQF7KVEkv
	VLBV5gwDzXsZznh1XjUs5RRzEUmfNpscM0ygWq9isIoYlzqmJ99gVKwsx0BxZqRMzIaRJNzRUHF
	czihHLCmVGLzQDkAsAkFN4Jmdpl5pbHWwTLWuwZoN4VQ+FdtwPDVXOPiRxBlM1HKDHqp/UqPhiC
	MHpIdX6Ubg132l05AisT/0WLzg5N06FkmxpkFdiJf3M1wYH4g1rJNdGQN4wdxlwUzU8wdfJTW53
	cU83Ako9nHFkfbr/pA2DrVB9aKUt/4wUz9QkSZBEj6M724PCEw1CPIv+2nNBp7Nk=
X-Received: by 2002:a05:7300:f193:b0:2ae:53da:9787 with SMTP id 5a478bee46e88-2b7c89507ddmr453390eec.40.1769732467871;
        Thu, 29 Jan 2026 16:21:07 -0800 (PST)
X-Received: by 2002:a05:7300:f193:b0:2ae:53da:9787 with SMTP id 5a478bee46e88-2b7c89507ddmr453378eec.40.1769732467302;
        Thu, 29 Jan 2026 16:21:07 -0800 (PST)
Received: from hu-clew-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b7a1af8ac0sm9018117eec.35.2026.01.29.16.21.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 16:21:06 -0800 (PST)
Date: Thu, 29 Jan 2026 16:21:05 -0800
From: Chris Lew <christopher.lew@oss.qualcomm.com>
To: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org, corbet@lwn.net,
        rusty@rustcorp.com.au, ohad@wizery.com,
        linux-remoteproc@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/5] rpmsg: core: Fix incorrect return value documentation
Message-ID: <aXv5caIoE7DXMlP+@hu-clew-lv.qualcomm.com>
References: <20251217065112.18392-1-zhongqiu.han@oss.qualcomm.com>
 <20251217065112.18392-3-zhongqiu.han@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251217065112.18392-3-zhongqiu.han@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDAwMCBTYWx0ZWRfX3d4ExzhDAwlW
 OKUvRa5LYYC9326c6y4OfYVk2L6jZo2uiWzT1KGrCFgNyBR143jd/Hsnomx/wd9AwSnnurgT1Iy
 VMcrLuPcOuN7rmV17NxkeVDOp8gKj3kMjTpMRR1qZk41o+b9ypVysUSb/zgZ5fPc7pwPRL7qWas
 O6Uibr70hlvhJs6fskCkMT/jx4iBvC4lvLFAGVoOAQEGzFoptyfNmynhRYexueukCaKxG0EBXSB
 kXf+w2lc9wxL90E+w7ItzXmJ0F7vk/Sytl+rG6Z1wLEvwZlgpu/9VNPX0iw/+yrZWotOVMjLBBC
 BlE1TKvBXU3FueoQX+BPOLf2vsWin3VeJmo9GlO6Ch4CMKTIJH7saEQbZgE+i0wxT6a3B3ooft+
 Tkaqc622AUl4N0QK+7B2hGbSnMOsSUlfGUvLPG+u0UHLaSBYk+Ob+Z/ZKdXqIeDSsnoCKFu3baK
 4sEvDKbJH+xzpnsQQ+A==
X-Authority-Analysis: v=2.4 cv=U/6fzOru c=1 sm=1 tr=0 ts=697bf975 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=QRj5kXCQZoiapl6m6psA:9
 a=CjuIK1q_8ugA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: KSwhDX6ZzJ-DuQ52QC_dI1V_ALItK28k
X-Proofpoint-GUID: KSwhDX6ZzJ-DuQ52QC_dI1V_ALItK28k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_03,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 impostorscore=0 bulkscore=0 spamscore=0
 clxscore=1011 adultscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601300000
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,hu-clew-lv.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91220-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christopher.lew@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 05D11B5DE9
X-Rspamd-Action: no action

On Wed, Dec 17, 2025 at 02:51:09PM +0800, Zhongqiu Han wrote:
> The unregister_rpmsg_driver() function has a void return type but the
> documentation incorrectly described a return value. Remove the incorrect
> return value documentation to match the actual function signature.
> 
> Fixes: bcabbccabffe ("rpmsg: add virtio-based remote processor messaging bus")
> Signed-off-by: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
> ---
>  Documentation/staging/rpmsg.rst | 1 -
>  drivers/rpmsg/rpmsg_core.c      | 2 --
>  2 files changed, 3 deletions(-)
> 

Reviewed-by: Chris Lew <christopher.lew@oss.qualcomm.com>


