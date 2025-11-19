Return-Path: <linux-arm-msm+bounces-82504-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E3D2C6F1E6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 15:04:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id 1522F29AD8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 14:04:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F96934E753;
	Wed, 19 Nov 2025 14:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hlANfVQU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VnFQTan1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED4E531ED96
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 14:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763561070; cv=none; b=Lx2oPR8UUHFOiLspBn6/99wh4Hto/HLAjNhm18ZA/iA9E2ODcrWV/HCOtCSRkCM/kJmNMJxxi4/nGshArATJgytHzP/V5tyJ9+37f9Bz67nqLqhDTFtRuqcTvg71rd3Ui3cSnlyPEWNizUhMrlvWoaRyAMwiSY00Ou+qA4yMeyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763561070; c=relaxed/simple;
	bh=MBk++SI7ocXheh2pdsa693Zbg5HkjC/WAL+010xdwt8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l9Pc9/Abn5YarR+SdKNltlo9+jm0fn4LD2/P1tieGcIiNJLuZHxircH5l7Y9sgiusd2zL4vzB1hbJvuFaqU39fFoXAjBkKRJKT9WsXIvDZRLdQTtnzh7boqqzImKfDFN9KuJNXoEoTy+pYkDLDj15MFzVpiSZDwRzGG+dl9eUUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hlANfVQU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VnFQTan1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AJCWJjt1031286
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 14:04:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5eyCNmwWmDeNycXwiGh5ANHQUbpJfYnNW5Wx/BlGZLw=; b=hlANfVQU4adiwS26
	xTp9AC4R0M2msa6V9XVu3RrqwzGNAMicSjFkyErG8NHMKbQRH74rKyERzqGxY3W7
	NnrpbyGfQtqs6II959agMcFjTg1+77J9HL12fUsZEqh/XhN2ws2wivVKhJN0DKs1
	pncSt9AVjZ1Dsb8muflVgiTJNcXhfbgsh9Ex/VfeorMx5o+1LMjhiK0+Xyjfougm
	sDn6HSkHYFHtfrekP1F8Wly8wixwGP9vrZf7ORk5jILEva6NbsnNJi396aXapi3v
	3PKphYB8KokgvXFRFpajjs4hyHlgkKVfl3ZsG4K1MjYWk+WuMWho41injpMUMJLn
	5FULYw==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ah7ansjac-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 14:04:27 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-55b2ddeab8cso694249e0c.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 06:04:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763561067; x=1764165867; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5eyCNmwWmDeNycXwiGh5ANHQUbpJfYnNW5Wx/BlGZLw=;
        b=VnFQTan1wgaye6hHO5+Ib/MAn+uhM+C1XT6oD4U8pnzptI4A1Kr35bcxl2kQEG8saz
         JX5lL6Ci01Qw5QIZGKyMArZzG7h7ctqknQiLJMtn1ArNHiW4DS9IuIgU6so5GtaRzgav
         bbII0I3E9TzwugvfGbjNdp7PwYLxvRpg0AmqPGEBdtLsD9qEBxf6wop9cC/8NtiS2Hf7
         MvXSYEJ1X8r4udGYwHTTRQB7HedovQinsWd96IxEEDHkExamtuc0rPOVmkyisqB+hggL
         /b/HFpdxhf3R3mRs/wbd9pqUs293pIrRbE4XPGV8oGlNGOhvrqxH2f/bsq4Qhi2gg7NN
         x3aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763561067; x=1764165867;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5eyCNmwWmDeNycXwiGh5ANHQUbpJfYnNW5Wx/BlGZLw=;
        b=aYZF8J2rzyJ8NYX8ao5sl9BDTsHcqUzrK0ZKeTy+Fq28zGzPBbzITaZIzOLhcrPVJ6
         cLqE9tZLDNieb51HcTZpr8PTCxIu2ao6d8VL9R+kMmLJnqY17fmP7BjDpiqetMju90Am
         bKiSPvjNZcFjSN8jd8wrkGgHLxBPzXqXhc8+U7wwR0VL51A74UPI+gjskAlI/hT2kLmM
         soNhSZfjRr4UFVvdu/JpUUQgQW9lU9y2zR8ik+GJog26LAXVtSiAJG2nsyiDJEVVxSrZ
         HRRbeWvZqaaMr4x4zTEXnZrF0LpAVRe9jlf954gawb5XxASitUl8JjmEvc/4VwFpTAcV
         devg==
X-Forwarded-Encrypted: i=1; AJvYcCWyg6sN6SD3Jvm4DViQF83PBNVWK6WI/7oQSnRop3H9Y0dIlH0YrkDR7xADFB6o60n02zz6Ffn0KLFUR8mx@vger.kernel.org
X-Gm-Message-State: AOJu0YzAVojNsruFBsHkjwAqRNBWxq4qg4z7vkgkvWWJg3KEIm1Rb2m4
	ScZ4LL1OWkxIloCjVpBo7IqwsISUY913KU1A04fd5UVKO3HDafAi1GJmpP/GP728IpVvDglt18D
	Qek0IxLUmi2FVmiiyEPoT0JP4UJjRrcrIDAZ2Pn2YqhBB8Jnq4SZIj7VRFJpYejfX5tJSWbjqBO
	iH
X-Gm-Gg: ASbGncscfH7UGVUNnmFw2LV9c9bqtfGGZPo/9//Ij1p/McDcMGLGIXRCwghn103C+oW
	HKWGi9QWx4hCVF2VVknlFe/fys6k0d0NlboTErBdUvenJAOfWFJqT1enOhEnkg3dBIMnS/wGgf7
	eIdT28l2COkCS7BHbfCp3f/+A8pLCRpgYXekMBOHHRFo08YC2D8K+ua/oHaYrQLzSB67lUMrJkP
	dZwAAuUdWcKbjc3/UWSmm7SdlUpmkn/YtKCN2pzGqZRTBhXywX+jpBfuWrjRSyz+byw9NNwIZ7y
	oR+YRlvb8l1bQa1aqrbLv75tAwOs8s1aCCNHqyDFxSJRYFZshaiq4r61ksJjzEQOyD6opRSgR/k
	PqfpRVxnPjloCxXuOqITyy7InNQNwJdxU+tuVL/nzeI8Kc7htglkZhmZAgeAac/kBwEM=
X-Received: by 2002:a05:6123:542:10b0:559:a30f:1648 with SMTP id 71dfb90a1353d-55b5ffb13eamr1091217e0c.0.1763561067020;
        Wed, 19 Nov 2025 06:04:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGozAIOyuCaP/CpSUrDdBNesIlCHdEhqQKyEjU3wClthJpKPW+79NQz3R96LxB0U2cncCgMVA==
X-Received: by 2002:a05:6123:542:10b0:559:a30f:1648 with SMTP id 71dfb90a1353d-55b5ffb13eamr1091177e0c.0.1763561066565;
        Wed, 19 Nov 2025 06:04:26 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6433a497ffdsm15258514a12.21.2025.11.19.06.04.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Nov 2025 06:04:25 -0800 (PST)
Message-ID: <76d153cf-8048-4c6f-8765-51741de78298@oss.qualcomm.com>
Date: Wed, 19 Nov 2025 15:04:23 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 1/3] net: stmmac: qcom-ethqos: use u32 for rgmii
 read/write/update
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
        Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
        Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>
References: <aR2rOKopeiNvOO-P@shell.armlinux.org.uk>
 <E1vLgSO-0000000FMrF-3uB1@rmk-PC.armlinux.org.uk>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <E1vLgSO-0000000FMrF-3uB1@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDExMiBTYWx0ZWRfX/Ta17+lD1djd
 XOSw4BloMF2xq5wEZJRAMh06qHGMqLeAqblQTulP3wMJxa0f3xcy2N+CkC0cKFK4X1AOa6wOKAA
 jbza68Ihq6Ush04/6nSFtNqcUVAjxWg3N0a5b8hCaAQ/TpkoqrZtbaYFYAmmzSUWcLNcqD2x27Q
 YPz3nWs3C2aJv5OVpLVrGr9U+dGfNcBM3lXtd3pj1Rg492oLASjRLWjX/x+CcdWjnhRN9e2pZVW
 j0XaUXoxSuvfvSU1QZvxtZHJivPsor3fLpKvG4/mmc/Iba1EXYEn0yvC3nLE6mJoGfQViERkdFI
 dncBLnJVNNzNVoP35giS0KOYamBt9YtRRSl0FxqG+/RPZsYJuLhJyFF7ceJA+DXQeaf3YSiyPTM
 6Mx7g7jwriIBN91lKzgj82NBVECHiA==
X-Proofpoint-GUID: lQGKhXoz69UEGktGE-Jz8RD3l9ya2iqt
X-Authority-Analysis: v=2.4 cv=a7k9NESF c=1 sm=1 tr=0 ts=691dce6b cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=PHq6YzTAAAAA:8 a=EUspDBNiAAAA:8
 a=jDdzDUYIFSdt8Bpb0fgA:9 a=QEXdDO2ut3YA:10 a=hhpmQAJR8DioWGSBphRh:22
 a=ZKzU8r6zoKMcqsNulkmm:22
X-Proofpoint-ORIG-GUID: lQGKhXoz69UEGktGE-Jz8RD3l9ya2iqt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_04,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 bulkscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511190112

On 11/19/25 12:34 PM, Russell King (Oracle) wrote:
> readl() returns a u32, and writel() takes a "u32" for the value. These
> are used in rgmii_readl()() and rgmii_writel(), but the value and
> return are "int". As these are 32-bit register values which are not
> signed, use "u32".
> 
> These changes do not cause generated code changes.
> 
> Update rgmii_updatel() to use u32 for mask and val. Changing "mask"
> to "u32" also does not cause generated code changes. However, changing
> "val" causes the generated assembly to be re-ordered for aarch64.

No changes, on clang 21.1.5 at least

> 
> Update the temporary variables used with the rgmii functions to use
> u32.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

