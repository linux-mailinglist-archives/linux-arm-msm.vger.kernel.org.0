Return-Path: <linux-arm-msm+bounces-68163-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A23C6B1F2E2
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Aug 2025 09:36:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5BC33623A7F
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Aug 2025 07:36:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38DD5221540;
	Sat,  9 Aug 2025 07:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fq17dNGB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A95A21E4BE
	for <linux-arm-msm@vger.kernel.org>; Sat,  9 Aug 2025 07:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754724999; cv=none; b=CU6P8/kY3Gf83tDoUrjpBdJ2hoBvlvBHmuNhUwTAHJPPE2vudt1kUhcFlj6znlZ3rIovqAvD/m+xJ3JL9O0ohawfe4bFQqSmER8pLcirU8dN6x5t68ON+WaNHNAPXTSWhVOnPB5D/8chMXczc7likXmcA5W3mWFYZ7LMOtbbo/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754724999; c=relaxed/simple;
	bh=KV+nbotmPaioDUnvPXisviPPbgOFzIExIt4xbAI+QB8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kCdDSM9C3oFJxtmbQyACc7U2J+dr+ZAhqFQfA1roytT+C846L1xY5ADHR5cJF8Q61cxrBK3lcggkJKesMwIpnuUWAO0TY8RG8cars/oy5DQiw0t/NzSUAh+dAWVTs2a+rP0jie1yCguVJUDNwYvFLdsMfTq1FMN/M7wH4SQJNqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fq17dNGB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5793UGQ2009156
	for <linux-arm-msm@vger.kernel.org>; Sat, 9 Aug 2025 07:36:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=aFTb545D0EnqrmPmVub6t9kx
	Cv83ILSV+GDMnaszhak=; b=Fq17dNGBacqviGWaJFSjXGQRQfwJ/Q/jYxDp3HLs
	nyTcCfLkOck38U9EreOOEv/8r0yXm2yQ+b2H2VS3nnm2h0p/JFJxbkqdnGXirhc5
	eoG3zV4VBm5Bo6c7HbcJkx/PUZSveIRy8rvwqwO0OfwFzCwe0wcayohuBQwzlfwC
	FU+D8P9RjW2qJcvHQQCxtLyjihevvDUV5RaSmor5u09jyxLcEFB9AzxmFS2xSwZ2
	R+gA/u3xKW0EbcIMReykp+O7DfaCNALn/OF6sOcuHjTqxD5UFgmd1tpaV61/PwfT
	J2VLv5JUukQ/7A//Ig6QJ4K/szHuwf5V3WsPsr0WciMD6g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dupmgfud-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 09 Aug 2025 07:36:36 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7e826e0d7abso533005985a.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 09 Aug 2025 00:36:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754724996; x=1755329796;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aFTb545D0EnqrmPmVub6t9kxCv83ILSV+GDMnaszhak=;
        b=T0kkVgsUJx6HvxFUlzV6dyHTK6uLu81IWpeWB4qEkkfkKHJAQitZKwc1Ce0yfHj2k8
         /UR6wtFx29MIs82ZRP0NejSxMt6DWvW2vfUUH0ZiFYtVwcLhjd4p8pKHp4mu9WW/A7AG
         8hvUIrvTzZAFg1uBv0xzDX1oiljc58V8g9N8yHhF/HxjDzKWAsawGHt/IA6HVWZJyN7c
         zi3nP+6su9nnM4V3k//l3AzQUvwinMT8jlLlZwYpaCjiG5CEt/hW9RMY7fFPdVDllAOw
         ZHkOUfoIZqqgpO9XDkdOq5e/9b2QPAJ0bIRYhRG3hnEPUvETAIpfHkA3proeIfcpcdP/
         w17g==
X-Forwarded-Encrypted: i=1; AJvYcCXlh3VWHhIHgvhrNhnNPbPeN1GW9DfOdj7PjnTnzwYcAYOvbaVHWSGH1smfNp6nh5RwT5V9RW66Dvk+BGL2@vger.kernel.org
X-Gm-Message-State: AOJu0YzhvrXD8ND+F13RZAmMu5Xrnseaqv+iJQqs6lRRg0cYAmJ3/bd2
	wLbHYO0Z501I+8Q5mIjUG20LkR4O+g7jpiSRJzlvePLf73Oq1yc9zQI7oTwzT1BWpr3ND9cKdkG
	hzMQvGOF0Qk1lPGidrFt3mhMs100i88URFLrK8+uqBUJiY76Bq8nFp3f5u9WDl8iehifb
X-Gm-Gg: ASbGncvuDqdqs2vv2zG2QDWr9ofoeKlJLx6jehziQqNTPz6eIoyjo82vGbT1Ek1kAeS
	u9VFPl2InfCCsFS0Y4YUwOuHgj7Z5y7Mti8if6dVwNTboJHEGMGaAvebB+3mJKNd22OIDmY6Cv1
	oRbHIpcITunbYlYvyruB/rd/DQdQcOYJz+CSf4ngVmhhMDCSdizcfv0AGk1tvdLh26Pv7aKwUsq
	HGk6prlE7SwVRS69Xm6vHwtoCqmkvf4ZouYaYLlafKGv8KZkcfPzulIFmNnCJdVK+ptKMMBQcxI
	MkP7ax1IrpSoO4hi6TSQOOzYgVL7qCbXl+sngWmbBlbO/cS4iOATDPrvmOSR36cBZptvUrF8N8G
	vz9wlakbyhwd5b3cemeUbGqYdY9yNgtc5PBNDBaHAzFDAh3sixPBt
X-Received: by 2002:a05:622a:5590:b0:48d:8053:d8ee with SMTP id d75a77b69052e-4b0aedd7cd9mr80306441cf.36.1754724995866;
        Sat, 09 Aug 2025 00:36:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEXEneZ+bObkvykBsZKTcd6gDIK9QejwdLRYsOVtihnF52Hii0pS/IlNMrVnQLjwaC1m/b2yA==
X-Received: by 2002:a05:622a:5590:b0:48d:8053:d8ee with SMTP id d75a77b69052e-4b0aedd7cd9mr80306271cf.36.1754724995440;
        Sat, 09 Aug 2025 00:36:35 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b889a03acsm3288206e87.51.2025.08.09.00.36.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Aug 2025 00:36:34 -0700 (PDT)
Date: Sat, 9 Aug 2025 10:36:32 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
Cc: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Tipton <mike.tipton@oss.qualcomm.com>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sa8775p: Add clocks for QoS
 configuration
Message-ID: <m7pqgeqzpqdal5yyukszzbkniyijiji3khzanwjfqxah3prgij@ucgndrn5smwq>
References: <20250808140300.14784-1-odelu.kukatla@oss.qualcomm.com>
 <20250808140300.14784-4-odelu.kukatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250808140300.14784-4-odelu.kukatla@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=bY5rUPPB c=1 sm=1 tr=0 ts=6896fa84 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=M9tGKf1UEhd6l-wMVe4A:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: h8n3l-INENCalV7vYamAOx_quBKCsbZS
X-Proofpoint-ORIG-GUID: h8n3l-INENCalV7vYamAOx_quBKCsbZS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAwMCBTYWx0ZWRfXySyhc0OB2agO
 0AnU3vv/KpZ3Ht1HpPWa7jGxZr3aQsNTVHr86eXggM9KqPObLop1EoKs88kmZiEuD1ipm+7wMN0
 KJXWEbWTsCpQdvcFJLBN6RXa7JTcCKhCOt0Fq49mqwz1aWR0oRF3EjmHX+cCaYwBPB8Bl6D4Qub
 wg4yBmwT3PFwhnJ/XLtfJnhM7Cf81ZyRtId+KRKaMqUPmW/lgoA2Lwb3V33lYDmPjgwHEbjTyNb
 3xiKgdKIvgt0rerV2LcGsaMxC55k7Aq0Y6MEhMl+B1+LohDQAI2YDKv0vJ6PgTXryWZYMhOvNCL
 0ApWl2BggGZO2LdhkIWZ/eE3+iPuPQQpfDhe7HN4JAvNj3f1GQwgQAR+juBCMrVg7B1uRPJ49/O
 Rfrrhj1t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-09_02,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 clxscore=1015 phishscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090000

On Fri, Aug 08, 2025 at 07:33:00PM +0530, Odelu Kukatla wrote:
> Add register addresses and clocks which need to be enabled for
> configuring QoS on sa8775p SoC.
> 
> Signed-off-by: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sa8775p.dtsi | 163 ++++++++++++++------------
>  1 file changed, 91 insertions(+), 72 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

