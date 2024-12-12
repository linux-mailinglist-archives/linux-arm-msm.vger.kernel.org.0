Return-Path: <linux-arm-msm+bounces-41839-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E439EFBEA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 19:58:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 54BA01884632
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 18:58:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B7341D79BE;
	Thu, 12 Dec 2024 18:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wbw2qzj+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7E4F1D54FA
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 18:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734029721; cv=none; b=NenAoK6OFBDE5O8z3WwtZU0O13vZX00hVxnOReJ9ucpKsiTHrh/yvtoUFu62ZsoF1sTxl7R4cB63rNAQuqCeJdwEz7GrNfk5/HIJ5I3yAy/4OkJBBE9NYhp69zbqJUlAKeAYv7ghs3DkEY5Yd+LcN7yI1nQDs/YZox2wyeaAvJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734029721; c=relaxed/simple;
	bh=VHhYoiObE0x8hLOMYDgi1EiHys7DUtRw2WTp58pMJq4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YmlEa1wZDL7SNM38dipwFT73NuNXcQksBpeuvSwi+gMw9Id4OYtIxQmQ/cFrFdq9guMCV/wevyRkm6TXSXYb3Ppbv5WgQibCAWlMSG9JLKumSU/tqfHgmIwNqJQSYPb2EAPTqTMajwjqCSs7Pjm4OWjja9hgZyqW0bGMf25iUmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wbw2qzj+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BCFka2v019198
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 18:55:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NdKzI7BVahLv34AK18VKfYKAJg+CMnnVLwMtkBIYJeM=; b=Wbw2qzj+UFHfrImB
	BNWsCJY9AwgfE3TodzH/FxNfrEbn3a/iFBz/9Lv0bF4ygzDdUXXGwl+y4JAyAEof
	53qFxiZeZrTzc2gTAQToQlIFZ5fEDqy5xXqij1JCw8APY3ZwluqHHe1O1rwHribN
	6ASpputkK//OrkoXuYwOXUBZC1nPPDHwSgvWkMhfoBdiYIFA9ckwWTwPUPDMc9gx
	GcvWD/FeT7AjusnBrY8OJRDUcHbgcX12VTHpntaIx8MZ9w1XjEzATAwm4/rbWR6q
	7ZVFhdNWHTmRPiJ0lWcoekXvzpgZFFeleiKy5gxhfsmD2oLAmCoNOoprOvjJDb82
	+/VUgg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43ffdyuhvm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 18:55:18 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7b66edf3284so3713685a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 10:55:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734029717; x=1734634517;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NdKzI7BVahLv34AK18VKfYKAJg+CMnnVLwMtkBIYJeM=;
        b=l6QSyCvAw4reRUg9rk+E9fJK9BI+TiIDiiFy+QERJc94JwDFFLYxxGbm+rosRDXTqy
         JMTTnkF6IfXuEbLLZawQ2ScyMyEEiLy/0Df/A/cNOb+eyLD8SV7pqd+0gHKOmj+s9Djp
         OnqkX5FQF29EbHQHXM4RKzA7fBxy+XjpyGOlXYW3snxdOB3kqR9m+xk7LfKNH9IvuNes
         QehgZP25xoIAUzzeJeH0H22W8Li35J7UL4prABnjlhKPsOD1PYZPxDIAYtWWGjLkJCWT
         bgVmqNsK8hR2c2Hrctbw1uTAXkRZIwR00lHIl+q265iyu84Tef8NPXtayJvw0hsUaeEy
         hydQ==
X-Gm-Message-State: AOJu0YzglbTBT8XMvMcJZUl+AFqDSJfSaWyMis6YQOGoKD6vDprkZ/9S
	Xr278UpjwbE7e3AMbSQEm+WGyH1wY/0nQ7tBL6Wiox2K3tsbTx9yj9DE8fCVspGozaXXb2YtsEt
	QPpBXBuCYN1YATiibWWARBMfz0WjLPFMrAMAs9oWhjaG+ih1iXf+Mi5qJ8WWG995a
X-Gm-Gg: ASbGncsY95UIH4qZmLucxsuDOsHIx/i3+kYAED/FcUcYLahaegdR5tmxJr4d+F8bTwp
	dPr56sw3LFuz0bcGgZ+S/d4+Mh2SOoa8mlGR/JeKODEoZ+M1F27Q0Nz3DWNNZRt+SET1wYD0Nkw
	b75aTTtlzA6J5Eh8bTqmgItmXFsoC0TaJa0l1NE9b33FywclpT3wOeAKIZnlM8Z+BdoMFimYnUt
	Zq2AjPxpCcWy3cDKkYG3aopO/3W/oRMuYRzvt/FwOF0dqdGh3LQhONsnlZOuBW+yUJ9xYADMxTY
	nt3Ah14AI5GlJjVEuIRaEcF87PPF21MUvB/wDg==
X-Received: by 2002:ac8:5707:0:b0:467:54b3:26f9 with SMTP id d75a77b69052e-467a14f7441mr7701231cf.5.1734029716687;
        Thu, 12 Dec 2024 10:55:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEWCiKp6+/klLKJfer1Q2n1EF6bgJ4k+IvJwiTon8zx1liPjIDd5Tp/nxpEOtnrhQDhDcJMsw==
X-Received: by 2002:ac8:5707:0:b0:467:54b3:26f9 with SMTP id d75a77b69052e-467a14f7441mr7701091cf.5.1734029716346;
        Thu, 12 Dec 2024 10:55:16 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d149b4a049sm10632829a12.35.2024.12.12.10.55.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2024 10:55:15 -0800 (PST)
Message-ID: <283a594f-1fa9-41a9-b9e2-fc76c7deceaf@oss.qualcomm.com>
Date: Thu, 12 Dec 2024 19:55:12 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 15/19] arm64: dts: qcom: sm6350: Fix ADSP memory length
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Abel Vesa
 <abel.vesa@linaro.org>,
        Sibi Sankar <quic_sibis@quicinc.com>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20241209-dts-qcom-cdsp-mpss-base-address-v2-0-d85a3bd5cced@linaro.org>
 <20241209-dts-qcom-cdsp-mpss-base-address-v2-15-d85a3bd5cced@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241209-dts-qcom-cdsp-mpss-base-address-v2-15-d85a3bd5cced@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: AjLqiM9UfQCNk6zpOBxdANtuw1IyPZFx
X-Proofpoint-GUID: AjLqiM9UfQCNk6zpOBxdANtuw1IyPZFx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 phishscore=0 mlxlogscore=859 lowpriorityscore=0 mlxscore=0 adultscore=0
 spamscore=0 bulkscore=0 impostorscore=0 priorityscore=1501 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412120136

On 9.12.2024 12:02 PM, Krzysztof Kozlowski wrote:
> The address space in ADSP (Peripheral Authentication Service) remoteproc
> node should point to the QDSP PUB address space (QDSP6...SS_PUB) which
> has a length of 0x10000.
> 
> This should have no functional impact on Linux users, because PAS loader
> does not use this address space at all.
> 
> Fixes: efc33c969f23 ("arm64: dts: qcom: sm6350: Add ADSP nodes")
> Cc: stable@vger.kernel.org
> Tested-by: Luca Weiss <luca.weiss@fairphone.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

