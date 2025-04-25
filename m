Return-Path: <linux-arm-msm+bounces-55728-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CDE8A9D109
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 21:03:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 717249C56C2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 19:03:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B5DA219A81;
	Fri, 25 Apr 2025 19:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gCmfGND1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4FD6214A9D
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 19:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745607805; cv=none; b=HVpg/QcXZvtlTnvZOr8Fg2mZ3elj10E8iGPBFMs+iLLlmu0ohM4xYa0eWAfS3SoOiXx0NYaMESUIGKgy3XhU094wDr9QJz7CYZnSEci96Tr7MBD7Wzvg9Lj2Qe2vnrT8Wkiyz9REAjSabwgx7dY8MSbanMKOTUlaprAe3o8mmbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745607805; c=relaxed/simple;
	bh=5mLfWj+jwzO9e6XH5KOBOGiPhIhid9kotKcL09TSRRs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PSetKNGzjwUZ2KKINjJXogr95V07t0nMZmU+EDuBmZX9iat/AIJAn2EPLXEozYQMJJe3du1kdYflkTN/aajNz5z3L9SHd1kobLHXNI1dwP5FUqzdF/GXZ8FVKIbAtxCQNYtlWibq5jkstRyqu30liDLOQv09ODjEURlZ9G9ajLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gCmfGND1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJqlS031947
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 19:03:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=d+OQsF8WR7J3ezadmXnGj6/J
	nTpBzTLVUrnSMduU/PY=; b=gCmfGND1WyskeqeTPo8rwftpd/r4wPc1u/mM3He9
	bWUJ3lH2ZBI/phlFp1WSu5xVJ7/DCClDgWQFBtYDtOebx2aBXY+L6Kg/C+JSoebl
	/OElJDXtP/z3Q0Ut80KJP18w8F3i2Hc1yxZuMDjuHENOw3GdxhP0/33OhIh2dHRW
	ORLNZqN91ZxJwqMw1qmRNZ6oA7c+YC6VGaMnoLbxJYQRyaR9jnh45EBDZ7LXg0Ku
	RyhbWB6d8xjn10Qo/N/ar6kcWfemIpfixTyFMyBdV+tQtDBewr6hdVoRihjh/Chd
	SJzf/ig/sxz3VWKF7W2wEtfb8f1UB4qePBjzJtT3zHqQMw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jgya1h1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 19:03:22 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5b9333642so324983885a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 12:03:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745607802; x=1746212602;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d+OQsF8WR7J3ezadmXnGj6/JnTpBzTLVUrnSMduU/PY=;
        b=LeaDX4B23g2pWoLCVTHaCILERi/fin/U1k6z+8K7Sp0EGfeBNJ4wQD+1VPuUG7sJFK
         VcRoknFx+aLl4cI4eymVvpKfWEYLATV34ZDw+jn6SQHa9UBrb+3OpQpzcCyauYrhv8Jm
         l97RYBIllDCM3Z3eUfwRZk36Wqitdd1Ait0NWh4J+kUr3tOWMxZv6IaSF6qM4lRHXooc
         oBwNplk+LTOJcmHlirh3kIGlunisHlvMBC74wKnZrqpidz+f7Xe0XG79SSMAET1n3oJY
         EpPt9zbEuyTWpIi9pp+QRZ0rWMSospENfDFw1i4FjQ/9x3URvSipG88vQFvqKGEikwtZ
         OqhQ==
X-Forwarded-Encrypted: i=1; AJvYcCUs0d4xz6yL2gDoNrmGs9f2Muk4+e7kxwJ6uYwa3krEHj0+acneH9bRrxBuuRi15QdjHm6U8+FUHpLLL5Iv@vger.kernel.org
X-Gm-Message-State: AOJu0YwZiOQYIh9uKWEXgXt9afcXHgJ5tdq5JGSfyfyStDgyN3DtETs6
	U9BnXpK0k8TBKI/VL6/knCoUT+UuOSZazp3a0eevocpfnHZROiJxADKRnt42drEBtJpVTxEiOHN
	EMk8KxkAIKazFJcfWiEWWYCkdBin9eK3sci/MuaUDtSitPEvmda3PY6T1JVMBK8l1
X-Gm-Gg: ASbGnctD4e+Qd2c35DurdO2NvQ0QdINm5BK+dQzCUEx8JzPe/NoHYxgWINHgVoqnvKg
	bBdjViRT4Ptw8sCH5sUqpK4dMsad6i/Q+F6Sb8bWfxZ0iKL0Iqdhb5GiwXergS2dJ/GhzaXJT3R
	3yMWRVFT7BTXGBR5GkTfJlN320Gb09gPwlT8IJ9fSKv5ZO5SjXRnDJni9UOcU88FBTA0wS4fU/z
	Vm9Kl7b842rF7ElGf3JBqdpBDDrJrnAUaEHX4cj9PZLlO4ThYn6fTAfYgknLes639LM4BuHmLEz
	aTRNqilycVmMOwkJ/a1ev5ZwiybCunoZ7FQRNTiBNoTDnJEWIu5rAjjU4ZXQLsmJkYyB8szT2Jo
	=
X-Received: by 2002:a05:620a:3712:b0:7c5:b909:fde1 with SMTP id af79cd13be357-7c960718fd7mr529028085a.25.1745607801882;
        Fri, 25 Apr 2025 12:03:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG6pRYAFM9obH6sLDqc8iWZTDFSyA63+5Z92vfE4mhmS0Il4CaGvhCSgEYk/JEQXTzgN8c9+w==
X-Received: by 2002:a05:620a:3712:b0:7c5:b909:fde1 with SMTP id af79cd13be357-7c960718fd7mr529023685a.25.1745607801481;
        Fri, 25 Apr 2025 12:03:21 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cca7b48sm693665e87.160.2025.04.25.12.03.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 12:03:20 -0700 (PDT)
Date: Fri, 25 Apr 2025 22:03:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH 5/6] arm64: dts: qcom: sm6350: Add q6usbdai node
Message-ID: <7cuouqnka6w26tnfhdtyzo4c2jwohgy5gqyzv2yu662gvkg57g@n6amazzvznew>
References: <20250425-fp4-usb-audio-offload-v1-0-f90f571636e4@fairphone.com>
 <20250425-fp4-usb-audio-offload-v1-5-f90f571636e4@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425-fp4-usb-audio-offload-v1-5-f90f571636e4@fairphone.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDEzNSBTYWx0ZWRfX7U8SG6N9zKuf Sp75ulkcGPpiObl99AR6U9XWdqhRqooNA4rL0yJfg5zd+HXwxGKUeVtCnHANy4qYc4isod0rKxt rpf2qFdtqW5puOQrHOsPr5wLsja2V5Y1mQsyx+VlPSwOuxe/Sq3E8GjANnhB6pEuh/jZKOTyoH6
 UNXjByi4CgQEvm68pxKQwCmt8u7fKzC2E57CB/cUBH6tFZWf1TA5slxKWbCkzjHLfPB01Jt7Ug1 45671dmrPZ1yeE+swYTBFWjfFeubcmWxKo8veHyjm7l9PsW53Gm1QMZKpCzAV9+sEt8U7LVfwIJ HcmZBvb4Am12MmT3LIXLb+2V1dqFw9Leqp9/2J8vhJNC55acf1st6CF+EXWeskfVHVkamCsvmAM
 G8AOpoPFIKvFR0SV203F75LuesU4BanFbJmLiVTKQ4e95CHafUIEhW1W8zcDUxsFruxcnd12
X-Proofpoint-GUID: tRJTv-hRm-d_tpOU8SNHtDTtD9Ii61xL
X-Proofpoint-ORIG-GUID: tRJTv-hRm-d_tpOU8SNHtDTtD9Ii61xL
X-Authority-Analysis: v=2.4 cv=M5VNKzws c=1 sm=1 tr=0 ts=680bdc7a cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=s1otzWxbid28AevFAO0A:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 priorityscore=1501 mlxscore=0
 mlxlogscore=833 malwarescore=0 impostorscore=0 clxscore=1015
 suspectscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250135

On Fri, Apr 25, 2025 at 12:44:55PM +0200, Luca Weiss wrote:
> Add a node for q6usb which handles USB audio offloading, allowing to
> play audio via a USB-C headset with lower power consumption and enabling
> some other features.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/sm6350.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

