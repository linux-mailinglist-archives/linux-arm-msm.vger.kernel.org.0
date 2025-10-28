Return-Path: <linux-arm-msm+bounces-79161-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E4324C14219
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 11:39:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7D6AD587B33
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 10:38:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 429172F4A19;
	Tue, 28 Oct 2025 10:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QBhfMgQz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D296F238D54
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 10:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761647927; cv=none; b=iUekGuu7xd+GDTJDaK4Ds+bg3iZ0+ek1C4P7UWMbVfoGWu0x73w6d3qBdLNQdiCVwZDdL5cJsFMHcWZZvrHJhSw8CKJRvYhA1rIBzR3FyceT4qZNy3aS1ria9Ewgj+jXx8kErY4q1ssfAKUKtO3N+xByhcbxztuMn8VY8liyRtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761647927; c=relaxed/simple;
	bh=uSFUVY+luc2r0dmmvOXHLV3CbFnFPlkKvrQeqh2EgiE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OBrVNUdcFgSQYqWCCbk6jvtSLoPe+LtXBpe2L7Fw+64ww18Zu2kwc2Ia0R5Xqs4MhNgqdA2gnRE9vk9n79C1MWYZaNZLacYYJN4CrLzlY1jo/eV/8yBfCz+oEKls9ChX3bpD2ReEUUCHUo5s+jJBBxqjNvCsEb/A1Tcic25uVGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QBhfMgQz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59S7cB8d2752124
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 10:38:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Jg7Q3HNJiU7N99bYi9t626jJ2SX6hSf8hOLmETMSVfc=; b=QBhfMgQzhlbXhPHP
	tO/O2UVAAMY1hclDNCz28wKMilx5kZa1S23JZdl0Yn81nq2H3YTezwUKR0fNZK1D
	J8Of72jl49Z/SQGC3eitOW/pxKQWnkZzMwQfDjmgvohPMIz8aLtrg529f6RpueYR
	PqZS18ahB8PjvhpuBzsvsdVr1VVtR2bO+rpvhK8o3/1Iv+8r9vWB2aQXSdG6IDWs
	SxRVjqYQh7hqgsYTJuKSsmDfcwc+ty5GBvzoxkNjPnBETNqIXxWTT3nn7PR+qML0
	Q6H5eRgCgGjEG6q9eMB1Z9M3ULP6xtae6q79sLEHTQUPWdwCg6Y9nNqm9GhbM+mn
	ZX5wgQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a28nsup6y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 10:38:45 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-87c103b902dso14539166d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 03:38:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761647924; x=1762252724;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Jg7Q3HNJiU7N99bYi9t626jJ2SX6hSf8hOLmETMSVfc=;
        b=fa4aBsMFqMfHCRSLSgnhTxMxOmhcmv07dD7dJaE8VNjVNRzVPHOeNyOOi4/NuUZVzX
         9NU4hfddypqKQHCZm2a39PlG141W0am4/r64Xi+7Uitg6OodyA1MwH5+Etv8aVzCn1Nw
         OgPgmBqVzMG5mTJ3J6iWUA21tOwzTwH/y+Vpk42jpir0EOrOywxdJVSXVhiyA2xkkWXQ
         WAdHpV0mDmREc8avLxTsAibOkPriJyuSYDb/QkCH1YjuCMEYbUp6KOumlX/C3gtTPCxD
         qrbp4fBxdJL0hlgmwcID1764OGbCvbpEl9hH3nnkM2V4xGPVbFvW8SGV8LHkVeVBz5Io
         KkRw==
X-Gm-Message-State: AOJu0Ywy3KYKPxGM6BeAd/Bn0o3pPGxMWMmhD8whGfkzEOKF3systbzp
	qlA7+WEaHbpWQcL++n/ZfXZycnvnTB2JEeV8F+wTlWFybwfoCw+RdmEyqUGS9JpCPJ4b14U+0ku
	J9nyBVQ/qXGeuj9aZaPDocWC1ABDwb2qqjnMFRddHHERwhBCzQR3TDumhkWaa+9PrBfyF
X-Gm-Gg: ASbGncvz3Jvq8naLAtX1PsDhskFwXHn8po506fVYZNAkpMkwke67tYlRCi9C9kIIT1w
	Melh7xa97cuRmy3422Io5sGk9P2Nn4gTA75uG3aWlaVzxELYzkDbZ18f9Ucsn8yQ998FhM9h0cW
	zNsBJlRT8F0zpxkAziIbOlytJCz4TlyEb7mZwoip1FQ7TdPrxzzebKB9cpUIOnU/ZzAbZpjgz7N
	UhDWekuZdDfGZ/JuhxE8HKlRZxhq6GcfOau+BcxpRcMYIB9gRzy904Hd9Jiv6VDx8GNlOYf+xtt
	HJTWqjhjdS3qb+m6Z/Jbtf8phBxhIq3PAmlybcOkkz/hiYXhWsF2G/RX6BfGGvbpiGyIvuaDXiY
	eUVWtt9Bz3piJHXdBwVJSkt/zXS3UHCPL5ZVgJppORnCmtfdD1geVpnzL
X-Received: by 2002:a05:6214:2521:b0:87c:2bf5:550e with SMTP id 6a1803df08f44-87ffb104bc4mr23361516d6.6.1761647924135;
        Tue, 28 Oct 2025 03:38:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHMfBni25fxII8Eovc2H8hAcEfVNeKGCiq4DQDNAv6UqFCPRMdvZA56hE1YjvIaEC9+i0ytow==
X-Received: by 2002:a05:6214:2521:b0:87c:2bf5:550e with SMTP id 6a1803df08f44-87ffb104bc4mr23361376d6.6.1761647923722;
        Tue, 28 Oct 2025 03:38:43 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d853c5bd8sm1051405766b.38.2025.10.28.03.38.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Oct 2025 03:38:43 -0700 (PDT)
Message-ID: <37676360-49f2-4b3c-8c4d-30b1393fe253@oss.qualcomm.com>
Date: Tue, 28 Oct 2025 11:38:41 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] clk: qcom: videocc-sm8750: Add video clock
 controller driver for SM8750
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
References: <20251024-sm8750-videocc-v2-v3-0-6286bbda3c8e@oss.qualcomm.com>
 <20251024-sm8750-videocc-v2-v3-4-6286bbda3c8e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251024-sm8750-videocc-v2-v3-4-6286bbda3c8e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDA5MCBTYWx0ZWRfX3VUb3MZBf6nQ
 M7DNYlzKya7oqxxUonDSk61U02rAwU/mlITdbdaWU4zjfYXlymEqND/9K2sEaYcaCSfVZeDKzEV
 V7SWKgxsWqiasrcMmJ+GzhmGdewJca253Y0fvoNXkxFKb61tR/vUTZb8z0K+D8jeQj+Zylgq9wh
 GTxIECw/dgmw8qx8/btTi5nvocj1U3/6H3GiT/VQe+1hs3hEkrIVaksgmFRigRuWUOznSgNRsQB
 rWGI/LaGXNhlQQcfpLsSnhQUBReUSsosPQkG/7vseZpQfxnh4cux9UOiSc1fz2+P8TsXlVRyYTi
 sRiifZ76CvUpHwj9kURS5Cb9WxmbwDK4kh679dQ5Bz/V8e1FwdojFaPdvQNrhCIp1t+e0Hncg9C
 FDsrHglnkjmiMujMZVvUUggNbB8BBw==
X-Authority-Analysis: v=2.4 cv=RIW+3oi+ c=1 sm=1 tr=0 ts=69009d35 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=d7ClhsmVZ3m4v3ji_18A:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: 35Z7FJbg6C1M9cjbzkBwdYGv8YrcWsSP
X-Proofpoint-GUID: 35Z7FJbg6C1M9cjbzkBwdYGv8YrcWsSP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_04,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 clxscore=1015 bulkscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510280090

On 10/24/25 6:24 AM, Taniya Das wrote:
> Add support for the video clock controller for video clients to be able
> to request for videocc clocks on SM8750 platform.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

