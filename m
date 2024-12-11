Return-Path: <linux-arm-msm+bounces-41444-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 257E19EC81F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 10:00:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0F72328A843
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 08:59:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6A2720FABB;
	Wed, 11 Dec 2024 08:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="n97gKmpg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30A2E20E701;
	Wed, 11 Dec 2024 08:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733907597; cv=none; b=Xq6R8EvbreITdGwbUhHU9x2PeqiAE6XA2qt8kjCxKI3yMsJR7KCJi6JX1ljt+q4BMRmlIx1tV7TEk1n0N1M5RAKeBRPAd5OfcxDfHMFZ2KIO/u4e3dJICEfy2Gv7CDfEmNFi1yR8c8RSD+26gkyfgiRB4hukMijnFUIUWm0H2ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733907597; c=relaxed/simple;
	bh=vF6kqNculSoohjVf7FoMGwu72pJxpE+rswcAWNcCZTk=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nL1tQYaKC8DYJns/3JARe/vHKmycrtiozw6ogup+S0oLIt8yrMZ33vNxamjfnQqg/GDyhf4eAv0rT0mtPIDQoMHntaBkM1rtjqIHKGgPJsrl4nR5yg7LN+S0FLKqtlPf5WkM8eYDzTQmmNc95Km7ji2yGDO5sNG3EtAtdWOQbm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=n97gKmpg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BB7vsv4010227;
	Wed, 11 Dec 2024 08:59:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nG6R5m3TbsxOExdeYY0EPOkpsbKldLlzDZAyjMX604c=; b=n97gKmpg00Pz3/AY
	AB6gcGwUTj6Z7EAWWjqtjBaROli4UqVx66/Ylj4TzY3SncIOjQdeX49zhiJuDT0W
	zFBnlSFFu8Ti061aG+9Ms9BabQL3esMSmcdKjN6mgWvhL6wb0CygOuoPqVJ998lp
	44ZLxdXvgWQvrNBmTdogbFLlwb6V+LqjS114G/yoHRSX87Vr9vaWY/PBXScGOtnB
	cWhQYUxK+kD8G5PrHZvm+EZM4Z2lwfVo03V/zyzgGthQHcZvE6pekReCPUMYa+Ma
	jlaPjocI9FnWYAsVSbVU6Jco/lDQK/4fIpFCMs01T83x97fHrhxFZQFzH9pAM4He
	mi+1cQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43f6tf85ac-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Dec 2024 08:59:44 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BB8xhBP029507
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Dec 2024 08:59:43 GMT
Received: from hu-pkondeti-hyd (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 11 Dec
 2024 00:59:38 -0800
Date: Wed, 11 Dec 2024 14:29:35 +0530
From: Pavan Kondeti <quic_pkondeti@quicinc.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Pavan Kondeti <quic_pkondeti@quicinc.com>,
        Rob Clark
	<robdclark@gmail.com>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>,
        "Bjorn
 Andersson" <andersson@kernel.org>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        "Marijn
 Suijten" <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Elliot Berman <quic_eberman@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH] drm/msm/a6xx: Skip gpu secure fw load in EL2 mode
Message-ID: <d788a810-1d54-48d5-a8f5-19a8e7a64313@quicinc.com>
References: <20241209-drm-msm-kvm-support-v1-1-1c983a8a8087@quicinc.com>
 <CAF6AEGtKfWOGpd1gMfJ96BjCqwERZzBVmj5GzmjKxw8_vmSrJg@mail.gmail.com>
 <f4813046-5952-4d16-bae6-37303f22ad1a@quicinc.com>
 <iyknardi445n4h74am22arpgc4vlchh6z6cvkbff2xg76pd655@nozwz7snt476>
 <1219b46d-2aea-4377-a8ca-024039ee1499@quicinc.com>
 <CAF6AEGs4EebrwyQZviNXqB2=3h2wgZpmbrdGHuEU4z1D014GRA@mail.gmail.com>
 <b47d44cc-77b7-4137-97e3-b245e1394580@quicinc.com>
 <pndxbcduiwytfwkortyxpdqgwa4bm3ajnjpa5nedjtgndq6z5v@mziv5z36zeqr>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <pndxbcduiwytfwkortyxpdqgwa4bm3ajnjpa5nedjtgndq6z5v@mziv5z36zeqr>
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: N7UqCPrrAVxCRDIW18JhXYZ9FjDkJpzW
X-Proofpoint-ORIG-GUID: N7UqCPrrAVxCRDIW18JhXYZ9FjDkJpzW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 mlxlogscore=999 malwarescore=0 spamscore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412110067

On Wed, Dec 11, 2024 at 10:52:51AM +0200, Dmitry Baryshkov wrote:
> On Wed, Dec 11, 2024 at 01:06:58PM +0530, Pavan Kondeti wrote:
> > +devicetree
> > 
> > On Tue, Dec 10, 2024 at 07:43:19PM -0800, Rob Clark wrote:
> > > On Tue, Dec 10, 2024 at 7:08 PM Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
> > > >
> > > > On 12/11/2024 6:43 AM, Bjorn Andersson wrote:
> > > > > On Tue, Dec 10, 2024 at 02:22:27AM +0530, Akhil P Oommen wrote:
> > > > >> On 12/10/2024 1:24 AM, Rob Clark wrote:
> > > > >>> On Mon, Dec 9, 2024 at 12:20 AM Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
> > > > >>>>
> > > > >>>> When kernel is booted in EL2, SECVID registers are accessible to the
> > > > >>>> KMD. So we can use that to switch GPU's secure mode to avoid dependency
> > > > >>>> on Zap firmware. Also, we can't load a secure firmware without a
> > > > >>>> hypervisor that supports it.
> > > > >>>
> > > > >>> Shouldn't we do this based on whether zap node is in dtb (and not disabled)?
> > > > >>
> > > > >> This is better, isn't it? Otherwise, multiple overlays should be
> > > > >> maintained for each soc/board since EL2 can be toggled from bootloader.
> > > > >> And this feature is likely going to be more widely available.
> > > > >>
> > > > >
> > > > > The DeviceTree passed to the OS needs to describe the world that said OS
> > > > > is going to operate in. If you change the world you need to change the
> > > > > description.
> > > > > There are several other examples where this would be necessary
> > > > > (remoteproc and watchdog to name two examples from the Qualcomm upstream
> > > > > world).
> > > >
> > > > But basic things work without those changes, right? For eg: Desktop UI
> > > 
> > > It isn't really so much about whether certain use-cases can work with
> > > a sub-optimal description of the hw (where in this case "hw" really
> > > means "hw plus how the fw allows things to look to the HLOS").. It is
> > > more about the hw/fw/whatever providing an accurate description of
> > > what things look like to the HLOS.
> > > 
> > > I'm leaning more towards the hw+fw providing HLOS an accurate view...
> > > and the fact that that carries over into other areas of dtb (ie. it
> > > isn't the only thing that slbounce needs to patch, as I previously
> > > mentioned) reinforces my view there.  This seems like a thing to fix
> > > in fw/bootloader tbh.
> > > 
> > 
> > Thanks Rob and Bjorn for your inputs. At the moment, we don't have
> > capability in our bootloader to apply a *specific* overlay when Linux
> > kernel is starteed in EL, this is making GPU non-functional. This patch
> > from Akhil fixes the problem without depending on the bootloader.
> > 
> > From this discussion, I understand that it is recommended to provide
> > HW+FW view in dT correctly instead of doing runtime checks in the
> > kernel. We can take this as a requirement to the bootloader.
> > 
> > I would like to check how we should proceed with overlay. Should we
> > submit dtso upstream and let bootloader apply the overlay at runtime or
> > this whole overlay needs to be maintained in the bootloader. Also,
> > Should we build all board dtb for EL2 as well or just leave it at compiling
> > the EL2 dtbo (one per SoC)?
> 
> It doesn't have to be a dtbo. Instead you might just patch the DT
> (Ideally via the https://github.com/U-Boot-EFI/EFI_DT_FIXUP_PROTOCOL).
> I think the bootloader already changes the DT (by fixing memory sizes,
> etc), so enabling or disabling ZAP & fixing several other bits and
> pieces sounds logical.
> 

Yes, that would mean maintaining this completely outside upstream
kernel. As you said, this is currently happening for bootargs, memory
etc.

Thanks,
Pavan

