Return-Path: <linux-arm-msm+bounces-75046-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A19B9E7AC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 11:45:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 59D2F3B8C22
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 09:45:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0AFD2E9EC6;
	Thu, 25 Sep 2025 09:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BQVuRwxR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2525D2D7DD1
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 09:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758793500; cv=none; b=XqUDXUewiSdo249aTW97ikq4zOW+pWLw5VzmTwPOX4ZmD83YPEkKrrcob+vNHDaLb9Pw7vCaBfQ3MIlKdMzRwxYGhmqBgN/JrOSIAotvVs1/yxI7Jq6KlMtRRyMDZfeVKpQ5O/bNjmxgTmoDERpAJwGIOC2Z13hR8WeboNGBtu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758793500; c=relaxed/simple;
	bh=ddDJ8WhOB803sw1GS46pySj8WpA15wcm9XtdsSV5R8Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LBKlLJc1WxtE7YIwHKPqDBOztsdkGBG2izvpcMr/u2rYJ8rPSJzUoEj/eAHNojEWrw0F2RQ/6qEzHTFhuBY77iIf1YUFZcFBCF1gJ3bAFRt+PFIXf5DgqKGtLj8/ak7BWgoCo8dRoDCjRUMiLghny3zQV/S3EqSIfXtJgsW0LUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BQVuRwxR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P9PqBE018785
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 09:44:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NikL2akQ68hM9x9+VetR4PdPN49gGnpQhrngMFrdspQ=; b=BQVuRwxR2YoyFFps
	4Y4Z/Urhjm3dggVs5w5V6EHhY+jyBAglFiXJUhIlgzkS822fTnjA1w3khwM7rrAg
	QokpBXoUDX63Tk8gS89VqafD5Dq8AN8G5XJfZ/MBlQSOJAK7JIVuaAEcr8m1v4K9
	h8YuMZMEoX/QPE5Eoi/HkuzU11E0zOKcpsJQi566TLnQLfdnaGboT8Jv+nU38FS1
	SOn4PhHp5onM7qztmEpxf9fqVriJvWfK5Rj8VD24O3MllcTPEpO/1/Gu5s2WRaJr
	+2P3oj4g8k9JcpI/yqx4dN8yAynPPrb7Oufinxa3TetJbyIr2/F+6CcFnzc6mNwW
	PbglKw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49b3kkbk3f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 09:44:58 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-85e95d986e2so1185485a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 02:44:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758793497; x=1759398297;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NikL2akQ68hM9x9+VetR4PdPN49gGnpQhrngMFrdspQ=;
        b=T3jZ0UxJi5pdwaebiFVtvXjOg1S7duU9/Ssl/ifUYNMKcHzNzCqmcdYhS25n1pRQGm
         dRrqvdIu/aXK6BuSFBSkrx31wJhQPQcFE6dXNja2D4QhcZ4pbjvjE5/pDhujqlN9tmEl
         a/gsIGWUssahXW+J0Kbyk1ddlWitbDOG/hKidwhYSj8HkkR3Nv4SVQgkHMSFmB+5rPPr
         O+ulAQVRYFOF3UZmPC0409Ptb/qqysrEnU6CwPLHuY+hvfts7U5GzdHUA7exYUwitOU7
         Bz3ZnbqimlRBVf4oQX127EpjPeBJK0mFMrdWcdwvSMbj+buwws1Liek9G34+XcSJr21m
         z3Mg==
X-Gm-Message-State: AOJu0YwAQAOW9qDnbtRM9R168rAO7JazYbDYEuGs4h+XeNDptYEVdlPG
	S3VjvBV/ZbnHEVyitwByRPnMzQAdjtv3F4lFkIztg7SKSjtJnTgI2+rXw787FC5poG/Je4qoK4Q
	df6n3nzKk9rV86v89luGx31hOXuQHHoVB5aDuOtWfNG4H91VWz8R7jXvJXSYBSFEGnWpr
X-Gm-Gg: ASbGncuaHDchxthKSKTIM7yfTh8HEKSmp4M0Nl7JrlwGGukZk7RjcTW5sdKUj8IHcTM
	FMFjhHaDQy7oOED9VO1bLKu6M0j38qwyt0yYOJ6l6pGlwevnRzDW8d7Cu/AmHpNFBh8eOS5lJN7
	WsNNDMuQ6P4M22ZSvJRNLHfvvkT4KhNCCn+r8dPYxWKXz28+qqkLFlS8bAJKdfFvtxiT25OUB5W
	w8BdIey5uUCM2RA+WHDJ4qygsQ+TYifzj1NcirJp29R4TSvkY2ZauXO4n3tMPyoxSUcOrkdYQK9
	84CYpb+4hQmapx6EMOy9HOslJuVkYzjbOyeurlg/SKpJyQ2USEAcg7boy5ZvSTEIfwn0RCTfsJv
	O5sMLsRWzBCVm2xpujq0RNg==
X-Received: by 2002:a05:620a:568c:b0:85b:27dd:84cc with SMTP id af79cd13be357-85b27eccea2mr163416385a.5.1758793497247;
        Thu, 25 Sep 2025 02:44:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHPPxZLLNWBTCD5r+mWJbKzzYp43QUCoEx4ni8RhFH2hQfUjAzXM9z/WGLeyICmCEIzVqFcFQ==
X-Received: by 2002:a05:620a:568c:b0:85b:27dd:84cc with SMTP id af79cd13be357-85b27eccea2mr163414085a.5.1758793496657;
        Thu, 25 Sep 2025 02:44:56 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b35446f5c36sm130884366b.54.2025.09.25.02.44.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 02:44:56 -0700 (PDT)
Message-ID: <f647523a-d8b1-4bd7-af44-1893ed7aafb1@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 11:44:53 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/20] arm64: dts: qcom: kaanapali: Add base MTP board
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com
References: <20250924-knp-dts-v1-0-3fdbc4b9e1b1@oss.qualcomm.com>
 <20250924-knp-dts-v1-3-3fdbc4b9e1b1@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250924-knp-dts-v1-3-3fdbc4b9e1b1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: KV_4wRzwKCZpU6auxVpy_AXIfVowV7WL
X-Proofpoint-ORIG-GUID: KV_4wRzwKCZpU6auxVpy_AXIfVowV7WL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIyMDA4OSBTYWx0ZWRfX26YVIsulDNGB
 HKjneM32Z8KAmnLOtBRYRhZmpaaan6LL7V1HJuyZx1R+9OuGI0JNZchAZsfHYlFnthN4oo0OBTf
 1pHnzi20Mnaa+3r8zu27T8bebcPCMnGRgbbzPHDXhajZYariavmHEYa86VpymHt8yLLPW3PGBPm
 RNC1jONrmsIpWb8rfFe6yqPf5F0U/WtGMPgrcpJhwVGAirP/6rCVFXSJvx2Vvy3C/2rUJQdQCH4
 kbHvOl97Yfs8q6ae5p++W44Z53iJaDm92Nzfv8ItARfAdWQRk36pGJdzJwkNww10K4EFKjVHTuY
 GwP4+Kba/4orvHW2PdaAjHSz3tgm2I3UO+FfQudgoaPdUl5ezlrczl5OZa4qHiq0fhfppVlvclN
 UaCgKfB0
X-Authority-Analysis: v=2.4 cv=BabY0qt2 c=1 sm=1 tr=0 ts=68d50f1a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=mBYT-LOj6LCiw4TiknMA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 malwarescore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509220089

On 9/25/25 2:17 AM, Jingyi Wang wrote:
> Add initial support for Qualcomm Kaanapali MTP board which enables DSPs,
> UFS and booting to shell with uart console.
> 
> Written with help from Jishnu Prakash (added rpmhpd nodes) and Nitin Rawat
> (added ufs).
> 
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---

With the commit message fixed:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


