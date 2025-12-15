Return-Path: <linux-arm-msm+bounces-85285-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 82857CBFD99
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Dec 2025 21:55:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4FBD13008893
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Dec 2025 20:52:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F4B5248F47;
	Mon, 15 Dec 2025 20:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oDZJkovh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BN+nv3NO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1F95314A9F
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 20:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765831955; cv=none; b=smuYDKRlInlCMloR2Yy+XGKx6RP/3KZwFApflwBfmYPpNw4cihF+/bIS5KZwgCRsuEPX8Y+vTj1TpR3Y+GmYZcOlAHzvJxnifcsSb5p+1bpupJnFKyCnEEjh500XB+C5qJDlxS1K0xO8QeLvJD3ZK128NF3zkuU3GV4lOtSwGXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765831955; c=relaxed/simple;
	bh=qyb0szwfr7ZYPjyRtHDrozl0B3Vr7ddyIprU5J873KQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GW3DPAshg5DVlIpjRS4y3zHSi+0JU9GP2ORbVxoycZV4m/5VRUgiGbK2U0ppe0g9lCr0oie+9zUVn0fdBimhu/ydlDpYXiuKMZCx8s8Z/SJBdBYKyiDfH8klF4T2NywOyGPntfi8v0qhR7A8Eq6Pt1N2UnlVsHXxL1xz7MMFDPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oDZJkovh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BN+nv3NO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BFFrcxc825901
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 20:52:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XLQ7LoQ8/CTmIBAWDpDu7tzK
	4curoa5oyocj/0FLnX0=; b=oDZJkovh7JcStoql5yuS+5zONGDvUF1wvaN6QbY5
	pob2eV3dFvVg9mcolIo/qyMjdiOspQt0jSNw4c1eJj7XBZLFUabhNp4kxbcIddVA
	MDxR5x4FSADp8oAfbeY2QsmtDQj6CxK3UXcnAEl1Pjdky2WrQCMffTwx4KzvjksI
	WzmQNBbY81hm/GOShRNGI66BQwx7bylBvlk2D4tYnOSJ39k7/9bfQaxusVZBhzhD
	YgdIuzWqBUFFyzSLRKWPYX1KlxksaCBCJQfKJgPyc6/VL7yvv0VXxfjFT/JF2WeY
	sRxKGA5t4+6E9ss5AimiyYfcbMRYZCaTpz6mi7y2jBkujg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b2nceruj4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 20:52:33 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ee0c1d1b36so81119971cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 12:52:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765831952; x=1766436752; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XLQ7LoQ8/CTmIBAWDpDu7tzK4curoa5oyocj/0FLnX0=;
        b=BN+nv3NO30yKt9Qh5/HAt2X66feR+CtCQF1jP4ogdoNhfT+YOp0IQr/n7bzDbOVkc3
         jO1JpAWQ8sj/Jov5hhthX1EgXhLArMWcA/MMxJM5aMwMQAYnkN1XFsvMUWxN9v4kfstO
         VafpO4HrUNvJ7QZM6IpzwTTbw6Yqzlo9KW2P5ZtxQtd1p9r9sRbukvk0rhEp1dVHwC+N
         kNw7MjkvUeXh2AuN+2kgFuHCguCXzrzqNZN/MSBUbe/t1UFsYaDBVOhCylBQXbI4EAcT
         yIpNOSE/4va6ELUm2wJVOh/3w5AcT3p0PW9rjQp0vdntulHjFT1rKzKPwlj3gxN/68/X
         6hvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765831952; x=1766436752;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XLQ7LoQ8/CTmIBAWDpDu7tzK4curoa5oyocj/0FLnX0=;
        b=hJ/+d80XIAZrMtxHI+YLVTUtTdX1tHiI5jAmauUtCuy9g6py2RLDRL+3vo4QQNj9n4
         cVn2P7XOgkbEjEiNwLQNwuvOXiqpgk6bw+QjEKF4vDWW72y3dRLoRUySbWdvR4oP0mgy
         xbVQVIpneGAbabn/d9UzonVvSNi8/Gzp4yHBq/3xX6vNc+ByXP6vvdE9YTzS9xYW9UMr
         Ctv91ffw5n7BXQ3d3tzqctfYErvEmk+QOi8erR0k/EyWKV2KK2ZGqJKgG6Hhef0InbV/
         Nb++fHYNdwHoSrcW8jV3vav2WG4HxzBXBXeANtY3b/zboYc6M7QEGgS3t49ThZZrIGMg
         ADyw==
X-Forwarded-Encrypted: i=1; AJvYcCWfnT/gOnhU3wTllzSEYntnCy8v0SEOMalxq3BMeMBnzwvvjtV6i5Is/AG7CmwLq/9DdlLT5yswg0bFRuWv@vger.kernel.org
X-Gm-Message-State: AOJu0YxxtsPtTtmK9yMqgmV5zfOxPvd9F+q5L8k9aeY3FeEOJHn72+I+
	05kcCApSb1vBJAD281cUfB+z1XK7j617Ek+oc2xwGYfyLFcKWVKIr4dCA/K8ha/WIjjYD7QNlz8
	7aSCbflenzYgOuQAa/RiTuX1Q3I7SOsgfuhTzanri2DLY6+k5Urx4WFhqcXZdE4d1FpGx
X-Gm-Gg: AY/fxX7BAnwEK7aKQubn0H1zMrHldSnctbjKTn1rpkhLIYzQK0p7TIG/1J8vvdpUBTQ
	y2fWLjBjJ5nZF0fH7mae6ePZ6oTfCO+EA4fPLV9ShgE+v0mEchxE8sJk3VzJyNbeNaDicCjzgAD
	3Wh6vHryG0Q86UmUSB+AaG34GpPqNT8vh6+bSi5kAHQDiSrQrpJUpIkp5v0j2BtroZfGHof+mag
	fKdNgpovSNybELpVhzdOJSipzVnCo1qXAUaH6XV1r8SXumal4OZLJaq+K9WrxC2KG6eQttps+/F
	OxVdD73G2x3JfhsJ+icD9l2bwE6mwnHQIH0GeHxF2zSFr4dbc2BeJAThXygKCw+J3f3BycytZGm
	Hw3jeUStYgRzvc1wsiukR8nFYK9b3uwHm6gzxKcVZZX1flFMRiZpF+TYPzUpYNRELRBu3SFJIqd
	do6DgY14X/y5qT0xpbdTBjZSE=
X-Received: by 2002:ac8:5f06:0:b0:4ed:ae94:5f5b with SMTP id d75a77b69052e-4f1bfb9be98mr220664321cf.8.1765831952070;
        Mon, 15 Dec 2025 12:52:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGd555za9qNyH+D/h/1c4vO9Fu6GUCWOXb+OAovvIu3zQYErtvrMYhhZ+ntOg6X0XWZMv4nmg==
X-Received: by 2002:ac8:5f06:0:b0:4ed:ae94:5f5b with SMTP id d75a77b69052e-4f1bfb9be98mr220664041cf.8.1765831951681;
        Mon, 15 Dec 2025 12:52:31 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5990da503b7sm137606e87.56.2025.12.15.12.52.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 12:52:31 -0800 (PST)
Date: Mon, 15 Dec 2025 22:52:29 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: george.moussalem@outlook.com
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manikanta Mylavarapu <quic_mmanikan@quicinc.com>,
        Jassi Brar <jassisinghbrar@gmail.com>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
Subject: Re: [PATCH v7 7/8] arm64: dts: qcom: ipq5424: add nodes to bring up
 q6
Message-ID: <lxxrqp7jccgiiluidrioi3nnjuzsosi5elasj65miiuz3miop4@mgjuzoja7quc>
References: <20251215-ipq5018-wifi-v7-0-ec4adba941b5@outlook.com>
 <20251215-ipq5018-wifi-v7-7-ec4adba941b5@outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251215-ipq5018-wifi-v7-7-ec4adba941b5@outlook.com>
X-Proofpoint-ORIG-GUID: jNbY7VCd_go7sSYrtrWxcxaIjunCVnpr
X-Proofpoint-GUID: jNbY7VCd_go7sSYrtrWxcxaIjunCVnpr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE1MDE4MCBTYWx0ZWRfXwxlNTE/fF8z/
 ICPyR1qEzYfsEqA9HIubL2TZ4hT37LPnRVYesZ7RlH40yKGjkV6mNXMqRJx1jvBkaj8C+6iinvV
 rVhl9S5NfKp0IxvS8PUyZAb8iCaeWtOT5RhX+NhJr27lVvNsC+btpm4jya/h4ou4jWluRvkQzd1
 MtgEDyrYGcMtLF3IlnIgbKoIWMZ1YDhvPocVlO1KPmMbtVZ89uMzlyH4mgDqxpaby34SUYOnypZ
 fI8zUd2rat4JlUQMLOy1Z8YWwz9Hpa2wDRKVgaBt5lS5SVohXadoR+DjlvxdfRxYVEFzGhCoRpg
 kcA+opsDQa0yKyEaYsrJoVFZ1DLrZ9EuQa/WWdNqSwhGdbVnnUoICoMCqlLyUdoGp405CyrT2xW
 IWyIQKj3SXn8KnKCtSQD8ePeisXeHw==
X-Authority-Analysis: v=2.4 cv=XJU9iAhE c=1 sm=1 tr=0 ts=69407511 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=UqCG9HQmAAAA:8 a=unjgD82zaOGdZq1vsYsA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-15_05,2025-12-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512150180

On Mon, Dec 15, 2025 at 10:35:12AM +0400, George Moussalem via B4 Relay wrote:
> From: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
> 
> Enable nodes required for q6 remoteproc bring up.
> 
> Signed-off-by: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---
>  arch/arm64/boot/dts/qcom/ipq5424.dtsi | 68 +++++++++++++++++++++++++++++++++++
>  1 file changed, 68 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

