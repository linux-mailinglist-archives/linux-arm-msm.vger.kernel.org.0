Return-Path: <linux-arm-msm+bounces-116932-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +pnEEDzQS2oBawEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116932-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 17:56:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E2EB1712E44
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 17:56:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=nPdAahHJ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ZyWk+42h;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116932-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116932-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C4EE430C683F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 15:36:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C593F424660;
	Mon,  6 Jul 2026 15:35:08 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AE21414A18
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 15:35:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783352108; cv=none; b=SDLlqhSIaAbNltWRh42pY1MjZbQN5deoVF5Wd8iLD3t9HF1qX3jlkrDR72B0G84LqJV7pUxcUhwPFI9CWmXP3g0l3YxxNAyCcdFGbAtBuAcgmSdhT4pmrwk4etAG9SVt2saFsnq86ToIvsaiVfKR2KtAKVF0a+aUgV/xQbw+3dA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783352108; c=relaxed/simple;
	bh=24x+vWFLjhUk5l3YpK3HhMGF1FGUmyEy33Vjj+/mG7I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t1XSd2ficWCXjAYIigsRBMLKiJUfTI/N077LGVfvD5D1bUpFXRl/9VgnkDp2YccHipNT2AX0IgJsAykkP1bhHhcEz8gfbCOUn4ivzyYmM5g22u3uWQ9klD2HzD4usi4neZ2MniTlWWEg9/5V9D7lGEGsL+kh/ilUd3JscOn7was=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nPdAahHJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZyWk+42h; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FF1Hp956706
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 15:35:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y3zW101cLHzgWVTr7yKGtfLqHWots71GsLr4TTp2JZA=; b=nPdAahHJZa+SmQ7X
	Om7qQXhhKSV6hKNfnZMEJofwS+PyJwzNdiSnFkYEd0WC2+Qnmv82TRM1NanVF4Ei
	kPZIzNyrHhiFC2HVnrUEYWP9+cmjliCJZAfCIERVQ9jENehf83WUqQPvaqq9hE2U
	2AIvqqa6zEzH7Zb+7xwZ7EkyB+QCB9JKZpzybhzZfiuqyJIZUiH4evYwGcq2ubBH
	mShl3zLv2Mxsmp99YT9L6v2uQFIgt7gRvH4sEMJu19vctvEEfbw/LyXlgM4mTDZx
	wT8YV8gvcXE7JjMRycdk0mzgU4BWQ+Bqfrh4hVKG2PbpqpqmD6mnMoZBHwWSPThW
	cw3hyw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f891ustk4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 15:35:05 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e6cb57d25so97466385a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 08:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783352104; x=1783956904; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y3zW101cLHzgWVTr7yKGtfLqHWots71GsLr4TTp2JZA=;
        b=ZyWk+42hnl6FkCzOPMsLh98YteMOUNwMwbaua5kF8AAx380qFDz8eCxO4BEA40kyBW
         Fts1RbOc4dkiPsa/NBtl4DR88VGrkgW5W4JHTipIdZ5pzoWiHcXd3L24g5vkJVXeDMWd
         s7033Z4byi9NFoTxS/ncBgaJrKUt2D5q+EeO8gglCOA7G3kq/K+EAbYiltCX69gMypn9
         Mm4ei6wVLDjHdtdvzHE62jkv3V8IwpylQqiXCJuwSNpFhh0xNA7PUTTGnsZ3cXtwOEfH
         ZVndiaVbQNlIY98KOoQH/0DfIVHOglynwrRGYaosePOfHhQyv+Q2pgCk0dU3AD/AbkDd
         NkEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783352104; x=1783956904;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y3zW101cLHzgWVTr7yKGtfLqHWots71GsLr4TTp2JZA=;
        b=I+TXnla0Krne7dGfHAsRfjtMHiErztnVbLSpgegCutmaYcq/nK/qbM/PPHQp05+ptU
         j+ASQ3/YwzWYfO60t/xp4i5Q3sADk2DmFJx7U7UEOPRoALxrTorrlQHjNwrR/7Hpvcaj
         B94umH/QQmvvhFCcAZ/o9z4feLC/CT8lJB6FSGTpElvFNx3HCV2Ygi6ZFJm1FQGd5zPE
         QiToK0aEb2IXzKTL/NfTrU7xZDAMwn6gs2GOaYj9LNaRd7SgEWwxCEwF/Wk49NMkRKek
         RknQ6vDUoq7pdm0nbRkt6poOWht4nZUbquqba1pmmN3X3PjFPraxjZc49MCH6Twt0lWc
         TtKQ==
X-Forwarded-Encrypted: i=1; AHgh+Rof+iKkBSgAtW58ackmI1Mk0LmREgQUWzaQffp2M+bE/+lOkSG2xuA0twOm/o9a3LpW3wRO1Pl21KAcY0z4@vger.kernel.org
X-Gm-Message-State: AOJu0YyibZTjpT5MDsEUQIyBEzAjF6vrsazYYcVTSX3iurmNRJp2XxVu
	ukU0sDpaBl8xiMchgPfB3FXXsQ+BxqQ/J0BOqHDD2QrH4R60rsUomELx7425nYVOoUZRDDBizY0
	RfgsHFH7RNJO06esAp8zI95Nus/DjUh8DGoEOzZ3j7KTJJD9GWBTZe95u22M1P1hdcw7b
X-Gm-Gg: AfdE7cmkRRZRcP8I2FHx2tEH9H3uxrikWjtkDP2ekReUOmUS57yZSGUiv+X1eNDGn5l
	2xYzB4cpE6Xuys0Rrf7ccYsUYifd2dbR6kkM+4MyzHE7yFsNgReIjM/5u/sUulNY6VrsoR7ZSzx
	vxYBm5pYqgNrQ0n414fPepBjsHXZKuzy7s/XNZkJcaI8CuTHO77M8tvJt5Sb2ZdfkXeuHCbbcqv
	fb6yhpiCgIArgXLIIzorvwJ38o0DZvjbil3MD+joCxlstu15smfNnAvJhrwYACyChknhRkvnEf2
	0zPb5LeL9zkeY+4xlikgNlwsJru0K3IyjCOSD2fkldSzSUdX+pVH3+bWjhd+5qWG4543tOdNgex
	JO6d1cE21R4HmyY2eRY0mYbjIOIk7oRjl6j4=
X-Received: by 2002:a05:622a:13cd:b0:51c:f3e:781e with SMTP id d75a77b69052e-51c4be97d68mr98385051cf.6.1783352103960;
        Mon, 06 Jul 2026 08:35:03 -0700 (PDT)
X-Received: by 2002:a05:622a:13cd:b0:51c:f3e:781e with SMTP id d75a77b69052e-51c4be97d68mr98384441cf.6.1783352103372;
        Mon, 06 Jul 2026 08:35:03 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b6054fe7sm772422566b.10.2026.07.06.08.35.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 08:35:02 -0700 (PDT)
Message-ID: <8b30a278-3a53-4f0b-93bc-ee1822430b51@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 17:35:00 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] spi: qcom-geni: add GENI SE registers trace event on
 error paths
To: Praveen Talari <praveen.talari@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Steven Rostedt
 <rostedt@goodmis.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-trace-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        aniket.randive@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com
References: <20260706-add-tracepoints-for-se-reg-dump-v1-0-48bd08e28cf2@oss.qualcomm.com>
 <20260706-add-tracepoints-for-se-reg-dump-v1-2-48bd08e28cf2@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260706-add-tracepoints-for-se-reg-dump-v1-2-48bd08e28cf2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: sVXAiocKxE7Vm3BdEuvoKvRUt0E5G5Md
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE1NyBTYWx0ZWRfXyJtQyy8tuftj
 1Sz6yr3464kpPDP0UqQC+WhbxORNJSp0opVZTIByYXmBA7QKAj82h8befsHzXvZFhWyKt0sgFlJ
 B98i7ud2mrfemFlOL+ACS42B2T1wXEY=
X-Authority-Analysis: v=2.4 cv=Mo1iLWae c=1 sm=1 tr=0 ts=6a4bcb29 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=wRhyhPH_MPSplg4SnB4A:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE1NyBTYWx0ZWRfX73tKlKXHJuxq
 1C9i2lCFKFiWaXWzsRsoyKNurjXxoYgfbgZ7EwkIl8R34O0ePd3HaR/r9w/b+tpFowDRItlAJow
 pTld9/zhoTG9Ar64x17qW6HpCkEermFqQKaoOESOsJz2DMc19pxez7+n1QMcEOEQjhbDZ7wdH9M
 41FG8q1XRfv8RmC0GnFCxdHEGs5244UpCteupKBlX9xpO+IvZe5Vi+HQt4Fg+TJzsAyHtOUmDBg
 hrxMGggEbUCyzVsTnR67l0xFZEyC0ulSkVPb+g2WxspTVwSTXIqK+3mgjmV/2zOxVClyKOq5JEL
 vZuo2GiOa+yeW36e3c1pbDqqNhIadQVBx+755GdfPBIbpL80C+ymH+uMzJjS4q9zUTlKDVpsHTM
 IoDQieFLre7Nk1/vc1qVAPqjnUcUTX1Ee0/QkLpeQFWgqBLp3WXB/NyjByXOrbm0Gh94H/R/zpL
 TFLdl21jbEHEOioTwVw==
X-Proofpoint-ORIG-GUID: sVXAiocKxE7Vm3BdEuvoKvRUt0E5G5Md
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060157
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116932-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:praveen.talari@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:rostedt@goodmis.org,m:mhiramat@kernel.org,m:mathieu.desnoyers@efficios.com,m:broonie@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-trace-kernel@vger.kernel.org,m:linux-spi@vger.kernel.org,m:mukesh.savaliya@oss.qualcomm.com,m:aniket.randive@oss.qualcomm.com,m:chandana.chiluveru@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
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
X-Rspamd-Queue-Id: E2EB1712E44

On 7/6/26 1:08 PM, Praveen Talari wrote:
> The GENI SPI driver reports various transfer failures such as command
> timeouts, DMA reset timeouts, DMA transaction errors, and unexpected
> interrupt conditions. However, diagnosing the root cause of these
> failures is difficult as the hardware state is not captured when the
> error occurs.
> 
> Add trace_geni_se_regs() calls at critical SPI error handling paths to
> automatically capture GENI serial engine debug registers when failures
> are detected. This includes:
> 
> - M_CMD abort/cancel timeout
> - DMA TX/RX FSM reset timeout
> - DMA transaction failures and pending residue conditions
> - Unexpected interrupt error status
> - Premature transfer completion with pending TX/RX data
> 
> Dumping the SE debug registers at the time of failure provides
> additional hardware context and significantly improves post-mortem
> analysis of SPI transfer issues without affecting normal operation.
> 
> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
> ---
>  drivers/spi/spi-geni-qcom.c | 22 ++++++++++++++++++----
>  1 file changed, 18 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
> index 26e723cfea61..7db0836308c2 100644
> --- a/drivers/spi/spi-geni-qcom.c
> +++ b/drivers/spi/spi-geni-qcom.c
> @@ -3,6 +3,7 @@
>  
>  #define CREATE_TRACE_POINTS
>  #include <trace/events/qcom_geni_spi.h>
> +#include <trace/events/qcom_geni_se.h>

nit: this could be sorted alphabetically (Mark, could you fix
it up while applying?)

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

