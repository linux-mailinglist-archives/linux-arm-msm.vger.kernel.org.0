Return-Path: <linux-arm-msm+bounces-84408-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 33E53CA49DE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Dec 2025 17:56:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C969B3005007
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Dec 2025 16:55:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2CEE27EFEF;
	Thu,  4 Dec 2025 16:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lx/3WszR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A6V77igw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3A042F0C7F
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Dec 2025 16:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764867358; cv=none; b=uqey/mAP+vppa9pLAvRXBjAu+p6Dzl0Gc3to+OkX+sMozHRg5qBDcfJe5yViHnZW8O72WnU6bdta5IuXGGeTRc0T6tX5FqOpq58EvXp4qHunF+DBHHbtSvpNJmPy+e+KdstSKcnJrI3+4RUlxnvZ3l1nZKR3Rnx35Zv9MsRldVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764867358; c=relaxed/simple;
	bh=LNv5TI85gy11omWpvq7gecqV6xK4Rwr6W62Jp8lV1iQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lzkU8OUxs59AHzz2z/ZwZ/k7/gFoSU6JreTPw7fMMAWXoRA22KcFlakKjlJy48UUJpKEawMadtP010yhFprP4XC7azpL1U0F4SpvpxdnPgojPlH+DkZ8zXMm+zCbVdzaabe9bLSj8pKQ85+4qJYWBwJaiFmLcZXjJixL8TiaHZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lx/3WszR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A6V77igw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B4AEumx1159676
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Dec 2025 16:55:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=696GRQQxqyCN41tUvMfT2OP6
	gr0o5pHGbrT8RfFEnEc=; b=Lx/3WszRZx71yC9TsS/SJ7/ziL4tv233rDSVnAVW
	qOu8Ig0lpdfpIRipphLvIWnQjOvJzPk9SjcKVieiVGjfBCVQIWUDLCygmvfsNjz8
	Zo+/6QFqQut8jnDJmDaukOqg/wAbGL7dqd+E56N9It+RONcEMee6WZ9xFpwBJP7I
	zq8iBjeeG16yZPg1Hv12Mv/JCAxlFu75VU31gmBeuMI7KRgLv/63eZamGs6GB1Sq
	zzh/lIk7zP6Hc9OhYDwaHMT73gaCObhXHuMhHogl2uaHVuzb1JK8INKNohQfirG/
	gagyvGpktQIbqIKj1j4DbEceUtiC59OtUrSyD/KCRuqVAg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4atu3h3kaq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Dec 2025 16:55:49 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7b89c1ce9cfso1116655b3a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Dec 2025 08:55:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764867349; x=1765472149; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=696GRQQxqyCN41tUvMfT2OP6gr0o5pHGbrT8RfFEnEc=;
        b=A6V77igw1BVriZuxfXnpwUDQOwiDuCEaXICJ9Bf6+9kE5hsyEgy4UQTW0PVnKF0zwC
         GIHjEgMdsJe9QtMA++SzJg4Zm7DZTBSQdO1hkcmaDHCzSrfPyOgpPsNANo2uFZ90iOBv
         h8dEKC3Q1BCQZIZkcfEjxzcQN39wk4PJXdWu7GssuJzapVKJ/1CGzLaaGtETAV9q+5jH
         SW4Uo3L3WdMrgqS6wPqadaqb2V7X1eK3OIDim3+WKWi5YoFHDimhfvltHQKTaX5XGXnL
         A60RPBfYrjSHZOzwIL/klP1olRsBYVMjpTFOjq7NEojn0ccbiwGmqrkVhuCLf8liKIBS
         o/Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764867349; x=1765472149;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=696GRQQxqyCN41tUvMfT2OP6gr0o5pHGbrT8RfFEnEc=;
        b=joF7mGdReO7Gg8GiH9VvoaICZa5GwgnpNuGufjn5THCcgH8Y7gaLOmIEIR+tLGt7WF
         bSXsTKLe4s7guhKQGJAj/m/DWzFaK1niD/kKBhhlqYzgGxCeui705NaA9LtRZkyQG31r
         QZiMhhVg/c0iYktL5v9lc9nzsnTgJQolT3l17yYE89WsTg6dynLXDQOhpOJTnBnzZSxB
         NqiCa10E6fdZBAjz1Mw0k165R7sOLZX9okv1MLodf425jxYAmZxGmZbqBhS9GSbaZrkU
         g4TjwFp6ctpMbDK8OghmtQhjGJHNmo1hWw9d5SNsu3xraT2Aj9VdA0nGkr8LvsJk39vh
         kWjA==
X-Forwarded-Encrypted: i=1; AJvYcCU2CrgqBd6XmlIpWNr2I0Sd8ORKOQDyDn6Gfi/4nw9kT89HVT/rTBB1SJwsqBbThqxtR/94wuZ/cy9kxb5s@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3t7FzfEgTqOHDwL3LWbiRN5ryVlPQc0IUN1zYhrDuycWA8QMh
	ulwU8OjLVL/JZdCKuk6fOqFokYmSaYtaG9B8Lz6CEj6XXo+f/RNg28yhlbGH1ClMPTcReZixUEq
	HCUxMvGHxsgwdtgebzUuZ7420fiRMRZavnj8bXCqJJcTaGngMji26z1+ftLMZLBTKw5HV
X-Gm-Gg: ASbGnctxBaZxFtNnCyIAiYYMV/ahjbFKTr8nhGJhZjA1F0+i9uN/tMrOW3B3REpofAg
	qVNqYopbXlN/0tcsRGsgPl0JVHINzSP/sv24sQjRO9JooBI+II94l6h7s7ZRwx6X4El5KnHvkgb
	eGWUtqUhsjAb4ZGyKMHryPqSQkYuLIodeHWWpGkmeaKHKQnbEOVWiMAFTnJKND3Eetq3HCgKIwF
	7TRUHtq/nZD6pPWmV9i99uwKXyGDdSyEaFy3h7X/BmcTp10sbGhiIutG+nNDIBWkVi/IQmc+fOO
	07rH3TmoT0bhsDyBrQKjJEnTP2hUyQU0wayAZJQsAQpCOn3xtZNJspLQ5/HuGOYODLScLE2gIr6
	FpFh3yfJv/B4IWCWCGe8ZGWrRjC53JGWx3gGZVWFC3Aw=
X-Received: by 2002:a05:6a20:7f9a:b0:35f:27d:2ded with SMTP id adf61e73a8af0-364037bbe31mr4323545637.25.1764867349089;
        Thu, 04 Dec 2025 08:55:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHw2kT6hEWnd272sKBcT9eqh7v0Rt/OEQRgifO1zaMD5O5RJ8rQVzs+BV0eYAiBOr9b7Fd7zw==
X-Received: by 2002:a05:6a20:7f9a:b0:35f:27d:2ded with SMTP id adf61e73a8af0-364037bbe31mr4323517637.25.1764867348579;
        Thu, 04 Dec 2025 08:55:48 -0800 (PST)
Received: from hu-pkondeti-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7e29ff6b56esm2702035b3a.20.2025.12.04.08.55.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 08:55:48 -0800 (PST)
Date: Thu, 4 Dec 2025 22:25:43 +0530
From: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Marc Zyngier <maz@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        rsalveti@oss.qualcomm.com
Subject: Re: Alternative to arm64.nopauth cmdline for disabling Pointer
 Authentication
Message-ID: <33ab9112-39c5-4dba-9e56-089b7e8a7243@quicinc.com>
References: <3fcf6614-ee83-4a06-9024-83573b2e642e@quicinc.com>
 <86ecpappzi.wl-maz@kernel.org>
 <adc22b19-7dcc-4c38-9319-d979f1e3886a@quicinc.com>
 <aTF42v5dpTuCe7r3@J2N7QTR9R3>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aTF42v5dpTuCe7r3@J2N7QTR9R3>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDEzNiBTYWx0ZWRfXzU3usi/NhVKb
 7X2eQ9PGMUEf/cDyZQfN3fZKJWA77Li5D87niJWUupQ7VL3Krhm+UVX+iMEjOrJWfa8SJBRS8hN
 8qB/8fhaYP9KELQSTbi2RaCYsIJA6y5Kw0IPQ/AzcFWbpSveweRDqGRgPOaOsIMjOFjbqUhyUzE
 MmxsVNbZcE9vSPG3KWn+0hojeenuTDrPI/AOAmJG//zmj2cH5E89JsCAl8TEheYQpsK190r3mnz
 rJtWGZBHBeY/A7m4Tf7+SHjfI8jSlTPSE7XeKmZ7UHc8k5ytWfHhz2pEWbjfy7K909cD0RcLaDj
 0d3MJsfqneLNEFum+s0WSzvGny5BC34YpzCGGUFdW7RHgheT6fgmamlsR7/2dZ5v4U2AwMuuR8v
 XWoR/U+h5yN5Yu41qdd6HPPandlJzw==
X-Proofpoint-GUID: DyTHZxyOlv0eobYktMbi2CqX-sskrsLC
X-Authority-Analysis: v=2.4 cv=KJxXzVFo c=1 sm=1 tr=0 ts=6931bd15 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=Hg61_yuSoULxYLHEoxwA:9 a=CjuIK1q_8ugA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: DyTHZxyOlv0eobYktMbi2CqX-sskrsLC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_04,2025-12-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 suspectscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512040136

On Thu, Dec 04, 2025 at 12:04:42PM +0000, Mark Rutland wrote:
> Hi Pavan, Marc,
> 
> On Thu, Dec 04, 2025 at 04:06:12PM +0530, Pavan Kondeti wrote:
> > On Thu, Dec 04, 2025 at 09:15:29AM +0000, Marc Zyngier wrote:
> > > On Thu, 04 Dec 2025 04:07:15 +0000,
> > > Pavan Kondeti <pavan.kondeti@oss.qualcomm.com> wrote:
> > > > Hi
> > > > 
> > > > The pointer authentication feature (PAuth) is only supported on
> > > > 0-3 CPUs but it is not supported on 4-7 CPUS on QCS8300.
> 
> > > On what grounds? Hardware incompatibility? I seriously doubt it,
> > > since nobody glues pre-8.3 CPUs to anything more modern.
> 
> Marc, it seems like that's exactly that's happened here. :/
> 
> > I see that Linux runs at EL2 and AA64ISAR1 register values on CPU#0
> > (A78) indicates that PAuth is supported but not for CPU#4 (A55). I am
> > told, there are no other controls outside EL2 (trap) to manipulate
> > this feature. So, I am assuming that this is indeed reflecting the HW.
> 
> Cortex-A78 doesn't have pointer authentication, but Cortex-A78C does, so
> maybe you actually have Cortex-A78C?
> 
> What are the MIDRs on this SoC? e.g. the output of:
> 
>   cat /sys/devices/system/cpu/cpu*/regs/identification/midr_el1 | sort | uniq
> 
> If this SoC has both Cortex-A78C and Cortex-A55, that's a rather
> unfortunate combination that should have been caught at the SoC design
> phase, as Marc alluded to.

Yes. The MIDR register indicate the same. A78C + A55

root@v8a-arm64:~# cat /sys/devices/system/cpu/cpu*/regs/identification/midr_el1
0x00000000410fd4b2
0x00000000410fd4b2
0x00000000410fd4b2
0x00000000410fd4b2
0x00000000412fd050
0x00000000412fd050
0x00000000412fd050
0x00000000412fd050

> 
> [...]
> 
> > > > This patch [2] from Catalin adds a devicetree property under memory {}
> > > > to disable MTE.
> 
> Catalin's patch was a bit different. It described whether the memory
> range supported tags (and was actually a property of the memory). That
> patch didn't make it into mainline AFAICT.
> 
> [...]
> 
> > I understand that this does not fall under errata but is
> > there a possiblity to introduce an Errata targeting CPU#0 MIDR and
> > disabling the Pointer authentication? I understand that if there is
> > another Qualcomm SoC that exists with all CPUs supporting pointer
> > authentication with same MIDR, we may be disabling the feature but this
> > is something I can check internally.
> 
> I strongly suspect we cannot use the MIDR for this. Per:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=53a52a0ec7680287b170b36488203b5822e6da2d
> 
> ... Qualcomm's Kryo {Prime,Gold,Silver} parts seem to identify
> themselves as Arm ltd implementations, and those will appear in other
> non-Qualcomm SoCs.

Thank you for explaining this. Agree that we can't use MIDR based
workaround here. 
> 
> Without know *exactly* which MIDRs you have on this part, we cannot say.
> 
> Regardless, I strongly suspect that we have to live with the command
> line option for these parts.
> 

Got it. 

Thanks,
Pavan

