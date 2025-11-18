Return-Path: <linux-arm-msm+bounces-82184-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E8BAC67B94
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 07:26:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id F0B65347E87
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 06:26:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EE972E62A4;
	Tue, 18 Nov 2025 06:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="llZKZR04";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="foxtytJm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3DCF2E542A
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 06:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763447178; cv=none; b=DMwuTXD/4beqT3xc8MagYAtvuLc2HpOvYOIJR5J6K6y6CpjZsFefAPEBjGNkvNSrM01sGLWzzwaHWIGyAe/kZ5udkcHQnPwPKAqH6tUG50SO4gLfVl99Y5w7OAfxXcNm8Flt+Y8Cq+zEyvGOu3T6LmH5Tc0Eh2z00fx4CXcinuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763447178; c=relaxed/simple;
	bh=xhv9sPWGz4HE4NPCXyeGNL8Yk6KTaJ/N5Bu2WnaIqQs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=djZ89HQ3gSEeu9AEPAWKnhNdcaotVMCT4duhVMDT4RUYXkIprhNUs3kWXiGQ+/tt6ZPrjtrV7xI6cAeQqwKxrQpPiiV/TexYkun4IszUgelCtjsW1E2ngVnjssPTHyZ5GJp9GJKwQRvWLRjK16o86jUqrhFlReysfmlTmdEtlI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=llZKZR04; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=foxtytJm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AI3aPAo375955
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 06:26:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lEaIIGkepzw4etmLuWJDtUUXt829lIeGN1TrIUN6PXE=; b=llZKZR04NbRrCPZp
	NvgccbpCTSTmZ3xzlImjC8jfHE+a+HBWtZtbKQR5UfsjWQr2z989m1ksTEukguwv
	HQS118uxY969rOWROOy0Mg+ubrlj9dQnp7l9758Xw8/5qKTm1a2qs5QQVNV6DO6S
	W416qFSfqFBK5jm2n+r9BaJpJQHhCEqR1Lm5fS73z2OHu7xtH5AyyPM5B+CKVXfE
	dQC0FXn/OMRchFI26Kbr1SOOE3YfjQs9Pt/O0I3N78Hxfo8B/j/m88yzvqKfOmmH
	TC8ZAI3OA36KQZl9jbgl7SZPYtAI2weXJCkw/6o4Yk2zkY5AQ2plDD91NG3gr/Du
	+LNqRg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ag76nj24a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 06:26:15 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7c1df71b076so140866b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 22:26:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763447174; x=1764051974; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lEaIIGkepzw4etmLuWJDtUUXt829lIeGN1TrIUN6PXE=;
        b=foxtytJm+eLoiOfQG9kw2CEDQ2H4sI9FSyph+66pOiTZuIeVigrzOK15lM+wxxdd2i
         So0tcj054jZzlac1t/HtbRl2PQ2Rt3kXypmT6WdbBZHMdJfSSoBsCn2MdQKuc/KOScEO
         W0rn3an6Zp/4LXdDBkZ5iiBjnoAuI+iFEF4cmK/DxOOSg4gqJu+MSGjAi85hVD7dIHqQ
         gKzBTedsh7booXNq8NK49uVQlkWBUJ9jVsK0783SU/4GAUpfGI+GC0+bluAzYSykMyEf
         iWhk3svcMNaaFIdrQ/fP4sKDUIPGxK9mzGQWnled3LpPGKt+Ihu7MiI4zkO19PKtPSli
         G7jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763447174; x=1764051974;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lEaIIGkepzw4etmLuWJDtUUXt829lIeGN1TrIUN6PXE=;
        b=IfnqXEgiDjEtU8EfeTpSIKwaa3C0mSi/qTJ+tK43QRccCEi+TbaR0D8UX1YAKAv3t3
         +9jCA55Q0U4JojBhG+zG0w80prynsrHovoO/nFW0fzIax4vvZCaE9bcbMqzpHU7o3SEN
         xeEwGg+DVfTHVAXIx2mXFIj36Qz9hVh/Rn2dM//xniLRHiSrYi3CSoX4igq6Zh9Zf8o0
         xoj5BeXPUw/pyqPBX5Rqo7gBQEuH43xB1zPKbb0ODiyxCn6Kz7uYHW6AwFbNYy9eCR21
         XYFA/6FYCwVHx4Xi69l8+k+zyjY0/ri2qDotNoRLFkvMkELBL4EC5SPc1LLgdFSz2BYK
         hATQ==
X-Gm-Message-State: AOJu0YxLaFFyhHOqZQzQiUds3L9Dx47wf5nNxC/UMsXdAkB74S8hrX0I
	3peVTBPFhHrZJJHaYHFbqAZ46sVlBGjLNx149ddg1QhSBSUU8vfhIgmneQFk5bYHcxLF8jArud8
	uwl56AyPRBSYuT2rzna4YcqSD7IPr25eM8Uvp/K6NyW8a994I8k7XtVzzKDonVY/4DtSP
X-Gm-Gg: ASbGncufSFNdFQq/wahgPjB8eweSC6hujprsbWtXdSQc6SR/NQV1v0GGkOY3FvPeQvM
	ER4TmKKTsLvlrOcYB63DWY6ma2sQ0fS+lhXSaJUyZuXKrkengYD0373la3b3cJEp0XTcRHR8zi0
	xVuMcQvkfwhSKXSZMHCRABxjsGZrPh7i5bkzGpL6NNZhRhNDJKRlhldgIr/NCY+VYJoTXpPlvWT
	NvpzuAoD8PuBamOt72edsSaEkOoUq4iyxM9fO1NHVYTngj2gL2T3kD+npUV3/Xn1trgBzORY6Gy
	IIu4HYmkSG72UoGD7fS/8y6q4biLv7yVpZZ556/M6SaaWYlyIbSo8xrstNNCv2SMF98wrupXfjg
	OOhUCKNXhGUh94s4b0CwpbUEY0Q1bZ6Bcf9XyUg==
X-Received: by 2002:a05:6a00:1383:b0:7b8:d607:41a3 with SMTP id d2e1a72fcca58-7ba3a4cf14fmr15652298b3a.13.1763447174597;
        Mon, 17 Nov 2025 22:26:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGssmnkhvBdIUS9ByeV/gK1d1xxT8a+P/xJYitbkNdH2SbZQVn1k7cF/ewEXs97j7J3iGuDgg==
X-Received: by 2002:a05:6a00:1383:b0:7b8:d607:41a3 with SMTP id d2e1a72fcca58-7ba3a4cf14fmr15652267b3a.13.1763447174110;
        Mon, 17 Nov 2025 22:26:14 -0800 (PST)
Received: from [10.217.217.147] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b9271505acsm15223351b3a.35.2025.11.17.22.26.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Nov 2025 22:26:13 -0800 (PST)
Message-ID: <5ea67575-b279-4d36-a278-6967dc97a5cb@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 11:56:07 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] clk: qcom: mmcc-sdm660: Add missing MDSS reset
To: Alexey Minnekhanov <alexeymin@postmarketos.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20251116-sdm660-mdss-reset-v2-0-6219bec0a97f@postmarketos.org>
 <20251116-sdm660-mdss-reset-v2-2-6219bec0a97f@postmarketos.org>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20251116-sdm660-mdss-reset-v2-2-6219bec0a97f@postmarketos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDA0OSBTYWx0ZWRfX0VLdZMx14mLC
 DVPMoxHk6TaNJuaD97xRbl4J99Y1Nsw2Nyg7LBJViIgIPAENSUUuDW4iU4/HUCk1UJUdz8zcLih
 /qt8FNWFtdp/yaxAvLwcJjuZh6VksBvp15S0QDPUtv4Yn/hkrG+D0VtQG9tRoP6n+XKVCNBYRBw
 VBeMBj8GSnXpxueLMHPX8lmYi0/6jTPKOb5XOWCSQcdDxHZJwFflTVP4u+X6ZHMj8Kal6xk6/5M
 Zyb+8qR+Pc3p/Ukyurkpbvs6gA6wcd7l6RIF1zG5Nij6di4DW0r/FfWukCLQUQ3EJ3/cQpR6/h9
 MW1tC1mSGAAyjRcGeS64L3F99+bnLrK1ESY8kBy/LnYxV8oTY3zIRpVXgE2PqOodRPb8dczpavI
 I0RdXSQGy+p3utVmjM+BsrTihq0Ztw==
X-Proofpoint-GUID: NtzjeV9ecjokdaa4V4iixnyInv0O2aAo
X-Proofpoint-ORIG-GUID: NtzjeV9ecjokdaa4V4iixnyInv0O2aAo
X-Authority-Analysis: v=2.4 cv=a4I9NESF c=1 sm=1 tr=0 ts=691c1187 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=Gbw9aFdXAAAA:8 a=EUspDBNiAAAA:8
 a=4KfWIHW6W8MtA3npaf4A:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 clxscore=1015 bulkscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180049



On 11/16/2025 6:42 AM, Alexey Minnekhanov wrote:
> Add offset for display subsystem reset in multimedia clock controller
> block, which is necessary to reset display when there is some
> configuration in display controller left by previous stock (Android)
> bootloader to provide continuous splash functionaluty.
> 
> Before 6.17 power domains were turned off for long enough to clear
> registers, now this is not the case and a proper reset is needed to
> have functioning display.
> 
> Fixes: 0e789b491ba0 ("pmdomain: core: Leave powered-on genpds on until sync_state")
> Cc: <stable@vger.kernel.org> # 6.17
> Signed-off-by: Alexey Minnekhanov <alexeymin@postmarketos.org>
> ---
>  drivers/clk/qcom/mmcc-sdm660.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/clk/qcom/mmcc-sdm660.c b/drivers/clk/qcom/mmcc-sdm660.c
> index b723c536dfb6..dbd3f561dc6d 100644
> --- a/drivers/clk/qcom/mmcc-sdm660.c
> +++ b/drivers/clk/qcom/mmcc-sdm660.c
> @@ -2781,6 +2781,7 @@ static struct gdsc *mmcc_sdm660_gdscs[] = {
>  };
>  
>  static const struct qcom_reset_map mmcc_660_resets[] = {
> +	[MDSS_BCR] = { 0x2300 },

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>

>  	[CAMSS_MICRO_BCR] = { 0x3490 },
>  };
>  
> 

-- 
Thanks,
Taniya Das


