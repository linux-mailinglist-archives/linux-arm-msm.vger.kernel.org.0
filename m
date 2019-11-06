Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 733A7F0E9D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Nov 2019 07:02:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727678AbfKFGCt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Nov 2019 01:02:49 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:39618 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725856AbfKFGCs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Nov 2019 01:02:48 -0500
Received: by mail-pf1-f196.google.com with SMTP id x28so14809281pfo.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Nov 2019 22:02:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=tAxu1D7jnaYG9t5UYdYwwWMp1Ky7maVOBKbfFFzDsEY=;
        b=klnQKFixm9MdjfhKmih/M9n1wyzCEFoJ2dMQKA1J11EEUjJmzGand6jK46Yi/p84F3
         UEBkGcYt2GPFLFAfa/Fceqs6+QX0pYeoipIHZuyR6xT2ABIV8AI/qwZV5G+RMocz9fbl
         in3mWiey+v53ZvTgtgUJoeQTYJGCWqPkf/RIvRJhmZuodbG25NBxvg/s3NOUBY9IQI63
         aZNJ00/dwCSLU8MIW2+WuXgr3mZYG1PHQZ8JRWiqB2/LvKPgz7PeZ9U+C7fFdghBXIN9
         kG/7V2Ez5Gs06a1xi2xOMsKVLiXZEM5PFd2Eyf77Xsj62fo9aqickSGKexgePvIzxeU5
         CHgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=tAxu1D7jnaYG9t5UYdYwwWMp1Ky7maVOBKbfFFzDsEY=;
        b=iiy/jtA6RuOltpaJv/XjueV/IknlfKzNH2B90YHeM1ugainvxkfzgko/EGir5ZY74M
         5ratKKDu/HF20yIQllt+xfD3ojFLwb2uxUig5LOCtSqzRBFgwjh/rOwgAHaFQor5J2q8
         rL3hy5qetDvG8N9CEdmRvD4/b6jLBCG4Q/TCW5/JB3QWIf5JoKViw+IeJuHEjbGyGgR6
         kyCSPCRqlud6n2lLeY//3nJh9cuL7NlcOaW9TVFPpYmCVo8u9Pa76DHh+VU5ebBWpwe0
         jNFhLjqOwa/P23PviQE0osebZK8z8UuLj2RXYLrlzdaNe654IoNaQeTODdqFC2CWS7+B
         5i9g==
X-Gm-Message-State: APjAAAUBA4+3OCPz71qi2AamBQRWBuTuJhusNnST3LdSDks7tVP3LKr0
        L75+Ur104iYDy0q09EN+Eqw+IA==
X-Google-Smtp-Source: APXvYqwBpUoI69XNcRv+Xo344Qm/nls+2eWqJaiIuhA+1ic1XuGn2hIRFvn/qO5e3AWtsjkGtkhcKA==
X-Received: by 2002:a17:90a:48:: with SMTP id 8mr1441656pjb.82.1573020167139;
        Tue, 05 Nov 2019 22:02:47 -0800 (PST)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id s66sm11042974pfb.38.2019.11.05.22.02.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2019 22:02:46 -0800 (PST)
Date:   Tue, 5 Nov 2019 22:02:43 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Elliot Berman <eberman@codeaurora.org>
Cc:     saiprakash.ranjan@codeaurora.org, agross@kernel.org,
        tsoni@codeaurora.org, sidgup@codeaurora.org,
        psodagud@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 02/17] firmware: qcom_scm: Apply consistent naming scheme
 to command IDs
Message-ID: <20191106060243.GF586@tuxbook-pro>
References: <1572917256-24205-1-git-send-email-eberman@codeaurora.org>
 <1572917256-24205-3-git-send-email-eberman@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1572917256-24205-3-git-send-email-eberman@codeaurora.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 04 Nov 17:27 PST 2019, Elliot Berman wrote:

> Create a consistent naming scheme for command IDs. The scheme is
> QCOM_SCM_##svc_##cmd. Remove unused macros QCOM_SCM_FLAG_HLOS,
> QCOM_SCM_FLAG_COLDBOOT_MC, QCOM_SCM_FLAG_WARMBOOT_MC,
> QCOM_SCM_CMD_CORE_HOTPLUGGED, and QCOM_SCM_BOOT_ADDR_MC.
> 
> Signed-off-by: Elliot Berman <eberman@codeaurora.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  drivers/firmware/qcom_scm-32.c | 28 ++++++++++++++--------------
>  drivers/firmware/qcom_scm-64.c | 38 +++++++++++++++++++-------------------
>  drivers/firmware/qcom_scm.c    |  8 ++++----
>  drivers/firmware/qcom_scm.h    | 41 ++++++++++++++++++-----------------------
>  4 files changed, 55 insertions(+), 60 deletions(-)
> 
> diff --git a/drivers/firmware/qcom_scm-32.c b/drivers/firmware/qcom_scm-32.c
> index d416efc..87b520f 100644
> --- a/drivers/firmware/qcom_scm-32.c
> +++ b/drivers/firmware/qcom_scm-32.c
> @@ -356,7 +356,7 @@ int __qcom_scm_set_cold_boot_addr(void *entry, const cpumask_t *cpus)
>  			set_cpu_present(cpu, false);
>  	}
>  
> -	return qcom_scm_call_atomic2(QCOM_SCM_SVC_BOOT, QCOM_SCM_BOOT_ADDR,
> +	return qcom_scm_call_atomic2(QCOM_SCM_SVC_BOOT, QCOM_SCM_BOOT_SET_ADDR,
>  				    flags, virt_to_phys(entry));
>  }
>  
> @@ -395,7 +395,7 @@ int __qcom_scm_set_warm_boot_addr(struct device *dev, void *entry,
>  
>  	cmd.addr = cpu_to_le32(virt_to_phys(entry));
>  	cmd.flags = cpu_to_le32(flags);
> -	ret = qcom_scm_call(dev, QCOM_SCM_SVC_BOOT, QCOM_SCM_BOOT_ADDR,
> +	ret = qcom_scm_call(dev, QCOM_SCM_SVC_BOOT, QCOM_SCM_BOOT_SET_ADDR,
>  			    &cmd, sizeof(cmd), NULL, 0);
>  	if (!ret) {
>  		for_each_cpu(cpu, cpus)
> @@ -415,7 +415,7 @@ int __qcom_scm_set_warm_boot_addr(struct device *dev, void *entry,
>   */
>  void __qcom_scm_cpu_power_down(u32 flags)
>  {
> -	qcom_scm_call_atomic1(QCOM_SCM_SVC_BOOT, QCOM_SCM_CMD_TERMINATE_PC,
> +	qcom_scm_call_atomic1(QCOM_SCM_SVC_BOOT, QCOM_SCM_BOOT_TERMINATE_PC,
>  			flags & QCOM_SCM_FLUSH_FLAG_MASK);
>  }
>  
> @@ -425,7 +425,7 @@ int __qcom_scm_is_call_available(struct device *dev, u32 svc_id, u32 cmd_id)
>  	__le32 svc_cmd = cpu_to_le32((svc_id << 10) | cmd_id);
>  	__le32 ret_val = 0;
>  
> -	ret = qcom_scm_call(dev, QCOM_SCM_SVC_INFO, QCOM_IS_CALL_AVAIL_CMD,
> +	ret = qcom_scm_call(dev, QCOM_SCM_SVC_INFO, QCOM_SCM_INFO_IS_CALL_AVAIL,
>  			    &svc_cmd, sizeof(svc_cmd), &ret_val,
>  			    sizeof(ret_val));
>  	if (ret)
> @@ -440,7 +440,7 @@ int __qcom_scm_hdcp_req(struct device *dev, struct qcom_scm_hdcp_req *req,
>  	if (req_cnt > QCOM_SCM_HDCP_MAX_REQ_CNT)
>  		return -ERANGE;
>  
> -	return qcom_scm_call(dev, QCOM_SCM_SVC_HDCP, QCOM_SCM_CMD_HDCP,
> +	return qcom_scm_call(dev, QCOM_SCM_SVC_HDCP, QCOM_SCM_HDCP_INVOKE,
>  		req, req_cnt * sizeof(*req), resp, sizeof(*resp));
>  }
>  
> @@ -456,7 +456,7 @@ bool __qcom_scm_pas_supported(struct device *dev, u32 peripheral)
>  
>  	in = cpu_to_le32(peripheral);
>  	ret = qcom_scm_call(dev, QCOM_SCM_SVC_PIL,
> -			    QCOM_SCM_PAS_IS_SUPPORTED_CMD,
> +			    QCOM_SCM_PIL_PAS_IS_SUPPORTED,
>  			    &in, sizeof(in),
>  			    &out, sizeof(out));
>  
> @@ -477,7 +477,7 @@ int __qcom_scm_pas_init_image(struct device *dev, u32 peripheral,
>  	request.image_addr = cpu_to_le32(metadata_phys);
>  
>  	ret = qcom_scm_call(dev, QCOM_SCM_SVC_PIL,
> -			    QCOM_SCM_PAS_INIT_IMAGE_CMD,
> +			    QCOM_SCM_PIL_PAS_INIT_IMAGE,
>  			    &request, sizeof(request),
>  			    &scm_ret, sizeof(scm_ret));
>  
> @@ -500,7 +500,7 @@ int __qcom_scm_pas_mem_setup(struct device *dev, u32 peripheral,
>  	request.len = cpu_to_le32(size);
>  
>  	ret = qcom_scm_call(dev, QCOM_SCM_SVC_PIL,
> -			    QCOM_SCM_PAS_MEM_SETUP_CMD,
> +			    QCOM_SCM_PIL_PAS_MEM_SETUP,
>  			    &request, sizeof(request),
>  			    &scm_ret, sizeof(scm_ret));
>  
> @@ -515,7 +515,7 @@ int __qcom_scm_pas_auth_and_reset(struct device *dev, u32 peripheral)
>  
>  	in = cpu_to_le32(peripheral);
>  	ret = qcom_scm_call(dev, QCOM_SCM_SVC_PIL,
> -			    QCOM_SCM_PAS_AUTH_AND_RESET_CMD,
> +			    QCOM_SCM_PIL_PAS_AUTH_AND_RESET,
>  			    &in, sizeof(in),
>  			    &out, sizeof(out));
>  
> @@ -530,7 +530,7 @@ int __qcom_scm_pas_shutdown(struct device *dev, u32 peripheral)
>  
>  	in = cpu_to_le32(peripheral);
>  	ret = qcom_scm_call(dev, QCOM_SCM_SVC_PIL,
> -			    QCOM_SCM_PAS_SHUTDOWN_CMD,
> +			    QCOM_SCM_PIL_PAS_SHUTDOWN,
>  			    &in, sizeof(in),
>  			    &out, sizeof(out));
>  
> @@ -543,7 +543,7 @@ int __qcom_scm_pas_mss_reset(struct device *dev, bool reset)
>  	__le32 in = cpu_to_le32(reset);
>  	int ret;
>  
> -	ret = qcom_scm_call(dev, QCOM_SCM_SVC_PIL, QCOM_SCM_PAS_MSS_RESET,
> +	ret = qcom_scm_call(dev, QCOM_SCM_SVC_PIL, QCOM_SCM_PIL_PAS_MSS_RESET,
>  			&in, sizeof(in),
>  			&out, sizeof(out));
>  
> @@ -552,8 +552,8 @@ int __qcom_scm_pas_mss_reset(struct device *dev, bool reset)
>  
>  int __qcom_scm_set_dload_mode(struct device *dev, bool enable)
>  {
> -	return qcom_scm_call_atomic2(QCOM_SCM_SVC_BOOT, QCOM_SCM_SET_DLOAD_MODE,
> -				     enable ? QCOM_SCM_SET_DLOAD_MODE : 0, 0);
> +	return qcom_scm_call_atomic2(QCOM_SCM_SVC_BOOT, QCOM_SCM_BOOT_SET_DLOAD_MODE,
> +				     enable ? QCOM_SCM_BOOT_SET_DLOAD_MODE : 0, 0);
>  }
>  
>  int __qcom_scm_set_remote_state(struct device *dev, u32 state, u32 id)
> @@ -568,7 +568,7 @@ int __qcom_scm_set_remote_state(struct device *dev, u32 state, u32 id)
>  	req.state = cpu_to_le32(state);
>  	req.id = cpu_to_le32(id);
>  
> -	ret = qcom_scm_call(dev, QCOM_SCM_SVC_BOOT, QCOM_SCM_SET_REMOTE_STATE,
> +	ret = qcom_scm_call(dev, QCOM_SCM_SVC_BOOT, QCOM_SCM_BOOT_SET_REMOTE_STATE,
>  			    &req, sizeof(req), &scm_ret, sizeof(scm_ret));
>  
>  	return ret ? : le32_to_cpu(scm_ret);
> diff --git a/drivers/firmware/qcom_scm-64.c b/drivers/firmware/qcom_scm-64.c
> index e6721b5..f0b4853 100644
> --- a/drivers/firmware/qcom_scm-64.c
> +++ b/drivers/firmware/qcom_scm-64.c
> @@ -256,7 +256,7 @@ int __qcom_scm_is_call_available(struct device *dev, u32 svc_id, u32 cmd_id)
>  	desc.args[0] = SMCCC_FUNCNUM(svc_id, cmd_id) |
>  			(ARM_SMCCC_OWNER_SIP << ARM_SMCCC_OWNER_SHIFT);
>  
> -	ret = qcom_scm_call(dev, QCOM_SCM_SVC_INFO, QCOM_IS_CALL_AVAIL_CMD,
> +	ret = qcom_scm_call(dev, QCOM_SCM_SVC_INFO, QCOM_SCM_INFO_IS_CALL_AVAIL,
>  			    &desc, &res);
>  
>  	return ret ? : res.a1;
> @@ -284,7 +284,7 @@ int __qcom_scm_hdcp_req(struct device *dev, struct qcom_scm_hdcp_req *req,
>  	desc.args[9] = req[4].val;
>  	desc.arginfo = QCOM_SCM_ARGS(10);
>  
> -	ret = qcom_scm_call(dev, QCOM_SCM_SVC_HDCP, QCOM_SCM_CMD_HDCP, &desc,
> +	ret = qcom_scm_call(dev, QCOM_SCM_SVC_HDCP, QCOM_SCM_HDCP_INVOKE, &desc,
>  			    &res);
>  	*resp = res.a1;
>  
> @@ -295,7 +295,7 @@ void __qcom_scm_init(void)
>  {
>  	u64 cmd;
>  	struct arm_smccc_res res;
> -	u32 function = SMCCC_FUNCNUM(QCOM_SCM_SVC_INFO, QCOM_IS_CALL_AVAIL_CMD);
> +	u32 function = SMCCC_FUNCNUM(QCOM_SCM_SVC_INFO, QCOM_SCM_INFO_IS_CALL_AVAIL);
>  
>  	/* First try a SMC64 call */
>  	cmd = ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL, ARM_SMCCC_SMC_64,
> @@ -320,7 +320,7 @@ bool __qcom_scm_pas_supported(struct device *dev, u32 peripheral)
>  	desc.arginfo = QCOM_SCM_ARGS(1);
>  
>  	ret = qcom_scm_call(dev, QCOM_SCM_SVC_PIL,
> -				QCOM_SCM_PAS_IS_SUPPORTED_CMD,
> +				QCOM_SCM_PIL_PAS_IS_SUPPORTED,
>  				&desc, &res);
>  
>  	return ret ? false : !!res.a1;
> @@ -337,7 +337,7 @@ int __qcom_scm_pas_init_image(struct device *dev, u32 peripheral,
>  	desc.args[1] = metadata_phys;
>  	desc.arginfo = QCOM_SCM_ARGS(2, QCOM_SCM_VAL, QCOM_SCM_RW);
>  
> -	ret = qcom_scm_call(dev, QCOM_SCM_SVC_PIL, QCOM_SCM_PAS_INIT_IMAGE_CMD,
> +	ret = qcom_scm_call(dev, QCOM_SCM_SVC_PIL, QCOM_SCM_PIL_PAS_INIT_IMAGE,
>  				&desc, &res);
>  
>  	return ret ? : res.a1;
> @@ -355,7 +355,7 @@ int __qcom_scm_pas_mem_setup(struct device *dev, u32 peripheral,
>  	desc.args[2] = size;
>  	desc.arginfo = QCOM_SCM_ARGS(3);
>  
> -	ret = qcom_scm_call(dev, QCOM_SCM_SVC_PIL, QCOM_SCM_PAS_MEM_SETUP_CMD,
> +	ret = qcom_scm_call(dev, QCOM_SCM_SVC_PIL, QCOM_SCM_PIL_PAS_MEM_SETUP,
>  				&desc, &res);
>  
>  	return ret ? : res.a1;
> @@ -371,7 +371,7 @@ int __qcom_scm_pas_auth_and_reset(struct device *dev, u32 peripheral)
>  	desc.arginfo = QCOM_SCM_ARGS(1);
>  
>  	ret = qcom_scm_call(dev, QCOM_SCM_SVC_PIL,
> -				QCOM_SCM_PAS_AUTH_AND_RESET_CMD,
> +				QCOM_SCM_PIL_PAS_AUTH_AND_RESET,
>  				&desc, &res);
>  
>  	return ret ? : res.a1;
> @@ -386,7 +386,7 @@ int __qcom_scm_pas_shutdown(struct device *dev, u32 peripheral)
>  	desc.args[0] = peripheral;
>  	desc.arginfo = QCOM_SCM_ARGS(1);
>  
> -	ret = qcom_scm_call(dev, QCOM_SCM_SVC_PIL, QCOM_SCM_PAS_SHUTDOWN_CMD,
> +	ret = qcom_scm_call(dev, QCOM_SCM_SVC_PIL, QCOM_SCM_PIL_PAS_SHUTDOWN,
>  			&desc, &res);
>  
>  	return ret ? : res.a1;
> @@ -402,7 +402,7 @@ int __qcom_scm_pas_mss_reset(struct device *dev, bool reset)
>  	desc.args[1] = 0;
>  	desc.arginfo = QCOM_SCM_ARGS(2);
>  
> -	ret = qcom_scm_call(dev, QCOM_SCM_SVC_PIL, QCOM_SCM_PAS_MSS_RESET, &desc,
> +	ret = qcom_scm_call(dev, QCOM_SCM_SVC_PIL, QCOM_SCM_PIL_PAS_MSS_RESET, &desc,
>  			    &res);
>  
>  	return ret ? : res.a1;
> @@ -418,7 +418,7 @@ int __qcom_scm_set_remote_state(struct device *dev, u32 state, u32 id)
>  	desc.args[1] = id;
>  	desc.arginfo = QCOM_SCM_ARGS(2);
>  
> -	ret = qcom_scm_call(dev, QCOM_SCM_SVC_BOOT, QCOM_SCM_SET_REMOTE_STATE,
> +	ret = qcom_scm_call(dev, QCOM_SCM_SVC_BOOT, QCOM_SCM_BOOT_SET_REMOTE_STATE,
>  			    &desc, &res);
>  
>  	return ret ? : res.a1;
> @@ -445,7 +445,7 @@ int __qcom_scm_assign_mem(struct device *dev, phys_addr_t mem_region,
>  				     QCOM_SCM_VAL, QCOM_SCM_VAL);
>  
>  	ret = qcom_scm_call(dev, QCOM_SCM_SVC_MP,
> -			    QCOM_MEM_PROT_ASSIGN_ID,
> +			    QCOM_SCM_MP_ASSIGN,
>  			    &desc, &res);
>  
>  	return ret ? : res.a1;
> @@ -461,7 +461,7 @@ int __qcom_scm_restore_sec_cfg(struct device *dev, u32 device_id, u32 spare)
>  	desc.args[1] = spare;
>  	desc.arginfo = QCOM_SCM_ARGS(2);
>  
> -	ret = qcom_scm_call(dev, QCOM_SCM_SVC_MP, QCOM_SCM_RESTORE_SEC_CFG,
> +	ret = qcom_scm_call(dev, QCOM_SCM_SVC_MP, QCOM_SCM_MP_RESTORE_SEC_CFG,
>  			    &desc, &res);
>  
>  	return ret ? : res.a1;
> @@ -478,7 +478,7 @@ int __qcom_scm_iommu_secure_ptbl_size(struct device *dev, u32 spare,
>  	desc.arginfo = QCOM_SCM_ARGS(1);
>  
>  	ret = qcom_scm_call(dev, QCOM_SCM_SVC_MP,
> -			    QCOM_SCM_IOMMU_SECURE_PTBL_SIZE, &desc, &res);
> +			    QCOM_SCM_MP_IOMMU_SECURE_PTBL_SIZE, &desc, &res);
>  
>  	if (size)
>  		*size = res.a1;
> @@ -500,7 +500,7 @@ int __qcom_scm_iommu_secure_ptbl_init(struct device *dev, u64 addr, u32 size,
>  				     QCOM_SCM_VAL);
>  
>  	ret = qcom_scm_call(dev, QCOM_SCM_SVC_MP,
> -			    QCOM_SCM_IOMMU_SECURE_PTBL_INIT, &desc, &res);
> +			    QCOM_SCM_MP_IOMMU_SECURE_PTBL_INIT, &desc, &res);
>  
>  	/* the pg table has been initialized already, ignore the error */
>  	if (ret == -EPERM)
> @@ -514,11 +514,11 @@ int __qcom_scm_set_dload_mode(struct device *dev, bool enable)
>  	struct qcom_scm_desc desc = {0};
>  	struct arm_smccc_res res;
>  
> -	desc.args[0] = QCOM_SCM_SET_DLOAD_MODE;
> -	desc.args[1] = enable ? QCOM_SCM_SET_DLOAD_MODE : 0;
> +	desc.args[0] = QCOM_SCM_BOOT_SET_DLOAD_MODE;
> +	desc.args[1] = enable ? QCOM_SCM_BOOT_SET_DLOAD_MODE : 0;
>  	desc.arginfo = QCOM_SCM_ARGS(2);
>  
> -	return qcom_scm_call(dev, QCOM_SCM_SVC_BOOT, QCOM_SCM_SET_DLOAD_MODE,
> +	return qcom_scm_call(dev, QCOM_SCM_SVC_BOOT, QCOM_SCM_BOOT_SET_DLOAD_MODE,
>  			     &desc, &res);
>  }
>  
> @@ -558,10 +558,10 @@ int __qcom_scm_qsmmu500_wait_safe_toggle(struct device *dev, bool en)
>  	struct qcom_scm_desc desc = {0};
>  	struct arm_smccc_res res;
>  
> -	desc.args[0] = QCOM_SCM_CONFIG_ERRATA1_CLIENT_ALL;
> +	desc.args[0] = QCOM_SCM_SMMU_CONFIG_ERRATA1_CLIENT_ALL;
>  	desc.args[1] = en;
>  	desc.arginfo = QCOM_SCM_ARGS(2);
>  
>  	return qcom_scm_call_atomic(dev, QCOM_SCM_SVC_SMMU_PROGRAM,
> -				    QCOM_SCM_CONFIG_ERRATA1, &desc, &res);
> +				    QCOM_SCM_SMMU_CONFIG_ERRATA1, &desc, &res);
>  }
> diff --git a/drivers/firmware/qcom_scm.c b/drivers/firmware/qcom_scm.c
> index 40222b1..450d6d6 100644
> --- a/drivers/firmware/qcom_scm.c
> +++ b/drivers/firmware/qcom_scm.c
> @@ -140,7 +140,7 @@ bool qcom_scm_hdcp_available(void)
>  		return ret;
>  
>  	ret = __qcom_scm_is_call_available(__scm->dev, QCOM_SCM_SVC_HDCP,
> -						QCOM_SCM_CMD_HDCP);
> +						QCOM_SCM_HDCP_INVOKE);
>  
>  	qcom_scm_clk_disable();
>  
> @@ -181,7 +181,7 @@ bool qcom_scm_pas_supported(u32 peripheral)
>  	int ret;
>  
>  	ret = __qcom_scm_is_call_available(__scm->dev, QCOM_SCM_SVC_PIL,
> -					   QCOM_SCM_PAS_IS_SUPPORTED_CMD);
> +					   QCOM_SCM_PIL_PAS_IS_SUPPORTED);
>  	if (ret <= 0)
>  		return false;
>  
> @@ -368,12 +368,12 @@ static void qcom_scm_set_download_mode(bool enable)
>  
>  	avail = __qcom_scm_is_call_available(__scm->dev,
>  					     QCOM_SCM_SVC_BOOT,
> -					     QCOM_SCM_SET_DLOAD_MODE);
> +					     QCOM_SCM_BOOT_SET_DLOAD_MODE);
>  	if (avail) {
>  		ret = __qcom_scm_set_dload_mode(__scm->dev, enable);
>  	} else if (__scm->dload_mode_addr) {
>  		ret = __qcom_scm_io_writel(__scm->dev, __scm->dload_mode_addr,
> -					   enable ? QCOM_SCM_SET_DLOAD_MODE : 0);
> +					   enable ? QCOM_SCM_BOOT_SET_DLOAD_MODE : 0);
>  	} else {
>  		dev_err(__scm->dev,
>  			"No available mechanism for setting download mode\n");
> diff --git a/drivers/firmware/qcom_scm.h b/drivers/firmware/qcom_scm.h
> index baee744..99e91ba 100644
> --- a/drivers/firmware/qcom_scm.h
> +++ b/drivers/firmware/qcom_scm.h
> @@ -5,23 +5,18 @@
>  #define __QCOM_SCM_INT_H
>  
>  #define QCOM_SCM_SVC_BOOT		0x1
> -#define QCOM_SCM_BOOT_ADDR		0x1
> -#define QCOM_SCM_SET_DLOAD_MODE		0x10
> -#define QCOM_SCM_BOOT_ADDR_MC		0x11
> -#define QCOM_SCM_SET_REMOTE_STATE	0xa
> +#define QCOM_SCM_BOOT_SET_ADDR		0x1
> +#define QCOM_SCM_BOOT_SET_DLOAD_MODE		0x10
> +#define QCOM_SCM_BOOT_SET_REMOTE_STATE	0xa
>  extern int __qcom_scm_set_remote_state(struct device *dev, u32 state, u32 id);
>  extern int __qcom_scm_set_dload_mode(struct device *dev, bool enable);
>  
> -#define QCOM_SCM_FLAG_HLOS		0x01
> -#define QCOM_SCM_FLAG_COLDBOOT_MC	0x02
> -#define QCOM_SCM_FLAG_WARMBOOT_MC	0x04
>  extern int __qcom_scm_set_warm_boot_addr(struct device *dev, void *entry,
>  		const cpumask_t *cpus);
>  extern int __qcom_scm_set_cold_boot_addr(void *entry, const cpumask_t *cpus);
>  
> -#define QCOM_SCM_CMD_TERMINATE_PC	0x2
> +#define QCOM_SCM_BOOT_TERMINATE_PC	0x2
>  #define QCOM_SCM_FLUSH_FLAG_MASK	0x3
> -#define QCOM_SCM_CMD_CORE_HOTPLUGGED	0x10
>  extern void __qcom_scm_cpu_power_down(u32 flags);
>  
>  #define QCOM_SCM_SVC_IO			0x5
> @@ -31,24 +26,24 @@ extern int __qcom_scm_io_readl(struct device *dev, phys_addr_t addr, unsigned in
>  extern int __qcom_scm_io_writel(struct device *dev, phys_addr_t addr, unsigned int val);
>  
>  #define QCOM_SCM_SVC_INFO		0x6
> -#define QCOM_IS_CALL_AVAIL_CMD		0x1
> +#define QCOM_SCM_INFO_IS_CALL_AVAIL	0x1
>  extern int __qcom_scm_is_call_available(struct device *dev, u32 svc_id,
>  		u32 cmd_id);
>  
>  #define QCOM_SCM_SVC_HDCP		0x11
> -#define QCOM_SCM_CMD_HDCP		0x01
> +#define QCOM_SCM_HDCP_INVOKE		0x01
>  extern int __qcom_scm_hdcp_req(struct device *dev,
>  		struct qcom_scm_hdcp_req *req, u32 req_cnt, u32 *resp);
>  
>  extern void __qcom_scm_init(void);
>  
>  #define QCOM_SCM_SVC_PIL		0x2
> -#define QCOM_SCM_PAS_INIT_IMAGE_CMD	0x1
> -#define QCOM_SCM_PAS_MEM_SETUP_CMD	0x2
> -#define QCOM_SCM_PAS_AUTH_AND_RESET_CMD	0x5
> -#define QCOM_SCM_PAS_SHUTDOWN_CMD	0x6
> -#define QCOM_SCM_PAS_IS_SUPPORTED_CMD	0x7
> -#define QCOM_SCM_PAS_MSS_RESET		0xa
> +#define QCOM_SCM_PIL_PAS_INIT_IMAGE	0x1
> +#define QCOM_SCM_PIL_PAS_MEM_SETUP	0x2
> +#define QCOM_SCM_PIL_PAS_AUTH_AND_RESET	0x5
> +#define QCOM_SCM_PIL_PAS_SHUTDOWN	0x6
> +#define QCOM_SCM_PIL_PAS_IS_SUPPORTED	0x7
> +#define QCOM_SCM_PIL_PAS_MSS_RESET		0xa
>  extern bool __qcom_scm_pas_supported(struct device *dev, u32 peripheral);
>  extern int  __qcom_scm_pas_init_image(struct device *dev, u32 peripheral,
>  		dma_addr_t metadata_phys);
> @@ -86,21 +81,21 @@ static inline int qcom_scm_remap_error(int err)
>  }
>  
>  #define QCOM_SCM_SVC_MP			0xc
> -#define QCOM_SCM_RESTORE_SEC_CFG	2
> +#define QCOM_SCM_MP_RESTORE_SEC_CFG	2
>  extern int __qcom_scm_restore_sec_cfg(struct device *dev, u32 device_id,
>  				      u32 spare);
> -#define QCOM_SCM_IOMMU_SECURE_PTBL_SIZE	3
> -#define QCOM_SCM_IOMMU_SECURE_PTBL_INIT	4
> +#define QCOM_SCM_MP_IOMMU_SECURE_PTBL_SIZE	3
> +#define QCOM_SCM_MP_IOMMU_SECURE_PTBL_INIT	4
>  #define QCOM_SCM_SVC_SMMU_PROGRAM	0x15
> -#define QCOM_SCM_CONFIG_ERRATA1		0x3
> -#define QCOM_SCM_CONFIG_ERRATA1_CLIENT_ALL	0x2
> +#define QCOM_SCM_SMMU_CONFIG_ERRATA1		0x3
> +#define QCOM_SCM_SMMU_CONFIG_ERRATA1_CLIENT_ALL	0x2
>  extern int __qcom_scm_iommu_secure_ptbl_size(struct device *dev, u32 spare,
>  					     size_t *size);
>  extern int __qcom_scm_iommu_secure_ptbl_init(struct device *dev, u64 addr,
>  					     u32 size, u32 spare);
>  extern int __qcom_scm_qsmmu500_wait_safe_toggle(struct device *dev,
>  						bool enable);
> -#define QCOM_MEM_PROT_ASSIGN_ID	0x16
> +#define QCOM_SCM_MP_ASSIGN	0x16
>  extern int  __qcom_scm_assign_mem(struct device *dev,
>  				  phys_addr_t mem_region, size_t mem_sz,
>  				  phys_addr_t src, size_t src_sz,
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
