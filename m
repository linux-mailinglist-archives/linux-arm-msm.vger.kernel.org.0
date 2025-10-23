Return-Path: <linux-arm-msm+bounces-78552-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE1A0C00B23
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 13:23:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 145043AB259
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 11:22:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD3F530DD19;
	Thu, 23 Oct 2025 11:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LH3cLck/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81BA02D948F;
	Thu, 23 Oct 2025 11:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761218523; cv=none; b=XRQS1E8Aeh9l4vVBgaM7CRBnuehbgSUb4zOmMQkBmj5gPwZpHWSY+EJA3BCsjvABnuFYIcFj2sL0g1MJfAE2G8eGEdHl4R8xM/Xe5/v+ruQCezt5ls69631gMLgbrVTMyx6Jr8p3rFvzimDJ1QN7I64m47j9IlX5zSs3uBVfEUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761218523; c=relaxed/simple;
	bh=OUy4E28XCgPHiY7sYnSVPuAqVISc/0/PFyS3hREWRSQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L77bSFcCxoIM5ir/1frgAB/ley4mCFYEqalVZ60r/B91GCBgVvDA2uPr0gSZjPXhQvhvR6kw3slqiEklJEY6xGwnpzk8u2ZlV4AYO0GSIJdgUqE469eZJknfA1lHWf3h0jg+ZRZWEOEXDwr3AYHYi2+QSy7HvSdTC4HpAW8uU4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LH3cLck/; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761218521; x=1792754521;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OUy4E28XCgPHiY7sYnSVPuAqVISc/0/PFyS3hREWRSQ=;
  b=LH3cLck/fuVEI40gVW6hni5h7v8CLDcN6ZlwPQPWLF9+mglZd4KpCja0
   ugSIdIZY7QFxbWvYHKwCPk5Ev09wC/OAScT5IgvkYQqvqPDQDJLfEERYE
   63F487ij4t4t1I1RJonU+XKHcq9AukH/0TDM+VyV5vwtbYPRzhZia08qw
   mN1HFrHUJ7+q48DpO1bNukiFFdTv6Zl1nvE2Kb/2UE8PDU6izO+e4lmpB
   tmWy7GnKaEZMEK2ANMFMLTbIATmlABWIAeT42lPcg2mPrhMSAn6ZXxJc1
   uBElllWQGWTezoOG4sDM6OLijYDeMhha0Oe7PkEaRBh67Qhdkxcp1ASqp
   Q==;
X-CSE-ConnectionGUID: IYPIS9z5SPOWBr+H3azAoQ==
X-CSE-MsgGUID: wlgsGVqHTxa0l/59UITfow==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="80820963"
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; 
   d="scan'208";a="80820963"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2025 04:22:00 -0700
X-CSE-ConnectionGUID: 91ur0G2oTPauN3FANFRShg==
X-CSE-MsgGUID: Urm2SPsSR/2BhTbktE4OLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; 
   d="scan'208";a="183306763"
Received: from bkammerd-mobl.amr.corp.intel.com (HELO kuha.fi.intel.com) ([10.124.221.165])
  by orviesa006.jf.intel.com with SMTP; 23 Oct 2025 04:21:56 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Thu, 23 Oct 2025 14:21:55 +0300
Date: Thu, 23 Oct 2025 14:21:55 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
Cc: gregkh@linuxfoundation.org, lumag@kernel.org, neil.armstrong@linaro.org,
	johan+linaro@kernel.org, quic_bjorande@quicinc.com,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v6 2/2] usb: typec: ucsi_glink: Increase buffer size to
 support UCSI v2
Message-ID: <aPoP00G_xekNF-XP@kuha.fi.intel.com>
References: <20251022004554.1956729-1-anjelique.melendez@oss.qualcomm.com>
 <20251022004554.1956729-3-anjelique.melendez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251022004554.1956729-3-anjelique.melendez@oss.qualcomm.com>

On Tue, Oct 21, 2025 at 05:45:54PM -0700, Anjelique Melendez wrote:
> UCSI v2 specification has increased the MSG_IN and MSG_OUT size from
> 16 bytes to 256 bytes each for the message exchange between OPM and PPM
> This makes the total buffer size increase from 48 bytes to 528 bytes.
> Update the buffer size to support this increase.
> 
> Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/ucsi/ucsi_glink.c | 80 +++++++++++++++++++++++++----
>  1 file changed, 70 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi_glink.c b/drivers/usb/typec/ucsi/ucsi_glink.c
> index 1f9f0d942c1a..11b3e24e34e2 100644
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
> @@ -32,13 +32,19 @@ struct ucsi_read_buf_req_msg {
>  
>  struct __packed ucsi_read_buf_resp_msg {
>  	struct pmic_glink_hdr   hdr;
> -	u8                      buf[UCSI_BUF_SIZE];
> +	union {
> +		u8 v2_buf[UCSI_BUF_V2_SIZE];
> +		u8 v1_buf[UCSI_BUF_V1_SIZE];
> +	} buf;
>  	u32                     ret_code;
>  };
>  
>  struct __packed ucsi_write_buf_req_msg {
>  	struct pmic_glink_hdr   hdr;
> -	u8                      buf[UCSI_BUF_SIZE];
> +	union {
> +		u8 v2_buf[UCSI_BUF_V2_SIZE];
> +		u8 v1_buf[UCSI_BUF_V1_SIZE];
> +	} buf;
>  	u32                     reserved;
>  };
>  
> @@ -72,7 +78,7 @@ struct pmic_glink_ucsi {
>  	bool ucsi_registered;
>  	bool pd_running;
>  
> -	u8 read_buf[UCSI_BUF_SIZE];
> +	u8 read_buf[UCSI_BUF_V2_SIZE];
>  };
>  
>  static int pmic_glink_ucsi_read(struct ucsi *__ucsi, unsigned int offset,
> @@ -132,17 +138,35 @@ static int pmic_glink_ucsi_locked_write(struct pmic_glink_ucsi *ucsi, unsigned i
>  					const void *val, size_t val_len)
>  {
>  	struct ucsi_write_buf_req_msg req = {};
> +	size_t req_len, buf_len;
>  	unsigned long left;
>  	int ret;
> +	u8 *buf;
>  
>  	req.hdr.owner = PMIC_GLINK_OWNER_USBC;
>  	req.hdr.type = MSG_TYPE_REQ_RESP;
>  	req.hdr.opcode = UC_UCSI_WRITE_BUF_REQ;
> -	memcpy(&req.buf[offset], val, val_len);
> +
> +	if (ucsi->ucsi->version >= UCSI_VERSION_2_0) {
> +		buf_len = UCSI_BUF_V2_SIZE;
> +		buf = req.buf.v2_buf;
> +	} else if (ucsi->ucsi->version) {
> +		buf_len = UCSI_BUF_V1_SIZE;
> +		buf = req.buf.v1_buf;
> +	} else {
> +		dev_err(ucsi->dev, "UCSI version unknown\n");
> +		return -EINVAL;
> +	}
> +	req_len = sizeof(struct pmic_glink_hdr) + buf_len + sizeof(u32);
> +
> +	if (offset + val_len > buf_len)
> +		return -EINVAL;
> +
> +	memcpy(&buf[offset], val, val_len);
>  
>  	reinit_completion(&ucsi->write_ack);
>  
> -	ret = pmic_glink_send(ucsi->client, &req, sizeof(req));
> +	ret = pmic_glink_send(ucsi->client, &req, req_len);
>  	if (ret < 0) {
>  		dev_err(ucsi->dev, "failed to send UCSI write request: %d\n", ret);
>  		return ret;
> @@ -216,12 +240,48 @@ static const struct ucsi_operations pmic_glink_ucsi_ops = {
>  
>  static void pmic_glink_ucsi_read_ack(struct pmic_glink_ucsi *ucsi, const void *data, int len)
>  {
> -	const struct ucsi_read_buf_resp_msg *resp = data;
> +	u32 ret_code, resp_len, buf_len = 0;
> +	u8 *buf;
> +
> +	if (ucsi->ucsi->version) {
> +		if (ucsi->ucsi->version >= UCSI_VERSION_2_0) {
> +			buf = ((struct ucsi_read_buf_resp_msg *)data)->buf.v2_buf;
> +			buf_len = UCSI_BUF_V2_SIZE;
> +		} else {
> +			buf = ((struct ucsi_read_buf_resp_msg *)data)->buf.v1_buf;
> +			buf_len = UCSI_BUF_V1_SIZE;
> +		}
> +	} else if (!ucsi->ucsi_registered) {
> +		/*
> +		 * If UCSI version is not known yet because device is not registered, choose buffer
> +		 * size which best fits incoming data
> +		 */
> +		if (len > sizeof(struct pmic_glink_hdr) + UCSI_BUF_V2_SIZE) {
> +			buf = ((struct ucsi_read_buf_resp_msg *)data)->buf.v2_buf;
> +			buf_len = UCSI_BUF_V2_SIZE;
> +		} else {
> +			buf = ((struct ucsi_read_buf_resp_msg *)data)->buf.v1_buf;
> +			buf_len = UCSI_BUF_V1_SIZE;
> +		}
> +	} else {
> +		dev_err(ucsi->dev, "Device has been registered but UCSI version is still unknown\n");
> +		return;
> +	}
>  
> -	if (resp->ret_code)
> +	resp_len = sizeof(struct pmic_glink_hdr) + buf_len + sizeof(u32);
> +
> +	if (len > resp_len)
> +		return;
> +
> +	/* Ensure that buffer_len leaves space for ret_code to be read back from memory */
> +	if (buf_len > len - sizeof(struct pmic_glink_hdr) - sizeof(u32))
> +		buf_len = len - sizeof(struct pmic_glink_hdr) - sizeof(u32);
> +
> +	memcpy(&ret_code, buf + buf_len, sizeof(u32));
> +	if (ret_code)
>  		return;
>  
> -	memcpy(ucsi->read_buf, resp->buf, UCSI_BUF_SIZE);
> +	memcpy(ucsi->read_buf, buf, buf_len);
>  	complete(&ucsi->read_ack);
>  }
>  
> -- 
> 2.34.1

-- 
heikki

