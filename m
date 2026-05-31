Return-Path: <linux-arm-msm+bounces-110460-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wP/XK6AWHGq/JgkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110460-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 May 2026 13:08:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E3A615BB2
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 May 2026 13:08:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B74A1302615B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 May 2026 11:07:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7828E379C3F;
	Sun, 31 May 2026 11:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Oum3agTi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ClvdT+Xn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A8437BE63
	for <linux-arm-msm@vger.kernel.org>; Sun, 31 May 2026 11:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780225664; cv=none; b=D+Y2bSgYyG75jiT7efPQRLDbTu9uhYCKW3OGQI/TdodHneaalTlzCYmpyC98txqdMWwPauf6R+Qs1zC97kU9yyf6laXdMh6JAtNY0BhGe+baonokaRUAbLwy6NpB5SAXoXVO+XjfX6lW9XTwrAF8/XW5D+fA4NpOd8nGVgnDoB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780225664; c=relaxed/simple;
	bh=/0ktdilly+GdNM45BFy1cmrSA8nae2pVCT/7CW2sqBY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p35K5FhIyvdIgpbZLgEY0gi0+pkLrxLSHur5J97HzmRKD7cfCXoVEjIL4Z2js+KZX2Lb+/s/qzdjmZlSAsyDNl2LQ3MgVCijXo2GUzSJJCnH/Nwxnubi9O1CKOjUpf32ogGJ4rXm2tFbWXRqHxIqwZIChsPf34hsEqS9+nFcGqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Oum3agTi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ClvdT+Xn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64V4txWl3498164
	for <linux-arm-msm@vger.kernel.org>; Sun, 31 May 2026 11:07:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RLbzLIct6+8d2XYhYF/y4mw/
	mldeTBEN6f9cogCloG8=; b=Oum3agTiGAlpPyv5fsV+NVqXyvjSXyD8onXEeR9Q
	bJ1tQsbH8yH1YUqzNG0ktdMYkXqIEQe9jYB1/RKTWfJeHduM9KrkRSaRMwRNWUg2
	27A1ORr1HFLfJevAJQJIKPRIJECUvwHUL1KfQ4NOP9VPJiVS3/cTd7DOx2qNbhFl
	wlgO3DzcbCagrw5IwMSPUtn161n4QlIJzq3F8BOVTj4BbmdBtEy/XM1ebbzDIJVB
	8NYnAf1q7+Y8RVuoUcSRd38pCzD8z2ObtHUh+7qeKAvIcPPhjTxMK8t/cW0B0BB/
	62NpVoACFBPo2X8Y3dFMIV2RUx13XNZRCgS7RV4wX6NIiA==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efr41betb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 31 May 2026 11:07:40 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-96396d1f745so2420675241.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 31 May 2026 04:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780225659; x=1780830459; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RLbzLIct6+8d2XYhYF/y4mw/mldeTBEN6f9cogCloG8=;
        b=ClvdT+XnKYsHILttjlV0b3/qHV9IacvGqFPoD+xC61IKuegrI04s4uMgSUz/jafO3P
         RSASwo6BZufcYdSeVIJNl0FhIdz5cps+ZmIO27Nm+CzvyBz8+THKMJfzRNxrE6MqS8lr
         S87t1hB+ZxsKYx3HVPgMmAFkNL9XEv5Uy/2z9pWUNQMS4vm/5BS/zkX/2Kk+fqncwlhv
         dzUpenHZboDkwpMIaUu5JuYhqSMPoSVP4lvGtVMKvY4JuVdRZB7I9ldGGitTu4Sarb9C
         PlTz8qTAPXWc+qUfc6Aa4sw0fPmLVE83HTB67utk5YBY2yQAtbZZy67j2ewzgaDt9Om0
         GEmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780225659; x=1780830459;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RLbzLIct6+8d2XYhYF/y4mw/mldeTBEN6f9cogCloG8=;
        b=tFFFapXeGfwvsLMC1W636ELJcvWvQR8RdpxA9Za0qh5wKN7tx0jlIzs2822xdw6DXH
         zuAq7BG88vW6PRIUGbfTiFjWQH4I7Td7b4YeIGPu3/DfQFGk2J7dRVNspA4TMBn8u/tp
         /NCXI+bAin+ddCEenY5Cn1ERbpsmwal2h9ToB522mM9XNSXaD5fDF0ZKHupFAXPEVeH9
         yhYHEgCXwkHQQ1XIEt7XtGeG9uDKaa+xRYqbFePKZL1Wfphcsl2iPzXlZAj/MrLUHDuA
         7Ws6OIVXDMn20hQxpBQizmHwVxefk6CJLo/nW8WGRnaXsdI0rCJk8DsGE2ObkBkfo8um
         A+PA==
X-Forwarded-Encrypted: i=1; AFNElJ+0twdGrVpQEu635vgRwA9lh4rVJSS3pzt5lSDL04Aw2sDz7e7NzytGeQEOZWcgwFv4mqKIqNWIU4owR+tH@vger.kernel.org
X-Gm-Message-State: AOJu0YzMd3S6cx+FnUmw6pFMGeNBJLj0C4eWwj9PaTsmaCVZrc1SGvD+
	J3lpNxKHBV4qlRHgUBm3LJolUOsZc1lzyGUXjXGq1eClWr5AOkDCfwj7VvOPte31jWAeFqK/i3V
	p1OCVbvOItYxL7EnNiGQVXg4zEmXZESUL/WA8JkaVuuPuVbvdRs4YcyqCw3MGq6IM9p8M
X-Gm-Gg: Acq92OEg3E+oArkDCwSMFDiIxO4UZZLmijxbJyWYo/xalZ7J3wTW6TfXwD8x9numa6a
	Jl9KaAROYnfZkm5Hc0JgkUfTIaKCbqFn+wHbUyUfR4wLYAR138FOR6EXIOTk2M4p0bUjjAOztrq
	A4BhGmIj2PQ8x7Wazq6WfnFrSj4IgYz/Y4ThHzsAZGonDJxy1hXJiYaAgzcySXDEcds02p/jHhR
	kd2s+aecjnEl5MmBlf0Y5Z/JfVQcmNOAF4APXVW2x63i3fIMV6MTxTVFePXmlphjWMfiWP0h795
	yI1OcFJBE6q3XqXOmDXSHM2TCTWkuVXh7ftnA5KCI+mfs/rAxIyvSEeWOIthUV6ir/p7tGYGphY
	QMC7CJ/wovhq+tNcKS4PeLtj7IeqavfEy+a8rYuSC15PMVuOJHr1XkmOSPVdnn7T54OLCN6WrCN
	LL5TBDCi4rXTO+yNOoguv8Y2+Mv5TE9Gshdni6l7+3hUHKPQ==
X-Received: by 2002:a05:6102:3f92:b0:631:28c1:154e with SMTP id ada2fe7eead31-6c693fe947cmr2443261137.16.1780225659577;
        Sun, 31 May 2026 04:07:39 -0700 (PDT)
X-Received: by 2002:a05:6102:3f92:b0:631:28c1:154e with SMTP id ada2fe7eead31-6c693fe947cmr2443246137.16.1780225659172;
        Sun, 31 May 2026 04:07:39 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa5b59678dsm1497814e87.52.2026.05.31.04.07.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 04:07:38 -0700 (PDT)
Date: Sun, 31 May 2026 14:07:36 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Subject: Re: [PATCH] PCI: qcom: Handle mixed PERST#/PHY DT configuration
Message-ID: <gieaybsg2ckxpctvqj77nlwu7utama2yeyvebkonmexsxrra3v@v3fobqasxnmy>
References: <20260508-mix_perst_phy_dts-v1-1-9eff6ee9b51a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260508-mix_perst_phy_dts-v1-1-9eff6ee9b51a@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=fOEJG5ae c=1 sm=1 tr=0 ts=6a1c167c cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=-t_lwamo1oFYt4rwp_wA:9 a=CjuIK1q_8ugA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-ORIG-GUID: m4bNT-_zbhbg43uusJAlEUlSq_tO3OeK
X-Proofpoint-GUID: m4bNT-_zbhbg43uusJAlEUlSq_tO3OeK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTMxMDEyMyBTYWx0ZWRfX8bLOWeOsI6DA
 p1UG2kg/OOGNtXfvqyIVhwBV+9ixf56hXeLNWSS36G2//V5tE35s17QuBAis+hoZYnz6xeISv4n
 0JUGU1GsOVcckSP7UY/vg9+GQC4Ju2/twhduMSBp5Jy5guV8MLdZX2QnoZGOPsMW2r884Cpv5+T
 O07SnmCYddr5/SSNL3JYfNNn2ikQM+bxy0kHJP6u0l4BDh4sZOZJ50Tcoapd6VesIQm05EKTVoJ
 Y2EJUKGbiDun72BWyPKsYx5i0mzOHaXyCA1lLlx4O/X+whGc1/H51Dy+m+iSO7UuXpoxp5wzGBJ
 xt4nZKK1HXpqCfbbC4yHaSzWOtv+SZO7SMdYJxESRMG82tqYrCgi+jJVxsQ84QUHI7xsVuTjQWz
 9PErZbGIIy6YofgWaRTXOHorNrKfaFbUzA4TD/PE6UshEwUuWsKzWOOlLHVo4h3oiIVN+v4camP
 7LO2riGCeOhwwY8bkOg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-31_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605310123
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110460-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 23E3A615BB2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 08, 2026 at 02:54:19AM -0700, Qiang Yu wrote:
> The driver currently supports two PERST# and PHY DT configuration. In one
> case, PHY, PERST#, are described in the RC node. In the other case, they
> are described in the RP node.
> 
> A mixed setup is not supported. One common example is PHY on the RP node
> while PERST# remains on the RC node. In that case the driver goes through
> the RP parse path, does not find PERST# on RP, and does not report an
> error because PERST# is optional. Probe can then succeed silently while
> PERST# is left uncontrolled, and PCIe endpoints fails to work later. This
> silent probe success makes debugging difficult.
> 
> Handle this mixed case in the RP parse path by checking whether PERST# is
> present on RC and, if so, using the RC PERST# GPIO for RP ports while
> keeping RP parsing for PHY. Emit a warning to indicate mixed DT content so
> it can be fixed.
> 
> This keeps mixed systems functional and makes the configuration issue
> visible instead of failing later at endpoint bring-up.
> 
> Suggested-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> ---
>  drivers/pci/controller/dwc/pcie-qcom.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> @@ -1778,6 +1785,14 @@ static int qcom_pcie_parse_ports(struct qcom_pcie *pcie)
>  	struct device *dev = pcie->pci->dev;
>  	int ret = -ENODEV;
>  
> +	if (of_find_property(dev->of_node, "perst-gpios", NULL)) {
> +		pcie->reset = devm_gpiod_get_optional(dev, "perst", GPIOD_OUT_HIGH);
> +		if (IS_ERR(pcie->reset))
> +			return PTR_ERR(pcie->reset);
> +
> +		dev_warn(dev, "Reusing PERST# from Root Complex node. DT needs to be fixed!\n");

This patch breaks legacy DTs (I stumbled on it on SM8350 HDK), because
now devm_gpiod_get_optional() in qcom_pcie_parse_legacy_binding()
returns -EBUSY (as the GPIO is already requested here). I'll send a
patch fixing the issue, but it's sad to see existing platforms being
broken for the sake of undeclared "mixed" case.


-- 
With best wishes
Dmitry

