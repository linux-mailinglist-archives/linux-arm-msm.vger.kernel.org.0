Return-Path: <linux-arm-msm+bounces-60992-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DD29CAD5885
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jun 2025 16:22:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5EC207AD5D5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jun 2025 14:20:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C41C29ACD7;
	Wed, 11 Jun 2025 14:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W1sgz+rH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E72A7296147
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jun 2025 14:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749651568; cv=none; b=DFC2o2wBPaPYXH+5nx9fNbfyEKj75+EjC6u05a3/RS0edXIDWn9Xgm6Uf/6LDppomDrqffiUAhv02pTSc52tg1+t3zbn7sv3rdndSLXDbVAW8ATGRNuERnyTsduvhglXzJ4bSIZfqgOyYpZYK+xFh8moGW+XK1sSSDcdE1BpbYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749651568; c=relaxed/simple;
	bh=UfnHdSKZ0T9IHQZh4HA/F4jJyg+5+9FOJsW1zZ6W8Mo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C9ng90KNs5NF3OHlLyzHGre8XdFPwODpXrYPnDtgP6vpqQz1AajqMRyNZzBmKqsMioc6dvKWWslOEUG4xHBZEuKkSwaeUR0cJStl9UkVMc1y1DoVeyX5OusKD7zfc77Uyb5uYt6YaBdcP3uzXZSopDLEm9h1MwgCfAu78P80dxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W1sgz+rH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55B9DI3E013866
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jun 2025 14:19:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=874Q5YVFPtejmOnGeVJRP8KZ
	m5kEcEGmP2NS8rGVaww=; b=W1sgz+rH9iaGWziEFkvmzRbJOZ1/u+RfoZOJNjxC
	vLez+0c9NEeHtJclxnRVEXeGByYrf1UfJt5vO5oYxAPlQcwzm4930nv9G/ls7FXO
	sBL9Z8XJWt4sTSBODjMi59Ke8d9pI//8NMN+vlvWHZvvYdsCJNIrsK76XJ1HdQqs
	TINgf41whSBuPMl79Qr4BE8FEV7C/P70bCx3K0u85WiWkpqJ8mXXAP+DfsJX7NeR
	y6y/RIhbbzf6mMk1+i7+qyzmKm0Gf4jJ+Q4VB2CyPasVIDxutrCc3ikJAyb0A1DC
	d+YI6EGIWDX4r2aQCXfrFLMHiNiDfwHr7C8vNegGCHQ7Fw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 476fmncuu6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jun 2025 14:19:26 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4a442d07c5fso142981281cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jun 2025 07:19:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749651565; x=1750256365;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=874Q5YVFPtejmOnGeVJRP8KZm5kEcEGmP2NS8rGVaww=;
        b=ny4oHXXINKiX40g59lPnBs2Vtq8a8hD7iBlx9aG3Ro8o2QRBCEBzb/NN2TmF6dg+VA
         gbD4eyhdLwEeroiSm2o8GUvqxwk5mkD9lG5JMAUJH1h//kutpO3F6u+XkD/MD2LLciOi
         fcYw9hTei5TluPqHB2fnnZ323v4/BsWk39IhsiOxamoQaMTXiNCKeD1Ht4EfsUiap+0I
         ZFcdTZ7CZ7Osc1ukOx+xB/y72Ci6Zos2fZTsd+8qqM3pxmNnWmU1JJrFHZxIWOmPLf0R
         6zvKtLbow41GRalEVZblVNyd804E18hpcg3iVZWjUMxds/fruY68f+KL/v6ifgO9vfou
         q1tw==
X-Forwarded-Encrypted: i=1; AJvYcCVfTA5i1dig3ZY7jz+NeNqPagLTlxZ6SiiKmxs7UJ3wHbsJd7TN3eXF8IB9r/mXBPSxXAfj06pQyCfvPwub@vger.kernel.org
X-Gm-Message-State: AOJu0YwXYka2apApGnFDXZqtvNyTcfo71OGkmnkdoPD39Tuby9f4rYOc
	jrpzn0RNs1qdBXrQmaeHsmHk/j/m9/csvJUnbQEgCq0ACMiI9rfD+UdNwXt41mVN5K2JTkRZDIr
	541t7aQHNKGGH0J4HnLE/SS6PCdhwOnruiage99Rz9aPOi9qXhSrx2Dj7PyTaf5pWYJY6
X-Gm-Gg: ASbGncsQt0tSRCpuEqG5FscnV+5lRLAXGbHMonh+cTcl51Cha1N42Q+ygqTAuOQ8QWx
	Q1gAWcjuspva+kGlQ5wvUhlMqmQQtYkguaRcN9EqvEZLliT+TyUCo98H0vYR3KXtbl3X94HiwL3
	HSvMZmFpJBpLd7FYkz/Tf+/rMakBRTazlcfOfdB2E1it+aPuqTKEEBW0WpX4w2mHDwE+9us9hdW
	zncvAVB7F2VN+0T/pZolIfe3n0KGlliuIeaT0/AxHFJcX39sK8Ho8OVrtYmgdrFt2lrTo8u/Jfu
	z9R3SgHWLVwWe1TMBrnWQy7pD3j+BpQoxgjanfE/3wHoQXIJzyB93wEhITvZP95VSmu32c82oxS
	CYxl9/7RcfzC9E0b9KAVdz/nlPjrj9DDdwBM=
X-Received: by 2002:a05:620a:1d07:b0:7d3:96ba:78d9 with SMTP id af79cd13be357-7d3a95d7ebcmr462331785a.29.1749651564651;
        Wed, 11 Jun 2025 07:19:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGAaOi73AYWlSbDOB5FoX5maZieuX6BK9CyazXK7gUyraDN4tNP1BHcDiW8mhiwHO8YmQIfKg==
X-Received: by 2002:a05:620a:1d07:b0:7d3:96ba:78d9 with SMTP id af79cd13be357-7d3a95d7ebcmr462328285a.29.1749651564172;
        Wed, 11 Jun 2025 07:19:24 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32ae1cccad8sm18806571fa.80.2025.06.11.07.19.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 07:19:23 -0700 (PDT)
Date: Wed, 11 Jun 2025 17:19:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Gaurav Kohli <quic_gkohli@quicinc.com>, amitk@kernel.org,
        daniel.lezcano@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, quic_manafm@quicinc.com
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: qcs615: Enable TSENS support
 for QCS615 SoC
Message-ID: <x2avlatyjo7sgcjubefexsfk6gerdbhx5dcug2kszk2hukcusm@srs5dwuc2m22>
References: <cover.1744955863.git.gkohli@qti.qualcomm.com>
 <1758b5c2d839d40a9cb1dd17c734f36c279ac81c.1744955863.git.gkohli@qti.qualcomm.com>
 <74b017c2-7144-4446-969c-8502fb2cb74b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <74b017c2-7144-4446-969c-8502fb2cb74b@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: Sq9FEERtZeOhT-D74ZQ-hxI0Gi4lL5QE
X-Proofpoint-GUID: Sq9FEERtZeOhT-D74ZQ-hxI0Gi4lL5QE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjExMDEyMCBTYWx0ZWRfX1VbHT+bcUmSk
 umXAps57EeaTZb6Iuav6J/mW72EBOGk4GsSvq0TWvX49Mk/uMafnLX1G6rcUlLoHE4zBnl0ju3+
 rO9KeGSeMRKifrE9C9rSFyE1ZMh5TyPvvWB19RS18swQwbYD8RC3vYN3yy66P+m4GedlfYgduqZ
 fXftqFBFAQCyP1E+J4s6txsA/jVdz4TOJkPdEGZ6JFA1ZqP5tr515oFnVJ9vN2z3fD2mFsqw9xV
 cmlo+2QCX9Pq4bxLt41Iy3BJgjI6oH0EFADooRnk8fnAFR4g9/BrmI7WcssDlnJ6xReLtqbA0kZ
 p0mnfCKFhG0F2IgcrfrgTCM3RZjrs330di3bf0d/5+nR9WfI6GZ6tt+d+zr+gy/NXZEg2uFEG2r
 Cm9bzbDcWzWynj6tvcamfR6Fm3KrbaRJ+/MRi9uOm5RmUGsPzKDQqmOjH2xZVFm2YMtxajym
X-Authority-Analysis: v=2.4 cv=K8wiHzWI c=1 sm=1 tr=0 ts=6849906e cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=fHpipdgcYPiT0vFNL1EA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-11_05,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0 mlxlogscore=743 phishscore=0 lowpriorityscore=0
 malwarescore=0 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506110120

On Wed, Jun 11, 2025 at 04:08:57PM +0200, Konrad Dybcio wrote:
> On 6/11/25 8:37 AM, Gaurav Kohli wrote:
> > Add TSENS and thermal devicetree node for QCS615 SoC.
> > 
> > Signed-off-by: Gaurav Kohli <quic_gkohli@quicinc.com>
> > ---
> 
> [...]
> 
> > +	thermal-zones {
> > +		aoss-thermal {
> > +			thermal-sensors = <&tsens0 0>;
> > +
> > +			trips {
> > +				trip-point0 {
> > +					temperature = <110000>;
> > +					hysteresis = <5000>;
> > +					type = "passive";
> 
> All of the passive trip points you added that aren't bound to any
> cooling devices should be critical instead (otherwise they're not
> doing anything)
> 
> otherwise, looks good

Don't we need cooling-maps for CPU thermal zones?

-- 
With best wishes
Dmitry

