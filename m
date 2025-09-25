Return-Path: <linux-arm-msm+bounces-75207-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1855BBA1A77
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 23:46:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 32274188A597
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 21:46:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5BF7323F57;
	Thu, 25 Sep 2025 21:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X8S0NUKZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC40332340E
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 21:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758836641; cv=none; b=j4UL9Yn3f8GYkCEqzFSgGDy5us9Dq3tT7a9QeQTv3PUDlFDMW0myVyEZ3E+fdJHCT7WTSdCMsMCadBbTtB4KCsPqeIGKson0/sf5jxumejBglD94z6URi5lwkZqxzCGpJmjaNfSN95BDqY57x/dAEcfun6/XfJaiOmjouybYLP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758836641; c=relaxed/simple;
	bh=k4GsBLIueNm1p2m6nOEdppg4lCcwt5Wac66Va2aS7RE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HoccUdBoa2hDxVO1OOO6jGx1UtFjByFpA4h4yVYCOMkCx+b5pqND93Qk2M6YGWuVRej57wmfwaz5IgIO11GO5cGP/DRvivImBJ+WEuxZC9WghEm8XHxlrHjepUA+050/FB7HjEonIpjuNhZ76dNzgQUM5k/dT1hX41+Ze25ZZO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X8S0NUKZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58PIPo85021675
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 21:43:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yfBWrlDRkP9t2hl5/olMt1ZH
	Hf9C2kMP7k9geBdbKGU=; b=X8S0NUKZJKUEFFgvSCjObCXKZKIFq0fBXj2KQhQc
	49/zZCuL/+ODRzjv68MpfQv1Wv9ApVl8u3YKeQGFFEuGXvkn0Ei45XaoURfUC6Sj
	jA1+1p0WKhGjYZ6RIYO7pIiFP6QUgcm0Do8UgKnyiE7SRRhB6Km8WP/u1y0kz+p1
	rRKPum1vldnE8yL+Ep87+XogyPloAywyvZHPAxJ4bAbx9t5Nn8BQ+8VRRhni2aPP
	vNXXFZvfdWjfqZat/j1JO49r89olF6Hxm3waCczyu3lvVz5GJ4lrmAlNtlZ7/i7t
	R6LHEzDEoZ0AYrkjwVzRxrmURd4Rdo6UUG+bZEUoRY5zwg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0qrfwf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 21:43:58 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b5d58d226cso36765661cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 14:43:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758836637; x=1759441437;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yfBWrlDRkP9t2hl5/olMt1ZHHf9C2kMP7k9geBdbKGU=;
        b=AMk8yjPOghnylKfyjvO3KZS1MpA6LNhkUxRXkucN5ls7FROumFv73/okygUf3h7VKv
         DYCxEMzAFJ3+n4eq03oBPLK/ok7mypwt1OG5ODN7Qh9ErKKj9FhSMK7kBR4rGi6mBLTB
         8Q8oDPPBtW0drQoTdldZjBuztuGmLOaMYySKbCkF5+DWw/FYe/ythAeMx8oNAiQnAuzQ
         JbsqbQbvg71gNq48zRmNta4M00jS+WbMcVlKdoA4xI7XVTI2j8RlUaObF2QC9dHDDuuS
         N7J85dNoAYg5u3aywkjufsQSrSuTeOriyIVXzqdi8eN4mK+nrPssT3cu3F2hGE/OEkWF
         3WRw==
X-Forwarded-Encrypted: i=1; AJvYcCWB27wUUkNcrXFzSJXCyT5AnFFwZoOePlNOZyqwQc6LoSZ326smCsHopSSkDURY29FGj4voDnM5GsCzbHOW@vger.kernel.org
X-Gm-Message-State: AOJu0YwGJ643l5BUgGgHs+LeZMvZoItQSz72Op0pKUUaDmzBTHVUlq5Q
	vWuOukbblBcaoFNI5AzHHMU9vTAKlXBsva5EirDv2CegBCmaqRzQVEOYcnlhphV5ataumSQNLi5
	aNQK1M2bdkjfIBHzvLzuQuU/lgdUSn8L6ApeK77E33upj58I3upPJ2dyzCihUpnCL5JzlcotmXQ
	Hw
X-Gm-Gg: ASbGncs/c0GzaB+DbzdqFT82AHmi0zs6yEfMlkn4QosNbuI+on9sNCjcxC5YiVDueU0
	YO9WPNxbdhxTISyfXVO078HRllyn7+qquN+q/S7Oef6omFoIHoGt+ytmIB6trnvJibuU+K7DSju
	YBvUIwblo2PB/tfjreXzq7tILwdggXa8O2d9L63nbFvKvARmOjxgqSAgdvI36H4uLYT+OCC+uor
	ZQWzmJtMmA9YeknxV8G6VUE4TopBu/0A6aw2wjRWiovG8CDFXUd3xnCpKARirVidsoRebuQPj/6
	LWP0Yn7n1P6omQmLRqP+y5OD/sJbON3zXv1GyxVhE4WeaI1X86JCyV/MMFF5XML3BMS8BRFd+eH
	UKJcKbHQXo645YZleujI8er1yR3I/P61M0I0XMMfACUPvPYvaQys3
X-Received: by 2002:a05:622a:4013:b0:4b4:9522:67a with SMTP id d75a77b69052e-4da48b8c9e7mr67878921cf.33.1758836636849;
        Thu, 25 Sep 2025 14:43:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG5Ks4ZFu9wxVK2/DfMG5pfEbTJRI9Il6saFQFftRQK8PqfKWLcYEXz1KrDO0TEPuOD6/iiQw==
X-Received: by 2002:a05:622a:4013:b0:4b4:9522:67a with SMTP id d75a77b69052e-4da48b8c9e7mr67878521cf.33.1758836636311;
        Thu, 25 Sep 2025 14:43:56 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-36fb4e38b04sm8176191fa.15.2025.09.25.14.43.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 14:43:54 -0700 (PDT)
Date: Fri, 26 Sep 2025 00:43:51 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
Cc: heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
        lumag@kernel.org, neil.armstrong@linaro.org, johan+linaro@kernel.org,
        quic_bjorande@quicinc.com, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v4 2/2] usb: typec: ucsi_glink: Increase buffer size to
 support UCSI v2
Message-ID: <t3hfr33t76ckecatro5gheycb2phnch57m6zzdpm44ibykbubd@e6nffasyetib>
References: <20250924232631.644234-1-anjelique.melendez@oss.qualcomm.com>
 <20250924232631.644234-3-anjelique.melendez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250924232631.644234-3-anjelique.melendez@oss.qualcomm.com>
X-Proofpoint-GUID: 8NJkFHaTE60YKB5ttxdh7imO9DHPRT1f
X-Proofpoint-ORIG-GUID: 8NJkFHaTE60YKB5ttxdh7imO9DHPRT1f
X-Authority-Analysis: v=2.4 cv=api/yCZV c=1 sm=1 tr=0 ts=68d5b79e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=9NeV5C6gA5lNjDPYUkgA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfXxvo3U91PECiS
 p8bkHbGA+TvQwz9SefzVk4LYuMNPpRizU+P0rFDAsqo5coXdMzIzpZDEcLPQxGguoNsM+yttgfH
 tHC/rQ8GyK0Zjn2gvltqpDBFLglhZLjk14TA+D24e+K2KLW7719S/3JPpTA9oO8lRYTwSFJ2EWp
 0hBmY7XMGS51xCVNU2yWEIxLW3JJI+lJ5U82TsTtdpbDU4lbJVIPsc1jd8My96dAP3crQkEexUL
 OfCCEUi+nlffvZNKunUVrcXBHbY7rRdyaR3fBP1zix3BWQAGLz8OQ0/tORE1/Y1wGn01TcyieYv
 kZ+5xnHQG7B1V67InIVLoAK4TsAxal0SyqSohOmvVwJ6EOif8Kk70Isa8GmpxhyVu8FQzOTkotX
 hl3QIXsV5LqoolgA1/pmVsztgibCzg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-25_02,2025-09-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 adultscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171

On Wed, Sep 24, 2025 at 04:26:31PM -0700, Anjelique Melendez wrote:
> UCSI v2 specification has increased the MSG_IN and MSG_OUT size from
> 16 bytes to 256 bytes each for the message exchange between OPM and PPM
> This makes the total buffer size increase from 48 bytes to 528 bytes.
> Update the buffer size to support this increase.
> 
> Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
> ---
>  drivers/usb/typec/ucsi/ucsi_glink.c | 81 ++++++++++++++++++++++++-----
>  1 file changed, 68 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi_glink.c b/drivers/usb/typec/ucsi/ucsi_glink.c
> index 1f9f0d942c1a..7f19b4d23fed 100644
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
> @@ -30,15 +30,27 @@ struct ucsi_read_buf_req_msg {
>  	struct pmic_glink_hdr   hdr;
>  };
>  
> -struct __packed ucsi_read_buf_resp_msg {
> +struct __packed ucsi_v1_read_buf_resp_msg {
>  	struct pmic_glink_hdr   hdr;
> -	u8                      buf[UCSI_BUF_SIZE];
> +	u8                      buf[UCSI_BUF_V1_SIZE];
>  	u32                     ret_code;
>  };
>  
> -struct __packed ucsi_write_buf_req_msg {
> +struct __packed ucsi_v2_read_buf_resp_msg {
>  	struct pmic_glink_hdr   hdr;
> -	u8                      buf[UCSI_BUF_SIZE];
> +	u8                      buf[UCSI_BUF_V2_SIZE];
> +	u32                     ret_code;
> +};
> +
> +struct __packed ucsi_v1_write_buf_req_msg {
> +	struct pmic_glink_hdr   hdr;
> +	u8                      buf[UCSI_BUF_V1_SIZE];
> +	u32                     reserved;
> +};
> +
> +struct __packed ucsi_v2_write_buf_req_msg {
> +	struct pmic_glink_hdr   hdr;
> +	u8                      buf[UCSI_BUF_V2_SIZE];
>  	u32                     reserved;
>  };
>  
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
> -	unsigned long left;
> +	struct ucsi_v2_write_buf_req_msg req = {};
> +	unsigned long left, max_buf_len;
> +	size_t req_len;
>  	int ret;
>  
> +	memset(&req, 0, sizeof(req));
>  	req.hdr.owner = PMIC_GLINK_OWNER_USBC;
>  	req.hdr.type = MSG_TYPE_REQ_RESP;
>  	req.hdr.opcode = UC_UCSI_WRITE_BUF_REQ;
> +
> +	if (ucsi->ucsi->version >= UCSI_VERSION_2_0) {
> +		req_len = sizeof(struct ucsi_v2_write_buf_req_msg);
> +		max_buf_len = UCSI_BUF_V2_SIZE;

I'd prefer it to be more explicit. Define an union of v1 and v2, fill
common parts and version-specific parts separately.

> +	} else if (ucsi->ucsi->version) {
> +		req_len = sizeof(struct ucsi_v1_write_buf_req_msg);
> +		max_buf_len = UCSI_BUF_V1_SIZE;
> +	} else {
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
> +	ret = pmic_glink_send(ucsi->client, &req, req_len);
>  	if (ret < 0) {
>  		dev_err(ucsi->dev, "failed to send UCSI write request: %d\n", ret);
>  		return ret;
> @@ -216,12 +244,39 @@ static const struct ucsi_operations pmic_glink_ucsi_ops = {
>  
>  static void pmic_glink_ucsi_read_ack(struct pmic_glink_ucsi *ucsi, const void *data, int len)
>  {
> -	const struct ucsi_read_buf_resp_msg *resp = data;
> +	u8 *buf = ((struct ucsi_v2_read_buf_resp_msg *)data)->buf;
> +	u32 ret_code, max_len;
> +	u32 buf_len = 0;
> +
> +	if (ucsi->ucsi->version) {
> +		if (ucsi->ucsi->version >= UCSI_VERSION_2_0)
> +			buf_len = UCSI_BUF_V2_SIZE;
> +		else
> +			buf_len = UCSI_BUF_V1_SIZE;
> +	} else if (!ucsi->ucsi_registered) {
> +		/*
> +		 * If UCSI version is not known yet because device is not registered,
> +		 * choose buffer size which best fits incoming data
> +		 */
> +		if (len > sizeof(struct pmic_glink_hdr) + UCSI_BUF_V2_SIZE)
> +			buf_len = UCSI_BUF_V2_SIZE;
> +		else
> +			buf_len = UCSI_BUF_V1_SIZE;
> +	}
>  
> -	if (resp->ret_code)
> +	max_len = sizeof(struct pmic_glink_hdr) + buf_len + sizeof(u32);
> +
> +	if (len > max_len)
> +		return;
> +
> +	if (buf_len > len - sizeof(struct pmic_glink_hdr) - sizeof(u32))
> +		buf_len = len - sizeof(struct pmic_glink_hdr) - sizeof(u32);

Comment?

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
> 

-- 
With best wishes
Dmitry

