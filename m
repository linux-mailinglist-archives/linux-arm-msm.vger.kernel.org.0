Return-Path: <linux-arm-msm+bounces-117174-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MVQUJJi0TGraoQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117174-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 10:11:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 08892718EF7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 10:11:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=WX88L11J;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=C71z9Y8A;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117174-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117174-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 61498303D133
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 07:58:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 381FA2F8EB0;
	Tue,  7 Jul 2026 07:58:19 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF06B231827
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 07:58:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783411099; cv=none; b=sEhKgpsKrliZlJgbqdBoaREXML/mznadl210xMGMhE7CzjuEKjbCqG2dFLQpx/W0U9hcJdPNN80QERp+/ab5VZ19nn37k/7Uq/Csm5aduloqAwmjzmBAfzqAEjZi6UuFOT4uY2gXBRWUnHjely+cVigaKdF5DCuxqR+8Fqm5mXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783411099; c=relaxed/simple;
	bh=ztXmn+eCrSwh5ZiGnWR957nK0ZjcBtCetG6G6/NB6/M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bKDsAiOy2PeiCrR92DrbsXeq4Rdt34zQwTU66Iqp4+wPH8d6R2rdLS1hipxcV05VQPKS9coqAPJ2rOVDV2ouDfqMpRrI6Gd8IcEDiDYLK4cRkyYPalJP0au3n/pAGTJ3zD7BdXo24Wooq5BfAE+O61eu/4Qke25bYAPcLumeqz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WX88L11J; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C71z9Y8A; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66748o592649207
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 07:58:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IUooB1deojgOvP7ieAkOlre2HwGhobUrInjBUHYU6dk=; b=WX88L11JIeZc7NaH
	5BKM6YKzEwOc6c+K0YOQ7I28JB/jbuDrjo+HknAix/ofnhTWfAby/FzjvJmtEnFm
	m1/xyixlRhiZaWt46TfSTl7naE/SgvKBZbmFXAzdeLgD1pCJTI+BJ+5zgSw9WrOx
	QHfSbjdFbIHyDFhu0PyF3ibFOA0g1XxoDuYeJVrfeyndkPtMpMohSVGua9cLloci
	9yHI7uFl6OJhUn53wHYbJFVMVCE4ynVCvrqXtrCSnQQ/+VvfAktuMbyhuxEWDVL+
	6CCXApAjeJqJB8ZDanwJy9OGuUwIEZqLJkFN5p0BEowEI3BmNBwwdC4DoJNTgpey
	cDh+pg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8fdw3895-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 07:58:17 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c08e9c344so15488831cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 00:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783411096; x=1784015896; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IUooB1deojgOvP7ieAkOlre2HwGhobUrInjBUHYU6dk=;
        b=C71z9Y8A9NNUn3hZTAD5NhHi8Ia6fMymuQB1gFNuzhPJZF3QO0aBZCqXCkrYqyASS3
         /1PzPfggDIct81ApMZEVumDj6FJ4deAMe+sv5uXog6bEqMBGnsL+aS8vyY2uRi3nqixy
         A3FK/MhNeYkTrzymyfzSAZP1D+N6l2rE1jEAeoarMxWizow7I2Sk6rK9kY/+2pcODv/H
         Ev2c2LHQpD7gGhN5hYrcTNJH0ySqlPhwh0GiMANLdeWEwdgeLxJgvKYfI2HcZzat7rnf
         b2A6skV0RJqBEO62cNRnJ382VMQm/Ry5XX8DSwVvSZzzW5blzGAPjpGpGjJ4/8l4wxDp
         YuqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783411096; x=1784015896;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IUooB1deojgOvP7ieAkOlre2HwGhobUrInjBUHYU6dk=;
        b=C5JW21a5B8UGHOcWF6Yq1NIg0xvnxGqivq1Ty5Cp4aXVktJuaWQvWjz7ntWcYjnRF8
         a3GPgrQ0USO8NJIKh8AnekM5RCCpUhlEpifPfnf3jsw2LKys7FnKFhbKPFZ5lfO0Qxg8
         burIumkAqJa8oSSy8yDZNJ0BYsK9xzL0Zigv//QvGSR9BD3VyCV+cvzuxO7ansYEJAta
         jHkZgSq2R/NbV1PwfaiB+XHbzssIyNOmFGADYAek2KIF3wqG2rKOBUB1JUGQehhgnN9T
         K/mE2ZMTJxFdvIayI6n/oSlZUYAlZbZ7eRcqGywoxdl0tAb3eH/Fs3P1Kq+Zx5+acsEh
         kNNQ==
X-Gm-Message-State: AOJu0Yyu0M16+64KjlsLqVZvoSny5mqhrqIjPk1JunpYI6wnOr+ssYbT
	NPn8xbktBGnWDqMSmkAv47+4VvlMU9QPOwfenZdG9F1vC0V543BliIonMsI6xP0lZEKkV3pQ6jY
	gsu9LuvaW1z6g35svvl3O1qLeP5VkG61vXon7CUBuL3TpUfoSlCPNQgddZhDyFFpHSPDl
X-Gm-Gg: AfdE7cmzDCgh0dFkKoB1HijQJ4Ty3q5DAVjH6W8QDyn471DJMxVXsFBKW15IUXVFlti
	d1IAtOF0Xm2fvn2lceuu57+fP6ydDzxkB+A55IrEjJZyVld1+LafQUCS+6UiiI0rwKTRMfXnSPi
	gDkuOwwHGbtBGWj8UioKgWzeH1AOjXLqeEC7+5TnLvhKzQT4gZzCZ7j03ImMNfJg9TUtwizNI0H
	/zvJYidb6NBBDbMTV/OAV2T049zZkIJotn2ITGhVhGR3NOM7+b2i0O1ftiD5WCE97sbQG7Xw/yo
	MaU7O6GgiK6bTldRsfpcQhYd+XPYp/vPZrVTg6JJ/i+kQpzIYjI3QZn0yeJlgei4N2/yC+xRHfv
	nVAVEUIOrgsWXgTgh+cZIGDjYlM6EMR4U+PE=
X-Received: by 2002:a05:622a:38f:b0:51a:8c9b:6494 with SMTP id d75a77b69052e-51c4beeb5e0mr117302861cf.11.1783411096276;
        Tue, 07 Jul 2026 00:58:16 -0700 (PDT)
X-Received: by 2002:a05:622a:38f:b0:51a:8c9b:6494 with SMTP id d75a77b69052e-51c4beeb5e0mr117302721cf.11.1783411095878;
        Tue, 07 Jul 2026 00:58:15 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15ad9bc655sm74024066b.41.2026.07.07.00.58.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 00:58:15 -0700 (PDT)
Message-ID: <45bf13a4-6538-43b0-9563-38178c4d0282@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 09:58:13 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] serial: msm: Disable DMA for kernel console UART
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org, Sam Day <me@samcday.com>
References: <20260706-serial-msm-console-dma-collision-v1-1-3179b8cb1d89@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260706-serial-msm-console-dma-collision-v1-1-3179b8cb1d89@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA3NiBTYWx0ZWRfX7s1nS4UbUajx
 AoM04pZyHx1O8bsFYvZdseq9rqwTq52rop7YRjmErNILblto/GaleF5LzkAewfK7h+Pwo/FAo8H
 4n8raexlGdP+qhWG+1wq9IG/w24QdaU=
X-Proofpoint-ORIG-GUID: nPfttZpaqk8FjEq_ZLUfDvasNI9_C7X1
X-Authority-Analysis: v=2.4 cv=EtziaycA c=1 sm=1 tr=0 ts=6a4cb199 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=K9FbrMKJn3BnTdmCLQ0A:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA3NiBTYWx0ZWRfX/YgW8AO15qG1
 87fKLonc6pwyCLBB2HXNBPGrUY7+EBsiGV6K8Nap0qhUNjGz2K6QmtOazulCakZv5ER7jyZRVc+
 4Lu0ONANuajwQDfnvChEMpnTd7Vs/BycZmd6Bg+GvQiLexiitAy7xLu1X1BldhKRVBUAlh1/vWU
 3fb6oxH/RJeZZbsCbT9WFeJ7TpUNpXWbKGsYOqtKGHlqk/R00nVfMLf4x1BahFONJZQ/kOJbjkc
 4hfu/oikhXDHrD7IGwiZreW15Sto4NayaTOYvt+PExiRXrof9UQuvxDNqiVe2bIFKcEsopbzAjQ
 wp8tQdjmRg5zYSFECXrbU4VlXlm/IRb1L3Juf3DAaB48+9Qc//FHhyKjMKueBAaCZVt1nq3Pnoh
 +zV5ovWup/7932m5aoJmo+xZeHiwU+gi8KHmNyo25ekgRwet2kAHepiMwatU9IAXJWBPY9oX7vN
 opkCMnCh0h+gNGYsTqA==
X-Proofpoint-GUID: nPfttZpaqk8FjEq_ZLUfDvasNI9_C7X1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070076
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-117174-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:stephan.gerhold@linaro.org,m:gregkh@linuxfoundation.org,m:jirislaby@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-serial@vger.kernel.org,m:me@samcday.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,linaro.org:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 08892718EF7

On 7/6/26 8:03 PM, Stephan Gerhold wrote:
> At the moment, concurrent writes from userspace and the kernel to the
> console can trigger a race condition that results in an infinite loop of
> the same messages printed over and over again. This is most likely to
> happen during system startup or shutdown when the init system starts/stops
> a large number of system services that interact with various kernel code.
> 
> When userspace writes to the TTY device, the driver initiates an
> asynchronous DMA transfer and releases the port lock. At the same moment,
> the kernel printk path might grab the port lock and re-configure the UART
> controller for PIO, without waiting for the DMA operation to complete. It
> seems like this collision results in zero progress being reported for the
> DMA engine, so the same text is printed to the console over and over again.
> 
> For the kernel console, we want a reliable output path that will be
> functional even during crashes etc. So rather than implementing complex
> code to synchronize the kernel console write routines with the userspace
> DMA write routines, simply disable DMA for the console UART instance.
> 
> Similar checks exist in many other serial drivers, e.g. 8250_port.c,
> imx.c, sh-sci.c etc.
> 
> Cc: stable@vger.kernel.org
> Fixes: 3a878c430fd6 ("tty: serial: msm: Add TX DMA support")
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

