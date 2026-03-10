Return-Path: <linux-arm-msm+bounces-96644-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2Dp/BC8msGnYgQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96644-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 15:09:51 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6658B2516E6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 15:09:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A2FDC32B2FE8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 13:14:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B2FC391E61;
	Tue, 10 Mar 2026 12:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="owbcvg3G";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZDVNLu7Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 142F738AC74
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 12:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773147125; cv=none; b=jwVWuoE3oHBKCvz2nxzy21VB6Eq6XwYpwYSOq0aHXjB7jI+jQkAj9hHdxQhCHPc91gLBfttKYtDwes6NhJ9vY2sUYizMzp9w8w2WofYb4DBDsHAWYrNaxgc0pfyhdPH5do8QhDRsf8yxhFouzTG//stS9p8N6AWyOD7hc9IHS/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773147125; c=relaxed/simple;
	bh=kViaxeubhjrMrTLJWF2rxTC/FBMgVjFzoDjxMhRzsYk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EHNBa+M6Ps/NpQdYmrlHLghc3kSD1Yj2Vjay2fesHoy/nUPcX60mz3+jL37jDD71RsfXHzWqEvHphPplhXaoDmx5LJYQUUYbTC5eMIWuRF+8bE8bJHGALMTW6shEjr1re9rRlqMuDrQpZYWY5/8mCFSPKL++9ROvFoP/7viUiCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=owbcvg3G; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZDVNLu7Q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62ACahCa789816
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 12:52:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NonpCTaec+koC9owCghKTvratDjoM9P8r6gIeO/fyaA=; b=owbcvg3GdmAVpwqK
	8wjm6JcqJz1wVi62h/DE8lab9XrV+xhPcRhO3gMbTZ80kveU7tMdJ0E0eSWnwJxQ
	OQDGprFaHf14IywyOIALd8pzX0EDrEv+gPxYdoncskRtN599W31nCm914wkt8lTe
	EfboeAUB6uc5z3eyvq/2E5mkYvslqFTQn7NwLz0bvTOQWN8Au6aHwz4jOaBb2ZjP
	HB9MIa/nU5AjAeAVvsP7chd52DqhbYaW5WdBxnUQVOr9WalEHY1twmK11EVep43d
	cxMd7vB8iggIv/V2zxXYnLU68kXfRouN0vQS4j/VPxNnwiHnF0eYiqHYjeE2pLJB
	95xZcQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ct1ekuwn7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 12:52:03 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-899f6011df3so55329436d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 05:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773147122; x=1773751922; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NonpCTaec+koC9owCghKTvratDjoM9P8r6gIeO/fyaA=;
        b=ZDVNLu7QWIHwsQ1nLX+6sZRPW/xWnfX0cJvjJPG3+9bRFzQj2haP5ssFZR+wYpIuUk
         XkVcoxmDjmXvyzCFPyKCCSisCGR8d4JUBpjTMzCXRXnfbQDZdnHOTB5b3A7KAcUOGMpB
         lVyhCz0zjvVX42JLu/eLMGPIjlRmUwPPc8bjLJFdAWCRR2mVJwh0O4+PfV2q3A5VGZyF
         RESYyRj9q+hyiOBEgBnP026A5AIm5FXHxTLmoaHtn+pVq5jw7Dlj7jZy6lbqvFgpqFVE
         SmaG1xIlQjXAOCOaQ83MxQ44FCmFs5lZFGEotc0rPMgsr8tKdBgT6zNT8a+nsZbeBX6f
         uugw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773147122; x=1773751922;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NonpCTaec+koC9owCghKTvratDjoM9P8r6gIeO/fyaA=;
        b=GacYlSrVEG39rR6Z0Lejo0QJrG2Brvzu6FA5nihkQu+dAI4xUiWvdAImRAtpfYAdGy
         udBw0vHkup5EIAEwCIZFI4MS5MVAUZhyPwxakXlp+SWpHFTg+bxBFG+rDOFWW2UXfXFA
         MJXIUeYo8Fj4FQqFcp72llUwRcKn19ES07e5Ncti1P1dplGLDe9o4W4GgCbus9rTfbji
         Z3DAd9YF0I2ozC9txiLmU+4Mn4+GHPGs1UP/ex1JnhBjNniKshbXeqiWGKv++sDr93J8
         evMQSQxsW3YcKX5hHBUyYXzyWTchvlVUkjKdPsOaot4AUzYeb5V45+kwV+0Fw4urF6+h
         Ie7A==
X-Gm-Message-State: AOJu0YwWjdV+15F17wOMFV5N/ip+l9IYl6ivi7h1/G1tfCDkOuwYe0bL
	KoRBWNIobvP28GhcfYe5Iqsx3T3m8WuV7gmbbZEpoaaMVF6bgnh2ZMlxUlOGEVIno1VklSZH0+t
	oDuUlBtImopUud7DDNw7228SGzIQprMVMxo5bBudO5YYUD+2B+ajo/6JW//xhPj/aYV/V
X-Gm-Gg: ATEYQzwXTen7T7P60uved5IuztISHA+xpsWRgtnV/cJfV++fiWkBkkcw/89LbhmVuL4
	0WzYgBNa4Sy6Ok1i+agMKa2AxDoHiGkFWedJpFcvGDWbqLazznt0TATA1HJChXFE9vwpGm+8hog
	y2sINfoSyqVLg/CHh+rvyHJfFAsA+BrW74mXHR6lv08b8NWF0H3kshXOxwqlKwsWlaCBUIoRZ71
	4En8c5TO86C6FGlhb8fR5ILv3m0BFxS0IDV8BEr/HDeW3G7ZT4Qfnbf5t8xvlYyKQ2FacCm9wuu
	PRbl7qDmR7XwmbjuAM7dK4JsmG6FfyHBIz452BYH87IwTtyT9OpzpmZ2f9IynLRBFBAQUSi2cyp
	JiNS4sBxlVHr+FcNVnJUgUDYtw17pNhyLgUUB33AsC7iPKhyA3iddN3xC0qIsRZTyovJNByKTT4
	167o0=
X-Received: by 2002:a05:6214:6104:b0:89a:4f20:cb28 with SMTP id 6a1803df08f44-89a4f20d1aamr58562896d6.3.1773147122013;
        Tue, 10 Mar 2026 05:52:02 -0700 (PDT)
X-Received: by 2002:a05:6214:6104:b0:89a:4f20:cb28 with SMTP id 6a1803df08f44-89a4f20d1aamr58562616d6.3.1773147121528;
        Tue, 10 Mar 2026 05:52:01 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b96d8bee0c1sm365015466b.31.2026.03.10.05.51.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 05:52:00 -0700 (PDT)
Message-ID: <f2c9e032-44a2-4ca3-8f3c-cd9bdad2b35d@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 13:51:57 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 20/24] soc: qcom: ubwc: drop ubwc_bank_spread
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260306-ubwc-rework-v1-0-9cfdff12f2bb@oss.qualcomm.com>
 <20260306-ubwc-rework-v1-20-9cfdff12f2bb@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260306-ubwc-rework-v1-20-9cfdff12f2bb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: gBQ4bzWyeCdnX_XeY7vPcmassXVuarR6
X-Proofpoint-ORIG-GUID: gBQ4bzWyeCdnX_XeY7vPcmassXVuarR6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDExMiBTYWx0ZWRfX3C8V1CfBPflv
 Z8OXcnmkafL/MF+WekCvJntic/J6W6NVvc+wA/tHXs5SGX2zBY2Aib3MP1nn7sWFO7Qbclc0Wgq
 jv1M1rQKuDWs7lpgxFlZzA95qISATGJmoAwf4BLD8U6444knY2thM7iD7tLim222pFguRlQLkkd
 h9YQxbOIerUdqTVGXjlkT6yLj0L6+3pFvjWGhsX6OJ3IvOGsiFAFnyWLBcmRQOExs5mxpDhlS8L
 ETrQkk8qBRnJop4ssE59JLOYm4xyEXXip+yFyTqfbhXPlcubMFiQg1ZDNBRaFCvHDVdsasqQSG9
 jtWmewhfLMiH7zvPOzjL1GK0v10GSogNU++j/zIAcMKQJrotuly6yPVThSfjjRJjwlxaSNYOpp9
 8bzY7qb97H7TX16m9dBJNXqTkUgrQPODDkMahrGI73SYrKnaYZpGjLzXD/2eRInCikfkNCFRD9K
 qkGx2aENQf343b22I/w==
X-Authority-Analysis: v=2.4 cv=eIEeTXp1 c=1 sm=1 tr=0 ts=69b013f3 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=cL2VvVm9aJy3w4hY0qEA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100112
X-Rspamd-Queue-Id: 6658B2516E6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96644-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/6/26 5:47 PM, Dmitry Baryshkov wrote:
> According to the documentation, UBWC bank spreading should be enabled
> for all targets. It's just not all targets have separate bit to control
> it. Drop the bit from the database and make the helper always return
> true. If we need to change it later, the helper can be adjusted
> according to the programming guides.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

