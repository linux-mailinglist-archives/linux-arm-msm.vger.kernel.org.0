Return-Path: <linux-arm-msm+bounces-104274-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8I95Bm7o6Wm2nAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104274-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 11:37:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AF22C44FCC3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 11:37:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 922BE301C5E5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 09:32:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A911F3E51D7;
	Thu, 23 Apr 2026 09:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Cu5yRzGx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QMSvrjYl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 659363E3DB0
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 09:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776936756; cv=none; b=nwa324Bfi/0YQujB35bsTBg8spb+WEDBISXuDfOon0ryoZ1RNqoaDEDbahulo1mjNOi6lv+KNjkaDwUIeVXNBPO/rOTiDfIEhptDmNStDhEqgWXX79X57sJ/BPL6FFymrWrYg9m0Qd++lffWHTuTTqzGOi3hzLHVEQfz9TnwiT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776936756; c=relaxed/simple;
	bh=7OdUdA9nhPBnevaGM1xEomgeV5CXzvXOy8+2RMwcraw=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=F0NUATzZkuDz2rEYe3Q7bUngbnq4u5w7mq2F2IaBVvxhmoFKT4Dw7xORrKJlir/vF+bSN7YEG5NSvF4J+CBNSchMMbDOrRv/OMHQCaNZ64U3bgFedV93V9geR38ByDvuGdG8lMZzatBvES32KVdKr3srXKU9g62SwdOK5L5dARU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Cu5yRzGx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QMSvrjYl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N8uE4I3044072
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 09:32:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K6z8eQFDgV6LMClu/l9rPSzIL75kuB2xbW8cHeF/LtA=; b=Cu5yRzGx8eghOxDy
	yXg3UfGnW+limtbUbIjh22ySPsF7/0MuBtjYmgVD7aBSkgTzpt/hUmKG56S8+FGX
	XkrSiaoAM8ekPXrsUNNseHDQ7R37XeiepFkPaWdmIrF7SvHLkW9JJ7+XrhmGe0Hh
	0mHqB+GN505ie/MZQSRC7N6wliXSbbBg4koe9+avxnMgPMCUY7OHbHXgSxYSYJ9y
	aqVTc+wBVvUAbmLT40CSx7eBZfxazjunKmTCtTetsWWvr4RsnR4p+9WobXW+PYm2
	gB6TldU7uCIfPP++IMtojXguZQCrN6ctef6ohGTYoU8HqfwPe+ogIubi1Ybrdaan
	i+iGHA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq1jh36pf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 09:32:34 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50f1b94ac9dso12119681cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 02:32:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776936754; x=1777541554; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=K6z8eQFDgV6LMClu/l9rPSzIL75kuB2xbW8cHeF/LtA=;
        b=QMSvrjYla2lIpjkFwhdY5GfRyH9RhlgPRiXIFjSMI9PfCJu5Qh0qY6K33eeLNC7TsH
         nhMtKHJgC/Zxti14q6pOthVfdExdEvuer2J251/7vmoMflhHgbiUTfkDZA3KbyBV3AW/
         6MUg1TOEPsaW4Gt5sEMiJeNdEtT7xzLsv3pRkGq9W8fRap53Saqv0OXSZzOGvl0Z6Kf7
         5VFrJvp02DnLz2N7NxcCzQo89o4IKinceDkQNZZGX+KElhgbFIr6FpUtizR/d0/M7n68
         oBrIKm7Qz1bD1riTdDULlqQgEbpk6Vvb2UuJYE+OONFqexwxKE1pAFCl8k0AfiQxoHEv
         Y7eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776936754; x=1777541554;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K6z8eQFDgV6LMClu/l9rPSzIL75kuB2xbW8cHeF/LtA=;
        b=IjlKm4We7GyLdKq2C4SeCMxJm0RT0CQBtxGJFjNXwe3P4E7gcVEKBHmlWGWGobI6kr
         CqDdQpU95gbbbEwlKfXbLloOLeYVX75cbXhVD8QJN7tJPt0cXCBZAIhrUuFqn/smX3fj
         g/qNWWqQU2pSYizBgwGYs1VYPA66VfbwLX+4PqDhaWdPTa8MVuwHnZwdqstX4SpYMvxV
         Axs4J/yeh42z2HjBF9Xwtt3jCvi6cu/+lr28GLfepm/+M9Jq0YlrYNud/2BK9tKfYt/Q
         83NNOIXbbn2HbHmUiJg4iUCcmyFeV8+loUMzzbZEaB8BGWgCWTIwkLQGtkpL8xE4kHKx
         +jRQ==
X-Gm-Message-State: AOJu0YwfTvWrfY17SiQgwxLToVOvzguS8bNYSJBwr7i5fNUAa/Xp1pbq
	tSGSjkaGQc/dr8dnS46BcjazX8yabGzNE9GPm+U2jHmVZUbBMiHzgG/DmIRE3JWqB7RpJ3vM+pT
	9EDf8gs1bP4snuXKlP90vIWE8aYS78yqIC7G8+kar7OQlfGLjC9HDhpHOXznzZrrxUEhA
X-Gm-Gg: AeBDieu4wsLg5c2yAAyUyv9VwMfN+PQWqRIQXohrfyJGFQDAL1oWt3hBO2nIDtexkEm
	USXs9xnY7VQB07E1nXNtLWFnC6s/kb96zEEg/DLyWi550RJCIOEvMsI0QeKoAUnL695uJ7o0HE0
	VLT1+Q5fLkxkSJ8+lmuz2J/I499tAuNhXOSDvHlusSnrhRow/w+il57zFz/Rwpbl8kVr3q/TnAn
	ipUzoxMdQFJcRlIh+kgck5QOeEpewod7Erm9tyNRPuZqZUt24IdvH7U3K6qQCNXDoLth6Dxu643
	FOi8fqv6D6x9VLn/9eF1DAYB7PuvubXHOA+zRczJxDtQt/j/LFp5YUuYOgRZr1R3X0x6Gapcsmn
	xKLtiLbphcXl4SmhdhKdSK4sDI0mqX5oENBtM6HCzzC+fOWyAnWHQco19kEzmJbsAnPeXFjR3Rm
	2iusORxz1p+LiNzA==
X-Received: by 2002:ac8:5741:0:b0:50d:ec32:b84f with SMTP id d75a77b69052e-50e36c12a00mr247028771cf.3.1776936753665;
        Thu, 23 Apr 2026 02:32:33 -0700 (PDT)
X-Received: by 2002:ac8:5741:0:b0:50d:ec32:b84f with SMTP id d75a77b69052e-50e36c12a00mr247028601cf.3.1776936753237;
        Thu, 23 Apr 2026 02:32:33 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba45572d01esm662989566b.62.2026.04.23.02.32.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2026 02:32:32 -0700 (PDT)
Message-ID: <d3865273-3a39-42fb-a49a-16bab8daff05@oss.qualcomm.com>
Date: Thu, 23 Apr 2026 11:32:30 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/5] phy: qcom: edp: Add SC7280/SC8180X
 swing/pre-emphasis tables
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260422-edp_phy-v4-0-c38bef2d027b@oss.qualcomm.com>
 <20260422-edp_phy-v4-3-c38bef2d027b@oss.qualcomm.com>
 <df40b4d1-6133-4d49-a7e3-47cbb2b058e9@oss.qualcomm.com>
 <cbfa3db8-e500-42ce-8302-16af7b19afe1@oss.qualcomm.com>
 <6a83b074-8a19-4148-a4df-bd11e27e7dce@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <6a83b074-8a19-4148-a4df-bd11e27e7dce@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDA5MiBTYWx0ZWRfX5Wrwex6f+UwF
 V3UPXtzmYSRY4WHt9JbOXvYEGj1G/HG2dCEI3MJIn5IaiAzHuESiH8mWWBZZrwtXCC2pWqZ6nGf
 WAxLIyO3Pmo49vN3mvlYPlnOYC1/UBvUZiN120yshUEYggj7r5/LxLbIc3u2T96jPV9kzu/wl63
 hpZrzI81McPixEtLFNSgtnCbeOHggSu5fesS3XRgKHkDrkDFu4B1+kDWLgofAVG3zlYkLprpoHW
 1+MMTHLLPe0nIsTBP0GtTJWxxqDdI7AyqDr2GApHOLBkJOxcsOnoYwTSHW/FfLDTjIKk/0pBx6Z
 lt4qpG2Ug2j+MkzrPvcv4zhExPb/Sop6I2gPtGI6+fePRyHKlRuvrExV8H2St/f6lVpLe/snpwg
 qRI9bBSh4eVc//mqMMZqEviec35yLhj0LFaZAz1OGHYPoDuYuMqBh96LCONKalPk6xMjiE7vrdN
 ZYVVCXx7iBYgg1JValA==
X-Authority-Analysis: v=2.4 cv=OeyoyBTY c=1 sm=1 tr=0 ts=69e9e732 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=hqNdK9bzmW6HMFoEAMsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: iF6jxP4J_D4JR_QvKaC6snZkWYbB4rnq
X-Proofpoint-ORIG-GUID: iF6jxP4J_D4JR_QvKaC6snZkWYbB4rnq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604230092
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104274-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: AF22C44FCC3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/23/26 11:32 AM, Konrad Dybcio wrote:
> On 4/23/26 5:28 AM, Yongxing Mou wrote:
>>
>>
>> On 4/22/2026 6:42 PM, Konrad Dybcio wrote:
>>> On 4/22/26 8:01 AM, Yongxing Mou wrote:
>>>> SC7280 and SC8180X previously shared the same cfg because they did not use
>>>> swing/pre-emphasis tables. Add the corresponding tables for these
>>>> platforms. Since they have different PHY sub-versions, their eDP/DP mode
>>>> tables also differ, so move SC8180X to its own cfg instead of reusing the
>>>> SC7280 one.
>>>>
>>>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>>>> ---
>>>
>>>
>>>
>>>> +static const struct qcom_edp_swing_pre_emph_cfg edp_phy_swing_pre_emph_cfg_v2 = {
>>>> +    .swing_hbr_rbr = &edp_swing_hbr_rbr,
>>>
>>> For eDP / low-Vdiff:
>>>
>>> I believe the RBR swing settings for 8180 should
>>> instead be:
>>>
>>> 0x07 0x0f 0x17 0x1f (matches)
>> Emm i see from ipcat eDP Low vdiff(Lower HBR)  swing settings is
>> 0x07 0x0f 0x16 0x1f
> 
> Yes, you're right, I made a typo
> 
> [...]
> 
>>> .pre_emphasis_hbr3_hbr2 OK
>>> .pre_emphasis_hbr_rbr same as above
>>>
>> Thanks for point this, so pre_emphasis_hbr_rbr same with pre_emphasis_hbr3_hbr2?  I also don't get it's RBR or HBR3 from phy HPG. But now i think only eDP will be used in upstreamed poipu boards. i check the dts and not find any poipu boards will use DP mode(or mini DP)..
> 
> Yeah let's not worry about it today..

About mini-dp specifically that is

Konrad

