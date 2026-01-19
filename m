Return-Path: <linux-arm-msm+bounces-89730-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B6C2D3B393
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 18:13:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CCFFF30012D0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 17:11:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A93FB31A552;
	Mon, 19 Jan 2026 17:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V2P+ZZEW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eXvEWc6m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D2A02ED87C
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 17:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768842716; cv=none; b=ie1JXqdnomn88UsOtUyqU1kxhpxmGsoM+8GFIdqKvPj4WUDCyKPCPfqBHUvyevEJpYUrIOnjHPWDCssZPQ6tNDLJMTPc6EdqtzLOmUD8empPdnxOXOTtKq2XldtG192aSjtZlWOwj8q1okUATYM5XD8r6js/0lh41JqN1nq/IGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768842716; c=relaxed/simple;
	bh=unOkhLX52NBPGxNvgDtwEFw/sfbgLRxTBkropzZnagA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NDYYKE7i6mPEU3ggg0y5wy9OqdH4eZFQGjtf2Fw4jqGKVUmhtDRIIq8mB7z5MXRUIQJfQraYWlAIahj0QKIMcxYtOm1xekaGcDy3WtSiLYOS0A8CeP3sUy4QGy9PJtFMVInmAgzAgUtMtcOhTYRTZqYV2r95SbiIoNTjb9LKE+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V2P+ZZEW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eXvEWc6m; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60JEoWxr2305875
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 17:11:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=irwoL68O4fGR1dIH9A4O4iYB
	kdmuSqfFvRHCCxkDTZ0=; b=V2P+ZZEWgOy+DBvjpFGpGefndL0bADtPBbmP9imG
	RsznMNnXETBQDtCw39jv9KVQHiN58+sFmuLVLr5gA+aCd5h5WZcT1vfQdej6bO40
	3VtcB1NKg3aS+ZiszoaxO0xhEH8OlLZDR8LaC5GzpqMmcZ6i2hs9+B2XwF8DVlAV
	huELSDJnx1RTdgEnDq+MCssH4sio9Op9xNzXZUf6iokMCiB6sxkuLzZ94owTYHMP
	E7qdX27OI9UHrxpUNyhQC6+YNnVkvRM45wnPVdkqtiIaiOxy8kn5h1muRnzLr1Rw
	aLqVNOoacM4fyekHocMVCkI6QF00F0Bel23cyqZ8Pd5Amg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bspqv8e91-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 17:11:54 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c538971a16so13851985a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 09:11:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768842713; x=1769447513; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=irwoL68O4fGR1dIH9A4O4iYBkdmuSqfFvRHCCxkDTZ0=;
        b=eXvEWc6m8JQbWDTnbZjQbQ1Hm4nI2EggjaqJCkzHGWIzEOETE7cJ3oN4bu1kGmRjH8
         ePa85QAtOjCq1D9Uyxa+BOgb8E2IsN4xfw6QTBI0tXszNo5Oib0m4M2MKyFgo/EYIVID
         kDmYsMFApLUCO07GwLiYkZOgn6EacoJauH4dnFElmE46xpcoI8dR03ZwGiXzUFBzNxTj
         FcPGZ9YBaV6Ftg+/DwsmsNTrjA3tSOaTp4VskRxh2TUiWurryN8vXCI+Z2/eul61+Yol
         TtqaAXHQS6brNJMxkRIEkpIVR84oOeYyHtDYIERNjfQX0DO8bkM2h6IXkTJr8AK2UWGS
         omqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768842713; x=1769447513;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=irwoL68O4fGR1dIH9A4O4iYBkdmuSqfFvRHCCxkDTZ0=;
        b=IfKcx4k1aykqP8AJoZYPABOFJujOHFrUv8ndkYaRUBBAfOLMGZR5Ni8gJ7ogUwd+WJ
         6jZzLCecoYsqPZbB1t385RcJohRcJeEzmrY/jQomtOw/qaDkQ+vjCyGOzSUYKzLr7i3l
         UiqJczFz1DrXxNNcoMKtgOEpdLHkw6UV9lvbhWD4HMr16poEwvz2WNFF/f40ssf0DhSq
         UQ6ZBHC2pQObfvoFM+y+KxAipy0Kmhemcaa9KxlRC9d5AHEIhDGC4l6PtLGOcL7JeA2f
         dcqpwZGyIjt/P/8p5cUySLCy6zKh42qRDZ9JXXf9ItCT+KD3wxjZnYMKlpKJNwqN/anU
         IcHg==
X-Forwarded-Encrypted: i=1; AJvYcCWusKiHGNkDZDA1O/Wu2dd1Y7JbU0pGG+pn0m+XRiY0pZ64/hlPdfmwwH+Saw2SofQM2sJx26dODDBgbiPt@vger.kernel.org
X-Gm-Message-State: AOJu0YxyCw2dVg5cvPLvrUCQ9P4iR8ITt1Wx9moKVuGSiKYyiLuUkR1a
	QMxexm6HSHqawl3lKBiYQlIK1iqX5/oB1hK1AH/462izNgqP/QjPNdzXfFQJ3YpUsUS3aKwAPit
	fB4/nPyQZoZqDBgJf+m7VM3c2ULbxq5ukqAQa/bwjyUgesfUjhxwrODjLxjNpotPKbwW3SjJnGs
	ccyOU=
X-Gm-Gg: AY/fxX58wHqD8rQ9I6whSeSG7uzkxexi9Q1a0WzkXOp9lNWyjgrrbL6ITRuoCfzvheE
	m0sQLnPZwYoUJHz1PMy51baxpfSPUScvIDKQ6o+4pBIXWTy9ZFYgliDcsgEkxNMVE3J9npBA2kG
	tgZ75gVH1+sg8qfwBBa0E4+tJllo22Gx37jMrgei/aRxLCOOYmNAj9FBC/8CHKM+tHfh0PjFSpL
	fO974Jrnkfa3/RA3exFbDGYyymfxsf2jf7ic6Aq2jPuGLafe2n9qP3C03qAPDv6zMvPnuwZahPB
	qeYLrf9oC1Zdg7rdI9ibEj6IFCzaYfVLF8K9Wo53Kmiy7c5ZcXk5M8sFGCmM2vpKh3OYclXWSXk
	E1JwA64ieicaZIzJYWiUAU/4bLQMvcERBzwjcGSKN3JlhWsMGBIX5YM9hGalBN6tGsaeOED16vX
	hK2NyxfpKq7GtEgRp2eYl5sYg=
X-Received: by 2002:a05:620a:f12:b0:8b1:8858:6ead with SMTP id af79cd13be357-8c6a66dae7bmr1540933185a.11.1768842713431;
        Mon, 19 Jan 2026 09:11:53 -0800 (PST)
X-Received: by 2002:a05:620a:f12:b0:8b1:8858:6ead with SMTP id af79cd13be357-8c6a66dae7bmr1540928785a.11.1768842712919;
        Mon, 19 Jan 2026 09:11:52 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59baf3a2aafsm3571548e87.98.2026.01.19.09.11.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 09:11:52 -0800 (PST)
Date: Mon, 19 Jan 2026 19:11:50 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v2 01/10] dt-bindings: net: bluetooth: qualcomm: Fix
 WCN6855 regulator names
Message-ID: <hb4fuvzhpvbzbaliyi4l6iegacwftpf3ujrgm2bxesz3kp4vtl@njlqqq27p4zr>
References: <20260119-topic-wcn6855_pmu_dtbdings-v2-0-6d1c75608bbb@oss.qualcomm.com>
 <20260119-topic-wcn6855_pmu_dtbdings-v2-1-6d1c75608bbb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260119-topic-wcn6855_pmu_dtbdings-v2-1-6d1c75608bbb@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Js78bc4C c=1 sm=1 tr=0 ts=696e65da cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=tR83sbHjcwH_sdxr21kA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: LNl54GXEUjUhlFHq2HREPI87SY2Enb7t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDE0MyBTYWx0ZWRfXxk0T0K5e+cZ5
 CIW3GR+sB4nlVogOp+Jj3EVirO80z/hvtdyUr+ErsSPYbRMFUHTs9N7y1I8Nvd6VfoqOzYXTs5J
 ZCz40NWkvT+O+MCetH5y6rutBKhDpW0/zx4p1ujwljyP32MR4mexbGBdmxrIokswjaiGlxJ6P99
 5QJuZ3/eS4nnmQAG9MtU0tqqZJFfMI0VRO2HmXUDy93GfVldvxD7bEtsB6l2x3kNfz5v7KdpvXb
 gM6gGLGl9ZNXeFJuai+wcBhEBTF90Y7E6v7aKfTvzfHhd7lCsczDuI2mHKXTINdbTE/dLz+myVS
 9XNJZ8e9mX3HfL4+DgdXgSfsG940f5/fbcqjSZqqUJ72j/4uhMLMGbkZ8uDOtjrn0pzc01hbrfL
 CD/5RIgwZuf+k9YDYEN0PnLpNgMVhFRMSXUR5ehQ/ZiS0ERMNgBxRT4hdPPCEuMFz5rtQq1zr7o
 0lXXq64WBPmdN2a+2PQ==
X-Proofpoint-GUID: LNl54GXEUjUhlFHq2HREPI87SY2Enb7t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_04,2026-01-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 adultscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190143

On Mon, Jan 19, 2026 at 12:42:23PM +0100, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Commit 5f4f954bba12 ("dt-bindings: bluetooth: bring the HW description
> closer to reality for wcn6855") changed the vddrfa1p7-supply to 1p8
> for whatever reason.
> 
> The schematics footprint for this chip definitely says 7 on the input
> leg and the driver still expects 1p7. Bring it back.

The datasheet also describes "VDD17_RFA" and "RFA_VDD17" networks, so,
even if it has 1.8V, the net should be named 1p7.


Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


> 
> Fixes: 5f4f954bba12 ("dt-bindings: bluetooth: bring the HW description closer to reality for wcn6855")
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/net/bluetooth/qcom,wcn6855-bt.yaml         | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 

-- 
With best wishes
Dmitry

