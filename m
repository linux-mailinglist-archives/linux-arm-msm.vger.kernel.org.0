Return-Path: <linux-arm-msm+bounces-68744-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4081DB224E5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 12:51:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C2BF63B5D7D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 10:49:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9889E2E612F;
	Tue, 12 Aug 2025 10:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hrv37DW9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1687B2EBBBF
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 10:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754995648; cv=none; b=g1YHNnvDDjN0SRsIFh0ZInBTVWtrNbMoQwYcIg06Q/tudSjxVZPBQy57DlTgx15g+ccv2a0EGlAIFZAl5FqOXkZjEyS7T1H4zq/k5tqyO+SjzydVh4R+eY+clHeFnXCuZJI23TMhKHMpadaBQmVI8cTkHs7NxmsYP38kmQw7SZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754995648; c=relaxed/simple;
	bh=sYTpAoO/MJfpiYDH6SWgKI0yKgXfgoJi9HXPhQ8RgTw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g+2CikUIhYuxvXvDPYvx6WMtxnX5pk1ve88GnMfPljzcCIvDA9Whw0dteiw2+ksgc6tu3qK6UZo1/Tl+zLwKMn5cbVguqao61SXWCI9tTZrzW6tW+HjR5uW8UPGAySujyXSsrU5MiThk94D+3SvtUeSEMOmF13yqko2X6pr1e2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hrv37DW9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57C6XLYN008382
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 10:47:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RU1xZ70LjWvBJQnp/8lCapPy
	QOMTXLUhP/W47Evy9Mo=; b=Hrv37DW9RQ6UcgdqWqj0o9uXJIGdXqi1SHW9fsd4
	VxK9COfNxSXiI7byxo77E8B7qbV73TD9s78TDHU80taq40iBpSQbTA8xrzAwhuYx
	g9t4nJ/J3Bzvg1arfSLx+8Sh6kje/gKM70jB5d2OAKwdyLcmWF9jKlWPMWAK3uln
	GCgWWUjPnaoDimv1SvuDvPp+9S+2TQHjTrgQ8obFOatGmKrlg/A+xEXkpw0OGEXG
	ZNsrUnajxdm/UTAQlJE5scyZ6kzL8eQv2vEjRDc76S/xojedMc/EethweQ3EdwKD
	1BkyDhRvX9THWWABsZdLHCM8Swr/eEbwRNG691n0xKBnOQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ffhjkmm0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 10:47:25 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-7073140087aso107274956d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 03:47:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754995645; x=1755600445;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RU1xZ70LjWvBJQnp/8lCapPyQOMTXLUhP/W47Evy9Mo=;
        b=m/m8TsNkjeCOwj18e/8mnG6F7rD2Q00nibOK+K7Vx5LPQIYAJmdwl/ZBopgmEYLL3d
         egc/ArutEFPW5o3HvGqK2Y5XmfwCqos116M4Hubwix0ao0uN+gMvjIlv5k0HYjTLG+EH
         RAo4FHkFWkraRdqx6KWYYE8Aax2KKMI+ZiK8kQwXi1ZcQKcM0I1CwxONaddHJETLJtyR
         FZchcY1At+ib2yzJOIoIxlvq/n/vc5w0BHGmwVODCloVaT4TcbyWr+aVUzMg/pDCOzK/
         qmB2UH6oBo09ec1JAvooNro5Wq39MRgWrPS4JJdbHQyCXR+nx9kZJaV0JdRUH70URp6F
         P08A==
X-Forwarded-Encrypted: i=1; AJvYcCU2/vrVDe+ewrwIdJ6ZHKG+LFN9UoGoLDBy+WkyK4Mxm4kTppjhMFuAqw3ZwR0b91nwbL4bFqdsVG01E8vl@vger.kernel.org
X-Gm-Message-State: AOJu0YxPx6cFd7hEftpxUUfozrs1ncUDJPGm++tAK7x5ikX0MLRD48IA
	p6t9wZd4rd/3OGggaIgcxAfF7mig/z5eiazphZAxTJrGRYKLduYRZ+38Ev2E4McqpHgvx0oJ7GD
	QU4uyr1r1Y1HuNhegRuzWKpUgVu79HYliY9c/1ohwhnKhRbNb/5Jgngm/ZmgaZ0iKe6SA
X-Gm-Gg: ASbGnctMduhTPT87OpAsT6IsyyVnxsM0wN7QacS95lvgOELqhlCvqVKBfKpBIgtO5d/
	sBO+/e2c71lgg+AAUH2cOSPHaXXan+kFM1gLTO3cPAy6Qy9aVTVWfNXvzGh4dbTgbi+qc6Un4p5
	JJjSMiIonXsuD42rTkYXYuaHoScLIBGZY20k8tCxvUvV0Yq1fw2+CUlWQv4eIvhxmnntWpE43JU
	Q7EUmaYxdKQoP81bVrfMrKOimZ45NZGRft80VbP+3r+PrLWJk4YLNx9/LHwRgKvauAJzRu9rYjb
	LOVfjQ3xKooA48ErlkBz/rGunzJpYGSrfR2DUQq/EGQVyDdQ4izu4s9tIUCj5OisezUVSbpg3jJ
	XKr2qee/RE8cHEbLplTU+koBIvw2SpmLpkHuiWAnjoTy4U75zTQzH
X-Received: by 2002:a05:6214:1bcb:b0:709:8742:e46e with SMTP id 6a1803df08f44-709d5e2b82emr47219746d6.45.1754995645160;
        Tue, 12 Aug 2025 03:47:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGW+hMss4BNMWWtYqw382EqZbNCNytLhvrUCld9+J5C9taVzj5C5lLEdsNdKRSjAhJWUdrW8w==
X-Received: by 2002:a05:6214:1bcb:b0:709:8742:e46e with SMTP id 6a1803df08f44-709d5e2b82emr47219336d6.45.1754995644651;
        Tue, 12 Aug 2025 03:47:24 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-332388d46besm43432691fa.48.2025.08.12.03.47.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 03:47:23 -0700 (PDT)
Date: Tue, 12 Aug 2025 13:47:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sc7280: Describe the first PCIe
 controller and PHY
Message-ID: <bfaoko5ztiaouuhpi62jgmz23rjcabskksxarncg7dietu7bz2@coat42ztyzsy>
References: <20250811-sc7280-pcie0-v1-1-6093e5b208f9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250811-sc7280-pcie0-v1-1-6093e5b208f9@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA3NCBTYWx0ZWRfX1qzCB6aMzxpf
 j7RZSXK4tfHxCRZCHAo4veo24VHlEeJbuFigRTxEh/VetYUwRwUI5yFezKOJahE0tnpbXXMGAKY
 uEE5lV2UVBXqPGRdmD+G4mKJEmC+fLItfUyf8/phFJV30MHdCXXsDJ32ODpY8TSIKkrlRmWcYCl
 aTZFmQugOfwplcZHekaPGF9GExBQ1AxRMaa0di7UKXrKK3hkHGE3Zd0sygLpp5AXT9PvgqAoFDw
 aMmUJ9Gl4F9sp8m3cTvviQqfzwxENnPkdAP5czHYadhnMBqBrnIc8+v8tblfeh7jV63vLsFcGDg
 6aThzE72xdH2H4IRaIz2LUFJbow3+xKbNBRxsMJBYj6NwVKufhJG3k6qJfOenWoSFKeVsNrBktg
 e8z94n8O
X-Proofpoint-GUID: RuMRFEjYoqwx1qMLJuWDj-btIieQMbCM
X-Authority-Analysis: v=2.4 cv=TJFFS0la c=1 sm=1 tr=0 ts=689b1bbe cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=V2r1pZe0Pjlh-QoW75YA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: RuMRFEjYoqwx1qMLJuWDj-btIieQMbCM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_05,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 clxscore=1015 spamscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508110074

On Mon, Aug 11, 2025 at 10:16:29PM -0500, Bjorn Andersson wrote:
> Only one PCIe controller has been described so far, but the SC7280 has
> two controllers/phys. Describe the second one as well.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 134 +++++++++++++++++++++++++++++++++++
>  1 file changed, 134 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

