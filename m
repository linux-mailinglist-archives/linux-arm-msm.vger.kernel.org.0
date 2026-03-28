Return-Path: <linux-arm-msm+bounces-100548-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MB8yAa/7x2mIfwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100548-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Mar 2026 17:02:55 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E219734F15C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Mar 2026 17:02:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CC6B5300E1A4
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Mar 2026 16:02:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D64C396597;
	Sat, 28 Mar 2026 16:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MN37a+BG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6382395DB8
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Mar 2026 16:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774713768; cv=none; b=gxKY4ifnLnhvsr0PahArO/+43qBjMJTLzi6hYCU/0SB8KM83lHFH7BabCXBYpFlsDB5sdLlUPyuMjup3Iv/RS+/s4x0Qy9BRr2Cw/g97wi4OchVoowu2eom3U5zBOtefC08eZP0hKX7wzYFIqnoT71aAAHPBP7XD0zQALbyZ8TM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774713768; c=relaxed/simple;
	bh=5mmjhWAxCiYFPAEUtWK8vIBoYVI6QTdkJFmQtrU9oyY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Th/o/JZwkcOINJalrEe3NcvveUfKC5HwBNjRUWA+oua0te8WI1sq/QTcL8tcPGSzdhKWAM9zXItRNrYFmemxmJpM3tdFLD4EwWS7Z4cv4SA/HgvpmNwAfTwGniTasK4vOTf9ZXkcH2g25Ekc1PW9I0UpDZPw7YEeyWiZ6IUkQ3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MN37a+BG; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-661b16ac011so5810618a12.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 28 Mar 2026 09:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774713764; x=1775318564; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IpiZdUca/KvBHgqMWXQPF+EJwwgHXh6W6A/k2bT285Y=;
        b=MN37a+BGZkojzDW2Z33L/V4GJPO3lmDgHmABo4pOCsRIrcESlIYbH8ChZe+m5vPyd+
         2wfWLLW08zaA+YivbdqSZH4IUDR/2ede3GS7EtWYVd1hV/BdPGdKrhkvM8DgYiNhdv7H
         t/t5dUt3pw+ArisCEK2ACup8Va3OZujsr2hTiKiUD+wsXJNqt7ngrSLsJe3jBJKcn4Dq
         kTB4gwZb5UT7ggpj/SDTkMr5D+w0Nt4YJxq7ZCcet/iMq5KMzH7+qDqceKF7b5dr+r6G
         prmnhRfIphyL6/bRz5egyu+S2oRI8IOB1VIbMLaxdjfMCfqUfa3lj77iJ61nHOrjG5iT
         GKZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774713764; x=1775318564;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IpiZdUca/KvBHgqMWXQPF+EJwwgHXh6W6A/k2bT285Y=;
        b=k9LjMGYHsb7dDA6rce+Neotrl7VvMKS4VKVYRdEwK8JwW/5zh+UiBiDz4N0rcDIf41
         3Zq6X+bEVN9VX851xS/ci/zmEorJ3NTE6NsWVNeFyA3ynwB/399qVWogV60KnQklvRmS
         yDLidvz2sFG3IX/HrMxBlmFP6maHuEJbEIndXyOkeoVO0y8smfrq2o85ELQPfR7IDyKW
         SmufwB00oigfjHoaw2zZG4f4+gjsoqFjawW6KGPhd4Ma5TNW9b6O1nFVuZtX1xJF7tgH
         6YVOq+boLaouGri+OFNmiS8784Vm8HmVzQ2IU6jC1rvRscCv/ZBVuAXU5bP3PHPqso9C
         3J3A==
X-Forwarded-Encrypted: i=1; AJvYcCVm2TQsROa3ol+UPYGFP9a5mt8zIWHcCPPdYAcIiC9ylgLCROXhSg73XK7L3YDQaGCrg8wGrQ7qQk3Xxjce@vger.kernel.org
X-Gm-Message-State: AOJu0YyNufls5rOOPr0qleQsCxanusAflvk1L/yJFFRXna5gJA3yHQ+t
	NUWnjwKPK14l1tb5O9b7REithn0teo6WM72BhdUmPLO/KIprB2+rMz6ZUhT1YoK5zw2A3zTElQE
	PaKUp
X-Gm-Gg: ATEYQzzx3m9E9JFziQFyZcCTLxhD+0HDo33N3ri633wDG/dMtYAWbGninPo+uegun4H
	gdWfQnnS+DsrQfET7Mh1NhomEEmxA+rKMETjqvef3qTM7QBW0ILmbzX8dYWGTzh2U2X0QX8Q1Vg
	Ohd1Zzzu7XNB1Gcte9keWscN+YuLwOd64imkqVrZ0WYE3S2I0Cr8OLccR2C1JJMlU6e0Hlp2ffQ
	K7E1M5/XRaTKE3aBKFE5pJRj5Pe1q4LofMZW3S8nJkgHBDJQAadrxRV5viPeQsY0K4Cvj29+QOT
	tMEnx3kHUHEnVckVb71g2oZ4eba7dSeIp5Ju46pLvlyN1+cIRMj4ZLUkpwDWojG8sK8/EyIxnXi
	weXI0oaH+ZDIzfcgCm/nBsJlGaUGKwxd32OXeMcjpybLNZOHT1ph/0e+pn7MjVNteCljg+8iTtr
	aSD0g5xSsqcey+0uP/XJ4usVlcQ87EVpAz+6Y=
X-Received: by 2002:a05:6000:430e:b0:43b:436d:77f8 with SMTP id ffacd0b85a97d-43b9ea4acbemr9747762f8f.29.1774699315674;
        Sat, 28 Mar 2026 05:01:55 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.108.64])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf21e2727sm4926384f8f.2.2026.03.28.05.01.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Mar 2026 05:01:55 -0700 (PDT)
Message-ID: <f2e9a9fa-f089-42b1-90ff-572f620b127e@linaro.org>
Date: Sat, 28 Mar 2026 12:01:53 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] media: qcom: camss: Fix csid IRQ offset for
 sa8775p
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil+cisco@kernel.org>,
 Vikram Sharma <quic_vikramsa@quicinc.com>,
 Suresh Vankadara <quic_svankada@quicinc.com>,
 Wenmeng Liu <quic_wenmliu@quicinc.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260313-vfelite_fix-v2-0-7014429c8345@oss.qualcomm.com>
 <20260313-vfelite_fix-v2-1-7014429c8345@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260313-vfelite_fix-v2-1-7014429c8345@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100548-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,linaro.org,quicinc.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linaro.org:dkim,linaro.org:email,linaro.org:mid,qualcomm.com:email]
X-Rspamd-Queue-Id: E219734F15C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 13/03/2026 10:13, Wenmeng Liu wrote:
> Fix BUF_DONE_IRQ_STATUS_RDI_OFFSET calculation for csid lite on
> sa8775p platform. The offset should be 0 for csid lite on sa8775p,
> 
> Fixes: ed03e99de0fa ("media: qcom: camss: Add support for CSID 690")
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/camss/camss-csid-gen3.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen3.c b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
> index 664245cf6eb0cac662b02f8b920cd1c72db0aeb2..bd059243790edeb045080905eb76fef3b12caae1 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid-gen3.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
> @@ -48,9 +48,9 @@
>   #define IS_CSID_690(csid)	((csid->camss->res->version == CAMSS_8775P) \
>   				 || (csid->camss->res->version == CAMSS_8300))
>   #define CSID_BUF_DONE_IRQ_STATUS	0x8C
> -#define BUF_DONE_IRQ_STATUS_RDI_OFFSET  (csid_is_lite(csid) ?\
> -						1 : (IS_CSID_690(csid) ?\
> -						13 : 14))
> +#define BUF_DONE_IRQ_STATUS_RDI_OFFSET  (csid_is_lite(csid) ? \
> +						((IS_CSID_690(csid) ? 0 : 1)) : \
> +						((IS_CSID_690(csid) ? 13 : 14)))
>   #define CSID_BUF_DONE_IRQ_MASK		0x90
>   #define CSID_BUF_DONE_IRQ_CLEAR		0x94
>   #define CSID_BUF_DONE_IRQ_SET		0x98
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>


