Return-Path: <linux-arm-msm+bounces-112689-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id iXkVIQWDKmr1rQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112689-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 11:42:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 41768670840
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 11:42:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=U4FpdDJe;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=FDhs0goa;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112689-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112689-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 00C41301F808
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 09:42:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73E923BFE31;
	Thu, 11 Jun 2026 09:41:58 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E62DA3233E8
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 09:41:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781170918; cv=none; b=iO8XBqSbx3sBC2NJdcEiTEG/oLKoGS8uOoGgDt7Vxpj0Pe4Wo57PQveyLnPUMOQdsLBsY76g262QqyQwqUs6evS+Mx5lNClownu7xdYVmdYWSmv/VNpShmPZu/1njFg6Xmxj5tU+NtnCgMJfND5aqMsZuGFdxQMBnh9D5gbcjSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781170918; c=relaxed/simple;
	bh=gs29JVYoqBRbD7XbXz5ZIYaa4W+R/0h/qmCJb0z6MrQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W1tVJpBKW8tKUvqG8enuLl1UKAxaKVWDAodslOZmAhTgLcagXpetMhBFdKvIwdWue78DAQGvAIEOcWThyC83z7moflIyNWTW1Ugq+2LqIwkWYsvpXccFLttIWDfkWuo48k7PQtwLB9w0NQlb0e7I0+e6M/C2H5TRUsVa3nYfDoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U4FpdDJe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FDhs0goa; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B5GOBt2248100
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 09:41:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OsmgSByejwZrCh97iurQ7ytYSxygMHrNyrSm1o7mkBk=; b=U4FpdDJeg3XnO1Dx
	xzaR39wjr0CqXtjyBP920A4U+UVB1/VDYoeS7ZahhrbjB1CFwcGVAMsICnUQzQmg
	HzvmONCs04DrPFVcfPN7uX40HrEzvuSxb9mjVaaUcA45g8VtYdCD+aSt1S3PQ08r
	1bjkvzlxu7B9XR9H+XqcGlVdP56lS+eL73z3+uAPf6qT8GtTFPniU5N48hifp52v
	Kz/9cH5G2zfFM8hmglyGZmNiK+WbL1A6LRMt4t5RYMF28HTi7Veh38uvazbY0dia
	6Csq9YL4G7mxNv1vLsegFYHw5HXZW4md6HKBeQEg+muVBwCwsGHH3CveOiBFPDkQ
	VI88EQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe79jq3n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 09:41:55 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-517865e6219so16859901cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 02:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781170914; x=1781775714; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OsmgSByejwZrCh97iurQ7ytYSxygMHrNyrSm1o7mkBk=;
        b=FDhs0goaWZ1nLSaBVofBNe6l2ngjt1DjRzUSPLXJ7FxwawugQe31LyEQaZRN1u+jUx
         sTxWJsoF/+axCyXbhUAPYhoY0OoLW2Ii4EaqKpAElUoFPyBQqZNjbVqkv4nar0e6sesP
         URUWId77VewobqcOTFENRlYXCF+3oIdStAgaXOWNWsnZHLCoaAbA6sg6hQ4oQKBJa2Kd
         IX527G8ShDF3WYr9IadYFJZMgkXSKRe3deXYM3IiqTpQZbM2ZmdHuf1MgjSTydYauHiU
         d8a/RUZBbB8/au0DBkPtrpDfCVXxZo6HbYkZ8GgS4yLQ1rUf2C0JW/L4bDcckzfIY/wn
         iRIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781170914; x=1781775714;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OsmgSByejwZrCh97iurQ7ytYSxygMHrNyrSm1o7mkBk=;
        b=ZZ0bUU1WaB2LjP1lKGUGiInTH5eDno0JLK/AmrYgf5j5/CC7bJJTTkP/QjXuDtgOi5
         a0hnT3oJjKlSAamJqCO6KbiADnA4P/zsoTRbpQ9LlXcqj6S4FtYK3T/fWglRG154XK59
         WqkZBYMooYK58UcgExoWrhr0tPgiB8SF7DgUcA2R7RnHHlf03ryxjA2xs8Kr5TAjxPlg
         AKWQkLhB+LaUfh5C2aeftoMXOBDDxniEvLx8O+ys842SLCu0XTc6QT0Fg7K8doQUG2HN
         jCQEzo0IYHA4nbhqrTSWm0crPZceskzEBdc0LXbCFHNaAKD8cCBJG2QgMWLYdilDCkFT
         lnaA==
X-Forwarded-Encrypted: i=1; AFNElJ+KgfWLBwM1Q1E1DQW+rh5gM/yQo0GtSFtbiPbdz8Vd+2d7RWZqbjirf0PS9eU763lTp2h/vR1ou8cKOfHK@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9UWSbcf0rMfvYjIbm+oYfXfxpFxz8FL2Cb/Gj0gJyUo4jigCz
	ZKMWo8qtNz1qe+bAQX21p1K9m7Q3XT+9gzQbf1GvUDIT4pbfERsM++mcH1n9JXk2O0/0DQHEZsO
	MLvFQ3FNCEz9iDVonKJ4imTk5sXMIvILhQ766OmoHyHKpL0iho9GvE5U5FOYQZpvxOBvNLhDzlF
	ly
X-Gm-Gg: Acq92OFhzOJHus+OnBQLA6pkXfN0jrO9FLWuW/PNstu9Z2YJixzPYtgE+jH5nCYI2wp
	7nWcCHs7aLBxH7PBGy74pD/skPWOOsoUtXSoUPl1yVVL5VHl+BqvBK8sxiLN4DKGyFzytWmYqGx
	iq+F6aWHbY0ymv2m4/IzCWwQNUGnMrTDnzb8Gu6w34jKRbSzyEJK4I6asME9krVZzMy10YME0V8
	PqarK1LFeDJgNb6oxogj+2xVEquxXVrMasX7bmPron2z1sRsV/NgbVreYZQh4dBYOqh10E+FXau
	6zjpv/GVLA8rXFLUFeGS43mYD3Wpf51WmVEczJ0FlqeFuwJ6jkRLbSJDwAh6KkKAhgIcKXJdvUb
	V/0aGt4D78UMBIDU6GSN5U8B4bQRQF08npE+lzoRzqbxMJ8W1BP4guEzx
X-Received: by 2002:a05:620a:8006:b0:915:e7bf:e6fd with SMTP id af79cd13be357-9160ab0590fmr188817785a.2.1781170914265;
        Thu, 11 Jun 2026 02:41:54 -0700 (PDT)
X-Received: by 2002:a05:620a:8006:b0:915:e7bf:e6fd with SMTP id af79cd13be357-9160ab0590fmr188816685a.2.1781170913893;
        Thu, 11 Jun 2026 02:41:53 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfcb58cf947sm40282866b.43.2026.06.11.02.41.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 02:41:53 -0700 (PDT)
Message-ID: <5298e320-bb5e-4e32-9bd9-c538a6689549@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 11:41:51 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/15] clk: qcom: smd-rpm: use
 clk_determine_rate_noop()
To: Brian Masney <bmasney@redhat.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org
References: <20260505-clk-determine-rate-noop-v3-0-f3f829fbacdf@redhat.com>
 <20260505-clk-determine-rate-noop-v3-7-f3f829fbacdf@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260505-clk-determine-rate-noop-v3-7-f3f829fbacdf@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: B9JjpapvNQOTWpFJ5aRTSG4B3-wdz4C8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA5NiBTYWx0ZWRfX8EmV3HeVtwgv
 CfwlmpH4o8YEXBjgXv09GEo6KhSz1N45ead5lwnnr/o7p488lyz+gFtPnEEYoiCeZS/WMkpoEJF
 D7nsZA00YAJN/bVtf0mM+3XgsJphIIfcgW8/F0ibFKbHqEbk4viefkWE2ysN/1Kcy6tr+Tjc+xG
 mDXl5b2sB0DqQPGI+q1yBQQlCzYsTW4TlDfj9r51tyR5bGadoz7kdZkVZTvxB0zWLy8ZVbaxFUX
 Zp2TZfFG+ftspt4xyEsiaBTMuIpy2AJTuDhqwyH/6byaD9qa+QuzmIpe8o6CJz68RuR4V9eWBxd
 FLdmZwqfp4JfVZhJZcDscbVc1DVr9vcXv483Zb9NhkE5D3ygrNCbudEz/LsZXPrD2PFMjYIKzYJ
 saFdOszddvJVTFHNtn12T9MBiQc70sin6cY6J8RMngIhY9xVIlgQazHCAZl4PpnFGqYnSEr+Prz
 iAlkaywENHYM0h/Zj+Q==
X-Proofpoint-GUID: B9JjpapvNQOTWpFJ5aRTSG4B3-wdz4C8
X-Authority-Analysis: v=2.4 cv=fbydDUQF c=1 sm=1 tr=0 ts=6a2a82e3 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=yiv6Am5jRSTGblAyIcUA:9 a=QEXdDO2ut3YA:10
 a=tYq66TkwoL4A:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA5NiBTYWx0ZWRfX8PoYcSG+tdRW
 2NaX21aO68eGRtKA4WRP7xJzs5sPJ/b5mXBuMkAcu7oywrO2Jhc61eXE/r8fvuJ+/sQYXToRVYg
 nV3t86E1I4B6Q6Ku19SH2sda561jFRg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 suspectscore=0 spamscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606110096
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-112689-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:bmasney@redhat.com,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:andersson@kernel.org,m:linux-arm-msm@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 41768670840

On 5/6/26 2:49 AM, Brian Masney wrote:
> Drop the driver-specific empty determine_rate() function and use the new
> shared clk_determine_rate_noop() helper.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

