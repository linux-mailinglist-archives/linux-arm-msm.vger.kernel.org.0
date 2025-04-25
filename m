Return-Path: <linux-arm-msm+bounces-55697-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50309A9CFB3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 19:35:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 91837460BC0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 17:35:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D8501F76A8;
	Fri, 25 Apr 2025 17:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IFgJsbAq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 000DD1DF971
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 17:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745602538; cv=none; b=jyaLXCH9DrE8slKCYhweOrnOmn+NRxfTV734PSb1UI/ir3kz1l/7iDT4VRdO3AaDfd9gZfLX9XDVx4IrdwJcq0wRIOSy2Yb/dGqXKYzTDDcKU5q5YFqmSsWT3d/wVN3kIVU/er6Y8lpleypwhjTeNZrMU+N+617xMNbWWoNAJDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745602538; c=relaxed/simple;
	bh=g97QnI7TsDtM6koSlVu1VNup28kUC3gBLrfnGPhJwjU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ocUenGN73QeKdA1enkQXJ6S2t+6Llw65YaBpmFjBGeXadeHB94z3zfgeltZcOFuQMZVxPoIhszWdpmK0WwH7ESt4Az1o2usamw8JpcU8DRL2zshYqpExs9tMDhLpozvVNRzFdgel414QeNWhc7hrJVe0ZJf2RjnLm+PDUCnQDX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IFgJsbAq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJrXP004021
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 17:35:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zyNlb30tETnAmrNGQNUqaiWR
	HGW8KM+qAPfP+miBx5A=; b=IFgJsbAqJKuOGlBpIFgySo4WWLASEoB3ZQ19aljX
	DrpYDERBeY1pth+PtnFJD7OgtLRxJlz6ECxG20yFzK8u2XjJZgpWGEayswYtyUTj
	1ZZgdve/JUCkWo5088uaTvZzl2XlYnseZAMvmnmMP0KxE6jU/UhDPpg2/BndO3GF
	SIr2jl326ozUOmvYAiQ/v4AitsCrU2QDTCDMAiFMCJ1TlKC4P/zjcRaHbWh7NOQ7
	v+06SV30E89kiBF/W5MJ/JhCWlcz0c7+evCTVfZUxlllas3ltOrcP3HZnp7wwnl+
	e/BxrkyXnaOyqxpgwy7TwcQ0PRciOWJO0ziFXQFx6wNxlg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh29wts-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 17:35:36 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6e8ffb630ffso39606846d6.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 10:35:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745602524; x=1746207324;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zyNlb30tETnAmrNGQNUqaiWRHGW8KM+qAPfP+miBx5A=;
        b=JnVg47Ch2syEs0cBE+KX6/l6TqzCtw5oaDiLfs+mZKykqRfRrjzq4zvOT3/czXcdIL
         gmew0RwTPj4RWPOHOz3RwNnq4N4WadYxRVnWTLWPp1SL/gqsHpi19GVBigFGtHPpIJdy
         Vv7pEx/lDsxEpE+sZRAk5z04x9cE9QaItgcyDZLIbYswNUZx+p4dP6qEC17VUhb9p5e6
         X7zXSRsQAtTJrpKfdZUdr+dem4pyxS0oZa2eBgqrxMJTdw7/bly45DMnz5C74woHDVJi
         4Cudo35rvkrYjfbfQt+cse+1J+Sp5DWwmISeglSB17Wx5r6W/Eq1GJSXQh+hp+NYW+/s
         ShnA==
X-Forwarded-Encrypted: i=1; AJvYcCVMxUg14h/m2/eJNqRfYC9pdE/kty3rR1BF+HXfuAL0gKk3h4n2BFIKMwjmIvBIsWdvPZh7zkIvROIA5L9k@vger.kernel.org
X-Gm-Message-State: AOJu0YxNv3i2VQWWLXd39fPjhAEeIPwQh2fuhMVCKcQkptqjv1/DDME3
	6M6axKeGNXyoIXUPdly1pGyFIZnvdNBR2troJhkhSLD1uWfkzLr2dNqODpP8wQw+5z4jsbKMJNB
	ZNBNQp0Bf8Sp7quzR96ybRlIoKqbMqd7RIuGZ+GTkurR+Ei3tXaqEc+gA38xNmkX4
X-Gm-Gg: ASbGnctTdfO93suemOGm8IbvoHVm22kARJA91H69HMG7jhnLc0Wtgo6iQeoIZyMhd+x
	dusGt2yWsqRImC4rY9uNC2MBtBgpo4lVYEBryXv/6GB2wBPL6egKRDzyt01P5edOsSxK1J1IclN
	XDO2brcf4QyOgSqiI54FkCStnzDyibfPBh07NFVtYvp+01mUMeK5Yud018QchZ7/uce7Jgr6IST
	Kw62Aaoipe3e1OWGZgDWGajzq8zMn5RyQFdRa+B+mogJjwim7Zq36s5f4EO1zpFLsdVauM5PUii
	q26hT2NLF/1/FumvXcUgS4EwqbKCGFBOPq4otw8WqLjJICgPQvVb1psIUwZuPy0iheCJ/bLyFDg
	=
X-Received: by 2002:a05:6214:248a:b0:6d8:80e8:d567 with SMTP id 6a1803df08f44-6f4cb9d67aemr61638736d6.18.1745602524400;
        Fri, 25 Apr 2025 10:35:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFU37Zaa9PWwzxzLZ3L3wHDT45dKPCZDd+e4wx5Rp2/ForS3F+FljJ6cRIuW3K98foPwsG1kQ==
X-Received: by 2002:a05:6214:248a:b0:6d8:80e8:d567 with SMTP id 6a1803df08f44-6f4cb9d67aemr61638366d6.18.1745602524113;
        Fri, 25 Apr 2025 10:35:24 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7fae6777sm612960e87.240.2025.04.25.10.35.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 10:35:23 -0700 (PDT)
Date: Fri, 25 Apr 2025 20:35:20 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 04/11] arm64: dts: qcom: msm8996*: Use q6asm defines for
 reg
Message-ID: <a5ufjxvghgt44sqerzzd3xcf5gdq7uknj7meajja5rst4k7rip@kjxpvi62aobg>
References: <20250425-q6asmdai-defines-v1-0-28308e2ce7d4@fairphone.com>
 <20250425-q6asmdai-defines-v1-4-28308e2ce7d4@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425-q6asmdai-defines-v1-4-28308e2ce7d4@fairphone.com>
X-Authority-Analysis: v=2.4 cv=EtLSrTcA c=1 sm=1 tr=0 ts=680bc7e8 cx=c_pps a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=0uHdMyS-I8ESt-gxu3MA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: pUNsQ9ecpeCcct_tDBdNSNbhn6zbNwzz
X-Proofpoint-ORIG-GUID: pUNsQ9ecpeCcct_tDBdNSNbhn6zbNwzz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDEyNSBTYWx0ZWRfX8a69T9qkD9jy ZGSCL3e2xETxXT93Ht37w85+c1CzKb/iepl7MK587aUEtyRA44cOqYg71d2afpCJlkp8sUEKkJK m8aa+cEqXRIY/ZSi086Q8eVNtgVBDhOgc0nSMDhJFVHaN9hZjVg9t0rKhSDZd4JCI0tSCylPrLv
 pzmpVOiTGEczwhNN4B8Yrx4FQSOKuCCGO666HOFeDXmV7yAGRG5WfYKjT7FoNalBEMVcjwVrYTF fWH1Sw5WfUOqLYCSgLil0UkdRlB7MkcPf/ouRWvRgNX2neYRMtFOD5Ppp2R2sxIktFHzjYGrjlP 38vtc+h/zEGpe8bDpG5fzF/dAAeBzfD+ijxPnrFFLynAarszXMYsdNCCuJO3rXx8ZycpP4FWZBf
 TNrS0COjLP1DLVddk1gAWVOzrP9ahQFFlNQTVcxkUeM/KiSeQahmPllJVes52lHPbRzk9s3P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 suspectscore=0 mlxscore=0 clxscore=1015 spamscore=0 mlxlogscore=564
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250125

On Fri, Apr 25, 2025 at 01:53:43PM +0200, Luca Weiss wrote:
> Use the MSM_FRONTEND_DAI_MULTIMEDIA* defines to make the code more
> readable. No functional change intended.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi   | 6 +++---
>  arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dts     | 6 +++---
>  arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-natrium.dts | 6 +++---
>  arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-scorpio.dts | 6 +++---
>  4 files changed, 12 insertions(+), 12 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

