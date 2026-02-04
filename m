Return-Path: <linux-arm-msm+bounces-91754-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ILCIMz2xgmn/YAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91754-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Feb 2026 03:38:53 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 70958E0EBE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Feb 2026 03:38:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B707A301CF71
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Feb 2026 02:38:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F6A22C3254;
	Wed,  4 Feb 2026 02:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P9UtNjB3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZJeZt0Tj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D717429B228
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Feb 2026 02:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770172731; cv=none; b=W0DNdtR2uUwXA5K9qyIcRyNmax0H3HYFor/TnqU8q+4IXW6i3LJ3nHibbjAD9bW9cPI8FoBoFk/L7MnLReAZtKePq/59isaErOYvS6S3lVlFYoh9CTlhLFKTMet0hq4ZE6vb7rIPwHG2r44imIFWz+mO5bgGeF9t4nviuDouTiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770172731; c=relaxed/simple;
	bh=6m+I07JHdg8bZ32TJSTZptmje2MxAmCE17/6jFys1No=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MAALB/TxntaZyMHWyscaP0j63w1DF/u4wrOOoc6OBR1Ubz93sQmD7owD8GaaBJAWFArinFuJ6WF54PMGGtV9GiXs6xt713LS0RkG92iKkow7TRcTGYr4C0lSCRA1yEeCvO0yI/IdIA0ip+URjQW3VDEKkwKg0L5/YJC5l53V6FA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P9UtNjB3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZJeZt0Tj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 613IlwAQ2154654
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Feb 2026 02:38:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	icxTIfXslHXDCQce6Ns9Sbp/11rZ5f6Ljfby9vO/W1I=; b=P9UtNjB3TfAh1ZlN
	8tK1efW1nudLgjpozE2NVkpKLmx8shtOWRdLihqVV4KtXwrnWLExmw++pxjGF+F/
	gUNAvZPPpP32tcnfJk5IiT4r+aTqbiWUjRkgOTjIbxqCVYHVRaILf9RPZ3APS524
	N8ojLjTjvsk29ZuvHAqj5JYfHIUsjd4Jf9i2neEFKs1sUB1YyY9PDeaUN+MxPHed
	Xh2tJc7NVcY2TUkxnHpQjbki7qswJeT8EPUnVmqBQ4ltbI8e/kzKS9FzJcRWhGEo
	Ls2NAp72QQHMB6znykBQtagvt1UycUIHgunlPVRiF9f/rFhX8mUmI/JEQMdgL878
	zREnkQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c3dutk610-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Feb 2026 02:38:48 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5033c483b74so221697211cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 18:38:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770172728; x=1770777528; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=icxTIfXslHXDCQce6Ns9Sbp/11rZ5f6Ljfby9vO/W1I=;
        b=ZJeZt0Tj6nQEJ4r2Yt1dm3nNQZ8WvYNmXlLay/H4HiNKMMe1q8LcJRSBvoNNoKT0YH
         WSwxYvbb0wBlS2defjbHqUlaS/nm8f2wxYNkfIxpRxFRvxXZTVhusVseYDQyuEiQY8sp
         qm5Q7POmlFrtnan8qQ4k8CMvJMc1gsEJUlqDCndnA2BbFqKcvOiWOBzodL7fcQYUU6jq
         2B4T0g+b4FLQAZsJJ8BUJ1mL069vKvHKhDUMsbQVJ3OvCGc8LEXZIRRVYHPw1y3mP6xm
         S5j8cScjVvfTGCvKIoNucy8rODVXjj6bsvfmymQrlAfyUa2h7oEc2gTag3KL3YCA9jIO
         CVoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770172728; x=1770777528;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=icxTIfXslHXDCQce6Ns9Sbp/11rZ5f6Ljfby9vO/W1I=;
        b=eq8slpwTlhWzZJOSah2M+p6ooF9f7zO+gfujG3RIXkA1h+XsxFWN/007wJe80fQvY5
         2HYwAMb/CieaFB9npdJDLbeTDeGcRd1pj7Ue4gbRG84vxmZzrKToFKrMwM5sUXV6q1+E
         OS2G9i7V7bPX8YLNiCy5TovD2zfYqGMeLA01gNhpi/DJK0oEOwcDNuqg+UDlhHwGHz9Z
         NUaGPy9wCUda0I0Nwvo6tf4s/8jzK8oecCN7ReKpWaMbB7J+tpjM6q89HPbtistD8Ioj
         73+GEfugl/nOOR0IiA5fc0DU9Pohp0Lq0CrmZvRNGzKSCVqWq/Rsy7zX13DphOLdr9hI
         3tcg==
X-Forwarded-Encrypted: i=1; AJvYcCWNfOZUmN8QfwFbB2h+VlBBQuDq4HysAOne4MI48vnrvD3fV0v+EcD1p+btGTGUIir939bc+nY/V4kbKODo@vger.kernel.org
X-Gm-Message-State: AOJu0YzXrg+SHhuvMWz1eWVSv1bhUHkfTLutimVy4vuBr7h+AbroXQAq
	Ty2d1g1u3cAQaVp7T+lIGt/x4gYOFupA3gIGP1K9EtMG9DT5y8cqrHTC9JnoiHNgJGHTnEcgmDu
	OYq2ng9Fn+5Kba1ZST3R7xaOn02JUa1srpSXW34KornTUthp2neJBVfbYOQ21fWYnLCZI
X-Gm-Gg: AZuq6aIsIfMZimGIpef7OPQ9iAaAdpiDfRcUyKLuuG+9DDr3rbzGd+4S2S+dMYcsb1k
	JgAbF4nYcfF7bS0BsZlUz3gkrn5Vb6Y8E6fpfTUo6pKJ4144f/dHUmBvxWJARO4BmxR7j9hmJtt
	3wHp257Ndk6tk29gjc0GgdHUS0Rhi0h5XDRW4TeoegwIZmrA2Odud/GVQvfUXw0Oedfx1QmzCEZ
	tsU9FJnvhrKauNcfZOJsWVOKELjY6Il9b0Up9PfG6dBTTn58A7ra0huTWrGvpe3gnT/KK+hkcnb
	JxXDHNt2zuxVk3fGSfhK5+LMsZTkEutOFLlcnBmoYDvzVKohslJkRkIKZnkeiyz7/uk42N3pgo0
	g2oM4AEcfJbQOLKQVFdml2QcIC+kmQB7MdPFdOFdE5lkT34q/gYnyCEXC7Uq+2nOeN7vcV0CzY5
	bxprdsAeNPcSaJ/zIS0IIxMFs=
X-Received: by 2002:a05:620a:280a:b0:8c7:d2b:b5b0 with SMTP id af79cd13be357-8ca2f9c46fcmr197191685a.55.1770172727943;
        Tue, 03 Feb 2026 18:38:47 -0800 (PST)
X-Received: by 2002:a05:620a:280a:b0:8c7:d2b:b5b0 with SMTP id af79cd13be357-8ca2f9c46fcmr197189485a.55.1770172727381;
        Tue, 03 Feb 2026 18:38:47 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38692062919sm2154191fa.45.2026.02.03.18.38.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 18:38:45 -0800 (PST)
Date: Wed, 4 Feb 2026 04:38:43 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yijie Yang <yijie.yang@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        andersson@kernel.org, krzk+dt@kernel.org, konradybcio@kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, conor+dt@kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v5 0/4] Initial patch set for PURWA-IOT-EVK
Message-ID: <d3mvqtyd6dsphkojenpalduty7x2n3yxf6rjazwndisxnktez7@iwb2nnxwvg4d>
References: <20260202-purwa-v5-0-1f5a93578802@oss.qualcomm.com>
 <177014002716.3173249.7908353000261603377.robh@kernel.org>
 <e577c093-0851-48b8-abdb-0aee0479c1e3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e577c093-0851-48b8-abdb-0aee0479c1e3@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDAxNiBTYWx0ZWRfX9qRhP8Y50nTr
 BzaPugu9JDNKCzM0U81/VmCcmD3LK40e6qiMV42cE+yuzRVxOhmeRv3USR8M7xLXEQgCNcH86b2
 HEbYoeFjdV386KUdHAbyuGqKNqZKOSXGnA1vah/nBjLTqX8t+jXMQWzMyOAcWL44gyB/wke1Mex
 ij5Re+8PEb7rOaysy6fGHw6xfobM1RZokKgUWv47m37CAv6neVEF4p+PwJVIkcnPwSCUf8Ub3SL
 NFxHJkPV0M6L6/bmmn3KMz2pbJ5Y3taCOOMhF9Fz/6jGSgzzyr4UWHb+AqHvmFbAhGewf6drA56
 8UumFj4Y3eqhebu8euSRdcGnfymMG1w8Ycr7ZIa8iFdQnW6S63MGQ5vrXyrypgMdP3WVA4tfe1+
 NfISHT4DoFkTY+QbThx0NOh8C+pv0xwYCTnTCyowRmRbM4K1MzxAR4dB0x2X8w2jm3DPkdmvPyO
 mRTndQD0jzEwVHeBPEw==
X-Authority-Analysis: v=2.4 cv=FrgIPmrq c=1 sm=1 tr=0 ts=6982b138 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=gEfo2CItAAAA:8 a=KYFTIwN-9b30Wf40I3AA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: r25MViIzsSUfXT5T-QEo3uS4NuWb_xy1
X-Proofpoint-GUID: r25MViIzsSUfXT5T-QEo3uS4NuWb_xy1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_07,2026-02-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602040016
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91754-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:url,qualcomm.com:dkim,devicetree.org:url];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 70958E0EBE
X-Rspamd-Action: no action

On Wed, Feb 04, 2026 at 09:42:04AM +0800, Yijie Yang wrote:
> 
> 
> On 2/4/2026 1:37 AM, Rob Herring wrote:
> > 
> > On Mon, 02 Feb 2026 15:35:44 +0800, YijieYang wrote:
> > > From: Yijie Yang <yijie.yang@oss.qualcomm.com>
> > > 
> > > Introduce the device tree, DT bindings, and driver updates required to enable
> > > the bring-up of the PURWA-IOT-EVK evaluation board. Focus is on two key
> > > hardware components:
> > > 
> > > PURWA-IOT-SOM — A compact System-on-Module integrating the SoC, GPIOs, and
> > > PMICs. Designed for modularity, it can pair with various carrier boards to
> > > support diverse use cases.
> > > 
> > > PURWA-IOT-EVK — A carrier board tailored for IoT scenarios, providing
> > > essential peripherals such as UART, on-board PMICs, and USB components.
> > > 
> > > Together, these components form a flexible and scalable platform. Initial
> > > functionality is achieved through proper device tree configuration and driver
> > > support.
> > > 
> > > The PURWA-IOT-EVK/SOM shares most of its hardware design with
> > > HAMOA-IOT-EVK/SOM, differing primarily in the BOM. Consequently, the DTS files
> > > are largely similar. Both platforms belong to Qualcomm’s IQ-X family. For more
> > > details on the IQ-X series, see:
> > > https://www.qualcomm.com/internet-of-things/products/iq-x-series
> > > 
> > > Hardware differences between HAMOA-IOT and PURWA-IOT:
> > > - Display — PURWA uses a different number of clocks and frequency compared to
> > >    HAMOA.
> > > - GPU — PURWA integrates a different GPU.
> > > - USB0 — PURWA uses a PS8833 retimer, while HAMOA employs an FSUSB42 as the
> > >    SBU switch.
> > > 
> > > Features added and enabled:
> > > - UART
> > > - On-board regulators
> > > - Regulators on the SOM
> > > - PMIC GLINK
> > > - USB0 through USB6 and their PHYs
> > > - Embedded USB (eUSB) repeaters
> > > - USB Type-C mux
> > > - PCIe3, PCIe4, PCIe5, PCIe6a
> > > - Reserved memory regions
> > > - Pinctrl
> > > - NVMe
> > > - ADSP, CDSP
> > > - WLAN, Bluetooth (M.2 interface)
> > > - USB DisplayPort and eDP
> > > - Graphics
> > > - Audio
> > > - TPM
> > > 
> > > Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
> > > ---
> > > Changes in v2:
> > > - Update the GPU firmware path.
> > > - Update the description in the cover letter.
> > > - Reorder the patches.
> > > - Use separate DTS files for Purwa and Hamoa.
> > > - Update base commit.
> > > - Link to v1: https://lore.kernel.org/all/20251222-purwa-v1-0-14ab9316e5ff@oss.qualcomm.com/
> > > 
> > > Changes in v3:
> > > - Delete unused PMIC and thermal nodes.
> > > - Add WiFi node.
> > > - Add display backlight node.
> > > - Add connectors and VBUS regulators for USB3 and USB6.
> > > - Enable PCIe3 and PCIe5; add PCIe ports along with reset and wake-up GPIOs.
> > > - Link to v2: https://lore.kernel.org/r/20260109-purwa-v2-0-f39ee10684cb@oss.qualcomm.com
> > > 
> > > Changes in v4:
> > > - Enable TPM.
> > > - Update the descriptions for video and the USB OF graph.
> > > - Link to v3: https://lore.kernel.org/all/20260113-purwa-v3-0-16eefacbdce9@oss.qualcomm.com/
> > > 
> > > Changes in v5:
> > > - Reorder nodes in purwa-iot-evk.dts.
> > > - Update base commit.
> > > - The DT binding change that fixes the DT warning for pcie3_phy is located at: https://lore.kernel.org/linux-arm-msm/20260119-topic-purwa_phy_shutup_warning-v1-1-997a692b31c6@oss.qualcomm.com/T/#u
> > > - Link to v4: https://lore.kernel.org/r/20260116-purwa-v4-0-89b2adae9f09@oss.qualcomm.com
> > > 
> > > ---
> > > Yijie Yang (4):
> > >        dt-bindings: arm: qcom: Document PURWA-IOT-EVK board
> > >        firmware: qcom: scm: Allow QSEECOM on PURWA-IOT-EVK
> > >        arm64: dts: qcom: Add PURWA-IOT-SOM platform
> > >        arm64: dts: qcom: Add base PURWA-IOT-EVK board
> > > 
> > >   Documentation/devicetree/bindings/arm/qcom.yaml |    6 +
> > >   arch/arm64/boot/dts/qcom/Makefile               |    1 +
> > >   arch/arm64/boot/dts/qcom/purwa-iot-evk.dts      | 1549 +++++++++++++++++++++++
> > >   arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi     |  685 ++++++++++
> > >   drivers/firmware/qcom/qcom_scm.c                |    1 +
> > >   5 files changed, 2242 insertions(+)
> > > ---
> > > base-commit: 6267b2da1b2d04847a1a8f441e138bc4a89435ee
> > > change-id: 20251113-purwa-907ec75b4959
> > > 
> > > Best regards,
> > > --
> > > Yijie Yang <yijie.yang@oss.qualcomm.com>
> > > 
> > > 
> > > 
> > 
> > 
> > My bot found DTB warnings on the .dts/.dtsi files added or changed in
> > this series.
> > 
> > Some warnings may be existing warnings. Consider fixing existing
> > warnings before adding new features.
> > 
> > Perhaps the warnings are fixed by another series. If that is the case,
> > please set the base commit and any dependencies for the series using
> > "b4".
> > 
> > Ultimately, it is up to the platform maintainer whether these warnings
> > are acceptable or not.
> > 
> > If you already ran DT checks and didn't see these error(s), then
> > make sure dt-schema is up to date:
> > 
> >    pip3 install dtschema --upgrade
> > 
> > 
> > This patch series was applied (using b4) to base:
> >   Base: 6267b2da1b2d04847a1a8f441e138bc4a89435ee (use --merge-base to override)
> > 
> > If this is not the correct base, please add 'base-commit' tag
> > (or use b4 which does this automatically)
> > 
> > 
> > New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20260202-purwa-v5-0-1f5a93578802@oss.qualcomm.com:
> > 
> > arch/arm64/boot/dts/qcom/purwa-iot-evk.dtb: phy@1bd4000 (qcom,x1p42100-qmp-gen4x4-pcie-phy): 'qcom,4ln-config-sel' is a required property
> > 	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
> > 
> 
> I have already listed the fix in the cover letter:
> https://lore.kernel.org/linux-arm-msm/20260119-topic-purwa_phy_shutup_warning-v1-1-997a692b31c6@oss.qualcomm.com/T/#u
> It is not recommended to list it as a dependency in the latest version.

You can use `b4 prep --edit-deps` to mark it as a dependency to be
picked up by the bot.

> 
> 
> > 
> > 
> > 
> 
> -- 
> Best Regards,
> Yijie
> 

-- 
With best wishes
Dmitry

