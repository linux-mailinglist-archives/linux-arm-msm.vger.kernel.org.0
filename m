Return-Path: <linux-arm-msm+bounces-106698-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id td0YGgXx/WlxlAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106698-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 16:19:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A654F7A00
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 16:19:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E4187300FCD0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2026 14:19:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1F501397;
	Fri,  8 May 2026 14:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EKjHyIYI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VT3h5z6T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A87253ED11F
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2026 14:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778249981; cv=none; b=Wu0Un+bPo5pfQwfvAw19YPqEINV4B7CCGSvepPas0EF19fWX0y2UZS+qIltqGQTFqrgxAtAXSG5aqZ40Jik2PT5PGvbDsJE80EGJW1zpKgCRtn9AzNhf3yXJ6W/Rvxic8LigYtCFpTW84jJH8K6qHDFLfnb58h0FsVQvsCpRUH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778249981; c=relaxed/simple;
	bh=IwXMW0qh9NvCeGP2d+pD/AWSCBQ787imGla0vNKaSD4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DtnDhixUL2t+TMlGMaJmwxXrghW9Wb/dUtdAWHPLYVLWmytaxETDz/mRAnx5xGuHe3xEaSztCyt/M5zu+6MNo7p0E3ceDUe0Q/WJ2/yunIBraNJm6QezBJYFx0maj2Iaiv8h/BItD4j6BwmOPcZKcKq8yFOiDeS/MqhgVcqMUq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EKjHyIYI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VT3h5z6T; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 648D9xFJ3891064
	for <linux-arm-msm@vger.kernel.org>; Fri, 8 May 2026 14:19:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ThaOuhJSP60Br/1921KJPnOErIdEj/peiE0Jh3ulHIw=; b=EKjHyIYIncXwxbCa
	rctxJ04W1wqVLB/mfQNg9KpAWGW0Dd2w9FNsLHE6NEK9OKw38PsBy3Vlf1DRVw/b
	u1UCeHr3lM5JAqkqSgP2c8MvHiiNlOtuFhMXFsdlhh31h2Q5YXPwarWckulEuwY8
	65o+oxZHUdwKgZAB79nat7edluotzNNWVdDpeySNX8HK2UL1XEi/8+cIxrk0vyEt
	xuqEuuEARB12jGzCZy2nvq2OuGukbqdIbplFqxM7IstfWgE/uDcZLugS2N6KcVNi
	B1vcr/Wurraqj1r5ELYr14+JWLS8po+6kw+4HuznupttiNjrWg1JLTtIGqGbray5
	Qe0ozQ==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1gfqrc41-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 14:19:39 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5751eff95d6so191987e0c.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 07:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778249979; x=1778854779; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ThaOuhJSP60Br/1921KJPnOErIdEj/peiE0Jh3ulHIw=;
        b=VT3h5z6T3clbETDlz76i1yLXo9t21UMnBgxtfokXtVV2foPRKFiFFPVRDJBnmj01k8
         eJ2UmQWl+MTpycM4BBFibVz90+GRua9TpigEW7Ib+nZb0tyzlLfuLZqGax4JCMn4kC8J
         vM0jHgAQEOGbrxAga+9LjGiu5zgJoIE/52jtvojCBLc54KiCkIxZcalYRAnd0xEBAThQ
         1hGXBFLwN/B6wVrPM75L+e5SF96dKUoaTyIEYO57odUnVzJle1bpKcPU5fXJ3SYOsX4l
         XdQt+0WVP9S+OCg5YudAon2Fm0enjnufoCHVeo3sRnE/GyhAg0wNoaqFx8+J28nKvn9m
         DuBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778249979; x=1778854779;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ThaOuhJSP60Br/1921KJPnOErIdEj/peiE0Jh3ulHIw=;
        b=i3Al2ze/+Synp1sSBfqu33nBqF0tfHel5uOZaEQqF3XLT/wUmClEno45qub9c1/euP
         GR1sqzOt0cqvhpm/F3gSs6hX2f5KpaeVeQH942zl6SP/4K5Z88c6m5FeeJBw1dVtyPBz
         E3LjfIT65sWDqJapOmhucUcEIYqbaey5ZGA+4jj41JXD3/6V6bwpLeZsDkEIDXlNtZAm
         xQTrYOwiYclVkZet3k48VLWGGqn0YI7L+ELEljPaZYwpj9xfKgISOjD89jXwJYBHSwDJ
         QPPvAOMaWV921U2U4mKysRrhxxB49U49rcwq3wMfRqI7qqj95a4FDnrkxyIxj0hD2kDg
         Fikg==
X-Gm-Message-State: AOJu0YwMDMRhUd6CO4ocLFA84PkOHmZhk0EsrBj8aWbgAXNJ7UyHGraL
	1SVVGdbBuEn76gZUoOHT0pzQVFhUnJAbwLwoSxi4zSwgoXOOvNf/iwVo4cNLQaLhbUwYLaWyEUb
	m87J6oKBVOZryzngLrn6gfJHkUOIDWy/RNHAItxYxiH5y0+OBGRwQN9etSPgjbe5DxXL6
X-Gm-Gg: Acq92OElxjB1+dgETT86umThHvNtkyoP951dX5XkDEX7d5gkX8je2MF9MEoPARQTBpo
	gUwRa0Wb+URDC1cfRvM9GCvzX6xcvmMmd1/5+ryQIM/Zc7aQPCwrBeZ7OW9vsFMSCmt/cQPI6Fh
	MkPwZAzRNbWVNcIvcHDc739XoCGv6UlReqpjbP0q7OPvf/W3Wt+6+wQBZEz/ojFM93BYstD98ls
	xABbKbNGqrtSX7mdIHURMd1yKJ2gLkB089VSFxd1K0KLQ37Tqw4HOsBr1iWACf4qZUqTlXQ157Z
	TOR3sDf2VDBVfq8PZWx1xFm+j0iof7sCKd157OU7p43EeaePkXDtEMcluMKDbtfHXTDUL//X5F/
	3tAd1GGo89QPYBl2ZGcE7/sz8ZcZUO9HM+ZlJG2Lb5lALCzybI83iKOQLgjgSBH/j5+UKrWN+jn
	JAnNE=
X-Received: by 2002:a05:6122:6810:10b0:56f:ba80:5675 with SMTP id 71dfb90a1353d-5755b435e5amr2404249e0c.2.1778249978745;
        Fri, 08 May 2026 07:19:38 -0700 (PDT)
X-Received: by 2002:a05:6122:6810:10b0:56f:ba80:5675 with SMTP id 71dfb90a1353d-5755b435e5amr2404234e0c.2.1778249978276;
        Fri, 08 May 2026 07:19:38 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bcac4359ea4sm84735766b.50.2026.05.08.07.19.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2026 07:19:37 -0700 (PDT)
Message-ID: <256cb012-9e5b-4660-bdb5-6c58f4403c4d@oss.qualcomm.com>
Date: Fri, 8 May 2026 16:19:35 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sc8280xp: Mark FastRPC context banks as
 dma-coherent
To: Xilin Wu <sophon@radxa.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260507-sc8280xp-fastrpc-dma-coherent-v1-1-e92aed797865@radxa.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260507-sc8280xp-fastrpc-dma-coherent-v1-1-e92aed797865@radxa.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDE0MiBTYWx0ZWRfX2OpOJgtSDFD3
 AHiKACpVnn5xTRpj34MvjP8ArvODsCV1PoMZZh0Vq2AshcCLpG3DpC9TgKSabg9Q5lERR7EQh8X
 6XnguKhqRoCzvZeNSbJ5wpRu19pXo/Kd2CkogTDOu/ZotZL+BuyefHZTdra21qa7zdaSXBnJg+F
 dThcHNTf7y5cGTV4OL+wLtoRhEDjBm6xP0N1dg0ac7k/JrHHDgH5GFvlFCAxw+cJQcuw5hMOSU/
 7W21Gi6nva9XnaCPr7fFiCOozGhZp2xC76CwMO7/7xI4ksnhyeDfnul8ghbyU0OgUOvCZe1fOue
 empe6zNCTKH1QLwSn16XivLP/3aNs68LQ0IWcCz+49zWNIJ/ZCQj+Eug4smQUytNl3ZtbV7KN7+
 sxW9tdJREkPsAiDJ7d5CdShXV5AIhuz6TsJFFCiBR2JGSeTjs1qdZKhXUtgCMfod8QIgTKxjFVr
 8iuwJyadXSzM0inqElQ==
X-Authority-Analysis: v=2.4 cv=W80IkxWk c=1 sm=1 tr=0 ts=69fdf0fb cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=ksxQWNrZAAAA:8 a=y7TbVxhv9jjjMkO9NuwA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-ORIG-GUID: sm-VtKx3rjN1KKla0Mzx4KKKcZo79vFN
X-Proofpoint-GUID: sm-VtKx3rjN1KKla0Mzx4KKKcZo79vFN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 spamscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080142
X-Rspamd-Queue-Id: 58A654F7A00
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[radxa.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106698-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/7/26 4:50 PM, Xilin Wu wrote:
> The FastRPC context banks are DMA-coherent on sc8280xp platform. Mark them
> as such.
> 
> This allows running AI applications on the CDSP using the Qualcomm AI
> Runtime (QAIRT) SDK on the sc8280xp platform.
> 
> Signed-off-by: Xilin Wu <sophon@radxa.com>
> ---

Did you test it with/without this patch?

Konrad

