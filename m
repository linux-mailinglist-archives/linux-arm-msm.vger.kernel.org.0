Return-Path: <linux-arm-msm+bounces-111685-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MzHpOptfJmpMVgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111685-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 08:22:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B82465315C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 08:22:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=MwaxoWLj;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=LjfBu7z5;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111685-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111685-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 339613011107
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 06:22:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77F8938642A;
	Mon,  8 Jun 2026 06:22:14 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D4A137E2EE
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 06:22:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780899734; cv=none; b=H1nb6IWNgfoVml51LU2rP0+oPq/LBIS33S0ANbYHfdRlTqUnoK+gAlI+BpYzvLS3h/u9WC3WOcnG1rse6CvI+qWScrxEFF0e0aIs0WbEs1FEdPb/dLI46babXcjMjh1AYykY5UQBSxs8a07OTaKbMw6OjVXSRddzto2OWC/YUUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780899734; c=relaxed/simple;
	bh=7/r2dFANwJ94J2Ax0DcUj0P+2XgUdRU3744Qs5bCj7w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y2pibgMxp044xTql7dEiEsxURi9897qs3wT+3IoXL2yj2mGaVEdD8waD5jRHlI+F/KsKTVemEQIgjtaBtENkwJMCF691qIaDKIWu2It83GNPo9btkH0zLc0+cr4PZ/uw+wWKT9vkljrxq+JE94m60ArOr7XK6+hMpg8ohzN+wdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MwaxoWLj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LjfBu7z5; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6580FLoH2023398
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 06:22:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PXV5eOedzsBR8n4Agn6k2oBXAflNJaFrBDP9DJ8wYZw=; b=MwaxoWLjWh7vD/xi
	lp2//XPaTUk6bMV9NOSUN/+EgCrGOz2567LCpku5a8bBI02BhQjatj/VrWdaFd+s
	X7pF+9y0utPOlbMA1Oa6HuvFI5iO95+BAyMy82od3+jbn9b2ZWJ2qdg7MTu5Pv1q
	fpyfSmLd/eDQCcs6CmlLxf+Jl79zJdtVobwnLTdXuIAT1K24sDh1ajpeVFIjVXLa
	2cKXkhE59Tfa22XpJqpK/IlPWvaFPagx3vqfnZgYzaLWK5YspApSDC8EbKb7NuLO
	t85IP6cvqD4Ac3D7CZiHdU/Z1vjzxWVCjX/nFRY0L9PyWu05lu1ohVs7JksJhnuv
	A23SVQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4embmre9p6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 06:22:12 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c860544c077so4148372a12.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 23:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780899731; x=1781504531; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PXV5eOedzsBR8n4Agn6k2oBXAflNJaFrBDP9DJ8wYZw=;
        b=LjfBu7z5NWvMErhsqbFLRrYSrYF2RufH/pLGzufcUtZgQyLS8I1YdOj2Gk1Rpq6gFj
         N98tyVH4PwwQeMKy8tW3q8oX11mkbghQHNVkUhlJrIIrj93lOpcDgia2MNn6eeV4aqLT
         fScF7geRe3tYo86Kpbfv6xLw4qlC7dtTKEiOUZlgEX9F9Ws36I8CF+5d5nQnU+ETIf5U
         vMVRgV0ap1tomiWT+u4azBHsLwWd6rehfNgDP7mrhEm8SdO7z53Y/Ankjkty0wPwGPxX
         E0TE+wCYehIu3WBDvrzY7UCjialDNH9btk9zt9qaEMkMhAPmksehdmCeuxTYoy3pqZAl
         XE1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780899731; x=1781504531;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PXV5eOedzsBR8n4Agn6k2oBXAflNJaFrBDP9DJ8wYZw=;
        b=T1ypWhUM1pZmrdxwopVKe8mBZp+/AQ62y96XAoN132MlRVLHlIb4ZPj4jphM0VLqZM
         VxdDLDrsi5Oi4dW6N0CEoffiptBlANwkTKBwTKFoSQuo06Gzx1Bx8t51zbVZqNN2i2G6
         5P0jG0sMOYTXNy+JoLlbiQqO+eueVDReDC3+Qk2LsHwSPPWOPdPIuRHgNNorCX8npI/h
         qyTHzy4IpUtTRjzFWY6GMwYYRrvdihjL9xkB1jp/Quduq7vLP6O1iIrN0k2KkDwu445w
         txjN5q9KIqWo8pJpvnrvGrSvMkkYA35qIa5HPeTixAObIyfLdIfaOdg9Aou0L9jYQEI8
         MRuQ==
X-Forwarded-Encrypted: i=1; AFNElJ++7p7dEpY8ynC8hF5IFancuqSqRRMvv4RZxhp5mqRIMvmWLr/r5lgEO10ytsNjckwfhNKfxKNWESOenTcC@vger.kernel.org
X-Gm-Message-State: AOJu0YxDCG6cVqQIDPbdYO21GmDKa8ZDDAR+xPE9NwuWSb2SilD0HNfJ
	A8/xlVYZz7i5RWT2o/pgF1xmLK6TmbK700MVzXSRrN+yxeybFNmhDElZHLBz1fFSTtoNJnOeauR
	nFsv7VGRA+1H8rV0EFaMVbjYE5cgTTt6ij1gy2zb+2sAOngdQL8b8/G22i7afT6+ul4SCBBf99r
	h5
X-Gm-Gg: Acq92OFQCV0kU2a2zdxfrjPVjk4DEFyDMGxIMcsPccAtaqirRnwAuHe4MCXdzg0/lGl
	BkNjCwzlHqVWy7X18QCG8VUT2gBO2leC3lmcQCa9+B+/54lYJ7t2tjP5L/YeGxsuuH21xdzWeow
	KwDomcK9mR5g3/u3bkQ/mw9ivr5fpy8gjv912W09PikdsLQJN2Qnc6svFXOjfrPbmo04UQj5bZX
	llW0Gkg+s3QkDC6U4zlmV6q/oVS+S8sr75bX7r2GDMTDYRTWrJyMFZbEMhdOlnPye5tPP6uk1cx
	JcUkARAXtsxK1J3BGpV2X4ow+JcxYgccv16Qzwnqd5hrgZPj0quPBUSYNDtKjpuxhS2+xSgi9EL
	AanH4irlLFe9dSt72oLv3MdlWVXhJTjdc+3qwG+Mvggz42lBQ4v5ArB9jGyrLAkXf
X-Received: by 2002:a05:6a00:a383:b0:842:7992:bdd6 with SMTP id d2e1a72fcca58-842b0f09549mr14744926b3a.36.1780899731140;
        Sun, 07 Jun 2026 23:22:11 -0700 (PDT)
X-Received: by 2002:a05:6a00:a383:b0:842:7992:bdd6 with SMTP id d2e1a72fcca58-842b0f09549mr14744895b3a.36.1780899730701;
        Sun, 07 Jun 2026 23:22:10 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842828e1e5bsm16605322b3a.46.2026.06.07.23.22.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Jun 2026 23:22:10 -0700 (PDT)
Message-ID: <94d5ffeb-05fc-5bc5-89e9-9381f85c314d@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 11:52:05 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] media: qcom: venus: add callback parameter names
Content-Language: en-US
To: Hungyu Lin <dennylin0707@gmail.com>, vikash.garodia@oss.qualcomm.com,
        bod@kernel.org, mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260604001859.33353-1-dennylin0707@gmail.com>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <20260604001859.33353-1-dennylin0707@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA1NiBTYWx0ZWRfX6KnU6uUTACzA
 iu58lTKI7Uh7136X90EXbVUF73f5IzHZC4Key9g2mcWB+W+zbgUsKkk5xLmuEcPntf6jFGVJIrT
 QYBxbcX0IWZZOGFnZkS+qgkhibA0aOHpQWEG1EZ7tow8rBp/kh6oFtegYaxa+b9rYrf8F71/KtT
 juEcQk4zmExfSTCaFkIeQAipw5wK0y/blNmd8n6Vx66Eaj2PrHTjttVaM6bMz6Icb+2I3tZVOTb
 90ssaIzlvwzta3xeOcBrUuH0Y+z4Ixm+0edqRh5Zkej7Uor/RLdtdV+hbCFjyX3GillAWd+Npiv
 vFRkH4GFpJEHxbuH3wTh2M0GUJrlIMhVGsox6fbjn4aOTg4ltI/YVjT5WrwOKpepxzRW5s8hcH+
 HwGPmmE1cSnBadoa59/TS33sWKyUdr0k45iK4Ywg9F61vEbIa73DpG16EzRGLcN57rdy4gY2Qxt
 ixsTpZRjTWi/J7csgqg==
X-Authority-Analysis: v=2.4 cv=B5eJFutM c=1 sm=1 tr=0 ts=6a265f94 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=D_lHRmgbTm7AOjN1lH0A:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: q-8wJroTzqQUj2VgYlIFhzEt9fCRfVIH
X-Proofpoint-ORIG-GUID: q-8wJroTzqQUj2VgYlIFhzEt9fCRfVIH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_01,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0
 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080056
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111685-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dennylin0707@gmail.com,m:vikash.garodia@oss.qualcomm.com,m:bod@kernel.org,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[gmail.com,oss.qualcomm.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[busanna.reddy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4B82465315C


On 6/4/2026 5:48 AM, Hungyu Lin wrote:
> Naming the callback parameters improves readability and resolves
> checkpatch warnings about unnamed function pointer arguments.
>
> No functional change intended.
>
> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
> ---
>  drivers/media/platform/qcom/venus/hfi_msgs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/qcom/venus/hfi_msgs.c b/drivers/media/platform/qcom/venus/hfi_msgs.c
> index 47b99d5b5af7..5c2025c5acc7 100644
> --- a/drivers/media/platform/qcom/venus/hfi_msgs.c
> +++ b/drivers/media/platform/qcom/venus/hfi_msgs.c
> @@ -690,7 +690,7 @@ struct hfi_done_handler {
>  	u32 pkt;
>  	u32 pkt_sz;
>  	u32 pkt_sz2;
> -	void (*done)(struct venus_core *, struct venus_inst *, void *);
> +	void (*done)(struct venus_core *core, struct venus_inst *inst, void *packet);
>  	bool is_sys_pkt;
>  };
>  

Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>


