Return-Path: <linux-arm-msm+bounces-71232-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 95910B3B5D2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Aug 2025 10:18:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 54DD4565D7E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Aug 2025 08:18:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DC9827D77B;
	Fri, 29 Aug 2025 08:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cTCnqjY7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13915246787
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 Aug 2025 08:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756455354; cv=none; b=MiOgwx07huBiS+MQtHaVlDBJRTFdNeOp0/DuqbugW8JPd2wKWi6cAbSsHGjmCWmeuFWgtlR2omwrvApb3GHBlH7nNBGDY5mDvtq5LTcTBQtAqmQhf6NpRxAvYxw7BGjW41nMgnA35OYHEK9lQLeY5W02RWIHJu2FmvR4P6ezvpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756455354; c=relaxed/simple;
	bh=JrE8rTg0mogycbu6/gTDLoIOWx412mSSUvbfqKnx000=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gp6mrMHAfAsCWTj+MbN6fKzS+7JTeAZeDc1pVNybmXpWTKl8fcd3HTP9LJ0+Iu7iBWUUbojLjONZDlb0c/SfqlYb7hAzVBHm2oBVCjFY6yp1G8a5pnolQNGaCBpM2slBJxha/CsgW5NPTd42kxKWsujI9K2B6/87787gGVuK/wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cTCnqjY7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57T85EDR003520
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 Aug 2025 08:15:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Sa6+BmSTVQ/SHN0N7L2jpZkX
	/bOZEoJbiAzVVSiaj4s=; b=cTCnqjY7nC+ZxpkGS4jhKDvVTEK6XsdAfqh+Wlcc
	rBzSon9ls8YXlvBQ10LRW6K28X1cnX1495nuMsRSEkNbqaO3pASLIvg4iXnL9WAL
	fCz6u6dug1iNEPA9xEajnXByJ59WvNd+Be62g0mcDimjP8tsu9K79RnpAwtrW9yE
	y2eNT6ySM2o2bkbmDqDTSMUPb/MZzSxwog5uZM921EWSrvT6pp6prPbNNxJlu9HI
	4TmjKJq9YDFvIvFQR0qp6dvmD6OZmshsYYROpOd13fDa8KGxAZOhJmbsDmdGlDUV
	Eb9hpfIHhcDu5iVXe+SIqxeLHlg+cNp8jyz6cPTaSZS1CA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48tp5k36mt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 Aug 2025 08:15:52 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b2d09814efso31510091cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Aug 2025 01:15:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756455351; x=1757060151;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sa6+BmSTVQ/SHN0N7L2jpZkX/bOZEoJbiAzVVSiaj4s=;
        b=Z4EfD9bwA49waZg4kxisdLH7pbCVkE4g2BAbL0G+Mw/sJl+CExsgsikRdvR9MKIKMe
         jpwafUcGMan5+LZofqSGbkGEUtNm0svym17sYnc9RIJRRfstzkUm399ymKW4192bnAwB
         UXXdXzSoqh6JNLsgtey/8FQpPLTgrZ6srG7DfgFoQxr3PCtkHuY+Wn5j8wGmStEj7pXG
         aiAF2nXQNHVHP1sFeNXQeyj+HNdhJkEChFJ0LUputk6m3ztE1my7amPXNWA8QM+W+rEv
         LC3FWFMWX4i1VzSypqeWr6xE2IFilcLl4Xugw2iwWliajGNYbHn5y5QQEQ59mWTgti1V
         A1og==
X-Forwarded-Encrypted: i=1; AJvYcCUC+RkJz41nOTNxJxtwE6ux7WXvbC5stYfVDWtYZ7p9EPrk5riomYD6LSQHZG7dVHlP7zLS2Qx9F0fbR3kI@vger.kernel.org
X-Gm-Message-State: AOJu0YxxxQvNo39oyBbzomkVvvxfKTcgBn99AxwkZqzs0uqgIsNB4gT/
	CMjjYjkrlUozBi5e7jUUakZMUKnTacHUkb1fJJZgFS2edKLQWxaxHgmluOO95ASwRlclHrGm8GU
	jYLdXrBZKKMKDNUX6Ggn8NI/qQftk5ekjUUxaD8HAeoSxNe02+2wpRBusR7HRkUjDvzDi
X-Gm-Gg: ASbGnctQKaqD9o0MziuV4Px++/46CVW8JazpmCt3VuoJI/WhbX3zjYD+gTc533xF+vt
	m32s3Y/tz/hkOjRJk4ymmlzIqT1i7SU8RUPF1EID9DxRdpaMxK5+ZHNAmyw5o7Tpr7h6rDbUQXF
	tRUTxdkOHkqVylrxrO685sBlgNixrH6bEMlaGUWdtwvW8rT0LJ6p9W5Tsh+Me10yru0ZWftO+7e
	0JINuYNpfJd0g8C8rzQcrR8pRiT5PuYuOzGOJyAwH04YuHXQpjfwQocXoVKQYB+LHIo9o9NyUls
	odXeqQwWEjhlmss69pjJoRPOMll5INWRuQqcXZpCpetDHXryQJH7S0C06fPCEoL/wwQgoq9EoU8
	Sq8c1DGQvbk/umtYr62tbO4xj7zu4BMdlPhlpYACgAhz8vDfOWWEO
X-Received: by 2002:a05:622a:548e:b0:4b3:a73:2d5b with SMTP id d75a77b69052e-4b30a7332a3mr33990791cf.11.1756455350895;
        Fri, 29 Aug 2025 01:15:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG2K+f3QGOXMzVuZ182apan0UZ0FGuT2CzVC7IkNGuxO5ayQO7W28gftKE5/UHpSe0BD/Uz6w==
X-Received: by 2002:a05:622a:548e:b0:4b3:a73:2d5b with SMTP id d75a77b69052e-4b30a7332a3mr33990531cf.11.1756455350473;
        Fri, 29 Aug 2025 01:15:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55f67a41910sm434735e87.130.2025.08.29.01.15.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 01:15:49 -0700 (PDT)
Date: Fri, 29 Aug 2025 11:15:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] clk: qcom: dispcc-glymur: Add support for Display
 Clock Controller
Message-ID: <lzn5tn3a7sclqp3bg25k7tf4l7kosoww67bxnvlyazdrtblzfx@p7i3rycihtzm>
References: <20250829-glymur-disp-clock-controllers-v1-0-0ce6fabd837c@oss.qualcomm.com>
 <20250829-glymur-disp-clock-controllers-v1-2-0ce6fabd837c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250829-glymur-disp-clock-controllers-v1-2-0ce6fabd837c@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=V9F90fni c=1 sm=1 tr=0 ts=68b161b8 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=0pr4t0U7TAZz76_aorIA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI4MDA5NSBTYWx0ZWRfX74KRQyak9ah/
 RuMLTwEGvsTMM2+8BvSdxW9qv2I9+aeMwsy/PmZ7l59CFjS38L0QwBGMfem6dO1kKb90NqHd4Ax
 YMStf4PpEieFVTiDuDgc6QioHbW9+ykhgPcR49Or4lgf5oSXQAkZxN/uGRPsu4I/cAzzaxLf2UL
 P7eZerPsjT/0MNV1jPcgVq6Fb1QJ5sQ7d46zElwkZWwLoHk6fB7FaJsyzq8vMyJdddEvls/Vgts
 MChMHABfYoq0GZ78/48tLN46DFYyrKnXIiSEajpjojCiSUa2jc/R/zExOFR2s+gmTNLjuB23fag
 Nv5n56vObIjUpOzJ+jLjHfcQBPK9I6nVg6vz3/A799+QoelLCfcgl/Fonzy198eWNyz05jzKx7N
 lKVNmN34
X-Proofpoint-ORIG-GUID: 9qrbGK4pE-opx20SKhDmGWjiHtwxTzLY
X-Proofpoint-GUID: 9qrbGK4pE-opx20SKhDmGWjiHtwxTzLY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-29_02,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 clxscore=1015 suspectscore=0
 phishscore=0 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508280095

On Fri, Aug 29, 2025 at 01:28:04PM +0530, Taniya Das wrote:
> Add driver for Display clock controller (DISPCC) on Qualcomm Glymur SoC.
> This would enable the display sw driver to enable/disable/request for
> the display clocks.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig         |   10 +
>  drivers/clk/qcom/Makefile        |    1 +
>  drivers/clk/qcom/dispcc-glymur.c | 1982 ++++++++++++++++++++++++++++++++++++++
>  3 files changed, 1993 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

