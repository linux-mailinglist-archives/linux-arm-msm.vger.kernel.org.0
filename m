Return-Path: <linux-arm-msm+bounces-59220-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF85AC22FC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 14:49:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9119EA25F95
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 12:49:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E24FE552;
	Fri, 23 May 2025 12:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k+kiSQET"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D0A326ADD
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 12:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748004572; cv=none; b=kJ44BQwbFDBXHqTBGGi/QPJbHYU/HCq7Ue9ZN0sp8cqBTyBTJ9mMPR+wn3KnhhQvvGBP5C51xd89Egw7dyVMCS+xDD0fcXZcPOwu61SO4+Pg19HeglKDMj9fs4k9MY4FYWysu14DmCKSdeIbp9Co81dr8nEM45bd53iFDWgK07Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748004572; c=relaxed/simple;
	bh=kgFxOOp1Kvo22UysdNlp5gMubOZ8ViIW1KGQp4hqvrM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WbLAkuQaSpqoBZcjTTXIYA3K22IgH9Yoac7JbdXPQqktR93UNN9KdsyEOYuv4O832+Mz/WOVadgIn3Y0akFxe+EOyz609zGz1aYDa1BIIK5gXKj+6S/a/pVadFpE6aQ1JZviHlYs+D1pAPCexAH3wNFsIfp9qDZB6lKdZTKL3Fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k+kiSQET; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54NCADMU024810
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 12:49:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kgFxOOp1Kvo22UysdNlp5gMubOZ8ViIW1KGQp4hqvrM=; b=k+kiSQETgwbIszXQ
	P2yUuAEOPMW3pX6aNqjRdMmSkaEAgD9p/AKj3CcpuMgpoYKJTCJCq1+yZ7axe+wG
	I4hCyEv5INYqcMFk/iOTunNDFH+kvNEU8qe1v202nO89BssvvuLtHonzOrtaup94
	j9lV01CZUTzTr5GJYjP2C0+5bnHYgcZRsOrKGsgj2bFcSJ7iDgYo89VNorIoRSiO
	V2rZgV2pPxCftZrp2o9AmJHEX4bipk2xIGfrjqUpFfUIiS7303okXLGxya4PQb1D
	sDBUREeBhFMwVzY8yLBWBZbu6DxFvRt6Rkh2Sq3hJYIChPqPU+hT54YxCGEH4hUH
	psSrkw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf51xy9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 12:49:29 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-48cc1907229so191574501cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 05:49:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748004569; x=1748609369;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kgFxOOp1Kvo22UysdNlp5gMubOZ8ViIW1KGQp4hqvrM=;
        b=G6c69tP9eManD+uIK2T5qC8/d1VKNkc+hjB1aWyfhDM9u3+x7/t/52wk8gkq7mVIc/
         ilt7cdSSNwmrbLYAAeNt2t5sOX83M+9H5CBNrZXAwKpVIiHl5yGueE5ozXV2K9WquE2u
         BkJPrWFE0ybZdEXj/CaswcHbTjmJjE5Zrl6FJ9k33dYb8wXBI8pWX5VHCbiyLnXXScQ2
         VeT3YnGwO+AiZoFG6rUw+jLki5/rr4NzmVmRhPNNXOrEaY/PedZCLCXm16PSZm+JN3Hf
         sfF/PzBprqmy5t5MKuM9M/7YMe2bMmiu5ZDbmDhv2Oat/wsZOMiyCPAkABz1YDWxZkrM
         ex6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVR+9INmqy+8DNrHPFQGwlWIj/NQusVjgwsgelCeSw2xJccJVGltDC/NcNXHwzkyHypVTDNfTAFe92ABwtW@vger.kernel.org
X-Gm-Message-State: AOJu0YyUun2L65lQtB8/NaBxl+U7aFpop7K8ILZXD6fXLB2nn8k1fDOr
	5jvB0sOgE5FirdErfASoLeKyslcWg1ZxO+Pkoc5Yom6ZCS3bew44fIzacNMxQ74WSHOLb7G/Sl2
	5lxPrQiaI4LpXlqlAIg7lEs4f750NW+TxyOOEezqPO7qUaQ6kdNa2M5gkxp0lNyFhv2iZg6PH3e
	HqYMgHhWrskv4lyt3nZNAPhAQAT6YTMWva4w1AKCWin/8=
X-Gm-Gg: ASbGncsbI+1bGPqqdKOlI6fK1I65H5Vu4yUTf8przN1p3Ux3cs8yku/CLr5Wo3xHJcn
	Bqqc/EALWmt1U94N4RNl6V4eMUUzH1dpYbLXSJdl9UFYgCo/awpdSPaTqPaJmubEl8n0sbw==
X-Received: by 2002:a05:622a:4a17:b0:477:e78:5a14 with SMTP id d75a77b69052e-49e1dc36fddmr40528661cf.3.1748004567755;
        Fri, 23 May 2025 05:49:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFOYfVGlPcg0kq1o0aMk0VZhsCjk7+njJSLhAj6B+WSC6XoeTnWcKWXbqKcZwH95XyV+O8GF6ttYKZgbiRb4jU=
X-Received: by 2002:a05:622a:4a17:b0:477:e78:5a14 with SMTP id
 d75a77b69052e-49e1dc36fddmr40528331cf.3.1748004567438; Fri, 23 May 2025
 05:49:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250318205043.1043148-1-caleb.connolly@linaro.org>
In-Reply-To: <20250318205043.1043148-1-caleb.connolly@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 23 May 2025 14:49:15 +0200
X-Gm-Features: AX0GCFueYDukQWzrF388GReybur_0Qe2ipD7caCEPE6ktOPoIjHKF-T_UP6Rh2Q
Message-ID: <CAFEp6-3cF+Fj_f7+PqmPVy1oz0OHkpRMPQsKUTf2rhDRZrEwRg@mail.gmail.com>
Subject: Re: [PATCH] ath10k: snoc: fix unbalanced IRQ enable in crash recovery
To: Caleb Connolly <caleb.connolly@linaro.org>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: Johannes Berg <johannes@sipsolutions.net>, Kalle Valo <kvalo@kernel.org>,
        Rakesh Pillai <quic_pillair@quicinc.com>,
        Surabhi Vishnoi <quic_svishnoi@quicinc.com>,
        phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        ath10k@lists.infradead.org, linux-wireless@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: fmCFGarPNDSVWm1P-UnPWTTl15kULL5o
X-Proofpoint-ORIG-GUID: fmCFGarPNDSVWm1P-UnPWTTl15kULL5o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIzMDExMyBTYWx0ZWRfX/pipNtlLNL0w
 8FcTSxzXpPWrRYS9lLxv9AiO3Dk68/jlcvfYsSwTTf6cYkvyT37GoDWwMeFxuMBNw6RxW0eestM
 NtltKGk9yAfu/3mbA+3F+lL4IKfe+nVK8mUf6DIALgJ/OSpq8MbJZRhlyNqolta1YpPRhKDI+k/
 YVsmnH9JukHm37wT7Mcr8gROnnz4iPJUV+aJ/zM3slRlaZTWYc9q2Z21LIkK1CUO53qxWv40qT8
 +n7s8cppZiUmY8C/8QIMQkzy5cuJI2naJR5DUI9COxJ8nKvsjaGWJS1gvRKqGAGDcD3FmsXFcZV
 dq8cQxkheSNLn4RgAbJjD9h4w+g6pFansTF2HJ8ihZk36bpdjrb9njuEauSckfh0efYkMKfMUSA
 9lHHsfL4MeFxNABRFyVuhSQ64GXRGabG2boKFb48TbziHHC8fewjHyGVYOdUpBMmrVJsrKaI
X-Authority-Analysis: v=2.4 cv=R7UDGcRX c=1 sm=1 tr=0 ts=68306ed9 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=CibMM-rouZFaIluxMbMA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_03,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 mlxlogscore=551 priorityscore=1501 spamscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 mlxscore=0
 impostorscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505230113

On Tue, Mar 18, 2025 at 8:50=E2=80=AFPM Caleb Connolly
<caleb.connolly@linaro.org> wrote:
>
> In ath10k_snoc_hif_stop() we skip disabling the IRQs in the crash
> recovery flow, but we still unconditionally call enable again in
> ath10k_snoc_hif_start().
>
> We can't check the ATH10K_FLAG_CRASH_FLUSH bit since it is cleared
> before hif_start() is called, so instead check the
> ATH10K_SNOC_FLAG_RECOVERY flag and skip enabling the IRQs during crash
> recovery.
>
> This fixes unbalanced IRQ enable splats that happen after recovering from
> a crash.
>
> Fixes: 0e622f67e041 ("ath10k: add support for WCN3990 firmware crash reco=
very")
> Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>

Tested-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

