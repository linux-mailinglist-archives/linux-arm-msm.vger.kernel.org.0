Return-Path: <linux-arm-msm+bounces-99774-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id faL1CAZUw2n4qAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99774-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 04:18:30 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E25F31F17C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 04:18:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1D3D93053B0C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 03:18:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BC6C28A1E6;
	Wed, 25 Mar 2026 03:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V14V8jiY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IcHPFTSE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 054841D130E
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 03:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774408694; cv=none; b=nAiZjwS2Sohha8nBDHm8Eocl6pJapdh/86QtDgsqaTWbbGUKtmSRJd2RlvueQnlLrb16zdsSZtbwEAJckuXaUQxuBQoIvountg1r0Hw8ulSStqIEtRaW7KKyT1SDmykRD+oPQQUhpL7lSQ8Axp8IJMpZhEO6gJ7aKxwQw2sFQ1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774408694; c=relaxed/simple;
	bh=dSW38DdYZZOv8pvv9YDdYAaMcK88hyE2l6wpiXYKz60=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=trh+o3Nvny3E+tZGzx7hWLUZRr27qRMdgCmbZ9V/iUvXszKddzYS5dZ+t+zys5D5qIAPKxSjU4YtifjZ1FXrYss/JV8mQ5EFg4eLpq/UvDKlIyvgtPnejKcUmuNPjBCAIvFEnK2av/E/YChxlFU+E1opO/ja9EYbeomeUh+Hz7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V14V8jiY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IcHPFTSE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OJCbSn2973524
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 03:18:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=b6FptCPcWAnccOmmGsCSiJec
	7ospPWnRnPEalo1IhNU=; b=V14V8jiY8/Vh7OeWBacOdmqbC9tI695Sm76Iaxzb
	4/bew0OwmOZmVqzFqtPL7TqmMjDcBWulQ4viAHXV98SY3NpN1zUZT02xMYHDQCoe
	CvFrA94J8pa4Y5Ijfeu2x4yrW/622ZehJormMGAlGgUuHDP/U5FbkhQrt5L45nG8
	HH1eB1ObJJk2q/qK2znbJwiVGK+QRLLz4YsWW5x1xwgKMCnEFGll0RJdOIJ/l90+
	OrDsN1EuEov1wkS3QBRrNRNq1O+6fB/9prQ5Sx1poojfhCjjNcAEGHfedEDcixq1
	u6IFgQniD6y7BI6m3FQEBDZvlX/IG0i4r3kelswIHL05EQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d40f4h9ar-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 03:18:11 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b52a2d70cso149173001cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 20:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774408691; x=1775013491; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=b6FptCPcWAnccOmmGsCSiJec7ospPWnRnPEalo1IhNU=;
        b=IcHPFTSEkfnyMb7EU2gi4qPcS9ZLbqPJOiAL47BdbUHJAVd9XAE8k222jD1yQnJRX2
         PniboFOSYg4NR1oWT+UXb3jJD6f2m9lbdDgpR4R+wGQhh/lltCO4E3Jj7AqA1iWd5PXx
         /YuaAJR9tUFxuVKWUAFJrAp2RFZNRIur7+NAzizlTPUszHO7uKRdauP+sEqZj2kHM9nh
         6kh/V9vMwCPjvcyVionceMfN8FxR3EjjujjfJwMJUFCQrs+MIQJvef0WJFTF99HeC5bI
         OdUgKoKT/tgcq5c08gkTTXFbZjHasJ7KsnHEDezWQPtXUUfqrVuICQOJDfgCr1JWqBGs
         9cWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774408691; x=1775013491;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b6FptCPcWAnccOmmGsCSiJec7ospPWnRnPEalo1IhNU=;
        b=ssUFxbTTp7ewoqfj4ZBsDcy2m41sR/Nv0yx8uIQYDY3kb/DOE6sE2QGs4hS6fUQl0X
         zYjohOR9TmfkCHW8XBIX4lt95GAexAMPzPUptQCn6mxxci0i8eO9rIXuPjPrZgE/i656
         ls03F/OrcxDHnXwK0uknuzJu6OmfMeEZHgES6XjtHeN50SYFORClA9V5jzm4Ns38VsDI
         pTDC+v8L0YYqK+zOZvE5HxMvhftKDOunpqnLwakS20JGbp90mL5OsLmVb3qzrgk6wM/m
         ofhDk1pixJHPdciG/YK4srg0i7l+EkGLL5mWtuk7HDy1P/e+TmjD6nBAX9dokKaW7irN
         eGGA==
X-Forwarded-Encrypted: i=1; AJvYcCW94J40BHa7vaXbB3jLPLyiLS0y1pjFbusF24xA+R370oI6DKmJVP/O3IA6iwCgZ0JHfiq/XcsCLhV0phps@vger.kernel.org
X-Gm-Message-State: AOJu0YynUzUZWXI1Mqz5Gzqk4mT10M+2ljlapF/4sEG2qc9EzgRN98jv
	eSRvPkMrCcjNKhBMZvs0WNvOLgbq0EZYPC69sqTh2dnqtLqXjALmUJA8lpIr8NvbkvYvcBleD3m
	SRuS6MasGfZdicf2g4Qz0PemXEirGdvaPgGVi5wQ2UuIUP6zoRIM22LiODitu4JooB1f1
X-Gm-Gg: ATEYQzx9rHsd9ZKb7njw4mJYDPz+U2yweM1t82qfv30RJ3TA4VHnCXxnJ3edIoUA88P
	yQV6/ilfEZKYv4te8C+jkkiy142QBgqRTfmmKx4KlEZ0mpbNGkojZvGkBIZQDBnzT2gDJAstOdG
	JLI4V7opsuvjzBk7LlbYGhtAmxQfsGc6Qy8zS1xlOInw9OmPzr/ANMo/dNpdUUuIkpz3sk0H1QL
	Zm81Xirnnc6eVBEOA3TIjZJ3Kid8lInHTtx9zzjCESVjmOA8DlY3TZO1LMoTFFngHef5E4ZXN34
	Aru20NKnur4fTDgFRJWgdqS6sog9+aXL9ttjTVYQpbBaeaedjIKCCZKaycwJLSiT7TB7hPI5yT6
	UWhSuN8UzowyXPME6oBRSVEOClQpJSYlTk4PSzGsP43uTKlfgx/DPblfptItV4hTCREvdkvg15p
	CGZSqgpNeefAp/XvAKWMizhTQ7b5U3uG3P7ys=
X-Received: by 2002:ac8:5fd3:0:b0:50b:4537:2e23 with SMTP id d75a77b69052e-50b80e547b3mr28682751cf.48.1774408691348;
        Tue, 24 Mar 2026 20:18:11 -0700 (PDT)
X-Received: by 2002:ac8:5fd3:0:b0:50b:4537:2e23 with SMTP id d75a77b69052e-50b80e547b3mr28682471cf.48.1774408690815;
        Tue, 24 Mar 2026 20:18:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38bf9ac1e1csm34860401fa.35.2026.03.24.20.18.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 20:18:07 -0700 (PDT)
Date: Wed, 25 Mar 2026 05:18:06 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Paul Sajna <sajattack@postmarketos.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Amir Dahan <system64fumo@tuta.io>,
        Christopher Brown <crispybrown@gmail.com>
Subject: Re: [PATCH v6 09/15] arm64: dts: qcom: sdm845-lg-judyln: Add
 firmware nodes, change path
Message-ID: <ck6uf7rleary74n4ygedm4vhrcfassej2w7p33pwft473ipjme@qtyorrhuny7j>
References: <20260323-judyln-dts-v6-0-29d70ca1651c@postmarketos.org>
 <20260323-judyln-dts-v6-9-29d70ca1651c@postmarketos.org>
 <e32a0a50-9c15-4f3e-8c83-1f96e5aae4b0@oss.qualcomm.com>
 <e833f72236342a7efbce04c2109bf921f770673c@postmarketos.org>
 <vjf4lqbd5igkhvonxed3tkydxkcc5rmt2hsefng4oojrpzf3fc@a5hujilezcdy>
 <b75b4b217c2a1d1a5edefd699f0ae9966e612d64@postmarketos.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b75b4b217c2a1d1a5edefd699f0ae9966e612d64@postmarketos.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDAyMSBTYWx0ZWRfX+BOt0Q9YmeqK
 TjUIwGDjNqXBd2oEz0WPfWeCWlD01tev6LJOFGQr+FAKXrQA3hZSffpRgzHLAzEvVgaChrEE8fL
 12Jz7ctimL+tbfy5Mgrd2zargxZkrfVa+unIBCPqQRon48pQo7puY0LD5I19+UX6HdHawOYApjL
 s1TtK3/nMQKQc/MN72B1w0JLixOorEHjFP8eQhJdWZdB+43vEH298BtuILeWhxYp7QJuO5TwvkD
 LfBWEflgGpvWaBVqL3uFhGJ9xqyViezF/Q/dCMfx04ZT4HBRdxI8BEnsNqTr99Byf7I0lKUMBJg
 mBu7KcjfHXCzkuldLrvIX5RrbGAECyrVApVaGFOhvaprlVx7OZ3UYpaKbe2AsDugpRTtxM8w6rU
 KDSkFwBvI6lvmGLgX0nDXrJLnqcUNVx3i9ZyJRQXQFqM1rV2lZ9H5a/ek/WzCPYHmjBoOXTVC3S
 NC3EGgEqMZtJyrw2Vrw==
X-Proofpoint-ORIG-GUID: b9HiLYgzEu8kBPFRhW7aVXWzhzGlUFS9
X-Authority-Analysis: v=2.4 cv=Cd8FJbrl c=1 sm=1 tr=0 ts=69c353f3 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=JaEu3K2U_7yi_sq1lugA:9 a=lqcHg5cX4UMA:10 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: b9HiLYgzEu8kBPFRhW7aVXWzhzGlUFS9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_01,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250021
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99774-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,ixit.cz,vger.kernel.org,lists.sr.ht,tuta.io,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6E25F31F17C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 25, 2026 at 02:35:33AM +0000, Paul Sajna wrote:
> March 24, 2026 at 8:55 PM, "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com mailto:dmitry.baryshkov@oss.qualcomm.com?to=%22Dmitry%20Baryshkov%22%20%3Cdmitry.baryshkov%40oss.qualcomm.com%3E > wrote:
> 
> 
> > 
> > On Tue, Mar 24, 2026 at 04:17:09PM +0000, Paul Sajna wrote:
> > 
> > > 
> > > March 24, 2026 at 10:49 AM, "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com mailto:konrad.dybcio@oss.qualcomm.com?to=%22Konrad%20Dybcio%22%20%3Ckonrad.dybcio%40oss.qualcomm.com%3E > wrote:
> > >  What about the other board (judyp)?
> > >  
> > >  Konrad
> > > 
> > >  
> > >  I don't have it.
> > > 
> > You don't need it to define firmware paths.
> > 
> > -- 
> > With best wishes
> > Dmitry
> >
> 
> Should I put firmware-paths for both boards in 1 commit or 2?

Either is fine. My slight preference would be towards two commits.

-- 
With best wishes
Dmitry

