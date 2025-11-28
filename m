Return-Path: <linux-arm-msm+bounces-83718-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 00806C918B1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 10:57:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id ED2AD34CF8C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 09:57:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BB25306D40;
	Fri, 28 Nov 2025 09:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ph0bkRlG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YeSAYHt1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28EEF308F27
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 09:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764323837; cv=none; b=a1lmQHnTMaXsrVfgM1jA7OEQC8C3VC+RsU9QS/Hx6zsaui0vfoDzDTyIULSZylu6g0nIC2RZh0IDK+AC9vUyiIC6UqynByr+XMKK6hRwwD/2l7cKgnE+uv/l1nkasrlLNJBQoVdtQQ4w8zLn5CNjEl5veFz6bC95elH3J0WhbsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764323837; c=relaxed/simple;
	bh=ZCQ+X6CcJNnx+pPiStYcloaCorZ3vkX6wLFtfUvufdQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hhzi/fLMVqI2YZ/YTpudsdTpki0eo2pVhlzqX/YxW4q7VM4Dr6UMq07qQcrl4nxE1vCH6RZRGzW8B3G0pHNePsFwRF6iZvD7zkUxUSK/khP7oS2zvVYFauw0npq6dTlxhVLs5TTzoJunMFALZyIkDDk53h1CD2p6RWpCwoZQYdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ph0bkRlG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YeSAYHt1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AS8P99p2986602
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 09:57:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MOyTbwOeGqQB5EkYD/6KseST7rH0TIy381RauUT9o68=; b=ph0bkRlGju6I6WaS
	dgjo1eSQxVWS38oBGdjQjX32fg31UwKBxtWTqeCmLvx5lFkwIWuJZj6UwQvFl5aP
	CObMWbSviY/Vu85tQV5jLpLqw8yzQCmatAm0ReFm7ARLqweLlSQVjIYRZVVN3LE7
	oKWr4+4xLLf6Otti8shnRIkvhuzFfN/X4rmuxQWiofIuo0cxOzMNzzOK+pcMvfuK
	sZdHR2FYMoO7UVa/xUlgSv9UIOk9/xNEuuC3Rdg1P0eFyWKMDzyyT1mgneT0jDe/
	e1vyZOPrAh8pt3A7LMUOvcqtrjWgIzAeNiSWJtZ545UGPftc6tm2U8+MGbD/XnHX
	hMpn2g==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4apmvxjvq9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 09:57:15 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-bc240cdb249so1605702a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 01:57:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764323834; x=1764928634; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MOyTbwOeGqQB5EkYD/6KseST7rH0TIy381RauUT9o68=;
        b=YeSAYHt1+7lGlFzNR/paEB2z88JIgJ7HSiJYR0kaowVN32zBYMFl8Yjg37aLCb0z2o
         s0VhbFVOhfgdnO9n9kaAOAEQl3gOe2tS+zggHfbI8PHjdRhC/9VImhH8FtQJOTAA0PO0
         7gcLhFVR8QSFacUzMRL4x+cCh0BkPq26zp5OA2WKWFc6zX4SihCJ0kcIfsCBgMCBWClo
         GF4uwFaHEcjhsyNr0L8rtagLT+1CrQ2cw9vcfjzJBvd1BT5L35VBqWrGvs6TsvioHMWq
         nlYD5vP5VxKouEpxZTzpoVKdMrrLDKvqSqU6EJTK+lsrY/ya8Awj9igx9SKf3iERJHyf
         BB5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764323834; x=1764928634;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MOyTbwOeGqQB5EkYD/6KseST7rH0TIy381RauUT9o68=;
        b=Eigm5qMI0yN/Rg997M/Vl19doCuj1AtiMFeFIVaQga0CFbaNUC1rL0nZhG4IQa6Lza
         ecS5LgbMsHn05749IP1w85WLb0gubAsOOGkd6bp4pHcMwFj1uvQ7IKuM7LyBJEeRkeW6
         76z2ZfOrc7Zx2Ck6mzIyebEZyQxPRmaW3cEaTz7ZfNHQIOkzGN27/KyZGn7NR+/Vu1Ae
         7hm53KJw6kUklCrr9DAlqDyPlBlytfEG6WALD+fZ3tgFGOO8Q4qRyybiVdCwaiccPBws
         a+R1ykfmBkXr5FGQO6MIbF/y4/EfEOMrUTn/erwSTict43OOFh/mkT03316jB80o4yIH
         HQ9A==
X-Forwarded-Encrypted: i=1; AJvYcCUgNvyoEm7KFW6I4jKdVAc5vhnIR3u/W/30thxnrL1aHrnBorN+B+yS+FdWde6xLUACgGFt5vc/Autl4p9d@vger.kernel.org
X-Gm-Message-State: AOJu0YzV0Z63WHU+QsRKRW3Cp6dWZUbcezRBBC6dNnbAZGOEa7fHLIrc
	QT+Nlamnd9bjV2SMS9V1K1xVQrqmuhfJGNIv/uRFuStcynMNk+/Du31QWLb10bUQ38gzpudz49D
	XIuFIYPYC1dbM86bIn/WIuzr2k/h7VwPCQfQ4l/hErCqwanLYkmdmh6aTNuh3ozeIY/Cm
X-Gm-Gg: ASbGncstwPQUmCqOaUG19ZuA9W3lBRbgIewaUqvQuFB45ACXKBz/GcyeReIEVeZpymj
	lPMUBbbWHqlv4pmT8HMMPkh8rwyxxCxN61JJAozWL2uyExkzaMOtWSkNIwNpbjx7FZuHBVyfVD2
	OzS9nC54UEyfoTGV0yDDNN1lx4tOXk3a6vZZzywDaxNH0nDFPN0EyUAtVi8jUBnMZkUbsTWBvl7
	9CKGElET95gFactHQRePSkV19RxxKQeKjFP62uBIPtZHJTu6i5/aMYeAyIfntEoTPZX2DWibCb4
	lm4uSZzpZe1bV0Tda0iVUmJ9hBJDL9MhNysOmrekSbSMFzwXfS6JsTm0r3N/h6Z1p9u1XS0FMDh
	M+zMc49NLMZUUzbdo6nBk0Fmt8VOLfYx55Jr9X5Ntfj5/RA5bcZXAkPjr
X-Received: by 2002:a05:693c:248b:b0:2a4:5c3b:e2b0 with SMTP id 5a478bee46e88-2a94176125dmr8165229eec.25.1764323834414;
        Fri, 28 Nov 2025 01:57:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHocW7i1Sn9KTPY4QfjJZylauhsGHMC3Tm4JYoMU9NxglbeedCvSs5CRZc2eN/HIdaKiy39SQ==
X-Received: by 2002:a05:693c:248b:b0:2a4:5c3b:e2b0 with SMTP id 5a478bee46e88-2a94176125dmr8165205eec.25.1764323833621;
        Fri, 28 Nov 2025 01:57:13 -0800 (PST)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2a9653ca11esm13697351eec.0.2025.11.28.01.57.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 01:57:12 -0800 (PST)
Date: Fri, 28 Nov 2025 01:57:11 -0800
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Jingoo Han <jingoohan1@gmail.com>, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 3/5] PCI: dwc: Remove MSI/MSIX capability if iMSI-RX is
 used as MSI controller
Message-ID: <aSlx91D1MczvUUdV@hu-qianyu-lv.qualcomm.com>
References: <20251109-remove_cap-v1-0-2208f46f4dc2@oss.qualcomm.com>
 <20251109-remove_cap-v1-3-2208f46f4dc2@oss.qualcomm.com>
 <dc8fb64e-fcb1-4070-9565-9b4c014a548f@rock-chips.com>
 <7d4xj3tguhf6yodhhwnsqp5s4gvxxtmrovzwhzhrvozhkidod7@j4w2nexd5je2>
 <3ac0d6c5-0c49-45fd-b855-d9b040249096@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3ac0d6c5-0c49-45fd-b855-d9b040249096@rock-chips.com>
X-Authority-Analysis: v=2.4 cv=Vtguwu2n c=1 sm=1 tr=0 ts=692971fb cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=8BFNsxKPdyf3tXGkzS8A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: 2H_WVZE3TxyOKeoDcGSlGzLePN1WOHdQ
X-Proofpoint-ORIG-GUID: 2H_WVZE3TxyOKeoDcGSlGzLePN1WOHdQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI4MDA3MSBTYWx0ZWRfX31TDfPKQYodO
 AteTIHmVns3o4BYIXIG1trD+nY+2ET+jHaKhAMIP0tLR0sbWxbNSZZyYL3mV8T37X9sjvVamQ65
 Pgc38AuuRWgdkYBfiBKMl5X3PVbOhZ65NCTqzY5PHpaH2jA3pQGNv9Jbi6kVTgtAO5zaOZPoK1H
 u9YtWY3m+U9SkGwavZErM98+iwBnLAbeK0olQONQKvC0UlT6PlZQXOOgQrHkYKI4G5SE+gw+1P1
 AW6YPQv/TuFdBvWl75KaHLTuX3Q7e9dS7EGLw2xx5yPupkS8AuurhaVFJJz2TpFvodrH/0IWoqL
 TL/vyZmbjH33zAMI6GKLDBEhG/XbvHXdw7j0Og388KE69I55sGYkM9YiaPmnkkypGi6I4hHI6IZ
 eEO5LshlpNbDgHKZn7ynPLis8sezWQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_03,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511280071

On Fri, Nov 21, 2025 at 12:04:09PM +0800, Shawn Lin wrote:
> 在 2025/11/21 星期五 1:00, Manivannan Sadhasivam 写道:
> > On Thu, Nov 20, 2025 at 10:06:03PM +0800, Shawn Lin wrote:
> > > 在 2025/11/10 星期一 14:59, Qiang Yu 写道:
> > > > Some platforms may not support ITS (Interrupt Translation Service) and
> > > > MBI (Message Based Interrupt), or there are not enough available empty SPI
> > > > lines for MBI, in which case the msi-map and msi-parent property will not
> > > > be provided in device tree node. For those cases, the DWC PCIe driver
> > > > defaults to using the iMSI-RX module as MSI controller. However, due to
> > > > DWC IP design, iMSI-RX cannot generate MSI interrupts for Root Ports even
> > > > when MSI is properly configured and supported as iMSI-RX will only monitor
> > > > and intercept incoming MSI TLPs from PCIe link, but the memory write
> > > > generated by Root Port are internal system bus transactions instead of
> > > > PCIe TLPs, so they are ignored.
> > > > 
> > > > This leads to interrupts such as PME, AER from the Root Port not received
> > > 
> > > This's true which also stops Rockchip's dwc IP from working with AER
> > > service. But my platform can't work with AER service even with ITS support.
> > > 
> > > > on the host and the users have to resort to workarounds such as passing
> > > > "pcie_pme=nomsi" cmdline parameter.
> > > 
> > > ack.
> > > 
> > > > 
> > > > To ensure reliable interrupt handling, remove MSI and MSI-X capabilities
> > > > from Root Ports when using iMSI-RX as MSI controller, which is indicated
> > > > by has_msi_ctrl == true. This forces a fallback to INTx interrupts,
> > > > eliminating the need for manual kernel command line workarounds.
> > > > 
> > > > With this behavior:
> > > > - Platforms with ITS/MBI support use ITS/MBI MSI for interrupts from all
> > > >     components.
> > > > - Platforms without ITS/MBI support fall back to INTx for Root Ports and
> > > >     use iMSI-RX for other PCI devices.
> > > > 
> > > > Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > > > ---
> > > >    drivers/pci/controller/dwc/pcie-designware-host.c | 10 ++++++++++
> > > >    1 file changed, 10 insertions(+)
> > > > 
> > > > diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
> > > > index 20c9333bcb1c4812e2fd96047a49944574df1e6f..3724aa7f9b356bfba33a6515e2c62a3170aef1e9 100644
> > > > --- a/drivers/pci/controller/dwc/pcie-designware-host.c
> > > > +++ b/drivers/pci/controller/dwc/pcie-designware-host.c
> > > > @@ -1083,6 +1083,16 @@ int dw_pcie_setup_rc(struct dw_pcie_rp *pp)
> > > >    	dw_pcie_dbi_ro_wr_dis(pci);
> > > > +	/*
> > > > +	 * If iMSI-RX module is used as the MSI controller, remove MSI and
> > > > +	 * MSI-X capabilities from PCIe Root Ports to ensure fallback to INTx
> > > > +	 * interrupt handling.
> > > > +	 */
> > > > +	if (pp->has_msi_ctrl) {
> > > 
> > > Isn't has_msi_ctrl means you have something like GIC-ITS
> > > support instead of iMSI module? Am I missing anything?
> > > 
> > 
> > It is the other way around. Presence of this flag means, iMSI-RX is used. But I
> > think the driver should clear the CAPs irrespective of this flag.
> 
> Thanks for correcting me. Yeap, how can I make such a mistake. :(
> 
> Anyway, this patch works for me:
> 
> root@debian:/userdata# ./aer-inject aer.txt
> [   17.764272] pcieport 0000:00:00.0: aer_inject: Injecting errors
> 00000040/00000000 into device 0000:01:00.0
> [   17.765178] aer_isr ! #log I added in aer_isr
> [   17.765394] pcieport 0000:00:00.0: AER: Correctable error message
> received from 0000:01:00.0
> [   17.766211] nvme 0000:01:00.0: PCIe Bus Error: severity=Correctable,
> type=Data Link Layer, (Receiver ID)
> root@debian:/userdata# [   17.767045] nvme 0000:01:00.0:   device
> [144d:a80a] error status/mask=00000040/0000e000
> [   17.767980] nvme 0000:01:00.0:    [ 6] BadTLP
> 
> root@debian:/userdata# cat /proc/interrupts | grep aerdrv
>  60:      0      0      0      0      0      0     0     0     INTx   0 Edge
> PCIe PME, aerdrv, PCIe bwctrl
>  63:      0      0      0      1      0      0     0     0     INTx   0 Edge
> PCIe PME, aerdrv
> 110:      0      0      0      0      0      0     0     0     INTx   0 Edge
> PCIe PME, aerdrv
> 
> > 
> > > > +		dw_pcie_remove_capability(pci, PCI_CAP_ID_MSI);
> > > > +		dw_pcie_remove_capability(pci, PCI_CAP_ID_MSIX);
> > > 
> > > Will it make all devices connected to use INTx only?
> > > 
> > 
> > Nah, it is just for the Root Port. The MSI/MSI-X from endpoint devices will
> > continue to work as usual.
> 
> Qiang Yu,
> 
> Could you please help your IP version with below patch?
> It's in hex format, you could convert each pair of hex
> characters to ASCII, i.g, 0x3437302a is 4.70a. The reason
> is we asked Synopsys to help check this issue before, then
> we were informed that they have supported it at least since
> IP version 6.0x. So we may have to limit the version first.
>

Hi Shawn,

I checked the IP version of PCIe core on glymur, it is 6.00a (0x3630302A)
and iMSI-RX still can't generate MSI for rootport.

- Qiang Yu
> --- a/drivers/pci/controller/dwc/pcie-designware-host.c
> +++ b/drivers/pci/controller/dwc/pcie-designware-host.c
> @@ -1057,6 +1057,10 @@ int dw_pcie_setup_rc(struct dw_pcie_rp *pp)
> 
>         dw_pcie_msi_init(pp);
> 
> +#define PORT_LOGIC_PCIE_VERSION_NUMBER_OFF 0x8f8
> +       val = dw_pcie_readl_dbi(pci, PORT_LOGIC_PCIE_VERSION_NUMBER_OFF);
> +       printk("version = 0x%x\n", val);
> +
> 
> 
> 

