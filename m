Return-Path: <linux-arm-msm+bounces-73926-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C0A6B7F8B6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 15:49:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1E3327B9EA1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 13:38:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 343CC2FBE0C;
	Wed, 17 Sep 2025 13:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HtRC0glf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96CDF3090EC
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 13:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758116296; cv=none; b=FbRZ/yBp/LBQVG3pVCkghlch0qqPjp/aZBtDf8PtxkutUZVDt48080YKpPeHqEWeQ30Uzp2bcFT4VsSdMjcKQVZkigtrB8o4zJf2N4x+q6Nrd1HBVJnJ3NfhgUnu4ciz2cKFlPSGHz/RkTgimcxJqvJfUw0Gfo6zVGKUvzsz4JA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758116296; c=relaxed/simple;
	bh=9AWqLs/ayntfczwGA7UyGJrTFP6POWFxb5/w/HcMm70=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jmObyZPo6NNTG+vZFxzXSZat23caz0gjTn0Mbwa/KiMtZpcojuXBm3q/yHL2QAqE07QgL1dtxwV/TVDmauDZ35J6Lf8ynHrovXeHFeHuLvqKRoF4zpWsEtlQyfv3dCZcgP5sao/zQjhkXtaKRM6MwaMPKSRog1f0l2H97RkFZRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HtRC0glf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58H8XZoZ021410
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 13:38:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+KFU62nDlSmYNsWvrE+F0DGQ
	RnG1HQg63ixfyZ2aRqM=; b=HtRC0glf7CNFzuwHtsfRwqyDgKhBlUsfksVgpfwo
	4AY3nqZ3sNJCHbd4/9QdZ5KLmArBKURGIsMT53j9fQYEXh5sJ7/FsMMK+jsdJr5m
	cie55z/ysOAmOiIok9+8ShtxBSLEmbhXe7kQm/0e3yp3pYySa60zpeHo4/UMGPfH
	UKh09MpJU0E9gFrGQ2VZhCIXWugpWVxwm20FnM8YbeEos+yPzxspl9VlJIvVcXjw
	SkUaMcCDvZ+thmSG3rP9Pgjm8zQSPBTkKV5EF9dS2NsF4RRY8JmJShR1WeNiBeyA
	tRYFyVkhIN/+6EUvFXUjVoojjIYbm38xREyr6rgSlhDz7Q==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fy5agpj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 13:38:13 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-72023d1be83so197292016d6.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 06:38:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758116292; x=1758721092;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+KFU62nDlSmYNsWvrE+F0DGQRnG1HQg63ixfyZ2aRqM=;
        b=Pqv+u3Jsih4tYBk51EBJbO0eQOi4Lh12iPsbMi4DpjcNq5Bvpykk5jG0Kz4Rlq6Dpu
         Lc/QeBBkuuUNZhNfwz4BdBAUTLX9dhyUwnVkc2sw9b8W9jYBcNtTFuaJEz91rNmb9cWJ
         9tgk/G1WXIGPVTO1EzVACfFGK/zwhaPzKDBvHYep1PvzdbB+3oWuCm9gQYss262pGMlH
         EmaW/Fq9VNUMlL4pOwvjRAadpbhs1Am77Y/NnKoJIZ3uDSOQnkSD/brb+8OLthRlS9mm
         lnX9KuCl5FCCBqNVqLQdNzE1VxJbtwCEBJamz6Lzo9+vS9tMpfmYpbMdfG+L5wA0ssGk
         EsZw==
X-Forwarded-Encrypted: i=1; AJvYcCV1twXzAxr6kea2DbFAktUo8v6WKGXXjwf1I4kUazpnOf71pPJ5dXSrTK4XM4zEWzPCyglC2ZPVF+wPXsrG@vger.kernel.org
X-Gm-Message-State: AOJu0YzFm0I+Ic+nuqUCxYsjoicQISLgv5VnqgCcp99QKYW6m3nUiahi
	x5fIG/1KU22xK9lzetgfO1C5Nc0ycSdmaDW8Huc3XarF5ZjSAApOH68EtWimKd/RVBSkPKhBk22
	x0zyF9Hw87jw1Zkcgq5nC5vCT/y01YaBnADj7cAr9Ci/ji8WEebqqzkTV8mi/7pZKg+sB
X-Gm-Gg: ASbGncuxZY/UQW2CW/MxvMhVFgUsjnIE0QPCcDlRHXNHSPcq4N91V0UcGE8lTXP8YA4
	GneZiGniTRG5NPbmuYb8izlB0ypO4YFcK0F94aVj2zIUf5rWAAS/yLwUixBpOzkn0yw48avCDIv
	qSI8VFpis715k/p6+3s/ROYvVO6LpPF0M5aICCmc/SRUQRMUij+pzDCOpnzWvA3uSjM2z2K9bCu
	kbqcrH1I9rntRzfRSdWRc8DfDi0Nf/sijvUm6/ObDJz/DCCMbzkwHHApW7oX3yWbW0QyAE8FQSr
	KlvcVytt67gRYEPDftmg8+pzDMkgHXi6mNNq/wYA/9qt99eqdIQ0F5gnojFOlt2UMDn5YaV3xun
	i7MN3bd4gUIKnqtU8PS3v/4ppG14wr9KOicPAwxhCnoDk/8x0M97d
X-Received: by 2002:ad4:5be7:0:b0:790:551a:a689 with SMTP id 6a1803df08f44-790551aa6d1mr5920926d6.26.1758116292400;
        Wed, 17 Sep 2025 06:38:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE1nPyxnUe1a4SQooIlckIH9ZJqLc0nczYSng4R3dxSwdKHdCFNkmzXBw6/lVvnS5Wpi8xtJQ==
X-Received: by 2002:ad4:5be7:0:b0:790:551a:a689 with SMTP id 6a1803df08f44-790551aa6d1mr5920226d6.26.1758116291647;
        Wed, 17 Sep 2025 06:38:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5777bf5ec93sm597011e87.23.2025.09.17.06.38.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 06:38:10 -0700 (PDT)
Date: Wed, 17 Sep 2025 16:38:09 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <quic_yongmou@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v6 2/2] arm64: dts: qcom: qcs8300-ride: Enable Display
 Port
Message-ID: <osd5xcw3cdbrutwokggs4y6lg6aqc6ywyl26ujy7wfzi66wssq@5d5sau7xejsq>
References: <20250917-dts_qcs8300-v6-0-5c862aa80f64@oss.qualcomm.com>
 <20250917-dts_qcs8300-v6-2-5c862aa80f64@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250917-dts_qcs8300-v6-2-5c862aa80f64@oss.qualcomm.com>
X-Proofpoint-GUID: sipv_whOj8cLtyeGlVzatfjMh40V6Koy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfXyiq/czfk2JUj
 R87C5aIZohbEftGGCU+rtgsos2vsl8jTX0HIW4bs0+ztR5RHQtvhqeufmY0Bs26+RyvdqNi2akU
 7kALYBY69T63YOFDmuydas4dZiBFNtiA1+7GwW6B+T4W5omv3TYmoVOvjh9UaGM5qp2FYk5ALyy
 r2WJkQ2IJNi2FxdIeuRJdx4qYtiQlXmpNaRjVBRlKa7nLLAGLB8Wy2mVMxY/43YPdFnhG20Lx7x
 3xVxaTz3O/26TTKvW7nk6bWqZYP7z01wv8Xmd4gvueI94+P4dRieE71cxAjy7vXes0/MJU/btcJ
 lIz5R9VGb6i4hmPT5oqRNI30W8wxBqn/Slv9IPaDHvhTHL2//Xu6LqzYtr0et4qMxij75n9fwcI
 vVtFMIER
X-Authority-Analysis: v=2.4 cv=Y+f4sgeN c=1 sm=1 tr=0 ts=68cab9c5 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=ejZKuhsRmfo8bG81SBcA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: sipv_whOj8cLtyeGlVzatfjMh40V6Koy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0
 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509160202

On Wed, Sep 17, 2025 at 02:09:48PM +0800, Yongxing Mou wrote:
> Enable DPTX0 along with their corresponding PHYs for
> qcs8300-ride platform.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 42 +++++++++++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

