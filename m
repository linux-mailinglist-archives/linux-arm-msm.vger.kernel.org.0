Return-Path: <linux-arm-msm+bounces-118188-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Xh+/IputUGpQ3QIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118188-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 10:30:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6699E7387CA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 10:30:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=KluTD8RJ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=JWA9BgUC;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118188-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118188-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4F946300E035
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 08:28:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9EA23F0AA8;
	Fri, 10 Jul 2026 08:28:33 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D55613F0A9B
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 08:28:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783672113; cv=none; b=ihmEi8qhl9quZIzykAIlTFiVlNI72m2PoreeDKub8H1wjTUMhmWKQ1thHDQNt1DMIYFu0klRqlw7Ied/UZ23PYsLm9fLcB19kmTGiTothupb1mWwMqgYTRr5qoAwIZCkjdSRNKZxEvSFPwW507wGHDcZkakRWpk8JDrs3cydrbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783672113; c=relaxed/simple;
	bh=vr3J4Ah6TFyjmNOt7bQrHjkTvfkgZCWxs+iaTw5TBhM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fep3oivz3xwYH3SXZ85EZE6dieuk1b/9Cn9WfInbBHbDE+U9v8sqmjBF5ED3AefSYc0amLBS2IxbiCOSzH4BhgFDgov5zRy64czicR0Six7bJ6UAt+3MQcnYnXAW2c9C8yOjb5hSGp15FWxatOdtxMkM2NflaXw7gCZipn1wHuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KluTD8RJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JWA9BgUC; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66A7ddQC040962
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 08:28:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cA+3fVMURMQV7pN3n2WY+GcSkJAyciW1cmPl1kI+vaE=; b=KluTD8RJxNfUx5G8
	TkpEu9xIr6p85PRKtw/iz+oe6muBssXSK+AQi6RcYEAwvZdK1khlaEbcxdVnovQb
	Nqln0uimfviWbaEXXYsftLuTcChFX32/k1SDm2jSGFaOpGFuDNI4DLnkWczbRFP2
	2xUR3DD5lzS5ETB8N7NEfvH/ytnjr4mokcbl/FD0Xz83BTbmB0GbQea47t+mE8Em
	8MoNVr94uTSV2HS+Yzgkmh1+wSwD41dvE87wd6jIMECWhoUG0sqUizuGj4HPiFsL
	925ov0D7qIYnufpMZzVq3U4Fepo+l5kpEqt8e49fiSYOBSIqPUz7U0VFOqRB728r
	GQ7aTw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4faeg5kj7c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 08:28:30 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8f0f45415cfso9065276d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 01:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783672107; x=1784276907; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cA+3fVMURMQV7pN3n2WY+GcSkJAyciW1cmPl1kI+vaE=;
        b=JWA9BgUCO6D/h/yFgdG3O4MaHC0rdLrofDGxxXVjoncDwnZgIq9CNnqb7Y1Ipa4xb7
         HJzoE4/BJ9Gus7slpDBuXvetU2qcPK9mgrUeBZhG4rHsQWU5PEnnPi2VUq1BwP6zR74u
         o0G2+XYy13Hvp/zmjr6qznk2D3qdzlYTULMTjXRDZvm2EpKhVPp5T7lQ4qCbK5TSP5E/
         AhJgR4v39E27bR+CdZRafIZIb/SeRmTPoVsK4lNFW/vmlKt8J8O/LDj1nLUkNQ6Pckgs
         o5CUP1rX3af48NiI24O2p6/Hnvy3cs1P7rKgTDKI7IvpbGVaO99Z5N7xNtFM4F6A6YDt
         CcZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783672107; x=1784276907;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cA+3fVMURMQV7pN3n2WY+GcSkJAyciW1cmPl1kI+vaE=;
        b=iKpM8tQlyE+6GieaCNqI0HqO7tUf1Je60yrGrmzJOrv5xG0w55EJ8F2aPpLc+2WLqH
         uSEgTrJ81KhD6kw0J2K02oOXAhheQAKpn3pfXvemnBo3SqVe/1vZWLRg8gBfKzLOONKu
         KfjN1BX0tbExLtJ8Aau3ynZKd0L1T/iqDmfmKszDhduWxV7gMeGU7b3yyRpW6NS3Yc3O
         FIAe/jpmmgT7Gl/JkbUDgCKV/Ak8HrViBPIwrwXhC5/KS1jK3y1Eqb+7KL0DVjtwg/De
         JYblAwZylp2nTUgy6cgL6pjBuH4QlKJDG/uzlJNeFHJLu1Nc10JkhxJWfgApsMh51I1O
         WBng==
X-Forwarded-Encrypted: i=1; AHgh+RqDwTB8SmVuBY1G9iaap2tVZGLIZRwk83SsRIO0rWi7jSPtzJZmiO5quArNhpGAn4v0D5kf03vuY3lb0+bc@vger.kernel.org
X-Gm-Message-State: AOJu0YzITVW/Y7yRb9aE6AIAc4bpiW85sd8HY5y9Amf7xV7we5ifEP67
	8aJZY9vYpe8/Xm3sjb9H7N0UmWWN8DDlCb6uhCitYtOjBvb+5QboEIDXLM4qTo2+57XFMwXufcD
	6ZCquPwZNzdFZtL4Oanjt5ZfE5scTOxnUS1kN4iVbew4r5XX4yD9B4jY52TzGXw28CeiY
X-Gm-Gg: AfdE7clYbEDOY6Q66z9IGdEo809jQDKlAhevaWxC9j9IVDYgPC37SEAD/ka+VfYvHhT
	5BCGQQYGadlQdgLX89Dc8R+RRPsaYtxtHLzeQ6OZggtETJa39r1kHieMniDUuooT9ql0GqXqmAN
	S7G71ehEoOE/vx7kZBpgqgMkB5Qckgml8gY14FwDq27ecl1eWYMdK40khElevjpaFfstPNZ6W7f
	4JVakywGzwJ80CiPH9SEsTcdQwia7xnvqFQSSC7bE05ZyAEk0W8eAKoHhNTZXdLKAFe+4GhT3dp
	aUFf66bAx27HNP1IWTND05jUZTig8T2yyyY2+w79Q9xqZiy/qcHMOaDHyDCG7GPxjuM2y1jspto
	zy7ug0BI+8d3h2l1Qr2YpTsK9TmawfpLALIbvk3kFx0fsdg==
X-Received: by 2002:a05:622a:4d05:b0:51c:7d0:7ed7 with SMTP id d75a77b69052e-51c8b31e045mr122859131cf.39.1783672107585;
        Fri, 10 Jul 2026 01:28:27 -0700 (PDT)
X-Received: by 2002:a05:622a:4d05:b0:51c:7d0:7ed7 with SMTP id d75a77b69052e-51c8b31e045mr122858921cf.39.1783672107193;
        Fri, 10 Jul 2026 01:28:27 -0700 (PDT)
Received: from [192.168.0.172] ([49.205.253.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15c6bd0d72sm405268566b.7.2026.07.10.01.28.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 01:28:26 -0700 (PDT)
Message-ID: <6e955b2d-3889-4387-9f85-2b000a9599b2@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 13:58:18 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] media: iris: disable time-delta-based rate control
 for VBR
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Gourav Kumar <gouravk@qti.qualcomm.com>
References: <20260710-qc10c_fix_and_disable_time_delta_based_rc-v2-0-701d6dfd1ac1@oss.qualcomm.com>
 <20260710-qc10c_fix_and_disable_time_delta_based_rc-v2-2-701d6dfd1ac1@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260710-qc10c_fix_and_disable_time_delta_based_rc-v2-2-701d6dfd1ac1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=FN8rAeos c=1 sm=1 tr=0 ts=6a50ad2e cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=MoCqpHF70WjPNMFBpltNPQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=kaZPDjHNpzmdL6TKSoIA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDA4MSBTYWx0ZWRfXxJ8xSt0CJiU+
 kcpFA8FkETJtdfBopaZkW/iyWmcu6ZRT8tSLvnEpJSBwrbvorCknypG1afrbmm9Y34TjLYntgp1
 xUYjqocYdfJZmb+vE3zDm6mUKovBe1w=
X-Proofpoint-ORIG-GUID: P0lOsqDfBQRYf5fYHfkCIE0t-foFoFoP
X-Proofpoint-GUID: P0lOsqDfBQRYf5fYHfkCIE0t-foFoFoP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDA4MSBTYWx0ZWRfX+JPiP3v7zTka
 aoHvrUWebyu5ei3dnW3AUEJfGRHmuyBZPWNjk7R0elJRjI9MC3zpXQPmwVq0A1w8HfBOlzakyvj
 Rw6gyU+8PZBErwzH6fn6fZhuZFAlEwOjbh0L3y6JF7YTkqcRWXpAlVj2SMt1b+vDxxEbpGdh+Be
 IwZK9AmPgvp2tMIuLr5+dZguP0YdNaES3M0hCckkPO+2hTMG3DIXFuOEPyGiowz8FxxMJQAIiv6
 zgFPl94/tzZecBOPXxDoEE/dCzaH9LGXL90mp041uubp4MIwmi1aRC+PpjUuHfi/+LWwHLobVmN
 BPqvHUSeseXqMoIb8/6g0DGxM57fooWWvPgSi0k4VJ+YjtFSppg7COVvu7pJCzGYHYntVE/kNVS
 KQhiyy7uEMM2De4JYJb6EgdSgM3y6fZweriI5hQhA97LjsUQ2Y2CAAyqK4JcKYu4cOLi4UjD+Wf
 FB6sN8rmvwidLX0J3DA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_02,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 phishscore=0 clxscore=1015 impostorscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100081
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118188-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:busanna.reddy@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:neil.armstrong@linaro.org,m:bryan.odonoghue@linaro.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:gouravk@qti.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[vikash.garodia@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6699E7387CA


On 7/10/2026 8:24 AM, Vishnu Reddy wrote:
> From: Gourav Kumar<gouravk@qti.qualcomm.com>
> 
> The iris encoder driver was not sending
> HFI_PROP_TIME_DELTA_BASED_RATE_CONTROL to the firmware during encoder
> initialization. Without this property, the firmware defaults to
> time-delta-based rate control (enabled), which calculates the output
> bitrate from actual frame timing rather than following the configured
> bitrate target.
> This caused variable bitrate (VBR) encoding to produce ~5x configured
> bitrate. For example, with video_bitrate=896000 (896 Kbps), the output
> is ~4.4 Mbps instead of the expected ~896 Kbps.
> Time-delta-based rate control is designed for variable frame rate (VFR)
> scenarios where the encoder adapts to actual frame timing. However, when
> an application explicitly configures a bitrate target, the firmware must
> follow that target regardless of frame timing.
> Fix this by adding the TIME_DELTA_BASED_RC capability with a default value
> of 0 (disabled) and sending HFI_PROP_TIME_DELTA_BASED_RATE_CONTROL = 0 to
> the firmware during stream-on, allowing the firmware to use the configured
> bitrate as the target.
> 
> Signed-off-by: Gourav Kumar<gouravk@qti.qualcomm.com>
> Signed-off-by: Vishnu Reddy<busanna.reddy@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_ctrls.c         | 19 +++++++++++++++++++
>   drivers/media/platform/qcom/iris/iris_ctrls.h         |  1 +
>   drivers/media/platform/qcom/iris/iris_hfi_gen2.c      | 10 ++++++++++
>   .../media/platform/qcom/iris/iris_hfi_gen2_defines.h  |  1 +
>   .../media/platform/qcom/iris/iris_platform_common.h   |  1 +
>   5 files changed, 32 insertions(+)

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

