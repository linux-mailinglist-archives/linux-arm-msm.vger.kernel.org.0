Return-Path: <linux-arm-msm+bounces-84630-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 32399CAC3F1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Dec 2025 07:58:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 92EFF304E39B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Dec 2025 06:57:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 399D33271FB;
	Mon,  8 Dec 2025 06:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T0RuuZZn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ikgx7Rx6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 226D831A576
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Dec 2025 06:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765175736; cv=none; b=Fau7S85/RMM1WnkPW8PH8ATE4RabGhTDa5GdXqNft0BrFLHEBl/Wv/AImmJqWcHkYsKfKPGJeigBCE+UYvW4JBo2OceVffAFcaIncm9cAabccY7VFZSbksa05GujkWcRpEIdE574u4XqWeQyIeDRGOhmrDq+ON+M2dbdG2f5T50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765175736; c=relaxed/simple;
	bh=4aPqhsv8fgZ/nP6SNgBnA8yF1zLWWofBWCz9+Gi96kI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N/H15xPRyGRkA9iuREss6xEJZK0OfjAURjZP5Qwhzx6F/QWgYOdEE9hNtgUSINt7JaHwzkhqxklfH+7Y7MPp1U50+HqBm7Q9E1LUhctWuevovEmia8INnGevnK0VfABM96L0ly9sHCpwVmiU0PsR3+z1W+Jrm0QCBb/KLebjzLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T0RuuZZn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ikgx7Rx6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B7MuRBU2927549
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Dec 2025 06:35:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=sgY4r96KHSWlXrmYnq4CGYti
	rmFBKi7k5rnRPBiDo2c=; b=T0RuuZZnBZjAOsW4TsCeiWA4OhZOU9U7HUnxEMWE
	c1r/pQw9oamC6j0+0PpVdONHIK7r3AhmiQKNpA0bXRNXraEcyq78GFN8M4X+0un9
	BGEwctJrUulh/isTAHyk7WzDAy6M3EFmzDpgyw0hSk07lJ79NzbPEfoILhPpcbTl
	Y7mgb2ayfH42CErSApQoKKBjt9jzwwocgs2rKulIDPJLnP/7DiS/B1bgOAq3VeED
	57IoeoDKVDkuTPWh7VwtF3xVBVgHIMxZW0gtRFNz6W0KkFUkgotToeWQXqmsOFA7
	11PBDkpF0ppR3cK1doEW+smcOC1LdRX8RYVDMALcUMQaig==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4awhaqrw52-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Dec 2025 06:35:30 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b630b4d8d52so4258629a12.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Dec 2025 22:35:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765175730; x=1765780530; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sgY4r96KHSWlXrmYnq4CGYtirmFBKi7k5rnRPBiDo2c=;
        b=ikgx7Rx6taCMz3odcTmmfL0YlkQbywawcMmdaXEYY+uVCfw0kYVqWAvB2+dstGRDN7
         SqpfgYtEfzJdpfczEAX98lUkhfAF/o9mH16TNEzzigCyt1yQN9gr8dF9likbgT/SWdPK
         MtTC1WsQ2uqKhAA9IwmKavXevJCwfehj3Ys3uf2MvDlKNvJymMlRYyfIL2TEt53ByfYm
         A3ikOfWPXyQNmYI5trvSh2r7BJpgi+t7YYgLFZmbfX153ePblJpkqDVIBCXCCay3s1sM
         wJGgEu3S+kbX2b7n9BOgbvx9N7Nch92R1kT2UJ9m1ta3mYOFBnIj5X9jA6u1ZvrGePy7
         86yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765175730; x=1765780530;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sgY4r96KHSWlXrmYnq4CGYtirmFBKi7k5rnRPBiDo2c=;
        b=hJit/tbleupkM1RNQC6MWaU35boC7m0eVDc6TML8pffg298vWW21JOYjEfYIQPm+Hr
         y7b69KpAPXV7HwOTKofMW9113rUZi/VvJhUM0/o1TPWKeoNz1plRvcLKEuJfQLJ1j5qP
         BXKDAs60Ssbxf8urgk80J0xV79Ymlf+s1lLil7ZrZ07JKSC16peQlHLGtaHPvgsbh9zn
         gOD0xfxwAdxUF9neffGGEljNwU2BJMdOLpOmrc95/X50IVUczOyzu2WkZQU6O1SWrhGv
         Xilb1pucXIGaFbj5/D425HptOgmUDvD5bBaecwpqDA6X6mmvyAzROzSa9TdR5wQ9HJhS
         JlDw==
X-Forwarded-Encrypted: i=1; AJvYcCWQtefMvf1ZygB74XcO/Rs+YV+FMYPrj8sadDWZayCwHMg/TXXLVd7FEDeSg+sYPMj2DLTJK9kM1imBxDRJ@vger.kernel.org
X-Gm-Message-State: AOJu0YzCJ5bysHS8BjCtLfhlem1V09Nfj/F1VXeNxbbtO5D9tpelc+b6
	aOVs+6f/qcm1QI1VSKmtt90TBQ0D6plEmbJU5HcjcwuEJNTn+uL9n8YUJKhoF+ezCajtkrN5GaF
	7gRM+xpUN04+UWyHvT6TRCEC8O0Wb/ZNCJ1nlSKAzJIU2ytAHbIhvYdBnZ+mF1JkkuvkB
X-Gm-Gg: ASbGncsdDTBQ/P8Tf7wJhXXemKvjdTfAVhgDH0GN56nU5e8TCL2T8vFrSn50BR3kiDk
	mwlG2gRfSanw2n29DHacDQuxBtDwbXcI5GB34k/2e8UOkXvIWhMhFmCimoZeuE5xHSyzHiNYL7o
	wmkn+rqUvgRZXpU5zOOGKY1iSu1mqRJOtr+xrlTHNOZNB1+7cLlWvLGj4BuWo/gtSHsA0lP0yB1
	psO9QL/gEg+a5XsGXFyIRneeM/lwb3z+N/kh9gWY0pO0F0QwK7ux/Wr54ie38eGFOm/wmva2K0z
	bWVhDJzyLhpOu1PLtce7j1C+OKAQ+znpuZnw2JjHgQkpahbyIj2ZlXcrsg3wRSQwZUHgo04l6vU
	K7acVZdUfuYhvkERTemxtW6Aksy1C0UpCtju9/WDT8PMw4Nf+bwH3NRCG
X-Received: by 2002:a05:7301:fd0e:b0:2a7:769:ca03 with SMTP id 5a478bee46e88-2abc721bcafmr2677209eec.37.1765175729979;
        Sun, 07 Dec 2025 22:35:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFJYV1colEXg1BO2zZejBrgIwZQQ8XKnZJznpGPugorXc4s98m8gCQwDF+wdRZqC53Cyq0hGw==
X-Received: by 2002:a05:7301:fd0e:b0:2a7:769:ca03 with SMTP id 5a478bee46e88-2abc721bcafmr2677196eec.37.1765175729318;
        Sun, 07 Dec 2025 22:35:29 -0800 (PST)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2aba87aa5fcsm33007217eec.3.2025.12.07.22.35.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Dec 2025 22:35:28 -0800 (PST)
Date: Sun, 7 Dec 2025 22:35:26 -0800
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mayank Rana <mayank.rana@oss.qualcomm.com>,
        Baochen Qiang <quic_bqiang@quicinc.com>
Subject: Re: [PATCH v3] mhi: host: Add standard elf image download
 functionality
Message-ID: <aTZxrhpYhoOP+VDz@hu-qianyu-lv.qualcomm.com>
References: <20251201-wlan_image_load_skip_512k-v3-1-bedb5498a58a@oss.qualcomm.com>
 <ttpn6o2far7xebghblurxvi43aohv74v7jq2vdgc4jhgc7avo2@lgp4y4sytene>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ttpn6o2far7xebghblurxvi43aohv74v7jq2vdgc4jhgc7avo2@lgp4y4sytene>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA4MDA1NCBTYWx0ZWRfX+pMZoyrBfa/v
 3HdJcYSonllAAdeUJjJ2KQyBZFcguyRG8mbRF/6x5K8EUxWVg13uzbBNX1oUzyw8aMZ1JOZ3xOr
 4e+cWpljU97FQRr5STqa+Jvskx6juuIZKr0fIjWPCrz21t2RNZ4cYcnGts31+Vm6W1nlJL1rDiC
 V9If4GEiAi6oZqtfv8dXOBu1Kwc7EHBHPJFR7Mm6nj+UlJF3YtppD7GptO/oX4S6qkLJXkXw6wS
 e4fo7vuJK3/YwUY3KKCUbzQJpJj77V13wAZSsZYHM53mC2TnLHLaaWp0ZPB3d99JEvTTyZhC9dw
 /Zri1CiSzmwSZxYDrgbggk7jzDiT1g6HBQieuw01MB3xlSK3dNOpaxCn/8eW2L8Ik+yMv0uMFy2
 AQUQHay+8KfrJW6A7B5AiL93ccbzlw==
X-Proofpoint-GUID: QPaTqGrvA3vGultK2C4BfENm1Gf3CEuB
X-Authority-Analysis: v=2.4 cv=ItUTsb/g c=1 sm=1 tr=0 ts=693671b2 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=zkLumzht3HFOWJu72j0A:9 a=CjuIK1q_8ugA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: QPaTqGrvA3vGultK2C4BfENm1Gf3CEuB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-06_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512080054

On Sat, Dec 06, 2025 at 01:25:34PM +0200, Dmitry Baryshkov wrote:
> On Mon, Dec 01, 2025 at 06:33:15PM -0800, Qiang Yu wrote:
> > From: Mayank Rana <mayank.rana@oss.qualcomm.com>
> > 
> > Currently, the FBC image is a non-standard ELF file that contains a single
> > ELF header, followed by segments for SBL, and WLAN FW. However, TME-L
> > (Trust Management Engine Lite) supported devices (eg. QCC2072) requires
> > separate ELF headers for SBL and WLAN FW segments due to TME-L image
> > authentication requirement.
> > 
> > Current image format contains two sections in a single binary:
> > - First 512KB: ELF header + SBL segments
> > - Remaining: WLAN FW segments
> > 
> > The TME-L supported image format contains two sections with two elf
> > headers in a single binary:
> > - First 512KB: First ELF header + SBL segments
> > - Remaining: Second ELF header + WLAN FW segments
> > 
> > Download behavior:
> > - Legacy: 1. First 512KB via BHI (ELF header + SBL)
> >           2. Full image via BHIe
> > 
> > - TME-L: 1. First 512KB via BHI (First ELF header + SBL)
> >          2. Remaining via BHIe (Second ELF header + WLAN FW segments)
> > 
> > Add standard_elf_image flag to mhi_controller_config to indicate TME-L
> > supported image format. When set, MHI skips the first 512KB during WLAN FW
> > download over BHIe as it is loaded in BHI phase.
> 
> What is standard about it?

The TME-L requires standard elf image format which includes single EFL
header and WLAN FW segment.

The "standard_elf_image" seems misleading. Since the new image format is
required for TME-L image authentication, how about using 
tme_supported_image?

> 
> > 
> > Reviewed-by: Baochen Qiang <quic_bqiang@quicinc.com>
> > Signed-off-by: Mayank Rana <mayank.rana@oss.qualcomm.com>
> > Co-developed-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > ---
> > Changes in v3:
> > - Reword commit message.
> > - Reword comments of standard_elf_image flag
> > - Add reviewed-by tag.
> > - Link to v2: https://lore.kernel.org/mhi/20250603-standard_elf_image_load_support-v2-1-cce97644e99e@oss.qualcomm.com/
> > 
> > Changes in v2:
> > - V1 patch is paused because of no user. WLAN team plan to add support for
> >   new WLAN chip that requires this patch, so send v2.
> > - Change author and SOB with new mail address.
> > - Reword commit message.
> > - Place standard_elf_image flag after wake_set in struct mhi_controller
> > - Link to v1: https://lore.kernel.org/mhi/1689907189-21844-1-git-send-email-quic_qianyu@quicinc.com/
> > ---
> >  drivers/bus/mhi/host/boot.c | 7 +++++++
> >  include/linux/mhi.h         | 4 ++++
> >  2 files changed, 11 insertions(+)
> > 
> > diff --git a/drivers/bus/mhi/host/boot.c b/drivers/bus/mhi/host/boot.c
> > index 205d83ac069f15a19ab2d66a63692e5d60334d4c..64fb7a257d3529167eddf1153d34cc6b25735809 100644
> > --- a/drivers/bus/mhi/host/boot.c
> > +++ b/drivers/bus/mhi/host/boot.c
> > @@ -584,6 +584,13 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
> >  	 * device transitioning into MHI READY state
> >  	 */
> >  	if (fw_load_type == MHI_FW_LOAD_FBC) {
> > +		dev_dbg(dev, "standard_elf_image:%s\n",
> > +			(mhi_cntrl->standard_elf_image ? "True" : "False"));
> > +		if (mhi_cntrl->standard_elf_image) {
> > +			fw_data += mhi_cntrl->sbl_size;
> > +			fw_sz -= mhi_cntrl->sbl_size;
> > +		}
> > +
> >  		ret = mhi_alloc_bhie_table(mhi_cntrl, &mhi_cntrl->fbc_image, fw_sz);
> >  		if (ret) {
> >  			release_firmware(firmware);
> > diff --git a/include/linux/mhi.h b/include/linux/mhi.h
> > index dd372b0123a6da5107b807ff8fe940c567eb2030..a13106bb234d22e3876dff3c0d46f3dee1d9e05c 100644
> > --- a/include/linux/mhi.h
> > +++ b/include/linux/mhi.h
> > @@ -360,6 +360,9 @@ struct mhi_controller_config {
> >   * @bounce_buf: Use of bounce buffer
> >   * @fbc_download: MHI host needs to do complete image transfer (optional)
> >   * @wake_set: Device wakeup set flag
> > + * @standard_elf_image: Flag to determine whether the first 512 KB of the FBC
> > + *                      image need to be skipped when loading WLAN FW over
> > + *                      BHIe interface (optional)
> 
> How does the description correlate to the name of the flag?

The description can be updated as:

 * @tme_supported_image: Flag indicating FBC image format supports TME-L
 *                      (Trust Management Engine Lite) authentication.
 *                      When set, skip first 512KB when loading WLAN FW
 *                      over BHIe interface (optional)
> 
> >   * @irq_flags: irq flags passed to request_irq (optional)
> >   * @mru: the default MRU for the MHI device
> >   *
> > @@ -445,6 +448,7 @@ struct mhi_controller {
> >  	bool bounce_buf;
> >  	bool fbc_download;
> >  	bool wake_set;
> > +	bool standard_elf_image;
> 
> This flag is never set, making it a dead API. If there are other patches
> setting up the flag, please include them into them in the same series.

Let me discuss with Baochen about whether he can include the patch in his
series that actually sets this flag for QCC2072 device.

- Qiang Yu
> 
> >  	unsigned long irq_flags;
> >  	u32 mru;
> >  };
> > 
> > ---
> > base-commit: ac35e04f8000aaaf98635792464647e7a6f3422e
> > change-id: 20251129-wlan_image_load_skip_512k-ddcfe49db8e3
> > 
> > Best regards,
> > -- 
> > Qiang Yu <qiang.yu@oss.qualcomm.com>
> > 
> 
> -- 
> With best wishes
> Dmitry

