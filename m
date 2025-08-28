Return-Path: <linux-arm-msm+bounces-71123-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A3A9B39DB0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Aug 2025 14:48:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 277571BA4E9A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Aug 2025 12:48:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F65130FC01;
	Thu, 28 Aug 2025 12:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c7fRh+kC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 960A230C605
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 12:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756385314; cv=none; b=Ej9hr9gdsILzirf02v8Gl/IYYi+OMc6kXIiDPX2JFJJzJBbqifUsJH/WrAIqKIjezoVCeyiSFra1VMUlQEgpO/xQIi/AY0oOMVCH/s+FlTF7Ha0rKsT4+ZZZl7vfNIOir5BcXRXJKOI2g/hBzqkvTqyvSwCpeQ8cFO68BLONaj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756385314; c=relaxed/simple;
	bh=eeV/gtq8KypLeVlPryvG3QV+5gbRa2UjuJuMEtXSZCQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GVng4qqB/fMs2UJfxqMNgovaHWlB5YKK/icBfnzpeAAoHBQSNrJWxUAGrwxvWn/7f/bbw6kXOYmx+jSMpdMcfn9BylFuUB1PHkajkKcllz9RE/V3jA1sQrXHhaU7zu/yAZ7JgnUxW/hHJeTc8k4A0diZbPrHm/aj1qkaNL0TefM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c7fRh+kC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57S5OXbg031179
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 12:48:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=OWSgUZDBbRRXs5XueZsg+EXB
	RZDVUC3PcZsLkywc4rM=; b=c7fRh+kC6V1+is+MMLPsca+M8pYXKhQ7fs/dQybA
	YtFh/0xzlQ56+tTa8zGzDIqTzMUhntFC2MmEpnF0eW02L4g/rmWA1Gfr6XFr51EH
	pLfKRnONraCiKonRqh0jqudYPy4joFF1b39PKTHkrX/ya1CBe7raGO0xaGZol5Kb
	Xm2fh02qOTHvE+Fr9BvUZrk6KHZNAUqTc2YEaZuf/+L4CGgezjjuoeEotebMBfYW
	LboE/narpYsG6R2fEsxzhqyVjRKtOG/uoFmVHL2tOK5Gv5puhUGh4Eb1aZkNZzkT
	Ie1X8ObIEyHDR8d7pbP15Zsx14LM94J/h8XYOv5p5gaFIA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q615r55s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 12:48:31 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-70de169afa2so23160606d6.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 05:48:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756385311; x=1756990111;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OWSgUZDBbRRXs5XueZsg+EXBRZDVUC3PcZsLkywc4rM=;
        b=AG6LI3rRDp71xXNMpgZIPU6pLNglP+zBAlzdZnQa/43UCC2KD8hJSe9ewFeh3i2Cdw
         xTG/pTh206DXzrZcx4ihA2/he+d0EVjg8UEPBGFfa8IfN2iUoFKtEDuG+AZ3kvYnHE5z
         vXqzEOhKxoRhCAUPT38UFe1wAl0oxykIGebwgctHiY6Qrui++s8OY9W/bgq4opiocGt9
         K5BpdAhGYdB1vKnLrZwcJgAXfEtiJJ/B6BXYizP2MNDYCGYklu5PsLXMYR+dJdzrCkaY
         QQJcHPLZnRzFaohervP+GLD2F0VtkqxVtocIDsfBQBjZSmJL+B04GqX7dnajKvqTp3si
         yrbA==
X-Forwarded-Encrypted: i=1; AJvYcCVQdvQWtVBBe8Zl6HW+YV0VNzH2JC3gAczBGSjUL4q/1LrM5Y2KCIyhR8tKjb/nlWbh1n8Y5roZ6bCIZEN+@vger.kernel.org
X-Gm-Message-State: AOJu0YywV6WiTWY9kntclCqv9O2gCkNhAJo9X2zqTYE0X6bm/Sh3wGkT
	8QgQ8FWFVxzOBBIWlExvKYpuyycWDowrGOSRuOqZe1TZjJ0Oawjd67v684DDbv93cp+3f3636my
	xojBtBomnwFKZZRF4sMm6oAzZbWPu9bOmoqWOG14QsoBdQM/P/quHfVefRb8Cds0kQiQ4
X-Gm-Gg: ASbGncs0E2FlIurkFEv7n58h2PoTcqvmHgHwzqbBvnFdvCAKcsr5RVbiG1WwfBcIUj4
	xPFNZsJeEMwzVrkszI0FJkdUqszoj+HECOVdFWyvAKppBdeiWq9xrM1vNMzP88rAZnQc5SON62S
	OhWZKlkupJ8RX5VhOfhwewycUmtoUkaZZpOETxTxaKyr3mnQXyA7uneaJuI5nn0TtpJI60nJOs6
	mEC0AQBV3IyQqBSNyeOlpXvuwXydLWUUos7CF5TXSPqQ52jVPIBB9dY9sq6293XPgrZ7zhgxEyH
	b93XBXUNvl7qBdeA8xdgaW4jPpr3g/wc7MTzvBV+brGJUaUeSnidNgO47LFjkVtJKCz6c/nl54b
	9Aj43gCLwOYKH+qUarunWfnx3iOpixoVnlwVBXJfbF4t67HpDQaA7
X-Received: by 2002:a05:6214:21cd:b0:704:8f24:f03d with SMTP id 6a1803df08f44-70d9722c764mr136205476d6.16.1756385310623;
        Thu, 28 Aug 2025 05:48:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IENXnZKSLcZXlBr0d0ibJP90HPFaIblcFK7Jg6EkmV9LMI3r6LN3MPNyS79lCEXAK7vPq5+UQ==
X-Received: by 2002:a05:6214:21cd:b0:704:8f24:f03d with SMTP id 6a1803df08f44-70d9722c764mr136204916d6.16.1756385309971;
        Thu, 28 Aug 2025 05:48:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3365e2687acsm32396121fa.32.2025.08.28.05.48.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 05:48:28 -0700 (PDT)
Date: Thu, 28 Aug 2025 15:48:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        chaitanya chundru <quic_krichai@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Jingoo Han <jingoohan1@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Krzysztof Wilczy??ski <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, quic_vbadigan@quicnic.com,
        amitk@kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, jorge.ramirez@oss.qualcomm.com,
        linux-arm-kernel@lists.infradead.org,
        Dmitry Baryshkov <lumag@kernel.org>,
        Shawn Anastasio <sanastasio@raptorengineering.com>,
        Timothy Pearson <tpearson@raptorengineering.com>
Subject: Re: [PATCH v6 7/9] PCI: Add pcie_link_is_active() to determine if
 the link is active
Message-ID: <r2bhgghyunfcy5ppjcvxm746kzh7vyhsnbphlw4pj52wxtuxru@qzy7earmlnjf>
References: <20250828-qps615_v4_1-v6-0-985f90a7dd03@oss.qualcomm.com>
 <20250828-qps615_v4_1-v6-7-985f90a7dd03@oss.qualcomm.com>
 <aLBMdeZbsplpPIsX@wunner.de>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aLBMdeZbsplpPIsX@wunner.de>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzNCBTYWx0ZWRfX5p/uMiNzHxAE
 Fww/Z/WdBwQw1+Wv2XBs//0L65nAgqtlbFzLlTWOqjpUp/RiIx4CbLXttsNQ1Ibf2RCH+qPVY4E
 I2rw0cdfqUCQ3UikVOOhKcGj3dK2k6fZvyX+ro4l2RPi/Ok2j7lOnLDNztFP38CEw3Z6Y2RA8i5
 D/bpYiu1GC4+mLlVu6n/IqM1fmppiR0QMhrKGUt38MnWVEftFCU8fJuRo117yek39Q/bNOcx8LQ
 FWSnQt07tJ3t3dlCRMSC5chgzUS3ijI26RFI84zBPft48vZzA5OI+urGmrlvOaGQPCaPO7NGGMX
 fXejuxfJclDZ68F349Xl9E8ZgbiVn+7K8rgulVxGZSTu3wJq0N+QPCLsJHAKihjENJnJZ94gxlL
 kD8ww19D
X-Proofpoint-GUID: 8lbByqNbsP9YimrsY0jFHX4P1btoy3Cr
X-Authority-Analysis: v=2.4 cv=K+AiHzWI c=1 sm=1 tr=0 ts=68b0501f cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=DLE-xEQoUa54y48t:21 a=xqWC_Br6kY4A:10
 a=kj9zAlcOel0A:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=_AprYWD3AAAA:8
 a=i8L4npwzgB_v-bGXBacA:9 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=fKH2wJO7VO9AkD4yHysb:22
X-Proofpoint-ORIG-GUID: 8lbByqNbsP9YimrsY0jFHX4P1btoy3Cr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 bulkscore=0 clxscore=1015 adultscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230034

On Thu, Aug 28, 2025 at 02:32:53PM +0200, Lukas Wunner wrote:
> On Thu, Aug 28, 2025 at 05:39:04PM +0530, Krishna Chaitanya Chundru wrote:
> > Add pcie_link_is_active() a common API to check if the PCIe link is active,
> > replacing duplicate code in multiple locations.
> > 
> > Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> > Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
> > Signed-off-by: Timothy Pearson <tpearson@raptorengineering.com>
> 
> I think the submitter of the patch (who will become the git commit author)
> needs to come last in the Signed-off-by chain.

Not quite... The git commit author is the author of the commit and
usually the _first_ person in the SoB list. Then the patch is being
handled by several other people which leave their SoBs. The final SoB is
usually an entry from the maintainer who applied the patch to the Git.

> 
> > +++ b/drivers/pci/hotplug/pciehp_hpc.c
> > @@ -614,8 +587,8 @@ static void pciehp_ignore_link_change(struct controller *ctrl,
> >  	 * Synthesize it to ensure that it is acted on.
> >  	 */
> >  	down_read_nested(&ctrl->reset_lock, ctrl->depth);
> > -	if (!pciehp_check_link_active(ctrl) || pciehp_device_replaced(ctrl))
> > -		pciehp_request(ctrl, ignored_events);
> > +	if (!pcie_link_is_active(ctrl_dev(ctrl)) || pciehp_device_replaced(ctrl))
> > +		pciehp_request(ctrl, PCI_EXP_SLTSTA_DLLSC);
> >  	up_read(&ctrl->reset_lock);
> >  }
> 
> You can just use "pdev" instead of "ctrl_dev(ctrl)" as argument to
> pcie_link_is_active() to shorten the line.
> 
> With that addressed,
> Reviewed-by: Lukas Wunner <lukas@wunner.de>

-- 
With best wishes
Dmitry

