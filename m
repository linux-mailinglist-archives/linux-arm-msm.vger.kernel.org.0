Return-Path: <linux-arm-msm+bounces-88202-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 28279D07A9D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 09 Jan 2026 08:59:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2D10F30361D2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jan 2026 07:59:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CC112F6928;
	Fri,  9 Jan 2026 07:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TQ9G3sGk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XOLB7N++"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92F442F5A29
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jan 2026 07:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767945554; cv=none; b=uBEmRjkgKRhXuwcdiLB6f0kjezJeh+shOmSW6F7ChhZORbiJMZWF8bkAhQVCdtVztiuoCYDwnRRbmpwa2xC7/1LjOKshi811YwbTg30/xf2LNcr3BNsIshtF9aAzbWYVW/1ySMriHr4nK4YBoKeLWg7EoR2RyZRABDiz95oj9+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767945554; c=relaxed/simple;
	bh=20oprbe99mrw8N6Q+pLR09KbFExDNoA0lCTTXPurYCY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IIna0D6Z4gdfOvXyrQoayTl0Cc76X5appLu/J80Qs6eCEqoF7H2/Wkd4ZOAZlVe8Gk0SxYi8G1sfDYw7RDtBGmn+kAoTxuH3nUP4AcFoM3XaO5VydXz0QoNNK4bsAAFY5h5gaCY1aVbrK/6bsfrjQ/7MyOHhEDeaHOZQfmvDJAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TQ9G3sGk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XOLB7N++; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 608MpSsq3219827
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 Jan 2026 07:59:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gY9iEHXSaar+/asVR21mAoMD
	i9tA3WfBcc1ae+dnUno=; b=TQ9G3sGk90JAH1YCFDqZrKAaoWJyaczFxJOeGTLx
	NMEVooQ1pwMIiSo3lV1ekg5ul1mrMb+zp2aIlBxmIb7I97mf7fIS0eJkQd8+o3/j
	GzW4mdLqmOvjXs/icSa3u9l1QDr4NnGBrE4i5JIrx+b3Vru5mtKh380KSxAChAum
	9La5Z151rfXOAwtB6eQKLDwbwt8vE+umq4NYLoCpmt2ExZZHVnAGit0RkehQJ/rm
	KNo9NwA+/uCMNmfJ++5ySqy0jGh6OrK+MvKqKwcvgiXzCxrYt3XJV9vqLJGOvUrJ
	rttsjQJrqWujZANUYIuI90mkf+1CEUWzIW7prCwJ7L3k0Q==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjjt0hpgu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jan 2026 07:59:11 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2ae546fa935so18528247eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 23:59:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767945550; x=1768550350; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gY9iEHXSaar+/asVR21mAoMDi9tA3WfBcc1ae+dnUno=;
        b=XOLB7N++EbG2eDLawDj0uLXjAHqmFHLMk23tmfhVFKEsHBbKN+9OWobV/5dotwQSxG
         5yKisFUMwK8csmWwiLRvWWOoFjVwK/6vVaAszF5DS8fEqFWJA4xaKKEm/Knlh8EtA07r
         z4Yu1urwHPsRKAAW9T4ZwZRolZgoK/eaml4DV+0+sLK6TWzhhzg9I9wkieSmBFZyPhy6
         usF9nEcxrxJnSzqTfmufidNk3a+an29XJEBE+b7GZ65j5J7502HOpYINYkNjV6QjBR8c
         FKjWrqPANN9LUwbUI2eGpjpqZjSJIbhHqJGWRA6ogjLYaHtjVIQtoZzlujx29LzXqSAT
         6jOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767945551; x=1768550351;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gY9iEHXSaar+/asVR21mAoMDi9tA3WfBcc1ae+dnUno=;
        b=w/Wj9zLm5CHjkTzpwpxKwgoxIPJTy3ZjzksfzvaKUfuXo+8dYs69YZhe0DgjdrwTAZ
         prveyLLwpUBmCTdS/w1A60MPh+1DX4oO2Yns4mXqEdTBfO8WNU04VXhVZCE4S4uJ298X
         RXzDdcwgudOTEqwbu8vunC/y+bypVHlugCEZUH7vzbXbYSOS/FX5ynjY4JCB3CGfDkRK
         SJdvLkOxpvJs0peFGmH+MeJqh1aFQOGjGEK5akgpsoIlYiI/J1iml1G57vZX5C2gii82
         OXOgOJzF2MtDp+CCme8kYFQYJX1lxcriPq0FevHl5imPwECaP4ZhrrWwtPfGCrEnrkz7
         QySg==
X-Forwarded-Encrypted: i=1; AJvYcCV4PhU7SFq7f9qw3G/Rwsd6TjuYdYZ8gZhqn+aV1rrI1eFhdxKrP9xGNx54Y5XoiIMtnm6nTl5tYWOlzQLo@vger.kernel.org
X-Gm-Message-State: AOJu0YxrgsO4wHr1282Uay+2dHdUyqYzdo+M/AQzXbu7yK+z3uSd3JxH
	DONtJ/M8sxhXwCPAIjepSf2vvUoResMDs3D2aUcCeW0dTYfw3RpEk0GsY8X4CIBAMwPysSrUNvs
	P1fKfh1iFd4up96Kdr6BpmhoTbVz/MHyyQCAz2ZxOyr4nZ9WeQKMqcYb6y9nRbYJVVNxC
X-Gm-Gg: AY/fxX5DVYeo2/YamD+f3kyFvVlaLEhfdGs0K2u6Mrfvs8SRsRkbykrmksPC/lCzWcM
	6vOfc4f1P5w/M3tM7JxzA+4uE+UeBNjwaOIrE1+5k5BHAJlnhh/mJpH9wDiOrhmXhw9a2eClhg0
	guJJVn7vIhV/MySSxqJf2vq+Tt8/e6Z1+rcptXu0LWDx1Di5/e04EohWNeGYCKxvBNFR/SnmaHe
	lnBBzHh24V2T1+KuEprCN0+oh94SY66hTcZrEBXSJH+RVNpoxhhpn914wLK/LXqnWsTUlj9As3C
	CKW/5C5/Klz0/ajkYSxOhRNKUn9+yq6EM9kroOsjUybmFEd8VTcp1Q3cuSeJgzMaEOVddudwuq2
	Cq8LRvJYyAYNah2N9ahENGmBaN9/TbgfIlEbQdPmjFQ1PTwVe4tDMaK12
X-Received: by 2002:a05:7022:e07:b0:11f:3483:bbb0 with SMTP id a92af1059eb24-121f8ae75e8mr7031115c88.19.1767945550411;
        Thu, 08 Jan 2026 23:59:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG3d0juRmwLBIp3YmHg/Niju/fMNLgYKKjY4LGEf0G9IFzmUnA/cqDtsNCjmnkqlxwt1Ln7GA==
X-Received: by 2002:a05:7022:e07:b0:11f:3483:bbb0 with SMTP id a92af1059eb24-121f8ae75e8mr7031086c88.19.1767945549756;
        Thu, 08 Jan 2026 23:59:09 -0800 (PST)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121f24a65b9sm12877992c88.17.2026.01.08.23.59.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 23:59:08 -0800 (PST)
Date: Thu, 8 Jan 2026 23:59:07 -0800
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>, Jingoo Han <jingoohan1@gmail.com>,
        linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Wenbin Yao <wenbin.yao@oss.qualcomm.com>
Subject: Re: [PATCH 2/5] PCI: dwc: Add new APIs to remove standard and
 extended Capability
Message-ID: <aWC1S3m1V4JotL9C@hu-qianyu-lv.qualcomm.com>
References: <20251109-remove_cap-v1-2-2208f46f4dc2@oss.qualcomm.com>
 <20251226210741.GA4141010@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251226210741.GA4141010@bhelgaas>
X-Proofpoint-GUID: _m4XS0Cl6FDx1vNguA4xqm8wp__x4VbL
X-Authority-Analysis: v=2.4 cv=VJzQXtPX c=1 sm=1 tr=0 ts=6960b54f cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=keqCWTWlQfiW9DbH:21 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=D5-yWOEsi3iyDatbWL8A:9
 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19 a=CjuIK1q_8ugA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: _m4XS0Cl6FDx1vNguA4xqm8wp__x4VbL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDA1NSBTYWx0ZWRfXytJC9zJQBsx5
 7n40OVP3/Y+wiZyoQ9iudUzCT73Oxrw32hP9p/QjyDOhestUUOZbwBlLrYB2hl+uLZ48+Dkt5de
 82JI/ycDQJrsV1qsXS6IyYhLviGmL0W1dOYfXd4AzilWc+1IqY9NzIC+bhHyTYYOuEotL+URYjg
 ikv7H3tWUmFnrvJ+WByOLbZ039WKI1JuC+SZ1csqa6R1qZXluIIPJ9eHg4uJyR4fUD4yjyRUXMZ
 GjnLTj/9/0rEvtTME2DBM7Dt9ZR9EfPnI4HeM76Mji1NURDEtzcsXY9Sr1wfC+p0GU0l5XwZ2lK
 pvlwtoA1OhNiKWfCKr3sneVx3ZPjbAuMg7/Z/umDLG3yL6OhxXY5QdssGLhIO7zWop37OePsHqF
 SANQrEsmJ7IMx89TTcTXhSZjA2rNXiAwTAB/2kvFCYnmA6XQDRQmPbgLMmZNS3Aj2vIpnWG9SC5
 rivj+KMqNjom6/dLcdg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_02,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601090055

On Fri, Dec 26, 2025 at 03:07:41PM -0600, Bjorn Helgaas wrote:
> On Sun, Nov 09, 2025 at 10:59:41PM -0800, Qiang Yu wrote:
> > On some platforms, certain PCIe Capabilities may be present in hardware
> > but are not fully implemented as defined in PCIe spec. These incomplete
> > capabilities should be hidden from the PCI framework to prevent unexpected
> > behavior.
> > 
> > Introduce two APIs to remove a specific PCIe Capability and Extended
> > Capability by updating the previous capability's next offset field to skip
> > over the unwanted capability. These APIs allow RC drivers to easily hide
> > unsupported or partially implemented capabilities from software.
> 
> It's super annoying to have to do this, but I suppose from the
> hardware point of view these things *could* work depending on the
> design of the platform outside the device.  So the designers probably
> assume platform firmware knows those details and hides things that
> aren't supported.  But in the DT case, there likely *is* no platform
> firmware, so the native RC driver has to do it instead.
> 
> > Co-developed-by: Wenbin Yao <wenbin.yao@oss.qualcomm.com>
> > Signed-off-by: Wenbin Yao <wenbin.yao@oss.qualcomm.com>
> > Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > ---
> >  drivers/pci/controller/dwc/pcie-designware.c | 53 ++++++++++++++++++++++++++++
> >  drivers/pci/controller/dwc/pcie-designware.h |  2 ++
> >  2 files changed, 55 insertions(+)
> > 
> > diff --git a/drivers/pci/controller/dwc/pcie-designware.c b/drivers/pci/controller/dwc/pcie-designware.c
> > index 5585d3ed74316bd218572484f6320019db8d6a10..24f8e9959cb81ca41e91d27057cc115d32e8d523 100644
> > --- a/drivers/pci/controller/dwc/pcie-designware.c
> > +++ b/drivers/pci/controller/dwc/pcie-designware.c
> > @@ -234,6 +234,59 @@ u16 dw_pcie_find_ext_capability(struct dw_pcie *pci, u8 cap)
> >  }
> >  EXPORT_SYMBOL_GPL(dw_pcie_find_ext_capability);
> >  
> > +void dw_pcie_remove_capability(struct dw_pcie *pci, u8 cap)
> > +{
> > +	u8 cap_pos, pre_pos, next_pos;
> > +	u16 reg;
> > +
> > +	cap_pos = PCI_FIND_NEXT_CAP(dw_pcie_read_cfg, PCI_CAPABILITY_LIST, cap,
> > +				 &pre_pos, pci);
> > +	if (!cap_pos)
> > +		return;
> > +
> > +	reg = dw_pcie_readw_dbi(pci, cap_pos);
> > +	next_pos = (reg & 0xff00) >> 8;
> > +
> > +	dw_pcie_dbi_ro_wr_en(pci);
> > +	if (pre_pos == PCI_CAPABILITY_LIST)
> > +		dw_pcie_writeb_dbi(pci, PCI_CAPABILITY_LIST, next_pos);
> > +	else
> > +		dw_pcie_writeb_dbi(pci, pre_pos + 1, next_pos);
> > +	dw_pcie_dbi_ro_wr_dis(pci);
> > +}
> > +EXPORT_SYMBOL_GPL(dw_pcie_remove_capability);
> > +
> > +void dw_pcie_remove_ext_capability(struct dw_pcie *pci, u8 cap)
> > +{
> > +	int cap_pos, next_pos, pre_pos;
> > +	u32 pre_header, header;
> > +
> > +	cap_pos = PCI_FIND_NEXT_EXT_CAP(dw_pcie_read_cfg, 0, cap, &pre_pos, pci);
> > +	if (!cap_pos)
> > +		return;
> > +
> > +	header = dw_pcie_readl_dbi(pci, cap_pos);
> 
> Blank line here to match style of other comments.
> 
> > +	/*
> > +	 * If the first cap at offset PCI_CFG_SPACE_SIZE is removed,
> > +	 * only set it's capid to zero as it cannot be skipped.
> 
> If setting the capid to zero works here, why won't it work for all
> capabilities?  If setting capid to zero is enough, we wouldn't need to
> mess with keeping track of the previous capability, and we could drop
> the first patch.

I tried this. Setting capid to zero only works for extended capabilities,
not standard ones. Standard cap id is RO and can not be cleared.

- Qiang Yu
> 
> s/it's/its/
> 
> > +	 */
> > +	if (cap_pos == PCI_CFG_SPACE_SIZE) {
> > +		dw_pcie_dbi_ro_wr_en(pci);
> > +		dw_pcie_writel_dbi(pci, cap_pos, header & 0xffff0000);
> > +		dw_pcie_dbi_ro_wr_dis(pci);
> > +		return;
> > +	}
> > +
> > +	pre_header = dw_pcie_readl_dbi(pci, pre_pos);
> > +	next_pos = PCI_EXT_CAP_NEXT(header);
> > +
> > +	dw_pcie_dbi_ro_wr_en(pci);
> > +	dw_pcie_writel_dbi(pci, pre_pos,
> > +			  (pre_header & 0xfffff) | (next_pos << 20));
> > +	dw_pcie_dbi_ro_wr_dis(pci);
> > +}
> > +EXPORT_SYMBOL_GPL(dw_pcie_remove_ext_capability);
> > +
> >  static u16 __dw_pcie_find_vsec_capability(struct dw_pcie *pci, u16 vendor_id,
> >  					  u16 vsec_id)
> >  {
> > diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
> > index e995f692a1ecd10130d3be3358827f801811387f..b68dbc528001b63448db8b1a93bf56a5e53bd33e 100644
> > --- a/drivers/pci/controller/dwc/pcie-designware.h
> > +++ b/drivers/pci/controller/dwc/pcie-designware.h
> > @@ -552,6 +552,8 @@ void dw_pcie_version_detect(struct dw_pcie *pci);
> >  
> >  u8 dw_pcie_find_capability(struct dw_pcie *pci, u8 cap);
> >  u16 dw_pcie_find_ext_capability(struct dw_pcie *pci, u8 cap);
> > +void dw_pcie_remove_capability(struct dw_pcie *pci, u8 cap);
> > +void dw_pcie_remove_ext_capability(struct dw_pcie *pci, u8 cap);
> >  u16 dw_pcie_find_rasdes_capability(struct dw_pcie *pci);
> >  u16 dw_pcie_find_ptm_capability(struct dw_pcie *pci);
> >  
> > 
> > -- 
> > 2.34.1
> > 

