Return-Path: <linux-arm-msm+bounces-58428-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E903ABBBAE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 12:59:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 47425170976
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 10:59:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5D8F272E51;
	Mon, 19 May 2025 10:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nXT8/90U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38593245037
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 10:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747652333; cv=none; b=tgIVQsSkcTpg5MP2lJXi56FXa8Pyu0jA2DLFfAjZ7TN/zc0jq2IdhbBqjBOH37Gjj/MgLBTzPtYts8BGOdQw9TZrD3zBJtJ09T9RrU4Hc+LtWkEdvvylMZHocT/XZHv2ypK/ICUYpb4h+dugLAhUfTUlwlulZZPqy5wyWPRwfAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747652333; c=relaxed/simple;
	bh=O68Yf4MVfSbvrTGnH2tyPtJDd/D9PTw/7oag6m4b3Hk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hThOokHzaFODt7IzRhbiF4Fg1ptgdtTe/djruJtJPTb8g+edhDK5o39cllMR0PtMzTZ5lZacN3RCbD4dLj1UQxdnOxXirCuxX4gBUPkzj4djQSSOE1zbqlNqn6J9e6dacUsIxcXoaAjiy93oJrM/lbea9U1FmyIDU7Fnl7JuHq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nXT8/90U; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J9XnHr023770
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 10:58:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VqRNS/AP2L0HYV/XzQMxzhswyBS2iB5hSp0sUNl5kjs=; b=nXT8/90UtPNYFOVl
	lO89wI7YQKOORwYNbXDwpUcHcHCYJEEnnNE/d2sZ5vcwuHD1lFP11G1pUGwuApvn
	crn7cvzPlakbrP9FtDv28Tme1qNFW5ZXiRzXro63fVro/1EzE9y+ORx6CdZU5kVi
	rEfcFJbXwaegQ5suYLTplGNyNMYqWGlfiH3DZS897k6cc/FtEa/We/gu8MTjqb9C
	ADDaqr8EiaX1n9jIdugSl6TqJSdZ0c1Ye0BZhms2r5FATXD1L/q5fPAZ8SoXha6p
	tBpVWX9dOeQB8usjOVYApGbmeeIfE4fEajD+zFGFF4Z0ZoRp0tLj8e/dMAwXwI6X
	kbx81w==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjnym4fg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 10:58:50 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6f8ae3c3d80so72232446d6.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 03:58:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747652329; x=1748257129;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VqRNS/AP2L0HYV/XzQMxzhswyBS2iB5hSp0sUNl5kjs=;
        b=M9Ut3DSa8RevEH9YJ2c4AFzVTrIUpk9IdpONlBou2vNPO4xOafPlddZysGYuBO7gKn
         DSyMOZLLiaoHypT7kqVEM8kdMGVIYAnbhK/jWN09CQaV0GJ6yjyU0Esp7e8kQkQvUbjT
         OYdzTGhoSbHIkHfcgA96ffLlfHOI44VQ4oEXSxLnmgtrJy9sHFdcb/7Ctfvz9YNGMowq
         n+KkAB1TC+iaEVeI632VBzgDSj3ik/xZDZhFIczotgJ8v1Ti05iYT9mGpSiSfATd6iYZ
         XVL0EEP4V+u6vfraUJB+onx1EOOoGRn1mtaglNgkdsryj6qzuLqIju2nlMNw7ybm1K82
         1XAA==
X-Gm-Message-State: AOJu0YzeqiLJZ8NN0nIJ6yqnzDrHRupkpwn+JZ2w2dL43OjDS/kBlsfZ
	at/taoDT/YpItArbFmb+b4tM0oGCS7zNyhvty0dBC2ApOUeGm7RwFig3lf1Hrm7fQRwJYqHQEaD
	8oudR2nf9GoYGO0DI8lZm1FESPfnvLqdmgurfwXl37GpSBFeyH+W7p4htlMJkcqcOXV+q
X-Gm-Gg: ASbGncuxa3R2MtuCwAxFT4r0sLo33iCOs0rn1CSeDvsWBBKK+tyQjc4OOTdWxi6uP6Q
	6Sfn/uSuH5DYboVjCs/vcePjAgRDZCOLyktWlEHjJFlRbEJaVaYNC1t/P+j2Q9zoJbx/h74gqo+
	DJA+W3aRAnU7mLfQhWKvVO9m+fOSRXMs6/PmrQFdlp3Xf5W4RqyZQ4FKiOcGUrnXBaTZ1sIohHt
	t9Tr6NTXUPkpt8UK3sVMe1pRUzp2ugHwzl5H5WIzZgDhD9N0K5/K0KejIC9StNfqhmGfDDmzEnb
	a6T6uEeBNTam3jpveV4PW50n42VdnSW8ayCjdChovymp0Ppoj87x0iuZaeccvb94KF3r9bgiEsK
	T3oALyEhOPa9wccVkaRDF2Cjo
X-Received: by 2002:ad4:4eee:0:b0:6f5:3b8b:9115 with SMTP id 6a1803df08f44-6f8b085299cmr198057966d6.33.1747652329524;
        Mon, 19 May 2025 03:58:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFZ8hMq2kgsgTEUTk7YggTkRUuA47iDtbotHwLHe0Dgywfs65yOnHSbIBuW35N62G91KOkcXw==
X-Received: by 2002:ad4:4eee:0:b0:6f5:3b8b:9115 with SMTP id 6a1803df08f44-6f8b085299cmr198057586d6.33.1747652329096;
        Mon, 19 May 2025 03:58:49 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e6f314a2sm1801140e87.77.2025.05.19.03.58.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 03:58:48 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Bjorn Andersson <andersson@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v5 00/10] drm/msm: add support for SAR2130P
Date: Mon, 19 May 2025 13:58:34 +0300
Message-Id: <174637445761.1385605.10286310480029078025.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250418-sar2130p-display-v5-0-442c905cb3a4@oss.qualcomm.com>
References: <20250418-sar2130p-display-v5-0-442c905cb3a4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDEwNCBTYWx0ZWRfX8dQNkIpfwXQO
 InE6RhEHVxqENGwaab0SFvzBa6rn0ijjitk8b1FcdXGCUV5Y9GzlhFx9IlR+9691SeuU/7yDhgi
 J62mUgWQbt8wBlpD4UNGYXQ5BgqKKnSfo8td9r2BSL2MwN16ZQc9DtxW5Ik0GBRNzXxCinYg0Ri
 tA+/G3vJS1mn8jXS3Woep9SYHY8hs210DMJcCflwabvCA/48G7BCArNP7oQvEgSDy5quoTsY7iR
 ceC0JTrw9vgSPSHvVuIQzpxEhUBclIRl9O3GPsqcPdlltk++il6Eo4lRJa0xNgwjP3Pvahbo002
 ejHs/O1JSte6ugvMXENJ4g+r2wiGoH4HfmyKHQdO5GWQj6NXi2UXMjg5GpjFOFvsO8SHxga1IIc
 +mDuvG93cofTqsvpAAlbduPZqVknX3K1eGDsdIm/ZPs0U8K1uyP6uk/9M3KN5uz36otxs+Xt
X-Authority-Analysis: v=2.4 cv=Z9XsHGRA c=1 sm=1 tr=0 ts=682b0eea cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=iEGPaXCqe01J9_RIJz0A:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: YcnyJPr8cPGAqVcCn7RL-Ggnp_9auDHl
X-Proofpoint-ORIG-GUID: YcnyJPr8cPGAqVcCn7RL-Ggnp_9auDHl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 mlxlogscore=874 mlxscore=0 priorityscore=1501
 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190104


On Fri, 18 Apr 2025 10:49:55 +0300, Dmitry Baryshkov wrote:
> Add support for the Mobile Display SubSystem (MDSS) device present on
> the Qualcomm SAR2130P platform. The MDSS device is similar to SM8550, it
> features two MIPI DSI controllers, two MIPI DSI PHYs and one DisplayPort
> controller.
> 
> Note, due to the technical limitations DP controller wasn't completely
> evaluated.
> 
> [...]

Applied, thanks!

[01/10] dt-bindings: display/msm: dp-controller: describe SAR2130P
        https://gitlab.freedesktop.org/lumag/msm/-/commit/b341da1172fe
[02/10] dt-bindings: display/msm: dsi-controller-main: describe SAR2130P
        https://gitlab.freedesktop.org/lumag/msm/-/commit/3c70c9d0a99d
[03/10] dt-bindings: display/msm: dsi-phy-7nm: describe SAR2130P
        https://gitlab.freedesktop.org/lumag/msm/-/commit/262650e71854
[04/10] dt-bindings: display/msm: qcom,sc7280-dpu: describe SAR2130P
        https://gitlab.freedesktop.org/lumag/msm/-/commit/759fe7181723
[05/10] dt-bindings: display/msm: Add Qualcomm SAR2130P
        https://gitlab.freedesktop.org/lumag/msm/-/commit/3096209b7a62
[06/10] drm/msm/mdss: add SAR2130P device configuration
        https://gitlab.freedesktop.org/lumag/msm/-/commit/1e7cbfea6624
[07/10] drm/msm/dsi/phy: add configuration for SAR2130P
        https://gitlab.freedesktop.org/lumag/msm/-/commit/8e63b2075e01
[08/10] drm/msm/dpu: add catalog entry for SAR2130P
        https://gitlab.freedesktop.org/lumag/msm/-/commit/178575173472

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

