Return-Path: <linux-arm-msm+bounces-86387-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B3029CDA165
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 18:21:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C8FA13017F02
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 17:21:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D29D6306D40;
	Tue, 23 Dec 2025 17:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mU+NR7Rx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kolwwnJc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F33A2F2604
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 17:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766510483; cv=none; b=qiQthdFBcDc9ZbFDI1sZGZ2FprwDj71M327JEprJd8EP6YGoTEvtwK5to0rAQAuRv7+XbEzsevQHTsBdEhcrljEzGS/18Vxeyv7Ofrmfrhb2ScOhK/yUVuVqvrkjAzo+s1aqE0sAy/hJUGe60A8lyXo0+WYxeHI4QGAsIJvaOuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766510483; c=relaxed/simple;
	bh=CLb05InNh+cP4ohmcLKOu44fd9YE5m+H4uHkvdCcq/g=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=uEzLznVSo2WRvRKfHmSrhcKL1QHhNALAJ0IXe9zvXVIuzAGESlJXML1MOxeEUSJV9aYpmgceTvHm5KLkDfB2kiy13XH8QLNXJeI0LECa/JrQCJDyPWDpDcdI99PMIqBndsECZ1EKY8xdHmTxORqstsvvwqUFWM4LwJGIAGc5ick=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mU+NR7Rx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kolwwnJc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNEN851913432
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 17:21:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ggATqNTh8YjmKXNhKvKEVFEDRMF8i6bIt5OeNrm/u3g=; b=mU+NR7RxLuSsTRR2
	Ncq/aYHq/hdSj/dWUNH14rwwPUwNxY/LwfvH2XqGliu4nhsqka7+urtLGBBPWnu2
	FOqC4Ln4m2t1p8QgKgf2PSZNoyHWJnyDL1xGIvrSAYrntJzYExAx/1DlWxpAhpOl
	3ctNVyWE4wj8+kHWhQ1yaCXRVE1uIiDpZVTnkc+qINeqJtepc/D/JirIcmqbNWWd
	A8W7nXLMJJ+NL1pVkO5cPJK5Ry7OsIp4U7csy5au9TAaU5oHSvnBMnYDtjrxEat0
	HFmlHOzCMhMjIUcpBwmuDXvbmuCkfymnmwkjWdWOOspXnv1aOG127+TW8BScAsiB
	xbx2Dg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7vt2ghdw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 17:21:21 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4edaa289e0dso15549171cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 09:21:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766510480; x=1767115280; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ggATqNTh8YjmKXNhKvKEVFEDRMF8i6bIt5OeNrm/u3g=;
        b=kolwwnJcTiyQ/BoPRKiqrXNo+697rFwQzKV3hy0zOxYH7dVrPW5iHoosx4f6VSMooi
         D3UpPm2RBIKAkqNww65Jd6+loIJdjQ9ioTO1eTFPVvjMAYXC7pFjzvtFwPKGj95ezXwy
         +tSoEw1ySVH/aQhe3VaIfZS2HL8lWjd8J3kghFLQt1//wcKzLH5yJEIlSy2BFHb+gcPW
         /8ZTuJKIZaYmuSb6UmrdoCd5CAMeZxqc0Q9/xXdCy6UIP39/uehA5vmZdltmDrsnUcKI
         KVqXiMH3ogUPDajORDJUyQzCQpoU9WuKoQ6jnEOlHsXTCwAUKN8TUYSij0uOilHlb21f
         thqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766510480; x=1767115280;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ggATqNTh8YjmKXNhKvKEVFEDRMF8i6bIt5OeNrm/u3g=;
        b=QCK/yQ3jTi1UQRvdWpHlucY8u0pwS4dVu31b3rm4bVnZ08K8T9PHSq2TEuO+JqXppe
         37FOumbSIznW9jG/aBUUEABuUjJsuS3xtcKky3NJd+r+ot2sM6AuYseaOogD2vHsePty
         hQW+hpBtKILnFE9h/KgGjZs6kU+inTeFX1ONBSTIkVGCliUC6yAU8H8428dgJAd41clK
         SVld3P/rNSW5g9HSXa1KRy38EUjSXBB9am2NG0yyZ1ZyDs5Yh6H2+F0QXecJwr/v1i+w
         /aqCiMg7Yk6MGlw/9OpPzLdwJtcr8A6///sXRxPF8uhe27C2N5fmwTpr0krbO0Mf7nv9
         AsSw==
X-Forwarded-Encrypted: i=1; AJvYcCV/csoZP5MNi7LylktyBale12/C+wGj6CGqgkrn+HgNFtNV9nwX5+O4+uFOAjf0tssYxcwEVRl9tu+Bp3mP@vger.kernel.org
X-Gm-Message-State: AOJu0YxFZ/ad3wDxdxVXnnh/vWW6DQb7uxDqzFnYbXE5Hoefo3BWb7av
	iPwzJ42mHLLb7AOi60kbaBKMO8MAQt7Vwqw+DdAExnFTEiR6vBVR7KcOdwBbXnh8WijYEPnF83u
	AP3sBvJ6MOMxZAyArwr5qy8r25R9yDRH3SMkXnOYLUYfw0HvaH89m7nEMj5xx4TIxj9Gn
X-Gm-Gg: AY/fxX45APFO/H5K6gcGsVfhkxFg2xKVgYeLzXqga2sGBRT2hvE50whoIqsPIAiXKFA
	ShQqhkaqG1QCMquYObgg/UDERkBJTJrhDENnhWb5vImDoQAzQL31nNFRGYKnU3xgh+pd+DTOIjN
	moHY4jbB7vfYz/vDNwOY6fE7RQGsddcoThyiD2GWqD8pUirRha1ZlPbFElbMbVw9jqLnHQVtFsp
	hnrKfI49cO6/aXVT/9hngel6xVccsZv94ZH0kcZ7uJu4zhqc054qRnkpCYn5wRCoVnlx+se/Tza
	axgAtCvjF0zjzorKHY0h7BFrvTu5jl1MA1TuFxZoHUqA+gSPSUpKUlyz2Zwd0+NsgilNbIItw37
	uFARM8qnpmGBorpmS760hoEcFqpqKfInhN3R6oAoAoodXwT5Bxu0PmK4sEKfUhYwNgg==
X-Received: by 2002:a05:622a:19a2:b0:4ed:7f85:225c with SMTP id d75a77b69052e-4f4abdfb09cmr160344091cf.10.1766510480554;
        Tue, 23 Dec 2025 09:21:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHKWqDZICPsw1vJJHp74m5LPHowdG85cds32F1xsc9VCuvpAFy0LUOTSK8WNoLdWulT+jyC9w==
X-Received: by 2002:a05:622a:19a2:b0:4ed:7f85:225c with SMTP id d75a77b69052e-4f4abdfb09cmr160343771cf.10.1766510480029;
        Tue, 23 Dec 2025 09:21:20 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037de10dfsm1436898166b.36.2025.12.23.09.21.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Dec 2025 09:21:19 -0800 (PST)
Message-ID: <273ca861-d60f-4a35-afe4-8092581f81c5@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 18:21:17 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] arm64: dts: qcom: Minor whitespace cleanup
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251223152559.155703-4-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251223152559.155703-4-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDE0NCBTYWx0ZWRfX75vOr30RV4Fr
 DBlYAdrTmuefOod1RJcEj/Q6HXQmT4cgFK+n5OvfyXqVteKq2SbtnOw4EQQO+a5anh1u54AMozY
 hO78BQ4bEY7F3PImJKnXQvx7JB+swOrQd+LROusYhakv0nTNHzH/vmnoT7p/7XF9rO5aIrCiml/
 sH8HfIugWtNIFujHPtftge3tCb9mHxXxJIu3TVAa83+ctNJHjJfg8OrcoGTpZIs55rpOUUYB8u5
 vsOviZ7+YGLzhxfiipOCe4hZh2zEb/qPE3GP81nMY30jJzbBrw0Vx4SNhp/yCM8EpcNy9hLnx0/
 nbOgm3MWX5hQEgW4ihPLJuHki8cMvrxRBPpKBhHdfv7eTz9A95S4vax6GC5z57AwKgpfAJIzCSG
 owxQpYz9RBAWArkYiPfTAxrO/jMNSqLgQhLrOym9UuRwYqiYeSG2JaxsaVGiSuw6UqQDqcMfPhs
 Xjql4J1S/6ACUTckh/Q==
X-Proofpoint-GUID: nK-Olp-JZGSSXVvqVnu43_u9jpE1kVQe
X-Proofpoint-ORIG-GUID: nK-Olp-JZGSSXVvqVnu43_u9jpE1kVQe
X-Authority-Analysis: v=2.4 cv=brtBxUai c=1 sm=1 tr=0 ts=694acf91 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=FLYuuQH4aP3MUV2sBEwA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_04,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230144

On 12/23/25 4:26 PM, Krzysztof Kozlowski wrote:
> The DTS code coding style expects exactly one space around '=' and
> before '{' characters.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---
> 
> Patches done with sed, verified with comparing unflattened DTB and
> dtx_diff.
> ---

Guess we better look at the Finnish tooling..

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

