Return-Path: <linux-arm-msm+bounces-81511-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB0AC559D4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 05:03:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 046E434818C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 04:02:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A002C2BE04F;
	Thu, 13 Nov 2025 04:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jVviftTT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OCxA2pPS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 320932882CE
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 04:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763006554; cv=none; b=hoebzhFmBDK6/kX0+yGOvWNSTpDElf/Cv1lEneuooYPikhw/aDL0QV02YwaWfHCdmlYFMuph5qSWkb5vXR599qKr4vvMX7/osN7rYRk7W2MjXdO23vZWYlr5Ehqsu3rXWKWt/7Dhky4JVw0KtR8tfU1RS0gDO8OAeCGdPFMeoqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763006554; c=relaxed/simple;
	bh=A/m0/FYLjfLNq6z5gNH679fumCbGSnZF6Srx+ScvTPU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ItObpq1Q+Wu38lZ0t7PEMqBWr/QqFjKUu5egpil/atwrcILwxE4E/UA9Mbydl7chMkcQab0TpX1kbd2105HrGmgdlAxcvlETcfCeZsHBdTGUpQ5/YKfFVMHYktFfRj/WO0pBQoZ3m1CHOOOHA3kNez3otuTNPVHu9h1aPW460as=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jVviftTT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OCxA2pPS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AD11EgM3149869
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 04:02:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Hi8IiFCLCvZ0hFXdpnFxUR4S
	e2upawT7/hvUE46ZnHo=; b=jVviftTT/GmA/TmXdMbgxwRY2FNowNynqg/2oI96
	J5g0vnhSB2LhPGSFIp2u+20H1QgDKBOUOF97Ct6V6dapUZymCi98QSKrowNKn4dW
	jVXS/H+XHcGcKjKr7PJ2GXvsL5BCeIC+lDphpqSjytAWfwyDb47e331y+Kz0JaOR
	hwPVdaCFPTd8TmDq4WPU6u3YiaByvrkOpELlUZbhb4or2VI/tUJIKqKEgUsbJ3mZ
	9Wnw9CI5VjkptjUCKOoi5fzRSpnHlB35PlhMZy6UHrEvLY+F70Uvkzcc1EsijZjO
	93cuYduLco7R7cLvid/dM0/4uGmZKC2YqnVvPozB66g+Fw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4acwve9t6a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 04:02:31 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ed6ff3de05so13212131cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 20:02:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763006550; x=1763611350; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Hi8IiFCLCvZ0hFXdpnFxUR4Se2upawT7/hvUE46ZnHo=;
        b=OCxA2pPSgUPUhS7+OcoHiySfa+016uUhHAbQha2CMnHz1umWX5h+Ghwb60mcxWhjvV
         bYeEhXTTfmHKN9nQl/PCeJez/TQki4sFZiNMrfnsQIn7VTPjie+WN9uulmXT5yu6+YRp
         REuyqlU3rrXwwjSNAfqzVwODSA/wTm7dTMH/A185Y0p604moQ7sqq+WMoRKmQrfQR4HI
         vy8zlBb5HKtzruSflzsMYZTV/hdHG8JR9Y2HneFBVkGovZbNH/slJ/W9eui+Yy3dCjMy
         v4ulr4vVYue46q19qzWhsUOTFbZOYea5KQckeIOg5rcLQoNB1qRTgsUdMa5uuBETteW1
         xDqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763006550; x=1763611350;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hi8IiFCLCvZ0hFXdpnFxUR4Se2upawT7/hvUE46ZnHo=;
        b=fhm1I6bX4shHCFoVHhgMZIfNWjQ5Fdgv/HNJ3byN7N2KNw+mBvgUYQdHybSuJKuvb4
         J9HlYfVTqpxMOsH82WB1J3KGGyxuApG0aVwYxVW9aIHo6ZIMrRgV7vVs65m7APafSMck
         JANtYHVW1KmpI7HWvelK/VElYuUbUgQifFEWMxwOIxdtvj+9wINc7P+EMWNfcmMHnBhX
         sKxN1rX94QI0CUDv+K+/eFXjZGdt34ciG17jlZHnXLVUi+UpsMQIF3S99ca8AEgx140r
         VXmWXVTqHErkMQ9XfbD+RFnApwlwhkKgNX+0WfynGsIdJhIG6c8wOURJXeREWvHTiGNH
         OssA==
X-Forwarded-Encrypted: i=1; AJvYcCUpa6XFyfYX3WQueCEqOdnAA146LB5/I7lZS3TNYHgwcYxi5qAU3ALTlhnZPSPR3TjS0plFJ8WzVh3+mcpr@vger.kernel.org
X-Gm-Message-State: AOJu0Yxkpvmz4Brwx6ERGLWHo5pTsIocKXBC6vTykvL3KmFYwawxNzVn
	8fLMURtWLBCBMBwGQTzJqySd3RxdAtEzFYF/9iPPYmt9gI1K+FjuFdYMFR7KjcEGcqKILalevbV
	H+uJ4KyEmbpCegt4m9hz5JWb3jqHJwUrSBoVMhoTQatWO5oACM76ZYXiAyw0pzdznTIqh
X-Gm-Gg: ASbGncsXPWPJxucJFf8Rg9BWAaTwPAvtXacTJkY++KMsHM58ngFunDUXEq7w4AzipMY
	UU54hYQq/I32SwjH0AAdTWojXYpWvuZdMb8DgXKvL0Q8OMr1VCh6kWBKMC8NP95l0dhwxnPIKm2
	wpf+XPzymmVkcZXYDZ+WjhisNUGwIAUSrrZ1mBmJ+tQlrediwcl+djl/OmQsnoR4YiXwn10M/jy
	vh+WBMB7izYG1yAIK/hg+LEpt532s6lcEk2HzZE09UJO2yHhL39xYrPPLJewU1cKQATCbj8OcZo
	1lxNaDBEfEXVPI7sZATFFPdvUZC78cCws4x0XYOq7wrIGiAuAQfww7/WAp0UgUY7Pjbk/EGNFCW
	9Ogxb/8WM1v9kiw4wmGyUscXxqoPVOsM3kCaP0G63i8pUT27B0bnBnvXco354vGAJWgUVZdULGc
	FyIb7pRLa3av3X
X-Received: by 2002:ac8:7d83:0:b0:4b7:ad88:45f9 with SMTP id d75a77b69052e-4eddbc94278mr65929361cf.7.1763006550410;
        Wed, 12 Nov 2025 20:02:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHCK74efI64XGELNruqg0Zx61FzCrWVUqnFTqsoVUSyfP4S1zawIWKlMONFdDbuIMNbZEMTSg==
X-Received: by 2002:ac8:7d83:0:b0:4b7:ad88:45f9 with SMTP id d75a77b69052e-4eddbc94278mr65929051cf.7.1763006549900;
        Wed, 12 Nov 2025 20:02:29 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-595803acabbsm135266e87.1.2025.11.12.20.02.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 20:02:29 -0800 (PST)
Date: Thu, 13 Nov 2025 06:02:27 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jessica Zhang <jesszhan@quicinc.com>,
        Abhinav Kumar <abhinavk@quicinc.com>, Abel Vesa <abel.vesa@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: sm8750-mtp: Enable USB headset
 and Type-C altmode
Message-ID: <3a3kmtjsj3utq3atkjtyjvokircys2qc2dthsc7ip6pb5zpl7o@eo4wfpbldkpp>
References: <20251112-sm8750-display-dts-v2-0-d1567c583821@linaro.org>
 <20251112-sm8750-display-dts-v2-3-d1567c583821@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251112-sm8750-display-dts-v2-3-d1567c583821@linaro.org>
X-Proofpoint-GUID: 85NIakpd1xYGjLVKnuOvoCchbKInGXJE
X-Authority-Analysis: v=2.4 cv=F7Rat6hN c=1 sm=1 tr=0 ts=69155857 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Rm511Lm4PB0MII4DX8MA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 85NIakpd1xYGjLVKnuOvoCchbKInGXJE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDAyNCBTYWx0ZWRfXwaJh8LXuslel
 QMG6OGegjw9/VJMh4wCpQbQYvESN3JADQLbEw0/hKKOuX8Y/nar42PEN8CSmPdQJ9xV5lmPCBIF
 QOGZKpJnd0rf6oVChWM6HRvynEBQqe2/SW3Vo46dMr/3rSQWR4kAy8Cz9694BRPeFNyDYUjSb9Q
 EXqPFkmjo8tXd+dHCe8G/JykZbXTohm+EkmS3v9GgwW/b9kwnA1dgo62Vi5nFXz6WeJSraEPYpU
 RUlZ9PFVixhw95xPIzZ6FHneqUIrv0kqlcjNkN2/Zeg8/hTTcFjxUB1g4X7Qa59oP3oei0iN+bc
 kMEe7K5gfB4jsntrUyLcNXh0tUK+aL9AxwaL66IDYIMJP7vGca3CdUVuwnKNTgVSBPq0WDvh4UL
 +El64YRGl52FJdbo5GIduK0/mg841Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_06,2025-11-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 adultscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511130024

On Wed, Nov 12, 2025 at 04:02:40PM +0100, Krzysztof Kozlowski wrote:
> MTP8750 does not have audio jack connected and relies on USB mux
> (WCD9395).  Add necessary nodes for proper audio headset support along
> with USB Type-C altmode and orientation.
> 
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8750-mtp.dts | 51 +++++++++++++++++++++++++++++++++
>  1 file changed, 51 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

