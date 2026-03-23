Return-Path: <linux-arm-msm+bounces-99382-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gNCgBC+UwWkKUAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99382-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 20:27:43 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DA3EA2FC3CA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 20:27:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CACC5302EFDF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 19:26:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7049396D16;
	Mon, 23 Mar 2026 19:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CJRs+bYa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MFeqC6Tx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77F8635AC38
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 19:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774294001; cv=none; b=A9uo6SPTjFdH1MHXF9qzULBrTrCzSKpottsRf+gg2F3P/pIoAdt29Kfa9SwD3+YLS1AqFSth15mY0GBHaOe7YrFO9y+3UVp/7D/1DzLbPlp3RCQxka+hxVZSPkHUA7lotKyxhC62fZaNZVZraocvnkCyfQjvP3QeWXPRHN1ZTb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774294001; c=relaxed/simple;
	bh=YOAmvnLGhbyclLiPPCUKzXmFddQ3BRiSl0wv3o3nRIk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=er3QIn4qNk9tVy4LuFtaZ5zo1/GFtpc9afkoS9xBbmuYkoCmzY+/t6wSASJpQmmjHXYYwSjMyVwJnDf8iCUZACxsYQBk1oM6ps2ehvgKpA11YcQrWilvwIfm+wdXB08wRP2d5jlgs/iVN3VSkdVGk//4lWJuaIKr5aX7OnZgqtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CJRs+bYa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MFeqC6Tx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NHqhdY3934726
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 19:26:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7dPTef1e6jAQ0fE4f4FsGbPo
	ArdFqQ4ib1xYhnmmN5A=; b=CJRs+bYa6Q/taOndhNL76Mg+3vW8Q9IUMX37hy+J
	hN3LAFq5wNmqdvCGWIxLTraoiNQG7yVqWWuzzi5xM1vbsyzbzHmGaDM0c/oV4RZs
	ShqlGsY2ZBHHUohHUGm03Ai2sx0PpJ0YVdQesTUrwx3QHZZlU595C9hGEnH1XfRm
	OFN/Ij/dPPUCL9Oyp3/iGlVzkZ3VLWoppfTp/TUANrAtblkEwUaqGekI0sTyU0HI
	YS4UlotmP3+1QkYszhlrs93BZvj+FgPY3eV5+ePl5H37aQiF3iXsKbGDjXMNRKRw
	/UQ1Sz8hUl1c64srCXeLR8ImohWwz9Jf2mrc6m+MWGiTGg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d37a0h27h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 19:26:39 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b5f675be9so118450701cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 12:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774293998; x=1774898798; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7dPTef1e6jAQ0fE4f4FsGbPoArdFqQ4ib1xYhnmmN5A=;
        b=MFeqC6TxrfGO09cSgTTg3yg8t9vcbJcEOmFULE0x5oQe8lrqRZIfSyajdkDFiZeoYL
         BcQD3jhRxLoTFHg3q2T+9/hmpOuFFgLd06NcsNFBCSYgYzcCF0LCLNw5CU03D0KZPAIL
         Lmqsdq81p0Y4HCPT9SH2qQ3+vl4jAuUzLhTVOar6ncbSZfwYfDjZeV3bGiUFQ9cvmqS5
         PMvsbgi6HLiBKSKPQx9VUes9Gf6lXRUatUdtkVLEL56+gbC/+4pAtjxb6UM+jFHAqIdD
         goYhkOctpsrkON6x6BDVhmvzJe2b5c739ewXGXHKfTuM5CyiK0xikzSgbPqo1eAkkXrC
         cMlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774293998; x=1774898798;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7dPTef1e6jAQ0fE4f4FsGbPoArdFqQ4ib1xYhnmmN5A=;
        b=U0jAt5qOYrd0lCMTZWi3qrYlCAacusxYe0Kueeie4AI0sdj4aLAPIOeXIIhig1uvWW
         9iABxxUepgxWOxMBQOcApghslMT41nrTStWi3SbTwOP4z+yL8321Eah4Cx4zIe+F/2lw
         FbXZUWcQlFDjpkjaqPNkesTSL5yxIUhyZHiBg1PIz9OtMWMlTJ4D0A3jpVVaKfPFEtkh
         gEFVWlsTHi8s3PiuVpLMw4lytVGzO2qaSxwr7p9Ia+1+WApyNkVJrECnPjEk+00sN6K5
         M10x5f+najORlwGmgSbANjMp8014uO3I9m+5bGQ/Lrsm627NBbm0JheLAOzUrz30Ivsw
         FBCA==
X-Forwarded-Encrypted: i=1; AJvYcCVXAhfrRgXEZhqtXkg4Fx/9wECsPPYz8r08u5NFdIRortJKPIXo0g2w0U3QA66C9auYedSt2gl3EX5uQzcd@vger.kernel.org
X-Gm-Message-State: AOJu0YwrJwrPZ+Oe9khk/FxUdrzuJZsPDb0fG1SG8IPIDPEa894ZX8nC
	v6/UYCuU0eWr+IGR+l0rF3SqA8UC4XuYWMGnqq+WtmJBWSLrBhAhBbvaLQzjONLzDgPqdhnn4lD
	YpX6nUzAZMAdEJrUVmDVmo1EZGALYRplLt5sen0DZ00SEK5JXdNVD5TD8fEP5V8XPiS74j/kc4K
	E2
X-Gm-Gg: ATEYQzzRzTpqC3eE8zHDpnRwnacO86YH+QrXeNdinXiK+gOwHqdUq2fSpWAVagAHkJe
	b+sqpVArCbVY2rOE3KbpzP043vrvduBumT9D84T84WSddMB7rOUY66dw2Tjfz2IhvumzM4UEOOD
	mNNLmmN9udZSKD/7he4NBW7uPJBEJehlo7zoy2LR3hDZF3Z2igT3h5Tlh9cnO0zZknHX/GRbooa
	9XMfvJqCMUnBg+XcmCMsDDqhCXChyThSuPlqp4kXFAgCMXqv79R8WsZgHod01HZpNjQVeAknyV2
	fEQE1nYK7WSthSOZhLdb3JwYvbh1JJ5GFAOPRi6k0qmfjwtpK+ETFpuYzaOpEs8sEtY11+leiQy
	sJebVKxPgEtqMuagh7psgt+pJQcOcO6dGw13cbgj8EfXE1D56Q87/fXEaOY+m44oTygBafKsv0h
	lUfzpVilHgbQXsq6o+X7HeFfqO9KP4nZVGXJU=
X-Received: by 2002:ac8:7f0f:0:b0:509:2222:4202 with SMTP id d75a77b69052e-50b375f747fmr195307911cf.71.1774293997690;
        Mon, 23 Mar 2026 12:26:37 -0700 (PDT)
X-Received: by 2002:ac8:7f0f:0:b0:509:2222:4202 with SMTP id d75a77b69052e-50b375f747fmr195307521cf.71.1774293997200;
        Mon, 23 Mar 2026 12:26:37 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2851ac69fsm2773829e87.32.2026.03.23.12.26.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 12:26:34 -0700 (PDT)
Date: Mon, 23 Mar 2026 21:26:32 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com,
        helen.fornazier@gmail.com, airlied@gmail.com, simona.vetter@ffwll.ch,
        lumag@kernel.org, robdclark@gmail.com, robin.clark@oss.qualcomm.com,
        guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
        valentine.burley@collabora.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] drm/ci: add sc7180-trogdor-wormdingler-rev1-boe
Message-ID: <fs6nbg44r2ralxrkuc7slciapnufyyw6derolzlwzt7hjxlx62@vftuo2vmfpom>
References: <20260224081036.220820-1-vignesh.raman@collabora.com>
 <hnlupswfdkrzv45y6jl5x5u25zp2k642z6ordzthqbdw4azhxb@6gz5hx4dcujc>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <hnlupswfdkrzv45y6jl5x5u25zp2k642z6ordzthqbdw4azhxb@6gz5hx4dcujc>
X-Authority-Analysis: v=2.4 cv=GIIF0+NK c=1 sm=1 tr=0 ts=69c193ef cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=e5mUnYsNAAAA:8
 a=VwQbUJbxAAAA:8 a=QX4gbG5DAAAA:8 a=MvT_i2rHHVxhWai1pmYA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=Vxmtnl_E_bksehYqCbjh:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDE0NCBTYWx0ZWRfX9mvFjYFYvYFU
 3AVENZ+lKYtmzLhqcdJx92+Lb5ODv9+ySfWHYNZSq6A8AKXGz/UOdkJQq09Ii+JIs56H7bIlf+T
 BZKltGBbWJcq0tTZ89g8HoHr2bEImK7XCxBwXav4piL4W0ZwpEl3b1zEqC0cR7PMHmzYDpNk81N
 VqH4WqjMkk/HKCj7OZaNUD9rSaus0dCduCSjgkE4e++MAH5D7UfiOur84MCqYnIcQ5bYKL4ZkVy
 0enOfL+hpATAt6NAk2Pk7OQ9gDN1VQiNVpCMKKCoCP9Y9cc/XJUHL2KeZooFftlNejiD8v1m7YX
 HPe/G/bo6V8j9UuMOg1ydtGeYePWcF+8WuXNvm9XsboVpz/UGOKR4r2xFjn/FqpevkDDYTqGcVJ
 3MN4g0cQWk2Hu0xULv3JCZiUqLSv8wz4De/5Nc2Mq6J3zbx96R0rng4k4iWL/+LSoQkbsyKFA3K
 HMsiq1ON0jCeSr6KvyQ==
X-Proofpoint-GUID: 6AHGiyMzhFUpc7Vok998II_5MHry6xzr
X-Proofpoint-ORIG-GUID: 6AHGiyMzhFUpc7Vok998II_5MHry6xzr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_04,2026-03-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230144
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99382-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,collabora.com,gmail.com,ffwll.ch,kernel.org,oss.qualcomm.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DA3EA2FC3CA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Mar 01, 2026 at 02:23:40PM +0200, Dmitry Baryshkov wrote:
> On Tue, Feb 24, 2026 at 01:40:34PM +0530, Vignesh Raman wrote:
> > Add job that executes the IGT test suite for
> > sc7180-trogdor-wormdingler-rev1-boe.
> > 
> > Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> > ---
> > 
> > v1:
> >   - https://gitlab.freedesktop.org/drm/msm/-/merge_requests/221
> >   - Depends on https://lore.kernel.org/dri-devel/20260210071138.2256773-1-vignesh.raman@collabora.com/
> > 
> > ---
> >  drivers/gpu/drm/ci/arm64.config               |  4 +++
> >  drivers/gpu/drm/ci/build.sh                   |  1 +
> >  drivers/gpu/drm/ci/test.yml                   | 10 +++++++
> >  ...180-trogdor-wormdingler-rev1-boe-fails.txt | 23 ++++++++++++++
> >  ...180-trogdor-wormdingler-rev1-boe-skips.txt | 30 +++++++++++++++++++
> >  5 files changed, 68 insertions(+)
> >  create mode 100644 drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-wormdingler-rev1-boe-fails.txt
> >  create mode 100644 drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-wormdingler-rev1-boe-skips.txt
> > 
> > diff --git a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-wormdingler-rev1-boe-fails.txt b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-wormdingler-rev1-boe-fails.txt
> > new file mode 100644
> > index 000000000000..4af93eeeaf99
> > --- /dev/null
> > +++ b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-wormdingler-rev1-boe-fails.txt
> > @@ -0,0 +1,23 @@
> > +core_setmaster@master-drop-set-user,Fail
> > +kms_color@ctm-0-25,Fail
> > +kms_color@ctm-0-50,Fail
> > +kms_color@ctm-0-75,Fail
> > +kms_color@ctm-blue-to-red,Fail
> > +kms_color@ctm-green-to-red,Fail
> > +kms_color@ctm-negative,Fail
> > +kms_color@ctm-red-to-blue,Fail
> > +kms_color@ctm-signed,Fail
> > +kms_color@gamma,Fail
> > +kms_color@legacy-gamma,Fail
> > +kms_cursor_legacy@cursor-vs-flip-toggle,Fail
> > +kms_cursor_legacy@cursor-vs-flip-varying-size,Fail
> > +kms_flip@flip-vs-modeset-vs-hang,Fail
> > +kms_flip@flip-vs-panning-vs-hang,Fail
> > +kms_invalid_mode@overflow-vrefresh,Fail
> 
> I don't see this failure in the logs. If it is removed, then all three
> failure lists (and all three skip lists) are the same.

Any updates?

-- 
With best wishes
Dmitry

