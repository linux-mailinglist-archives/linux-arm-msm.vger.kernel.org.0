Return-Path: <linux-arm-msm+bounces-60720-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A20AD303F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 10:28:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B886E3B6D8F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 08:25:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E419284B45;
	Tue, 10 Jun 2025 08:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GhjRt09Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB65E25E80A
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 08:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749543863; cv=none; b=sTOnL/jqgQ1BiJyRpxK2jiB3NtlJgCATUi7U+l2FYKmMCC+o2TlI4YQ1stpGXdhlKUUsrwlAMhIclSsE5Re3i6r2dO4lPM5+NRPshK63IEIY0RVNa7HVghejVJmzhNk64O2l9TXX81uj33VjWcpr99HYcx6TQrHvH9lakvfh05w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749543863; c=relaxed/simple;
	bh=ILI1+nwSZM4+Hy55FKo6eSUQ8cHxKvK9T5wiE7/VuMI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UYbXSZ3/rDtTWN498Os2f3ii1+7lkEIT+aFjvfbhAdxCgTrDoNeGFgHznJMWpv8SK+sGcHnap6YBf5hlwUvdR/aG8y2bQHnbJoLwipPFqn1o2ImDDhmDirM+LPrG/9i+iGTnndKN+7vHi/09ZDd0ZbISb1numXncTeLdE376oRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GhjRt09Q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 559Jrr6P013805
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 08:24:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=nfQulKshIbOX1jA5bT+aOGyW
	1xi4H37s4R8qQsbLSqc=; b=GhjRt09Q08hUFPIYGEqcaepY0iDSLIDTas4FMMFH
	d18mgT4Dg0CLhe5ijOqmnkJQz+znH4utxJOdffFX9+7H5HDJTpE0DNO8rEXCSxrs
	22qNTtZUe2SVg7FaDwVajp37wF4luiBiPPs9UKl1mrFiYdnPkYhHItKsbK+5DLqC
	QCKr9woxMM19e96UOtT/uSpf7qvVjJUZ/4i4A71i4Y74lg13p1FObwIT+BZxcNHi
	8jHhS3AZoSZPKOJ4F5Sc3fxDgY5nwLjDfTCCjycxcddDBym0OJ9RelXYgUr/zSxX
	SQ1EdzgktaGEaFHhTWIj2XFQiDb1zXptcYPnxqWmf3MHVQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474dgxrxyr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 08:24:20 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d0aa9cdecdso477297385a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 01:24:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749543860; x=1750148660;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nfQulKshIbOX1jA5bT+aOGyW1xi4H37s4R8qQsbLSqc=;
        b=U2ugauKFsJ+89fb1teh3Ei9OODJn7jaXluIf+o2g6E/GTV1DKPZL5uFRlxYUGFMx3Z
         KuUktNkINq3m5eIWzsIbhjZQS6z3bgSNSRBd9pFx6pqtUl+DM5VclcvaUcKW+i60NnqB
         lJGai93PR26KhLyoWOR/+piLUnctRqSdbTCO5dYgQQlRt7HuKX9gsmtdRMrBRKQF5L1j
         N16RYxGXFEBjDJ0+izf7ZcbAXUo1rp1ksP/aeXTAIyJlcCQ4VztM5zM5HfmRJI6YHzzl
         X7xFY76m3wFZ3gR3MyIPlIRVOG/cDf+XVxAUvXtdBs3qR1ndW7ih60nQzfGqCl3QUHoW
         68eg==
X-Forwarded-Encrypted: i=1; AJvYcCVVSxylPrB8C3K4reN7OlsS2aD18HnlH9GQITz7b034NAS1D62HL03Hg5hEY2NLAF52YVFF0opIiy/cZt4o@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7gkXDjWCWraq5nnLMbUl2m/JS+/WTevaJdcY0lw1TmBSEvrbO
	LJARmIa3WmLhD7C3lfx8vS0R5gv42TacULdO1Wfp4YU5Ci7Bd6FVZuesXEoFzjmM9InJe9TPrqy
	y2C/7OBRkYu6BYGik1yMtFLdqcS7sgNw2FhDqJYTs/lw2z5JqkihDCbfhyR8+OAV0Czwd
X-Gm-Gg: ASbGncsOsWYmBO/eIYuueGrlvYZnBx7w8rWtkxQ/ELr88xBSDGl/PK6R/3haJuSBz/i
	l2fVfzgZlke9IYbUY6qPu2yT7ASWtiy56jqSO27ccDLMTaeDzb6CtNP1zLQWY7vPJoZcWrPGbcF
	mQGXKgrXAxuSoJQ6UVu/x1DG+OyXkh2aJsYiqqb9cbeXlUJjA1o9soPB/OcdK3QxGO0II22KtEj
	w7nN2fSVp1kO8x5uJr7tzE4SE5GuDbSIkR8ZimZRFTbS69jedihhuDqfUaA00JYTkneg13+ZP3m
	MmqiMWWGInSqKOY6kdJxEKXm9EPXZYogk6U0/XJoyR9lpKDPP7hUX5ovMNEsrBVJWcfbisTTJgX
	Hn445hgKDJZxURgxIBZy4qrNql/FlJ3wfYAI=
X-Received: by 2002:a05:620a:1727:b0:7c5:a463:397b with SMTP id af79cd13be357-7d22995f007mr2469056685a.20.1749543859881;
        Tue, 10 Jun 2025 01:24:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFL9F5jqdq84IGa3cZa63QXPXnbFFEc0ZrAe1i+Kt381luyBdFVVtmeQ9rls0die/0j0iLbxw==
X-Received: by 2002:a05:620a:1727:b0:7c5:a463:397b with SMTP id af79cd13be357-7d22995f007mr2469054085a.20.1749543859459;
        Tue, 10 Jun 2025 01:24:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55367731929sm1460896e87.227.2025.06.10.01.24.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 01:24:18 -0700 (PDT)
Date: Tue, 10 Jun 2025 11:24:14 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sdm850-lenovo-yoga-c630: enable
 sensors DSP
Message-ID: <20250610082414.6pfpgqmvdyv3mrnb@umbar.lan>
References: <20250608-c630-slpi-v1-1-72210249e37e@oss.qualcomm.com>
 <e1367b38-875f-4a9f-9dab-9aa9f12488af@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e1367b38-875f-4a9f-9dab-9aa9f12488af@oss.qualcomm.com>
X-Proofpoint-GUID: 15ycwSak8QWZuaDIVYpZZR7VBoKruf7S
X-Authority-Analysis: v=2.4 cv=HMbDFptv c=1 sm=1 tr=0 ts=6847ebb4 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=_eEkAOlJaxbSRMKEyDoA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: 15ycwSak8QWZuaDIVYpZZR7VBoKruf7S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDA2MyBTYWx0ZWRfX5LTIbkaq0OId
 H6jgKc+/mMB7w4PLMJVP/qT1tvW32+9QGN5GpXL91C2ESR4h+zHnEYcFfk5gfTxjtPLVsryiMx+
 Iu2M+YLmfe9lB6OQGJ9FBkMj2XASdr2o43GjCBqr6PqqKZhwTAJmaKnXOPxK+Y+YxjjixBYG0qX
 zCZdjA390rOhUtLIs2XsZsxCpaltKTPWK4RxsC4hiopuISag7jSHQHS7E4FU6Vjf75QsgEHe+q6
 0D7PLADxoFm6QOx3tkaIfs8dS0oAfRy1gDW/k+H2eRfvv3A3txUEa8LfDJJezSnjoQcZuoQsgAb
 7s3LTWAMz3wGI4+0l+NzXpEuki88QmmZlGqmt5WtQY5KynipTLz6krPX4yO6mVYycQDwLU05M8/
 f5Ww+DKXn9oNzVsJ7cu9aj6zd3fMK9fI8w/iiV5nP103BKPCpGGYTVVFM0DvNskW0U+MrQd+
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_03,2025-06-09_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=536 priorityscore=1501 impostorscore=0
 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 adultscore=0 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506100063

On Tue, Jun 10, 2025 at 02:25:28AM +0200, Konrad Dybcio wrote:
> On 6/8/25 6:02 PM, Dmitry Baryshkov wrote:
> > Enable SLPI, Sensors DSP on the Lenovo Yoga C630. The DSP boots the
> > firmware and provides QMI services, however it is of limited
> > functionality due to the missing fastrpc_shell_1 binary.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> 
> Check if the Flex 5G's signing key is different (or maybe Lenovo
> had more sdm850 models?)

Flex5G is SC8180X, so it probably won't help.

Also, if we check the later generations (e.g. Slim7x and T14s),
different laptop models use different CAs.

> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Konrad

