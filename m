Return-Path: <linux-arm-msm+bounces-98676-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AMFAK0++u2n1ngIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98676-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 10:13:51 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 99D142C86ED
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 10:13:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 225293002D33
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 09:04:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DF53371892;
	Thu, 19 Mar 2026 09:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZKtPPF3T";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S/zpGhzv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE11036CDE5
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 09:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773911080; cv=none; b=qsQsbUT0IUBayY9W3hGJ0XX5IdY5tXWYkgJQlunMbjNuPK+yv7AT5d9EiHvF5hXIqltNq9i5iSYu83QKRZI9ngxwkb0T4yIFu88YfyFwsGoca5TNHU827SiEM/fpDtnqN0Twzwve+ZcYdortVunwEDzajYVI7YxybTSlts9ciso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773911080; c=relaxed/simple;
	bh=enhm0fgZ7cvpHwKA5IX3tPV2s21d1oH0qHqzq3DhcrY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jJN1L93k0roN+L2AE9cgZveBde6hyPSDtihV1Gyqd1pIsbOdhP7JEqeXOfXZiE97Z3va+vDisAzZsrH126LoCozqJpr9LKSCb8LYa3nQMhOuDvJNN9gVa7W2QJV4LI6u5YOHpup7jC+GNdHCGUDNddgcEmvu6uvR3ekE9foyFuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZKtPPF3T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S/zpGhzv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J74Aux1027820
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 09:04:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EH8bY7QD2EKZljMmJ8B7Le3WdFz6YOjIGZw8lo4HuVg=; b=ZKtPPF3TzQXeJCxI
	vQqPEYIW+n4THnio++yCy0Zpdu+66LcC7xdB/QnqocbGxLW7k1ce5fLn+zlp9lQ9
	XIhHU7h0OaJxOZdVDzIcCu9Klei6V0g98WlT+kjPUMYfRdBiEYuWVQCN8ld9hxFf
	Vy1pDB90rA3E+B5NKbYhKlwZ8cQaFZLVw2IsMt5wyZZ36Ny3+jKkz87EUA0B19/Y
	8X6NCs0/cQQyjFud5HJpuEljDBiXbzhQuNNs02jHMtl/P52Z2lxVfvHYk7WfYxcB
	BHotcCZc82HL7QVJai6mwxvmpXknZzIe52riBBcmYd/5VxGUTg6QfP3809c3j/5W
	+0tLSg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d0032jnae-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 09:04:38 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b31cff27fso501411cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 02:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773911078; x=1774515878; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EH8bY7QD2EKZljMmJ8B7Le3WdFz6YOjIGZw8lo4HuVg=;
        b=S/zpGhzv6yNqFc8PhsqBOjXto2RkCYC0h1wUHLUf4Fg4xaSa7RbMoLAbqci6N+pxlp
         So7Jxknw6mBByQ5J5X45/iaMGltUc6TjIE/xURsq1oCWf0KtafrI30wIsUAbgNv9XdRJ
         kB4hH7S9qe9VGmrNB8X+qFy49IMRcsv72SDBQSGOMo9B0DMnb02kyd0zZhMF3ahSJi6l
         VBS6/L7nM9WoBRlwe5Ld8PgsQomg7Cu4j0Osjh3yQaJO0a5VtFZgtRqQNlQP4cEhlrF2
         /8fGwxva8iR/XmLLghrP0kFeUvJZo6cHKw0206oQlMEVO4Iex8JLCLgJDY4lSzx8Hox+
         /kug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773911078; x=1774515878;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EH8bY7QD2EKZljMmJ8B7Le3WdFz6YOjIGZw8lo4HuVg=;
        b=tNVIO4NUKG3CAI9OseQb9OY5U/jgsX6u74gNWVJHlDGVHwtMZJGEtvhgQQc1RmRwMr
         B5TGFrxd5Dmf2XPpzTbyBvjzVnuBCHm32me0UttBsYj9QAEscYV1gduXgROVVZZzR02G
         LtaGkvgnrQAQhiUUaZTbg3nELMb/O5muXs4wfbcIc97npyzAINEDg+ikllKQNL7IsG3F
         O+8cQF8vWP9OAls9u1vO8gCrYtaNlOjZ5fWC+0dR9FKTC40lUK6YvveZAYsNU2n48GEe
         w4GX9NGRcjA7nzN3XNQrl5v//EF5oV2FO5AltlN8Ofo7l9rcJUH+QXegh3ord4qTadGq
         7Cww==
X-Forwarded-Encrypted: i=1; AJvYcCW8z3TXWBzkSwi5QwVwz8YVdlyEislGyqn05GZnLVWGBhPk3NqChpvXJtPb4aCvAZrvueB+lJ5CO6y9oSt5@vger.kernel.org
X-Gm-Message-State: AOJu0YzaD1ZF5/CfkABsWPcw7QJNYGh0lKgmanfxMu53ybbfnO3tpZmW
	2uxCm8iuWacVP9ou0pV4z6K4qpY57hAprSIi0g65JmFTVDmIugExYSyibKCU1Wqs7Buyenbzs9e
	/3r3C8u70nVZtRqrnU0GwIXmU7auTCCxrN51l1QBT9CwSoVxzynLy2rKOsXvmmSEhB1Dz
X-Gm-Gg: ATEYQzw+t+ME94VspaM+3znxRqTOYiK5/T50/tbrR0PS5GwNmJii9bx4ODTCyakWLn0
	RRbLuM/SGlXp1jS9H2o1WrAr19P7f/TuKVE8TnDr2vM/yeyw1Ua/SCbiw6EEPNd0lhGgt8Uv4+7
	qb+icBKA6BxYDkmpsmR31Dh9z+0HxRiIFElrlcuRoUAU1E3mB1hOtsH20YjRZi4jrkTGnt2erjn
	L60V2PT4dlAbGe9AxRqRrYOizRKMt4E2b7HpEfPOFzGVNXK/0WqrrdaopcvNVMCUiFP9FgM0RSR
	WKxHYLy8rUEM0tLGvBYNwnc4i7oyOnoDdlriARsM8/8i+468ByLNE78jnmJKVATvnvfDOQ45xov
	9EihSLsA4ggMP9/j43gkpMLuPu3YwdsmOe65aLkJQ/rh+YE+TH5g6hBVIAmiZG6LJgWKRlXcU+o
	dUxec3uE2O
X-Received: by 2002:a05:622a:30c:b0:509:2ef7:703d with SMTP id d75a77b69052e-50b148b8cefmr85605401cf.63.1773911077894;
        Thu, 19 Mar 2026 02:04:37 -0700 (PDT)
X-Received: by 2002:a05:622a:30c:b0:509:2ef7:703d with SMTP id d75a77b69052e-50b148b8cefmr85605091cf.63.1773911077402;
        Thu, 19 Mar 2026 02:04:37 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:ae20:597c:99b8:d161? ([2a05:6e02:1041:c10:ae20:597c:99b8:d161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f4ba847fsm49542665e9.25.2026.03.19.02.04.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 02:04:36 -0700 (PDT)
Message-ID: <74a9bd51-8c35-4996-88ce-8c1995b506e2@oss.qualcomm.com>
Date: Thu, 19 Mar 2026 10:04:35 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] ALSA: usb-audio: qcom: Use the unified QMI service
 ID instead of defining it locally
To: andersson@kernel.org, konradybcio@kernel.org
Cc: Takashi Iwai <tiwai@suse.de>, linux-kernel@vger.kernel.org,
        Alex Elder <elder@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Kees Cook <kees@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-sound@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Dan Carpenter <dan.carpenter@linaro.org>
References: <20260316171419.2619620-1-daniel.lezcano@oss.qualcomm.com>
 <20260316171419.2619620-5-daniel.lezcano@oss.qualcomm.com>
 <875x6ug6yf.wl-tiwai@suse.de>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <875x6ug6yf.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: vP3p2o7PWy3nVPPHHa_Tanbb1aa3NfYr
X-Proofpoint-GUID: vP3p2o7PWy3nVPPHHa_Tanbb1aa3NfYr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDA3MSBTYWx0ZWRfX54suvlD+th45
 l0PCD/Z1gG0x5HP+8boQzOJ5OzLrkY6/aHTdxC0XIZmMvplw8TLE53TXqq/K6uYITEf5aC8kTGe
 TkA2I7cukeR/43BFl0FuQTWO5Li6tXWw1OyiRrNJDPDmhpGREFkbv3IbHUMMSjQiQZ2o7ELytlc
 WY9i3lgooEt6gPNOUC88V/sfOKq4SbIz+XSBygZZM/6UzbdfmZCtY3KkTvg4OSWEkW3TWrX0WTp
 z8PTjvmoe1JOh1qguXsU3s7u37+8nI/lTxgQzE/5MtelwMmFHs2KrFYlyWTBQaxV5PcCp4QcPKL
 AtrxJndFAnOucwahnULsPZd6qoK3rOPY0v3uztsGo7Coh40TwTnlqE+igxlO1TsTSZoBxfzh3K3
 rDufFcbGfnrM0lF7PoEYDi/Lzb64f8ojezyBHErUkeGuGM6zyTDapyynhJGWCO6bDaf8iPH7rFJ
 daff7N4Ifh0OkN8a8og==
X-Authority-Analysis: v=2.4 cv=WO9yn3sR c=1 sm=1 tr=0 ts=69bbbc26 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=9ubS0I03ALhbG_YfUWEA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 clxscore=1015 spamscore=0 malwarescore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603190071
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[30];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98676-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel.lezcano@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.996];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 99D142C86ED
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


Hi Bjorn,

On 3/17/26 10:07, Takashi Iwai wrote:
> On Mon, 16 Mar 2026 18:14:14 +0100,
> Daniel Lezcano wrote:
>>
>> Instead of defining a local macro with a custom name for the QMI
>> service identifier, use the one provided in qmi.h and remove the
>> locally defined macro.
>>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
> 
> For the sound bits,
> 
> Reviewed-by: Takashi Iwai <tiwai@suse.de>

This one can be picked up for qcom/for-next

Thanks

   -- Daniel

