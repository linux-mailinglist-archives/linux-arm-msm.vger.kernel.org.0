Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 45F656CCEB1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Mar 2023 02:22:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229718AbjC2AWC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Mar 2023 20:22:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229579AbjC2AWB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Mar 2023 20:22:01 -0400
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6923726A5
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Mar 2023 17:21:51 -0700 (PDT)
Received: by mail-yb1-xb2c.google.com with SMTP id k17so17361551ybm.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Mar 2023 17:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680049310;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cS662md6PgNsEh74v2VIWOh08/eQ0i+yJreaqIIt3Sk=;
        b=vdvSDeJnF1BGVFcRCUZ6zHRJYU15RJ0ToULy0kVzPJEBevB4RRosHu+x5988Y0lBsR
         z1HWheRhMN0/fjQPJSgH+L4yiBFRkutGRU5h0u+0UgPpWoxeKrJDiTv9O262IZiHBKIN
         qB+jq9OPZeuJrspwX4FcI6aWhZbye+u/172bRU5wZY1R8X9LRqv73DdRVdfMv3iCHNQq
         kosqKk84/Vhp/YF2jLy2USTt3mexnfrIR7nxzoKZzkvlfORyBwgZLX9ew+DnhkP55rAI
         pCBZb6iZc2lcdFl+GuRWiBx1cDPY9GKkJDw+sQzfWR1eWIFphXKN/M5wecaimsCeq0he
         OY0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680049310;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cS662md6PgNsEh74v2VIWOh08/eQ0i+yJreaqIIt3Sk=;
        b=49NMUuX5r/LAAY7JYt34RLswtQDRk+HyeeHxeyInNLCjTZXpPI7pUDHhLQ809W5haB
         Cm2ysU5jvcMPRGxi+kgukz6cnq3s3gYEhiQi3hz+C0lmnSjlVjA1JTtDFoCqc8vU2Utg
         TogUEp56GPPIQQ2K/02O8bbYdI5BOppaiBqkr7IKg0EDPYvx5/ytwaJGQuQiYDXPV9Im
         yXzC3K8GCpJV53tb4hp5PK1ev2dty6wzwofhfxdRrz3RgCQ3CiHtDnkeK56nt2XvmAju
         278Rxws+9V4cgqTPiZhKCtlBc00RrYvupX8Ui3Red4doyCqBvWtaYVAoErd8vKanLbx+
         +Ftg==
X-Gm-Message-State: AAQBX9dpq0Md1nhgKeSWcAlZ1ytz0ZVeNZUP76p2MT/A49K6r9lmbNnY
        M2uXuc2k+2MY0GGufE97mEG69RDexxYxtgbDZzeWdg==
X-Google-Smtp-Source: AKy350Z9qE4uwCPnYtOIIOvWDl+oZjn+PBDpBtb18kbC1skWUUYr4zIYGXC2qx3EXXJNMVmTh+0f6xCbwiHeb54y6cQ=
X-Received: by 2002:a05:6902:a8c:b0:b7b:fb15:8685 with SMTP id
 cd12-20020a0569020a8c00b00b7bfb158685mr5290821ybb.9.1680049310477; Tue, 28
 Mar 2023 17:21:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230328214703.12093-1-quic_gokukris@quicinc.com>
In-Reply-To: <20230328214703.12093-1-quic_gokukris@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 29 Mar 2023 03:21:39 +0300
Message-ID: <CAA8EJprQ-tHi38itDSHme0qo2o8yHRvMcAZxaMhgZRApJTJ0_A@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] dt-bindings: firmware: qcom: scm: Updating VMID list
To:     Gokul krishna Krishnakumar <quic_gokukris@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Elliot Berman <quic_eberman@quicinc.com>,
        Guru Das Srinagesh <quic_gurus@quicinc.com>,
        Sibi Sankar <quic_sibis@quicinc.com>,
        Melody Olvera <quic_molvera@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 29 Mar 2023 at 00:47, Gokul krishna Krishnakumar
<quic_gokukris@quicinc.com> wrote:
>
> Adding the full list of VMID's, which are used by different clients to
> pass to the secure world.
>
> Signed-off-by: Gokul krishna Krishnakumar <quic_gokukris@quicinc.com>
> ---
>  include/dt-bindings/firmware/qcom,scm.h | 31 +++++++++++++++++++++----
>  1 file changed, 26 insertions(+), 5 deletions(-)
>
> diff --git a/include/dt-bindings/firmware/qcom,scm.h b/include/dt-bindings/firmware/qcom,scm.h
> index 1a4e68fa0744..703b6f1750f4 100644
> --- a/include/dt-bindings/firmware/qcom,scm.h
> +++ b/include/dt-bindings/firmware/qcom,scm.h
> @@ -2,15 +2,36 @@
>  /*
>   * Copyright (c) 2010-2015, 2018-2019 The Linux Foundation. All rights reserved.
>   * Copyright (C) 2015 Linaro Ltd.
> + * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
>   */
>
>  #ifndef _DT_BINDINGS_FIRMWARE_QCOM_SCM_H
>  #define _DT_BINDINGS_FIRMWARE_QCOM_SCM_H
>
> -#define QCOM_SCM_VMID_HLOS             0x3
> -#define QCOM_SCM_VMID_MSS_MSA          0xF
> -#define QCOM_SCM_VMID_WLAN             0x18
> -#define QCOM_SCM_VMID_WLAN_CE          0x19
> -#define QCOM_SCM_VMID_NAV              0x2B

These IDs were not changed, but your patch doesn't make that obvious.
Please fix the alignment so that old IDs are intact.

> +#define QCOM_SCM_VMID_TZ                       0x1
> +#define QCOM_SCM_VMID_HLOS                     0x3
> +#define QCOM_SCM_VMID_CP_TOUCH                 0x8
> +#define QCOM_SCM_VMID_CP_BITSTREAM             0x9
> +#define QCOM_SCM_VMID_CP_PIXEL                 0xA
> +#define QCOM_SCM_VMID_CP_NON_PIXEL             0xB
> +#define QCOM_SCM_VMID_CP_CAMERA                        0xD
> +#define QCOM_SCM_VMID_HLOS_FREE                        0xE
> +#define QCOM_SCM_VMID_MSS_MSA                  0xF
> +#define QCOM_SCM_VMID_MSS_NONMSA               0x10
> +#define QCOM_SCM_VMID_CP_SEC_DISPLAY           0x11
> +#define QCOM_SCM_VMID_CP_APP                   0x12
> +#define QCOM_SCM_VMID_LPASS                    0x16
> +#define QCOM_SCM_VMID_WLAN                     0x18
> +#define QCOM_SCM_VMID_WLAN_CE                  0x19
> +#define QCOM_SCM_VMID_CP_SPSS_SP               0x1A
> +#define QCOM_SCM_VMID_CP_CAMERA_PREVIEW                0x1D
> +#define QCOM_SCM_VMID_CDSP                     0x1E
> +#define QCOM_SCM_VMID_CP_SPSS_SP_SHARED                0x22
> +#define QCOM_SCM_VMID_CP_SPSS_HLOS_SHARED      0x24
> +#define QCOM_SCM_VMID_ADSP_HEAP                        0x25
> +#define QCOM_SCM_VMID_CP_CDSP                  0x2A
> +#define QCOM_SCM_VMID_NAV                      0x2B
> +#define QCOM_SCM_VMID_TVM                      0x2D
> +#define QCOM_SCM_VMID_OEMVM                    0x31
>
>  #endif
> --
> 2.39.2
>


-- 
With best wishes
Dmitry
