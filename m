Return-Path: <linux-arm-msm+bounces-95282-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yPEeDukEqGkRnQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95282-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 11:09:45 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BAC91FE20A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 11:09:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1BC6C3025A43
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2026 10:08:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02DB23932FC;
	Wed,  4 Mar 2026 10:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y/CcGOq3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q0mLwnZv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C43339EF3B
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Mar 2026 10:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772618932; cv=none; b=HmCaqGtGseq/3XqcqPLWHj/ZMHZyuAq9vr/5AVICfbVl5vi06uTgM63B1pFEdkAhtp5oaE1Hx/PBle//9DDRwL+LHEE11szyfGDEqZc5XuG5m3tXnj+8bKaQXGp9OYNvZp55t05Gmzmi1hXjmhUwbFO52lnyoJKJbbiF5V1aus0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772618932; c=relaxed/simple;
	bh=tFnKBY8ukaQ5gYs48idJW9ZlCBpp1MDP0D1uO/EbANY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F16P8+0ZuUyp49uwpWchDLjAm85RBZq0ADM4jRYghnE0T6iIIHHp8C9pGVMi+5R7hyGtBHC5CAKZBgtQScR45CeTsPY8JKQTwGWVsV9TJ4UKhD9cRUy84gkp3W7vFwrPXaLf4Indk96I8CUwcN7KRZz05a91x49eoIB8uZdajBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y/CcGOq3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q0mLwnZv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6245T16P2306785
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Mar 2026 10:08:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fzlp1+24JIS/MWcsYntqaR1/90WWm02p/xWprTh4BxM=; b=Y/CcGOq3H51XDQSg
	XtXtlXKR5Copq2rSH+9yUETBHj9ge8DcT3IuU9LZzhrhi+t1yIVFk1Cmih1hLVCl
	bmxrELvG6P6WaIJHz18Ur91o1ljTlghJ95/rxoawhYT+nZeeTD6Gvxg9CMyaf23r
	jWTc9XwlRsLl7OXaVEUSbmkRnIep+RragKUok34qjb6HYn6ofxQT1x82rqGcZXHh
	yZkCz5glx7H/RMTuishwTQsrx3LqcmrYkSmSXV8TMOYihP1XPwuVZRffOOoIVqg6
	Uv/GBuN/D8U4k20zx8KD+/bg5msJPwNEJKpwFJzEN/ufijUdsVI+9N+7nbuzPcgh
	9EoTkw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpau8sq03-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 10:08:50 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c70cb31bcdso523456985a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 02:08:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772618930; x=1773223730; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fzlp1+24JIS/MWcsYntqaR1/90WWm02p/xWprTh4BxM=;
        b=Q0mLwnZvha+wCc9AD58N2Fe+maOF53mMLF3XuvyjTku8vdBmklT+bWkLYT5KOiCUj/
         mnqsFJlP2ePS1ZOs1nbmDC/mo+0EaC+xUUFInaxr9jfkEo0737FHce/hlTX5VUCuwhD+
         nhFtNa5SBXiDEOWxFx1ccz9CikxYkBgtNON2/KK4Agdd3WKIiuiI7VJTJy3XsRYz0i5J
         hWG8QQyryAjEUbrof3rggOchvvWY4qNlkxlOO8HRxY7/9GSp4pElaZs3chLNxTtMSjeY
         Ku4TnS3/K0SHxbmnYkiCedkaXzju6wgPCRNDLWGZNxt96HfoRyyXtHhNH6CbZoh0F07R
         H1+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772618930; x=1773223730;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fzlp1+24JIS/MWcsYntqaR1/90WWm02p/xWprTh4BxM=;
        b=a4FoV933dIDmIDMBfKmzkdFbw5qrbU6M+82YgTi+LSq01wuxyjuVD0EMI5M4BVzpTU
         YiSQhahZH2ZfSVQT14yXmknwOqSMS0mhHbm77Mu+1EcRU18yLTS5SOsQr2IWu2OJENIh
         0HErHoX/seTz+TonDoRI1d7nZ7YDiNPEsS1dU77hk10jE6on4XvdRMHA7d/r0oQlSYtK
         mVOHmcsc1y5AULiXGXtv/nvZ3OnsnMdU6AcihokUAO7FCn6UnRxUb13WwxFNlKKYApCU
         BmPdSYA5rvv/zT2/fA5j1+KxKwMNcCJmQn8WXnr6h6iP5Xtlkj5628DqPf+GSTM+Hnea
         mqyw==
X-Forwarded-Encrypted: i=1; AJvYcCVxhxTHnriPjlxPK+yCIbXHq5WscKP0/XLlwMx+NSzKaDPfAd85TfZDmSaTN7kxyMPPXVpKB3B2vweTIGzX@vger.kernel.org
X-Gm-Message-State: AOJu0YzGCd278tac5a/QgUGOdUphbTNYxngW1WaC9k8YsCK9Sv7uCHjW
	mO1KHBE5Oga26CN/imaNTlBuT8K1CUxt+zrrRzMyk1732mFLqepKEvxrb5oFf8Mi05NSNslC59T
	jfGrwZ8BgCBFgUV3eqeYDbSFJ1tsCkapju/3p/AJvqrMi4sK8Gx/cylcn+BHBfbqIT3k3
X-Gm-Gg: ATEYQzzS+64ARZpBupjim9C5mtacj0Szfc9Vj46dz3l5gU2pJgIadbIDIvDduo3Jseo
	w0oEQIu+5ZRai4Z5iqkRXa0QaBDfLOWtQzf+Lz+xP3THn2DaFUCIlamY0EhFFuHnuMxNpDzIsZa
	NxslIXqwRBC4z73W1YCYGo+XWXkoeF0xZKM2Qid6ydqy0t+iITOzBkl0NYf8fvN7Q+3w3syoZfy
	NifaotVlrcJMk587aFbc+fOUS6M0sCpyYNJX9w0aVn2m0TGrh9Eo6Q7w05KJ0Uv51dlrqSoYkWv
	zLD+XksM8h820Y637WtTgz6e/2jOdqh3Z9stJqN7FQkG7CGQOMyvNeNwWy0nqMGhRCgPWcG9OUK
	eEm3QY9IvP2pSwjbFLjkp5xSo7XafQs2NSi4OfCb/rXYRBmB5kaX8gQSXErw9JxSA+fbJgtzuda
	1SGPY=
X-Received: by 2002:a05:620a:4156:b0:8b2:ea2d:a5 with SMTP id af79cd13be357-8cd5afb0224mr127638685a.7.1772618929955;
        Wed, 04 Mar 2026 02:08:49 -0800 (PST)
X-Received: by 2002:a05:620a:4156:b0:8b2:ea2d:a5 with SMTP id af79cd13be357-8cd5afb0224mr127635885a.7.1772618929466;
        Wed, 04 Mar 2026 02:08:49 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b93c9fc1808sm247755066b.62.2026.03.04.02.08.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2026 02:08:48 -0800 (PST)
Message-ID: <ef5a0e22-2f12-4584-9abb-0d3202a58b41@oss.qualcomm.com>
Date: Wed, 4 Mar 2026 11:08:46 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: power: reset: qcom-pon: Add new
 compatible PMM8654AU
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Cc: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260227-b4-add_pwrkey_and_resin-v3-0-61c5bb2cdda9@oss.qualcomm.com>
 <20260227-b4-add_pwrkey_and_resin-v3-1-61c5bb2cdda9@oss.qualcomm.com>
 <20260228-polite-swine-of-potency-56e61a@quoll>
 <6a304d0d-61b1-422f-bb65-8f8055095c39@oss.qualcomm.com>
 <7118ad44-5a56-4523-baff-9afa8030aff0@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <7118ad44-5a56-4523-baff-9afa8030aff0@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=AJS1/0o2 c=1 sm=1 tr=0 ts=69a804b2 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=ANQLM03IkSlz37as2tgA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: A0WrhdM7hPF9h63tAxFmqGJ6ARCckfUd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDA3NyBTYWx0ZWRfX2dWrlj2yvRuC
 KdBe8lF/H4QX4r992fdm7sCcG7DZiLcMuMqh7Tzz0bzExhowNEw8ld8owJFBg/LqAQ+iBz0sIFB
 ZdhPbI/0vnEO6QuPdCiFhvQlU0frQ+CqiqSILcoNdHODsWskRGeJlcAno6HeUXsawGVmiUGH9E+
 yRA9HdKnpDuDKkkH7zb1SwSWh577JgSuK8GlnZK1ydZCGkhJMQ0+zhxTC1+e+ZmC+2SpyM03nPa
 LFknf+NQ+2jGQVLcvG0bApcNNgk/vyDwLSKQlutXcX6JGbEqVarSrHcKJcNO4o3JJ9567vZqSJ4
 qQYuWxA7WMtQLuot2KQCfQ4fYk/xw0IIpqiWt9flD7kxJ0FxcdhBEdr7hKLFfJqm9LmjlQfrJ2f
 SPN/nuV/78GxZZSyH6FhgG110gMMBSeAgk36dHOpKIhDSC0MwoXswT4vQXHt+qP99kf0cd4sVhn
 ulLL6/DfUVf0DxGiNBA==
X-Proofpoint-GUID: A0WrhdM7hPF9h63tAxFmqGJ6ARCckfUd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 spamscore=0
 phishscore=0 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040077
X-Rspamd-Queue-Id: 9BAC91FE20A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-95282-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/2/26 11:28 AM, Krzysztof Kozlowski wrote:
> On 02/03/2026 11:20, Konrad Dybcio wrote:
>> On 2/28/26 11:17 AM, Krzysztof Kozlowski wrote:
>>> On Fri, Feb 27, 2026 at 06:02:28PM +0530, Rakesh Kota wrote:
>>>> PMM8654AU is a different PMIC from PMM8650AU, even though both share
>>>> the same PMIC subtype. Add PON compatible string for PMM8654AU PMIC
>>>> variant.
>>>>
>>>> The PMM8654AU PON block is compatible with the PMK8350 PON
>>>> implementation, but PMM8654AU also implements additional PON registers
>>>
>>> So does that mean that PMM8654AU has 2 address spaces and PMK8350 has
>>> only one? At least it looks, so I expect fixing the last if:then: - you
>>> need to drop contains from PMK8350 if clause and add new if:then: for
>>> PMM8654AU.
>>
>> The delta between them is such that within the already-described reg
>> ranges, there is some additional bits and/or registers (can't remember
>> but it doesn't matter for this point)
>>
>> This doesn't impact the described size, as all QC PMIC peripherals are
>> by design allocated 0x100-wide windows
> 
> I still expect that fixed.

that = commit message?

Konrad

