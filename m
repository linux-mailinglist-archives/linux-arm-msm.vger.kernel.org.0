Return-Path: <linux-arm-msm+bounces-58801-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05F59ABE53C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 22:56:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 41FE17AEEFB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 20:55:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CB8B2135CB;
	Tue, 20 May 2025 20:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U8gLY0Z8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 826BB1AAA1E
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 20:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747774599; cv=none; b=g29TkaSmXuqANsdfVjyn6/mw7++wSyEwlf38nF2TVx+QmPUCdZwkBdwbJeY3jLuvVNqFac98xoT52OLgf9wK1e6r5MSwWx3mqAZ8H7K1t22mWNPbafHkwLKClLUExlsileIEgwIkCVGOSVL819GpRYST1MZk4+GOLPB0oZVYTFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747774599; c=relaxed/simple;
	bh=aH0IejF+Zz7WEqLCyr8sG/+eKObXIHV+EL0wqjIpHMA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uyQruM8sNvx2E+WVF7xGJXFZalde3BpN+WSPe4TCNuQmmmJ1BQzper1IyDtyytupXTa/y5MNDPeKLYwHLJ0JaBmXaOYp4HC4BVBcEXICuh7+bLlSK2aL/+SOv+l7xXLHrVeMExItEtcMPMUqCogyfIgqV0XyfOmMCHLFu9IBMbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U8gLY0Z8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54KGdnGZ000511
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 20:56:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CP4xwurVbbToqKBRo2zAIG/y
	iqGnKWmP98PPEkImYEE=; b=U8gLY0Z8pR5SFnPRgOjKJG6Alyhq4VbwJO95rW7J
	9EZUy95ri/k7bsd9dfcod+7FpQktOdUAklg4vu6RAJzeI1P9KU1OAdags0FkzuLi
	pfPDWzJnIDUX9ke3CzgUii7CsDl9NyzJ/m4P7XF3roPeGYz1pTDYCm3TmjRQqeqf
	wTdR7F5qXyHs9Q30cYICSgRFPjBHM8DDDOP+ZALi9kezflkhdeid5Kp3XjeVIiRT
	kXamh1VaHWpa7KVbuarFOpuPeCKKUiAEGREH9iX28NXNwZ5sEkTfd4L7Zo1dcq1c
	ZH08EhLR1iHY5kMrqQjOr4PeBLBllKR4t7aZ4T6m6hWn8g==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf18mfn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 20:56:37 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6f8e23d6657so32866486d6.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 13:56:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747774596; x=1748379396;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CP4xwurVbbToqKBRo2zAIG/yiqGnKWmP98PPEkImYEE=;
        b=D3rELeCEuDQJiRDKPFLNILhMrZZ4uQLXqS1vfQyzb8agcyekYZimJ7JOeZCa8Mgbd3
         EyAs33S7WVIunWorahL7NFgDpcpfF07nA4K+Ncs8tWULWiBHvr6iiH4Olh2cVTudo3gf
         E9Vm8YSC+H4LYbyUvo+HItBm/wAdOwInnd0urxra6GTlR+ViCvHxvA+f9pAZASPBj21V
         uGRIABXx1pmW5RR/MUO+HVjvHfsLloRsi62UtpwbUDgMNH28DAuu7+z39/Pw1Pb2F2Qs
         5NOhC5aZrXA4Y00thTjyIpWoJwRqYM/RsMldBmbmt7/QzhplNkYgJHyyEbRsQDBZbc8N
         02Gw==
X-Forwarded-Encrypted: i=1; AJvYcCVmFatmAkefYgFygT5z+hRZoO+OsECja/S2w9x1cx8ef1kuAKUzUxOfV5hgJJmohYikU8QZ/LIzpFAeuWYj@vger.kernel.org
X-Gm-Message-State: AOJu0YzltSQOj3N+ruGZBLEMDW05NNRs4blM/uevsNYQPAGgmmZVgDFR
	RuKjZ9PvHKSWrBU2soOzo5qSj+LJQ1CQm2tj2G8WQ8gWwgb0dDDlQd/p68jIsghXz7xcis7l2Fm
	kD2pBGpzYu64fk9aNKK+NpvGfQkvjmXaBRU2jV7dXQdmXcWkX2eCQXH1ZPYFFV4ax33cn
X-Gm-Gg: ASbGnctmBA/oiXkBMkf4OKeAX+Uem7Nvtq2kX0+f1vPYFc0AmqbQFlW60nUZV0HGYCH
	ZmWlY9pVE4qaMIHvTgiP7hdMD3yy1zTeUjBEw52Gf2iQUqzykoYsNLRJhY8l+DPfbGRjww6r/+q
	5sfQIDnFofAY+wxg4hNHQXGs62U8R+PFXWvl8vIsGUrJjP28kU/EOTwlTNw1tW5NnUJjCcmdPJa
	5cBIXaKfgEpAei1YjS1pXeRThCryDzM/RP84FyWgH9XZRRUYswMLx7V1oaiJSkB5ETNcR0oI6g5
	/1CEgGb9hxEnje0GnmnBpQGEn1YnedCy2jxB/86HaFJV3cW2n/DjZ3CDQlmHjo5AMZWYrqR/R40
	=
X-Received: by 2002:ad4:5f8e:0:b0:6f8:9b75:a62f with SMTP id 6a1803df08f44-6f8b086659cmr266190146d6.24.1747774596258;
        Tue, 20 May 2025 13:56:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGFy83aHJuT/E6OBhfe1n52CIbQyDvRG65Dk2H4hxXroNmeP8X+zaXZZgMd9JBrOkilPmPJ4w==
X-Received: by 2002:ad4:5f8e:0:b0:6f8:9b75:a62f with SMTP id 6a1803df08f44-6f8b086659cmr266189796d6.24.1747774595898;
        Tue, 20 May 2025 13:56:35 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e702c0e6sm2479511e87.161.2025.05.20.13.56.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 13:56:35 -0700 (PDT)
Date: Tue, 20 May 2025 23:56:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH RFT v4 04/14] drm/msm/a6xx: Get a handle to the common
 UBWC config
Message-ID: <vfl5autirf6a7fg3ck55xh26rx3nbfkl7cq3kthwmffsfhdc5b@r6ibkyn2n6nq>
References: <20250520-topic-ubwc_central-v4-0-2a461d32234a@oss.qualcomm.com>
 <20250520-topic-ubwc_central-v4-4-2a461d32234a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250520-topic-ubwc_central-v4-4-2a461d32234a@oss.qualcomm.com>
X-Proofpoint-GUID: qAUefNE5KKUbGl7wxU_llYouLQzkUs-t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDE3MCBTYWx0ZWRfX+UV+Y9ntYlfe
 FyWdM1rkwO1BCZYTWXymi/h7Nf7G7tws0CM1A6oLusa9VedBzXP+kqZ3S02GdhczBNsLunKI9kg
 laPfkrn1vW4ZanTjTRE4g/LkeR3iTs/oW24zC2kG+ogZivsCT5DGqN1go4dEqK/YD8FNHVt7ZOz
 0P6Ajf7TmfrMNCtO29+r5iWLsOK1B9aR0u6ZBAdMeh9k5tnuBt1iwaCTBk+/rz8BUvr2LZHgjso
 0RSZQuKgu+kHnCx/wZLylzud6dCXaRKs5f2nYjGmPvI1HleYTdHGYmOfdADPkuZu7Xn0bDNwNPW
 CJ+arvSLP0fiXodTKL758T3PY/ybfAvEidUFVRsmMBMsIc1MufeDZuMBOj7f+SSvNjgC5cd1sML
 loe6ZHN8hM7SBCYFBamRaUr38RbPlMIqePuwo1ElEs20vJpPcDqewBVmhm+CpEcpOzmc+loH
X-Authority-Analysis: v=2.4 cv=F6JXdrhN c=1 sm=1 tr=0 ts=682cec85 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=93Yf4Y-vqGi4v4eIoEMA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: qAUefNE5KKUbGl7wxU_llYouLQzkUs-t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_09,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 spamscore=0 phishscore=0 bulkscore=0
 clxscore=1015 adultscore=0 mlxlogscore=786 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505200170

On Tue, May 20, 2025 at 01:07:09PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Start the great despaghettification by getting a pointer to the common
> UBWC configuration, which houses e.g. UBWC versions that we need to
> make decisions.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 16 ++++++++++++++--
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h |  3 +++
>  2 files changed, 17 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

