Return-Path: <linux-arm-msm+bounces-85319-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB1ACC195D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 09:33:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 240E230AABE6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 08:27:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25F7634321B;
	Tue, 16 Dec 2025 08:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RQIlkxfy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MrA9a0SB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DCA8322B91
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 08:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765873607; cv=none; b=g9ODwA43QbsoBi1PcVDhRgyGDzeeZtVHatD0ZKfTuJM+JPcS64B6jkCLJIvRmr2e+xlj3DQtUebXt7gh198hnfgaCQ5LQrdD4pjJBV4k57xzi1DgMv5jnNkvZ4DomsLOboPnCocQ7dC4PB2X+Hk1QUkgdceXPrWQYBW63eIeGQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765873607; c=relaxed/simple;
	bh=PXBQmCLE+4Vw/IXmwlisC4K5mhKqR4A3VjgxUVHLnKg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mL5afaYUx3H1bIklK0am+B5uT1hpXJKTHW/nhXE6ZxuPaPi+Iv5xH8O8qxw9EEv5n84HG7H+pLqpOaDVEd33wHn6pFnjNQCsHdQ/nSYDm2V/bRxf+HxEEo7O77P4zXynuRE9Jm4vfnqpP25nTzjL6a2JWaLGP0xcNg2I9iRxPl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RQIlkxfy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MrA9a0SB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BG6jOAF825824
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 08:26:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BVhXmaTcq8eOGymWHRQkqv6GDRQckhpB6oYmtB0u5bE=; b=RQIlkxfy698lk6Pc
	dDYdzGMsbnVRQlCVmAGmN2vbxx+JZryX8bGe0577+cwExYUxRKtwkNO0MMRg4MQd
	VsAjG/c6t1plMiDU7cHfqq9dxrugd0Y2a0heOslKD2XXPsHO7g5nAOxOopm3CVR7
	nGpQKFUK/pfQjDFkDuKJcgbi99tey6Tt7YGY1vf/5QR3g8y7niogZkMf2i3ySdhH
	5kNotnoGGdEJIDPbGS3uoBqNV3OyBWwV1D3AC1ak0flZ8Ddw/NGa6WWR14UUFOYR
	huY7PEcFxARq0hmtwEBqp5oJ4VOWsMph+azxA2lNhEC7rdFcsPymIvOZfyL9DoOK
	yMOV4Q==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b2nceu5b6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 08:26:44 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b62da7602a0so4714527a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 00:26:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765873604; x=1766478404; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BVhXmaTcq8eOGymWHRQkqv6GDRQckhpB6oYmtB0u5bE=;
        b=MrA9a0SBm+o3wiB+khr6ZJCurVfhMFSFr4aS0MKXZU+IQOdobF5RrvtlJs7Z8KQiif
         7tdVWJk82apUXFfdE8YSVlZLmfkBFFp1yxAqU/8r5EeWXA4hXfXZfjWgDBi1YP6WxXdE
         qB1aeeWiyCHscIVQoFZMEoiasOaIaF/cV/sTbD8zIPae0w1gmGPpnihImQHtfP8K7QqV
         6whm//cp2SHYkT7RqBoz3BX5RAvitzRTrah3UVgXFe7QtD9whx95iHCgAjDc8fyYMLs8
         2dqKKR8bBocS+1KvrzwGAHlmtOcQmj1NioxkXE97D09t3UDWTeAAd5YS2weBHPlp8jMP
         RNZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765873604; x=1766478404;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BVhXmaTcq8eOGymWHRQkqv6GDRQckhpB6oYmtB0u5bE=;
        b=uwRDOprkELUJFBwBFWVGTyFUvlPLZRR9OTYaMc6b6e5vFbbx5JU89XckRfNgcbrEq2
         MzvdJlOpGV+hWkFS7NLuxFpIekXoSooXxMu0i8htglytYtGTw6morPuZCOU38S0hfre9
         /C0Gwu9/ChocizCUqp+9HqfZD7M1N+ChkXLvM1+9C1W73avMdjIbQyU9AymsfHSK53x4
         6TepPsqBlKYASQG72R3ZuC8ABDlm1EM7SjTpJe3p50XNqg9ud/F1dXudL9h8LdjaaQMZ
         mIH9eT/DEmcNeExrQbssMW9LQtIuFFf3s8UCnlzS60sUwgAExJPvWPi689gRhFpkp1WO
         LfmA==
X-Forwarded-Encrypted: i=1; AJvYcCWolOR2RT+kBZjBBds23oPS3OKlt23Uv6tHG6CCs3q7JDJ2QcuA4G3ZG2mXmi+QNollhdg/HFGFqEsipVDm@vger.kernel.org
X-Gm-Message-State: AOJu0YwQTtRQXuhvTXPt+yvXd/5tqCnM+pVN90DQXe4AzEXjeIHX3+rl
	70Hd9L7aA8JLzriVrX/7NuimxW8VgEPVHjdvBUagnJWZT6DfhgJg7tBhzqJZbdTxPC7O1dl2b6j
	W5fTHqZqBEhroIoOonWqfFC/cjpwNXP8xUUqAML3JNqeivL2Ot9DNH0TtI5CgR96PtMBa
X-Gm-Gg: AY/fxX45vWpI03w8rpgT+U2DodRvMeyHrEro1cc6P5XUKKeehiFfD/+S2SDqxE5ji41
	z/VesY6PYgpq7DGpwKssTHUSVvV4ghClnrhql5jtbv0ddjcxzLil2xz4WgVv2zhFsCyQbsGhJpu
	r/fVNFApaf95XHN4Sek7N3pI9U/B9L1PCH1gAL3PQOcmNCarmgckp/0qDY/mZXu2+8hbmjstLxw
	x5F/cUU0JNRiFwVy8AebX91bnBUbxfhzb3G8Redtdlr5vozlokknWgC1KxIwaT1IMBMibJXuplf
	Suqijc9cyjsH5XLvVyIP1NkK8V8DtbLeGAFFRO9JDGPewS9xo+HGnS4ccrvQ+OkKkXwNtJyv/kr
	Jo21BKbNvgxRIbtk7m/CMV5xMS+uSYdt8yEBFX7MW2oqj2322RMigq56J
X-Received: by 2002:a05:7300:f144:b0:2a4:6a87:7285 with SMTP id 5a478bee46e88-2ac3014dc4fmr7801788eec.39.1765873603647;
        Tue, 16 Dec 2025 00:26:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH64Gft19RnIs/ziNFasAn4fmgRDq45OH1Nfzl3DQIB2wg96dl/Qv8fz6jNSWsUBVRQ5hQDRQ==
X-Received: by 2002:a05:7300:f144:b0:2a4:6a87:7285 with SMTP id 5a478bee46e88-2ac3014dc4fmr7801765eec.39.1765873603036;
        Tue, 16 Dec 2025 00:26:43 -0800 (PST)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ac191ba0fesm32692837eec.3.2025.12.16.00.26.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 00:26:42 -0800 (PST)
Date: Tue, 16 Dec 2025 00:26:41 -0800
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mayank Rana <mayank.rana@oss.qualcomm.com>,
        Baochen Qiang <quic_bqiang@quicinc.com>
Subject: Re: [PATCH v3] mhi: host: Add standard elf image download
 functionality
Message-ID: <aUEXwbuTEvV7Y6I/@hu-qianyu-lv.qualcomm.com>
References: <ttpn6o2far7xebghblurxvi43aohv74v7jq2vdgc4jhgc7avo2@lgp4y4sytene>
 <aTZxrhpYhoOP+VDz@hu-qianyu-lv.qualcomm.com>
 <z5osod5v6ykmook2cwz76vaww7vnlrh7csx4zebahcaspqr4w5@6an2hopq574o>
 <aTqQyPJaV+KrIMOj@hu-qianyu-lv.qualcomm.com>
 <ge3qbeyg6oue7jeury33fqkevwvwmm2bucum45w4uyh4ldy6re@pbfshzcpeqep>
 <be72nummuhhqh3oiid7fx2amzaolgdsyfr2q2guzh27kyv5nes@x4a25lsvclio>
 <gc2phr73ai2or5auu6rju2qbszrulk74rnft52ldmu4b4tot5r@xfoclkhrlfl3>
 <gcyjhnn33xcuiqfmiqt7diijncovp3smcnncyvfsnwo45v5z3m@plbtdjbxksgr>
 <aT+0RqCybM730hPY@hu-qianyu-lv.qualcomm.com>
 <7nhlxp6gxk2tkuzh2rogywp6ko4n5nkh6ih2uly3zsskmi7wpp@7weahfg6gksm>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7nhlxp6gxk2tkuzh2rogywp6ko4n5nkh6ih2uly3zsskmi7wpp@7weahfg6gksm>
X-Proofpoint-ORIG-GUID: TzilXH4sSK87-CBkP2QlO3Pnqu5-evmK
X-Proofpoint-GUID: TzilXH4sSK87-CBkP2QlO3Pnqu5-evmK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE2MDA2OSBTYWx0ZWRfX8zl0aoH4a9ct
 RnfcMkEMnZI+3MHlpPzMqdHD5q6Z0naQSreT5MwNcNYTY4ubAUPE1P+PBeuaKBa69z7/J0FRdDs
 1abHLI+z/bmLOile2s6yJcbuDKxH6gAhHtNINUQEd5eOnzviz9/6vUpWf7ONjwykcbRzEG/OUaz
 lvVjTCfysFhSCnQfWr0s85nzGmzHRx9fAoCVSdPV9L2xjFXAxdtF+uGP3ixK+E3plVuyYkQ8axS
 SO82blhZMJkyvkUo/OiEk+9vbCf2a9i7r6u5hcUIpHsGD6mr4mkswttQsi4Pqnmz2yYnn56BeKN
 E04IQ67hp1ronNLgYHUEbo9ptR9xfzYNMk/0rACWYgbmc9uW+q+0eGgBsbOcDkWuOqOe6lp+aKm
 8y27eJo2L4bZ1kqcU0i3UyWiRmHj0A==
X-Authority-Analysis: v=2.4 cv=XJU9iAhE c=1 sm=1 tr=0 ts=694117c4 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Ub9x4grCv_FD0cmJDCEA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-16_01,2025-12-15_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512160069

On Mon, Dec 15, 2025 at 08:41:32PM +0200, Dmitry Baryshkov wrote:
> On Sun, Dec 14, 2025 at 11:09:58PM -0800, Qiang Yu wrote:
> > On Sat, Dec 13, 2025 at 11:21:11AM +0900, Manivannan Sadhasivam wrote:
> > > On Fri, Dec 12, 2025 at 09:24:06PM +0200, Dmitry Baryshkov wrote:
> > > > On Fri, Dec 12, 2025 at 10:07:01AM +0900, Manivannan Sadhasivam wrote:
> > > > > On Thu, Dec 11, 2025 at 03:57:54PM +0200, Dmitry Baryshkov wrote:
> > > > > > On Thu, Dec 11, 2025 at 01:37:12AM -0800, Qiang Yu wrote:
> > > > > > > On Wed, Dec 10, 2025 at 12:57:11AM +0200, Dmitry Baryshkov wrote:
> > > > > > > > On Sun, Dec 07, 2025 at 10:35:26PM -0800, Qiang Yu wrote:
> > > > > > > > > On Sat, Dec 06, 2025 at 01:25:34PM +0200, Dmitry Baryshkov wrote:
> > > > > > > > > > On Mon, Dec 01, 2025 at 06:33:15PM -0800, Qiang Yu wrote:
> > > > > > > > > > > From: Mayank Rana <mayank.rana@oss.qualcomm.com>
> > > > > > > > > > > 
> > > > > > > > > > > Currently, the FBC image is a non-standard ELF file that contains a single
> > > > > > > > > > > ELF header, followed by segments for SBL, and WLAN FW. However, TME-L
> > > > > > > > > > > (Trust Management Engine Lite) supported devices (eg. QCC2072) requires
> > > > > > > > > > > separate ELF headers for SBL and WLAN FW segments due to TME-L image
> > > > > > > > > > > authentication requirement.
> > > > > > > > > > > 
> > > > > > > > > > > Current image format contains two sections in a single binary:
> > > > > > > > > > > - First 512KB: ELF header + SBL segments
> > > > > > > > > > > - Remaining: WLAN FW segments
> > > > > > > > > > > 
> > > > > > > > > > > The TME-L supported image format contains two sections with two elf
> > > > > > > > > > > headers in a single binary:
> > > > > > > > > > > - First 512KB: First ELF header + SBL segments
> > > > > > > > > > > - Remaining: Second ELF header + WLAN FW segments
> > > > > > > > > > > 
> > > > > > > > > > > Download behavior:
> > > > > > > > > > > - Legacy: 1. First 512KB via BHI (ELF header + SBL)
> > > > > > > > > > >           2. Full image via BHIe
> > > > > > > > > > > 
> > > > > > > > > > > - TME-L: 1. First 512KB via BHI (First ELF header + SBL)
> > > > > > > > > > >          2. Remaining via BHIe (Second ELF header + WLAN FW segments)
> > > > > > > > > > > 
> > > > > > > > > > > Add standard_elf_image flag to mhi_controller_config to indicate TME-L
> > > > > > > > > > > supported image format. When set, MHI skips the first 512KB during WLAN FW
> > > > > > > > > > > download over BHIe as it is loaded in BHI phase.
> > > > > > > > > > 
> > > > > > > > > > What is standard about it?
> > > > > > > > > 
> > > > > > > > > The TME-L requires standard elf image format which includes single EFL
> > > > > > > > > header and WLAN FW segment.
> > > > > > > > > 
> > > > > > > > > The "standard_elf_image" seems misleading. Since the new image format is
> > > > > > > > > required for TME-L image authentication, how about using 
> > > > > > > > > tme_supported_image?
> > > > > > > > 
> > > > > > > > Just elf_image?
> > > > > > > 
> > > > > > > Is it too generic for this specific use case. Current image format also
> > > > > > > contains elf header.
> > > > > > 
> > > > > > upload_elf_image?
> > > > > > 
> > > > > 
> > > > > Nope. What does 'upload' even mean here? The 'TIS and ELF' spec v1.2 clearly
> > > > > defines that an ELF executable can have only one ELF header. So I'd prefer
> > > > > 'standard_elf_image' to differentiate it from the non-spec-conformant ELF image
> > > > > used previously.
> > > > 
> > > > What kind of ELF image was used previously? Could you please explain
> > > > what do 'First ELF header' vs 'Second ELF header' mean here?
> > > > 
> > > 
> > > I don't have the details of it, but Qiang should be able to explain. But AFAIC,
> > > that was a non-standard ELF image and the new one is going to be spec
> > > conformant.
> > >
> > Previous image format:
> > ELF header + SBL segments + WLAN FW segments
> > 
> > The TME-L supported image format:
> > First ELF header + SBL segments + Second ELF header + WLAN FW segments
> 
> What is the Second ELF header in this context? ELF files usually have
> only one header. Are we repeating the same ELF header or is some kind of
> an embedded ELF-in-ELF.

The "Second ELF header" refers to a separate, complete ELF file embedded
within the FBC image, not a duplicate header. The TME-L supported format
contains:

FBC Image Structure:
┌─────────────────────────────────────┐
│  Complete ELF File #1 (SBL)        │
│  ┌─────────────────────────────┐   │
│  │ ELF Header                  │   │ ← First ELF header
│  │ Program Headers             │   │
│  │ SBL Segments                │   │
│  └─────────────────────────────┘   │
├─────────────────────────────────────┤
│  Complete ELF File #2 (WLAN FW)    │
│  ┌─────────────────────────────┐   │
│  │ ELF Header                  │   │ ← Second ELF header
│  │ Program Headers             │   │
│  │ WLAN FW Segments            │   │
│  └─────────────────────────────┘   │
└─────────────────────────────────────┘
> 
> > 
> > As per 'TIS and ELF' spec v1.2 Mani mentioned, the previous image format
> 
> pointer?

The entire 'TIS and ELF' spec v1.2 document descibes the structure of the
ELF excutable file, I can not point out a specfic sentence or phase that
tell us the previous image format is standard. But at least there is an
example we can refer to: Figure A-4. Executable File Example. And I can
also use readelf cmd to parse the image.

> 
> > is also standard elf image. But it doesn't meet the requirement of TME-L
> > because we need separate elf header for SBL and WL FW for TME-L
> > authentication.
> > 
> > So the commit message stating "Currently, the FBC image is a non-standard
> > ELF file that contains a single ELF header, followed by segments for SBL,
> > and WLAN FW" is not correct and standard_elf_image is not accurate.
> > 
> > Can we avoid saying anything about standard in commit message? Flags eg.
> > separate_elf_header and tme_supported_image are more accurate.
> 
> Please define, what is the supported image.

The supported image refers to an image format that TME-L can authenticate.
Both SBL and WLAN FW should be in ELF format. After powering on, SBL (ELF
format, ELF header + SBL segment, first 512 KB) is loaded over BHI and
authenticated by TME-L. After entering SBL, WLAN FW (ELF format, skip
first 512KB of fbc image) is loaded over BHIe and also authenticated by
TME-L.

- Qiang Yu
> 
> > 
> > - Qiang Yu
> 
> -- 
> With best wishes
> Dmitry

