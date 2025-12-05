Return-Path: <linux-arm-msm+bounces-84507-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 256CDCA93B7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Dec 2025 21:15:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B171230AA1AE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Dec 2025 20:14:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4C571E832A;
	Fri,  5 Dec 2025 20:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H5gk96Sh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MQKcYSod"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D82A1531C8
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Dec 2025 20:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764965689; cv=none; b=WTVptLYXEPPGNZj381eMVdV5X9VUcYNu2zrt7ayczP7QpUJJ28/Hf3N39SZ4SYZOPatROGTEHx+Tn04vYkc/MrYHKOEpiWgyaCu12O/TFhf8tsL6DQ7gu805IpA07dxVGipvbcAiUHjg2l3poXQ66crVJAexPOSEcIJKUBaJRfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764965689; c=relaxed/simple;
	bh=ep2f5RoGRxlO8M+rfkBhHzh9iGU2chO6SQ7Ua1mgXv0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Er/G1LUeQXY68fvVwWfyOOYW+p4Tli1bJBAz1u0dgnvJGZsf15OPDB48Mnf7pvc8RWQY2K6LzmvtihVlbXwYGYVHMCirS/DAWBUCQtaclk9iC1G1Gmgl0doSlP0i8+nfFPCYXG/CqWmrj3fVl0/6LbaaOEMWi35/nZ96mhEQj9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H5gk96Sh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MQKcYSod; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B5FBLUL1342313
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Dec 2025 20:14:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Q3EvGHgRlbS5shVZ0VVN2NQJ
	T7zGIo2BEsdcpNjZsfA=; b=H5gk96Sho6QY26Gl1RPKz7oAxb3ks/PfPdSAgS1M
	QAleZS9lvw45AdkuUuk/nh0i6w9DwG10fovjO6MFKw23SVhSTTTE8XjdbjSjQszk
	dheGJUTL+OeejhEjDGAhHuv9nXclBjVbx9DWJS/3WCJ3QgK0OqxX3CMC2VKSVv+1
	jIiyoVXCdOBc5nLmCR7W/sBT+NsnL8RCbiDKth5+R6T76Tt6yXVkJqAjy4vSy3EP
	lFs179lWnw12EtDYWFCxC/TWtq/exuD9rRRacORDxPtLbfSRtzz5zRlRvQa3eZZ2
	gGOxVa+y6ouLsolTsN6mBPd1dwATSVZX+BEu5ZrfyDwPqw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aur9atkqb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Dec 2025 20:14:46 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b6a9c80038so700585a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Dec 2025 12:14:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764965686; x=1765570486; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Q3EvGHgRlbS5shVZ0VVN2NQJT7zGIo2BEsdcpNjZsfA=;
        b=MQKcYSodrzIZshDdrPi1/8ATVQz3r6NwaIjQ4asZU6jb+Ms+zDVXP1rmSUvfmYtrT8
         JEeSUlxS9qw73RQDsdyh0ln7wmwh6l6dwJX6fuPJtz1AIlC3c/FhNMHnBVMm0VztuZBe
         BmjV1yJdMtrX5XYOsNH/0bND4olOSJ/7p5FtbCTF0z19vRWalhSSlFWqf9yotQzmKqdI
         tfBeCmIETp7Gnz7EIqVGXilUkiuZLd2MvkmqKhkrKLEG1OB9+blNeX3s1OypHw/6jO+s
         cRf0ieU+m+LTxWzFWrQ71FM2RDkZQLhiVRAJmCxRWA/638RDmAt3ec0xOxpv6ph8eC6G
         gDqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764965686; x=1765570486;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q3EvGHgRlbS5shVZ0VVN2NQJT7zGIo2BEsdcpNjZsfA=;
        b=X5uULY9w5hQEshbTQn+ro4bpvxjFAeBBBEZymvBcCazPbunV8AJdvIvZzBlco6PuGL
         uiSGeQJ8gNc7hazhJqu78W8fJvB8rKQcS0GC7FVcvbKZh1CCd7IR3+mtrEPcuRsENfOE
         NetoBNU8sZyd7b8C70Ez+YxxNFPZS5tnaKVQ9UiZdb+fBMtbCLFZf7lC4yC8znAniGl5
         fHuwO7AfZKLvsE8+wrJPKxtxB+D0BiXG0oE6ef2d93HREJyI7SPkQnpOybfy78w23EFX
         Xl6l9hUtRhwExPZzkPKjMW6M7rzXC8MPSb4ddaweTnK6FkxCCoGMEYlryoWhDdLp2aOQ
         ZcAw==
X-Forwarded-Encrypted: i=1; AJvYcCVUOwh1GRjmQNfNKRzDSQT5+D325+d7c8nSUqmC+5LGxginaUm1A6rizngCjWfbYXoYcm9PZiHE5nAYybU0@vger.kernel.org
X-Gm-Message-State: AOJu0YxfhI9dpN0vUn67orn/0t6Tb3CZzfadzK5aiYHUoR57pPl6JR+6
	9O58got0HvE80gl4JJhSOLYoLzaqq1FgpMt9vxxFNrzT6qg89qGI/9qvqKrAjgTNps59MMqlpKd
	45ZvIiNm7A59WhhYwORZlQHXcCu1J9UJb6uBSiFazz7TOimVYMN3WjFTlMSZAJUeAB00m
X-Gm-Gg: ASbGncvah4yiTvTnd2lIm7GC9mynp7DgannD7Sd9GYyt3XK6SRPwRumMGQtNDpEUbX/
	ovtoEA6l1CkFjlMqwXtpVduXUw0r8mZXK5QuX8QZwgVgCc6G7fOdNL8dVXwqe5YU68BZFMFReE4
	Yh7wy5kI7WNm+udeVOoNmsb9b3Y7MNuSN+qVfdTwGsliZCZK0wffjRg4L568uy9xckFjBBlKFw+
	Dx3Q+e53680QKkTLa4rTsjX8RbVY7ntUmEqLyzkCW8u/F+qxwYrBH9PMaD+qIN1gS14Bm1fjmru
	vwk6WvtWGulC19la5knZne4uSGflUfJVQE4ox/KwX5ghK1O0WmHn48hY8W+KoKCZLoC4d9u32S6
	JW5VxGcO1VdmY/x0f9db2hio+o5HOHhsuVxC73Sau1vqMvpCbukG1GmsICGa/bbh69byVPJrEfV
	gMW4BftB4MKu5B5+uMJ7vCpds=
X-Received: by 2002:a05:620a:1917:b0:8b2:e179:febd with SMTP id af79cd13be357-8b6a2331561mr50402685a.10.1764965686273;
        Fri, 05 Dec 2025 12:14:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGEGqQ3m6FnpqaR5Hve3u+4mkL2wdR32OB01TZ2bFeJ424hCezkIZXj4dF9QZqciSP1ZXEItw==
X-Received: by 2002:a05:620a:1917:b0:8b2:e179:febd with SMTP id af79cd13be357-8b6a2331561mr50397685a.10.1764965685765;
        Fri, 05 Dec 2025 12:14:45 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-597d7b1a416sm1815344e87.17.2025.12.05.12.14.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 12:14:44 -0800 (PST)
Date: Fri, 5 Dec 2025 22:14:43 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v5 2/4] phy: qcom: edp: Fix the DP_PHY_AUX_CFG registers
 count
Message-ID: <xvkh657hkoztrvyjrepmq3bvhmjfw6evwl27vski3547mgbnrq@wzok7ld4wmh6>
References: <20251205-phy-qcom-edp-add-glymur-support-v5-0-201773966f1f@oss.qualcomm.com>
 <20251205-phy-qcom-edp-add-glymur-support-v5-2-201773966f1f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251205-phy-qcom-edp-add-glymur-support-v5-2-201773966f1f@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Veb6/Vp9 c=1 sm=1 tr=0 ts=69333d37 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=c4sUNlcVcd6a9V-9oyAA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: sdrCzW2HXSCQ41zdTVYKvyrIBea0H4v6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA1MDE1MCBTYWx0ZWRfX4d9fzlr8jh1q
 Lyth3owDMsY4782Ml1pWwxfABojNTOr84yrD4JyeZlPXmgtohF0ZmmE0EMQ/PicOIi02r680nCS
 USaMdru5Tf2cUF92nzUm26G4dCYdF38PF5dLIscewtMRmPNN1V9A56UxfftHKT4FE3pMs3y1J/i
 fqhyWt2TMG2DiXxtTE4N+3sGtMxjD4fXQ6tQCNzesbhzJWv2PSqv0A4s0SVYHs5a8UrwSLvbvsy
 KdcsYmsjdz8Q7d4ENtgEIxQ9skoRw1S40FcgVq4wInLhkDp208yyAQ1BV3yNC4tOCvmGuiL0tnR
 C0aE37sZo/20remSMLwr44nQAKaOvpYRCfeffoije0uCtz5G+RU4qNGyO6cGrEKGRDnE6rtkDoE
 lI6GEcug5YLyN3XkfqKzcF/8SUulMQ==
X-Proofpoint-ORIG-GUID: sdrCzW2HXSCQ41zdTVYKvyrIBea0H4v6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_07,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 adultscore=0 suspectscore=0
 spamscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512050150

On Fri, Dec 05, 2025 at 04:23:21PM +0200, Abel Vesa wrote:
> From: Abel Vesa <abel.vesa@linaro.org>
> 
> On all platforms supported by this driver, there are 13 DP_PHY_AUX_CFGx
> registers. This hasn't been an issue so far on currently supported
> platforms, because the init sequence never spanned beyond DP_PHY_AUX_CFG9.
> 
> However, on the new upcoming Glymur platform, these are updated along
> with the rest of the init sequence.
> 
> So update the size of the array holding the config to 13.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-edp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

