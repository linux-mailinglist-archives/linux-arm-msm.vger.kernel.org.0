Return-Path: <linux-arm-msm+bounces-95149-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qPvmBpvopmlWZgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95149-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 14:56:43 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 785691F0D7D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 14:56:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9CB2030A8F30
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Mar 2026 13:49:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3FD8346A11;
	Tue,  3 Mar 2026 13:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="irsBFP/H";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BlNHARpA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6012E34F494
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Mar 2026 13:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772545750; cv=none; b=Tpp2KyGCf83xsiQho9vj3q4/CGdFQNsioYLBQw7eznrfAZD/IjQKmsUPzAdBdWghQi6C6Uuf9HNDhJSBqIt7OBL1QGutc0r/vnaqPGFCo9lGFTsmtGe/ArqhcxVdf54MffgajJhBSBPfF3i7o/0TGQNLuZ5d+o0akmw6GLGqaAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772545750; c=relaxed/simple;
	bh=Qz0Itfmc725Xjw5kALOulUloOD0i5TyzSalYoaho4pA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TJukOa8wEriSF1fNWKwJX6NVQvJd8izDYwzhlQq56jZnh+/NblGQiUxN/N7f2lTwY0UmuwNMtrJAzECNTEWhB7Nhw0K3PeimBxtFf61WPblQDR+3LKALYxHdIbGv1jJ4GyKxQDGkrtuwdz/3u5mSgleWUMbzgSvs/Ks8wSYdb+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=irsBFP/H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BlNHARpA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6239n87J2630031
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Mar 2026 13:49:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9qTYU08p+T1/fcxXhU5ojAEg
	8g2sM3hAogy14uVclO0=; b=irsBFP/HEFrmEibdtU7XU03+cBf+XO15fNus2Fcb
	Ks7SEXwMWmYCO5nrhIsorkivcrIVQmw8G+QLZ5tie5xr4mEgLj/rvucKjyFLSD7Q
	kuxsbzZMirf3NUy0YVNH6boxb7J3IASf9UOSe9MR2B0xXt2S9iSf1PESnviSUXwD
	zYQm8vl8lz6PReE283y6z73TtbBhwgUe6bvhOs42mFNklry6u/xEpbjRbEk7SW6X
	Bmvpz2Rzv8y7gVyFy1WO8eHYwQzb72gDFdbdufM9zAbHB4CPhm8mk2rQZC+8Wg4e
	sIqbbtlxyiCfzfkf/9gu7B4xGcfrIDroU3EqznvmJV8YSQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnhx5b0km-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 13:49:06 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-899bef1ea49so87667606d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 05:49:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772545745; x=1773150545; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9qTYU08p+T1/fcxXhU5ojAEg8g2sM3hAogy14uVclO0=;
        b=BlNHARpAsyS1uvkZi6bzf5OjL8smLc/cr2BJ+KjC82Kb+uNzuMHjJplRyMR63Qtyx1
         o40AMK9bZe4j0cDAcaYRmZZg7TagH2HEhGLyfuYdmIfW71+Vw2YVWddy1qnc5KPUi1bD
         R830zHfviDY29X85SgZbhGS4iBoEatwxbcpVQupJXSLsxEqR04MelNK7smDYBibE1SLF
         oaBY/XV1W6CWc/rRYkIV13kbiiaKY2RzaQ/1YA15X9KSigv8PUYjMfc9EJ2uoEEGt0I9
         IxQ5LPttWcv+AQ+bGaJpanS5d6zYRMsUs59/VcaQYCkcHgi+4oAoCWtO5TsDjbeZgeOe
         fuTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772545745; x=1773150545;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9qTYU08p+T1/fcxXhU5ojAEg8g2sM3hAogy14uVclO0=;
        b=HBrARvOIys2yE6XXlflLnAku/ZhrenmhWxvEK83I3kh0Kdlmbg9oYiPS9kPbWIcynz
         nc+Hx0Eh2Wrr2pk0c6D14nCwpw9ksXt+oJnmChwoljdFOHesjMY2nDJBfTqVHB8T9YEN
         lqwKYbIFOjq3izk/sxmziyR2wi5nUIZ6mX1kBjb1HPmfxPTe3UVjkz7wTfhcTN48C9Bf
         ogDojqCjFm74HHxlCuSZqhnrAVCUOm26LDRfwKHIeeeqENVB0vnezx6UU7xsE8npHg0g
         1h1FnHjRXgtCOZB/jEsHxPIxc5hIg/LsA7JE7iiihYlhSe43pJFFI6aXZ+cU/XqCUKQ7
         6zig==
X-Forwarded-Encrypted: i=1; AJvYcCU7pyKOYJoAIAAVh5al/bV2lXKcBssm6Ge9Q/lcoUVQQJogK+rDfqaD30gjKKTgpVjiFo6dcZagRVeEga1G@vger.kernel.org
X-Gm-Message-State: AOJu0YynHJLj6c4r9x/zJosO7X/WKEbGj8nKKXDlPk60cx1P8XNBO4Wm
	QppwMac+wt/bA3KlnEQJU8aFrxK7VY84LHD5YJXbiOU76lLHuxS4qpBoDz8oM0fS1fW7LFsTQuz
	7U02UVuWN4j2fivCY7Goqv9ETqfxnuvUc8Q5aUvYzBJRwxr9HR2tsHq16OsHa71RM3rUB
X-Gm-Gg: ATEYQzx7YHi+q14CHDi5H/zd57UX0+xx2TErgo1HqUDF8WcxUO5lrm+9BF8K0ZJom68
	2boCuHneFh3N4lwu7q1llvPSyzJoBmDUC28aaXELay2RgB/28wOu4lxM02Mu4apAVqVQq21HfIC
	yqvLU+279Ti57N5sMb6B6sEYmVoPsqwDgIMq4yw9giC70usTzo2FJtJef+pXV1uCEL/tiwvs3O4
	CxOP96QklUCRWMcVZTlAJyUUfRY7KWKbH/UptsEr4AcFUrpxEZkRt66lDiG55G6/jd7Th8HJRkk
	zSA00Jbv7e0Dl/gIA78tdVaHLzh3QolUAaxdqZRw/3+CZXbs2DXW0888a3HO+sqTgJ5mp47imvY
	FzEiuSabsDBYrmD58uctCct5jVIOuaE2sFOJPZoclvLTFfH003ToCS3TzcKYe/xg7+bjw4RpU/1
	SAMBHBiakX5z3hRSwNcA24b0RGZKPrh1fD0l8=
X-Received: by 2002:a05:620a:1905:b0:8cb:3505:443c with SMTP id af79cd13be357-8cbc8df0658mr2155306585a.44.1772545745299;
        Tue, 03 Mar 2026 05:49:05 -0800 (PST)
X-Received: by 2002:a05:620a:1905:b0:8cb:3505:443c with SMTP id af79cd13be357-8cbc8df0658mr2155301285a.44.1772545744808;
        Tue, 03 Mar 2026 05:49:04 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a123578ad6sm607700e87.57.2026.03.03.05.49.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 05:49:04 -0800 (PST)
Date: Tue, 3 Mar 2026 15:49:02 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 4/8] dt-bindings: display/msm: qcom,sm8650-dpu: Add Eliza
 SoC
Message-ID: <hdwuintcfv4leg534qedh2segu6vn7fhdpl75rddwns3whadvo@n5jaqp6ea3sx>
References: <20260303-drm-display-eliza-v1-0-814121dbb2bf@oss.qualcomm.com>
 <20260303-drm-display-eliza-v1-4-814121dbb2bf@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260303-drm-display-eliza-v1-4-814121dbb2bf@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDEwOSBTYWx0ZWRfX9zUMJiQIlt12
 NGTxeQfKBDpa9d2CAL4daR1uiLugeXSjHwlE5nT1eXtyC33cMO8lGNPVBu6178Q2PyPyBPn0Brr
 4Jofq1qkY9bx9xUT3IgeOlHGYjBW2ZS0Yk30EZYTfWKaqdIbpEQ7Jif043TWjO4oRuDx5T+HHxL
 9lzf7J1EaMHwUKjaOrLtg8+DRSsO5ttVegxyG/gUABE8Eq+TBYL415Z99eTH95b3fEAdlhkbn7L
 kwk9NBLC3YYvqd45A0yTHhSTxFYWtTRbZCg8xeVnd3n4RVcKPeq9+w7FrketdlW90uPC4TqGROW
 EjAS8nrXZPtvbRReyHkSW0uUuv3jVl+juaK2UL+LIEdZ0/nJcFmb0VicjhKSWpjj09hOBxcyucx
 Qe7tjVobujOZSjKsofr+5y1p2w6iHoADDCGsANeULnYryublfmLN+QkAK8ZQzhiaFwXxpuDAMu6
 P1JalxSQoEcQR3F7Xsg==
X-Authority-Analysis: v=2.4 cv=T9CBjvKQ c=1 sm=1 tr=0 ts=69a6e6d2 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=fTnWfZjI5X7wAvt4R4YA:9 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: g5c82EQ8aBu9BYnNYSTbAydZmXRjr4YL
X-Proofpoint-ORIG-GUID: g5c82EQ8aBu9BYnNYSTbAydZmXRjr4YL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603030109
X-Rspamd-Queue-Id: 785691F0D7D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95149-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[27];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,quicinc.com,marek.ca,linaro.org,vger.kernel.org,lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Tue, Mar 03, 2026 at 02:07:54PM +0100, Krzysztof Kozlowski wrote:
> Add DPU (v12.4) for Qualcomm Eliza SoC which has noticeable differences
> against SM8750 (v12.0) of mostly removing blocks:
> 
>  - Removed CTL4-5 blocks,
>  - Removed VIG2-3 and DMA4-5,
>  - Removed LM4-7, DSPP3, PINGPONG4-7, MERGE4-5 and several DSC blocks,
>  - Added HDMI interface.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

