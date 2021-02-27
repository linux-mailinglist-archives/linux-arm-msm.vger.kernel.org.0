Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3374F326D46
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Feb 2021 14:54:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230079AbhB0Nyk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 27 Feb 2021 08:54:40 -0500
Received: from m42-2.mailgun.net ([69.72.42.2]:46056 "EHLO m42-2.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230014AbhB0Nyj (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 27 Feb 2021 08:54:39 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1614434055; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=DgtWfT+ggYoDBm8woYV9yvXhaOPvGJGBMdZaWUjPB3U=; b=ICCh58YbhrF1AVKN6wamRIH1dd7wDTsxWp+3ydG3lvsF7CqNer2lbGktHEWbuccCmZWyrlOj
 2s7t8NLeNVAWU6urlT3ZQJRfhlnkOWOBaSy2R9juSDI5m7HDfBtNQt0/B2FrFyTqbj3rtmCP
 G20Eq9dm3ixInaBEs2rbsmITuUU=
X-Mailgun-Sending-Ip: 69.72.42.2
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 603a4ee67aa94c52e7ecf898 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sat, 27 Feb 2021 13:53:42
 GMT
Sender: saiprakash.ranjan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 34ABEC43464; Sat, 27 Feb 2021 13:53:42 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-253.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 0E411C433CA;
        Sat, 27 Feb 2021 13:53:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 0E411C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=saiprakash.ranjan@codeaurora.org
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     bjorn.andersson@linaro.org
Cc:     akhilpo@codeaurora.org, iommu@lists.linux-foundation.org,
        jcrouse@codeaurora.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        robdclark@gmail.com, robin.murphy@arm.com, will@kernel.org,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: Re: [PATCHv2 2/2] iommu/arm-smmu-qcom: Move the adreno smmu specific impl earlier
Date:   Sat, 27 Feb 2021 19:23:21 +0530
Message-Id: <20210227135321.420-1-saiprakash.ranjan@codeaurora.org>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <YDlIrjkfv16o4Nu3@builder.lan>
References: <YDlIrjkfv16o4Nu3@builder.lan>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Bjorn,

On 2021-02-27 00:44, Bjorn Andersson wrote:
> On Fri 26 Feb 12:23 CST 2021, Rob Clark wrote:
> 
> 
> The current logic picks one of:
> 1) is the compatible mentioned in qcom_smmu_impl_of_match[]
> 2) is the compatible an adreno
> 3) no quirks needed
> 
> The change flips the order of these, so the only way I can see this
> change affecting things is if we expected a match on #2, but we got one
> on #1.
> 
> Which implies that the instance that we want to act according to the
> adreno impl was listed in qcom_smmu_impl_of_match[] - which either is
> wrong, or there's a single instance that needs both behaviors.
> 
> (And I believe Jordan's answer confirms the latter - there's a single
> SMMU instance that needs all them quirks at once)
> 

Let me go through the problem statement in case my commit message wasn't
clear. There are two SMMUs (APSS and GPU) on SC7280 and both are SMMU500
(ARM SMMU IP).

APSS SMMU compatible - ("qcom,sc7280-smmu-500", "arm,mmu-500")
GPU SMMU compatible - ("qcom,sc7280-smmu-500", "qcom,adreno-smmu", "arm,mmu-500")

Now if we take SC7180 as an example, GPU SMMU was QSMMU(QCOM SMMU IP)
and APSS SMMU was SMMU500(ARM SMMU IP).

APSS SMMU compatible - ("qcom,sc7180-smmu-500", "arm,mmu-500")
GPU SMMU compatible - ("qcom,sc7180-smmu-v2", "qcom,adreno-smmu", "qcom,smmu-v2")

Current code sequence without this patch,

if (of_match_node(qcom_smmu_impl_of_match, np))
                 return qcom_smmu_create(smmu, &qcom_smmu_impl);

if (of_device_is_compatible(np, "qcom,adreno-smmu"))
        return qcom_smmu_create(smmu, &qcom_adreno_smmu_impl);

Now if we look at the compatible for SC7180, there is no problem because
the APSS SMMU will match the one in qcom_smmu_impl_of_match[] and GPU SMMU
will match "qcom,adreno-smmu" because the compatible strings are different.
But for SC7280, both the APSS SMMU and GPU SMMU compatible("qcom,sc7280-smmu-500")
are same. So GPU SMMU will match with the one in qcom_smmu_impl_of_match[]
i.e.., "qcom,sc7280-smmu-500" which functionally doesn't cause any problem
but we will miss settings for split pagetables which are part of GPU SMMU
specific implementation.

We can avoid this with yet another new compatible for GPU SMMU something like
"qcom,sc7280-adreno-smmu-500" but since we can handle this easily in the
driver and since the IPs are same, meaning if there was a hardware quirk
required, then we would need to apply to both of them and would this additional
compatible be of any help?

Coming to the part of quirks now, you are right saying both SMMUs will need
to have the same quirks in SC7280 and similar others where both are based on
same IPs but those should probably be *hardware quirks* and if they are
software based like the S2CR quirk depending on the firmware, then it might
not be applicable to both. In case if it is applicable, then as Jordan mentioned,
we can add the same quirks in GPU SMMU implementation.

Thanks,
Sai

--
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
