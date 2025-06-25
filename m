Return-Path: <linux-arm-msm+bounces-62481-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D1BE1AE85D2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 16:11:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C2F8F1886436
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 14:11:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09630265CCD;
	Wed, 25 Jun 2025 14:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P8GDHhBK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE34A264A8E
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 14:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750860659; cv=none; b=oa1CzWLYibBUPwHIXuSQWDZGaDTCIMXxdtzpH7nKXyrRp6mRtaJxKumoll9LlV8zhUC4Gk1xbwlnGN1ZGYuXy8n8rhWarR8fJqBv4GEgwullp8PtnDHEoTkTex0j28KJhnmhFORNmnxbJF0mBPiKgj2E1TmdOxbA4eJVnC3XT20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750860659; c=relaxed/simple;
	bh=+FdbxM4aj9mP1SbsToRhZ6+p2wunQxJNdpM0f3ThoF0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kEGvSUnyoyWTw6StwW3/1HR8XO0d0edGZKBZK6cEtRL72KtphXS1ru3H0/r2VFgCqn3TTIiPP3pNSqGaPICMxVZt3YNEbgtjqw47CPdzjM7LPlVvsFamUgG3dZqt2Ny+ylss5DyNKzeSk/r2izc2TceKIQjAcU2KqWqC559ykAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P8GDHhBK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PB57Nn020873
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 14:10:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GH3vwxnpiCDejx75av7WZvVu6YLOFj4inA7cuWsbOD0=; b=P8GDHhBKPII7EA/D
	1VVUtNIxN3Bk31LVm9XY1lByXYAke7TVpufloT/GyB0evkC6Q72Pa1iC160hVy2s
	HRBjgkygLoAVJSGaFwvmH2HJJX9EwSLv5HY4HysCkPalXcJ9yGkINJd9hQ0ITDrJ
	Rtel1EZw20v87D1qg1mfPrIc3F+ePV4BWNRlKDEAKNuDGeTScKAc+xAFVyLpq8xV
	N2a27ufS5ZjHX47UlH2D4wDB8qt7ISjG4NEd7iCerqlNION5tJ8DF7B2qOjMgWvX
	x2NVaqDkvJZKAGuPyask9A0pwqUVYY5isaMwySC06NjCExEzpnc0+IHjjcRCntIQ
	9BiaCA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fdfwxe9k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 14:10:55 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d21080c26fso164990785a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 07:10:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750860655; x=1751465455;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GH3vwxnpiCDejx75av7WZvVu6YLOFj4inA7cuWsbOD0=;
        b=G095EPwKXb2LwLaUxRKqpb9W635b6UFQNpSN1KpLZDTpu2ILU6tlaIgQgKXOyiPubi
         IxCcYwNldhnC5dOeiFEAsy98qvxpRsht60nyTfUXTOa1e4uFRqF+owKuPkThyQqLrQkH
         t6td+WYR5yPRCRdGEfbyXVP5tw0VDqG4gp/JoBaCw6yR9ESUP4PPRwsd5Zzv4jgQrCTU
         J1d5zq6c6Lrl/miD1OLbymfRvvFPXkd6N6EwcZxQakUz6kVTtsZK7p3ShBQOrNDhcuCB
         gtaRdbcPIQA4w6ijAy9JGJ21QYvoeOe1vIwW93488xcN2rQbM1nP6eiyKVrQO2NoxG7W
         PgIQ==
X-Forwarded-Encrypted: i=1; AJvYcCWe1rtG8ndEZMqlGj405FJXpvlChGtXhNtuEjNVg2rkxFIp5VvV6ND8zQWPcShc4YHPzwgy4CFB8qLDq5uf@vger.kernel.org
X-Gm-Message-State: AOJu0Yzcek4CEwZ8EgQkuksTldLcqDwPnQeqjkyftE1NDcZNxPMtucwk
	uAP36m3bCEXQf+L7RPtIUM2weUxMGmXmq4noLzBpCYuCqZ/W/ZWAVw6FX8kMkE12zLJW67sWtH+
	6GJsV1LB31XNR4L+uMgifgXI2owGBbBjnjMc9R+Lp+0H/eykJ2FcoFUE9jbpvVoW2/ePP
X-Gm-Gg: ASbGncsXkyYuNehHnM3hrChA8LX+WnaeeR+yujOh+22F2ey7Xe9jeSR0cJGOZjtSniC
	GM/uQQuB96rKaHz4lgF8QpWQMAehRRFowksHMLZQsaKG7K86DsMRXaJ33dejsxyF9ddKjgeNH/6
	Gz1lWX4nbXvWelYkjM4l127Yt7xybALZcPAJHXUHQdSx/8KVAEfTyEh6Dh2Q2/EW8K4pOLEn6S8
	Gtg/vUNWQAVv6uXOC5cqdSt2nJLrwvMvmOUNjh+qnBgQGWoDoiSZglTwEBC2YmNhoaciH1lTIva
	hZ3NqMj5selWljcr4yxJGpxenYaRVpi0OF2LRAy0NZCJMwLZVQ9ZDAuDCLem/U5SxzQNNtKtVea
	5Gdo=
X-Received: by 2002:a05:620a:262a:b0:7c5:8ece:8b56 with SMTP id af79cd13be357-7d4296f1b05mr137899085a.4.1750860654926;
        Wed, 25 Jun 2025 07:10:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHuHZPwG3CWK1H8PipoRERIswBPtl9pbQ0/GnK3KT0ahCWSysQdAWxntYw7bkWiIkZnC0WdcQ==
X-Received: by 2002:a05:620a:262a:b0:7c5:8ece:8b56 with SMTP id af79cd13be357-7d4296f1b05mr137896785a.4.1750860654390;
        Wed, 25 Jun 2025 07:10:54 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c2f197574sm2568630a12.7.2025.06.25.07.10.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 07:10:53 -0700 (PDT)
Message-ID: <bc27209a-e0f8-40bf-979f-3d747c501ae8@oss.qualcomm.com>
Date: Wed, 25 Jun 2025 16:10:50 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] regulator: qcom-rpmh: add support for pm7550
 regulators
To: Luca Weiss <luca.weiss@fairphone.com>,
        Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20250625-pm7550-pmr735b-rpmh-regs-v1-0-cab8ef2e5c92@fairphone.com>
 <20250625-pm7550-pmr735b-rpmh-regs-v1-4-cab8ef2e5c92@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250625-pm7550-pmr735b-rpmh-regs-v1-4-cab8ef2e5c92@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Br3XfjkfUo_sHKT6BbMk_pBuQSRXjJTP
X-Proofpoint-ORIG-GUID: Br3XfjkfUo_sHKT6BbMk_pBuQSRXjJTP
X-Authority-Analysis: v=2.4 cv=MtZS63ae c=1 sm=1 tr=0 ts=685c036f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=6H0WHjuAAAAA:8 a=DRLuFLMEli8muENjmjUA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDEwMiBTYWx0ZWRfX2ZesA934qvT8
 u6W/AlPj8PVtyJJxYAB1wzM6vwrgm2CPsBRoDtMB6RaJNF3R+7/z6+DtOk2jrg3Ff/8IyE+MH2/
 vf2es2kKb3/aiU/JvoEeY8LjCgm4EfuN7xYx/aLxuKCbhO65NUFmX4fyofMX+svgnFIuabg9bnu
 qfGTW36EUDNIgPRnYp49RPI4Mcy6CxocBYWnMDe+XhQ5/JnzNPHfCxI3tGIqpz3eULeYbUhY7Dn
 FKJWGvfnja33TwnYybBpLKBQXMe9YtD6CJa7VGESUXbAGhe7Z7fSKZKudCykAOl+8xFlmBAraFQ
 1+qgWUPRYvIrPvb+CnaS47MPTsIsW+jMrYWY8I4/rzfHCFHhMg1OX6QSyvXc14RZRziXx6n7AFN
 AW8U87iDuhpXOHo634+oKIZS1rVdy0RlE4pGUJchWgjnf6TKMdA0PRIWbxP7KW3y2IpcynYl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_04,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0
 mlxlogscore=907 spamscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506250102

On 6/25/25 11:18 AM, Luca Weiss wrote:
> Add RPMH regulators exposed by Qualcomm Technologies, Inc. PM7550 PMIC.
> It has 6 FTS525 (FT-SMPS) and 23 LDOs with 3 different types.
> L1-L11 are LDO515 LV NMOS, L12-L13 are LDO515 MV PMOS, L14-L23 are
> LDO512 MV PMOS.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

FWIW everything you said in the commit message is correct, but I'm not
100% sure how to map these LDO types to the existing definitions

Konrad

