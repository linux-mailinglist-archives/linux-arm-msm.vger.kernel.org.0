Return-Path: <linux-arm-msm+bounces-64038-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41441AFCB23
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 14:59:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 89CD27A6630
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 12:57:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 792072DCF68;
	Tue,  8 Jul 2025 12:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gks4JNK3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC0382DCF4F
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Jul 2025 12:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751979519; cv=none; b=JCUgLX0nDCJgvKqEXIki5n3AYzKxoyiUvoISnEotWfoLGaP5o+qkp4iCN/mYSaZ0513SUl6wVdBNxJOFRtrRKzttWaMIhHyfwjH9aZ2QWi2g27oa+p0ZAQLkMReAuZdZT79SURbpHBuA2nca1oyOgr8mfEr+TiA6z1Lvf6xqGQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751979519; c=relaxed/simple;
	bh=X9xJsNLRo/w3sPWkc2XRYMyZn6hmmfeGt6sJZVRGGFY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d8BjYLQXAaaP8gNJ6G4m19t81hhmev24eQgTcEI4b/jh0jaM2fDQA1egZ9+50LhPqEHGj4OBnb3p+VtZvOC8Leblc0LQYIgyNz8VWTwRNaPMZYgALrLFztdoZ/HZvcAKfUzb7GJ7tzsTO/0O2w2RqfuCcAe3KFgCi8NzIbL88NU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gks4JNK3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 568AAP4U030392
	for <linux-arm-msm@vger.kernel.org>; Tue, 8 Jul 2025 12:58:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oBzyArkLyeQ1R18P8zwGvzvM/TDm2vLryo+5DG0mYeg=; b=gks4JNK3YSNajOAS
	xCne9Zv/Ld01rka4EShHEOoAHn2nDM9wZIPVZ9g/3EkzNECk+oxaXhoCTg7Ql0aS
	6tt0PnK3OhB8H36vL4OWHEML110y14HMJj6X5iOse3wSq8HRqCM/rCLXQn5d44Xv
	7PmmIltT0OCESInvJmdYGSo0Xynif7naLQH3hlt92J35Q9FoWhowO9ArBbxcNOMP
	eD0GQHrIKj3QTmK4fDnQinLGf0zWoHRJV67l0nJLSK1jXW0KciuR94YH9bEDtNIF
	8LFaKW2AKlYJTPTG0PqPLf3pIx4KrBf2KAyAWjgRKs3zgubn+toJaXWXuWukDaKs
	Nk2+4w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47r9b0u22m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 08 Jul 2025 12:58:37 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d41d65f21eso29388285a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Jul 2025 05:58:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751979516; x=1752584316;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oBzyArkLyeQ1R18P8zwGvzvM/TDm2vLryo+5DG0mYeg=;
        b=BCQ3rrzgfPwwPorZz3oUA9STKcWviVT8dBGBdgmSzja1lZVi50Sz/6wvgNDjGiGP46
         +vTtwR+HMBPhz7J9DTRtPozkO26rF8bTksloYP8VX+zTpK/TqsC3+mXXpSmMe8VSrKnS
         Hb46cDKlZEt0n5hIkBC8NypI6qbw4CLT+vMbvE0rk4ouofzZaHbUN9eMFlGoScCDLoK5
         /z84EOt+GRStp/ZXsmHqwXGBOgvfaEwio9Qekg22lGju1fZLxHtKA3fTFDsg13abA9t5
         cE8C5i/mlbMxtN739uNT7EdEBgkGsVOGo2lIN0f79K2J8UwVmnZtCDuMXP98nAdo01Ij
         mShw==
X-Forwarded-Encrypted: i=1; AJvYcCVWN3fJj4byzFyalm7gUC+xUJmdhlQb2xJhefTvB8YpCDSKLJA0vneYYjGWKRK6RdT5yyxpQwYso8OHgQEe@vger.kernel.org
X-Gm-Message-State: AOJu0YyjhNn0/Ql38ZEM0n4thB2tYdyVQ5fbh3Vb3ArgNzqg0+tHu5BF
	+bqeAZ1j8ipMujg0qjKj+W8vgwENSdgCpN3sUbzZsMVhqMA1vEKDNxbIk2sRU6lrXKIUftd2iGa
	amuhb3Jxdpy8+BR0tun4oXqW2jObZTV3v0KornQXr4SAaPJPhAvU7VExwiqfOuN9+lbXB
X-Gm-Gg: ASbGncvpJFCt27A0xJMsg32KRgCfEXpxhdDn/zmtnc34rWJHWuSm6JmiOdBLZcyPekq
	qzUdeYidgD8XhkWLSrOlJw8G4LPaK7zaCOMwvTP5BRr5sdo80meFkx/6VQJGgZKMd685eeLsaAv
	L4U+I8WiTblcNI7trGjkm1xe0sKGHxQGIDAAxzWuT9JYN6/mWQbKOjj5xWfGTav0suRyLLn67Zs
	5caWdyo6I6XoXIr3lb0/QPf6USHrNwWGiDAvrKQT+bNtq2JxO+u1QYncLY1pgx7BfJoOTaxaJWP
	9fB2r0fIfSSh7wqUP/kETb/2S09vykpbXw8qUho4739Km6omv9TUyTilRVmUJXSu/YRUL4xkE6W
	kMSU=
X-Received: by 2002:a05:620a:31a1:b0:7d5:d01f:602 with SMTP id af79cd13be357-7d5ddca58dcmr862222185a.14.1751979515771;
        Tue, 08 Jul 2025 05:58:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEOk1IWR6Dn6J7aqoS/O9lQAE2QdoBK6t1pNzfRDs42+DnDytk6BXjQsEkoWsK/g6hiFtoIbw==
X-Received: by 2002:a05:620a:31a1:b0:7d5:d01f:602 with SMTP id af79cd13be357-7d5ddca58dcmr862219585a.14.1751979515103;
        Tue, 08 Jul 2025 05:58:35 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae411a5429esm661638166b.16.2025.07.08.05.58.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jul 2025 05:58:34 -0700 (PDT)
Message-ID: <5e31281c-552c-4268-933c-e130d7d5a7d0@oss.qualcomm.com>
Date: Tue, 8 Jul 2025 14:58:32 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] arm64: dts: qcom: qcs615: Enable TSENS support for
 QCS615 SoC
To: Gaurav Kohli <quic_gkohli@quicinc.com>, amitk@kernel.org,
        daniel.lezcano@linaro.org, rui.zhang@intel.com, lukasz.luba@arm.com,
        robh@kernel.org, krzk+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, quic_manafm@quicinc.com
References: <20250702082311.4123461-1-quic_gkohli@quicinc.com>
 <20250702082311.4123461-3-quic_gkohli@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250702082311.4123461-3-quic_gkohli@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dYuA3WXe c=1 sm=1 tr=0 ts=686d15fd cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=GSS0VzHe2Y3C4L18hMQA:9 a=QEXdDO2ut3YA:10 a=ttxTGWTNN9wA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDEwOCBTYWx0ZWRfXwMhPVnNpnNo7
 9DW4REWCAEerguDeXQoe2NRw0yNoomwcAZHLLvPRvSHSbPGG68XWW4SDKC5zkEroVeWJDXKc4Pm
 8MRkZYmRpYSDFMw123WtYaO4JhxOUzi6wJFNCdtsQ+YD5NGTO8Q2f1D19B2frgWJC60UNpcaFD8
 Iul5s+BlLuD7YnWhqI1HO0b7v0jCLEJw6i+EAz0GoShnr7TFgDjlIgZ69nPIr9wcjS9smM+/+6E
 0dydEtthGFu5ug+AyD1acUgK6sA2ApJmxuzN/il7xL9S2dPZ/gbNxI9M/FboZPdupcoq/gQkl/m
 dBYP5MZpO/RAM7ZYPP9tY/HNpLNTOpPElp6uGL4bA9ArcMOemjiVKOyTHY3M3zX91RAoQDZgxlU
 h8BiNSlRpak+zr3MBQ2nFeiQnsjPXsCbA8fONlCJJ99QmrpyMrmYmbUypjTLuAzgUm0m88dW
X-Proofpoint-GUID: soDlg1VBJsT29FycsCI2KMhr1u1gp5tn
X-Proofpoint-ORIG-GUID: soDlg1VBJsT29FycsCI2KMhr1u1gp5tn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-08_03,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 adultscore=0 mlxlogscore=773 malwarescore=0
 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507080108

On 7/2/25 10:23 AM, Gaurav Kohli wrote:
> Add TSENS and thermal devicetree node for QCS615 SoC.
> 
> Signed-off-by: Gaurav Kohli <quic_gkohli@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

