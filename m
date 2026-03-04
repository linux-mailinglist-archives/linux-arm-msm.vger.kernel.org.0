Return-Path: <linux-arm-msm+bounces-95452-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OKf3MqKRqGkLvwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95452-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 21:10:10 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 35CEC207730
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 21:10:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0DC45308ADF0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2026 20:08:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75FB638228A;
	Wed,  4 Mar 2026 20:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CaVdoc4e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51054381B10;
	Wed,  4 Mar 2026 20:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772654888; cv=none; b=cwxgKnupk9J50ijF2wjqmoqDxN8yAu6nDrEPi77aE64/3/Rlm7IalzgYEpOWYxOGsjy9rwGVzSVR+zDSeHYdPXoQ06JRDQaKK5CqTdJmwwvYDYsyvZXrbHz9yrzJBwxOPbGNT32dwDSkyEFGkReup09ME/25XD+EnxUsDmggMI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772654888; c=relaxed/simple;
	bh=nGiqiLc054KGccM3xojRAIZOvu5xyDWAq0VFLZeTS3w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gLpKFyKvheO5oatW3jdxPaoiiuq4uCSNOAbR3SFon14fLYCU/e+FyxBBcgCePzYSQmBbhzo/ZMBxTrbwijpoNGh86SxL3x4oi24fA8rPBir9dkaSYuPOPjLQCaOpbFYTqGj5T0a25SREi+WiOIQuM6jwK/KUTIESeVGP8t9xuw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CaVdoc4e; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5797C4CEF7;
	Wed,  4 Mar 2026 20:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772654888;
	bh=nGiqiLc054KGccM3xojRAIZOvu5xyDWAq0VFLZeTS3w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CaVdoc4eQdz4mknS/rJwSGniSFpNFAv+DAKL8hUU+lkvya18UaZKTrm4ovVS2w1Fj
	 FwrNueNzPSw5VXLNBssIXIg6ZMyB1a3lLhCLadm8yUVSE3gNG11Sv8NdV1YR0b7Shm
	 4mfkorvST912E3OblerOj6zwQuQspv36BHnvUMvCfB/13err9xnWG5No2HKjE7OXVq
	 5b6BJD+s/NShiFxNsnyQX1DLF0Wvq6IxkPeUivOedydo2X6tGh6E/iSzHeI+4lvs/v
	 8C0qUw/qjhOduGodxVTTFo2bOGhd1Slm/m0g3J1pHUMNXZGFMocltZHBJx1F+bMYPO
	 P2ieprY3hWrSw==
Date: Wed, 4 Mar 2026 14:07:51 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, 
	Dmitry Baryshkov <lumag@kernel.org>, Chris Lew <quic_clew@quicinc.com>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Gokul Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
Subject: Re: [PATCH v2 1/2] soc: qcom: pd-mapper: Fix element length in
 servreg_loc_pfr_req_ei
Message-ID: <umnu5wui4cwe7udytn7scfgwxfskdy3vykex5hqerzitadpkxl@5wabu3w3amot>
References: <20260202103641.3003867-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260202103641.3003867-1-mukesh.ojha@oss.qualcomm.com>
X-Rspamd-Queue-Id: 35CEC207730
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95452-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email]
X-Rspamd-Action: no action

On Mon, Feb 02, 2026 at 04:06:40PM +0530, Mukesh Ojha wrote:
> It looks element length declared in servreg_loc_pfr_req_ei for reason
> not matching servreg_loc_pfr_req's reason field due which we could
> observe decoding error on PD crash.
> 
>   qmi_decode_string_elem: String len 81 >= Max Len 65
> 
> Fix this by matching with servreg_loc_pfr_req's reason field.
> 
> Cc: stable@vger.kernel.org
> Fixes: 1ebcde047c54 ("soc: qcom: add pd-mapper implementation")
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Co-developed-by: Gokul Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
> Signed-off-by: Gokul Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
> Changes in v2:
>   - Given credit to my colleague Gokul.K who first faced this issue and given
>     initial fix and that was later corrected by me.

If Gokul wrote the patch, please keep him as Author and his
Signed-off-by, then after that you add a line "[mukesh: changed x,y,z]"
followed by your Signed-off-by.

Regards,
Bjorn

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
> -- 
> 2.50.1
> 

