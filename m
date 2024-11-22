Return-Path: <linux-arm-msm+bounces-38843-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FDDC9D5F54
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2024 13:56:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D1ECA282201
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2024 12:56:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C3F11D63FD;
	Fri, 22 Nov 2024 12:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BJr8FhGu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00F301DE2B9
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Nov 2024 12:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732280180; cv=none; b=fuicEqsRFGefiZUVUYkAw5+jTAW3kcrlmA+atA8oU32GGIbWEhWg59DkGUbRYwdP9pOeniD3ogqrwLlS7skyPw7pdr/HXhntc/b/DuPsgS/VCmz51kMPE3P6IZuarmcKHeSpxtTYPPdh0adKUDEIEWfCKWtaah6LC05Lmpt6XXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732280180; c=relaxed/simple;
	bh=OO5oVuYnc2B3ODhcqc01drbOppw1jE/67j9F715EyJs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pWfnw7O6TZlJecJUnmcTcofDSXq+OnbOeEeffpPY5AoUZLJKNDmz0wxFp1rBR3X0iv9byKxqrQLMi7SuyqYBPmVAWIWHDd4Np9j7H29StHE4aHKtpKmWKoRkvyWrTYpsRVo40t6YYE8FSn+W2DYzQJrMlSTphUzy/zYwN/37hd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BJr8FhGu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AM8wa3F003963
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Nov 2024 12:56:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tUW1JtHByRPvJW3av3yXvdSnDSeT0Wq/tBStqi3Mqhk=; b=BJr8FhGuZpvWhucl
	5S4DJ53D8opMhrDATMHKsaoJlru1mf5X6WoHhqRyA8oj91xbWY560QD0RJLSdBLq
	nGVvh/YTUdN5L8UdqrIzSBk9v25tLmIcqs7FaLp+Cmo6mcpO93XkYxx2QMwY+YnF
	TTFBTuQnRTJPlrMnTfaJa3+yDbvJCTqnYsvc6x0pWLmGHCBXZVD1kb/DscD6YQ4A
	Z1SR8nXTWDKQ1rxJxE4RQvqPdR/3cP41EVZRgNg3RGvebngcpfwzCBX0UKHbIPQD
	d1k9/zvVoA68/VBfLdR9zeJkhR+5s6IZG+xfTVPfo+HNuxo9A4QRauR/YTTEbXSZ
	ORQOmg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 431ce3fcka-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Nov 2024 12:56:17 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-460a7a53e1cso4335951cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Nov 2024 04:56:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732280173; x=1732884973;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tUW1JtHByRPvJW3av3yXvdSnDSeT0Wq/tBStqi3Mqhk=;
        b=UkXIOOcm5EhezDq//68UNtKV4XDf18ZuL6o5k/mfMh4Ku/3r21zgj0is8ia2brEf3N
         pzGMLTgsOvQ7u7AZskWMtfIphKaS8Df4h1MnTSdEexjC+piAafyOHLuFtZgtZNTsYov9
         yl6XcZaDV02xSaJ832WLkV+kE2WDy0niysbTvCDpSkWQRdx7yK/kbnj6p+eav7hnxJHo
         W+SpcAgSiZOPn3PKYOjNq+Brbqn9FBJXFj55uvU6lhcIqsNX4OVw7qNXsWB3YG3POeHk
         gvpG0fmbUjB73b58Opq82Dmw65dKBaDCHUzGE4D71c18JsCd8gSAg7ETjxwlRAmzhOEE
         pLMA==
X-Forwarded-Encrypted: i=1; AJvYcCXKKmonK/HlLU/fyfELPj15ub4EfZ4yJjx7AmoNqX9PRTuZcvsOzGGfXzDpktWXz2nlkOupD1/dF5RHYFjr@vger.kernel.org
X-Gm-Message-State: AOJu0YwJGJZd5rCi5ksOjw27jKdW23we0ovVSYuPozbPE1dbQ1yqxmYy
	KAMfY1DFCVR1DfvaL+jkgH9CwwBUw/sD8qe/lhGLjK6S9BDQcGYJ4ww7pbaMxVcKtVZfaOdh8Ok
	Xapc1oIaiCwemD1J+PjPuE/LJjXNt4cCO0utI7fx6BfDyj1MNfd2jKvEXyolkg89M
X-Gm-Gg: ASbGncvFJjb7yiHywaxKA4R3BbLfjBP4JryStE4WM+pyxz6ILbIwTtkzw83PzePv/Kv
	XIpUEx0UYr6RMaCbQVm+10g4emhPwP6JYbSDwxwIJukzv8uamLt34jVv0nP4ctSRd9RhC2azul0
	rt2ZPNKnRrGdZya70KipyWpBvlg9El5y+Ir1hAfFdQZmge5Q04gjMIZVfvmlOtx20QfNNBc0m4x
	5/H6P5gH322tYo9PWosKq0RZABY4dyMjwnP5G2kxa1DmTKVg3tUJm48JDboS5iSzgkB4aJqGwjj
	rFQ/wOaE77ei8dd6ZtkB17HysqSlunU=
X-Received: by 2002:ac8:7d49:0:b0:461:3cd2:390 with SMTP id d75a77b69052e-4653d6207ebmr18354521cf.12.1732280173688;
        Fri, 22 Nov 2024 04:56:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHXp5AlSiVdDRiJeviQopjOcYQO2cIs6n/WiIeQPHdV9fV3//vnc5hbPIVnUu+s0vmPw9sPYg==
X-Received: by 2002:ac8:7d49:0:b0:461:3cd2:390 with SMTP id d75a77b69052e-4653d6207ebmr18354171cf.12.1732280173259;
        Fri, 22 Nov 2024 04:56:13 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d01d3a3bfdsm897816a12.5.2024.11.22.04.56.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Nov 2024 04:56:12 -0800 (PST)
Message-ID: <e107da7e-cc12-405d-b5d8-589959df072c@oss.qualcomm.com>
Date: Fri, 22 Nov 2024 13:56:10 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] dt-bindings: PCI: qcom: Document the QCS615 PCIe
 Controller
To: Ziyue Zhang <quic_ziyuzhan@quicinc.com>,
        "Rob Herring (Arm)" <robh@kernel.org>
Cc: robh+dt@kernel.org, devicetree@vger.kernel.org, quic_shashim@quicinc.com,
        kernel@quicinc.com, quic_tdas@quicinc.com, quic_aiquny@quicinc.com,
        quic_qianyu@quicinc.com, quic_tingweiz@quicinc.com,
        neil.armstrong@linaro.org, andersson@kernel.org,
        linux-kernel@vger.kernel.org, kishon@kernel.org,
        manivannan.sadhasivam@linaro.org, kw@linux.com, lpieralisi@kernel.org,
        bhelgaas@google.com, linux-phy@lists.infradead.org,
        conor+dt@kernel.org, konradybcio@kernel.org,
        Krishna chaitanya chundru
 <quic_krichai@quicinc.com>,
        vkoul@kernel.org, linux-arm-msm@vger.kernel.org,
        quic_kaushalk@quicinc.com
References: <20241118082619.177201-1-quic_ziyuzhan@quicinc.com>
 <20241118082619.177201-4-quic_ziyuzhan@quicinc.com>
 <173192264707.1449621.6365585789543415603.robh@kernel.org>
 <4226d136-034f-4b7f-a82b-e370ef265958@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <4226d136-034f-4b7f-a82b-e370ef265958@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: fwBOJnwk05AAthncufwT3VF_B5MK0iTY
X-Proofpoint-ORIG-GUID: fwBOJnwk05AAthncufwT3VF_B5MK0iTY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 bulkscore=0 mlxscore=0 adultscore=0 spamscore=0 mlxlogscore=696
 suspectscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2411220110

On 21.11.2024 8:22 AM, Ziyue Zhang wrote:
> The dependency is missing, I will update in coverletter
> 
> On 11/18/2024 5:37 PM, Rob Herring (Arm) wrote:
>> My bot found errors running 'make dt_binding_check' on your patch:


Please don't top-post

https://lore.kernel.org/lkml/YH%2FfM%2FTsbmcZzwnX@kroah.com/

Konrad

