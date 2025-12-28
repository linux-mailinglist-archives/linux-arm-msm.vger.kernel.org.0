Return-Path: <linux-arm-msm+bounces-86710-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E87A8CE49A9
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Dec 2025 08:02:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5A269300983B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Dec 2025 07:02:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C930A279DC0;
	Sun, 28 Dec 2025 07:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ekdtKJUm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="evcoLezI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 110B52A1BF
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Dec 2025 07:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766905363; cv=none; b=j7qTzCQrfBrihu+tWLMhT5wbkLIb3lMnhaoOFGnbUix0yFp8kOKcsAtjemVl1VYBMY4hkDaiMCBCI0uPeF9868k0/xynRV5qPxN1YgNHftVEi7TTc8TaNUnHJSc5hyC75v8JrPAm7LaabksTcjtuEOA5lmni0D6aBt4+mqddu8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766905363; c=relaxed/simple;
	bh=kb+veMitUkGZucSxKLI+utjfCapexAaExo9EQ7NU5AY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UySdjkFF//lfJuzvwqDYHxw9QY8IT5TwiQyOpnwbnmUCRQQ56dncOv86dPm1GCTI1uueSitpfVd7wIi4poIcKyovK4ctRGs6/dZjCMSKZfaCbbLi60EpIv+U5J3obKUZsevR/naaKra65iLOwFl9IUA5Q4OQOi3annq+X12BL/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ekdtKJUm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=evcoLezI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BS2rlF4906751
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Dec 2025 07:02:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KZf5LmCYmxOG5r73vNe68pIQX0bbymxZl3p48gSKIyQ=; b=ekdtKJUmh/AgZQmQ
	KHrtK5+R2hZgj1XGGNk7C0Nqjr/mAOswg18lTBJetjaZLEl548kmlzDVAQQ2Znwf
	G4pYJS/hxaT8X4y/5W/scP2DzFcSTp+TyxFQWTgPXx4a8v4BLrbo3dQqlxG6OEhW
	fx8B5OEmn7YE4jgAhOig8bzGwaKaX/q6u/clUY4DSCwaFSuXVZLVbi00CQjP50my
	kZ0P/YDGUDBtXqm0VNWbxQKxNGld4riwzdDVkZEqz61eL7MCf7ckLsOfLGrdFgxz
	MXKmpiRzhNdN9pXm8GcVhPNtqDbD16Fe+1jXtSjHHT63xSlcp+EuHol62xdNhYP4
	Lbp3ZQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba8r69rmj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Dec 2025 07:02:41 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-34c38781efcso16949992a91.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 27 Dec 2025 23:02:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766905360; x=1767510160; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KZf5LmCYmxOG5r73vNe68pIQX0bbymxZl3p48gSKIyQ=;
        b=evcoLezI4NDWhXlp5Ir8yHTwJRAJvU7OCaMEZU1mLIEOt2oYiOCQeZTG/5Z0GE3W2c
         zJZ1fX+txWxaCoZUHqz4k509fgxMsFX12V27E059r61z3HYZ1J4dLlnR43QF34pQspTV
         Y1xGZ5TfXdkYVK/O/EZE/niyQJpFsnFV52F00czEu7wpR9Mt+wb9MTBtP/WPb+8ebzns
         Y2tPDlmaHh8U+DfaiqakowSXoS8eVliMrRDosKCWttyIjfhijPkxj8xB+63Iif7Jf8zc
         /MYzKwPOthbjP12/zGIp6N+Xg2ffG05vYxa+1w9dMGzeB2ywLOP+Gu9lIu3PFQNdhUzx
         vp5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766905360; x=1767510160;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KZf5LmCYmxOG5r73vNe68pIQX0bbymxZl3p48gSKIyQ=;
        b=Gb+YtWfXLPI25mCX0r80GTs/R4zPo2KiHFUVbBwpS4Jk1zXaQtUCr2EZi5Xc1dtr+V
         3TII2K+Pe7gzu6Ncxn1+K3CwwhqEP/nA9c96/B6BbTKW07wQsqX8R+94h7Vugedv2adZ
         Exe7F8kZXJph+2efnHAMuXx5J329ZmcqiO6/5XahUB3Ng+QIeETNEn495gxbR3975D5g
         b26Y1s9MmaAxMwhPDCrq53YLgEQv3HVkZR3Cw5dTCjWd9QlahvTMmk1mlsXNTELlHWbE
         ugYYQg5KDa0Z6726tSQaDP7+ueYUP91BRqDfMaWBomV0AIS5dqCORD84hQqI0okegOG+
         n5ug==
X-Forwarded-Encrypted: i=1; AJvYcCUPyFJfS1MhXfvZxsIZLRYHnf3xLNEEFDtBNIgNbogGwcWd1EInWyDzlGaQVePd5+SvYYiNr8bnttnHSjR/@vger.kernel.org
X-Gm-Message-State: AOJu0YzH3V4VRQzR81+Szuyn9gaUpJU3RrghIdSoHjT8q8S4A+0X3Rzm
	NtU/mjtfvp+hCCBK5TGp3QxFgR0GNcC58xmGrXDy+X3v3ZJ/0dGE3AL7+mPD3Iw4DRBjy/peTlL
	5M8ptnO4JBHOPIiAnIrH1MvQlbLppu9K2bnOiBg6GkVUp0hV/QWTng4kGiyyXfveHHWuY
X-Gm-Gg: AY/fxX6BqtG0Rpz2/uINVURvv3Es3bFvpxEKafSjZS4c6lh3Wer8J9ZrJBSTuQhf3HF
	g/eY1cx4EEdjigphoZkwJyF3ImM5FXt3rq00pBMBZ7Snnu1UBkdMmiKenolBMNxOQqGwms1SQbW
	gkSl087KbnZMd0VKELd7PtoSUFzRgGKgJ65pXcrYsWyNgvlsNm1l58oRYxlUve7xQond+MVQC5R
	rr8r2zu7WVX5y+TI1181rwwEjswTP3fAXsOO8A1s386+ZHBjazIjenMLuYVKW0P0ZK9WSMESImH
	+kDNpMqZFLnSy2jpwJRxKLE9faX2sUpz5gVZCQnJWlDtHcw9XRYvRMnEpADu8WI9lDW89IvxIxr
	3cSjUn4eAgSALy8fce0LoIYw8KUDD7I8Q7LqN2vRQ5ztWtzvmELX/1CAa
X-Received: by 2002:a05:7022:3f06:b0:11d:f44c:afc6 with SMTP id a92af1059eb24-121722b842amr22584618c88.15.1766905360361;
        Sat, 27 Dec 2025 23:02:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGSuBRh+x/1t2TJaXLScFus1sMNpi+N6PUoXPzyRfSBJ5Cla2/z09dzZ0QgBDWTgW+ajXzxYA==
X-Received: by 2002:a05:7022:3f06:b0:11d:f44c:afc6 with SMTP id a92af1059eb24-121722b842amr22584602c88.15.1766905359727;
        Sat, 27 Dec 2025 23:02:39 -0800 (PST)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121725548b5sm105546648c88.17.2025.12.27.23.02.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Dec 2025 23:02:39 -0800 (PST)
Date: Sat, 27 Dec 2025 23:02:37 -0800
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Bjorn Helgaas <helgaas@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Jingoo Han <jingoohan1@gmail.com>, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 3/5] PCI: dwc: Remove MSI/MSIX capability if iMSI-RX is
 used as MSI controller
Message-ID: <aVDWDaiR11RGKBuX@hu-qianyu-lv.qualcomm.com>
References: <20251109-remove_cap-v1-3-2208f46f4dc2@oss.qualcomm.com>
 <20251226213123.GA4141314@bhelgaas>
 <dua64cg42sduzzjp623o4c72etyqtei6txk57kwbqerpa5ketz@x4cs5fjlervu>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dua64cg42sduzzjp623o4c72etyqtei6txk57kwbqerpa5ketz@x4cs5fjlervu>
X-Authority-Analysis: v=2.4 cv=Raidyltv c=1 sm=1 tr=0 ts=6950d611 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=rvI9OrrfPYhO3Jog6jQA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: 1QR-DE1hPzuhK5kD4t2QpRPolL5v6RoL
X-Proofpoint-GUID: 1QR-DE1hPzuhK5kD4t2QpRPolL5v6RoL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI4MDA2MCBTYWx0ZWRfX4+rIfPd9lhKo
 PrcKF6gimAW+WMNZ01HBn3DnHgUfj4FVbnJ9FLPp6ai33/WwmJ/FpyYpXSfU0d2QZmo5RaOfbyr
 Uq80TN2JXDNKb00TSfQ0HYOEWPdjAEm0jjWF2SdtPinXgPRJmp27wilXEwp8ICi8k0kmc6GJMcI
 Lo6T9IR3Nfe0bIyEhoceR6mSACB/IO/vvTg3Kh//DVZlcaL37GFrG0FYdyCbSXyRyWv2olEoMdD
 R7eR5qFeyYqf33WE+duj+JY+tsSXqlku5y566T53FpR99nocMZEPQSxy7lUQJa1lsEXWOXYrEp3
 HcrFxl/ab4iRAYnj1YjIqnwL6L1WIEgQWuPm5mGzy4PSbVV70mNlTRLrGS0+E182eq3+sKhq3Zx
 VC8wy+37pOks1s2lI3umhAx+wV1/F+dhtcAwBZCYJAIj0BNCFrTKjGaLuf/zthwKUVah23BcCYW
 YiNYFhTDiFlBa2aY6Zw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-28_02,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 phishscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512280060

On Sat, Dec 27, 2025 at 10:51:26AM +0530, Manivannan Sadhasivam wrote:
> On Fri, Dec 26, 2025 at 03:31:23PM -0600, Bjorn Helgaas wrote:
> > In subject, s/MSIX/MSI-X/ to match spec and other usage.
> > 
> > On Sun, Nov 09, 2025 at 10:59:42PM -0800, Qiang Yu wrote:
> > > Some platforms may not support ITS (Interrupt Translation Service) and
> > > MBI (Message Based Interrupt), or there are not enough available empty SPI
> > > lines for MBI, in which case the msi-map and msi-parent property will not
> > > be provided in device tree node. For those cases, the DWC PCIe driver
> > > defaults to using the iMSI-RX module as MSI controller. However, due to
> > > DWC IP design, iMSI-RX cannot generate MSI interrupts for Root Ports even
> > > when MSI is properly configured and supported as iMSI-RX will only monitor
> > > and intercept incoming MSI TLPs from PCIe link, but the memory write
> > > generated by Root Port are internal system bus transactions instead of
> > > PCIe TLPs, so they are ignored.
> > > 
> > > This leads to interrupts such as PME, AER from the Root Port not received
> > > on the host and the users have to resort to workarounds such as passing
> > > "pcie_pme=nomsi" cmdline parameter.
> > 
> > This will be great, thanks a lot for working on this.  This has been a
> > long-standing irritation with this DWC IP.
> > 
> > > To ensure reliable interrupt handling, remove MSI and MSI-X capabilities
> > > from Root Ports when using iMSI-RX as MSI controller, which is indicated
> > > by has_msi_ctrl == true. This forces a fallback to INTx interrupts,
> > > eliminating the need for manual kernel command line workarounds.
> > > 
> > > With this behavior:
> > > - Platforms with ITS/MBI support use ITS/MBI MSI for interrupts from all
> > >   components.
> > > - Platforms without ITS/MBI support fall back to INTx for Root Ports and
> > >   use iMSI-RX for other PCI devices.
> > > 
> > > Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > > ---
> > >  drivers/pci/controller/dwc/pcie-designware-host.c | 10 ++++++++++
> > >  1 file changed, 10 insertions(+)
> > > 
> > > diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
> > > index 20c9333bcb1c4812e2fd96047a49944574df1e6f..3724aa7f9b356bfba33a6515e2c62a3170aef1e9 100644
> > > --- a/drivers/pci/controller/dwc/pcie-designware-host.c
> > > +++ b/drivers/pci/controller/dwc/pcie-designware-host.c
> > > @@ -1083,6 +1083,16 @@ int dw_pcie_setup_rc(struct dw_pcie_rp *pp)
> > >  
> > >  	dw_pcie_dbi_ro_wr_dis(pci);
> > >  
> > > +	/*
> > > +	 * If iMSI-RX module is used as the MSI controller, remove MSI and
> > > +	 * MSI-X capabilities from PCIe Root Ports to ensure fallback to INTx
> > > +	 * interrupt handling.
> > > +	 */
> > > +	if (pp->has_msi_ctrl) {
> > > +		dw_pcie_remove_capability(pci, PCI_CAP_ID_MSI);
> > > +		dw_pcie_remove_capability(pci, PCI_CAP_ID_MSIX);
> > > +	}
> > 
> > "has_msi_ctrl" doesn't seem like a good name here because there's no
> > documentation about what it means, and "has_msi_ctrl" is completely
> > generic while "iMSI-RX" is very specific.
> > 
> 
> This predates my involvement with DWC drivers, but I guess it expands to 'has
> internal MSI controller' and 'internal' probably means iMSI-RX. But I agree that
> the naming could be improved to something like 'imsi_rx_available' or
> 'has_imsi_rx'. I'll take a stab at it in a separate patch.
> 
> > And apparently platforms with ITS/MBI *can* generate MSIs from Root
> > Ports, but "has_msi_ctrl" would be false for them?  This is really
> > hard to read.
> > 
> 
> Yes.
> 
> > pp->has_msi_ctrl is set by qcom_pcie_ecam_host_init() and IIUC, for
> > any platform that lacks .msi_init() and the "msi-parent" and "msi-map"
> > properties.
> > 
> > The qcom_pcie_ecam_host_init() case is weird because it looks like it
> > abuses the pci_ecam_ops.init() callback to initialize MSI stuff, not
> > ECAM stuff.  Maybe that MSI init could be done in qcom_pcie_probe()
> > right after it calls pci_host_common_ecam_create()?
> > 
> 
> I think it should be possible to initialize MSI after
> pci_host_common_ecam_create(). Let me fix *this* and above in a separate series.

The qcom_pcie_ecam_host_init() is used by firmware-managed targets and the 
function unconditionally sets has_msi_ctrl = true without checking for 
"msi-parent" or "msi-map" properties in the device tree. So I think
firmware should take care of removing MSI/MSIX cap.

- Qiang Yu
> 
> - Mani
> 
> -- 
> மணிவண்ணன் சதாசிவம்

