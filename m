Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1950B400B18
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Sep 2021 13:27:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351278AbhIDLBy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 4 Sep 2021 07:01:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351390AbhIDLBx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 4 Sep 2021 07:01:53 -0400
Received: from relay02.th.seeweb.it (relay02.th.seeweb.it [IPv6:2001:4b7a:2000:18::163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A0BFC061575
        for <linux-arm-msm@vger.kernel.org>; Sat,  4 Sep 2021 04:00:52 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id F23A01F423;
        Sat,  4 Sep 2021 13:00:50 +0200 (CEST)
Subject: Re: [PATCH v2 11/11] interconnect: qcom: drop DEFINE_QNODE macro
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Georgi Djakov <djakov@kernel.org>
Cc:     Shawn Guo <shawn.guo@linaro.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org
References: <20210903232421.1384199-1-dmitry.baryshkov@linaro.org>
 <20210903232421.1384199-12-dmitry.baryshkov@linaro.org>
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Message-ID: <6b469617-d24c-a017-075d-ba0775002b3b@somainline.org>
Date:   Sat, 4 Sep 2021 13:00:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210903232421.1384199-12-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Il 04/09/21 01:24, Dmitry Baryshkov ha scritto:
> Drop DEFINE_QNODE macro which has become unused.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Tested on Sony Xperia XA2 (sdm630-pioneer)



Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>

> ---
>   drivers/interconnect/qcom/icc-rpm.h | 14 --------------
>   1 file changed, 14 deletions(-)
> 
> diff --git a/drivers/interconnect/qcom/icc-rpm.h b/drivers/interconnect/qcom/icc-rpm.h
> index f6746dabdf28..0b53fae089ac 100644
> --- a/drivers/interconnect/qcom/icc-rpm.h
> +++ b/drivers/interconnect/qcom/icc-rpm.h
> @@ -82,20 +82,6 @@ struct qcom_icc_desc {
>   	unsigned int qos_offset;
>   };
>   
> -#define DEFINE_QNODE(_name, _id, _buswidth, _mas_rpm_id, _slv_rpm_id,	\
> -		     ...)						\
> -		static const u16 _name ## _links[] = { __VA_ARGS__ };	\
> -		\
> -		static struct qcom_icc_node _name = {			\
> -		.name = #_name,						\
> -		.id = _id,						\
> -		.buswidth = _buswidth,					\
> -		.mas_rpm_id = _mas_rpm_id,				\
> -		.slv_rpm_id = _slv_rpm_id,				\
> -		.num_links = ARRAY_SIZE(_name ## _links),		\
> -		.links = _name ## _links,				\
> -	}
> -
>   /* Valid for both NoC and BIMC */
>   #define NOC_QOS_MODE_INVALID		-1
>   #define NOC_QOS_MODE_FIXED		0x0
> 

