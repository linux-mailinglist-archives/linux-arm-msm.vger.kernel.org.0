Return-Path: <linux-arm-msm+bounces-54354-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E3B0A898A8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Apr 2025 11:52:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D3F0E189E976
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Apr 2025 09:52:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3111B2853EB;
	Tue, 15 Apr 2025 09:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pAR6955Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DF6E1624CE
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 09:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744710726; cv=none; b=FsX8jrA6i0LvwBBojMY59lVzQsNat/s/qwYWc0LK3DbhvYaL649KBcgwGHdp6Ax8DDLQag7LunjyI41jEvrugY+V2tsf6QEtU/MvKx9wqCrNqcdrAOxr10mqSGVXd/GKHVgpkCGQZOYrh2iT8NjBCJqWmsptNyIzl/Mh9i3rZ8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744710726; c=relaxed/simple;
	bh=5qAle5UfrhH2Z+dS32kl8cqwoturGrnYekj2LzhEugM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MERdIPAzBQu/qDEVleCptZqxL7atKIbZ4cuBnn9ZsMZTNAdWi6JsBXVDcfVC90sndjTYLjjhl2c7+zSou/QzbU78C3rjsR9bsyYhYxWmYP2ckD496nt4avfyZ4c4k7/qu40d5k7lY10yCv4oZAaNuLTPbJD2g0yXmEEy/s/6GRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pAR6955Z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F8tN6p013256
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 09:52:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ebp25KTVcY1mUAqA9R7DsK7wGxUkxQQ3jeK5351XBkw=; b=pAR6955ZBN+rB+Xu
	Ug2zNd10LaLaYRvzPKm2NsQkiyUtPKGRyaLHgaruAuxeshAn6v2SyMpKeKSnbVm3
	5Is1o2h5kNsOzAeaskQqzmCfIdKMvGs5vD/+mms/2KxuNYqySHXZE0eVr2R8dZ+k
	n9XqCRxU4uMMnpnCelU7pFqByzzJnh0ugW4DLh9vHCGPCxkWKWNjo7VabkCZgS36
	+hlPjhFy7KnqEKJMOx9uDr7gzhie/j5OjC/K9+ZzHBzfE7+wSck1hZ12dKSzH/TH
	JF8ZIE9kxLuhVXHyW1kLGYVn3oWlyeR9dd+Un0JrUdg0aDq0t6mPR+7s7Y+R/THv
	v9iGGw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygd6fj71-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 09:52:03 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5841ae28eso122664685a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 02:52:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744710722; x=1745315522;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ebp25KTVcY1mUAqA9R7DsK7wGxUkxQQ3jeK5351XBkw=;
        b=CqcKQ/7sFWv8dFJxtB7KrUP1gp36gsrq/7+Mw3ClnHJeHZPx1ObdGG/EKxciG0Tovy
         ztMOKPIft/1GSdRku9w8PKlvtC6+WGdnQLO158YxO8NvhcNqB12pRlsx+X8l4RKMGBXy
         rXnva9PVnqLAj9k1kgjWYdzKPRI4vzTWZSH3c6VCcMS508Q5DQPofIyr7co2ap9giRGq
         BVbu4OEzO1Su1bqnxVb/ccYkwVlmylfbQ2t0K7OS+809nJHHcBJVrZWB1gtuL6pZrODG
         1wh86PqPmdTYInzCnic5s4aztSlF3N1rJ+yehFj7bMqKiS2zn+Jw0ey4NjQsnaocNe0k
         qRjg==
X-Gm-Message-State: AOJu0YwVqYyA+LafnUWbI/bmrAf+3Rf+gLXjYK0RHaU6oeHOVGsnU4Vu
	2oIMu3Vv4B5fIoDUYJZvh9BysdmTtL14Mf+x9TJAsB90XTrWkA+hhFnYfBc8Ll8PYBmorohOmAZ
	dZkAqle82GyeVOT2kEENtqfX9BTjcLASHNTthLgPWDF4xAVBZ/tOPJ717m0dvu2B5
X-Gm-Gg: ASbGnctD4Vk64HthbmBN3PAY3MfNAGcvyzl2oUhPLm2XQXK8YGUhJMoQAlWaq/egSG9
	b+3LvmWTSwoUQgHZmHdPhtVK7pq//I91/tZWki9RqcCaAS1HdLjIoQSzAZ/rJFf21r0aDwJ09QH
	tP4NBUXSJ8llGli0sEqHhMjUkCsljUSuTsJelqwnlBnGfBF0heMysqUk5OXA4sTiIz6U4DfcIQ3
	p67Iy1O9coM2pIdn2pEQGE1k4jriBzQ8KxQGDslkHWZXgl9+O1BfY0MbooxQQ+Efw9W5io2oMHh
	Kx+hAnomfSMrKXGc6KhgCM/+iH178v3G6Mmb5oxWw6VhmI1066TcTreLNoDBwq1Sj4Q=
X-Received: by 2002:a05:620a:28d6:b0:7c3:bcb2:f450 with SMTP id af79cd13be357-7c7e5b706c3mr148947085a.15.1744710722545;
        Tue, 15 Apr 2025 02:52:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE6eE3aexRTtrLGQXx+8WtgcWasctyUV4noEcYBOFknm9DaHBEdqfmSXMP2iUTUVqabA0Ebxg==
X-Received: by 2002:a05:620a:28d6:b0:7c3:bcb2:f450 with SMTP id af79cd13be357-7c7e5b706c3mr148945185a.15.1744710722203;
        Tue, 15 Apr 2025 02:52:02 -0700 (PDT)
Received: from [192.168.65.246] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1cb40c0sm1076488366b.109.2025.04.15.02.51.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 02:52:01 -0700 (PDT)
Message-ID: <c9a91cf2-f9c3-4687-a68d-c34209c4520c@oss.qualcomm.com>
Date: Tue, 15 Apr 2025 11:51:59 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] arm64: dts: qcom: sdx75-idp: Enable QPIC BAM &
 QPIC NAND support
To: Kaushal Kumar <quic_kaushalk@quicinc.com>, vkoul@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        manivannan.sadhasivam@linaro.org, miquel.raynal@bootlin.com,
        richard@nod.at, vigneshr@ti.com, andersson@kernel.org,
        konradybcio@kernel.org, agross@kernel.org
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mtd@lists.infradead.org
References: <20250415072756.20046-1-quic_kaushalk@quicinc.com>
 <20250415072756.20046-6-quic_kaushalk@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250415072756.20046-6-quic_kaushalk@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 8JXlc_xXIQz7tVtwzhShRXaPs3hJStnG
X-Proofpoint-GUID: 8JXlc_xXIQz7tVtwzhShRXaPs3hJStnG
X-Authority-Analysis: v=2.4 cv=ANaQCy7k c=1 sm=1 tr=0 ts=67fe2c43 cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=WWQFUNGd85j635JlVwcA:9 a=QEXdDO2ut3YA:10
 a=-9l76b1btMQA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 mlxlogscore=744 suspectscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150069

On 4/15/25 9:27 AM, Kaushal Kumar wrote:
> Enable QPIC BAM and QPIC NAND devicetree nodes for Qualcomm SDX75-IDP
> board.
> 
> Signed-off-by: Kaushal Kumar <quic_kaushalk@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

