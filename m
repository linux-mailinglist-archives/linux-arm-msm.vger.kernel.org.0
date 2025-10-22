Return-Path: <linux-arm-msm+bounces-78300-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA8ABFB111
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 11:07:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C969B4F6A5F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 09:07:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECC013112C0;
	Wed, 22 Oct 2025 09:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B7CsAmVN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59B872E7F1E
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 09:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761124031; cv=none; b=Roi+kIWeS2Q2mR5jwUoLHU3NkvZ9Ngr0w6J6vmOzBdAKsDw0AVPR8DZ8UFfAijDTEjxsMHArBtzFsUUdlna2twlXUoASeMjL8ywJrJI6cKlyH6JFAvK9W6+LrVPw1DQAd9Xn2uYnNodwZpEtIWwJbQwRO9TB3nYwWpzex1OqAKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761124031; c=relaxed/simple;
	bh=U4ATiaoxVhB58bsNx8X3rRPvC7i5hP65Ww/6KwlSMVI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hG/AOPlAf501eTuTLcydzf+6v+3zMqeBIpcAfeXql2TWoSlF0TxE0VB5D1oymRkJcsGAmKkyw4QFJwnrR8/idt+n6Si7Ulk4tCu8UFvgTsdhgzysKxFrIayHnkbIMUMiR2DG7VHXLgLBppsIPEOTnvC1s8rgBCmrqAp4Gv6GU9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B7CsAmVN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59M2sAL0025370
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 09:07:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UX1Oq/GaByCG4cqqLwGQJt8fbmbuId7BfFpYOsktJPI=; b=B7CsAmVNe3dx5tPm
	eYyBlVnazGBigaD3EYsn3RlB6lP/3E9Z/azL7stitoN8/8qgJTaPzbsEkbDcRm5z
	WFjFe07/dSPywv6gC3+netGDe3qH7JY2qTZiDxMfo52gYDSUVJWWTCL6wxTLcVpR
	TMKL9a/lbNMk83CNPrL3uBc/b4sGhsAB9s/lAUlEpZQG94yRo5ZgRB2Ki4DoXjvH
	ixpCXBXv41OUHhLv1QSjw7TweXrlPrw5oFxwWVYmjq6SveWCTJw/9m3YlpnEe94O
	H0/JHThywFuwQ8dylGEwEED+0vaCaJBsmnBL5r/mY4qAs7N1h76dJUc3YIlbIW0F
	D/rzDA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v1w842r5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 09:07:09 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-33428befbbaso7597146a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 02:07:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761124028; x=1761728828;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UX1Oq/GaByCG4cqqLwGQJt8fbmbuId7BfFpYOsktJPI=;
        b=tUuIe23HbJmTvUMC3+kwJbgx7/xWUbIRAv7U+OQTxM77B/rW/re2Zd2v+vBO7Klo4J
         6lkn5sNo6mX+fYsN9NWPy28tyErz56OctJ5IuGFYDt2bbsPN0Qv31zViq0aaeYBgolmd
         PGYWz00ktk8WCbG2tsApFgDgZEgNJvs3qHJrrqA1N6tByKszHqyUPr6RZdaRbp8/sbAx
         Ijhn21XKAOuf3bGbgYWuKDWIJSNyrrhYsftXVKeKjBIe0LtLQgArk+S23G22WEO2QmH9
         nIpH3qQKdgJzHkKOSFJzUhCA5G7G/l6fKJIJU2ixkI+O3pArlNl0cKXQR47//gHGtvHx
         4+Mw==
X-Forwarded-Encrypted: i=1; AJvYcCUnV+tBxxBYQj3tyMRSxMHUQtyZogLBegBMqBIi0K+zh0QjLNNUUWX0Imu2skyVE81nw6YQ0x5+UWSg0+DJ@vger.kernel.org
X-Gm-Message-State: AOJu0YyWlUGvRNpYjwhWTDSeoSDneozL+L96vS9XIcOoSl4LVGL4GHwO
	z9qvNxCYTybevx2rRaTZaIoq6t8VgeJMQ0NaaXO3MHKH2ntJHaBr8IrV3BePo82LHKxBOBvvnV4
	5wb6tLGKwEQSHDJMLYo0mB+fpBye6Sy6SjdMu43xp7Jpv+bM5ewwbujEVm0P1Ur9Tg1/z
X-Gm-Gg: ASbGncvynGjwzbNakAopGCruehtqPQ+fAhlPSFwAivbLByER+zgKxhMeamQZ5PRU4bD
	xZQaGC4ll+X39jPk3pA1kHYFa6PBL73Cx5MR5UD7FnY9Jpsl95BkFpDFafchzSegv4eC4mnElCN
	oM9fm2tuQa3hPaLZSpTF5ikAgrUGmLxTr1foRHrc9n0HQww+WEQtjNzXSPHtuSVAw1sjFIist3P
	dlONDM9ajsGz755xz+R9opsGqwhM7ujHg4Xzr3rUzT7912QMvMWNZos6NKUS/u85qTmWb1xaIcd
	vnl/QQQi38mVUcq/NagwewtTb627xLGPig4Sep62fAJHxV/YLnrB8VIclpfHGFLvUqNWA+TMUBV
	AL/lRAiCnjiD9VxE7Uw0th6rkUtRSaBYkrrWnHcWbrTR1s3/RLFbrIHEaBbQ1F1k21bSW
X-Received: by 2002:a17:90b:3ec6:b0:330:6d2f:1b5d with SMTP id 98e67ed59e1d1-33bcf8f924emr29437643a91.26.1761124027889;
        Wed, 22 Oct 2025 02:07:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGYnE7/JebDCjKfWg4uloOPxh1RmrBCn+nnraZDMpeo8BYYdxfdxmAhCwzmMViUUHj4rDoFCw==
X-Received: by 2002:a17:90b:3ec6:b0:330:6d2f:1b5d with SMTP id 98e67ed59e1d1-33bcf8f924emr29437609a91.26.1761124027467;
        Wed, 22 Oct 2025 02:07:07 -0700 (PDT)
Received: from [10.133.33.84] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33e223dd9d6sm1941797a91.7.2025.10.22.02.07.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 02:07:07 -0700 (PDT)
Message-ID: <7901b3f0-72ff-401b-8ed7-86b8bfb083cc@oss.qualcomm.com>
Date: Wed, 22 Oct 2025 17:07:02 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] dt-bindings: firmware: qcom,scm: Document SCM on
 Kaanapali SOC
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Robert Marko <robimarko@gmail.com>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Eugen Hristev <eugen.hristev@linaro.org>
References: <20251022-knp-soc-binding-v2-0-3cd3f390f3e2@oss.qualcomm.com>
 <20251022-knp-soc-binding-v2-3-3cd3f390f3e2@oss.qualcomm.com>
 <jqunb52dy2kyygpolf5ct72j3uktln47qppuhfczazowykatt5@3bg2c6umqw52>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <jqunb52dy2kyygpolf5ct72j3uktln47qppuhfczazowykatt5@3bg2c6umqw52>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAxNSBTYWx0ZWRfX+GzgoNmd38nd
 rcIQiNbLsPYUXNZbxA48srAo9A/bknl7a3hEsSCWLij9V6Dr+tcum1ApuMr2YeAMFo4DtEB+Trq
 OkUcIsyMsp8ET7joh1QYEsMA/bZZ2JQ2Ne1Ff7YD4UKtB/MdWr31Kpl4Xlfw9a0CkDkGW/c6+Ab
 Q/HB+1adNu3+ZmS9NAjpf9HH4mJowVFORG5EqpjjJwrgFq063xOAnJYmWasKB5ltewwQKL5IxI4
 1kOcWsUPAuoydxo85LjD9TU4/JTqbfmApo+t04b37ohyXV9iXsIb3nRV8t8wtTlPKGjiz1ajK3q
 HxC0yxeanWY0LlnpRIolAQweD/dgJ8v4s2U7bM+3HuuaaVsCvEESS92lep06QUNU5N8S7hm6qNg
 XQmN5pHLfp79bZNUbj9mCgHgg2o/ig==
X-Authority-Analysis: v=2.4 cv=bNUb4f+Z c=1 sm=1 tr=0 ts=68f89ebd cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=sM6Lb9GqGZImNCjOUggA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: KkPxv7mJF4jw6B3mDMbGp__uzHa7uEPx
X-Proofpoint-ORIG-GUID: KkPxv7mJF4jw6B3mDMbGp__uzHa7uEPx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180015



On 10/22/2025 4:50 PM, Dmitry Baryshkov wrote:
> On Wed, Oct 22, 2025 at 12:28:43AM -0700, Jingyi Wang wrote:
>> Document scm compatible for the Qualcomm Kaanapali SoC.
> 
> SCM, not scm
> 
Will fix

Thanks,
Jingyi

>>
>> Reviewed-by: Eugen Hristev <eugen.hristev@linaro.org>
>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>> ---
>>  Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 2 ++
>>  1 file changed, 2 insertions(+)
>>
> 


