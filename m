Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E8721D845E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2020 20:11:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732820AbgERSLf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 May 2020 14:11:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729539AbgERSLf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 May 2020 14:11:35 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 213A4C061A0C
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2020 11:11:35 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id a13so3004387pls.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2020 11:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=i5G455mDBJRreSbEvKINUvbESli0VTrS8lepcJ7Mbx4=;
        b=cFWfBG1SDlsVh+fvyQBoiRzrRxskGzJNFyhmnh1UAN04m8JGcPGsAHhJn+ejKbm2cx
         ZvwagzwHxiw+6RYpMK/+DhoODYrjw4wRKOkDLO9L8yAuT+696yxU4Jb65/T8ghzLZBAa
         UtbOticWbi2JyQDjACVzbpfeq/hbpP3vJMbXKGLL8t8PXp/H4+SVruzTB4hNYFA3a85I
         alRoXCs0U9v6WyFNwBT+keJmeltIrFe2CyWUzvhzVBNToc7Vk1AMdchM7qh4A+YLnMA9
         TMinVjmJp6SLEXeyimd1RCSxiqe5P2h2fFyWjA6Ot5SdyLr1E011AqptXrr22jpiBy/T
         b2gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=i5G455mDBJRreSbEvKINUvbESli0VTrS8lepcJ7Mbx4=;
        b=BUIQkWjhzS3Ux8J8j6VZtT4FdkHtU1t48ymAuu9mZaSv5qOYYDff0boaOckhWkLpxZ
         ifbDBEWyNdiGKXF6KKdJURyjGS/cQ7Y0GyO1ylxVSuN5JT9k7RtA5sMqN2O6bS+gwOlh
         NPk1H3HeWBrcHl/JzwiCffYbTPD2SRq6pnNI6NLXHoSccQd132HW6zV2FKfeElR7F2S7
         JK7SVvVL9EmsIn69fLKldeOUNmjP4FnY0HlX83MhkNV0n21G3s/+Tq/ts3pw8baS9o6B
         MJ+OrnwMaZybySnuC2YyA24A1TP50E7YQyznlSibzxqtwXfd1HBJL8tcGMFnUzm0GkDo
         gNvw==
X-Gm-Message-State: AOAM531I1STccb5sRHEUtk2BHXIpYbVfL6GLcPEuCY6ZGPO/KQC7+Pu9
        cHodgp7Qb9wPfPFCuTl03ZPObA==
X-Google-Smtp-Source: ABdhPJwyguEPoWOeDtJWN08rgkbQUT8OwmcHCds8zkRz995JQqY8Y5HP8JDIU14Z8JGNlBpUwJHXLg==
X-Received: by 2002:a17:902:b114:: with SMTP id q20mr15989893plr.120.1589825494493;
        Mon, 18 May 2020 11:11:34 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id 14sm177190pjm.49.2020.05.18.11.11.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 11:11:33 -0700 (PDT)
Date:   Mon, 18 May 2020 11:10:10 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Wang Wenhu <wenhu.wang@vivo.com>
Cc:     Andy Gross <agross@kernel.org>, Sibi Sankar <sibis@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@vivo.com
Subject: Re: [PATCH] soc: qmi: move tlv-micros to header file
Message-ID: <20200518181010.GC2165@builder.lan>
References: <20200413035758.60238-1-wenhu.wang@vivo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200413035758.60238-1-wenhu.wang@vivo.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun 12 Apr 20:57 PDT 2020, Wang Wenhu wrote:

> It's highly helpful to move the definitions of TLV related micros
> into header file for user reference. The OPTIONAL_TLV_TYPE_START
> should be known to any user that might define messages containing
> optional fields. SIZE fields are the same, for users to calculate
> message buffer length.
> 
> While encoding messages, Type always occurs together with Length.
> So the better way is to use TL_SIZE, rather than (T_SIZE + L_SIZE).
> 
> Signed-off-by: Wang Wenhu <wenhu.wang@vivo.com>
> ---
>  drivers/soc/qcom/qmi_encdec.c | 28 ++++++++++++----------------
>  include/linux/soc/qcom/qmi.h  |  5 +++++
>  2 files changed, 17 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/soc/qcom/qmi_encdec.c b/drivers/soc/qcom/qmi_encdec.c
> index 3aaab71d1b2c..a674c68efab2 100644
> --- a/drivers/soc/qcom/qmi_encdec.c
> +++ b/drivers/soc/qcom/qmi_encdec.c
> @@ -53,10 +53,6 @@ do { \
>  	decoded_bytes += rc; \
>  } while (0)
>  
> -#define TLV_LEN_SIZE sizeof(u16)
> -#define TLV_TYPE_SIZE sizeof(u8)

Sorry, but as far as I can tell these properties should be hidden from
the clients by the encoder/decoder helpers. Can help me understand when
these could be useful to have outside this file?

> -#define OPTIONAL_TLV_TYPE_START 0x10

This has some meaning outside, but whenever I've written (typically
generated) qmi_elem_info arrays I just use the TVL TYPE as a number from
the datasheets directly. Can you please give an example of when it's
useful for a client to express a TLV relative to the "optional start"?

Thanks,
Bjorn

> -
>  static int qmi_encode(struct qmi_elem_info *ei_array, void *out_buf,
>  		      const void *in_c_struct, u32 out_buf_len,
>  		      int enc_level);
> @@ -142,7 +138,7 @@ static int qmi_calc_min_msg_len(struct qmi_elem_info *ei_array,
>  		 * nested structure.
>  		 */
>  		if (level == 1)
> -			min_msg_len += (TLV_TYPE_SIZE + TLV_LEN_SIZE);
> +			min_msg_len += QMI_TLV_TL_SIZE;
>  	}
>  
>  	return min_msg_len;
> @@ -253,8 +249,7 @@ static int qmi_encode_string_elem(struct qmi_elem_info *ei_array,
>  	}
>  
>  	if (enc_level == 1) {
> -		if (string_len + TLV_LEN_SIZE + TLV_TYPE_SIZE >
> -		    out_buf_len) {
> +		if (string_len + QMI_TLV_TL_SIZE > out_buf_len) {
>  			pr_err("%s: Output len %d > Out Buf len %d\n",
>  			       __func__, string_len, out_buf_len);
>  			return -ETOOSMALL;
> @@ -311,7 +306,7 @@ static int qmi_encode(struct qmi_elem_info *ei_array, void *out_buf,
>  	tlv_pointer = buf_dst;
>  	tlv_len = 0;
>  	if (enc_level == 1)
> -		buf_dst = buf_dst + (TLV_LEN_SIZE + TLV_TYPE_SIZE);
> +		buf_dst = buf_dst + QMI_TLV_TL_SIZE;
>  
>  	while (temp_ei->data_type != QMI_EOTI) {
>  		buf_src = in_c_struct + temp_ei->offset;
> @@ -342,8 +337,8 @@ static int qmi_encode(struct qmi_elem_info *ei_array, void *out_buf,
>  			data_len_sz = temp_ei->elem_size == sizeof(u8) ?
>  					sizeof(u8) : sizeof(u16);
>  			/* Check to avoid out of range buffer access */
> -			if ((data_len_sz + encoded_bytes + TLV_LEN_SIZE +
> -			    TLV_TYPE_SIZE) > out_buf_len) {
> +			if ((data_len_sz + encoded_bytes + QMI_TLV_TL_SIZE) >
> +			    out_buf_len) {
>  				pr_err("%s: Too Small Buffer @DATA_LEN\n",
>  				       __func__);
>  				return -ETOOSMALL;
> @@ -367,7 +362,7 @@ static int qmi_encode(struct qmi_elem_info *ei_array, void *out_buf,
>  		case QMI_SIGNED_4_BYTE_ENUM:
>  			/* Check to avoid out of range buffer access */
>  			if (((data_len_value * temp_ei->elem_size) +
> -			    encoded_bytes + TLV_LEN_SIZE + TLV_TYPE_SIZE) >
> +			    encoded_bytes + QMI_TLV_TL_SIZE) >
>  			    out_buf_len) {
>  				pr_err("%s: Too Small Buffer @data_type:%d\n",
>  				       __func__, temp_ei->data_type);
> @@ -410,10 +405,10 @@ static int qmi_encode(struct qmi_elem_info *ei_array, void *out_buf,
>  
>  		if (encode_tlv && enc_level == 1) {
>  			QMI_ENCDEC_ENCODE_TLV(tlv_type, tlv_len, tlv_pointer);
> -			encoded_bytes += (TLV_TYPE_SIZE + TLV_LEN_SIZE);
> +			encoded_bytes += QMI_TLV_TL_SIZE;
>  			tlv_pointer = buf_dst;
>  			tlv_len = 0;
> -			buf_dst = buf_dst + TLV_LEN_SIZE + TLV_TYPE_SIZE;
> +			buf_dst = buf_dst + QMI_TLV_TL_SIZE;
>  			encode_tlv = 0;
>  		}
>  	}
> @@ -613,10 +608,11 @@ static int qmi_decode(struct qmi_elem_info *ei_array, void *out_c_struct,
>  			tlv_pointer = buf_src;
>  			QMI_ENCDEC_DECODE_TLV(&tlv_type,
>  					      &tlv_len, tlv_pointer);
> -			buf_src += (TLV_TYPE_SIZE + TLV_LEN_SIZE);
> -			decoded_bytes += (TLV_TYPE_SIZE + TLV_LEN_SIZE);
> +			buf_src += QMI_TLV_TL_SIZE;
> +			decoded_bytes += QMI_TLV_TL_SIZE;
>  			temp_ei = find_ei(ei_array, tlv_type);
> -			if (!temp_ei && tlv_type < OPTIONAL_TLV_TYPE_START) {
> +			if (!temp_ei && tlv_type <
> +			    QMI_OPTIONAL_TLV_TYPE_START) {
>  				pr_err("%s: Inval element info\n", __func__);
>  				return -EINVAL;
>  			} else if (!temp_ei) {
> diff --git a/include/linux/soc/qcom/qmi.h b/include/linux/soc/qcom/qmi.h
> index e712f94b89fc..eb53aebdf45e 100644
> --- a/include/linux/soc/qcom/qmi.h
> +++ b/include/linux/soc/qcom/qmi.h
> @@ -34,6 +34,11 @@ struct qmi_header {
>  #define QMI_INDICATION	4
>  
>  #define QMI_COMMON_TLV_TYPE 0
> +#define QMI_OPTIONAL_TLV_TYPE_START 0x10
> +
> +#define QMI_TLV_LEN_SIZE sizeof(u16)
> +#define QMI_TLV_TYPE_SIZE sizeof(u8)
> +#define QMI_TLV_TL_SIZE (QMI_TLV_LEN_SIZE + QMI_TLV_TYPE_SIZE)
>  
>  enum qmi_elem_type {
>  	QMI_EOTI,
> -- 
> 2.17.1
> 
