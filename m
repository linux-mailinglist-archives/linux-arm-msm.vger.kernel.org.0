Return-Path: <linux-arm-msm+bounces-87119-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BECE3CEC223
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 16:03:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1B3223029228
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 15:02:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4F5621D3CA;
	Wed, 31 Dec 2025 15:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AmCWnsdm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JavDVwil"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FBC7233721
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 15:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767193354; cv=none; b=Vmkj6cJRpaLsUNtM1mzYaNGbOla2pqYtYVVgSAKuulBPqSPWoEvZV4YUiix/syFJlG8K9r3IQmDW0AMj8ssp8u2+M1d6SwnnBYJfST53IujI1aZhlcsU1rQJ6r2O0UREmzAtLUSY0TR5IzQkAFMRI3PhUL49J8cAYcjY1fBPAJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767193354; c=relaxed/simple;
	bh=hLUjgjU792XdaQ87pmizMNeeyV+aqPmu7RPMcrYMEKI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V2oYf1vUUjrKMrNT1z4C3uwfhj47VcUSc6UIDcKXI1eMq4IvK0z9GpbWJ2IIrHUguXabLgk8M0VTDWP/xT0KuFCwVQ6HwqyhfPsEePTGET0FpmHuGdOLPQ9BGPVrJsDNwzuy8dcIL2cc3MtDX2nJFfbd+rUCoceSsV/0rDAbEi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AmCWnsdm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JavDVwil; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BV3dVmC1830530
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 15:02:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=G2g+Iw+praYQYAElrNxBI/Zb
	2AEqMuCIMvAgbIJNLuE=; b=AmCWnsdmnZJTarH6FB3lZ75DHaNMaWe+mX3YfFrC
	RwugPRQ8L/wp2mosAhJ/xr52DcT84S08xmXj3bh9KovSZEC03Czex8Bmdi96tUna
	dUSMsUrkDw4kJqUNJ3Kg1Y6GNm1zVCZPH5LgDTOeb7YISDEDHUpmjgqASt1nerqA
	s8UurOJxGgOFkq8qtL+2I3TrY8bmZpBnQmsFETWdeD+xy8lqc3mLG2CtXmOuxLX8
	whsQf35lx8CryA9XCcFLCk/BQnkuhe69DNDWfF4sFJowGY2IXSwWMLa/3AV0VRsn
	l039Wz+vrI85Kj6hDv6ubu4E0iku/MWnTSDopKpICrHbqA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bcv4ah3pv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 15:02:32 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-5eb8e7b7b40so12683325137.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 07:02:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767193351; x=1767798151; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=G2g+Iw+praYQYAElrNxBI/Zb2AEqMuCIMvAgbIJNLuE=;
        b=JavDVwilJA/gNcWY+jshX9Frwx3zbGXjiRxHNO7jF4YVTfem69qjdvjY2cM5VdS7UX
         BELJP3G+MIMsD573u9evbrdO8MMl9M8YIW13YJORCjdPJKOXzgteylq5+Uo+3QAz0Xl/
         i2OBOgWwoVuhUpj8s2N3vpvBV2v4qOyKGM+WKZv9kfmU9KQ0eQsKSdgDxk8kIBVYMTAA
         hTn//6LqC6myn+Vb+//O4LMUnhSsCEc30PHFcRfAGsyw5bcJpmjwJHSh8Xdd1DfUAQAI
         uqUhMkNPO1w/4tRKI6g8zyFnB3b3Qv0IFYHD78FTwIHp576u/7q49icMey1R2L5aHdaN
         uPeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767193351; x=1767798151;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G2g+Iw+praYQYAElrNxBI/Zb2AEqMuCIMvAgbIJNLuE=;
        b=XRJe00dK2DCa2Kx0+2sTPxCe6jWZtDolco0m+bKTPAuDGRNODwUZCw7B+HZJslBHpQ
         pcdGeLY9Bbqn9RRMUI7hcDrx/vRLes6mz4g9VybmLh/1xXalTcxvBnD1Vax9oBS/L953
         hBrJJlSgQ7/dFz3rC1ZJ72TB61pmdf5A6Svs0UwBq80CTiF4Z+eFsi5U64P6X9mo8pV1
         dvru3wqUfIn9tougDIH0d0GtUy9yVpW2pNOLKPIeDNiTiW6VsNx7ecaEKN1N26lRm8MS
         eMGnHWO6mm0ZnnkurJtd+fA4XbK/1iQCu6OA++SovqbYai6AwiF9jspfqe8t0rOhULSH
         byjg==
X-Forwarded-Encrypted: i=1; AJvYcCWLmgxz7PQ4h4tOq6PDDFB0bCjrqDXBhc61QQsK3qkFBUJ1lVKsb0PN/Jlk+4xbNDK2VqMGwYXDbGNzWEvp@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/BaeGTsolwEAMrwGASBWkNr+ZIlC6tTTj2BGcpoDMsd2zEjUH
	GJtlH7up84rhkCzrJApDL2CWvEeoVC5HqIqRn6t5Bti5fnLIIkBBc7FLKaI9d4ywK9qkyVBks/O
	SItsgoCxyWsdagi92wiqBAs0cYFHe7uCTVT5M6YMEJu4xLT+bzy1xi7Vq16ry+Cr/L8mu
X-Gm-Gg: AY/fxX4f3hokBCdRxr9ih6Q2nWoTXkPbDEQoDW0gxNpQ/YqRxP8Fh7RNN5tZJ3NV6Ig
	8P7xlRzRAUiDbaZngBXepKX5ZiYza4RkupKCcAy9S9aVgnKgxJrfzorbMZ+ehZdtuyW2otXMrKG
	GDRPSbFlRKyrdsXKA8hYRDVNkOZt867zXMWWr15poCuGlIwYOb2bNi4jXbWUdnHmrkqZf/iAeaP
	DZ8Pvj83pJr5dHI/DZPxfWdPWDI8SP8V8RmHLnvHk2KS1M3DhYTv0oZ1q5OJdy9H5chgE/tAl8i
	jdyF9lUiHIWxVjaw2mlwNdbY/2xFmqvbumohHTI0nO0cQMkPVIEIbQ2gkvTALZdcSsbSeQ229Uj
	j3ewymNPdq7G9bVjYn6H+d+pR2yu+FuW2F1BOmfCK6H49g54Sx6uxv8+2SxspKQ6o4BEvcBWEwq
	/dUTT27B3L78HTCVSHXeNln0w=
X-Received: by 2002:a05:6102:6448:b0:5db:36e5:7b41 with SMTP id ada2fe7eead31-5eb1a6804b7mr12911653137.11.1767193351279;
        Wed, 31 Dec 2025 07:02:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFsSSEbdUu35JgF018iIayUPMoHIXc5JQon3MalP8dnesbqXrtvIu+qvSZ2lIdHk7UPLughSQ==
X-Received: by 2002:a05:6102:6448:b0:5db:36e5:7b41 with SMTP id ada2fe7eead31-5eb1a6804b7mr12910910137.11.1767193346827;
        Wed, 31 Dec 2025 07:02:26 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a186282ecsm11141146e87.94.2025.12.31.07.02.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Dec 2025 07:02:26 -0800 (PST)
Date: Wed, 31 Dec 2025 17:02:24 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Matthias Kaehlcke <mka@chromium.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-pm@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 03/14] Bluetooth: qca: fix ROM version reading on WCN3998
 chips
Message-ID: <5hsxiep24iabr3pw3mlcusv5iifapvzqqdjtralha5npchucgj@xopra3rrxvc3>
References: <20251231-wcn3990-pwrctl-v1-0-1ff4d6028ad5@oss.qualcomm.com>
 <20251231-wcn3990-pwrctl-v1-3-1ff4d6028ad5@oss.qualcomm.com>
 <dd020ebb-d005-4322-9321-b09199156a9c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dd020ebb-d005-4322-9321-b09199156a9c@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: bZpK2Y95rmUORrLp3N2TWhE5Yf384Qru
X-Authority-Analysis: v=2.4 cv=Ps6ergM3 c=1 sm=1 tr=0 ts=69553b08 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=QZZepdHf_SHC0IKlQlAA:9 a=CjuIK1q_8ugA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMxMDEzMiBTYWx0ZWRfX/MdnHuT1ejla
 1XkZfWe3Dd/+YVXtxOmpEbNWnTsw5O7ZmYqnhZatkfHguuniqWs343ZUsG8vrK+HVKeAepBwk6J
 91UjmR6o4gUiDBiTGPSXNYh/WLdPQN33uQV5vA3qdaZL0Qc/U7cfj9gBfuC2t4s+Q/Zx4tBoqnw
 uv+o1yM9anGa8+yCV71XnP7NjMW+KSF3pRlZEhN9hzv1O5BljSnCMTB9an4UNBj0jj3DNckgrsK
 oY8e7wZAyOdZUBClj+BMqZgQzozEGTxDg5EuzyEY9jc0iqv0p1qFe+fyyxOIzOiLmPDGkcsbHNE
 2f6wnSWXLzhMWQ9G22RcrtaH89iyBraw3ZxsAeCqS8ljBy3UJJc4P2Rw7SNkOUVEsz7vbrKgnab
 dJ6QzsUsaUjF5yCnH5nYQr9mwpzgJvFFV1DNIv7WNGKb4d0MAU6nw2mv8foKluuTQB5apNOpe3+
 7WKMBan30foi9pAvLwg==
X-Proofpoint-GUID: bZpK2Y95rmUORrLp3N2TWhE5Yf384Qru
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-31_04,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512310132

On Wed, Dec 31, 2025 at 01:04:56PM +0100, Konrad Dybcio wrote:
> On 12/31/25 12:35 AM, Dmitry Baryshkov wrote:
> > WCN3998 uses a bit different format for rom version:
> > 
> > [    5.479978] Bluetooth: hci0: setting up wcn399x
> > [    5.633763] Bluetooth: hci0: QCA Product ID   :0x0000000a
> > [    5.645350] Bluetooth: hci0: QCA SOC Version  :0x40010224
> > [    5.650906] Bluetooth: hci0: QCA ROM Version  :0x00001001
> > [    5.665173] Bluetooth: hci0: QCA Patch Version:0x00006699
> > [    5.679356] Bluetooth: hci0: QCA controller version 0x02241001
> > [    5.691109] Bluetooth: hci0: QCA Downloading qca/crbtfw21.tlv
> > [    6.680102] Bluetooth: hci0: QCA Downloading qca/crnv21.bin
> > [    6.842948] Bluetooth: hci0: QCA setup on UART is completed
> > 
> > Fixes: 523760b7ff88 ("Bluetooth: hci_qca: Added support for WCN3998")
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  drivers/bluetooth/btqca.c | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/drivers/bluetooth/btqca.c b/drivers/bluetooth/btqca.c
> > index 7c958d6065be..86a48d009d1b 100644
> > --- a/drivers/bluetooth/btqca.c
> > +++ b/drivers/bluetooth/btqca.c
> > @@ -804,6 +804,8 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
> >  	 */
> >  	if (soc_type == QCA_WCN3988)
> >  		rom_ver = ((soc_ver & 0x00000f00) >> 0x05) | (soc_ver & 0x0000000f);
> > +	else if (soc_type == QCA_WCN3998)
> > +		rom_ver = ((soc_ver & 0x0000f000) >> 0x07) | (soc_ver & 0x0000000f);
> >  	else
> >  		rom_ver = ((soc_ver & 0x00000f00) >> 0x04) | (soc_ver & 0x0000000f);
> 
> This looks like rom_ver is essentially maj|min or so with min = 4lsb and
> maj being a couple bits up.. no big deal in the end, but this could be
> expressed more nicely

Well, I'm also unsure about the WCN39998 one. Maybe I got it incorrectly
(I couldn't find any definite documentation about these versions).

-- 
With best wishes
Dmitry

