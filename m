Return-Path: <linux-arm-msm+bounces-101713-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4IJiF9wC0Gk/2gYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101713-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 20:11:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C8C397400
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 20:11:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A52AA3016C37
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2026 18:11:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AF023328FC;
	Fri,  3 Apr 2026 18:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BzYT7Vpn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="grb8NrrZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0428E282F0E
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Apr 2026 18:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775239889; cv=none; b=sLqQPw0bXxe8HHvbNIOZ3GOkpVXwY7YeWL9bSOtylDEvZyu2Y0byFnVZ+LHpkNQwynH0Yh9Yknr5JAwYYbCLChofvhCm0d7ndCS/IZcePtX9pYfkeoKzffkXQtuSOfqrrxAetmO3xHzp3M5BXp1nm8EPK449X9LnAnineXRi2d8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775239889; c=relaxed/simple;
	bh=DzF10D1I+97HjEWxl98Cbs7hOuZlV88rFUr6Iuk5fP0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bbYeVUqZ6YyPzfXC+2psr6zKHRDdmgQJp/4p41cchHLko5dF8FpVQR+B5nWV8zETtnFGKbLNs14V1c2ny+evFinDDui+l4YskO7v14KUrXNJezq+I2WBHPnqIZxqqMxaOW96lhqXtgeCTMkz9Nd0KuqL62xik5XC3VtrEDxGAkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BzYT7Vpn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=grb8NrrZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 633Dec3x3772552
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Apr 2026 18:11:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MtXL2iAOtYsDXiVQNN0H4B4e
	Un0PA2AWtcephXdhd3k=; b=BzYT7VpnNaCzbAEeGMJLxOEOKCN9WybmxMDCSBgl
	tm0MnN5zuc3xv9CpIfjdxv/vl0gFwfGTGNYgOtqm/685l3EscBg12euGOX14t8yV
	34uhKLoV+ADzKfwBj4rb2n8WaaiLMGuQ+n8lFQ/5y8wt3Ij9VFR7SRWWv7+TG6fG
	RxvljS8da59o0N+PAImzYAjF4vZbdL1TlGdMtokuieoxxfCG/s3x9XNVOED1uIEf
	ZEQV47/zgStC6+c0avfZ8DQN9BmnaSfKniwYhMW57KpA9BFVsHdchTuiW59jeBK2
	KaQ6cgOnpyRyLPiPmS0k4Ha2vZGu68ifYnaKbIPogeFoCw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9wcs3u0h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Apr 2026 18:11:26 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b2523e0299so56449755ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Apr 2026 11:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775239886; x=1775844686; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MtXL2iAOtYsDXiVQNN0H4B4eUn0PA2AWtcephXdhd3k=;
        b=grb8NrrZhbEaybweaS1xEyUYbkM6fAam/VVmhHtfVXSzbQewCeeSsr0+bHS6Zi/wKU
         5fzb3gB5p0Ds+3Zyb2kmQYsvXK/MA+ijUNcKheo+RuUdy6SjNPWfLG0+7psHyRO08Ran
         KU+FeTPhI8Dels3XFDjQD8TWssBHwoSlQc00HgRds4VMDKMifXu1FaqvLzhHhrjxyYxY
         ZV1fj3dF8WfFQ6y0yg2UDWDzlD0CnpScE8isuwD6RhvmhHtucY9D185zrOaIu9OGQ0PD
         nQDsLnN+wD4UY+13B1jnqtzezZmDp9q4dEnzR65iAt88rm6+AZcBkDPdqCJLSlpUVEOa
         KN3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775239886; x=1775844686;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MtXL2iAOtYsDXiVQNN0H4B4eUn0PA2AWtcephXdhd3k=;
        b=BUh4pQ3eEG9Un3VywLt6T9criRNpNiqirYO78AXLmlViI2E4VKCG8u1D5skrNzEXU6
         piLnhD9/kEuW53ezJTnXkiSPuwE26vjnl9yRZr9t/n5irTFT6AZ5AHbvIHRpkXJRMmyz
         +TpK6/85DdeK7Matc+MT6J6mzMQmuhUfYQbkCaeqo6/z94T6AZv2uz3tdCQXPoBlYxOV
         B4ekX8bx5igluSjZoQB1rhW5G2r3i9Axvltp8sGq4p2PFpkcyXcZf4EB5POUjfsQDQHI
         gvNSXYbjYvjbvKglev460BD5X7U4NZy+kUV5mWrq082gmsjIHcvzvwxtHoDfS2dAZA4+
         xgjg==
X-Forwarded-Encrypted: i=1; AJvYcCXwYywiKa3KHpxdq0tnApNSASr9dwTkMybHLu0BofyjZPq0fS400EeHrnfWY8a8gaJtc3QMT+giH+8Oh0Mk@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5DSD7O1lrSI2WQ+dQX+H0Bb1plnWfwk19SWzkRiKes6ZL7aT5
	521LA0Zqxh4lHeC1EtgMGa8q0Vo7vsXoEGu5C04H1akOK0fzy+T2U0f7mNYoSms15Wa7jwdorqt
	XV0FSGxWpcjRI1w1BnzpJ6tzs64zCEGOhOkfEMxHPQhc5zdA0fQI4vY66nCAc9aDGOvvf
X-Gm-Gg: AeBDieuiNpIV8ORrsFQ7BBuKGDSR1QTVqPMyBojBBfNpvjrLZQ3KINAd6IYs4gYPT3Q
	7gSstiIObEUtTZJDvUqo4XlskThnSIPDE1yIqs2S3vaMlSGt/x7L2vNQ53FGcIFP+ZdNJqdcSVL
	9mIfTH29fLJ4d1OhHKGl3l60suiGiurUFIBssIbJcN8sOaI/ZAqqZdz6BBRrddMxpyymcYjvo0A
	8WOQvokdsThv0kOyQczqDKSbMZURAwg4QqhSFWacZsULVvzR1/gleu77P5M2zM07twepAycLY66
	Z4rEKgYm1sjkvjRBGH8hEp2fkhZmk1uWhxCb/hAE+knMsLN3hRhZC2QW5lNa0rmAI0NGifRHCvF
	ig/invV4H+kgnPenZ56mj0iXg5Fs+Nm5HTd+Ipu+txWz4wJV5X3gR5uqGepo=
X-Received: by 2002:a17:903:a86:b0:2b2:4d78:eeb4 with SMTP id d9443c01a7336-2b281779e2bmr40740035ad.22.1775239885860;
        Fri, 03 Apr 2026 11:11:25 -0700 (PDT)
X-Received: by 2002:a17:903:a86:b0:2b2:4d78:eeb4 with SMTP id d9443c01a7336-2b281779e2bmr40739785ad.22.1775239885297;
        Fri, 03 Apr 2026 11:11:25 -0700 (PDT)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27478bc96sm65435615ad.33.2026.04.03.11.11.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 11:11:24 -0700 (PDT)
Date: Fri, 3 Apr 2026 23:41:17 +0530
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
To: Harshal Dev <harshal.dev@oss.qualcomm.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org
Subject: Re: [PATCH v7 2/3] ufs: host: Add ICE clock scaling during UFS clock
 changes
Message-ID: <adACxdpwJOt92qLd@hu-arakshit-hyd.qualcomm.com>
References: <20260302-enable-ufs-ice-clock-scaling-v7-0-669b96ecadd8@oss.qualcomm.com>
 <20260302-enable-ufs-ice-clock-scaling-v7-2-669b96ecadd8@oss.qualcomm.com>
 <7fbd9d3f-a313-40dd-9335-799aea5a077a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7fbd9d3f-a313-40dd-9335-799aea5a077a@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: _WUIMQvVUQW9iB31GF092_mxKvE-4rus
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDE2MiBTYWx0ZWRfXzNx6mDxJTjMX
 AMLjSlw9W6K7jhT+a3wZ9W3c5SRVWFASjymA31WMXKQF2OKydD44X2SytbFXGpVMdE37oFJWchG
 DlCKQtnjTVFN6Y1FNCLCfN3GVdDXGW+iQ6p7eJIYvx6NTvRx3CwR2xN7EWdNBvRjpkn/ZonV7b5
 cT2FG8XOkoGuPuWjG5jUkCX0DNFVlmb633M6U3JCxzFJ+TsBFiKuZO92bxebFcUXIUXtoj0cd9N
 stri/R34NIa2gLXaChLXkNpGDapq455PiC4ubAcz5r8jvhfy/gM8JN5ZMmvkNj1s1+cmo907mnS
 iIYXDf74Zslg6rAcBpS0NYvH0VpgdR+t2PsBvkocgo6IrzotTNLu6oBlPNVEjGZOm06q3yFNzVP
 Ni+kd0pM/brMJNsi5t73R1Q0oVgTqY4No5gTAaTybMYMCWMmaBz3OwqKo0/SbExh4j+1abClvcP
 aX/iFVQrIZxBLR9GBmg==
X-Authority-Analysis: v=2.4 cv=ZuPg6t7G c=1 sm=1 tr=0 ts=69d002ce cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=wPS2iYinNOdQAA01N08A:9 a=CjuIK1q_8ugA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: _WUIMQvVUQW9iB31GF092_mxKvE-4rus
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_05,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604030162
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101713-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abhinaba.rakshit@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A5C8C397400
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 30, 2026 at 08:09:51PM +0530, Harshal Dev wrote:
> >  drivers/ufs/host/ufs-qcom.c | 19 ++++++++++++++++++-
> >  1 file changed, 18 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
> > index 8d119b3223cbdaa3297d2beabced0962a1a847d5..776444f46fe5f00f947e4b0b4dfe6d64e2ad2150 100644
> > --- a/drivers/ufs/host/ufs-qcom.c
> > +++ b/drivers/ufs/host/ufs-qcom.c
> > @@ -305,6 +305,15 @@ static int ufs_qcom_ice_prepare_key(struct blk_crypto_profile *profile,
> >  	return qcom_ice_prepare_key(host->ice, lt_key, lt_key_size, eph_key);
> >  }
> >  
> > +static int ufs_qcom_ice_scale_clk(struct ufs_qcom_host *host, unsigned long target_freq,
> > +				  bool round_ceil)
> > +{
> > +	if (host->hba->caps & UFSHCD_CAP_CRYPTO)
> > +		return qcom_ice_scale_clk(host->ice, target_freq, round_ceil);
> > +
> > +	return 0;
> > +}
> > +
> >  static const struct blk_crypto_ll_ops ufs_qcom_crypto_ops = {
> >  	.keyslot_program	= ufs_qcom_ice_keyslot_program,
> >  	.keyslot_evict		= ufs_qcom_ice_keyslot_evict,
> > @@ -339,6 +348,12 @@ static void ufs_qcom_config_ice_allocator(struct ufs_qcom_host *host)
> >  {
> >  }
> >  
> > +static int ufs_qcom_ice_scale_clk(struct ufs_qcom_host *host, unsigned long target_freq,
> > +				  bool round_ceil)
> > +{
> > +	return 0;
> > +}
> > +
> >  #endif
> >  
> >  static void ufs_qcom_disable_lane_clks(struct ufs_qcom_host *host)
> > @@ -1646,8 +1661,10 @@ static int ufs_qcom_clk_scale_notify(struct ufs_hba *hba, bool scale_up,
> >  		else
> >  			err = ufs_qcom_clk_scale_down_post_change(hba, target_freq);
> >  
> > +		if (!err)
> > +			err = ufs_qcom_ice_scale_clk(host, target_freq, !scale_up);
> >  
> > -		if (err) {
> > +		if (err && err != -EOPNOTSUPP) {
> 
> Using -EOPNOTSUPP here works fine for now. But anyone touching any of the lower APIs called by
> ufs_qcom_clk_scale_up/down_post_change() needs to ensure they don't return -EOPNOTSUPP, otherwise
> hibernate exit will be skipped. So this carries a minor risk of breaking.
> 
> Since regardless of whether ufs_qcom_clk_scale_up/down_post_change() fails or ufs_qcom_ice_scale_clk()
> fails, we exit from hibernate and return from this function, I suggest you handle the error for ice_scale
> separately.
> 
> >  			ufshcd_uic_hibern8_exit(hba);
> >  			return err;
> >  		}
> > 
> 
> Add the call to ufs_qcom_ice_scale_clk() along with error handle here, and let the above error handle
> remain untouched.
> 
> 		err = ufs_qcom_ice_scale_clk(host, target_freq, !scale_up);
> 		if (err && err != -EOPNOTSUPP) {
> 			ufshcd_uic_hibern8_exit(hba);
>   			return err;
>   		}
> 

Right, I did think of this later.
Yes, this needs change.
Ack will update in the v8 patchset.
Thanks.

Abhinaba Rakshit

