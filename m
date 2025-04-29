Return-Path: <linux-arm-msm+bounces-56116-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F1D4AA0B4B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 14:13:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 69EC67A2BC6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 12:10:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F9E42C17A8;
	Tue, 29 Apr 2025 12:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZzPs8XHl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E6DF21325C
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Apr 2025 12:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745928705; cv=none; b=n5N+5Wyy7E6ZDDe6Qvelb3ALlnvb8tXzWkMGOoM6nP/uy7/2pXsJhNp1IYlgLgHBCKK2kir6LR5aiQwsy3pH68rS04zECrgLvbvmRmoPxR3G3m/lGqkZHXgu1HysnChuPIDHnUXsk+xeWgwy0cdokEh1x/5dr/K9HaRX5HkOw44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745928705; c=relaxed/simple;
	bh=baK6jno6CnUVkoUHnmEbtLiQyefylSMvn3JT1bVnQnQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LgPi4sp234ay9KPamRGgYfByST7YHDaHXMnWVTBE4qSML7MbnfAL4Eb13SbPRxoOnX8IMgv2eILXYR6ufZDexjhQnp3jKHV41xzzR+3kp3QM4C1NXofUa2+lEjAWPmK3JnnhymfNc1d4L0SXJ7kjZxuGfM2RCN3DBl6TzqMfLJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZzPs8XHl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53TAJNeP006055
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Apr 2025 12:11:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rPfDc2j4zIQ8zpqodkBZ1iAk
	HQ4HDml1Yp0gv+Nadas=; b=ZzPs8XHlsSBUiBDfKYd0oHV2su9LS+ytFBkNoqVG
	bYxayKJka7L8CEF+zZBzwkBZrVtHs+5HoJlnjR89+8/pXRRb00kgKWlMQblCjceL
	iF+AMIARq6cARt+S+DtW2UgGAjW+F6xcZJoByZnrztocArqJrDf7PT0FkEd7JmRy
	4Ww4RbEG35i9C979Q2b9CFZ6S2+w2zX7PdrjNmn6b+dwAoSttiXBY6fuNyFxo7R2
	WtXpCCJw9J7othlkqxEmZvRyevu5rWkscV6Aec7KQEVCZ0cw2cgXZWEP1ZKu/cN/
	VZIz8Zx2rUZwHYem/pxYIFJVjyUXQ+He6bu3T4x9wC81dw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468ptmmff3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Apr 2025 12:11:42 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c793d573b2so1168267885a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Apr 2025 05:11:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745928702; x=1746533502;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rPfDc2j4zIQ8zpqodkBZ1iAkHQ4HDml1Yp0gv+Nadas=;
        b=ZBJDHED/0Ei7fIdF44wynfkEanO/VZQ3Nluo6TFJf+Uc2FBwoVZLdCub8pkkXMPw95
         n9dLvcODTqdlEjJn4UTn/1Ip8biGYe/70D297zAMjMcXozLzGSmrIT5FC8m/JRwUfJVN
         5+NTazO7pcXkuXRnOlIFQn7C4sORdBw90+oopOhZL63A3OAd4dwrWak7oJ4sR5ci9tiM
         h7l8k3NckozOt78NfAkDS0/UVDsehZZ2YHONAZFdf0xtS9B6M/gMS6eWahviJgMxA2Pv
         mDt6iCY2YrUG9kx1JGaq1WAPsMdrfd0umH6hAM+i6PL1aQQFVwTicb4IBnOO1BSo7o+y
         tW6A==
X-Forwarded-Encrypted: i=1; AJvYcCXCje2VYzaQabBG0iDIMU8OwFmHGgMHK4X9rq4u7Cr3p/wllAvBphjMXe9aVP4Op1p5BHklJ9Wbziqes8dj@vger.kernel.org
X-Gm-Message-State: AOJu0YxVOZdQX+KyeowhgkarfQcFkakCXwahc3lNmZU9ccVkdsTN2IxR
	BnKwoY1abfRORyIm4R5OsM+/cetV+Q/Vt235a4V/XWQI+nwU5GxcGj/2hCPmwBesxxs/89cmrFY
	JHNgKl65zXtkPT5kIRMO0Vj2KecLy521/rMQJWSEzSS2snfHGuzSgIMi+ox7avpeW+sqPCU/P
X-Gm-Gg: ASbGnct0lK0ebXrMXXS07o7ZkI8TuBfoNRyl8kgEYDjy95R9HXftUQTb4Wfbnsl1HfH
	9/7ERpMfpldXekytrOLHaR3FlIkvf5QsXXYlln1K+gvfeFbiA8Kk9VHa4hdiCtXmS6W3t1ndFoQ
	IXQzLpPIau5BosIj0zDV0p0xcHdoCTb8wvNgeof96Ctxib8hunbGpkWs2rTO4Hz0NqEnZ0QyHnb
	dNCbOR6/ZgtUn815J3barQYTYTP3xC6JeSyxlSvb61AkryU5K65DazmGsP8X1lvHw/SW/lqon2y
	xH4BVqvtSG5cpYAqS3LzFYa+iGmylncLCnccI0py+EOZy5LvMe4NJglmjoCKJIuy2qvrYRWHc/I
	=
X-Received: by 2002:a05:620a:d8b:b0:7c5:f6be:bdae with SMTP id af79cd13be357-7cabe6a77e8mr347149185a.20.1745928701715;
        Tue, 29 Apr 2025 05:11:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGkEoObvl5ITpCCRC9WTTdJ8+eec2qadspvMIHzjKAj6kGxUV25FPfPKOPPn0iY6tiCGewDRg==
X-Received: by 2002:a05:620a:d8b:b0:7c5:f6be:bdae with SMTP id af79cd13be357-7cabe6a77e8mr347145285a.20.1745928701382;
        Tue, 29 Apr 2025 05:11:41 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cb26dcdsm1855850e87.33.2025.04.29.05.11.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 05:11:40 -0700 (PDT)
Date: Tue, 29 Apr 2025 15:11:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <quic_sibis@quicinc.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Xilin Wu <wuxilin123@gmail.com>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Srinivas Kandagatla <srini@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Konrad Dybcio <quic_kdybcio@quicinc.com>
Subject: Re: [PATCH 0/7] arm64: dts: qcom: x1e80100-*: Drop useless DP3
 compatible override
Message-ID: <oxckk4kizbml7dy4uvcb2hhkl4f72dp5axmtkwhk4duevhlpbs@4pi3roor6pp4>
References: <20250429-x1e80100-dts-drop-useless-dp-compatible-override-v1-0-058847814d70@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250429-x1e80100-dts-drop-useless-dp-compatible-override-v1-0-058847814d70@linaro.org>
X-Proofpoint-ORIG-GUID: W7nWdVNcWOEpv_hO3RzwoQQbAPPSgxXZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDA5MSBTYWx0ZWRfX75eoaucBhHFr FpRNr71uou7+gfOMOTLvBN8ANX/O1uVSfYu5SPZ6MRhK3JQ4Eemx0d/baGnwa7NhoW1/c2lcB6P 6LlQWrSOR2M7Svoy55+um+vhEK21w/pFON6OOR1AmJLzcLPdYhJ35twDE1TwJtNrxQ9iwVA6q5G
 6WvkTabRG1io/Xd+XIP9aQZ7SOqtVVW0IIa4frTB2kW7iYWCoYAVzOgB12UUTEI+X9M5Ap0Gd2B ZE/z92pAM7qwaaJ9bbCI6IeSsQsp/T3Im4RcissQb0OGkqgKKls45c6FE3g2uJjTNBaHsmkUbTU gHc0bEHbdPLhR+iyLd+5yOvdRJB8fZqwryQD4DwDHykMlclVB5nnL/1nH4gApMiPXYLq2eablyG
 qEm9ft9hGxOn4F78YGhJEp4fIOWgVSh/yD3Vt05nc96NmKpVKHxVldy/ptn6I4ZGZWsClPMO
X-Proofpoint-GUID: W7nWdVNcWOEpv_hO3RzwoQQbAPPSgxXZ
X-Authority-Analysis: v=2.4 cv=DKWP4zNb c=1 sm=1 tr=0 ts=6810c1fe cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=L7NATBzoXS_OuuUMTpMA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_04,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=765 clxscore=1015
 priorityscore=1501 impostorscore=0 mlxscore=0 bulkscore=0 malwarescore=0
 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290091

On Tue, Apr 29, 2025 at 10:42:28AM +0300, Abel Vesa wrote:
> It all started with the support for CRD back when we had different
> compatibles for eDP and DP. Meanwhile, that has been sorted out and it
> is now figured out at runtime while using only the DP compatible.
> 
> It's almost funny how this got copied over from CRD and spread to all
> X Elite platforms.
> 
> TBH, the best reason to drop it ASAP is to make sure this doesn't spread
> beyond X Elite to newer platforms.
> 
> Functionally nothing changes.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
> Abel Vesa (7):
>       arm64: dts: qcom: x1e-crd: Drop useless DP3 compatible override
>       arm64: dts: acom: x1e80100-qcp: Drop useless DP3 compatible override
>       arm64: dts: qcom: x1e80100-t14s: Drop useless DP3 compatible override
>       arm64: dts: qcom: x1e80100-s15: Drop useless DP3 compatible override
>       arm64: dts: qcom: x1e80100-hp-x14: Drop useless DP3 compatible override
>       arm64: dts: qcom: x1e80100: Drop useless DP3 compatible override
>       arm64: dts: qcom: x1e80100-romulus: Drop useless DP3 compatible override

For the series:


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


> 
>  arch/arm64/boot/dts/qcom/x1-crd.dtsi                        | 1 -
>  arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi | 1 -
>  arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts     | 1 -
>  arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts       | 1 -
>  arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts    | 1 -
>  arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi    | 1 -
>  arch/arm64/boot/dts/qcom/x1e80100-qcp.dts                   | 1 -
>  7 files changed, 7 deletions(-)
> ---
> base-commit: 7e69ad9a1f7ba8554c4d3d1ccbffcccafcd45c2e
> change-id: 20250429-x1e80100-dts-drop-useless-dp-compatible-override-db8562c6b7cd
> 
> Best regards,
> -- 
> Abel Vesa <abel.vesa@linaro.org>
> 

-- 
With best wishes
Dmitry

