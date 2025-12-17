Return-Path: <linux-arm-msm+bounces-85474-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E80F3CC73DE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 12:09:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6182230167BD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 11:09:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 633DB33B6D7;
	Wed, 17 Dec 2025 11:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tn9yA+9S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZxNIx5hi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D71E8313E34
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 11:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765969754; cv=none; b=GAJ3l1++7Xi6X8AIK+proIVYL37GaFD5fuEpnmfSxMIH1ifbCDsphbjxxBQ1dHKstpyrYwLvhnvWiQuCqdy9xxiYbUgjdihSbtrFVBU/9HtJ+OymW157HK/A0+zs2A5S1gHpyWcB2OLPdLQMefOySH4h3lC8EhBrlBPZmyjzkrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765969754; c=relaxed/simple;
	bh=15TdEkCT7qtJiDGt1xjhKiSwruSklgtX1FAslr8eQwg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PB5iDQS2WfFKDAd1loALmJPquAUwkd0orTpD1MQF+cubtDyL4Snv59l6aYhLwvgL3sfu+eAEqYF+bL+Qe4UPtDHSfct2nfaW8txl9Wn1s3LD3iJ4alumVrpKv0XqEa9QO1X8KKKnApWbWXPmTqP3gKgA0KZoz0sWtMQ4WrsOwwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tn9yA+9S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZxNIx5hi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BHAVfof2023770
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 11:09:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+dEKKIW9G23vjnNjqrEWLeoe
	87FbE06YGw9OK2xhv0A=; b=Tn9yA+9SdPQ6gTm11LlSiJGOtXmrXxCsxMHUHIiD
	nWp6zYL9FXdEXtpa7SlSWNX+MwD/vYJQ5CF9llbb9KSze7/+uXIBUWk5nwifn3xv
	47YVvYyp5sxu0LDzcks+g96iL2iiuM9Eapq9LCz+/Bky27fyCo9fBg1qZXMLAlTR
	mLIBy2Zy/MImSbViQqEt6d9/coC/3s/vXDhOW+8mfcqSxLcS+4FpoXFRVQ4K1noJ
	YfVS1QNwZ2WeOYj2RMH/MVx+oFqoJ/+cnnLQBk1OrLYRVzceebEew4Tq1IG0Uapx
	vX5MS1DKrnIsohW5WL6thOyNo+UC8SMKRos6C63GQLLN5w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3j39hsh9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 11:09:11 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ee416413a8so64797061cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 03:09:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765969751; x=1766574551; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+dEKKIW9G23vjnNjqrEWLeoe87FbE06YGw9OK2xhv0A=;
        b=ZxNIx5hipy3fsze4Ou1A+UTf4MvyqLjbqkE+RF5vg2sCpDuqcLq+ikLupYYesnh0ft
         m67xS7YZISKM+YbhqtMkLy0bqEYGaLRoOOSRPM9TdNnaE0CBoYfxJQlp+osOP+MVtQzM
         bOx9gXK3Cl9GtmQFf4iOGjB6JslpxkTcOmaE0TX7VtNzv/ujhnlIEZNl/+w2Rs8hgBvk
         LkIixjJapOjrsqsiVzARB1fBZXlVy+2PV3mUwMuIOSIn7P8ja1fYMAvDRDYMWS0jcFKC
         WDLpUrOuv0RqJ+c2XAavojLFg57h4dSaYTXaPsvcPSSATZbUafR805rOVZRWyTMEqm8h
         iwig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765969751; x=1766574551;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+dEKKIW9G23vjnNjqrEWLeoe87FbE06YGw9OK2xhv0A=;
        b=hSUCRujUQv/JL6w7ZdAT6SH9ss6FgvtCLJmq3MavjvyegddPgItj0/Bxq7noOAhDMk
         6EF24Q0MRJCFlY50bdCrBddoECeZJHCP/5iCZx4rgBoKH9E+w9wwH4yKzMQU4UaTbCHq
         PI7hnYrl134KrL7P1woagR7KtOSb7XCKixoQe5tTLNd6XC41fnKDh0bMf1EY+9KJLFUd
         TXl4a1q9lHcfDF2aylfQeyPj9tbJ1WWhmFpmeUJ4SIaol/UEIh/1CpDujNdxM9QkT61X
         gdNI6ib3iXuRglZIhaTd6XiIduWNdmJkP9xacKrRkI4KttUBo07a81QwnYDNGLFN1IfV
         sAEw==
X-Forwarded-Encrypted: i=1; AJvYcCWwiJBBgNlcEbfLlNKxC5uOBPi0Z0sVNxM0dvJ8bZyujmp8D9LOZi9msTBTPBV7I4CoCyImZlSYf3eq/mL2@vger.kernel.org
X-Gm-Message-State: AOJu0Yztf9+uM8Hb8ax3YlsGlliaRGNe9lqZKW1flcNldkYJ+tqzbSxc
	/SNqHwtI4Q71CkXQBP3XY3pCyeJ0hot5q1lVLgMPlrtOBXrkKj/sUBdFAfrtclu8ci0ADtUSutr
	b3+Fv5gmLqSJyxAupj1dBOI+ysfXQguUo/CsEMMoFGd/OKcNF0Iy2z+FTlBRFsyUlJknZ
X-Gm-Gg: AY/fxX5SUuuSmobhldMP/F+H3vhEjLcSo4An6nM9YJbrGLTzyHVUeZH/ep/2uea0Xyh
	0/ehy29m+5sIWslXoDS70gB3c7TcrtBBQGwCzI5eTIR4PnJ1bD/xBp+07hUxaEzfHncRInU3OZ3
	8E0pCZic6tuCrKL+dGo5kkU5+BHpyX365oTU/+igwspp44v4Og3hDcHJ5qELQjWTOsj+HqDWJ2k
	cbCqE/7vFANlyoeGNrzH5cmO0nUsweZaV9DMBFa2y6fNKf/R863UWsayITOl08TkEGgMzwASP68
	gUu7pTxx51CDlelcCN8Bi4t0k7jNiAhiNnb/TJaAOSnN57vdl9RfsDH9xVO/TST8hs6w4Dxmnkz
	1M+nfDTY9HuJD1L8h3Td7IA==
X-Received: by 2002:ac8:59cf:0:b0:4ee:1e28:acd2 with SMTP id d75a77b69052e-4f1d062af78mr238343391cf.70.1765969750874;
        Wed, 17 Dec 2025 03:09:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHAoFqEr198Q/BxlaSxtCUE0azR5/jmLqEjus/K2g9OOkuqI1d/UlLTXoMsTjQNXOHC7zKw6Q==
X-Received: by 2002:ac8:59cf:0:b0:4ee:1e28:acd2 with SMTP id d75a77b69052e-4f1d062af78mr238342991cf.70.1765969750329;
        Wed, 17 Dec 2025 03:09:10 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7cfa2ea564sm1920050366b.26.2025.12.17.03.09.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 03:09:09 -0800 (PST)
Date: Wed, 17 Dec 2025 13:09:08 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v3 2/4] arm64: dts: qcom: sm8750-mtp: Enable display
Message-ID: <bdofqly4h2eksicntas6uocs3s7b52cuvuvee3su3mmbeb73xf@dofx4w72oqvc>
References: <20251216-sm8750-display-dts-v3-0-3889ace2ff0b@oss.qualcomm.com>
 <20251216-sm8750-display-dts-v3-2-3889ace2ff0b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251216-sm8750-display-dts-v3-2-3889ace2ff0b@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDA4OCBTYWx0ZWRfX0NOvF2woMU3g
 QIkkqc57rDLgPHs6JTp4Rav4TUm42qiswRV/B9nuNspQoQsUZB+G5HpRSFYg5qfwaEZOGPpZMGr
 NoJM24xzDSLTe92upVQcLlj59ysfMFnSXdYzdfc1tQj3AgWkeyk35nlwhX0hkGhSgvkwu+B25cV
 9x7JhGYJpVpz1btETK2EnYXfFCP5LNpGET27aX98jAyqEJ8NtX+UN/NmBHS7CrPGqrdTsMquPWK
 BUQVJ3s79C7kZnRPo1R9e0d6VDdV8JSawFiCqlONPhvSddqvz/rc5zIKVrHDv7eNIc0T2nDnvM+
 8R9vfx/XnbEYCbPGRbLPUKnyN4KhPybxKagnfGkfNoj0q8aLq9bv0B+GLXiNPBVkPufKbE6rhTu
 LC0+Dy33QtL4L5rIf0Rkguerk1ow7A==
X-Proofpoint-ORIG-GUID: ExYRNG-4tLBk-sUO9YCxqsTQag3i-e96
X-Proofpoint-GUID: ExYRNG-4tLBk-sUO9YCxqsTQag3i-e96
X-Authority-Analysis: v=2.4 cv=ToXrRTXh c=1 sm=1 tr=0 ts=69428f57 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=DdBtMnqNxkYIvXj6ev4VzQ==:17
 a=kj9zAlcOel0A:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=drb9gvCtaXarAPuUoGYA:9
 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_01,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015
 spamscore=0 phishscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512170088

On 25-12-16 17:47:32, Krzysztof Kozlowski wrote:
> Enable display on MTP8750 board with Novatek NT37801 panel.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

