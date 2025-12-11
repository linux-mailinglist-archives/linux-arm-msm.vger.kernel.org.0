Return-Path: <linux-arm-msm+bounces-85014-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1580FCB55ED
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 10:37:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0FEBA300BA25
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 09:37:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE77B2F693A;
	Thu, 11 Dec 2025 09:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xfj+xzEL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CTjn0Ob8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D834B2F6905
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 09:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765445839; cv=none; b=NvAYKJPvP7CpR4LooAaDTdJ/tfwC5tKJOQU/jsLqR3WHk1IyKpGuTXc8ROpi6NX2NxOUxgYhPwFJdou/mpKeR8pVrry2VCLNvTbS/Jh4mAayXN0RKBN1DFuUAbpx8VkNgOEmbU7+e33RsiXhn+sPpoXLmPf2dy9AfRKE+WVrIe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765445839; c=relaxed/simple;
	bh=PHXZRy132+0kdUmgP4WNqlEDkUkkpa+M06sbGqLu7eA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qq0dlqYFCDJ1I5HiyIj7zwoSkq3YfPIX9miKPo6XlSoscd3QhjVspQSPZ54tMK1V/h8ZSLo7n0V4haM0h8NRPZbEYsPUCg/SE7OZ7lA6AMR/bHo5EHOnn++c8c2kY5scFT+rnbyDWzQpoeJrjIBQwKjIju4ppchcTNWzIO5JJAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xfj+xzEL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CTjn0Ob8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BB9ZS8U1646899
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 09:37:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+m5RAWgcbogYlmas1+liRKgy
	Psin28MMijXTFpb2bns=; b=Xfj+xzELhp0GdU92e8Vvg+Dqug5t0sSZuyzkGQik
	EBcbODVKSFGCr8CL7YUNmMljRvnLZau2O3jrMfXP+2Jgp08YKG/E+W2/yC00w/mu
	N2VF7CBQHKe91FzoxJmH5ew9ASK1APmuOmlX0x8CMlupQu62uPlS9AcWf7S20CX5
	dgQZP8sfkH+fyezCjVwkfxbtqNIlcNCMqjasVEA85RhU1Ek8NO++yRiAxydfsPwq
	UC66ql0V/VM5H5s148SFkazp6vGrTTrOOqc4XHZ6Mp5tT5s7kmYrTW/1SwvlJAbh
	at0ddUUaxpd1OOhHEx9eafzE4/GdeowCjDrfnaqvp1Wztg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ayt7089a7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 09:37:16 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-bc0de474d4eso1625086a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 01:37:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765445836; x=1766050636; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+m5RAWgcbogYlmas1+liRKgyPsin28MMijXTFpb2bns=;
        b=CTjn0Ob8P669mg9xWxBCnLSV3lerQqhHz56q3rAI3iWBEf2oidzYZwp7Kq6ICoedgL
         6Ns94ZXm1dEcB6kLTIfaljaBDLRhW56OkcuDqpBH7UNmT8Yy+oJF16ypXuE0rLkO+sdC
         GlPnuHC7N0/JvxwuxOrVKmx1bu2PtYzioqcarDJIX60pVtx+MiQ9+FVk+JaVZIxGrnzr
         /mQM52Lsma7hi5Ml7Gm2gIHOP6dKToDQ8LsezT06cysMgpem797HH/bIxKcyXtn8EkP/
         hwbquHrI/CkASPPwFBsdaXvrYNf8k1vdtwIsqioLEOx7v/4DO2y9M7+yV/cSDhLqfq2W
         /yVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765445836; x=1766050636;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+m5RAWgcbogYlmas1+liRKgyPsin28MMijXTFpb2bns=;
        b=GgAkzYWYeXDYGUjUysm4Jo14BbqEAPb0Nwm3hGo3yCfdGEyWv3el8H6q8dwTJk11i5
         NKF0Cvmk95aI+rWXCSA5cz+cPZxzUVj/FXINtdeHVB+1z67pHfpc2spLmsHCWks7/oM9
         bb1oscanbCnBz7YHV2zMPFNYIv4XuE1NM3vOVNwWjrT8bJFYY0n+2Oh30uTfoq2nLhzD
         Pfec1kJxcHDc9n4Tc4lcVDabhEAia8CTfZgpX9PPqWK7IRXj9Li76/WkhPcLdULIiN+1
         lv0Ip8egv2DYsBetbMaEm0xbtXEDMpFsTE3G/Pgitp4oBcRqTYrUc/W6b+aN0VBvRlUk
         yRAg==
X-Forwarded-Encrypted: i=1; AJvYcCWJn2uopXRIzpSZjDGlC/qXmbA6/P26x+4W32dYHzOvc7eSn5h0ytcPKgMrqntKPpQit5+afZtwsnimLF7P@vger.kernel.org
X-Gm-Message-State: AOJu0YwfRwuu+w1F2Xg3IQ9qhictMkLVimo3JrMMiMsswLIwmVGkOKDs
	fo0MvO3Bck9RhskmFzsqI5SwsuD7n8aVF6V07VYqop01ZbPzyJr4yFR1DaPBpMYNTY09UFLOt1z
	39vmM1iBVO3tGswvDKkj1suZdQJFkbDi0+C16E7vyXotw67+xb91KKHLpEXlCqVRX8dFg
X-Gm-Gg: AY/fxX5aoZH0zbzmAnf3Yp0JnVxk3s3J2WCR7Uvs5b9gDkjZZlZr8MhCwPBvr5b0Jgi
	ECuWXyhKhfzXNifMi9UvfKERQ8Ta/J26ZCeCKrrYOZYTq21p9N1XNsQhWMEk1JQKlFweLitoNKx
	irUCpiOYi7g6BcEjVEzGHUSOkXkXKp5x3Dp3f0841D78ae3NIxm8izE25GrHKsYf2AqMHvtrm+e
	kWexE1GXiU8d9THoNOlYrw0KlkcZaLlhBSuiDG6Niv2dN2jfkCXy7BWY0XzJp+jufQb1goG+6Co
	4LxOPCRzSoUdU4GyEgn37P+Bzg9CPt1b1rvu506FGwYyKf5umt6XKrxuMuUBj8cYJo6LDFGX1tK
	2tE01J+yN+TmgA46+F4MgKP9DwBeKj8dfXMJwOBK/2JQwOwkMhgQ+eh8q
X-Received: by 2002:a05:7300:691b:b0:2a9:573a:4a74 with SMTP id 5a478bee46e88-2ac0540a366mr5017702eec.9.1765445835236;
        Thu, 11 Dec 2025 01:37:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHDmzknQK46ADGMzLVSbLcpWpdQLCZHlF7yDgfWUZnMsYnsyWkUC6As4lwmUjWcGVVISWoLXA==
X-Received: by 2002:a05:7300:691b:b0:2a9:573a:4a74 with SMTP id 5a478bee46e88-2ac0540a366mr5017677eec.9.1765445834632;
        Thu, 11 Dec 2025 01:37:14 -0800 (PST)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ac18f5c2dbsm6078083eec.0.2025.12.11.01.37.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 01:37:13 -0800 (PST)
Date: Thu, 11 Dec 2025 01:37:12 -0800
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mayank Rana <mayank.rana@oss.qualcomm.com>,
        Baochen Qiang <quic_bqiang@quicinc.com>
Subject: Re: [PATCH v3] mhi: host: Add standard elf image download
 functionality
Message-ID: <aTqQyPJaV+KrIMOj@hu-qianyu-lv.qualcomm.com>
References: <20251201-wlan_image_load_skip_512k-v3-1-bedb5498a58a@oss.qualcomm.com>
 <ttpn6o2far7xebghblurxvi43aohv74v7jq2vdgc4jhgc7avo2@lgp4y4sytene>
 <aTZxrhpYhoOP+VDz@hu-qianyu-lv.qualcomm.com>
 <z5osod5v6ykmook2cwz76vaww7vnlrh7csx4zebahcaspqr4w5@6an2hopq574o>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <z5osod5v6ykmook2cwz76vaww7vnlrh7csx4zebahcaspqr4w5@6an2hopq574o>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjExMDA3MiBTYWx0ZWRfX8Ts0+i3/n2CH
 ngq8mvUDVNOLh8XYXtco50c7+PT8Chy8QPVh2DwYf9To82FSqfumIBHkzZz2n6vEMNhqdyIdzSy
 4nM6DRIxS+FwO/SKGEyQY1AcS81hO/KicII2dIQi7hVkcqe/7Ih5JkoFMm7h0ujC4xZaXtTjdOq
 gbCipc4UzNmVDyUQEnSvZz4dG0oiHCCLbeWNJsus0xH+BsEGHQr1JhCjnNBouj2xsNWknoM47tT
 dVkFsfob5nqX/wmq6Jxp6Ahv9owj77x7juE1Q0noyK+Z4sz+ujBDMvjvWrKElaaECGGdZJmkqbt
 kdhfkzZFJGYTDm4MVzWthO7ITtXNBQ9tZMfnK8GULf9IMMzZhTi/lwEGHknJkW6JhHDz0KGSfU0
 Xjrnfe4HzqCH2db9bBDIIKYMebdnAQ==
X-Authority-Analysis: v=2.4 cv=WYIBqkhX c=1 sm=1 tr=0 ts=693a90cc cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=DsdYmJs--EhVD9mPpCUA:9 a=CjuIK1q_8ugA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 6qpqRRSZ1X5K5JK4yqDFIQf4NZ7V1hGP
X-Proofpoint-ORIG-GUID: 6qpqRRSZ1X5K5JK4yqDFIQf4NZ7V1hGP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-10_03,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512110072

On Wed, Dec 10, 2025 at 12:57:11AM +0200, Dmitry Baryshkov wrote:
> On Sun, Dec 07, 2025 at 10:35:26PM -0800, Qiang Yu wrote:
> > On Sat, Dec 06, 2025 at 01:25:34PM +0200, Dmitry Baryshkov wrote:
> > > On Mon, Dec 01, 2025 at 06:33:15PM -0800, Qiang Yu wrote:
> > > > From: Mayank Rana <mayank.rana@oss.qualcomm.com>
> > > > 
> > > > Currently, the FBC image is a non-standard ELF file that contains a single
> > > > ELF header, followed by segments for SBL, and WLAN FW. However, TME-L
> > > > (Trust Management Engine Lite) supported devices (eg. QCC2072) requires
> > > > separate ELF headers for SBL and WLAN FW segments due to TME-L image
> > > > authentication requirement.
> > > > 
> > > > Current image format contains two sections in a single binary:
> > > > - First 512KB: ELF header + SBL segments
> > > > - Remaining: WLAN FW segments
> > > > 
> > > > The TME-L supported image format contains two sections with two elf
> > > > headers in a single binary:
> > > > - First 512KB: First ELF header + SBL segments
> > > > - Remaining: Second ELF header + WLAN FW segments
> > > > 
> > > > Download behavior:
> > > > - Legacy: 1. First 512KB via BHI (ELF header + SBL)
> > > >           2. Full image via BHIe
> > > > 
> > > > - TME-L: 1. First 512KB via BHI (First ELF header + SBL)
> > > >          2. Remaining via BHIe (Second ELF header + WLAN FW segments)
> > > > 
> > > > Add standard_elf_image flag to mhi_controller_config to indicate TME-L
> > > > supported image format. When set, MHI skips the first 512KB during WLAN FW
> > > > download over BHIe as it is loaded in BHI phase.
> > > 
> > > What is standard about it?
> > 
> > The TME-L requires standard elf image format which includes single EFL
> > header and WLAN FW segment.
> > 
> > The "standard_elf_image" seems misleading. Since the new image format is
> > required for TME-L image authentication, how about using 
> > tme_supported_image?
> 
> Just elf_image?

Is it too generic for this specific use case. Current image format also
contains elf header.

- Qiang Yu
> 
> > 
> > > 
> > > > 
> > > > Reviewed-by: Baochen Qiang <quic_bqiang@quicinc.com>
> > > > Signed-off-by: Mayank Rana <mayank.rana@oss.qualcomm.com>
> > > > Co-developed-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > > > Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > > > ---
> > > > Changes in v3:
> > > > - Reword commit message.
> > > > - Reword comments of standard_elf_image flag
> > > > - Add reviewed-by tag.
> > > > - Link to v2: https://lore.kernel.org/mhi/20250603-standard_elf_image_load_support-v2-1-cce97644e99e@oss.qualcomm.com/
> > > > 
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
> > > > index 205d83ac069f15a19ab2d66a63692e5d60334d4c..64fb7a257d3529167eddf1153d34cc6b25735809 100644
> > > > --- a/drivers/bus/mhi/host/boot.c
> > > > +++ b/drivers/bus/mhi/host/boot.c
> > > > @@ -584,6 +584,13 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
> > > >  	 * device transitioning into MHI READY state
> > > >  	 */
> > > >  	if (fw_load_type == MHI_FW_LOAD_FBC) {
> > > > +		dev_dbg(dev, "standard_elf_image:%s\n",
> > > > +			(mhi_cntrl->standard_elf_image ? "True" : "False"));
> > > > +		if (mhi_cntrl->standard_elf_image) {
> > > > +			fw_data += mhi_cntrl->sbl_size;
> > > > +			fw_sz -= mhi_cntrl->sbl_size;
> > > > +		}
> > > > +
> > > >  		ret = mhi_alloc_bhie_table(mhi_cntrl, &mhi_cntrl->fbc_image, fw_sz);
> > > >  		if (ret) {
> > > >  			release_firmware(firmware);
> > > > diff --git a/include/linux/mhi.h b/include/linux/mhi.h
> > > > index dd372b0123a6da5107b807ff8fe940c567eb2030..a13106bb234d22e3876dff3c0d46f3dee1d9e05c 100644
> > > > --- a/include/linux/mhi.h
> > > > +++ b/include/linux/mhi.h
> > > > @@ -360,6 +360,9 @@ struct mhi_controller_config {
> > > >   * @bounce_buf: Use of bounce buffer
> > > >   * @fbc_download: MHI host needs to do complete image transfer (optional)
> > > >   * @wake_set: Device wakeup set flag
> > > > + * @standard_elf_image: Flag to determine whether the first 512 KB of the FBC
> > > > + *                      image need to be skipped when loading WLAN FW over
> > > > + *                      BHIe interface (optional)
> > > 
> > > How does the description correlate to the name of the flag?
> > 
> > The description can be updated as:
> > 
> >  * @tme_supported_image: Flag indicating FBC image format supports TME-L
> >  *                      (Trust Management Engine Lite) authentication.
> >  *                      When set, skip first 512KB when loading WLAN FW
> >  *                      over BHIe interface (optional)
> > > 
> > > >   * @irq_flags: irq flags passed to request_irq (optional)
> > > >   * @mru: the default MRU for the MHI device
> > > >   *
> > > > @@ -445,6 +448,7 @@ struct mhi_controller {
> > > >  	bool bounce_buf;
> > > >  	bool fbc_download;
> > > >  	bool wake_set;
> > > > +	bool standard_elf_image;
> > > 
> > > This flag is never set, making it a dead API. If there are other patches
> > > setting up the flag, please include them into them in the same series.
> > 
> > Let me discuss with Baochen about whether he can include the patch in his
> > series that actually sets this flag for QCC2072 device.
> 
> Otherwise it's a dead API which is generally not allowed.
> 
> > 
> > - Qiang Yu
> > > 
> > > >  	unsigned long irq_flags;
> > > >  	u32 mru;
> > > >  };
> > > > 
> > > > ---
> > > > base-commit: ac35e04f8000aaaf98635792464647e7a6f3422e
> > > > change-id: 20251129-wlan_image_load_skip_512k-ddcfe49db8e3
> > > > 
> > > > Best regards,
> > > > -- 
> > > > Qiang Yu <qiang.yu@oss.qualcomm.com>
> > > > 
> > > 
> > > -- 
> > > With best wishes
> > > Dmitry
> 
> -- 
> With best wishes
> Dmitry

