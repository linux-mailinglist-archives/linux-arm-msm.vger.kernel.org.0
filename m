Return-Path: <linux-arm-msm+bounces-84807-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A4A5CB15E5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Dec 2025 23:57:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B98FA303A0B6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Dec 2025 22:57:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 396B82F6924;
	Tue,  9 Dec 2025 22:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gTnYlmAH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W0x+Ln9P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 720A02F619A
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Dec 2025 22:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765321039; cv=none; b=IREvBHlJUDgoVI01pAUQiSDpVIwxh0RkgjEpIvhLoPOY97+0pnFDH+vOMpjwKyL9oQZB7+fXBz3gq8zDy/dacWWJ4Dfh70iiIv0AgPnuYffuN7v6Y2dvAdGnIRCpDgZeX1PY1WBXlyd/vMfPH6nAXyL74I05Ju2Di5JqH+39XWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765321039; c=relaxed/simple;
	bh=tUrAhEfuvOGitKxqW7+VuuLs16VhU2OeQDiwz0C2xWs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F/S1rKvVjEh4SpvMOQEFiAJAkPZ9khJ2VsOrFA8o4HTaW+kVc9j1iSbcYI5xmDS080iYrvdU5O4WhDBdjwddC8FG/69vFkGQzuhCbpwUUmB/Pw/0YcocLM0Gqexw09aM24mg0X+UZeDCZ40AkHnLHsI6B9JwPE++z/k4GenScw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gTnYlmAH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W0x+Ln9P; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B9MmFxW1229400
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Dec 2025 22:57:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gTi/HbaSCDQj+It6YM8JvIu5
	/JY9GRNhF6nMiaOmeo0=; b=gTnYlmAHtZYxbRci7EUx1kuA9agVZbaTMIQbp9c8
	cuIv12XfrFG2lL3FkYwFldjyTkHMVKY+mNG+WVXgJ5FCmIImN0gAtmf9kP4UZPfu
	rA77x+OkWXIX2K123qCMrmIS4kEVsqxQSNmWaIAMm8osUcymBUULFNEK+ty9y6xd
	PcSYPg2Wai3q4jZr0kUmE7ZwbSWeeVZuAId1dhn6ayM22CG/H8TfyKQ6u0YchM+q
	jaNdNcvMnCASWgSSIMFvlIPT+8BWFUfat2s55APwxhwRP/C/euHf1R453pyFjD0F
	IPiwwZX00VU3xK7k14YAtcTIQ/NxyKz90qF1LMiV78GWfw==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4axm9c9v5w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Dec 2025 22:57:16 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-55ad466ae47so259811e0c.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Dec 2025 14:57:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765321035; x=1765925835; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gTi/HbaSCDQj+It6YM8JvIu5/JY9GRNhF6nMiaOmeo0=;
        b=W0x+Ln9P/vDlQ1VpyGgmNEWxV6QlAte6d9Xzo6357Iddd4ebiA8x0FdA4KGvmxJem9
         NjLBzqiTWQSu1/fc+5nsva/DhLZgq18brto89vLxaB8VK3r0aS0BSZ5BqfqfcNPd/nst
         H1z2iYUe4adsXpLvJ9BwX5WOOiUMp+i6/Xbpenz+CIt4syW83mPjYPQPeOunsvJKp+5o
         CoIfmxWWD3zBukiOUTsI5VqNhWdhb6DgtRDmZqjyD8a3nfWZizCfdicav0yRUzQobwH4
         kH1F3Ib6d8foCCv6CLGLFQ7zOf2l0juahYvvtDcmdh6OZVdm3xCJUY3uFIpuZ5OW8Xos
         4L7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765321035; x=1765925835;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gTi/HbaSCDQj+It6YM8JvIu5/JY9GRNhF6nMiaOmeo0=;
        b=Z2IhEmtAceWDykkMgEr/57poqJSg9SlW+25PzvhBptm7K6JWb8omSFYPgvUUXT5hAL
         Xc1YIzgFolK8sNushUtEYgoPAiYHxHTtEBYL0QDuKIFcwB9VF2rF22fQS4L4VgBkDbCX
         rvY3nonlCvFW9of6eF1TC5jAwg7vl9Sj5MSUmMY7oHuq/k3lQK6VWHlKcAA83wYmnEyy
         o0GPVtYVbGoDn/au4si4J2LFmVMbenFVab3i4YLtVcwADfunICq604/YlNJwgIsMGoZF
         EJEzM2uqY5/jY+/2ZDWUntnhMPRl0hRDWNPL5pO8DNvMeqJ1RMs1S/qyt28p8IfI8KqC
         wRGg==
X-Forwarded-Encrypted: i=1; AJvYcCUsgXPxnh/IJyVX/NT7mZwdDZnokDehv/IXW6r5QSTNvP6a43Yr+6we8jZwlqoRzlJo5WxBy5N9lg+Jh81N@vger.kernel.org
X-Gm-Message-State: AOJu0YxzUF6KYBrrBS/ZZOqavp/cymGG2lGV7gMhYEQJIphF+kIFqhQp
	JsbPhZzddPXLBd9Jo7eBkR6LHFwE/tbKCR7jxoJ69QMJ72uAmKXvl+3izlz9YkUthqVfhrVytoB
	SdBORjz5UzkUQU+dvj9fHsu3NIfENPjl5gO/yLfGM0jHF5qr/hcdBR4WPcPe1WrGNEZBv
X-Gm-Gg: ASbGnct6QZvSsX1cWBv2fGK8+QKZuvmLE096LdqYNFypX21bs4gcVvm79FmCUqbU0ea
	YC6lMYhyOIYVIK4RP/1olHJUzsxV85h4yWtt43RF3eeI6iv8LWCSyD0RyocnzwOf3M2ar4JjL+0
	Xd+pAd+lHFnDZBhXWYcEYEJcwFw/kYJHJczX9Hia+hClkrPyyttHpsyFtSkSYYVx6+eI/58nX2J
	tU6zSp+MRY6WjPRZdRv8uH4hOoqVbxTCnNalsoPmm2NmUtsR1KeyqQWqnz7Y+XOAovVAg6+TeoW
	a9ZdCoEoGIsyOvfHs+zpHA00C9IxSk8JeVBPGcitINm5YNb83xGSK/0e97HW2nZcwPGefj6Xv0A
	f90DJGQ/6XflpI2WCXyluZ4dW3f9nVOwifNsK2vchM0TUiov7dSoqtry0fGtOVfKg9pXJ4TeSsR
	3Arsb9SMm+QUW/qqc/+Yj4pLY=
X-Received: by 2002:a05:6122:3c55:b0:55a:63c3:f7a7 with SMTP id 71dfb90a1353d-55fcfc39eacmr201367e0c.14.1765321035515;
        Tue, 09 Dec 2025 14:57:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGLTue9KfSafrxEqopdfH8AlXZLzdETcu8UBWka+tZ7aCoHmVYLikkj85I8jL+d9/bZQCLcKw==
X-Received: by 2002:a05:6122:3c55:b0:55a:63c3:f7a7 with SMTP id 71dfb90a1353d-55fcfc39eacmr201363e0c.14.1765321034952;
        Tue, 09 Dec 2025 14:57:14 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37e7065591dsm50287651fa.43.2025.12.09.14.57.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 14:57:13 -0800 (PST)
Date: Wed, 10 Dec 2025 00:57:11 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mayank Rana <mayank.rana@oss.qualcomm.com>,
        Baochen Qiang <quic_bqiang@quicinc.com>
Subject: Re: [PATCH v3] mhi: host: Add standard elf image download
 functionality
Message-ID: <z5osod5v6ykmook2cwz76vaww7vnlrh7csx4zebahcaspqr4w5@6an2hopq574o>
References: <20251201-wlan_image_load_skip_512k-v3-1-bedb5498a58a@oss.qualcomm.com>
 <ttpn6o2far7xebghblurxvi43aohv74v7jq2vdgc4jhgc7avo2@lgp4y4sytene>
 <aTZxrhpYhoOP+VDz@hu-qianyu-lv.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aTZxrhpYhoOP+VDz@hu-qianyu-lv.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA5MDE4MCBTYWx0ZWRfX8fqnQCTEmi22
 DMb5wmUH4rRgqoyzrZBYE48EV+xBxv42KKLe5Shm2iq0ooDAW6b0OMAWb8TZwMVZv0TmqcTLYaF
 A3FxZJDtbwKUaOMub9JudELUVuelMC/L1PjhQndJthw6E28Za5YtkOsMnvPZOhCGPpl8VK+n55J
 /cjUi+DXBGcoOzomGlu2GZifZwB1+gpLe/8+ANWM7vxws3ym2n2Y6/EknX3L8sLL1NKw6yBUE0Q
 mIwhpmTpInusiu5W5YHgKs1AVn2aENOGhWARd7khssjwQ1Nt1l0ab+gEV/+tkCJfyMewnVBpkyd
 8T9QFlefo4UOg7p5GmnxJXHoogszZl7hX/9A7KNbwgySQDDClj/9RIgVbEFNOLWgDm4gmzVkQD9
 YcE3OuLfVCBa4nM9nXarQjtOaTW+4Q==
X-Proofpoint-ORIG-GUID: zh0Hpf-1WxX88p2XEhKL6EANrPc4ltl7
X-Authority-Analysis: v=2.4 cv=Vcj6/Vp9 c=1 sm=1 tr=0 ts=6938a94c cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=JRxmXwspk78XPmVcSsIA:9
 a=CjuIK1q_8ugA:10 a=vmgOmaN-Xu0dpDh8OwbV:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: zh0Hpf-1WxX88p2XEhKL6EANrPc4ltl7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_05,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 impostorscore=0 suspectscore=0
 adultscore=0 priorityscore=1501 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512090180

On Sun, Dec 07, 2025 at 10:35:26PM -0800, Qiang Yu wrote:
> On Sat, Dec 06, 2025 at 01:25:34PM +0200, Dmitry Baryshkov wrote:
> > On Mon, Dec 01, 2025 at 06:33:15PM -0800, Qiang Yu wrote:
> > > From: Mayank Rana <mayank.rana@oss.qualcomm.com>
> > > 
> > > Currently, the FBC image is a non-standard ELF file that contains a single
> > > ELF header, followed by segments for SBL, and WLAN FW. However, TME-L
> > > (Trust Management Engine Lite) supported devices (eg. QCC2072) requires
> > > separate ELF headers for SBL and WLAN FW segments due to TME-L image
> > > authentication requirement.
> > > 
> > > Current image format contains two sections in a single binary:
> > > - First 512KB: ELF header + SBL segments
> > > - Remaining: WLAN FW segments
> > > 
> > > The TME-L supported image format contains two sections with two elf
> > > headers in a single binary:
> > > - First 512KB: First ELF header + SBL segments
> > > - Remaining: Second ELF header + WLAN FW segments
> > > 
> > > Download behavior:
> > > - Legacy: 1. First 512KB via BHI (ELF header + SBL)
> > >           2. Full image via BHIe
> > > 
> > > - TME-L: 1. First 512KB via BHI (First ELF header + SBL)
> > >          2. Remaining via BHIe (Second ELF header + WLAN FW segments)
> > > 
> > > Add standard_elf_image flag to mhi_controller_config to indicate TME-L
> > > supported image format. When set, MHI skips the first 512KB during WLAN FW
> > > download over BHIe as it is loaded in BHI phase.
> > 
> > What is standard about it?
> 
> The TME-L requires standard elf image format which includes single EFL
> header and WLAN FW segment.
> 
> The "standard_elf_image" seems misleading. Since the new image format is
> required for TME-L image authentication, how about using 
> tme_supported_image?

Just elf_image?

> 
> > 
> > > 
> > > Reviewed-by: Baochen Qiang <quic_bqiang@quicinc.com>
> > > Signed-off-by: Mayank Rana <mayank.rana@oss.qualcomm.com>
> > > Co-developed-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > > Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > > ---
> > > Changes in v3:
> > > - Reword commit message.
> > > - Reword comments of standard_elf_image flag
> > > - Add reviewed-by tag.
> > > - Link to v2: https://lore.kernel.org/mhi/20250603-standard_elf_image_load_support-v2-1-cce97644e99e@oss.qualcomm.com/
> > > 
> > > Changes in v2:
> > > - V1 patch is paused because of no user. WLAN team plan to add support for
> > >   new WLAN chip that requires this patch, so send v2.
> > > - Change author and SOB with new mail address.
> > > - Reword commit message.
> > > - Place standard_elf_image flag after wake_set in struct mhi_controller
> > > - Link to v1: https://lore.kernel.org/mhi/1689907189-21844-1-git-send-email-quic_qianyu@quicinc.com/
> > > ---
> > >  drivers/bus/mhi/host/boot.c | 7 +++++++
> > >  include/linux/mhi.h         | 4 ++++
> > >  2 files changed, 11 insertions(+)
> > > 
> > > diff --git a/drivers/bus/mhi/host/boot.c b/drivers/bus/mhi/host/boot.c
> > > index 205d83ac069f15a19ab2d66a63692e5d60334d4c..64fb7a257d3529167eddf1153d34cc6b25735809 100644
> > > --- a/drivers/bus/mhi/host/boot.c
> > > +++ b/drivers/bus/mhi/host/boot.c
> > > @@ -584,6 +584,13 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
> > >  	 * device transitioning into MHI READY state
> > >  	 */
> > >  	if (fw_load_type == MHI_FW_LOAD_FBC) {
> > > +		dev_dbg(dev, "standard_elf_image:%s\n",
> > > +			(mhi_cntrl->standard_elf_image ? "True" : "False"));
> > > +		if (mhi_cntrl->standard_elf_image) {
> > > +			fw_data += mhi_cntrl->sbl_size;
> > > +			fw_sz -= mhi_cntrl->sbl_size;
> > > +		}
> > > +
> > >  		ret = mhi_alloc_bhie_table(mhi_cntrl, &mhi_cntrl->fbc_image, fw_sz);
> > >  		if (ret) {
> > >  			release_firmware(firmware);
> > > diff --git a/include/linux/mhi.h b/include/linux/mhi.h
> > > index dd372b0123a6da5107b807ff8fe940c567eb2030..a13106bb234d22e3876dff3c0d46f3dee1d9e05c 100644
> > > --- a/include/linux/mhi.h
> > > +++ b/include/linux/mhi.h
> > > @@ -360,6 +360,9 @@ struct mhi_controller_config {
> > >   * @bounce_buf: Use of bounce buffer
> > >   * @fbc_download: MHI host needs to do complete image transfer (optional)
> > >   * @wake_set: Device wakeup set flag
> > > + * @standard_elf_image: Flag to determine whether the first 512 KB of the FBC
> > > + *                      image need to be skipped when loading WLAN FW over
> > > + *                      BHIe interface (optional)
> > 
> > How does the description correlate to the name of the flag?
> 
> The description can be updated as:
> 
>  * @tme_supported_image: Flag indicating FBC image format supports TME-L
>  *                      (Trust Management Engine Lite) authentication.
>  *                      When set, skip first 512KB when loading WLAN FW
>  *                      over BHIe interface (optional)
> > 
> > >   * @irq_flags: irq flags passed to request_irq (optional)
> > >   * @mru: the default MRU for the MHI device
> > >   *
> > > @@ -445,6 +448,7 @@ struct mhi_controller {
> > >  	bool bounce_buf;
> > >  	bool fbc_download;
> > >  	bool wake_set;
> > > +	bool standard_elf_image;
> > 
> > This flag is never set, making it a dead API. If there are other patches
> > setting up the flag, please include them into them in the same series.
> 
> Let me discuss with Baochen about whether he can include the patch in his
> series that actually sets this flag for QCC2072 device.

Otherwise it's a dead API which is generally not allowed.

> 
> - Qiang Yu
> > 
> > >  	unsigned long irq_flags;
> > >  	u32 mru;
> > >  };
> > > 
> > > ---
> > > base-commit: ac35e04f8000aaaf98635792464647e7a6f3422e
> > > change-id: 20251129-wlan_image_load_skip_512k-ddcfe49db8e3
> > > 
> > > Best regards,
> > > -- 
> > > Qiang Yu <qiang.yu@oss.qualcomm.com>
> > > 
> > 
> > -- 
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry

