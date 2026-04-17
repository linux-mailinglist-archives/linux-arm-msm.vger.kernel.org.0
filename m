Return-Path: <linux-arm-msm+bounces-103560-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8MKXCmN44mnh6AAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103560-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 20:13:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9172341DDF7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 20:13:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2E79430471FE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 18:09:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81E9033FE27;
	Fri, 17 Apr 2026 18:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TjAU7Swt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZrwXpjAD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D50A34677F
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 18:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776449356; cv=none; b=TLQjfpZiLyLQjgeQt9rdPNogPP5zwwGv5Iiw6P0dYTcWTAGvcr7XeSmrzCZUxmSjk0J6t/3UE8FG14LgNScrxDFJ4Xlkeja7MuG41pXHoDuMXxA/Q1ZxmtXibd/UNwrmlWfzHApYiQTiB0bcD4HXUwkx3B4s0AJeG8UpiQ/pKOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776449356; c=relaxed/simple;
	bh=q9rCGAiYadnYJ7Fe7JsPJRrWtMNydJFw/DoXJl4Rz94=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pbz4nbvB35Z55w//mnbcrd39b8T2disRfsvwiSzZ1BAFwFd1596vyz1giEYqrtIuPOFEnGbwYuitiCxEpBE5GsM+7L2vJtTnEsC2AqBLsNwV4JReJItETI5cAHUB7fr0zqMrHNKxHRpeQPJfdHVp1IaWlD6jPHwp8QB1yUiU+wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TjAU7Swt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZrwXpjAD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63HG4Ukh2945307
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 18:09:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZyeGSFzRFFB+mR/bjfoEURvl
	sP3Ob9G8OdzSVxeCj/4=; b=TjAU7Swt83FIjs0odS29FXnO4JEvQKq6K7mFLtwA
	QpJFOFkdc95KgFlk2BWqZodRr35dooMp8vyjq/ZH6LwdnJrVZn98hdj5usKnXaVx
	4ERPjGEuyxf8576IeCFP3sGI2XJwSnpN5QzXVsgANWfWqy5JWrMNB/NLsouuFb3k
	TfipPCGdR+9Nj442mM5SNafwkaXGMS09gTNGl8KNxb89CHGLFmsj+FxGWYxnNPlc
	jKF4LTPZ5PbXWrTUp9mTlrjWarS8QUrV86ol1pldCKhWrVHHSS8t4rD7FLB/aYDC
	t9GTiuFTqVSHc8cvpD8EVqTXr8F4E59USchNv7c2EnmnUw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dkdgy2upr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 18:09:05 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b44f7b7bbso23286201cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 11:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776449344; x=1777054144; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZyeGSFzRFFB+mR/bjfoEURvlsP3Ob9G8OdzSVxeCj/4=;
        b=ZrwXpjAD/3hAphn6r3ePAMA8RrQ57bosERxuyHxsCNGds3gVCegx8YAOJrX8g5okDw
         iNBszOBTgAa7lmuCj6TMHJulExp2NTtR5sNiHtk/LoJ+7WnDROcjDZlhFU3YpDN5A/L0
         DpTj88tfOQ3k9fbHXDnHCrJOZQQ/ynPzCwiwA9eyR6XxVP4XH+kVqpY78u83Pl1YDUSr
         8uBt6aWFSXWYwtw2klJoab/NPG2y0qwsmLPoi+zndlA/z2R7ihSFn1OJy+xy8DjggXVe
         mM0Bfts7B99l95gC02CaxIdt4pyHv6hWWxzHa9mYptG1LftESR9uf7znfiV+89NiO3O1
         xM1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776449344; x=1777054144;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZyeGSFzRFFB+mR/bjfoEURvlsP3Ob9G8OdzSVxeCj/4=;
        b=NH31ine+7qQLMHovuEmaEt0VraW/cC44j6iLSRwbUiX4Fmda0OyMdZnnxiO5+MjgHG
         NnOwP2KhKXJ+kMQ08TpafB9O4mPbJrviGTywVJ5l9sn74VpCGk6aCwi2D7EA0mAjGynv
         CjNmyo9BAApqILvQKojjGilVN999pMpS0w0qCyjY0VvS8h413DSLc1dBtvDeeA2jmAyg
         V0M5BeuV0jMzUoiuyzP3ftDwwLfuui0YPQJpo02CTkEGzZoLgY3Cw8OXy/3qOpFB5bOz
         F3+Yxt3xDPEqddR12BYr6yK5oDvhmbSaw1xOEoqPMdHE3yZHSIoBUL9Kpp48gudKoUU3
         vU8w==
X-Forwarded-Encrypted: i=1; AFNElJ9tuEkUHqAW7So23WAA+vYe0DUx7QKxD3gj7Itz8h/t/Chsz7BORkjuIs/eZWzoxSOq6DDTabH0nbh90FsW@vger.kernel.org
X-Gm-Message-State: AOJu0YxisNcKyMvt1t/+P6VrTOmFi+/DIkoL6nbi5r8/btHfRI3/jd9m
	WYouuOJFvDOwffn9wXsYOh4YmuGnnyCdnHXh1gLubR0Uw3VdYOa3eUzeTt3VROx5QHubTggr0Qo
	O3gZcmHXEXB/tb9Ipq4n1f6i+k0rff3ikG7vdT30XZHtc9LpPH9tjLxUf9kdLaeF/4CfG
X-Gm-Gg: AeBDies+kYT2oLxqCIgjyVTsKxrfgMUvqCcTrZ3ZnV7Tzmdexe/z7lDiIOpIwrUgkSv
	b4w6qN3nJpvLxmfMvWeUBTsJ9i2c0SUvz4cyZP3ehLqv27ZslY7zOlvTjt3OptNY4rSqlTZ2h4K
	0PnM5CneUi1loXNtwtlHPJ6vHD42NKE3jsEg/X5H1B5hku2iMvoF0GUYJDwD5/3JMC67YjL3WRc
	jo99TK3S2PWxqHoGvqNGaBHnCs7cGgk0zn5zzqKsU99nv2g2W9UKnG6LaaWiHXayWFc58PbdG6W
	CF3B2enYjIzKXdKU7zACuv781Jl++KTTkafozvhHB2RqEOmZJjY9y3a3/COjHjz9IBDaAyDFujC
	bPiigZHYQiNnuX/M4qd3J9/ky43s8ja7xK5rTQQcdtfhD4+JuOeu3cmi2n16CHhtd3+MNpLHUnF
	Xd4L3NmnGKLMRtRkGAzJXjmXNNE5Jp/J9mzWAfkZFLvfyGlw==
X-Received: by 2002:a05:622a:4245:b0:50d:8e6b:96ac with SMTP id d75a77b69052e-50e36ec5cc2mr52609151cf.58.1776449344008;
        Fri, 17 Apr 2026 11:09:04 -0700 (PDT)
X-Received: by 2002:a05:622a:4245:b0:50d:8e6b:96ac with SMTP id d75a77b69052e-50e36ec5cc2mr52608641cf.58.1776449343458;
        Fri, 17 Apr 2026 11:09:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4187e1131sm612102e87.42.2026.04.17.11.08.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 11:09:01 -0700 (PDT)
Date: Fri, 17 Apr 2026 21:08:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Nickolay Goppen <setotau@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH 2/4] arm64: dts: qcom: sdm630: set adsp compute-cbs' regs
 properly
Message-ID: <ero6offucpaarr6vo6vjqxf4tlfpjnshlu7rsjllefh7wggn25@k7lfsyznmrik>
References: <20260415-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v1-0-03b475b29554@mainlining.org>
 <20260415-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v1-2-03b475b29554@mainlining.org>
 <455942ab-a55e-48cd-a37b-6ab9efde84f4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <455942ab-a55e-48cd-a37b-6ab9efde84f4@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: BleaoilpFax57Tf76h47HxZ7PY4PFA3I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDE4MiBTYWx0ZWRfX9bEf6ubcnfdv
 liquTPIB+6tjH1Kos8EtVZB7bJ5b09L/098QWMbk6x5lTDcxbM98UFTCuL8ZyAme8gseVwCcT4/
 LE0l5OHUJCg3Yv8HGgqJWRWYO6VFyqzm+NHEAuUJR6GRef0rS63Ohu//5dVKfMkdAEXIaHu8yre
 uxMm0UGjGpR7esjLFkInVD+8eezcNSRP+f+3cE53iL2CR1pra8F8B0Oz6azUQ3i76C39YOlxZbj
 eUg0oGLNeZPg35Y6mjF2hQR3rlVcfWdXqSDI/iX0XVK8CS/QRbJ/9ZZWDC2BVWqPL0gXvbiFc1o
 K1libVE6H1MA9q+A1qQU3upemr7AHJy/ewyN2U9f2noQQSMV1b6IwzM8eBK1KV5uBnOfsPb+0a+
 4atCi0YKRBJhqeg6gxSCtvXntatm7RS5tLTwBr/eK35D61/NlpJvXapUP4QiKpeHz8JdTTQtf0q
 im4b36aScMBUce1KGCg==
X-Authority-Analysis: v=2.4 cv=GN041ONK c=1 sm=1 tr=0 ts=69e27741 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=OuZLqq7tAAAA:8
 a=EUspDBNiAAAA:8 a=qIOqSNWHgndfu5AQeQMA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-GUID: BleaoilpFax57Tf76h47HxZ7PY4PFA3I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-17_01,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604170182
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103560-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,mainlining.org:email];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9172341DDF7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 15, 2026 at 11:50:09AM +0200, Konrad Dybcio wrote:
> On 4/15/26 11:40 AM, Nickolay Goppen wrote:
> > Changing FastRPC compute-cbs' reg values to matching iommu streams
> > solves SMMU translation errors when trying to use FastRPC on ADSP
> > so change FastRPC compute-cbs' reg values that way
> > 
> > Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
> > ---
> 
> Fixes: af2ce7296643 ("arm64: dts: qcom: sdm630: Add FastRPC nodes to ADSP")


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Konrad

-- 
With best wishes
Dmitry

