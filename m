Return-Path: <linux-arm-msm+bounces-82921-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A1C5AC7BE4A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 23:44:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 6EBEC35AECA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 22:43:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FF082FFDD9;
	Fri, 21 Nov 2025 22:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m46Y2Qbr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SJUK4jS1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F33F296BA5
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 22:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763765030; cv=none; b=oKS27+yWDNE7Ob9WnAFpuZwSJlHKd8CdUgFs2uZERTpd7MSceT4qTcHvPe3mAAPj0bav9dplPCVTEeXGP3LDQZRMN6DvauA/u6ts+iMk/nDLCP+F1T5oZenBCQC+9ON2AHrgYWEwBfNWRxoqVoIMtfqzAWP/VD/IwGUOSODIFdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763765030; c=relaxed/simple;
	bh=0aNJNS0+9KQQ6Z22y7ewAEBnmghzZQ8wQq8sFpKgD/o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TfIQduuZJAUiE8chgrq6w2kOS43fQekzaaFrypr4VcWS3PNBeBIr4Gi69zn2r/qgDgBKwq6RFCt9uRfXHQRdyc/gv3p/73L0Ek3L99VRMrBC1gN7KfueEQkMT/qyja2HTNE+VCDUE/2QsVKy82Mm2HpRnvgPyaMBvmGFrSdJDrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m46Y2Qbr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SJUK4jS1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ALIGMob4023964
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 22:43:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=v76zapgO5bIdRvR0frt2ZimH
	yBAaD+3/mGyYC/gIUcI=; b=m46Y2QbrJ9S6ciuMSC263Wgh5jLjOE4jsDsp4kr1
	DGhaykTSTwQh8QtppqlEHhZOkJveQl5Wom5eZuQOwfiO27ZHwIeWFfEe+uVeSyPa
	6RfKciiJNdMs8YzCo9VE2Ig3AIvgKX6cEaQpzcbukJwXynfyZo9U060LHRu67toL
	+yeFH2BBIagkLln4WSjf564C8nBwJ2WcUyUQ9rZYyiDOsMIiveDPyTNee8MRJSxo
	ppJuzPMNw2vn5Svb00Klo7xcDOPF4sJBuTmNjNauG4Ywx5MQUYbZHJkqYcFch+8m
	iNzVOUMcwP4X+WOqQbhgcQzwKF3j2374hEMKxJfzaOHgdw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ajw7a0mam-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 22:43:48 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b2f0be2cf0so945359485a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 14:43:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763765027; x=1764369827; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=v76zapgO5bIdRvR0frt2ZimHyBAaD+3/mGyYC/gIUcI=;
        b=SJUK4jS1pcA+sYTFP+CmhN/raMBeTpbovoV8rXD1VYkz4C/heF51Dq3h0IpN4ZRvnq
         KBRegoKzDVJLOfI50p9VCESLTKoGVb5s+DePzrA3f4ZT3sCVCojOJU0gGcRmiPzirXeG
         19wFAh1yFSSZ7qADlCtoklT/XFxfBeqI5OaEsxgapDf7e0SJet0MI4ZekiDWBFBNYNMr
         HUvz9fq9RJUL5rcaIpQLjHm4c75oQ3vzrrm6YcofP2bNNE6MFYCs1iTVqaFzz++AfCGs
         Ffje0x+ViBynZUn8mOadcEt+fQhvfxoWeQXZWfTf/GwyyodZouviABXqnjnflYT4BJDy
         daDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763765027; x=1764369827;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v76zapgO5bIdRvR0frt2ZimHyBAaD+3/mGyYC/gIUcI=;
        b=uTr2ig0OqS3RuSmFKR7vJxxVzVhgEDbFpYxseriD9m5TNgDY60D4C6FSGfUQgzsF++
         eexF/Ajw3MZn7O98xlWrjt7AhEWZQReSAtxROiVNG371c78TwBY7ci+Rvf621SJM/Vmf
         FzLxYocvowiwgcxCJVTXWB5RJZOwet5SaypTUUPNzTcZLMINx0ge3a0AqtC62uAkLtaf
         ae1naUxsMn9nlmRlnEVMKMnmpl/+i+UpItQbkTwZm2MTM/Tl/MhXE2F1+UO+z/WM7rj5
         UOwU9r0HcJdPDVudyhetaR6wU2bdwUGHAkGBA03iPq7EVG7kTOhi98KExJTsDIaKIzph
         4HUA==
X-Forwarded-Encrypted: i=1; AJvYcCU0tVq3FkIYusPbdZjreXbpdPpCuMbg8Jqa3fhQ8BkwxMQCnFo9lunt9BuEpaDK5dteCx0vI9LreSC/rbTc@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4iTHLNhxYze/GU6MdLU1JjYIn7qK3hvkpiXHvW+zDWk0ynLuq
	91g+KWmJ9BcXYi8pnGg+8/ly7gnrGmvwhzJBN9axhMhx4w7jFah+3jSykEkMFc8QGDlDBc9xhjn
	SnymnnHvkbkApG/3bIF9mCS/HbbPREg+9/+4VCSZsJDdcFpWEZAEBVo4HrppF49hhSqKL
X-Gm-Gg: ASbGncv/n0ZDvVn4xhIqETMjI5tO5IrqQd9BzNrz9bbjf7E5DH1kthoLpBqHaHsBvSb
	H8aTroGmHh4Lo/l5UEolkMA4nKUngOWmzy93yDe8qIlQ8Hq59jqo41cxSOVaFUPZf8Mb9PhbCjt
	ZAkRjmSppuY4COAvzD0F7rfuLjF+HL9JIMhxqxkuThYzqKcOBCF9AE7pKON1DF80sb4etObBTl4
	5cFDwkh5XGBfMtmnTmTkb2km0YRU8BpFJZeoo5fmq6ecDn2M2q8oBVL5ZfZ1zcuhrFfpGFhDwzY
	+skY55pUGFnmJ7XzT6oqLcLvaDmgDUl+Me3xlj8mdnssbHYcQRyLmzkhmQcl0BC31PX4pS1xwNU
	TVUcMjproCXLT80bQPx3EgegimAU1uVM2iqeD3vVFWWzrBBqrHWeXVNZ7itNyiS2lXtI2mcTnqw
	2P3a6V9x2oiicPtpN6oS2f5lU=
X-Received: by 2002:a05:620a:28d3:b0:8b2:e986:2704 with SMTP id af79cd13be357-8b33d1e2c9amr478726085a.6.1763765026884;
        Fri, 21 Nov 2025 14:43:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEhShxarZPKNko07L672VvYM6E4Q/cCtGTF/pngqK7T7sU7mSFoE06aEOm6E+dFR58dPWuV/w==
X-Received: by 2002:a05:620a:28d3:b0:8b2:e986:2704 with SMTP id af79cd13be357-8b33d1e2c9amr478724085a.6.1763765026466;
        Fri, 21 Nov 2025 14:43:46 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5969dbc5964sm1929746e87.70.2025.11.21.14.43.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 14:43:44 -0800 (PST)
Date: Sat, 22 Nov 2025 00:43:42 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Zhang <quic_jiezh@quicinc.com>
Subject: Re: [PATCH v3 5/6] arm64: dts: qcom: sm6150: Add gpu and rgmu nodes
Message-ID: <ryaybhj2in3p5bdkbkm4alvxj2dumb6eah4wpru3xeffuabh3n@m5k6ivvmvkus>
References: <20251122-qcs615-spin-2-v3-0-9f4d4c87f51d@oss.qualcomm.com>
 <20251122-qcs615-spin-2-v3-5-9f4d4c87f51d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251122-qcs615-spin-2-v3-5-9f4d4c87f51d@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDE3NCBTYWx0ZWRfX4QmNboA2mISs
 G1V+h68UXP1RobVO1APreoWG5zbWB8UN7/wvM8IUQWKizWPCwm13KKbo+HJDBwpD14LGEc/p5vY
 aKkxR4i40kTYVDe+/HX7LnONgEhIr3bH5G1fsro37nx3lB0cRwKZRRW+LXp/q5gDHxd2khTAfLp
 vNbrxOMi8EGbZWgF1eRUlQT6nvN6Y8LmZ1oIoTIl30cP+kZTesIhxIK1Tv9j+3+5+smA075a/Vc
 KX/ob2uL8Lhyayv4TlgfrMZEqWduLU/rbCRjctbUkmkxfRi8AcPKXjVgTcCPa6JocDzGH3dk96s
 4DGuy55lDzMjo8k0BlPG7yfSbMzsaXsPe4JB/LktvSwJ1cHwd5/b1mEsbxrpInUyE9HnhKTrJEw
 l/yheqCejMy5jr3vR8orMz7hnZo8nA==
X-Authority-Analysis: v=2.4 cv=QOhlhwLL c=1 sm=1 tr=0 ts=6920eb24 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=8h3n1EBGBd86Ebf8828A:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: oTYpbdW1O-tNAyC11K3ORFbNqx5FjbAH
X-Proofpoint-ORIG-GUID: oTYpbdW1O-tNAyC11K3ORFbNqx5FjbAH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_07,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 malwarescore=0 spamscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511210174

On Sat, Nov 22, 2025 at 03:22:19AM +0530, Akhil P Oommen wrote:
> From: Jie Zhang <quic_jiezh@quicinc.com>
> 
> Add gpu and rgmu nodes for qcs615 chipset.
> 
> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/talos.dtsi | 116 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 116 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

