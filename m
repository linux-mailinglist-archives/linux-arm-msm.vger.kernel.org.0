Return-Path: <linux-arm-msm+bounces-113174-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PmfHFPPvL2pYJQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113174-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 14:28:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A89AF68632E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 14:28:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=bp77X5vD;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Bbs7ONnv;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113174-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113174-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4ECE8304DBA4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 12:23:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4D5A1ACED5;
	Mon, 15 Jun 2026 12:23:25 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9957833DEFE
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 12:23:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781526205; cv=none; b=bO54t5XMMUPh6+KD1fyPYF+2HvomRur8u9xl6Z6AdZjH4bMn97BSTowRmffAmQX5bXtmv2uazwNFyX5rAo+ykf1Tun6/ze+xXi2rSf2FgSuheBone18BsasnnYL/dg0gkC7B72fAuT1gos8gAJ/vQeSvtXqcthqwIvRwvUKhCGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781526205; c=relaxed/simple;
	bh=8PeQBj34V5c0RfITfinu1f6KT50KbVyD4JOtxTy+Nho=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DAlvHEIF5z2Dy5TF6s0ERag7I3XilrjsQE/u72pZrcSJz5wGMRz5hNL5CR63WPKLUF3TerU+DUlCZUuS1BG1hlfqC6lvFwQveYXTMNMbMunnANn+JxK+Puh3niohhLoZY4RDfcnWLI9X2v/jjzJmAR7HfCRdQaxkEOUjc+KldvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bp77X5vD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bbs7ONnv; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FAoNZE3983287
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 12:23:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E7sv372Yo1BuVVOPLRYh56YSH/Q4RtdRYSnzm2ofdy4=; b=bp77X5vDkcJ9TRlO
	306T0sfA9nlwh8v+9OgMwcah6LrWn5ena05Z1+Gbh18jWOaHLsnmbNJXJKOw3mG1
	CZ2t0VZhQ3s+MnPK0zv1ZfxsI2DbZbaP0putJQ7rdDkdIRaiC1UPSv6eH9NxdwX/
	qplscIVCNHWxXIY5EacmiFTruZG5g7mhF/p8nNxiX0Ok1yGCHVNynp+KLrw/4MuQ
	Ha8n6zfKWfEOSyBBEGAUFfojV9GtGMSIxihBcVLda92LtsdWhZdaY0is6uMrtPRq
	XWecAClUyFeteVMKEHWVmoFNWEJNi/UNngE4sNGPYJ1WfgGax4hQo+e7KIhaqzrF
	k2xwFQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etfa70ghp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 12:23:23 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-915b6b63056so662219085a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 05:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781526203; x=1782131003; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=E7sv372Yo1BuVVOPLRYh56YSH/Q4RtdRYSnzm2ofdy4=;
        b=Bbs7ONnvzZ41NO8AQ8PLtqE9J/c4RZ8RW3JMMg8EQ3vFLGqSddEhJ7MxF9DX24nomU
         koKChcMB2kBRsY1zQdHiEe0FzxISADuTT7YQYHCUidgWG3SlfqHgvBJ8MZenOyW95V8/
         dSmHV759misNO6wPib13DjfrLlrowCl7xMCMyCxqbnfKOhW7hhJ1SF0F9mc9vOecWJL3
         tfgztMqfaRjaOH+4NFdH5/Qxt+5+hMHz/oBzRDpulM0EXNJCxAxIKYJbBzs/FyHFxrwd
         CuO+8gyZ2bVouA7c511eqb07zQ8kOLlFN212O3JYO0tqYXoN2g7ZzwbFUwzewwrOcbeQ
         SO2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781526203; x=1782131003;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E7sv372Yo1BuVVOPLRYh56YSH/Q4RtdRYSnzm2ofdy4=;
        b=iM5bg7blxUUhXEO586j94shJCT8ztgBz9R7gljD8DWNdsWMshhTDZZC+aaDTS8cv1r
         VOqwiBQ4pvh6PIhpe/qy1yAEm73TKBOExfiAVmZqRnd9KRAz8jg82q+jD68vLRfLYi+Y
         YqVLXjcX6VYg1leq2/9VS3JJnrnPgzaggiRTWrXcarX4sympjnKv1rxpmhto5epGGDSl
         D2FHkL9rXgWUz6Wn5u3iDE6uEDnTDqyU5p/VeU8mBlTt7hBzh1KGhy5C802nU0S67dUD
         +QhrqI+atRBNKxwxFC2CgHlIMPWDuDfaglyPU69m9vZ2mSsxdVO04B8Jz8uxCcD4aWcW
         Py1Q==
X-Forwarded-Encrypted: i=1; AFNElJ+bCr5CyzpqvRI6VvJkmlFFshdvq4Qr5NV+2VGbTx0NSKz7cF6Ve3GPEVQnETQO02a6APC4SAyNGy8brn1y@vger.kernel.org
X-Gm-Message-State: AOJu0Yzoy3lRkPnFkabtGqH1CG5d2s+Zofxh5hHQHgj5mtc6EtHCXuQw
	RieU6dl5a9STTJsNrNvffAcqjpWGN1ALhbHzqvjZpNXc3jNYlVET9mhK1kUkHZqoE/YF/9E/NVR
	FNE4C03DN2+G8CCXeRZjyDiousm8RY1U+l+opiom/8cUXXrwK3IcEk+hm0jhq5bEjWORo
X-Gm-Gg: Acq92OEy+YPDT3G06eei8g8hOnq7Yxj5I+eUD4jUuzy4Fsivq1hysPsiFTEb+Bcjtu5
	/0c4j0mlEQ1LLMVPgmLarnFoXtDyXsnQ/xrou9tpq/sVi26OkgXEBDVjpkZeaHKsAhYxV6rnjaN
	JSkxhVjkDmTle03tpoO2R5cMIpQRt5d+WDh1a/SNUGCP5BHfeuNE7AMdO0XLUFuaiiERQXaz09Z
	Ksf2AjDiO8Q4zNm/o1DSZDFnL8/eh6k1b8+9yhOS0/brIFD7uuWS2S7k/rA/taDEDe869pvEJvj
	/VJ43W4sGaR/YFh0zeIvzLurhjKEC4orx8RcWWCulR6Jx7RtC2N8v4Jqu6tIBbeGS77Ar82JhSC
	9/bircZQQJFTBf2O0/NDqfzYWLY8Rke9SwkRyJFJ5Guz1j/eaA2G0dSBGcq+8o11eb9bx6j8sho
	CBqqgjofhBS+JwF0MQMiptjMFtEdHC6xrmv3E=
X-Received: by 2002:a05:620a:269e:b0:915:3d27:a816 with SMTP id af79cd13be357-9161bd388b8mr1960981085a.49.1781526202955;
        Mon, 15 Jun 2026 05:23:22 -0700 (PDT)
X-Received: by 2002:a05:620a:269e:b0:915:3d27:a816 with SMTP id af79cd13be357-9161bd388b8mr1960975485a.49.1781526202441;
        Mon, 15 Jun 2026 05:23:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e1b3253sm2757033e87.68.2026.06.15.05.23.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 05:23:21 -0700 (PDT)
Date: Mon, 15 Jun 2026 15:23:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] spi: qcom-geni: Add property to force GSI mode
Message-ID: <q4t5f4aiapowojbz2vh7qmcwvia56gc6ytzj3rys7ingisubid@ddlwb3qi5zdg>
References: <20260614083424.464132-1-mitltlatltl@gmail.com>
 <20260614083424.464132-2-mitltlatltl@gmail.com>
 <qwbda435on6rhsbf5o4jqijakanjmnmswnc6g6qsubuqbyvbok@fuoclv6u7tq5>
 <CAH2e8h5Swn2mWoz+t_nrSw1=hQttwi1Hx=dg=cd9S3QRnHjpSQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAH2e8h5Swn2mWoz+t_nrSw1=hQttwi1Hx=dg=cd9S3QRnHjpSQ@mail.gmail.com>
X-Proofpoint-ORIG-GUID: 2QxY16aN_2wYEq73hA3KmjiHwOahw1je
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDEzMSBTYWx0ZWRfX3KiNu9E2QPzj
 et7YUPmJ0RtJC7fsBhXE30HEHcQyyhMg2yZUwrhUUcExs2e3DLpbAWuAQoLAI3A/ofRgOnWPeN4
 uw+ioRSGGE37MQm45dEckS2VdYVoPbo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDEzMSBTYWx0ZWRfX2mBjw3xsIu/e
 hRiyOJzJB3+0sYYATTwBjvRZywyzyNBq9GeAbBuF8BfW++Mr3gZhDETupUerBC3PrX4NDrRWAri
 uDTzpFp69d+xV0Hg065CWtQAuEJR3P++yftxynjqMneYBgapaFikOjPppcbcasZZ4g4/OyZvbe3
 9GUrMpS8tjxCdHEwBu2mFZeBW9OMbp5BoE0QPKVPyON6QOG3pJPbwU3bceoSyvFvFSOR4uHSDiu
 1EUUEzo40oOogF4SqPOfXiEOJ/yCnzixn5ytWx9AiynkEw5XMxQmryyF50puaB3uvxiSVwqn/BU
 HVkjHBUtUS9KsQH9B6k9q+/tCHOztoEP85MSFzOVaRv9uPYa94RDGVE3P/1xcTTv3cbNP+XGgon
 c6vsQvVnclAH6qQkdD3+cSmx6QtAuy0QR4z79yH4HindAud1T9pCB1mKHjYHXafn//13Zqpwp9w
 Vq7uM3Im0Sk2Uo/gTJw==
X-Proofpoint-GUID: 2QxY16aN_2wYEq73hA3KmjiHwOahw1je
X-Authority-Analysis: v=2.4 cv=AN2yTM5Z c=1 sm=1 tr=0 ts=6a2feebb cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=pGLkceISAAAA:8 a=Gh1C-VzVOIyvPQshHAMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_03,2026-06-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150131
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-113174-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:mitltlatltl@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:agross@kernel.org,m:andersson@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-spi@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A89AF68632E

On Mon, Jun 15, 2026 at 12:25:32PM +0800, Pengyu Luo wrote:
> On Mon, Jun 15, 2026 at 5:18 AM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > On Sun, Jun 14, 2026 at 04:34:24PM +0800, Pengyu Luo wrote:
> > > Some devices (such as gaokun3) do not disable FIFO mode, causing the
> > > driver to fallback to FIFO mode by default. However, these platforms
> > > also support GSI mode, which is highly preferred for certain
> > > peripherals like SPI touchscreens to improve performance.
> > >
> > > Introduce the "qcom,force-gsi-mode" device property to hint and force
> > > the controller into GSI mode during initialization.
> >
> > Ideally, this should be decided by the SPI controller based on the
> > requirements. Another option would be to prefer GSI for all transfers if
> > it is available, ignoring the FIFO even if it is not disabled.
> >
> 
> I have read reviews. Can we check if the compatible
> "qcom,sm6350-gpi-dma" is in DT? If the gpi dma controller is
> presented, then we enable GSI mode.

Can we just check for the dmas property? If it is present and if we
could get DMA channels, then GSI DMA is available.

> 
> Best wishes,
> Pengyu
> 
> > >
> > > Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> > > ---
> > >  drivers/spi/spi-geni-qcom.c | 7 +++++++
> > >  1 file changed, 7 insertions(+)
> > >
> >
> > --
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry

