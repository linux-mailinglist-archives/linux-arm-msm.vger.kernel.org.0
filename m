Return-Path: <linux-arm-msm+bounces-103115-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oHDZKW0Z3mmFnAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103115-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 12:39:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 189633F8D91
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 12:39:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AE38A3088B9D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 10:34:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B5FD3DA5DA;
	Tue, 14 Apr 2026 10:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O5s6uWQ7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cz2Yw2xd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 723D53D88E2
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 10:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776162843; cv=none; b=DONsdMt+mjL+OyigmRijx2Nf8mThLEUsxPrR7vjzKT/75oIVRAxg+KMIokXx3u3WJBFH0hb9pDrbC9bBuF7LuEMhMY0EfJ1boopTUxcw8uhFtpWXfQeqDBZigPFgiDTlaKb/5x1RNa9lb53CM20F8Nnj0fUTyW2kiTY6tJGFX/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776162843; c=relaxed/simple;
	bh=6xVop/Vp6aPMRmYhd/BDDjugJx7MJYQ7ilDbOya3PP8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kGiUhWPaYuz97ijDN9yBWeWBqh3wqiS8El9W2O8tSqJobTQA9pS0G+gTGrqGyDVv8+KwnQnRsrkOc+3FlEystnb965Vu0kvQQCKVr3gPibqoXwDZ3dwBF3qUGcE01v065GptxsudB72X3n7A4EJ0E8Z6yz2EWvjPuCkDBdB9uFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O5s6uWQ7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cz2Yw2xd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63E6fD6Q1479029
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 10:33:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Dw877TpVaxRflXLBD58PE5cB0SmsbMU2KUvevDBMkuU=; b=O5s6uWQ7H9Rt3a1O
	QOdLyVN2ZIocXVY9FUdfMmx5g961XMXl1pBHe1dPIC9+mM1KhgPctWyTg4z2xwx4
	q55Gy7EDbMxUqD/u1uIZU8sK5bMRcAgzCrd02Z4YnFTqQeZtHis+BFkHoHRxGTAp
	Zuxw7nGW17W7d+ILneU3Gfcn6uSxMbiEVIw5EwqR3mmj5/yaGdV4qXSSuu4FhXNT
	XrrcxlECKmfLtgBtZz7Rd7QtKzLlfeMPtobhAWiWD8FyhzBs/s+snq+irKjuPP0c
	YB3xyxbXXVtGy59vsElhtjgjGpHQiIS/ijL4+Xr7W9eJL5Qb3kxSjAHTtAgIWFtH
	xZdtYw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh87j2aw6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 10:33:57 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b27636835so10444431cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 03:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776162836; x=1776767636; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Dw877TpVaxRflXLBD58PE5cB0SmsbMU2KUvevDBMkuU=;
        b=cz2Yw2xdo5vN/WCav8zwcFyvRVX7h9fMcelD6+S5Y4OG33/wBCwJL/F275/4abhmlT
         4RXYM75usKqpr/JBQpyM/y7R+iIhk4N7XIwKEb451HEV6Neay/d6rVkNzztwyRSHXd28
         IP/I9yY24/orqadhYFfIODcInb3VFG7uEwYQaER3Fa8cA+klxk/g/Ffvz1jETEt3cWCF
         EhEW/w2zfOL78K27NxV4p21GIEzyDbVPQm6pvpTxZhMMIuMkZUYCDSAn88I30Zn5oQFt
         xSaOdYdRVu3ByLi5+wpRLTEczb9a2MvB7TBPLrH64aR3qN/KwlhOwD5Fe4iLTsLYqyR5
         Lqrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776162836; x=1776767636;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dw877TpVaxRflXLBD58PE5cB0SmsbMU2KUvevDBMkuU=;
        b=TNUyiBR+OeUoIOn6D5b7uTMcPalScwkf9ZxOZPlfwlhUXVn7HmUAzvwfl/iceReJs8
         DGyGuYDCESqfXAc3u496V4gdUiT7UUJ9CgSHShZKEWRDSBg8DZG/F/7UdqpER6T8FRkP
         dU1XEAdP2qHJsX1GTo3jwE0IYyOd8Mfjw6cD4oNYJsDNGOT7wsyes1HtWLQKkrTDqwUo
         E14nQKQftTIpdTwNirc0mIeyc0uSvDPgZT+8RaCyx6qwHAKlhhHLj6VrPn0XVAqK/RoD
         58oMT0re+vbJCjhKqVieHcycW4KWrk69NOtv7XlXOAm7Uv9YaCwOGnLkVcq0WzNC/4vw
         /DbA==
X-Gm-Message-State: AOJu0YyS4o6eZhFjOQjw9vuCJJnV1XGZXI8WkVG+b7EK2Xj+9FcZX4np
	0QkESGbdxTT/zvVAw0TpSq8KJBsdChF6MkPzDokt3IIFFTHeeFQbvvYeD8V6mCYmuqiYT0uJE1i
	sv6+rNUbd1V4gRlQ5hpqopOrAL0oU7ZAIHiaoHkyuppd2HuYLQcCzvoMfZMtpCwvhItzK
X-Gm-Gg: AeBDiety28IV2s0mU0OYa/xe3PmmIKUI4/1DMXZuq3PZWIDAhZQv35mUVIPCI7x/qMS
	AZ57JnYbmDR6zeFrWuuO3Nm8GwTrPa1SD63+tracoPWVAy8TJd8la0Wmp7Fp6/B+fOER6KcqoVO
	Cjt2pEBcT5DSsLIAdvhYa+BAUiL7oekM9RpY5lI5ycgU6SL7UZ0lNiQArWdonz9yF1te6obFfOR
	/TLbOmX6As6M6E7hhHJa1veZ9YjmyncMC/72I2cMMWYQ+i6KAtdpJoaidF2pxsG3n/tz2buNGgQ
	5DN3/85FLK8/yzz4/qOVSHtLuzXjnj0kn3NrBYT533asG3u6dYHg4klQxcZS2Xc4DcOJgqtiybJ
	6Yp7Io/TXcaAE179QF9NVtlgEpJCAGuCFS50AZJihAYMQTjmHdN3QcIewF7YQOlDqKvPthBXkKZ
	IrkoX/iAWTZgxkKQ==
X-Received: by 2002:a05:620a:178d:b0:8cf:db7b:6229 with SMTP id af79cd13be357-8ddcff969e8mr1534353485a.7.1776162836137;
        Tue, 14 Apr 2026 03:33:56 -0700 (PDT)
X-Received: by 2002:a05:620a:178d:b0:8cf:db7b:6229 with SMTP id af79cd13be357-8ddcff969e8mr1534351385a.7.1776162835709;
        Tue, 14 Apr 2026 03:33:55 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6718f52c111sm1018232a12.18.2026.04.14.03.33.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 03:33:54 -0700 (PDT)
Message-ID: <462eb5f0-e05e-4cc1-8d6a-6b06e105a517@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 12:33:50 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 4/7] media: qcom: camss: Add support to populate
 sub-devices
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
References: <20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-0-5b93415be6dd@linaro.org>
 <20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-4-5b93415be6dd@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-4-5b93415be6dd@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: OoTwHv3pHEONRcjSctYtcopRUkfDh4gj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA5OCBTYWx0ZWRfXw9Lc/MDUP3ri
 LCwStuYWDHLWQ8p6GUsSRopjhjTRXIiDmMiE5fIu27BX7YQn7pqrkWra+5roIeCPSXuCrPMYvwO
 9oLleS6y0y5bk1daFg0C2NntUbVeV7Rj/VMiRCmuz0J10keuYCz+2xZMe47mfPEhgHgZ0XmLJLp
 CKukZnn0OjPVNYzCofDMH4/jG7vTE0WZRsI/K7q3OOotqeTJkB1g125mmgz9314SdRIiD0LInEi
 GPj3ddGQoRXkFriNMf9iz7isr6Gy+Z/Ssimm0G+JeunWcQDp/FDPo2LMEJLRKh/7JnQjogJ5ktr
 DFd07xZiB0nIFBy9acy7roMtlVemkoM7FK/sdPCFBmAhW5hraDO88ZpnwZGlbjTx7jyfYgE6xyC
 HrYIPDVD2i7HfxOfXSXmcr728h7q8iNFMgmyg8+85+U12fEy1/F9KJgMv8k268V2MZwzZ1qzuzc
 /scHuTmiTSk40K2Lm6g==
X-Proofpoint-ORIG-GUID: OoTwHv3pHEONRcjSctYtcopRUkfDh4gj
X-Authority-Analysis: v=2.4 cv=DrpmPm/+ c=1 sm=1 tr=0 ts=69de1815 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=KKAkSRfTAAAA:8 a=ZL2hiuJarSggSDoTJZYA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 adultscore=0 spamscore=0 bulkscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604140098
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103115-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[linaro.org,kernel.org,baylibre.com,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,linaro.org:email];
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
X-Rspamd-Queue-Id: 189633F8D91
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/26/26 2:28 AM, Bryan O'Donoghue wrote:
> Use devm_of_platform_populate() to populate subs in the tree.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  drivers/media/platform/qcom/camss/camss.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 00b87fd9afbd8..66ea057291f6d 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -16,6 +16,7 @@
>  #include <linux/of.h>
>  #include <linux/of_device.h>
>  #include <linux/of_graph.h>
> +#include <linux/of_platform.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/pm_domain.h>
>  #include <linux/slab.h>
> @@ -4964,6 +4965,8 @@ static int camss_probe(struct platform_device *pdev)
>  	if (!camss)
>  		return -ENOMEM;
>  
> +	devm_of_platform_populate(dev);

If you want the camss probe to fail if any of the PHYs' probe fails,
check the return value

Note that this doesn't necessarily have to be the case and I can see
arguments for both approaches

Konrad

