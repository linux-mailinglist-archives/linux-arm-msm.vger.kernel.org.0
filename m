Return-Path: <linux-arm-msm+bounces-76699-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 35A46BC99E3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Oct 2025 16:49:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 63A594FB76F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Oct 2025 14:47:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F71B2EBBA6;
	Thu,  9 Oct 2025 14:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mqg2cHAl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 968952EB5CF
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Oct 2025 14:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760021267; cv=none; b=E61eK3NfC24467tFawikdjlULDUiu7JdfJBUOR77mH3e//4qMzjLX611PLVwoip0l6YqMi/Sz+w3o69hlH8bk3XJMrkOO8Zvc28QbX4+9SXNv3n8F2eDx9OlH/nxAkAc8fy4o2v8xUK/+FUm64jm8N0CGY1RWQ+0ky0vtH4HXa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760021267; c=relaxed/simple;
	bh=wCZcf1vJQBWFgMYZhxV0uN6s2NYKhluKHQpo1wlh134=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JmVgXhPTPHrvbBp4LMTA5YD+zaIzPrH6cWmBr7juch2U4H0GXIjmiGDZTO+mBkrEioDpM9lgE8/z4YqjU4hGDFxAypQZSWjJASTQA5NyOUkCkCmsXa1chJMh2TQug7ksNV3jQXgeksrTOUv46RC44qH4ULd9XnLNB+/7EZEI7vE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mqg2cHAl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5996EgZr011887
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Oct 2025 14:47:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ebeBjH17Tc33jzXaK2hqQGrPdF0j3wORZwYG8oLycWo=; b=Mqg2cHAl4vRoAEKh
	zY36ql9Ogij0IhkoIEpBO6O7ntKIJVD0uzTD/DcEhQlvb4V8YAfD1T1uto6atE/r
	Lt8QUkwZKCJf/0dp8KxhLnuUdRm0R8u8eF6kflmhprEQ8z5WEIVOCU3EEXtB86oW
	xrUjVRQYkE5Inf825XEhQqTocG+6txLsGFC43vxJEszhbXq1Amoaqt1bI0LdvOWh
	LgnsGTbDjtygnHCv8W5LsasaVqRYAdjM44/ZQOhBVc8fUDWNocTQugngNOdr5/+p
	nYuwMkPA/QL9a2ZDL7/P9FSyEP7wf810+mL2uWE5t36xn4Iu1QVeMawn2nfwKytZ
	C117tg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv9ab7qw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Oct 2025 14:47:44 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4dd3c89ad67so1076081cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Oct 2025 07:47:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760021263; x=1760626063;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ebeBjH17Tc33jzXaK2hqQGrPdF0j3wORZwYG8oLycWo=;
        b=Fta31Tcp9MEsWRKNih1JoE0Zqr670hwqkHRIjiulEGbLpsS7BCWGvHC2WISOIIpWzi
         z9ehGEeapvsNFCNdDN7OQsDEN4fxDj8JGV6STZVjWhptlsAq4EBX7SZs1NqhLOXeJG9v
         hzzVbUFugi0kY/aKXxTsqQ1X28p/VRWiBZXJa2llwnbKS1AhicQWBgz6EtadLBeU3xW/
         TfNefWcmCRcB4YTVqKUG4BfvJ2tEy8wj2YAAwMgR4yVrtrh9X0Ca7475uWWVUcZJ19d8
         ACYdKtOUr5+r1+XkB7K/ZcaF7lgpEgmGEmzqbnHgzKwCj6cO6bkP69aUo6Uxe3+9zxYe
         +5DQ==
X-Forwarded-Encrypted: i=1; AJvYcCWA+b01vODrATshpWYh9ULpx0C9hII0+53Z0v2an2LrA69r0lqJqGrZY1SKqW+qtmyO0naIgITkblGB/Xig@vger.kernel.org
X-Gm-Message-State: AOJu0YxTFhbkimZ+DWk3szadGqqybxNT6LuAJg8WA7qAE+ExX4TSOfxY
	P8oZ+ROJIZlnpRzbt5sEa4bkt6wHgQLtl4Yo2HCqIgrBD7lGIInEPIcIcG5O1DDXFbPPEOEp1Ln
	lKXqUb7eZzSESKvINSbE5HinHw7rXMw/nU/UmNmsAk7bGZlg65NGqfSZdFbkEpOU76vRO
X-Gm-Gg: ASbGncv32h0ntwG/DhltQj+6EhFSKPoaSvBEkvrnu5BK8WNPE/2eTVz+yq6HXruk5Ua
	5dx9wRR3zVg0WZue4qQsBD3B0zdiL+nreKX+3ovfDH0duwXdgmL8HInCIjBVBhk9MzMIWWDJAfK
	w4VxJaT4AIPJg+V6FawqH0NjrjGyOjD8qLJjivTxtAPLmePXdKoSpoC9iGTiiTuche9B0O2LHKm
	jDQyYbFo3MuIbtBe4iZTFma6PrR0CfatAV7Hc1ZVm2kT47nw0rxvogTIDsnFw/DBvLhkchB/Hs+
	o4//etDYEjgBdkEU85Quo0S4Sd3M3adLAbiCgvsK+O2DgloZGkh72Wbk4+rRXtH2oxnA4ncS9pl
	oYMkZvjptox5LmembrpelSbsqpSg=
X-Received: by 2002:a05:622a:11cc:b0:4dc:cb40:706e with SMTP id d75a77b69052e-4e6ead458c0mr75125551cf.13.1760021263243;
        Thu, 09 Oct 2025 07:47:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFHvkCErGnAd+2F+0V519Y/X6ndedkfODnCNUsDw9spRdQiN0VpPtSkMUsOifF4sBmQy2FpHw==
X-Received: by 2002:a05:622a:11cc:b0:4dc:cb40:706e with SMTP id d75a77b69052e-4e6ead458c0mr75125001cf.13.1760021262397;
        Thu, 09 Oct 2025 07:47:42 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b4f3c7e057dsm766895066b.88.2025.10.09.07.47.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Oct 2025 07:47:41 -0700 (PDT)
Message-ID: <c16d4e6d-8643-42a6-a7a4-8ca18e6db265@oss.qualcomm.com>
Date: Thu, 9 Oct 2025 16:47:38 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: qcm6490-fairphone-fp5: Enable
 CCI pull-up
To: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        Daniel Scally <djrscally@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        =?UTF-8?Q?Andr=C3=A9_Apitzsch?=
 <git@apitzsch.eu>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
References: <20251009-dw9800-driver-v2-0-3c33ccd1d741@fairphone.com>
 <20251009-dw9800-driver-v2-3-3c33ccd1d741@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251009-dw9800-driver-v2-3-3c33ccd1d741@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMiBTYWx0ZWRfXy3y3O/QtIMGP
 QuQXUCcpXYgRSBkluaybfl/Y0MlXWxjzHV2zJmCCRSl7rDaIrkdPKlDjpQRc9VtMccoV5G7Chzi
 vOWmVU0Yt6eXDOOXQPUfF4eTmyxzg2H6p/u9cKP6emQPc7Gqni6Q7WGEl5diovnYd7hp6AgkBbF
 Cs+QmO56JuTct25UGVohZFzGoaiaP3nP5PkCMPNnGcYJbgdZ8gCAwrYz+7T/zypVbC1uYrPb7sE
 tZuvC169/yuaF7SFUgKUWxQrAkHa0jT2ucH5EC2zIsGLnlUau3iHd8E5z2l8t9A2TAfJV9wI8iJ
 Ca78FnYxSqr/IeM/bWjI/+w0zM49xAbtn0H/8EOHU/BtKfa6fye1CRjRdTWQKTGm/tHhdZO1E4W
 z1UdFHCwvBCZnWPC+KL2zJ5WlxM6ug==
X-Proofpoint-GUID: TAuFGJmsBWTp2j8WTqqa5vE5Ghe61tUK
X-Proofpoint-ORIG-GUID: TAuFGJmsBWTp2j8WTqqa5vE5Ghe61tUK
X-Authority-Analysis: v=2.4 cv=JPk2csKb c=1 sm=1 tr=0 ts=68e7cb10 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=6H0WHjuAAAAA:8
 a=EUspDBNiAAAA:8 a=WWQFUNGd85j635JlVwcA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_05,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080122

On 10/9/25 4:35 PM, Griffin Kroah-Hartman wrote:
> Enable vreg_l6p, which is the voltage source for the pull-up resistor of
> the CCI busses.
> 
> This ensures that I2C communication works as expected.
> 
> Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
> Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

