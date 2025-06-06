Return-Path: <linux-arm-msm+bounces-60443-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C4DC6ACFDC7
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Jun 2025 09:53:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1DD5B3A4049
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Jun 2025 07:53:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1330B7FD;
	Fri,  6 Jun 2025 07:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XkPPhlPM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50AF824EABC
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Jun 2025 07:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749196420; cv=none; b=p9YIrFWDEEgoCcLj7zd08xtB1qC0oqqt/F/NpeqkBS169bkMcVImqs2swA33agEpbcV3sNMdII5GfBG4w10ad/wiwzcROPO2CXD0vZWBLxPlkhIM4k9khRohIcce1cqBvW43gnymEaDbMADchqs/5RenPQmH5wv1EbvBo6nE53s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749196420; c=relaxed/simple;
	bh=VedvAdrk0UYsIcSq4+g2X7qKC0IU3ySa5DfrStg1g9Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HCFUELtuB2PonVt3PMU9jPDCQGPXDdEgyOycWHbcpeBmT88AH2kthNfgPEk0gfF6bebHhdrLWoJwfEwrv7g3FT8lUQdTI767iOLck4b0B0QEY9tiWIAkqFUlN5O01Xrb0x83oPHQV9nLtU+nDmXBwws7rc9C+eT3QVTM0s4eFRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XkPPhlPM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5566RIXO006645
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Jun 2025 07:53:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c4DWEQmRQ+i2IbBTLmrZiOQE2x9PEkpFgFS9oq7Dy+s=; b=XkPPhlPMJLXyi9f7
	me975QOOnekEnZz2gXeNhHC6aD8F8ZC+x7ecr9nYsKCq4da+xPOTmPHNYN7wY70g
	1wZ38ximQacLDP/AfPlNKXbyLxe+gkcydwv0SYSkggW+822jOl+t9oD3jK5NptyT
	s6nBZPOE1qY/CmrivCjDo6cB+V0eYZayeGgWdo1fM+hhmsmdSY9ZjCzPU5d8TkGw
	v7VZlSGvzCJZ6v37C6UzsB5D1w0MdtqTpdfP4GS+zQueg5a6QFI19QD+qWYY3Gdc
	J1yO6ERnbyhWZvwb/EZwrhUAjv7I0Cxxzv0FepzW7D8TPbGyBfAigPon0SI6QXCG
	HT//lA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8t3vca-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Jun 2025 07:53:37 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2323bd7f873so16413055ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Jun 2025 00:53:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749196416; x=1749801216;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c4DWEQmRQ+i2IbBTLmrZiOQE2x9PEkpFgFS9oq7Dy+s=;
        b=PdbOzA0ZW6B2jXASmg6bb4AsVYfOzyP1tVErT0Z535Y2ld0JrnpEondgl01venzVsb
         sipJ/NDg92N6lKANMM7oBMXg1JgKL/WcyyY1bKI7Khnwn4eb+20vbzMYEPuMycsKWtwy
         IeD/4gq0FpHKYoMTdT0F78zx/Dna/KhnwMQiiQ6A1KBieFWgHyHDWH/GmcYK3fP/hYmE
         I/Gb9MAxToJhO+efvBzIRDyKBXuyNZxWCnd99ArsOdRYV++wcqQ4e0b+vFKUzi9xzbEh
         MeGWXVKRcx5hkssvBS5kxoXvcY1aOxRvDeZHRIdbOBVC1xjxFiC8i1hnMVkb2CfoQ5N6
         cSGA==
X-Forwarded-Encrypted: i=1; AJvYcCVgyhz9uRo2rQjZvYcNSeGQRl3qX8VCyTK+oTwjCEp9Fa65w8ZOoNfEAI3iiDszw5JmG/2tixAwGsrCJ//b@vger.kernel.org
X-Gm-Message-State: AOJu0YxZCLzVlENiJEJUmasjyAWp8prR5ozBk4x+Tk7lZfbd9kR+kV8z
	EiXAV5jevo12HVQGbcjgugbgYGmyR+iqyNUPHRubpC9n9maf+Jzp3dcSWMMHx2Bv6NraV97Yiyy
	9ZpTXeY0pOqI//FUmp+NQlh3nWAXVEYXwOaRTuMGAQbkxfELjIatx4vEUEbKZyZT8kwZT
X-Gm-Gg: ASbGncsjgWzIjiUTSdKOikioCcH5xRB1hR/LiveCOwfS+VpxpF4t6SGXUu3HbxeGTYg
	i+Hmp/j32JWLbrk8XIFqbKTi5iqybZJzU5aRwdAvNJ4+p3xCR8awSBJ0A0FRwppBIcL4JYF+FAT
	t22hPE4ipXGPXfgLg/P4v7pUJV8jZV6zlQI9YNWTa043r2qHk0f3qRdaHicz+zlhl/YTtgRw1jJ
	TkSymRMbNpr3ne9Gia57USyJPn7brYUYKr+iwRV22pD7MCQpQWo2fgSfADqSxavH2GSwFib0C16
	aVF8zWo491pidN5msJ+HCWTjcixMixsi1v4zyMJ8w5tIUj1m+FYjL4h5EIvZlectdBsttA==
X-Received: by 2002:a17:902:dad1:b0:235:f3b0:ae81 with SMTP id d9443c01a7336-23601d16effmr33765565ad.27.1749196415981;
        Fri, 06 Jun 2025 00:53:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGmLeNT0jN4KGfW+N/v1tEX9Oe0BlAkplrf6kG+pT3ie2tPkD3R+nDj5hUiv2s54Auns9oNpA==
X-Received: by 2002:a17:902:dad1:b0:235:f3b0:ae81 with SMTP id d9443c01a7336-23601d16effmr33765305ad.27.1749196415603;
        Fri, 06 Jun 2025 00:53:35 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236032fe704sm7056245ad.138.2025.06.06.00.53.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 00:53:35 -0700 (PDT)
Date: Fri, 6 Jun 2025 00:53:33 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: jeff.hugo@oss.qualcomm.com, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_bqiang@quicinc.com, can.guo@oss.qualcomm.com,
        Mayank Rana <mayank.rana@oss.qualcomm.com>
Subject: Re: [PATCH v2] mhi: host: Add standard elf image download
 functionality
Message-ID: <aEKefb87GTR/scbO@hu-qianyu-lv.qualcomm.com>
References: <20250603-standard_elf_image_load_support-v2-1-cce97644e99e@oss.qualcomm.com>
 <sdhop6vyvt4y63tbbtorqfd5xa4ckbiwxdad5g6zzwlljqvd6q@eoaqmairdeey>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sdhop6vyvt4y63tbbtorqfd5xa4ckbiwxdad5g6zzwlljqvd6q@eoaqmairdeey>
X-Proofpoint-ORIG-GUID: CSOBxK_HhVbom_PiPHWhf4R8OOzs-Ohc
X-Authority-Analysis: v=2.4 cv=EPcG00ZC c=1 sm=1 tr=0 ts=68429e81 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=3eKJ-SLyz9EkZku_pjEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: CSOBxK_HhVbom_PiPHWhf4R8OOzs-Ohc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA2MDA3MiBTYWx0ZWRfX0WLmgp1l2eSe
 yrLuKIRTa5CAVVnoxpWQm7pCr6pWD1AeaDirrQQC0QPdtzl4/ceMoiwIqycOY/qjdappHL1d3qL
 6BmqsBTBEJhMkZWk7avSiCsIUPA0QhZsdwuqKhSzcWSxv9TDJF+R5huMRtdyuNTFHG8DXXGT7cf
 ZtGKT2YPJeza6ITXc7hV+arkkMOCXY81JbBYRnNg41c4k5kBIC/IHuE+u5gc0hh+w3X63Eyyrls
 9+YJ/PC8LIcgN8dGw2+nizT9GJK7x7ev7A9d3mSBoFmf34E6NpajjeQP6E4+4dpqBwBijEws7cz
 Q7GWwn83oeEvJsEcHoWQVE69LGZoadkQ8ij1zHIuMAGhmRsBsY37xKNFD54W/h23aGhHEJwnJOg
 PjcEPtvyvicP2mpplHLlNzr1Wm+WBcXbBUVEbSp0A4OzGuE5GlZ0BmJWd9NSq+uXMy1mjbWU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-06_02,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 mlxscore=0
 clxscore=1015 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506060072

On Thu, Jun 05, 2025 at 10:34:50PM +0530, Manivannan Sadhasivam wrote:
> On Tue, Jun 03, 2025 at 02:05:44AM -0700, Qiang Yu wrote:
> > From: Mayank Rana <mayank.rana@oss.qualcomm.com>
> > 
> > Currently, the FBC image is a non-standard ELF file that contains a single
> > ELF header, followed by segments for SBL, RDDM, and AMSS. Some devices are
> > unable to process this non-standard ELF format and therefore require
> > special handling during image loading.
> > 
> 
> What are those "some devices"? Why are they not able to process this format

Eg. QCC2072

> which is used across the rest of the Qcom devices?

These devices include TME-L (Trust Management Engine Lite).
Currently, the FBC image is a non-standard ELF file containing an ELF
header followed by segments for SBL and WLAN firmware. The ELF header and
SBL segment within the first 512KB are loaded via BHI, while the full FBC
image is loaded via BHIe.

Due to TME-L limitations, the full FBC image loaded via BHIe cannot be
processed, as it does not conform to the standard ELF format. 
> 
> > Add standard_elf_image flag to determine whether the device can process
> > the non-standard ELF format. If this flag is set, a standard ELF image
> > must be loaded, meaning the first 512 KB of the FBC image should be
> > skipped when loading the AMSS image over the BHIe interface.
> 
> Please explain what is present in the first 512KiB and why skipping that is
> required.

ELF header and SBL segment are in the first 512KiB.

New FBC image format adds second ELF header in the start of WLAN FW
segment on top of current format. After loading SBL, second ELF header
and WLAN FW segment is loaded using BHIe.
> 
> > Note that
> > this flag does not affect the SBL image download process.
> > 
> > Signed-off-by: Mayank Rana <mayank.rana@oss.qualcomm.com>
> > Co-developed-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > ---
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
> > index efa3b6dddf4d2f937535243bd8e8ed32109150a4..f1686a8e0681d49f778838820b44f4c845ddbd1f 100644
> > --- a/drivers/bus/mhi/host/boot.c
> > +++ b/drivers/bus/mhi/host/boot.c
> > @@ -584,6 +584,13 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
> >  	 * device transitioning into MHI READY state
> >  	 */
> >  	if (fw_load_type == MHI_FW_LOAD_FBC) {
> > +		dev_dbg(dev, "standard_elf_image:%s\n",
> > +			(mhi_cntrl->standard_elf_image ? "True" : "False"));
> 
> This print is just a noise even for debug.

Will drop it.

> 
> > +		if (mhi_cntrl->standard_elf_image) {
> > +			fw_data += mhi_cntrl->sbl_size;
> > +			fw_sz -= mhi_cntrl->sbl_size;
> 
> Is it possible to detect the image type during runtime instead of using a flag?
> Also, the flag is currently unused. So it should come along an user.

Perhaps we can check the second ELF Magic Number, but I don't think it's
safe to determine the format by doing such check. Using a flag is simple
and safe.
> 
> - Mani
> 
> -- 
> மணிவண்ணன் சதாசிவம்

