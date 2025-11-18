Return-Path: <linux-arm-msm+bounces-82231-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A0EAC689C2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 10:44:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A7EFE4F4F44
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 09:40:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9614329361;
	Tue, 18 Nov 2025 09:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="optTUD5u";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a4/D9eqx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAEBD328B43
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 09:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763458781; cv=none; b=QAI2ewh/IWNELAObBZs7gEF0g5euO1mvU4jLANH12Q5XYk0TEhVRx0N5NAETQMBobGjXq6v6v3Lz65/P6xuOv7zkLaJryZ9l1omqVu4wvuKdQWkC6ycXe31HD0gqsX93Fsxq2IzcfK5f6BRoMyO8y5o+fUsFVLqkzV/3EHT0Hjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763458781; c=relaxed/simple;
	bh=vd/DI9skSNB82yPFAdSPCwHHwe2VIJuiiIiMibHoT+M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mmLscD5RFyEAWTb29BapWYBgGan/bMy3qtq/NaeshntZJ+oZUTO3fspTMsweMh3MgCW8fYP+Cm+P/K0nHN6Ycb/mPZjH5xtttW8RxDPvT5hzIpVpIkdesbMHI2wGfIS4M9bofi8FlwJfV4gh6mklSyqIGQdhB2T20Z3OsBqNnOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=optTUD5u; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a4/D9eqx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AI8lOBJ2755988
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 09:39:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HVcRIuuX0FpVDOFtYtFkpiBjrnGWOGLMg+1zUM6LV10=; b=optTUD5uLQo4954s
	h4WNQDLJ70ez23SmbOUg1xqddZz1GDn6cENGgETYvufXI4JyFoO6OeiheIe1gc4k
	tv9Bk0I7hNPjvSt7EQmYqiNmmCwLj1CTqf+HgaDK9EUTqod4Vj8ibtpIlvXqT6q/
	aAqhglKmnZQ722YuaAMVmC9TBef/COw2sJqYJNVqOq/wbFCcetz+Rqj2Y4FkJkw+
	+Z2TX3WvIQqGPiVYGMTHj753rcYBpZU6+eeJlzcwCYwHzp+g3pSKcR235t+ChqG5
	bR60PmWG24MHgWOOOme6i0qckgHAJbf1kSs428NK8b9Vxye1a7RV3H2dGl6q7ytn
	vauBwg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agnkj05su-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 09:39:38 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b21f4ce5a6so135101085a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 01:39:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763458778; x=1764063578; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HVcRIuuX0FpVDOFtYtFkpiBjrnGWOGLMg+1zUM6LV10=;
        b=a4/D9eqxiPsX/1axu2lJfzJJwY0+76zPIBy4SAR+WPpGzMpH3trBUWSxrg6OlqjBN9
         LgxLUzOKy0132zYpNuwv6E4IX7a26x+bf2KURJ7+Yen9rm7Xc7GsdaZZWHG8onSGb7b4
         iNBq6iqThjEbscfbXv+RJcRL/C/ynRqxMlv2K/yM7d/kW+QgL054yBWv5eYtTQQkS+Hl
         e19iL/ybESrt0HHHYX5qPRvqRhxsNEOWV/DCfio9YdZPOTy0UZpC/HK21b29xJIPFfwW
         NfYLy+Hx07AqQ5DzpMfgdnp06Jy/4QxLhqwszz8SsLeeF3pipvoUbKzKScvl8gy0BAwx
         qEuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763458778; x=1764063578;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HVcRIuuX0FpVDOFtYtFkpiBjrnGWOGLMg+1zUM6LV10=;
        b=vhS954r0rn4fGqjbzMoNVi5az/5IDx+HdIs7VuzcjhJMFYogpVWoAqbXRGM8ODqyVa
         fUPsdIx4wWmChC6NLLF2uQlFC+Sgf8mzHGqCv3FuWtOtFqsFk7HgJ0I79ROj5BdCR3bc
         kS4XV3PoI4CvKh+ChOk9hAwPjIbzNx67rKZLc1Mep0cA4fXGfZLpqoRShyt2E2BN7Acy
         SxZ33n+sq68oaE3OEkvsTsX/HqFYuq4fxa882uFLrsFFbwHZKPdV6cAa4XRTihZV/cyZ
         pMX16DHGG0EAwpz3VH6dIhT7OpGSMG/y7eTzs7+ZfMtb7eVPaZTGNkzym3t0WOiyRNkT
         CEvw==
X-Gm-Message-State: AOJu0YwLymdsccJzLvWodPi+aqp4VKUzjrQObMEZ9W030UkvZE5DkA9V
	Br03ovKjDoON0ESMNoyeF3Ih1jXT5UHpUQtmpohxB6UYpNmFZEoA4X4LVyGzWU9dpiyzxonmFSo
	w0DKHmBZNEFdvbgXD1epML1IvrwdwTwhM6fTOBhtD+I8sFX5J/tzRWLcMCDwAkAmzQX9B
X-Gm-Gg: ASbGnct4xHVwdzIlssERAxfy9mq9LgtAlbSS7qaARWt9ZHLjT6AvM1/YNzYTrZnpESD
	HwG5QBx3NZICLK1lVZZNSosnW5rN5g9Xs1R1/2rX4QPxHMYhhf3apOiQKP1ZuF8KnwiXg6slAPZ
	vTCDrIcIfrEJ7yi1bDwrpKikzRBz7a7UgyuTzd3ulJv29QsaXI3tgEVak2Iik00poeFVBQWR55i
	TeOAleJ3bDfUiEhrIR46MMuSTKMDkXgkTmtsmEXMLqX06FIclXhQFCd59JhD3wBkFl7YDvJiuMM
	2b7Uf+X2fWEStUFps8PBFZ9pqP6DtauTCCJWxOpuwz5E1OJ4MMOOo2Zxn3bwoMsAl5e/J5luII8
	MdX/cWh+zsHgudi7ufwG8SueX40SOvwb9Yks6x/s1AcrI4dO9sZhtO2CYAm2BALu+E8k=
X-Received: by 2002:a05:620a:4410:b0:8a4:5856:e106 with SMTP id af79cd13be357-8b2c31314c9mr1296571985a.2.1763458777961;
        Tue, 18 Nov 2025 01:39:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGl6wK3vcB25z2nW8q84y1SB4kZapcOKClEiu4eFI86WrG0bsKvTmyoNea89AmtzxyNgBqYSw==
X-Received: by 2002:a05:620a:4410:b0:8a4:5856:e106 with SMTP id af79cd13be357-8b2c31314c9mr1296570385a.2.1763458777528;
        Tue, 18 Nov 2025 01:39:37 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734e9e0f20sm1327239366b.0.2025.11.18.01.39.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 01:39:36 -0800 (PST)
Message-ID: <c52b0ff7-6be4-4ae3-bad9-aa379b34715b@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 10:39:34 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/5] clk: qcom: ecpricc-qdu100: Add mem_enable_mask to
 the clock memory branch
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
References: <20251118-sm8750-videocc-v2-v4-0-049882a70c9f@oss.qualcomm.com>
 <20251118-sm8750-videocc-v2-v4-2-049882a70c9f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251118-sm8750-videocc-v2-v4-2-049882a70c9f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: M66sI46TO4cHI8DoQCvQ9ydkUgY9YrO3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDA3NiBTYWx0ZWRfX8PL/1Zx1Cflv
 Lc8+VASRCdwEVDXM7IyAKgQ/bN5jGEGf2+0RrY3FU2yWQVFUjeIsx0Gc/qBDMMlUiRW5iMxc8yR
 xv07d1KsXvhp70S5g+hKM9PV2wHrZA2VYhZSr8z80eGeruwPp1jxjqLlGDZ7X04RsNdwIQJefwt
 KkKYzj6WxIyr9hXUsXIkxhmRwSsTbprNFwzEpjagl+i9pwrnpxDHGcXWeziDI1z+LBA6Pt1aouv
 kHiZ52c+SwJ0+xvZJfhjKBfI9V1E+QLBMD8Pts0djZa72TDB2s3ODJYqCOwxqEGHLYB24FARqHR
 b8RTkimxbxD5L1KYCKJsZgVWwip5oH3Qwid2lOj3Kw0JbL/71WChGDzcIUXdRSIQvnGiFNZzyvv
 FC2EntEAJSL2xmSUUuLrZz8xKh1ooA==
X-Authority-Analysis: v=2.4 cv=cs+WUl4i c=1 sm=1 tr=0 ts=691c3eda cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=BshmeMc5q61FwYeMDCgA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: M66sI46TO4cHI8DoQCvQ9ydkUgY9YrO3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 bulkscore=0 adultscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180076

On 11/18/25 8:17 AM, Taniya Das wrote:
> The ECPRI clock controller’s mem_ops clocks used the mem_enable_ack_mask
> directly for both setting and polling.
> Add the newly introduced 'mem_enable_mask' to the memory control branch
> clocks of ECPRI clock controller to align to the new mem_ops handling.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

