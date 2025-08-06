Return-Path: <linux-arm-msm+bounces-67846-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AACF8B1BFCE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 07:09:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A24E77A1813
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 05:07:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF51A1D416E;
	Wed,  6 Aug 2025 05:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="og2ZVOMe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24E661E51F1
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 Aug 2025 05:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754456954; cv=none; b=mbBgA9Ms1ejfy55eAyLuC+4rv/crL7BTe3YCHTZIqq+uRtIXyyIVMMvvmnv/laRU6G1I4ajFUOqgd/jlmBhPx45RGl49lyaAh/WAmL3+0w2m9v/0tOxJKESp0IM++m90Y9fSDffEZa+f5gSSu0vgfsk8M54GhOY8OtGxvKjeQZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754456954; c=relaxed/simple;
	bh=8WJRB9z4af0UImArOa5ALggEuPHFuNJE9SWPyHMiVjA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dEI/oQJ6wz0I2Vxx4vCoSfm2HLt+eTnvIyzz9CMHixpJhVgbcu1ucYX0kJ5PLxEu+W01hI+t0g7h1srJz7Ys7XdWapBLUs9GATme+F0BjbVzkvkUsonwKAShIPixdAnzsNYH1a4aJqjyZn3fPrn3vkU82ScDkDDhSRVnBxj4sIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=og2ZVOMe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5761emw1012612
	for <linux-arm-msm@vger.kernel.org>; Wed, 6 Aug 2025 05:09:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=68sovdrrPXA8QmhrUduSJfVa
	9A4OBtR8N7I8vuIQI5E=; b=og2ZVOMe+cesabO+Jelxst82ERdX0OQCdHzquAe4
	xAMYVlYsx9fTdGKY5c5lACgqhvs9X4fJ5HiYHkBZxM71YIDhHymJ0D6DeoovpG1Q
	JoB7HB2KuIws5dKopH1fNX833/QEMwj+SIIAD2Gtubn48raOfmoz0gfMj3MQB6Ir
	sO4SfyTKq38M7VeKCxvka7E1sWyt7xrzT7J3/GJMxMfgLbz92CI+zNxbXa1C8WTM
	SCQ4iRlcrxbZBADmrxHtYxWxdFuCF6/z//nUqlv39TItIvfuxTnsD565TfAK13UG
	CRJI88EAiq+t0dej+CHktqLiGIFHY/B8nrKKGhGIuFdmJw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpvysgq7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 06 Aug 2025 05:09:12 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b06908ccacso66103301cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Aug 2025 22:09:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754456951; x=1755061751;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=68sovdrrPXA8QmhrUduSJfVa9A4OBtR8N7I8vuIQI5E=;
        b=NER4yzSX30lKPN8a/074BpBDJMU8I3AAPL2q3d+Rsghlz9pU7MBuI1ipkGtbwNafxM
         8fCtZXkAQiUM7q4QvL91Jw9zKeIHzunXqSfhsYQrsX4rfqXk9+JmeHJF8fDbssivVmuh
         yZNt4PFq9ahag1uW3fVuV7QI9z/mqIQOVh2Z8gi2q+wspOSq9ndK/8l7w3eDqTanw4RG
         cEU1mIOPXjXz5XFHwOzoC/O9vNK8Qe46yyrvEYTjNWeKeOV/iYTmwAQp4bGlodrBAjEg
         IwJVizXjxqW6gR3NJVBkCLr62JeEXQV5I7gq2Q+FBZUoY3b6zCxYWRMStYC7+IyXTXuj
         3Khw==
X-Forwarded-Encrypted: i=1; AJvYcCVjpFZJbD4QmHJujULYlPn3jrj4UlBLKvh4kvzPthWitiaT3HoHPE15yKVbHZxrmO5E1PcsMQJQAvp+Cza5@vger.kernel.org
X-Gm-Message-State: AOJu0Ywzd6Fq13AlD7LDPulocaNTKtSp/HUDOUO1Hx7fwC2MpabVVpzs
	vGX1jBZnp77qeXcB0wxkWQcaV/YP3w9pUHcWInXvxBGOKFk/w13GtT/AVQCZPNc0XdIM+Oy53hQ
	nYKV7dLNqqHzFpueblEh0EoNxPx5dC3zIrJcELW5grWjndwLwnDtLJKdfa6/5H1HxlwaI
X-Gm-Gg: ASbGncvxlheU031s21Qtlc7yJVBWSR7Cody0XuMuQ6Kt41dFL1U0lJ9Bd8AAQ8RN8T6
	zoUimpL4UMlMaJXE4AMvddSBoThhEne5fGdMjYp9fi0rlnb4Q2EyGq5Bx8K4ZcEGgkG8AyMp+uy
	ToqOMs2NmXkb3GRaoUen3S3ZtwCj0qN5twAWGCB9mxivFvL3vIgOw1DkqbFCjlFo2gp+8iZHAvU
	41oT/TEDL9AcMMTmKfz1rvuJ5lnuf7VaRxmyaWnm7v1CsPAb/OwgBNPPNOQ5KpmQlFPsQ7Kthut
	yTC+1vG3RM3M4GH1HuqFujsLHnth74so2vX+dJqqUXkNw8aj/HjPUQkz+6dXprnKKCC9QtKiiK3
	PLlVcsy/YZCd9gF6e92+AUjTbD8vX8wDK9oPUl1hKiQvhSCvH5VX1
X-Received: by 2002:a05:622a:1814:b0:4b0:8f9a:857e with SMTP id d75a77b69052e-4b0915e7139mr26390571cf.56.1754456951200;
        Tue, 05 Aug 2025 22:09:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFotMGRHjeIm1vbeYr6C42G1MErJI4kAH19Ib7B+nZARpwmp9NCyvWcD9AMhVLBzKBMuD1ytw==
X-Received: by 2002:a05:622a:1814:b0:4b0:8f9a:857e with SMTP id d75a77b69052e-4b0915e7139mr26390171cf.56.1754456950777;
        Tue, 05 Aug 2025 22:09:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b88c98aabsm2215050e87.103.2025.08.05.22.09.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Aug 2025 22:09:09 -0700 (PDT)
Date: Wed, 6 Aug 2025 08:09:07 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <quic_yongmou@quicinc.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/6] dt-bindings: display/msm: dp-controller: document
 QCS8300 compatible
Message-ID: <b3tgv7zhiix5rzrw4xv5rtaoaikstdew5lo4htvepl4phl44dx@q3xztyk6fagy>
References: <20250806-mdssdt_qcs8300-v6-0-dbc17a8b86af@quicinc.com>
 <20250806-mdssdt_qcs8300-v6-2-dbc17a8b86af@quicinc.com>
 <b24ln55wgmjzksugbowgilxqbnp6d6mgq4cdqljrj4jftuefa5@gjcszc3t4bqg>
 <179982fe-ff3f-4d57-9ac9-15f0512facb3@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179982fe-ff3f-4d57-9ac9-15f0512facb3@quicinc.com>
X-Proofpoint-GUID: B6ogcWafgZXvDr79Aqx_QH32KwUPlkWV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfX41EjwFGrzVKv
 zU7L8bEJARKPZXMXqT/8UDG9OcpTe7TsL6RLbZjpN6D4jDM5mExId4V+wPXDzeYS6tJEwGi89GR
 DiIYbg/x/tsjX6pVR7y8WGY/TqelhyKH4H5700Os4VtcHGYFF5VMJPhVscG6O3qiVgJ6qpwVOIh
 kPuNVAAB3aUoXEfIROfVs5ogVOxvHOPpFiltYGqmJyMNap1huVqi+d2y/n4yhNvUTH+xkDNkQNa
 AD7onpQgoC12Ck9ayqdRv0w8WZBok0Vqr0lP5wDNNFg//BmC/pTDplgYvTtF7oN3BbjXkQbziHk
 EpIuQOzq1y2/PwmoMQgHseDUJrUxyiKeWh3w2CzGvLV/Fvjjvs99ofDCdsf2rSTs2QxHWybcoP0
 QKPCwH1H
X-Proofpoint-ORIG-GUID: B6ogcWafgZXvDr79Aqx_QH32KwUPlkWV
X-Authority-Analysis: v=2.4 cv=NsLRc9dJ c=1 sm=1 tr=0 ts=6892e378 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=sYGqIWXcBYFHAWytNyQA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-05_05,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0 phishscore=0
 adultscore=0 malwarescore=0 spamscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508060009

On Wed, Aug 06, 2025 at 12:07:55PM +0800, Yongxing Mou wrote:
> 
> 
> On 2025/8/6 11:46, Dmitry Baryshkov wrote:
> > On Wed, Aug 06, 2025 at 11:16:46AM +0800, Yongxing Mou wrote:
> > > Add compatible string for the DisplayPort controller found on the
> > > Qualcomm QCS8300 SoC.
> > 
> > 
> > Typical comment: you've missed the explanation, why it can not use
> > fallback.
> > 
> Hi, Dmitry, we move this explanation to DP controller patch (patch 6). There
> we provide a detailed explanation of the DP controller,why we need this
> compatible, and why not use fallback. Thanks.

They are different patches, reviewed by different people. C&P might be
helpful enough.

> > > 
> > > Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> > > ---
> > >   Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 2 ++
> > >   1 file changed, 2 insertions(+)

-- 
With best wishes
Dmitry

