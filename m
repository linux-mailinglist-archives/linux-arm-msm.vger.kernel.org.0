Return-Path: <linux-arm-msm+bounces-113525-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +8JhKPZtMmpRzwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113525-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 11:50:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 06DF5698181
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 11:50:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=A9bqtpE4;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=GXkM6glQ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113525-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113525-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 069EF30EE09B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 09:37:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4236B3BBFCF;
	Wed, 17 Jun 2026 09:36:16 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C334639B94F
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 09:36:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781688976; cv=none; b=M6K+ZZCvT3cSpEEO5Z53cmUmWL4WB1au2DKANLa/O7zMauwCsEq+KjdcrnIuvzGrBpVB/evSU/NMGFExQdcPYIk4VNk0PDDwrreaz80k/2uo8QwGOBVCCS6kEmI/VapkIsbb2gy7WrbYbbLTaDjA6zZbdVZpvy49A4cqvHs7Ymc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781688976; c=relaxed/simple;
	bh=KoyZoqsPBxWPy/4iTNAsylGppczE0drH2mLYNvgy0HM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k7ZezPSE6zQWazuAgWestNEXuh+L6ByrALds0gsx01JJDchFOAGC7cT8Nkh4ypR1MTcOaDffPv5lMcAb+LyQbqJvBMJM6VhX4bFn4XXKUJDxtqmK4zOUCZb/DtUjs9DFE542w/GRcfIJvIR+aRO+Xh0dDOcEZ+hkbrVecRsKkDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A9bqtpE4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GXkM6glQ; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65H8UvAR2025403
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 09:36:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z+wzvyO/iS1rj9mimdNrmwOL6jZPX/NqqiEkBWidZ3s=; b=A9bqtpE4sE5S4l8t
	9n2rpYKezHAmtchlrueMWbiaIVb6amRHiY4iXTkfVzYu171GrjbJN/amwXhgbXlx
	ybBMMszyb2ZlCIst3zRmLU4UCcxBb6yPpa38juUZSxGtSJjEqR03vL8UbXpXSQpF
	W7Q2EPsUbWAydJcseQFjKn1LiWuBn9X4x55ve53Mk3WM/5TyHPxsdXMomUNmCI7W
	mZZ+Ek46VQXgz3GQufxryZzKx2hfSNTltP16U2My3osOtzWbcuojruFMwsz5p9zO
	9yvWYBGm7JskRX9/rVYNA+bu1Bju4kI6jvh0kAZLpnYJaomafQ2qo8DBHhwAX9Au
	s3Hbag==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4euees2ffa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 09:36:12 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-917fd2bafdbso95430485a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 02:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781688972; x=1782293772; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z+wzvyO/iS1rj9mimdNrmwOL6jZPX/NqqiEkBWidZ3s=;
        b=GXkM6glQdbgArW7b1Pl9ZHsW7/0ZzHiw1ARuPeMgdGcsKXx6sxuJLAqrnudwWW2HIP
         xMp5m8j3/0EVqm7m/YsFC3qW/xkr5N5lAbp07jdetA0BGHl+mPP1OTnTvb5xKWwhDcd9
         uHhq59X5ulw6kqCDYP4z6PzAIiNhkNYSut+rdotMZd6iJPe+tyuxwX3Hf9eh8gU/Urx5
         m+iF9HO0MxpnUaktlA5coqJU8XkvDtIiFvvFjuCeiNY4kvgzfTGiLyBgWQylqKoggKXk
         EH9EngBUkx57nfv8xbC0NMaLnrsoxu8cjeWKFNLbj1vD+kVcRYtuwDjVmbEQeR4II6az
         jxXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781688972; x=1782293772;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z+wzvyO/iS1rj9mimdNrmwOL6jZPX/NqqiEkBWidZ3s=;
        b=E53m1o/EfM3JORR0WdJgpdFRwWM5TmucugsRTUGgJn52ouBYnqS7cOJ2V/pmKG/FSf
         oqkRHbq6acOBBdliCIJn9b1VA5Yt+vrlR0LXxAEYuXcQLfwAt17YLvaUgfn4nh+qcf2w
         EhCi/7tkyjf4O+Tz2T36R1rCT37doGt7aoCGMdV0eURlI5vKp8meQ9B2+WCl4Yz6xqkp
         82EtnEmbuksZAdKegjUyyXesBKaSZeibNmS4WejwqDp45e8JwllgXiuPxoUmrhhkHw3X
         fwRlTRFtgXZe2cWLfnfiha6pxslqcHIM+P1ZJJO8r1BLo917MCnNKB6sfGPoznEaLZrF
         /C2A==
X-Forwarded-Encrypted: i=1; AFNElJ/WQVg7RCcw0JOURB80V0CprEkIuZuDLMmKCKGaYM4hnl1GehF/dreaqAqQVRpIin005Qi7oLKVfjw0y5MZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1oCJyGNsDEvk87U1B1Bw3kggZvPpVtnpvqCESpgFi4PNr5eB2
	slM+Y4CukwbZTNEE3un8ecWZxsISY/luF9JmbyBmDvSb5KqM3JbyJ1neFjEy1kVTsfTWZ/2YLoW
	QBPgct8LsGXqyXVOElUzp6G81uzNaptoKhZOPQYdamz8+eZwNZO+mrDyjHYHuSM6dtV2K
X-Gm-Gg: Acq92OEquTUghtpUfP3EPCSvQGH+zNkYml3wiWpRC99J+xNTJwQoP5TcDSpF23QqxBn
	ja/o7Y+8STHCmg/sdzRtFgpsvXltnVSr7ke6sGaugldNavpkOhoieo1vsKHP0UfEJek7DbvaHvM
	pCUm2DbXVRRr4z/QrQOU6xr0DTpDBJgRznewCONx+aFXftL9hBgCqi9LvpmbEhTb8ZrN4HDpy1K
	1XimqDr1e1vKGbv/Kz/6LyKgPXpt0FKIc4oPrlAg7ff/pgWCOZ978zRuvsP1nlvkcUNpiE5call
	APR9HkcB2uPYjIJBrceS4p1EDpEePo/bK5IJW6879jhXisyTTShxYIHmIr8tvFkM+tcbQ+wgrRX
	Kj8am+J2aJy6vIOeG9ablqpKJHKwJ/V322eI=
X-Received: by 2002:a05:620a:4449:b0:915:8055:3f9f with SMTP id af79cd13be357-91d8b7b1dd8mr312772985a.6.1781688971935;
        Wed, 17 Jun 2026 02:36:11 -0700 (PDT)
X-Received: by 2002:a05:620a:4449:b0:915:8055:3f9f with SMTP id af79cd13be357-91d8b7b1dd8mr312771085a.6.1781688971503;
        Wed, 17 Jun 2026 02:36:11 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb8e1db3esm763237066b.56.2026.06.17.02.36.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 02:36:10 -0700 (PDT)
Message-ID: <d1882207-4756-4e65-ba30-b47ccc821fd4@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 11:36:09 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] bus: qcom-ebi2: unwind clocks on child setup failures
To: Pengpeng Hou <pengpeng@iscas.ac.cn>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260616151703.23572-1-pengpeng@iscas.ac.cn>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260616151703.23572-1-pengpeng@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: s68dgpAYIeGOiBcGtt_jMWqV2ZlaCvZQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDA4OSBTYWx0ZWRfX3oEoMjUPaGW/
 j0GEjDf+Y+zMEotj2LH3pb+McVymM80nu/KABkM3HIvWU/gKUJBSVXe9GGDMpFpXNpwRSfCu7Ya
 SjJ+soH7D2OASu2ilkvfnuhw3BhCLsuyMBuPQ78o++HWIPAiufRbdMQLlmQBEC7yPzewzyQT249
 XhbU2LMCfD4BepT5OpxWEw83WX/fCNyFCbZjY9MdAc8W6yo4jFjoMTPbbbQDlL92ND14sQPtlSB
 EDJrZ9RVGkhUbADN6PmxDI+IMm3MZMwldRxn17uxXAv3W//vVHowdPZhjJSbnNOQOemtM2SCx2X
 jpspfnwfVcDwDz+oQv7hx9Wfd69+EwbbRxehXvdiYIqruM+N2MiTa5Ly7VM+UURMY/tZVamgMpo
 M0hm2s/SR77OdQ4AAxYu8l4WyW8K0515L0XQTp2y51UF1jbG8sul1yBWU7Czx2CPNxt9fRp5sky
 ccrTz6mzh7hgXI/mK7w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDA4OSBTYWx0ZWRfX3ebe7Ty+45dV
 TBj/sGSlMZqd3r7HqcVU/GHf1yOU5O5AB/pHW0h1m6xZkBgdJAEuByS2uxYnDN1DDB/kici4xg2
 9gvn9TUNIvfBz+Fune5zHorkK+tcfJE=
X-Authority-Analysis: v=2.4 cv=KeTidwYD c=1 sm=1 tr=0 ts=6a326a8c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=okfOTpmm0OxlZ874JiMA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: s68dgpAYIeGOiBcGtt_jMWqV2ZlaCvZQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_01,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 bulkscore=0 malwarescore=0 adultscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170089
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113525-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:pengpeng@iscas.ac.cn,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,iscas.ac.cn:email];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 06DF5698181

On 6/16/26 5:17 PM, Pengpeng Hou wrote:
> qcom_ebi2_probe() enables both EBI2 clocks before walking child
> chip-select nodes.  A missing child reg property returns directly from
> that loop, bypassing the existing clock-disable labels.
> 
> Route that failure through the existing unwind path.  Also check the
> final child population result, depopulate any partially created children,
> and disable the clocks if population fails.
> 
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
> ---
>  drivers/bus/qcom-ebi2.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/bus/qcom-ebi2.c b/drivers/bus/qcom-ebi2.c
> index be8166565e7c..68fe931d1636 100644
> --- a/drivers/bus/qcom-ebi2.c
> +++ b/drivers/bus/qcom-ebi2.c
> @@ -353,7 +353,7 @@ static int qcom_ebi2_probe(struct platform_device *pdev)
>  		/* Figure out the chipselect */
>  		ret = of_property_read_u32(child, "reg", &csindex);
>  		if (ret)
> -			return ret;
> +			goto err_disable_clk;
>  
>  		if (csindex > 5) {
>  			dev_err(dev,
> @@ -372,8 +372,14 @@ static int qcom_ebi2_probe(struct platform_device *pdev)
>  		have_children = true;
>  	}
>  
> -	if (have_children)
> -		return of_platform_default_populate(np, NULL, dev);
> +	if (have_children) {
> +		ret = of_platform_default_populate(np, NULL, dev);
> +		if (ret) {
> +			of_platform_depopulate(dev);

We can use devm_of_platform_populate() instead (which will match any child
node instead of just the simple-bus-y ones, but that's fine) and
devm_clk_get_enabled() to handle what you're addressing here, then we
need no more unwinding

Konrad

