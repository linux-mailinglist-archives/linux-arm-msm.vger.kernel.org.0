Return-Path: <linux-arm-msm+bounces-69045-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B79B1B253A0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 21:07:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DA64A1C8499A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 19:08:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E0012FFDCA;
	Wed, 13 Aug 2025 19:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G6uJk+M2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3DA223B63F
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 19:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755112069; cv=none; b=Kn94SxHThdEBfpnk3vM4QvXOehlo5KXt61LAwz+y57N3vEx9YfAlEkumVkpMFmjM99lpHKTi2N2hw4zzSAcPyRH1HT956xGaCjHzdyxzWg38nQBS+tS6+ACPbQ941dieSX0u1PIeqPCvyKgF+E8OeVPCGrBr/RkwIGdbgzVVbNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755112069; c=relaxed/simple;
	bh=WCbeaj9cuuf/zmyd2iAsdv+J8nh7PcnIVnjEAOvB+Fk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qxvQRaVREq/MkZHwKKY8UZvd/T0yxg9YrYVNyg7p1yZAmO0ZNsDQOX6MCaKO+wtJE7jwZcGCQxUSgLxi/rO/4DJ0S3t2Q5GNPdZ85YfXYi1aqg0rG8MgmPLr42BsWVrPEnuQPMIxj9KA5dNSoh8W0CrHOpJ4y2i1Jvha9E8TMxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G6uJk+M2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57DBLgaI027042
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 19:07:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lGgb5haUX0R28BdimfN03qfR
	bmNTvI4oS3VC1C2Vmak=; b=G6uJk+M2+jklEiWGmyrHG9f3JHdZAL2475YQTz0A
	4BY4SG/1M4kIhkW7r2TBSyTEgsqCLQY1HrXPp71DlQmaby8irvY0PQPu5Jh18iB6
	mOOjTzw6FaFDtL8Qvvmxnlk+EBtM7JbWmN90egOhu1oE/uGnQoXSCNKEC27Ulg6Z
	9hScyVdM2koCbJ+/X7hBxxrvTEu/zGvpPZY8QlYrENBdt+RnYebpJLc+qdcY0K/n
	s7/6IrViwUTFPI0wNJ3rzj+eFNhvJyNyRbIuEVM55rfud8tHq2yxaKPFhhktXHPK
	48HYH1W6uC/PI2sRDgc06KLnktx14CF8cIhMA6QtcPzuJQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ffhjrtvn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 19:07:46 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-70a9289280dso4771386d6.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 12:07:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755112066; x=1755716866;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lGgb5haUX0R28BdimfN03qfRbmNTvI4oS3VC1C2Vmak=;
        b=cdpZBWLHWu39PXUjnhxrNXkxGlwRceMVOI6yvdnYdW4Grhw000IAE2zQ9HYRYIny/A
         DDiMndBjLBqhQKr28AhXRQ2RKEpKAJv9UfCo0b/a1z+oyMOGh7O4yTsKiSNzfJMTuiLa
         HCAAQ2W0F3Tbu3FcV8jjVx63FoFxaYuVIEgGpF5yRv0WLeaHMmRAVXbjDma2IQth5Uak
         ap1TSxzgdzx8hEb0W5ulAtenKdD+WcX/ClQ1LLdezW0Emz9YlewfyURH7t9v3G1R9IbH
         gM+UaxX9ujRuqm+jjtjWqNJPwmF2wb1bEwo7/q6maMtP2v4suH+liTk9QjzvPZtWOfce
         eCvA==
X-Forwarded-Encrypted: i=1; AJvYcCWqoBjCJZH+4k3NOESZ7QF9D1BwlOt8ARZ5gEB/x/vf2HOkwoOz06pwQD9DYORYh3Lihr72yt0LGnZHCIEv@vger.kernel.org
X-Gm-Message-State: AOJu0YwQQPUBrlq4j65gcwASPlbfYYJAhh70gITAOifNJYEuWWf0xIMh
	G7TWNdnHLOeHsjZFXEkNauT30YBNhE0OrRkFlx6udluJkfLQN7HXCvU02G/qFwRet7DmOeWr9/P
	Mvqv6pFc0jk+srNGMSe2KOjZFBece358CzvzdYoecVpgnsyy0hFv0/3ElKbPUJf6criAl
X-Gm-Gg: ASbGncuGsKcnw6mmbJbGJHB2nUilffc//cQ9Jp4GnffLZOUMvKSrkOHTxkr4prIcqbZ
	rQFoRRH485WJd9ly0lxdsuSEm7+Ax9xCmu8WZid1cME46wDbcFKHgOlPFKqXuwXJquV3X50OB0k
	oDFdM0Ra7jiL4KfyruqMG45wjmhVcJOZaIqopidUerZKuZtZ0lSybcB/v6mo6wJd0FLdDaFpOuB
	w9i8fvn4a9iWt78KzxYOkqJlvwcQXrpRNtwyrJ6FHmrQvqvJ1yvq/4oR3Pk2NZzZ/mqeaVREgrn
	ndZTdEjxJmx2nyjZ3GpqKhWwJABosws8sq+A6XQMGH66OjA8CvaVa+AwxyUHZAdX+vLBAGwXGDU
	SHMpxeSwBoAwptLbPg2YIY+AgplcZj387zNOW5wmnDp8LOvemBJ7o
X-Received: by 2002:a05:6214:2245:b0:707:6364:792f with SMTP id 6a1803df08f44-70af5b8042amr5890026d6.11.1755112065912;
        Wed, 13 Aug 2025 12:07:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH5CH4F+MncTr6A3qh0Qne1j9KUeMdHfJ4BuHh47gTWxWDXbgOj4yyXBcS8NC2bzatyhL9TWg==
X-Received: by 2002:a05:6214:2245:b0:707:6364:792f with SMTP id 6a1803df08f44-70af5b8042amr5889626d6.11.1755112065427;
        Wed, 13 Aug 2025 12:07:45 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b889ad021sm5413158e87.74.2025.08.13.12.07.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 12:07:44 -0700 (PDT)
Date: Wed, 13 Aug 2025 22:07:42 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v2] arm64: dts: qcom: sm8750-mtp: Add WiFi and
 Bluetooth
Message-ID: <zwqjinjqzs7cdbsb2yduym6jx77kjqtyjcinvo3mqvavdj2trz@cmwm2nlynqlu>
References: <20250811131055.154233-2-krzysztof.kozlowski@linaro.org>
 <l6u4y3suv3dpylexbiiznhcuyanlc4ouizhzj2cchblaf6o4wg@fe4laxrioaj5>
 <481985cb-fa84-4b09-9b95-948ee70b557a@linaro.org>
 <k7mw7rj7cno3con2t57nps23y7evd3da6gahyl5gnrxss7e3s4@qncnuekxr7lb>
 <f7704cc1-95b4-4860-86ea-96ec18f61c8a@linaro.org>
 <ibitgekdjsktpvr6zmouuhgzcbfjfeuv4l4zsl6vszv4hauug5@one6zo6gdykb>
 <3239685a-97af-4d56-a0cc-984f26db5f76@linaro.org>
 <3jrs5gkxzjgrjmfbd65qr3uzblzzz5ae4apo5qwpxb63jm4i23@jzpaxp3dxais>
 <8fc497df-116e-4df2-a33f-bd71476ce065@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8fc497df-116e-4df2-a33f-bd71476ce065@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA3NCBTYWx0ZWRfX0WwI5B/iOwxQ
 CDcDus+3o6WyL7Vu+Qq3cz7X4a6WZUQr0NcGSTUFuZWutve2+vrK/+nY4xoHBwhiuwGbc6hOwKT
 NWEL6lSTnNFTOcL0q8HqL30sivm/L4YCNcGbcFeO9oNCmgVAaq6owBwRi2HtZtFN/GgXmdW1nIT
 MrEDBoCojq+KHBJ2t+Tj/QTaGnPSgAqViTUXmFLxZIChOX9SxccYvgQxYycehHiU+Esq8sZHKhR
 JcQWsEbxYIojUc+t5GfVXHos7PQBF69lo2Pkc+aoe3pSyv9EHZ4HDEb1qqMYBxTiQBS2EVdLHIj
 rtKx8ZEy94oh6eJqpDSKjUn2Lu3/KViR8wuzwDIBOTPLed7FsHOTkZdRS/HUNhUgx1BxQcMWkg1
 V/2yM9eK
X-Proofpoint-GUID: r2nYLbzcRWg-hafKrXM-D-5mOfju3kmh
X-Authority-Analysis: v=2.4 cv=TJFFS0la c=1 sm=1 tr=0 ts=689ce282 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=YsNNlNSR1bvWMWsHUq0A:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: r2nYLbzcRWg-hafKrXM-D-5mOfju3kmh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_01,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 clxscore=1015 spamscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508110074

On Wed, Aug 13, 2025 at 08:49:56PM +0200, Krzysztof Kozlowski wrote:
> On 12/08/2025 14:45, Dmitry Baryshkov wrote:
> > 
> >> Devices will be different, they will have different compatibles, thus
> >> you CANNOT have one DTS for both. What else - not my task, not my
> >> expertise, not relevant to this submission.
> > 
> > Them having different compatibles is exactly my question. It's not
> > obvious if they are compatible or not.
> 
> 
> So we talk about basics now... even if devices are compatible, they will
> have different "compatible" property, so your question about
> compatibility does not matter. They could be compatible or could be not.
> Different DTS in both cases, so this is just bikeschedding this patch.

Yes, we seem to be talking about the basics. Having hardware which is
compatible with another hardware released earlier.

I'll leave this to the maintainer's discretion.

> 
> > 
> > We've discussed this offline and I hope that the next iteration will
> > cover all these details.
> > 
> 
> 
> Best regards,
> Krzysztof

-- 
With best wishes
Dmitry

