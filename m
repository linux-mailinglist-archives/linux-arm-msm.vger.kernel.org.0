Return-Path: <linux-arm-msm+bounces-84345-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D88BCA33F2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Dec 2025 11:37:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A5184304791D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Dec 2025 10:36:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1ACB2E06EA;
	Thu,  4 Dec 2025 10:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aLfgUTrZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FApAYsyp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1280E2C21C6
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Dec 2025 10:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764844581; cv=none; b=CibX4Mwtf0OhpLWkGsu28TDOn3AP99x3JxyB+6aviG5PvlAjhSZGf07YJ0q35eImI9GArinI839BHix62xVwEV8l20sJhDzEefnYaa9nwzzU8s/dSRZ3x3E+h1HX3HTvDjqy46u7Krto0IIZf78vxn5PdPfj/CjiNJFtQ6IOpRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764844581; c=relaxed/simple;
	bh=SFSmbjvM7+G6T8JjrD6v993Hxs+kypnArx0gSidnmgc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MVJ1plyJfkN2ODnst1MsLoF4dt2oBbczZiwOACRZaxo/4uo0fVZoOBNiJmPK5pAUvwZVac3OHengh9KwqB9rVraoj+Yjkxx/1AbwsxvVzz+/cWyUYhoQ+pGTt3+EDApbIw9UnjA2C1qNYftaxh8hJwdvyjI0IrmScXyJiZ3TxMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aLfgUTrZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FApAYsyp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B4AFCKY1179840
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Dec 2025 10:36:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=oBx8fuoiAYJMR5sq4+aOTUoJ
	0r3bpXD6Lyf4Yfe38PY=; b=aLfgUTrZ62R/awyYhBboRPzhcx/EZFiSk3a/0e0C
	zLGZSWYCsPmUIaRVpvnNd/+EG1Mmm0xf8fSvi/cLOTEJon4Z/yu7Kv0WoaEwojOu
	r7YDTHujgsYM9fE7v/umddMG73oH6b5/mBI2SE6+LhKxqf8SO8q+A6n4PfsW9DXY
	1N71ITkH66t8s7NY5/HtXAQuz+60mpjqkCqy5REelNIqTNno+G64d5pb2utP/cbA
	zvk6/CYSq0GVGxqIsdXcBXCwnObyN8QoRPcKBpvc328eTQV1t0kwu9L8tB+xPtET
	VTJzR2uIPNS4Sk4sQ7qv+yj7+JRkWqWWxp+SgwJ94QWHjQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4au6v1gexe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Dec 2025 10:36:18 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-343daf0f38aso920802a91.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Dec 2025 02:36:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764844578; x=1765449378; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oBx8fuoiAYJMR5sq4+aOTUoJ0r3bpXD6Lyf4Yfe38PY=;
        b=FApAYsypt1F/cnZ6hZHL1j3NzVikahv4Ra365DN4xeR+PcRKtSuGOhT7na6gEgeRRF
         wM6bSE7xbhPAFyE56SN6WkBVJqUeLjIoHpQMwk/H6KPX1GABg9acfDVCa4N/LRDlytTZ
         k/WOJAmHlcoCP61qFfMuvR8U1QGnLxc2c8dhUofj48w2svV18L42/F3DMg3SLQyhtLFa
         KMf4zIpBWX23QLRw/wUZE/aNjR8tMW1F23INKjOwDw0a1cI5DNKpp87CycKwVXHpL/2S
         ZAIVYvR4mhrd/ul2/MEn6bhxwz4Jra3hfhAQIuwVkvbhxBRI4o54nXXj22R/SNIlmus6
         R2kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764844578; x=1765449378;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oBx8fuoiAYJMR5sq4+aOTUoJ0r3bpXD6Lyf4Yfe38PY=;
        b=oEmcF5d3tfLRDGf9Q77bjMrPmkE2NUjhdpdV/+fg64rXaPHO4LqNtfGTu4OUALSE4/
         sug1J/FGqgHvB4P72IjbBxh6EddikKALlKcYbqSI0yuDM8Em0A/RGQQYOHGFPbh6rpti
         YG51+DGm+6Egwj4+p3SZ09OlpsiHivcaGrM4sLdyJYZWgO4ucj/S0STuZSg6jJ4/52DK
         ZNIIaRHWpVQThNr1HqJTkAFzhRMkeEen9OHeg54lpgslynVoPdkKnxt0bhikjTfa5NYH
         kGpyQAggbc84D1sVNQMfXO0eAktNFl/taMvPqErfbqhuX2hQT1clpTC+3JKXRgSXmwDW
         GfuQ==
X-Forwarded-Encrypted: i=1; AJvYcCX29iDQ9OL/o2DM32Fl0QQtXTDr7o3uxEivyfyVzSgQjgdWFW2fCFAkhc2+82vceYL8N5fqbw4xYQCtPyzP@vger.kernel.org
X-Gm-Message-State: AOJu0Yyec1rHttfCVTMIjb9wAp2osOpCWVO+mgn8GzBgSCzzDbIpKvYQ
	6Uy4YPgtw8i01NZrCo7qF0oI+0nqo5EAN8IupNRny5y0WBDjbUnbJB+ITMxmnIxwVoIndXHpnNB
	6oTZil2X6JdXblc5w4QIIpiSZR+/QvRrqhDAPAmzRX1bizJ09tFz/J7r++rSfHpQ9Hbrh
X-Gm-Gg: ASbGncuFTYnT/5Qm+6OccavMYJ0rgZasuTKgVtczmGw/kDDaDekFKJsZJdeJiuTLzR5
	tULWBTW3BjhRaekLz1gzne6L/Pvvc1L9BZXbme4WRmZug1ikrXQcCatAyRI511veQgNqF5ktjpG
	CWGiNpJ4M/Vk8zDJyrYLk02Ksv023pxnqiPLK4EOoQKHKmZ/sf3xTmnq3GxjgEMa711594/KExQ
	CEKA8bgTMN5h4ZkmBL71nhAWsru7UbzDawjqs03RKKTC/ZzU/LtA5ny+OqaVWjIMQM2gp5Seesi
	WkhYm0P7k/tIooYSa2y++QDyr+trGCozKo0gl1Qq9HZXqpKJ4SUeUZNyZTX2anU1HtwR/BpVScx
	uH9tjzNhKIpGZp8lOpX0Y0xkvQ00SvuGqYfUBsRyxyew=
X-Received: by 2002:a17:90b:4a01:b0:32e:e18a:3691 with SMTP id 98e67ed59e1d1-34947f36d65mr2313955a91.35.1764844578255;
        Thu, 04 Dec 2025 02:36:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGL/yxp7XI1jdUvDb/hzCVAzovNCH+yUsfptI3a7mjQGZteEMWB6AcZfVAJ9K0+M9khaFoOBA==
X-Received: by 2002:a17:90b:4a01:b0:32e:e18a:3691 with SMTP id 98e67ed59e1d1-34947f36d65mr2313931a91.35.1764844577741;
        Thu, 04 Dec 2025 02:36:17 -0800 (PST)
Received: from hu-pkondeti-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34912897600sm2451156a91.0.2025.12.04.02.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 02:36:17 -0800 (PST)
Date: Thu, 4 Dec 2025 16:06:12 +0530
From: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        rsalveti@oss.qualcomm.com
Subject: Re: Alternative to arm64.nopauth cmdline for disabling Pointer
 Authentication
Message-ID: <adc22b19-7dcc-4c38-9319-d979f1e3886a@quicinc.com>
References: <3fcf6614-ee83-4a06-9024-83573b2e642e@quicinc.com>
 <86ecpappzi.wl-maz@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86ecpappzi.wl-maz@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDA4NiBTYWx0ZWRfX4+DRLNFM/jml
 kiSQkv/+9FdoR3+xdOduVyMSiQnNRDvrVGadJ4uAhEVSSPLq5KkqCpvNtE+PRLc+XuM0LWqDAW9
 Msh0mvxj/CLAA8sW3FWjhTJuPe7fcr2tH8QccAtVqdGSXYqXBGwi9CnjMetPJKGppOwNZe7460a
 7ssEfwCBPLRneWkY19UXf94X1NN5ahjp/h0hNbNvUnPUugH9m//8HMx59Qoaj7EJJi7Eqs8R3sX
 uPpFl4KUyBpq5YqUC9W3Wk/xGZBb9dzfCLiChDnxmSWAvGOa3pCFOcX5u5kLh/qg8FxRQEujhDa
 bfBJHqkkFWOcLyBfHLZCbb4CmS9kGTNiyuQt9SR648+QWPl99LbjBpO0U9x6k6AZu44OP0VjldM
 oRSHPe5AFxlWgU4fGyMlHYzDADVZzw==
X-Proofpoint-GUID: dKbASzJfVcNzr1OfiQ_RAiuO2o2g6DHM
X-Proofpoint-ORIG-GUID: dKbASzJfVcNzr1OfiQ_RAiuO2o2g6DHM
X-Authority-Analysis: v=2.4 cv=KY7fcAYD c=1 sm=1 tr=0 ts=69316422 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=hN0DXoGWr_mGFEF8OEoA:9
 a=CjuIK1q_8ugA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_02,2025-12-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 adultscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512040086

Hi Marc,

On Thu, Dec 04, 2025 at 09:15:29AM +0000, Marc Zyngier wrote:
> On Thu, 04 Dec 2025 04:07:15 +0000,
> Pavan Kondeti <pavan.kondeti@oss.qualcomm.com> wrote:
> > 
> > Hi
> > 
> > The pointer authentication feature (PAuth) is only supported on
> > 0-3 CPUs but it is not supported on 4-7 CPUS on QCS8300.
> 
> On what grounds? Hardware incompatibility? I seriously doubt it, since
> nobody glues pre-8.3 CPUs to anything more modern. Or, as I expect it,
> a firmware implemented with little understanding of what is required?

I don't know the answer to this question. I will talk to folks who may
know answer to this question and get back.

Can you please elaborate on the firmware part you are talking here? I
see that Linux runs at EL2 and AA64ISAR1 register values on CPU#0 (A78)
indicates that PAuth is supported but not for CPU#4 (A55). I am told, there
are no other controls outside EL2 (trap) to manipulate this feature. So,
I am assuming that this is indeed reflecting the HW.

> 
> > The ARM64 cpufeature discovery code expects late CPUs to have
> > this feature if boot CPU feature has it since PAuth is enabled
> > early. When a conflict like this is detected, the late CPUs are
> > not allowed to boot. It is expected that system will continue
> > to be functional with CPUs with Pauth feature supported and enabled.
> > This is not a desired behavior in production.
> 
> What is even less desirable is to produce this sort of contraption.
> 
> > We started seeing this problem when Linux is booted in EL2. When Linux
> > is running under Gunyah (Type-1 hypervisor), Pointer Authentication
> > feature is hidden from EL1 via HCR_EL2.TID3. 
> > 
> > arm64.nopauth can be passed on kernel cmdline to disable the feature
> > in kernel so that all all CPUs can boot on QCS8300. I am told 
> > maintaining a custom kernel commandline per SoC in a Generic OS 
> > distribution is not recommended and asked to discuss the problem with
> > the comunity [1]
> 
> Well, you get to own the problem you have created for yourself. You
> build hardware/firmware that cannot run generic SW, and yet you want
> generic SW to run seamlessly on it. Spot the issue?
> 
> > This patch [2] from Catalin adds a devicetree property under memory {}
> > to disable MTE. I believe this work predates the id-reg override
> > mechanism. However, this made me think if workarounds like this can be
> > detected via devicetree, for example a property under cpu { } node.
> 
> Not only it predates it, but it also doesn't work in general. For a
> start, it is DT specific. How are you going to make that work for
> ACPI? I know you don't care, but I do.

Point taken. I understand that this does not fall under errata but is
there a possiblity to introduce an Errata targeting CPU#0 MIDR and
disabling the Pointer authentication? I understand that if there is
another Qualcomm SoC that exists with all CPUs supporting pointer
authentication with same MIDR, we may be disabling the feature but this
is something I can check internally.

> 
> > Given that what we put in `chosen { bootargs="" }` kernel under
> > respective SoC devicetree can be overridden by bootloader, should we
> > have a **sticky** cmdline to specify critical workarounds like this?
> > This would be more generic than introducing any new parameters.
> 
> You already have a way to have a sticky command-line, by building it
> into the kernel. Yes, I understand that this isn't what you want, but:
> 
> (1) a user should be allowed to pass the kernel command-line *they*
>     want, not what someone has decided for them

Agreed. This is what made me to ask the question. Should kernel have a
sticky command line which may have critical workarounds like this?

> 
> (2) the generic mechanism exists, doesn't rely on additional firmware
>     specifications, and is used for a whole lot of other QC platforms
>     suffering from the same issue of broken firmware.  What are you
>     going to do for these?

The generic mechanism, you mean bootloader passing the kernel cmdline
with `arm64.nopauth`? or something else.

> 
> (3) what if you, by miracle, happened to *fix* the firmware?

As I have asked above, the firmware part is not clear. 

Thanks Marc for your time and guidance.

Thanks,
Pavan

