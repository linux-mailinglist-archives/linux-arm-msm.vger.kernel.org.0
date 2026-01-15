Return-Path: <linux-arm-msm+bounces-89116-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 43D41D22BAB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 08:10:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E71C9302B10D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 07:06:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4043C32694D;
	Thu, 15 Jan 2026 07:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MCA2F907";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TK1eIBQc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC0222D7DE2
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 07:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768460793; cv=none; b=aQEn6uAxBaPnayqSBFl2hKEHYh3wRmOvjLpsJjinlDBalfDVyay3QgAyR/jIN4pDtNGY4ogt1AysMm7UM+SeAnu+Rvc8LrNhNsG4XsjTOo49dH2olxhi816H0deXtq8I1392sY3fXvi332UbFRnbSysrc+RMRnF6mHjoM1xW3YA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768460793; c=relaxed/simple;
	bh=qpYR17M1TcWWF4r7uM8oIZciRdKuzI6PgJDmzJXZjuc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=urQh549all3JbY80bZO3ZkASQDohz7/RGTaGCKwadmSwEmhVTgNZdDye47Hoa4p/PWJx8Glu4H2r/ed/O+TrN2rq8DpR3l0lhAm3nx12CMH/V15wqS7W/jQAdcVc16bOuhKteoqI4dCWwlZbYvjq0WMAMQ9GzNs+1zZpQglfVio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MCA2F907; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TK1eIBQc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60F6g1hm2074818
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 07:06:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3cHobchxhwXSPonZ3e29e7qw
	Gl0ZLrBiX0mfABv204c=; b=MCA2F907Kb2uz1Te12n0Nb6UFlGLs0PHocfiPJhj
	yu83ghiPIWjYuNm6HETgD9EgrLfrdSwd8QHN2CI/JcsV+Dlf9yiLXMHErfjkRnDq
	51Ob6ncOlyXVS/YaaHpCulZ5OWPfMKe2gx7v/UnOkfjYlkIIq+uKE/SCiecdR35z
	FE34q0ryLqTQAE5MkQFWmMqnDpblNSUjlSDUrYB3fCpJyUxU9taE8X6FqchDUp/4
	oGJunNiXh4Fxoj9ZP672b6LeyVk0Q3eOMxIOj7GsZARm8mJdxjejEHgEXXT9irvH
	VSM8gMe4IRykzWTLFGqhLZwSEQsnSoTxCFPObc4IbrREVQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bpjj9hh7u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 07:06:31 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c5329ed28bso159001985a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 23:06:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768460790; x=1769065590; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3cHobchxhwXSPonZ3e29e7qwGl0ZLrBiX0mfABv204c=;
        b=TK1eIBQcgGf4PliS10+IksRaYkeowO+BPZPfwOwhjl7i+5396fsBYpxWT1V4DHWFf0
         WEMJF6VbILs6q3aVK+FSDEtULiC6mkwAna56RxWpyD0zuKt7CJnqyNNMxICOuRhuVRR6
         BE3HUgD4KSRPUTqxFqlMb3ZdGZopuQ//0A+47I1Jwn9Q6S1cxxwh42artPsqr9K/R+Qe
         HcZt183DHfRlqV2VofiNo5ZKv6o+Zx6lionjterMMYHDwFegutXS/Yx34zgptc2KefqE
         oOWL4gBwsX8jn1QPYyWGFZWy693QmsvqBus4gqt2ywgWfmvBtWeCYzXt0eutvBQQgwuJ
         k+Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768460790; x=1769065590;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3cHobchxhwXSPonZ3e29e7qwGl0ZLrBiX0mfABv204c=;
        b=Tl+zI/rh1dkXcQ/GFVxwaPXjbq+YRdLwPNfrPPt4ZbDWNF6Oryol+plqp4H5tOfl1u
         dQWN2ie2BjR/0mOrrWKdOBanNQE3gZV1It31k4Otmcy+6OP1P4TH4sdsbyD128aNYOTV
         EpXCyxBDYxy/rg3P+fOP6nl1d4Qyb6jExkJFRJLYVugpOytY1h95F6l6OyZftwAjR/JF
         hwCkCXMblsoRkUlOHN3cNA1BKo6fIAVklN2O1lwmtM3f6Lenm3OGWQkwu7QrjmUfC3wy
         7f/kcVVooDQpCUMMXzA5VpS6NSB3C5t9jsv+TcA6DLVgBHXtXMSLY15F01mgbDz6a9Au
         hKSA==
X-Forwarded-Encrypted: i=1; AJvYcCWjW8L4BAECGP+Iy53Q4x/IuxMsj5Bnk0gO58kMke559YEIql9YCo4t1KRF9Dkr3Qjb2EvoPA4f/djZpbUY@vger.kernel.org
X-Gm-Message-State: AOJu0YzzgJ0vdSOs2MxHOr6wie+Vvw/OOeU/gBegBiQw2YgpgdQpCzpZ
	xGuSNwwRE0sBRAKY1VAXDAiO+DeGe7q8SYA89hQE1FrWhYD/CadJwrmibKihzsz7B2WF/tFJgrM
	MkVBrhcPmQKfBrv4HABssG4taA7YJleGP6UC34yaST/6oTL23s23+Gb8N02xnPbY/dYHm
X-Gm-Gg: AY/fxX7kZDyxh1IXWgDIeRXe283ENYkUM8o4HnR1joHgqLK9zaEWwkv6UwF+RW7thJs
	4shfJTZZMknwMDFuKcJM1dG5KEMfUoXIrP8SwpjvyFWwblHuVplh7jjVpxB3+rBMDBw+4GEfhiD
	BMPwzNGvCprAZCjfulUetfrc0eBskD5Ku1lEhY3SPee5OAJDhzoFCmWmJ2iyEJEDOqY0djdzOnL
	iG+nkWg0ZHGZfBbw9OqUnFD5pF6eGQ8LkCpyli1jFcg1Kf9fUlsUZ+O5UWmt6+b1TgiQkJXZB8u
	md3MK81a7JYj3dFrT4+jpKNvHoy+coJeEiHgwqaRUpV+2HxnQsCDcbShHpuRfZgJyi5wLd2g/AK
	SwkqwqYA75wzT285/xZlrDqa9v0GbARyh/yjRi5x2SR8iLPXLcbbhZi/cel1+gLuG0MfoRWaeec
	o5Z/FdjiiGplRyFb5mBoEG+N0=
X-Received: by 2002:a05:620a:454e:b0:8c5:2b8a:a7f4 with SMTP id af79cd13be357-8c5317f089bmr546580085a.45.1768460790023;
        Wed, 14 Jan 2026 23:06:30 -0800 (PST)
X-Received: by 2002:a05:620a:454e:b0:8c5:2b8a:a7f4 with SMTP id af79cd13be357-8c5317f089bmr546577585a.45.1768460789549;
        Wed, 14 Jan 2026 23:06:29 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59ba102061asm1410997e87.23.2026.01.14.23.06.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 23:06:28 -0800 (PST)
Date: Thu, 15 Jan 2026 09:06:26 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        20260114-knp-remoteproc-v4-0-fcf0b04d01af@oss.qualcomm.com,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
Subject: Re: [PATCH v3 02/10] arm64: dts: qcom: kaanapali: Add QUPv3
 configuration for serial engines
Message-ID: <lnltjxkg7yvp6fe2l6krlmmodvl2cetbhkc6fwh5mfqdahwo7s@oftskbsqo7c6>
References: <20260114-knp-dts-misc-v3-0-a6cc9e45de93@oss.qualcomm.com>
 <20260114-knp-dts-misc-v3-2-a6cc9e45de93@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260114-knp-dts-misc-v3-2-a6cc9e45de93@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: FRhPa3TLkFqNIDsf_Tq-VF5-186NUBbs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDA0NiBTYWx0ZWRfX5SSO+ErimGEp
 +o+t1KlNqv1eF+FPUD8jxRtUNp488xlsvgz7G4lP74WArVNBID5LJvnapwMfuc8HQqdwdsJ8kn1
 L7Zbvs8GNJ1R40A1YM9WE4FaqIj5Y2L5Lm3Bwp69tS4MWaTySqBFwNoaXIR8zPpe+w0PcQYLhv0
 qImPL483XIxnLjJ2CJmpB2P++a7889M5JWm4H7VxZlnmWqZUj5AGvmTd7uArmCB2DpqEHEZbfso
 KoEvekeccpwiK97PbHoOrNK+LGrhxOx3Y4KjCLYQcC322K0q0FlKi66HDsCTIIXk6CfFb82ukxM
 dqozBlYA+/X+XxPbe0QjUicpw0YljgEKRJUnA6X3jpUYFuPLb6Wfc4dOjFcNGjgA706rSSba6jV
 quSTyq2LGGL43quN9lrUHkrrd6EyM5pz3DDyYHugMRDeLfo8IFt8I3vUui4wGCfvXyrrbIiw3tq
 FUuW34rq4HgltN1/mdg==
X-Authority-Analysis: v=2.4 cv=dcCNHHXe c=1 sm=1 tr=0 ts=696891f7 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=eTtp617OosM5BNKk8SgA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: FRhPa3TLkFqNIDsf_Tq-VF5-186NUBbs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_02,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 phishscore=0 clxscore=1015 impostorscore=0
 adultscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150046

On Wed, Jan 14, 2026 at 10:49:04PM -0800, Jingyi Wang wrote:
> From: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
> 
> Add device tree support for QUPv3 serial engine protocols on Kaanapali.
> Kaanapali has 24 QUP serial engines across 4 QUP wrappers, each with
> support of GPI DMA engines, and it also includes 5 I2C hubs.
> 
> Signed-off-by: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kaanapali.dtsi | 2092 +++++++++++++++++++++++++++++++
>  1 file changed, 2092 insertions(+)
> 

I haven't cross-verified all the entries, but few random ones look fine.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



-- 
With best wishes
Dmitry

