Return-Path: <linux-arm-msm+bounces-98012-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SB44NExSuGmKcAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98012-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 19:56:12 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5242829F5E9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 19:56:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C94DC307518C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 18:50:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 535983E6DC2;
	Mon, 16 Mar 2026 18:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YeiJiSl5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CtGi80yC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A12B43E5EF8
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 18:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773687009; cv=none; b=uT2/mOJ2n5dt/YCjbSAA2mOXsjcntp27n5o0EuMC5hc3cscf37A2RMCXkAW8igdg9aXqtT8sZ1bp8d4gR1m7+q37tChAcEfHwifHQ8KZ47vfTI6ub86SCq0WOGLUNi3rtSAs9NPpOgzqXNnNGUM85jpfEZzd1+UeoHMDWbB9hTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773687009; c=relaxed/simple;
	bh=ORllslclmOecdR8jjJRilEN0RM9ZfL3iRuzznWlzXDc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ljWOUpqw2bfnDTzb9CeS3JrWD4DZ9grwSz9pDq82Z/wGkwqY0RlQjMQq/liTlVqwLpw3HDfHOnPSB/oKTJ3HYX0kcjlPzRj6KR4OVOjP0pMfrzSJp8inOowk2vo3kAWCkjOE9RajYlQRl7Mesp47wDvwSWTZgdT6xBQLA1spfJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YeiJiSl5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CtGi80yC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62GIlJEx1428820
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 18:50:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hl0a6sUmp0DkvLU0LqWwqkjbWyZqCa4rM7hGljELxLU=; b=YeiJiSl5ylcjuBqo
	JLCCCjdfyaY0P7hSHeH9IsIXsowGuZ7DxN4Hw0YYDQAfI5pKIsvUrizF79RnYmA3
	xKqITLewGKcEa6O7/m5ptwZevfgf5vi8dU9mxQKcf4xE3fwUee4s2YVwZC2t5PRp
	X9EbLF0gW0P6ZfJBdslzoZzfh/1VmhUfqNekM1VO9F991759geoCm/DY9HC+GJ39
	bFGi3McuYPJ2rYewW580PglNRMztWqV9a604wjvJ/ixY7SW7Y7QXt1PfTdi0L9zY
	NyLtR0ACN+inYv6Z3RgaP7jAmTbrFwvlZ2bxwI8fMoHknW5edwWeONwWeFmMJPSY
	KTKvVQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxh999mj6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 18:50:04 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd7ea0bb20so2885059285a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 11:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773687004; x=1774291804; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hl0a6sUmp0DkvLU0LqWwqkjbWyZqCa4rM7hGljELxLU=;
        b=CtGi80yCc/Y+FaFVeHNcB+QLx7E6ZigoMT/oosG3/6odiP75d5raDkwzVXIB5Y/QSl
         IrukxEZF+BZxrWepu2mpi1btuFBHvE80MTllFs7wROcuBzjqQnx4ygpm3UW7Ju1XAWmM
         uQBusNuKI5LJNTWOfusGxLTfVezV/RSwBfPltJpnSTLO9syNKavfA6ghpZ+2IPfJjsUp
         utw0lCJOhAKnQ8UskCkDRFfhjpBTByQn3YNXLcjv5O04EgUoJ4h2Ps0MsdoWJpe8ZC4g
         a4WPU/bEON2PXwk9B48GrhFVg7ZKm6tbwbrKvGmbr9RQnnoMeLXCc+YFmTM8tGolshcg
         M1Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773687004; x=1774291804;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hl0a6sUmp0DkvLU0LqWwqkjbWyZqCa4rM7hGljELxLU=;
        b=VTaHGcil04vF/S7jIynOzp0MMkwMTT4b7U13HpuUDtZZ+SVWJfMP4F6yNiTClluk/X
         gvlF249oO4DRIFVDSsPZxVQ3RVZ61EZa5IJ8e5yoZiYEu+tGI0t+WMT0Uneo39lgjxiI
         88Xt3n1R4uJHVQKG83GSRubVY+ODGUTickcznx4QuTSbCxWd6dKnbp0jxjDm5ox7EfEI
         wHq/D++ZHMYDmFGddcUPgyPdhyK9nO15HAGSHJAvDIpN3+Ux/GPh1C2TT/ZJ+ZeFXnH7
         /2akcOwIoEWuoWjO4aDfU9Odju1pZZ7L6/rYMi8sh49fJWj55OmXaN+7M682hrGKRKdJ
         ohmw==
X-Forwarded-Encrypted: i=1; AJvYcCVywnqs65oBKJgHxhcOAMMF/M1hgu1IykMyTk0TfBbU2DpZaAPcKGGLHCoJB4UtoiW2IeHyAcoMgeNZ3upM@vger.kernel.org
X-Gm-Message-State: AOJu0YziNE61La5wHDv0cq8X3y4zrGHA0FcBl7YhieeoAO3fsdfJDYP6
	NUW2m7aJviD07ZT5bXiitFtIJcAJbLufxGi59Vo7HAX6EhR41IioK0gPDCYQrkugXb5c4e34e5u
	lNyYo9E4C1eUPLaeJnHKbhXPr+vT4HGWlidp1xm2kFzbIP60Ie/ATuzFhG+Y3pJX0bCPa
X-Gm-Gg: ATEYQzxwebRtpCF5jmkukvMELiZl881VRMUy47vuuXOEeuqIm+qQwBhKCR60XpzWUFD
	CwCYcXGNXPnVi9xmVcntlp+qLZXhn+mbM6CssC14Z+OXt3NB5zNYfHXtS2YZe6t4biIK2f8hITK
	NdSfe+Kpg4WTQwutBR70Ly7qCH3bgGf7t0cyOavxc8ynaQX5ljzi1j354svdF2xxry75xHggogV
	2b7qBdGxdjZWX9D77UtiPStllVlYJcNl5H7nIXU84Ho4/5QV9/2AWqRT9TiD/mYqYHiuYjbIFy7
	xyqPw4EDmdtZRYjIQKI/Ku3vI2AmMChOyuaN/rS/8Hef2+DCRP/uDM+b+fAzn2/r/4vBNIhwHZk
	TkhZzkoGWt6oZw1TO3lYdsQHmYO0hC+rO3/hVTAnuSrjrPO9fP839il/UxHvJ5Bjjg7c/4gOpML
	51UVmrg6T2R8lz/L50WlIm2cdgi+5xXORjU94=
X-Received: by 2002:a05:620a:711a:b0:8cb:62c3:3690 with SMTP id af79cd13be357-8cdb5a4fac5mr1890956585a.13.1773687003734;
        Mon, 16 Mar 2026 11:50:03 -0700 (PDT)
X-Received: by 2002:a05:620a:711a:b0:8cb:62c3:3690 with SMTP id af79cd13be357-8cdb5a4fac5mr1890952785a.13.1773687003057;
        Mon, 16 Mar 2026 11:50:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a67e5ec94sm32925111fa.22.2026.03.16.11.50.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 11:50:01 -0700 (PDT)
Date: Mon, 16 Mar 2026 20:49:59 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
Cc: Nipun Gupta <nipun.gupta@amd.com>, Nikhil Agarwal <nikhil.agarwal@amd.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Marc Zyngier <maz@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Thomas Gleixner <tglx@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Richard Zhu <hongxing.zhu@nxp.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Juergen Gross <jgross@suse.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Prakash Gupta <prakash.gupta@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-pci@vger.kernel.org, imx@lists.linux.dev,
        xen-devel@lists.xenproject.org, linux-arm-msm@vger.kernel.org,
        Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
Subject: Re: [PATCH v10 2/3] of: factor arguments passed to of_map_id() into
 a struct
Message-ID: <scvvpx72isnlqm4f4eub7syezmhtw5xd3agj34lonhcc5s5zj5@nsbfsbgidnw4>
References: <20260309-parse_iommu_cells-v10-0-c62fcaa5a1d8@oss.qualcomm.com>
 <20260309-parse_iommu_cells-v10-2-c62fcaa5a1d8@oss.qualcomm.com>
 <esfzpgpgenydif2sxahsetkglz6kewsgjhkmzr6ulrrkctnkbq@a4zsfdmhbxui>
 <27edd195-b0d3-4214-9df3-74a84da1e3e1@oss.qualcomm.com>
 <dyjdwxaq4oc7ahri3iuhnmobh3gwmn6drhox7t2elep4rlqhuq@fe4gp5t7q5r5>
 <dbfcbc9c-2175-49a3-aee4-434b69cbaece@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dbfcbc9c-2175-49a3-aee4-434b69cbaece@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=RJ++3oi+ c=1 sm=1 tr=0 ts=69b850dc cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=VXU4VRlCQCtIJetfhaMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDE0OSBTYWx0ZWRfX2wmSvEWjIdU/
 YgdZ9sQdtUXKwiWSEoj8zZuP0HnzEJhDtGn4pSlryIR89xIXt2x9z+oVcJbcVWqFU4Icl4isHyT
 94Za/nQhLIqDNpPl5yKBbNSuowvGl5/heG7DEvqA85JpmYOUTsVUM2BhSEZHMjhdrCYClMmfi5P
 szlRhw52stmFyPAX/qngrrZxxHNsle4fXBVepukDC8/shoSgBgHMLR9ngGrywjvU+UztRxI3Kl6
 Vh93uCmC4SW0qW/V1+OTU5DLqORPBCG8Wk3Gd5+6MpIKaAs6s900W7McuZYnwXP+B+oo991QPS6
 31XLH6oyw8AIj9Y8iBvvaR2T6ZcxPnNPFx0Q1EDFFmsCjUR48AUgzYAuPZbaKoLUQ6Fk8i32LG9
 QBP/fIPgUEXTKSNb2n8+utTib5cX8hH5B+7PwrtE1h4MmJFeF670Absp2iA2QzvWvGI6C8qfTpo
 tbSmG8YWOcww1rbj5xg==
X-Proofpoint-ORIG-GUID: yTZtMMkDJqtbIaYDC3atHjCHKTUm_dOx
X-Proofpoint-GUID: yTZtMMkDJqtbIaYDC3atHjCHKTUm_dOx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_05,2026-03-16_06,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603160149
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98012-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[38];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[amd.com,8bytes.org,kernel.org,arm.com,nxp.com,pengutronix.de,google.com,gmail.com,suse.com,epam.com,oss.qualcomm.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5242829F5E9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 16, 2026 at 10:37:25PM +0530, Vijayanand Jitta wrote:
> 
> 
> On 3/12/2026 7:48 PM, Dmitry Baryshkov wrote:
> > On Thu, Mar 12, 2026 at 05:12:51PM +0530, Vijayanand Jitta wrote:
> >>
> >>
> >> On 3/10/2026 2:53 AM, Dmitry Baryshkov wrote:
> >>> On Mon, Mar 09, 2026 at 01:03:38AM +0530, Vijayanand Jitta wrote:
> >>>> From: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
> >>>>
> >>>> Change of_map_id() to take a pointer to struct of_phandle_args
> >>>> instead of passing target device node and translated IDs separately.
> >>>> Update all callers accordingly.
> >>>>
> >>>> Subsequent patch will make use of the args_count field in
> >>>> struct of_phandle_args.
> >>>>
> >>>> Suggested-by: Rob Herring (Arm) <robh@kernel.org>
> >>>> Signed-off-by: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
> >>>> Signed-off-by: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
> >>>> ---
> >>>>  drivers/cdx/cdx_msi.c                    |  5 ++-
> >>>>  drivers/iommu/of_iommu.c                 |  2 +-
> >>>>  drivers/irqchip/irq-gic-its-msi-parent.c | 11 ++++--
> >>>>  drivers/of/base.c                        | 63 ++++++++++++++++----------------
> >>>>  drivers/of/irq.c                         |  8 +++-
> >>>>  drivers/pci/controller/dwc/pci-imx6.c    | 16 ++++++--
> >>>>  drivers/pci/controller/pcie-apple.c      |  5 ++-
> >>>>  drivers/xen/grant-dma-ops.c              |  4 +-
> >>>>  include/linux/of.h                       | 12 +++---
> >>>>  9 files changed, 76 insertions(+), 50 deletions(-)
> >>>>
> >>>> diff --git a/drivers/cdx/cdx_msi.c b/drivers/cdx/cdx_msi.c
> >>>> index 63b3544ec997..03232b5ffbca 100644
> >>>> --- a/drivers/cdx/cdx_msi.c
> >>>> +++ b/drivers/cdx/cdx_msi.c
> >>>> @@ -121,6 +121,7 @@ static int cdx_msi_prepare(struct irq_domain *msi_domain,
> >>>>  			   struct device *dev,
> >>>>  			   int nvec, msi_alloc_info_t *info)
> >>>>  {
> >>>> +	struct of_phandle_args msi_spec = { .np = NULL };
> >>>
> >>> Why do you need to set it? Parse functions ignore passed args, don't
> >>> they?
> >>>
> >>
> >> The parse function does check arg->np on input — if it is non-NULL,
> >> it is used to match only entries targeting that specific node.
> >>
> >> Also, there is this existing path in drivers/pci/msi/irqdomain.c which
> >> pre-sets the node and passes it as input to of_msi_xlate(), so the node
> >> pointer is not ignored by the parse code:
> > 
> > Is it only being used for MSIs? If so, can we make that explicit in the
> > API by having the 'filter' device_node pointer?
> > 
> 
> Yes, I see this is used only in the MSI path via of_msi_xlate(). 
> 
> By filter do you mean the below changes ? here of_map_id() and of_map_msi_id() would accept the filter
> as a separate parameter so that arg becomes a pure output:
> 
> 
> int of_map_id(const struct device_node *np, u32 id, const char *map_name,
>               const char *cells_name, const char *map_mask_name,
>               const struct device_node *filter_np, struct of_phandle_args *arg);
> 
> int of_map_msi_id(const struct device_node *np, u32 id,
>                   const struct device_node *filter_np, struct of_phandle_args *arg);
> 
> of_msi_xlate() would then pass *msi_np as filter_np down to of_map_msi_id
> and IOMMU callers would pass NULL to of_map_id. 
> 
> Does this look fine ? I can include this in v11.

As this changes the params, you will also need to change the semantics,
removing the of_node_put() from the function and making the caller
release the reference (as it should be).

-- 
With best wishes
Dmitry

