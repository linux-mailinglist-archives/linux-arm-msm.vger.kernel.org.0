Return-Path: <linux-arm-msm+bounces-61785-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 56EB2ADFBEE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Jun 2025 05:44:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E37ED178CE2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Jun 2025 03:44:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9028D239E77;
	Thu, 19 Jun 2025 03:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RJ9j6xfg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 098C3238C2F
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jun 2025 03:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750304668; cv=none; b=rgDIJlytMZdecJ0puokhZp4BUoEMlGwU1qrB0iceQoMSItW1mg8l8c77ZW1FtzZhDVrm0p4wzTjVsUdHZdbO9abjWqpmXm+V+pmRJi1RrXaTZKN3UjrzhdaOdkPX7KJ+zx8imU74gKx9Llxj9rcoGTXlPuDMWaOSa9JFL1IcYlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750304668; c=relaxed/simple;
	bh=r9bEY7GBNI+f4W0qFdTtSzPy54h3PUtuOsmYJA0PBfM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QFFCw42H51vQ+rGZciIVmS5vItlaLXWmXg9E3AOhQ2RAhvIuhSH/pwd0JhSAxXtVWWO02ix1FdWQxQ1pk2Bb8oykiarXquR0ExM+Cdq7j3wJXh/IkvJmrVGNI9exZDuI5j7ybTQbBd6DzBqrDfkCH5pDLC4ei7maPHxXH7QUdpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RJ9j6xfg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55IHnIOY020136
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jun 2025 03:44:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+scRbnc9DB9ul454aKhxI5Nurcon1EsQyC5VkFAXI5w=; b=RJ9j6xfgHY5b9Mrv
	AJxFlkf/IWk7MbgbpcseY8v70tAiKpKhVqEc3AUYV1uoUzfCNxwPnxUmWXZQE5Ax
	YjvqJovDSjVrpKPlXyFWdZv5awQLqjul+bV+xh+KiwZeEBs3YW6FKm6AeM0YLMRK
	h54cmSE+wA0pkovDODCTRDQO4oGJz86fQKOL44qoJkGkCS7AKAS+iA9Gx50Vxub3
	16lOfnQwkrQIDeik0buZs3O9628vyHMQGMDgWWjhzJ+pxfNN9ULB7TJwRKXHdtLb
	YwKsPJgs00K6DL/MgNJ9rz/NBVP+p+uUiH/YGDbesRzps7yS0veRODSHto1qi7o5
	hmbQXQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 479qp5w1gn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jun 2025 03:44:18 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b26e33ae9d5so448659a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jun 2025 20:44:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750304658; x=1750909458;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+scRbnc9DB9ul454aKhxI5Nurcon1EsQyC5VkFAXI5w=;
        b=ZZP5SZE37OIOXHxgHWT2bBmfkqcMDFTZ+szl7Ih3+NMTg9mGG18POmP1PPf+wMo1qz
         mQs/rXK+YEfp5ldln73XZZznQywMT9/mOs8AhuijPD4Mlktrokct03m13SA7Da1Nz2Ff
         DPOTRE3/Jn3Gz8zOEC6+Uz5wJCkLkmby5iAGmSzNI8ylH7k7nZeZJdkU8tKkAEROnzaT
         sDly00uRCODfwB/7o/0KOXus3oVHCHgpbDnKclv73DWPp6vH8PnIAd0LIJ7dVWBIiNE5
         SjmTV53TxSy6roxRgzdo+9mBcrrmuA2X/sDiqRDuMXMrGKsYraQLmPzv9d28qIE8xq3+
         myiw==
X-Forwarded-Encrypted: i=1; AJvYcCVeZ+hiPCEI369krStIG+hrWypnetdkgN/Y/qncgK+TfKys7V7D4+fUe8id8JcBc6p0gQTAVb4PanRV/23s@vger.kernel.org
X-Gm-Message-State: AOJu0YwchXY0bJiYWoC3X9m9V9w1HtHccpKve2PrvBzYlUhkoSnSV4DZ
	kKOEOLa+GQyyR0nL6hAdATg1c6m0IywL2MOnyrQY7PcfO6ouW6UhuGZzBe6G7hY1AoE671TpUE7
	SoghVkzvy0LlHIdxfXo0c7hxXJNFELX299jOxG4y9FXZEwfw9BYJ5Z9OgW19HWf9QzzSp
X-Gm-Gg: ASbGncv4v35qtT4oVrqXjDzrMXSrn2zkPA7lMoMbHKjGwvLx/ILUxvyqBcJ8qrIoEM+
	ROxyW6X3f7UjDY4sAR/YWAQfwrbAYhLtnJ81hE1actwVblEFYTuv9wWGoC8oSiwEqqVMg2EAbW4
	e20Q/ejFPBNmlcUjEGNE3gxW5mBzWqyg3mQY/n+JIsmCP8kZw1Pb9sSJR9tZsnshSaS6B2sxu8E
	SZo3fcGn2vSz/zY3jrgSKCP3h32u6No4Xg1mO7XY0uamMnsXniiIJb5umjfj7gqk/Wis4KJCEW6
	uwyCqD9NW3QopsvSbkfR4W55Dm/HLdCvwNw9bSnCr2xFjsFRGOqcwpc6BeMq111uEupo2Q==
X-Received: by 2002:a05:6a20:6f89:b0:21f:a8fd:6938 with SMTP id adf61e73a8af0-21fbd57b5bcmr36360068637.36.1750304657717;
        Wed, 18 Jun 2025 20:44:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEsdAGHVir91RhaZ0NNhcSSvKvJF/rY80yQk7blyq3sFyZzlQKRDY1UhTZGX3iQt/XLrErE3Q==
X-Received: by 2002:a05:6a20:6f89:b0:21f:a8fd:6938 with SMTP id adf61e73a8af0-21fbd57b5bcmr36360025637.36.1750304657260;
        Wed, 18 Jun 2025 20:44:17 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748d8093c63sm4556579b3a.57.2025.06.18.20.44.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 20:44:16 -0700 (PDT)
Date: Wed, 18 Jun 2025 20:44:15 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        jeff.hugo@oss.qualcomm.com, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_bqiang@quicinc.com, can.guo@oss.qualcomm.com,
        Mayank Rana <mayank.rana@oss.qualcomm.com>
Subject: Re: [PATCH v2] mhi: host: Add standard elf image download
 functionality
Message-ID: <aFOHjw8WZRqI6xVp@hu-qianyu-lv.qualcomm.com>
References: <20250603-standard_elf_image_load_support-v2-1-cce97644e99e@oss.qualcomm.com>
 <sdhop6vyvt4y63tbbtorqfd5xa4ckbiwxdad5g6zzwlljqvd6q@eoaqmairdeey>
 <aEKefb87GTR/scbO@hu-qianyu-lv.qualcomm.com>
 <5g6j4guzrbhl4zqmt7amdgewdusycccsh5rdxlpjbkhjdhbdoa@h6tlwam4i3kq>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5g6j4guzrbhl4zqmt7amdgewdusycccsh5rdxlpjbkhjdhbdoa@h6tlwam4i3kq>
X-Proofpoint-GUID: PO_BI2QfQ_MgPFsJtn1fIBT5pSWb_V2Y
X-Proofpoint-ORIG-GUID: PO_BI2QfQ_MgPFsJtn1fIBT5pSWb_V2Y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE5MDAzMSBTYWx0ZWRfX1YjFOflHkDoM
 mEDFTc1HGnaygxPLoppsidFeLQeQRoETsxW+kRxj7YeFlJJCxxpVhMjlIWpEEXNsx+t7SVvWSk1
 pCPQHp1StkCsWRdF8RCRq6hyEe9uGZyOhqn8xVipyCJormqiBQxdFQm+Th8/dfbMk2wTBffxnzh
 SwIss6sSvi8OWmM+SZC54cZbugYcJK3SePF2kCeiCboFDZ9oMF5Sxfxej54RU/qeJw8HPDhIUAX
 RL1USyyya6MuNu+BrPRGBu0tT9+joJq4pO7jxEsvDhy53Az16XfOz0bcDu5oWSdT3Z64lV4Jqk4
 ZzpRDEjPzZGx18+Q/W6PjEhWZvRA3xRG4eKObIOlVn9c0dZCoJ8OwnIhe1ZaQwiOwqD+YbwAr2m
 8AxVF7r6nwIzlWAFiI/R95qFPZt+ANCglFS/B5a/bNwpqcQa87wMBQbelXDeFsMvwrGxnXyp
X-Authority-Analysis: v=2.4 cv=fMc53Yae c=1 sm=1 tr=0 ts=68538792 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=y1Uosm5IMMVjWa0GvE4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-19_01,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=999 spamscore=0 lowpriorityscore=0 impostorscore=0 mlxscore=0
 priorityscore=1501 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506190031

On Tue, Jun 17, 2025 at 02:49:30PM +0530, Manivannan Sadhasivam wrote:
> On Fri, Jun 06, 2025 at 12:53:33AM -0700, Qiang Yu wrote:
> > On Thu, Jun 05, 2025 at 10:34:50PM +0530, Manivannan Sadhasivam wrote:
> > > On Tue, Jun 03, 2025 at 02:05:44AM -0700, Qiang Yu wrote:
> > > > From: Mayank Rana <mayank.rana@oss.qualcomm.com>
> > > > 
> > > > Currently, the FBC image is a non-standard ELF file that contains a single
> > > > ELF header, followed by segments for SBL, RDDM, and AMSS. Some devices are
> > > > unable to process this non-standard ELF format and therefore require
> > > > special handling during image loading.
> > > > 
> > > 
> > > What are those "some devices"? Why are they not able to process this format
> > 
> > Eg. QCC2072
> 
> Is it a new kind of WLAN chipset using the ath12k driver?

Yes

> 
> > 
> > > which is used across the rest of the Qcom devices?
> > 
> > These devices include TME-L (Trust Management Engine Lite).
> > Currently, the FBC image is a non-standard ELF file containing an ELF
> > header followed by segments for SBL and WLAN firmware. The ELF header and
> > SBL segment within the first 512KB are loaded via BHI, while the full FBC
> > image is loaded via BHIe.
> > 
> > Due to TME-L limitations, the full FBC image loaded via BHIe cannot be
> > processed, as it does not conform to the standard ELF format. 
> 
> Okay. These information should be part of the patch description.

OK, will add it in commit message.

> 
> > > 
> > > > Add standard_elf_image flag to determine whether the device can process
> > > > the non-standard ELF format. If this flag is set, a standard ELF image
> > > > must be loaded, meaning the first 512 KB of the FBC image should be
> > > > skipped when loading the AMSS image over the BHIe interface.
> > > 
> > > Please explain what is present in the first 512KiB and why skipping that is
> > > required.
> > 
> > ELF header and SBL segment are in the first 512KiB.
> > 
> > New FBC image format adds second ELF header in the start of WLAN FW
> > segment on top of current format. After loading SBL, second ELF header
> > and WLAN FW segment is loaded using BHIe.
> > > 
> > > > Note that
> > > > this flag does not affect the SBL image download process.
> > > > 
> > > > Signed-off-by: Mayank Rana <mayank.rana@oss.qualcomm.com>
> > > > Co-developed-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > > > Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > > > ---
> > > > Changes in v2:
> > > > - V1 patch is paused because of no user. WLAN team plan to add support for
> > > >   new WLAN chip that requires this patch, so send v2.
> > > > - Change author and SOB with new mail address.
> > > > - Reword commit message.
> > > > - Place standard_elf_image flag after wake_set in struct mhi_controller
> > > > - Link to v1: https://lore.kernel.org/mhi/1689907189-21844-1-git-send-email-quic_qianyu@quicinc.com/
> > > > ---
> > > >  drivers/bus/mhi/host/boot.c | 7 +++++++
> > > >  include/linux/mhi.h         | 4 ++++
> > > >  2 files changed, 11 insertions(+)
> > > > 
> > > > diff --git a/drivers/bus/mhi/host/boot.c b/drivers/bus/mhi/host/boot.c
> > > > index efa3b6dddf4d2f937535243bd8e8ed32109150a4..f1686a8e0681d49f778838820b44f4c845ddbd1f 100644
> > > > --- a/drivers/bus/mhi/host/boot.c
> > > > +++ b/drivers/bus/mhi/host/boot.c
> > > > @@ -584,6 +584,13 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
> > > >  	 * device transitioning into MHI READY state
> > > >  	 */
> > > >  	if (fw_load_type == MHI_FW_LOAD_FBC) {
> > > > +		dev_dbg(dev, "standard_elf_image:%s\n",
> > > > +			(mhi_cntrl->standard_elf_image ? "True" : "False"));
> > > 
> > > This print is just a noise even for debug.
> > 
> > Will drop it.
> > 
> > > 
> > > > +		if (mhi_cntrl->standard_elf_image) {
> > > > +			fw_data += mhi_cntrl->sbl_size;
> > > > +			fw_sz -= mhi_cntrl->sbl_size;
> > > 
> > > Is it possible to detect the image type during runtime instead of using a flag?
> > > Also, the flag is currently unused. So it should come along an user.
> > 
> > Perhaps we can check the second ELF Magic Number, but I don't think it's
> > safe to determine the format by doing such check. Using a flag is simple
> > and safe.
> 
> Why do you think it is not safe? IMO, relying on a flag is the not so safe
> option. What would happen if an user has used old FW? The driver would blindly
> assume that the FW is always of the new format, but the user is not aware of it.
> It may lead to weird FW crash that would be difficult to debug.
>

It's possible that the WL firmware segment could contain the sequence 0x7f
'E' 'L' 'F', which might lead to a false detection of the second ELF
header.

- Qiang Yu

> - Mani
> 
> -- 
> மணிவண்ணன் சதாசிவம்
> 

