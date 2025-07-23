Return-Path: <linux-arm-msm+bounces-66298-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F9D6B0F319
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 15:09:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0A8323A1259
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 13:06:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8AD82E7F30;
	Wed, 23 Jul 2025 13:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TMIodODB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE8B2289E20
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 13:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753275798; cv=none; b=TVC4z3/1F1dfQEN4Lty39pILMeypx7fm09UzWnLQRw2MT6AZpkZ5/gKowYutPa24x1XGSvnF/ZVo/m9A2wg9f45i7oOE3jGBFk59EOd3CLKB0n4cAvldb6HhXiLjDlbckkeXog9+EgAb7PU8kcGrb4NVCyacZEHulLuxXRXvd5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753275798; c=relaxed/simple;
	bh=hhGT76V8KdB/AnEeDkwM6i4rqMC9QcTFg6G6rgo2ZkU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mR6p6529SWZFpKu7FqtJm/klw48BG1N26Rp034coPFJckZeuipy5gk8iI/PL+S9hI15TmuRVNjvpl3pcpmZUJePcdq7NooG+apPlrXoa+9Yx9dhICx4BJQiZ/eWkPsr8iFsLuaPkDI6plR7+lf2C3hPfuchkSeOt6GJtsqcz0Nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TMIodODB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56N9G1Cm023226
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 13:03:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HFQXzphQuSnwMWSCOzGzS0tR
	CSVlyDO4GAoV1UJnlAM=; b=TMIodODBr50HYsW3q7fVLc0cNlu/rVO8GRCYhzJx
	eVCOne+qNIuwo2L4P5jT3B2pNxH6NdvxAvAUTDKOMcJmcVWMplguDvbNQpclLixh
	TBphMA1DVNlelKWmJ3yh9qHPCJE9g2b1rAM9l7uV6hAwWCP+p1YPZI4uUR85R3Mt
	f32PQd9dctZA4MTXWEnutWFDVqQ2kiNqi9cy9uga2zBsfAo2EgdNi5sq8R/ZorMB
	uMS9F9N6kp7euZL9hBHw0Egf7jp3WGk/r7zsc0ic3Hc0IarBDRvqxbtNzR8iBbc5
	G5kW+SZWrMJhMkK2bpxkd09OS82lT++gRvWnFpCByCIylA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 481g3er0k4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 13:03:14 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b39280167fdso4957166a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 06:03:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753275794; x=1753880594;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HFQXzphQuSnwMWSCOzGzS0tRCSVlyDO4GAoV1UJnlAM=;
        b=fZ+2h9XdCK3Dlkzn5MwzDTNF//tKXQdCOhfCgsNJMq+xzt+6eKn50VFkvfneKQMEtL
         jZ7ci8dd+jq9YZFN6thm0uTsYrHw9xhyb/hY5bI4PPJaUSpLo5dFdGxBZHNfV2pRspf1
         AZ4VST9R/BhssNoWqmuJ8aQ09QLJksNVDiLoz7DW6ZmemJLRdIRhP+n3biidO1ukH3uI
         6IZoZ3/ha1BUrC+9ESFMhC7EXqOKsenSE662B2RrUFrCrqiNQutjVAkVMI/TQAHci0Tx
         oITyGD+hhzAYqhFQCCRHHC1LEnGLHnCVO0kB+/Ev1xsKoS/S/dB4zOYEs++ho+mDdAWT
         BjJQ==
X-Forwarded-Encrypted: i=1; AJvYcCUDzEVrp46L2S6JIiU2K+EeijH9TKvwM0hgeciZu0SRkh4iHjaZzEHzfrHZndzp2mkO0RlfgmxOblknhR9m@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+oAGfy9IFozn0mSNOpaQ+FOVaqEK7quAL0RR7+/0PZuzOxngQ
	VGDcpgDiDEY3l9fYhWBygLihHXOCTwCtCkOfh+H7B87hbWHclROu1q72fG3BB356k1SP3qpHpF8
	Z7L4gynAQlVBP52doQVGAeSeHqCJr1o3qK0Ji1vmTstplbPcFtYHrRZdU3Zqjrvd1/dhW
X-Gm-Gg: ASbGncscBqNjrrVFYnSsraKIraWKwHhAa0IT7Jdv3Ik3v1ccyrCm9+6pxFJUuL9PfHi
	neF4k1rAX8W8BvIcV4zYB4o1EqLEHvvJ+OReQ6bnU3IcMom4TNik0gvEvA9cfJsXh2C0qM+G/Fk
	ZYCf8Td4vuqTR2zLFNM/lKjwDH89ti8MZEBmCdEUPpqZDaz6WWydJZlCP6EQytbvsUr1Z7V4fqi
	7uKmmS0E9I4FF1Vtv3SkNEN8jLDBAIGOHkO73nuUvTSbl8qJKPSf+70owY4+xq5MtqkIHQ4Iauj
	A0eJXEEnlzeLfsjOd5YHNNcz7PAstsQkn5QvJpyiEg1hKJVGYtp14qLIovcY0cqw9d7EuMtfOeN
	Smg+uQNYHVjGKjCciEp8cZeDa+aSD9Je6FrGYFPfjblRJSZj+N4zL
X-Received: by 2002:a05:6a20:938c:b0:237:c17f:9813 with SMTP id adf61e73a8af0-23d49122377mr4529995637.28.1753275793963;
        Wed, 23 Jul 2025 06:03:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEFDmJryhdzdFntFB7Y2SSkvALhrP5nnK2pjFKNUd1foxAq5uu1XUGR7+ZT77bYOMHIDv5jdw==
X-Received: by 2002:a05:6a20:938c:b0:237:c17f:9813 with SMTP id adf61e73a8af0-23d49122377mr4529923637.28.1753275793474;
        Wed, 23 Jul 2025 06:03:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55a31ab0fe9sm2317001e87.80.2025.07.23.06.03.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 06:03:12 -0700 (PDT)
Date: Wed, 23 Jul 2025 16:03:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: ubwc: provide no-UBWC configuration
Message-ID: <3qlbyt3n6cmrrsh7srbxqwczf73mgd63embvlqvyugop4t7vxl@w367alhkh7zy>
References: <20250706-ubwc-no-ubwc-v1-1-e39552aa04df@oss.qualcomm.com>
 <DBJG7C0L3EFP.BOWGHS7WB4RM@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DBJG7C0L3EFP.BOWGHS7WB4RM@fairphone.com>
X-Proofpoint-ORIG-GUID: 3rDurdck98Z6KRVnC-zTTDHFlT91h9bU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDExMiBTYWx0ZWRfXzCDw7AQ28U6J
 WHoMNwJq0//ETEtAjaayxGjSzmvHgQGpHB0Nh+4vxytbgLkTP95A3oJdDMFLrEGrST83xNqv8rE
 F3NhpQEQVedMtUYyLnQjxCccRCqqcPt9S7DBGZQMyhkIQOfIjha+SVVgoZK/SosM678DJofw9am
 0Wib++3KkzYvjc5VTLcFin65ritebRBK+mMEZ/6zf6USy3DwXwhJXchjd0WJeitRtzBjCqVob6g
 BsJ0K2MFcPsKBgc4R7jHTcH1yuT7sjuCajP5uLxsAhe0FwazZ9GKdEp7LyW1bag4fYXQXtNGmSo
 MOHUaIB1E1QQmzidDFHV2hJv2lq0GZDBO/IZRkiJ4fXqOmW6zvGGEYbuhAKcTVx2fgtTN3+8/s/
 x5hbCNDS8cS1adqBNJ7YBezcFfdIhHWpjlVzB1gy0YRKFsPUiIGb6KFSebxoFt+LYagIUXNO
X-Authority-Analysis: v=2.4 cv=Q+fS452a c=1 sm=1 tr=0 ts=6880dd93 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=EqyKFdb9TEg4igYaHI8A:9 a=CjuIK1q_8ugA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: 3rDurdck98Z6KRVnC-zTTDHFlT91h9bU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_02,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=999 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507230112

On Wed, Jul 23, 2025 at 02:54:04PM +0200, Luca Weiss wrote:
> On Sun Jul 6, 2025 at 1:01 PM CEST, Dmitry Baryshkov wrote:
> > After the commit 45a2974157d2 ("drm/msm: Use the central UBWC config
> > database") the MDSS driver errors out if UBWC database didn't provide it
> > with the UBWC configuration. Make UBWC database return zero data for
> > MSM8916 / APQ8016, MSM8974 / APQ8074, MSM8226 and MSM8939.
> >
> > Fixes: 1924272b9ce1 ("soc: qcom: Add UBWC config provider")
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> > Note: the driver is a part of drivers/soc, but as it got merged through
> > drm/msm tree, this fix should also go through the drm/msm tree.
> > ---
> >  drivers/soc/qcom/ubwc_config.c | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> >
> > diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
> > index bd0a98aad9f3b222abcf0a7af85a318caffa9841..df074520a8cae1a202a14ca094903bb1e7389066 100644
> > --- a/drivers/soc/qcom/ubwc_config.c
> > +++ b/drivers/soc/qcom/ubwc_config.c
> > @@ -12,6 +12,10 @@
> >  
> >  #include <linux/soc/qcom/ubwc.h>
> >  
> > +static const struct qcom_ubwc_cfg_data no_ubwc_data = {
> > +	/* no UBWC, no HBB */
> > +};
> > +
> >  static const struct qcom_ubwc_cfg_data msm8937_data = {
> >  	.ubwc_enc_version = UBWC_1_0,
> >  	.ubwc_dec_version = UBWC_1_0,
> > @@ -215,11 +219,17 @@ static const struct qcom_ubwc_cfg_data x1e80100_data = {
> >  };
> >  
> >  static const struct of_device_id qcom_ubwc_configs[] __maybe_unused = {
> > +	{ .compatible = "qcom,apq8016", .data = &no_ubwc_data },
> 
> Isn't also qcom,apq8026 missing here? Not sure there's any more
> missing...

Yes...

> 
> Regards
> Luca
> 
> > +	{ .compatible = "qcom,apq8074", .data = &no_ubwc_data },
> >  	{ .compatible = "qcom,apq8096", .data = &msm8998_data },
> > +	{ .compatible = "qcom,msm8226", .data = &no_ubwc_data },
> > +	{ .compatible = "qcom,msm8916", .data = &no_ubwc_data },
> >  	{ .compatible = "qcom,msm8917", .data = &msm8937_data },
> >  	{ .compatible = "qcom,msm8937", .data = &msm8937_data },
> > +	{ .compatible = "qcom,msm8939", .data = &no_ubwc_data },
> >  	{ .compatible = "qcom,msm8953", .data = &msm8937_data },
> >  	{ .compatible = "qcom,msm8956", .data = &msm8937_data },
> > +	{ .compatible = "qcom,msm8974", .data = &no_ubwc_data },
> >  	{ .compatible = "qcom,msm8976", .data = &msm8937_data },
> >  	{ .compatible = "qcom,msm8996", .data = &msm8998_data },
> >  	{ .compatible = "qcom,msm8998", .data = &msm8998_data },
> >
> > ---
> > base-commit: 8290d37ad2b087bbcfe65fa5bcaf260e184b250a
> > change-id: 20250706-ubwc-no-ubwc-3c5919273e03
> >
> > Best regards,
> 

-- 
With best wishes
Dmitry

