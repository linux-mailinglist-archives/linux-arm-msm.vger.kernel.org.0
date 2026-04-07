Return-Path: <linux-arm-msm+bounces-102170-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oDaWGjAI1WnMzgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102170-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 15:35:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC373AF3C9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 15:35:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 72BB03048EDC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 13:29:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41F873B7B76;
	Tue,  7 Apr 2026 13:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SokCMcVz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KG5U30IJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDA493B777F
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Apr 2026 13:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775568551; cv=pass; b=L/1QP5visMQ76f0p4rvzfgdABNqIcFo7K08QuuaON3uiqxkqcNMqvDLd929I5B2OIRDDswOkvd+jkXsvZyTRnLIKn2DTMcygR4gKYd6rs2QUDxFMnGRK3pW37u5kIhdB9T4sMKh/5QHeE+axyk5g8QA8ADqwww3YihtuNNFvXNw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775568551; c=relaxed/simple;
	bh=BcJm/j7J+CliB1WdnYBQpW8rRy3FtdgENhaDQZe/XM4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=faO3PcxrA2m0MsFR0k5Qy37DuPe9C4Vsx0L1rTzDVRe5umzKvGbAcku1J8gIlD+N/odCPovOBThSGW5COIbLHOGfrAwGpsvbikxAmdQT1kRZ3f4joMiBQ3CXCpuMdbEBLdUHAM8i0RImkr33JTL1vTepSWwwoX8ELLgany6+6bo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SokCMcVz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KG5U30IJ; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 637Chefd3815666
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Apr 2026 13:29:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sCmGs7ctrprOdk1sqL27pjkK7QfyoEEIqsBDLshQECA=; b=SokCMcVzlZD7bIes
	YfeCIehQO5ZCBOfsXy/rTCEBod+G3yyBok0zrtRFeQmRl+ScEK4EaUNGwySOaKhy
	NxFrb+vcsmUTAvYWQK7Cq2kr1Ka+7YQQZeVmoyfgyugRG+NlKQi8rDlw6/e3YvGj
	C3JkxCz9jicOy7qT1jTiZUEpl2J6JQyJ2r+7k5hXa/iKFOY0dY9ppBGvQoP1uPa0
	To+u/WWojDgvd868bdZUlc1Qt3sXTPBcoYxsy0YbEPv5+RvZJM++djxENv63+TKy
	wlkFifeiOUaAbQio61q46r8uZVWn9LW28ZIB5rh2988ARaXMvNec+HbBdE20XUYQ
	/W6cAw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmr4twr4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 13:29:08 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8a4f18b1b5aso235648766d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 06:29:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775568548; cv=none;
        d=google.com; s=arc-20240605;
        b=U/LuAy760yy84H+g1qMhqi3nnLSI5MeSvaGztfTXfJjOh5qKKwqa2t6HaxruOurVX/
         QHo6JQ1w5siLj4CK7K273XwLxzqN5eppVOqY5ay/rKKWQ9UCBxmKkutIsFZe0eDozotl
         osWjdHQIM25PjWEzEJMKCRt8oPR5/vMVN+wOqKcJIXgiEs3htKJnssn/NApANHbiNXDp
         mGKTc0OIrtDxOC7af5aD7QQ43r5msWa2R19ISQDa8VZv0mH2WJXxVUetsrbBACr2xAZo
         sKXQ7pnAYDIYMyQmxGN8mxr0vMr43CZh/vYRRwoB/w/2jE7tNynnE/FOhdcAxcYz4EGK
         e8/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sCmGs7ctrprOdk1sqL27pjkK7QfyoEEIqsBDLshQECA=;
        fh=cArz9+rD6Y++AChemkY6qGtEIWfTy+3k98OtrD0ETO8=;
        b=dw9y38dkjqFSNcPIv7/l37G3BFEWSmTb+suieVdX5RCsQoiOTzUMVs4utZWNJBv/KJ
         0WaaJmBKLNBCcN4YA96HpnL7HvQ6+BKbfUrU1lP6iz5dLNC4QOouxttfzJcUBJPLRd4p
         a7EKnnEDZ7s+5ZDd68lSM59PtM5tDJ22I9s/41++XSgf4ppVRRt/3KWB2dhV24quqI1a
         2eECQwq0cP9cPLnm39IVd0am1yhxtA2wAO7uiu/FGZyFa3KuBUp0WM2JnOz0sU/GRB5O
         VsiEk+ddEs/Qm5su8FK6AWS+Hi8QR53tDPPlTbtw6JMje6u9v8IADegRZfnDBwzD8HDg
         hfyw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775568548; x=1776173348; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sCmGs7ctrprOdk1sqL27pjkK7QfyoEEIqsBDLshQECA=;
        b=KG5U30IJdwVlidnlGjAVuX6AYSdpO4MR2i0bcRfU4apVp7xwmLp/A3Z5l3DJjEGG7Z
         vnzMmQqdKGuwn8rAq6y7pJjutnwAcUKoMZIZtZSQTcqKD02x5MJh9eNXimZ+R1mTBUiN
         QRkNwVLQiHrEmrex4RDJDjQPgHjil+7tiOPCe7K+evLtvoLffrGZfiMl6r+I964CZONs
         x30ssvkv8cmNdtPUpRLM4Nu2dCnLbxN6xzMTlxiW1zC854fbMM7VYzO1+PTa/dnwuAit
         YxByakFHxrxqOe3QB1mXsqZhsKL4Csc2nhY7aMOHkGzZm4Vor3mDmmregbjLFHvxkNIh
         aDyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775568548; x=1776173348;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sCmGs7ctrprOdk1sqL27pjkK7QfyoEEIqsBDLshQECA=;
        b=ie89O6LMvOkdjXckwJlNmWnb+CDhwgW4Nmtav3QmQcejv30rye30uG9nD20yeIXumo
         PnP5suRXZsF5M5bA8nAQ1FWkaqc5W5ZuNRt05X4UqIViKcIgGJ26gM7HjP4EvCqC3zjb
         XV8Qh0r+avECqPlZ6LftxYH/2xbpfIP1WyDFoVScCn70alBK3dd8UF5OgAL4K2kErtrl
         cb22TvCIlfVc/gMricyL5oOwI6P9qsvH3wAo7EeKg7TE2vULbPXEaIBCeSHUAvYFqxe8
         hQiXUNxmxE7rFBYBJqBd493wC2qjgMyfhfSsN7NTthASLEdfcl+fkDL+bIX/qh7vbpsc
         4yyQ==
X-Forwarded-Encrypted: i=1; AJvYcCXgu4+qrF8kbEG3H3oN4rMAifB9Ag1dT/2FsORW+VriGmMpmH1DIhHEh9TZcqMhcpBQETHHblqCE5nI0Kff@vger.kernel.org
X-Gm-Message-State: AOJu0YzD2wDzyRpy+A1iUYJwSoR25VKNStVpOdb4HotF9PalnvN8k1Ao
	p4ZzWcsWHfo+OBPXX6pNn0xfOMCe0pqu3YJ53vbJISRUUsLiVXgSexdctbmHbw2KLIQaOqlvFlV
	c/mM5iasUeZml5FZjWrww60aGGrhWqiCJ7OeTrBM/6k/ydXJWNSCl0fI84SvRcchCFf2IPsSWZi
	9chMVR64ZfUlJLjNkLGEq+gioVNmQAAhl6T5+XJ8MEG2o=
X-Gm-Gg: AeBDiesCU52tt7wTSpZ9Hb4Na6lu/R4eQV6i1kjsYEJ1HpfglxZggsE9sdx3cDfMV+9
	i5d0Kes/MkT9fZdsm4scRCpZnyqsmvlu5WmMoyRk6EBEBQTJSQWQvTPeSlwobqRONMcwB6Q1eYI
	Pasb4P6xuYFdJKFEE+a56SnWLTyS+4piBbPeUGi84C8n6UJB8f+6TeuWTMxNbZOW2fvzO7kN2PC
	cSVYCg2ggBY6Ct0TywName9Vbp3fizJNgWnaQk=
X-Received: by 2002:a05:6214:268d:b0:89c:8cc8:7c67 with SMTP id 6a1803df08f44-8a703263abemr298031556d6.21.1775568548102;
        Tue, 07 Apr 2026 06:29:08 -0700 (PDT)
X-Received: by 2002:a05:6214:268d:b0:89c:8cc8:7c67 with SMTP id
 6a1803df08f44-8a703263abemr298030536d6.21.1775568547489; Tue, 07 Apr 2026
 06:29:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260407-camss-rdi-fix-v3-0-08f72d1f3442@kernel.org> <20260407-camss-rdi-fix-v3-2-08f72d1f3442@kernel.org>
In-Reply-To: <20260407-camss-rdi-fix-v3-2-08f72d1f3442@kernel.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 15:28:56 +0200
X-Gm-Features: AQROBzCvi31AuG6o9Yo3kQkRLJ7sa_K8RqWTHt0z2GZI2JalzumCEFP6PRlEils
Message-ID: <CAFEp6-2B6GFth40HeAsbs50scv+A7M-z4akDZuy3cO6fUq3=GA@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] media: qcom: camss: Fix RDI streaming for CSID 340
To: bod@kernel.org
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Gjorgji Rosikopulos <quic_grosikop@quicinc.com>,
        Milen Mitkov <quic_mmitkov@quicinc.com>,
        Depeng Shao <quic_depengs@quicinc.com>,
        Yongsheng Li <quic_yon@quicinc.com>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=dO6WXuZb c=1 sm=1 tr=0 ts=69d506a4 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=CoqWzkk-4DnH4hI3KTwA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 0z3sG5KjuLjeAdJ_iDxvveG0_Agdbitc
X-Proofpoint-ORIG-GUID: 0z3sG5KjuLjeAdJ_iDxvveG0_Agdbitc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDEyNiBTYWx0ZWRfX34IWdGYHKktr
 o5hJgFWT5Z/nzbeVXUoXJ5UFpV0oPr4Aoxnnl/w87R2xaX8nQ0CTV61SOQkd0HbNq2BwmEAlQer
 6wQkahxYtESJ+BR3CxUYdSjmJCoZp33fGJ4iEZEcM/4vcyhkcOsTf4QNJnkaR5yAHxcHmvsj4Fg
 /41UosSr9bAoEoXNay8jJJtuaBQz+dtG5s3nF/ziDqbxesW9OVQXh2ImVzfbNc4woqkSm9BHaMi
 IQWPw9p52ef/A3ufzuAvqXvF0iTvlbLyN5aK7cUq5T5ngwZ60JoTUnIpHioEFYXoMgcrclzr8Jl
 Y3jD0zzfDY40r5jMQ5+GOU+gjcfEDOgKP0XwoHmJPQ8C3t5THr+SBOWIPxaq81GapgFWVa0zRyl
 epKx3AvhJx3OJ2BarQkf8aVXqhX+cVWr77onqha4kAsqZvf4EWcVQWF6mQ01rr5EnntYBNv+B1l
 zOhiWF1v0b8eAAELBuw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070126
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102170-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linaro.org,quicinc.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.998];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,cisco];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: CEC373AF3C9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 7, 2026 at 12:35=E2=80=AFPM <bod@kernel.org> wrote:
>
> From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>
> Fix streaming from CSIDn RDI1 and RDI2 to VFEn RDI1 and RDI2. A pattern w=
e
> have replicated throughout CAMSS where we use the VC number to populate
> both the VC fields and port fields of the CSID means that in practice onl=
y
> VC =3D 0 on CSIDn:RDI0 to VFEn:RDI0 works.
>
> Fix that for CSID 340 by separating VC and port. Fix to VC zero as a bugf=
ix
> we will look to properly populate the VC field with follow on patches
> later.
>
> Fixes: f0fc808a466a ("media: qcom: camss: Add CSID 340 support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  drivers/media/platform/qcom/camss/camss-csid-340.c | 18 ++++++++++------=
--
>  1 file changed, 10 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-csid-340.c b/drivers=
/media/platform/qcom/camss/camss-csid-340.c
> index 2b50f9b96a34e..0231985746edf 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid-340.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid-340.c
> @@ -74,9 +74,9 @@ static void __csid_ctrl_rdi(struct csid_device *csid, i=
nt enable, u8 rdi)
>         writel_relaxed(!!enable, csid->base + CSID_RDI_CTRL(rdi));
>  }
>
> -static void __csid_configure_rdi_stream(struct csid_device *csid, u8 ena=
ble, u8 vc)
> +static void __csid_configure_rdi_stream(struct csid_device *csid, u8 ena=
ble, u8 port, u8 vc)
>  {
> -       struct v4l2_mbus_framefmt *input_format =3D &csid->fmt[MSM_CSID_P=
AD_FIRST_SRC + vc];
> +       struct v4l2_mbus_framefmt *input_format =3D &csid->fmt[MSM_CSID_P=
AD_FIRST_SRC + port];
>         const struct csid_format_info *format =3D csid_get_fmt_entry(csid=
->res->formats->formats,
>                                                                    csid->=
res->formats->nformats,
>                                                                    input_=
format->code);
> @@ -88,14 +88,14 @@ static void __csid_configure_rdi_stream(struct csid_d=
evice *csid, u8 enable, u8
>          * the four least significant bits of the five bit VC
>          * bitfield to generate an internal CID value.
>          *
> -        * CSID_RDI_CFG0(vc)
> +        * CSID_RDI_CFG0(port)
>          * DT_ID : 28:27
>          * VC    : 26:22
>          * DT    : 21:16
>          *
>          * CID   : VC 3:0 << 2 | DT_ID 1:0
>          */
> -       dt_id =3D vc & 0x03;
> +       dt_id =3D port & 0x03;
>
>         val =3D CSID_RDI_CFG0_DECODE_FORMAT_NOP; /* only for RDI path */
>         val |=3D FIELD_PREP(CSID_RDI_CFG0_DT_MASK, format->data_type);
> @@ -105,10 +105,11 @@ static void __csid_configure_rdi_stream(struct csid=
_device *csid, u8 enable, u8
>         if (enable)
>                 val |=3D CSID_RDI_CFG0_ENABLE;
>
> -       dev_dbg(csid->camss->dev, "CSID%u: Stream %s (dt:0x%x vc=3D%u)\n"=
,
> -               csid->id, enable ? "enable" : "disable", format->data_typ=
e, vc);
> +       dev_dbg(csid->camss->dev, "CSID%u: Stream %s (dt:0x%x port=3D%u v=
c=3D%u)\n",
> +               csid->id, enable ? "enable" : "disable", format->data_typ=
e,
> +               port, vc);
>
> -       writel_relaxed(val, csid->base + CSID_RDI_CFG0(vc));
> +       writel_relaxed(val, csid->base + CSID_RDI_CFG0(port));
>  }
>
>  static void csid_configure_stream(struct csid_device *csid, u8 enable)
> @@ -117,9 +118,10 @@ static void csid_configure_stream(struct csid_device=
 *csid, u8 enable)
>
>         __csid_configure_rx(csid, &csid->phy);
>
> +       /* Loop through all enabled ports and configure a stream for each=
 */
>         for (i =3D 0; i < MSM_CSID_MAX_SRC_STREAMS; i++) {
>                 if (csid->phy.en_vc & BIT(i)) {
> -                       __csid_configure_rdi_stream(csid, enable, i);
> +                       __csid_configure_rdi_stream(csid, enable, i, 0);
>                         __csid_ctrl_rdi(csid, enable, i);
>                 }
>         }
>
> --
> 2.52.0
>

