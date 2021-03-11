Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86B04338179
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Mar 2021 00:30:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230406AbhCKX3v (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Mar 2021 18:29:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230388AbhCKX32 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Mar 2021 18:29:28 -0500
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74BEDC061760
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Mar 2021 15:29:28 -0800 (PST)
Received: by mail-ot1-x32c.google.com with SMTP id f73-20020a9d03cf0000b02901b4d889bce0so491583otf.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Mar 2021 15:29:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=491rIB6TbnxYKUbmp43lo7687n1uls9e/9Yv3zZ/+/M=;
        b=SMNVB6H5xpNSP+Ntt/E41bnstJS/mub/pjKkhJYxD/9m/0JdTt1Sc/JeacWsclnhIa
         saZlM35oEZUGd6GLJc1B0Z8fOHlmarLVRa320OirgMyuk3CMzsKTN3VBH5KUOauAu923
         d2ymYxIDPYCBsoGohPV+44DV5Vg2pH3P1pSno36NGadsaTHK9d6OhoL/AnG1QXTXQjq6
         WfezMMjeqBUM6N2bVJmXtEz+LPF75d9wrFoBjlOAkTBvA8q7hY2kgy7D9mi3SqDP3npX
         UArOx0eMWnVGobKk8hawyEDO7rE3C0zoYDGB3jhrj15GrhugPdE6laoOn+2Xy00KuXrQ
         srhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=491rIB6TbnxYKUbmp43lo7687n1uls9e/9Yv3zZ/+/M=;
        b=SsXoaLp98+wCnhofzX7RpHKCltUHFXHipzKl4ReSecBqN/6Uk3GG4Unsu7hBpVIHyf
         RiH7CLMYuSXD93VyobUPaBaZHVpG3agLbILw//hWw97bkvhobI4iKARl+Xv8En2NssFl
         d5ePLMmf+nQTSgbuOH7rQnxLaOksAPYkyjkF9ea3o/wW9WJ+dfFkDsZMP0kjE/6JiUcr
         DDlf9KisYxXkeGJfpO2gHu2S60ol42Ff/EOh4sLFLfIKq7Qiuu0MHQKmkWEOqtFG/HAJ
         9uvJPWgX1ykpSlJPa7mBJ9ql44U4v35GNx5S1MNXPoHhwIYF6ygpxv+xps2en6WeDt8W
         RuPA==
X-Gm-Message-State: AOAM532QWESyD7Rxnzkkya8uCArSeDsfbVYKzFrHuSiPKWKYiF01Vbts
        x1HELxD0tc5chSUhblyI15AE1A==
X-Google-Smtp-Source: ABdhPJw4KQvalKBsueb6g3JYuyjaH1gcgChPlIne9ccF8RDotEH2OI5ha3PVdoOKbRbxK7d39hmllA==
X-Received: by 2002:a05:6830:101a:: with SMTP id a26mr1116383otp.68.1615505367766;
        Thu, 11 Mar 2021 15:29:27 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id l190sm639403oig.39.2021.03.11.15.29.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 15:29:27 -0800 (PST)
Date:   Thu, 11 Mar 2021 17:29:25 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     akhilpo@codeaurora.org, iommu@lists.linux-foundation.org,
        jcrouse@codeaurora.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        robdclark@gmail.com, robin.murphy@arm.com, will@kernel.org
Subject: Re: [PATCHv2 2/2] iommu/arm-smmu-qcom: Move the adreno smmu specific
 impl earlier
Message-ID: <YEqn1SjsGgK0V8K4@builder.lan>
References: <YDlIrjkfv16o4Nu3@builder.lan>
 <20210227135321.420-1-saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210227135321.420-1-saiprakash.ranjan@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat 27 Feb 07:53 CST 2021, Sai Prakash Ranjan wrote:

> Hi Bjorn,
> 
> On 2021-02-27 00:44, Bjorn Andersson wrote:
> > On Fri 26 Feb 12:23 CST 2021, Rob Clark wrote:
> > 
> > 
> > The current logic picks one of:
> > 1) is the compatible mentioned in qcom_smmu_impl_of_match[]
> > 2) is the compatible an adreno
> > 3) no quirks needed
> > 
> > The change flips the order of these, so the only way I can see this
> > change affecting things is if we expected a match on #2, but we got one
> > on #1.
> > 
> > Which implies that the instance that we want to act according to the
> > adreno impl was listed in qcom_smmu_impl_of_match[] - which either is
> > wrong, or there's a single instance that needs both behaviors.
> > 
> > (And I believe Jordan's answer confirms the latter - there's a single
> > SMMU instance that needs all them quirks at once)
> > 
> 
> Let me go through the problem statement in case my commit message wasn't
> clear. There are two SMMUs (APSS and GPU) on SC7280 and both are SMMU500
> (ARM SMMU IP).
> 
> APSS SMMU compatible - ("qcom,sc7280-smmu-500", "arm,mmu-500")
> GPU SMMU compatible - ("qcom,sc7280-smmu-500", "qcom,adreno-smmu", "arm,mmu-500")
> 
> Now if we take SC7180 as an example, GPU SMMU was QSMMU(QCOM SMMU IP)
> and APSS SMMU was SMMU500(ARM SMMU IP).
> 
> APSS SMMU compatible - ("qcom,sc7180-smmu-500", "arm,mmu-500")
> GPU SMMU compatible - ("qcom,sc7180-smmu-v2", "qcom,adreno-smmu", "qcom,smmu-v2")
> 
> Current code sequence without this patch,
> 
> if (of_match_node(qcom_smmu_impl_of_match, np))
>                  return qcom_smmu_create(smmu, &qcom_smmu_impl);
> 
> if (of_device_is_compatible(np, "qcom,adreno-smmu"))
>         return qcom_smmu_create(smmu, &qcom_adreno_smmu_impl);
> 
> Now if we look at the compatible for SC7180, there is no problem because
> the APSS SMMU will match the one in qcom_smmu_impl_of_match[] and GPU SMMU
> will match "qcom,adreno-smmu" because the compatible strings are different.
> But for SC7280, both the APSS SMMU and GPU SMMU compatible("qcom,sc7280-smmu-500")
> are same. So GPU SMMU will match with the one in qcom_smmu_impl_of_match[]
> i.e.., "qcom,sc7280-smmu-500" which functionally doesn't cause any problem
> but we will miss settings for split pagetables which are part of GPU SMMU
> specific implementation.
> 
> We can avoid this with yet another new compatible for GPU SMMU something like
> "qcom,sc7280-adreno-smmu-500" but since we can handle this easily in the
> driver and since the IPs are same, meaning if there was a hardware quirk
> required, then we would need to apply to both of them and would this additional
> compatible be of any help?
> 

No, I think you're doing the right thing of having them both. I just
didn't remember us doing that.

> Coming to the part of quirks now, you are right saying both SMMUs will need
> to have the same quirks in SC7280 and similar others where both are based on
> same IPs but those should probably be *hardware quirks* and if they are
> software based like the S2CR quirk depending on the firmware, then it might
> not be applicable to both. In case if it is applicable, then as Jordan mentioned,
> we can add the same quirks in GPU SMMU implementation.
> 

I do suspect that at some point (probably sooner than later) we'd have
to support both inheriting of stream from the bootloader and the Adreno
"quirks" in the same instance.

But for now this is okay to me.

Regards,
Bjorn
