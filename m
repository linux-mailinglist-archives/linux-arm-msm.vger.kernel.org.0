Return-Path: <linux-arm-msm+bounces-61321-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 65F2AADA1C1
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Jun 2025 14:34:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8998F3B0152
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Jun 2025 12:34:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EC65263F28;
	Sun, 15 Jun 2025 12:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Unl8oteI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E76B11FA15E
	for <linux-arm-msm@vger.kernel.org>; Sun, 15 Jun 2025 12:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749990866; cv=none; b=eCVZbzNHsAX8Ac6+Lthkjbnyqq7/ZqoVzx1k6iGNlWDejGBjDA7qZOqTQOVxKR/rv/AW5Y88VJpst6ya8mbOmQgSD4pgGlvix+v8hE9Vaj4VP5uFT0WrQXYLobJNWblOxY0cKRizFtiV+ZqFka/rhrboeSkekh5ykhT0EAwTNE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749990866; c=relaxed/simple;
	bh=+YtpauqlidocOfZ9u9XcCreAbzVU0bnliyjUiSwMjIc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OX7vmtgQQw7EVAyc8/zLYzfK7PvwXUbQqZ2RV+V35Jfofv4v4wAGVJ8C0hW/at55etbc16C03ne01D2HVx2hmXW3kuU6IpiyAwNVmAmaiimupkpRvq9nNmOW7tLSWaMPZ4O9zDoZygMa+6glFRop/1QL/ADSVdJ15ocEKyjfY64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Unl8oteI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55FApD8d009426
	for <linux-arm-msm@vger.kernel.org>; Sun, 15 Jun 2025 12:34:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=F8bqEQD1F/6c4ZJFOITRv4Jy
	xZh/ptkdnehZ2r849SQ=; b=Unl8oteI+YK1i2Dn26OFxn9sJAbKVvqQERVCSRIE
	ESoLPfQralPIHdeHXlNMuXCVgr6l1Bh9PaP8OmYmZOCQfATAzn4KM5FhG1yHQ5nn
	U++S7lMJIuAIVWsW1F3Yn4K5Oko7JHiNpDThWE2Jm5VTWqkdfE0cjug4WFrcy5GB
	fwO+Sm4/GIyo+VY21TELxL3V//flKs0nW8S5AwWiPJo3yK6mS/cYL676PNZBsw7K
	SnJZxSv8irAdeDFDi0cr5XAgSlwNK2x8j1a6At9nDviX9u+xoF8e7+zDek7L0pb+
	6UQVKv2033AWdGG7crRlS0ZmX5uMVm2FKCPBBttGdQ6Vqg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791f71vfs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 15 Jun 2025 12:34:23 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6fb1be925fbso63339996d6.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Jun 2025 05:34:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749990860; x=1750595660;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F8bqEQD1F/6c4ZJFOITRv4JyxZh/ptkdnehZ2r849SQ=;
        b=ngy9o6JIaphnqvi23L89RVdktft0BZi9t0oQot0LhGvCszrgNx5y/8Z3MtlKVA1kPd
         AazsiOPhiIx1vjakXIELe3gcLVV8dtLK2iummrzMq0NgmrQGeH21SG+WntO7aVL31J0L
         jvPqmi9WNuxJN+Llw0oN0ANQhibcR23fzRZk0bMg/ae3BQqs2EwMXX1d4ILNVjAUJeIQ
         kojkHCWkepcjH1T+i7wajXw3hBGEz0Tnpyv+cWA4HKtE3Rimj+tjrMQu8P7IPwP8ETO1
         dvG6ao4gKfxmHnJXPuT1SIq88+DjIN01Y8ZSc9Iq4OF5XB+K9IvMVGbWjtcA18r5LANb
         kOsQ==
X-Forwarded-Encrypted: i=1; AJvYcCU39qn/zLiwQqwnatzO3ZJrrfagN/FIwvmziU20uQJ3tTHuVFQBNUwfXAQxFhtBwYEjmxKtPT9BHz5rzOhS@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/2PX0+hAzz05+KBQE0X5j+0xMhck99FQo/cH9HZ0vtZm3OXDm
	W+mt2628AuXzuhmL2Mcl1IHYOzCcHOvRFSYebWlIkNX+ZlO4BUvZ4MAy41KLcqFV0QiLKXGFsrN
	HQAgEU/w+W0Kt+t4LV8j0hKUeac0oCPwjgXWB3Ssq7acjuy++ih9BV/sqGu67dhWQG+F3
X-Gm-Gg: ASbGncsFyAQZKX1/eL05J6pVvPc+g88t+flpUBUHxlSB+6dI0CIeYsS4Z4a/LH4vnrN
	KE1el0vjLlprShvEHO9fizqFh+lxpZsDMioMGi8F3gRXdLx+HMAblV3Z0W+uw9OXGaXYFc6L4BQ
	WKMkL/afKFVBshzosNUlpAVyNu2RB66UDXuM6ijg9N4DZ5cWOe4pFgAhAY3ZTqY01A0eiNjRgoB
	Tks7/xaI88oFsoivfhiZPNTwybnF5Fxc+5FpY2PZy/4sX22QageA8MKYfRDV4StjNKx43Eeca3Z
	stq7+c+LYj1JPiXdIPAIL79Dox1ozmP8Wna4M2ZJ4PivctZFj5adRqqGImQ3ly36x6m9dcI/ZpN
	gvRrVrAFEYZuzUZkbj7u54dPCDwOLaS+PuK4=
X-Received: by 2002:a05:6214:2022:b0:6e8:fbb7:675b with SMTP id 6a1803df08f44-6fb477a609cmr120657426d6.32.1749990860184;
        Sun, 15 Jun 2025 05:34:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHmsSLFYPiqh/8XNvtHVegWLMnEXtNYwQKFxdbRklLNtZ7glTt0XkybvDqsKlbaPwa0t/OwoA==
X-Received: by 2002:a05:6214:2022:b0:6e8:fbb7:675b with SMTP id 6a1803df08f44-6fb477a609cmr120656996d6.32.1749990859774;
        Sun, 15 Jun 2025 05:34:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ac1c1316sm1168339e87.158.2025.06.15.05.34.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jun 2025 05:34:17 -0700 (PDT)
Date: Sun, 15 Jun 2025 15:34:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Mahadevan <quic_mahap@quicinc.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sa8775p: rename bus clock to follow
 the bindings
Message-ID: <jvld427airqpexaiglxe5hbt2svidbqkg3kvc3ysrwmqquwmi7@kif7otpk24zh>
References: <20250602-sa8775p-fix-dts-v1-1-f9f6271b33a3@oss.qualcomm.com>
 <74f7053c-10d6-4aca-a87a-0ac7f55c2f1f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <74f7053c-10d6-4aca-a87a-0ac7f55c2f1f@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE1MDA5MyBTYWx0ZWRfX/m2JpVfALDKD
 dZMLr42AnWjYPljiLX9tsyfY4BKReJu1AeEg28kJ0qxok4NqKIPBrmVHNRvFN8VWR9rX79xPOkC
 ZLGk6b2sHX7eCFJXYZs7OTk4Hf24oHJXkHbvzT/TaLY0xjhKIWr4wA+NLX9zlECXYHJodlMbdmZ
 hNbgNpyO+Wnk6fqr0XcvO1W+77+jSyWY6JqECAiavvboWYtF00Pyxd+3wbt0KhHj+EI3ivOsbbU
 0U9pIuKwU7sZmSbz4QqUHN+VCwfP59tUkw+/XYdJUBKPPe9JahMsRSfCA4WqPS7cwccCXwPkdBn
 +wcNWtV9vDEWzidrRVDuQjxfNNYJSbaAPQPr5oML2v08JpQb/B9W3F5IlcoMIO5AaiOLvawFPNL
 kX0yoOt0jar7MszX6QuBz/Q1UQ/TN6oaOKiBxulfIdxXkeaFgrOKLAnQ20yxGmdOagUB72Ll
X-Proofpoint-GUID: 8-M2H_oebwaEIXb7zFAS4B_J3z4aGPkX
X-Proofpoint-ORIG-GUID: 8-M2H_oebwaEIXb7zFAS4B_J3z4aGPkX
X-Authority-Analysis: v=2.4 cv=FrIF/3rq c=1 sm=1 tr=0 ts=684ebdcf cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=CrcwQKUZSO7BFsxUzq0A:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-15_06,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 mlxlogscore=982 bulkscore=0 impostorscore=0
 malwarescore=0 phishscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506150093

On Sat, Jun 14, 2025 at 10:10:59PM +0200, Konrad Dybcio wrote:
> On 6/2/25 9:23 AM, Dmitry Baryshkov wrote:
> > DT bindings for the DPU SA8775P declare the first clock to be "nrt_bus",
> > not just "bus". Fix the DT file accordingly.
> > 
> > Fixes: 2f39d2d46c73 ("arm64: dts: qcom: sa8775p: add display dt nodes for MDSS0 and DPU")
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/sa8775p.dtsi | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> > index 45f536633f6449e6ce6bb0109b5446968921f684..7eac6919b2992a3512df1e042af22d0cbad04853 100644
> > --- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> > @@ -4122,7 +4122,7 @@ mdss0_mdp: display-controller@ae01000 {
> >  					 <&dispcc0 MDSS_DISP_CC_MDSS_MDP_LUT_CLK>,
> >  					 <&dispcc0 MDSS_DISP_CC_MDSS_MDP_CLK>,
> >  					 <&dispcc0 MDSS_DISP_CC_MDSS_VSYNC_CLK>;
> > -				clock-names = "bus",
> > +				clock-names = "nrt_bus",
> 
> Is it the "nrt" clock though, and not "rt"?
> 
> There used to be a split for non-/real-time use cases, but
> I have little idea about the specifics.

I think this matches the SM8550 / SM8650. SM8550 provides a good
example, because it lists both "bus" and "nrt_bus" clocks:

                                clocks = <&gcc GCC_DISP_AHB_CLK>,
                                         <&gcc GCC_DISP_HF_AXI_CLK>,
					 [...]
                                clock-names = "bus",
                                              "nrt_bus",

So, I think, let's fix the clock name here to follow the the schema and
other pltforms.

-- 
With best wishes
Dmitry

