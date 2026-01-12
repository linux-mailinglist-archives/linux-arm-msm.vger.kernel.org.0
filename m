Return-Path: <linux-arm-msm+bounces-88536-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 30510D12209
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 12:02:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E59003035047
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 11:02:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9823C35502A;
	Mon, 12 Jan 2026 11:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dK5wC/Hy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MGpUMcf4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1707223ABAA
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 11:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768215754; cv=none; b=JErEOPb44412hsQ6dg2ORXrDD4nKxKlDoRuWyOaW23eQOInP78o171ZkMtIGPuKY4W5tnR9Sau0Mfo9UyX+MozO0THbwrRI6DDdWWWqh14NyoTjnjdCprTFTVE3kKEAzMLcImB1/ks76ewKmJuAQXhOKXwcaCqVdliBvleiCO1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768215754; c=relaxed/simple;
	bh=4MXLd1zoDPiz+3pUSavofyIGkstIv7K7Nj71IsCh/BA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ht59BbWQ49p73I8IeTwmxEbg9wLr/3LX22OILyyACHOSe4OkBdxd2OOcBzJ1MY3XIfv3O0Hkd1aJNqt1Ib2nlc6bOF8OqsuC3l+/hVtPl04/Z40ckbOW+bAqlBW2ReB8syCVrviNxj0Bv5uXZTlMZFTJgj4qxpHkWL/qSUgbXRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dK5wC/Hy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MGpUMcf4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60C838ub2828652
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 11:02:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hgr3rwX6phE1sKitQ5f8gbi3SGsrDPRP11Bp1zyGzhI=; b=dK5wC/Hy7eENKsMi
	yenfvHx2CpdMwHRLCf28CJSwSn8sUDCWIbQHtyE27k82cfXmZhfMTm4UKYFBEPKE
	UWhYHO89l07edcgiiMhUYFIJNmWjDfnbiJ7SA/cDTm2939VR/4HFxPTGuzqlG9qb
	zeHbPAn2VoAVFtWVPiBF9IcVsEWmNE4cTBRbny+1nmj9V792aP9jrUsN309FJJob
	L30nlXaU4EzHDy+BjLKwXJi2KztFIP69cvJUvX/EFjdiuMYArbRggvXalvcdw2dM
	dGNbktdTC++M7oSvLPR8rbAKvJ7DJpHPW9d2tyKqKofQXSLTMqNBS8YRZMVr+YzT
	uM/qZg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bmkk41vqf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 11:02:30 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ee05927183so11581151cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 03:02:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768215750; x=1768820550; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hgr3rwX6phE1sKitQ5f8gbi3SGsrDPRP11Bp1zyGzhI=;
        b=MGpUMcf4/+eP/hqO+Mf9KAplWu4cokzgx//agWiN5VH/jyQlIp78b1KkAtgwCITxpf
         1WFwOrv0TweS+hheu+YzDeT5XMDHrHdAYbhZKjsLTC4nPbQxGn5PxLLmYlPf1pJfodo3
         FRphIn/br0aOWxIx9UAIs49+75A/NJmREb92vXIzb2u4xaJL3aGuiL2TkEsIIcvGAF3E
         YGVqoS6ocEauW8v8yNJEUeUsLZyRy8f2p6jV8TwyaQtJDj/otzB1MLfZdQwxOstPbCHx
         wYD9HjXStmC5j33RaN9Ydt1mXSnbOyKhSGMAYbsORtz1jqEbOd95Uh21nNlbqnxlu8jT
         WQNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768215750; x=1768820550;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hgr3rwX6phE1sKitQ5f8gbi3SGsrDPRP11Bp1zyGzhI=;
        b=kp+4rn1OXOD6nPLi1yVoreSWw1fguPFgzkqpJWsTIZobreeBcew88N2pvUtr9T2caI
         XdrcqbZXXbQTScnoTB9ukIzlaQ6/TsRJkcAefVKaLiNA3dm5251lE56j1ld8zETj6r/m
         9mYtxpPyKy5+TuGdkSoAG6ysFSepXJJNrJkI1gOzIfiIaTr1CGnZxkey1Gj032EO76bg
         7ZbeWMG6mIepi3/85NrajQKrOSc40518n8O+M5swQUWL9jVSvu0DaqoCPT73U7AX7dLw
         Pvr6CgDxh4ii/cfVKEXyNVQtJKHT/d+t9g7vofY0jcIY2Mzt6t5sZWr0CwUqNe11lhlG
         Uf7Q==
X-Gm-Message-State: AOJu0YysaYamd3PDbSPqhszp6pFr14OS9pL0wPfppLUiQjZ29sOjeg8r
	z/z4IGzlNhVgHJE3q0gZYNPkhMJuSzt/QuBUgK3h6sOQebdcSRqHmVIIa2Ny3TK9H4qBGT8r8ZE
	frcvoQC4brL8PiOzM/tC2RSTX2kBB4oQ4GR+zHtfNs4k+qzInSeivZOUNgi77JnQcsJgb
X-Gm-Gg: AY/fxX7QoTusHgDMLU/Ez2NCcMvwUUYcWhrdp8KdFwMZvna//Z5qZ/l/P/7kach7IkL
	bAZtHfR4oCaSEQTnYzc/y+Iv9CYFL0xAJcyugNMmfvMQ2boBwwwxwaCnxPbhQRK2FJpDSSO2HHj
	IiT193MvJeoKX2r5IVJZ1YKSdQtkeKzadyAXPYtKtRrKPSPrIZWcqOQZ6Oa4dLhoCvNHlxuc2g1
	tJq/mBIn01veydEKAyBiqMPdDOTO0GF1TT2xAJnibevL3K0UCyw0RNiyBx1FvSZONN9mNfjouNL
	16ZKA0dqTvsRchfogV5z9ROGbWnvHzptBqxud6uaoF2lzHftYD2fy4j2nVkq7vTieD3PqLachRk
	IbvFzVxGooJFXsqXHfVlwAeFzDw6joh87TcaIKIvonAtkVh4nFM9rSywOR4O/82s716g=
X-Received: by 2002:a05:622a:408:b0:4ed:6862:cdd0 with SMTP id d75a77b69052e-4ffb4a68dc7mr189484401cf.10.1768215750278;
        Mon, 12 Jan 2026 03:02:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFmAI9yXYwAAD0iHcKhXVU23FUkawySDiFTgiByQEI1XgGg3bSuLF37l4LbUipeTxEIuhvlQQ==
X-Received: by 2002:a05:622a:408:b0:4ed:6862:cdd0 with SMTP id d75a77b69052e-4ffb4a68dc7mr189483721cf.10.1768215749607;
        Mon, 12 Jan 2026 03:02:29 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507be65197sm17398854a12.19.2026.01.12.03.02.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jan 2026 03:02:28 -0800 (PST)
Message-ID: <3ef982f8-0f0b-4775-b701-d45ac2c05728@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 12:02:25 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/11] media: iris: don't specify highest_bank_bit in the
 source code
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org
References: <20260110-iris-ubwc-v1-0-dd70494dcd7b@oss.qualcomm.com>
 <20260110-iris-ubwc-v1-5-dd70494dcd7b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260110-iris-ubwc-v1-5-dd70494dcd7b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: dnUgVOjBMcHyZMg7k7-bADUgAsc8cSTz
X-Proofpoint-ORIG-GUID: dnUgVOjBMcHyZMg7k7-bADUgAsc8cSTz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA4NyBTYWx0ZWRfX41rzK8ecs5E6
 kSZ7Limd2gOL6Z5XqhIzjMq+a/QtdNNZoVMyK7cL5Og55bNZpp8AcqAxotP0S0LQPjxtrxUevNY
 bjhsD/s/8Aktln2mug/uBTkTJRnT4Y+3ON91JeTkMefp2ShLr7WyqzuQb5DKo2gJNrFX4kNzW+w
 UO841foFUBBvhrpQ0rYntWftRdXXGyKo9oanNZVSsaS8nQoIfE/7tCL7ZTy8soAtFyUmPT9Gf1j
 Z1Gh+yPs4i1vc7UTo1cJFXnRimzFqRA3eeIQyGlTaMIKILoh1aZ8XjCAhz0yleL/Rauzirb9Ze8
 9qEzrGoGqwJ2LlEGEISqidK0NpOAOtANVkWqB0x5tLi/fj+MGDSdReFf7JDYSxrmZwMYhppugJD
 1BTVsH9I8KXrXm+WdfsM7cz+B8zCPRrfC1Akv0V7xBZqTcctlhvZwMBo9bs6PZuYuE+bVq4jxHA
 gLn33Nw7If3B806U/mw==
X-Authority-Analysis: v=2.4 cv=cs2WUl4i c=1 sm=1 tr=0 ts=6964d4c6 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=ss-qTuU1ZYQsC6pQTdcA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120087

On 1/10/26 8:37 PM, Dmitry Baryshkov wrote:
> The highest_bank_bit param is specified both in the Iris driver and in
> the platform UBWC config. Use the platform UBWC configuration instead of
> specifying it directly in the source.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


