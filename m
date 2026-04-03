Return-Path: <linux-arm-msm+bounces-101674-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +JT0BanNz2m50gYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101674-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 16:24:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ACC53952E7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 16:24:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4B1FF3010D95
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2026 14:17:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D60BA3C3C0F;
	Fri,  3 Apr 2026 14:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JdVjTWHZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BH5ixiLn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 236E63C3C00
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Apr 2026 14:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775225848; cv=none; b=sgezOGP+37i0rR4Ya3TrnvxoHzbsdO9t544EoCp0bQ1kxTO7nE8UnSOH4UHjMutiBZVinpSmKVarFtWafv8bK021zZoMAhD7vtPABw33Omtjq9qWHAHEsIg4c+nOHHbnkK30K0Xj2nHMeom7t6ieSnCl3Ogqo4omoZJVfWPhqCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775225848; c=relaxed/simple;
	bh=x1GMrzZmo29qt8wAIiATRsd4Ew8aTktyUtdtWzc8bns=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qhJxFwVRDSj0JKJOKITz2W3isaY6cTltNvXJpELZEg2WN40CmfxmmeONGUVuexNB5wbp9aRJARgqhRI+7xGGbOKZnd4Lr4SJwtSSkqvuysQ5Kk8P6ZEJ2wRop37Sor/IWzWGIJ3lvQq38erWgBPZoRgLrKxXtYcMHsmktgrlpxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JdVjTWHZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BH5ixiLn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6336FELd142091
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Apr 2026 14:17:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5gzzElj7aj1o4ak21+gPFFPTZzAOuQGBCbltKvS4sOY=; b=JdVjTWHZhnX/UUTs
	US/THmy3mz2Xa8Y2GMeul+tYXJQVpgljkJE9SbpFpUb1v/n4a26CXodZsXV4morx
	f2jBz9GJ50hx+L7u9KYSkAKzUlDX0odKG2mQ5pAnv2P5UBInmtshHlL+8p3RhjnA
	TeZSHgE7QVhS/215Bu92zbv87M9mDFofgjcM7jOjXdgV9ULnhdHak5N3LhCGhjSc
	VV0xyQWlR+RhUkJOvtgPfmZvQiE9/2Ix2vdDB7u7+Wi8TMvk0wxXY+5YPCdzgSqj
	eFbaSlMCPNDFHADUmbTblqwcHGWvUzHkcwDRodCcbY9Gv7hbQvNgMpPnwwg3B0MR
	lNIN0w==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4da83y1ah2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Apr 2026 14:17:24 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b249541063so18432365ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Apr 2026 07:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775225844; x=1775830644; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5gzzElj7aj1o4ak21+gPFFPTZzAOuQGBCbltKvS4sOY=;
        b=BH5ixiLncUHMnAHNIYIOuQoCUIH+KxoXKgsRSWPLYXMPJoA1GTmDAe8XsOqXawAayv
         IqWW44SqeLVvdx+WWzpYb/OXG9MGCvkewJWn0RSRALXtNj43RRYXaOOLA7YjGrw2NANT
         FLJDwx0jGhv022qsB7K/IRNXtUXSAzkKIxe9ekY38BTFRMlw/vFBOQSzPPZH/bf1ZTeP
         D0kl4ja/6ugYBe1pVZ121sIZktYuv/vIooFxVbqUE+cuQbDydWJVRMad7L1G3HI6y8E3
         VXpV5mO/oCXS5IInLra/XfxWzROMCBA12H/pdFR+asye7WrfpUJZMayfANaizvIlWnz3
         F2jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775225844; x=1775830644;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5gzzElj7aj1o4ak21+gPFFPTZzAOuQGBCbltKvS4sOY=;
        b=Q8jeIKw2zPANcpUXm/AzuJkkvTpO2SoFCdbnBqfEJLg7q7i2qjUdRr5fngZTBeZgyQ
         ttAo99cOZeek37dvzQ9c16QsUyrlsQeo3Osg8b2lpVAG+9QIPpanJzjCRsIOM2ZqZQ9V
         J5wYO5dZGBFuoCdCghUo5E/MShXi7Pcrud3aiAkecC2FPZJIIrOuxkvOhEvFEnW4hq5/
         UZ4E7jg/MQBjlDRAb4JD8YwGJFoHluAWcFGQ979yOFwljAiUslBJhUm9boB6ofAugbGy
         AiDfTGbzKh0UO3zgiXTl0pS0mQ30un4UG4bYs9Si3cy0uxKOLeHSxPVc3huT7S46as4A
         i8Ag==
X-Forwarded-Encrypted: i=1; AJvYcCVgPcKCP6P9hy+6GnNeg3Sfgn/KKkY7ZEmHPfzcv/WoNKHuDZzCfAMzeKd6PNiyZfBbIG+rDanntYOsTnKF@vger.kernel.org
X-Gm-Message-State: AOJu0YzdyNa0xDh9Kill8vPfwb32mhMZ6nwhRK4oWouHFThb0NEnQPKx
	CE92d/qQlfrKPLJ1Ixdwiz0YMLQprMNcLHbYzHYmYBxKxJrvhRC76osWZFt6W3RY4GVItF8yy4L
	6EMtTxUa4omwVHoYXpBRuUEeHSNN9MMKmPiq/+4wkYEiJXcXKiyFHSN2Nskmbm4+q0ccM
X-Gm-Gg: AeBDietiPC02eFVjNsGtN1xGc+M5N5HQNVVFMPeHHdluGApoVQcuLT0w6eTUZi6r2/K
	ueLHIjQm8F8poXwHSZHvxBVUQcneD6bpsGra+c/yIWpj0yKrXwB0I8+amVhXc5dERDAOf53ECMJ
	y1OKqghK6f3lt4yFcyU/0iRWa4iLHnMAg3mx8DRx1gxkcR3MiLAe0+tjLZ/q145yW3uFJhc4NPx
	K4L6QB6/XP9kC+A/vLGZ+7nfWk8rXmkFcihjYAyDNVePMLgbjYWPpkvucJO8n36I/bA4A9vrc3f
	jUkXiBlH3Ds9g1VmTejjoYlTfv0yWQU1xipE5GM/HJCoVnsiI/lVgn+b4LcF/jUV19XZiKYYVz8
	mLrxFd7wrYdLaArbbSm4KOkzeRevqDJduwFRVA62r0bJ9lwLvzJ17g2hkqBA=
X-Received: by 2002:a17:902:f552:b0:2b0:7d6f:4627 with SMTP id d9443c01a7336-2b2817ad6camr33019005ad.37.1775225843874;
        Fri, 03 Apr 2026 07:17:23 -0700 (PDT)
X-Received: by 2002:a17:902:f552:b0:2b0:7d6f:4627 with SMTP id d9443c01a7336-2b2817ad6camr33018455ad.37.1775225843132;
        Fri, 03 Apr 2026 07:17:23 -0700 (PDT)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2749c38adsm75917555ad.69.2026.04.03.07.17.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 07:17:22 -0700 (PDT)
Date: Fri, 3 Apr 2026 19:47:15 +0530
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
Subject: Re: [PATCH v7 1/3] soc: qcom: ice: Add OPP-based clock scaling
 support for ICE
Message-ID: <ac/L6y5B+6SyTNuE@hu-arakshit-hyd.qualcomm.com>
References: <20260302-enable-ufs-ice-clock-scaling-v7-0-669b96ecadd8@oss.qualcomm.com>
 <20260302-enable-ufs-ice-clock-scaling-v7-1-669b96ecadd8@oss.qualcomm.com>
 <a616c056-f9aa-420c-a543-7f1539e9e886@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a616c056-f9aa-420c-a543-7f1539e9e886@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=ar6/yCZV c=1 sm=1 tr=0 ts=69cfcbf4 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=32UUs-Vz8nlSIkZsdJkA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: FBAvJEdnHOQ5myNDAAxIvZZRmP6YxBxC
X-Proofpoint-GUID: FBAvJEdnHOQ5myNDAAxIvZZRmP6YxBxC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDEyNyBTYWx0ZWRfX8RNo010sEUS7
 4WL3DmemXT31Ym6QBLIMxyAbCuDIk7DowVTg27nEMwYo+Z1hlg6OLMhsKwZo6PfDLjloHCEh86E
 RyTaROO2EO6OdrU/E11mKPx+tIcnL7nV0z/ohHsVFYPgkqf82Fqpo2a5ApDaQjzuNvUYdaVawjQ
 mc6C2hwFVpN7LWiv8kl/pnC/lU0edHMWVFcN6GnriNSS7+acz6tFzKAciPxJd7T9UB698Z/V4QU
 W637Re7mzFDuuNMJ9KbhIHENT/mlQj2B9L7Ej5wIEOmpbMMTak4Z0KUBiv9n2d8gUchWFR+mv9h
 LqlPCjVlfyhM6AFlVDs7R+pDHesnNg2BIheOftSvXFt8/kljPC/3fBPUNtqwq4fzYqDfPlY8MYF
 wY2DD0mHo1yswRnjbDWLzHWQa3+bdS3kBYo0NZQneEWQ55Z0nRkRawQ64tOSwCsUjzmbzxhsy2V
 foT/QWOwHxYQpk6DF2w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_04,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 malwarescore=0 phishscore=0 spamscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604030127
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101674-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,hu-arakshit-hyd.qualcomm.com:mid,oss.qualcomm.com:dkim];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: 8ACC53952E7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 30, 2026 at 08:09:35PM +0530, Harshal Dev wrote:
> > +/**
> > + * qcom_ice_scale_clk() - Scale ICE clock for DVFS-aware operations
> > + * @ice: ICE driver data
> > + * @target_freq: requested frequency in Hz
> > + * @round_ceil: when true, selects nearest freq >= @target_freq;
> > + *              otherwise, selects nearest freq <= @target_freq
> > + *
> > + * Selects an OPP frequency based on @target_freq and the rounding direction
> > + * specified by @round_ceil, then programs it using dev_pm_opp_set_rate(),
> > + * including any voltage or power-domain transitions handled by the OPP
> > + * framework. Updates ice->core_clk_freq on success.
> > + *
> > + * Return: 0 on success; -EOPNOTSUPP if no OPP table; -EINVAL in-case of
> > + *         incorrect flags; or error from dev_pm_opp_set_rate()/OPP lookup.
> > + */
> > +int qcom_ice_scale_clk(struct qcom_ice *ice, unsigned long target_freq,
> > +		       bool round_ceil)
> 
> Any particular reason for choosing round_ceil? Using round_floor would have
> saved the need for caller to pass negation of scale_up.

There isn’t a strong technical reason for choosing round_ceil specifically.
The choice was mainly influenced by the earlier discussion here:
https://lore.kernel.org/all/15495f8a-37b0-4768-9ee1-05fd6c70034e@oss.qualcomm.com/
 
Also, this helper isn’t necessarily limited to the current caller.
We might see additional users in the future where the semantics align more
naturally with flags like scale_down, which map cleanly to a round_ceil‑style selection.
That said, I agree that using round_floor could simplify the current callsite by
avoiding the negation of scale_up.

I don’t have a strong objection to switching it if you feel that would be
more cleaner for now.
 
> > +{
> > +	unsigned long ice_freq = target_freq;
> > +	struct dev_pm_opp *opp;
> > +	int ret;
> > +
> > +	if (!ice->has_opp)
> > +		return -EOPNOTSUPP;
> > +
> > +	if (round_ceil)
> > +		opp = dev_pm_opp_find_freq_ceil(ice->dev, &ice_freq);
> > +	else
> > +		opp = dev_pm_opp_find_freq_floor(ice->dev, &ice_freq);
> > +
> > +	if (IS_ERR(opp))
> > +		return PTR_ERR(opp);
> > +	dev_pm_opp_put(opp);
> > +
> > +	ret = dev_pm_opp_set_rate(ice->dev, ice_freq);
> > +	if (!ret)
> > +		ice->core_clk_freq = ice_freq;
> 
> Nit: Follow same error handling pattern everywhere in the driver.
> 	if (ret) {
> 		dev_err(dev, "error");
> 		return ret;
> 	}

Ack

> > +
> > +	return ret;
> > +}
> > +EXPORT_SYMBOL_GPL(qcom_ice_scale_clk);
> > +
> >  static struct qcom_ice *qcom_ice_create(struct device *dev,
> > -					void __iomem *base)
> > +					void __iomem *base,
> > +					bool is_legacy_binding)
> 
> You don't need to introduce is_legacy_binding.
> 
> Since you only need to add the OPP table when this function gets called from ICE probe,
> you should not touch this function. Instead, you should call devm_pm_opp_of_add_table()
> in ICE probe before calling qcom_ice_create() then once qcom_ice_create() is success, you
> can store the clk rate in the returned qcom_ice *engine ptr by calling clk_get_rate().

This was added as part of the review comment from Krzysztof:
https://lore.kernel.org/all/20260128-daft-seriema-of-promotion-c50eb5@quoll/
 
While I agree moving this to qcom_ice_probe would be more cleaner without needing
to change the API, most of our initializing code for driver by parsing the DT node
happens through qcom_ice_create, which keeps qcom_ice_probe much simpler.
Please let me know, if you think otherwise. 
 
Also, I don't see any reason for moving the clk_get_rate() logic to qcom_ice_probe
though as it will not be set on legacy targets in that case.

> >  {
> >  	struct qcom_ice *engine;
> > +	int err;
> >  
> >  	if (!qcom_scm_is_available())
> >  		return ERR_PTR(-EPROBE_DEFER);
> > @@ -584,6 +640,26 @@ static struct qcom_ice *qcom_ice_create(struct device *dev,
> >  	if (IS_ERR(engine->core_clk))
> >  		return ERR_CAST(engine->core_clk);
> >  
> > +	/*
> > +	 * Register the OPP table only when ICE is described as a standalone
> > +	 * device node. Older platforms place ICE inside the storage controller
> > +	 * node, so they don't need an OPP table here, as they are handled in
> > +	 * storage controller.
> > +	 */
> > +	if (!is_legacy_binding) {
> > +		/* OPP table is optional */
> > +		err = devm_pm_opp_of_add_table(dev);
> > +		if (err && err != -ENODEV) {
> > +			dev_err(dev, "Invalid OPP table in Device tree\n");
> > +			return ERR_PTR(err);
> > +		}
> > +		engine->has_opp = (err == 0);
> 
> Let's keep it readable and simple. engine->has_opps = true; here and false in error handle above.

Well there are 3 cases to it:

1. err == 0 which implies devm_pm_opp_of_add_table is successful and we can set engine->has_opp =true.
2. err == -ENODEV which implies there is no opp table in the DT node.
   In that case, we don't fail the driver simply go ahead and log in the check below.
   This is done since OPP-table is optional.
3. err == any other error code. Something very wrong happened with devm_pm_opp_of_add_table
   and driver should fail.

Hence, we have the condition (err == 0) for setting has_opp flag. 

> > +
> > +		if (!engine->has_opp)
> > +			dev_info(dev, "ICE OPP table is not registered, please update your DT\n");
> 
> Since OPP table is optional, I don't understand the reason for requesting the user to add one.

This was added as part of the review comment from Konrad:
https://lore.kernel.org/all/15495f8a-37b0-4768-9ee1-05fd6c70034e@oss.qualcomm.com/

OPP-table are mostly optional across kernel and I guess, this warning helps developers
to go ahead and update with the OPP-table.
 
Abhinaba Rakshit

