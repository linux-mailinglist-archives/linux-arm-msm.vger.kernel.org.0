Return-Path: <linux-arm-msm+bounces-75950-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0336FBB837D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Oct 2025 23:35:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 7AEDA348D71
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Oct 2025 21:35:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB25A25F7A7;
	Fri,  3 Oct 2025 21:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZZrHut1k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15E2D267B12
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Oct 2025 21:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759527318; cv=none; b=GA07TgRr3lDEcJ2wVhY0x0Vajh7gRLKuCxGkBta+zDlLPZntSGwmceB2bB31lZuKJ9LQhayxP/3bL/kw6jZAIsOPAsFnh9TdNJw7MZR1S9bUU7mg42bqAXefaw4jniOmay9mqCeffF4QxMoJ1Zj6YJoEmXfv+pnl4Nd11Vc4uEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759527318; c=relaxed/simple;
	bh=DnrF73u6uMcE7A0hMfqbDRM6WB4hE4mM5ce2ULK284s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i1dB9hs/qbJN+LDU4v4g5g/vMEaCZ4bM0etZQPFDmhfOzRmUWZus/x0CfccbvxyQZtxWBMLMKiA2jmuITfZfsB6jymDZXLielux6r4vOtvHWl85iufarMRezy9F7/NjZ45j9LiL90vg0tB8xzJjQCM+z79qwSjD24IPaHKyLXLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZZrHut1k; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 593AM0Ep022671
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Oct 2025 21:35:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LpI/7yRJpPkrv000URxHAeRb
	Qcf7cqEUhbfJVAFL+wI=; b=ZZrHut1kRLXUxPCNTSP2FckZ0jQQGQkQpJBrO813
	3B0FN7Uz1SxNlMBo2cvdJOujhsIlXSs9D6xTusN275IoAV3FdE/GhNcl0QPoMrhE
	ADR2NicnCOBBnv0w629S75dger0Z8aNyUoZBZxEEr+Bx92oZ9hseSBvNE3Lz66hx
	0DGrgEjaljUqebpriYAcN08kftzfHkDp27fXYODp0emOPs5P8+PgvpPeHGqmuN+M
	s86/5PQQcx1apuQOkfcWy9qmzQ1gwdFP+LqS20o27jIGTg6py4PnrT5aDhegNKZv
	mD0STJqX2gdjb12+H53dHhmgyI0vINh1oswYyMJL2f2rmQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e59nccg7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Oct 2025 21:35:16 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4df80d0d4aaso18766401cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Oct 2025 14:35:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759527306; x=1760132106;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LpI/7yRJpPkrv000URxHAeRbQcf7cqEUhbfJVAFL+wI=;
        b=HG3ytVGvdd3etO5Pf847JZB7B1ojGKNSHbiyzlF+iAkW0CNaSH1+ITwTGmcNJC0zxt
         txs1PBRAeFT0zTKC6s8LGVohscDltzsz3ZHYlVvGZlvYUu3KJMX+A0+cMxTSxAk5r51d
         6tiv86AfzIAI0uXEsJZ1efEqPGuC5JPa4O6i1vGOzehpnh1kaV18TUwAeW4zFweXlpe3
         cQpDK6tY2UvPhzRuffwxQmJte5Z9vkrG+fzic4XHrZDds7ekr0w5o+b1k8e6OJV7gc9M
         VH6p0jdPOYgPC67D9ruRY+qNpW3yXhvDg/AAlkq9Xkzj4cAqYZaKvQadBOpUB75kug6c
         BnfQ==
X-Forwarded-Encrypted: i=1; AJvYcCVsCvU+8594d4OYepXkpaLeVDPGlULYlzU3sGgi5OQYaxl7Tvf5in+9hGZnjH9NZtYS4AOElFwI5E3FNUvD@vger.kernel.org
X-Gm-Message-State: AOJu0YxotNDiVo1/+e1kIdtWXYl2HKyXY56eLqaNbGzmmqqtPEPbmYcv
	E31HgEIQY24RXlyB6R87Qx68gL6vk4r/iby0hL0/DAp6uT48UBm/2rIArZyjkmefA8Hlg47Zpje
	Bx2RSQ3ty8I0eicrLnd0st86qaRovcApvUuLO2KifoEkK3vUPZKEnEYn+5X/IaC1u+NLgKu4ovn
	j8
X-Gm-Gg: ASbGncsnxQKwqHVSQvw1OybhrxOFTw7pzGFp2pDiocofOdSuYTCuW5Yd0JDZTHpIxjI
	Ni23xpyVOGcfQEaOUsIJr5vbNnY2o+aZCOhRImqkPFtK0wDXGqMpw92NqG3BRBGfe+WgbUPaANx
	u4xvH/Ofds9H8+a4wWKGfX0b2t5TW0M+TDxf9KSdsiqH+Z0m/4iwPn1W6qUTw8n9SfR+dTD9JCf
	hMYVgdAA/jID6tFlYS5ikPivx4+7thZBbwCm4Wo9+w81a+WSqB0IcJSBDb5ksTtynw9S6381TxN
	iYKzx8fqBX+5PKvdOtZkIj8NeYpJPhiIxuomshLusnxOZvZqVTmeIt4J0FOVJ7cfJ0b/VVF4D0V
	Vo89f1cbhjwfrDXFC+LNQ9fjmzpNwMYMPfnh0mxT+E6Zm5CZcW465pyR8iA==
X-Received: by 2002:a05:622a:590a:b0:4b7:983b:b70c with SMTP id d75a77b69052e-4e576b1514emr67212641cf.67.1759527306046;
        Fri, 03 Oct 2025 14:35:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEOVVXTCFK0bJqYHUQeg2fOzIn1NMy0zPMk/luomgQCk++Xf/E/5Va5+hVQu2xGh6/6fUAjEg==
X-Received: by 2002:a05:622a:590a:b0:4b7:983b:b70c with SMTP id d75a77b69052e-4e576b1514emr67212161cf.67.1759527305386;
        Fri, 03 Oct 2025 14:35:05 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b0113ed8dsm2191806e87.44.2025.10.03.14.35.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 14:35:03 -0700 (PDT)
Date: Sat, 4 Oct 2025 00:35:01 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Paul Sajna <sajattack@postmarketos.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Amir Dahan <system64fumo@protonmail.com>,
        Christopher Brown <crispybrown@gmail.com>
Subject: Re: [PATCH v3 02/11] arm64: dts: qcom: sdm845-lg-common: Add uarts
 and Bluetooth
Message-ID: <6zfmjxpnruh3njx5ts2f7h6zsegvks52izchzj2jaciprdvnly@nnyvivpmehkh>
References: <20250928-judyln-dts-v3-0-b14cf9e9a928@postmarketos.org>
 <20250928-judyln-dts-v3-2-b14cf9e9a928@postmarketos.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250928-judyln-dts-v3-2-b14cf9e9a928@postmarketos.org>
X-Proofpoint-GUID: ff-qX-BCGJgcQhV1OZRS9CKAuV7KULUs
X-Authority-Analysis: v=2.4 cv=O4g0fR9W c=1 sm=1 tr=0 ts=68e04194 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=Mq719mGqAAAA:8 a=Gbw9aFdXAAAA:8 a=CXzs4G_5OfBr_OUmaxkA:9
 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=gOTWM5O2Sh7P_NUuVqe5:22
 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-ORIG-GUID: ff-qX-BCGJgcQhV1OZRS9CKAuV7KULUs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAwMSBTYWx0ZWRfX6bS+bjA+mYFF
 Fg+bm+gcwZ0gHhOjwO+tb83nj4dBZyO2aGz6HgjzFj2kehoRsy0bGHUS6Ti730Md1UTRZ9mJwny
 oWCVH8ApH/pBQ8ICHMkctqxqvrM3O9h9ytncEi2f8I6wzcd+Un/xq0xCzqGTi0T9zTfevM3EylA
 BDEpEpiSksALrUzYRmgMWiTKCoP3LiTXEFZY9u2CYILFDLpZkp0L9I9KjLQmjQ1lo6RRGgd8pZE
 oLR+Z9/ENVQHV+i1klRQwl9ZhfJXqSo5xq0MHsXKWyEw3AXLqbXpKjrNGkNRUukP0E4oDuoT/we
 +qFzX59q0xHJRiD2tF9f0RrJPpFY1xZAhkJ9YhSBp3LCe3oWDJkUjRHDnBTRD3nPhUHstYiDeBI
 fmAan3AdC/+p6iQWCfovbXYQH67E0A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-03_07,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 spamscore=0 impostorscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270001

On Sun, Sep 28, 2025 at 10:05:25PM -0700, Paul Sajna wrote:
> uart9 is debug serial on USB SBU1/2
> 
> UART RX is SBU1 and UART TX is SBU2 of the USB-C port).
> 1.8V Logic Level
> Tested using pololu usb07a https://www.pololu.com/product/2585
> and CH340 USB-UART
> 
> uart6 is bluetooth
> 
> Add bluetooth firmware path
> 
> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 45 ++++++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts  |  8 +++++
>  2 files changed, 53 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
> index 82d6543835324ed92300c4ed24c51f4b79321f99..4c631df56f262ba9e730f6720abd94d374b14692 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
> @@ -27,10 +27,17 @@
>  /delete-node/ &wlan_msa_mem;
>  
>  / {
> +	aliases {
> +		serial0 = &uart9;
> +		serial1 = &uart6;
> +	};
> +
>  	chosen {
>  		#address-cells = <2>;
>  		#size-cells = <2>;
>  		ranges;
> +
> +		stdout-path = "serial0:115200n8";
>  	};
>  
>  	reserved-memory {
> @@ -595,3 +602,41 @@ &usb_1_qmpphy {
>  
>  	status = "okay";
>  };
> +
> +&qupv3_id_0 {

Hmm, I r-b'd the patch, but I was too quick. Please keep the nodes
sorted. qupv3 comes before usb (and maybe before some other nodes).

> +	status = "okay";
> +};
> +
-- 
With best wishes
Dmitry

