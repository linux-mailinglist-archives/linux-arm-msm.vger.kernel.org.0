Return-Path: <linux-arm-msm+bounces-48477-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 537D7A3B82A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2025 10:22:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 909C718986B2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2025 09:16:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E80981E0B70;
	Wed, 19 Feb 2025 09:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RthxzhI0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F7461E0E05
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Feb 2025 09:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739956321; cv=none; b=lfRcgIyNQRKM7Y7Oyq/+80BiHkLJdEvr7ImMoqjGmA/ZYCSCtFYieq/rKHYTLPZC4MQP3ZeE4WpcjwJOYzrd4NroD4VO42CDxxkfRbqFNW+4IRFLwPI57vLkJY5VQA4zN93UIn/Ku7DiHTfc+HZ1swtYpIWnAyqctshduPJQLeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739956321; c=relaxed/simple;
	bh=pqdqicKugu6SrprJ2ukWyHWA7wIefRERcYkP49tq4X0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=RWoXEJC4oBRsMnPDUInNIE2NZiJYxxQ/UZrM5tv/UNATg8WYeLnrLD7tI4+U1ITB8j6WxxF3S+2jJgu7Z8onRf6KwgTPnllWYQn3s6FzHNC6ZzQHAgN7CyipXgWNN7EH3Howw03Vtcyf4WfL7CAKSzQ7QtlS8rUt323N/tO5eQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RthxzhI0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51J8lf2c008012
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Feb 2025 09:11:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RWf3hyFP9qHu3N+TuFQ4QO5891nOTUFYzZallVfx+Hg=; b=RthxzhI0ikeMV5qF
	oRwLSgv0b4EMML3CyFC3/foB8KEMdXDplHcZVyqW8HRNsSyS0bTMWtIyhJDfe7jN
	ktUHCSsr0jguNQnCaBwcg8UhYEQ3GDmfKB9XXei6VLAGakZPlM4ayl0sMDsNyD5l
	cOIy1wOrzWanUHBZHVH3jNujkXW80DscOklkNqNjQAPdhzUyq3jQs15Di6dwIyHN
	gvaD5z5PdF6VCcLc7lErGD3u0IgdlyhIXjtwEkW25krPv9wyXFn0w1R6VwCVKJW9
	Uf8AFultERoKj+aWO3NMIt96qms0SyJ+JDNAQcSyzLJ+hTDFhBviMuhD4C2umA0X
	gNGLog==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44vyy2sw6r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Feb 2025 09:11:59 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6e66e017ea4so5635196d6.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Feb 2025 01:11:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739956318; x=1740561118;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RWf3hyFP9qHu3N+TuFQ4QO5891nOTUFYzZallVfx+Hg=;
        b=W64Y8m/sTZImBVWrEuVlwmU467HUENkFNf5JIyypTryAeykZjGU8Se5hBMrAJgtoNn
         Pk1oS2ISqn/9XPwS7RRw4RI6ktqkRM9QyRuxj8pxYb4Zz+Bgt4JY9vDZX28Uiq2pWVnn
         9mbKvdvC7yJZg24fR0BtfCheDKj3WmDSsprwPwkNzdGUvUIDaeESUH6rPaAgOStEydPt
         6+GlukgZKqHP9kX9gAQkfL2V2XQrr7rYMsjJDKeO9FiHBjGgVc/rdJ+51aXAysgR1I4J
         VM4ONle3iKVao5pPt6gI+J/9i86RF3/FRUvF7dTyXAwN9YplQWILurQ2QXrGSMMC6wUY
         M1wg==
X-Forwarded-Encrypted: i=1; AJvYcCXtXK/8bZqU9vQRzH3sn6cz07Z0I4TiN6UR/LT+KQjR/tIHXcNvG0vWseOtSvE4m4tV+SZCO1zWZ+QXONxr@vger.kernel.org
X-Gm-Message-State: AOJu0YwI/18PO3NNW6tD4XVC2EmN7BGUyH+rzHBzVl91yb5CeLPzh2v5
	zbIfsd099qrsvjZOd5ZqtrNu47cO4VrbzvkXTu5Jpcmc21TBtgGWLxKFWuTHVvPADKby/eSAgFJ
	A6Tnv86I810rD+C9Pydjtn5HfQH85K7kYXgdqkfb6+RVHKYkvk3bPXDrccuSOcbbJTGayKXLz
X-Gm-Gg: ASbGncuadhuYzhQhNV1QztcipU9CIHKsSdJAHHvI+H5yLFbcgR8CtK3lEnh1iTTuwT1
	2ZJVhxs5p/dRun/LQ7gIrGA/PpiDwY7UHQgMkvoIv+/+0Eukqgy94V/kVjDyyzivsYSKI1DdHZf
	SacqlKdtUd6rsTUYePWJUUnB4LTxTWG0EVpgH/WQqDqHzdUgiY439BelHPpYUPLZ3sSLSolrKo5
	S8gQXnIi+6PwuPXD7jP+YBa2LJ3bp62gfzbpOUSQwNUBS105khZL93aeylIUFl55f3gsgyJJN8v
	3PqdMTZW5y06Z1Ce5ihbbQqLxP+vPQuVn1sbc5FUnB9MS4ZxChRNo1SvIM4=
X-Received: by 2002:ad4:5942:0:b0:6d8:f750:b2f1 with SMTP id 6a1803df08f44-6e66cf43fcemr85064196d6.11.1739956318251;
        Wed, 19 Feb 2025 01:11:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHh9qfRwSyNI6u3E0QX2thSjqiSHPbSUsOa4hdyGF7Wzxw9q2KMY9CN/e7qnLI2UuDgB5hIjA==
X-Received: by 2002:ad4:5942:0:b0:6d8:f750:b2f1 with SMTP id 6a1803df08f44-6e66cf43fcemr85064006d6.11.1739956317671;
        Wed, 19 Feb 2025 01:11:57 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb8e0c38absm654189766b.77.2025.02.19.01.11.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Feb 2025 01:11:57 -0800 (PST)
Message-ID: <3e00048d-ffe3-4594-9e54-ccc1b2edbe8c@oss.qualcomm.com>
Date: Wed, 19 Feb 2025 10:11:55 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sm8750: Change labels to lower-case
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250219090751.124267-1-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250219090751.124267-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: iWRI_ko5aI7HUMc2NCcTeea2uba1rNR4
X-Proofpoint-GUID: iWRI_ko5aI7HUMc2NCcTeea2uba1rNR4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-19_04,2025-02-18_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 mlxscore=0 bulkscore=0
 impostorscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 mlxlogscore=896 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502190072

On 19.02.2025 10:07 AM, Krzysztof Kozlowski wrote:
> DTS coding style expects labels to be lowercase.  No functional impact.
> Verified with comparing decompiled DTB (dtx_diff and fdtdump+diff).
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

