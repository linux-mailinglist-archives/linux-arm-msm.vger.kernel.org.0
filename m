Return-Path: <linux-arm-msm+bounces-82395-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A903C6BCBB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 23:01:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 568D34E3436
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 22:01:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CFD23016FE;
	Tue, 18 Nov 2025 22:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aDPXMimC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aasDUrTX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8141827280A
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 22:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763503262; cv=none; b=KCWRmlnHlN5W4oSUurhrfXZuMkmHEVz2YVkWKBjc1WvZvAogU3Aqyi4btURE00Y9libs3Gp+ASKSVOcQSDbVVXopW25yIN+jLUKCYgHLOcAAeA6DANofrYsCkqLC1Rx7l5USbYJHgOkxEKhkIzjEED9uaTNbVXrKwH1+0xPHKY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763503262; c=relaxed/simple;
	bh=Dih9fXevBS3u9kszVPmtQnrlg5dIJndE5uxACAe+v0Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Afv98y8yg7Ky2nGdytFrFTB6i5cHeimW0xPaztSlbAWC3AjWtCNuuoEMCBCF/ZidoEdEOCQLkTAxf3NrvYJwCRDGCjNq/CKaEcj2reSXhhQ3YJ8xWjEit1LE4PJC0nYerrKpqwXI3m97uAACefnBGGQFmyibgrYsKR5ED9MFP1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aDPXMimC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aasDUrTX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AIH60sh2664745
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 22:01:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XJ/krFdrukxS2jHjMwJ/crT5obHVqzWDf9mfKu1vzco=; b=aDPXMimC7P9Rq/2c
	poyupxweKVoSSLk40X7Q6skRynMwg5cAIZytxpn0XG581Q0g39luwtpWaEa0Jt3X
	uPVh2J4/CHv1KWAzZUxZuXC1pjNEZluQaOTbrSAZcWhrotFj619A3cwmUpUijAfl
	ObNq5qr99JEhx1JkBDC1Fc4ijH4I6qMH/tKtuJAVTpsOmIF6kKpQh5T7vDIYRqTm
	N71omRjDCWHwQfO/Odnkn69yCY1APiY+pIIJmeNcOhfdYTX/9+xD0yqSmZLt/pzt
	38M50D/w3XrJ1wTWeKXyO9S2Cj8bIcq6sfef8ggCOUYmcJU9W2Q29rcv+MxZgRqJ
	3SFGtQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agpjka0jr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 22:01:00 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-34188ba5990so18133624a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 14:01:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763503259; x=1764108059; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XJ/krFdrukxS2jHjMwJ/crT5obHVqzWDf9mfKu1vzco=;
        b=aasDUrTXoWfcMd3vRzd0fp14WbpoyPYKlPFKjZQX+GAzW1VyLneUGYXzrmIWvFni0T
         w/b+fAo1RMuu+NWPy+nnSCTMPzC2LlOOdnPr835X7aXPTC+nNCIg17QVAktcaImdngXZ
         55YIJTy0Ts/eq9WUiTeDOrBt9GO8Q8V5HVkugpKd6YKipKkiQsIlOKI81rF3aW9MAQ9w
         DZLWfdzJaYXj5pKhAozPeBiW6SBdy3W2e2mWfeSRCmipyGqFIyd3KfbTpBGjlhIJJ6nd
         fH3e2I2UhbxApgdqfMhi/uuNd4xJ2ASGTl/fm7LhMnqGYSDDJWg1fk21Y8CGGWX38WoB
         Gz+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763503259; x=1764108059;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XJ/krFdrukxS2jHjMwJ/crT5obHVqzWDf9mfKu1vzco=;
        b=kN0PwLH9+WeyWO48Z/clv/yreDPhLA2NlgBqwQkywPzYYcqzz+gWY95NaOHQzBQgHl
         ReLk9oZCHHVbswDvHyffz8s4lO+nt2hOrnCGAPBtxvM7ZYytIBXlIv/VXi2OUKvekFMn
         AGoZrlYRVw0mrbNM3u3FndfUEgclFaJf87RO5YLttctM+QRZzLT57KKJBoAuKX/gwVVh
         mwCnCTYYTPZEcACLY/JjHG+D6OfJ9MFY7lgcLSEGb/blkVBdrsQb8oQy1GBXPpJL4phK
         p6zZubqOkSDGg5H3cJqLo4QWZzvKqMBclPnEa83sF4tCUIs8+OUm4E7IxtGjk0f1r68O
         4TPQ==
X-Gm-Message-State: AOJu0YwxZlaNath7GMFnSukkjtGvvuNKWLFHRuL/SYmbxtui2N1brDIg
	DKt6Y9SbWBnGeE8xnS2Ie91mHhSMI64IWMR/T6xpLpMw99E6iWMRDsRWoR1ko/9yg3Dg90Zv5UH
	7ggUN3AQstCzzjoObP2PtD1oqUqdOcGrCysFIw16RRjDXK3zcsXgCsjFihf6hQEj9asxC
X-Gm-Gg: ASbGncuoeVn/6ZEcP9g29RmkH3f5IuvojDWa1Gaifn+AmTAU4WNTwPXnByx7bh3EWlp
	nMVSgbEioIH5oYX5ho69/PKoHSqk0toyO++ZzhIhyme77rtLqB8Si7hhWArvB8wajWLH73U+NkZ
	LnW64WAEUsL1S21YToQbeZ5kqDcFmP/j2umZLGo3zO/SKZlysGkUsr67acuccTFdnxj4EX18f5a
	8X+yZXEZ3ZSEv2K0OprFpD8f2KA+b+oQUxLp1L5ehDyVSI6O7IUQ2nxXc1IqdtJp9wnYHRatnmA
	VuARgEEYkDZE+IK3YiL3iCMLgWzFQnnVn8XUrMDmCM2Cy2jOzXu5vI7MyeIvpd9LczxH34fIaEI
	/asG4NtXvdkBWZQ5wo3cq3x6MkeEz1LRSAympV2eM
X-Received: by 2002:a17:90b:5804:b0:343:5f43:933e with SMTP id 98e67ed59e1d1-343fa52ba9fmr18896522a91.19.1763503257914;
        Tue, 18 Nov 2025 14:00:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IENuyMCSbnJeXHIJwaNL3s/cjdlr4lhkPOILg4vP2RvQYr6dD7lW+iuOT8xJ6HGirA+lTfVUA==
X-Received: by 2002:a17:90b:5804:b0:343:5f43:933e with SMTP id 98e67ed59e1d1-343fa52ba9fmr18896496a91.19.1763503257444;
        Tue, 18 Nov 2025 14:00:57 -0800 (PST)
Received: from [192.168.1.57] ([98.148.145.183])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-345bbfe30e9sm441894a91.5.2025.11.18.14.00.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 14:00:57 -0800 (PST)
Message-ID: <5fee98e6-019c-41f1-b13b-ce06c736147d@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 14:00:54 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/5] media: qcom: camss: csid: Add support for CSID
 1080
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Atiya Kailany <atiya.kailany@oss.qualcomm.com>
References: <20251113-add-support-for-camss-on-kaanapali-v6-0-1e6038785a8e@oss.qualcomm.com>
 <20251113-add-support-for-camss-on-kaanapali-v6-4-1e6038785a8e@oss.qualcomm.com>
 <ced2ad99-fe9a-4794-be2f-f8760deed0a1@linaro.org>
Content-Language: en-US
From: Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
In-Reply-To: <ced2ad99-fe9a-4794-be2f-f8760deed0a1@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: dWkLAFLGoHRbkJ6L78DlM0UwTCd-1CDE
X-Proofpoint-GUID: dWkLAFLGoHRbkJ6L78DlM0UwTCd-1CDE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDE3OCBTYWx0ZWRfXyWBUda7hT/g5
 K37RJo62J+hNJnD0DZ+sPJIXFlTsKhOQ3BHPpT+jJGHI65b2xpOTduwrJC4YjePl/OcBIiB1fFJ
 L++ob6lKGaB5dK6zB5Yf6zMrZ1KhwebRnauOeFEytUwvYp7KpfGvsXObnP2ERSAI0oF1d3nTHK+
 MrJvwkp+Lfz6z/3080DcleNCi5k12OFvQ9OcM0eJ5ZPd+3B8+3/05UT/TLVumg3CbdMz/4bIuoy
 wWpZYrl8VtMpB4pwLtsAg01ciHS0WcTm7lpVySmeVnQazzwFpoy42T/M3QjJQ8PcizB4uoiVogs
 fdxWfUUrPhH4DhhybsoylYxDCLeMj4GiWBl5bvilEsYWxew0x6jQ387LS66N9iYUZDsBvjF24lU
 kMyICzLWRLIe7maUmwGsPiQYE3S+lA==
X-Authority-Analysis: v=2.4 cv=N/Yk1m9B c=1 sm=1 tr=0 ts=691cec9c cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=BiHMn5M11h/vNwziJwzFrg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=GDeJsyEDr6o3VvAygAYA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-18_03,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180178


On 11/18/2025 1:41 AM, Bryan O'Donoghue wrote:
> On 14/11/2025 03:29, Hangxiang Ma wrote:
>> +    /* note: for non-RDI path, this should be format->decode_format */
>> +    val |= DECODE_FORMAT_PAYLOAD_ONLY << RDI_CFG0_DECODE_FORMAT;
>> +    val |= vc << RDI_CFG0_VC;
>> +    val |= format->data_type << RDI_CFG0_DT;
>> +    writel(val, csid->base + CSID_RDI_CFG0(vc));
>
> Why not just add that code now ?
>
> ---
> bod
Hi Bryan, I think this has been carried over from previous versions and 
the comment is trying to say that, for RDI path alone we can just dump 
the data into the buffer without any decoding and the format becomes 
more relevant for pixel processing as CSID needs to decode the input 
byte stream first. Either way, if this is a stand alone entity, we can 
discuss offline and push another patch series to handle this? Please 
advise. Thanks.

