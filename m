Return-Path: <linux-arm-msm+bounces-73676-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D7CBB593C0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 12:32:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 00AAB168516
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 10:31:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24C3A2F83DE;
	Tue, 16 Sep 2025 10:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fB8G4bd9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F18CA2F7AB3
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 10:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758018659; cv=none; b=EhiZB7X9a8FKTEgD7PYk2caKpGRJwzC2zdbz5G7bzahgnJRyC7+vomAGsNt98b9KB5LsmqTP51U4P62urozgUDWtbGSJzR75ZtoTYsE2Uf524Api/tlk11MLp4CcgP9WU+9nIzKM4egxFt3yD1e8V4Z6EQOHvTnhIZiFbG9YVNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758018659; c=relaxed/simple;
	bh=d+jlDndG8PP0VyxXRuLeSowh6XAYCHEbZtNNt9LInjQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=awX6yRbxuZ0GCi9GrJd39818RVvN+yYGPcurpex2D2Un7pwOZtwh0cns8A50ndZVZJxWqFwUhVnkFG5P7480RrZ2/+4f/pvWW0qpFkjmpAJ/unnsjlK8oxJUjDswYkMXeakG9OvaQeLpo6sh8C10N4xWj4RS+HZXf0Mwnafp3MA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fB8G4bd9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58GABOY4020371
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 10:30:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hFFUoRiJ78Rh8btpYL7GdR2P
	u0JpEw7JoBrZPpXAZnY=; b=fB8G4bd9aD9w406wGvEWnNt8+rBWANai4uGMUWz/
	VGNjGRH7UH9QXP7vsQbavyKLtcZdCTtw2gn26NQfFAXyqNa5lfHKAU2vZZOBX3XO
	hF4iJ5/zs4INnBZzovffbtR7fHlm0QiFqIKlVPu7GkYuw9n1lpJjUXxL9qniNEtr
	ckFyO84Q1uEmQDb3ppTcN79DEbg46eHMVcgiNeB49g8XH3RL1D4PQvBZszgoevPj
	CneMBF4bLp8FDf4Tb0f7EqnmZ1H+bn5zANLrIXbd155gF2jvqYAF4QfjxB57jNys
	r3dWZ20NqTNepZLAF/mPFmDtT/kaKex07AyIEyBoLJviEg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4951chgf1x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 10:30:56 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b60d5eca3aso127498111cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 03:30:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758018655; x=1758623455;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hFFUoRiJ78Rh8btpYL7GdR2Pu0JpEw7JoBrZPpXAZnY=;
        b=wYdDDfgyxeTkU2ZP54fcu4P5u6RGPdImXM5kQ8yj/axQ8MFX/l1Lt1W2twJW6H0Wcx
         AmIenekMulFXRJSh2SlEBLsZbCnVE3wP8Qoz/Qs7pPk2rSZwjup0z5iG24GNueTU4p7S
         Opyd/4TbpkExY9Jrn5wrR3P+Z7fvz7n2TK0Swwo/wAMP5M7il3AcAXZDQnv1c/tbuGj8
         N+UBxQL5puwkABf4tYHbpn0iyYSYYBK1tQ0QwGF6RhYZWMaJNnvoqpoTFb7xBUyG53+E
         1Qt/keM4FAZwYMl7TGVIlIyK1eZPJO+CCxslZW/C0x96YQtgFmoevNGd8yYcUf7gkDMK
         rjzg==
X-Forwarded-Encrypted: i=1; AJvYcCWRTbevAKFN56eVyuWcaZ/p87aamAf5lLj3CwadJ3HzJSbp9Bn39vxOaWxJrURSuTXV6XTEzZV+xC6vgHlA@vger.kernel.org
X-Gm-Message-State: AOJu0Yzo7DkUpEfXJZ6e/3wiJmc0Wa5ZDRxsnEeLj+cU9sQNWn4w8Ji8
	PjKpAy3cKPpakiucSfCuFAWcycTB2gREHp7Pea2zBbGVRIAaQDtrKf3A1GkOebCbVUUbyxfRKPh
	+n1shUof06uI5Spy7nHwhyaP/HPuq92fU7g4M08zqmGLM+zN1vvs6VnA1xwMPvTxMUmR9
X-Gm-Gg: ASbGncuAmOGWFpeCnxDtDnLlX1dtFkw5Yy7n/l16FEDsoUn8sOX5KUBXVHrYSX5HAjb
	KCwUGpXvpBExOE+CxFsDE7EjHW74pwYXG8yoSP2VOL90X8dVGe/ZiQPjD/hMjxLetcV29R1S1rz
	sZ0JoqyC4zWiZjDGkZMNAPolms44tBEZkQhybbkt91yG4RjHFzFZb0y9QameLTH3NLm43O+bn/I
	ArkXkoo5PWmbNf+Km+BPjlPe3Yhdp58/QIoG9dSoLCz155YTMQdlF5GVxUHzPK3OouX+Qbt/nkU
	ScFQGCL/cvgaU5/f2b7dNkjhrAnFPP86FERSich7nDPfxPpuq/KdbrbpQVNdd0MwsPM95P5tOxP
	VnHv9NxqUyyRRaEnbQPAhtSKmiB0HcThQ6jTMhUfiBs4tglZ6Ffy1
X-Received: by 2002:a05:622a:4a88:b0:4b5:f1e0:2a6 with SMTP id d75a77b69052e-4b77d149fe8mr238375661cf.58.1758018654849;
        Tue, 16 Sep 2025 03:30:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGdY1Dpsn8FimyyZ6UijUGgh2Ys02k7KvtgljBEo3Py8dqNj3GXgL5jFMIYMFu4+u73BXFHUA==
X-Received: by 2002:a05:622a:4a88:b0:4b5:f1e0:2a6 with SMTP id d75a77b69052e-4b77d149fe8mr238375171cf.58.1758018654360;
        Tue, 16 Sep 2025 03:30:54 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-572a5cde069sm2566664e87.13.2025.09.16.03.30.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 03:30:53 -0700 (PDT)
Date: Tue, 16 Sep 2025 13:30:51 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] arm64: dts: qcom: qcm6490: Introduce Particle Tachyon
Message-ID: <22qi2loql3zbxrpxlu6hfxxeesxloxxmt7ohit5qtp6awpnzky@tplw7mirrk3r>
References: <20250910-tachyon-v1-0-5090bfd133e0@oss.qualcomm.com>
 <2tnzsjw3xy5jct4bcmahcwhjbzlmyxgcx6fzlz5qrzxume2uoy@phpcz6mnydlt>
 <nweaxuma3dkhzcc46ztfhmxxrchgidxjprc2tz5eahle6sxsuy@qvczmexs4qnn>
 <2bc767td7gw4bxts4k4xwhdiv5tgxmpyjwwv6nqeatvncdov6c@u7gfilzxgomp>
 <4gx66y2oncjppqjhap5q2fmwlgkhv74rupeo4iwbyqw6ipoddn@fpp56byglnwe>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4gx66y2oncjppqjhap5q2fmwlgkhv74rupeo4iwbyqw6ipoddn@fpp56byglnwe>
X-Authority-Analysis: v=2.4 cv=eeo9f6EH c=1 sm=1 tr=0 ts=68c93c60 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=7AODkVuKAAAA:8 a=Dt7FPFtFWm7D6XesEFMA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=sRHRY8H3vKB1GfNvUtpx:22
X-Proofpoint-ORIG-GUID: R5vYATWG1f3aI7o0EbyrPPkViW8mnBZM
X-Proofpoint-GUID: R5vYATWG1f3aI7o0EbyrPPkViW8mnBZM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAzNiBTYWx0ZWRfX3Y1q6kQ/XPZd
 87p6RKmp2srTRI59s1LacCVjxl2XCqbE/fh6h8+mzUOvBnxlIGWFMR7pxdlWrWz/Lw+64Pr9Vkv
 rEz/2m9nQpTtG/ECcJxjuDrbMKFpiQIuo/R4hDVn9KIGPXjTmS9YqR1uBsRQWbi12eyM6p27FC2
 xJIJKFBXedLkXMpb0qSBMYP4Bqw7wpYRh2he2ojeGVngu6NySuy3IgSf/c/arCTH2f6Cm5XY9nm
 gCio0w7w0pCrA5O62fx9UxdU3ptWy0opf/pxrbCzPh6sE/2plJElJbXYt32wct5QXPwDY0XA+R0
 dtyyCZcSsrO2ED+z/8l3LFRNH7gb5fqskImO/MwAw3AmZgh0tgtNacB0qWkQTgfNao5LQH1+6oH
 SyKTG72A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 impostorscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509130036

On Mon, Sep 15, 2025 at 10:26:30PM -0500, Bjorn Andersson wrote:
> On Fri, Sep 12, 2025 at 04:22:18AM +0300, Dmitry Baryshkov wrote:
> > On Thu, Sep 11, 2025 at 02:19:39PM -0500, Bjorn Andersson wrote:
> > > On Thu, Sep 11, 2025 at 03:01:35AM +0300, Dmitry Baryshkov wrote:
> > > > On Wed, Sep 10, 2025 at 06:05:36PM -0500, Bjorn Andersson wrote:
> > > > > Introduce the Particle Tachyon board (https://www.particle.io/tachyon/),
> > > > > a single board compute with 5G connectivity and AI accelerator.
> > > > > 
> > > > > The boards currently ships with the Android Boot Loader, but replacing
> > > > > this with abl2esp allows writing a EFI System Parition and OS partitions
> > > > > to all of LUN0, and a more UEFI boot experience. A prebuilt version of
> > > > > abl2esp is provided at [1], as abl2esp-v6.elf.
> > > > > 
> > > > > With a (very) recent version of QDL, a flash programmer from a Tachyon
> > > > > software release, and a full distro image, this can be achieved with:
> > > > > 
> > > > >   qdl prog_firehose_ddr.elf write abl_a abl2esp-v6.elf write abl_b abl2esp-v6.elf write 0 image.raw
> > > > > 
> > > > > The following firmware files are currently used, on top of what's in
> > > > > linux-firmware already:
> > > > >   qcom/qcm6490/particle/tachyon/a660_zap.mbn
> > > > >   qcom/qcm6490/particle/tachyon/adsp.mbn
> > > > >   qcom/qcm6490/particle/tachyon/cdsp.mbn
> > > > >   qcom/qcm6490/particle/tachyon/ipa_fws.mbn
> > > > >   qcom/qcm6490/particle/tachyon/modem.mbn
> > > > 
> > > > Is it locked?
> > > 
> > > It doesn't look that way.
> > 
> > Then anything preventing us from using the default, non-signed FW?
> > 
> 
> Looking at the version, they are not from the same branch or year.
> 
> I suggest that we stick with the firmware that the vendor has validated
> on their piece of hardware together with the other pieces of firmware,
> at least for now.
> 
> Once/if we built confidence in the QLI firmware, we can replace these
> paths.


Ack.


-- 
With best wishes
Dmitry

