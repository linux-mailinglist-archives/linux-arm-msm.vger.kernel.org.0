Return-Path: <linux-arm-msm+bounces-86657-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 89D13CDEDED
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Dec 2025 19:00:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7A017300E024
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Dec 2025 18:00:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 518C12DF6E3;
	Fri, 26 Dec 2025 18:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OGfgBETZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IbT6VYCB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03C3D2874FA
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Dec 2025 18:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766772009; cv=none; b=BVjJ7zVbCw/YlJMrxbNCZuMztcvQm5FwFMlzXCr5RfNx+a/zj8ODhgAxaYcUS1qXakSmLSg6UcE6FeDXp3wGo/GfqnTQej69GQP41NzNqH+Jg5428q8FLArzjJRE1hdXNa8hJzI50q1YnGBYmgz83Df3nHZVqzRI3ujnCRgwSx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766772009; c=relaxed/simple;
	bh=y/I7q0O4Ga58ZlxZPQG8u8oKJCJD29rWNCtbiWnl85g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DP/+zQftR6J2ok3+kuiFICOPDmVk1i9pYqnaxiJDBH8dgRxPn0CufQABTXy4VEiwrp3ls3+cQdqawqS1ZK4GCP/VXe5Ir527LW9R66vrot3CIrh4CUC8Y+NT8uCdQM13vT+1LlO8QHv0zTxQ7kscMy/eBarnxf6inl/DiTgJEaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OGfgBETZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IbT6VYCB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BQ8baAq889901
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Dec 2025 18:00:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZfYs8xJ+7MQfozKFwq/ifb0ZE64KSo+e0VJzhZF5FyM=; b=OGfgBETZxSB9JVKi
	du1A8RUCqiqIV1/yG3Qq0JVpLyIduPwsKkyZH9Pj+FpC1U2CnpIe0HjUp/3+VRpx
	TGmShtWSN9wcPa9D3RqEqKOVOp3QLzn1KGlsVWnGb85oPkTmZnltDISzD81UBXGZ
	6AQMTx4Q0auILoSAURFDir3Z2LaLTcbC9ECWukw+PaW8AhFb7Ov7ccTRQqh/ikKW
	hW0N4zPxP1SSCkbNDMoygx2GpjPSh2h2wZ8zQgc/B2rasKUjEwOjlAtgF2lSV3xi
	XFfxw3arHrJR0WuBNDrI1BJbjDEElD2BuxpoP2oVJw20duZfXYdUMIjaFLoFunEl
	bAvSxQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b8xvcbfsu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Dec 2025 18:00:01 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7bb2303fe94so8424336b3a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Dec 2025 10:00:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766772001; x=1767376801; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZfYs8xJ+7MQfozKFwq/ifb0ZE64KSo+e0VJzhZF5FyM=;
        b=IbT6VYCBywhZbhCEIri2QmWyMeZpPN6weEBjHNr/t4yUteyj6WukL5iJjB9BT5N+4H
         T6/EXkmcvQUr0wF/zvlRbzA8gO82yqtzWhtvCTsFak2/w2GzWSIaCgALoJigzK7XOCjq
         DCnGHgECP5F2cYGC1rLUDnL/jITzNUA1K+ldvcJJPKGqEZ1WYqFkbNC0u3io/+3cnfQv
         bE3uHWSbvqZu41aKorXqWjwtAnVfDXZOA2CWtr1AoVdpYuqPYJVP2gQjReAYEIbn3pck
         UwaidpJfCgUm/La454IFS0JHpA4Ki4IO5L4xNNd+Y50oam4ovFHYOftXy0aLOZSRkDuz
         cl5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766772001; x=1767376801;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZfYs8xJ+7MQfozKFwq/ifb0ZE64KSo+e0VJzhZF5FyM=;
        b=ugztZpzVCYHL1G0vXnungOxDG7+zgCbimjnPZFDehBTEnK0wAXlzoiXZ4zsLVMLJeR
         KHKEE0hGKQ12CLPmONOR2xw1eCFDaQaPD7rUUWsIUVR0/InLVsWEU9VFtGK6+t5vU5le
         fSNcA/990L6uYfAE//Tdx9wmP3dIBzTqf1vkwlX0zPBZpDMxdFgkKZSOTOKMGuNaNhLl
         ta3I5IdbSYsu+xKfZMos2qIOKJ8S7Bp/ZV+NaYEwZ7WGPS2ly5DogQewzz0yliJGsP/g
         ZnCovblxgieloJKpnkOZ3pBUxLFsm2WZdz7Y4/ds+jSp2fcpd3Dwt4PnPeP3GRFl+jg1
         bGnQ==
X-Forwarded-Encrypted: i=1; AJvYcCWvUSIXAkd4zdoJB0YHOJvKYNhH97Gs5LhJyZgHzl4xgOtZNP11ipe+UzGukzgtBPdohPeaJ+Zd2kxZvSOr@vger.kernel.org
X-Gm-Message-State: AOJu0YxBNZ8U15QhxpCAffDX5hC20wS31rqR0GtCj9Wqgr5sNHTu+kvs
	TU8/U5D3jmU0AGM8Wo9gja+MY/uYekNZ7E/o0xtLI5REW6tHMckkXbCZnV9bL+csQDkUjjz+J+g
	YD/jZcsC9q+gHMvoo4xdTUHPpS34gGZKFm394kTAtyiRbYppEjNb0/ratAoZpUct//spr
X-Gm-Gg: AY/fxX5asqZcsdeNX9Ilbmq2/sc53zuKxx8JjG5Bgi8mS4Rs45PzkkI6EfUaSIGL9I5
	Mk6TfAyuOklYSB41iaJCJhr+YHYjWnKeTBtKZVA1twgwsZ+qle0FGRcWIjWAM2zusYoaEImhLQy
	6b35SrCYLRkv9OseXdMbvA57Xgi/tdB4RrrQcaRos0EaKHlyjg4xhDgF2nQL1YUbQpyQH/3Mblk
	yv85Zn94VA4HslbmyNcLIUShAsW8Gt1XPvwbJTnm5YLmI3wkgICH80wAH4mojTuC1rVPQvZngtL
	VaPrq5aw7D87cLyKxa3cnE0HKexOchZvgIQe6iJrwcP/QbzfCv6K/81O3VkarI/a8MnHJ5i6V7/
	3CiSh7uVYw7TZe9LA+ajI7ofv59rFi1QhJZiezA==
X-Received: by 2002:a05:6a00:e11:b0:7ab:e844:1e76 with SMTP id d2e1a72fcca58-7ff6420d910mr19282735b3a.5.1766772001163;
        Fri, 26 Dec 2025 10:00:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFrjdKe74XNeyCLrdBcvmvuUM9K5k3eYfkt5yHRiiGMnTiJ4XHanppN7uvWarTMwn+8NtSfwg==
X-Received: by 2002:a05:6a00:e11:b0:7ab:e844:1e76 with SMTP id d2e1a72fcca58-7ff6420d910mr19282715b3a.5.1766772000625;
        Fri, 26 Dec 2025 10:00:00 -0800 (PST)
Received: from [192.168.0.195] ([49.204.27.144])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e0a1a2asm22487141b3a.41.2025.12.26.09.59.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Dec 2025 10:00:00 -0800 (PST)
Message-ID: <ce162164-d9c4-43c8-a99b-5fae3bb981a5@oss.qualcomm.com>
Date: Fri, 26 Dec 2025 23:29:55 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: rcg2: compute 2d using duty fraction directly
To: Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251222-duty_cycle_precision-v1-1-b0da8e9fdab7@oss.qualcomm.com>
 <emy273nvnbzznvufe6fmbysrln6d7lm4xi5rwsuwnj4kjlalvx@7j4dxyd2f25l>
 <fa75d5b1-e805-4d3f-9b6c-a21358d3d4b8@oss.qualcomm.com>
 <jxj23rczlysmrrrzdmtaa2ymrntamp2hgkzwnfaxgnnzsqqxoy@l5shaguts5oj>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <jxj23rczlysmrrrzdmtaa2ymrntamp2hgkzwnfaxgnnzsqqxoy@l5shaguts5oj>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: IcQRLCZdgPXwpj4eq8vnsFTVSltDpgLb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI2MDE2OCBTYWx0ZWRfXxFLRhOEp2hpp
 XMn89GvqPefw1a+KQg4IX9XqTC84ntExCCDE4QqZf+yi7swMLklArGvyBL4f7UQ+zUiaCuKBoVd
 Y7+tqT2riHE/Ot9tY9ynlcIQz/hOX+IPLr/nM9qEVhk5Pt2gSCVYkRHvcw7AVb3F3nTu/bh1Auc
 qN3Ziq9SPEKDQlQ5jjpqLU8fg03cBTWd+9pAgcK+xEaX+TbTCl8nf7blgBFZ9Nv6YfrXLbqtaSW
 FaQm1T5sdYW78TJmD2cS3nl5GURnf6MH/bCagd2d1++B0vK00WXccYqyBpeDtxJmPvqZjF0dE0e
 dKRtkZ3kPDbj8wajuLz7p5AUHRTE1DW29GhdUBZE23Er2BpXIjzPjHEIMdi2I6TvgtsWGcDdOGr
 zgVHDLXJZbx+8v5dCGlIRfpPLkCq09uTOoFjkuw/ATlvJVEMpsz0mN9uigKZrAyPOCcU82K+iOb
 qeMA61bjQlPMEEhKm5A==
X-Proofpoint-ORIG-GUID: IcQRLCZdgPXwpj4eq8vnsFTVSltDpgLb
X-Authority-Analysis: v=2.4 cv=M4xA6iws c=1 sm=1 tr=0 ts=694ecd21 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=CGk/GHK3MkyyyFueakV4jQ==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=62drwnB435mJaXsBqUkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-26_05,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512260168



On 12/25/2025 9:21 AM, Bjorn Andersson wrote:
> On Tue, Dec 23, 2025 at 04:18:20PM +0530, Taniya Das wrote:
>>
>>
>> On 12/23/2025 12:39 AM, Bjorn Andersson wrote:
>>> On Mon, Dec 22, 2025 at 10:38:14PM +0530, Taniya Das wrote:
>>>> From: Taniya Das <quic_tdas@quicinc.com>
>>>
>>> Please use oss.qualcomm.com.
>>>
>>
>> My bad, will update it.
>>
>>>>
>>>> The duty-cycle calculation in clk_rcg2_set_duty_cycle() currently
>>>> derives an intermediate percentage `duty_per = (num * 100) / den` and
>>>> then computes:
>>>>
>>>>     d = DIV_ROUND_CLOSEST(n * duty_per * 2, 100);
>>>>
>>>> This introduces integer truncation at the percentage step (division by
>>>> `den`) and a redundant scaling by 100, which can reduce precision for
>>>> large `den` and skew the final rounding.
>>>>
>>>> Compute `2d` directly from the duty fraction to preserve precision and
>>>> avoid the unnecessary scaling:
>>>>
>>>>     d = DIV_ROUND_CLOSEST(n * duty->num * 2, duty->den);
>>>>
>>>> This keeps the intended formula `d ≈ n * 2 * (num/den)` while performing
>>>> a single, final rounded division, improving accuracy especially for small
>>>> duty cycles or large denominators. It also removes the unused `duty_per`
>>>> variable, simplifying the code.
>>>>
>>>> There is no functional changes beyond improved numerical accuracy.
>>>>
>>>> Fixes: 7f891faf596ed ("clk: qcom: clk-rcg2: Add support for duty-cycle for RCG")
>>>> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
>>>> ---
>>>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>>>> ---
>>>>  drivers/clk/qcom/clk-rcg2.c | 6 ++----
>>>>  1 file changed, 2 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
>>>> index e18cb8807d73534c6437c08aeb524353a2eab06f..2838d4cb2d58ea1e351d6a5599045c72f4dc3801 100644
>>>> --- a/drivers/clk/qcom/clk-rcg2.c
>>>> +++ b/drivers/clk/qcom/clk-rcg2.c
>>>> @@ -755,7 +755,7 @@ static int clk_rcg2_get_duty_cycle(struct clk_hw *hw, struct clk_duty *duty)
>>>>  static int clk_rcg2_set_duty_cycle(struct clk_hw *hw, struct clk_duty *duty)
>>>>  {
>>>>  	struct clk_rcg2 *rcg = to_clk_rcg2(hw);
>>>> -	u32 notn_m, n, m, d, not2d, mask, duty_per, cfg;
>>>> +	u32 notn_m, n, m, d, not2d, mask, cfg;
>>>>  	int ret;
>>>>  
>>>>  	/* Duty-cycle cannot be modified for non-MND RCGs */
>>>> @@ -774,10 +774,8 @@ static int clk_rcg2_set_duty_cycle(struct clk_hw *hw, struct clk_duty *duty)
>>>>  
>>>>  	n = (~(notn_m) + m) & mask;
>>>>  
>>>> -	duty_per = (duty->num * 100) / duty->den;
>>>> -
>>>>  	/* Calculate 2d value */
>>>> -	d = DIV_ROUND_CLOSEST(n * duty_per * 2, 100);
>>>> +	d = DIV_ROUND_CLOSEST(n * duty->num * 2, duty->den);
>>>
>>> This looks better/cleaner. But for my understanding, can you share some
>>> example numbers that shows the problem?
>>>
>>
>> Sure Bjorn, will share the examples.
>>
> 
> I don't think these examples need to necessarily be added in the git
> history - in particular since the proposed new style looks more
> reasonable than what's currently is in the code.
> 
> So, providing them here would suffice, for me at least.

Frequency requirement from customers as below.

F(10000, P_BI_TCXO, 2, 1, 960),

For example, with N = 960.

Duty cycle(%)| num/den | d_old |NOT_2D(old)| d_new |NOT_2D(new)|Match
--------------------------------------------------------------------
0.05         | 1/2000  | 0     |0x0000FFFF |  1    |0x0000FFFE |No
0.10         | 1/1000  | 0     |0x0000FFFF |  2    |0x0000FFFD |No
0.3125       | 1/320   | 0     |0x0000FFFF |  6    |0x0000FFF9 |No
0.50         | 1/200   | 0     |0x0000FFFF |  10   |0x0000FFF5 |No
0.78125      | 1/128   | 0     |0x0000FFFF |  15   |0x0000FFF0 |No
2.00         | 1/50    | 38    |0x0000FFD9 |  38   |0x0000FFD9 |Yes
2.10         | 7/333   | 38    |0x0000FFD9 |  40   |0x0000FFD7 |No
2.50         | 1/40    | 38    |0x0000FFD9 |  48   |0x0000FFCF |No
3.00         | 3/100   | 58    |0x0000FFC5 |  58   |0x0000FFC5 |Yes



> 
> 
> Adding kunit tests certainly sounds useful though.
> 

Sure, will take a look.


-- 
Thanks,
Taniya Das


