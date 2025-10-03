Return-Path: <linux-arm-msm+bounces-75953-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CD13DBB83CE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Oct 2025 23:51:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9E2524EF76A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Oct 2025 21:51:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 459812727E3;
	Fri,  3 Oct 2025 21:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eqm3RKvr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDF1926F46C
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Oct 2025 21:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759528260; cv=none; b=smEIqfJlMtaOqig9e3753+q1UQb9AnZ1JUf68jTm/RjfXoxe9tzN2r5i+UT3n1qlPy70hfbZVDGPC86Vyw95c3L2maEbHGh83dxqB210cwORUWb9R3yGJs7SXqC5sES/PLvvl035zjmBZ7gmC04OuXlPNr2Cr5uPOpiVne1QHuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759528260; c=relaxed/simple;
	bh=2+Qx4TvvkyhDYLhaS2hPHaAOwTarJmhD8/45A6LfgP8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kP2zpjrm/1PSGxh7uJjO8gggcfzt80h9CPMHVxSqhZq057XvichvwmyX1/23+ZNlB/ezOeeA+3Z1xexkVBe9zKrlrkkkSInMVvYOvE1q6HsO5+2KttOjIxQ59WxF54qrZWKxQBPV5buFo34G6KP7h4JkEk9WIQYKgjAQXtCOtAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eqm3RKvr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 593CHBGA016176
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Oct 2025 21:50:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dMwDleF2rEGTBFbEEiU5Yhas
	7ke7oirsC8DK/6N2dXI=; b=eqm3RKvr7KraUO4Rza3bsiOE5tvK2i/tL19oyWFK
	cFUle3SSZ1YXnvej7kY95+vF+jfZmoDOMJClzxyFUzQsprU45zNmjzs2rC28sH5f
	4nG+Lt18CthRMhpVft6tbgW/mw1T7AvHRFk4oLbdauxDPdaOU/zG0/vjHouNG6AU
	mFdysk9RQjva8InOKND4/wJgiwvEPPfLcBjEBTKnFxfwSWlwmpIRUhJtWt85JR2p
	Nmn2ft0C0oOwryGjzCE8kE8vA+E8RCEEelh5ZShH8MmMmZeMN441bHUAoKbSCbOq
	DYPuGgodnhVhTLgyqu/+1sLHK11NB29isYOhKUdP+860RQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jeb7hadr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Oct 2025 21:50:58 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4df7cdf22cbso97670581cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Oct 2025 14:50:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759528257; x=1760133057;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dMwDleF2rEGTBFbEEiU5Yhas7ke7oirsC8DK/6N2dXI=;
        b=Z/HeepUcsysXIZwGSZ2Zu9OkaUnuYirMUnV7mCCUydO53bKrH+F//iIQBOaHdT5wo+
         Eu+FHiEZwTheJsdd9LYcLgpoZzy/AJOHP6miltifyJTM1zlhcbX1BcOe5OXpaS81SM/f
         LgB2e76Fbh4wP2Wj8xfmFIMkxivKDUjgFQ4fElt338hTRWZLNFzM4qdEC0DQBOpsJ3pk
         bLTpd+AZrIb5CSahEeL+0AwO9NnvgqaLvLDhI1bQWmsR4dl5pzrwNFIceiTIYVg9OhSb
         M3UheIx4gaQHhbGOYShGu+0uRP9K8q6BfBwMyKZUc490x+c0GIEpcOb/rq+RaXijY4X3
         Bq3A==
X-Forwarded-Encrypted: i=1; AJvYcCX87UyJOUCGJNW7hSA6jF0ssSCbJVuaTVb1K0+umv/BWtYjowDSzLpioCnEVOzxYnOI1gwTmogqQ0eRTK8U@vger.kernel.org
X-Gm-Message-State: AOJu0YzwBUJupZmyIgdZ83xROX7zsRldMLke1c+5s4gBbadlB/o7KRaU
	EZVzXm81BaWZYvdAZh3AKJn7UjqZb+13qvg7LpP1xWtfIfVij5cuFS+dHDfh6xO5cX/9oKaRZ/I
	Bsjv8mXYTlUCAawPWTjmGmv23vex7mUY9nbiwu3ncjsTav3U2I1FafAdtt05yJRaixC0f
X-Gm-Gg: ASbGncvQtC63BYVRc+gm1nQUdtI0JC1M2kihQUrw7p9Zs+g8ChTcyNcMV3L1mphGUq6
	QUDv2MJvm1b6cCILtO0e8H6yjsmMWOsN7/CQ4m0r0G0dq6imDXtTwJUn9gCdn1CBmYw59Zdm2UB
	1vumv3WNR34kAfcZamCc3C3r2Nkp3df5vZCWiU068x0ukOOyjBL6iBaG7rFn+F2+UWiVzw09rHU
	CvBk8cgln6ESv2dOlppgJNfxizwo/xIZfVyIm5zbB+ev7itraqVUt5uS2K54As0VgQ2C0Gbe8Fx
	DgDeanRGF63X4u8DCfGObvBsvibLlNOQ5koZyqDUlFVZoLWGnlDBKg0VUZwed9O3aO1qWM3X0sZ
	1PBOX74EG7MAzYQpMOGw/2fwQAT99r3XaYnmk69o/t9hqWQiet4lJ3L3HFw==
X-Received: by 2002:ac8:5952:0:b0:4b4:9531:8a8a with SMTP id d75a77b69052e-4e563b6866cmr113183441cf.38.1759528256482;
        Fri, 03 Oct 2025 14:50:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGi4tK4Ey95PC2GedwCZ2MhCcVKB0hyCtFcuRedprkbRea3U2e1PifERn9nC1Yryiua1m/vKg==
X-Received: by 2002:ac8:5952:0:b0:4b4:9531:8a8a with SMTP id d75a77b69052e-4e563b6866cmr113183211cf.38.1759528255910;
        Fri, 03 Oct 2025 14:50:55 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b0118d6f3sm2197351e87.77.2025.10.03.14.50.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 14:50:54 -0700 (PDT)
Date: Sat, 4 Oct 2025 00:50:51 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Paul Sajna <sajattack@postmarketos.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Amir Dahan <system64fumo@protonmail.com>,
        Christopher Brown <crispybrown@gmail.com>
Subject: Re: [PATCH v3 10/11] arm64: dts: qcom: sdm845-lg-judyln: Add lab/ibb
Message-ID: <mtz4owbmukfo2zkgkzjckkisy52trmimlmy3kfngg2n3ej45c7@crkidtvm6o26>
References: <20250928-judyln-dts-v3-0-b14cf9e9a928@postmarketos.org>
 <20250928-judyln-dts-v3-10-b14cf9e9a928@postmarketos.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250928-judyln-dts-v3-10-b14cf9e9a928@postmarketos.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDAzMDA5OSBTYWx0ZWRfX2pHgh1eRzgG9
 mkWevFvkSGvLaFjLozQagbVZk9xnftADnsNeqDp2jVuYyNtMmIZ3PDmzlhveK9AvtRJLM5ms+K8
 gTRiG0HTTXDzF89/1/rjm9dZgXG9CVyA3DOc3zygiLGaf4n+8mGa17AXu4Jr9/onY1GbdNY1Kld
 a/8FVBCSk5EFtcEWUG45n68gGxe/RdwtNy8nqoizzRyMQOk/dUcmuIbBFT7gNIJWxN9YxufzNk3
 j6V7BVWlBrvfLM3dnnp3Ac2J17VPGWn+XmAa0Vpg9X/vUhOMC3AuSruuV/gmUlvS/hiCNezjgIF
 wicFgE0FOfb09aa4ioMI2eTh/w4G1R75/PSVeamdm/mvQXW++w6S9Rpq6Dht9ZjiKR8RJRjvroe
 p474cqqUlMNSUblryDLTQ34Cmnp5Sw==
X-Proofpoint-GUID: 0pPJ17ts-r92GTZeFVHC6R9lvabcNNaK
X-Proofpoint-ORIG-GUID: 0pPJ17ts-r92GTZeFVHC6R9lvabcNNaK
X-Authority-Analysis: v=2.4 cv=YrwChoYX c=1 sm=1 tr=0 ts=68e04542 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=Gbw9aFdXAAAA:8 a=DjAeRk3aBtCqIWsq8ncA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-03_07,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510030099

On Sun, Sep 28, 2025 at 10:05:33PM -0700, Paul Sajna wrote:
> These regulators seemingly help the lcd to work better

What does it mean? Also are they board-specific or should they be a part
of lg-common?

> 
> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 

-- 
With best wishes
Dmitry

