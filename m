Return-Path: <linux-arm-msm+bounces-90281-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0Fz5JO4Qc2klsAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90281-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 07:10:54 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A883670C8F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 07:10:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9BEE73017263
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 06:10:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22D2039F8D3;
	Fri, 23 Jan 2026 06:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pRxdSwgT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HM4NHCFk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75E76366072
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 06:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769148646; cv=none; b=j02RbyjNAWqal7DhDvDNFBj+q6JevtNGRhpcAv28SGMqxrnrvhHpjV1HLGA22UwQNXfEKRtKgqXaj0vssmsbwM2gTlbRZ3vFhl/snddHgDkIbhBrFCQKxeiyFWh0HNew3DKzyK7LGGWukOtpCJTJ4xZdV0yywEzOpTV2dFMMaIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769148646; c=relaxed/simple;
	bh=7DwBEXQwbuM8V0RjiIN3bpWAFKhbhLnErqDoHuo25S4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fOOf4yj/ndZt7djyqkHbfYmrn4GEGdh8LWI/qZTieWs7Lw2Op/kTbsevyu3XQeHVHdTYgZY/uejLDV2FLcp4lrlrgtAJagis2SmCVf9axXgmMqQ6DUZmYgBkxctUvei20FBnrAqP3vp+OSWo4mhCiYo6feiqZ66kCr7J7TXUB4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pRxdSwgT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HM4NHCFk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60N5pY7e2912619
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 06:10:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MVdVZL5ikcWAyrZ57t/De6njehpr5hrw/dpfdhPE7mg=; b=pRxdSwgT9R6Ed/B0
	65wqjlYuo5PLzwTW/FpsGFJzOWrWJ8fEy7u4TuzVJkcjB41wny3tK+CVTipjlO2s
	uh/UUi6KG0ZVP8/N3+J4ZOB7Fa/+YMbxsQXDXLVzn8R0AlX/+pALqzAlzdSS7Rq0
	fndLVaXOKGDqm8Rkyf8lXr7RPOfz5hxF9lfzm7/Tauy8ttC09Omr+1+xUSjGnFIe
	Ci9Pzf6gVAYsCJWH3lG5JkSjlNK8x1mczScnN45NDbvBrFn1Moxxcq+8yJb+HoqH
	m/cne1BSybpAowzwc1G4QrHyzcHlSjBVBO3FJaTM3EEMLFQrtYVde4oj/wYwrSFo
	D466YQ==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4buvs1sc81-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 06:10:37 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-11b94abc09dso2735946c88.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 22:10:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769148637; x=1769753437; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MVdVZL5ikcWAyrZ57t/De6njehpr5hrw/dpfdhPE7mg=;
        b=HM4NHCFkZaBIP4yMXGDuRR7dXA5kWAfAqQHlBX4iVYkoziYA5zaFl0nJV0d3v0ugpN
         91VguCzqqfduEw63nxFT1GqVYUdXGYHq2lXCMZK+DzvIiIFoHRfPA86h07hGF6plQTie
         cjQ/0lQTKjxeUwxmcv5DvwokgmfrGddlC+iLVvc+mfHUBKOj82rLHfQk3LwbGpR5Z+pq
         lc8YleifZxM2GPj4uOdugjmAEhTyModsEEXkNun6016X/sJXZ09GuUxSU6n0rb22uyve
         8oOrKJZnNQUmhrGOzH2ZC9bY08AjPEVW3aPce3ucrwqdehf3Q71U30KCMyrNctZ8dP+n
         uoIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769148637; x=1769753437;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MVdVZL5ikcWAyrZ57t/De6njehpr5hrw/dpfdhPE7mg=;
        b=kJVYzzTDcggEMelVqzOQMP+NwVgPofcjW5UhJ7qAWXM/+mrxNsgOucCGr1qHPXGEa8
         N44U+ypPbBtsVDSTVgDld/73Ku31pPg/jAEv3nkFfZJVo0Q4K8fX6p6O3X+Tm0rj7Tq3
         J4s8kh2YinsnzMQhUgUx0DONBewgdt2dK2A9QqGP+MV5NeEMx64N4gSDly7zJam+Sq9C
         KQgpXdRmL3ox2LNTDNQIZbibNTibQh/GbeQm46MvXhluMi0SBFVthYhxXyJIjSl58roE
         BEyQ9r9qT0nsHfk/BjOdnaC0jn5kHQMga1kn86GuuuAnrpY79oHRuz0R9Mu4kjTA+Xvp
         OF5A==
X-Forwarded-Encrypted: i=1; AJvYcCVQiQ0PlD39FyyWby/J4eisYSKdJNwXj7tfFgTc1CDwDaBVRJBuhEDiF0e/xN1jB46JE9XJpFQKsH0sO1C3@vger.kernel.org
X-Gm-Message-State: AOJu0YyQuFnlo+/vgpvuhaUNFDIf9vtTdGB9CACmx/ewigKbwc5Fr/3I
	YU5l2807i2vG3qOnYFgu7/NvVny6GsGHA5KuCy8MzQTMWIGxeFaMRISK5uNoJAfKOCyoFkxtFnd
	rAtzqelAgyjzGYv3cwvRfc+/hwAGoAss+Wy/LYROSFuXQ8+ymr8V427pT/12z30XvLHyw
X-Gm-Gg: AZuq6aKa6HkZSFKMtHlscNLUQxsbU3dlAy5I6QENAP70wO5sS3IkT7baxbDwJaTA7+d
	wWQr2BiBX7ealuPFO7tIaFuaxEdC+ou3ezrb+o0hRokUxethb6WKSL8meffotaeztHmRztulsjF
	AY3W3ygnZjdHtSzlTcY8EKQ5zs178kdbX4SEBCA9um9zDrhDPfA/U5lQJAckwzgJADQ4KeA7XTI
	uYJKoONc9So9blTPXGO8xxbKOJ1XhrW/G2I8aM0TMGCYtdBa8N3PUSR7DQniH5z02Yl1qbQ17N4
	L5T6cd0u8GzsGta4l7EryLEG1o7V7J1vg8HtzDI/cJor0/xR6LQKiP6LdldqV7WZ8nM0nGVBWor
	rh1C5UTwlEzmq+JfRIayB7207/jPpqRlzHnKmc0DbnPaHgLp4jSnTuZjy
X-Received: by 2002:a05:7022:b8d:b0:121:9f05:c4c2 with SMTP id a92af1059eb24-1247dbf5560mr892474c88.23.1769148636754;
        Thu, 22 Jan 2026 22:10:36 -0800 (PST)
X-Received: by 2002:a05:7022:b8d:b0:121:9f05:c4c2 with SMTP id a92af1059eb24-1247dbf5560mr892460c88.23.1769148636169;
        Thu, 22 Jan 2026 22:10:36 -0800 (PST)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12480a8277bsm1055277c88.9.2026.01.22.22.10.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 22:10:35 -0800 (PST)
Date: Thu, 22 Jan 2026 22:10:34 -0800
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: Jingoo Han <jingoohan1@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/2] PCI: dwc: Rename has_msi_ctrl to uses_imsi_rx for
 clarity
Message-ID: <aXMQ2r1UKgAaYvNx@hu-qianyu-lv.qualcomm.com>
References: <20260121-remove_cap_clean_up-v1-0-e78115e5d467@oss.qualcomm.com>
 <20260121-remove_cap_clean_up-v1-2-e78115e5d467@oss.qualcomm.com>
 <09f9acc1-d1ad-4971-8488-f0268cf08799@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <09f9acc1-d1ad-4971-8488-f0268cf08799@rock-chips.com>
X-Proofpoint-GUID: dNIcJFyM6vEIi_yFcVei0eTbSDzMzK5t
X-Proofpoint-ORIG-GUID: dNIcJFyM6vEIi_yFcVei0eTbSDzMzK5t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDA0NSBTYWx0ZWRfX7VWaUpP7zIBq
 pVU3rhxwmv39xs/338weaHnPlNuf1l1rBSKRp4TXs4jC80RRnHeO+f1cF+ah4SegqEWTG/JJmqo
 ELY17esygAh2ZNz9jvtxyFR86WDZFeWIU0aMAPhGPm5W5hSSXZFAicRxCAlUFrnyD8tE+RVXHYP
 c8kEAS29yVcXqcsI9kHlVp/2oUvg5/JGKzUKfMe79g3rn3ccl6//40QX4aqWWCJKpdQI9Ziqb/E
 FAKiXmW8X7MH3bgg6Qo3UV9uebfgAxPhQs1PCxZwOt1e6DISUjgFIgsDxWjjUuig0pRyAjBPTXY
 Z9CxBUlwgPIx6Ul3V8x429s+JFsGkjW2TplUpVZlQUAywJPnvnWVMjWflybIVTPuFkEXIsjgoXZ
 9SSKNZOLjQiFjlZveV0dsug4vlihbAbcKZlfnK+kGWIaaCfxjhJy5uG7zFnCERtyEZ482LmcTMo
 SWDmdJYR8uAxX3YsFqw==
X-Authority-Analysis: v=2.4 cv=faSgCkQF c=1 sm=1 tr=0 ts=697310dd cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=s8YR1HE3AAAA:8 a=EUspDBNiAAAA:8
 a=TCKWscKuthCW2cRljzYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_06,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 phishscore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601230045
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,google.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90281-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.974];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A883670C8F
X-Rspamd-Action: no action

On Thu, Jan 22, 2026 at 04:15:52PM +0800, Shawn Lin wrote:
> Hi Qiang,
> 
> 在 2026/01/22 星期四 15:45, Qiang Yu 写道:
> > The current "has_msi_ctrl" flag name is misleading because it suggests the
> > presence of any MSI controller, while it is specifically set for platforms
> > that lack .msi_init() callback and don't have "msi-parent" or "msi-map"
> > device tree properties, indicating they rely on the iMSI-RX module for MSI
> > functionality.
> > 
> > Rename it to "uses_imsi_rx" to make the intent clear:
> > - When true: Platform uses the iMSI-RX module for MSI handling
> > - When false: Platform has other MSI controller support (ITS/MBI, custom
> > handlers)
> > 
> > No functional changes, only improves code readability and eliminates
> > naming confusion.
> > 
> 
> I love this patch, it's indeed confusing. But I noticed the naming
> seems inconsistency, for instance, there are already use_atu_msg,
> use_parent_dt_ranges, etc. Should we use use_imsi_rx instead?

Thank you. You are right. Use_imsi_rx is more consistency.

- Qiang Yu
> 
> But in any case,
> Reviewed-by: Shawn Lin <shawn.lin@rock-chips.com>
> 
> > Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > ---
> >   drivers/pci/controller/dwc/pcie-designware-host.c | 16 ++++++++--------
> >   drivers/pci/controller/dwc/pcie-designware.h      |  2 +-
> >   drivers/pci/controller/dwc/pcie-qcom.c            |  4 ++--
> >   3 files changed, 11 insertions(+), 11 deletions(-)
> > 
> > diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
> > index a17833dd6f9d4b4aa06dc1fe09ffed5e2c28a82f..e7dbdf3670b426783e778be5064def10d2b209b1 100644
> > --- a/drivers/pci/controller/dwc/pcie-designware-host.c
> > +++ b/drivers/pci/controller/dwc/pcie-designware-host.c
> > @@ -255,7 +255,7 @@ void dw_pcie_msi_init(struct dw_pcie_rp *pp)
> >   	u64 msi_target = (u64)pp->msi_data;
> >   	u32 ctrl, num_ctrls;
> > -	if (!pci_msi_enabled() || !pp->has_msi_ctrl)
> > +	if (!pci_msi_enabled() || !pp->uses_imsi_rx)
> >   		return;
> >   	num_ctrls = pp->num_vectors / MAX_MSI_IRQS_PER_CTRL;
> > @@ -603,15 +603,15 @@ int dw_pcie_host_init(struct dw_pcie_rp *pp)
> >   	}
> >   	if (pci_msi_enabled()) {
> > -		pp->has_msi_ctrl = !(pp->ops->msi_init ||
> > +		pp->uses_imsi_rx = !(pp->ops->msi_init ||
> >   				     of_property_present(np, "msi-parent") ||
> >   				     of_property_present(np, "msi-map"));
> >   		/*
> > -		 * For the has_msi_ctrl case the default assignment is handled
> > +		 * For the uses_imsi_rx case the default assignment is handled
> >   		 * in the dw_pcie_msi_host_init().
> >   		 */
> > -		if (!pp->has_msi_ctrl && !pp->num_vectors) {
> > +		if (!pp->uses_imsi_rx && !pp->num_vectors) {
> >   			pp->num_vectors = MSI_DEF_NUM_VECTORS;
> >   		} else if (pp->num_vectors > MAX_MSI_IRQS) {
> >   			dev_err(dev, "Invalid number of vectors\n");
> > @@ -623,7 +623,7 @@ int dw_pcie_host_init(struct dw_pcie_rp *pp)
> >   			ret = pp->ops->msi_init(pp);
> >   			if (ret < 0)
> >   				goto err_deinit_host;
> > -		} else if (pp->has_msi_ctrl) {
> > +		} else if (pp->uses_imsi_rx) {
> >   			ret = dw_pcie_msi_host_init(pp);
> >   			if (ret < 0)
> >   				goto err_deinit_host;
> > @@ -701,7 +701,7 @@ int dw_pcie_host_init(struct dw_pcie_rp *pp)
> >   	dw_pcie_edma_remove(pci);
> >   err_free_msi:
> > -	if (pp->has_msi_ctrl)
> > +	if (pp->uses_imsi_rx)
> >   		dw_pcie_free_msi(pp);
> >   err_deinit_host:
> > @@ -729,7 +729,7 @@ void dw_pcie_host_deinit(struct dw_pcie_rp *pp)
> >   	dw_pcie_edma_remove(pci);
> > -	if (pp->has_msi_ctrl)
> > +	if (pp->uses_imsi_rx)
> >   		dw_pcie_free_msi(pp);
> >   	if (pp->ops->deinit)
> > @@ -1130,7 +1130,7 @@ int dw_pcie_setup_rc(struct dw_pcie_rp *pp)
> >   	 * the MSI and MSI-X capabilities of the Root Port to allow the drivers
> >   	 * to fall back to INTx instead.
> >   	 */
> > -	if (pp->has_msi_ctrl) {
> > +	if (pp->uses_imsi_rx) {
> >   		dw_pcie_remove_capability(pci, PCI_CAP_ID_MSI);
> >   		dw_pcie_remove_capability(pci, PCI_CAP_ID_MSIX);
> >   	}
> > diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
> > index 53b65428fadb3d905b02bdcc06667065574f4f9d..33154bc89dd3b7d7fbe0ea749ca22bdc8292489c 100644
> > --- a/drivers/pci/controller/dwc/pcie-designware.h
> > +++ b/drivers/pci/controller/dwc/pcie-designware.h
> > @@ -416,7 +416,7 @@ struct dw_pcie_host_ops {
> >   };
> >   struct dw_pcie_rp {
> > -	bool			has_msi_ctrl:1;
> > +	bool			uses_imsi_rx:1;
> >   	bool			cfg0_io_shared:1;
> >   	u64			cfg0_base;
> >   	void __iomem		*va_cfg0_base;
> > diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> > index 13e6c334e10d21b9ebfe5f82de0aff3bce6191e3..999f5e083cef4e78b85a0111d2a90c3de65c83b5 100644
> > --- a/drivers/pci/controller/dwc/pcie-qcom.c
> > +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> > @@ -1633,7 +1633,7 @@ static void qcom_pci_free_msi(void *ptr)
> >   {
> >   	struct dw_pcie_rp *pp = (struct dw_pcie_rp *)ptr;
> > -	if (pp && pp->has_msi_ctrl)
> > +	if (pp && pp->uses_imsi_rx)
> >   		dw_pcie_free_msi(pp);
> >   }
> > @@ -1657,7 +1657,7 @@ static int qcom_pcie_ecam_host_init(struct pci_config_window *cfg)
> >   	if (ret)
> >   		return ret;
> > -	pp->has_msi_ctrl = true;
> > +	pp->uses_imsi_rx = true;
> >   	dw_pcie_msi_init(pp);
> >   	return devm_add_action_or_reset(dev, qcom_pci_free_msi, pp);
> > 
> 

