Return-Path: <linux-arm-msm+bounces-76747-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ED8B1BCB006
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Oct 2025 00:00:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0A8881A64DE0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Oct 2025 22:00:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9E852848AF;
	Thu,  9 Oct 2025 22:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mxUbKD4L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFA0B28466A
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Oct 2025 22:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760047206; cv=none; b=Jsw6ePXkyHQ6RyKVte95OdJPdyrGJxjEwd13vOhV7XCKRWHAQYYXH5wED/EvoRcOso3g8FvPdRcF0YqgQAmVXwG1pQbFNF3w4OzcyL9P+EM5ce/Bztlt5L4FsOIEgvPhxbiwIAixZ/ixUYyMdfZNUbAFNhsUE/oo0XkmlDqTPYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760047206; c=relaxed/simple;
	bh=EDiIL4p9e62p4UbVruGVVDBJ2DSx2rVnb4KD9/RBVrA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XOK7IN1w5TeI4BwJG850ssj9g0+0VBK9WeXA05swk+DPJLTbOx8G9qejSewCKqAzeyFW8sVWRqGWqASD6F8+Apm887RsOW2l0xuxkhu75N34A2Ndx9eB/l+yxzNIKy3tkgDSK/ruCoN+08w1zKGZFClM9KYTZ06bzt06zPKerBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mxUbKD4L; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 599ENfbY028481
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Oct 2025 22:00:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=KpYawqd5hNZvdS7TNRZTo7pt
	PEhpHEawHuikV3RCL2w=; b=mxUbKD4LqLYvgAS0jz1FRKi314Y+7LREKM3+iN1J
	LcA8h0bfrcwkLc2BZ0bbfGzF7LTjKlXpz7NHBLLB4/OlQyR1GhN/zXUfS0IzcnrL
	S+mU31F5rPc7TX3aRh7Fx+qSm9fCV9JNiUP4tZN5Q4BenAsYVxXZL4UDO8qbRimv
	HOwGKj4p/SxEbfZhsneiruQQByvqJnTe1IhLpZUtUDn315qtD9d758H1+SP0Goix
	3yNutWKmoHlAs2i4ERqHdpSC8Lx3YwFhhKwjjuga41ehxLP4VJzFr+h//q4IAIIf
	GGp5xR79gIVYVbWK0DqHabr0HP/9mDLN89b9TDt7f0spuw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4kvd04-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Oct 2025 22:00:03 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8589058c6d1so265182085a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Oct 2025 15:00:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760047202; x=1760652002;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KpYawqd5hNZvdS7TNRZTo7ptPEhpHEawHuikV3RCL2w=;
        b=cwRw1A7L99+NTWqNWxENqEzHzws06m9qxxOFy6LA0QbA4E1plo+IAVID4nIBWV+S3V
         7EKdWf2d822yUy3Nn7DK9PYXlt80L/be4pfkO+MWnhWelnCe/psjX++VPzlKPyqKqEpk
         4SUCAiHS5nqcmOlwTnnLveQjbiAUUwbo552aBP/7LPOmP/6pfEV/tksIz9CUMvIYAOP4
         JBxbSqRUWLERfbST46eK90UgOBZUviTvp+hVQDCRUG/zvhllEl+rujFL4nqrMonfQODF
         9sed7idawsn74MvDLTleKRQOGDO9S9Jxo4gGeA5QrudAQBgIxg+pTnoes77Q4yDqhSsQ
         15KQ==
X-Forwarded-Encrypted: i=1; AJvYcCULoeZtHyStn8iLe8SHneehN6SZMAGnJ8hTaE85mz4LO/bdiD8agrLaG1Zb7V0Kk3bVzcjbhz3Cn06yhLnj@vger.kernel.org
X-Gm-Message-State: AOJu0YxTOV8dWLEvvpIrcQ7Nuvdzdzd0rhF1/AlbBSRP8r3PgmUrZlPC
	Xpvp/zLJ9UATdjCHqV8BXiwqJnGOkhn/N3DskVfVQ8Xc7AGCr6glnjzNUwVNAYMGdh+lkpH9NJl
	9z2Uy7Nb82nbZNLC5Vl8e3a6WAvScUW+VmJGPSS4e+Te8gN7/ZeyC50dPXhFPRcwXWezEv+l57z
	fe
X-Gm-Gg: ASbGncsVFQGuN+Q6bDCJcC89GEXxqluE1D4RwH0ljowpajj62T9AngmT3OGU5D/DZlA
	r7i69petEZCBTmPb4Xaw3SxGz8mlNCbCelUrZDyB1voQZVKhSpB3sjpNhYw/jBd3M01LBLzrYKj
	RQJGUZMvfrUTsiTdJ18TztSrkfSW7thByki4oFU3a3i1x4ZcrwtBCc6qzueB69ikrzGjYy//+uj
	LsAgpWcCkega8tEezwdXAHuaoZwCmb8yZvsahB7ubXsDxBWqNt7q3qtVBQJiI9UmwwXuJOZBsEw
	aCsbioxT+fkSE/VyTLkdrN94KetPo+5w2ZZqk6XzHhldfd0SZjfIVeuifqXWMVVX8VotOnDniI0
	AM6AvnOllzHCMr1KV7/d1yMDMwWVWtd86lOEpbO8HrLS88psYuPlnOAyorw==
X-Received: by 2002:a05:622a:4814:b0:4b7:964d:a473 with SMTP id d75a77b69052e-4e6ead5803bmr140393581cf.52.1760047202317;
        Thu, 09 Oct 2025 15:00:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHcapLO481tsrnzCDmpzE9Uxm1bNDcxriX9QOSnjP35MjYhUip+3TaKyYzGd907o8HwQHQYhg==
X-Received: by 2002:a05:622a:4814:b0:4b7:964d:a473 with SMTP id d75a77b69052e-4e6ead5803bmr140393041cf.52.1760047201848;
        Thu, 09 Oct 2025 15:00:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3762ea1136bsm1334111fa.29.2025.10.09.15.00.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 15:00:00 -0700 (PDT)
Date: Fri, 10 Oct 2025 00:59:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Alexey Minnekhanov <alexeymin@postmarketos.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@gmail.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sdm630: fix gpu_speed_bin size
Message-ID: <g6mv3ebxukceroa76w7s4s6tosqy34mj4xvzfwzozimdbkh5hx@b36drutn3lfl>
References: <20251006-sdm630-fix-gpu-v1-1-44d69bdea59a@oss.qualcomm.com>
 <ab555975-77bd-4232-9f36-b722a16f4110@postmarketos.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ab555975-77bd-4232-9f36-b722a16f4110@postmarketos.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX8PQzrocuzlU2
 0+Mr+rUYwC7JPzire53HLCylFUZ8RAkt7vFVs10sfhcNQiyK7E0YVqgt4T8h1kONioaKIj9+rIT
 8z1ElPk9J5QL9TAIxGHHFpa5FQWtTGs6Z4I7naX9nyvbY+2nx4ba4e6q75r64rLDJWkaLYY+Cfi
 tL3AW2pdRxC5aKCrjf289TB5f4LKxMV5b/T49QgnJZ4GAsf1K0cDIMdxsuoYdRt7sx+oM/jlCK9
 CkK/VPQfuue3f+QJ/ogw+HUPtQ2IfYhYqqU7WAZjCgWRVvdSYXehh4AVxvxFXZA+DPuqIQV+Fjn
 LOM/xzwJTvzchLY+0wXdWZzaatdLnLxkb7zcfNCLEEzFN6joVKtaPz0wXf53/6hJCMiQp9Yo9g/
 3yiYP7x36RYvSq15Ik/lzlkG13wMcg==
X-Proofpoint-GUID: -bxcZTlgzm_5A-OTIAsYdejNQ_bK12Et
X-Proofpoint-ORIG-GUID: -bxcZTlgzm_5A-OTIAsYdejNQ_bK12Et
X-Authority-Analysis: v=2.4 cv=SJxPlevH c=1 sm=1 tr=0 ts=68e83064 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=NEAV23lmAAAA:8 a=qC_FGOx9AAAA:8 a=EUspDBNiAAAA:8
 a=ZfU0Sroon34W5jsnaikA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_07,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 impostorscore=0 spamscore=0 phishscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121

On Thu, Oct 09, 2025 at 09:41:13PM +0300, Alexey Minnekhanov wrote:
> On 06.10.2025 01:16, Dmitry Baryshkov wrote:
> > Historically sdm630.dtsi has used 1 byte length for the gpu_speed_bin
> > cell, although it spans two bytes (offset 5, size 7 bits). It was being
> > accepted by the kernel because before the commit 7a06ef751077 ("nvmem:
> > core: fix bit offsets of more than one byte") the kernel didn't have
> > length check. After this commit nvmem core rejects QFPROM on sdm630 /
> > sdm660, making GPU and USB unusable on those platforms.
> > 
> > Set the size of the gpu_speed_bin cell to 2 bytes, fixing the parsing
> > error.
> > 
> > Fixes: b190fb010664 ("arm64: dts: qcom: sdm630: Add sdm630 dts file")
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >   arch/arm64/boot/dts/qcom/sdm630.dtsi | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
> > index 8b1a45a4e56ed1ae02e5bb6e78ca6255d87add1c..21f7dcf60679026e45202c6ce137ca0463c00d0e 100644
> > --- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
> > @@ -598,7 +598,7 @@ qusb2_hstx_trim: hstx-trim@240 {
> >   			};
> >   			gpu_speed_bin: gpu-speed-bin@41a0 {
> > -				reg = <0x41a2 0x1>;
> > +				reg = <0x41a2 0x2>;
> >   				bits = <5 7>;
> >   			};
> >   		};
> 
> Hi Dmitry,
> 
> I think bits should be <5 8> as well.
> 
> I had similar fix in [1] for quite some time with a bit longer

Indeed, it looks so. Please post your patch!

> explanation why. In short, we need 8 bits to be able to read the
> value in speedbin efuse fully. Currently on my device
> (sdm660-xiaomi-laevnder) the resulting value in Adreno driver is
> 0x7. There is no such speedbin in [2]. It should read 0x87 (135)
> which corresponds to downstream's qcom,gpu-pwrlevels-3 with 647
> MHz max, which is further confirmed by testing on the device running
> Android by doing:
> 
>  cat /sys/kernel/gpu/gpu_max_clock
> 
> Which will show 647, confirming that 0x87 should be the bin.
> 
> Also when you look at the list of speedbins downstream [2] [3] for each
> SoC you'll see:
> 
>  * SDM636/660: 157 (0x9d), 146 (0x92), 135 (0x87), 122 (0x7a),
>                 90 (0x5a),  78 (0x4e)
>  * SDM630:     162 (0xa2), 146 (0x92), 135 (0x87)
> 
> it becomes clear that 7 bits are not enough to hold values above 127.
> Therefore we need 8 bits.
> 
> [1] https://github.com/sdm660-mainline/linux/commit/f9f92384794ca792a622ed19d5b5d2dac73a1a78
> [2] https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/LA.UM.7.2.c27-07400-sdm660.0/arch/arm/boot/dts/qcom/sdm660-gpu.dtsi
> [3] https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/LA.UM.7.2.c27-07400-sdm660.0/arch/arm/boot/dts/qcom/sdm630-gpu.dtsi
> 
> --
> Regards,
> Alexey Minnekhanov
> 

-- 
With best wishes
Dmitry

