Return-Path: <linux-arm-msm+bounces-85114-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 88771CB9A24
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Dec 2025 20:22:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 41E113065002
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Dec 2025 19:22:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BB1C30B522;
	Fri, 12 Dec 2025 19:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JBVSoU2+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QiZvQF4V"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C705169AD2
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Dec 2025 19:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765567376; cv=none; b=htbLQVuowd5b5GsUtzI5zh9aPJ59DGkZPtuGHRwpHfnckA1lxMTTakrl0RRM3sdK917x83fOPo7kBz647Wg5eYXuv/thtd3Q0piecW7DTdM3pVqGD7MGvzaWibISRoCFpgzbWZIWAxLaGtHZnJg/vWsAhxTD+J9h+qiEnNbYed4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765567376; c=relaxed/simple;
	bh=CjfLnsDhDjz8sEci74hAn0dOi1NB8X2mjEsa3uppI28=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tlq/FhUPY5DKtg3EPdVifhgRv2F+xaD4+Gs1tkWUPzPrbPz5U7vxrkKGzZCZ6Kq3ii/j+gous4cdgOdGS+F6Zti++7KjHfwtqbgu8hT7YlN12lCH4jVYWo6ln98kOi0EJ4dEAc+idt2YqnFenZfYj8LLxVXFiVUE6douWjyqUO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JBVSoU2+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QiZvQF4V; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BC9og292944890
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Dec 2025 19:22:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=j3TvJS4H5C/2qPse66+dX9Tv
	NGtAtcH3VduSDU27f5E=; b=JBVSoU2+7XBnbj/yZvBi5z/wZxXzhTElmTEGovZ8
	DEnYXv/5zQBRhlRSF/rFk0/fC0jtT+zKpDpl1w20EDKdQ/TxUwt40Gi44bz8Txov
	cRoh3MdEK637N+z8f554s3cH3gNI5IVxr+stqkOYgDKwk8/l3CtskmzaFy8uKhZu
	6H8gQoDrFRHavzOWpwrwnl70RerI5pBMroTW3zSQ8W8MdzniAS4O/UuCu9FnOnCM
	QBQgX+Ehu4Sum0bcfvLhf93x7mNauU1dfzlYgMaAKv41aowkIpszypfQt7j2eXfZ
	WT90XohgdBu7oprWjz/5XmwF2ricuiI80sllEq2pm6sjgQ==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b04a2jvpj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Dec 2025 19:22:53 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-55ad466ad2eso729006e0c.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Dec 2025 11:22:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765567373; x=1766172173; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=j3TvJS4H5C/2qPse66+dX9TvNGtAtcH3VduSDU27f5E=;
        b=QiZvQF4VlHYtHtsr8ivRasD/G6JQou25SiiZPcnpLU/tohqDgYt2tlsPVMzYQsJbbs
         y0a+3/nCQ07eO8ej7kOipdRWB6NOS3rPKxkNPKH8kLEPvmyZVyEMvM2Z72Rn1V1MZfQh
         r/JaXWzBa80pKNNlg3zYJCcz1yEw7R+Jjj2O/1g6d163lHyZKpmyMmO8rSahbxm5lJCf
         ykxAy96jK/kppX+N+vxqcCSPfSunE989A5kCCPOJsuzuE+QVksIgJ6iBy1b2oJ8TnC/6
         bmT2nIemlPCFFFaNxP4EylcdrYH5DHB3o5pUzwdbPsTSr0sbBhkwajn1ieo0ZwCtwQi6
         dQfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765567373; x=1766172173;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j3TvJS4H5C/2qPse66+dX9TvNGtAtcH3VduSDU27f5E=;
        b=sYPiL977nljzqYF8RnVTaQkyOjuL/9K08TplyNeLropTh1uUngqDCIaF1llGtd9Ul+
         sd9XRjF2RQ0zz2KIdHdZMs5HeigyA+5yDkBDC4fCO4XuP8divQfvWIJymdaPn5sYKqnB
         orTbVl+W1QpLurSozG3XOMPE4WJUwYbCk+RjMP14lxN4FrvbQVUIQXXBpY/ym4VPU4C9
         KqvUK8tMfQpWJnqUimD77UC/E6td4lXMqMLw9sTPkVCU2wzgRu0Wqr6QIQW344yKXSGb
         u3VnoC99iQf08aWfBpVmHMWB/jmT7YLqljqVnTyEXciIelp82L9J1ck5RgpdDLUdpuQE
         NPNQ==
X-Forwarded-Encrypted: i=1; AJvYcCXz6t2Fj3+AEF60Bu6uLTg8zj5RHDVZc/yW1/VNZwjcap2hdH9t13wJmWwHZV7VL0LU3ngqeTLr3N1XMlY7@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1bwfY5lZi/9xOECj6A2/OxfX04W79nwTMrFOz1QyBx62xkOMc
	uPQ8R6PFcqXLFNoQX60aJIr5qo30prFiQ+9AiZRyxtEjBk0gGpmderNLDiyUv5pXlxl7TVL0TTb
	SLL5ZPzkKuPrSWYl8nh+t0pRM5eBOhu5SZNQvtBDf4MFG99ZxNStWxGAyIetOEcvYDNAV
X-Gm-Gg: AY/fxX4UR7IYP14GFe/xjRwE/IyezkRNwPgsD8DV5PQbAfdffRmsuwOK6TaGJ/xSIco
	/gUmVy2OMeFEMxksxVG4aOs2xDplNAfW8gpjKnpAnYkopkDVQZb7UyEoGlbPAAB9sfUKOGXoI2O
	H2dCIDBOdGcUEWzJwr8IBFRklrrbizOWf82IlITKV1LfZyO0nT9k47TFNIcUsqhmwnUP8QxWUKN
	5xQ5nWCH1SvBc67O2m1CgNuCYijETvfPCuRkMhDXbeNDcWwVIH2rJHRmbGO9uELRCpT4dotqKHO
	89mgx8B2n37Hv49cf0NEpQjacZ5+h05JMXZxbDIUxRx2B8e6XJ6X9Byt7eRSelguZ3+8ecf3qcJ
	QBqBKok128eCe96z7ez9Fc1V1w74zglKjXAaXgKCulcRGf+IeOJ12hekqYx0xftpsyJ/sobNM16
	CaE+ruB9aezZWIvM0ARe5nr9c=
X-Received: by 2002:a05:6122:a11:b0:55b:1a1b:3273 with SMTP id 71dfb90a1353d-55fed588aabmr1206018e0c.6.1765567372513;
        Fri, 12 Dec 2025 11:22:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGCaSYONvY3EjV0cRj3EU1L+YuZuPH6KLBtamSWh0/EV4Kun8bjuwaeMcE0m8Hr6nzF8y+eyg==
X-Received: by 2002:a05:6122:a11:b0:55b:1a1b:3273 with SMTP id 71dfb90a1353d-55fed588aabmr1205999e0c.6.1765567372022;
        Fri, 12 Dec 2025 11:22:52 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37fd2c7ce3csm7358241fa.49.2025.12.12.11.22.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Dec 2025 11:22:51 -0800 (PST)
Date: Fri, 12 Dec 2025 21:22:49 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Richard Acayan <mailingradian@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org, Robert Mader <robert.mader@collabora.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Subject: Re: [PATCH v4 5/5] arm64: dts: qcom: sdm670-google-sargo: add imx355
 front camera
Message-ID: <d7jcawzugobqern6zlo5jwcnximtsroxywix53v2yp2isvzo5r@ymxicmgfjmzq>
References: <20251211014846.16602-1-mailingradian@gmail.com>
 <20251211014846.16602-6-mailingradian@gmail.com>
 <wwpqaecvz42jopgaboasbh353ieelctpvgo3yj6y5tnxoem5oz@j5sbx3yxntot>
 <aTtkwQb2gOeWAFuv@rdacayan>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aTtkwQb2gOeWAFuv@rdacayan>
X-Proofpoint-GUID: LT2h7NDCXcWJ-A4UdVq762g2wh4wSNTy
X-Authority-Analysis: v=2.4 cv=PZPyRyhd c=1 sm=1 tr=0 ts=693c6b8d cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=QX4gbG5DAAAA:8 a=pGLkceISAAAA:8 a=xa5dgz69VtNZBVs00rIA:9 a=CjuIK1q_8ugA:10
 a=tNoRWFLymzeba-QzToBc:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-ORIG-GUID: LT2h7NDCXcWJ-A4UdVq762g2wh4wSNTy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEyMDE1NSBTYWx0ZWRfX+S5Xnwaw6f2V
 gq1r4pR5Jo/r6jE+NBN8Gizw1IVbWifX8Q2GQKOy8pNaylxNa6Tg7I4AMD3JWsPGe+AWbm37Zds
 r/Pj7UHgy+BGlR/WKxUtWFL0KKWv6e0ZeKtuKii/LUHBLcwez0P5ZjkRxhAJ6y4L7yqKKjQVNXB
 hefO5e/TP6oxAmQntMISR4WcqS0ZGh8NUi8nbr34ZmMdsZM90bvxb+nq1tvYTdzwFl79LR+Q3Cn
 QcCBkqEMc7pCFfexvBweLeptNept2YWIhMums8SilcVyu7jd8+lTDFBEkJh0Dr5KNawYnaG4+RK
 iqgOeDBGegAV3KsugFOrrTwFMp9ci64glSKFfoOUR1n+HCurr9ZzAdMaWfZYYddRsHTO3iBYfNP
 MUUkVc4rRsyu7QUvATA8/IhADDsb4A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-12_05,2025-12-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 bulkscore=0 suspectscore=0 priorityscore=1501 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512120155

On Thu, Dec 11, 2025 at 07:41:37PM -0500, Richard Acayan wrote:
> On Thu, Dec 11, 2025 at 07:16:30AM +0200, Dmitry Baryshkov wrote:
> > On Wed, Dec 10, 2025 at 08:48:46PM -0500, Richard Acayan wrote:
> > > The Sony IMX355 is the front camera on the Pixel 3a, mounted in portrait
> > > mode. It is connected to CSIPHY1 and CCI I2C1, and uses MCLK2. Add
> > > support for it.
> > > 
> > > Co-developed-by: Robert Mader <robert.mader@collabora.com>
> > > Signed-off-by: Robert Mader <robert.mader@collabora.com>
> > > Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> > > ---
> > >  .../boot/dts/qcom/sdm670-google-sargo.dts     | 107 ++++++++++++++++++
> > >  1 file changed, 107 insertions(+)
> > > 
> > > @@ -392,6 +420,64 @@ vreg_bob: bob {
> > >  	};
> > >  };
> > >  
> > > +&camss {
> > > +	vdda-phy-supply = <&vreg_l1a_1p225>;
> > > +	vdda-pll-supply = <&vreg_s6a_0p87>;
> > > +
> > > +	status = "okay";
> > > +
> > > +	ports {
> > > +		port@1 {
> > > +			camss_endpoint1: endpoint {
> > > +				clock-lanes = <7>;
> > > +				data-lanes = <0 1 2 3>;
> > > +				remote-endpoint = <&cam_front_endpoint>;
> > > +			};
> > > +		};
> > > +	};
> > 
> > This would be much better:
> > 
> >   &camss_endpoint1: {
> >       clock-lanes, data-lanes, remote-endpoint here
> >   };
> 
> I'm not sure what you mean, there might be some typo.

My point is that you are duplicating `ports { port@1 {.... }; };` from
the base DTSI here.  We usually try to avoid this kind of path
duplication. If you can't have an empty endpoint in the base DTSI, I
suggest adding necessary labels to port@N nodes and then extending those
nodes in the board DTSI.

> If this is about using the commonly-defined endpoints, Vladimir broke it
> in commit dcf6fb89e6f7 ("media: qcom: camss: remove a check for
> unavailable CAMSS endpoint"). If I do this again and go full circle, I'm
> afraid this could break a second time before even making it to
> linux-next.

-- 
With best wishes
Dmitry

