Return-Path: <linux-arm-msm+bounces-84822-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E83CB16AC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 00:17:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EC0D530D69CF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Dec 2025 23:12:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C6E62DA762;
	Tue,  9 Dec 2025 23:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P+4tW0v3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gL4xWe+F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B919E2F9C39
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Dec 2025 23:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765321951; cv=none; b=j4FNfp3nBqKG6iGZVGQotRcD4FSoiRFFxnG4/M+A0CjmPYqsi7whzGZG7M5Xt02Wdsj6lxSCskKks999ZR8Sv6GCGfvbi/QaYdrpc5RaXFw5Y2+G4hPsmgzg0QarV5VN4SF57YWZviF1EwC+7FuNrp2u6LlUEUFEMHs6qhYSdpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765321951; c=relaxed/simple;
	bh=8iBLLQuXehd6c+HS2HC1NeD7OxpHfpVi90jrVsOAWOI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jcNrmMfAqHqZJCIKN8EbcKeL4tH6VQ/z0QjNst2VQRFfchmhh99wCWELBGIUFBMPXsoQ1qHjnYsGzuUOG9KLZj2UJxCILBkir/SDbYvEwLmf6HJm0er32BfPyGiH7GPeDl4JJvPk24v3rzoaheet31dA29iRIB3OBK7LIiVa9Yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P+4tW0v3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gL4xWe+F; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B9NAj2a884698
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Dec 2025 23:12:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=aZTDtwVzytWLbvwBtAYBieqx
	n8lDgoGYKkc/MQfURtI=; b=P+4tW0v3gTocph2gtfR6wiD0ZHgR1rnpeAYuwVhf
	Yt/7Fcv6GxjrUHd7iQCvoYEaaRjz+eRkjPb4ZvD1PovunFLRlMY87hfOAopNzKGC
	UgOfMNUgckSbzMVV2LflgIDDm661frUUpMcufPgA1kF/wepJtN4JMYSZS3DtmrGC
	A02oXFnGLlgdN1g+oodC/JZdzH8oMS66Xw/PZAAHGyByZfNLLrGH8uud6N8chgVu
	NuF+XxMmgjQ3lkygdH+bHRJkDwDPUPbxSaqUtgeRcO//PznRoWq22+mkdEogNtMU
	K8+4drMl8M1yOf8uVq5UYlJc9ObJwJVNiNajqqsuwGH10Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4axrhm8v0r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Dec 2025 23:12:28 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b4f267ba01so67930785a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Dec 2025 15:12:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765321948; x=1765926748; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aZTDtwVzytWLbvwBtAYBieqxn8lDgoGYKkc/MQfURtI=;
        b=gL4xWe+FbEQ/ynPknHIFFgVE0yVyKld2Gl1TWUg6S0LLzfTZ8Mi8Xt9OR6dqTUV091
         q8gClLHN0MddQlqOuWlC5KrmbUcXmGVhRGZaFM/kPu/YxyRVrV0WxF0atzfznPNHOvio
         2If3KCLn7ROn6z8/pX+nANA7eWlLnRixvpTGM34YJuSV1G6KpudIfmSc+fJHtVF+BdEC
         EIcRCNxV0F6gZ7uc4cs76Beq/Pdkw1zgSzbiMvuZ3VPOnzwvInjbpp3Xuf3JW+hiRqjp
         Jp6mfTyzXu0UmuRH5NvwF8ZA+ax8TNztebIvNEpwjvDJuNFqloKi0Xs0fBBvIfT5H/WC
         0VaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765321948; x=1765926748;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aZTDtwVzytWLbvwBtAYBieqxn8lDgoGYKkc/MQfURtI=;
        b=GtZtqfCCtvE35g2jVd8zJsehxlT+J02Ai83H842kE9I5gT0zZsWxLjCGWuhvyN8mSl
         SnKO1833obyZBeA+B3kGiT1MNxjQHxkpaQIKwnryiJBIejDVNPhXyGC354pnQyKb1bH+
         3DmCjApBXKwvwD+XCJumFHf7QWhtVyKQ0flNTS+Ku93YZ+tz+aTwDG5RffjtJT22UYe/
         rGNifA6TXlD2Gv/ZIf+9EXUpVMH8Z8uA83LNrKH9bfq3IOfV7OHGRTbCN+4TLmJ6Jwq+
         7VWxTuiWVrG4LHTx9xnHntM1RnAdBUpy01MDJM2PwkHzcfJ8CYZKcJyu+UuC/+3D7KoV
         yAhQ==
X-Forwarded-Encrypted: i=1; AJvYcCV32RsrhkuaAdYxGfnKnx8tGiDNActcuUixQ6CeSQRJF92Sj1iTUWxzflWYXPIh4bKaSlVOe6d/msU58Mjb@vger.kernel.org
X-Gm-Message-State: AOJu0YyTd/tBLhPyaDhbSSroMHYw+GwWu0BUxHkewQAor0BjJFuv1dYs
	CVnxAA6kkz7YbsSl5VGkBUruWszzZ5OP2LUC4ZR1ctoDKYZpi5rHBEgPXDLItCORnTZTZOZRrwC
	K2Yr4KtCKcSGZlZ3ipcIyNNLiL7mZmesYQyPs2ZD2aSUWyIT6dXPcYlrIOk2igqz2OSVC
X-Gm-Gg: ASbGncvcuvfZWbmJrDoCLqT8rNv1JuQr1j4UXcgdGXmJ/LuywpNRDvUzKeoeGPoAhkC
	1tH4m5nC8xz1kiwemaria+RVEQq4dVXRliMwOhQl5iL3P1yEK78ofdahyt+VHEok80L0yc43Fhw
	jcZUiQgKmaWqigxbmi9RowNQPqfIrDhPbs//++vlOGlGlmZCfSdg7zRRrJOTuzPb2ME8hEC4WGM
	VoB831orD7L05DiVexXp5ELG7yEm+dVhm339C5jc5maC+tL4au0MXTvmCtbnz1EB532Oky6PpmI
	VEzNPTMLrbKPdRoxPoZTpHQqcuCnrhLH3zTwdSZVc01DBbe/sb7chOP/E66wEe5Aa5tDHG+g5PH
	+BxYpnoANhsLFCRQnf8KxqVtVFbPMLEP/TSeAMb/McVcaPc4jTjQc81dDW664HoiSAum7UQ/rk7
	q1j8PF70ES8ZPkNUT+i1JoDvo=
X-Received: by 2002:a05:622a:48e:b0:4e6:df3e:2abe with SMTP id d75a77b69052e-4f1a9ab2644mr46847211cf.9.1765321947877;
        Tue, 09 Dec 2025 15:12:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHoMUyzT1cjFiHOGtjCqXvQSCukG4MAoCnPqlOy0xxYdv2NNMWNWiAeXyekIHS4ywW/HCE+BA==
X-Received: by 2002:a05:622a:48e:b0:4e6:df3e:2abe with SMTP id d75a77b69052e-4f1a9ab2644mr46846861cf.9.1765321947413;
        Tue, 09 Dec 2025 15:12:27 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-597d7b1a920sm5709451e87.12.2025.12.09.15.12.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 15:12:25 -0800 (PST)
Date: Wed, 10 Dec 2025 01:12:23 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: David Heidelberg <david@ixit.cz>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Sam Day <me@samcday.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sdm845-oneplus: Add framebuffer
Message-ID: <3cbcthx7ptgigfogxa6c7qf2r3o2nxqujro53ynqnpl7hll43r@xb4dl5ce4j2c>
References: <20251206-sdm845-oneplus-fb-v1-0-19b666b27d6e@ixit.cz>
 <20251206-sdm845-oneplus-fb-v1-2-19b666b27d6e@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251206-sdm845-oneplus-fb-v1-2-19b666b27d6e@ixit.cz>
X-Authority-Analysis: v=2.4 cv=d7X4CBjE c=1 sm=1 tr=0 ts=6938acdc cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=lKQ-AihTAAAA:8 a=EUspDBNiAAAA:8 a=qqtHS12kPM96W6o4Ux8A:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=K6G5NyU7usMl-irPePdK:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA5MDE4MiBTYWx0ZWRfX4t/kBY+BJY9m
 IARM+/1wwu+th/f8zdCD0KiARtbj2Lg4UcvkA8hLt4pxUdpIjGzJ4S9SNnkWt8OM9MKjCXDC84R
 AZOiD3izDCaMESv9byghFAbOdGhOOLG+nCMUT0CThZFAuvRGzS1bHOS7CX4DceQK5ywmVAZBBBY
 YYYOwAxLf6d1S+rO79RFNKtkxbqQ3n+eHIOvnuJAa2nVZSiUpFyBS+N29xzM3T1NIARCLdq0AQt
 fGknlKJvuJnuo3w+y6UafSeaE/LrPhHW9g0vyb+Fi06Do96/UXQR3ZWPAdILWM/Fp+lu8lp+jCh
 je++wOFvw4Tyn7uvRa2JqAawZstsWD4HY1HbloFuOUo8eqXJT8R/ArrZjdGiHyd9BdPENjCx/T0
 gCaMltA7oZP+iQjAhmtIaWZrSuj1wQ==
X-Proofpoint-GUID: 3OsDWj8JPl1WNpuV6ZkH0QPjE-HocMsi
X-Proofpoint-ORIG-GUID: 3OsDWj8JPl1WNpuV6ZkH0QPjE-HocMsi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_05,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512090182

On Sat, Dec 06, 2025 at 06:45:43PM +0100, David Heidelberg wrote:
> From: Sam Day <me@samcday.com>
> 
> Introduce the framebuffer node, mostly useful for the u-boot and early
> boot stages.
> 
> Signed-off-by: Sam Day <me@samcday.com>
> Co-developed-by: David Heidelberg <david@ixit.cz>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi   | 18 ++++++++++++++++++
>  arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts |  4 ++++
>  arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts    |  4 ++++
>  3 files changed, 26 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

