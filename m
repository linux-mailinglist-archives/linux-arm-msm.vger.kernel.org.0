Return-Path: <linux-arm-msm+bounces-99466-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CDPuMD3bwWmJXQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99466-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 01:30:53 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4004C2FFAF0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 01:30:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4F7E130193AA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 00:24:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FFA32343BE;
	Tue, 24 Mar 2026 00:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a3rYBy64";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d1AEn4w7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 353972046BA
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 00:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774311875; cv=none; b=D9y6OQqYRbtKp0A8hcaTfi6MRju14bMxG6rP7Ot5duo+fmsH/ftCacrmjL+0hUIM6/+5RWX1rUIRlxkFyg8gLAsy7QNAla1ircDD/9Ma1kQd5zCaotPkALLI0EQ3VyN98SR2g3R/cv524Lwjo9Vamo+Wwc9bINhP4QugWOmR+LM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774311875; c=relaxed/simple;
	bh=YK5TERRY/+6D57JFkiBOR0WLZXHTALD8xXQfc9Im0nk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O55ps+YCh4mq6tHKb3toMxjnoOpDAQTAD+09hl3VyGhdgL0Bzu4qynVpHRYk4jojMMyRFVSPP8Id3zHaJ/vqnIVzhmOHi4PNlpGuO7rP0OrwEYpfzeLydylwyiL8ULgHpM7GV+vaorgcAl8aLbpPAZBplGg9Ni8ER5iSDmVofs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a3rYBy64; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d1AEn4w7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NHqi9i2681188
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 00:24:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wdOq8v7gZj+Ol/lCA+UFTS9F
	QjpcXEmDJN9gqTOKAck=; b=a3rYBy64Vr8kYgpwtrvml2XWCy0dQtQF5Te+uFGO
	BNy+2ulYf4oG0521V8UIEm+sBUoCf5QaVpQf/coDwvmmCsYNR+osn40mHey9yGOg
	v0InnNngBsSMZ0hbZmYaDonAzGUot4sK79eloWBGGiZL/Ag6T+Lyxr/WnoMPb+MU
	Igc5hs1H0xZBu7mpw+71xkyUThpWAjY+yJBwBbQJA9MBWE4kjXtL0AEk0jEu6ChI
	XHgh8sAg9EYW3kDn5s8IYhZwG6G+pFpkFPKRqhDocHH4BdK/6jfW9hSq6K82nhSI
	B0Mkjus8Bw2rx3xiQ19trQzkNmuLfECJZwrXS4eDHEpiWA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d31p7b7r6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 00:24:33 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b44f7b7bbso244902521cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 17:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774311873; x=1774916673; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wdOq8v7gZj+Ol/lCA+UFTS9FQjpcXEmDJN9gqTOKAck=;
        b=d1AEn4w7xyvgwvUgPqAlTtGzXOWDGn5RUSjwg3fNrv6jfRWJJFgRn44Wt8sCub636O
         9rgFKvwjnzHeKZdHC1dMZpY+FW3Yueo+qtkFb0bSr4Hy4fuMzPG8IOU+vR7cq2o+UXKV
         V83PinWFkqEJhoM88rqc7GhHSarXbYIU5oWkvQFTdOOrTdvYd6twCntMsLs5JgqRnVT+
         K1FSWKRuydI4uqpFdQbfpGwsNlFTu/owvc5WP0Vygxa+fpcuBQf9DinmHyWYXlvRXPyg
         wxSwsUPkW7pAh3Xwrrtcca7mou18sGDmMs3fzNe5vfX7z5NeEeOF5vjk7aNi9+P8raTA
         +BEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774311873; x=1774916673;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wdOq8v7gZj+Ol/lCA+UFTS9FQjpcXEmDJN9gqTOKAck=;
        b=KYtktrDG2piwyJTiO4L55uRGJetrMmQvWIW0X9hK0tDdmpZF04CaWPufRYNev0MUah
         yNs5Ws9nLyQLHF+QZIBvksmA1V9fpyzaiu4qBL6/TLNRSJzVlRaS5wMvT+xACJAlSu+t
         ZNNFxKM+kxN3Ew+Xb2UEjgJbg1aTHW9Ir+bRp4d8tLJ3ysdoIIiUSp0Ln/Qrgmf/B9/O
         8/sS/cjRUjCadCT75Sp1l8FjQeyiHClE06z2jgNSEwPa1kfmQ4VCWLwCQbI5/ZNLRCRp
         /v7POuWZ3xyFLdWgqQLBnTeSpIfbo8b2zN3evXzbguTVSgJRa3KqhX3irNNWV+L9CGs8
         RdmQ==
X-Forwarded-Encrypted: i=1; AJvYcCXg15AWWgMBIZ9Pe5afVUuRfNhkWzRHsrREHwyAcTEv8ODFfARfDtFt71XhR33YAF2pp81QsCV18e8gjVAa@vger.kernel.org
X-Gm-Message-State: AOJu0Ywo7Jd0IGuIpwO7piLUnP7fkTXkHBb6SVfYPyf1TdI70FM9pSfX
	s4ruy4DYKV9Bdvk7/CT2zF1ui6jxk0yKKBfC9Qx2RyBE9YLTDkSHBs6OAfZ4bqQySh4jEnpwGvo
	uccSTa8cNghYcXoh9kxOFhgs/tfal+G/MQtqsMxjo3JF3Jcgwla++M1GOdCXcsbGN9rjE
X-Gm-Gg: ATEYQzzLKl17KNQ1CYS96uvhwYCwqwM8A9EyH7OVS8r/GKVvs2aABVGUSPQ/YEWQwv2
	DNZ7amhkjUDxr7Bi8up+mxnpJl+kd9a1o9JUwgld6uXu2XYnxME8mq8IrnyXxKdMLBlqP519Oea
	zYPGGhkFg6THJPuQZnxPPQpBjtEZCZODyZYdXzvZUUip8jWKuduTbbW5MZWIkcC1NRneyZpu67m
	OMC0JDxVa/sSkEvy0hbtOZ9p960U1XZlicZJhP4LMv16CJ2c816MRa6BdKPqGIg+2ZY7wxWzFTc
	2zVaChEvt+Her49aEdh9/SiguHcn6A6Z0SKEnqV9H+AMFy6EKGA/au8MU4pC7y0Q94zEfTD/ziA
	0m6P+4Nw6Ta4hcWJv7t/cK6/+/4Vkyf65gFADX36RpWsOJtAxaYyCCCcffVZGWYUA6tECtogP4v
	iHqXBD+TyNXYL7cGtNiutFx9CPl379+4eDCX0=
X-Received: by 2002:a05:622a:2c1:b0:509:1568:1f16 with SMTP id d75a77b69052e-50b375d4d49mr218509851cf.71.1774311872739;
        Mon, 23 Mar 2026 17:24:32 -0700 (PDT)
X-Received: by 2002:a05:622a:2c1:b0:509:1568:1f16 with SMTP id d75a77b69052e-50b375d4d49mr218509601cf.71.1774311872295;
        Mon, 23 Mar 2026 17:24:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a288268a0bsm2576503e87.14.2026.03.23.17.24.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 17:24:29 -0700 (PDT)
Date: Tue, 24 Mar 2026 02:24:26 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Anas Iqbal <mohd.abd.6602@gmail.com>
Cc: srini@kernel.org, gregkh@linuxfoundation.org, vkoul@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] slimbus: qcom-ngd: fix NULL pointer dereference in
 qcom_slim_ngd_xfer_msg()
Message-ID: <5cen2dct54ghqzijo7xlrw7zgdwjjihou2jion2mld7k5kxvnq@xp6723adi4ik>
References: <20260322124647.4246-1-mohd.abd.6602@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260322124647.4246-1-mohd.abd.6602@gmail.com>
X-Authority-Analysis: v=2.4 cv=RMC+3oi+ c=1 sm=1 tr=0 ts=69c1d9c1 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=pGLkceISAAAA:8
 a=3qz8hwSWqZ05hJhTaTIA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: Q_LvnT8cdfTX6JTO7TVxb8eUGVtetEss
X-Proofpoint-GUID: Q_LvnT8cdfTX6JTO7TVxb8eUGVtetEss
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDAwMSBTYWx0ZWRfX4YPrUnuqMp3B
 kZ2sNrJO3bdkJol1c/+ZRQr8jvM26+UBOvjWDiDXaRSxGv7FbhSkbwxkCVjzcWu1vHUvJ8C48NA
 rJ5sdZQxFLp5Po5AAj3RGEEqGuEmw0NtzbvOkwutOHJki4yGqGZOuulVl0vcBaKhqL5yjjsJA/g
 czOArThsvZN7IKEZhtK7Npr26E2ztzTZuoSm2N1uhTt6BH//vIqxrjbRrRcvROeITsqmisL0zIx
 CjcdgAPnnyhkgxxC0dHXTMuCVV5SEHGBGjAgBIM6yVkIj30QtdLcyvl2oiqMMUd9Fzudyc9C00t
 eq8gnEuEOheyKOjgAw+/ArPG4anTP29VFxkCT1zystEOEGs7nlF5tDr1ZGGw2p+6H5pgEUc4xhg
 ShHbTiOO7cvWvbpp2kph61/YUtpWzxR7r6IrsvSyT+NMt7r0qgnBgXqsuF3nKT36Xp5Y6yzT6e4
 /D/XB0489kn/KW7ClUw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_07,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240001
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99466-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4004C2FFAF0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Mar 22, 2026 at 12:46:47PM +0000, Anas Iqbal wrote:
> txn->msg is dereferenced without a prior NULL check in
> qcom_slim_ngd_xfer_msg(), which may lead to a NULL pointer
> dereference.
> 
> Although current callers initialize txn->msg, add a defensive
> check to prevent potential crashes if a NULL pointer is passed.

Defensive coding is generally not appreciated in the kernel. 

> 
> Fixes: 917809e2280bb ("slimbus: ngd: Add qcom SLIMBus NGD driver")
> Signed-off-by: Anas Iqbal <mohd.abd.6602@gmail.com>
> ---
>  drivers/slimbus/qcom-ngd-ctrl.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
> index 9aa7218b4e8d..241f5e08b582 100644
> --- a/drivers/slimbus/qcom-ngd-ctrl.c
> +++ b/drivers/slimbus/qcom-ngd-ctrl.c
> @@ -805,6 +805,9 @@ static int qcom_slim_ngd_xfer_msg(struct slim_controller *sctrl,
>  	if (txn->dt == SLIM_MSG_DEST_ENUMADDR)
>  		return -EPROTONOSUPPORT;
>  
> +	if (!txn->msg)
> +		return -EINVAL;
> +
>  	if (txn->msg->num_bytes > SLIM_MSGQ_BUF_LEN ||
>  			txn->rl > SLIM_MSGQ_BUF_LEN) {
>  		dev_err(ctrl->dev, "msg exceeds HW limit\n");
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry

