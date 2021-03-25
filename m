Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91162348A2F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Mar 2021 08:29:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229581AbhCYH2h (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Mar 2021 03:28:37 -0400
Received: from aserp2130.oracle.com ([141.146.126.79]:57468 "EHLO
        aserp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229619AbhCYH2T (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Mar 2021 03:28:19 -0400
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
        by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12P7KKeT115108;
        Thu, 25 Mar 2021 07:28:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=Rrnm/+ueOBs+nnQE3/dtGz842zBrqgxKPHFcSicBbJQ=;
 b=jePjKZt5cKlPO1N7hlNkgF8p+A2FHVZyilJiTphWnNMgJu++ogyVuoZC3TDEAIOvYk6N
 xS4HYNWtDCrDxc8eE9N03LxWThGYqELhQVitHlKLFvsyERz/5xTquq93Gc7yzC4YsvPz
 nOi1JEQQZCJSDD4scp8AOb2lxV+/CPlzcafxFDAp/duD6NHi9itmkttsV6MhhBmhEY54
 Sk/LOhqV0cIHdOcd/EYREAgfV+Z4d/hWr3rww6JLLFo7AytIR2PYAuFY+DEhEMZO3Fxl
 sAjYi2MstJ6nJOq9lSEvsXXGMZ7txVxqJ0g8nnNhPkW81VbojGPGP4SW07P1vcPyyznW Mw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by aserp2130.oracle.com with ESMTP id 37d6jbnbx7-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 25 Mar 2021 07:28:04 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12P7KU02067021;
        Thu, 25 Mar 2021 07:28:03 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by aserp3020.oracle.com with ESMTP id 37dty1j91x-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 25 Mar 2021 07:28:03 +0000
Received: from abhmp0007.oracle.com (abhmp0007.oracle.com [141.146.116.13])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 12P7S0HG026974;
        Thu, 25 Mar 2021 07:28:00 GMT
Received: from kadam (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 25 Mar 2021 00:28:00 -0700
Date:   Thu, 25 Mar 2021 10:27:51 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     "'Wei Yongjun" <weiyongjun1@huawei.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Govind Singh <govinds@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        kernel-janitors@vger.kernel.org, Hulk Robot <hulkci@huawei.com>
Subject: Re: [PATCH -next] remoteproc: qcom: wcss: Fix wrong pointer passed
 to PTR_ERR()
Message-ID: <20210325072751.GS1717@kadam>
References: <20210325030857.3978824-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210325030857.3978824-1-weiyongjun1@huawei.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-IMR: 1
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9933 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=999
 malwarescore=0 phishscore=0 bulkscore=0 mlxscore=0 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103250054
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9933 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1011 priorityscore=1501
 spamscore=0 adultscore=0 impostorscore=0 mlxlogscore=999 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103250054
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Mar 25, 2021 at 03:08:57AM +0000, 'Wei Yongjun wrote:
> From: Wei Yongjun <weiyongjun1@huawei.com>
> 
> PTR_ERR should access the value just tested by IS_ERR, otherwise
> the wrong error code will be returned.
> 
> Fixes: 0af65b9b915e ("remoteproc: qcom: wcss: Add non pas wcss Q6 support for QCS404")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/remoteproc/qcom_q6v5_wcss.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_wcss.c b/drivers/remoteproc/qcom_q6v5_wcss.c
> index 71ec1a451e35..eda64f86d7b0 100644
> --- a/drivers/remoteproc/qcom_q6v5_wcss.c
> +++ b/drivers/remoteproc/qcom_q6v5_wcss.c
> @@ -972,7 +972,7 @@ static int q6v5_wcss_init_clock(struct q6v5_wcss *wcss)
>  		ret = PTR_ERR(wcss->qdsp6ss_axim_cbcr);
>  		if (ret != -EPROBE_DEFER)
>  			dev_err(wcss->dev, "failed to get axim cbcr clk\n");
> -		return PTR_ERR(wcss->qdsp6ss_abhm_cbcr);
> +		return PTR_ERR(wcss->qdsp6ss_axim_cbcr);

Just return ret;

(Don't worry about being consistent when the other returns are doing it
wrong).

regards,
dan carpenter


