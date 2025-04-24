Return-Path: <linux-arm-msm+bounces-55350-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 38241A9A89F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 11:45:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 27BCA1B858A8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 09:45:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34DC023816A;
	Thu, 24 Apr 2025 09:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hp8m0nAX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A7CC22172A
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 09:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745487467; cv=none; b=kkMMTbEt8lVKnm2HQbxJFXpIiuZMH4nUDxHOJOZTsmGGFiQNOGk2z6qxI80R4VyT29siUcxivzsI30I9dS/ILdVD16jUVqWv/w5ixDcAJXR47ERIlAPDE+ZU5he1zFeSNWrcSJju7DZHO1p5h1M0t4e+FhPtETzl2jzz+AcuAbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745487467; c=relaxed/simple;
	bh=US2PVtNLZaFkAuVXr5SpyazmZmP4+ZVR7PKcZZegtjY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ClcQTHHDmfsl54upRFLcyD3pH9Rmej0I5l9QwhHi4wAnoUIOUN3nvyNaGj/jyWCTNQZYvRzN1vnyZ+h2ruD4dUdtiQNYiVZEhHfrr3eKus2FXOfAgtZQpCbFwqENsVtoa1dfwzdW2iZVaxaoVbOWB6PvRuUvQNSB3MSjA9oe96E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hp8m0nAX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O0F82C010284
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 09:37:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DgOyK6Aj8y9bqEdW8CqXJdRw
	Zh5pW+vbS8PbU9FROaw=; b=hp8m0nAXnk4d4G02FKP6jguqp+UJUzC/82qow50d
	0L7MigqO8ITXrjG01Ox7yDCBSQMzPp6l8v3ZvSHeEqTiTX0L0jBwionjBfVRlCqZ
	sUwSw8jI5DLKU5IkJI/q4VZXIKW7BaVSbVObrfeAS8ZdP6oUnaM9W02ZgE2NA5pl
	GqOXFCdp1mmQ9J/Oziptyfj041KAOufp1hFq6dY8nshF5y/x4/efekkiqUbGLv7z
	BNVnAYRw4+WgrXvhPsJ2pmkkEdS6g+WlgyIzOuYO9oKFtI2AuThDuFWms17ecRwx
	1BnG3atS1yT9goBfnBj/5LnBzmk9UTOpkSk0bg8hiIRZDA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3n0j7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 09:37:44 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-47ae87b5182so14588731cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 02:37:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745487463; x=1746092263;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DgOyK6Aj8y9bqEdW8CqXJdRwZh5pW+vbS8PbU9FROaw=;
        b=J/Hr0ZSNrbLzNcwpf4Rj+ERQlNjyhoULqUtZhlsKmGH3/BkrHGrOXiZZS06bkSuB//
         0BB7LrBipX84+iy2jSGaDySHjhwCU6MAIPmLJ8gv0IJJJ7uFHTTTqqCc1n6MZgaJZaj6
         RLNUhDz9+0LlklAQ/XU2bUKybgqM/YrfUaFUo67yWxc4fmqsL26qSvog4UM9r7/aJacj
         HsP+ksx1nOIuHdwODhGsCDk1bW6gnsBpqFT2t2foSH5Sf8CfZbS9FsJwTqfDoPDYshAf
         b8k5oQS9qyiApJRUcBtkQEe2eUUZ0hxnAMZUTMGX7gfgGN5h18KOeVlW7mOaH1CCrxpg
         hzDQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+6MCFFGRaUYEy7h7rNMjpegx3I4kX7FIVfwA8JEnbbkQIgg/3jDgvUlzXdJIXgw4SJfz5zB8OAYgqGv18@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5ZCDRoD3U2a/TLsNPwyx4AuqEGCyfHAuMXrUhoW/TpNNT7/UP
	Y+4uhCTUHFHi9tpd5NAtd+PsdEH5wVhDGPESbMLJBSMiqDqFjZm4ggkzh+pdV3k1dB8b39wxHWt
	SRI3bF2EdqsskJx7Fwe02RM+m410DZLRipBNP7ABj9zRKJR00/r1A7HRf79sZYO6V
X-Gm-Gg: ASbGncviJfJyyUz+2z5a6oHeS4SXfHu1IlV0zb32k04NDdM5QMryB6rIbs3ZN/bTYBU
	A9iwWk/m1TfsNwyFpjovpFEqbBL5AsjyFAgShg9lab7l4RcVkOrvU8Yf59gCJpB4OuzAcAClv/x
	y8hM2mVRQKtjpdGzjqrJlztYKfv2qrgdU1EsJd0Ml2f59+G2E4VeAM5Rf2tz2am/fHRGMF2Z351
	TxVRVMo2wB1Zaj62BbqQbFrnDPh/iw9rLA6udD+ewWXMG8pW4l6lX+XCOdVp7LIsardeMG3vquW
	n2j3VkX/E5UBpj6f7MvDpsjjDPxSku40J0o1dOA9TyAFj/HeWWOJtWMHYYSAfeWdTAcS2c2NPtI
	=
X-Received: by 2002:ac8:7e92:0:b0:476:850a:5b34 with SMTP id d75a77b69052e-47eb33a7730mr30466831cf.30.1745487463412;
        Thu, 24 Apr 2025 02:37:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE1eEvXAeDIBJ+oaIV6NuXCx1ty2W8MF/z7TiaW3cFjO6fXs6cgqkeV3Jv4TZtIDAyz/pl37w==
X-Received: by 2002:ac8:7e92:0:b0:476:850a:5b34 with SMTP id d75a77b69052e-47eb33a7730mr30466451cf.30.1745487462999;
        Thu, 24 Apr 2025 02:37:42 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cc9ea4asm166075e87.149.2025.04.24.02.37.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 02:37:41 -0700 (PDT)
Date: Thu, 24 Apr 2025 12:37:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Melody Olvera <melody.olvera@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 04/10] phy: qcom: qmp-combo: Add new PHY sequences for
 SM8750
Message-ID: <ayfgkx7ep3pglzydno3waipm4xqcbuj4v4go7tvm5j3hu7mswr@ceqbynkuidcb>
References: <20250421-sm8750_usb_master-v5-0-25c79ed01d02@oss.qualcomm.com>
 <20250421-sm8750_usb_master-v5-4-25c79ed01d02@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250421-sm8750_usb_master-v5-4-25c79ed01d02@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: kTa6sohxou7xSay4h1U3sGBfh4x_2psi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA2MyBTYWx0ZWRfX48mRnAdCRId8 s4qW60hRO4Kzqsc6zSurzNpEeabCZXg5z5kuBBsFjgHrhu6g++xv7gDF2THbqiGTFnoVVNZlxeH OocfBfsTN1OJzoVhGC8iPjYFU1lsjHl2MNEtVwSt4X1xuTDpgMO0Ta4TAQHdLzuo0VPGuUvYmQB
 MTqAEND9YqmnY3YW6pC6LmHSnvrlQ1ISmQsiZflT3ZymYivOPzeirAEhvrxu1XvP3EnlCVGNR/m tI8uMlWk91zVbxVPMnLn4vCvUcYHXRTGtMJNJRnftPR/XqASdgsp6jhU49HoydAbVMRAHKk0IBp JluY/wXH7m97ZpZzjl5EPBwPYw2bD6P1+b3bpQaWd/RMcFlwhJDyaTnDVtGqopAzfYvt5CZrckH
 tDLroKoO7DCWuZ+5A4xC4Nt+dcV7FbHPmFR7VAimSJRNrZVZopk9SBUyisNzmHmvGH+gLN6R
X-Authority-Analysis: v=2.4 cv=ELgG00ZC c=1 sm=1 tr=0 ts=680a0668 cx=c_pps a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=9yGODh8E-QI5J-fucZYA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: kTa6sohxou7xSay4h1U3sGBfh4x_2psi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_04,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 phishscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 mlxlogscore=855 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240063

On Mon, Apr 21, 2025 at 03:00:11PM -0700, Melody Olvera wrote:
> From: Wesley Cheng <quic_wcheng@quicinc.com>
> 
> Add new register offsets and PHY values for SM8750. Some of the previous
> definitions can be leveraged from older PHY versions as offsets within
> registers have not changed. This also updates the PHY sequence that is
> recommended after running hardware characterization.

What is updated? I see only additions.

> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> Signed-off-by: Melody Olvera <melody.olvera@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c          | 221 +++++++++++++++++++++
>  drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v8.h     |  38 ++++
>  drivers/phy/qualcomm/phy-qcom-qmp-pcs-v8.h         |  32 +++
>  drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v8.h |  64 ++++++
>  .../phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v8.h    |  68 +++++++
>  drivers/phy/qualcomm/phy-qcom-qmp.h                |   5 +
>  6 files changed, 428 insertions(+)
> 

-- 
With best wishes
Dmitry

