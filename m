Return-Path: <linux-arm-msm+bounces-111723-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FuLBEA10JmrkWgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111723-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 09:49:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 90318653B32
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 09:49:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ArHoDZaD;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=kMD7jPip;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111723-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111723-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0EF2B305DEF0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 07:43:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD6EC3909B7;
	Mon,  8 Jun 2026 07:43:54 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1085636DA18
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 07:43:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780904634; cv=none; b=qjqt3PqDLIZsJc2dWh+/KaGxg+R+E1WafqHtm16znf1efmxNSZ/d4GpqprlS9WfieqGBbIFpoadV4uTKg9pYPNNr1aLU6Gp54Y/mBOi3X0sNvwahxyxJNIkCF4feucY5YKpH/cjjmulLh2J+BsuOuVLQEcBi8mO7m3CcvV2x/SY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780904634; c=relaxed/simple;
	bh=mmyfZPaCUwrVyVzelZcY/HtUTXHtqBdi6SVGNq/yq2M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YwD36aA2SW4I/bsFl1HlJPNRRdfYErqCZ1uckEQugY3uBXYGXD9T+A8UwSG5pefCxpjJSOwnszICWsLKRM+kFpfuiF1Aq8El7a1CTf3QTJDcBy2nzqZxrVSMPH9kOTOZlDqMp5DFCGE/D6oucAjIqKq8SwJ0D29nTO9eFLsXcU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ArHoDZaD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kMD7jPip; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6586Qqaf2771139
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 07:43:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=v+iBuTlJCGQPNjwvDXc2jqve
	RsmYKmF0YLF0hTmr7hg=; b=ArHoDZaDltiuEKPKeaKHn6mF443fBaa7o7B40KOm
	RiQEWFxSeU37PIgJ/aB1iRmZOCb7GumPzM/kFDEKUnPvx5WB/NdriWqus2Dzkd4N
	oqM/pycXMImx3aJtpppD1kZIJGwZXsF8rtU7uKxQsHMspEUh7b302kZ24gZQXGYo
	PUhkY3HA+F4d7DuCbi9kQres7w6EIls3etClxglrh3OxeABDrPDAuRSnOdkrzJYR
	96bcmfidO6GUEpIZT1hKZwq6fNpOiaFQbQnaQM76WUqF8Xjeu+pXXRpQX9jJs5rT
	hF22CiBX89YUzRbk0aGEE2uJVZmVFtXwTl5nVuijCo3Bmg==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4embx6egnr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 07:43:50 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7002d6c3426so3405282137.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 00:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780904630; x=1781509430; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=v+iBuTlJCGQPNjwvDXc2jqveRsmYKmF0YLF0hTmr7hg=;
        b=kMD7jPipW85hjez7AOSPkED5GxnIkHqYiIKuJfOTQ9f4xP4TOn92Q2fDbHkybVbd9y
         gO+jd1MIB+QtVSUZdwj9SyQdWcH4Uz/MHxIAri3p3Hqt0rJM2HrTM4Y3t97aCv4H+YED
         lZLy+fiApbd0HWGs9PRf+P+BBD7jTNxrYzU99d9gBEibQEZ2odC/vYHicfo+713fcPIG
         kaKjUPTlCSnfWqKL4U18keqEuOBU27emuC9Rqm1WD1ZtBIr+nglaKN+KizbODK+bMnJx
         0P9Mx0p3G9nlaWyhYgyoE3ndzLcqFhG9mtD0qXpBLqnyXpTYwffcefJjsJlDAJKQxGwL
         HBYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780904630; x=1781509430;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v+iBuTlJCGQPNjwvDXc2jqveRsmYKmF0YLF0hTmr7hg=;
        b=QFSnfz0ZPgBBCYVZMjuqTr8kBYdR+U1nG0/OQwisiOM1Wb83To89PcxX6D5CrSv7iu
         SLH+65qixV+ELGz70t3sRNfwsLr5CfFCIWSRBmOeuXDvE7p7Bru866lvrOLuImztvpxW
         iN8lbQF0F3uogj790maTiAVmQZKuxIfuetyZa2j2sCqRKFZeUGyVaMtcPGOw6gLHMDQj
         xPULN6ekgvVd2eSVpftlBzJcoc33uqjM28BC/2lm0yS+c/ef9gV6Kw61fOEpawQXXid8
         a5wSMO0v9X4ysMBl2Qz1sUIefP2pbwcRQnXhE2PXfXYAhcLyfjXH8/tOmorqD260pVNS
         8INQ==
X-Forwarded-Encrypted: i=1; AFNElJ9lW8RULQL7UiAeQI3RpCgQeafGt3InZgIgeUD7QhfXr78WHn2V9q8LDiGyfTphhqTZXYqT3neanhALagiO@vger.kernel.org
X-Gm-Message-State: AOJu0YzTg+ggw09uyhjjDxzD66ZxECYNt5AmCPevOPL/Feutf7ruWc/l
	Eq4r8ue1hAOtcm7dXzJj9cgRNxyD1qH6GD+OUJehXFJGIizbVx+CyRePIl/qEQFRR18VDOk7Pn6
	SOkMKs0Ji0cZE1YPflV0ZLtlwIE8u1G5TrFWUW4oGdgpbI1FPFlV4LCvXVU6Oip83X+dZ
X-Gm-Gg: Acq92OHJ8NMr+Wt2CCRYz7gITNkKz6RoGHZHurZu7DaHP9vjl5B9DmVOQg/thkddh6s
	nFpLN8O9N8EAj6kDGn/ks+tOzFb/GjLgtilYuRr0/K4RqzTruz8i79QKkh/b7UgxbAwkUqHhvKJ
	5qzBYcobV46OfiQX306RCZojTVcAz6orVurFbdaobJold74xqphFTxRH2wdpzwnbenejDiIlUgg
	gOcMGBXB2kZDv2McKbYIC1l279q4Azdr+PGIwsKl1job7fOnbJYOhHjhtW7Snbw54tWLcJEW0af
	pVCPbdLYwPvfjdDqCrTBGR90iisfWYpYUuWHv8yEQMwwVV/NhLW7TAtUxva02tFO+7rF3hSYPqF
	1/XuE9pqGLw36DBlA16siWNOn0GnFygR5OyXY8tO/BRFCBjl1gQxXOrbtFnLnU10rzcLZWA5eoN
	pULwAAK+dFPgHblJIUV9x3T2NLaNrJgwd8TQU1cZz7L6MdLQ==
X-Received: by 2002:a05:6102:6b0a:b0:631:7781:fe8a with SMTP id ada2fe7eead31-6ff084a55demr6792167137.19.1780904630266;
        Mon, 08 Jun 2026 00:43:50 -0700 (PDT)
X-Received: by 2002:a05:6102:6b0a:b0:631:7781:fe8a with SMTP id ada2fe7eead31-6ff084a55demr6792161137.19.1780904629881;
        Mon, 08 Jun 2026 00:43:49 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b90421dsm3582675e87.30.2026.06.08.00.43.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 00:43:48 -0700 (PDT)
Date: Mon, 8 Jun 2026 10:43:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Subject: Re: [PATCH] PCI: qcom: Handle mixed PERST#/PHY DT configuration
Message-ID: <usvxtl4r2ioxpmmlp47ms3stoqz7b42agpnuiromaw7qwvz67a@y7suscxylym6>
References: <20260508-mix_perst_phy_dts-v1-1-9eff6ee9b51a@oss.qualcomm.com>
 <gieaybsg2ckxpctvqj77nlwu7utama2yeyvebkonmexsxrra3v@v3fobqasxnmy>
 <0bd70e70-68fe-436b-8366-8a497861e21d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0bd70e70-68fe-436b-8366-8a497861e21d@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=cvmrVV4i c=1 sm=1 tr=0 ts=6a2672b6 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=1EBqKiz8AxVLgVlipLgA:9 a=CjuIK1q_8ugA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA3MCBTYWx0ZWRfX9ts0qW76V+ij
 txWzixWMCtl6qgRRzBirqPSIhnilHvFDYu3iS10HOVh7E1mzW+HL+u9r+ITVxLVjwDEISc1it3E
 HhMfgjSJKZoe7Mu0N2UDT2Haft2CYhW2pHUo7miOPCp2wc6YiNBWWjAOLa6BM1ywR05jhJkD61Z
 pSqVvmrn3TT1xAHRtdfyz07ulmH0q5pfo2vPAvAOnDixzhPs7oAs7K+tpsj2N3BQE1EWkFi58qn
 WjQJT9/DKsYsB9tTE+3krHEQOYDd+8czQ6OJDKJ8hxiamM3uNvcbIjXQHLpwgqpybeImCWvQPeD
 yUyGiR6e0Lzpslho9SLWSgLvVlW7wOrurqc+klW/ka5p4wZQ9UGJXzUE28aXpP5qOYcx3L8sLOB
 MOVhHwHAOt1YToXRBVJEjbI8jWZhIie3PV/YMGesF5rxAHFFxrpvHTLoBCxlauzueVxiEPuoa+6
 9Rfa0D9MdMDEXGvusWg==
X-Proofpoint-GUID: wreSF13-kfckdk3BFMIB-_7nU_w-gJ9r
X-Proofpoint-ORIG-GUID: wreSF13-kfckdk3BFMIB-_7nU_w-gJ9r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 phishscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080070
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-111723-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:kathiravan.thirumoorthy@oss.qualcomm.com,m:qiang.yu@oss.qualcomm.com,m:mani@kernel.org,m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:robh@kernel.org,m:bhelgaas@google.com,m:linux-arm-msm@vger.kernel.org,m:linux-pci@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:manivannan.sadhasivam@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 90318653B32

On Tue, Jun 02, 2026 at 10:04:22AM +0530, Kathiravan Thirumoorthy wrote:
> 
> On 5/31/2026 4:37 PM, Dmitry Baryshkov wrote:
> > On Fri, May 08, 2026 at 02:54:19AM -0700, Qiang Yu wrote:
> > > The driver currently supports two PERST# and PHY DT configuration. In one
> > > case, PHY, PERST#, are described in the RC node. In the other case, they
> > > are described in the RP node.
> > > 
> > > A mixed setup is not supported. One common example is PHY on the RP node
> > > while PERST# remains on the RC node. In that case the driver goes through
> > > the RP parse path, does not find PERST# on RP, and does not report an
> > > error because PERST# is optional. Probe can then succeed silently while
> > > PERST# is left uncontrolled, and PCIe endpoints fails to work later. This
> > > silent probe success makes debugging difficult.
> > > 
> > > Handle this mixed case in the RP parse path by checking whether PERST# is
> > > present on RC and, if so, using the RC PERST# GPIO for RP ports while
> > > keeping RP parsing for PHY. Emit a warning to indicate mixed DT content so
> > > it can be fixed.
> > > 
> > > This keeps mixed systems functional and makes the configuration issue
> > > visible instead of failing later at endpoint bring-up.
> > > 
> > > Suggested-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> > > Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > > ---
> > >   drivers/pci/controller/dwc/pcie-qcom.c | 15 +++++++++++++++
> > >   1 file changed, 15 insertions(+)
> > > 
> > > @@ -1778,6 +1785,14 @@ static int qcom_pcie_parse_ports(struct qcom_pcie *pcie)
> > >   	struct device *dev = pcie->pci->dev;
> > >   	int ret = -ENODEV;
> > > +	if (of_find_property(dev->of_node, "perst-gpios", NULL)) {
> > > +		pcie->reset = devm_gpiod_get_optional(dev, "perst", GPIOD_OUT_HIGH);
> > > +		if (IS_ERR(pcie->reset))
> > > +			return PTR_ERR(pcie->reset);
> > > +
> > > +		dev_warn(dev, "Reusing PERST# from Root Complex node. DT needs to be fixed!\n");
> > This patch breaks legacy DTs (I stumbled on it on SM8350 HDK), because
> > now devm_gpiod_get_optional() in qcom_pcie_parse_legacy_binding()
> > returns -EBUSY (as the GPIO is already requested here). I'll send a
> > patch fixing the issue, but it's sad to see existing platforms being
> > broken for the sake of undeclared "mixed" case.
> 
> Dmitry,
> 
> I have sent[1] fix for this issue and it is squashed with the offending
> commit itself[2] and part of controller/dwc-qcom in the PCI tree.

Ack, thanks

> 
> [1] https://lore.kernel.org/linux-arm-msm/20260526-fix_perst_gpio_handling-v1-1-9170507bb4e9@oss.qualcomm.com/T/#u
> 
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git/commit/?h=controller/dwc-qcom&id=1a23bcb452d95f099e530414504c0d99ee076b3f
> 

-- 
With best wishes
Dmitry

