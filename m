Return-Path: <linux-arm-msm+bounces-88230-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 01CD8D0821D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 09 Jan 2026 10:14:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 720D330478C2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jan 2026 09:12:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D313358D2A;
	Fri,  9 Jan 2026 09:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MIVROBXP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O0+mbx6m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB4B2328B47
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jan 2026 09:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767949942; cv=none; b=RtRLTaEg4XgzInW4cifWMKTxRcqlnMx6ycII0QpQOrNg3gUfllm/YcCKR2hrqie1AeuUPvGllGKETY9pVbJXpe/y3D8pummwhxDF43UjZjfST8I0XIhUT+i14/7YGTi7B0fyDBhCukRC5VNYoEo2p1I5FBC7nBT4ihu6Gn70Igk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767949942; c=relaxed/simple;
	bh=9R3WIrrYyTla60f2zkt/XHbU8yKYrYi8TXqxaHbkOa4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FOeYnubxeByMMy3OeAoWV5SPrR3dzgESMu0NAiTw8i6nhY3HsFCHwaarzXMLJ3P00LlYhx6xC9c8Mmhdoo8vqRmK5eaaVfoFWJBcUIbnm4GKK6hiswA0dX5SPFH2Y1Ox7ZEHDE89B4ZEJC6vTpFQVCyBZuxGmExDW/826I1rzyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MIVROBXP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O0+mbx6m; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6091qTGa3324889
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 Jan 2026 09:12:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H7B6nOUZ79eiYWKjRf8LsfM7xv5YVxjBl1CLT4FtLgU=; b=MIVROBXPdJhPlktb
	2BSf7p4RzEwp2dTNmtiBpcxiLjIMdCCCefSb++kFaVBXjg3Bwl4UIau1EdyP5xJV
	Hfv0YkjpNf379TnO2ePgHQx8r5b9K5UrvKO2rWtWttD2Ll2a9rr/V1IslLpv1um+
	UmySUC+79RQzoz5IBzBfPTsgq+ps3SC8JcCbjWvnZRXAFabPWd7HuWBHKp+eJg3N
	eZZhI4CFSmyqWkcGGMzw1K/p1yn7UfDvKP0rr9Rk/aWPsmik214y9+231H/LAjbH
	VFuY92xMnKMnhyqkMhHb+UgcvSQkbBc1z02pSzukWA/TzS6qzHWKpEBrxqn/yYxp
	JQjpQQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjrd6h5yn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jan 2026 09:12:20 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4f34c24e2cbso9068111cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jan 2026 01:12:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767949939; x=1768554739; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H7B6nOUZ79eiYWKjRf8LsfM7xv5YVxjBl1CLT4FtLgU=;
        b=O0+mbx6mfnmxFjDyHBU8Ur+wX/OQjn89ZSI9UwwX7O0aDK0kNmneBjL+Wtq2fqaWBX
         QrghYYQ3FrmUFzcUY+QVfPhjLudVgKFreSQSlgX2luP2iVnDPJkVMLybp41blsia6Pv0
         13xNia0F/3AoWbHIwHAZsmYqvRTXkTCuQumWMLpf/Gj4CeE1+lU5e7XXKdqYBfC+Efzz
         yX1c6hIWdskXB7OHfExehXIlCu+i85E6VkymkgzkKOEa8dPMHttCqHoMXcVkxu6JLEia
         S5DfYkGCRrABti21jTo03NqcFg2ol++EjJ1wSd9WRCcx9p18IdGBt+kmj6gDaYENHdnK
         UrvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767949939; x=1768554739;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H7B6nOUZ79eiYWKjRf8LsfM7xv5YVxjBl1CLT4FtLgU=;
        b=csWCoeoPsLi0ejvbisy6srRhXT3kmQmPZ2DpjVdw8TIykNaJa4LDzgK6jZgzD6Z333
         UAYYITZ5uEuzzqyL6zYg+KovZ95v6vy8vKSqw+BI0CWPfjc04xdcBg9yDG1do/vPloIV
         NX6yrAh5iJ8ZbdjAId3qJiB/aZEs8mOJCRX/GfCOuqLDKVPuJfAF0K5UngJ+/ArpLW7I
         FRjp16ZpURIbHAoSUozQSOaX+FJxYi2psPJcZGhv5LaSUeVBGyWDobp1Bw67vOCK+q1y
         vLQMEiNfepRM0yR2Nkz0okQA3It0RpMkrP2UtoIF1MqI0ydMtMNAp26g4Q740UNwxVEg
         dT7g==
X-Forwarded-Encrypted: i=1; AJvYcCWzMZ6z37rIInNToB8k7OdXfNVXgsoyFa7gIGME786sBBFTfBSXNJO37JcZGY/tEg0nJfkqmYpdSr3joBws@vger.kernel.org
X-Gm-Message-State: AOJu0YySA6rfRN8pF4Zfw5F4/FSTLxzxcsOWbAc/HgyRdPDFLTawWRWn
	GnprrWJhbKFECJZ8iwHuHea8PrXSavus24/qhYkj9d9KILmiOYVK25u2mr1cThdctW54k6LrnWU
	822pKhwy/t6wkuCGfPzTD6MwZyR4DLmEWGNdYYMhHV5ZJkHGu0VuZV0NY8hI5R1saVPa7
X-Gm-Gg: AY/fxX6Y+pDHAyeCZHi9VzPxJ7DF1Kh9W3stsfkbvuiSGW7KP7A76OQFwTISl+dlxxi
	c8HLkB7iEnzArJveIXYunmoYYye6v9lMbAxjq5ilQiaJw4hFz3dlnUMCIgcjJWCV6bcyPFZbLSO
	P13yCEDVudVqkIx3zhhYwCyx1Sx20yUbQg76hYAncBPmS2qWAHW5WDEPpHOXNXB2GotxYU1m5xU
	gw5ro36LDzUWw5dxvjSJDI3Lj7VdPoprsL46aMbhFcywmlC4SLGqZPNsP0L/szVzkqh9wwsiGGj
	Tode+ye8GjHYAt3/DogBXYRCH00KcbILAUm0lrx+gIgKOqJI0Ey82/YzxoKgaj8ByIx5cyav9tC
	YSRxJYVBtqn2FIOzy8lB+3lXhKrvjBHht+FXrg46rCRZfTYDNNMqlgKEjNLkhb/Sp+I4=
X-Received: by 2002:a05:622a:211:b0:4ee:1367:8836 with SMTP id d75a77b69052e-4ffb48b6d14mr104102661cf.5.1767949939271;
        Fri, 09 Jan 2026 01:12:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF8iIJP8Rg/ccqZjCeN7WKKtdhZEzIIpEGc17svgWRw975fAD6mZspC1qZIs7HXOn1KvIYZrQ==
X-Received: by 2002:a05:622a:211:b0:4ee:1367:8836 with SMTP id d75a77b69052e-4ffb48b6d14mr104102571cf.5.1767949938883;
        Fri, 09 Jan 2026 01:12:18 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a233fb3sm1048738866b.12.2026.01.09.01.12.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jan 2026 01:12:18 -0800 (PST)
Message-ID: <0d92568d-545b-4cad-bc29-ffed93a1bba6@oss.qualcomm.com>
Date: Fri, 9 Jan 2026 10:12:16 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 15/27] clk: qcom: regmap-divider: convert from
 divider_ro_round_rate() to divider_ro_determine_rate()
To: Brian Masney <bmasney@redhat.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org
References: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
 <20260108-clk-divider-round-rate-v1-15-535a3ed73bf3@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260108-clk-divider-round-rate-v1-15-535a3ed73bf3@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDA2NSBTYWx0ZWRfX7cq8C1i/ovF1
 +FV1h4L2U9+rQGqDSUXJBACHw0hOTdlM4qgCXkJSoEHWZHeehLW67YEljCGAoTozG4GixM1VXb9
 8tKRCBLiJbCVAkkSsmKhPXStTvZQbZ5bIURUKXPifRj9GI6xEA4vmS3u3/ivYdtcO7Pt9HhrtOG
 FjvJPzkLDRbgKTfg8XUEXnGRL90lIStJAK8ICi3LfP9p1fWroKbdV/lR1RVm1oJkJeMAlrhTtZo
 NtRsFF3QIi+gQX9Ta2HIbIffCyKEOIDJYG1Y5/Ovte/It9OIPIqqPS4WUW059sc9XzfHpugcpe4
 cx6Qx6KtRaB5K2LMoH4I0t6FUi5rZDXyLurS1AWzV2YWhN2Xip55gKigVEiivQhXlxQhGUc00kj
 nugEwlQdyHXZhAXoFp/82mlSvJZFXo43AHW5xAjW1Wx4eeae/VhosKn+CmE6sQWwrSXoVvJDBKK
 UXdPyx8nyJyIiH2BvUA==
X-Proofpoint-GUID: Iecu1SR0RkqCVZyQFGixL5ZtP5I17n0I
X-Proofpoint-ORIG-GUID: Iecu1SR0RkqCVZyQFGixL5ZtP5I17n0I
X-Authority-Analysis: v=2.4 cv=Xtf3+FF9 c=1 sm=1 tr=0 ts=6960c674 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8
 a=bI0rxR5HNnv1m9k-B9oA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_02,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601090065

On 1/8/26 10:16 PM, Brian Masney wrote:
> The divider_ro_round_rate() function is now deprecated, so let's migrate
> to divider_ro_determine_rate() instead so that this deprecated API can
> be removed.
> 
> Note that when the main function itself was migrated to use
> determine_rate, this was mistakenly converted to:
> 
>     req->rate = divider_round_rate(...)
> 
> This is invalid in the case when an error occurs since it can set the
> rate to a negative value.
> 
> Fixes: 859a7e020b23 ("clk: qcom: regmap-divider: convert from divider_round_rate() to divider_determine_rate()")
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> 
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


