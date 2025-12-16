Return-Path: <linux-arm-msm+bounces-85341-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 64527CC2E41
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 13:46:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5692331E8949
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 12:22:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53466364036;
	Tue, 16 Dec 2025 12:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FeyrEbN6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HmWuO0h2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B64F536403D
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 12:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765887774; cv=none; b=p0JqMioo458dUdPDVqLSaO2z51IO+kWex0b5/CyZhyFW2plaPyELKivT+BFLcX4J1a6x2m5Pux9YFtMvF6Q9GM+5CI+fH2wqQawmE2vTSJNKLu9D/IkSxhhieRynJ9SVZchgGOuR/KKY/pjaljYGWm7xzFOKsCmLLpqVIE/VbmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765887774; c=relaxed/simple;
	bh=TcMpiITToXXJPBtxAEXzztvQ+nxu7VdNZH7YJzSdw58=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IP/xg0+snwz0CBA1/ZdO/od9Sv3/c+uo1erB3Nq/Al+rJsI9x/edJLGQQsqKXJ4CAYPZrHOr2Q86I/eHtzVnPkdUwr+IyPmWbNrZCunaMTpbhryn/VeHoWs2Lc5YPGQVVyhzKurzqOYx52WZVSK/9qKEanyintHlRCli5bYBjng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FeyrEbN6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HmWuO0h2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BG9bhgm2516362
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 12:22:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aMHtI/PVMGmr3+qOBljXqmu13wm8WvV0AVBx5b1CeBY=; b=FeyrEbN6zn4d7YZm
	WcG6QEWgtvaCjR49tdE1ABh9ziZo5OUx8vAo/PtaBNP91nSRzJxM8aGvruF3hdnW
	fDjnP+EvuX8BD+2R5YAtV56x1d4XNqy0JAF2zFhHFQKuwLnJzDfQ3KO5TMPAnrfW
	iKFPfxwqithxkGsN8k3oOfF+S7jPMlsPRg9eTI1ixVO4sTiz9TuYemLXA1BWP7Ga
	2OILCqvRnKb2dClSL6lzt6kZbVRoW12o9GlsoqrVN6b1l/RyrNsa5AsL74nt0NyZ
	Z8GmEEuvto97RH4lisxgLhL7qHmWaMwFvKAbvQd8EoVViAxzt+jWYlHr8RI2sYAy
	viZhNw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b34y80mag-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 12:22:51 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4edaa289e0dso18208831cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 04:22:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765887771; x=1766492571; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aMHtI/PVMGmr3+qOBljXqmu13wm8WvV0AVBx5b1CeBY=;
        b=HmWuO0h2w/FkpY/HOUaytULkN4hpXVleHawU/925XMoNIkUa7BaLjcu9ZtlG5aJW1I
         GuMSTaLeSAeBMHUcqAgw55l7mmMAN5sc7M0vAByIoPBZxeTTVfh+Hxoex/gUm74HqVXR
         Hd9m/KNhl1A+ep/9/ee4RpvttAB/y3DscZB4qcPzlVG05z4Udif8gINoGE77zPOu6Cbm
         VgOt6WtD82A9Bh2GmOFF7yUeFnNvSjZN+21YFsWaFqo2PQE7KU8ZejDC0gLZGZq93yv1
         dlmXIYRvwIRHM7cf0PfbRDQ02C7Fm1mvxv63X2ur0V4xB15i4jMYXNG3msu+dVRduchg
         KjKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765887771; x=1766492571;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aMHtI/PVMGmr3+qOBljXqmu13wm8WvV0AVBx5b1CeBY=;
        b=RZJGoDjGAtwY/TmQW338HmurXsrpi3j3SZhrN7eU98ffOKex1ZdyisszWv26oeakgY
         u81gIcWNdZM4daTJYJW5d8ja9SeCcCWd0Vr4gNooeKHQPNlqBJ0mBl3YMNjm3nhYpGgf
         Cp2cIhXVp/TCNvshm2w8KCAr0d8lIkNXES71ITx81+9T+dziCQccNOe/o65JEAaLUZ91
         +Pe1u0nc92F9ZN4Q9DVy64sS9WdeM7U6Ook/AEBlmZq4QHZFbSfhnKVdIGw9rTNvrto7
         d18A8ZVSq9jJ8dKc9rKXRQRAB4scN7IMzhsk6kJd1MW6e4OX8TvQH5pK1x+ChTW9Z+37
         KdBw==
X-Gm-Message-State: AOJu0YyRK1N0yNQgxWUgAl1+febIeXKYjKauDUXW4EWEtJTvn2n+K2Jy
	/Gor/eqva2s9xmFmVL3QSIc7aa6QM7YUCIZHTYxvYO5swe1621utA62RK0dvhfpnrgWG1llpAls
	dj9AtGAXDtpS4dhHPkXBlIsCCDbSdksiliO5PL3Al3sSaRZng+a37qF+bPZGGlNWJMCFn
X-Gm-Gg: AY/fxX6ODb8/5PxxtchM9nVzmeUnnpV37kt8gS1ACqnvlHylxKxCEPf5i1yaDUVzkvQ
	AA5nazGUKdkkDdo3r+QdaeH5i3ASVGviq/lcEZVNXw13/F4QPohxW4GPPPVStXYjYGxB86pmQYI
	Y+39nLt+X/onBkl4K+ITC2638aQPxkVtpGmb2TCVrlcc2b0CUaAqudSfBe+6FNXWyDS1MqERGsg
	FLtVkxWfSIpFL8Lq0SXBm5LBrOX8i5enLTm3bEBJXqWwyCMe1aCiOnnSgro9f5WJMqf1Vw/Y11i
	4sGJCs0NJbkm8u6ORZFUWQt3REiXA/5te9Cj7Cpu3sjK4lGWsBsSAUn5qZ2cLznS9YqSpAgQf3p
	P5l/tfZvJ6dHCsHshG2/9cCWXNvjO6PKeMZwc0LVtE3XN1yrrmiv+1JBx7JYsMwzOcA==
X-Received: by 2002:ac8:7d13:0:b0:4f1:be94:a2a8 with SMTP id d75a77b69052e-4f1d016f9e8mr134728201cf.0.1765887770901;
        Tue, 16 Dec 2025 04:22:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGO32ZuD9qh2kg30UIDTlpIuFZrAqWeozHmeNB6fHUfkDSEVhrHC+LeEgZZjlPFn9KNPJVkMQ==
X-Received: by 2002:ac8:7d13:0:b0:4f1:be94:a2a8 with SMTP id d75a77b69052e-4f1d016f9e8mr134727961cf.0.1765887770473;
        Tue, 16 Dec 2025 04:22:50 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7cfa5192a2sm1623060066b.36.2025.12.16.04.22.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Dec 2025 04:22:49 -0800 (PST)
Message-ID: <64995765-485b-42c8-9fef-78d9df899143@oss.qualcomm.com>
Date: Tue, 16 Dec 2025 13:22:46 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/mdp5: drop support for MSM8998, SDM630 and SDM660
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Alexey Minnekhanov <alexeymin@postmarketos.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20251211-mdp5-drop-dpu3-v1-1-0a0186d92757@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251211-mdp5-drop-dpu3-v1-1-0a0186d92757@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=LrCfC3dc c=1 sm=1 tr=0 ts=69414f1b cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=MoI4cQn0tyS3ZVVy2s4A:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: L0EVYfJjk9pLCo5hFB-EuhCqphVets-r
X-Proofpoint-GUID: L0EVYfJjk9pLCo5hFB-EuhCqphVets-r
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE2MDEwNSBTYWx0ZWRfXySW8zpMgSuNW
 pJ258cr7WvLHij4R5RwrA6X4T2CAX83YbijfZ53cCgvHsNtmEG8MrLE8N9s8/jLlp4jBkWXfjFC
 skxVtKAEeEAu7oUaD+aVS5liYMT3P65NqDI6txCHFv3Gxq19lm7eRm+0VbfBEjVUa7gReV8zpQF
 ZnWBQiQc2J5rfz0clrmalyGA65NkuM7seLhLILUUuzQh/q4RKa3qAtxMhZ+QgpaGyru8L+VUn9U
 K3l6ndO+BVcOMMt287W2rB8efxcR4o0p3u1jfaWFnLqIJ6J9j+9i+LTIWYOmVXoUxq/NjKKcNMs
 US/aX0lw/HSvF9oS415PiXnPL15rxADI1KyaAW0xx2K6QVKeehdziOpZid/xa6TRDrg5jWAGy+d
 QrZYSSWSmAQK9ho4V4yGDEHeaNMV9A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-16_02,2025-12-15_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512160105

On 12/11/25 2:25 AM, Dmitry Baryshkov wrote:
> Currently MDP5 3.x (MSM8998, SDM630 and SDM660) platforms are support
> by both DPU and MDP5 drivers. Support for them in the DPU driver is
> mature enough, so it's no longer sensible to keep them enabled in the
> MDP5 driver. Not to mention that MSM8998 never used an MDP5 compatible
> string. Drop support for the MDP5 3.x genration inside the MDP5
> driver and migrate those to the DPU driver only.
> 
> Note: this will break if one uses the DT generated before v6.3 as they
> had only the generic, "qcom,mdp5" compatible string for SDM630 and
> SDM660. However granted that we had two LTS releases inbetween I don't
> think it is an issue.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

I wouldn't be surprised if the DPU description was "better" too, since
they've gone through rounds of reviews

FWIW

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

