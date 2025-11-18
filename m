Return-Path: <linux-arm-msm+bounces-82350-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 96F98C6A2CE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 16:01:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9E01D4EA9A9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 14:55:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E2D233C50B;
	Tue, 18 Nov 2025 14:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gRCAtrqO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WcmX4L7A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A9212F5480
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 14:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763477719; cv=none; b=eyjFWs5tcwajFPhGXMPPH4ZpHGmYtblpB7vOvWywEdO5k4mCctsf8yyziXZpDr/jIPOfq2yZRx2+b/D2OsRt/eASSIbnx1YLzSo7IlmUbaxjG52xY8zzLZWpAUyrFUMmYQyp3M+NmZ0WFiSmSpPJ96CdWp6UtVcOYbQmGqxhwk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763477719; c=relaxed/simple;
	bh=ehzsAtWh8yB3QWeXvhAQ6QYcExs68ns9VWraHdKEVnQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fLh2otshn+5qlM/Cai0H4eUQqHvdUQEcU2rq0ZV5lFoC1OdEvriVpX2vypokRGBXvVcBLgZmIBi9xtZkFBapBshH8HPMJy2jJQUIWF8hlfVy18HXiIXtpDJcb9fpkAVl5u+6zE3vVxwg/ZYxL0ThN1bM7kgTmuTxAXdN1qB696g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gRCAtrqO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WcmX4L7A; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AIAENJP028535
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 14:55:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9R4KR8Z3hVb3srR6L/xvgE81rkJYUH5zBjgpe0vgwZ4=; b=gRCAtrqOkGyFJVFG
	qpIRzeLY8JUHH5NdixCCo/n1EI6JSzE3uCZH4mkHTjyYJjH1nE31I6Et0OwfiQRy
	5e9geAJKajuiNr7WBX7trXIXYyPdOMfoWF9G+dv5cG/qty2nQ2s0IKoftzAi4B7+
	VWmQ80GLnlY9zLi89hahg4ZWYX0+vxRzHLKxItlvw05MR5Cgx5McznHcrfZqOcW/
	gelw7q1NiaOeaONY76DbjuSxOp1bcn43oRUpE/ITjww3Chnk7bkCnEtNmuDFgF3s
	5dT9sSD3TNAXqS78qh8EtiB4c8gjfoJ02GVtdQxFfpn8BaahVBEhsUmwxXHoSYnm
	wjCLLw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ag77t3euc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 14:55:17 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b2ea2b51cfso66382785a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 06:55:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763477716; x=1764082516; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9R4KR8Z3hVb3srR6L/xvgE81rkJYUH5zBjgpe0vgwZ4=;
        b=WcmX4L7ATFNgY113xLY5eQQY+zRfmbXpTGu35/wlQ5dDgfwm4gwWlZoygmBvrWm5Ai
         1hYbi99na4y7s6OaozkUyMUgbok7aERkeV58+xECTDF7h+r20waSceSSHLPGrxtiXF+I
         M2yhXkhqk/GhPdx1xEbg9bI94jO9om6uvTzq4TThEAKYvh8fGJN2bSr44F79APoNi5RH
         JAgKyHHcEnGz6F8tmGsj+fZv/fI01fLjUczz/nm6nkovqYy14fHyKF1PTzKU6f7brRHB
         aVEXtFDGUrUnrjkw/C4GlPEBor8Im7sh/rBE60gcZhtivkiRCtjYKq+Zv1+x3W9PrKQL
         vA/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763477716; x=1764082516;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9R4KR8Z3hVb3srR6L/xvgE81rkJYUH5zBjgpe0vgwZ4=;
        b=LgayddHvL7xIFt7gHbmMwOE2o02jWCXQPXZJAP02OOOgy0db4fUDF2va/qEVMJQbLd
         4QByXMm2u4JrI11Hi64SSDJGpdqHueqammP/5IGRfOMYbdKBILa1jOcG3YMBZFHKiP1/
         LPnwJpowMiaQ4YifRy+FAfUZiYKhCY5QAlO6ONDvUsELIbl2vqTL15h8UZQLY8e1Zo/6
         sj1+koAE8sTG06KDlWvBhg4oG0lQ70lXuu8TC8E0R/3QoE/akyy+eciIzRXp8QVg5Ve6
         KBabXTm89XBT2L3eLvX0mkYmjgEX1pWmhkY545sv4AWEaQpimsTbNU0Op9qGSJDpLfwJ
         6Thw==
X-Gm-Message-State: AOJu0YyFFcGD93bTXVKcj7pxTL7kC2csBtnJ3+7m4B1Hxcrk2KImgBuc
	Mo7JRtISLLfzLReE+qN2GTM+O+SFagAs9am/O77K7E2UqZcDmPAu+4ffud5DCnYbYI/ibo4tWvL
	SPTtyZDzIR+J/uusxPl0y1zvtKYawLO9YmQXHWicHrU1Yh1OhGtyaAsskYkBmAOsVr+th
X-Gm-Gg: ASbGncuYPZVr7tUfJsMPxJUurI1BNjHdzySshw186uLcPqdCqnQXMm6TpQwMW9VPoQB
	WO2sx9rLFh53B/4BJse3Abq5pDmLDHD1n5TxIPtXbWieltMGWq6uHOnkfpg25UYFmtnsyP98zWS
	uheqO9UGsJ9n9LWfO9N+FV7miJuW9pdQV0S2IEfrvT9bgAUYBiAvD4/p8QwpBYGiFGHCQ0nbhLp
	xDkiUr378vSRJDvYuAgmSm2WgZEnG4JLanfghAHyOLRf/deOQvdARTILsmWTEvuyfH9+t5ykK7F
	7gqJ79WIo6JWq8ENZhbQRxPuwO8Y/EEMcE7axFN6nu0HtjrJ6CiArFj4X7l7U5emQS0BREZiDDK
	9AIyr56ztd+uKuyB4J3/+z+X4acNiYEbQeMXKGiIg76mK81h3abX2pU8v1NgxWwOOzLM=
X-Received: by 2002:ac8:5f11:0:b0:4ed:616f:3cee with SMTP id d75a77b69052e-4ee3140ea44mr28434831cf.4.1763477716288;
        Tue, 18 Nov 2025 06:55:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEJVZA6dX0gt3L92EL+HUhYgz0yXNr/pNVcybeYXxplcGFGlRqKl+WXB2GoO8y/NFEAU/p1iA==
X-Received: by 2002:ac8:5f11:0:b0:4ed:616f:3cee with SMTP id d75a77b69052e-4ee3140ea44mr28434481cf.4.1763477715833;
        Tue, 18 Nov 2025 06:55:15 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fed90c0sm1385620166b.65.2025.11.18.06.55.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 06:55:15 -0800 (PST)
Message-ID: <5b0b771b-c2eb-4379-b55e-25df10449688@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 15:55:13 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND 1/2] drm/msm/dpu: simplify bg_alpha selection
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20251118-dpu-rework-alpha-v1-0-293d39402b59@oss.qualcomm.com>
 <20251118-dpu-rework-alpha-v1-1-293d39402b59@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251118-dpu-rework-alpha-v1-1-293d39402b59@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDExOSBTYWx0ZWRfX4AFvC8LwYfx2
 ETfIFjIrCo9x2D2NNc0U1If93GW6popi18DE40gun0xQPoqkn4B1HXYuvLUj2x1YpXBMmLWT8QG
 l/dl8q9cXNwSuuw3nbJ+ILZYL2btVfYcMzt8zXbuYuxhgP46Muj/FPbB8YgT8fHHT98sInb6PtN
 by053oI1yHbV72+HxZcsPGeBbj5zHXHYMKchdX93/lriKS6MMTWUfD3dR7OPe6W3bzcCoWrNdJi
 Cens4IUWyjkTSgQbbQJKA4Mq+Sk4rGnNWb3cvb0p5gauL5PQNPwyveXhP4fQl9tN4mqztap0btI
 gMVZqGPzHqktmF/1reKo5/l0i/B3tlVGAEFCCMmdsLAcjFU9vnOhGHmtfHivN3TNpvAD/EJJMsg
 KxBTN47L2rPEqc6Tkf7UixxIAU1ggQ==
X-Authority-Analysis: v=2.4 cv=EPoLElZC c=1 sm=1 tr=0 ts=691c88d5 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=J_72SDv3VFfFxBOWP40A:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: 8wa_-kHP3AKbb8jyMzcdLwIotEBoXs13
X-Proofpoint-GUID: 8wa_-kHP3AKbb8jyMzcdLwIotEBoXs13
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-18_01,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 spamscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511180119

On 11/18/25 3:51 PM, Dmitry Baryshkov wrote:
> In order to be more obvious in fg_alpha / bg_alpha handling during the
> blending programming drop the default setting for background alpha value
> and set it explicitly in all cases.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

