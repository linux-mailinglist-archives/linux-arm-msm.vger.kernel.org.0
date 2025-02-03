Return-Path: <linux-arm-msm+bounces-46744-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DF69DA25A4D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 14:03:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 86AF43A36CA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 13:03:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41BA52046B1;
	Mon,  3 Feb 2025 13:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nOg27x6w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF6CB1FECDF
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Feb 2025 13:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738587806; cv=none; b=WlWId2MQnwQRgRy6HBmUWNvTlA23IedPgfccr3Ww9r6LNolR5FINcc8hEPFyGBvkS5FXjOFTWFqpkaYWvWZQnzLs6le6y7+08tb4LigVMnaJSzL48+QvqPBUZI1DU+9k+0hx3H2zwo+tJPplI7oqtz1tnN3BZ/f54mX9Z3hLwK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738587806; c=relaxed/simple;
	bh=gjrHEP9LzVQF9W6Zkc7o6LKOb1D9gOO33PCRBWqB8uE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S9DW/fWIS/07AjGAvGcBSmffM6u4MXnytloJWsDxG6A5Wmfz1tqLmr1bAFwUaIBpQgVpZ8q8N8YALN/1E48Q6r8n6s5KKDd+qfrJ0Qx4HVcdNi6SrtfJm8MWBQESqzO7ckqoI6DDf3ZXb1ipvzqy6x3GVjSukdGZ9lh+gMmodV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nOg27x6w; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5135NWL0030948
	for <linux-arm-msm@vger.kernel.org>; Mon, 3 Feb 2025 13:03:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mX7IfXj8e+kxJnyMsONTU5RjQUK7rzCN/ci7rHKOAdE=; b=nOg27x6wRaSJtHgl
	M+XWT4621uQHI+uz6vwasngw5vPFhnlnF91tAKmC8RF5WfipkXvsdLceAZizC7Cq
	wwe9egb13+KJpEV5dr8bvSBGls01qgdbSBza4MbGin+KPjsjJDJBcEwjV1wwvlNh
	5zjLbEu03rsxMhDOgCvQAnnKWa2VJm3DtxwMDXMHRnVIIwyi/sDhVKWpj+Kt2a/n
	dSBeBBHkthRu1aCn0CiYJw6lTk1rqNlHMhsN6BcsnJF+/xq1N8MisNNbirTH2BxK
	lbo/dugFlnd1Sv4zyQsFv504ftNc5CVFbVwUKIcMbMch25Z2ucECfvaCJI5r1EcS
	0rJ+Zg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44jqm414ce-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 03 Feb 2025 13:03:23 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-467bb3eea80so2527371cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Feb 2025 05:03:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738587802; x=1739192602;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mX7IfXj8e+kxJnyMsONTU5RjQUK7rzCN/ci7rHKOAdE=;
        b=o2q5RbXBB1j4qBfAAjKulZ/7mZbPI+S+9+t0GH+gaBOoePy0uvczE0at+EczR4/MW+
         bvwvzdS6Bm5kXFVK6ZeMrh7y+P3v30TOzQ6TsiQEgv5Ggu3ZxfE95eUCj4Gje+129cb0
         LecsImN1kCeOJbalCSXU4RCiwKzI/1WUHPwSEqDultIaYZIAJv1bQlnJqYVxt9YaFft+
         a2EScpgRNK5qGU4odWI6YHxk6TU2wz47Y5Y2cM1sWYtHgYDCmulyyPftsoybbyPO1wlR
         yRDn3Nr7i8gkiK9GyvpVjq1R5BlxrmmXHmChFvATa6ADtvR08oXKJLK2cpBGXJxT19Ff
         IyaQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhHE2wREe/5ojC0mCY0x2Tgp5ozlWHTHC+GwdpmAuR457F2r1EjtxxwLsK2FEsYJQa66UJHKt8lBKpzLK2@vger.kernel.org
X-Gm-Message-State: AOJu0YwqnI+phmXRh2vUpW4INFoJS/4WOA2nxPXnbnjag+Yo+t92LABk
	WK8KIC+DgIzKaU8l8IKG7bNjIPp5S8MXUGIRDQ83SadMquyEt2h4cTFCDk3ZeYTx/0ycY3mU20A
	gnlg1WfkF9y+qTQE1WllQJpBDCb7K51LmLaMK5uT9g/Xk2WyXCeNb9K6Yewp3aC4H
X-Gm-Gg: ASbGncsVQ4E4/D+XNsgbax1yR4ExDnmQmo3dxgeQz+OgC88fFC1Pm/YsMTCjddM1WCT
	PNZEWt2PXkgrkOeDk8BQ9uP2cxyEfash3mzaA4gDJh3uGXIDkuPt5oC9xeST30YjKO1zPFYqXo6
	YKFoVLs94bJ/PvgABeu32mEqJtAE6xN6GKWg68RIIhhKHgmj3DeXysFU2kw3mWwwiKAh/843yCn
	5tpINSrF+uEZ79igHkOgKOgEzdfGFgFpisGXJy8v5COMfY1yrctKj3vddMtrHKjGHbykVUlKjuF
	jHDRlFvt6xFDIOmPrpixvg9Hh+MfDs2cGtghRloAdDK31xge56WfGsL/s1g=
X-Received: by 2002:a05:620a:198d:b0:7b6:d273:9b4b with SMTP id af79cd13be357-7bffcd8bd6emr1098436485a.10.1738587802301;
        Mon, 03 Feb 2025 05:03:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGrZB6OqHiWRJ8HOtNHhQ5KqKCDHZxHykXb1U1YPH9wGXVvU50wTt//rEdVCP8JTUwiZqblcQ==
X-Received: by 2002:a05:620a:198d:b0:7b6:d273:9b4b with SMTP id af79cd13be357-7bffcd8bd6emr1098434285a.10.1738587801762;
        Mon, 03 Feb 2025 05:03:21 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dc8eaafa38sm4639434a12.76.2025.02.03.05.03.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Feb 2025 05:03:21 -0800 (PST)
Message-ID: <3ee057ab-927c-4eac-a933-a14a5849d66c@oss.qualcomm.com>
Date: Mon, 3 Feb 2025 14:03:19 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] dt-bindings: phy: qcom,qmp-pcie: Drop reset number
 constraints
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250125-topic-x1p4_dts-v1-0-02659a08b044@oss.qualcomm.com>
 <20250125-topic-x1p4_dts-v1-2-02659a08b044@oss.qualcomm.com>
 <20250127-hungry-bald-groundhog-4f7d4b@krzk-bin>
 <96c4af07-6adb-470a-8cbf-784bb544ff76@oss.qualcomm.com>
 <0ec25b21-9a1d-4c4a-ae52-6bd1c3018f4c@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <0ec25b21-9a1d-4c4a-ae52-6bd1c3018f4c@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Zh_qp2eERgCZuWvXc9dVvhHSrKJpb9EN
X-Proofpoint-ORIG-GUID: Zh_qp2eERgCZuWvXc9dVvhHSrKJpb9EN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-03_05,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 spamscore=0 malwarescore=0 priorityscore=1501 suspectscore=0 adultscore=0
 clxscore=1015 impostorscore=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502030097

On 2.02.2025 3:35 PM, Krzysztof Kozlowski wrote:
> On 01/02/2025 16:56, Konrad Dybcio wrote:
>> On 27.01.2025 9:26 AM, Krzysztof Kozlowski wrote:
>>> On Sat, Jan 25, 2025 at 04:31:18AM +0100, Konrad Dybcio wrote:
>>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>
>>>> (Almost?) all QMP PHYs come with both a "full reset" ("phy") and a
>>>> "retain certain registers" one ("phy_nocsr").
>>>>
>>>> Drop the maxItems=1 constraint for resets and reset_names as we go
>>>> ahead and straighten out the DT usage. After that's done (which
>>>> will involve modifying some clock drivers etc.), we may set
>>>> *min*Items to 2, bar some possible exceptions.
>>>
>>> You drop minItems now, so that's a bit confusing. If all devices have
>>> two resets, just change in top-level resets the minItems -> 2 now and
>>> mention that it does not affect the ABI, because Linux will support
>>> missing reset and it describes the hardware more accurately.
>>
>> This will generate a ton of warnings and resolving them may take an
>> additional cycle, as I'd need to get things merged through clk too,
>> so I thought this is a good transitional solution
> 
> I still don't understand why existing devices now get 1 reset, while
> previously they had minItems:2.

Hm, right..

Would it make sense to just remove the else: branch?

Konrad

