Return-Path: <linux-arm-msm+bounces-93088-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IIsKDkYzlGlAAgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93088-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 10:22:14 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D219014A503
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 10:22:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3A3C130089A9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 09:22:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07FE23043BD;
	Tue, 17 Feb 2026 09:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PHjWYrsj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c/wYx8F9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4FEB303C86
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 09:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771320129; cv=none; b=R9t9D0SvS7Eumwong0LVxfxj99rR5CUtIblWzYJX0HkpBrqtm2NWQZgohB8CVjl72Vag0Z7jQGwmxed9v1CZbPhwUK5uyaVUVqm90R4w4urr4eFdxbIq1HleXS9E/2AQqKv0mBu+ExkBMbWeZ+DxPMpPBWMdXQHvdrhvHpmZpUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771320129; c=relaxed/simple;
	bh=m4ggI6ejvTcz3a8YsVqjQPSeAbVZ6LlBtCqDVqfMan0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D4LPaYvbKqwJ81bj6Tei+ZymVEp5ye9+S8vpokmjZ8qkIIzacnetsBUI46iXvJJc+and/nwLfYlKIi0npWF9jxckFi+GuzXOtG8CO3K9kTPtCQ1cE4u1VRuxRqqKdvW1PX+xjFbMMNFjkmg6Hcdc436lC+7flJB05NTyDCZ3+Yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PHjWYrsj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c/wYx8F9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61GIGxaK2804570
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 09:22:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vbTHh7EdEQyEkS05BjvvhDDmfqCeoqVKmCXCG7opN3I=; b=PHjWYrsjbGeqBGmW
	4jedSJXEO0ePXFGHWbhutdImKiD2fjYgjC9gcR005ypcYR828Qz75DueP2LNeQqM
	qiDbr/Kpi6et782Ggl4fVPzocmnwzmFznawIjxtKqZAXDX1SfiyNy08/xoxQ6YWR
	0Mm9s8HxplTwvHwywqyhZBL8L1J+fOtSoDY5f1VqXtgK4K56LSabpNPe8l4V8Y1U
	gSg3Fo0QmR9lVYYH0cpiSBoHufJ93ZG6o9HtNqs3JfUYo4TugLU37s3VmnPraaal
	bIvZS+sq7vYu1Yd0BT3vcMUAvBkvuVIJSwSmJOKNv1XYPn5EnwKlT5p0fIdly340
	lM48mQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cbyxujv7a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 09:22:07 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-506dd37f21bso2907051cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 01:22:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771320127; x=1771924927; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vbTHh7EdEQyEkS05BjvvhDDmfqCeoqVKmCXCG7opN3I=;
        b=c/wYx8F9bKod8RRnN1RLBX/MwNXghaufQccdiGBFGJkGuZknK8kv/Bss0zKpp4th7t
         mz3dncdPLrsQRZX/7u5cX3+fjMzAxDCHxbyqqMAbDlmP/6flvfXHOqr8ALFd6hGXrWlL
         E8WtgSXQNSrwDo2CzQxnhSaU6eyWHh8CKeK+VBRkSKQomKxHd/GqhmntqUBVovrUV3wI
         qhMB+hpPTEl4IPZWT8CJ4PdqkRd3PZXUJfAdJiXkAre2IyZB/Bm47IHZLtVdqOUYYVx+
         unpsp76DDxMFzmgTf+c2H08YJc9IzlVJsYjOQNJSM6TPF6vdhqP2P5xUojvbSnP5ezZV
         0SdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771320127; x=1771924927;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vbTHh7EdEQyEkS05BjvvhDDmfqCeoqVKmCXCG7opN3I=;
        b=Eb/P6tKJKPzB2Eyne53jN/LUOzbvuiXLZJi2rKXSLnefBApMa9VlW9f2sEvlKzdkKk
         Sk0A+avC8Q2MTmUhTXeWMlaroC4z2yNvW2t6gRjuF8sSnvOFPVRZt46UGPmjUPYxC3Jl
         0g5Zx1HZk7Qez0GnW007fCWRZJSGOSvk5qFD5eYyNZux7puWJyPCAcEsWKOlMQ7hC9S9
         hUTsjza3beXTNWWdILAUR5EzidGky0isZhDIXW7IxNlh0Jr388/OJ3zA84cz7Ya2+lrv
         tIsB48wFjBFXcqjgFQU/95HMi88J2x1zZD1ggg0zjb27rwTvtM1DM1I/GqOYJGJDgEAU
         I4Vg==
X-Gm-Message-State: AOJu0YzwwSPEcc/FH5py5AI8Mk1fJbjqlcY5ROwvo//L02YLXoZP1B/f
	v/MXdLdyT4GG46N7sINydThTeQSqsWHJivCKEmtCRwP4Yhunwf4wleFRAxQ3le3aam5OxqAQR8f
	XaNZKwa3ly7k9IZcxp+GtMk7xZS20Izoevr6l+wmqDvyhwbjFqM0ecorGx2rCyoIcgPBW
X-Gm-Gg: AZuq6aItFY5Dmq+Im26QMXatXah8lwUbRiiVH772mVlU/cLsJI/oUU9qIV2dy1658Wf
	llhDd+ISCVbOwsOReY3b4EmQWFlRV0h5BOGOWr7vccQtvQ63Cxn2QNJa+U79mweq/ZZSirXQGso
	IsZktZuq7SDqI20CkI18iJjyIo228wplQdf44BCcv7x24bDmLDB0iLLgBXaO8UrmbcO9mHXlEKD
	Q5P1cHwWd4VbsUBxsmw79gENTb48uzWXd8S4KffA1eAhXWM0iHmalFLFe2QvyD/MYc7Dk7vav2y
	PV3o30RN2fMrNz63H3OkRv1GHu6YBPJWvc0Xb3nzSx6EqFJbpPJzgTvFgid114azCFudtEjG4iM
	8MvMHpX+OXkhYPICYJF2poVOuxtvu8D8b4CApZ37xEmtSpdmCJIM5J3J7iUpxoqLn0GSDfJkL++
	j8di0=
X-Received: by 2002:a05:622a:1182:b0:4ee:1063:d0f3 with SMTP id d75a77b69052e-506a6b40c62mr138408611cf.11.1771320127342;
        Tue, 17 Feb 2026 01:22:07 -0800 (PST)
X-Received: by 2002:a05:622a:1182:b0:4ee:1063:d0f3 with SMTP id d75a77b69052e-506a6b40c62mr138408401cf.11.1771320126776;
        Tue, 17 Feb 2026 01:22:06 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65bad19bfd3sm2346040a12.2.2026.02.17.01.22.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Feb 2026 01:22:05 -0800 (PST)
Message-ID: <5cd6ad4e-d494-4dfb-96c8-ae6507edcb57@oss.qualcomm.com>
Date: Tue, 17 Feb 2026 10:22:04 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] clk: qcom: dispcc-sm6115: Add missing MDSS resets
To: Val Packett <val@packett.cool>, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Adam Skladowski <a39.skl@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260216233600.13098-2-val@packett.cool>
 <20260216233600.13098-5-val@packett.cool>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260216233600.13098-5-val@packett.cool>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: UCciRHKqdvCm3IKoyv_lKlVUcvDDheqY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA3NyBTYWx0ZWRfX6Z1I+SRZkFzC
 uNBHixHfO/yfxFwQdahQwgzipQX9uRpFHlRXqvyhrbVHs0pXcDhX4ZQ1Cm1OvYjCnKj+Ma/QeAv
 VQy5jZijLBMlkWhNv3MyV2p62a9RCL6THsKwSERshgC0jrgBTeqUGW7VFPCShQ3uHZsncZhR3ZT
 +PERi21pOt+Eldmf6JX5IC6I/Oqq+cAZqoyxr6Scty93VJPx9zrxZcbHZY5qdCT1D4EDRPDbHwM
 PpUpVbJhv6cYW/nImqHEBGOqs1tywpVfoK8UA0Fqb9rEXT1yQpXI0os84YG8M4YWS7p5bwDtYjk
 CJaXulIoWKR4gswzmxnnp6LNfSBnFCMCh3X0ZGnyG7SKk0FuVDOv9ifX8V3pbJVCvKkqVn1v/3T
 uKvRXz/VPhKI1vlXlPpx123r2eO27d1dRxwdJivNiICxluLHY3C3p4GOj6agEC8aQoueRVZ4PWk
 NYfycJl350S9lVmAyNA==
X-Authority-Analysis: v=2.4 cv=BpuQAIX5 c=1 sm=1 tr=0 ts=6994333f cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=GY9tGbHfO7DmpnXFqVcA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: UCciRHKqdvCm3IKoyv_lKlVUcvDDheqY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170077
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[packett.cool,kernel.org,baylibre.com,gmail.com];
	TAGGED_FROM(0.00)[bounces-93088-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,packett.cool:email,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D219014A503
X-Rspamd-Action: no action

On 2/17/26 12:25 AM, Val Packett wrote:
> The MDSS resets were left undescribed, fix that.
> 
> Fixes: 9b518788631c ("clk: qcom: Add display clock controller driver for SM6115")
> Signed-off-by: Val Packett <val@packett.cool>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

