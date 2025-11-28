Return-Path: <linux-arm-msm+bounces-83694-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F295C910C8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 08:39:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3120F3AC74D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 07:39:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75BE92DE1F0;
	Fri, 28 Nov 2025 07:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Kz44amI6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JPnQDjM+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCE722D027E
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 07:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764315563; cv=none; b=DX1oERom5x3W2Bd7DNy8gnzLmWCtPctmLWT/UsmXnw3GRSRwa6bXQyhqRCt6N/YxCDeacy6nuePv37dCjRuzvV/laewAT1F/Pt/CESJ29jIwF49gqoThFVKj9mxsXLhHXLBsEiAa66xXK5kWRzGNwbNYCkeEHs74SkYBl4UTv1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764315563; c=relaxed/simple;
	bh=4FsGfpCbUQNPgZbuB90LRCAbVTlUalhAUuvxnGP/quU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p8/gqxMbdy7I0ES2ozPIXomPYc6MVpgDzfrERv/+g13eQDjZsx4J5Uqwi3X7trDc6F2tUgkJYHWfRllpzV9FDc9EoZ0mVBYnuTkIDYcvFlOJtwOMFxMRc4pIML21LRWAOY0NtX5MR3kpVtJPj5BrdoqseKIwYNGUSII0lpI23JM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Kz44amI6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JPnQDjM+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ARLONAB2051374
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 07:39:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N1sxOjCupiS/mW+fBlJkQhfmzWSDqr7whyqFF1AWrWE=; b=Kz44amI6qgi0pu5g
	9liJypQUlNifx4qqLAjM7pEConbKt5hUUgaBpppZ5w+Czecw0u8T5kj715kbMfkq
	Voc7wgHtTL9kuEoPmLV9eZufLi+2UB+k2ReT/NocTtrq9toBsL72i+1anMv0hTur
	H37B76vlet+Botucz3uInDU3WAD6MwiBYo7jxzZIvGO5lMaeetxXt+Mb5rETvWTZ
	tZbMhcTgkuwiBOp97vjHJeuGVjolCfbozu5tT6cVFbj5zbQsT3pYVNpv7lPHRL42
	cCUkP8Wbkb6+uckl+BTrCNdmp4MHpqp0GxPKBwY+Cd1yyIcvL0IC7ltnx8UUnoF9
	PXpzrQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4apq66j35p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 07:39:20 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7bf5cdef41dso2356654b3a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 23:39:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764315560; x=1764920360; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N1sxOjCupiS/mW+fBlJkQhfmzWSDqr7whyqFF1AWrWE=;
        b=JPnQDjM+o4zc+dNSOLV0kGW6nOub9kXiKqdErZztt/M7k/AtjQArv+h+cVrpp9yq1f
         oyB+act4eN98rzvZ19tjmBhFd1UWvvXE1uG9m/ivAnJ4fFcpdpFP9lQf4Jbo857YQPvN
         otypk9wbmHNtpm09XUM+oyQ21C3E9S/+5Q7lbgVdT+70ELeZaEuQgCkp6y21GQKrXB4H
         vjEEUz3lO4nRSy9vUzMTu33kh69/4Y+x5HuHI2xCcP+Rg1T1K4XHg2oac7U5o4kgN5qo
         0wN6ZsWE4rx/M5u9Z4Tbxnl+kgT1S1iKuFmfjd1RM1rtKQm4EurEWDP1q1OpOd4P6qfa
         c87g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764315560; x=1764920360;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N1sxOjCupiS/mW+fBlJkQhfmzWSDqr7whyqFF1AWrWE=;
        b=Da1n1YGnPscjRfbIVa2HrmUX9PiCZCYC6FOn4UJ76iMfkdrPyOK8E0b7v2bd4BVhWf
         ydXA0cYqxO/p9UK/a8rPOngYhWnueqDdcdNcFp0admXJ5pBiLauXO8q10weN6bZgHbb+
         UZrJQXfsdg+KItCbhkUGj5ZIVKLXPpvITodJS3IZG4zwtqfN1hBjNxvazAbdgdXvIIfJ
         nVFSOLCUZMQVcf/N8tNgOefIU1GIOuCvBU7gKv5FlQn9T6KjnSSXXi/o9rCn+kBmYV+k
         nzpOWp43kcEEq4msjDtxC+eKiur3gQxwCTsTn1ldALjukLxXnaRERjCVEezJmYdeEuxQ
         02hg==
X-Forwarded-Encrypted: i=1; AJvYcCUyM3YK+XTmlyYSdnXCbqw28U40xBAhRrO323SfrCIc2+fPvHJRWNMBcljUwVbtn/CHn94M1KAx8GU+UHdc@vger.kernel.org
X-Gm-Message-State: AOJu0YyCfLhfemQxymD3dCcSZkf/LNzcqeDHCjZ6Ij9u3/5A2JeDuQQr
	xo29Mj7mIwdA2VbyLae1fn74w19f2kEz9UGUpCC2Za4Dm9mPIf6/QaLWbuELmBKPPFkli6YTAHf
	OCECqY5lyQ36JR6hhlu9zEeEDZ2ZQcyZWAFnS+pZH4BRGkYvi09pC6Vz92/QOLlDPYFe2
X-Gm-Gg: ASbGncus3YLzPTi0p7pUgP0gpI1g2V0hD6nDqPC1IMbtyHjxrzy9XMy4wcYATEsbTb9
	MPO8CG61Z91yhbxq6RJgIEFilfKFuJDAukqL8ds/rE/yLKMLpX+7T642lNjZUWEbRW6mmimavuW
	MwYAHTU1t3uJJUn3nnh9e4FPyeJACgYYnjjoutKLON7fwQ4ChO362j7YZXildlMyAKwY/vVg2RJ
	8rvlfbdSpFgu+t/4utFaFcuSZRBv2ecxmdZGb/yblx6OwX8ebjklt2oIdQCVgikGfvXvHTdOApv
	xOHgm15C73SK1wd7cht38li8Yla0cFkWtrEDgh0smQGtNJQX3GhjRVdcADFfKzQB5m1hyxwkSw0
	20bPkZGsk3s2C3pNRzKkmxmM2X+cQPjlLPo8s
X-Received: by 2002:a05:6a00:1803:b0:7b8:8185:c23b with SMTP id d2e1a72fcca58-7c58c7a631cmr26552767b3a.10.1764315559651;
        Thu, 27 Nov 2025 23:39:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGoRmZ/6CyU7SYoYS4eDjtvgHdRyrCVRBUe0xCcA6QvNNTAeW9UR0QN/CEp+1DIfXforf9Upg==
X-Received: by 2002:a05:6a00:1803:b0:7b8:8185:c23b with SMTP id d2e1a72fcca58-7c58c7a631cmr26552733b3a.10.1764315559181;
        Thu, 27 Nov 2025 23:39:19 -0800 (PST)
Received: from [10.218.33.29] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7d15fb1486asm3981423b3a.61.2025.11.27.23.39.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Nov 2025 23:39:18 -0800 (PST)
Message-ID: <ea49a25f-5985-4f4c-924b-8340a1b5cbef@oss.qualcomm.com>
Date: Fri, 28 Nov 2025 13:09:07 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/8] clk: qcom: gcc-x1e80100: Update the SDCC RCGs to
 use shared_floor_ops
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Melody Olvera
 <quic_molvera@quicinc.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Abel Vesa <abel.vesa@linaro.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251127-sdcc_shared_floor_ops-v2-0-473afc86589c@oss.qualcomm.com>
 <20251127-sdcc_shared_floor_ops-v2-6-473afc86589c@oss.qualcomm.com>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <20251127-sdcc_shared_floor_ops-v2-6-473afc86589c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: kl6DwI5Y7jfsMA0HH8ot_RoAwMxNoqtT
X-Proofpoint-ORIG-GUID: kl6DwI5Y7jfsMA0HH8ot_RoAwMxNoqtT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI4MDA1MyBTYWx0ZWRfXyBUs77MRobW0
 5dbcKCaOem6eEWxGxUSinK3CNKV/ksfv9NgTGDgHYua3z2nEsGJ3PNlnPSEAxnO2bMX5tHTxwn7
 hM21KawMGEHPr8KAjrQ2C9n0aSxvQfLjnl5/AaZp20naqSrGKkyj5fMl57DgWHwtCb+6N077URF
 PYU10/7ztDYycd0ZEIKU+Hin233dQMNqY6hnJ9jAjhR9BzO51PmObf8o3BqoRMBtXtBLaxEqKzj
 lsdOHiPddKRlJ2zaPSuoq2Erzq3O12d520WqbwnFEkRAXZRa2imbYg9AdYw/t7entnV9U9NKKdW
 5NosFl8h1DWkMKjNomNZNQsKPAcaWOnGF0dLo30kmDNIF/i24AnqM+KZwUmAoXGR5ly7TTNqzE8
 6vD4F64SsWDV8TYKyH1CORDa2STfdQ==
X-Authority-Analysis: v=2.4 cv=BYHVE7t2 c=1 sm=1 tr=0 ts=692951a8 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=OtGAF3PL-3b91V71RaYA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 suspectscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511280053



On 11/27/2025 11:27 PM, Jagadeesh Kona wrote:
> Use shared_floor_ops for the SDCC RCGs so the RCG is safely parked
> during disable and the new parent configuration is programmed in
> hardware only when the new parent is enabled, avoiding cases where
> the RCG configuration fails to update.
> 
> Fixes: 161b7c401f4b ("clk: qcom: Add Global Clock controller (GCC) driver for X1E80100")
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/gcc-x1e80100.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
Reviewed-by: Imran Shaik <imran.shaik@oss.qualcomm.com>

Thanks,
Imran

