Return-Path: <linux-arm-msm+bounces-49549-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CB81CA4688B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 18:55:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 453B51888BBF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 17:55:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8A7F22A4E5;
	Wed, 26 Feb 2025 17:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gERYa0Uo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D74CE22A4D9
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Feb 2025 17:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740592518; cv=none; b=R4idBVMifgcLMYTU6AkOhaMWEiNIGAIKHqboHdzzwEc0b8p7TVJB6ZSwYCxg9tGTzlSLg47W3IN0rMWfOGAxCZ4DKjDQkdJEFSNukBIIEoOxcMzKX6GMXXM7bQvv5BdD8I4I+Brl7tbsqj+STmtgJc32NHz+hwEfxykDhHqS+5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740592518; c=relaxed/simple;
	bh=GpFW5tb6w5Zxnnk+co07dwBjXCBsJZQTjZwgp/lZHVA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cR40VZ6wX3sOAXh9EocxzG0H+SQW2/Yvug8oyrUBOuMd24EfqAh65JR3oYpXmsn46sVopNw5l1ndGXtDSGmHfvTFmO29W9UHJN3MZFI+jfliYzyHi+PvNI/3BgKjQ8y/ClVnrWWBL3loQ2c8/R8St/2wz7dErNrkOSTZo+AuKk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gERYa0Uo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51Q9mZjh021536
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Feb 2025 17:55:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ug4hAHKEAsupgCQgj2U8+TkMQ2h82a7/mZMYq9uA5mU=; b=gERYa0UoZ9EN2kie
	FRGbDr037ohEB/SuVUogW/ZoJcbyJhMdQ6JM1TmsFPCMSJGow9HVC0RsQrPquxmx
	J0bqQ1F+ujmszSZxVn46IklZ1E1rbd55sigBm36wCs1rNfwxrRPsrp+TmSz6zhkq
	kQ9/8KYmjw0XSaaLdY3QHjhwNCdVrp+3cyAB7od1S8brcu+ZbFkMRBQEjavTesWe
	+xjHGliisGynx9ko1ZS0LQW4bD4/QduVqMsPnikRMlRbJ+Ii0jelN2/DzErZXShz
	RSvMSi688EkRXrEtVfaO4qxKjS7vbImn01ipiQR88enT5afOcG4tlu2BhXpk2tYD
	7ywxCg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 451prkju0y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Feb 2025 17:55:15 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6e4546f8c47so373386d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Feb 2025 09:55:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740592514; x=1741197314;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ug4hAHKEAsupgCQgj2U8+TkMQ2h82a7/mZMYq9uA5mU=;
        b=XjYx+BSfkv6ysmyddIvgWO/5MA9DrhBcQFeHu3DLVime8uwB0UcMv0XegMJzx0MRMb
         2UtU/X3JPX9Ss5J2av5WcqcDByEQnzdAtlF4Njm9texJhGw4s9Wsd5wM5XsgVdMzRuAs
         Swv2koaLzGz8iKqo7j+7JJqqAd71306HBrgSKVn82+rIvultT/YhvtkfNkiKa20Y2lXo
         zn6EL1004bxCYqoTl54CptbVnU3Zh/TDE4fU3oK9SxsGh8fNxnzKbr385YlnWYkq2pQT
         kBDq6vvIoimUBjgDp5HN1mFOzOReJNUaxgnsVZRiqu9GtvTJwz+QrvpZBRo8IXUHkHFx
         DViA==
X-Forwarded-Encrypted: i=1; AJvYcCWurA7bmLEPPzeTp0SkLv+kEPVdcmwsTJ9ylT6g91WQ/a254wiKcRDGUkRm2BPqRMU3uwS94X0md63yJ1lA@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5UFNj1jDPjqdcD9drxoMFCkX8XTPruy8SqpF4lCts3FKWywM4
	OX1k9Ntv1lXchx15EADAUxeChuqErrmKKydBO9/us0yeM8UtiPS6d1BkRpch0CzAxireYpqOgFa
	0mYue/hI5r/HH2K652a7YBIOgcIQO9E8GzXRG2Gk6yDE18GeZocoQwcQL8OQMCUlJ
X-Gm-Gg: ASbGnctqOfymTwANN0g6A2uelLE6vWBxSdCjQXZuTnMgmJOb4TPoTpCUJoHf+nENDzD
	UNBZDTexeYlAlbYt5ju25y1ia0rdBdDmX3PzATcJSVASk0WE8/Gsng89Mdzbdar1zJuJGk/AK5j
	MA0J7d29aAmtYVaJWLWqw8XJI0BoQXLoI7O4/iuZXFOhef3C0a/Qr8emmI3erebLEk6Aaqp5lvc
	5lnc3W1dJx3lPBbTez8fNwrTWOtb/mWw+cvKnVNMYdnE03XZQeRUjnHtotai9nfhaWMNwM5aLZy
	H1sOJgrIvS65V+eJT59Ywi5/9kxaVBv8yYD7VrV8vXkI7X4Xfw86hFzUkCdKYlIODvGMBw==
X-Received: by 2002:a05:6214:c64:b0:6e6:9bd4:8298 with SMTP id 6a1803df08f44-6e6ae9bc159mr104062876d6.9.1740592514682;
        Wed, 26 Feb 2025 09:55:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFB+bAYGSr3lxDK6a+c5HGa70nt51K+vT3MgvlcdHMqpTqUvcW4udBi8K1H8W4pmZUiXlLwUg==
X-Received: by 2002:a05:6214:c64:b0:6e6:9bd4:8298 with SMTP id 6a1803df08f44-6e6ae9bc159mr104062606d6.9.1740592514272;
        Wed, 26 Feb 2025 09:55:14 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abed1cdbe0asm363939366b.36.2025.02.26.09.55.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Feb 2025 09:55:13 -0800 (PST)
Message-ID: <137331ed-2f5c-47c4-99d9-e932673dca31@oss.qualcomm.com>
Date: Wed, 26 Feb 2025 18:55:11 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: sm8750: Fix cluster hierarchy for
 idle states
To: Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jishnu Prakash <quic_jprakash@quicinc.com>,
        Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Melody Olvera <quic_molvera@quicinc.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_lsrao@quicinc.com
References: <20250226-sm8750_cluster_idle-v2-1-ef0ac81e242f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250226-sm8750_cluster_idle-v2-1-ef0ac81e242f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: TCgB5EuoTlq-6FNPiW3XWTyumcukr_e-
X-Proofpoint-ORIG-GUID: TCgB5EuoTlq-6FNPiW3XWTyumcukr_e-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-26_04,2025-02-26_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 adultscore=0 phishscore=0 mlxlogscore=787 mlxscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502260141

On 26.02.2025 7:51 AM, Maulik Shah wrote:
> SM8750 have two different clusters. cluster0 have CPU 0-5 as child and
> cluster1 have CPU 6-7 as child. Each cluster requires its own idle state
> and power domain in order to achieve complete domain sleep state.
> 
> However only single cluster idle state is added mapping CPU 0-7 to the
> same power domain. Fix this by correctly mapping each CPU to respective
> cluster power domain and make cluster1 power domain use same domain idle
> state as cluster0 since both use same idle state parameters.
> 
> Fixes: 068c3d3c83be ("arm64: dts: qcom: Add base SM8750 dtsi")
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

