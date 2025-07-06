Return-Path: <linux-arm-msm+bounces-63844-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BC52AFA453
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Jul 2025 12:08:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 26980189E750
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Jul 2025 10:08:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CADBF1FBE9B;
	Sun,  6 Jul 2025 10:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RHOfC2aT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0409A2AD00
	for <linux-arm-msm@vger.kernel.org>; Sun,  6 Jul 2025 10:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751796500; cv=none; b=DRmVozFsnB0B5nK2KJH11yA203o52oqpLuwugDwKfmM/QUeNZfl6+QwguaM3+Ml5NslkeXrpNWSiZ+1lo4nobCZkfrtJGCirNtUSKJ1UDPYsaTiwSMJVES3tMG5ctIZnyK8uNQiLjXSnO96rHgFBUrT4ME9vlpjnWPkxJkR4uVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751796500; c=relaxed/simple;
	bh=pGpR/Ul2mRfthu6duxkNeXnC1ePuVsMucysS7cKrgws=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VlHJNoNkc6h0+sSbkUp2IooDBjTGnMn0v6I+fdG3MurbkikInQjuRoFCecJHJBa27/w7zKuGLc0B6oysNlQth4rAgO1V8gXZi7LP5/qY5wvzDHFIoEzQxq9XEmWH8nXcq0P4m+na7fAnkfrXzm8r+DKcPPHZgykcM40prm0bhSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RHOfC2aT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5669X2vG024466
	for <linux-arm-msm@vger.kernel.org>; Sun, 6 Jul 2025 10:08:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9rxBrJduKA1XwbX2eE5GJB5p
	6Vs6GBgukIccWci1vVo=; b=RHOfC2aThtEopI6kYtLUc0I9R0KIMEy4qxzqLTCs
	+gYKgunR6tDHrZHICQ1FFvs8UEcA0x4Q89gVlNHYegiYruLxX6FG6Kfpg9zbiwu4
	vBU9NgOGCkIMeGD5QMuz5rl/iqSzuBhah4b2Zervl6Hz3oRTP/yp1AgET+OqetpW
	BAGnToSn+YiIV5cyI3Yn7wht35AGcZokpvd9OuPxyEfRIkehKfU4FHjJn2i08oF0
	rrEEzuj1oGagJv9SzqU16LvAtR7f6oB0Nv3rCnYc/i9eLPvKKUiUoIIxHM+i2S1t
	lR20uCS/O4e2uK3T2z58C3Lwz5Tc0TCwPCaLkxQxFqYz4w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pucmbm0v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 06 Jul 2025 10:08:17 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d5e345a3fcso202967685a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 06 Jul 2025 03:08:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751796497; x=1752401297;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9rxBrJduKA1XwbX2eE5GJB5p6Vs6GBgukIccWci1vVo=;
        b=HXHer8bByWcFamapsC5y/EFHwenZ+nF//OhBP3vUYwZmNgcipZI7L9RHAnAbFx4GTJ
         +z//8gAU7sLlBPlEPzQDbfZjScnQnxVCe89w36AatkSjWVpBHmCYzKSCX8cOsWzPsmir
         gvjb4bnMSIkrdBuJNkfLlWJNriBZ5KivwglmJySXXYuC+6boMGB5kt9iQ7P7owB5fbLq
         3e54Kv+eOy70No4xSG2+eMO4wQuCinHRFdrVpt8ij98dIRa+qjmUtdWjDx7u8NNVh4w5
         YfkNWLGT8oauIkSa4Q4vKNLxtXidP1bBeMQoSkTqpjUL4PpwsynMm0JcA+jnAK9qe6Q4
         Fe8w==
X-Forwarded-Encrypted: i=1; AJvYcCUOU4Y66zn1V6xk0x9q5NYN+bRtk//wcm3thirwOZkiJ+qP2f5WaBJwMkoSN/RjHf7WOAEHRvkOTOLsP0pU@vger.kernel.org
X-Gm-Message-State: AOJu0YyTNsnhqT8b0vFsSOc37GbsqGxeXuRQ4dS747lczVcJzlGBJG1g
	M1cqOG6+ZgYAQYMF2stAcAfAQbwXHFETgixEfqhdI0wI9byqIFmD0Bh8dkT2cgmLChVNYyiICGS
	ptbpx7GnOO6HLcso0SbCtmpwCrL4nGJIY5qEsAxquiJgHvG5B3XDprOmshiHslBlfZePF
X-Gm-Gg: ASbGnctuy9WVeyjpBz2+OjkyBOujwSgG/0bbzbi28FZ/G+ZaBMgLk0bvkr1XTIym3IL
	gf1z1c1TSsfg+xpThuaPSl8dTzsexW1z6EhrvyVjdTY+WW1BAxi1APVVVBhmO4V1km5lxp8mPfv
	JQ65xgCV12CQ7Iy38DwL4i+3clM01lpPLbhnEwY+RXkgWE9VNdhj7jSg1C0Oxx4i0nXk3S5Fgkn
	yUShpQ3QmZvtgOafzfSo8PV8qiuck66quhYlmfIBWBUez36TD7UNE2MR5ZgXay699Igqq5iYT7w
	0iRZE4/dvxpYaUaD/+3FuHxQZtNeRYaGdy18KTWgXGbBLMuPaR6BKwmql04dfCYo8ujunnUacC7
	hNYP111WXpdVixAnEIeqGikBa6EmfC1WpkAw=
X-Received: by 2002:a05:620a:6884:b0:7d5:bfb1:db0f with SMTP id af79cd13be357-7d5dcc9de63mr1158836585a.19.1751796496855;
        Sun, 06 Jul 2025 03:08:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH2rJKIVCI6vY82Px1cq0ub41yacho5CchNwdzf/+6nXejkmotjHKGVY5YMkNYBSccOGLqJZA==
X-Received: by 2002:a05:620a:6884:b0:7d5:bfb1:db0f with SMTP id af79cd13be357-7d5dcc9de63mr1158833285a.19.1751796496410;
        Sun, 06 Jul 2025 03:08:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556383bb162sm911052e87.15.2025.07.06.03.08.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Jul 2025 03:08:15 -0700 (PDT)
Date: Sun, 6 Jul 2025 13:08:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca@lucaweiss.eu>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] remoteproc: qcom_q6v5_pas: Use resource with CX PD
 for MSM8974
Message-ID: <znv7ish4ufkgnzfwyxjt2ercdvemxh644zwpqthj7rtf5gb4fe@auvbeemdlbtk>
References: <20250621-msm8974-rpmpd-switch-v1-0-0a2cb303c446@lucaweiss.eu>
 <20250621-msm8974-rpmpd-switch-v1-2-0a2cb303c446@lucaweiss.eu>
 <hwewzj4ygfbb22vxrahjfc3b4oxyagh3nkd26bs3p5k2fcxr6m@mkgtyjkxz3d7>
 <226fd16c-8071-43c7-9ecc-9bd95e319aaf@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <226fd16c-8071-43c7-9ecc-9bd95e319aaf@lucaweiss.eu>
X-Authority-Analysis: v=2.4 cv=GdQXnRXL c=1 sm=1 tr=0 ts=686a4b11 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=dlmhaOwlAAAA:8 a=H2ulDEPk4kSp5EVQF9cA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=y4cfut4LVr_MrANMpYTh:22
X-Proofpoint-GUID: fbghTxS0Vlcfa21qk1W6DjqPfqGQm-OU
X-Proofpoint-ORIG-GUID: fbghTxS0Vlcfa21qk1W6DjqPfqGQm-OU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA2MDA2MiBTYWx0ZWRfX06FCzZX7XTOc
 im4Fh9xJYi7GJUTdMtF2HitPImx8pHrRfOPfy2B2F5mzDNAtCwHM4ydhKBZ2hxarTwvmP5ZJhAo
 bYrDmL2smLlFo/3Q9UTCyJZRYJA8f/Zb4jgB4QWfGVWx/r1bqVUehZS9fsv1ojtQtDoQTwyAePa
 9cbJKVrHBxpFNFU0U057grJAsrhZue6KMCjBAVoMffpKHT4d7hZeNzERCfCHs0mrOgyDpxEJ1z/
 koCkr+FrCrwP0b7KP+JIV/WTkBFLHAwUAZKLoXC1+rfHAhe6+bR1fqpFHiQYeerwcCYCYSgvEyG
 Z2CzhLvhLPBS4LLwXRcsBE5XR2g0xdodgQ6PhikrrvhkHCbBCJTo6iK+QsAX0qcevFfvuHTmk0+
 /8hpxIeou1ywY0sUKtmIthGc9w3CpaT18bn6oc9dSvKTtfT2A3riHO6DRbOLINx2e65X53I5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015
 spamscore=0 suspectscore=0 mlxlogscore=999 priorityscore=1501 impostorscore=0
 malwarescore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507060062

On Sun, Jul 06, 2025 at 10:31:38AM +0200, Luca Weiss wrote:
> On 05-07-2025 10:57 p.m., Dmitry Baryshkov wrote:
> > On Sat, Jun 21, 2025 at 03:19:57PM +0200, Luca Weiss wrote:
> > > MSM8974 requires the CX power domain, so use the msm8996_adsp_resource
> > > which has cx under proxy_pd_names and is otherwise equivalent.
> > > 
> > > Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> > > ---
> > >   drivers/remoteproc/qcom_q6v5_pas.c | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > Hmm. You are modifying the ADSP configuration in the driver, but at the
> > same time you've dropped CX supply from the MSS remoteproc.
> 
> The qcom_q6v5_mss driver has this support for .fallback_proxy_supply, which
> are used in case the power domain is not specified.
> 
> So no driver change is necessary in the mss driver for both old and new
> devicetrees, but the adsp driver does not have this fallback, so that's why
> the adsp config is updated.
> 
> Does that make it clear?

Yes. Would it make sense to implement fallback_proxy_supply for ADSP
too?

> 
> Regards
> Luca

-- 
With best wishes
Dmitry

