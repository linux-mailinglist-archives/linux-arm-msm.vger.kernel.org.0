Return-Path: <linux-arm-msm+bounces-81355-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CEDDC51290
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 09:45:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 275D71892245
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 08:46:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D463A2FD66F;
	Wed, 12 Nov 2025 08:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZJSp3n1K";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WjhZoFgL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CFFC2FD1D5
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 08:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762937138; cv=none; b=GR1NyRChbaPJi688Z2zbEfJV1m6sUW8hhySdUAhn8N4Fy0YoZ+yUudYQ6MNPKxniRhyIj2cel9qA0ef/nbGXvYA40Hz5N+aqByC7WoazhlrBop9JXt6m513nmiVFd3Og5pdBEhWRhTLe2mOE7luCSCV27cvkW86guNDWy/xXrnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762937138; c=relaxed/simple;
	bh=IRZ9f8wL5kgLBy5NspA9La2Retp5bp6q2xe60DsBTlU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IQ4rni5id73ufvyWPHAgcB0wNJHrLkgFfmPKVqgrm06DpZ4zHFNe+iMdG2TN5IPKG7e6QZW/9IVDzrAtwwOF4ZHgmBa8bz3uG2Uo8G55vOEeU7+YT1vXsAt/vrxNyoLQedIEgDuigZo7Doz72BbRa/glm4d1GCML2yGoEoel9Ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZJSp3n1K; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WjhZoFgL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AC1Hf6C3683861
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 08:45:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7AdkK5O+7dxDbaAGCY7ElApm1G/o+IP6D+XUp2MWM9U=; b=ZJSp3n1Ks0kIlAQj
	ZzXe9JuW0OVIz9DJbTtTAgK34B/mklewEAjKZTzDXI31x5+wdnHUFQ4FIyoFGeJo
	dRJiOGKKqswjClp+s/71oWSDeb5ra/hOyNpgqG1BVyvYU1NV2LQmBThCwXOzAsx4
	CwBOe/VET+x6wtwLNkJOHYR4MpZlckjDE+TTkzb3hiQXpdQv71jT1sOWm9IbXw3f
	UZTXg2FdS1PxDODlxJiuW0rhxXP3i3cED+whp4fN4DajiCN1qaXgHzH/VMHxXWDp
	WRRYh504nJApoWasLMLCZZA47gSmXd6wDDnnqwsah9ujp5bLSGtpWZruLycvcmQt
	SOP3Ew==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4acgeu15sr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 08:45:35 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-34378c914b4so823442a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 00:45:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762937134; x=1763541934; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7AdkK5O+7dxDbaAGCY7ElApm1G/o+IP6D+XUp2MWM9U=;
        b=WjhZoFgLyz1ZQ+j3oa3JYz8WZ7Fp0nfK0KoIuPSV6RT8K/jRl58I1ULT7MkDc4YBWN
         OacT+41UrndAhxsaxR+ELHgxeZ2l+DrirP2zFiSKl6pQhgYgPm1gNEgeTUuhObhjrSyr
         eJ2MOHiZ22fzaHPFpnELtwmSR+i8pWDEHTNW1ffr7R493vhHjnCXagcp5TIdrOZtCgx9
         i4hyxRQ/6CfvQ5aLpBmqDK5vfMDgfJinDC1MkZ60xjvVm+fX+kK4kCdWCUP+Kbm7Ysxq
         FbGwxBdjeqGnVIgtqS1/XfwNxX5EjH4ntgOhT41EG6SHvlQ5O+CKDcx4TUxsPjkINCzU
         e2iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762937134; x=1763541934;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7AdkK5O+7dxDbaAGCY7ElApm1G/o+IP6D+XUp2MWM9U=;
        b=KnMGGVR1NtTn6Vr1I8m3RIh0LmHmdSeqfGaG5JwHM+5waTLeKoV9Ebb8Gzq/foGeW7
         nhac81jf4UqM444sezOxJpnaS+oJr2LxJFNFiHYKVmnqWlo2bZV5doCNdCZny8XFBlPF
         8Wd2XaURCh0xTpS8JDbNDw/SutWIeGOTP62hF/JgCWAPERlEZiRQrgmsl/EwDi2hCbFu
         6rvLTxG9dgUWEDEUpGNIqEjh8xo17oaBUyx/14qmNQ1gWz6f/tC0k6P2LWW578F6moJO
         HNvPc7QyeIfAJ/4VHafmJT4ExvzrmGotveL6KES3nfIBM94nTSXHfvzgr5ELcqt8lcxb
         61HQ==
X-Forwarded-Encrypted: i=1; AJvYcCVtRSLEXCHE3U3l+nRaW39Ucl9bkOzhtWQ44CAaDqPmEJht/+FnjZXbt10OoaSsRdX+WdAnPxV91GJHpINu@vger.kernel.org
X-Gm-Message-State: AOJu0YyfMN9qQAhOW64U2glHgQmxy3/I4kUFMrT2B1EJMfWkDdaN7CGq
	MhBOaNTXgccdq+hVAM38+5ZFmsHh/7t5979DNZhikioIGhu9G5U5fiH0GjbzKewMHmylLFV2jlB
	7ojiGDkaNB8OqkIdfyYrgN0SR2HgYojSG2sxnLfPGsXxRlXOjV5REWCrYWZWUjObNphOy9r0NF4
	Qia1k=
X-Gm-Gg: ASbGncsv4/lU+PD95vnuLlNIS4lS+8QaGcwoCtxh62lmRhlJCahur5aWsCr7RnCGuZU
	OXAcICda5yrcPaB9AlUcg/faBVHKTCcGfbUf15MdOyh/LHc7aT+SvYkOSMXryZI5Bkm2+6l1RrC
	k2Q5hpN/LVdG5nodKh+KYBNS4JdWJBBLA4gw+5uy/nUTaOC2bvLcbdwk+WPd7v7nzQAO3HaWt6y
	56rtDgYrNJ8daeTNfc+eViW+NLYCo93AaeYhIUEJa5Jd4RN+eGFQjWZanNzmcr68r3LKGXl/krT
	H1VvOHkKxOIfGdnOgeJrRkVY5VZqbd+toltjHmjZhMPwfXGA6iF1DYzN2zbtv3aHmtCeqsgurcI
	KabOKSMuV3SJwPCHR7rT3Cee4uyI=
X-Received: by 2002:a17:90b:2687:b0:340:e521:bc73 with SMTP id 98e67ed59e1d1-343dde076d2mr2688714a91.5.1762937134260;
        Wed, 12 Nov 2025 00:45:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFwz2Db+4kQJjfwasDqQh9VAgmUpzkXOtRxQsrw/LTNU1YM+vqEWileBmu3/PXVJSjL89IjCQ==
X-Received: by 2002:a17:90b:2687:b0:340:e521:bc73 with SMTP id 98e67ed59e1d1-343dde076d2mr2688680a91.5.1762937133633;
        Wed, 12 Nov 2025 00:45:33 -0800 (PST)
Received: from [10.219.57.134] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bbf1782bed9sm2017330a12.27.2025.11.12.00.45.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Nov 2025 00:45:33 -0800 (PST)
Message-ID: <33826089-54b5-47bc-8a5b-6004c7a276b8@oss.qualcomm.com>
Date: Wed, 12 Nov 2025 14:15:23 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v18 0/5] iommu/arm-smmu: introduction of ACTLR
 implementation for Qualcomm SoCs
To: Enric Balletbo i Serra <eballetb@redhat.com>
Cc: robdclark@gmail.com, will@kernel.org, robin.murphy@arm.com,
        joro@8bytes.org, jgg@ziepe.ca, jsnitsel@redhat.com, robh@kernel.org,
        krzysztof.kozlowski@linaro.org, quic_c_gdjako@quicinc.com,
        dmitry.baryshkov@linaro.org, iommu@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
        Eric Chanudet <echanude@redhat.com>, charan.kalla@oss.qualcomm.com
References: <20241212151402.159102-1-quic_bibekkum@quicinc.com>
 <CALE0LRupg93WsBVc62Lqt-T9qmK5MdEYoScxyP7=ttKJYXAsUA@mail.gmail.com>
Content-Language: en-US
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
In-Reply-To: <CALE0LRupg93WsBVc62Lqt-T9qmK5MdEYoScxyP7=ttKJYXAsUA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDA2OSBTYWx0ZWRfX7DrKRsZFkPLM
 fLEuG1yNdS/yCJZOABNUXp0nef03feqnLBthIMZlacqtmIbmD6ea8gqbjkybaxA2DfIEwXWjxkM
 jCwJA2QNLOyAskN315t7mUVf70rBtQmC/JXeAVRDCYCQK7nvoHzrL2FutucmVvnthiENgeMWQWH
 aiD9agpgluGcjVfOwsMkIB3/Ok6Jgv46+XI4Z/FCwAHn0X1ju6Zp+vEJprp3ZC1KCjt5UajVEUN
 7Inp+9E/2qEhb60YAA0V3hySAgFbc2y1JHGS98g2oidHftNTjm2YdYEvPD+adka1l2GSpD8pFoW
 IeWC7OmyCJWUVbjuRntUXeK37ZfEYQJvorzZzvc8qY8mnOElBh22QIGfRiSTImmGAYik7niie0a
 GkfNiMssyaSWaaewIdfxwxKntXoFwg==
X-Proofpoint-ORIG-GUID: QN0uo6oxbBk_be85Nc46A9QkdJG_ClzP
X-Proofpoint-GUID: QN0uo6oxbBk_be85Nc46A9QkdJG_ClzP
X-Authority-Analysis: v=2.4 cv=SvudKfO0 c=1 sm=1 tr=0 ts=6914492f cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=QyXUC8HyAAAA:8
 a=i3X5FwGiAAAA:8 a=IwmKZYd7MzYLTnFNQdAA:9 a=Grs_iVrwZwWKvRdj:21
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
 a=TjNXssC_j7lpFel5tvFf:22 a=mmqRlSCDY2ywfjPLJ4af:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_02,2025-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 impostorscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 spamscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511120069



On 11/7/2025 2:58 PM, Enric Balletbo i Serra wrote:
> On Thu, Dec 12, 2024 at 4:14 PM Bibek Kumar Patro
> <quic_bibekkum@quicinc.com> wrote:
>>
>> This patch series consist of six parts and covers the following:
>>
>> 1. Provide option to re-enable context caching to retain prefetcher
>>     settings during reset and runtime suspend.
>>
>> 2. Remove cfg inside qcom_smmu structure and replace it with single
>>     pointer to qcom_smmu_match_data avoiding replication of multiple
>>     members from same.
>>
>> 3. Add support for ACTLR PRR bit setup via adreno-smmu-priv interface.
>>
>> 4. Introduce intital set of driver changes to implement ACTLR register
>>     for custom prefetcher settings in Qualcomm SoCs.
>>
>> 5. Add ACTLR data and support for qcom_smmu_500.
>>
>> Changes in v18 from v17_RESEND:
>>   - 1/5 : No changes
>>   - 2/5 : No changes - reviewed-by tags collected
>>   - 3/5 : Addition of
>>     pm_runtime_resume_and_get()/pm_runtime_put_autosuspend()
>>     around register access of PRR related private interfaces
>>     as discussed in v17_RESEND.
>>   - 4/5, 5/5 : No changes - reviewed-by tags collected
>>   Link to v17_RESEND:
>>   https://lore.kernel.org/all/20241114160721.1527934-1-quic_bibekkum@quicinc.com/
>>
>> Resend of v17:
>>   Addition of minor fix of the build warning reported by kernel test robot [1] by powerpc_random config [2].
>>   [1]:https://lore.kernel.org/all/202411140748.6mcFdJdO-lkp@intel.com/#t
>>   [2]:https://download.01.org/0day-ci/archive/20241114/202411140748.6mcFdJdO-lkp@intel.com/config
>>
>> Changes in v17 from v16:
>>   Tags provided earlier not collected yet on patch 1/5, 3/5, 4/5, 5/5
>>   due to the following revisions:
>>   - 1/5 : Move the CPRE workaround out of qualcomm specific logic and gate with config
>>           , update the silicon-errata.rst file
>>   - 2/5 : No changes - reviewed-by tags collected
>>   - 3/5 : Move the compatible check before assignment of callback as suggested.
>>   - 4/5 : Add the actlr setting for *adreno variant* of MMU-500 as well.
>>   - 5/5 : Due to changes in 1/5, minor refactoring had to be done before adding table.
>>   Link to v16:
>>   https://lore.kernel.org/all/20241008125410.3422512-1-quic_bibekkum@quicinc.com/
>>
>> Changes in v16 from v15:
>>   - Incorporate Dimitry's suggestion on patch 4/5 to use dev_dbg instead of dev_notice.
>>   - Fix kernel test robot warning [1] coming for 32bit architecture configuration.
>>   - Updatingthe tags
>>   [1]: https://lore.kernel.org/all/202409230343.Q8KnYl2w-lkp@intel.com/
>>   Link to v15:
>>   https://lore.kernel.org/all/20240920155813.3434021-1-quic_bibekkum@quicinc.com/
>>
>> Changes in v15 from v14:
>>   - As discussed with Robin and Dmitry modify the actlr table and logic to use
>>     compatible string instead of sid, mask for device matching which is
>>     similar to qcom_smmu_client_of_match mechanism.
>>   - Expand the comment in qcom_smmu500_reset to document reason why CPRE bit is re-enabled again
>>     after arm_mmu500_reset resets the bit.
>>   - Rearrange the series in order to keep prefetch setting patches in the end.
>>   Link to v14:
>>   https://lore.kernel.org/all/20240816174259.2056829-1-quic_bibekkum@quicinc.com/
>>
> 
> Hi all,
> 
> I've been looking at the evolution of the Qualcomm SMMU driver
> (arm-smmu-qcom.c) and had a question about the design change for
> configuring the SMMU_CB_ACTLR register.
> 
> It appears there are two different approaches:
> 
> 1. The "SID" Approach (Older): In some versions, a driver would use a
> large, platform-specific struct (e.g., sa8775p_apps_actlr_cfg) that
> maps individual Stream IDs (SIDs) to specific ACTLR values. This
> allowed for very granular, per-SID tuning. For example, a device with
> 10 SIDs could have a specific setting for just one (0x2141), while the
> others used a default.
> 
> 2. The "Compatible String" Approach (Newer/Upstream): The current
> upstream driver appears to use a client_match array (an of_device_id
> list) in qcom_smmu_init_context. This maps a device's compatible
> string to a single ACTLR value, which is then written to the device's
> assigned Context Bank.
> 
> I want to make sure I understand the implications of this new, simpler
> approach, as it seems to introduce a trade-off where granularity is
> lost:
> 
> Multiple SIDs, One Device: A single device that uses many SIDs in the
> device tree (e.g., the video codec, which might list 0x2141, 0x25C1,
> 0x2161, etc.) will now have one ACTLR setting applied to the Context
> Bank that serves all of those SIDs, even if the old SID-based list
> only specified a setting for one of them.
> 
> Am I correct in this analysis? I'm assuming this was an intentional
> design choice to simplify the driver, based on the assumption that all
> SIDs for a single device (and all devices with the same compatible)
> can share the same ACTLR tuning.
> 

Hi Eric,

If a device has multiple SIDs, all serving the same functionality and 
grouped under the same "iommus" field, for example:

iommus = <&apps_smmu, 0x2141, 0x0>,
           <&apps_smmu, 0x25c1, 0x0>,
           <&apps_smmu, 0x2161, 0x0>;

In this case, all the SIDs will be associated with the same context 
bank. Even if the three SIDs have different ACTLR settings, since 
SMMU_CB_ACTLR is per CB setting, all SIDs attached to that bank will 
share the same ACTLR configuration. This is why we designed it to be 
"per device / per compatible".

Thanks & regards,
Bibek

> I'm working on porting settings for an sa8775p board and just want to
> ensure I'm migrating the logic correctly to this new client_match
> method.
> 
> Thanks for any clarification you can provide.
> 
> Best regards,
> 
>     Enric
> 
> 
>> Changes in v14 from v13:
>>   Patch 6/6:
>>   - As discussed incorprate changes to carry out PRR implementation only for
>>     targets based on MMU-500 by using compat string based SMMU version detection.
>>   - Split the set_actlr interface into two separate interface namely set_prr_bit
>>     and set_prr_addr to set the prr enable bit and prr page address resepectively.
>>   Patch 3/6:
>>    - Fix a bug in gfx actlr_config which is uncovered while testing the gfx actlr setting in sc7280
>>      during PRR experiment which prevented clients on certain sids of gfx smmmu to be skipped during
>>      setting up of the ACTLR values : Fix involves swapping the arguments passed in smr_is_subset to make
>>       device smr <from devicetree> a subset of actlr_config table entries < defined in the driver>.
>>   Patch 4/6, 5/6:
>>    - Sort the actlr table values in increasing order of the SIDs.
>>   Link to v13:
>>   https://lore.kernel.org/all/20240628140435.1652374-1-quic_bibekkum@quicinc.com/
>>
>> Changes in v13 from v12:
>>   - Fix the compilation issues reported by kernel test robot [1].
>>   [1]: https://lore.kernel.org/all/202406281241.xEX0TWjt-lkp@intel.com/#t
>>   Link to v12:
>>   https://lore.kernel.org/all/20240626143020.3682243-1-quic_bibekkum@quicinc.com/
>>
>> Changes in v12 from v11:
>>   Changes to incorporate suggestion from Rob:
>>   - Fix the set and reset logic for prr bit as pointed out in v11-6/6.
>>   - Rename set_actlr_bit function name to set_prr.
>>   - Add extension for PRR name as Partially-Resident-Region in comments
>>     for set_prr function.
>>   - Add few missing sids for sc7280 in patch-5/6.
>>   Link to v11:
>>   https://lore.kernel.org/all/20240605121713.3596499-1-quic_bibekkum@quicinc.com/
>>
>> Changes in v11 from v10:
>>   - Include a new patch 6/6 to add support for ACTLR PRR bit
>>     through adreno-smmu-priv interface as suggested by Rob and Dmitry.
>>   Link to v10:
>>   https://lore.kernel.org/all/20240524131800.2288259-1-quic_bibekkum@quicinc.com/
>>
>> Changes in v10 from v9:
>>   - Added reviewed-by tags 1/5,2/5,3/5.
>>   Changes incorporated:
>>   - Remove redundant PRR bit setting from gfx actlr table(patch 4/5,5/5)
>>     as this bit needs special handling in the gfx driver along with
>>     the associated register settings.
>>   Link to discussion on PRR bit:
>>   https://lore.kernel.org/all/f2222714-1e00-424e-946d-c314d55541b8@quicinc.com/
>>   Link to v9:
>>   https://lore.kernel.org/all/20240123144543.9405-1-quic_bibekkum@quicinc.com/
>>
>> Changes in v9 from v8:
>>   Changes to incorporate suggestions from Konrad as follows:
>>   - Re-wrap struct members of actlr_variant in patch 4/5,5/5
>>     in a cleaner way.
>>   - Move actlr_config members to the header.
>>   Link to v8:
>>   https://lore.kernel.org/all/20240116150411.23876-1-quic_bibekkum@quicinc.com/
>>
>> Changes in v8 from v7:
>>   - Added reviewed-by tags on patch 1/5, 2/5.
>>   Changes to incorporate suggestions from Pavan and Konrad:
>>   - Remove non necessary extra lines.
>>   - Use num_smmu and num_actlrcfg to store the array size and use the
>>     same to traverse the table and save on sentinel space along with
>>     indentation levels.
>>   - Refactor blocks containing qcom_smmu_set_actlr to remove block
>>     repetition in patch 3/5.
>>   - Change copyright year from 2023 to 2022-2023 in patch 3/5.
>>   - Modify qcom_smmu_match_data.actlrvar and actlr_variant.actlrcfg to
>>     const pointer to a const resource.
>>   - use C99 designated initializers and put the address first.
>>   Link to v7:
>>   https://lore.kernel.org/all/20240109114220.30243-1-quic_bibekkum@quicinc.com/
>>
>> Changes in v7 from v6:
>>   Changes to incorporate suggestions from Dmitry as follows:
>>   - Use io_start address instead of compatible string to identify the
>>     correct instance by comparing with smmu start address and check for
>>     which smmu the corresponding actlr table is to be picked.
>> Link to v6:
>> https://lore.kernel.org/all/20231220133808.5654-1-quic_bibekkum@quicinc.com/
>>
>> Changes in v6 from v5:
>>   - Remove extra Suggested-by tags.
>>   - Add return check for arm_mmu500_reset in 1/5 as discussed.
>> Link to v5:
>> https://lore.kernel.org/all/20231219135947.1623-1-quic_bibekkum@quicinc.com/
>>
>> Changes in v5 from v4:
>>   New addition:
>>   - Modify copyright year in arm-smmu-qcom.h to 2023 from 2022.
>>   Changes to incorporate suggestions from Dmitry as follows:
>>   - Modify the defines for prefetch in (foo << bar) format
>>     as suggested.(FIELD_PREP could not be used in defines
>>     is not inside any block/function)
>>   Changes to incorporate suggestions from Konrad as follows:
>>   - Shift context caching enablement patch as 1/5 instead of 5/5 to
>>     be picked up as independent patch.
>>   - Fix the codestyle to orient variables in reverse xmas tree format
>>     for patch 1/5.
>>   - Fix variable name in patch 1/5 as suggested.
>>   Link to v4:
>> https://lore.kernel.org/all/20231215101827.30549-1-quic_bibekkum@quicinc.com/
>>
>> Changes in v4 from v3:
>>   New addition:
>>   - Remove actlrcfg_size and use NULL end element instead to traverse
>>     the actlr table, as this would be a cleaner approach by removing
>>     redundancy of actlrcfg_size.
>>   - Renaming of actlr set function to arm_smmu_qcom based proprietary
>>     convention.
>>   - break from loop once sid is found and ACTLR value is initialized
>>     in qcom_smmu_set_actlr.
>>   - Modify the GFX prefetch value separating into 2 sensible defines.
>>   - Modify comments for prefetch defines as per SMMU-500 TRM.
>>   Changes to incorporate suggestions from Konrad as follows:
>>   - Use Reverse-Christmas-tree sorting wherever applicable.
>>   - Pass arguments directly to arm_smmu_set_actlr instead of creating
>>     duplicate variables.
>>   - Use array indexing instead of direct pointer addressed by new
>>     addition of eliminating actlrcfg_size.
>>   - Switch the HEX value's case from upper to lower case in SC7280
>>     actlrcfg table.
>>   Changes to incorporate suggestions from Dmitry as follows:
>>   - Separate changes not related to ACTLR support to different commit
>>     with patch 5/5.
>>   - Using pointer to struct for arguments in smr_is_subset().
>>   Changes to incorporate suggestions from Bjorn as follows:
>>   - fix the commit message for patch 2/5 to properly document the
>>     value space to avoid confusion.
>>   Fixed build issues reported by kernel test robot [1] for
>>   arm64-allyesconfig [2].
>>   [1]: https://lore.kernel.org/all/202312011750.Pwca3TWE-lkp@intel.com/
>>   [2]:
>> https://download.01.org/0day-ci/archive/20231201/202312011750.Pwca3TWE-lkp@intel.com/config
>>   Link to v3:
>> https://lore.kernel.org/all/20231127145412.3981-1-quic_bibekkum@quicinc.com/
>>
>> Changes in v3 from v2:
>>   New addition:
>>   - Include patch 3/4 for adding ACTLR support and data for SC7280.
>>   - Add driver changes for actlr support in gpu smmu.
>>   - Add target wise actlr data and implementation ops for gpu smmu.
>>   Changes to incorporate suggestions from Robin as follows:
>>   - Match the ACTLR values with individual corresponding SID instead
>>     of assuming that any SMR will be programmed to match a superset of
>>     the data.
>>   - Instead of replicating each elements from qcom_smmu_match_data to
>>     qcom_smmu structre during smmu device creation, replace the
>>     replicated members with qcom_smmu_match_data structure inside
>>     qcom_smmu structre and handle the dereference in places that
>>     requires them.
>>   Changes to incorporate suggestions from Dmitry and Konrad as follows:
>>   - Maintain actlr table inside a single structure instead of
>>     nested structure.
>>   - Rename prefetch defines to more appropriately describe their
>>     behavior.
>>   - Remove SM8550 specific implementation ops and roll back to default
>>     qcom_smmu_500_impl implementation ops.
>>   - Add back the removed comments which are NAK.
>>   - Fix commit description for patch 4/4.
>>   Link to v2:
>> https://lore.kernel.org/all/20231114135654.30475-1-quic_bibekkum@quicinc.com/
>>
>> Changes in v2 from v1:
>>   - Incorporated suggestions on v1 from Dmitry,Konrad,Pratyush.
>>   - Added defines for ACTLR values.
>>   - Linked sm8550 implementation structure to corresponding
>>     compatible string.
>>   - Repackaged actlr value set implementation to separate function.
>>   - Fixed indentation errors.
>>   - Link to v1:
>> https://lore.kernel.org/all/20231103215124.1095-1-quic_bibekkum@quicinc.com/
>>
>> Changes in v1 from RFC:
>>   - Incorporated suggestion form Robin on RFC
>>   - Moved the actlr data table into driver, instead of maintaining
>>     it inside soc specific DT and piggybacking on exisiting iommus
>>     property (iommu = <SID, MASK, ACTLR>) to set this value during
>>     smmu probe.
>>   - Link to RFC:
>> https://lore.kernel.org/all/a01e7e60-6ead-4a9e-ba90-22a8a6bbd03f@quicinc.com/
>>
>> Bibek Kumar Patro (5):
>>    iommu/arm-smmu: re-enable context caching in smmu reset operation
>>    iommu/arm-smmu: refactor qcom_smmu structure to include single pointer
>>    iommu/arm-smmu: add support for PRR bit setup
>>    iommu/arm-smmu: introduction of ACTLR for custom prefetcher settings
>>    iommu/arm-smmu: add ACTLR data and support for qcom_smmu_500
>>
>>   Documentation/arch/arm64/silicon-errata.rst   |   3 +-
>>   drivers/iommu/Kconfig                         |  12 ++
>>   drivers/iommu/arm/arm-smmu/arm-smmu-impl.c    |   5 +-
>>   .../iommu/arm/arm-smmu/arm-smmu-qcom-debug.c  |   2 +-
>>   drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c    | 120 +++++++++++++++++-
>>   drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h    |   3 +-
>>   drivers/iommu/arm/arm-smmu/arm-smmu.h         |   2 +
>>   include/linux/adreno-smmu-priv.h              |  14 ++
>>   8 files changed, 155 insertions(+), 6 deletions(-)
>>
>> --
>> 2.34.1
>>
>>
> 


