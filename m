Return-Path: <linux-arm-msm+bounces-72149-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F4054B44AA5
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 02:01:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6FD731B2061E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 00:01:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5FE617736;
	Fri,  5 Sep 2025 00:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LRzAF+la"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5831D1367
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Sep 2025 00:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757030462; cv=none; b=U+tOFBqWdSW871iyZoPZSAjPwRoXQL7OW1D9/MNMhE/Rd26qSVQqpuK/7pBUVbVpe7Nvyqsil8/OO0G5v1rq0/HCfoJbBml0lfDIyKBDsT5NuA4QQBJZ3Sf5Ili5nU+YkblyUAseAnGZTVhJ6XB2kZYTLJ7ckTO0ddBtq2e0Fio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757030462; c=relaxed/simple;
	bh=0w8CuldlphcoO+tfKw4Vvvi3ndsc/ILcscWmhU+IA2Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PMgGJYs6IJMwhGn0H8jM9djZYVeLsL+dbHwN8DQrpKr0piCKYJsTo1Y65cF9yuGh5F2EUovCkYpAxiLbzXdssimrAMk0FBOLx9yyRV+P9NTcbIkDbTrQusmGjFfOm+fiRQV4O/Dgqf1YeJ+X8rsCEW+G/sQCENBCuz4+9WgZ7ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LRzAF+la; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 584IiOdL022986
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Sep 2025 00:01:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0annG0Mntw/ZyjPohAYmMxqB
	n0Karvid5pVkJViH9m0=; b=LRzAF+lakUH45oZMSsMsW8qDkTt1MyBthfz9jE7X
	X/EqAUTyB0qrGk6uQhAPfCXl3ohhh5dfvLbmYSnerLwWHIZGMl0MkGrG/4QHsgrG
	Y12JH1mzA2QJCrqYA9n3PiDaBAGL0kvrL1SsrKVtv4nqbS/RjubcJMIUmQDQfaOz
	OcgAXnZzW3wKRZ4G0mLfKNDrcsBVB8YiO3M2IvN+pzxatpe3O0NcOxk1fHEPVY15
	AUmsGXd6aAJ3ORO0f4s881g+TbmpMiBzri4X1gq9ep04KLq0mr0ZrHLVIg3YS8hW
	wsZI2vlJ9ommlkO408nE7QMz50D+/ZBWNdBMWau1+0WdeA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48uq0escd2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 00:01:00 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-32972a6db98so2180065a91.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 17:01:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757030460; x=1757635260;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0annG0Mntw/ZyjPohAYmMxqBn0Karvid5pVkJViH9m0=;
        b=BF0/DAWCs2YPfjpy9PiHC0L/lx2DnGvCYA0dJ2XilwBfc9yYrvkWxkyj0eu6UdKnRs
         ps+7mCzK6Z0VghkWhwxC/xtNLTbWwCIkibqq3zX2Nrlwl1POs71xfMcb6+GKxa1INwfs
         fUDYRkrBTkJNcPbQ+GshLuxszd5zbXITDNPFrawhFaEDijZ/ildRwpCkp4iRjkc59C4F
         b3B81z7VJ/Z0yoMG/fwqqNS6AIaChdG+F/6SQm/wB8vw0sJOngNiJKhPSJy0CJ66lhCj
         K+Yr/zUzh5SbnL7m4xVYSzM+laapDlsLGzVtIYH7DimqwIGETwbGxz8K8qqxIt0/wEFO
         TbIQ==
X-Forwarded-Encrypted: i=1; AJvYcCV96LcYDMAiy8briSZGZTQRVd0yMMne4Vmoxj25YeqsA7SHYSOibRwIwUSwUPHq1Y6ZwpzgGVste5uur9vD@vger.kernel.org
X-Gm-Message-State: AOJu0YwsZIuc6LtXT2VmQPpA6zY+vJetJ+HPz0BPxSlYM7ijiDy9EVSN
	ZrwBLAxJrhQFwLow+OUDkRfIiN0HhoVg10t98/89VY5Jto88AHiPbejyCYF3CNVDH+4NPptVMwX
	kWHkh1kzlwoNfVGTT01fnvXGfoRQC8DOGvqQrZMk2GVOzkrkciwL7zF10sECJlN6P9DWr
X-Gm-Gg: ASbGnctTDrK36/tMB9zFSMGIO2/2rO0+64aBIikhAvZl38Tp/41MPOnad8IM+4TtRWP
	Ixtgzevs/npXDXaUOq+BuZ5arvyWeVCcvV+Oxej+DZI+c3KpntZcZdKr/tBcudq92swM8HR6L/B
	wyfgh2bUyZAk7Nl6QH2iAGhdDxwlm3kICktXsvLpk5Q++GB8kAHOCNMyTKdQwUEVOdS8ScZuRzb
	6DiTEU5e5k7BS5TJh/FDKL4dTfybL9n50xLvylR/8JTtPTkOhY4XqpjqcU1BAXbeoTVxT44SnMq
	b8V1YSGNMxMW6mzcJtHAtPKfCDQS1P7e6ym8bFhViKsjVzref839ntUf1+xW6Fb6+jis8gGRfQ=
	=
X-Received: by 2002:a17:90b:3905:b0:32b:8b8d:c2af with SMTP id 98e67ed59e1d1-32b8b8dc8e4mr6768772a91.9.1757030459343;
        Thu, 04 Sep 2025 17:00:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHWcMG2DBkpOF6OBCTvV3qoquHwdXXHofKvm0rh/l6U97uk95e83IAK4maO0o3OOvqIAwx4fA==
X-Received: by 2002:a17:90b:3905:b0:32b:8b8d:c2af with SMTP id 98e67ed59e1d1-32b8b8dc8e4mr6768715a91.9.1757030458813;
        Thu, 04 Sep 2025 17:00:58 -0700 (PDT)
Received: from hu-pkondeti-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3276f57b232sm26732940a91.2.2025.09.04.17.00.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 17:00:58 -0700 (PDT)
Date: Fri, 5 Sep 2025 05:30:52 +0530
From: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
Message-ID: <99cacf08-0fb4-4b44-9036-96ea5fe01c10@quicinc.com>
References: <20250903-gunyah_watchdog-v1-0-3ae690530e4b@oss.qualcomm.com>
 <20250904001014.GA3405605-robh@kernel.org>
 <a547ecce-31c7-4627-ac6f-aeeef81bd0ff@oss.qualcomm.com>
 <CAL_JsqKuoJrkActpLXVUW9e9=R1FESUbD_rwBd5NGX2_Yv2ASw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL_JsqKuoJrkActpLXVUW9e9=R1FESUbD_rwBd5NGX2_Yv2ASw@mail.gmail.com>
X-Proofpoint-GUID: 8b9J8hQZoDg3-F80tV2DKQDj7VDnudRq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwNCBTYWx0ZWRfX/vzXHHvo05Nu
 ORnQqvUMKYjPqt6XkFRxG6YAi6f9GofhOZOukhuDxoSPqGLt3QEjUCtfB7Eb6FJRBnT358ijoXk
 LIy6DKiBxGFTM0IOlxXr2UjFQWz/BiHu3+Vpf57KBt7jAyPNe2rCo7ijuaoiP5S9psLXYTFozA0
 ISYZzNFcTwC2S3Sy7q21F/WUP+PSt0tYyJo6NPr6yfmr5/sjnKusyTZkhmZozLgZYWU8cAsrd3x
 FzyDN6eSk646vm/hMc7OMnlxlzmu0GcoUoVn6I3EqdmYSrb73IFvJFSAkNu6LVKnhHN9pokH0W/
 eKqoVNU6YcZfdDhbZG4WzEz3nI7XX1ACctpBmvllUNv2nCBF8RudsmfgyfXP/u0Hd9eiVwyCE9q
 S0m+prcR
X-Proofpoint-ORIG-GUID: 8b9J8hQZoDg3-F80tV2DKQDj7VDnudRq
X-Authority-Analysis: v=2.4 cv=ea09f6EH c=1 sm=1 tr=0 ts=68ba283c cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=yJojWOMRYYMA:10 a=yPAEAbfnkOYWZhAY5OIA:9
 a=CjuIK1q_8ugA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_08,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 malwarescore=0 phishscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300004

On Thu, Sep 04, 2025 at 05:51:24PM -0500, Rob Herring wrote:
> > >
> > > Why can't you probe by trying to see if watchdog smc call succeeds to
> > > see if there is a watchdog? Then you don't need DT for it.
> >
> > There apparently isn't a good way to tell from a running system whether
> > Gunyah is present, unless you make a smc call (which could in theory be
> > parsed by something else, say a different hypervisor..), but then this
> > patch only introduces the watchdog interface, without all the cruft that
> > would actually let us identify the hypervisor, get its version ID and
> > perform sanity checks..
> 
> IIRC, last time we got just a gunyah node. Now it's that plus a
> watchdog. What's next? I'm not really a fan of $soc_vendor hypervisor
> interfaces. I doubt anyone else is either. We have all sorts of
> standard interfaces already between virtio, vfio, EFI, SCMI, PSCI,
> etc. Can we please not abuse DT with $soc_vendor hypervisor devices.
> 

We are trying to make the watchdog work with existing SoCs, so we are
sticking with the existing interfaces. The newer devices will not
necessarily need DT to probe hypervisor interfaces.

To answer your question on why can't you probe watchdog smc call to see
if there is a watchdog. Yes, we can do that. It is just that we won't be
able to support pre-timeout IRQ. This IRQ is optional for watchdog
functionality, so this is something we can explore.

Thanks for the feedbck.

Thanks,
Pavan

