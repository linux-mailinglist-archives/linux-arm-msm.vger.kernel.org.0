Return-Path: <linux-arm-msm+bounces-84732-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 198F0CAF056
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Dec 2025 07:27:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E201E300E793
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Dec 2025 06:27:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18C8A320A34;
	Tue,  9 Dec 2025 06:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b+2aCAbQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iJvqO4Ei"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8FB41A76BB
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Dec 2025 06:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765261647; cv=none; b=cvpRcBaxE+35YlllwQYaqGcLendIN5wgUD6NcCI5HjcsUishwDAXEWQMSBhd+KgegHioOybh+XOasB43I1cyFLZ+7WJrMXc8y87Na8t0R0magMMHXsuS+p9ISi98Nr3gLWOU35yYgFZFd2xsMB2JBzS+HtBSNidG78Opg/IQdMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765261647; c=relaxed/simple;
	bh=Cue/IhBl5BwefhLIW53tatbCrNu4EPdtFcGJknzbblk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r1Fg2KnSnnFfPfrY0y4bKD52gVYemhlcisg44D3Hpwsgfv9b23y2OMOMNgIi7mOVyoW1kHazaYTp4BFOYunAveTuXABS0vCFuyGaeBdH5rNfbdZBEi/MbJj9n6/B7aaWJyeWKOIdvj5yRLphJaXr9X0eioCpxDaLKdS4M3plhN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b+2aCAbQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iJvqO4Ei; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B8NWxLh2715004
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Dec 2025 06:27:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HtmhEgnQmeFaRsuxrxrZNZVjW5/L+yZABNdCnv+hZBo=; b=b+2aCAbQEI+lFQwM
	U/F9aiFxOqVMP795L6AjKb0cu14XDfcveXYVAweGpyK1MwoduF8vjOREz1QuQAWD
	8OOfbTJIc2b5S7D+AcoNx3xot5f7botBwRC7xiVGMPYxYclrKlGkwijw5qLGlGbh
	0q95TaudIfTa8VEjLym6rJQdCYzIqDz1l2/NYZ8KwUWJskSRW/veVqThuFLZe7VU
	7W3VBSR8CfTMf5Gz2LuXR83f8c0ymQWEfBurLrYPhVgNfpr6lvRfw1KKqlz18TpP
	cWMherN3HENfM5DVnzt+qc/HIBz5u4mqFQaXZeAAaQF1p7F+CypaXeh7GtneV2Q6
	VCjhlg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4awwfrb0w9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Dec 2025 06:27:23 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7b8b79cbd76so3198544b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Dec 2025 22:27:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765261643; x=1765866443; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HtmhEgnQmeFaRsuxrxrZNZVjW5/L+yZABNdCnv+hZBo=;
        b=iJvqO4EikQjZHHJF38qsiqrCWkf6lcIbWRidHj2Qy4pFQEnjqhNWzu7Wb5HFaGzohd
         9OlCPq8nIETBP7DKIUwcRAlEMRo0S0a5FF2WVZQBPb+ra6CtNFVol2Iks9+dmJXvzo9w
         nVlZ0iKM+WYzv5GMV7lo7ELMDik3X4gJjWzWImyhWdQ3/jVplWDJ/mbTM/ueBAdTJJya
         /wx4ULzUJ+POBkevlKfb6QdVEsAz0OmH6sPbRJiEqbjzbQm7dgsubWVWojQ1VQ2dGH28
         jt3NjsJptOYTu42or9aSt18oGzAfxNNPbZs/BjG0Dd7iVGZiYt+pdnVTuiHtolbT7g8x
         Rlxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765261643; x=1765866443;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HtmhEgnQmeFaRsuxrxrZNZVjW5/L+yZABNdCnv+hZBo=;
        b=rtB6KrLBa3+QaVHKNNP3z3Wwn8KZeCQ7CutpFSH7u8oRUYKcaN+MfuiBNR6PLndV6x
         F3yNJphIl2kUQ+IsXMjghfd3eDF4jIfxgOY+6m4c6QEcKxkdSpmomUYdaCokZWevEQRW
         OHew3RRiAgCRI48T7OssU0ATSaMJerWbb1cVYVRSzehEBup2ihBz0JkbzeRdgJJnTgwe
         XUUaXVGNA7uRCL3Bu0AsuyCML7dFbAJfVGtCGKhkepM6M15vpYA1xv9wmPb/MM+9Wjwl
         iGit6ZImSTK0iummCu1vlLqRCj/Lwdcw/US7EteamQR1pWy//pGyvgXMwmL0OG2buEdi
         t/7Q==
X-Forwarded-Encrypted: i=1; AJvYcCVEHiAJLIju/ojr3PchzeaLDZEHxDUvXTzw4XKJhAB90qL8PRDhV71r2xU0H3n8TGjTKKJqBbtUQUCgrI6L@vger.kernel.org
X-Gm-Message-State: AOJu0YxqAue2GWrmrCFZtmrk7IqqJYfhRWIJVBDajvYSVB6NFE3RaZJ8
	SzXIwQbbiX03Id5CYPsQXm+edqn4R/hGk7apzsfSzgqw5BGHS21eCnz7HtSYc3Xj5ECkzC5Ya5t
	A2TW+pngLU+bkR/Ow/rp9tqWJwlksw9LzaVy8YojIPh6LtDLy/9KQ25CFmEiofKJKW4dJ
X-Gm-Gg: ASbGncubsfw740lsg3Ytcx017YpG8mnaxOtFfa/JHwok6Xd7ih/FDMer/J0p08QSW6f
	6uDy+RB+LDREmqOVt1srK3l0f/HotKIw2FNO1PjqSFSsCJWDBbd0fzcBEXXt/ng9evi+l3ySYUD
	3TZLpKHJrjO8Qw1WQuyU73Ro+OxqbWHX/OScUxGZZuDoJg1ae4vaJbXutUzXpkjZM10Fhfk7LAY
	XQ1DEAbBsK77CLW6qJlhuuBUuR4VypgutL4GAQsevhMK3IYKveAuZgtupEKlqbs8nLoEndEUAUb
	Gy9PNaO/cKJj0qwMhOZhUhP2sAB2hAvU8RYIDvbNGGYTa3idzjo7PQ227NrUgIxQBbwYXpA9dkB
	PfLLftXsFXY4cF5Vi3Y5PtFnitzq1zo0Zn5aL
X-Received: by 2002:aa7:998c:0:b0:7e8:3fcb:9b00 with SMTP id d2e1a72fcca58-7f133f07ec7mr338177b3a.22.1765261642718;
        Mon, 08 Dec 2025 22:27:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFHstB+cAXEpS81Kd2G72HAL5BXVn2HhHIAbO1QBCfjlm5YwcIqkg4hpwt7rTl+prm2JRROnw==
X-Received: by 2002:aa7:998c:0:b0:7e8:3fcb:9b00 with SMTP id d2e1a72fcca58-7f133f07ec7mr338164b3a.22.1765261642261;
        Mon, 08 Dec 2025 22:27:22 -0800 (PST)
Received: from [192.168.0.195] ([49.204.28.32])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7e29fb94c05sm14941528b3a.16.2025.12.08.22.27.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Dec 2025 22:27:21 -0800 (PST)
Message-ID: <e6873971-7d62-42cd-9215-813b7526165a@oss.qualcomm.com>
Date: Tue, 9 Dec 2025 11:57:17 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] clk: qcom: rpmh: Add support for Kaanapali rpmh
 clocks
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251126-gcc_kaanapali-v3-v4-0-0fe73d6898e9@oss.qualcomm.com>
 <20251126-gcc_kaanapali-v3-v4-2-0fe73d6898e9@oss.qualcomm.com>
 <wbxfnx5xtqclgw4akurn3icypskvwz33x6ukwuleehpmjnrvvt@ufqsvi37u5dh>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <wbxfnx5xtqclgw4akurn3icypskvwz33x6ukwuleehpmjnrvvt@ufqsvi37u5dh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA5MDA0NyBTYWx0ZWRfX8bYHdOiF4yQR
 CfB6I43qt+if/FTt5GM1Kcc5WuCR7dgYWMgxhZSvLxdBTiSDYUWFlrUTFT4W/2S7Yvh5EmGxVYg
 VP6q8aMn7pN9SZj1q4Y948cX6DiF/VMge4aKaFzQ7VnUv1rehW4dp8O6At87tq/G9NHlSMHpLjr
 /YWytuOzQzjhl+ePvbiya2jt3gJx+GPLfsCgIhXRbs/+Z06HGznjfPxyqF4Gs4jh7UO9hIkqaKE
 4uP8rpxQg1bX7E00935sqyFiUCw7ql+HutFsWGhVICaQzcFD6/hGxULk45oTWzhtFABesyxxzOc
 iTI0DPRdReVTagPQZ7T8r//+QJH8/Tsv3R+TQ3/EZqJwkVv5AlapZgpgicDZjjvKUW1ARfttAhf
 4Z+AC5Rhz1nk1diVxnYxomVrkDLJEQ==
X-Proofpoint-ORIG-GUID: 8vot-aVDyK1SHFUP9GBWzNhUqGSfnRHS
X-Proofpoint-GUID: 8vot-aVDyK1SHFUP9GBWzNhUqGSfnRHS
X-Authority-Analysis: v=2.4 cv=fsXRpV4f c=1 sm=1 tr=0 ts=6937c14b cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=+ZBMrq4S6zn/E4yUNzEvUQ==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=X0W1phzttzq_H1gf7TMA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_01,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 suspectscore=0 adultscore=0 spamscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512090047



On 12/6/2025 5:05 PM, Dmitry Baryshkov wrote:
> On Wed, Nov 26, 2025 at 03:27:16PM +0530, Taniya Das wrote:
>> Add the RPMH clocks present in Kaanapali SoC.
>>
>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>> ---
>>  drivers/clk/qcom/clk-rpmh.c | 41 +++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 41 insertions(+)
>>
>> diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
>> index a2185a6f321fb60ddc9272582ed67fa9ada6535e..bb2cbd2961d9aa1e4475d5876c1761dbbffe5338 100644
>> --- a/drivers/clk/qcom/clk-rpmh.c
>> +++ b/drivers/clk/qcom/clk-rpmh.c
>> @@ -395,6 +395,18 @@ DEFINE_CLK_RPMH_VRM(clk4, _a1_e0, "C4A_E0", 1);
>>  DEFINE_CLK_RPMH_VRM(clk5, _a1_e0, "C5A_E0", 1);
>>  DEFINE_CLK_RPMH_VRM(clk8, _a1_e0, "C8A_E0", 1);
>>  
>> +DEFINE_CLK_RPMH_VRM(clk1, _a1_e0, "C1A_E0", 1);
>> +DEFINE_CLK_RPMH_VRM(clk2, _a1_e0, "C2A_E0", 1);
> 
> So, why are these two clocks placed here and not few lines above, before
> clk3_a1_e0?
> 

I was clubbing the PMIC resources for a clock pmic together, I will
update the patch moving them before clk3_a1_e0.

>> +
>> +DEFINE_CLK_RPMH_VRM(clk3, _a2_e0, "C3A_E0", 2);
>> +DEFINE_CLK_RPMH_VRM(clk4, _a2_e0, "C4A_E0", 2);

-- 
Thanks,
Taniya Das


