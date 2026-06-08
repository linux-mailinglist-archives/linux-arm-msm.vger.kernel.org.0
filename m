Return-Path: <linux-arm-msm+bounces-111716-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id eRPgNvFuJmrYWQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111716-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 09:27:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 45483653882
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 09:27:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=UFK2ZDtO;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=drMLi6IT;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111716-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111716-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4FC5B300F185
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 07:27:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DF8C38E135;
	Mon,  8 Jun 2026 07:27:42 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1F851E2858
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 07:27:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780903662; cv=none; b=j45qbKqbEZvyb1N5dMzdNFcNneCisG/cKzwJU/CRYHqyRe+qixTEvQnWPEz2/PsdbmuuvfHxUgPp984Z87I8ZL7bmZi22vWzCSXXQm/E68YN8EAcRxS7jHClQtlYIEV6Wewi+ZApuPBmFN0gwPmvnF9R5nrOZ0Ug3cIOtC8LJww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780903662; c=relaxed/simple;
	bh=fTPIV+oI3kYh0LEXnonxVmZ78pGC/tfuXM2+uajj7eA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cb/zd+QKLuC/ObNzhg0cIxoCFKSrQSslHMTe+JyyszRZBCPyaX4QNTK8mboHvWFfnMSCCalf6beBAWrvgMe8mgaLtUWL9Pv4e+PnB/3cY+YXK6R/rRkGEAL765O0qKz7Umi6ZvhI+CAMglfwKi2PcO53BoOZAqU2Kdxfa8zwiy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UFK2ZDtO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=drMLi6IT; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6586RWnp2833464
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 07:27:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ax7ZDiTzszcIi/HuEDx2EHk3
	5sqUAKxKqotM2jS+F0Y=; b=UFK2ZDtOeglH1uvzuaaUpUFjLBT9cpMnLjnhlL5P
	8biTVhO5bYgNAMNoGQmNK47QdWIhJNeQmU3UvVyySOLmqjarHsqXMheYj0pQtYMl
	WvpF9glwU1jIqX107xbupkhfCzp2VMdZS09z6Z+zWDe10nrpnBn05ssOI3OY0nQE
	ix+uzdm/XfBwV01jZiincVByVFlXuwMg/QG7c1kJ755ZaZ+qHn7UN+vAxmz6zZOT
	4u/Bse/J2HX6qBH/6pSHHLyGHUN3sKJW4Gmvb1Od8wwvc1i6l2602+4VL4+95eIx
	2/lSNUXzRS/AxYCr9MaoFdM3Vlc0cyqA7W7ONPqYHIExWA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emaj4xtbm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 07:27:39 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-6c6dc39a6afso2169088137.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 00:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780903659; x=1781508459; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ax7ZDiTzszcIi/HuEDx2EHk35sqUAKxKqotM2jS+F0Y=;
        b=drMLi6ITtd66u71HnMv5ojEJfcWCkCZIehuwvet2UHd6V4Qa6jb/ZqVQstMq8nVm24
         7bCkojHSEy/GR50W2UDBsnHY/lPXR6+uP1n0H2ajIvf87vpk+yZ0Y/zcTiHL8xLP4Fj3
         gYtq0gLOeW5nNHSx0nxDQq/RmjG7qURw3WCOHMmqNFsGQmJEsDXCwJSgONAYUAREAeJX
         hOcs89IOQSIjLzmHDvMZXGyZE//sqdWDzwced7mIWiYM8ppOKF4kl4K7SPPCQKMYhXLl
         57ua0bZs8FbGGu0zlkBqVFKfwbSq9KIfG/ntkRceqVWb+rw9pAqgmPdgd1YeS2yrlJjj
         Px9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780903659; x=1781508459;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ax7ZDiTzszcIi/HuEDx2EHk35sqUAKxKqotM2jS+F0Y=;
        b=NupNgp0Jf8nK/kmp1jM1l3a5m3qnu62TBZyQQWJdaUHLvZXi0gB4aZQRFlTFRCeCaX
         pGjNyBM31r8RcOnBep2QhYxIs0NI9LiNhRt3iNC/pC7+NsudW/obOhjvMCE841Mtpgrx
         fym0w4jpHv9fD7Q0DkOEKdNrHbF9P3OFqADTv/IeVt1gHFg+J0P/D4Pu2v4Sa7RJ4+j/
         QvgUd29ZDo3Np6qaTTtLZ8hAnOqZW45bkw/GFAvxfU4JEIp8S841OXCqgf6SS1KMDLx0
         CpSDQ5Qvawo+lasyjxUhBxuCVlfxa3dZCoAthwK8Xw7raCqhX1UC9aCqKGQtgkBDlLmF
         sAOg==
X-Forwarded-Encrypted: i=1; AFNElJ/tggNsKyG6bleT0vAnpfAuBGwwxSWWKO0pNbsX5QuUxyGVWVWfipyUgiO5GDaCl/XdMffzLK6SY5WeUh0D@vger.kernel.org
X-Gm-Message-State: AOJu0YwFR18Cdj7u5HLpAOPPTbd/Y2j453h5lGMqXEgGxxNoAzKeQmdN
	WV9ZCNE86jZUGgz18TSWfb9StrHTg5LzfL1d3bY/vLzgZkm1/PKuOFTpPGJshYkPqcKHGfNrSRp
	qIQt0Mn0L67x+1//HcoRW2+Byg/a/ekhAz49ajmK8+UN6L6oji/c7Vqi4LLy+MZ+u1xib
X-Gm-Gg: Acq92OGGTM8UqAg/giHbnBL7ydGrEUmsk3mWWatZJhHxXZxxLOMWTg97aVyoWLYt/ID
	BInIPMLsnLUj4lUcn8XXZjhO6RWSt3CtSSTrdeb98Fiuo5DXVN7T2qhRVyc76uutqWWj8RHmRn4
	5ncraUM7fMgGBWIOYEb23DSa8MxZc5oGrB9mQTtBspwpM/wl0hH8edWWQdn7GLpQ3nMayW7VuN0
	EPhO038oqpSUUm+RLR7iGy+gV9bUz1ZxyHCSyvZQhhBRWqor8wvOowhA4ZO0npwvQUBqYbQXTV4
	zoQY9N37uGyrowOk2X+Rn7McHkpLo6sF+Jb6lzoJRpDb2fpZ10uAtjAa/75aN81RGhHjw38zhF+
	JZ1Erzrd0yurPlhqjo1uWpnRZ51LWfrJQVf8iI2bK046qX/hGKFyvz5kb78t+4n8afDEIhoRXFR
	2XIhvYLnqOGwrTY3TFkwmLNbfGfPTu0l+kcZztJ8GLwjwBhQ==
X-Received: by 2002:a05:6102:6890:b0:602:8c16:b24c with SMTP id ada2fe7eead31-6ff0238720dmr5736359137.19.1780903659227;
        Mon, 08 Jun 2026 00:27:39 -0700 (PDT)
X-Received: by 2002:a05:6102:6890:b0:602:8c16:b24c with SMTP id ada2fe7eead31-6ff0238720dmr5736352137.19.1780903658770;
        Mon, 08 Jun 2026 00:27:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b9916b8sm3663201e87.71.2026.06.08.00.27.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 00:27:36 -0700 (PDT)
Date: Mon, 8 Jun 2026 10:27:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Herman van Hazendonk <github.com@herrie.org>
Cc: sboyd@kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] clk: qcom: gcc-msm8660: register CE2 H clock
Message-ID: <wkdussrqbfh46fr6ck3xlckrbblthko6h65ivyjwmiileimw7w@wkeut5rjl2hb>
References: <20260602042747.277270-1-github.com@herrie.org>
 <20260602042747.277270-2-github.com@herrie.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260602042747.277270-2-github.com@herrie.org>
X-Proofpoint-ORIG-GUID: J7TbSeOeXgY6TdzL9VogwZv-fzgmc0sG
X-Proofpoint-GUID: J7TbSeOeXgY6TdzL9VogwZv-fzgmc0sG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA2NyBTYWx0ZWRfXwI+bPVuhM/qf
 jY5lLPpzdGD/MPRwMnFwwLT1s4jhXfxKpqbw1f72bk1nJqltPiNvxIVSrIMnIDayqM3U56aCVcH
 pL9iTzOwvwFVevAYu9nWeKpzV0ffg2EW+iXSThxDFmupvCw8lR+ZzP+8DEP8SAFHDWjMSP4oiZr
 ILDi1TIHoAdWLo9vznw++N29P4eBQKwjTz9cYRQuHJWkUtHAfrjA8kJEzLVEA1ZcubmvLpsWv1E
 qNGoPDa/vBXSkTLeXU1bWonXZ0pxe9/yMryK1wpEaVqxPm8qGzsuNDYWo79roPgjd19NxgaOS88
 knCL7I/NlLE3iYOZ+fVbwVWUiWVYgkqaSjWFjC93zcmy9K8xzfE+0+ZvxRTAh5YflVkyTou2PxA
 xoWiLuJ7jWIiSC014Qch37PV4UL8pjT0bCRMf55LKGzy1bzjUMspzZ5D497U/yPRcDMpvduySHl
 GS3Dm92XL1a+9ldSPOQ==
X-Authority-Analysis: v=2.4 cv=TLh1jVla c=1 sm=1 tr=0 ts=6a266eeb cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=cTwmTnRGAAAA:8
 a=EUspDBNiAAAA:8 a=LvhWEcBnrMCrogBIVCUA:9 a=CjuIK1q_8ugA:10
 a=ODZdjJIeia2B_SHc_B0f:22 a=GUWCSGlMWfG-xDt5EnV5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 phishscore=0 malwarescore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080067
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111716-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,herrie.org:email];
	FORGED_RECIPIENTS(0.00)[m:github.com@herrie.org,m:sboyd@kernel.org,m:andersson@kernel.org,m:mturquette@baylibre.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 45483653882

On Tue, Jun 02, 2026 at 06:27:44AM +0200, Herman van Hazendonk wrote:
> On MSM8x60 the Crypto Engine 2 (CE2) block at 0x18500000 is gated by
> a single hardware enable in GCC_CE2_HCLK_CTL (0x2740, BIT(4)). The
> existing dt-binding header already reserves CE2_H_CLK (ID 77) for
> this clock but the driver never registered an entry for it, so probe
> of any consumer that resolves the binding fails: the CE2 MMIO window
> reads back 0x0 and qce's DMA hangs indefinitely waiting for handshake
> signals that never arrive.
> 
> Add a single clk_branch under CE2_H_CLK pointing at the GCC enable.
> The upstream qce driver requests both "core" and "iface" via
> devm_clk_get_optional_enabled(); on MSM8x60 the vendor MSM8660
> clock-8x60.c maps both consumer-name lookups to the same hardware
> register, so the consumer device tree can reference the single
> CE2_H_CLK phandle twice under both clock-names. The framework returns
> the same struct clk for both clk_get() calls, per-consumer refcounting
> works correctly, and the underlying enable bit stays asserted while
> either consumer holds the clock prepared -- avoiding the refcount
> race two independent clk_branch structs would create against the
> same hardware bit.
> 
> Signed-off-by: Herman van Hazendonk <github.com@herrie.org>
> ---
>  drivers/clk/qcom/gcc-msm8660.c | 33 +++++++++++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

