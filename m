Return-Path: <linux-arm-msm+bounces-79633-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 09AB2C1F5CE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 10:43:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BBE1D1895D62
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 09:43:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13A683446A3;
	Thu, 30 Oct 2025 09:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="llXfMHF5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N4bDPy1m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79A18342170
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 09:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761817351; cv=none; b=cJKQsVC/7fx03vBWZaRAy1POUB9JWYc5hOYF4apnWSuCAsjqX+kMh4ZfIFV6jI2vCpvWaW4AKgHHoUEPQkRmeNfxNjY0Rsr9vex8mdN8hM4B/qM5L0e/Ti3v8KZjNKsExwo0UvrTYm2x26AEvXOiAw+60I80KEnpjAT3marQsE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761817351; c=relaxed/simple;
	bh=slKW9L5x+Vd9nonv1JxQPKYUvCioEofsk+O6FXGrWEA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kUC18dGbLVde5yP2xDyWTe5Vp92LmoifxTkNVRq0ROc5zIufWRn/H+OseU78230O2upKGNbs+gY3ZbQV706xDfTolLr+m1ntj+WgdQ2u/rUjn3gdx4VeosThIZAOutcafgL4QGA2/1eDcWIFrjRk/5wTW967cmoXYFD5Tg3S4Bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=llXfMHF5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N4bDPy1m; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59U9XhGY1994685
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 09:42:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J5/Jxy6FXaPiBQjK1w8+WRc0ckZ+y5lc27V0KfPeyZo=; b=llXfMHF53jrUKs9Y
	rpYYL+GoyBt5fZp1tqfiR2y0mJiZ0y9KbVxny3EgyYPMSsfEh/G6cUFq2VmbIFnN
	kKQfTo4c/sR7ux2eRLdU8S91RNcGDOwTjfDPSnix/8jW9dLqgPt2KJSb+YpL2QTe
	xOY6B0yJg++b8H1vNWCgQm/bQfkHRDyEHdSDulGgy+TXSOKdTaSlEyRcXac46Ojj
	f4FN7FVn1flWnCOCoq0SGX9KcG4wBFOO8SMqr+N53bgL6mPogjg0FWqfgsxGNq6E
	A0svXhoXOPSyJYs/Nfxo9oNKZJSZu3aFA6YFc8BffY4uDCS7//OJY34OgeQmioDu
	y4pf6g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a3wr71cbt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 09:42:28 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ecf9548410so20813821cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 02:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761817348; x=1762422148; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J5/Jxy6FXaPiBQjK1w8+WRc0ckZ+y5lc27V0KfPeyZo=;
        b=N4bDPy1mnzwPsGFEPRV9CptsERvUXswEAG6qdxYI4koeR68mKw2gehxhL1kPyunIOh
         76Gy7PgdewPL7gD1cMJtG/lGrWCnleM3xGe1M7Hl8PAFn0Ip8yLfzXTAMm7e3TToyPkp
         JZCAkhgx/P1DJtAuE6XsMIdiPNouZqGKcMPa1L7rbq5nyTpLM5Owqi98G0KpaWzS7o+l
         loUEMt0CV2MbguQmcEw3A3inssPSuC3Cdf2ICutWiRAjRCUqW5Y8EbyLG9ZRmMll9k/3
         E2KJ5Xk5rwJDIuSnT1n47KyHClraEqnVcPMYC9h97DeipCJdaey/9uaoVup5OkFE0UWC
         vRvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761817348; x=1762422148;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J5/Jxy6FXaPiBQjK1w8+WRc0ckZ+y5lc27V0KfPeyZo=;
        b=FodebCHutYTo4xKxe5thDeVay0G+HX5WEx9iPQ/E06S8E9uB26+pAVipUTwPYwAtcM
         7m1pYlI5EovBxLHl3lVdd9xKJi7fRYjf1bAg8i6eMsTtZElgfPVFT0QhNGbtpK7OZ2n/
         zdTP20WIE7Nxd1efK0jSYaa1iVapqzOgBZZSW6h9JwPR/UjlkzNnNnlNzZh332cZO9Ye
         dT4cbI4v4vj6diP5EqVBo1qlsos5qnApAg33iKmUC9dQJWDUNpEO5aE0naGrWd0B0q77
         bPdXGDUBzQK5O4/74GkPohThcmy4PJij3OrnWfNUdw7Aq+2gah26ilqVXOAuPy/4lbBa
         PSRw==
X-Forwarded-Encrypted: i=1; AJvYcCW0s809KJpvs2OsRZFTGTv4BBF9fvYdlaxqc9H43B7+A4CjFGp60VCaSBnqR61qBg+IqAUnH9GhLqA954EF@vger.kernel.org
X-Gm-Message-State: AOJu0YytM+puvO/dTnXkE1VLy7nkBzzbKJkyNRuST8kwZNVPSS7hBVqQ
	aLjhxoDUPtn324J92pDtSa1ksLhBkl0MLN8EJp6NKPyfxK5Rm08rx1ezvYkH3HbfYer368L2JIn
	i9MJLzPhW8e/UyYCbaPQYGT/TI7wHWrwSHCFqQJvmOKa64u497rTKywTJuCx7c07g9gI/
X-Gm-Gg: ASbGnculUmajnLbeaag0DZXg6TyNE4g00RdpUzYFgdB5a5t0LHz8+EOFfWETJMCSHUo
	2TwiIIfYFM9YkD2JV5WxHgge9K2L1mWUTNNmjMBVrs2FiY+1SPlpJw2uJY/kk/skIMixgFi/Sl+
	Mw0b3Hf4kzZXlYcQHIAwNTVMl1zlSDgKo8qkMUYZLnafLfzChF/QEmjnQJG5edlLuqsJZIObWn9
	GBDuT6NO0eorxMYjqPfm5PrAOY8wUeIdJDSWV36tHeYUGV7MitUFnI38F67wvPqs+7WYah5dv7q
	aca/wfBrETkBI3hKX9LasjE01+15T9YSWcALveio5XTH3+McSU/Y2xArxJblj+PgerMaXRcvUB6
	ihWD4Ifx020FYJwgitQ9gpJ1ryA==
X-Received: by 2002:ac8:59c3:0:b0:4ec:f654:8522 with SMTP id d75a77b69052e-4ed22216b99mr34207411cf.38.1761817347646;
        Thu, 30 Oct 2025 02:42:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH/8qp23qWFyHDBD7eZ1LN+vTcJ3LO+5eIrwfuCD9HQ3Q5hCF4435OigRG3baPksTJWu7zEGg==
X-Received: by 2002:ac8:59c3:0:b0:4ec:f654:8522 with SMTP id d75a77b69052e-4ed22216b99mr34207121cf.38.1761817347050;
        Thu, 30 Oct 2025 02:42:27 -0700 (PDT)
Received: from [192.168.68.121] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-429952b7b2dsm30920542f8f.2.2025.10.30.02.42.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Oct 2025 02:42:26 -0700 (PDT)
Message-ID: <82beffa9-d956-4820-812c-b2cd53d4a262@oss.qualcomm.com>
Date: Thu, 30 Oct 2025 09:42:24 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] ASoC: codecs: lpass-tx-macro: fix SM6115 support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        robh@kernel.org, broonie@kernel.org
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
        perex@perex.cz, tiwai@suse.com, srini@kernel.org,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, alexey.klimov@linaro.org,
        Stable@vger.kernel.org
References: <20251029160101.423209-1-srinivas.kandagatla@oss.qualcomm.com>
 <20251029160101.423209-2-srinivas.kandagatla@oss.qualcomm.com>
 <312b62d9-c95e-4364-b7e8-55ebb82fd104@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <312b62d9-c95e-4364-b7e8-55ebb82fd104@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDA3OSBTYWx0ZWRfX7kf9EwkXoszN
 kBmLerVHKxBhV3VFdOPWgFnKBVIlDRnyD/1V6AqH18Wv1SyOBxlTKFCAPFzzYv2TB9dU8wnAneS
 28SuLsMoeUY00O32jZ5z/ffxM+l6F3iLMesV+C0MykK8x6ltbIi6g2fLcoY/yb2aWXj1UHOW8o1
 E/A/PH6ihyR06AnSk8pz5g6PW48MELvBH7D21PlshMmo2bu3paIF4iP4Xcth+KYEHXN3k1YjOpT
 7hDi6GyMh2MF8bqbVrP0eed0KKsZpwWKRdLYYhJC/NYEAUi3bqwjGUyycahobR81E0E//5xHScw
 c6oG1mDPV7us35hJHDVd11BhfEWyKA3WKEAeWbhoZt5SwKGhR2xErEQ/jnxz7IrAfQhxDBgO+Th
 bWTy7T8ucKy79qLLOGsDucmGRM/xdw==
X-Authority-Analysis: v=2.4 cv=P+Y3RyAu c=1 sm=1 tr=0 ts=69033304 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=2Ovg_PPPbudXyttJYDwA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: cZHGjD3jMZ91Mrap_dikkzAQ4MEzhHng
X-Proofpoint-GUID: cZHGjD3jMZ91Mrap_dikkzAQ4MEzhHng
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_02,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 adultscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510300079



On 10/30/25 9:06 AM, Konrad Dybcio wrote:
> On 10/29/25 5:00 PM, Srinivas Kandagatla wrote:
>> SM6115 is compatible with SM8450 and SM6115 does have soundwire
>> controller in tx. For some reason we ended up with this incorrect patch.
>>
>> Fix this by removing it from the codec compatible list and let dt use
>> sm8450 as compatible codec for sm6115 SoC.
>>
>> Fixes: 510c46884299 ("ASoC: codecs: lpass-tx-macro: Add SM6115 support")
>> Cc: <Stable@vger.kernel.org>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> ---
>>  sound/soc/codecs/lpass-tx-macro.c | 12 ------------
>>  1 file changed, 12 deletions(-)
>>
>> diff --git a/sound/soc/codecs/lpass-tx-macro.c b/sound/soc/codecs/lpass-tx-macro.c
>> index 1aefd3bde818..1f8fe87b310a 100644
>> --- a/sound/soc/codecs/lpass-tx-macro.c
>> +++ b/sound/soc/codecs/lpass-tx-macro.c
>> @@ -2472,15 +2472,6 @@ static const struct tx_macro_data lpass_ver_9_2 = {
>>  	.extra_routes_num	= ARRAY_SIZE(tx_audio_map_v9_2),
>>  };
>>  
>> -static const struct tx_macro_data lpass_ver_10_sm6115 = {
>> -	.flags			= LPASS_MACRO_FLAG_HAS_NPL_CLOCK,
> 
> 8450 has | LPASS_MACRO_FLAG_RESET_SWR here

sm6115 has soundwire controller on tx macro like 8450, so they are
compatible.

>> -	.ver			= LPASS_VER_10_0_0,
> 
> and the version differs (the driver behavior doesn't)
Its 9.5 on 8450 vs 10.0.1 on sm6115 both the CSR maps are identical, so
9.5 is compatible with 10.0,1


--srini

> 
> Konrad


