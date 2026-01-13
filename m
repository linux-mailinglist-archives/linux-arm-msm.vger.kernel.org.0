Return-Path: <linux-arm-msm+bounces-88638-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D2C36D15FCF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 01:29:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 95BD23068BD6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 00:24:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58B31221710;
	Tue, 13 Jan 2026 00:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WnpIResj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e3x0FbNc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D38B2236EE
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 00:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768263896; cv=none; b=jgeRzr3Os8r97C4TWzDJTuIPS+Vk8+WAMJogFqopp3JLju1wljCRlhjHEMe2RemzDJ/zNg6uOtLlSjoKV055NFX6F4XKpnccKadFX2jV6W7aC2aSNKbslVqi8WnkChHzoMnCzIrINNOx2K8qDEAOX0agbYlju91+bxy7WEX8Mao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768263896; c=relaxed/simple;
	bh=ZV37RPsLbilt74163TknjtNQ92AsDBCHzeWzEQWPdbw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JOigjAEvl6YN+XnuHvm79Q+x0QWzk11H0+EVm6RJAaWvnSpboUjvx6GjxazA19cTHLz0Y4u9467nGSqOoUbPy7JDU4IcBXr8/qkA8+PnvQSUY3ja8GETYD82qp73NjMiTeLRqw+EpXkNAMV8desanMdqJvnbGqDBAGy8tTRwwNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WnpIResj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e3x0FbNc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60CN51K72810456
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 00:24:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dzxkXozKtULhcUZuJh1MUOqg
	XLBE5AuFunSWmMnWvjI=; b=WnpIResjGpzemU0cGefeUfym+RgYNJJ4pdc3juM3
	DeeHYy7ACajDJoQxQAl9+ci16isOb7UB17G/i3lB3w+Lgez0c5cXN0uvrSNRRCTo
	ARm46dTkyaDL0+muCBT8RYs9LYwrWaexu8mWYjgIkyq19idWKZANZgqmbsKLaDHc
	BMTZcCn1ZyMxcpVJIHKFXb5LyQRjVttqZtxI8W/54kd6JrLFJ1SnWGzl9ZEz69Rk
	xTbOqRGEkDuentWxforWADOoBXBVXMCvdKAhfVvkl/c2FpSNxh6lZk///x3iYj94
	gYiGy4uHhLUM9m1D4S5mH+HIrdNWZkuN4G4OBAxhvar9tQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bn6fbruku-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 00:24:50 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b9fa6f808cso2093413585a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 16:24:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768263889; x=1768868689; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dzxkXozKtULhcUZuJh1MUOqgXLBE5AuFunSWmMnWvjI=;
        b=e3x0FbNcntKmsRnM++0OwfmxH/RLdxypTSCcF7cYqrBZl9Se9dOABnBuxBiRJ7AKtp
         AkCP4Q3njXXaw3bmz2SWd0NIm2uOzH0gcbA8DlXDC0nr7t3q2Ova4R3Rwmsbk0zYiU//
         hyfqvqobuB9Y6rNwF7xUZL2VIRU5D1MKPnqLISMpF3viSt3bs+olvgnMlBU4zzNWRY+h
         ao/HwGC2p/d0RJGPL4DskAmnTO4BW/Yi+FGBaJfXAcBz7sCCuGbxo6/KqfoeJaTVrrUJ
         togc3lDwTobd7C7pCnlWF3lWtpBqoRDshTDrNWGUBw0VIciJRnlVkCMs8zdnpKqf5Fuq
         LIqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768263889; x=1768868689;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dzxkXozKtULhcUZuJh1MUOqgXLBE5AuFunSWmMnWvjI=;
        b=YOo+AUBNLCKucpcsH5DDG20PtOcy46rn14Gmizhep+IujoLMXMzbRQayvz4XOemW9x
         0T/Fv3XVq2o43aY+F06LvBS8r45awxJjLgwQj7+YkbV1Q/WzuEEAnZdCub2DNVCZtm5r
         J9t5owsYZ41Pk7edDPGdLvylupMaWywRYUYEhgAWNSJENDn4vYJXkgmQxifuPDs0rDf6
         MD5vroLmQ6Eb+xuB0RAplMzVq7lo4cvhIEf9YeMZULkHEmlnp4eNG4tSaVuZjV4RWY//
         9Y7m/SzR0H5u1sE5egBi1OyE5O+Bi9T4NLoCl8dO96v1MXUliBr5u5wXfg3a23w//fnN
         FLIg==
X-Forwarded-Encrypted: i=1; AJvYcCVyKBfkr72/7AYfY+syoJQ8A7/gsiSyRCA0FLMhY8tDUs0l6HcMmUAE1tIzzGA7c3NhLipxdfjkooPdj2kn@vger.kernel.org
X-Gm-Message-State: AOJu0YzSVNpPSiRZESlzbCvmQy07Pi8/7eIDYpyQ3W7X15SHjO083QNg
	5YrTRR36OybFPUqi8oykCB0soRIaq29r4DX9iP5uLuOE5ayqcuZLepcSapz4WKG5DG9D01ppqll
	vV3TIjz3/qz6gH4ptwOb76tDKebkg67W6mwt0QtEvljTB+wx+5Ire22iNEmX49PltzSTu
X-Gm-Gg: AY/fxX4uIIJ1Y3dulOn9V5lw5DACtHSyUjNZvYsPHu3YqxyRYhInHdbQw7V0DSYIGXL
	r8PgQ11pEDCeY8SYd9k/c4tuY/EM10cQ5Ej+orotM8UFjZJTWW9QS7dNXSC/6x2Ynnp61q+Gny+
	SLT+w2qjxG3XB4pws4dUkLCJE/W03jI/4HCvcx5NGEKsnQ8ZUnS2fa3AgVWYFocyn+t3kqQSlcG
	0l26YhFjfqjrvZmtTueFK8HmYx0cIxOQOiihFnXLk6NIKs5L0xlAC82kpPHadrdA4sqtT2YQYFx
	H3qf/NIQwjErtD6WT7q0JRJvhwAAIvfVCwL7SbuLEnfUpJExteX/eSC35cx8S3ExKtAS5AxFk25
	Dly39AuL1ASu9+7FOucerkprH5ot+BZ+iNnKBfWm5iSwwy6ahvmUrmg9Kqsl4LqPZ1ATtk/T1du
	sIkT50TZyUg6YlRXmBN6muxwc=
X-Received: by 2002:a05:620a:4802:b0:8a4:e7f6:bf57 with SMTP id af79cd13be357-8c389368bbemr2941977985a.5.1768263889561;
        Mon, 12 Jan 2026 16:24:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEyjpi+M7spreDJMit+P3ck5UUiEC5t+Si07Rff8PFo3t5TmSHbXB39Wl8TRKez4c9R2Z2VvA==
X-Received: by 2002:a05:620a:4802:b0:8a4:e7f6:bf57 with SMTP id af79cd13be357-8c389368bbemr2941974185a.5.1768263889102;
        Mon, 12 Jan 2026 16:24:49 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-382fc17b990sm33674221fa.40.2026.01.12.16.24.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 16:24:47 -0800 (PST)
Date: Tue, 13 Jan 2026 02:24:44 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 02/11] soc: qcom: ubwc: add helper to get min_acc length
Message-ID: <spk2wlfjgrtvkbxk2rzklsdg7ojpcsehl6c5fzaergrq2chpcs@p6s7px3lrtt5>
References: <20260110-iris-ubwc-v1-0-dd70494dcd7b@oss.qualcomm.com>
 <20260110-iris-ubwc-v1-2-dd70494dcd7b@oss.qualcomm.com>
 <5594210c-ce25-40ac-9b5c-69c97eb0bd72@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5594210c-ce25-40ac-9b5c-69c97eb0bd72@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDAwMSBTYWx0ZWRfX6J1mrHOBJYoq
 3+HixiEJaftIuRWE10x8WcRBY3hcIGO6AINSxAiFiIMYsP22f+Mhtd1EoZjme2Kcdr8eXnxVd/s
 84hNDKlx1yupKEw0TYun9mhVBL6Xc1ZbMESk3cUvh41iYYWxc2uXINE1Thcrl5ou1mLn8/eWI46
 1pUlWbHEYtwKMh9JBNPCgK22YHg9FSQOW0jxzrDnOtwa58PbsldmjrSIu9dd4dNZCqwEweySqjz
 Z+wNPcEj//WLwdjhlO2rSJiXEJX56m1K27/Ss8wBXEFJ3lV4c73Nbkd1V5dYWlKNgOIuy59f8np
 6tt+sWcw41TKanQ2PUxU/mgOGQUMNnAEE2tqOxHsEtRpFB/yK1yeecbOSEWW0WhRYZm9HOes3dz
 E+3oylcoPyser+2efXba42PETvcvX/Bf3IWrd3UVO0cWkQVg99LBdFoiEy8DQXTnCzBFpwXAZw7
 ZwK9UoyxZnZQQX8EVdg==
X-Proofpoint-GUID: O_LO9TqTxybRiDaIEElueEYSPXVWo9Tc
X-Authority-Analysis: v=2.4 cv=ZrLg6t7G c=1 sm=1 tr=0 ts=696590d2 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=V2uskYJtpVaDOKukMOMA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: O_LO9TqTxybRiDaIEElueEYSPXVWo9Tc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_07,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601130001

On Mon, Jan 12, 2026 at 12:08:13PM +0100, Konrad Dybcio wrote:
> On 1/10/26 8:37 PM, Dmitry Baryshkov wrote:
> > MDSS and GPU drivers use different approaches to get min_acc length.
> > Add helper function that can be used by all the drivers.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  include/linux/soc/qcom/ubwc.h | 7 +++++++
> >  1 file changed, 7 insertions(+)
> > 
> > diff --git a/include/linux/soc/qcom/ubwc.h b/include/linux/soc/qcom/ubwc.h
> > index f052e241736c..50d891493ac8 100644
> > --- a/include/linux/soc/qcom/ubwc.h
> > +++ b/include/linux/soc/qcom/ubwc.h
> > @@ -74,4 +74,11 @@ static inline bool qcom_ubwc_get_ubwc_mode(const struct qcom_ubwc_cfg_data *cfg)
> >  	return ret;
> >  }
> >  
> > +static inline bool qcom_ubwc_min_acc_length_64b(const struct qcom_ubwc_cfg_data *cfg)
> > +{
> > +	return cfg->ubwc_enc_version == UBWC_1_0 &&
> > +		(cfg->ubwc_dec_version == UBWC_2_0 ||
> > +		 cfg->ubwc_dec_version == UBWC_3_0);
> 
> Are you sure this is a correct heuristic?

No, but it matches what we had in MDSS driver (and I think it matches
the chipsets that were selected by the GPU driver).

-- 
With best wishes
Dmitry

