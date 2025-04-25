Return-Path: <linux-arm-msm+bounces-55727-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 045C5A9D107
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 21:03:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B62A57B3E53
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 19:01:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67F3F217647;
	Fri, 25 Apr 2025 19:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A0MPwPKf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B12E121772D
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 19:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745607774; cv=none; b=ealG5hsP6udUG3YOmRM8ZF1isgHi/vnKMa6cvjlU9fUK1sFA7Gh4WkrwBXm/xI/OrcnVRK9vkGTNwfjhHDLL8PN61MN/vVWxGsmWigiQ5/TSG9OHW6TGwjdOZtX0IjERB9yVUN92w6YVGo6Us492aH+H0DlEd8K01oRJ3iL+PRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745607774; c=relaxed/simple;
	bh=pYCkWUjNE3NuFqcQEgnTKGicdGzX1if1k7WgCb8+6Sk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LIvyekDbHnZ8POlWj7z3CQYlRU49Ln8UTZpQmVFRxX5vOcN+Wll2uGqpV6YmSyTy9o4xAQx2CbzrVpqbBCD4svG5WqC5gqh7bbIIqz423eZz26kLXk9YxSE6R6Va2Sind2F9UF2Sa7Ynp5QwG2QOXv2p8mKHEpjvDMFco2FLaTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A0MPwPKf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGK28D004870
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 19:02:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=nkUUiT3ss6IH9EIAP3uPnI28
	FMp0pQeC3xvyjBzjGrE=; b=A0MPwPKfawqBaD6ROdG6oY3SGx5ZePkWdkE3TOJ+
	6va1AZ8QH/ZtqM+hQXghYzF4Z2Q7sPaxEehgHwvpulGN7AIwHQxsWLnEoXxB+MP6
	FZ4Ia3W9hKe61mUxgbWFGA0Cr5+3QPlZcZmuufEMf0VOE0Du5iPpA95QKmBDJxLG
	w9RYOeck4ixQuldhuL7Q0oxM/giaE423/PyFxK64LL7axYrSZbC9H3QG1NzBtcnF
	pd0yNRAcPMNjvLqf2xCMDjkzelIzveOqxqcuy8sHet3xIyUvO9tADWbOSf0ZI0hu
	XefuWasLyULaY8k5IPIWA1SdXqbHe18ajF9rdRjOfvcjcA==
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0a2q5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 19:02:50 +0000 (GMT)
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3d91a0d3e15so28293315ab.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 12:02:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745607769; x=1746212569;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nkUUiT3ss6IH9EIAP3uPnI28FMp0pQeC3xvyjBzjGrE=;
        b=gvtBl5Wg8MY96AvSm6xUecLBjSx0fCJ7ELQmwNaY8dqxVdE3paVFyoZzfG4X5tvG9/
         KluPMB8HQ0T4o8WrxwRtov06ED2e1oCDjEYe9vUmCE5JmsCtTMoSODIzoUbyrJpr/7lh
         z8NaV95EQh+vmohU43S1rIh9etf4XJlifbgYrLspk/LHRMhUxgKwvs2v9WjXqfpZp0Nd
         G2CNTYy3t7h//3+Z4fQN04/2nu5ZZ3LwxilOIPDmy+uKQKabz/GbehTBsm4iNCqGzgMe
         0XzaGbhqTgKhhG75evFbA20h/k8SwW/aviw6urXa8OjIZ5N43wOtSa3mk9CN3ON8+lW1
         F2mg==
X-Forwarded-Encrypted: i=1; AJvYcCXaMs41X1qUI8jPDaL7CW90cJD6+x8NMrRiEiL988KsmhIGO265b0xjv7gai79kGmOz1klu2aCX2ytq1U6T@vger.kernel.org
X-Gm-Message-State: AOJu0YxmtrIiw4g0UgHR9QWC12Yqd7aTjS3XhEgAidTqGATibIU9gVyc
	FwEJJ2awpsgamhs/cGIwTtfwF23I/VwQi+Upg5buvL6XFrB4JKq+6KbuWOuy2+aaJhvxJ+iD1yR
	CJXAFVXUtEXJpt5Mt93MXzOej5rWP6Qhz/idGpHP3d9IrW2Ujc/9X7JAKL6DiKZXM
X-Gm-Gg: ASbGnct8gRP3tDegfeVJTHBvtspRFCt0+8SeaiaAYw6jeFa8o1YrLHLfmLyeDSbVKmk
	9i+L06a78Wfi9DNDGru9ve//M0xaBbXjDV7d0j4YxU5NbQYEaHk9rJJumkUW6aNajvpTJA+M+Qw
	rbpSu680QLDSSo3dz77xg5ia56rN8ywiF8kUkUGqxTHipME/NDCFQZnl4UDPYl6jmFEcNS0YJlV
	zMIcfMVqVQy487JdCGiUyiW4UitWbobqIbd9NG7Ouc2KBgoOL4vnM8zFWx2JpK8sarNd4GNZtqj
	aSkcKz0wBXv+L+zjPFllS8Pcn+/4hD4Ap9ZZ5UcVrRXP67Dq2NIzBL60Ph8AGmkP4Z/YN1jhgiA
	=
X-Received: by 2002:a05:6e02:238a:b0:3d5:dec0:7c03 with SMTP id e9e14a558f8ab-3d93b479e3cmr39269265ab.12.1745607769324;
        Fri, 25 Apr 2025 12:02:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHhuXvdR/qmg7RMT82loQhMhHkY1RAz50Xasf3Q8QcQs/adSctEEm2ILPuO8VBKeb6d+RFAAw==
X-Received: by 2002:a05:6e02:238a:b0:3d5:dec0:7c03 with SMTP id e9e14a558f8ab-3d93b479e3cmr39268695ab.12.1745607768937;
        Fri, 25 Apr 2025 12:02:48 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-317d206b703sm8497861fa.114.2025.04.25.12.02.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 12:02:48 -0700 (PDT)
Date: Fri, 25 Apr 2025 22:02:46 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH 4/6] ASoC: qcom: sm8250: Add Fairphone 4 soundcard
 compatible
Message-ID: <rhfklvynn27x2lwyygk5rpjwvx7p6bhbkmc5jehuy54ilhnzbz@wuhcndngavbp>
References: <20250425-fp4-usb-audio-offload-v1-0-f90f571636e4@fairphone.com>
 <20250425-fp4-usb-audio-offload-v1-4-f90f571636e4@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425-fp4-usb-audio-offload-v1-4-f90f571636e4@fairphone.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDEzNSBTYWx0ZWRfX9pjk7MLDVF52 vdci7k74EtdIa4z6PoNR2GTkThLGlH8O1WjiYPisjmeT2wXmWuBpo7kIWdZFcWJZ+G+U4ThcdNp YXNCjXXG7f6i+tIeBgDyf0fWHeK3aBoHvmdBm25FXvpjprV3z/XQX+s5EyfBsTXJAGSZeD8LXDr
 BfPJkgyCUv9Fc/7cSs8wtzTecjY8I9n/oeSxO5zHGIkCXyT2iqxTx8aueBFTM+MIpJX4bytdrF6 qGZYk84xyFSaF08YBbYqEylyxMUrweTlEKbfUzKlBd7bPZhAjKgVpH65Mof4N8kkqxuZvr/LvN2 RxhHrMxg45HDHR/mLaaiFrOq+qCNqrS2hPcpk5NLnsjfRetbr9LQX7n86yqKwe+4NaR/3HWf9cr
 ZlRVd70u2apPoQjKrbLnUIPZKS0wy1H5d5Ke/uw12msDycUirzdG4s0VbXA87RsqoEn9PkON
X-Proofpoint-GUID: 2dJ7sdqrh-lTfsa7CZIZsVbXOuj3Hb5x
X-Authority-Analysis: v=2.4 cv=ZuTtK87G c=1 sm=1 tr=0 ts=680bdc5a cx=c_pps a=5fI0PjkolUL5rJELGcJ+0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=GtLuwp1ogO1-ZJmtaBoA:9 a=CjuIK1q_8ugA:10
 a=HaQ4K6lYObfyUnnIi04v:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: 2dJ7sdqrh-lTfsa7CZIZsVbXOuj3Hb5x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 mlxscore=0 adultscore=0 lowpriorityscore=0
 mlxlogscore=869 priorityscore=1501 malwarescore=0 suspectscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250135

On Fri, Apr 25, 2025 at 12:44:54PM +0200, Luca Weiss wrote:
> Add a compatible for the SM7225-based Fairphone 4 which can use this
> machine driver.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  sound/soc/qcom/sm8250.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

