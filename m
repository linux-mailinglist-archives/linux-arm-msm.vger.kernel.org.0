Return-Path: <linux-arm-msm+bounces-112077-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MfaxEoDaJ2qt3QIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112077-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 11:18:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A53365E3E5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 11:18:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=HmqQDfFW;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ULM12meB;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112077-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112077-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5656F311FEEF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 09:11:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D85E23F164F;
	Tue,  9 Jun 2026 09:11:46 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ECE83E00A8
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 09:11:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780996306; cv=none; b=p9lBEupj3baS7Slhz1THVFLcX4j7p4dzICAN4LZ0hPole4WLIn0O2E8tnRvM8wVp4HGQzHGSY4xzvVIJQchSISB9EOd1RFL6cloh/KKC9F7TSZnXyiFUTvk7Snk4/+ajh/XJrHK+AUi0+ynFmmFB9CHpzcEl8/NvVXz+qsV4TSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780996306; c=relaxed/simple;
	bh=AoCAD31poy4BC6qXAWM9wHK8TyC7bImeMVDOmvVoNFY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r6IxPrHBCbFw8rN1eBIlWYqJr7rcLsWVcH+53S0692VUp+VGIS2r+QRdGJPH4+Tgkvoo/rW2hvRXWq0etEcV7AjK+0LLnnDzjtbl8ro+ZLY8Ga4uCFhQtzx2xUVYthWDoYZ8rnA0z3PGB27JzkHPjufk7hU7klzgmEWccdzJr9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HmqQDfFW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ULM12meB; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65985Vap006918
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 09:11:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jDywIep7m762xcW3R+EkXngn6ekhxLJNM54MxttIni4=; b=HmqQDfFWVPlCYm3y
	r10fBkJEBYoSFulTGHZAgYXV1/LOG63nnbizryt3uFD+zS0jZilbb/lyrgGDqcea
	hmY7HfJsrxNfschAUYfVKmSX7uMCced7stHDchz3m/y2E5XD8nxdnv2PCHrpHa2D
	mTkhHUh10QxjSrzUwfF/4ES41Hx4Dxk4M4soySzSIcNdVAZRzJFuZOKQA13MgAZd
	LNm9obq5w82ZN50q43mJdzDy3vkcNreUT+U6MmwrZqKIqf01XRkV+wWT8GVZSZ9+
	tPs7yh3HMLsZ2wwXZvcYd+6e1VzuM1re0dUDyWVK/Q+53SkjAIusnmadrhbjvu2l
	Msj7Ng==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epf0sr908-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 09:11:44 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-517647fbff1so17879931cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 02:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780996304; x=1781601104; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jDywIep7m762xcW3R+EkXngn6ekhxLJNM54MxttIni4=;
        b=ULM12meBS6RIk6ibmJTboW+KDszzCpLNyVbuXmPBRMXJuuHFUuM8NeEFDw71sNk4dJ
         1/FdDmxpzPWhcC+FPE08gg1fbZ+otIXaXadkgfGRCFzzXbEx9YXPDjJTd79E+xAVnmMP
         hm1TxLjqzANswJfyAZ4rhd8L/gRlzN0+5nj1tb+IfDtOt18/8dtmBUCM7UqnNcQQ9zhu
         BEsWTbxYQeG/UWmu15SWhrBNk8ONnUybJgJ/6sFIbUc9hcKlO+HReUv8VykTlUTtlYzC
         jAwup+D+vW/1um29sfSy+36rPoE5kMfITBs7BLKWlcEfHmEPj1dg8ZhA1oKdZhn8Mt5d
         oObw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780996304; x=1781601104;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jDywIep7m762xcW3R+EkXngn6ekhxLJNM54MxttIni4=;
        b=IBEzl52cDlUBRpQpQLhYBObP/Emc49E7ftS6pOq4CvI7lgFuCXDV10xgUxwpuddtqQ
         wtSgmJV9FIM741gInovqQNopVuBlQadcfAktlu9mc5UH3XNMQ0pxSHk3qyRx3M/p44cZ
         yM77EAC1G7lH2U9emZy0ip4zYOnhg8tcl/4iBaVg/9Dv4XPC80Yn4kgsTHNKwvspSS54
         s4uRbhfnVl60K1dVYEW+WEqk/4BhQezxGTmEu0HjzdRB4mvLwi/L1OwiH7rGKE1vh5ta
         QC+Ao60yWsm+2Er3w/5VvjeqFY+ZC3ZxgdT86omw5Fv92+fpEnKv+oOPk5YpMMNnCcFG
         Kshw==
X-Gm-Message-State: AOJu0Yzs1aZmrNtAWKwaiEXkKs5xZiMkQsW2hzLTDeNu29qmLu9hMo/i
	s1ufFnoNgoT8SXkSPU4ftaz0vPoNCHgl14vv04+FPws/0Ub2ycbbeRmVpvKp/aw7R84vvQgT8hI
	ZJg17wwfiK7hE3lsuKTO0/990fsTUkZBIZ7jQoegM97UJoIk/0ya1RwP3w58CfmoowZdb
X-Gm-Gg: Acq92OE12tXp0POmfanGx7lvK4eFUnmx6jTd54+nmTyUGlxZ3qHWhY86JEdozO6BgGp
	KIqT8+UAkUlCY2u+JqxEBikQf7b1gKMmi1enKJB7WyEnjA+4UZjosAx4CK4eDsBKt7TG2Tontnd
	0ZvKkBuajai9QrF0kF7yeHUQftXdhPR5+xcMm8ynTbhWZm9MnK5vo7o7Jjo3SAkWNTx5FIQvnF2
	bJeQWyCT20bmrK2qTvgVY4AVKvDOER0bQSNM+A+Lj+iaCa8Xbk824EUMttNz3QlqIeNKp4lP2EO
	iGd6lxD9xMW6pkY3Im4KKoydxmhR9GlEFXjst6sX4oSjYM11fLcJ1lcz8sex9ERy69Yk2htH3b0
	Oj9je1fiTY7owLwdQaFTkA0T3oWtVdg9IPcAZhabOkpJ77zGBjfFm5qvg
X-Received: by 2002:ac8:5d0f:0:b0:50b:5286:f756 with SMTP id d75a77b69052e-51795b90308mr181329571cf.6.1780996304019;
        Tue, 09 Jun 2026 02:11:44 -0700 (PDT)
X-Received: by 2002:ac8:5d0f:0:b0:50b:5286:f756 with SMTP id d75a77b69052e-51795b90308mr181329261cf.6.1780996303608;
        Tue, 09 Jun 2026 02:11:43 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf051c8de00sm1016404566b.20.2026.06.09.02.11.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 02:11:42 -0700 (PDT)
Message-ID: <0387ad24-4b34-4e1a-b6f9-44158417f308@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 11:11:40 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] ASoC: qcom: lpass-rx-macro: Add shikra compatible
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260608172023.2965292-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260608172023.2965292-3-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260608172023.2965292-3-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA4NCBTYWx0ZWRfX0s73KwrNhv6M
 ONwFxdx87AKnVbqeDBdlQKygHhY8w92q5yqIinpTq6JEcN89YJdp/gbRg0XZZ193jGIhHspbRqO
 6cvqGnVw89M7xBvLwettIFVt5bB/0lJylZtZCmcbV297DU4ImUqeHHkxV8w9m4aA6XMMbPSJS57
 HxX1Eoo5bU2vwU3xi1j+/QynzeVTLt2HIs+Xc0PUzqdpIvCPxuRwD3RxqZsDUc8s8RDTt00Tuc/
 UXkMcCwBTHls4WiOplVsHVi0YwkuEaq4DUCcYzzGhwkF6riv/5eSukhiQfiOUBGMrS6wTbk+8v4
 X/uJyn57hrz7yyJgWDsJ1TI+jyI07hMxx6ySxsnxm7G2hZwaIBN4cLF1+AB0GheF0XOPfwl2g+F
 tPpM90hn5vZCXXMudpzcpkO/XeWvnrA0VpBXjfs4fQv2gZXnF+POX6qPgI0Dla08CEP5b9J9MwS
 lOg3Hm1y0hz+ZwMelSg==
X-Proofpoint-ORIG-GUID: 8rwhq3uEhKwCiha0ywg3iqpBEodjILEx
X-Proofpoint-GUID: 8rwhq3uEhKwCiha0ywg3iqpBEodjILEx
X-Authority-Analysis: v=2.4 cv=GeonWwXL c=1 sm=1 tr=0 ts=6a27d8d0 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=HZqIYIiTNIUL-lcWgUEA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 malwarescore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606090084
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-112077-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,perex.cz,suse.com];
	FORGED_RECIPIENTS(0.00)[m:mohammad.rafi.shaik@oss.qualcomm.com,m:srini@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:linux-arm-msm@vger.kernel.org,m:linux-sound@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9A53365E3E5

On 6/8/26 7:20 PM, Mohammad Rafi Shaik wrote:
> Add shikra RX macro compatible data and hook it into the existing
> LPASS codec v4.0 flow.
> 
> Map codec v4.0 to the 2.5+ RX register handling paths, and enable the
> FS counter bypass bit during MCLK enable when the platform requests
> LPASS_MACRO_FLAG_BYPASS_FS_CONTROL.
> 
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---

[...]

> @@ -2043,6 +2045,11 @@ static void rx_macro_mclk_enable(struct rx_macro *rx, bool mclk_enable)
>  					   CDC_RX_CLK_MCLK2_ENABLE);
>  			regmap_update_bits(regmap, CDC_RX_CLK_RST_CTRL_FS_CNT_CONTROL,
>  					   CDC_RX_FS_MCLK_CNT_CLR_MASK, 0x00);
> +
> +			if (rx->bypass_fs_control)
> +				regmap_update_bits(regmap,
> +						   CDC_RX_CLK_RST_CTRL_FS_CNT_CONTROL,
> +						   0x80, 0x80);

regmap_set_bits()

Konrad

