Return-Path: <linux-arm-msm+bounces-107397-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eKHkENWzBGo9NQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107397-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 19:24:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F698537F6D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 19:24:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 449DC31FF685
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 16:53:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBFD848B38F;
	Wed, 13 May 2026 16:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VqcTOxGY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G8IuId08"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8814D3D4132
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 16:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778691192; cv=none; b=een2d9KfVHOEHHOcscKp8DiM6V+HSHkTrmuAyfzTAnUFNUQHI+SIlAV5TT6y9Fge5s+aZB1/seksZX62eLiy3uo3KjwVWu0WLAj1TqQTlZoBLV7ngb+Ls/1myRs9kTV7xZXmj3wR3F5OQqLyFzuAdnPsMk3nTlNC5ivLKfv2cgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778691192; c=relaxed/simple;
	bh=HpqdRvguomuoFu8cYA9HoqXvq7sfUqnGJaGKOQnfdKE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lj2Mz6zs6EBkFiYkoW/4qe2UWSYqVPhG2JGbjV3xyMzo7A5JAj3MaK26pYhEYXhGobXcmxN/ETvubNxNI5oaiwOtBphb9CWiG3xCVoGWshoGXMAkNnPPguzVJqZ78eb5UyaHJC1+G9ZlPMUN655xbJD61MNFO3TP64B7XvjcALA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VqcTOxGY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G8IuId08; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DEnNFY4159621
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 16:53:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZOuwO8Oe7+fhFiUNtPbUZRGD
	3ndfLf9Y9W/ejus3N+4=; b=VqcTOxGY8MgLhpL7QdJ7no1pbuPJqDQSDCOQZvYM
	mMv2QA+Iibd/P3kLfEp/Ky0P4VHfBddRiB/PPRujgkEMFpfPetiBU6hWAsdCxFIR
	8Ut7dqpEQwHYBfUyicHI/0cWX9KFNFZE8rT3VOCjQcL8m9+BfElsdQUsIATm1skS
	pjqwAgJ3ViXZjsjoVldeMz5idJoo0ZkjKbBATknvuPAPXU97jAjlkJH4mqR05W1q
	VnYqmW12Qt9uGodhMDo4ORsMNGmV9eXSkRflCsy1J/r6OmTNtqFcMmFHAlhVr5RO
	81+YfJ1nhuBpv3IM31e6/dco5ewo+GlxS3b6PQ639X3PqQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4p91sw1m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 16:53:10 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50fb6d713ddso38291211cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 09:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778691190; x=1779295990; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZOuwO8Oe7+fhFiUNtPbUZRGD3ndfLf9Y9W/ejus3N+4=;
        b=G8IuId08ObAnWvUyw6BGW3eDsl6rDXV6579xmr+OzC+iY5ZT/hyFsbYUY4Wcg2vUXy
         /9t9Nbvs1kuLKXbYeKqZ3tWsVNr1+ymQ2n9Rt/FAvXrWEnZlgdFmmKUhpHfBBNIQE0l8
         PbWWoD7udujYn89QDXfQEPYJojhknhmAwLwimT2Lzy1dwXL8//TwnxT5TkYwbgp75/3O
         a7W7v0mbuuNdt+b/IVkePhbz+5C9R3aHDjrbxVvCevs2kgvRp/iz1WDsah+2G4aIZEMy
         TsdxuVuKDHiudGGRD12Q8KnaJ8eeOD6F+ero1VGuEeZAdmKmfBWSJjPtG33t5PEuEJRF
         EErQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778691190; x=1779295990;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZOuwO8Oe7+fhFiUNtPbUZRGD3ndfLf9Y9W/ejus3N+4=;
        b=k/NsO8zMmP+HYxccn1znp7/1FquXFYVbXoi/jMibcHLr8lke8uOjBjcGRcMZViQ5jU
         DfrsSREP0/mIfI6yA8utNDBFQ8jrU6NKSKsqROhngwrtHP4Jyf96DrU+54Mx62QEx/jo
         w0q3ajEwD+VH7UavvwlJZKkmkDek9CDaOP473MOa66Zj27Z/+oF36mWCyGsz1PD3SH6G
         FCMt4fGcU+2MranC9P09qrIADrb65X4k5d9/FTmmr+WPLMRbSIeUGdtDqePV7BLjYmq9
         0mhqfHANowJTJ16mFi9ft9bI/Hop7IRbN2xzbyMJqpir3j3O90Izezwuekf5dcEJmzAJ
         jkrQ==
X-Forwarded-Encrypted: i=1; AFNElJ80IHE06+tlKVYXknr0+NyKGTM9Kr03n8JjaLsnjtptxPnhk0J71RJexO9OyMT5se71yBrl0vWy0EhowuhR@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3or0TQzwIxtOwKcjHUTqmnp0XxoDme4R41fpNvZr3Mff3lNa3
	DWKBf9POGSQjMHTsk1JHLjSHgthVaTxsT7s+2mLB1VPGZMRrHcOqwyUnQrW3cBWnlbWCjGdc01s
	bi+MEpz5k9g+j5cHm/6uHaaDIp3bvRmyArEHBluHH83NuHO3/HSfiB7MZGQQl0T9QlPQl
X-Gm-Gg: Acq92OEeC/CnwBdhgsoavKRhK+ifdATea/gawb8H4zNoKveJW13UOVIK27mfXYqxrOf
	qFZcTOcJLScuGIjcRQT6cSL/BLTQpdpDEQvrjdQgVm8EItKszihUTIzL7jkefzBzJkuq5do0f9t
	cBvpmUYw4nx3wX/fmMeQzPpye8O2Iug+pyI/eQ/mKN7Vt8czbam3fZtzdEp+MoJzINHrIcWD3cw
	d8Bk/DaBSO6qf1gTVg2iEB1mF5jUUNBmEDmUhCsejV2Gp47EfCXJyoqrGqL5/2+DsFebqU144bj
	eJctWLLsE2Y2pR3L0F1+7I1TzTmvWkeZns6AkZ9Y72OHKc2ZmO/7rTucRw/hY/3PIkek5btmHxf
	lkJseJiQnspUHFZNk8km5QvuBnOMrXY/BAH2MLnKhIJDMmrODt78bXE+e4mVSnXXdX+8nfpHGPj
	iweZVSeA8od82izUyQaNbUePRt/CSa0VPmQUE=
X-Received: by 2002:a05:622a:5912:b0:50d:7384:a660 with SMTP id d75a77b69052e-5162f43f2fdmr54430701cf.6.1778691189690;
        Wed, 13 May 2026 09:53:09 -0700 (PDT)
X-Received: by 2002:a05:622a:5912:b0:50d:7384:a660 with SMTP id d75a77b69052e-5162f43f2fdmr54429961cf.6.1778691189063;
        Wed, 13 May 2026 09:53:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f628a724sm40620501fa.39.2026.05.13.09.53.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 09:53:08 -0700 (PDT)
Date: Wed, 13 May 2026 19:53:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 5/8] arm64: dts: qcom: Add GPU support for Kaanapali
Message-ID: <hdpvs6gftjhaa2xx3r3ds6ss44bvytnllv2lg6anoiq2iyxwtc@qd7ejefkxmwk>
References: <20260512-kaana-gpu-dt-v1-0-13e1c07c2050@oss.qualcomm.com>
 <20260512-kaana-gpu-dt-v1-5-13e1c07c2050@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260512-kaana-gpu-dt-v1-5-13e1c07c2050@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 127O8GfUelRBkFUyKjGrhyct6g2wPB_I
X-Proofpoint-GUID: 127O8GfUelRBkFUyKjGrhyct6g2wPB_I
X-Authority-Analysis: v=2.4 cv=G9Ys1dk5 c=1 sm=1 tr=0 ts=6a04ac76 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=XJtuOP1FUQBXJGSJDRYA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE3MCBTYWx0ZWRfX7Q1U0oDwqQbb
 IM9qCu9sxiAmVZTAxLO63O4gABS7GVk9C1RsHGjOMNmpT8cDbQIM1W1IVo0KGONGL3DA9rf8k0h
 LU4RbilVURT3tcACWPXOKRiIMqT1G/NOAHR3LpM5+b3q/X9YDtGb0gnY83lA5A0+PZBWL+vLUws
 B2M3zZC/ChgbztF8zZyvvZwbc45+/j18VltTvqJBYbGDtwRpSqFxRqutCsPiK6vxm7w3ajw8PoZ
 3yYmG5oN2i/APxfuRl0l9IDjPxq3qruFAFu5/XePluHMSsttqVMTQb5xAcJZsncYMCO//TURuSv
 rKOI9r9oZIo45VmFH1mdNfgjLFfsIzxiBtdPWXtrazEsYRjckZUvp8JL0nJTz03wePmcwiBo5BB
 QuRAbZaAUuHRsuYLDUjT2u09dExUF7V0XkXuVod5V8WI0yjPOduNoEPMggM6fVMvuV3Luf5Z+v9
 6qz6ekcykqPB9RQSb+w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 spamscore=0 phishscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605130170
X-Rspamd-Queue-Id: 9F698537F6D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107397-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[27];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,arm.com,8bytes.org,oss.qualcomm.com,linux.dev,gmail.com,somainline.org,linux.intel.com,suse.de,ffwll.ch,poorly.run,lists.infradead.org,lists.linux.dev,vger.kernel.org,lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Tue, May 12, 2026 at 03:53:19AM +0530, Akhil P Oommen wrote:
> Adreno 840 present in Kaanapali SoC is the second generation GPU in
> A8x family. It is based on the new slice architecture with 3 slices,
> higher GMEM/caches etc.
> 
> There is some re-arrangement in the reglist to properly cover maximum
> register region. Other than this, the DT description is mostly similar
> to the existing chipsets except the OPP tables.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kaanapali.dtsi | 232 ++++++++++++++++++++++++++++++++
>  1 file changed, 232 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

