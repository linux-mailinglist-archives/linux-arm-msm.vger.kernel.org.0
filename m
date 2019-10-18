Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B26FADC760
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2019 16:31:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408583AbfJRObY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Oct 2019 10:31:24 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:37415 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729584AbfJRObY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Oct 2019 10:31:24 -0400
Received: by mail-pf1-f193.google.com with SMTP id y5so4012842pfo.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Oct 2019 07:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:from:to:cc:subject:user-agent:date;
        bh=DjG/U9BKkuxjcwKWlSCYriO/UmhBuotz78biqdf5iWM=;
        b=No1KvCTyeV9CU08Ov8gBjr93BqIBAQYrV1Mh4/BIMt/WtSM2oYLybWeA3VK5OHor2o
         5X45uILNIprGFt75ykbOG0sPBKLbphIsDhtS6yeDiPyzjTfpC3aBu9DuiXo0iw53nGaT
         9OttcUidiMzO5mWEWFcrUu04Bydt+np+IEeA8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:from:to:cc:subject
         :user-agent:date;
        bh=DjG/U9BKkuxjcwKWlSCYriO/UmhBuotz78biqdf5iWM=;
        b=A1NWi1CbTgrWHNYrSfofm+05iQIv03toD5iMMiREHNqy/jIVhC4h0Wr0NVldAotj9S
         kCoYVC4ij1YoVLpsypabpfDifbyiUhc9h/Nq2m7ErbdamCfVi/9PQ7QkmSO/idcpGYSJ
         9x7FFPe8DFDwpccGV/xq/xSFGMpX/BC0n/dEENFYPo+I+ho/034fWE2tvSrwiPXkKaHN
         46kfoiGu1+xW9nWpAXuBaWvZ5ZhaYQb7fRAazdSW/tLoWW1zzC2w62BaPURXq3pVq9d+
         Jld1DqtxlKVk5nvArtX6wacCZBlvr2j/xSDmKEE8GeJ/B6sAM6AiM8gmiDaGv28lvwm7
         XVIw==
X-Gm-Message-State: APjAAAVYlxwQQr0F0D8rqDbCGANcUGeBY00A0/8j59u3MkWncbuUN7MN
        IfQD4C1o97PEXzF+IRb/AyF4tA==
X-Google-Smtp-Source: APXvYqxptM3aFepoM4tJuPMvzOKHwPl2f7fsuCN51qv6pj7z4Pv+GJhJdm+w2xzRVcF02WA8/ldV7A==
X-Received: by 2002:a17:90a:aa97:: with SMTP id l23mr11538299pjq.7.1571409083037;
        Fri, 18 Oct 2019 07:31:23 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id c16sm6419980pja.2.2019.10.18.07.31.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2019 07:31:22 -0700 (PDT)
Message-ID: <5da9ccba.1c69fb81.3cae7.0064@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <d0fd71fbeff6cd040335846cb65e125a89412d43.1571406041.git.saiprakash.ranjan@codeaurora.org>
References: <cover.1571406041.git.saiprakash.ranjan@codeaurora.org> <d0fd71fbeff6cd040335846cb65e125a89412d43.1571406041.git.saiprakash.ranjan@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        devicetree@vger.kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Rishabh Bhatnagar <rishabhb@codeaurora.org>,
        Doug Anderson <dianders@chromium.org>,
        Vivek Gautam <vivek.gautam@codeaurora.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: Re: [PATCH 1/2] soc: qcom: llcc: Add configuration data for SC7180
User-Agent: alot/0.8.1
Date:   Fri, 18 Oct 2019 07:31:21 -0700
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sai Prakash Ranjan (2019-10-18 06:57:08)
> diff --git a/drivers/soc/qcom/llcc-qcom.c b/drivers/soc/qcom/llcc-qcom.c
> index 4bd982a294ce..4acb52f8536b 100644
> --- a/drivers/soc/qcom/llcc-qcom.c
> +++ b/drivers/soc/qcom/llcc-qcom.c
> @@ -91,6 +91,13 @@ struct qcom_llcc_config {
>         int size;
>  };
> =20
> +static struct llcc_slice_config sc7180_data[] =3D  {

const?

> +       { LLCC_CPUSS,    1,  256, 1, 0, 0xf, 0x0, 0, 0, 0, 1, 1 },
> +       { LLCC_MDM,      8,  128, 1, 0, 0xf, 0x0, 0, 0, 0, 1, 0 },
> +       { LLCC_GPUHTW,   11, 128, 1, 0, 0xf, 0x0, 0, 0, 0, 1, 0 },
> +       { LLCC_GPU,      12, 128, 1, 0, 0xf, 0x0, 0, 0, 0, 1, 0 },
> +};
> +
>  static struct llcc_slice_config sdm845_data[] =3D  {

This one should be const too I guess but it's not part of this patch.

>         { LLCC_CPUSS,    1,  2816, 1, 0, 0xffc, 0x2,   0, 0, 1, 1, 1 },
>         { LLCC_VIDSC0,   2,  512,  2, 1, 0x0,   0x0f0, 0, 0, 1, 1, 0 },
> @@ -112,6 +119,11 @@ static struct llcc_slice_config sdm845_data[] =3D  {
>         { LLCC_AUDHW,    22, 1024, 1, 1, 0xffc, 0x2,   0, 0, 1, 1, 0 },
>  };
> =20
> +static const struct qcom_llcc_config sc7180_cfg =3D {
> +       .sct_data       =3D sc7180_data,
> +       .size           =3D ARRAY_SIZE(sc7180_data),
> +};
> +
>  static const struct qcom_llcc_config sdm845_cfg =3D {
>         .sct_data       =3D sdm845_data,
>         .size           =3D ARRAY_SIZE(sdm845_data),

Otherwise looks OK to me.

