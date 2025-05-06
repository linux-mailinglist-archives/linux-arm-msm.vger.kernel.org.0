Return-Path: <linux-arm-msm+bounces-56958-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63495AAC769
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 16:06:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A296C520A0F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 14:05:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62789280CD2;
	Tue,  6 May 2025 14:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VEmeUbNf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAA3E280A56
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 May 2025 14:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746540336; cv=none; b=sdYeUFLub/hskTfACqONy45BgF2tCoSQ1CbGDmK15RInwAjZdzu924JrXZj0ZIOiwJAxH613t1dwrJqSa1cnMZX3zlI5aBU13a2CZ6C9/4R8DaUel8epJogDRrrzdXNp6Dbpqv8xHYhIqwitv2CA9knDHPQFXW/a/nqhq/o2hpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746540336; c=relaxed/simple;
	bh=z+YYjJdtpjDJcpCz9atFWbn4uZAT4qMkpTew9VCqKPw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HZ4TlQQcJrW0PDPyzI/b/WOux0x9YqrPmnz9/PhLeehMCpTLWE+UL9J0kpedf/o5dbREMSJVhjdZSpWl/we7VaEP8d7VUfZciUzeV+aln2S+xBchPJZl6WW1v3eOOunMM3hQahbuM+RzKQbPlg+S1DCQTXDeTUxaiFULKBNTt9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VEmeUbNf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5468JO99019205
	for <linux-arm-msm@vger.kernel.org>; Tue, 6 May 2025 14:05:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Nqo89KoPeU/jHGAvsQlxSAm7hqWIb/0/DUR64k0qV7U=; b=VEmeUbNfO+EEM0vd
	5Ex5sKaW4+wl2BcTZxn9ZN/vsrYm0rOW+V3fDKMsKnfkp0IKgMQ0tS3oi/tQ2STv
	FTnrRpprXFw7quccvZ47lpz6iovDhfUrBAkB1hKzsztMGsyicJidkd6ThY7Qjei5
	y774KtEPT3+BP9GvSnTYg7pWND7u7H7EuQdNIaaVrpw8MIDqNBoKxDBJgmqdOgOU
	M7QzAitxM70lJlFlLAXjUkKwSIrTWELWD/273nkF5rM16Yv1TwpSocJuXhLVHMjt
	eADHfwcoD00as6/1SVMo+K3gQ1zG6i1hBfOkQNyQaQODHCOuazw8IQeQAtA2DMIC
	Yd6AHQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dbwfqqh7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 06 May 2025 14:05:33 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-22e50a45d73so2889485ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 May 2025 07:05:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746540333; x=1747145133;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Nqo89KoPeU/jHGAvsQlxSAm7hqWIb/0/DUR64k0qV7U=;
        b=PLJPmFH+eKDbKpJTJ6Q1g9l63fZolJUMrDN4F4BM0aCzLtyNEHyzQitr0gkoVIZBdd
         KJK3kEivPD0v0s7oOaJ2JjEjCRV7UolHZ5/Ea0/fynuI8lmUl9jQqCqc6xyj29XxZVkn
         HluBZeLo9f5CwK0N9laBAwrhdIpL+50DgPW32uQo8X9EbBYVqhfCGDK1ksDaFiKQRxts
         C555QIyQTVHR9mp83Vn9glNwsgfFZBJQg3NjoaqssjtbSI868SF46bLUYg6EK4IGk5vM
         T9oXsr/7Icn2gJik7linZYRref0TjaBRJ2UEC7pKHtSAvLkXpV2gAPaLa7B1z/rrQjvj
         Slog==
X-Gm-Message-State: AOJu0YxZX6uHaX/Hc40IxR+5ky+SgH+AIxUH/+MySehMReEArih53NS6
	JxXMTVbhla9aEb4enREUraQ6KWCjn7o6EvRMgELlhDyA8VVABp6TfkQjl9qEJ7j6UIpI+9ZaiLU
	ZAS1J74C1+BGwoVmM08dnrHa64en/7ttHQ8xQllm3HKkyGqvN0yQt08aaqAAxtM4R
X-Gm-Gg: ASbGnctHCSFqIqnL6I6OlSI+iZQm674V5SHgqZ5DC84S2mBt6zwb17UoLZHEPIrqmqc
	CH/9Uor62J4eOwrrdvvw2BxWQ0/ToSYFuZkcjid2p3oqztRCM21VknaZ/G7j4MyJWzWr/G2VG8s
	XK5f+9Xjnf7Yxy4ThzofTfkOrexzY3dQ15GJyz/pwMh6s1/W6rkZVUGqjEoLEDm3nFDXhwzal5j
	rmwypUbijVfmSd5tBFRQStcGs6Ffij4h6mh8jBptrClAZ6Ba6VfhrKjkq72CoD4kSeMZr74H682
	trVtfBDGGDFk8H1PuoBocPWolf2vajreYD9xQKqIT0pcPIOwQD//
X-Received: by 2002:a17:902:d0ca:b0:22e:421b:49a9 with SMTP id d9443c01a7336-22e421b49f3mr22608105ad.2.1746540332944;
        Tue, 06 May 2025 07:05:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFaPU7TnNNrMU+sFCQmddsKzkRJQkm7RaeBhQ42pJxberjeqn1t0GJ/J7mR3858IiblZb7Xcg==
X-Received: by 2002:a17:902:d0ca:b0:22e:421b:49a9 with SMTP id d9443c01a7336-22e421b49f3mr22607785ad.2.1746540332584;
        Tue, 06 May 2025 07:05:32 -0700 (PDT)
Received: from [192.168.1.3] ([122.164.81.221])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74058dc768dsm8902906b3a.72.2025.05.06.07.05.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 May 2025 07:05:31 -0700 (PDT)
Message-ID: <0b65ea70-561e-443d-983b-6d3db31d1d48@oss.qualcomm.com>
Date: Tue, 6 May 2025 19:35:26 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: ipq6018: drop standalone 'smem' node
Content-Language: en-US
To: Gabor Juhos <j4g8y7@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250506-ipq6018-drop-smem-v1-1-af99d177be2f@gmail.com>
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <20250506-ipq6018-drop-smem-v1-1-af99d177be2f@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ebyaw8OVrg5qrcugUStBwYAdk-kni02d
X-Proofpoint-GUID: ebyaw8OVrg5qrcugUStBwYAdk-kni02d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA2MDEzNiBTYWx0ZWRfX5c6PaB9lV3QF
 p9w640YYmtGj21YyO8lWeEEswDeYI32igRbARvidLV/q15MWcZwJ3aQOIMiW8pjXTqNfRmqEyn9
 58tGgAfpyihUdXPKyj2hziCt5h9rzOSVwdasSF/I/riCcjJEriSwUaej484RcW2U0D/p+tRP59/
 cUN3KaOkhIKcJm2bgPkpbz+KhFVEHLJAuvrbXOhqeH1sjRn1biD5yqnJ31lWvNCw2OOvwwUm5Nf
 i4IQBhrFBpRWJbN9frFtXcyLlEHVt0CIQxqeSM1lKp/oPCTRLJBGcVPTrdk71kfLfgoAO+M+soU
 ZEZsXqJC2lxO0oyLN0ptAEs2RJNA8E7G+2bTsvIjZnMFi1smpuhUuCfmaBqZbc9DJPlFl4pRdtN
 WOhQtsP+ALqZDFfBnVyhScCrHsctjA86t8CZAiVnyYerAX8b8R0PJyJiJimNyjZbTUI/Wqhp
X-Authority-Analysis: v=2.4 cv=AfqxH2XG c=1 sm=1 tr=0 ts=681a172d cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=IecdNnqt5cXURf/0i7SmSw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=jcYIDdlXSa86HvzLazoA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-06_06,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 phishscore=0 impostorscore=0
 mlxscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 mlxlogscore=700
 spamscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505060136


On 5/6/2025 7:07 PM, Gabor Juhos wrote:
> Since commit b5af64fceb04 ("soc: qcom: smem: Support reserved-memory
> description") the SMEM device can be instantiated directly from a
> reserved-memory node.
>
> The 'smem' node is defined in this way for each modern IPQ SoCs except for
> IPQ6018. In order to make it inline with the others, move the 'compatible'
> and the 'hwlock' properties into the respective reserved-memory node, and
> drop the standalone 'smem' node.
>
> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
> ---

Reviewed-by: Kathiravan Thirumoorthy 
<kathiravan.thirumoorthy@oss.qualcomm.com>


