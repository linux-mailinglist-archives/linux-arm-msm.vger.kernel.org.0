Return-Path: <linux-arm-msm+bounces-96193-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WJtDFC+drmk7GwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96193-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 11:13:03 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B867236D6B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 11:13:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E9E2A30265BB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 10:13:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A2C638BF83;
	Mon,  9 Mar 2026 10:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trvn.ru header.i=@trvn.ru header.b="R0lMHiqQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from box.trvn.ru (box.trvn.ru [45.141.101.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04B2838B7DB;
	Mon,  9 Mar 2026 10:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.141.101.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773051180; cv=none; b=f+xW9V2/sUF/hXeB6LG4GtNgjdZosJfqdeTcIZE/QgX0f7tazXUU1LJ7bdmSSXG095PsMpZxVhhwM8V2IgG9AtRzNuG2oIHq+GoD81Cd/Bg22Oyk4GQ1+2KQAlfCEwCdYv1ryYa8U+ablPFhpFEAK088JEYeLPfk6hpecdglj8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773051180; c=relaxed/simple;
	bh=aBgL8fntJMX5hbiDxhRL/nklQxzOKJ6qOng6M/vmlng=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=bvGXrjP4OHEOgjn0pdUuZemUMrvnQhBTVRXbFP0KdZWau4Fc4/aTFB1BJe953146t/oGfHPYtO0DY6I6LDzqR+lD/kMK00A7H3Rz+oF/rZ61oA3m6p54Z8DzI59dDFTcA6NRtSi1L7lTCrn5Db8233yxxAUO2kflyG9L8tgAy+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trvn.ru; spf=pass smtp.mailfrom=trvn.ru; dkim=pass (2048-bit key) header.d=trvn.ru header.i=@trvn.ru header.b=R0lMHiqQ; arc=none smtp.client-ip=45.141.101.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trvn.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trvn.ru
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=trvn.ru; s=mail;
	t=1773050814; bh=aBgL8fntJMX5hbiDxhRL/nklQxzOKJ6qOng6M/vmlng=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=R0lMHiqQ9Gwc3XX+IXNxU6nwit8Smw8TAM5vcjQ8RhNSTiM6pHwDGo3g/8kCLF3hv
	 D2AG93sEbN3MK+mfK9f9ptx0PUKWE8nXw+azkphQnQxISQkKQR7zJcVrZuf1dfggfk
	 Qp885FwUYeKRa4V1uAsxKmGH8jTFw/g0MmL9zLdNNxbqeDOt0CDsEWsbfNTbRaNeFV
	 jaKCek7Pxa09obdgxDkFy65vwICSh9xMEjKwTHuLfTrAvbMk6BN82dUfx3RXq9v1TS
	 KHXuDYfQIJSEdnfbnK9dCN+UwSArPdArLnnDgu3zzwh63EZIRtH/YCOY/79FRwo6E8
	 qUWurTZCxN96A==
Received: from authenticated-user (box.trvn.ru [45.141.101.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by box.trvn.ru (Postfix) with ESMTPSA id 5931C69EA3;
	Mon,  9 Mar 2026 15:06:54 +0500 (+05)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 09 Mar 2026 15:06:54 +0500
From: Nikita Travkin <nikita@trvn.ru>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
 <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>, Chris Lew
 <quic_clew@quicinc.com>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Gokul Krishnakumar
 <gokul.krishnakumar@oss.qualcomm.com>, stable@vger.kernel.org, Dmitry
 Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v3] soc: qcom: pd-mapper: Fix element length in
 servreg_loc_pfr_req_ei
In-Reply-To: <20260309090151.897685-1-mukesh.ojha@oss.qualcomm.com>
References: <20260309090151.897685-1-mukesh.ojha@oss.qualcomm.com>
Message-ID: <d9ef1fcaf15248f23c19882c8783b3ea@trvn.ru>
X-Sender: nikita@trvn.ru
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 9B867236D6B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[trvn.ru,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[trvn.ru:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[trvn.ru:+];
	TAGGED_FROM(0.00)[bounces-96193-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.920];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nikita@trvn.ru,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email]
X-Rspamd-Action: no action

Mukesh Ojha писал(а) 09.03.2026 14:01:
> From: Gokul Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
> 
> It looks element length declared in servreg_loc_pfr_req_ei for reason
> not matching servreg_loc_pfr_req's reason field due which we could
> observe decoding error on PD crash.
> 
>   qmi_decode_string_elem: String len 81 >= Max Len 65
> 
> Fix this by matching with servreg_loc_pfr_req's reason field.
> 

I've recently encountered same problem when causing a crash of slpi
on my Lenovo thinkpad x13s. This patch seems to fix it.

Before:
  [19146.069830] qmi_decode_string_elem: String len 87 >= Max Len 65
  [19146.069851] failed to decode incoming message
  [19146.085449] qcom_q6v5_pas 2400000.remoteproc: fatal error received: err_qdi.c:1122:EF:sensor_process:0x2:SNS_REG_TASK:0x62:sns_registry_sensor.c:154:sns_registry_sensor.c
  [19146.085462] remoteproc remoteproc0: crash detected in slpi: type fatal error

After:
  [   40.343732] PDM: service 'sensor_process' crash: 'EF:sensor_process:0x2:SNS_REG_TASK:0x62:sns_registry_s'
  [   40.358994] qcom_q6v5_pas 2400000.remoteproc: fatal error received: err_qdi.c:1122:EF:sensor_process:0x2:SNS_REG_TASK:0x62:sns_registry_sensor.c:154:sns_registry_sensor.c
  [   40.359012] remoteproc remoteproc0: crash detected in slpi: type fatal error

(There are two empty lines in dmesg now before the PDM: message, not
sure what writes them)

Tested-by: Nikita Travkin <nikita@trvn.ru>

Thanks!
Nikita

> Cc: stable@vger.kernel.org
> Fixes: 1ebcde047c54 ("soc: qcom: add pd-mapper implementation")
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Gokul Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
> [mukesh: the element length change to the service field is not required.
>  Fixed it by removing the change and rephrasing the commit text.]
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
> Changes in v3: https://lore.kernel.org/lkml/20260202103641.3003867-1-mukesh.ojha@oss.qualcomm.com/
>   - Remove debug patch as we have enough prints to make decode error
>     code.
>   - Added Gokul as the author of the patch and added the information on the 
>     changes done by me on top.
> 
> Changes in v2: https://lore.kernel.org/lkml/20260129152320.3658053-1-mukesh.ojha@oss.qualcomm.com/ 
>   - Given credit to my colleague Gokul.K who first faced this issue and given
>     initial fix and that was later corrected by me.
>   - Rebased it on next-20260130 and added stable mailing list, R-b tag.
> 
> 
>  drivers/soc/qcom/pdr_internal.h | 2 +-
>  drivers/soc/qcom/qcom_pdr_msg.c | 2 +-
>  include/linux/soc/qcom/pdr.h    | 1 +
>  3 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/soc/qcom/pdr_internal.h b/drivers/soc/qcom/pdr_internal.h
> index 039508c1bbf7..047c0160b617 100644
> --- a/drivers/soc/qcom/pdr_internal.h
> +++ b/drivers/soc/qcom/pdr_internal.h
> @@ -84,7 +84,7 @@ struct servreg_set_ack_resp {
>  
>  struct servreg_loc_pfr_req {
>  	char service[SERVREG_NAME_LENGTH + 1];
> -	char reason[257];
> +	char reason[SERVREG_PFR_LENGTH + 1];
>  };
>  
>  struct servreg_loc_pfr_resp {
> diff --git a/drivers/soc/qcom/qcom_pdr_msg.c b/drivers/soc/qcom/qcom_pdr_msg.c
> index ca98932140d8..02022b11ecf0 100644
> --- a/drivers/soc/qcom/qcom_pdr_msg.c
> +++ b/drivers/soc/qcom/qcom_pdr_msg.c
> @@ -325,7 +325,7 @@ const struct qmi_elem_info servreg_loc_pfr_req_ei[] = {
>  	},
>  	{
>  		.data_type = QMI_STRING,
> -		.elem_len = SERVREG_NAME_LENGTH + 1,
> +		.elem_len = SERVREG_PFR_LENGTH + 1,
>  		.elem_size = sizeof(char),
>  		.array_type = VAR_LEN_ARRAY,
>  		.tlv_type = 0x02,
> diff --git a/include/linux/soc/qcom/pdr.h b/include/linux/soc/qcom/pdr.h
> index 83a8ea612e69..2b7691e47c2a 100644
> --- a/include/linux/soc/qcom/pdr.h
> +++ b/include/linux/soc/qcom/pdr.h
> @@ -5,6 +5,7 @@
>  #include <linux/soc/qcom/qmi.h>
>  
>  #define SERVREG_NAME_LENGTH	64
> +#define SERVREG_PFR_LENGTH	256
>  
>  struct pdr_service;
>  struct pdr_handle;

