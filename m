Return-Path: <linux-arm-msm+bounces-96259-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kEADBNW/rmlEIgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96259-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 13:40:53 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 775D6238FD5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 13:40:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6C859301BA7B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 12:40:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 703AB3AEF5E;
	Mon,  9 Mar 2026 12:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lensM7Pn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dp/7OgRE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38E0B3AEF3F
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Mar 2026 12:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773060049; cv=none; b=XBKVTxRcbYmtB8pL/2aRzWhmYYf+nax0x4iw4jvlK1zE9wvzQEMi3WNTiGEqVdQtyKBp2SyGkeJRmzZ87X2raDaIcpGsk6YoTNNd3QLTkhTcEel8NIRPJB2Y62E+FQ1nXpsovn1BYanSKgy1V+8ISMITS3EaRTCZcs0QC7ZCAR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773060049; c=relaxed/simple;
	bh=MYJg87+h1GypK3BFuf9x5P0wTJERCZZyAIVq14TIiBE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E3gvFilOOnXm9+YOXsyG5H0iozY+NbN20RZ7bd2miApQdR4UZQI0dhzaq8lDRqkqUmU1asMyvgB1pMP+wgb3c2i3VrPRvB0f/uDo9fTd418B1QHfwCaaxRWfCeooiDxx9wiAox2LAg6zRMTXimm2LnkkcUIAXEu/BfayI8rNDCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lensM7Pn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dp/7OgRE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6297JoFQ1733749
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Mar 2026 12:40:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D64kSqY6cAa9Cj/SSY1ECRkxZJurklGeb+Zz6SzKqzA=; b=lensM7Pnn7cKVFzq
	3NtWCxGYBrWnlSlIBZtsvOGTFNjvhllsZSxOyelBjUzfKOXy9GT+QwBOMu1FYedm
	TSs2obVrgK8eUQGFeskjo1ndsLJNT+n7c/JEHDYi8gvdZk2ZrryaLpBaWWnLTh8H
	Pf9vm+PBuGJkxgfN2gtr+sR2uYJ7u4xNFskOLmmuymbNWIvBMqUwTn5VQ8OUPU1W
	GmqqSiBxfqWMno9Qa33g1Jr3jhmb4Gdf616nYpQNRh7YQNL03oYxuS3VoBdsMmeq
	gdvls8pl/alTNVqBCJFukbKFQZDloc51erptDluLCNyGl0cg2HZUQE11Ks67ulVp
	PRHSTg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crda9d787-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 12:40:47 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd84cfae34so50463085a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 05:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773060046; x=1773664846; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D64kSqY6cAa9Cj/SSY1ECRkxZJurklGeb+Zz6SzKqzA=;
        b=Dp/7OgRE7cqo3Xb4UPpLlugCTBSaDteq+7rjeDjEhH5q7thVMLNLgJC/XFTIRe18da
         LnH+vFc63MrnR9VUXMTY2Ku5oA34bY4KHpYHlaYleElnwvCksrWEQyeI6uhYwqa3uW2F
         iPsrlc4cFh+mcVANycijVjr2z787Lt/fO9b+ZW4eErJW6gSyZRguWNZQbKpO87zEOeAq
         EIJmnbkhSVnC+GszgtQSUkVOV7CRkkcFeIXKDclgPxSQ2AYAfj7WqzmAJT+DcfOEVVS0
         A6GtWrDkVXvCWf8qFyRCkJ2RrODVi45vzFPzoRUq9QvVSt0bwKBHY4bxewJxUsgYyXSV
         tb8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773060046; x=1773664846;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D64kSqY6cAa9Cj/SSY1ECRkxZJurklGeb+Zz6SzKqzA=;
        b=wikZg5NWAikVVcQQnr+pgVV1ol/NcA8cFfXjnj9XL+fAJCeXTdsufcPSNoHoNxNeV7
         W1F1bcno9Fsw2RmNwcPftu1kZdSnrOHnkXq+6KdNgmQm7jRqR1EGyEzC5FGIrW8oo06w
         IYqtH7trGhRYlgwCdYic6yYTYJ+/ARyQDjznySIFCsdxC15zTu9+8lNBeV9aDOgVdVsC
         Ct9OllJVIe8KmeZZjOFhWMauQxdKidSd2CIH2pdigW0NQvK/1WO7m7bOBUgOu+ahJT/1
         vcZRfqUmk380G8SO+sxM2ZdBkAWFOM7VwHQQciy5D5vemNm4msCj+g79v5xoHA2moyem
         R+Yg==
X-Forwarded-Encrypted: i=1; AJvYcCV5Pj8Y3cu8pY2XOnv1snuBGS11+GW2Yu6tFzO/UMAr/5uv/6zdT1T9JjkE9KZmgB2+nq/pggEnXWzYK/ne@vger.kernel.org
X-Gm-Message-State: AOJu0YwN4G2lOtg4+ZL8uG8N9NhNc8J5QejbGnWnvxOp920M2+ToSFls
	5OeCdZvEBkrOtkxQQsybbXQ8QU2Ga9aAfDReH6zafFZbBLDHzB6Z6Y8HGwGQN1i5sFR7ZyyOWtX
	7EcJS4iC2rWepy49wL0TO4M3R5+kp/h9jsgm9diOMUIKmRvz/7PeA5A6ncX8lwxznbw8U
X-Gm-Gg: ATEYQzxNznk2m/jxo113Fmlm0sUk6vFzb7I2A6fWexGNLgvyfmLtjThS69HrfrTphlS
	8rgRN5YmJmpB/alNN7u1UE3+iu/2IOkQx/EvphQ4MxeSQsDJhQNVfDye4Zc+ac8RRC+FiPhSSaT
	PtJnrr+SnQYi9elnehJn0a8d5P+MhKF0sQsGBXDboHrJlhKHuXw5SrGUnx262jmJZIKifsFVyky
	uVukFUFEL5LzPX9zSVGaBU4R47DLJbKMUNRq+zCzYZqnSpA6Xo54ZxmmRaQlIpiZM/Tx9YfeEs1
	/64UTKQ5Cw9LPMo6wME6i9s2bX1wdgRf/BLQqcb3F5agOXC90os2Spu4xGOV5t1C1TKa23G7c98
	RD4zok8PSRYmOv9N6VEiz6rq4OaYu2VqdIcjQcRFsoMC03p3qSiHKBUIwyyuGH+VBDdRKIKdZUw
	+E7Kc=
X-Received: by 2002:a05:620a:370d:b0:8c7:1aea:53b7 with SMTP id af79cd13be357-8cd6d49009amr1126465985a.9.1773060046387;
        Mon, 09 Mar 2026 05:40:46 -0700 (PDT)
X-Received: by 2002:a05:620a:370d:b0:8c7:1aea:53b7 with SMTP id af79cd13be357-8cd6d49009amr1126462785a.9.1773060045845;
        Mon, 09 Mar 2026 05:40:45 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b942ef42ac6sm367631266b.11.2026.03.09.05.40.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2026 05:40:44 -0700 (PDT)
Message-ID: <c9acea8b-1559-4fe7-ba78-f3cc61a05d72@oss.qualcomm.com>
Date: Mon, 9 Mar 2026 13:40:43 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: qcom: sm8250: Add label for
 reserved-memory node
To: Alexander Koskovich <akoskovich@pm.me>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli"
 <gpiccoli@igalia.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260308-sm8250-asus-obiwan-v1-0-3c72941eb796@pm.me>
 <20260308-sm8250-asus-obiwan-v1-2-3c72941eb796@pm.me>
 <20260309-orange-coot-of-speed-b3fa28@quoll>
 <7641f6c4-6d80-4d62-b963-734371b14750@kernel.org>
 <NyBYVOuujgzbrN9E_Y1pYyOJMgys_1tE2jUI80-mtjgzxXUCQLaw1ZxuGVPpBANTMTQPsH7OhUlxkSRt7b_hiekBLuzEgPswCGy3_MqT5tY=@pm.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <NyBYVOuujgzbrN9E_Y1pYyOJMgys_1tE2jUI80-mtjgzxXUCQLaw1ZxuGVPpBANTMTQPsH7OhUlxkSRt7b_hiekBLuzEgPswCGy3_MqT5tY=@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDExNiBTYWx0ZWRfX+qmveHKHjkZz
 YYQQgvnLYfLsiHof6df9MuF+cSq2+nXvfIR4DilVEQA0oTJFJUmbREepYEjLFEeLo91F5TR3qcx
 86uRU+KxxD/QpEAdCTCzXQnvOa4piFcfQPuoT7Ni15kAzMadU17BwjIP6hOoEoeCL38hP8sz0kt
 Gebw4QQfJowqKz0TTpPV/xFv+rnub+EGKOzSGeQ9qCcxR/OWT/nwtk/EeyT/XUwxHqiDKyZpi64
 ognG5NIKxxlDEh/fItGnwXgpOMw4Ow+VXmcYzRFyCPCrs4GqNxfM0gaHIgq1CXGGy02yJZRfNjk
 DqO2tftu3eIMcLmNLuoYkicY4Ffb/SuLV2WCaY+jlb62gA+ncOPv107bxqdFAMkQ4mg6ZGXCtcA
 sdauZNg5IyPYYmklf8BtnAzngC/QjKFaTDbG/HjY1biEYKvJiwy4tV6+dT1KwUIbQnrJ2cfu6rH
 C/mLWec9+KLQ9Dc+aAA==
X-Proofpoint-ORIG-GUID: jCn8S6Eb6rx5AiCgOqDJ1upcF-QVmygR
X-Authority-Analysis: v=2.4 cv=QZtrf8bv c=1 sm=1 tr=0 ts=69aebfcf cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=9qU7lu9XUZqo8ZEGW5YA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: jCn8S6Eb6rx5AiCgOqDJ1upcF-QVmygR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090116
X-Rspamd-Queue-Id: 775D6238FD5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96259-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,pm.me:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.978];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/9/26 9:08 AM, Alexander Koskovich wrote:
> 
> On Monday, March 9th, 2026 at 4:00 AM, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> 
>> On 09/03/2026 09:00, Krzysztof Kozlowski wrote:
>>> On Sun, Mar 08, 2026 at 08:40:38PM +0000, Alexander Koskovich wrote:
>>>> For some devices it makes more sense to just redefine reserved-memory,
>>>> for example on the ASUS ROG Phone 3 it is completely different with the
>>>> exception of hyp_mem, xbl_aop_mem, cmd_db and smem_mem.
>>>>
>>>> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
>>>> ---
>>>>  arch/arm64/boot/dts/qcom/sm8250.dtsi | 2 +-
>>>
>>> Same comment as before. This makes no sense as its own patch.
>>
>> And this is v2, not v1!
> 
> Are you saying it should be fully included in the ROG 3 patch instead of being a separate change? Can just include into v2 of the ROG 3 series when I resubmit later if that's the case.

Yes

> Oops on the version, should I increment version of a patch if the contents themselves haven't changed? Or is it just for any resend of a patch, version should be incremented?

All patches in a series should have the same version tag, i.e. it's the
'series version'

Konrad

