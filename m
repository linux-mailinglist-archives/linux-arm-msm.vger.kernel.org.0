Return-Path: <linux-arm-msm+bounces-84409-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E2362CA4A66
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Dec 2025 18:02:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E098B3009C2B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Dec 2025 17:02:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38BC42D4813;
	Thu,  4 Dec 2025 17:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cOi26Uf7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EQAzubLy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86A0E2D8379
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Dec 2025 17:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764867727; cv=none; b=affeIHDuaEXvfa/hAitOooqagWGgdVvTmG9wS/PqFgBLSd1NcZUlD+I4j8kbosIY4YeHTzBPxdj9iX6FEUiPoY2uKzXebnJ3ioEM5dGcVzeXf31u3bClHo4kEMbaRLBfIA8oFQ+e2yk4krSA1jB9C48lKy2Wyfj4P3/73Rs/LQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764867727; c=relaxed/simple;
	bh=zCNiqMGdpFeglsJxvblYkPhnAQE6+C56AozLwtK0/+8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eW0+rTyyrApOBxxzQOgehxj+V8/h/uYYl59ut4gnOdslqZ09NdhZD1oRG+CSkgVi4J8cwvy/VVfnUoupb0iJ4Mo122lQPy5x11tic9ohZ99NU/B4MkWawPlrpeNVQ5aSHKQr7vmi52icYDrAPqB24fQk/5wt7Z7m0R5Eu94s1Yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cOi26Uf7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EQAzubLy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B4AEwbZ1179240
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Dec 2025 17:02:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=UDkOUHSKrwDS98ex3XZsDtLz
	Eb2vIwexnNSn7aSF6DQ=; b=cOi26Uf7y6ox+TgnLUo0DcJ6yxP5nM7uxmP/ajJK
	gthQDAiMoG0rhwsg5Yv04qWVKPuKgd4rE+4WRtEomIxue0frwtC9wecqB69aoCZ7
	BAu7WtGs22fEpeNCzil5/TOy6MUO4Pq3DqwxC+4Loleec7zaYPi4vR7pJXLfJssp
	0o7AwJPHBZAQD4MS/yT7TXy0cg/jwRZTHocNnLrpkZBccZ34TqB/fKRUbaUoW2yR
	pqKonlj1DF2qQblcZ0eItJcL9h/piit5LEfnSYweoYNKq4p2f3Av2C93i3fymNFb
	Qy0TGBS6NR/gwzRNNUBJpVpQ5EwRXZgcc77T9VRjB+38Yw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4au6v1hku2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Dec 2025 17:02:04 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-340bc4ef67fso1290277a91.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Dec 2025 09:02:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764867724; x=1765472524; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UDkOUHSKrwDS98ex3XZsDtLzEb2vIwexnNSn7aSF6DQ=;
        b=EQAzubLyUENmLsTz1LNuZ0kkNenojpR5swr4CiaVbTJwVakLKMXsrKFMVahijuWsvd
         fj8KVTLESMgoWF7mZ/amVpmrQGFhaefXJUIJ9tp8lSGZSlIGvERgyZs9yVYmwnc1YvBf
         EomaS81snRZ01ClrQzpov50In2a5PpVKAfrsQ7ZtAKCrVeFVwFFdYlfKSoq43vGT/UEA
         Ua9JPDd4oZxiRxU6nqFQoSLwaj6/2VfgHY8tx8xJ2dF8wQ6DNQWOpIbWy3a0Q0zSUSN5
         bBTpj5VIRvsqwb/+JRxxvZcg6SoqZO3V4Q+ayURR/W7mYJD7nxmk7SIc7UYb5YUvKhWo
         1Mrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764867724; x=1765472524;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UDkOUHSKrwDS98ex3XZsDtLzEb2vIwexnNSn7aSF6DQ=;
        b=dOQNbldUp4FrohdTBEDlMjHwxmKYlaUgQAlovwS0Ih7aHn6cQvvzisQodE16mFW7Xq
         eirC127x3HueTQqFBkY8AhcHwG0TcLZCzQDUgeWCtR29EhNxIw3F9PxOChJoOmJpnrCN
         N3MElxNGL7M1o81DX7JbQQGbDqbPCxyN2/8FouS/u5FJQ2CIsZuRWR5xsqS6sREC6GDA
         oW6TB8X8f8WjzaY2RFRxwW+QwELH30p8e8cWbccsLKPGbUnllkPmlcQP7l2Mu0xIaEeg
         g82n2Q4vplKT8LrBTHpBjlosmqeFgBFyB0TraXMHw/HfhTWqezXtvKBv9GPigK6/VdV0
         bI1A==
X-Forwarded-Encrypted: i=1; AJvYcCVe6Cg82oTtWpPvskiv2z5QxGsEH8mhdZR9y16YSO3GQEcQ0/H2SdlvYtWFoJ6pnkSp7IuzTPfncRwwMwxa@vger.kernel.org
X-Gm-Message-State: AOJu0YxTO7kWZF7sV6NmXW4HF4hInnkVBVNO8viFnfSYneKpsJqgriPw
	fbuGenoMf14+HH9lyEwBuddfKw0mhG8xhlHXxub3y2V/eoeThqCNEEOItPknQPyb4ZMmxpk953W
	k5YuN4YPHMNrl6apvTCmo3a78Yzx1dMAyfIW4+0yqDnHKG6BjLLglUK3jU0CKUdUKExP9
X-Gm-Gg: ASbGnctOVzAxiFyiNXhK/22oSVlCmCFA1ZT0kx7iV48VhfUFUPO8N5C9/ict9Y2t8y7
	GTS15qOtEKwWWoeVbSCGu4EpWEVZuKGNClXwWE8XRmPY4k0/sYIGTA+Tk8E+ac8MEGgIfuZ0k2n
	eu6f31HzmL57DbiJtp1qpPQa05PV8Ts4QwsXIe3nz89Zsprh0BZna2VdPbUo7OnuPE0feJEp3Sw
	ghwy64nHGRQjMZSeYeDcNev1O6BviHx1JHCAIiS809XStUypANvhvguL1zz/vwZeKS/5gUVP1fF
	YBwHhtMyq4vDAhCvuEOOjdaXObznBOg8BxKo6x2GFGZXTJ4G2Z6F5iP7QXA44Ldzdum+W9J00+3
	5I+UXaxwaKqySjZL37PKUpm/uxLMqoyYqlvQiYT9dgSg=
X-Received: by 2002:a17:90b:2e46:b0:349:30b4:6365 with SMTP id 98e67ed59e1d1-34947f1afb6mr3714085a91.27.1764867723532;
        Thu, 04 Dec 2025 09:02:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGj25Sgl7PRn2htoTjoU/kKOMt66L4Ir+ascv5tI1/pZYPKRRpiCYmryN5Ou/eMvOZjrDl3PA==
X-Received: by 2002:a17:90b:2e46:b0:349:30b4:6365 with SMTP id 98e67ed59e1d1-34947f1afb6mr3714013a91.27.1764867722686;
        Thu, 04 Dec 2025 09:02:02 -0800 (PST)
Received: from hu-pkondeti-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34912d3a476sm2867949a91.6.2025.12.04.09.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 09:02:02 -0800 (PST)
Date: Thu, 4 Dec 2025 22:31:57 +0530
From: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: Alternative to arm64.nopauth cmdline for disabling Pointer
 Authentication
Message-ID: <ef2d04e5-4687-4d2f-83a7-6cf9a7990ade@quicinc.com>
References: <3fcf6614-ee83-4a06-9024-83573b2e642e@quicinc.com>
 <86ecpappzi.wl-maz@kernel.org>
 <adc22b19-7dcc-4c38-9319-d979f1e3886a@quicinc.com>
 <868qfipfij.wl-maz@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <868qfipfij.wl-maz@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDEzOCBTYWx0ZWRfX3hLoOvRSSqgl
 Y4L9c4VKBrtJwPxk0gQMKipIcLngOBMojSZMLRr9g7vfC1nguG0Baec4hKmKpkEHb0aDd/S/cIa
 3GPA07cbnVRiqA+FIn1KJq+qM0ym5LdqYcFt5xrCBRndGwl7RuUMj8se/c5wWe4LsnJzDcokzUl
 tGk+6fw+5EyYmt9Fx3wJ5JDYh4vipwdK7u23LsL69c/Z/eNa3k152bwUKJ3wPEsJKb4uIGBrPxW
 Yu0QDLTGvakM9quC/03Uh3Yf5Y3MK2B7YH1+e8Hu98yKm2glyW3Fit8Lxo3bwbG4FZagDgAUFoV
 2BRp1k64fACbkKVv4wDgDnblU2pTK2mhgyd+uBam0Y+5HrPmJes9ExA1yGCY3FgQuujJsCzghc1
 WsvuNoyK1J6uoekPz4FSnJFwTDnl1A==
X-Proofpoint-GUID: y3SUdCXa1leJBBPZzLla9Wd7Bnkar_kY
X-Proofpoint-ORIG-GUID: y3SUdCXa1leJBBPZzLla9Wd7Bnkar_kY
X-Authority-Analysis: v=2.4 cv=KY7fcAYD c=1 sm=1 tr=0 ts=6931be8c cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=-uWyUKA5Yu5Vf0UlR58A:9
 a=CjuIK1q_8ugA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_04,2025-12-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 adultscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512040138

On Thu, Dec 04, 2025 at 01:01:40PM +0000, Marc Zyngier wrote:
> [dropping Ricardo, as his address bounces]
> 
> On Thu, 04 Dec 2025 10:36:12 +0000,
> Pavan Kondeti <pavan.kondeti@oss.qualcomm.com> wrote:
> > 
> > Hi Marc,
> > 
> > On Thu, Dec 04, 2025 at 09:15:29AM +0000, Marc Zyngier wrote:
> > > On Thu, 04 Dec 2025 04:07:15 +0000,
> > > Pavan Kondeti <pavan.kondeti@oss.qualcomm.com> wrote:
> > > > 
> > > > Hi
> > > > 
> > > > The pointer authentication feature (PAuth) is only supported on
> > > > 0-3 CPUs but it is not supported on 4-7 CPUS on QCS8300.
> > > 
> > > On what grounds? Hardware incompatibility? I seriously doubt it, since
> > > nobody glues pre-8.3 CPUs to anything more modern. Or, as I expect it,
> > > a firmware implemented with little understanding of what is required?
> > 
> > I don't know the answer to this question. I will talk to folks who may
> > know answer to this question and get back.
> > 
> > Can you please elaborate on the firmware part you are talking here? I
> > see that Linux runs at EL2 and AA64ISAR1 register values on CPU#0 (A78)
> > indicates that PAuth is supported but not for CPU#4 (A55). I am told, there
> > are no other controls outside EL2 (trap) to manipulate this feature. So,
> > I am assuming that this is indeed reflecting the HW.
> 
> Neither A78 nor A55 have PAuth. They are both firmly ARMv8.2 CPUs, and
> predate this functionality. So I guess that there are only two possible
> outcomes:
> 
> - either the FW is indeed not at fault, but that you have a *third*
>   type of CPU that is at least 8.3 in the mix
> 
> - or that you misidentified the CPUs that are on your system, they
>   have PAuth, and the firmware is borked
> 
> Which one is it?
> 

As Mark pointed out and MIDR indicates, it is A78C. sorry for the
confusion.

> > 
> > > 
> > > > The ARM64 cpufeature discovery code expects late CPUs to have
> > > > this feature if boot CPU feature has it since PAuth is enabled
> > > > early. When a conflict like this is detected, the late CPUs are
> > > > not allowed to boot. It is expected that system will continue
> > > > to be functional with CPUs with Pauth feature supported and enabled.
> > > > This is not a desired behavior in production.
> > > 
> > > What is even less desirable is to produce this sort of contraption.
> > > 
> > > > We started seeing this problem when Linux is booted in EL2. When Linux
> > > > is running under Gunyah (Type-1 hypervisor), Pointer Authentication
> > > > feature is hidden from EL1 via HCR_EL2.TID3. 
> > > > 
> > > > arm64.nopauth can be passed on kernel cmdline to disable the feature
> > > > in kernel so that all all CPUs can boot on QCS8300. I am told 
> > > > maintaining a custom kernel commandline per SoC in a Generic OS 
> > > > distribution is not recommended and asked to discuss the problem with
> > > > the comunity [1]
> > > 
> > > Well, you get to own the problem you have created for yourself. You
> > > build hardware/firmware that cannot run generic SW, and yet you want
> > > generic SW to run seamlessly on it. Spot the issue?
> > > 
> > > > This patch [2] from Catalin adds a devicetree property under memory {}
> > > > to disable MTE. I believe this work predates the id-reg override
> > > > mechanism. However, this made me think if workarounds like this can be
> > > > detected via devicetree, for example a property under cpu { } node.
> > > 
> > > Not only it predates it, but it also doesn't work in general. For a
> > > start, it is DT specific. How are you going to make that work for
> > > ACPI? I know you don't care, but I do.
> > 
> > Point taken. I understand that this does not fall under errata but is
> > there a possiblity to introduce an Errata targeting CPU#0 MIDR and
> > disabling the Pointer authentication? I understand that if there is
> > another Qualcomm SoC that exists with all CPUs supporting pointer
> > authentication with same MIDR, we may be disabling the feature but this
> > is something I can check internally.
> > 
> > > 
> > > > Given that what we put in `chosen { bootargs="" }` kernel under
> > > > respective SoC devicetree can be overridden by bootloader, should we
> > > > have a **sticky** cmdline to specify critical workarounds like this?
> > > > This would be more generic than introducing any new parameters.
> > > 
> > > You already have a way to have a sticky command-line, by building it
> > > into the kernel. Yes, I understand that this isn't what you want, but:
> > > 
> > > (1) a user should be allowed to pass the kernel command-line *they*
> > >     want, not what someone has decided for them
> > 
> > Agreed. This is what made me to ask the question. Should kernel have a
> > sticky command line which may have critical workarounds like this?
> 
> Absolutely *not*. You are not in charge of defining what is good for
> the user. If the user themselves want that, they have plenty of ways
> to achieve that particular goal already. Put it in the bootargs
> string, in the kernel build, in a grub config file, as a u-boot
> hack... There is an infinite number of choices already, and we don't
> need an extra one to hide how ugly their HW is.
> 
> > > (2) the generic mechanism exists, doesn't rely on additional firmware
> > >     specifications, and is used for a whole lot of other QC platforms
> > >     suffering from the same issue of broken firmware.  What are you
> > >     going to do for these?
> > 
> > The generic mechanism, you mean bootloader passing the kernel cmdline
> > with `arm64.nopauth`? or something else.
> 
> Exactly that. This is the mechanism by which we instruct the kernel
> not to use a particular feature if it can avoid it. It is easy to add,
> doesn't depend on new esoteric firmware interfaces, and is a constant
> reminder that you are dealing with stuff that isn't fit for purpose.
> 

Got it. 

Thanks,
Pavan

