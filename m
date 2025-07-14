Return-Path: <linux-arm-msm+bounces-64886-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B7BB04ADB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 00:40:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 55ACB1AA039F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 22:41:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C21C279354;
	Mon, 14 Jul 2025 22:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RAIskzLJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91484278E79
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 22:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752532825; cv=none; b=FC2VM0Tis509leZcssohB+qucaJLLuX+kMBx/3cTPCIwnK9/mdXr7lv1YdDjKxxOcuMzwi8yA7DRBtYQjQLdzZOFGxjkMyMA+4WfogTJT14DgqvyNkzd78f1Mh0c47DlgQKklclfWXgBUPl2wlD/DPuHB4nbZpDOhM4dJZI9gh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752532825; c=relaxed/simple;
	bh=4h5qlwpeesyHN/FRt2ZtRRGwEAs4CU5jNL3eU0tHdm4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mZ2pSLi+asFW9ZvKQgve/vDn23NKVR08dqgZnJwsefZTkguctNqZiTor8+we/kF1+VkkjX9uHh/ytoYC0MLfB1ItNChv7uBIsxoTPBO4MOt8U2HU1bwcyN2dbaNQj9ZOgn7HIvP/dNyxWhqbiyLtNcN2UxnJthx/AvJUqXmS7SU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RAIskzLJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56EI2Q7F022925
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 22:40:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yjSwbo76oRHzxnrqM3sUTeEv
	V+WSiuNA1qDRjRRLBOw=; b=RAIskzLJfeqGTk8Y5KGy1lzHZlBjDQv76CdUyhVq
	8DbTbSHio1vEHXy4ivnLB9uYSngwhb5L8VAQDAxbV+t6VvCeXRkmf4kZGE3GS1y4
	3prAq5BUDHTKDWFJ6P7rLw7CdA5TbbCDsuMCHu5qhVBIj1UAkO2LnQ4vjjLNn7na
	mNvc9G7CNirOYJZ6eauSta3ixtg3Im4CjBioKCIkkG323zDdrCMCWuQ6+CWe/UDz
	fJfMp0gOhTzDxsoPgc1CJX0Gk1iz9BgC0IjxpIziQFR6bzdDef+UTu9W1xbH2PAY
	YIDk2FIMVxjnA3u3vNeo3loYNODWHDuZJtt/h+d71GL8YA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufxax4k1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 22:40:22 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7e237c2f4ddso285547885a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 15:40:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752532822; x=1753137622;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yjSwbo76oRHzxnrqM3sUTeEvV+WSiuNA1qDRjRRLBOw=;
        b=YGQ6HXz4yfvR2J8QC23AxsEJBktbEdXHasJ2zcN8OefhViLqM4itxDctxLd/KhiVEI
         3VRFHv5k7H6rPyZ/BGmhoCBLSCu1LWLBbjBV+cilOEUIvp1lU5wq1RbAahh5CudLCvfh
         xrNOShsWBLZ6YQmt3a8zit+H0XkzP1OZNWZ0/WAEBL99tYEX6YfEDtlXNq/D8/5lX2mM
         jXYShHK2vuXBYVDZe4S1HHQ/++TQT9kIMscCwOpkZ9vB5H14TaH1plIsieX2ZjaN0E9u
         nyiYj47P/2BRvce4YNmv79rXfCvZSiDotGl6hMxmtK2gPeMzbPx7z7SJ+BlxcSGYSGBc
         B6XA==
X-Forwarded-Encrypted: i=1; AJvYcCW+rcKD0tiPe3QkF2025y92JPcoGy4Ml+AcfqDx7G+Bmg6hl1XFz5iUrFJcgAkHbwhzG086aUIt5ZN+otO+@vger.kernel.org
X-Gm-Message-State: AOJu0YxlQzjsg0nxiFH/LXNP+rR427b6Pjq2pb5xPs5lggaNegkQ3/6d
	uSsRrCPpBcle1/5Zv7mF3IoPPI3nUTWx06xdNnGP72p3LZMoVoLFW0ZpuE8SnMYi711LZaguNZq
	7HbT0mi/9yOsNg+PMvRkA4JyRIP2xccCqyVCcRhlXXf74L+hjlKKpJy2WfSVS1IvD6vOu
X-Gm-Gg: ASbGncvMEai7GusYSxrV7ceD+W/gUiGJQasBnbTLg4tYYjwRi4+HaMetaRJlpdcOM99
	QcSR+vFYzDDX8HFG1apt7ORNipdi8qMcXUDodwB93qty6sLdEG1PrR+x+5NwUMmGW5MMYaEqtPT
	xaNp/MRQJ4/akI4/atOH/7tksgLeng+Q1dRN81kvc+tO5ATyiIUJ40l4W8YmOPJJzjDIaMaLnNf
	8FZhdS6Tpgz5SLUoS5rzNbe9a762zzKPFxGlevOlNs5dWUM+efUORdup706SSdtCNkgI6/zHNoH
	gbQ+8PLH1Uu+hHsHdzp8TeLe10xmaBgeXtcRx6PvedIP/xqf0jsHgNjzQ/xF+mAAWx5ekl+lXm/
	odahV+QHDgB6sfWFDIHHOmq15A/F36nXgrc4rg8dFSUfI0soo/jJR
X-Received: by 2002:a05:620a:40c9:b0:7d5:d065:5473 with SMTP id af79cd13be357-7ddebc95009mr2146588385a.37.1752532821525;
        Mon, 14 Jul 2025 15:40:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHa0HRa/hfK6x/NEBmsxm/cQ5Kjrt7W4P1iVcEqAb7PlaCTrfUqNMH3CjK1pQSOrmvZybaOZw==
X-Received: by 2002:a05:620a:40c9:b0:7d5:d065:5473 with SMTP id af79cd13be357-7ddebc95009mr2146585685a.37.1752532820961;
        Mon, 14 Jul 2025 15:40:20 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5593c7ea2easm2085007e87.66.2025.07.14.15.40.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 15:40:20 -0700 (PDT)
Date: Tue, 15 Jul 2025 01:40:17 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Prahlad Valluru <venkata.valluru@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shashank Maurya <quic_ssmaurya@quicinc.com>
Subject: Re: [PATCH] arm64: dts: qcom: qcs9075-iq-9075-evk: Enable Display
 Port
Message-ID: <fibzazcqx5rhdrsuz24hdasribdxllsj5cclq4pe3wd4mpqiqe@qr3fzc72wbuj>
References: <20250711-enable-iq9-dp-v1-1-6d381e105473@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250711-enable-iq9-dp-v1-1-6d381e105473@oss.qualcomm.com>
X-Proofpoint-GUID: FhJ9BULpR1reAo1AWqxyfNXXQOiGq6wq
X-Proofpoint-ORIG-GUID: FhJ9BULpR1reAo1AWqxyfNXXQOiGq6wq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDE1OSBTYWx0ZWRfX7Q78cn2NNDSf
 sCWuG+2mwz5E8+TBB7pj3YD5LVrSYOAKb5awGWCnK5C/BA5Vz5NS55PXOjjV7vjyXUd9j59iePW
 +VPnOcHBNQ/eVa4WWT1pfrc4wNn/Y0VK73RPnwKIvkoly8lzrh/dgcY+D+UcK5ZdzSrerZTuA4G
 VbF+q04bEIjm6+j9p0pC1eoGrvONWM0ZnqBf4PB1Lt0pTxsPB09a3cfD84P13VLGptZICivSo8f
 opEhOrpdeAlV9+PruGrPo4T3st7qJ5n7rb8FS7L9lBmiAa6yz6zxor23ganhwcA7DQ18WpNOYqh
 Bc8mhJRYex3xJsUFv7e8biS2fYbH/VqeVHVpZT7SB4ApXZw1nhmmQJhHh4ATiFNO2q1fJsPLvCh
 5z1TMbi5MMBkOVQV5QbmDvzA6zKhoGFVpcRlgBAkKd22OP7Wnv4OQS/xt0NV42OIojBhyFJI
X-Authority-Analysis: v=2.4 cv=Xc2JzJ55 c=1 sm=1 tr=0 ts=68758756 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=QGU9b-9ATRnlJsYRrdYA:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_02,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0 priorityscore=1501 adultscore=0 mlxlogscore=833
 phishscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507140159

On Fri, Jul 11, 2025 at 09:13:47PM +0530, Prahlad Valluru wrote:
> From: Shashank Maurya <quic_ssmaurya@quicinc.com>
> 
> Enable DPTX0 and DPTX1 along with their corresponding PHYs for
> qcs9075-iq-9075-evk platform.

Please add corresponding dp-connector devices.

> 
> Signed-off-by: Shashank Maurya <quic_ssmaurya@quicinc.com>
> Signed-off-by: Prahlad Valluru <venkata.valluru@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs9075-iq-9075-evk.dts | 52 ++++++++++++++++++++++++
>  1 file changed, 52 insertions(+)
> 
-- 
With best wishes
Dmitry

