Return-Path: <linux-arm-msm+bounces-113905-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0WKYAfTnN2rkVQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113905-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Jun 2026 15:32:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F7616AAEA6
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Jun 2026 15:32:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=bbIZUxXQ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Qedll7Xj;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113905-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113905-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 23A80300A3BE
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Jun 2026 13:32:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1E32364EAB;
	Sun, 21 Jun 2026 13:32:33 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9120F201113
	for <linux-arm-msm@vger.kernel.org>; Sun, 21 Jun 2026 13:32:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782048753; cv=none; b=eLnx6q++S52mCa9mn+yqNXCuhqgle44Clj9EhTDNE6O6rZcmxi0vP097bJscJok8jzEcWf1uxWGPuwy+OQhLj+0lE1/lRUiGgAkrDiRZnDW803fPLpEfbwEy23KPJJoZXIT8+sYv5yVQXxTDZ170B4x8XnTm/0mstMeC56uIx8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782048753; c=relaxed/simple;
	bh=1r0XTOMQGU2xqD/jHwP1HAytUoDOeZBgYrOUJrEQslg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NxiIH2ejdGea4UoN7Y5vMDCmSssXIWz6QvI4Bb967zxB5lojihG0OHYe19PVF/4AHR82RrXSuGMxtGY/SALolrY48Yjuv5Ng8Ge3yPG1AFpljDghTzmsyhiTIZXhcfzF/SDSKy9xmYgI6df+sJ8SXsG6Stl6NJkaKodigs7lXz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bbIZUxXQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qedll7Xj; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65L9tXXU1443912
	for <linux-arm-msm@vger.kernel.org>; Sun, 21 Jun 2026 13:32:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gjyROg4raWVXD+wIs+nQtB02vvXv6WNDw9hNF50qbSU=; b=bbIZUxXQXnDMy3YS
	Bzz6sEk/pcPyBTN7y4Rfw9c8hMEq6WRdDCGi7O/fp3HPRViXBiMHQO90P9I8LQVl
	Y6TzFl00AzomyRLThMNjfhuz6PuPO4CtlX1MhN+mOcZ1WCccDqEcioK3lq/s1RPc
	GeUy2KLMHI5X/iU41RwpQx+daNKJvkj0xNgJTGwpCntrXeKQ5shRf4B6cABn2DdL
	+AyC1+NOSgh8YUDMYhM29ZoRIFUO1HSbv10stFHZiTcjMpYc0EkZEVlMCpFHTrBa
	Xu3raFDD1GFjlCT253Kyo0gRmIONdoeJ/Fe+HWQ3IrrMlT1Hk8h2H3kr3+PjR8dO
	JKjubQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ewkmeb0nh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 21 Jun 2026 13:32:31 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36d99181eaaso4276932a91.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 Jun 2026 06:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782048751; x=1782653551; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gjyROg4raWVXD+wIs+nQtB02vvXv6WNDw9hNF50qbSU=;
        b=Qedll7XjAt5VxInBr+JEWf0YMNslsv+KwP6U+iXxBH2nhr2OGIwWwDex8Y7NTUqSaN
         dxtFqGS+stQAzf6BGO0hikmrvQiGWPZF9VhBRVwrr9AcnGlKNC4ghF90nEwHhmIUhPoP
         3kLO3PiZa/WTZ37tzUa+jotix3/S9zkxs0IpV9f4TlEtnBRcZeTJ97hC2wVq2w1dITUS
         zP4k/itZ0lPjnxHccHa+7GsD4KHHfLe0b8bwW4AfX157UFboPkSOJkrxaFdVArr/BqQx
         w7YfzReIg3ZfZPobxplzvJEJHV/UH7bj9Wdu4/SqNkon6f7XTWqPSWuP9wxO/mQv+6L1
         5KsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782048751; x=1782653551;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gjyROg4raWVXD+wIs+nQtB02vvXv6WNDw9hNF50qbSU=;
        b=gYhnxsWdyPP/7EDpzdqfQOwEfNTvi5RlICQinySWWqN2A/AwjdMDv7QWBXDcf9aCAN
         yf94+lj6WTku1JCCkg4DoWWok7JJBOPIm3Deyc8u1SPF4sUh/3N5h0axNmAPxEegEERY
         A2wJkgxMRo5jKixZXMFLgJG0wF3GwIWmsIKq4kl4h1y/+w6RgxmMU3DFKHyAKwugDY3p
         oy6LvguR18M3CNbKhO5RHrJwOxLiYPVSMKbyz96d2vMm4HSa2DczOGPoKJ8vsKE34DQ0
         ZJrFpEMwlC+HXg7fT3vm/1j9dlRj23B3yD0qPutYeMOWWMBTCYb6TgOawojRvX1ot/Uq
         t0Cw==
X-Forwarded-Encrypted: i=1; AHgh+RrG7HUKmTcB7Tqy+Uf9/rQcVkTBwxS1WXjx4NaO9DqQgSbk3lI1QlTQVPRpscLyIaQIb215h4ufDvi+yX5C@vger.kernel.org
X-Gm-Message-State: AOJu0YxOZidgVXtDEXCTVxYSBcEQKMSwuVywlTDs/e6p9a07v27ydjOs
	Hwe6VMzHP51x3M5iIPjhusT5C22kedXSNWFd030zAX+T3a9ItUWyp5mwqiKrNFAfye01kFJF2h3
	AEOZzOaAY6yJMelzoqZR+ZES9OkDhcs9Ba77MHc4W3upvHjTxnxIzwUBTN2CdyGuJKLCINon/Yc
	De
X-Gm-Gg: AfdE7ckwgs1U466vhJh+ZX0CzrIb9it3g9+UwGOXcMTnUeVzTwO7MhSxElWAicsp03p
	t2c0uCIPvZsmJWR1BDzAGhb+Kv3BTQeVSs+HZkD0xFewJCynjqxoaN6Gkiwxe51gqIb47WqkgcO
	95YdZTo3OGpeYOY43nLkWiYXyzT/K/AwkTavgZBgnmQNkL8ijN+Dt2sfoOIurTAY3YiGaoZbglA
	s82CQ3SA1u4l/D6g0AuBFA0Pgs4PptjTnuSzq3Ykck1FuiyguzACUDZLXKGErgMvQkNujdPbqi7
	CAqEF/mm825NtQ9eiILusptE92YDw/MnsGkP4GWJZtWyDKzOdcQoluX1P//VLNVxM65RlYTUhVi
	cZdX8nQDPhJbHU2beAt8lfMsuYk5Yfek/filsQWWM
X-Received: by 2002:a17:90b:2d8f:b0:37c:c39c:c636 with SMTP id 98e67ed59e1d1-37d15e8df93mr11895183a91.18.1782048751316;
        Sun, 21 Jun 2026 06:32:31 -0700 (PDT)
X-Received: by 2002:a17:90b:2d8f:b0:37c:c39c:c636 with SMTP id 98e67ed59e1d1-37d15e8df93mr11895160a91.18.1782048750919;
        Sun, 21 Jun 2026 06:32:30 -0700 (PDT)
Received: from [192.168.29.32] ([49.43.225.115])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37d1536a6ffsm7658954a91.4.2026.06.21.06.32.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Jun 2026 06:32:30 -0700 (PDT)
Message-ID: <20c9f6d4-0c94-4ef9-b931-7c835131da3c@oss.qualcomm.com>
Date: Sun, 21 Jun 2026 19:02:23 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 09/13] clk: qcom: gpucc-qcm2290: Park RCG's clk source
 at XO during disable
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260604-shikra-dispcc-gpucc-v4-0-8204f1029311@oss.qualcomm.com>
 <20260604-shikra-dispcc-gpucc-v4-9-8204f1029311@oss.qualcomm.com>
 <55a34f28-26ab-4bba-8a0d-282b5fadd374@oss.qualcomm.com>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <55a34f28-26ab-4bba-8a0d-282b5fadd374@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIxMDEzNyBTYWx0ZWRfXx66U1xhzQz35
 Z94dDHmsq4auqchud5DQFTA5zH4LveE/ThlhUaxj0cYU+5sXib3nVbkxMykSSiixk0JFYtBNo76
 R7NPWmxrObk1fJlQVXSclK/wbpMys0Q8BujqnzffCbH170El+lED2VdPyIMz2ijijT2xQ8EmgmK
 llehTZOMRZ8yWFZYgRIZPL56N1t1yZgZngfsh74y8UDA88cPpr8Zbm3aBlE02fil31Iewr61VZd
 sYfwxWjq+s08JFR5BIAcY3IXcqfdPst/9BhUMwHslswwIUaCL0NIXCzYSX9WEuDrq4sR/szl6BI
 DLOURrIx1vw1ZKgDlRZ53wlMZCri30lzbZK+4E6C90W6twQFEyecZgY+pKn6q7y2cehzTmircA3
 PcjLGdK33+FWBxTpDKHHxSPlif4Oaje0Uw8TU1cdWSg8+v734c1ZOrBMx9/4q9piIxl5kUZdB/B
 K/RA7hIUO8lfX+FPSNQ==
X-Authority-Analysis: v=2.4 cv=MtFiLWae c=1 sm=1 tr=0 ts=6a37e7ef cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=HwFTmRh04JSsUSWzyQ2edw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=uBvOtI65r_ZeAi5v0UAA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: 9ZSld7v9OcC74cWIm47Azld21EPiYQD_
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIxMDEzNyBTYWx0ZWRfX7yuovCRt8yl7
 MrH7QMeHgs8XGf4TjfUI16mvAVefkbMLiGFLC83FyS9RCxRuHMDB7SfNPKhOuILhniNNEGcNPIi
 avnVSVZ9OZOtvXRakK1Jgtel8PeuVmM=
X-Proofpoint-ORIG-GUID: 9ZSld7v9OcC74cWIm47Azld21EPiYQD_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-21_01,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 clxscore=1015 phishscore=0
 adultscore=0 spamscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606210137
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113905-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:loic.poulain@oss.qualcomm.com,m:bmasney@redhat.com,m:ajit.pandey@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4F7616AAEA6



On 10-06-2026 07:30 pm, Konrad Dybcio wrote:
> On 6/4/26 7:26 AM, Imran Shaik wrote:
>> The RCG's clk src has to be parked at XO while disabling as per the
>> HW recommendation, hence use clk_rcg2_shared_ops to achieve the same.
>>
>> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
>> ---
> 
> This RCG isn't marked as "safe" downstream, was it overlooked there
> too?
> 

Apologies for the late reply.

In Shikra downstream it is marked as "safe" properly, but in Agatti 
seems it is overlooked.

> In any case, this needs a Fixes tag
> 

Sure, will add the Fixes tag in the next series.

Thanks,
Imran

