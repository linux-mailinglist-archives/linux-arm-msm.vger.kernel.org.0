Return-Path: <linux-arm-msm+bounces-4424-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 133C280EF20
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Dec 2023 15:44:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 44ECB1C20B24
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Dec 2023 14:44:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB953745E4;
	Tue, 12 Dec 2023 14:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="huX7fXPs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A62FE107
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Dec 2023 06:44:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702392267;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2xjg0etbdLaR5lepvPpgd7mHNgfxLS6jqL5w2wbBqn4=;
	b=huX7fXPsxB++vBVpzGCjinM2cfmxYdMybjGVwmNzsfOhpxulmQxOKLn3W8DxMLK+a6aIhk
	isZJSb3cVEj1kKe8edmjedtBV10MLDzzDCCfFFUXKBm2j3AyPYTppnytwU5OvI5OOgwCO7
	YAfAKVOv4l3K9vQwa3U0S058SklorV0=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-192-ihuw41QNNHSrGLjfZDsOCw-1; Tue, 12 Dec 2023 09:44:26 -0500
X-MC-Unique: ihuw41QNNHSrGLjfZDsOCw-1
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4259975e20dso40892271cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Dec 2023 06:44:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702392266; x=1702997066;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2xjg0etbdLaR5lepvPpgd7mHNgfxLS6jqL5w2wbBqn4=;
        b=ERv/jwE/STwimuPOwXlFQ9aXK9d+GT2szMk5S871MFaWKEsBtUQAC08UU81LylQHpC
         jRVAL9LRa2PAb51iU21Nq2hmW+rta97Bjsqvxg/pastsx7NffcqjoHSoWQLhXILYIjaH
         9yZ5hs5WVXBXAMPhbGOyv7BQtL67JDOK65qlC2FhiIdvz+TwWbHVcr5xAxNYy8se/kN1
         SgabU1a3J1SGCs32UD1v4srSimgBCLTF7eNmxSqLC90fx3yzZBySRVFKX9tXLW2Gp5NZ
         4SCAmg26qI4mYXGfkIF0i6umPjmhrcJO2EYonFe6DpMqF5oS0rnfORJ1hmC0zrn/ODeU
         nquQ==
X-Gm-Message-State: AOJu0YyTHqpwvRBgtqXfI4s3E8QgOILgPJXem/C3v0LK9JScZ86TPBFx
	SSreTlsAO0CiBLa454Yg4uTHkQ7Gfk6Vr+w7IOgVyWhCQGkSs/tgT2sKNx6K4FXA+dD0A4F1pik
	9EfIiYYHArctzwGBLOIEx/Qt7ASDUXolgWw==
X-Received: by 2002:ac8:5bc1:0:b0:425:8b0b:c626 with SMTP id b1-20020ac85bc1000000b004258b0bc626mr5762285qtb.104.1702392265838;
        Tue, 12 Dec 2023 06:44:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFDx2IDXua2e+C7h/fWf6gqwxTnbpKX6V9M6OZxvVKCE6ICM3c3GFpuRnOcNIKUdVzrhEBXqA==
X-Received: by 2002:ac8:5bc1:0:b0:425:8b0b:c626 with SMTP id b1-20020ac85bc1000000b004258b0bc626mr5762274qtb.104.1702392265547;
        Tue, 12 Dec 2023 06:44:25 -0800 (PST)
Received: from fedora ([2600:1700:1ff0:d0e0::37])
        by smtp.gmail.com with ESMTPSA id z23-20020ac87117000000b00423de58d3d8sm4110652qto.40.2023.12.12.06.44.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 06:44:24 -0800 (PST)
Date: Tue, 12 Dec 2023 08:44:21 -0600
From: Andrew Halaney <ahalaney@redhat.com>
To: 'Guanjun' <guanjun@linux.alibaba.com>
Cc: neil.armstrong@linaro.org, agross@kernel.org, andersson@kernel.org, 
	konrad.dybcio@linaro.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/1] soc: qcom: Fix compile error caused by uncorrectable
 definition of TRACE_INCLUDE_PATH
Message-ID: <kulysgxsa2lazwpbmovqtide3kvt6qq2dwtxmmi3ugznteo233@67ayvx2lduhi>
References: <20231209074716.2689401-1-guanjun@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231209074716.2689401-1-guanjun@linux.alibaba.com>

On Sat, Dec 09, 2023 at 03:47:16PM +0800, 'Guanjun' wrote:
> From: Guanjun <guanjun@linux.alibaba.com>
> 
> Compiler reports the error message when compiling the file drivers/soc/qcom/pmic_pdcharger_ulog.c:
>   - ./include/trace/define_trace.h:95:42: fatal error: ./pmic_pdcharger_ulog.h: No such file or directory
>       95 | #include TRACE_INCLUDE(TRACE_INCLUDE_FILE)
> 
> TRACE_INCLUDE_PATH shoule be relative to the path include/trace/define_trace.h, not
> the file including it. Fix it.
> 
> Fixes: 086fdb48bc65d(soc: qcom: add ADSP PDCharger ULOG driver)
> Signed-off-by: Guanjun <guanjun@linux.alibaba.com>

For what it is worth I sent a similar patch (which handled this by using
the CFLAG -I recommendation) over here about a week ago:

    https://lore.kernel.org/linux-arm-msm/20231205-pmicpdcharger-ulog-fixups-v1-1-71c95162cb84@redhat.com/

I keep disabling this driver locally when developing (or picking up that
patch) until something gets scooped up.

> ---
>  drivers/soc/qcom/pmic_pdcharger_ulog.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/qcom/pmic_pdcharger_ulog.h b/drivers/soc/qcom/pmic_pdcharger_ulog.h
> index 9d5d9af4fbe4..3ac994d160bd 100644
> --- a/drivers/soc/qcom/pmic_pdcharger_ulog.h
> +++ b/drivers/soc/qcom/pmic_pdcharger_ulog.h
> @@ -28,7 +28,7 @@ TRACE_EVENT(pmic_pdcharger_ulog_msg,
>  /* This part must be outside protection */
>  
>  #undef TRACE_INCLUDE_PATH
> -#define TRACE_INCLUDE_PATH .
> +#define TRACE_INCLUDE_PATH ../../../drivers/soc/qcom/
>  
>  #undef TRACE_INCLUDE_FILE
>  #define TRACE_INCLUDE_FILE pmic_pdcharger_ulog
> -- 
> 2.39.3
> 
> 


