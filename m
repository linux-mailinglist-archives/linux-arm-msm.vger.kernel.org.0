Return-Path: <linux-arm-msm+bounces-105683-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4AGSHe9u+GnkugIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105683-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 12:03:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A214BB62A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 12:03:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6438B30143E5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 May 2026 10:03:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1989F38D017;
	Mon,  4 May 2026 10:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="blFGahv9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UNueDgTT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6DAC34CFB9
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 May 2026 10:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777889004; cv=none; b=U7TsKax+Bgh8gb2sXlRC86r/TGJFbdD0aPTuU0j0rkJs9EpfUzQ1UAlKHsOTOPs+vAsOfDu4PccHQXwbWkDpD6W9YdOTG0b40eEsjKr3sF+U22sah+96TS9nYB37W/RulY5cFtXMDtvIv8u/iGEl/FB/Kod0mRNUccNthcHqlzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777889004; c=relaxed/simple;
	bh=27a4ZBAh2T3+ZHmlpGLT6Yc8QyhrRE74iT7Nbf3wzro=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ukssl3KHhPZm82FGa1nwv1B2tMOQgFW2yv1G5/10tTWZ+WbXwJy5Hiouxu8Gqg/t9uGghg75mQ7NXUYHAtXoyoZQcidnkdvSpl3m5k+BZKVbMyO5ZeRun03uh0PZZyyTtTP5aCtD8Bldy7aejDQH0XKcTyuyVyeG0bx8VKW8WwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=blFGahv9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UNueDgTT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6448fKFO3824329
	for <linux-arm-msm@vger.kernel.org>; Mon, 4 May 2026 10:03:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dIOaP3I+69NIYahYhn7ZP8dTcKbC+Rx4d1eqqv57oN4=; b=blFGahv92s0HUYjT
	Ihj7OOX/CnOH7LuU5MlrBldveiHSlAs8JLotz5yKAVYzJHzUZNj7s+B7yxCABZQr
	MIeuOap/tRS5v53jzGhONjBC3KV+HTbV+7D6vRW/eLiAunSL1Um+B/R9wppgekbr
	MEUqeXNAyibnAYw91s8LSCwst+PaDxQLLi/30M6EKIHKDEoyTMDNR1eh+c3v0CxB
	wFIh6v4C/U9MaZmtQffoPeagpZF0l4N3OH3roV/REe8FlXEloX5t8SMrJggV/FkQ
	3AgBiYK4NzS36r3ZDhDDQ7ItYyL7R5m9fW/5iHrSm0iYokJjo0HQnTlVPGvxZXrJ
	gYLCuw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dw9g3n86w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 10:03:21 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-36514eb1194so3067830a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 03:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777889001; x=1778493801; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dIOaP3I+69NIYahYhn7ZP8dTcKbC+Rx4d1eqqv57oN4=;
        b=UNueDgTTtbj4AH2YkZwodrcNhNTVZ4zMXMEJF+rXOP6EwqmQBuQpkok8oO8Ri6AL2H
         pUAhDeaBwcPdur9LtT+l5BIaeM+1Brdq6tUNOjMnZto3WZS4R8QHnbi50i5orSuLdsL8
         vFb0Bv44VjE63//J/5724sJcZKMY7R2LA4bZApNlsyObkq1ChhFFjIqpH8nDfjk4TS7/
         8dnq21r9aAev0d0ahI4YYkNEm/GCIJRQl35ixPGrHx9Tqc/MmaUOQgnR5/5xk5lK4RAJ
         t8gAClJVCgZ+GalIwtQaLbDpIbceplcIjfGYfQ4jdrjPWaxgCDCWjjcLQCRJ1vDA3qaA
         W4iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777889001; x=1778493801;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dIOaP3I+69NIYahYhn7ZP8dTcKbC+Rx4d1eqqv57oN4=;
        b=DImIv0Sw4wGHsgO10TULMexyVRbBZpaR5d6mqcGZTA6uSC0VosJ2jnji8hqJqAS3Wy
         rmG3HoXUpSODY+nNS+j5mVTTaXDSd2tQeJuyp8KFad3FkVnYeKmW6+Qzkl4f+0uPcrEz
         nuJgR544kuX8P++KLjCvtHnWfUrgoT2avzRQtFVWl6+ORCIyPyP1x4zHmRLGlUrgt07l
         7XjfNsKbldlKDA+3J6j6UXUORP/ItpDlL2Y8od9LMwyitO23hW3tBZayvPaFfcy95bmC
         SKs8XbiWqlq7iI/ZrUEqWOTnaNDCIwNBhL1TVwCAsPFfippPNFmOmlMzE8X4Z1g7uRT2
         Kp7A==
X-Gm-Message-State: AOJu0YzAgLaDapBWrm2EKymg277bq1/rk+95EEDJ57SXXWVvECZ6C245
	NIm9M2NOdLfXgOIxGMtlgwbmXz3DUm07GZiy81z30ipnDrD/5btqv5guuSJe9IWvBIYsw/SnmU1
	Gt30SQctS4/j/tSahxUAi62ZGwuTbWW6coZ4Q8BxgRt4mAG5YtejqDrC+aVkmJJwSKUZ3
X-Gm-Gg: AeBDieuFarioN1vbmAddZR3F9LGVNh0PbhJiRCFz/RFTy1Ppp2RPKRP4yCMa6Ipb9nW
	hFPNzcDB5VUK2Mq13LhgA6AXGZ2gdA5BFxVzFN6WOo79QqP50D69zdGlTW+pwax3RM2oIuQaZuc
	Un6xOvPRHRuuzCqmw/+eLmHSYfhG8zczmnKWsncAS7ATm7RiWlRTJQAshejOL6C1FPwFig9fue7
	1MTurdOpZ2dVvpMzmhgHyCGjB+4C2AEl0PmZf/WMAQRmqObplcGDF0ZP0MrMvgU4F8e/xd4Glog
	OkMaPX4jp0RUmIXZLzN+Hd9Me0UYt9kg0xi1LHdT7T0yMlRall64QV06PASIo06RmgxcTE0YzbK
	WBg6jJ3KESY5jNyf0Y4QXChdlgphWeTwDzg9O2/vWJhlzsQalI0W2s9M5hh6FNg==
X-Received: by 2002:a05:6a20:3d11:b0:3a1:76d3:c1b0 with SMTP id adf61e73a8af0-3a7f1cb3fc7mr9308996637.22.1777889000756;
        Mon, 04 May 2026 03:03:20 -0700 (PDT)
X-Received: by 2002:a05:6a20:3d11:b0:3a1:76d3:c1b0 with SMTP id adf61e73a8af0-3a7f1cb3fc7mr9308931637.22.1777889000200;
        Mon, 04 May 2026 03:03:20 -0700 (PDT)
Received: from [10.217.223.121] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7ffbba8fefsm8933909a12.7.2026.05.04.03.03.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2026 03:03:19 -0700 (PDT)
Message-ID: <ab4b5257-92df-4201-ab04-436ab77b2fd8@oss.qualcomm.com>
Date: Mon, 4 May 2026 15:33:06 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/15] firmware: qcom: Add a PAS TEE service
To: Sumit Garg <sumit.garg@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-remoteproc@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, robin.clark@oss.qualcomm.com, sean@poorly.run,
        akhilpo@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, vikash.garodia@oss.qualcomm.com,
        dikshita.agarwal@oss.qualcomm.com, bod@kernel.org, mchehab@kernel.org,
        elder@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
        jjohnson@kernel.org, mathieu.poirier@linaro.org,
        trilokkumar.soni@oss.qualcomm.com, mukesh.ojha@oss.qualcomm.com,
        pavan.kondeti@oss.qualcomm.com, jorge.ramirez@oss.qualcomm.com,
        tonyh@qti.qualcomm.com, vignesh.viswanathan@oss.qualcomm.com,
        srinivas.kandagatla@oss.qualcomm.com,
        amirreza.zarrabi@oss.qualcomm.com, op-tee@lists.trustedfirmware.org,
        apurupa@qti.qualcomm.com, skare@qti.qualcomm.com,
        linux-kernel@vger.kernel.org, Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
References: <20260427095603.1157963-1-sumit.garg@kernel.org>
 <20260427095603.1157963-5-sumit.garg@kernel.org>
Content-Language: en-US
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
In-Reply-To: <20260427095603.1157963-5-sumit.garg@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDEwNSBTYWx0ZWRfX6UX57M6LlctG
 /3tDa/MMvUsJkRHPLGlYN/g/kvMF6a1N6DAY2HSKsTqzukVbmCl2sLLoOjAsRTntTb0uabIQlhg
 A9CujoxWEFa1T1+d5QLCB1Kj6izBjBeg/zUKNb23lyqN6G+ab3tK6WqRWRnU0j2DvBvn1mK5j3o
 w7aQqWTjdcX8xa9kVdVKQLqm8XTeb5w6Qaxy7Ssoa3tHc0zK7/NAGOu60AzYGVnZJq5JNxIzjRG
 HjE/N0EIC4HHNdeB+EyODvG6PtPn3JkNWLIBNUitu9tLZXV383O+mk1yxOtBMrCwVZgAeNkurp3
 EDhyQst5fIVcQ1xTbYmuz5tNebRigkxm1cVoQTufUkGS1Swxj5PB+TwWED0n5aDduyImRmqyRmW
 8WRDmdQ9J7P1JyZFkVdr8eYpLXe/8t5mhIuBvYwYXPaEy2Zdq8zblKiu1tllA2Su9DRzOptGq7S
 cwuyQZWUN93Z6Up0kNw==
X-Proofpoint-GUID: iGNgdBXZyDmrEZqxp2mIxGV7tA9Zf4Ge
X-Authority-Analysis: v=2.4 cv=Ge4nWwXL c=1 sm=1 tr=0 ts=69f86ee9 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=6olnGIjaqZ5DSDVW89IA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-ORIG-GUID: iGNgdBXZyDmrEZqxp2mIxGV7tA9Zf4Ge
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605040105
X-Rspamd-Queue-Id: E1A214BB62A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,lists.infradead.org,kernel.org,oss.qualcomm.com,poorly.run,linux.dev,gmail.com,somainline.org,ffwll.ch,lunn.ch,davemloft.net,google.com,redhat.com,linaro.org,qti.qualcomm.com,lists.trustedfirmware.org];
	TAGGED_FROM(0.00)[bounces-105683-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[49];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[harshal.dev@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,netdev];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Hi Sumit,

On 4/27/2026 3:25 PM, Sumit Garg via OP-TEE wrote:
> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> 
> Add support for Peripheral Authentication Service (PAS) driver based
> on TEE bus with OP-TEE providing the backend PAS service implementation.
> 
> The TEE PAS service ABI is designed to be extensible with additional API
> as PTA_QCOM_PAS_CAPABILITIES. This allows to accommodate any future
> extensions of the PAS service needed while still maintaining backwards
> compatibility.
> 
> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> ---
>  drivers/firmware/qcom/Kconfig        |  10 +
>  drivers/firmware/qcom/Makefile       |   1 +
>  drivers/firmware/qcom/qcom_pas_tee.c | 479 +++++++++++++++++++++++++++
>  3 files changed, 490 insertions(+)
>  create mode 100644 drivers/firmware/qcom/qcom_pas_tee.c

[...]

> diff --git a/drivers/firmware/qcom/qcom_pas_tee.c b/drivers/firmware/qcom/qcom_pas_tee.c

> +static int qcom_pas_tee_mem_setup(struct device *dev, u32 pas_id,
> +				  phys_addr_t addr, phys_addr_t size)
> +{

[...]

> +
> +	ret = tee_client_invoke_func(data->ctx, &inv_arg, param);
> +	if (ret < 0 || inv_arg.ret != 0) {
> +		dev_err(dev, "PAS mem setup failed, pas_id: %d, ret: %d, err: 0x%x\n",
> +			pas_id, ret, inv_arg.ret);
> +		return ret ?: -EINVAL;

Following the example from qcom_scm_pas_mem_setup() here:
https://elixir.bootlin.com/linux/v7.0.1/source/drivers/firmware/qcom/qcom_scm.c#L778

I think it should be:
return ret ?: inv_arg.ret;

This way the client (say mdt_loader) knows what error OPTEE PAS service returned.
I can see that is tries to print this error:
https://elixir.bootlin.com/linux/v7.0.1/source/drivers/soc/qcom/mdt_loader.c#L286

With that,
Reviewed-by: Harshal Dev <harshal.dev@oss.qualcomm.com>

Regards,
Harshal

