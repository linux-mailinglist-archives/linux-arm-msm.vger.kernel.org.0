Return-Path: <linux-arm-msm+bounces-104639-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id HDzJJ6US72kP5wAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104639-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 09:39:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF8846E763
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 09:39:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7FA30300B990
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 07:39:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AB0A3806AF;
	Mon, 27 Apr 2026 07:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fDvbdHqM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S3kHd/Ai"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94B4437C91A
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 07:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777275552; cv=none; b=rwgZk+Ef8YPLmW4rITAxQbDSlsvXpfhSReHf4uveoDhW8PVNH+QK4DHkI9cQGkXWuvJRKv9TE2rurtnn88HLddIRI1FFLeQTr2BbfrHArTuYsij9j0eZSDy5Yfvn810RM94yd/xQ1WeFbKH8bhsWbk3TVrHqY3PuUEhiF7JWd8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777275552; c=relaxed/simple;
	bh=ApWm5+ezgV560R6HFZZnrW6Y6rftaCi+q3ntLzz9+uI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gQokXL1rG2iTg4iduU4fatWgN4HSB98nyUPaXEDtwRmNIzxjIbBCsK8dorW5Y67WMEZJnxy0xbYgGb857QLjwUq27Sz3Uy6Covph5DGnssz/rHcfTQRgSj6PfTP1F6T3+XcCEAcWNcDiI8lLvTONJsI6Z6pE7MxlKyUfTs+mLE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fDvbdHqM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S3kHd/Ai; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R64EqE2582817
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 07:39:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YSF93J6G5/0g0jzcBWjwV6lhwpYbylA3GIwtBNzfErQ=; b=fDvbdHqMf1/pO/D1
	QOP2xYhcr+zEsdG6Eefd2y4/MS8TTcGwEVQcvWMCBbmpuGi3HFoI35OZ1eGbNx9O
	3o7P24RTPA/h7atSOBWxo917XIM/DQjpBipZUTsL3LMKHpKyfrLIMrO6uC2e2S1s
	91ILCfJZNPMO7G8f4JPO4hSn4zR0QP5ZcZIBlRYobFxmma+pmCOUdDd3nxYdFHLP
	HUtMP4wrcctgLl5BZLgnVOmu9HJnB7lClRiTNk7JmQy+VSZSF2wlObBNNPK+SXRh
	hbzIYFeVspfLdttjpGgyORiyyQrG+ZjmATdElueDSu+F9To99lpT+d1B6j5+bfH5
	M/i6wg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt26xgb3f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 07:39:09 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82f0e12d375so5740008b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 00:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777275548; x=1777880348; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YSF93J6G5/0g0jzcBWjwV6lhwpYbylA3GIwtBNzfErQ=;
        b=S3kHd/AiOXZuhYoGRL/JMh7ncB2XR/Qxe9MinHuuh1JROZIoWi5kXOFQXqZS3NFHXB
         cc+xSDe448EohpC/58qYQH9LHtGTQGVLSvhF8+4nf8kgrRkQZIA0KN2VUzkFHcntNyA/
         cqc/AKxuPk5EhQq7Qxv04uU4/qdaoU6/+X1u+ZDpWorMxVJeUBYXB6VeA7ewLvAvAY55
         qgDydfPfK58OXc006GqWrN4WoA6TAAF2LI6gFULp8tB7w0HY8HVIzdwLRSgpBFeOKQEe
         NSsveQUedW8LrWlOfJBLjp3XJjFYT2hhYD/Yi2Ps+Dg50keH5wnGWf3M/bHLRDU/AfhB
         SWhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777275548; x=1777880348;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YSF93J6G5/0g0jzcBWjwV6lhwpYbylA3GIwtBNzfErQ=;
        b=ReD86avkgQgn5ik5HAL2rm2F8sjzBFf4m87SyJwKtNshyZDRmHAlCSVCWbdVRLptHu
         wdLW6JUdOjrZ0n109Wb+xjMLHX9v/7d3EwKo8O6we27dhsxWAG5aKx7cJwrKn23gn6RU
         DYPsRT0PSrrykF9XqxaKTV6/7JdyIOLOfDkqdsWkrQc8L12Ll4AwYqD3Y2KdH1rAodIP
         DmHNAyrliNA+tBDG63D+/qUeLKbL17nlEG52pjSRveiJye+Ip0fKGOz5F3Lb5+VpaAWf
         pHSLfC6cYBYfFY0QogRapQkcUcpYGEXbPII3Mhj+zG2JrRhn/rn+b7A0bfXDNBiWvPwT
         bkKg==
X-Forwarded-Encrypted: i=1; AFNElJ/a589QdQxwq01Z+0VqpyMUCU4rJkpwAvfm1ahcyuFknTptxrmf1igpOMkhac85QWzrVDLhpAecT9YqRJft@vger.kernel.org
X-Gm-Message-State: AOJu0YyawHMO+0F7fcrMQmGi0EwqfWx0qmMhOytgLC+8jQ5r/cBQtPnu
	hU1ZRiPtvGTrkrv7BrbTirXeAk1A9vWP5SchDecWULRRxA7Zy+dOsdJWhH6c6cetdtKKstKO2oC
	mvpcbZfAwcSeW8DFoXNUwn3prtVOk956+GXl0TsgFYK9e8R8ZyGf34MGQQ4WwZwnyIqJt
X-Gm-Gg: AeBDiev2Bkks4Je+bYPKMp7T1TX64FnXd8aEY+Mcy/IvdwlwCH0iJYRH3+W+b6LhQdM
	VrBSiuVMuN4ierPSUV5Qe7OqL+QyOBiME7RKFZ4zHC8qrh5Bq18F7pUdkP8vR+X06ArLgPu4JTo
	iOCPdszQkTDnNULHJDb0YQ9ECCkq9TxK2y7B0nGbiDjYZMSeYKqq/+EL/u2d19mAfFGO2krbNzd
	i/dUCkdnwzKiAUp+Wh0ew1W++BJF4/QIwCuKU8eC0RH/qmNaPjH5WQ7FWtdWWI3gNrnlpcAzWgM
	vXzLh0n2WX69FdGA9UALChswdhMi7uFS3zQ3dJelvrT9JVca3/u/hPfyAriKivCRZM3ANUVBHhr
	o3jcuIhlDcoW2wJYlLUuI39ki6XxkNXM/AxwxO7tJgh+a9cSffGIRdIkCbCgUfJEc1lAh48gmgx
	hX4wFS23TGOzcs2RMe2Rlx
X-Received: by 2002:a05:6a00:2d15:b0:82f:6a87:f75 with SMTP id d2e1a72fcca58-82f8c93e84bmr44502088b3a.33.1777275548173;
        Mon, 27 Apr 2026 00:39:08 -0700 (PDT)
X-Received: by 2002:a05:6a00:2d15:b0:82f:6a87:f75 with SMTP id d2e1a72fcca58-82f8c93e84bmr44502050b3a.33.1777275547640;
        Mon, 27 Apr 2026 00:39:07 -0700 (PDT)
Received: from [10.133.33.62] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e9d2f9asm33111087b3a.19.2026.04.27.00.39.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 00:39:07 -0700 (PDT)
Message-ID: <337789c5-7311-4613-9daf-915fcae0c6fc@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 15:39:02 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 3/4] coresight: cti: add Qualcomm extended CTI
 identification and quirks
To: Yingchao Deng <yingchao.deng@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        quic_yingdeng@quicinc.com, Jinlong Mao <jinlong.mao@oss.qualcomm.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
References: <20260426-extended-cti-v8-0-23b900a4902f@oss.qualcomm.com>
 <20260426-extended-cti-v8-3-23b900a4902f@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260426-extended-cti-v8-3-23b900a4902f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ANHlHo2fUemWkhq6ONeXwIXjCqaeHXMk
X-Proofpoint-ORIG-GUID: ANHlHo2fUemWkhq6ONeXwIXjCqaeHXMk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDA4MCBTYWx0ZWRfXzZPpfGiavs4k
 cHwzemx6WuW/bnxBwWid1uLzZOVEM3ik7oQDoXEGvLL37ZZ1uz/9SFkehBDzkukDqegPqZLyREx
 gWGV5DoqM8hSijx5e5FpgZKl9KjY8uIz73b2QdgkYYjKeIO7r2+x+16haH6mn7x7JBNxoWhGEwK
 LKtmM5mKncZtROGWEQjwWBNhsXZw74nqVAU3eN3HvF77NNDeZJMhDdnhRZSJM70IouQz6zJhdLR
 ouvmkYpJuaP5VPsWeFN0ysedLAnaBQUQ+oazu6Uwx3DFPqMnFmguOYbhUo+VVGob6a8nODnCndn
 OBdQWyHXqcFVjj4Jt/BvOBgj+GXm6EuyOL6vXsMk6qi2WTazlis8IjfeTuUrz9rgkC24kESQyOB
 E6VK4NujZQjgDE6LXi1R6tvYXX0lTyUYgKhzUqjG/5XS2zUEJgEGM3fXNV8wQSfM6Rt2WZ8kfYe
 9/h/n6eeGQ5PetSM1kQ==
X-Authority-Analysis: v=2.4 cv=FM8rAeos c=1 sm=1 tr=0 ts=69ef129d cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=Fi1y-F4gZlMYRSbziuEA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 bulkscore=0 phishscore=0
 spamscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270080
X-Rspamd-Queue-Id: 0BF8846E763
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-104639-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]



On 4/26/2026 5:44 PM, Yingchao Deng wrote:
> Qualcomm implements an extended variant of the ARM CoreSight CTI with a
> different register layout and vendor-specific behavior. While the
> programming model remains largely compatible, the register offsets differ
> from the standard ARM CTI and require explicit handling.
> 
> Detect Qualcomm CTIs via the DEVARCH register and record this in the CTI
> driver data. Introduce a small mapping layer to translate standard CTI
> register offsets to Qualcomm-specific offsets, allowing the rest of the
> driver to use a common register access path.
> 
> Additionally, handle a Qualcomm-specific quirk where the CLAIMSET
> register is incorrectly initialized to a non-zero value, which can cause
> tools or drivers to assume the component is already claimed. Clear the
> register during probe to reflect the actual unclaimed state.
> 
> No functional change is intended for standard ARM CTI devices.
> 
> Co-developed-by: Jinlong Mao <jinlong.mao@oss.qualcomm.com>
> Signed-off-by: Jinlong Mao <jinlong.mao@oss.qualcomm.com>
> Signed-off-by: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
> ---
>   drivers/hwtracing/coresight/coresight-cti-core.c | 28 +++++++++-
>   drivers/hwtracing/coresight/coresight-cti.h      |  4 +-
>   drivers/hwtracing/coresight/qcom-cti.h           | 65 ++++++++++++++++++++++++
>   3 files changed, 95 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-cti-core.c b/drivers/hwtracing/coresight/coresight-cti-core.c
> index c4cbeb64365b..b1c69a3e9b99 100644
> --- a/drivers/hwtracing/coresight/coresight-cti-core.c
> +++ b/drivers/hwtracing/coresight/coresight-cti-core.c
> @@ -21,6 +21,7 @@
>   
>   #include "coresight-priv.h"
>   #include "coresight-cti.h"
> +#include "qcom-cti.h"
>   
>   /*
>    * CTI devices can be associated with a PE, or be connected to CoreSight
> @@ -47,6 +48,10 @@ static void __iomem *cti_reg_addr(struct cti_drvdata *drvdata, int reg)
>   	u32 offset = CTI_REG_CLR_NR(reg);
>   	u32 nr = CTI_REG_GET_NR(reg);
>   
> +	/* convert to qcom specific offset */
> +	if (unlikely(drvdata->is_qcom_cti))

I prefer to drop the unlikely here, let the cpu do the branch predictor.

> +		offset = cti_qcom_reg_off(offset);
> +
>   	return drvdata->base + offset + sizeof(u32) * nr;
>   }
>   
> @@ -170,6 +175,9 @@ void cti_write_intack(struct device *dev, u32 ackval)
>   /* DEVID[19:16] - number of CTM channels */
>   #define CTI_DEVID_CTMCHANNELS(devid_val) ((int) BMVAL(devid_val, 16, 19))
>   
> +/* DEVARCH[31:21] - ARCHITECT */
> +#define CTI_DEVARCH_ARCHITECT(devarch_val) ((int)BMVAL(devarch_val, 21, 31))
> +
>   static int cti_set_default_config(struct device *dev,
>   				  struct cti_drvdata *drvdata)
>   {
> @@ -700,6 +708,7 @@ static int cti_probe(struct amba_device *adev, const struct amba_id *id)
>   	struct coresight_desc cti_desc;
>   	struct coresight_platform_data *pdata = NULL;
>   	struct resource *res = &adev->res;
> +	u32 devarch;
>   
>   	/* driver data*/
>   	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
> @@ -724,6 +733,22 @@ static int cti_probe(struct amba_device *adev, const struct amba_id *id)
>   
>   	raw_spin_lock_init(&drvdata->spinlock);
>   
> +	devarch = readl_relaxed(drvdata->base + CORESIGHT_DEVARCH);
> +	if (CTI_DEVARCH_ARCHITECT(devarch) == ARCHITECT_QCOM) {
> +		drvdata->is_qcom_cti = true;
> +		/*
> +		 * QCOM CTI does not implement Claimtag functionality as
> +		 * per CoreSight specification, but its CLAIMSET register
> +		 * is incorrectly initialized to 0xF. This can mislead
> +		 * tools or drivers into thinking the component is claimed.
> +		 *
> +		 * Reset CLAIMSET to 0 to reflect that no claims are active.
> +		 */
> +		CS_UNLOCK(drvdata->base);
> +		writel_relaxed(0, drvdata->base + CORESIGHT_CLAIMSET);
> +		CS_LOCK(drvdata->base);
> +	}
> +
>   	/* initialise CTI driver config values */
>   	ret = cti_set_default_config(dev, drvdata);
>   	if (ret)
> @@ -780,7 +805,8 @@ static int cti_probe(struct amba_device *adev, const struct amba_id *id)
>   
>   	/* all done - dec pm refcount */
>   	pm_runtime_put(&adev->dev);
> -	dev_info(&drvdata->csdev->dev, "CTI initialized\n");
> +	dev_info(&drvdata->csdev->dev,
> +		 "%sCTI initialized\n", drvdata->is_qcom_cti ? "QCOM " : "");
>   	return 0;
>   }
>   
> diff --git a/drivers/hwtracing/coresight/coresight-cti.h b/drivers/hwtracing/coresight/coresight-cti.h
> index dd1ba44518c4..2598601e7b93 100644
> --- a/drivers/hwtracing/coresight/coresight-cti.h
> +++ b/drivers/hwtracing/coresight/coresight-cti.h
> @@ -55,10 +55,11 @@ struct fwnode_handle;
>   /*
>    * CTI CSSoc 600 has a max of 32 trigger signals per direction.
>    * CTI CSSoc 400 has 8 IO triggers - other CTIs can be impl def.
> + * QCOM CTI supports up to 128 trigger signals per direction.
>    * Max of in and out defined in the DEVID register.
>    * - pick up actual number used from .dts parameters if present.
>    */
> -#define CTIINOUTEN_MAX		32
> +#define CTIINOUTEN_MAX		128
>   
>   /*
>    * Encode CTI register offset and register index in one u32:
> @@ -188,6 +189,7 @@ struct cti_drvdata {
>   	raw_spinlock_t spinlock;
>   	struct cti_config config;
>   	struct list_head node;
> +	bool is_qcom_cti;

missed document.

Thanks,
Jie

>   };
>   
>   /*
> diff --git a/drivers/hwtracing/coresight/qcom-cti.h b/drivers/hwtracing/coresight/qcom-cti.h
> new file mode 100644
> index 000000000000..fd1bf07d7cb4
> --- /dev/null
> +++ b/drivers/hwtracing/coresight/qcom-cti.h
> @@ -0,0 +1,65 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#ifndef _CORESIGHT_QCOM_CTI_H
> +#define _CORESIGHT_QCOM_CTI_H
> +
> +#include "coresight-cti.h"
> +
> +#define ARCHITECT_QCOM 0x477
> +
> +/* CTI programming registers */
> +#define QCOM_CTIINTACK		0x020
> +#define QCOM_CTIAPPSET		0x004
> +#define QCOM_CTIAPPCLEAR	0x008
> +#define QCOM_CTIAPPPULSE	0x00C
> +#define QCOM_CTIINEN		0x400
> +#define QCOM_CTIOUTEN		0x800
> +#define QCOM_CTITRIGINSTATUS	0x040
> +#define QCOM_CTITRIGOUTSTATUS	0x060
> +#define QCOM_CTICHINSTATUS	0x080
> +#define QCOM_CTICHOUTSTATUS	0x084
> +#define QCOM_CTIGATE		0x088
> +#define QCOM_ASICCTL		0x08C
> +/* Integration test registers */
> +#define QCOM_ITCHINACK		0xE70
> +#define QCOM_ITTRIGINACK	0xE80
> +#define QCOM_ITCHOUT		0xE74
> +#define QCOM_ITTRIGOUT		0xEA0
> +#define QCOM_ITCHOUTACK		0xE78
> +#define QCOM_ITTRIGOUTACK	0xEC0
> +#define QCOM_ITCHIN		0xE7C
> +#define QCOM_ITTRIGIN		0xEE0
> +
> +static noinline u32 cti_qcom_reg_off(u32 offset)
> +{
> +	switch (offset) {
> +	case CTIINTACK:		return QCOM_CTIINTACK;
> +	case CTIAPPSET:		return QCOM_CTIAPPSET;
> +	case CTIAPPCLEAR:	return QCOM_CTIAPPCLEAR;
> +	case CTIAPPPULSE:	return QCOM_CTIAPPPULSE;
> +	case CTIINEN:		return QCOM_CTIINEN;
> +	case CTIOUTEN:		return QCOM_CTIOUTEN;
> +	case CTITRIGINSTATUS:	return QCOM_CTITRIGINSTATUS;
> +	case CTITRIGOUTSTATUS:	return QCOM_CTITRIGOUTSTATUS;
> +	case CTICHINSTATUS:	return QCOM_CTICHINSTATUS;
> +	case CTICHOUTSTATUS:	return QCOM_CTICHOUTSTATUS;
> +	case CTIGATE:		return QCOM_CTIGATE;
> +	case ASICCTL:		return QCOM_ASICCTL;
> +	case ITCHINACK:		return QCOM_ITCHINACK;
> +	case ITTRIGINACK:	return QCOM_ITTRIGINACK;
> +	case ITCHOUT:		return QCOM_ITCHOUT;
> +	case ITTRIGOUT:		return QCOM_ITTRIGOUT;
> +	case ITCHOUTACK:	return QCOM_ITCHOUTACK;
> +	case ITTRIGOUTACK:	return QCOM_ITTRIGOUTACK;
> +	case ITCHIN:		return QCOM_ITCHIN;
> +	case ITTRIGIN:		return QCOM_ITTRIGIN;
> +
> +	default:
> +		return offset;
> +	}
> +}
> +
> +#endif  /* _CORESIGHT_QCOM_CTI_H */
> 


