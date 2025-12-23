Return-Path: <linux-arm-msm+bounces-86422-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B52E0CDA724
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 21:15:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 336793002FCD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 20:15:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D623E346796;
	Tue, 23 Dec 2025 20:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T0uHMmgc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bxVt/O/f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A2072D6E53
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 20:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766520956; cv=none; b=IfbzHQKjEltBKzIH1KEd7Sy8cPZrLqHrXYbJiG0YXIRVictPSjtpBrV+xrdIIgQqpuNFNMzC4Wwzp+AnN27VejY9rNWkupcLQ7gWi7ETBw3CVpZtBnh2UEyGwj+GuQHW9comrVq9GH6jKP+Rga18i+YNT4gbsFQgxc+1u6u+r00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766520956; c=relaxed/simple;
	bh=HKaXAFN280w772dBVbyjDj9/rLyHfV369fLHNnVHey0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RcvXS74WWpsWFdQQi0XisyTMLQzJ/vl0FrZlN2Sl8RyIRka9zVOW+PKJjvvYhwgyer+TOPjIlL1cCyKczmlB9DIiLz+x9hbdnx3W94+SrWPz0GSFKCfhwRITSCEY/tkRVIkiqwL+Mn7pObHXDpvs3cmr4hIqO8xVgyyirzh9qgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T0uHMmgc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bxVt/O/f; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNFr9jP4134198
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 20:15:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=B26Q6QBnxEEdyF1X89NLCgmm
	ZgY6Dji0pKhEee0lVvg=; b=T0uHMmgcDN5pm3nMpD3kiJUBg2QuNEP/j5RvkeKU
	qg7sB2j3ja8czEpmTgY8iI6ZWlgw3oNyEnDxal3YVWP12llGSNfYDbUdKQ8hwX1f
	h/N1w7AziRNVag2NDGUx7dCavVS1Q1ozOPIzB3V2wOlz4Hkq7xWyXuWz+fjw8eCr
	b5wRHspqxhVcMlL478GYkz/tUt05VNd+C/tyWZshIvAXFXiwu9x3j63hsGo7MJwP
	AvIz2y41wrCC9A+VlhkexkBR4YR/Tom+sdPrqK7hXgEMjsoUQ8B1LllUpfOjHpR3
	YQS7zvwYBV9MsaeV71zt18aQW7FGBIk53r3U/AwBnkxNXA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7x46rsv9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 20:15:54 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8ba026720eeso225055285a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 12:15:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766520953; x=1767125753; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=B26Q6QBnxEEdyF1X89NLCgmmZgY6Dji0pKhEee0lVvg=;
        b=bxVt/O/fFkr8Z8ShGxHsux4hsPNbnkE8i2n6X7VUIsK8053zzU6LiA/UMP2+Aoei+B
         bBS0QdnmwY1jnuVScLugAn25kyX+p75HkjaKAAZ6Fkq9kuZJRW5dKPFNC7x0eeENYfri
         Rgu6DCzB1++Oa0pzoxvRMryhn7PmOaybf6o7hmuBr2PyyZlcmSVHloJplUEVe1l466z/
         /g/dm1yi2bWw3CsZPGsCh1rTo1ii4tSefC/X9X1dpP6UmndHJnjKLOa7NdzTSuk0QlyH
         2jCiKIUHAipxbqIdTIrb5zzSY+ZlaxZ72BsgmS9jXcccbTGR118Dri2VN31AbI7E708F
         lwVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766520953; x=1767125753;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B26Q6QBnxEEdyF1X89NLCgmmZgY6Dji0pKhEee0lVvg=;
        b=QAQ8u6zNjZz/jDFifBuE6IoSVnT7hdi+MQupJ24ZYQNsf2tNXn+DA1MXnMj+ahs4C6
         CLWW0hV3uStjmsmMLbIiWe/t5hFxs3epedbyWDLFRduF/vRan0y3WK9cDe8MivSuwYz1
         xTFdsGSyv88dpPtcUR6XjDd/hUY23foNTv9CAMLEWdOvM2XOYHYEOLij70doMRkujY1f
         jx+3k5RBvmnKfxTKydiKya9XaMhxMoCYhO8qXRrmxBo6CAjLsFldsjBi45yV/6NHxXhn
         LMsqNWhOmjQNFWamCN7OAfxVo+t2GxlY3T+LHZOczWMqn7V+LKiDna9wjIZlT0iB22Q/
         G4+g==
X-Forwarded-Encrypted: i=1; AJvYcCWsd79FFZ5ECUAhRXYEwSOWp6gJC5ALqJYedVo+XlG68026F68Nm4xVFTyAIUedfKoMvgLeztLMdgzhM00j@vger.kernel.org
X-Gm-Message-State: AOJu0Yy28ODamzE73L1CxFstqagy7gmpbEbCSmc7S+6cslw4u56NvaCn
	cW6BgUdkjDkKToDHHbrIpihfgJp/if94h6/hZNJ4NTFSt6vbiA+HbiadudDBLHdl/qKkuP0uk+a
	mtJiV0gLD8IJ6OlEM519uETWknwGUR/+M7zMKKYAno6ifBwHli316Do9XeFEWAiJtMiOY
X-Gm-Gg: AY/fxX5PCYlJ2TX4cObqi1YZyeZ8yC2XWAosMd6k0ORscrYJlmzljYSWQofRw2h2Tsi
	en21HGdOgw9UzhgwiiajR2a8SV0Z7jLk/UQws3wrPqsNmyikX1EKIQq0FPrmIyacgYibL3twVv+
	gu9QNbIr/dSkaz+24RjnGEmwEm1N8RgTaaavebLFwOgmfRAjBtEIXGQNYJa72f790BW+Kn2/ofZ
	lxjASRyeHWA+z17nngWZAfkqsa19v0ZLUXLTnXBJvATBJkwxKO76sWsNFArKV2Hh3chy+O0kZCL
	38VXIEhlbqjvRSwEO/HzeAKg8sT5AyW8aY1RrxiP8ew5BdAyxzx0o3C1VtG/OEW7jQj10G+oa5f
	JCbLewSWqcnRwlo468rxk8F4/RVIKO3zDouNLoGRPxwo08V9rCd2TChWyXjlyA4m5NTwbwsqD/m
	Fohgbhm3mqtUMXV9JtSCup+pU=
X-Received: by 2002:a05:622a:610:b0:4ee:225d:ebc9 with SMTP id d75a77b69052e-4f4abcd29bbmr252266211cf.12.1766520953406;
        Tue, 23 Dec 2025 12:15:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFESlK8cUqg2pI93rCBRIT7LmshsGgU8RgzlyuuevZA6TzkJN6XZ4woOf0VjLdPqu2JiIaYmg==
X-Received: by 2002:a05:622a:610:b0:4ee:225d:ebc9 with SMTP id d75a77b69052e-4f4abcd29bbmr252265601cf.12.1766520952829;
        Tue, 23 Dec 2025 12:15:52 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a18618d85sm4243398e87.48.2025.12.23.12.15.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 12:15:52 -0800 (PST)
Date: Tue, 23 Dec 2025 22:15:49 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 5/5] remoteproc: qcom_q6v5_pas: Add SoCCP node on
 Kaanapali
Message-ID: <voeleeu4tb7pnef4tag2e32n6vgwecglo2xobfn2qogkpv4tf2@ycn7ucnsqu23>
References: <20251223-knp-remoteproc-v3-0-5b09885c55a5@oss.qualcomm.com>
 <20251223-knp-remoteproc-v3-5-5b09885c55a5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251223-knp-remoteproc-v3-5-5b09885c55a5@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: ig2lqCYc7XSvhpE74eG-TK38iRdq6Q-b
X-Proofpoint-GUID: ig2lqCYc7XSvhpE74eG-TK38iRdq6Q-b
X-Authority-Analysis: v=2.4 cv=aOf9aL9m c=1 sm=1 tr=0 ts=694af87a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=6tj9FcT98Ui8goLqYs8A:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDE2OSBTYWx0ZWRfXxiYxElSn5mlE
 VuT3kW6PfEC4X+5MTKUwL/FqSYO3BquL27IU1/sGuDPOKR3+5XYVE0xNToep+nLV4E5Gn56OZtv
 lX3P6j479cpYrBFGgRFUEnIAtNR7r6hynqVf6Wypm93N4DSoZVGrG/780rKdC1SIzS/alF/8rTJ
 qtgMQjF8weoXgEk6l/0jWw/0Ic4Kco/WxROkJ8Im8t/JqkeRbbW5nqsX80OpZnsZJzwhWnuN+IP
 J60Sem96ckJ4P1h6ertwEbo9xBciyl62j+xmWJ8MHeZ1ZlK4NJS0ltQghXfg38JvbmJBnlz1aeZ
 myPsIHvGOr/1FYQNClzQ0BcMYgJRmJb6ut9e+vc7cEPFFNMK9FoVGLcKomLZv57YEpmHGXlnHGy
 8yo1nvbZori+4DTuO71GZK6TPBJ6/C/Hs+uFFff7/sBuzkuhZYee7ZPnadY2S104uW8GoKFjSvT
 twfNgR3w6k/4m5X3wCA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_04,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512230169

On Tue, Dec 23, 2025 at 01:13:51AM -0800, Jingyi Wang wrote:
> The SoC Control Processor (SoCCP) is small RISC-V MCU that controls
> USB Type-C, battery charging and various other functions on Qualcomm SoCs.
> It provides a solution for control-plane processing, reducing per-subsystem
> microcontroller reinvention. Add support for SoCCP PAS loader on Kaanapali
> platform.
> 
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  drivers/remoteproc/qcom_q6v5_pas.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

