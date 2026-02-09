Return-Path: <linux-arm-msm+bounces-92193-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id T3tYA/Q6iWlD4wQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92193-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 02:40:04 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 63C0310AE39
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 02:40:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 23DF03005E90
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Feb 2026 01:40:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 500DB257848;
	Mon,  9 Feb 2026 01:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NR5tw/qW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bWRvd8bn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 097472550AF
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Feb 2026 01:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770601199; cv=none; b=bZ0T1LWNzcJx/ss9bWMg6f+/TmClgHoORZoUiFs9E8w55bnTeHyBLNFJ2InQvb4/oxny2kU/r3yXLLo2vZPRVvRGdMPxpbjAfmlwJtOcjBW4oCKWui7G4JVWa9JLwOXaK/1n15xgGWYwUkVvID+ecPhcbcPinhSErepA3qXUvMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770601199; c=relaxed/simple;
	bh=tA7LEapIpv+HaNxduwMfA7gBmAjM3hJZGlU/A8uFDe8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oaA5Wr09zb+rVb9ARcUUJPw9l4g+gzyMH/DpaUKbqlqZsIuv115HZvjvhxQWFKCdv0JX9xoRPHRuA7uIb5goRcdFLMwoMt0JCZjpkiPX+FcUhNBtlea/UJRXxxCpLSAB3TMACF4drEzpUu1oS0YdUSj7GK7TabWCqtxj5um6H5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NR5tw/qW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bWRvd8bn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 618Kj1Vf2299745
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Feb 2026 01:39:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7sqY6ei5RD5wGCvV//10Q+1Z
	4jf+VeHpf+2w+y/9dIM=; b=NR5tw/qWztSbooPlA1az/fmUD9oesrDI7oAp/8V+
	kpbB7OtFP8yekHNb07KEO7Zhj9faPa+IXxiDLrCc3LrMC8rfo1i+g99fK+/oUdIV
	Sii/NKY/CjL5aA5TkB688LpK6Iz0I7b5zASB8KjJTk/ukBrwPB2KqJ5hllOXyMwJ
	/PhNATL98keMiDvZqg3nBVm6ULC7/eKRyK+tO0pRVH/FDdr2nqaouRyGFY8sA+d2
	4JfjKoeeG1GFa5j7uztSRgPbwP2PTS1q+ZRwig0Ph6Ay3dCCIT7+wZYel/adRSm+
	/69FvQHhzfN4ct098FFv6FllGuBx9QKCQ070OTKmMZKuxg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c5xbfb8t8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 01:39:58 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c6a87029b6so1481760685a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Feb 2026 17:39:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770601197; x=1771205997; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7sqY6ei5RD5wGCvV//10Q+1Z4jf+VeHpf+2w+y/9dIM=;
        b=bWRvd8bnHIZ1gVJ17/X6Hl13HnK1KiBz+Ntu/vMbu3lBfeJmM8KS/u6Ry8R/CGGyns
         ruDIzaIJaBhv9bLvgOmTPAXwmGwgzjn6EaDtwtIj3YUjajHtzgZA0eBibTYMOrclNq0I
         Eh2Ev78aqQcRU0ePU4BVzBXBUlGM2sVkroinAgKg4OTzFHucfppHmBSwhdzme3OmkQid
         1AfcZdLZA3qb7HSqeRWyC2Cze+9CJoF+cCGdyPKw5DlbKEvEqpDcJD87nfo8s5EOZLUw
         cZADG4gfJdPSbj11jfNw0CYD2licbONRJmWw7esxVMAxOrZ020l/aceFMY++dILTxxjF
         AyeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770601197; x=1771205997;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7sqY6ei5RD5wGCvV//10Q+1Z4jf+VeHpf+2w+y/9dIM=;
        b=gtpj8m5FB2SBoTOoAqDIwwmDgF1H26pbdNl2GtzP+lX0MHWaiO3adLZg9t24t3jkZu
         CFaWEwtEA9gpotNCzSrOstqbYISDEAXjhawPaD3yC1BWKLumODd4GRC3T4a53fowbsP8
         u7Pbx4XuKmEcI7aWKs24/yzwSM0OD3vtT5Xkf4DeA8IWf9+9BKnGO+NWY76OYwyDsMmC
         23cdu2uYBTm1VquOrsbVSIixwsSGS2tmtzCDdVifWb69sdj2yKoOWNmySJqdNsya/tCL
         wZd5hTieqVBiOrZevVSQVj3ltYsi2kB2o1dh0KhSI1wvYg79JPTrl/ppuVhzjGzJ0QsK
         vsMA==
X-Forwarded-Encrypted: i=1; AJvYcCW39saoaj8dYn9eCJNroNojAunTp25vs5SSgKjPH6INQmi+fBjlOel8MeQu5E/DlJA/YpP/jk0Q80q+8SKI@vger.kernel.org
X-Gm-Message-State: AOJu0YwQFClBVMwdSslHopbuTUCrYY4n3oSmfwkECx2f1+kZVQMC2BZt
	rpLMdzNIh9OzachPUoWsgTPV+MrJBkJ1Yq9l7mqu9Hd28vKKC1HB4PeH4SrtLIxRnRCoWlE/shR
	oRDGohoFIg+8laxZwH8qHbBXhK6+E0E7cP2gA36XV1WjgYhRglgsEeN/mrD4jjtxPirnl
X-Gm-Gg: AZuq6aLty+IpkCG9+uUckXciH5MfQ2Iba3u3XJtyhjXHgCPFbDUIKYegGMlpU2a5YOi
	Y9B10qMmLtisSMlp7KRagNO6ZWT21EKmEupH8zsiX/Og8RsG/uC0RwbGKqWBKM/AkL8ehciCr5b
	G5kRbTs2tsfXhkyJRhVDCWAiFdi3F1vOkTJwRUQbrQ0Iuv7xAErL8PX44Qffst1ZLWwq0jtyEfr
	Ycql25/p4RbfxgXJWlpC3+sZySfjUsgYROoZAfV617dlGo88vcnYWgfu0J3PkSHTTTKx/zz+3OQ
	cd9HRn1yquSMGLxspk9R/xYoIwUEsTXm32Nkf+mLbN7e7Y+aDVXQ/cZEq4tn9jvSbZleKGvE9t3
	TMbDi3LKirPa73lf0cwHmC+vR4kp8Umu9ukll8GFjrxTC3E6/SGuLxT6DFA6ix2AmPCFkucdpTE
	TXK9roKk4kQbKydVE53aYpwR8=
X-Received: by 2002:a05:620a:3909:b0:8c7:f6e:29b7 with SMTP id af79cd13be357-8caf1bc28f7mr1251009885a.80.1770601197457;
        Sun, 08 Feb 2026 17:39:57 -0800 (PST)
X-Received: by 2002:a05:620a:3909:b0:8c7:f6e:29b7 with SMTP id af79cd13be357-8caf1bc28f7mr1251008485a.80.1770601197078;
        Sun, 08 Feb 2026 17:39:57 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-386b6236232sm21901811fa.2.2026.02.08.17.39.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Feb 2026 17:39:56 -0800 (PST)
Date: Mon, 9 Feb 2026 03:39:54 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: srini@kernel.org, linux-arm-msm@vger.kernel.org,
        gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de
Subject: Re: [PATCH v3 3/3] misc: fastrpc: Support mapping
 userspace-allocated buffers
Message-ID: <k2jiy66ruyfh4v5go346e7wa2y6ujxjzl543imq3n3k76z3dju@jvjwm2k543k7>
References: <20251230110225.3655707-1-ekansh.gupta@oss.qualcomm.com>
 <20251230110225.3655707-4-ekansh.gupta@oss.qualcomm.com>
 <z3tktit6jkxrkre4gm666aw3ql3plyhs6266cu2itrbjbj2das@yjp2pyesoszn>
 <69cb2d42-6672-4c42-935f-e3fff9bf38f8@oss.qualcomm.com>
 <33xoq7nt7j3sgcrnxjmbfogrdy3hyskym3yzurmqzwdqxtlgwe@vywpjmegteel>
 <ff888cbf-b1cd-4768-a056-3667f94903d3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ff888cbf-b1cd-4768-a056-3667f94903d3@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: nVK62EuEMFo4wxGEVB_NWZUbo9w9G0nl
X-Proofpoint-GUID: nVK62EuEMFo4wxGEVB_NWZUbo9w9G0nl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDAxMiBTYWx0ZWRfX6RXOwtTNuL0W
 fGvmxBzD9wyjmCX94qbtNje01Nk3M+9Yc6B7o0pt4waeuTKFf1A69BvASjDu6kHGuluPM3I3d6n
 CtX0n0IbhEZ4rqzdVg4+uDUC44zsVI0Uo4nBSEwI8eJaMJy2wmcUxfbdKxpTzmnM4i+96uOrqdG
 cq+DHT6hMVrgs+ybtw3TbPzodec2qKBq5ljW/DkMgCFtQQrFaXXoOQNlwVYYk77+nOIlg4Xw2qa
 Ya0B3WUUMJiNgTKBtctQYsJJ/RwxqdM+xbLon9BOuEqdIKgQbL+5wkj6qNjoAKKy5oTN/DhWK1M
 zVQp5L+IjbZ3boJMWM1OgWwlnr47ufiP4Q7/GmgTpjChi1Oy5dYWGdcOnq0Fer9kupaWaUkJy1z
 GrFjimb51n+d110h7L6BxbZIKz+/qYY3zLnch/7VHa+q+iNX2LfOGI/PdxcmM6GTcVDoh3QyEMx
 ZYe47lQ2jmamZwx9szw==
X-Authority-Analysis: v=2.4 cv=aIb9aL9m c=1 sm=1 tr=0 ts=69893aee cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=9kWgxbULufjU77o8R-YA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-08_05,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 phishscore=0 bulkscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602090012
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92193-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 63C0310AE39
X-Rspamd-Action: no action

On Fri, Jan 30, 2026 at 05:27:37PM +0530, Ekansh Gupta wrote:
> 
> 
> On 1/30/2026 7:59 AM, Dmitry Baryshkov wrote:
> > On Thu, Jan 29, 2026 at 04:09:41PM +0530, Ekansh Gupta wrote:
> >>
> >> On 1/6/2026 8:21 AM, Dmitry Baryshkov wrote:
> >>> On Tue, Dec 30, 2025 at 04:32:25PM +0530, Ekansh Gupta wrote:
> >>>> Currently, FastRPC only supports mapping buffers allocated by the
> >>>> kernel. This limits flexibility for applications that allocate memory
> >>>> in userspace using rpcmem or DMABUF and need to share it with the DSP.
> >>> Hmm, for DMABUF we need _import_ support rather than support for mapping
> >>> of userspace-allocated buffers.
> >>>
> >>>> Add support for mapping and unmapping userspace-allocated buffers to
> >>>> the DSP through SMMU. This includes handling map requests for rpcmem
> >>>> and DMABUF-backed memory and providing corresponding unmap
> >>>> functionality.
> >>> For me this definitely looks like a step back. For drm/accel we are
> >>> going to have GEM-managed buffers only. Why do we need to handle
> >>> userspace-allocated buffers here?
> >> That's correct, GEM-PRIME will handle it properly. Here, the reason to add this
> >> change is to enable routing of DSP logs to HLOS which is done by using a shared
> >> buffer between userspace process and DSP PD. The buffer can be allocated from
> >> both fastrpc driver's DMA-BUF or DMABUF heap(eg. system heap).
> >>
> >> So this shared buffer is getting mapped to both process's IOMMU device and DSP PD
> >> with this change.
> > So, you have the DMA-BUF buffer. Instead of mapping it from userspace
> > with unclean semantics, please import the buffer.
> I'm assuming fastrpc_map_create is sort of importing the buffer by calling
> dma_buf_map_attachment. Is this not the correct understanding? This assumption
> is based on the existing part inside fastrpc_get_args, where fastrpc_map_create is
> getting called for each of user passed DMA-BUF.

I was thinking about dma_buf_attach() rather than
dma_buf_map_attachment().

> 
> Moving to accel based driver is going to standardize this as the .gem_prime_import
> implementation is going to handle this case.
> 
> //Ekansh
> 
> >
> >>>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> >>>> ---
> >>>>  drivers/misc/fastrpc.c | 97 +++++++++++++++++++++++++++++++++++++-----
> >>>>  1 file changed, 86 insertions(+), 11 deletions(-)
> >>>>
> 

-- 
With best wishes
Dmitry

