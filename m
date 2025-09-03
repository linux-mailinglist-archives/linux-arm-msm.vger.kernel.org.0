Return-Path: <linux-arm-msm+bounces-71915-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EF9A4B42669
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 18:15:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C0CD35641A7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 16:15:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 480CC2C0F69;
	Wed,  3 Sep 2025 16:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fLUzOymx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EE892C08C5
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Sep 2025 16:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756916128; cv=none; b=oxCjap3U3gQ3KDzBi6Cr8MlEsWTynZ7AwJjuE1qgKGa2j8x+KWGEGsr/Y/1Xj6CgXq+pmY3uJ1dizygUzibm4L++MaepnFB6DXYERjD5+JIq0HFH2zr5KUtJ+DcvPdBcDjL2q/WTMzA+PGJVieuX1xMrEM/ZQT0Q+BTTfByqbu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756916128; c=relaxed/simple;
	bh=Aj/h6m6u4l7cbXvG79uFeWtqptowi2jhB/O/8KjO2kc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cdEPVSIsN7m0aac3HozufWj6WBVk05CWMDcp+79RHRr3/yA6iI+2f1u+HFIZbAgC+CySbu2Ctuv2rnEQn07zWRuSw8U1u5KU+3gjh4FwBVtjzfOcwa/XUixuJ/su6jCCheDLRF5aqSuePsSanODAwOwI/P6g68cOftSUhWuBPzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fLUzOymx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583Dwwq8019411
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Sep 2025 16:15:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=PV8I53amMsdpCAWkiS8+8Gie
	vBsDJmqsY8SnpNsX1Sc=; b=fLUzOymxa1pTD013yhxViU4+oqpHhqhdhbTpnE0W
	BKNmHbmS1OA1gChpfxz9CF+iGkqu9lE4eutE1xt61E6DU2Lu1p4dDhnCCEATU8hh
	W+YX9RxUoiZnoK8LS7iz2o1RMXLTGDpHBXoOcu1qoB7wjUgEaCi+LhFe7Fr0Mw9C
	YcU+/wylo33nymbEfC3ddPxMaEbPWjoXa1Xoa1v4TX6i7a18kYO+NvOHDGqLpDgc
	ijtftlnvqdkIwwiWtjIBOVu7VkWU7whPUB6yEidUljnLgxbaCwLFXdEyXaS/Llix
	KzFrW1pBgV7p6hkhw/ofXL3GHi6P8kRD0T6W3edg4Ujb5Q==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48utk946gw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 16:15:25 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-77267239591so64194b3a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 09:15:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756916125; x=1757520925;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PV8I53amMsdpCAWkiS8+8GievBsDJmqsY8SnpNsX1Sc=;
        b=AIvcrTanXg5H5zzpRRUtFaqJ/CRRaWzTjT5TVNYGP7h548ZoaqSC7NH2SJI1FpUkBg
         6IPqy4X9LmXezQqjH5Un9ZG13813Fvdd2sAXyl/DCMIqq+8hxGeAxnlQ1/e9rdtrjDFM
         KUtZLnIbW2FcrOUQ7OmFHtcXHifc7YrznllCji2N4Ooh/O2wxWC+K8DisFYWEhdRQvGm
         nCac36WeiiQd4a0rfjPUmZ/JeOsQwPyl5Bj56xOg5F9V3mrmaZhArvenciIsCgfioAOG
         Xy3DUTEEb3OWN8Xc1AlNMiUs5wNQln5660gKh6B/fBtOdqMzZ7phgVQDUkxW+dLZLa++
         8O3Q==
X-Forwarded-Encrypted: i=1; AJvYcCUYaV6psWZaJOM6PpUhnodDRdr89DK9YwUU7q8zBlZg/dwXaxQQVSGmzjddjFJXkJAy2AvSwMg075hxNOpE@vger.kernel.org
X-Gm-Message-State: AOJu0YwXfUPZj4/y6eryOuz+kprX9lD2eevu1id+X246sK0PEBbdBhYA
	jm22yi/0sZ5Ovk/R9kBLLNWrcXoGvUmVwO3u7mGUgUrs7eU6JdmOdSHkw3PRwv5KmSDgFVC6CLl
	27mug5xxSnNbNASovI4xiMh2sb6VdpvTf5sG6apwC697mc+bo9Uf1GDVjy1z+BlioLAm4
X-Gm-Gg: ASbGnct580WDfCxh3G2XrWT1Bbn2jIChuqG+OVVtmMxIbkn/Bm0p6+bDY0DoCd6gi4U
	RiKpBuhimsTXOjG49PMYrKxtt59G/AKVixjRN+riBQxc3HiuNkN6PuIBXhnqNZVpV3ZCiN2q2Du
	Xr6o0Zj/74vx7Z6ANeKDa99vAp1DzHRXB+L3NWfItRqseY1PMLQ8HKBwYJTMeZiH8qzKAaHZaDL
	D77tDQjmBMM4OyVyKUV8SCyscwOwCFNSVMIeHwV4sbzs2b/KP2y1dMOqLbE6JTLzDEh9asnd2rZ
	AY256Y6urYo3UrWmfWZ4uzQ97MbwHv33eJRLNv1YWAxzxV9XO1oZDCvYwFGHiflwMT8T
X-Received: by 2002:a05:6a20:4f8a:b0:243:fedf:b41d with SMTP id adf61e73a8af0-243fedfd266mr9715493637.43.1756916124644;
        Wed, 03 Sep 2025 09:15:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGM5j7/sKnV77ewl35fCQ4KXYL+IlgEgwziqd/xP7B3RE++ZVU3ZpeVSYzTkVju3Z9dvwZsug==
X-Received: by 2002:a05:6a20:4f8a:b0:243:fedf:b41d with SMTP id adf61e73a8af0-243fedfd266mr9715456637.43.1756916124211;
        Wed, 03 Sep 2025 09:15:24 -0700 (PDT)
Received: from hu-wasimn-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4cd073f476sm14803635a12.20.2025.09.03.09.15.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 09:15:23 -0700 (PDT)
Date: Wed, 3 Sep 2025 21:45:17 +0530
From: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>, kernel@oss.qualcomm.com,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org,
        Nirmesh Kumar Singh <quic_nkumarsi@quicinc.com>
Subject: Re: [PATCH v2 03/13] arm64: dts: qcom: lemans-evk: Add TCA9534 I/O
 expander
Message-ID: <aLhplc1XCWGNlnp4@hu-wasimn-hyd.qualcomm.com>
References: <20250903-lemans-evk-bu-v2-0-bfa381bf8ba2@oss.qualcomm.com>
 <20250903-lemans-evk-bu-v2-3-bfa381bf8ba2@oss.qualcomm.com>
 <bbf6ffac-67ee-4f9d-8c59-3d9a4a85a7cc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bbf6ffac-67ee-4f9d-8c59-3d9a4a85a7cc@oss.qualcomm.com>
X-Proofpoint-GUID: EK2dY7ZZyjX1x_raCnAdYQv7hpty6K4k
X-Proofpoint-ORIG-GUID: EK2dY7ZZyjX1x_raCnAdYQv7hpty6K4k
X-Authority-Analysis: v=2.4 cv=ccnSrmDM c=1 sm=1 tr=0 ts=68b8699d cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=mdWu549IrBN_hmWUEDoA:9 a=CjuIK1q_8ugA:10 a=OpyuDcXvxspvyRM73sMx:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDA0MiBTYWx0ZWRfX01IQ94ePIet4
 Rt+tPZPLfS2+tmAP3fkWUWWwBmXX+jfEtjTJ6BZnnOnGvC/5ViRmjIdGziDQoPUfIElCd/3jw4f
 LwCjVy8Od2tOZV+GDj/lYWkuvwz8wxGSTWv/iyeK3AvnE/7Fvm0UQrDUTOmrxBXF5Yr2yDQf74I
 Nuus0NG4uw18Ryz2Fe8L3FSqCU0CFovaloZh/BM+PbMjRUjTUZTwBHf8I401x/KzO9isQ8Hn05+
 LiJuVFMD5q/GMgEbwRqlfrivKhKL4eq0+87tuv/p8omaJ/61oaaWWdmt05cR3AcvaHaglX+rEYF
 8hdPSINVAHXCL9VTSiwMjqCO2rE+QuZI73oF2R+1L7qBnpxAc+hosEqmyVv2Ur4F17fVtAflppF
 a+u0vnOc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_08,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 spamscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300042

On Wed, Sep 03, 2025 at 05:48:56PM +0200, Konrad Dybcio wrote:
> On 9/3/25 1:47 PM, Wasim Nazir wrote:
> > From: Nirmesh Kumar Singh <quic_nkumarsi@quicinc.com>
> > 
> > Integrate the TCA9534 I/O expander via I2C to provide 8 additional
> > GPIO lines for extended I/O functionality.
> > 
> > Signed-off-by: Nirmesh Kumar Singh <quic_nkumarsi@quicinc.com>
> > Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/lemans-evk.dts | 32 ++++++++++++++++++++++++++++++++
> >  1 file changed, 32 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
> > index 9e415012140b..753c5afc3342 100644
> > --- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
> > +++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
> > @@ -277,6 +277,38 @@ vreg_l8e: ldo8 {
> >  	};
> >  };
> >  
> > +&i2c18 {
> > +	status = "okay";
> > +
> > +	expander0: gpio@38 {
> > +		compatible = "ti,tca9538";
> > +		#gpio-cells = <2>;
> > +		gpio-controller;
> > +		reg = <0x38>;
> 
> 'reg' usually comes right after compatible
> 

Ack.

> Konrad

-- 
Regards,
Wasim

