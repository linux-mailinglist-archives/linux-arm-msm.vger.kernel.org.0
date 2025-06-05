Return-Path: <linux-arm-msm+bounces-60267-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 63497ACE93E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 07:24:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ABBF51894E35
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 05:25:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB9491ACEDF;
	Thu,  5 Jun 2025 05:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RTox0Obq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 451201A76D4
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Jun 2025 05:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749101095; cv=none; b=Pwhm41Z5dQcLxkdWMhsq6D7qQfyp6j9gnKpV1IdB2eHbfVLE8/DJQdS91OYkm6QJyOw7ZAp6viP9Y+J47ax/2gDInVlSX/i4N5fJS5EW4P91DR/xhYKmwgW64wUEVMT/YAjq6FpMXmnCwUEEbSAc46SFqRRvK7ZKQCGgWYWhmfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749101095; c=relaxed/simple;
	bh=M/t0pCLO2KZxMM+bBZlvb/oVz3LhELFVIIlfB6eoU1g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s0UQVMAgheIb9GPEES9lfkfEzib757yaEvE6ZqyRaUZb2cCQ3agmpQGTOQuuKsnqNMuN23PYqep9dmVv5fJZ3Y140llAonl1pA4UqhL4tZvBc86SA0zbySVusJ5Eb0D494NiahdRqOgC/kkmSoosFUg5WuTus0m4GVEUgiOQa+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RTox0Obq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 554JIrjh028353
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Jun 2025 05:24:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1a9JgcopP9bJ5yF1Me7vfccR
	Le+8BXkEbBw51pVceW8=; b=RTox0ObqdSLNR5F8asiRpPLHATO4WAFotd9IbWWM
	/Lcf2ZR2kFLHkaKRMdSv2q4ftBQC/CjKMEuuv0HoB4nudfoFyp1Kf+sPRaVvor4O
	2lwZer5akc+gE7QGMyK2fsmh/IySUhT8GaU9GOfyx5/bUgM189yuu+pD/IT3FXl4
	3R0/SQD1nCAptg5c2MgX+7ssKO5eZCgmASLqFVS0VyXpXiVRoHGSUlqZvB5w7Gp+
	i7alpuLT9V0xPdSY5KS8vdAFMtpSJbzfPOkStceSW2aNv/Xz2/H94/Nb2AJSmRPz
	n6Ju7powBABYrI/9whDi5XTkm9ndIeOc6lwlXR0pumhPzg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8t056c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Jun 2025 05:24:53 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7394772635dso482872b3a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Jun 2025 22:24:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749101092; x=1749705892;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1a9JgcopP9bJ5yF1Me7vfccRLe+8BXkEbBw51pVceW8=;
        b=hlIi+nYlWKDey5by2n3yWMQtUqJmNv2TTbgFYfyRpYWxrHPEup1eHXVJ943P2uL0WB
         YKXSTAtsxuklhLQGAEvaeWtyh4nhOWV89P9GQ0I1dEvutvWZra92xghdOoNc3CgAasFk
         3Ay+UhigviVPB/M3qjVzAeNQzmp15iRi+gNxmLqZkCtXmc0ro8YFS3DXI7cTqMyjxGoV
         6U5seImBe2MDgN/aQE9EAkDGwTYJWgeLJ+6CnIlaBkz/gqqcliqOrwSbManwUyQIiPGo
         C1ATvx13qcBArtfQqbtSkPi7RG+eFsSN7G/v3Me/k0cz/9QcZ/CbsG7ym0yu/imvVR7k
         C5/w==
X-Forwarded-Encrypted: i=1; AJvYcCVDjLUWbtTr3boMtiyzIdDfdSu9D8Mcqxu6te5hSmAEyQzH8zs/a1x3snz7syrOrns0IFTyHP5CsJopsYYZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7opDeuNevgS6Cg4zcA6SJ904MSCTeaxgk7wMjK0Kn1o407AvZ
	AKQAF9NIU1FTGAK+g/Mrin+uA/JWgifkyTdT+tajO2kd2udX6W4aVHSneTq1qx8Y9eQg58BPUht
	U18qjQ0DEYJ05od5YSntYmEMn+hfLOLw1O0sGt2qdr9PxBj9LbL2O+fqlaQ/prt1Bf4hw
X-Gm-Gg: ASbGncv1F98p8njw15XhPaKrq9NCKwbVAA8m/krQRIF68k9gUj6LH/T8VZbZl8tzjxl
	d1ROVrZKmfZoRiTcxCd8F2nqgEIhs5VxVkOWIueyL1ZkYnrA83C0GzddyLz4K6rx5eTnLSg1I0L
	NfZ3DQB4EsionD2EBnkjiN9joUk1ESv5TxUa1GEy+Tw32kKP8hneAr8yqibPgNsxykq9WQx9Afk
	FMod1dnKBmi9U7+BX2wCBWXhsyD+p8WoF7AGi9P5Kytx5PJTBkFBXKuHr8TFCvsFowU6v1pFnZN
	DCKX6So2cnTLGTfXVAXIKEiQEGP3oFYwUgQaG67jAjUr5uCX+AvpZq101eI=
X-Received: by 2002:a05:6a21:3287:b0:1f5:9098:e42e with SMTP id adf61e73a8af0-21d22a6cab8mr8581876637.7.1749101092396;
        Wed, 04 Jun 2025 22:24:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IELuWY/1bcdQXTlNAC0FeBkJQ7D653GZ5CNEp7sdXfBrnquNDS8cgkO69w0uf0qsyvNLiEZIg==
X-Received: by 2002:a05:6a21:3287:b0:1f5:9098:e42e with SMTP id adf61e73a8af0-21d22a6cab8mr8581844637.7.1749101091990;
        Wed, 04 Jun 2025 22:24:51 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747afe96781sm12040801b3a.29.2025.06.04.22.24.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 22:24:51 -0700 (PDT)
Date: Wed, 4 Jun 2025 22:24:49 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Wenbin Yao <quic_wenbyao@quicinc.com>, catalin.marinas@arm.com,
        will@kernel.org, linux-arm-kernel@lists.infradead.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        vkoul@kernel.org, kishon@kernel.org, sfr@canb.auug.org.au,
        linux-phy@lists.infradead.org, krishna.chundru@oss.qualcomm.com,
        quic_vbadigan@quicinc.com, quic_mrana@quicinc.com,
        quic_cang@quicinc.com
Subject: Re: [PATCH v4 1/5] arm64: Kconfig: enable PCI Power Control Slot
 driver for QCOM
Message-ID: <aEEqIWSU5P9Xp9J/@hu-qianyu-lv.qualcomm.com>
References: <20250604080237.494014-1-quic_wenbyao@quicinc.com>
 <20250604080237.494014-2-quic_wenbyao@quicinc.com>
 <46r6cdcugwvyuvkjqbi3tq4f7ddkrgy4jut5fwqjsfwbsfoke4@upmtzhcmc7ni>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <46r6cdcugwvyuvkjqbi3tq4f7ddkrgy4jut5fwqjsfwbsfoke4@upmtzhcmc7ni>
X-Authority-Analysis: v=2.4 cv=RMizH5i+ c=1 sm=1 tr=0 ts=68412a25 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=yafonziSkLk5LdqN7hYA:9 a=CjuIK1q_8ugA:10 a=zc0IvFSfCIW2DFIPzwfm:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDA0NSBTYWx0ZWRfX1Y4B+rsBCQ8N
 xV2Q2YwsflhUp8Ro6m9Lm2FMeFPY8FCVM4f/CKAMxkRkDls6KUGTRDfeWsKjxWxpXMV1GF5nehI
 g9kZpHs4qmgt2BcfG0Ajwivwx+U8mahfCcwgC/INSKlA0JQ0qhJhpF9ovzF+uRYBKsky6UbdcEl
 9ph+Nl4Q2HYySCWmhDrPA7ul5FskbbtCFg0zcan5MfXvDu5zS3iVjj3Z3sB3HXjG3pbRlxoWt0u
 vKVa6OLMeP7mznDwPuxM3jo11p1DUOvA2qLe3BQcx0mOFC+fnaXg/y4HS02fwIgnhHiET79am/a
 NS5bZ30GiHrCm/DxLCUCCTiHRt0CRmI2iIcIdsrRrD2VjWbvTBXpgr0+4Dvcaq0eOo0+85mzzcT
 wJO3Yy1cU1PwhpSBTr0kTmohSfgOyKDDTW3vwbDhZlR1Flqj3OGkzRayhWtblbRYgGFC48Md
X-Proofpoint-GUID: ozCtCcUJEVossluA-ZoDxGelXQlscoBP
X-Proofpoint-ORIG-GUID: ozCtCcUJEVossluA-ZoDxGelXQlscoBP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_01,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 adultscore=0 mlxlogscore=999 mlxscore=0
 clxscore=1015 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506050045

On Wed, Jun 04, 2025 at 03:30:22PM -0500, Bjorn Andersson wrote:
> On Wed, Jun 04, 2025 at 04:02:33PM +0800, Wenbin Yao wrote:
> > From: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > 
> > Enable the pwrctrl driver, which is utilized to manage the power supplies
> > of the devices connected to the PCI slots. This ensures that the voltage
> > rails of the standard PCI slots on some platforms eg. X1E80100-QCP can be
> > correctly turned on/off if they are described under PCIe port device tree
> > node.
> > 
> > Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > Signed-off-by: Wenbin Yao <quic_wenbyao@quicinc.com>
> > ---
> >  arch/arm64/Kconfig.platforms | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
> > index a541bb029..0ffd65e36 100644
> > --- a/arch/arm64/Kconfig.platforms
> > +++ b/arch/arm64/Kconfig.platforms
> > @@ -270,6 +270,7 @@ config ARCH_QCOM
> >  	select GPIOLIB
> >  	select PINCTRL
> >  	select HAVE_PWRCTRL if PCI
> > +	select PCI_PWRCTRL_SLOT if PCI
> 
> PWRCTL isn't a fundamental feature of ARCH_QCOM, so why do we select it
> here?
> 
We were asked to select it in the same way as PCI_PWRCTL_PWRSEQ, following
an approach like:

select PCI_PWRCTL_SLOT if ARCH_QCOM in Kconfig and nothing in defconfig.

But to be honest, we didn't figure out a more appropriate way. Unlike
PCI_PWRCTL_PWRSEQ, which is selected by ath11k/ath12k, PCI_PWRCTL_SLOT
doesn't have a specific endpoint device driver to select it. Would it be
appropriate to add "select PCI_PWRCTL_SLOT if HAVE_PWRCTL" in the Kconfig
for portdrv? Do you have any recommendations?

> Regards,
> Bjorn
> 
> >  	help
> >  	  This enables support for the ARMv8 based Qualcomm chipsets.
> >  
> > -- 
> > 2.34.1
> > 

