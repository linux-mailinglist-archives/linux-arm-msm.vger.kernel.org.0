Return-Path: <linux-arm-msm+bounces-50822-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 250E4A5934E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Mar 2025 13:01:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 55D1A16D32B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Mar 2025 12:01:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CB98225A2C;
	Mon, 10 Mar 2025 11:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XxFhFW0v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88AB121D59F
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Mar 2025 11:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741607954; cv=none; b=HlFcDXbRxd4huvoWFs9m+S8F/boy0w64dMEr8tmTIeAyblY3BHpP5cULPL7BtUNeqFKtxBv3iH5yFY2Ni6zmU1dnJMwYrLte8efAqGFGFpwsUcN93q/c4N6cqg+hOIFlZevT23K1qUtJgMqXgLRPhOwJ3YdVDKFa9r+IBcIG1kE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741607954; c=relaxed/simple;
	bh=vZZ4vyDwh4ny5i1Bv0bpfWfGLBspHIiStvxiORTJRRU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GvSqVffNbQ39/Z6YPqcqm5lOp5Ow8jag4OQquRbvTL3npiGAYm3KQ/jYU3u6LkP4WMw6vZj5SSDZvWqZ8W1Kwp+5UDWFt1HsZ1ALUFCyZqcqt251gxHpn08mAXL+R4xCfFX5yBe998Ajq0/HLBwXcc32InWXJabRQU1qYbQ8XqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XxFhFW0v; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52A9PpZO026868
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Mar 2025 11:59:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wZYqEqO7y6IEW6xhayczjh6S+v5v683/p7g1JEP0aCU=; b=XxFhFW0vNsnc/ir3
	2av0KwyB+HzN5+TOhSuWWH0c4sCfHHVTTbNtuoLAFrlrooTb2nD1D6BXYR+wajGT
	vueamw10zipsEvogC1ZWzUKFPS6fZGHBEirxWukSVUGCrPGyiVKGDFCjyZrnu2sl
	IxzzI9lJ1PhPtYabKHYIrGcyKESr6DsBujkLefRsK3gUD+5XbVUYAtrnfXW9IX3W
	Qakjs8FolphfmnYS1iqVRqbFkgcHhWWzOzfY5wwa7rGmEA2n/dPW+VUk18k2I7Th
	CgMMk8g6/6Pb8P4mqr2LDKWsrZTYJwuC0iQ1Akh47ba4oO6jlF79JhzZDhERMxAg
	aYfW9Q==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 458ewk4ppq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Mar 2025 11:59:11 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6e8f3c21043so13108446d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Mar 2025 04:59:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741607950; x=1742212750;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wZYqEqO7y6IEW6xhayczjh6S+v5v683/p7g1JEP0aCU=;
        b=XqKnS/d/ahuG5j3u51drMQ2Lgvn9Ww7kYFnR8HjkKTqdheH3OEbGdda7zPI7forg8T
         j4tbEHP+Q7H/RxkEefPHxBh5MbuCjZdHCikIkuVCB3G0uB+vtNEEzWrzMfPiuxvMOoHG
         nAdCtx7e8Y4X31KOsdPzqDM3GgxXj39OUFk9KqWecIRepj1OTsT9YkNj+NdFtugC9FZA
         /1WEoBwSlKFNrUYYalP03zAEvA3as1CRTv2ZZLLJfLs80j8jM97Ckfc9vJvDt8Y4OCEz
         vD3cEY8/xj5B6FEeSUlllXhjUAtNU7Mkyhza2TmaKTlV9xel5xf82snUR/xkjkcDpCuZ
         fPgA==
X-Forwarded-Encrypted: i=1; AJvYcCVmUly+5oQlYuJTMCIubsTNd55Vakz+IFsHjqDAOFRQ+AL9p/Y6DWDLitTBQTLnFPfRKklvxR6cmLDZ+Y3t@vger.kernel.org
X-Gm-Message-State: AOJu0YwWgWbrlgLazq4IklqLvvyb8yDxE2Mgetf69ufPiqiHjD5C69zA
	AF2fxDjiBWKIm9uxz+K/Bciewr4MJvsUMR76kbh+TNU6Q4L+R7sIYY+bh9wXj2BxrhQs24HSXVG
	IjsbCaAbQ3Sg/Rv6G/CTsegsPNfYOHY05oVeGWtGMILgp2dnr0VWNaGWJRvA/oH+q
X-Gm-Gg: ASbGncvbteg5kBkwhVOlY1YgRWyFe2nVlJOqqVYwimceseyrWLTb1xfhCIllUhDZ3W/
	vMwz6YSWqmniwmN4QIDQD14/boQCu0d2SW4XXucgwbwfXhmv8OCEFngv9FsvNxayQC95rCcPVHl
	Qi54pYtLARr2sOelK3jxd+a5SH/ACxpnjziSpoqFDvh/w9hQZYfklf/XfXQzGs11waOet/CPL4j
	M/C7zKHCh2EKePuqlXJlBbbORgarOXIEovUqpYtgJ5N4UMFe3QNsV8QcwLagWACW3/RBsDuimqR
	GjGALyBZivMyaZgAon/7UhLnKeqTl3IkGclNcqN6en4Wsh2b86SvHfGZQjLm+ADrb4P80w==
X-Received: by 2002:a05:6214:cca:b0:6e4:449c:ab1d with SMTP id 6a1803df08f44-6e908c7af1dmr53814336d6.2.1741607950492;
        Mon, 10 Mar 2025 04:59:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH+dc62Lb7cFI5B+K44MJO8WyhCF9aelMEmIDlnu0VNMly7eoQPTcUOinmH7PMZ6O8UBsYDSw==
X-Received: by 2002:a05:6214:cca:b0:6e4:449c:ab1d with SMTP id 6a1803df08f44-6e908c7af1dmr53814226d6.2.1741607950102;
        Mon, 10 Mar 2025 04:59:10 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac27e11c457sm378242766b.126.2025.03.10.04.59.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Mar 2025 04:59:09 -0700 (PDT)
Message-ID: <9c64c23f-7e0f-4795-9747-a48f857e8947@oss.qualcomm.com>
Date: Mon, 10 Mar 2025 12:59:07 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: qcs8300-ride: Enable second USB
 controller on QCS8300 Ride
To: Manish Nagar <quic_mnagar@quicinc.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
References: <20250310104743.976265-1-quic_mnagar@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250310104743.976265-1-quic_mnagar@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Tr8chCXh c=1 sm=1 tr=0 ts=67ced40f cx=c_pps a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=T_qEUXwVCjydKuttoeoA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: QZ1guynyTpgeRg354_LRdAbAdzi5YDge
X-Proofpoint-ORIG-GUID: QZ1guynyTpgeRg354_LRdAbAdzi5YDge
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-10_05,2025-03-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 priorityscore=1501 mlxlogscore=847 spamscore=0 lowpriorityscore=0
 mlxscore=0 clxscore=1015 phishscore=0 malwarescore=0 impostorscore=0
 bulkscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503100095

On 10.03.2025 11:47 AM, Manish Nagar wrote:
> Enable secondary USB controller on QCS8300 Ride platform. Since it is a
> Type-A port, the dr_mode has been set to "host". The VBUS to connected
> peripherals is provided by TPS2559QWDRCTQ1 regulator connected to the
> port. The regulator has an enable pin controlled by PMM8650. Model it as
> fixed regulator and keep it Always-On at boot, since the regulator is
> GPIO controlled regulator.
> 
> Co-developed-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> Signed-off-by: Manish Nagar <quic_mnagar@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

