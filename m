Return-Path: <linux-arm-msm+bounces-72473-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AE4D1B483CB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 07:49:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C93DA178A0E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 05:49:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98BB5230BF8;
	Mon,  8 Sep 2025 05:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gIaMVnUG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05B8F2264D9
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Sep 2025 05:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757310568; cv=none; b=SeRfwkr8luv7sDB9wsRbTGWTB7/FmWq2dTRY17bj7LikZzjF1GL5SwXxcZx5nC7E6hQESxq5VRhV/XY3emyZeFPmBDUlwJm7PqMyrDlDIqDYrrRgpVQO1R0DohTuT6s0VA0OGMprmuGecsdrseL6otaolNH8NzPbHaQ5sNcthfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757310568; c=relaxed/simple;
	bh=qyyzHcfumVHL+j2s7KL/IsLGqQoqyh556LdxwZIYtMg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WOCOH58C/KUWynhAzoiiZFhcIUZgrli6FYXWkRJALUdc1KcLVqzKDUHSeJ2QBpBa+ht2RNsbUbyLRe7aUKVeX5OSUpQF5DI7Vu2V1WmD6qaHT9KSzYifPVKbAFB2RegHZW3lXGXKhejXTeQsi42trYrAIEbb3VZhv2EjYJUXv+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gIaMVnUG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 587NGXso029227
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Sep 2025 05:49:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2ElCUchBrKSszQElvyrhk0Fp
	wx2I5MCqcQFlUSaDT6w=; b=gIaMVnUGQy2dxqYddL47kUfPSjdwIECBprXODOUN
	g859EP8XZTMGD7LSnR6K3xz1Gn59wQJ9KGuZKD08P6Rk/M05wmBuC7LPwHPjwyx2
	fVveIyFbw66RnF6SeuvhuCmiPIkqZTXzE487hrtbGOGt000kyLiruhcmjjoL8kTH
	gstcIcH6QuhwpKSdKKJoyJW63xMUgnoEUL4WXHzTQkv3TqEib5MBrWGXvDAgKIf2
	Cqyp2m1x4ctdPawbsaZ1BmqbyLWSmbOwAmDud2PPZKBjSe0TaE0TZIEYBMF5PGrH
	DahFK8TtjwC8VaYh2G23BP8B0LjQUgzBASdILywGxE5uuA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490d1vbd5n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 05:49:25 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b4e1675ba95so3410604a12.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Sep 2025 22:49:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757310564; x=1757915364;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2ElCUchBrKSszQElvyrhk0Fpwx2I5MCqcQFlUSaDT6w=;
        b=L3ZqxgZZiz3prjose6gVoweOWjLVpSQF6IGl3Rp49Dgv1DoIVtTbY/5W0loohpDVeg
         1ZrRiU+Fw25+kzahx+82l2MnFoYSKP1Ts+Nkq0eNtJRhImPJRK+PaTw3Nbz6m+/d1U//
         i/9QZi1fO/aiDHqDpYl9rsvXEA5WSzxoBs1BhPYKcG38LRoM2VIrqgOJMSgOd5iOdOiv
         +dNsVjLMXVjPOp7IbWXNttwKdR/Kia6v7LDigiyDlGYW//IhRqKnNwKvG7+I0pe31/re
         TcJpqEqs6cpsDtPQsmz9hVRmHgr5dVuAFSnjI37VLtdr4bK/tYpZIuourZaWUATlVBac
         Pg1g==
X-Forwarded-Encrypted: i=1; AJvYcCUSx/tVZVtGlCNMAR3jipD5kzpgcfNW9dTzFLEQIzCEyTQYn78L3bvQ6XnpFks1zoh2fRIgDagJheD9GrRx@vger.kernel.org
X-Gm-Message-State: AOJu0YwERhwyeHpDYbv+oMH2u5ZpKdOu9x00ZTZ7BwWcGGRqLqvIdJXU
	YhaNVNFnMd02eGz8/doZel0z88w4j/Y4sEgmCp0XC2uIeH2L1mVp0SfodKUWwp33HMZcmE6AybQ
	0ihcQVvbpWJJN8vvpTsuYHnShrqCeH1yFgsQ2lrC/Vy51TnKwFlRo1VYdEi9p5HyXpu5AuAPpKq
	UYD1M=
X-Gm-Gg: ASbGncvHL3l+cqw9esv2RoDYbVwcRSRGsIFULiLqXVQiuNKEJS+39iox7azA7ZoEgxr
	mPctWiIEDbqrsGxBgI+yuD36runlyPY4KaM7aEizUE/M3Mvg439EGej0sLOQxevNtfhDNHCOtmP
	zk62PYe8AaJ8k8b4wB5Ka41KrFDKAq5ed5AKJ+kHpj5P9x/P9pFE5nMAaMT5X7PHBi+qxVbkD5p
	z1K/Zb8wYCfGdo4Ry/HqposjKs/SiR+ukoK7QDixT37vfkiExbnVvFxLVZ/8whsECZfX6BjLt8H
	wNBecpitIAL7yx+omPAxzEuA88QjYkj31n2r4c0r7aIw/fPvWxr2R88dSsXk0PkpwaiUlxhp4A=
	=
X-Received: by 2002:a05:6a21:33a9:b0:249:18e4:52a9 with SMTP id adf61e73a8af0-2537746f99bmr9696166637.9.1757310564128;
        Sun, 07 Sep 2025 22:49:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHAK7iuQyO5FD7MZvZmx1lUHoGW9ZJA2QTZ+HOELrkcmlWk3nSRLy+QV9ltV5l0BXRVky6vlw==
X-Received: by 2002:a05:6a21:33a9:b0:249:18e4:52a9 with SMTP id adf61e73a8af0-2537746f99bmr9696143637.9.1757310563622;
        Sun, 07 Sep 2025 22:49:23 -0700 (PDT)
Received: from hu-pkondeti-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32d76adaf0asm2692287a91.1.2025.09.07.22.49.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Sep 2025 22:49:23 -0700 (PDT)
Date: Mon, 8 Sep 2025 11:19:17 +0530
From: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Add support for Gunyah Watchdog
Message-ID: <499f88af-30f5-4507-a90c-d592d0bb4657@quicinc.com>
References: <20250903-gunyah_watchdog-v1-0-3ae690530e4b@oss.qualcomm.com>
 <20250904001014.GA3405605-robh@kernel.org>
 <a547ecce-31c7-4627-ac6f-aeeef81bd0ff@oss.qualcomm.com>
 <CAL_JsqKuoJrkActpLXVUW9e9=R1FESUbD_rwBd5NGX2_Yv2ASw@mail.gmail.com>
 <99cacf08-0fb4-4b44-9036-96ea5fe01c10@quicinc.com>
 <e7f0b014-3dec-4276-a2dd-479d4248c7e6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e7f0b014-3dec-4276-a2dd-479d4248c7e6@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: i539nGY1OipvfbhHdLKV2oCnRn988NfA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyNyBTYWx0ZWRfXwi6NgUN8dLeQ
 ZbIrNkBLyiWMKBRl0RiAlOleJicNLgUMaVhoDude9UJNkgCQrGHjFO25JSv/rXg7XLej7pnNT0J
 g6Y5vNUARvjbhTRd64OrFUh4xtsN7bIX3zPxbpUZUwGe8z3pUfRnXHRUsDqSwRtxpCqIfk1NzOY
 4sKrUejSYer2qlQ+8Kam9P3j7DpCOo7oI9avcXWGi8NQESl55RnBnyeAQy41QHE0fCpGZMFgIDw
 eiyMmvmpxgdNTLjwj9NYs8zkXHrTAndnx98npe0tyhQMHKQY8Mpm0MV4ea15TbIR5C09pwUHFOz
 Ty4qONDo57B3LVsuoSpUNcwqmBjFCmudCCVnEdDdgMmQ0DpIHtr/F5SK+fKsAnrG408C8BJH7ux
 vscyzDKo
X-Authority-Analysis: v=2.4 cv=cYXSrmDM c=1 sm=1 tr=0 ts=68be6e65 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=yJojWOMRYYMA:10 a=Zv0-hWJqaCTQErOTT84A:9
 a=CjuIK1q_8ugA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: i539nGY1OipvfbhHdLKV2oCnRn988NfA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_02,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 phishscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060027

On Fri, Sep 05, 2025 at 12:18:06PM +0200, Konrad Dybcio wrote:
> On 9/5/25 2:00 AM, Pavan Kondeti wrote:
> > On Thu, Sep 04, 2025 at 05:51:24PM -0500, Rob Herring wrote:
> >>>>
> >>>> Why can't you probe by trying to see if watchdog smc call succeeds to
> >>>> see if there is a watchdog? Then you don't need DT for it.
> >>>
> >>> There apparently isn't a good way to tell from a running system whether
> >>> Gunyah is present, unless you make a smc call (which could in theory be
> >>> parsed by something else, say a different hypervisor..), but then this
> >>> patch only introduces the watchdog interface, without all the cruft that
> >>> would actually let us identify the hypervisor, get its version ID and
> >>> perform sanity checks..
> >>
> >> IIRC, last time we got just a gunyah node. Now it's that plus a
> >> watchdog. What's next? I'm not really a fan of $soc_vendor hypervisor
> >> interfaces. I doubt anyone else is either. We have all sorts of
> >> standard interfaces already between virtio, vfio, EFI, SCMI, PSCI,
> >> etc. Can we please not abuse DT with $soc_vendor hypervisor devices.
> >>
> > 
> > We are trying to make the watchdog work with existing SoCs, so we are
> > sticking with the existing interfaces. The newer devices will not
> > necessarily need DT to probe hypervisor interfaces.
> > 
> > To answer your question on why can't you probe watchdog smc call to see
> > if there is a watchdog. Yes, we can do that. It is just that we won't be
> > able to support pre-timeout IRQ. This IRQ is optional for watchdog
> > functionality, so this is something we can explore.
> 
> FWIW Rob, we moved on to SBSA watchdog on newer Gunyah releases..
> Which is not ideal as it's still over MMIO, but there's some
> progress

Gunyah running in Latest SoCs do support SoC watchdog emulation, so
Linux does not need to worry about if it is running under Gunyah or bare
metal.

> 
> I'm not a fan of including the hypervisor in the picture, but as
> Pavan said above, we're trying to squeeze the least amount of hacks
> necessary to get the most out of existing platforms (i.e. ones which
> will not get newer Gunyah).

Thanks for enumerating our goal here. we plan to support watchdog (hence
collecting dumps) on existing platform where Linux has only access to
this SMCC interface.

> 
> Perhaps we could extend the MSM KPSS watchdog driver (which pokes at
> the physical watchdog on the SoC and whose DT node represents
> "reality") and have it attempt to make the SMC call early during probe,
> making way for both physical and virt configurations without additional
> dt alterations..
> 

We have to be careful here. I am told that SMCC interface might not fail
even when Gunyah is emulating SoC watchdog. We can do something like
this.

If we don't find "qcom,kpss-wdt" compatible device, then we can add a
fallback to Gunyah based SMCC.

Thanks,
Pavan

