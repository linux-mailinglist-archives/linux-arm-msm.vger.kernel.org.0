Return-Path: <linux-arm-msm+bounces-63762-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B61DAF9947
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 18:49:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 23523189BE52
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 16:49:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2ACC2DEA65;
	Fri,  4 Jul 2025 16:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W1rkR00m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 735C76A8D2
	for <linux-arm-msm@vger.kernel.org>; Fri,  4 Jul 2025 16:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751647702; cv=none; b=VSqipCAYHnJ9qQwWCMsBVKf9mhEtZcZAe3P4sC2BF6vthoG7wO8sTzxBPDrPtrTjqNt8itNCHbYHwPUBioYhhbI2aEevvhpAlUNz18YWT9R0OuAtcDz8EiCqEtzAxc3OQaM3P2XGjpqCwwcEQNqrPxNDRzyxjkmeZAKwo5p2Qq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751647702; c=relaxed/simple;
	bh=M+Xmi4lwtsMazAKYGSV8Ut3Pp220PPmHBgKKq2jnaWM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=brCfSUpYoMrxBFhdZiV020Mtysl4k78YWaYWHe79ja2mXRyRvVlQ8jvRMj19M6hBcz7sVL80AgWeI+XwwJhkT0xZ4wMT8yJinjHZeiTUz3wDthOje3LXY6lGVat0GsND50cjzq3orp819SgfDFMLCpumbrDYTT7yVT6YOk6w5DU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W1rkR00m; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 564AQcQc010068
	for <linux-arm-msm@vger.kernel.org>; Fri, 4 Jul 2025 16:48:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+ZA3Iaf+JIUQxzbRmYR7aqyq
	GxiwIVe/fI7bAKvTQkI=; b=W1rkR00mj7WYF+MQpjqTnCwX1XLrTbgL7qh3MEoW
	1ciMj7rhD1m/eZDUdTWj2TjihPjMO9v+P/8zaF7LF1lyMYTMQ/hiGyzfhKzitpLX
	Q8mUU/RgE54xxZ6nIq7ysv95av+Q/Fh0mutwqOCv5+Ibzfy4qFOh7abCJwtQAapa
	VzPpe56FFqodaVFVlZ69JP98Yc5P++EH1Iz3JQjzoCGmVeeSmpJf63JUptrD45ar
	yG6tDUXMN8hwbRJuE3OPk2D2TzrGln0gvyftY5Ae7ALJCPz86+Ev7fXyhhTIR4AL
	NFy4niiXWZHM/H1ZACLJmcH+9XkqDQDMYva7dtpU/lBcQQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pd6w0yjb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 04 Jul 2025 16:48:20 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d3f0958112so153441085a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Jul 2025 09:48:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751647699; x=1752252499;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+ZA3Iaf+JIUQxzbRmYR7aqyqGxiwIVe/fI7bAKvTQkI=;
        b=hiImfbZKgPl0PQkeLxv7bSmO8249CW7agEBOB1xfyquqj10Tb61Se7F4EqyoiYGMi/
         pdnpFanMl29IfxRIanQ/9c4kDp4AyEclQ0XCuhIifX8/yolr/yGIUgWhkTDexaUuWY4x
         5EKjxorpUFMpqM2cE3GNLFSps8ZNdpVanjS2dNh9cnLz6tP+9AZ2PXqX/Qi45wtlswB5
         bhoKSgCAh9HM4BUYZASyySMfUomC/z3GtHiUG22/W5nns+relEN9QfzXwrIgh3C7yRj4
         zp274XqXklePZ8zaSMrNikoPVC5fEZkNFqvTh4DY/dZpQCxRrwifo9Hetgm3V46Ak/j/
         Aj4Q==
X-Forwarded-Encrypted: i=1; AJvYcCVI5bJQbA57QCHq3BA9rmbtFrHk02ohsypUiRWBkDFP7H1XArKTp8tJDoAFstlMtvR7LJ0p3tX/ZYkYdRRr@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3medzYBu6dGjA5d5rBmDZ6YanCinj8OSEvhr1KXXZNDSAwGKO
	p9+jiX6xmEfKjeZ+xOUZo+dXLg6YSoucqtiMfmnjTxtqdKIPQyEswwQaLXtdtdhnoHqWWZqH/1D
	A5r4KMLzpf6CWw01JnraZuSo0KpTMmiqcecF+ZeqBgsSBUkUpoU1Bi9XxW41MxEFtXiG0
X-Gm-Gg: ASbGncumBbdxZi/sENFN4zu1+6LaXKFy4PgNLmyi6M5MuDzpH80IFItT88/EaQH0Exs
	erPnv/Y0lqBARRIJ1xVFC3PS19oHzLycNSJjtPxc3xCsVuTWiIrc2AiLjMhyO5eXIuuy8dsbs6c
	mtpx6OgXYWY0koxIFvhcdBuTcVEqBIEKEhanMr7pWwlbsi/LG0U8ORRSlt7zZzsTsqhTa5oF4Z+
	Lx84G8tujD7RawClWDqxQiEa9hu30ekjOLq+BgYhFuO0MqhgRuZp0ibCUYKb9aFJci/UbC2UG7a
	QNI7Nm2NtEFk7QOsqjEPdZnV65LKHRqWpCCKloAlwp41V9zoijGqKKqYhEkI6dXRjUsr+/wE0Fl
	RMORH+jAyy8RRyOh/QNoy81+4mgJqiu/oPCE=
X-Received: by 2002:a05:620a:2988:b0:7d2:fc7:9572 with SMTP id af79cd13be357-7d5ddcaec7amr434043185a.57.1751647699293;
        Fri, 04 Jul 2025 09:48:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEZV9Tkpiv5v0m5nwKUeJs1ptVFEx2pDtiPHeAB7ZT3kzhlOjIW650b3BM5UPnwmVpnu/SrTQ==
X-Received: by 2002:a05:620a:2988:b0:7d2:fc7:9572 with SMTP id af79cd13be357-7d5ddcaec7amr434039385a.57.1751647698851;
        Fri, 04 Jul 2025 09:48:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556384c8f24sm292469e87.238.2025.07.04.09.48.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 09:48:16 -0700 (PDT)
Date: Fri, 4 Jul 2025 19:48:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Taniya Das <quic_tdas@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org
Subject: Re: [PATCH v5 3/3] arm64: dts: qcom: qcs615: Add CPU scaling clock
 node
Message-ID: <2vd5wge5hig2ilcih3gvvmzphm3ptkqfklg4ctsxd2pfqdd7gx@trzoqq2qk2qk>
References: <20250702-qcs615-mm-cpu-dt-v4-v5-0-df24896cbb26@quicinc.com>
 <20250702-qcs615-mm-cpu-dt-v4-v5-3-df24896cbb26@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250702-qcs615-mm-cpu-dt-v4-v5-3-df24896cbb26@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDEyNyBTYWx0ZWRfXx/8968+qn5B8
 oN4NddaSoSfqnkqpI7W8jzq/7F4BdXjrCUqX2JQ+KpU9inDonBYqXVCkSwvg2ir0ydug9NzxddZ
 xA3IoSt4LSjeft9p7zldAsT/mvS9BBiUMvsvWKwlqvUInKNGEAOXtuC/AO79G/GaXr7l6JY68H4
 2athAcOYYl0yy7RCBUyBjhqpljX11cRi5aPtefK1W5kb3d0/jg8L7G4KbuPOseUZ/dEffUoD+Qv
 NGQQ3AkS2JFsTmjM4zOg9Y04AaTnzQsXZx//0Fz+5BxBIkPFXvbPHCBIoq8iI2vfTUgQFqPLNSR
 HnlgyFsMOuDS/urIZUYd7TIpDtgvRr+YH2M31HGc5x1iZi9Ml1LPgRhCWaPBIl1LNjNksRt+oy4
 5j5yFWQdWe5POxTiF8qgy5k7JjagLGpMyJ2itdKbVSTZRbwca0xzKSkcloHMX0cZCsmiFVjk
X-Proofpoint-GUID: kjPrrES16sSUGr895PTSe5p7xzKWVxTp
X-Authority-Analysis: v=2.4 cv=UPrdHDfy c=1 sm=1 tr=0 ts=686805d4 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=2bv_n5k-JhLVcNsY_rQA:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: kjPrrES16sSUGr895PTSe5p7xzKWVxTp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_06,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 mlxscore=0 phishscore=0
 mlxlogscore=838 bulkscore=0 adultscore=0 suspectscore=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507040127

On Wed, Jul 02, 2025 at 02:43:11PM +0530, Taniya Das wrote:
> Add cpufreq-hw node to support CPU frequency scaling.
> 
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs615.dtsi | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

