Return-Path: <linux-arm-msm+bounces-59621-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B7457AC5BC7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 23:03:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7D8F14A7941
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 21:03:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CAC9210198;
	Tue, 27 May 2025 21:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PjMu0JTk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F367A20B7EC
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 21:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748379807; cv=none; b=Pp76Pl8Ko3c3Al7U9M7Eg5DocPJKhpCh86fI6kSCn3Sc27XTC0i37AMCA/SJ1Xk6tYB5kGsWqDnNa9K7TcncWekAaQCBuEG4d9P1UCJAxK6ZBucHHUui6RagmQQAjI9AHh9oQYKrmJqlbY6kEazrwPf9eDBNzgkDd8FKQJ3JaTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748379807; c=relaxed/simple;
	bh=+7lmrkFQHlFAXV0QQyrHiRbF0QoKbYG80oYbBKTNEzc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GnHIhPTTODafBbbsjMlLC7iWeNEWpPzN2Qai68A5HKojHzYfCLEtExT5xjNQbQEIgyT5DR/XI/PYEp8TymDw4tMTLNzNGtKkXmF5lyLU/qWu0U9OUOeO7FBBPnY5MRlyF67kZAJ73kgNdIZk9PWxfzEMQREPXNUcT53l8qv5esQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PjMu0JTk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54RCGs3W012741
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 21:03:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=VsOv4br7fd1T6CcMRlB4v7ct
	hk2voXgCn0Av/3vO9Do=; b=PjMu0JTkWX93JZ3HTHCBYQzd1vRiwiscYkhKM6OA
	vbA2zi8u+QIa9/JxmrbghIdXjk0X5tHm/K01LCekhYvfFKgBPseU7ikZxCmwr/uo
	vTZX+IpPgzJ1/RvuDxkgfcDhgzDeL4J0vCzx9R0FQND8N06wlemN2Gz45A2g8SgQ
	Yosbj58Yqfbp2tRuYzwPxFukE9dl95FCkN6jjCDnN13XnLMYgBEtTKuiXu1nS4I9
	GzXsnzNpL0x+DEHs0k3jROXjl30nydYi8z0X/YK1QUwQAj9oPjBjMuG3e8ELFeS0
	APPgu/EBZlgqQ3BNLAS/+2GE5fvG9lsM30neuc1DaqsTpw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46w691apv8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 21:03:25 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c54e7922a1so816060985a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 14:03:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748379804; x=1748984604;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VsOv4br7fd1T6CcMRlB4v7cthk2voXgCn0Av/3vO9Do=;
        b=myPSTb8FAKww6o5f9Sqdf6Xu479nU3KN+CmK2otZieiSzbeJMZRacfyHEtE5ExwPDN
         hb9ojeGyx3k0nqQDE615C6NbP8SL8e6yDw0b/KR3C4VpWzm5bywyzg+ERDaVcV5bM3DF
         LmaioNT5c48zDG+Sdqphj9ixGBpgiYCDj0zfyo5ba01nhvVywB0yhIhJO/Z3pPjKoxe5
         C+PYrtXBToyuUrp06QOkvfcB5KBhlQBG1Pr60yQ6BP53vOADdTbKzV13cLbDQvtilT8u
         RTZEXsubrArAQZ7NRLXOFQDWHEw3PG6d0iy2anqLszrzlukQOZz4Zq9TLHLKhLQyLEB4
         AVmA==
X-Forwarded-Encrypted: i=1; AJvYcCUquowguX3buJuqMK2rL2TyfVa7DNdxi6Y3sKJT43CUeVKaU0NvU9tr5wqAAzYsgMSJcqD6KpGmjIo917og@vger.kernel.org
X-Gm-Message-State: AOJu0YwDlygz7h9wrGmgTCNA8SPLrhGtV8eulZ/fjoTARztfs9O2vPcC
	lI/SO8kToNLhtw/+5ubu/8WKIigd4nF7XhFE6Z4ZjLZpiMECGu1HNgzXQtUSQGCeVF+QvigI+qN
	yoDgogsDSlH1SO1KFMs65DT5uv4CPjHcZBVtmb05e8wNenoTkNfpPFB5vz96wE7uGtWEK
X-Gm-Gg: ASbGnct+pxn210i1JbV/OXyXl57nBi6bKani+ngcKz54Fdd5qapxShfYF3WKZpdlh0s
	d9zlS1Zzvy7HGtSLhDLeZNeBNTHeWoG1x6ZckzMeYNunxRC/CngTDvAbZ0OQJGr0NoCOTwsdq9+
	icJ6gOAXxeGbAzOxOS3eu5twav8nH4NfpwMZR3V5OlFnBmPHp37yGY76MOX9fl0lb8cGch6B2s3
	rGjmjaBaElRKrE45aT+/RrEwv8G3x0OaUPvShs1Roivwt5ZZ+K75oO+vThA/BQ+8q5zpvO+sGaq
	Rz6LW+7Tefl9yA+ivCTzZEC76FUusZAcOXaS7q5vUMp9lwuSj6t60qDMHyn+E0ClM7OPGGDqyyc
	=
X-Received: by 2002:a05:620a:1794:b0:7c7:bac6:8b7f with SMTP id af79cd13be357-7ceecc2d5cemr1965853985a.45.1748379803802;
        Tue, 27 May 2025 14:03:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHey2F+1GmRJLbhJPjMP4o/YRYtrCtiGE60Hp1Q7gbuk7nE2RxX+76V8r4hyZF/SGD9E8GdQw==
X-Received: by 2002:a05:620a:1794:b0:7c7:bac6:8b7f with SMTP id af79cd13be357-7ceecc2d5cemr1965849185a.45.1748379803410;
        Tue, 27 May 2025 14:03:23 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5532ee738f9sm25865e87.237.2025.05.27.14.03.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 14:03:21 -0700 (PDT)
Date: Wed, 28 May 2025 00:03:18 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 2/6] phy: qcom: qmp-combo: Rename 'mode' to 'phy_mode'
Message-ID: <syuv7z7llocqzqsg7k4chd2lejnjsv3fzgif5eumxkp3bdtrrw@vheqjejlyxgi>
References: <20250527-topic-4ln_dp_respin-v3-0-f9a0763ec289@oss.qualcomm.com>
 <20250527-topic-4ln_dp_respin-v3-2-f9a0763ec289@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250527-topic-4ln_dp_respin-v3-2-f9a0763ec289@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=WfoMa1hX c=1 sm=1 tr=0 ts=6836289d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=i4r9q8SyThEWzBBqjdIA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: xHak038GjbiUTC6c3Fp2Z_63ig0-A3Lb
X-Proofpoint-ORIG-GUID: xHak038GjbiUTC6c3Fp2Z_63ig0-A3Lb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDE3NyBTYWx0ZWRfX8Pap7vWJesTR
 I25qhR/hnraEOdzfPMhw5TNpjTq6nXVzRU6N3RRz87xtagCX0kVr3KFjpLFT6oKIJLOAbCKa38U
 UyZ6b2CaxExWM+8gPu94HZyuP4Qt3WyLJf9zh8LhhWq4FWnEpPW86n3r2qQBQHaU23pUAjlZu6Y
 8UaKNIczGcGpK75Y5VbT104swEaFu4YIJH75UXskawfwn2jpkKt3TdUnQ3oIIyLStja9sm2tD5f
 kCmcDKeAVsj4wQYw+yM/uS2C9Tc9936WqPOsbB/xv0N9Q5w1wxptcTYGz0Yfekb05u7a4SeiQaA
 9Tsx1T3ctFNORfrJeuu0vcIENnEYQpvP/syksG02Uzr/w7Pqd3x3aN4szbWQUOOIo6aaQ96Su+i
 7jDzmFO2Nhe+uB4u+1tB2PINYubWLZeX32/fgA1DO2vL+m/bNecQtEevhyD4bBKGAQVTrjwS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_10,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 mlxlogscore=951 priorityscore=1501 mlxscore=0
 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505270177

On Tue, May 27, 2025 at 10:40:04PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> There are a numbers of ""modes"" involved: USB mode, Type-C mode (with
> its altmodes), phy_mode and QMP_PHY mode (DP/combo/USB/off).
> 
> Rename the generic sounding 'mode' to 'phy_mode' to hopefully make
> the code easier to follow.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

