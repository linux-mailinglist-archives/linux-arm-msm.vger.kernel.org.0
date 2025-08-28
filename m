Return-Path: <linux-arm-msm+bounces-71106-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 77354B39AFC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Aug 2025 13:05:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D2B7A1C80D5F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Aug 2025 11:05:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 396232F39DD;
	Thu, 28 Aug 2025 11:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jht5DGNm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1147430DD39;
	Thu, 28 Aug 2025 11:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756379122; cv=none; b=Oxa24xbSuqSHUFW/dN8uDDpZePttZKxOOgKQYgJarGmhYXYzUG5wCJjlMug7VGIUSM1KuZrP2jE2CoVtl70H4gi6NLrPQcIoBUN1hWmqwDY2LNjMMjWgSciLGaE6kkARxfOkBjHVKcmESuh6w9cdF5JX1ctl6UU7ATVsFotvd1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756379122; c=relaxed/simple;
	bh=mqeKXy8uMfNWh+NWLomeK5bdnLxYj7mZ0K6eeuy24AE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oPycgqUh1q3uwGrRonr+ziuHGHJxFuK0U3HPFDBsYT2zBuP0D/exNy9Jl92m9pQhC9edsXqmpABJjdwnAKDhBepHUvHC4H97nQM3ZD8HWltCwKB/+jeeJgI8hvwUVskpfgrJa+4A/4Dd4u2OHm/RdXXnPuEnmcUhTaVnrNPseOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jht5DGNm; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756379120; x=1787915120;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mqeKXy8uMfNWh+NWLomeK5bdnLxYj7mZ0K6eeuy24AE=;
  b=Jht5DGNmlEPS6apoJDpVUEQj1mBRguI3RdnJBuvUNhYf82MKUM29J+TR
   GkaZguZeyd27wAZBYjCWJ+7IkxCPkPBa10f86zuyjjhTgdNdR6NNRa9Ua
   1AgQIK/VQoy/7nfPEd1v284p4O/Lr4uqSNIaNhz20XT4MBahrL2N2qYwz
   DuIB/iW81i5+T9MKZnvgILLYa3YbJeLGNdp0QF9kRA7oM/JKW0gvFfVMj
   2mYBWYSKsPSR2jQamqwEHcgLG6fisU5KYFVULPkXXy15S5LI32Afm/0Kc
   bvgjdbzcmqZs4lmMrCHu+PyQOVph39/QI4XoDU+Sc3IYmlFeF4e45oZIh
   g==;
X-CSE-ConnectionGUID: l+DwmFMJRLimNrs8IaJDuw==
X-CSE-MsgGUID: 4k8D1GYDS3Wap/PavrUKRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11535"; a="58575789"
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; 
   d="scan'208";a="58575789"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2025 04:05:18 -0700
X-CSE-ConnectionGUID: D8e8zTdSTIKZnt/blpTSyg==
X-CSE-MsgGUID: L1YI7WELR2eZJAeBG6teIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; 
   d="scan'208";a="207229710"
Received: from kuha.fi.intel.com ([10.237.72.152])
  by orviesa001.jf.intel.com with SMTP; 28 Aug 2025 04:05:14 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Thu, 28 Aug 2025 14:05:13 +0300
Date: Thu, 28 Aug 2025 14:05:13 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
Cc: gregkh@linuxfoundation.org, lumag@kernel.org, neil.armstrong@linaro.org,
	johan+linaro@kernel.org, quic_bjorande@quicinc.com,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 2/2] usb: typec: ucsi_glink: Increase buffer size to
 support UCSI v2
Message-ID: <aLA36Ttc3CawHBIZ@kuha.fi.intel.com>
References: <20250827201241.3111857-1-anjelique.melendez@oss.qualcomm.com>
 <20250827201241.3111857-3-anjelique.melendez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250827201241.3111857-3-anjelique.melendez@oss.qualcomm.com>

On Wed, Aug 27, 2025 at 01:12:41PM -0700, Anjelique Melendez wrote:
> UCSI v2 specification has increased the MSG_IN and MSG_OUT size from
> 16 bytes to 256 bytes each for the message exchange between OPM and PPM
> This makes the total buffer size increase from 48 bytes to 528 bytes.
> Update the buffer size to support this increase.
> 
> Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
> ---
>  drivers/usb/typec/ucsi/ucsi_glink.c | 85 +++++++++++++++++++++++++----
>  1 file changed, 75 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi_glink.c b/drivers/usb/typec/ucsi/ucsi_glink.c
> index 1f9f0d942c1a..fc12569ec520 100644
> --- a/drivers/usb/typec/ucsi/ucsi_glink.c
> +++ b/drivers/usb/typec/ucsi/ucsi_glink.c
> @@ -16,10 +16,10 @@
>  
>  #define PMIC_GLINK_MAX_PORTS		3
>  
> -#define UCSI_BUF_SIZE                   48
> +#define UCSI_BUF_V1_SIZE		(UCSI_MESSAGE_OUT + (UCSI_MESSAGE_OUT - UCSI_MESSAGE_IN))
> +#define UCSI_BUF_V2_SIZE		(UCSIv2_MESSAGE_OUT + (UCSIv2_MESSAGE_OUT - UCSI_MESSAGE_IN))
>  
>  #define MSG_TYPE_REQ_RESP               1
> -#define UCSI_BUF_SIZE                   48
>  
>  #define UC_NOTIFY_RECEIVER_UCSI         0x0
>  #define UC_UCSI_READ_BUF_REQ            0x11
> @@ -32,13 +32,25 @@ struct ucsi_read_buf_req_msg {
>  
>  struct __packed ucsi_read_buf_resp_msg {
>  	struct pmic_glink_hdr   hdr;
> -	u8                      buf[UCSI_BUF_SIZE];
> +	u8                      buf[UCSI_BUF_V1_SIZE];
> +	u32                     ret_code;
> +};
> +
> +struct __packed ucsi_v2_read_buf_resp_msg {
> +	struct pmic_glink_hdr   hdr;
> +	u8                      buf[UCSI_BUF_V2_SIZE];
>  	u32                     ret_code;
>  };

Couldn't you just make a union inside that original struct
ucsi_read_buf_resp_msg?

>  struct __packed ucsi_write_buf_req_msg {
>  	struct pmic_glink_hdr   hdr;
> -	u8                      buf[UCSI_BUF_SIZE];
> +	u8                      buf[UCSI_BUF_V1_SIZE];
> +	u32                     reserved;
> +};
> +
> +struct __packed ucsi_v2_write_buf_req_msg {
> +	struct pmic_glink_hdr   hdr;
> +	u8                      buf[UCSI_BUF_V2_SIZE];
>  	u32                     reserved;
>  };

Ditto for the ucsi_write_buf_req_msg.

> @@ -72,7 +84,7 @@ struct pmic_glink_ucsi {
>  	bool ucsi_registered;
>  	bool pd_running;
>  
> -	u8 read_buf[UCSI_BUF_SIZE];
> +	u8 read_buf[UCSI_BUF_V2_SIZE];
>  };
>  
>  static int pmic_glink_ucsi_read(struct ucsi *__ucsi, unsigned int offset,
> @@ -131,18 +143,34 @@ static int pmic_glink_ucsi_read_message_in(struct ucsi *ucsi, void *val, size_t
>  static int pmic_glink_ucsi_locked_write(struct pmic_glink_ucsi *ucsi, unsigned int offset,
>  					const void *val, size_t val_len)
>  {
> -	struct ucsi_write_buf_req_msg req = {};
> +	struct ucsi_v2_write_buf_req_msg req = {};
> +	size_t len, max_buf_len;
>  	unsigned long left;
>  	int ret;
>  
>  	req.hdr.owner = PMIC_GLINK_OWNER_USBC;
>  	req.hdr.type = MSG_TYPE_REQ_RESP;
>  	req.hdr.opcode = UC_UCSI_WRITE_BUF_REQ;
> +
> +	if (ucsi->ucsi->version >= UCSI_VERSION_2_0) {
> +		max_buf_len = UCSI_BUF_V2_SIZE;
> +		len = sizeof(req);
> +	} else if (ucsi->ucsi->version) {
> +		max_buf_len = UCSI_BUF_V1_SIZE;
> +		len = sizeof(struct ucsi_write_buf_req_msg);
> +	} else {
> +		dev_err(ucsi->dev, "UCSI version not set\n");
> +		return -EINVAL;
> +	}
> +
> +	if (offset + val_len > max_buf_len)
> +		return -EINVAL;
> +
>  	memcpy(&req.buf[offset], val, val_len);
>  
>  	reinit_completion(&ucsi->write_ack);
>  
> -	ret = pmic_glink_send(ucsi->client, &req, sizeof(req));
> +	ret = pmic_glink_send(ucsi->client, &req, len);
>  	if (ret < 0) {
>  		dev_err(ucsi->dev, "failed to send UCSI write request: %d\n", ret);
>  		return ret;
> @@ -216,12 +244,49 @@ static const struct ucsi_operations pmic_glink_ucsi_ops = {
>  
>  static void pmic_glink_ucsi_read_ack(struct pmic_glink_ucsi *ucsi, const void *data, int len)
>  {
> -	const struct ucsi_read_buf_resp_msg *resp = data;
> +	u32 ret_code, buf_len, max_len;
> +	u8 *buf;
> +
> +	if (ucsi->ucsi->version) {
> +		if (ucsi->ucsi->version >= UCSI_VERSION_2_0) {
> +			max_len = sizeof(struct ucsi_v2_read_buf_resp_msg);
> +			buf = ((struct ucsi_v2_read_buf_resp_msg *)data)->buf;
> +			buf_len = UCSI_BUF_V2_SIZE;
> +		} else {
> +			max_len = sizeof(struct ucsi_read_buf_resp_msg);
> +			buf = ((struct ucsi_read_buf_resp_msg *)data)->buf;
> +			buf_len = UCSI_BUF_V1_SIZE;
> +		}
> +	} else if (!ucsi->ucsi->version && !ucsi->ucsi_registered) {

ucsi->ucsi->version will never be set in this else condition,
so no need to check it, no?

> +		/*
> +		 * If UCSI version is not known yet because device is not registered, choose buffer
> +		 * size which best fits incoming data
> +		 */
> +		if (len > sizeof(struct pmic_glink_hdr) + UCSI_BUF_V2_SIZE) {
> +			max_len = sizeof(struct ucsi_v2_read_buf_resp_msg);
> +			buf = ((struct ucsi_v2_read_buf_resp_msg *)data)->buf;
> +			buf_len = UCSI_BUF_V2_SIZE;
> +		} else {
> +			max_len = sizeof(struct ucsi_read_buf_resp_msg);
> +			buf = ((struct ucsi_read_buf_resp_msg *)data)->buf;
> +			buf_len = UCSI_BUF_V1_SIZE;
> +		}
> +	} else {
> +		dev_err(ucsi->dev, "UCSI version not set\n");
> +		return;
> +	}

I don't really see when you could enter that else statement?

> -	if (resp->ret_code)
> +	if (len > max_len)
> +		return;
> +
> +	if (buf_len > len - sizeof(struct pmic_glink_hdr) - sizeof(u32))
> +		buf_len = len - sizeof(struct pmic_glink_hdr) - sizeof(u32);
> +
> +	memcpy(&ret_code, buf + sizeof(struct pmic_glink_hdr) + buf_len, sizeof(u32));
> +	if (ret_code)
>  		return;
>  
> -	memcpy(ucsi->read_buf, resp->buf, UCSI_BUF_SIZE);
> +	memcpy(ucsi->read_buf, buf, buf_len);
>  	complete(&ucsi->read_ack);
>  }

thanks,

-- 
heikki

