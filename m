Return-Path: <linux-arm-msm+bounces-91760-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KFU9LJ20gmnwYgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91760-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Feb 2026 03:53:17 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EDE0E1060
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Feb 2026 03:53:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 667623026A9B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Feb 2026 02:53:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD85F2D7DCF;
	Wed,  4 Feb 2026 02:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mooRhu+D";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Kn/aqPrg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AD5F2BEFEE
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Feb 2026 02:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770173587; cv=none; b=OKqFUspcO3QvKptNkgx8rMUMmzEGhl9Rv+Vy2kEidBSO47RzzZIKmq6ihyRKzwDb6wmS4HwPD2t2HRGEgaCQ3PtOvraM9Agaagsb0QPUi2wqeZmsXR9e6PX5/bIPPp/C3OmCpUzlQ5K08Uu7nOrNTjt+uw62RR2lMDsh0of5I5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770173587; c=relaxed/simple;
	bh=6w6PRNXkhZdK4bZqKescLjebtZA4BALjOzj9GsjYgh4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F3gBJrikVovlOjxfKfRuoGzR03BdWxxIiK2ZF/sduVkWRyRuBGdcnjK2YOmBjakcnpn1F91QFQsrxr9A6JmBlZpTSnxHiATqGFxS3Ap+b+NreLAK84j0IRPYGrYfLTm0qdAKHzCYU+9fOJeWcJNUzWh1b2WgGY3J/R7RJBBRcGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mooRhu+D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Kn/aqPrg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 613IloCp4122766
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Feb 2026 02:53:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jbKJwXctHqVCMfa4Vxs5ilJA
	ib+vhhyF/HXY/PQ3uuI=; b=mooRhu+D14OvJsm79bSmmVp79mX1c7qvR9Sj3nkJ
	1AMly/KHxk1KiHs1VpY3bOlHTH6PVcnyB4AZbLWqVrO7P4CKOZ/VTBFJmibG6n13
	HLyij4aFZBO3U4QBE+SLfhx171QI0jHYVEfiX3p5M5y2Q0K41Vok4OWpM/Y7MtCP
	43l374TtzUfzeACm7K0SSz3LJcC55dxK0W1xH/W5iLixprX6mYXY+sHxfdBg2AtY
	wUNnWa7RpbwktYb8ZIjhEnx38YvVWkXF4uLwAmbNfXWQLu6i0lEX2NuDdXfsRcLr
	TobNIEtp/yBOKkUSY5IQvBN7pAOg+eeQ4slfqdeDrmZ6mw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c3kbkj8gs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Feb 2026 02:53:05 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-502a4aca949so321013561cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 18:53:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770173585; x=1770778385; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jbKJwXctHqVCMfa4Vxs5ilJAib+vhhyF/HXY/PQ3uuI=;
        b=Kn/aqPrgakpdEfW1pM47sUG1V7m2bnFo//ige+vW3YICCJWqwgdj13qSMI5TJxVli0
         oVAD7ZwJ3qlwUEpwj8E/mRv0KhuCPZgKtxerXitTBfFLj5hzBuGei34ZioHxr3CcVXBp
         eUC5lV/oDxGfuSOyvwu+HWJ+zlxyg8Aa+vSePis6woPH/UthHmxg1bqKzDBMpn2XAmQq
         rGJHupfw9zR4tnWAe19p7tRA8CdKbhpBtipcdE3DcvQiB29XFXqSfgG7CRe9EcFyS6DC
         P6EuOHwYkbW9GWsvRfq/LuIW4ZsPomUJMFKDn7lGUcoQNNvZ+/k7hwPZ6OcYVvtfM+4R
         /DUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770173585; x=1770778385;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jbKJwXctHqVCMfa4Vxs5ilJAib+vhhyF/HXY/PQ3uuI=;
        b=R6krX8Jmya+mHy1+49OX/rAYObsno2s2Kk4BqgMrRML0Z49EZpnkZx4EBd3H9malnc
         wnVTdZnn3MI2YIywBrVNbsSNGn7aNT6IV2zkshKXeYkJXbWJH/zpWU5S9xZKnAzgbWhl
         CvB/uyYHqVXwty4UzLXEtzkjNwoN2jwsnbpR7EcuPcAzDHNXBtWuAAFjCk20GBZiID2q
         mMsx9vzKIFNN89mXKlFDztLpcRzis6EaZqPbRGwaP5k+tWYLrKmfh1u0BFFUxHJjxgnq
         rZ6+kDskCyx/2s/ci6PFqcPFrXmfwltinudgWVHsAzMircKBPysKgyfxdD2wWe8ospfo
         2VRA==
X-Forwarded-Encrypted: i=1; AJvYcCUW8cnDGpBXsOBuA5/nML1vG9g1BXHSJPtAC1i0h8duHz8KlcQnCRrOCqWNYPiBWKVcHA/PXbL4SJ0loqMl@vger.kernel.org
X-Gm-Message-State: AOJu0YyQvPQMars36Xm2dKHpKPicPbhhZXT78hrYvnPmJIYCD4kXsm2W
	mNgBUOV0pwqk+nzAUEK729mrBi7V9YN4KJL47rttM9ow/Le7n7YuAjNVuYC/db0LeTrD2l0Rp09
	fQaPupr+TsOoJ7HWKktknhoiq7M9ThuULEGIkk+RBddrTVC+SJdkR4TMvMTkIkmju6tmw
X-Gm-Gg: AZuq6aIkvHdYhQgG7uj6ugpiqAmXDRzjuvcwtw7O4rq5oLdTWzJuAMWnsdhC68oP2RW
	zbk2mhsuY8voMuWCz8CeN5gkxjbM9p1j49/OoVXuv45Jkb1qrD9aC6KyoNnE6ugvm89oL8SC9Gz
	2yJ3FvMEDr/WEvJQwIyZP85PcEHEpOxpfmVpiD3j0NSgKtB1Ec9kWrtRs7DkJCZSlT0wOw+3z2H
	Yq5nzKbFs+etEaAPq0RH8sv0uJ2n4XZzMwvoC0vJF0zbtcaPShYQdjpTVV6UW/kR2EZ72EnuJeg
	851mOQgxfOKp9YOzymexh0yrfb7NqvFt9tqGBg1XRqmP44Rk1nYCc9CPLXPjXTbDn0EToBOCSm4
	oRuxLyAhvWnnrHrIyhR/3EkSXQLA8Qfxvx9N9q2i6fMl91q46DmPZ6ab1N5uU7Qi0f/l6FkJJIQ
	ZBcWbfuXrIacbFi6QhXa5r5g0=
X-Received: by 2002:a05:620a:290c:b0:8c6:e07f:a050 with SMTP id af79cd13be357-8ca2f9dc5b9mr228963085a.75.1770173584708;
        Tue, 03 Feb 2026 18:53:04 -0800 (PST)
X-Received: by 2002:a05:620a:290c:b0:8c6:e07f:a050 with SMTP id af79cd13be357-8ca2f9dc5b9mr228960585a.75.1770173584096;
        Tue, 03 Feb 2026 18:53:04 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38691f9eaf0sm2357331fa.19.2026.02.03.18.53.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 18:53:02 -0800 (PST)
Date: Wed, 4 Feb 2026 04:52:59 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: srini@kernel.org, linux-arm-msm@vger.kernel.org,
        gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de,
        konrad.dybcio@oss.qualcomm.com
Subject: Re: [PATCH v5 3/4] misc: fastrpc: Expand context ID mask for DSP
 polling mode support
Message-ID: <mfhksjaoyazrbbkdjamn4zvg244mvehburtl4qz7gybjgnp6y6@jicyk73fn46j>
References: <20251230062831.1195116-1-ekansh.gupta@oss.qualcomm.com>
 <20251230062831.1195116-4-ekansh.gupta@oss.qualcomm.com>
 <xrudy7p267tuu6q5qrndw35677noevqq23zooxmsacxlswzpub@2cqtvc6e3aw4>
 <37e2876f-6998-4e79-8696-c7f97307a28f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <37e2876f-6998-4e79-8696-c7f97307a28f@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 9i4yD12rZZ7ACUb5oHNEZ9gP5I6n9YVu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDAxOCBTYWx0ZWRfX3tmi2jFHcBBd
 J6GDwXk6vxmpeWQRkZukk212zdfFERLdaPZ0hyihtJ33A4FREz2dKqNE1oz3UOk6IH3b7AWv5mt
 foRUBfJgh/hojuMdtvzS+ieMvC+dih1zH/c6dnEMjB+sLpYumv4YSpoptQ3J2cRAE43g5BQXQ0m
 2hM4IHMYhc7827e0ngmLh+kGuwXWg6Za5JDzTAlP93amei+OQKHCr/g9cI8CpwT61Cu6vab5pPw
 k5hbmyo8aBf5k5gGRetisBwETwmXyFqHOiPO03WBHs5eqLgz9cNGjqdiJApHbGrSXb+Ro0iPJbz
 5ybFOewcNdOMZ54Qe3ViiFtUF2sR5F8Xgo/1leEWttbs9VMZjwqM+S00z5IOdq/1dt/wp/DlpBf
 8aOX+KUQOrcZtnlFuMG+yxLT0gZ2RxiEKC8UdkfF2XWOzn6x/QU3vtCA80IkQNwVuyfCy3mRHTi
 g5n5W1o//IoWyjPR1PA==
X-Authority-Analysis: v=2.4 cv=BKy+bVQG c=1 sm=1 tr=0 ts=6982b491 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=8iDC8G_LTYsPp_hLZygA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: 9i4yD12rZZ7ACUb5oHNEZ9gP5I6n9YVu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_07,2026-02-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 bulkscore=0 spamscore=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602040018
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91760-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4EDE0E1060
X-Rspamd-Action: no action

On Thu, Jan 29, 2026 at 03:56:55PM +0530, Ekansh Gupta wrote:
> 
> 
> On 1/6/2026 8:23 AM, Dmitry Baryshkov wrote:
> > On Tue, Dec 30, 2025 at 11:58:30AM +0530, Ekansh Gupta wrote:
> >> Current FastRPC context uses a 12-bit mask:
> >>   [ID(8 bits)][PD type(4 bits)] = GENMASK(11, 4)
> > Is it Linux-only representation or is it also used by the DSP? Will it
> > work with MSM8916?
> Apologies for the delay in response, had to go back to check on older DSP software.
> 
> DSP will also use this but it handled properly across platforms. DSP get PD details from PD bits
> and mask it to use further for async call checks. Other than async call check, the context ID is
> majorly used for book-keeping on DSP side(no functional utility).
> 
> So, it should also work on MSM8916,

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



> >
> >> This works for normal calls but fails for DSP polling mode.
> >> Polling mode expects a 16-bit layout:
> >>   [15:8] = context ID (8 bits)
> >>   [7:5]  = reserved
> >>   [4]    = async mode bit
> >>   [3:0]  = PD type (4 bits)
> >>
> >> If async bit (bit 4) is set, DSP disables polling. With current
> >> mask, odd IDs can set this bit, causing DSP to skip poll updates.
> >>
> >> Update FASTRPC_CTXID_MASK to GENMASK(15, 8) so IDs occupy upper
> >> byte and lower byte is left for DSP flags and PD type.
> >>
> >> Reserved bits remain unused. This change is compatible with
> >> polling mode and does not break non-polling behavior.
> >>
> >> Bit layout:
> >>   [15:8] = CCCCCCCC (context ID)
> >>   [7:5]  = xxx (reserved)
> >>   [4]    = A (async mode)
> >>   [3:0]  = PPPP (PD type)
> >>
> >> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> >> ---
> >>  drivers/misc/fastrpc.c | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> 

-- 
With best wishes
Dmitry

