Return-Path: <linux-arm-msm+bounces-86459-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 76B0ECDB2AE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 03:25:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 46F393006F56
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 02:25:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7DEF196C7C;
	Wed, 24 Dec 2025 02:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bxVNoHtg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ETwMnWVR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B4EE241686
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 02:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766543108; cv=none; b=jm9Nykwj2w84ZcTJ+GuszNTfsdDhHQ5dXxgqOHnzK3sRNUHf5WCxQ1/1unXlIhG1YkA1me+PqrA6NOje+/j3TphbdWiK3bhkezLqFsloJboHqW3NQ2hyA7fQ4Y1wpdZ6BfXex85zF/k1rSXDHZO9k39NimZ/k30ndRHEYNe+cRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766543108; c=relaxed/simple;
	bh=hst4wFxqsCrh+b4bJmNnrs0Z5Hu9R9f5g9FYyaOTeVQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QpTZfiKmoND3kY4L6re0j6ohueCxIAdxG52EI+OGqPJKuQDpWieMaUPOftiQIXy2Gmautie63+9UyzJuAO90Bi+Xk/pEqbXcRxAkk9eYU3v1TemFH2q2B5Xk2csxUJQdR1CaQP1esg8z/JLyyaqydt3vqa4gfN8I+wewP5L4FCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bxVNoHtg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ETwMnWVR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNEN81G913445
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 02:25:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7uzEDmz3ozssJ2zkIMpJ8MaNwc+js4SxBPDQhvJmCx0=; b=bxVNoHtgZjiOM/xv
	2nq4+1MrBt3l2BwfSNRn6yDDWTvLtRf1+aFDKULbeXsf/U4u39+mIDWi8gtssT3D
	93yeEUk0ddBS+vq2si50ggS/5JqO8ucJgipt138jAf0drXNVrolUqQAxjJ0VCuzd
	Bh6MAXxydkqwk/FqiNLctovFLGnzjd7lqPH4gy/b52rhaU/ThEASyn8a9m5qlI/P
	A8/Lv7SUJiwplsKS0A89HtC4QHcEmiz62sJHthZBrCZfuDTpfeqjkL76c1DF/70a
	Sl3VSsSTayZUeGgje1NtuB5BM+UUuUFLnFJEnOdJcLeZRnrTlFx2i9oBAz72fvY4
	jQ57WQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7vt2ht8v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 02:25:05 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-bde2e654286so5005061a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 18:25:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766543105; x=1767147905; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7uzEDmz3ozssJ2zkIMpJ8MaNwc+js4SxBPDQhvJmCx0=;
        b=ETwMnWVRSFu7N+1jJd1MRZ7Zl3YwTeLk25ctfLpJ134doXLZ4mnq15256cQTUOp0Hs
         jXRgEk1vRH0dEZ0aj1l1YzpIUNv0y7DEQc9oaA1pHt4BKzcodE99NTA5LEBJ+SA82Hai
         kzK2Uaj3YpC9WSnAopnMNxRL2K+LCsmdjxdmc9GuAE9Opk/Jo5FJK5/grYbsTL7Xinvi
         A6dwqLIq8qSBWExCkvQ/0HuPutjWt/Sj4P5wAKxXLTjR8DP+Itcl50/6K6kZrBWTz/ts
         K7xkw/ei8h/wZZFS3H6T+f/qHcr+mxgt9dYwisJQAtPzEvfuhQi9qkx6Cusw1apQozRO
         fwfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766543105; x=1767147905;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7uzEDmz3ozssJ2zkIMpJ8MaNwc+js4SxBPDQhvJmCx0=;
        b=tNZrTO+cRMxRJRyRcq8pXEkXF4qfWQ7rf0c0kT8wnTtXWSd6UIqviv+nIVrVsCJxa0
         cHt01y4cZxTaqFAypf342L1RUM4o7WwFyfgWC9B92BAIgaiS5DN8Hkt48WIu5fBzERSW
         IClW3Z30nd3OrSF9fut4GEpt5BHyv/m6axBwJ6bp7twq17eIK+cAM+FZnS7Lk9TjYW1y
         ikAnAJVeefsdu4eXjxufZe3oQ6e9igCyM7EQzqgSZAEG8BbbAKQG6jxl6lxCKRJBDPID
         YpQ5jfD7nwKZZJTuyx/z9XZ8Rgd/JPXeANvLg94uHz1XEATRQfgH/It5B9ssSbu6AMQZ
         a6Bg==
X-Forwarded-Encrypted: i=1; AJvYcCWkghtfqvxhqKkpBycRxHd0/gZmZzXSYAbecCSqxbKKDgb/Z2/gcl4BHi1swwfxoD6QKJgXMZuSFgn3o9Z6@vger.kernel.org
X-Gm-Message-State: AOJu0YzsrUujdaSoZIxgwaSNKieww1yBBD04GsCe847AUXiENLtVALDb
	vhmribrF49Cr+W/TTlqxjD2E5c2N8uGhp6CpDZK8puRxKD4QyVc81DYClXZiOWKdIdBANShlMZn
	u4GCJkKDX2gR9+AR4NOQU4nFe1JVMErosZeGtN0K9dXXJEUyIW5OZY4AUMLR2/fgVD633prSLZB
	03HFI=
X-Gm-Gg: AY/fxX6kLJB4zb3wz0o08S/EjoVGE01kKhp/0yITvmT4XNzBi0lTf1/nXV6zFDtqcNO
	syDuMWCjP1FrRVXJdNgbNbywOD/FzmRTD0MmOqxD2lXNxGc0VV4q7H8geYIKoZFI9OYU1wz6VwE
	gRHGlCfLWeshhopVvwQEsWFQJg5vN7s2d4oIUVwrpGE/Vxoa1NbppvSQP+HqCbUf0N+JZ4oIozW
	qWdzENXYSw1LoC8pVZdgWuAlW83c9Uy1JpLeNBVWAIx5wLl/5h5tcAEBnQxIeL1BV+20mCQg16w
	9KVslRcyd06gKJhYspOVpsK+arGY9uWGllupwgsD7QrpK+lbBxiVO5lIqg3cz1Mx3OipmyXDvTP
	kYS+3ZAwmTNkD6lfpgONGcSfz/hQhfzWfywlC88eY9Q213Y9oGSg3xX72
X-Received: by 2002:a05:7300:c01c:20b0:2a4:8576:abf5 with SMTP id 5a478bee46e88-2b05ec6db1amr11885649eec.23.1766543104671;
        Tue, 23 Dec 2025 18:25:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFC8lB+FDWwtrIyPSqkUk9SczALY9wWT4LlLWhbex/v4tm0ttNNbg1GDPzYbodhq+x95Z/YbQ==
X-Received: by 2002:a05:7300:c01c:20b0:2a4:8576:abf5 with SMTP id 5a478bee46e88-2b05ec6db1amr11885637eec.23.1766543104082;
        Tue, 23 Dec 2025 18:25:04 -0800 (PST)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b06a046e99sm42080302eec.6.2025.12.23.18.25.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 18:25:03 -0800 (PST)
Date: Tue, 23 Dec 2025 18:25:01 -0800
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mayank Rana <mayank.rana@oss.qualcomm.com>,
        Baochen Qiang <quic_bqiang@quicinc.com>
Subject: Re: [PATCH v4] mhi: host: Add support for dual ELF image format
Message-ID: <aUtO/UOSjQM8gNab@hu-qianyu-lv.qualcomm.com>
References: <20251223-wlan_image_load_skip_512k-v4-1-a00234a6c578@oss.qualcomm.com>
 <a5obqgu6swi7eq2j2n2655twn4aw2muzkrr5txmbg2qdfzs36y@7v6maj5pdw6c>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a5obqgu6swi7eq2j2n2655twn4aw2muzkrr5txmbg2qdfzs36y@7v6maj5pdw6c>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDAxOCBTYWx0ZWRfXyZ+h/VNH9fVw
 lZM/uc9r+1j/j6zh17N8DMGLuaV1jTl3CNDppIaJjIpMpFa1no83w4320ifq6yIupMTK2BJsyDB
 K2VBV5H3K7gw0TdF1cchbKe5LQGOMBOddkwtxa+Z0iUfR3uDyK4KtzW38jgAaDv7mHWCIu2U6rB
 h8jeBd8LAaAwVZi9jQwT7i9yxQLd6cLomz5Jxi9ranr+vWMD991NXlNWuIWchV2xvLcyoqBWRVF
 InRZTZkKAcizxEWCJrwzYU0KOFJzEJOwS5bAH7J26fXht0DsEBGo0t34iUyQGrQx12/JZVdp/K/
 VMeVovL47K5idPbIw0GgOopd9kPDza24aksU99lx43NfqniJGXUKRA9F+5BPCJ/xxCT9ePXBADk
 zY1vsMaPRWu9PVxHuzn27q6pkCMV/k4yXsk2Fx6F87eMoTMTOG+6Ik0XZhd1UFSKiCFiUe4Chi/
 SRt3wa5V5b2Eg0k41OA==
X-Proofpoint-GUID: yB4-kH_jKiVgYqTodNU2igG2NhXwfAYz
X-Proofpoint-ORIG-GUID: yB4-kH_jKiVgYqTodNU2igG2NhXwfAYz
X-Authority-Analysis: v=2.4 cv=brtBxUai c=1 sm=1 tr=0 ts=694b4f01 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=tLrtqS7ol-idi3BtBVwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_01,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240018

On Tue, Dec 23, 2025 at 04:45:50PM +0530, Manivannan Sadhasivam wrote:
> On Tue, Dec 23, 2025 at 01:16:46AM -0800, Qiang Yu wrote:
> > From: Mayank Rana <mayank.rana@oss.qualcomm.com>
> > 
> > Currently, the FBC image contains a single ELF header followed by segments
> > for both SBL and WLAN FW. However, TME-L (Trust Management Engine Lite)
> > supported devices (e.g., QCC2072) require separate ELF headers for SBL and
> > WLAN FW segments due to TME-L image authentication requirements.
> > 
> > Current image format contains two sections in a single binary:
> > - First 512KB: ELF header + SBL segments
> > - Remaining: WLAN FW segments (raw data)
> > 
> > The TME-L supported image format contains two complete ELF files in a
> > single binary:
> > - First 512KB: Complete SBL ELF file (ELF header + SBL segments)
> > - Remaining: Complete WLAN FW ELF file (ELF header + WLAN FW segments)
> > 
> > Download behavior:
> > - Legacy: 1. First 512KB via BHI (ELF header + SBL)
> >           2. Full image via BHIe
> > 
> > - TME-L: 1. First 512KB via BHI (SBL ELF file)
> >          2. Remaining via BHIe (WLAN FW ELF file only)
> > 
> > Add runtime detection to automatically identify the image format by
> > checking for the presence of a second ELF header at the 512KB boundary.
> > When detected, MHI skips the first 512KB during WLAN FW download over BHIe
> > as it is loaded in BHI phase.
> > 
> > Reviewed-by: Baochen Qiang <quic_bqiang@quicinc.com>
> > Signed-off-by: Mayank Rana <mayank.rana@oss.qualcomm.com>
> > Co-developed-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> 
> This version is not anyway close to the previous one. So all the tags from
> Mayank and Baochen are irrelevant.

Ohk, let me remove invalid tags and post patch v5.

- Qiang Yu
> 
> - Mani
> 
> > ---
> > Changes in v4:
> > - Detect image format runtime by checking second ELF header instead of using a flag.
> > - Link to v3: https://lore.kernel.org/r/20251201-wlan_image_load_skip_512k-v3-1-bedb5498a58a@oss.qualcomm.com
> > 
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
> >  drivers/bus/mhi/host/boot.c | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> > 
> > diff --git a/drivers/bus/mhi/host/boot.c b/drivers/bus/mhi/host/boot.c
> > index 205d83ac069f15a19ab2d66a63692e5d60334d4c..6ba0f16854d3a839e987f19d782600467b5f9836 100644
> > --- a/drivers/bus/mhi/host/boot.c
> > +++ b/drivers/bus/mhi/host/boot.c
> > @@ -584,6 +584,17 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
> >  	 * device transitioning into MHI READY state
> >  	 */
> >  	if (fw_load_type == MHI_FW_LOAD_FBC) {
> > +
> > +		/*
> > +		 * Some FW combine two separate ELF images (SBL + WLAN FW) in a single
> > +		 * file. Hence, check for the existence of the second ELF header after
> > +		 * SBL. If present, load the second image separately.
> > +		 */
> > +		if (!memcmp(fw_data + mhi_cntrl->sbl_size, ELFMAG, SELFMAG)) {
> > +			fw_data += mhi_cntrl->sbl_size;
> > +			fw_sz -= mhi_cntrl->sbl_size;
> > +		}
> > +
> >  		ret = mhi_alloc_bhie_table(mhi_cntrl, &mhi_cntrl->fbc_image, fw_sz);
> >  		if (ret) {
> >  			release_firmware(firmware);
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
> மணிவண்ணன் சதாசிவம்

