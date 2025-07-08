Return-Path: <linux-arm-msm+bounces-64050-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E04AFCD32
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 16:16:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 49F051BC659C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 14:16:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6134C2DEA98;
	Tue,  8 Jul 2025 14:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QiG9r98x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 773101EB5FE
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Jul 2025 14:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751984168; cv=none; b=PLS64SmD7H4/SXwayThUsMsDO4mM5nMbtcWon9PWJIw+lZic3U0COq01gbHnt7ewQl6yHGUV6ijd7nV+lmQXiWR6tWPeXw5Ptx3wKvmdUVBoyPW11AYbE42Uqa1ZvZ85DlG4mwTyzIj6YS6p472ZfNhaTVSzTRIzSsU2ueYNUkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751984168; c=relaxed/simple;
	bh=E3lfaH1esoHl+ru8dt/bh3KVLlHTXxish5JJputhM/A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jsB5jBpU8LbzYGf3dkpbA15RXTSl8A4Q7BBhDrW7EVxbmkCe8k4e2IymL2PP2gKT1jscv3bh3nC4+ypssIIicM57PGUAo0Pk+uI5vuUpgJoqXe3t5R8BoqhfplKoV3r4cyqfUrgVcXRYgwrbjmLugnRRPa8QEUYMzFFKpOe292E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QiG9r98x; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 568AATn0025497
	for <linux-arm-msm@vger.kernel.org>; Tue, 8 Jul 2025 14:16:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DZQVHr6h2vbACH/HxbUVPyBgPPfJWbpb9xJOT/3ejgk=; b=QiG9r98xOc7yxMot
	4Pyj/5ng2VQ1vd/ThuyA/rlbm1NoQ+H8jlXCA79GkKYltN7+HzFEpAk4lLCKZpkb
	HgYsUW6I7qS4xnWzV+F95qUKIGBc7Gjkpp7FT1B3XgrhIWeSCrdodkaSN1nqrnJm
	8Mt3uEi5H1I6zW1xlKpC/WbNtMo2HQldVjR39HDMHYKHt253f8rsIOz3SDZVkgXm
	wLb7KHy4jQcW82z8Uloe0ofDSodFHrlEoHOUVkQ7w8wGgzivv8t8R9jZQ1nBHsCU
	YY25cDA7AUiwpckwupN32lKA023RqQK3bPd7OsWP+UlA5AwYjbBHW1iBkY+NCJTz
	SKqL8A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pu0we04h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 08 Jul 2025 14:16:04 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d3eeb07a05so36138685a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Jul 2025 07:16:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751984163; x=1752588963;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DZQVHr6h2vbACH/HxbUVPyBgPPfJWbpb9xJOT/3ejgk=;
        b=L6uiEtHCbYwSf+C/PzKBFQsgqtqHLvMpEB9jdG/mH14t3FRS4NuToKL4gw7TrynVZU
         S2FMsC8t1FRh/xoUGl/M0Qo9j8bZr6Fr2fqRt9iXvbpmYNdf7y5r8cj0YpUJWp3Ao2WX
         c8iREDwCF59cSL16aU1darMYADoz/I9Fp5zC6dqkTsCda4C+XQ8ixjRvsKrIB8Vj1nKD
         hCSMOAwUyFwRYkTliu/ySGbiRlhzPhRI5BG1AThsEcxzya+DFa7eEQCHMB02SGLHyhym
         B/j0zXYYBXwljAtchqUeAKNcZ0TmASSXq2Lbmtya/gR7y859fd7wWav+BXna5wermb0g
         UdDA==
X-Forwarded-Encrypted: i=1; AJvYcCUZioi3x0STMpjeTayE/t1FTl4pOaErZrhsE2xJrzUJSMd/ct2yVOM603DXDmAmJ61rYCiODzV3yNOAtrvY@vger.kernel.org
X-Gm-Message-State: AOJu0Yzb4lwAjXnPzikHFWK5sFjMt2ARPotf3HhyyxD3t8X4TKDC6nwP
	8c8igFAPBQ6LifgXzKutSJDjyQLDEVe2FufelTmrjQG412TJi30wnmXeFiZhJ+vXQhqS43mtIpa
	MhKrzyjSYmw8VNkZi8HaRonHa500xvXJ6H3qJAE+Uq34iQcvs/5p6zQkq1Dnc/uSKVrN9
X-Gm-Gg: ASbGncsAXcbth/U+fwRwaC334MIne9P8vLwV323h8SH2uDzzd/HsJ97SW0tlwQUK221
	5txaqrkr/F/QAFGDpZmjTQElmLTpx/PKZQdqR7OM2aCUs6lzBQJufo44Fjhgv8PbSKtqtNxAyVY
	H15QQRUkdDl7XkcOG4gxfWLtHjjT9rv2jTt+pS2bey4OwsyZPUl3GyZBW0SlSMhNk7l+XxBw6nH
	xN9Ifytv9fsMsqFP9ITqOgJFAKqGNLpARS0j+LsTvk5IHTXwl+MKy3xzTMqqpDKrFP5fg6T77hY
	OPJ7LIAjDRwxCGCNwfKAcN/p8mfHoUlS2XW6FVycuzvM23VtcQoT1ELJuPTw90s05SjEx1q6EOy
	jiv0=
X-Received: by 2002:a05:620a:170a:b0:7d3:e9b7:7121 with SMTP id af79cd13be357-7d5dcd42af1mr823710585a.12.1751984162985;
        Tue, 08 Jul 2025 07:16:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHoRxKnbbwSsxFhWpE2/NEaVUl1RaxHp0HVlyQd5O1NsiVnVWQKCituQF6abehsg1sXoy3qKA==
X-Received: by 2002:a05:620a:170a:b0:7d3:e9b7:7121 with SMTP id af79cd13be357-7d5dcd42af1mr823708285a.12.1751984162353;
        Tue, 08 Jul 2025 07:16:02 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556383bae7fsm1700290e87.50.2025.07.08.07.16.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jul 2025 07:16:01 -0700 (PDT)
Message-ID: <2ada89b4-adc7-4462-a9fc-ebe692623fff@oss.qualcomm.com>
Date: Tue, 8 Jul 2025 16:15:58 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: qcom: msm8226-samsung-ms013g: Add touch keys
To: Raymond Hackley <raymondhackley@protonmail.com>,
        linux-kernel@vger.kernel.org
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
References: <20250708122118.157791-1-raymondhackley@protonmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250708122118.157791-1-raymondhackley@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Ln78b93oyAgj9PaUqZGYor714_d4GuZJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDExOSBTYWx0ZWRfX2KckDqh0aCWu
 TkI4sVtRSHVYZSDlpL4Lv1wVJy6p7YN9eYfWo/UZx+NNr30Trx/ZkY5H5FhTk9kI7mbrspYqOEt
 mCucGzXgEOg5zX1xSG9NO63bFqsecgEV/9gt2TRm86CN/bBnlhcLTmkLtkr2NLFNDwpBH6zNgy/
 JRE/nURXdZbLoFgjjpglsdtCY5J5ouOuNSlZ2d0sHhSQoZBlkJaPnt84/29PI6JLQv2+4U0E+ah
 qMZAATGsEssVthigQgDvmQdZJIGSSawcypUytTja4YLYUd0dH3soJQa88qw0t1SwfDWh/sq3zW4
 lssgMnVhRKEnsah6FJmsqzVdw+pRAo6hhYqMVAqDthGZRDNBsGjHlp05CiUn21+bq+ys+wkt1Od
 2lDOvkJYNYWxoC3vOesEbYCiIKL/5JwPDhrG/w84hyOQ1e5WsASP9PAASg/e4wzZdFKJoasN
X-Authority-Analysis: v=2.4 cv=Rd2QC0tv c=1 sm=1 tr=0 ts=686d2824 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=sfOm8-O8AAAA:8 a=EUspDBNiAAAA:8
 a=DCnaCfRbCLLe1x2JEeAA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-GUID: Ln78b93oyAgj9PaUqZGYor714_d4GuZJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-08_03,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 mlxscore=0 malwarescore=0 lowpriorityscore=0
 mlxlogscore=999 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507080119

On 7/8/25 2:21 PM, Raymond Hackley wrote:
> Touch keys feature on Galaxy Grand 2 is provided by Zinitix touchscreen.
> Add property linux,keycodes to enable touch keys.
> 
> Signed-off-by: Raymond Hackley <raymondhackley@protonmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

