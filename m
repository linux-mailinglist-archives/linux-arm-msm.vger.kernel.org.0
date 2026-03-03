Return-Path: <linux-arm-msm+bounces-95033-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EMJkLc08pmmpMwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95033-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 02:43:41 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B7641E7C59
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 02:43:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 804D53031832
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Mar 2026 01:43:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7303373C00;
	Tue,  3 Mar 2026 01:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JdKPqX1K";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aRTecvAN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 945232C1584
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Mar 2026 01:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772502218; cv=none; b=SIGyC6tipjjYrPYWRWh+qBsAhnDOHYQ1hrAk1SBIosMgBqG7KGFk+lC3fN2mVJN1wmjxYGTRMqLASYanSqttGcCFmKeJ14i1AUK7Vg9EhfCFt5AzkDnyf0D01lLIOBUE8c0lGKZaU70VyP2SQZRJL2iSt9qmlZyn/3ywbKA+MN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772502218; c=relaxed/simple;
	bh=i4jKsvabsQ1+RXbVYAM6h40AITuGmmIfVt7gRKhfmLA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CdMzzg/ELyNxQNFR95fSxTXaTdFrksJqxGcZfyiK12HGaGcDr+BIcriYV/Krk7ewawx+VEe16A+DHdHulgF3urhca0X665+Q6i0jRkzmUJ8MWRgrLY6GHP99UjtEtCYHNSN3Gww9tZpoWxCABnE92Kyvmgf6QKA/I/6pccv02bM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JdKPqX1K; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aRTecvAN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 622K02972996210
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Mar 2026 01:43:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Wa8JYJ97vCRvUAnb2y8s1hFO
	Xb0oIDwDms0q0c0b36w=; b=JdKPqX1K9NM9kN6DfxloxPkOSgLkwDNhsSwci01Z
	IPnRnC2BkxwjXR1MPo1m/pYjSV5PMyzTaueRt6wEpR+2kgZDDceDDMYslCjUOz7Z
	pryos0GeeXlRU49ghlHBTmy417PvmpHG9HEBljJw8zZI+9ZA8qYmLJg9fGseYyjx
	k0jRmdYZIPvjQZfeSPD6552wyfWpaQRSskNbWwQYcB3issI7yRScaXLrZX+MDlK+
	R7CjBp3l7RQUw72TCyLZuoz/TAR+7ex+buvotD8GNuk9oT2TnqAIyru+X7p9jOWi
	Q8wPjmJkSJez46/JVKEOSlkvMvLwSqMFYsV6uXtSneeucQ==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnh6u8wm3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 01:43:36 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-45f0bfd68a3so26301543b6e.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 17:43:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772502216; x=1773107016; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Wa8JYJ97vCRvUAnb2y8s1hFOXb0oIDwDms0q0c0b36w=;
        b=aRTecvANjB5x6SPBsSjR2uWX5Alk5Gnn6oEzpoMVlw3KOP0wFIZiZNlIsacmxOrP0+
         YvwZ3DzIHIshblu6a8tErCMtD5aXdmF2MiHHZFJ6tVQjWwmGCZ22cKWCGt+dVYYYj5xx
         sSDVhNmkwOGd/QBgAZHxbQvzmLcyrTGdI4HhRUaTcAU6V9lB2RnxuEwpbTdxB1d+tdLt
         RId3jArBo70y2KySCwSn37gEJsWQ80ppxBinD15N2SOOt3XpPlaODUrHHkVQi4CertwH
         MghK+zSa1DVqph1evqfLaujIYSMnNibmuRGB0+F0hYtemd39gq0SgTHm4Pf3UyC5nU4e
         Ny6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772502216; x=1773107016;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wa8JYJ97vCRvUAnb2y8s1hFOXb0oIDwDms0q0c0b36w=;
        b=eRnC98jiRm1BhKhoyH8EDV0cT4EFUG1QRcay8aweSLD4I7LphOSh5t/TUEStPzOyV/
         rz71vgqX8RI1lT63k/kMB5G6YIC+7GIf0kpnrVETeSk/yly1JLAMAB/gvC0IY6eBKTlj
         nDZ17tVAVVYrCcEaDPpLuhuSa64AwAnOkZnuPC039ILzF0pKbkojF3KbFKqlW66y+KOl
         +/XnAabh6NzK1T6esH16fefKC53wfAV4f8OPXzhNsf94xpJ2EBDpRkwsfzcu1tIeAJEM
         AyyPyD3JhQhbds46hWdQoyxM6Dz+FXeB4/mRS6id/zV2Zci/VBVPGY5Jrsb1mGzlWnDl
         Nyog==
X-Forwarded-Encrypted: i=1; AJvYcCXfCpT85Kq7osmcph+wbeCN02yZu+9NzHUhfHdXY4/ls0yyvxN+deLQieexOiY9OZvcD9Vvy3tMx5cqc6w+@vger.kernel.org
X-Gm-Message-State: AOJu0Yws7kPkIXddnLZiW8vUXSW7G2Syb/MEeamZMozTHLjTE26smc82
	NnxgIZZgKKU3kF/weO7zZmz/l+tHRNuVPHX/fWxvd7krjkRMl0d14S0IyTPoxTjHCFjqwhVZ/iz
	EOtECNMldR7gHXIt+Zj+cCSzAfwcNNSB7EHh5RFgX+2KKzo7eKh3zWSUzBQXSEVDIJEt2D/2OHP
	CUsHc=
X-Gm-Gg: ATEYQzzMZq9Cq7StKpHG4fB8mtAoB3BJaoddy22F0qtcOQaozud2H1sS64jjLuE7SOL
	sJr3cCJ73I9Z/YGBNvxieJLSUq6MjZF1P6VOE+G3jzeTxnDSYr3xK5fdPDIM0DHkG5+pctXeaGQ
	EkqTJVzjOP/IGF49k0avIeF3GxnaC1ZutVv26Ct8VYdhX171ajtHRNXEA+/GpjpBLPdBGZpPpdu
	75/hn6ok4fWWbcfacRRymzJpG9MaN2FAKKlaXmonsVnx6YLa8ZyVkJ67/Wdu7fXihIJv8KJeBSA
	uLc7Kj1w08jF34C6jK41DEpwvQcffvIW73h52Fnj0nCDi7z8seVkAc8xsckPogKYdRgRPxTizWg
	o/zEK4DNis3DhTsIW4e6JwyyD9TCv/0Y7I9Z7xTrsPeKS6Mkc1DXJDdZbgmC3+Z/STYQ8
X-Received: by 2002:a05:6808:1b28:b0:45e:dbc8:7b18 with SMTP id 5614622812f47-464bec215c4mr8174466b6e.13.1772502215945;
        Mon, 02 Mar 2026 17:43:35 -0800 (PST)
X-Received: by 2002:a05:6808:1b28:b0:45e:dbc8:7b18 with SMTP id 5614622812f47-464bec215c4mr8174452b6e.13.1772502215536;
        Mon, 02 Mar 2026 17:43:35 -0800 (PST)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-464bb5d0a8csm8509256b6e.14.2026.03.02.17.43.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 17:43:35 -0800 (PST)
Date: Mon, 2 Mar 2026 17:43:33 -0800
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Cc: mani@kernel.org, mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: Re: [PATCH] bus: mhi: host: pci_generic: Resume the device before
 executing mhi_pci_remove()
Message-ID: <aaY8xfPF9j83aM5X@hu-qianyu-lv.qualcomm.com>
References: <20260302134116.18960-1-manivannan.sadhasivam@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260302134116.18960-1-manivannan.sadhasivam@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDAwNSBTYWx0ZWRfX31UjyUtkdRQe
 tpZpLRswgbEDTK9TEBDO4ttmj86bxdeZOQoAW/MVjzjNwGDLARLSr2ltM7ErR+qCuyvucwYolWF
 bQ2GgBRAyORnkoWR9IhuaEENvFyc+zz1Usiy3I+VQ3M5jjmwmRr8mfpI3dujMm5eksPXRVmxm42
 6x+E7VPdHYXhOTcyEyfNZ+7HvwfNJlOdwHItT5UIk/2/Cof1MjZSz0af6Mv5lOIYs5Ujdkg6M6C
 Doty1+sRXSca/28DyiI2caikjNMQMa//OPhCHq0/i5rWVZv/zqAojC7TrYhuPPZJtVcmLyxJI0A
 UYoeoAUCyCxrhM/G/WUVftKcCVKciSbhmSycL7Lq3A96HCKYpu4qLBFZAG539GEaKaubuAn0yg5
 BLseecZyKyoIRsYlCwjJuC2EuN0BClJ6eZZ/ZUgFvrtLm0+1SiDAC0utxNJiALbzrNZQWJHb+ct
 RBzcQaL+Q1pPuFSG70w==
X-Authority-Analysis: v=2.4 cv=MuhfKmae c=1 sm=1 tr=0 ts=69a63cc8 cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=mZK3EA3oJS9YODrgi44A:9 a=CjuIK1q_8ugA:10
 a=TPnrazJqx2CeVZ-ItzZ-:22
X-Proofpoint-ORIG-GUID: 1pZxnhu30E0WvGBlDG0dTiQfAcjOVcoT
X-Proofpoint-GUID: 1pZxnhu30E0WvGBlDG0dTiQfAcjOVcoT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030005
X-Rspamd-Queue-Id: 0B7641E7C59
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,hu-qianyu-lv.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95033-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Mon, Mar 02, 2026 at 07:11:16PM +0530, Manivannan Sadhasivam wrote:
> mhi_pci_remove() carries out device specific operations that requires the
> device to be active. But pm_runtime_get_noresume() called at the end of the
> remove() will not guarantee that.
> 
> So use pm_runtime_get_sync() and call it at the start of remove().
> 
> Cc: <stable@vger.kernel.org> # 5.13
> Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Fixes: d3800c1dce24 ("bus: mhi: pci_generic: Add support for runtime PM")
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> ---
>  drivers/bus/mhi/host/pci_generic.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> index 425362037830..fe3aefa15966 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -1440,6 +1440,10 @@ static void mhi_pci_remove(struct pci_dev *pdev)
>  	struct mhi_pci_device *mhi_pdev = pci_get_drvdata(pdev);
>  	struct mhi_controller *mhi_cntrl = &mhi_pdev->mhi_cntrl;
>  
> +	/* balancing probe put_noidle */
> +	if (pci_pme_capable(pdev, PCI_D3hot))
> +		pm_runtime_get_sync(&pdev->dev);

Mani, I don't think we need to resume here. See drivers/pci/pci-driver.c.
PCI framework has called pm_runtime_get_sync before drv->remove(pci_dev);
Is there any other thing I misunderstand?

static void pci_device_remove(struct device *dev)
{
        ...
        if (drv->remove) {
                pm_runtime_get_sync(dev);
        ...
                pm_runtime_barrier(dev);
                drv->remove(pci_dev);
                pm_runtime_put_noidle(dev);

- Qiang Yu
> +
>  	pci_disable_sriov(pdev);
>  
>  	if (pdev->is_physfn)
> @@ -1451,10 +1455,6 @@ static void mhi_pci_remove(struct pci_dev *pdev)
>  		mhi_unprepare_after_power_down(mhi_cntrl);
>  	}
>  
> -	/* balancing probe put_noidle */
> -	if (pci_pme_capable(pdev, PCI_D3hot))
> -		pm_runtime_get_noresume(&pdev->dev);
> -
>  	if (mhi_pdev->reset_on_remove)
>  		mhi_soc_reset(mhi_cntrl);
>  
> -- 
> 2.51.0
> 

