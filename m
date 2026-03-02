Return-Path: <linux-arm-msm+bounces-94949-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IMbNGayVpWmPEQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94949-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 14:50:36 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BC3B01DA1F4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 14:50:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7996D30CD91E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 13:46:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAA1F3603D4;
	Mon,  2 Mar 2026 13:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Je1CKi7B";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gX/6LVAg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E64E377021
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Mar 2026 13:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772459201; cv=none; b=q8kLJCYMLUbeS/pW48r4wpZvg8yxBw47srjuSfpfTRyL0E8VZFrdN2wB8NyYq0YlTRR+DOHyPeC//IEkdGJfU+3Eo8vOFejtX0UP+CKCAvFYFtnB90a/MhAkUZNlhBI9Pc8dmmxczxI4IM8dzmpgtjFk7BRHGDx3XeNiQvQi8v4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772459201; c=relaxed/simple;
	bh=0NmgLHDqExFVIcuaL9SnOrt1schbgI00V9n6u02dpOg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cCNdb/C4jHozvpJk0RtzChomPMUOh765Wl9+ukbkt0l+A30+1oZtXzpU63WeEUcp849+/ClS9Hw4Xs/cXhSutc/SsXiJwGda3Cgr9kghXfBEV5C0W6Z+dM6xGFPuARygTRoJN/vPz1MwWWqwUAu0NMXvpt2BzRV9vI73U29Mb6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Je1CKi7B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gX/6LVAg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62285bEt662344
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Mar 2026 13:46:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1VKdJzwWet07SkkHF5W6d2bdvsrjsh3dEIsPyBtnJEY=; b=Je1CKi7BU1g688PH
	y8YnJD8jhlgcf/vJinCIcNZBZp7jN4JeeqrslCoo1Say3NV858reSa47jjrnzn5F
	OhbTFLL/z9F6NnPyM+K+4wzFMpsmlvj/0MOiZtjeD7CFtLoFPXYA6uv7YQddzmQ0
	6MZsh9rJu3gsCBizu3N/uFM7VscB1H10B+aiiTFVEtt6avA2VhHlKhkXc9g8nHmQ
	h3fRN186VuL9iTgLXoJGEsJ9L9JChWHJUfkucQxqvUS0Cp8k63v5BL85bOJHIpyC
	lCj2aN2UGrkrqAMC3TnER157y82X8qImmG7PRuwsifCr1hxbwUW9hJhHZ0b/uNS+
	3EAEhw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn6r2s7ga-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 13:46:39 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c70c91c8b0so433186785a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 05:46:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772459199; x=1773063999; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1VKdJzwWet07SkkHF5W6d2bdvsrjsh3dEIsPyBtnJEY=;
        b=gX/6LVAglfSyAEOhQFdSX56yucTqNaw2vaZjJNMksa0HPFRzMc9efjmdSjNbgamIoY
         gCas+16do/rwxYPsq8Wtb5UMhf67AYbm+MCSyPBU8pODTSWMPr5/rg3geu+ryAas36rg
         C2y5jo6Wu7T99lZ4UW2pRTkCuHWGfLG/yjPBl30FUWdGGFDusQuKVfJSq2hbmWGagfcR
         tbTNPuqN+fu+c9PQeZT0117EXIq3ZJqRz3yoLo/XO8issi58POtoBu78/1PhZfcJ6FOJ
         wy4RUmJHx6fawM6AeENLLx9evBHdg+p8gkProS7nyBEvz1iAS2lslTQIYjWfCHOWDcjd
         ZbkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772459199; x=1773063999;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1VKdJzwWet07SkkHF5W6d2bdvsrjsh3dEIsPyBtnJEY=;
        b=hTY9iLoTbCfA43YBd7+33ZCJmZXEaGOLJBfQpMntgOwfsJFu1Q11+vOz6pvkUYz+s6
         WagE/oQjyAg94TlfgXO9/fv1R/FquiYg0aC8c7z9mSWs97oASImf8Wg9Mor7yJDpCdnH
         Mk5PLPZMxrVnIdznX2TXorgGU4s0cJnZL/q55ZzOO876HVsEwlyAIZtivL+PGBK6F9HD
         kPCx33/oVXH33WlbNj5HU5e2ks5ou94dK/zYAWjaXUdNYamNfMM8QVYagoTtDq/MG5E8
         tys0JMSg51qTDhI/8A/1fGBxnPxBpRGh3NW+EHoEpJ4FhBfMPcuisZ3l9PpKTz/Dq6GN
         MrKw==
X-Forwarded-Encrypted: i=1; AJvYcCUfiG8D5UrGlRgjcMmEdnaNU/YsvyrD2y+1X1LccvLkO8mWSP77+oTCY1RZwKF3d4noBoakPLDRs+smW7ek@vger.kernel.org
X-Gm-Message-State: AOJu0YzQlbwAKIg48Q60fBunGjkXF7G8GGgRsbgXR33IhxQNXCTkW1g8
	jyMgm2dtSgI0SV3LykmlwPw1IlSIYcCo5+kUxw/CRaFAobkibFQWk3SdsG4lAC+GLKeTeqO9MKy
	2syWz0Cou0gGA7V8bDoh1XD4jyr4oKFHDJRPJzQg2xzLpXFxqhcRS8K4POqqQs4sUDKzU
X-Gm-Gg: ATEYQzxnsKvOKk79xWyuoT3Wd0AAsuBdmsXEWocRewjHcpGF6WL24U2ZTNdNhPftrvJ
	FDqDqiWX/60kGPUvxBR2/WaS8Xi2E+xtjhIzFWW+/zGIbAkzGbuIZYaJ3AKq6GIsbTT63+QrFyM
	W7yeTtFmlaRUciLZn46dxTp2NzpQ89QsmeZ+ifau4xdY+avxHKtblFBJ1t1B7DfnSyUaZkuWQjD
	pU9/DBtUidL9CJxp5h4C0Ce9xcE4wv/qcbTIfHUbnV4maFYhTtNHuOafPdxVIAcEeFIArvYH0VK
	TNg1cs4udhG1UGgwM+MaAoiF7Sk9OFEe6rOXkmjkH8xrOA9wFnZtw42HbYQQHzvXizD0H2rmKbx
	AU9Bk9lAOjKaDj6IksZXBZ9wlWscNBbZpmT3ekNw97uLwps85wTAZV7YeRn0vqTFIZ4J1OYlah1
	raaZM=
X-Received: by 2002:a05:620a:2806:b0:8c9:eae0:d1df with SMTP id af79cd13be357-8cbc8ef417fmr1208188285a.6.1772459198589;
        Mon, 02 Mar 2026 05:46:38 -0800 (PST)
X-Received: by 2002:a05:620a:2806:b0:8c9:eae0:d1df with SMTP id af79cd13be357-8cbc8ef417fmr1208182885a.6.1772459197877;
        Mon, 02 Mar 2026 05:46:37 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b93987b9f73sm259566666b.47.2026.03.02.05.46.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 05:46:36 -0800 (PST)
Message-ID: <b230815b-e169-4a3c-8c36-154deaf66afa@oss.qualcomm.com>
Date: Mon, 2 Mar 2026 14:46:33 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/msm/dpu: fix mismatch between power and frequency
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: yuanjiey <yuanjie.yang@oss.qualcomm.com>, robin.clark@oss.qualcomm.com,
        lumag@kernel.org, abhinav.kumar@linux.dev, jesszhan0024@gmail.com,
        sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
        simona@ffwll.ch, krzysztof.kozlowski@linaro.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        tingwei.zhang@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        yongxing.mou@oss.qualcomm.com
References: <20260109083808.1047-2-yuanjie.yang@oss.qualcomm.com>
 <kusxzlezvsuwcwwdtm7yqwnqea6gdeolkepxpx3estabaiqymo@edj7pgccli3y>
 <aWSTcI6H6+7AXkEN@yuanjiey.ap.qualcomm.com>
 <CAO9ioeVrQ_TfU5-auxNHG=dL8VmeWtBaC_NE09UECodkYrFv-w@mail.gmail.com>
 <aWSv+kVV3G18I/NJ@yuanjiey.ap.qualcomm.com>
 <e5ebc660-e30e-4fcd-ace6-5a6c889e9a8a@oss.qualcomm.com>
 <4g6fyehdc3fejx3pzeysmghigazfei3jz2vmnvxrnqkkbtbxdb@bdlcddxlvbhl>
 <cb22367a-678c-431f-9f52-33663f4af9d7@oss.qualcomm.com>
 <jr4h4sx42dbxpknm5nkgj7ydpkivm4nglfz7ui4bjpom7wf6ub@spqb27d3ov2z>
 <d5c4eed5-bd87-4156-b178-2d78140ec8a9@oss.qualcomm.com>
 <w4ldxcxvcp3fz7u2zxyyjiii7lsrnoa2l6amzwpsn5a63yzotm@iawh6btqtf45>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <w4ldxcxvcp3fz7u2zxyyjiii7lsrnoa2l6amzwpsn5a63yzotm@iawh6btqtf45>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 9XG9VuIFDlVzbMoJjTfRvaeeEDSSCzbH
X-Proofpoint-ORIG-GUID: 9XG9VuIFDlVzbMoJjTfRvaeeEDSSCzbH
X-Authority-Analysis: v=2.4 cv=Hpp72kTS c=1 sm=1 tr=0 ts=69a594bf cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=v90i8EJGIdyDnMh8qEMA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDExNiBTYWx0ZWRfX3iQrvmGlbqKs
 nLd3eND9N3CP/2IJVj0cxQdBHzC9bSwj5p9lAchYANgrkk67FEIBjjYAFFqLwSBhMwNiKfDjBpG
 SYHmG2WWxO2WFtRV2xWs11Ewm+uQjH+rBLjdoDU5kzCmnpHThQ2/mxouduc4kmu6e+/iL0yzoBr
 kV/xXRBfYa872eHdGuO20qXzegwcWODtu6kMGJGgwH+7Iix1Lc1cB+/dfTMNfFLcWbCfEP1S9d8
 oMnTtLLjbHo6myBaeHpIeaxQ52pRRhLD3xqbuw19CtBXy0tX5/7f6LkOo9jLnAsMAXq9+x87TkI
 2lNPcl3XOHw8yToIspP/9QzxSveV3v+w98q1MaSkvESynS2pQG35e/tsNJ/R2vW/9jpCu/j5VuY
 zsXTY8WWgwS8/31G6IpN0WEXIDFhLuinimtbkXU2vpydsaEnZj/mbLbqtUr55PfCQHE8Q4/WU5z
 OEys3v5xEtYHOs8oNKg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-03-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603020116
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linaro.org,vger.kernel.org,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-94949-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BC3B01DA1F4
X-Rspamd-Action: no action

On 3/2/26 2:28 PM, Dmitry Baryshkov wrote:
> On Mon, Mar 02, 2026 at 11:41:59AM +0100, Konrad Dybcio wrote:
>> On 2/27/26 8:05 PM, Dmitry Baryshkov wrote:
>>> On Fri, Feb 27, 2026 at 12:34:04PM +0100, Konrad Dybcio wrote:
>>>> On 2/27/26 4:48 AM, Dmitry Baryshkov wrote:
>>>>> On Thu, Feb 26, 2026 at 02:35:52PM +0100, Konrad Dybcio wrote:
>>>>>> On 1/12/26 9:25 AM, yuanjiey wrote:
>>>>>>> On Mon, Jan 12, 2026 at 09:38:41AM +0200, Dmitry Baryshkov wrote:
>>>>>>>> On Mon, 12 Jan 2026 at 08:23, yuanjiey <yuanjie.yang@oss.qualcomm.com> wrote:
>>>>>>>>>
>>>>>>>>> On Fri, Jan 09, 2026 at 05:22:37PM +0200, Dmitry Baryshkov wrote:
>>>>>>>>>> On Fri, Jan 09, 2026 at 04:38:07PM +0800, yuanjie yang wrote:
>>>>>>>>>>> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>

[...]

>>> 1.0  - old MSM8974
>>>        I'd rather not touch it, it had bugs and I don't have HW
>>
>> I have reasons to believe msm8974 v1.0 never reached store shelves.
>> Let's remove this.
> 
> Please send a patch ;-)

done!

> 
>>
>>> 1.1  - MSM8x26
>>>        Probably Luca can better comment on it. Should be doable, but I
>>>        don't see upstream devices using display on it.
>>
>> Because there's no iommu support for these
> 
> I promised to put it on my todo list, but the list is very long.
> 
>>
>>> 1.2  - MSM8974
>>>        I think it also had issues, no IOMMU support in upstream, etc.
>>> 1.3  - APQ8084
>>>        Had hw issues, no testing base, no MDSS in upstream DT
>>> 1.6  - MSM8916 / MSM8939
>>>        Can be done, low-hanging fruit for testing
>>> 1.7  - MSM8996
>>>        Supported in DPU
>>> 1.8  - MSM8936
>>>        No upsteram testing base
>>
>> 8936 is 39 with some CPUs fused off (unless you have info suggesting
>> otherwise)
> 
> Hmm, you added 8x36 to mdp5_cfg.c, stating it is 1.8. See commit
> 81c4389e4835 ("drm/msm/mdp5: Add MDP5 configuration for MSM8x36.")
> Author: Konrad Dybcio <konradybcio@gmail.com>
> 
> Please remove it from the mdp5_cfg to avoid confusion.

v1.6 is strictly for 8916. 8936/39 both use v1.8.

>>> 1.9  - MSM8994
>>>        No upstream testing base, no MDSS in upstream DT, normal CURSOR planes
>>> 1.10 - MSM8992
>>>        Even less testing base, no MDSS in upstream DT, normal CURSOR planes
>>> 1.11 - MSM8956 / 76
>>>        No complete display configurations upstream
>>
>> +Marijn, is your computer museum still running?
> 
> Should we open a Qualcomm Virtual Museum?

Maybe someone has a drawer full of QSD8250s!

> 
>>
>>> 1.14 - MSM8937
>>>        Supported in DPU
>>> 1.15 - MSM8917
>>>        Supported in DPU
>>> 1.16 - MSM8953
>>>        Supported in DPU
>>> 1.17 - QCS405
>>>        Zero testing base, no MDSS in upstream DT
>>
>> No upstream MDP5 support either. And it doesn't seem like that SoC had
>> much uses that didn't end up with the thing glued shut..
> 
> I saw and touched devices, but that was display-less version.

Only further confirming it's not worth pursuing

Konrad

