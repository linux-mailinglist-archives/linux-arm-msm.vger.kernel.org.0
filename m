Return-Path: <linux-arm-msm+bounces-111679-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fx7ZKVFbJmp/VQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111679-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 08:04:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B77E9653034
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 08:04:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=JrglyURu;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=eu37J4I0;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111679-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111679-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 010DD3002D1D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 06:03:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 259F1385D77;
	Mon,  8 Jun 2026 06:03:54 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE7E9384CE9
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 06:03:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780898634; cv=none; b=LR5ibt6fVlCFqFy2VmMh5MGgFP4J1SdeXrIEIX+C0W4r+Q/9n6/vnZ6lVHbi2O/obSq2O1aZ3WfJgytTYprya4iHQ6KQawLjv11uPosPzk8bDOavdfjTsVQb0d7ZD0pRu+9GMjulcBOxmk9jLWPIEKa6kEIQGRUkhme5YwMaJRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780898634; c=relaxed/simple;
	bh=D43F32dRLsEtsZfTnH6PZw0SGhlJcijecdkwYHf7fmc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VQ+cdG66eO2iuZjoZPmMcwEBzVcY1lwhJc1mnVt/ZhyyfDLOoyi+NhjSaB89bE/bPU5O8jtouG5iUawZKLh18586hZS2OffkWbeKyPxF9zjB1vkZOT8KEiRH8R3VL8ntPzg640+ftenUo+3bSEUcadR+DqP2fuhgAjbzsc4F2rI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JrglyURu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eu37J4I0; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6580Gm8s2025142
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 06:03:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Cv5efwx26E7PJcE+ABnkMrhr
	HPhPIlDSPzTe7GWtSQw=; b=JrglyURu/bXPrqPvVsJvzKFFh5NVOvIn1WUqOjbs
	ZrkwajJRJiamCNxQtIeCQW3Jfg6LuBQnMm5yRduFWFwdZDDZWbJICVxrQ+sSW9Ql
	tMWA/9GaRrqtqHPLEfGeMaB51WiXiSlrZ2hsPKyHO6swYlTopoxMdT0Gy6mi3Rja
	KQLuGqc5uxW/nw1UHVi/E+KGXl/gUzSkaxpz00aw0i79r6ekcBwQYHOenfB8qq0X
	jT/S3Wx64Mfp0yDXbyrFYqwzpzELixgLDNzgQrl/C2w7yg7gcMSHPbLDTM1i/lAs
	oIPxUzZ6AAHMESIHgXdCjraMVEPRX2f+z+q8Ou+XCVivMg==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4embmre7de-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 06:03:51 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-6cc5ae9b959so4672874137.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 23:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780898631; x=1781503431; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Cv5efwx26E7PJcE+ABnkMrhrHPhPIlDSPzTe7GWtSQw=;
        b=eu37J4I00ou0j9sTDotrT0pOekxwx5TT/25dpTmbTvTFbWd+kCd8lkR76YHFtGAzlp
         s6nlmdmXCHUOAVvqmjJeA3Wun+9D87laoUnY0KrdbsemKBJWKxHup9/CoBtpvteqMJqj
         kbsenrovQMrjfIYXFCzx3Hw8baxZ0TfrdpHx5oZkrjNAoy5y8JgJvDeoUEkkUkI7UiRz
         IF9d+55k1SQCjXmGmRtZZJtrdpQbGDzUbZdrkKNElL2iidAKdlBPeQTVJ+YP8DVWoZsv
         /Xx5Tr2Q3uy6+HYqbORxLWGrMVGDotQADc75kdit0QUZxXHRRTHAlmxChb6qSG6N4jCr
         lYzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780898631; x=1781503431;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cv5efwx26E7PJcE+ABnkMrhrHPhPIlDSPzTe7GWtSQw=;
        b=gOM17dC0vgF6r8ZEcPODru+GDNYSsCpHUAg4s2RNTqGmitvEhZleYBDjnU8ubPll6g
         TiZ1vv7nsxjeosoEib7W+YgjNAyGn5JeteyXQ8NLQzkhlY9aqbP+hKiKM60Pedzy9CSH
         Qnj1uCnqo4LeiSGWbEJiJmwLmhX8QxxpihFReQIdQUEaUT3WX4MlJl7PmjEhXvFnlifX
         jGh6qu63rOIY1IGc3TOhch1Jwzxw8uTzIFnL+Gb7+ppTQPZJtH5eHSgPuLEdsMMaMyut
         cM4JfDSOxztIRNvRthj7aXpzKSl/Qv8zaqGUR4hV7e2q/9d3tjwLqijA87vxQVDKq/uL
         445w==
X-Forwarded-Encrypted: i=1; AFNElJ+M8qead22Fd4yTGCN40A9sRZdGPU7zOyQLj5n3c70VohLJiHnnQnWa/Jiq2GLTAHsBB/3AwTwJoYrcSpwO@vger.kernel.org
X-Gm-Message-State: AOJu0YxAmUBGuaKKy/cK0pUBaEinGFfbrO7bz08AqcCc8NvzjUruojv5
	ASJM44FKYm3n+OnPHaI8sS7ChxZ1TJ+txgOYawvygQB6VDvVcsfM1BU2Y49A/PdXcxmDu/QF4Ls
	DDOZrr5nwA1Z5tFLD2E4q6MU1O2KYIUHTKuRMlUvjU4DcFNN4P2RpECo6BsntAQn0eKFi
X-Gm-Gg: Acq92OHn9JZMHgyBEh4pmmroy5t7mCiYycegBMoBcC4mwn9AvELSd/N2K1GmAzfEpMp
	ihC1/7/cvw0YkWoQtGRmsH4HS3EjHDHzaYtGz7/MU4fhUiOD7q3HeTzEkgKMSYq8UVzjELnC+Wq
	orQJ8gp4r0lYP3lg3bq/TMj3uWfqRwR7E136l6qVCbJtIjpXi6YQ58LhBQ/jlf4HOWacp87zJaV
	du8wRHLum0g+V2IQwdK1E0koQZKUuOapbwR1LQphCmfRuAGF3aupfn2koMdheTIKBcD/OChoi/B
	vqsgNXbo+Gn6lI21nkteftY+htX3Ulhb7TTQ3/Nxnz+LdJuaIdxMY57BF02EVLH839YfuMk4d9O
	cLrfVdmJ/X6U4IKRgrM9Q4XoYi9hgiIt3oSHmCyN+kpxMjb8qlZFAMXfsh5E741cZAx/siNKJdc
	2h7gJtF1nEVrDCIGF49Vjc/NbexBH0WY/LlNq8roFlKNPnbg==
X-Received: by 2002:a05:6102:3e20:b0:631:28c1:154e with SMTP id ada2fe7eead31-6fef85336damr6839093137.16.1780898630899;
        Sun, 07 Jun 2026 23:03:50 -0700 (PDT)
X-Received: by 2002:a05:6102:3e20:b0:631:28c1:154e with SMTP id ada2fe7eead31-6fef85336damr6839085137.16.1780898630543;
        Sun, 07 Jun 2026 23:03:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b9995b5sm3510351e87.76.2026.06.07.23.03.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 23:03:48 -0700 (PDT)
Date: Mon, 8 Jun 2026 09:03:46 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Md Sadre Alam <md.alam@oss.qualcomm.com>
Cc: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Abhishek Sahu <absahu@codeaurora.org>, mani@kernel.org,
        linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org, lakshmi.d@oss.qualcomm.com
Subject: Re: [PATCH v5] dma: qcom: bam_dma: Fix command element mask field
 for BAM v1.6.0+
Message-ID: <6qkgzmrr3oxzj47so4jqw6gk6stzjkxbnaflajk5zw5fgf65cn@yj3d55p5b7do>
References: <20260514-bam-fix-v5-1-58f6edb34969@oss.qualcomm.com>
 <agyeh4PZwG0Mu6Wx@vaman>
 <aiFXPPXtjCHj0Ged@hu-varada-blr.qualcomm.com>
 <5c24a3f3-a4c0-43ec-9653-bc374a9c5e22@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5c24a3f3-a4c0-43ec-9653-bc374a9c5e22@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA1MyBTYWx0ZWRfXx/HCIy9rGeGC
 hCBW9JJ/ifCl6gbvrLmqbps8RCzSYpRKjrfKU0PkHAvT0XCaY9aolXVR2cTh0tZv7MHPg1xH5QZ
 ydvyKVhvYU8Jhf6Gfm1nc2SjdMjaS2Zd3ImJNgXfQ7iD+lUZMFlF0JtdBsa44SyCZjPbVUEafnD
 UmR19hT7Hl6wk+olLuHKrnPufyglsSOis4Ndu/T4O/oD+VpV4G75nnluGbBsVOnlRLQM9n1U4dk
 ylqA0mGin2B8j7FW6greJ4sxc3bqSGLBClS7tono5yj5MbTKCEtGuxDA3DIFhxhGD0Ai4S35q63
 1GnAGsxkT0UuYrKcTSKuJAvB1emVb08D0Q0EpL2Rlfoe4ChiHQkq/DFhhxP7nihCbe9Md/i18Ny
 q9YISR6z4+Q1mj/LsWMMq9DZAlRydOL+yeKzO/0qFHlt/gVpkDQNCoYeNqXIJcOMexRqi38eZqn
 /JT1CPdPJBdUDp06Sdg==
X-Authority-Analysis: v=2.4 cv=B5eJFutM c=1 sm=1 tr=0 ts=6a265b47 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=IdiP-_C5k5DUui2OaP0A:9 a=CjuIK1q_8ugA:10
 a=-aSRE8QhW-JAV6biHavz:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: PkE9DbTqSLF92Wbd647hgHJ3XLcv-Xev
X-Proofpoint-ORIG-GUID: PkE9DbTqSLF92Wbd647hgHJ3XLcv-Xev
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_01,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0
 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080053
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111679-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
	FORGED_RECIPIENTS(0.00)[m:md.alam@oss.qualcomm.com,m:varadarajan.narayanan@oss.qualcomm.com,m:vkoul@kernel.org,m:Frank.Li@kernel.org,m:absahu@codeaurora.org,m:mani@kernel.org,m:linux-arm-msm@vger.kernel.org,m:dmaengine@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:lakshmi.d@oss.qualcomm.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B77E9653034

On Mon, Jun 08, 2026 at 11:20:01AM +0530, Md Sadre Alam wrote:
> Hi,
> 
> On 6/4/2026 4:15 PM, Varadarajan Narayanan wrote:
> > On Tue, May 19, 2026 at 11:01:51PM +0530, Vinod Koul wrote:
> > > On 14-05-26, 12:09, Varadarajan Narayanan wrote:
> > > > From: Md Sadre Alam <md.alam@oss.qualcomm.com>
> > > > 
> > > > BAM version 1.6.0 and later changed the behavior of the mask field in
> > > > command elements for read operations. In newer BAM versions, the mask
> > > > field for read commands contains the upper 4 bits of the destination
> > > > address to support 36-bit addressing, while for write commands it
> > > > continues to function as a traditional write mask.
> > > 
> > > But this changes behaviour for all versions. What happens to folks on older
> > > versions, wont this break for them, if not what am I missing
> 
> It will not have any impact on older version of BAM controller. Konrad also
> had a similar concern. Please refer to [1]
> 
> [1] https://lore.kernel.org/linux-arm-msm/2394e63f-1df7-764e-5489-3567065707a1@quicinc.com/

So, you got this question once, have resent the patches, but didn't
guess that there will be the similar question from other reviewers?

Usually a question means that the commit needs to be improved. Adding a
simple "Previously this field was ignored for read commands" would have
saved you from futher questions.

-- 
With best wishes
Dmitry

