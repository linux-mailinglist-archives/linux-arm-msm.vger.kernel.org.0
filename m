Return-Path: <linux-arm-msm+bounces-52057-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F00A6A0CB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Mar 2025 08:51:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3EDFA1895120
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Mar 2025 07:51:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE17C1F8737;
	Thu, 20 Mar 2025 07:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k0MLyUZJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 750AB1E2611
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Mar 2025 07:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742457058; cv=none; b=sgLvdVqmObnylyWBezfcLE+HpcvnIiJDA96uTa1qJVGIQsd+qxHYxWXDpuRDLrS/z7Iwf1bJSgZQKEB456fTdFBinTVxasJN8nGJevMULSVItGTPzM4fTlrP+yA5w2BvzNrG2qJbnpYQdfMMYfyTeWpnjkXfYfB6EVylGfv2beo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742457058; c=relaxed/simple;
	bh=BhpxnLkgH5xW6HlR7gOQbb754sAx11yyQrk3U7WpiIM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Km8lE7ZZlhk00y5JF2OFvAPkz2c9uoNQ/XtdmSaYL2ixapIDO+gVs9iHdON+R319XwW7jbEj7yhtXXJIxdDw3eyxtIMptR0WsN1VEJLlePKAbXW+R4YNZtUT18PUaBpqIrXe+ituNQ5JJEWOzid1bTyxepXc7dX64vUWDWufQRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k0MLyUZJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52K6Z1Rr014550
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Mar 2025 07:50:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Gu2816Jt4ReGPaLriIq4oPFm
	MPGW55e3kLoSVqwZcBs=; b=k0MLyUZJOv822aTPq2xgg2OwhZrRJxCw3+XAyPRr
	3Kt98IUrQ2FxbiTyCmhllWt/KtY33dRc1fwPQGdvswN3Crth3uQ7LQ6CJGYZspwi
	/Ha118fR6BJdL1h/uWzEMsO7PXQXdhvYEc7SFr0D9pcB18q27BKwPzCdBwcZp2Xf
	Yl/wwfb0Jh9RvD+EqIMkqOuY/l/RxypOpLT0VsvwVLjYUwRJE0Wf1S4jI7ddkp/t
	DCsfTqmQQ7bVbDoF3m4dstKw5GhqRIZmC169U5w8fxmPba6G1SWZvgP0Gq5VCo7x
	vJXlkC2t40fiohwngP8zs7x/N++ZauDcSuwgpjLC98M/aQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45exwtr7b7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Mar 2025 07:50:56 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c54e8ad9b3so253996985a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Mar 2025 00:50:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742457055; x=1743061855;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gu2816Jt4ReGPaLriIq4oPFmMPGW55e3kLoSVqwZcBs=;
        b=blW/Q0KnqUcUES64DcZ9/QSW20wZyBOqOTSwL6Vrlfn4tDU7XammghrZv1QUQ3wXH+
         z1guQzgdiGO7hIbS+xmQ5Jq3NNeRnvP4UZIqxy5Ym8dO8CYp4XSRux1u8BJFDU8FbjOp
         aAc9KzEvUyjbFZRcRY1LH1k0np4xbmsGwg//9XIAqki6rIoir47FKPA7BntMHtwZxMW7
         OPivd2FVWXxspwwnqEPSxvvtfrcCHb6xeC589vMMyqbukdlrgnXCA302K0WwcucM6T6I
         BbOi4OsvTn7iA1RrMfxzhUGr1N9hWVPn6x0qLcUAxWdsSkNZBt7d+h8WCnua8fhEYS0B
         XUNw==
X-Forwarded-Encrypted: i=1; AJvYcCXZrQNSrb4r7qnwWLutOrcwwaJTycKQ8LlzllgpLhcOKk+Y4orCJrec8G8xuSpcCEgiOmhQly5aNNPET7Fg@vger.kernel.org
X-Gm-Message-State: AOJu0Ywdkpv5EV8w3Jp4TEEJP5d1+Q9gOnPnkOEIHl3vvQSZ5v/qb06O
	z1c9ry9SpfShpF+HJosA8F6bRtTdUUTH2/ng1gOJnk+ixOsAAV3QaxTA19SjUxtl89EX6UDYzmQ
	83E8nhGINBeVbO9YiCfVzCdf8tC5BlTcvq3KwTSTyJAUO9MX5dEfU4jFWiPXr0xKo
X-Gm-Gg: ASbGncv/8wpf/Cy0QL34O4UytZ1v8+/X1g6iVhwWkGOXbcBKjgLZL4sqBsHWzAXZtXS
	eY9U4hH17YaihP3Ypa7r4IErvDl9XYrcl54EMtPOl7ecuSMn0tmm8PcATIVJQKfZhj3rC6BZtBT
	3GqpdwsXaDbn7lgUc3BwOvjv1qtIvKIFEHUamarm81VBNLeLXMemRpu3cxPVFF/FTPxQwKMoFWc
	UlyyLePHH7yGMX13fZeeZ5LETWkncqYRGcFMaJKVePkGOJAbZKn6cAyl19TYKAvNcOzm3V6QqXR
	dXtmxn8AREIdpcLtkwqneFnHb/N5sXBJ2peWLHtozCVy86XlVNKlsElXsUmgyyB+4r+jXIa2Mc1
	hCYk=
X-Received: by 2002:a05:620a:15b:b0:7c5:afc9:5144 with SMTP id af79cd13be357-7c5b055171cmr269771785a.23.1742457055537;
        Thu, 20 Mar 2025 00:50:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEu1vRPJVn5WHYsHx8Ll03Rl/WJrMi//xMYy3u3Rawd1CXYt0rpjvKqQwuOC6NKpUeYzg1IlQ==
X-Received: by 2002:a05:620a:15b:b0:7c5:afc9:5144 with SMTP id af79cd13be357-7c5b055171cmr269770485a.23.1742457055241;
        Thu, 20 Mar 2025 00:50:55 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549ba8a8d7dsm2128708e87.234.2025.03.20.00.50.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 00:50:53 -0700 (PDT)
Date: Thu, 20 Mar 2025 09:50:51 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ling Xu <quic_lxu5@quicinc.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org,
        srinivas.kandagatla@linaro.org, amahesh@qti.qualcomm.com,
        arnd@arndb.de, gregkh@linuxfoundation.org, quic_kuiw@quicinc.com,
        quic_ekangupt@quicinc.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sa8775p: add GPDSP
 fastrpc-compute-cb nodes
Message-ID: <uyjmsdhlqiuosmkrdmgltpimj5gfhrlp3an3glzh7gvmphjztn@5et56n4wfrnt>
References: <20250320051645.2254904-1-quic_lxu5@quicinc.com>
 <20250320051645.2254904-2-quic_lxu5@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250320051645.2254904-2-quic_lxu5@quicinc.com>
X-Proofpoint-GUID: PfE4Z5C3g_HWVX7FI1CR4tnn4OLoV1em
X-Proofpoint-ORIG-GUID: PfE4Z5C3g_HWVX7FI1CR4tnn4OLoV1em
X-Authority-Analysis: v=2.4 cv=UoJjN/wB c=1 sm=1 tr=0 ts=67dbc8e0 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=EE3GnvNe1S1ur2Q-TqUA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-20_02,2025-03-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=727
 phishscore=0 adultscore=0 clxscore=1015 spamscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503200045

On Thu, Mar 20, 2025 at 10:46:44AM +0530, Ling Xu wrote:
> Add GPDSP0 and GPDSP1 fastrpc compute-cb nodes for sa8775p SoC.
> 
> Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sa8775p.dtsi | 58 +++++++++++++++++++++++++++
>  1 file changed, 58 insertions(+)

It doesn't look like this patch has been tested for DT schema validity.

-- 
With best wishes
Dmitry

