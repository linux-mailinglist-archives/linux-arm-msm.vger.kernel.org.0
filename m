Return-Path: <linux-arm-msm+bounces-117887-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CClwI+VRT2qOeQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117887-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 09:46:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D0C272DE9F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 09:46:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=mIPcs8C1;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=O2NXVYrw;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117887-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117887-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A48783008C33
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 07:46:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C5A43C76A2;
	Thu,  9 Jul 2026 07:46:40 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F683CF1E7
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 07:46:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783583199; cv=none; b=k0/o+F1Sxesih3sbnzf15xOlgPb30QWF0xLzCAa3RiI82+UjaGkK+IhGLSyNPJt1BwGCMhKpUjIGjynD5zgkZNTnLcI2SHaI6B9M1QxFY06Ji6Bt4XsvoBm6lxz9UpVcjRF2S2hFsD0F1pNlTNKcpEl4XPh/bQiPW+EiPbNVT3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783583199; c=relaxed/simple;
	bh=3yc+oFEDiae/9wo1xuCH+yHzREyAlh7cr8qgkE8f9go=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M4BVsH71HONA8KUbnHYHXeM7B7WY7AKvBuARwQN1YzYg2ZN2ex46FIc7LHFab7M/XIjZgMXTawKhvHXI/C2zdtVq2GK9Bm84X0H+e6HEQHwJwWTdNl54daCJA4qwZld0D7oDtTfvLy4yLhN7uIdpBbkfh0Z7+gR3ndvQSdrOqoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mIPcs8C1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O2NXVYrw; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66961AOa933399
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jul 2026 07:46:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	odZ3ve7vJ1rCrLXsB23lnwMfJKW7+qyBv7jEFL5Qyvc=; b=mIPcs8C147vjOBL0
	vOJhjHVmk6xoIEltH8bOkJCIy3LlG3sF+FucCI2Y5TYNHQ01MnTbUU3c3ymxz8Of
	IEMnBrgGZRxF38XJvLKlN0XeNgPE06/xvpzn9VsRJT9mrsZSGa0DOHTrXplcSnLf
	wa80tOrg84F2Y0jYvSjROXgrX+Me7zIQevm5IYi2cFLk9BWkwCpropRy+vhKEZpb
	QqX0V6/sFM+bLCeJUjC2Re1sHUnEisRbaqqQ0keyYG1EmQzzxzsSXsfMWJEoDPFY
	b+MegDojerEa/GfjS3o1XiXHVTFOWgl2ERvjVByfxtc23v9IW1nb4NOpzlH1zZd0
	Tl95WA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9ug6jhgu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 07:46:32 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7382fc429f6so834653137.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 00:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783583191; x=1784187991; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=odZ3ve7vJ1rCrLXsB23lnwMfJKW7+qyBv7jEFL5Qyvc=;
        b=O2NXVYrwRYm+gmizIBvafaFaVgo5LRxcsH9BS56282sbce6lKAZrT4nU95PF3XFQvy
         R16vzp7A6Mi6fZB2VaBvqRCaa3eD+reVhJh241K628GZHPeYRt7JPpfCSO7AXrVwmuCx
         NEiO8jtPJZ2YQ7ceG2CznbN8ZnTdJcsvzvRJ6QO2gJ3mwWS8A1LFui1RaTvsx8Vqc9l1
         QY69nT+6r24W5CRc9HRCs0Jpqwq5BjoM/nQYilcV/7Vk6JgrXQkOaeaRHedOe3+OxPNj
         E8FrMpRkc2PB6GOXWeFR6rZuL0hgXDptLsk8FwlSRLcf8G9fLMlVGVoqKLARi8AVViM6
         kBKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783583191; x=1784187991;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=odZ3ve7vJ1rCrLXsB23lnwMfJKW7+qyBv7jEFL5Qyvc=;
        b=TPPdIuu9QI3Y486a3dbXBx9b9mjI29xPXLQmZP7AK+XjJADFi1UlfRGl6P0XTTtB6H
         +XywXkoAt0G6ZcNVOqIrJfhaFjwkkl1w7SGYCZtR3j0IAhHTc7F6IwYv7JvSYXOWmGWn
         TU076hueCx8CP7zRzpuV17Sj43dP8J4QwKq3AyLgVDVRd0s7Z2SZA55ZuCRNungcnazO
         SvOOwt5/UDM6qxrVvu2nUvTbG5rJarBvsBxoLjzDWb5EXYo+u1GGnAiUwmvhsL+n6Oql
         nNWiQKa69DihikZu4ipVqJW9PIr85tqN1CN4bqTbqp9Wh9jJkaQe+7QkqDCxFmRwVcM6
         5kvw==
X-Forwarded-Encrypted: i=1; AHgh+Rq7sCloAUX3UIi+2veJ+R0asTJ9YvKFVYa0Idn/5jKKku7iH+TA2L07t4ZdwogMFq1qWXTmrqzGv7lnOTbC@vger.kernel.org
X-Gm-Message-State: AOJu0YxccBm3cXZOwNzb+sAdreFowa+m7AQLvs33j2bzyDGyO+bE/1D5
	4s23A7f8bqlaol069R06ulDLJtaCokhRMOjGF0qxvdiW3uvIe77604TdVpcOqAuZYccxIu83SUW
	lRFrDYqCRCPcKnDE4g5/d0/htXVX+P6hBLuYS0Zii609D+zcFg5Epf9AemgRhHrxMf4Na
X-Gm-Gg: AfdE7ckMISGAAsOipveqRVHa2aE2pzAK8nKy4k5c3pCBq2fb4KQMRZzMmbKyBJsxzsK
	GAfxB6n/u4mrc23SzX8YApJfd2H8CFelu2bHjCeLpimrAat25bw+VcXTmOA/bl8f4Xds6iswbpG
	qKuae8fYeFcLvws9z8R8GpTYZNGwod5NohpQcyws0xzexRUI12AHzRTSXZn9iL+XV/zC7DY+6UA
	dvJpfnlLFjI6IQYljHQrfF0e1FUA1TnL+rlVNtdJAp2lYYAFJnLrESxr8xi2a2Ik+cXVI/C5oD8
	9RRq/o1Gbpim3Z2sWLvPB+VrR36XuX5NjIYamn0ZqaYSRuqBPW2aNktIK4qn5IkP7Ge2rTMGno8
	graHw9HcIUAVOSUtI5P4IdRsNynAZ/HqCbGCcRXIEInwIBmIEaOG7Mj+UtGokO3AllamCF2VL6E
	/Ob4acznqWvICUZoMpoUFTjLxG
X-Received: by 2002:a05:6102:3910:b0:631:2624:e5ec with SMTP id ada2fe7eead31-744e00118c8mr3853633137.16.1783583191371;
        Thu, 09 Jul 2026 00:46:31 -0700 (PDT)
X-Received: by 2002:a05:6102:3910:b0:631:2624:e5ec with SMTP id ada2fe7eead31-744e00118c8mr3853615137.16.1783583190922;
        Thu, 09 Jul 2026 00:46:30 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13bb768sm5112907e87.52.2026.07.09.00.46.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 00:46:29 -0700 (PDT)
Date: Thu, 9 Jul 2026 10:46:27 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wei Deng <wei.deng@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-pm@vger.kernel.org,
        mengshi.wu@oss.qualcomm.com
Subject: Re: [PATCH 0/3] power: sequencing: pcie-m2: Enable USB/UART BT
 coexistence on Hamoa EVK
Message-ID: <drwgkj27gdstulk47cev2nxs6icienfa6vb3tu2uc2gqkbeedh@duj252fcm3bz>
References: <20260709-fix-hamoa-m2-w-disable2-v1-0-5e725091266a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260709-fix-hamoa-m2-w-disable2-v1-0-5e725091266a@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA3MiBTYWx0ZWRfXz8GmEohuKNE4
 1RiZrkmQG9+9QgI1OXglm9Kf9AFXA8zbhphcigghbm/e/lCBNJkXS3Lc5pvGW6fihtqudYZSHWJ
 jA5YBbYC4I2aNDg/o1FJMNtEjkkV/9s=
X-Proofpoint-GUID: q83pu1nP5nA9GZKKaUDapcpRafczFESG
X-Authority-Analysis: v=2.4 cv=cL3QdFeN c=1 sm=1 tr=0 ts=6a4f51d8 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=s4KJf74AQj_XUxSBtgUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: q83pu1nP5nA9GZKKaUDapcpRafczFESG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA3MiBTYWx0ZWRfX43/WLI5JmMB2
 t9KjDdU5mEcEqG3376wqZQCbiUUDOhFQV8VQNeyaLZDRQdhYYTozD/hiB/Y7td0elmbwWb/R+CG
 9x21oC6b8pZXdVZUlu5Y8kGJwO3h4NWKpTqgscc13zwH86P1U2/4cFesRQlaGpALGlHZe23XKXs
 63V4/3lVDBY2UCZQdifJKe7/6w5/08bZGTwc9kuXrnd+htHs0Cx/Nrp+qCrmyH4WX8GRAiVvVIR
 sUWi3URbnAoV1pxBUfSfaWMni1h7qg2zLhhlPg9iqYWoLNi97DBDIo8GFuyw51XtWYM68MQdpjc
 jpFECi5dJuR+G2kpraKYUXvjtieMqAyyr6tnc0fEjxbwLC5aM5B9DX46u6bKYPU3n+DsYlqusZq
 oR+lqCiT4evNJQbJ1FFJGg9b7jiz833qtUpemiSHd9g12miA5hikZsopYPZPVmEIG1FzoHMaX2p
 REXZxVQS9uSO3ET2QVg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090072
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-117887-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,duj252fcm3bz:mid];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:wei.deng@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mani@kernel.org,m:brgl@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pci@vger.kernel.org,m:linux-pm@vger.kernel.org,m:mengshi.wu@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3D0C272DE9F

On Thu, Jul 09, 2026 at 12:59:39PM +0530, Wei Deng wrote:
> M.2 combo chips expose Wi-Fi over PCIe and Bluetooth over either UART
> or USB, depending on the card variant. Both variants share the same PCIe
> device ID but use different sub-system IDs. The current driver uses bare
> PCI_DEVICE() matches that cover all sub-system IDs, so both variants
> trigger UART serdev creation — wrong for USB-only BT cards.
> 
> This series fixes USB/UART BT coexistence by:
> 
> 1. Narrowing WCN6855 and WCN7851 table entries to UART-only sub-system
>    IDs so USB variants no longer trigger UART serdev creation.
> 
> 2. Deasserting W_DISABLE2# for any PCIe device detected under the
>    connector that does not match a UART BT entry, allowing the BT
>    subsystem to power up and the USB BT interface to enumerate.
> 
> 3. Describing the PCIe M.2 Key E connector on the Hamoa IoT EVK,
>    adding w-disable2-gpios for software control of W_DISABLE2#.
> 
> Validated on Hamoa IoT EVK (IQ-X7181-EVK) with multiple M.2 cards:
> UART BT (WCN6855, WCN7851, QCC2072) and USB BT (WCN6855, WCN7851)
> all work correctly.
> 
> Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
> ---
> Wei Deng (3):
>       arm64: dts: qcom: hamoa-iot-evk: Describe the PCIe M.2 Key E connector
>       power: sequencing: pcie-m2: Match WCN6855 and WCN7851 UART BT variants by subdevice ID
>       power: sequencing: pcie-m2: Deassert W_DISABLE2# when no UART serdev is created

What are the dependencies between patches?

> 
>  arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 129 ++++++++++-------------------
>  arch/arm64/boot/dts/qcom/hamoa.dtsi        |   1 +
>  drivers/power/sequencing/pwrseq-pcie-m2.c  |  39 ++++++---
>  3 files changed, 74 insertions(+), 95 deletions(-)
> ---
> base-commit: b9810cd75b9fb56a3425d391cba3f608502bd474
> change-id: 20260709-fix-hamoa-m2-w-disable2-0fe775072c74
> 
> Best regards,
> -- 
> Wei Deng <wei.deng@oss.qualcomm.com>
> 

-- 
With best wishes
Dmitry

