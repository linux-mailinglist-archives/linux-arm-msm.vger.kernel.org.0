Return-Path: <linux-arm-msm+bounces-104023-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QFD6EK1o6GlZKAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104023-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 08:20:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BCBB64425AC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 08:20:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EAE0A301AA7E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 06:19:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC2642D9EFF;
	Wed, 22 Apr 2026 06:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W9yUAedo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GVSmpaCJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CABA296BA9
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 06:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776838752; cv=none; b=C9TindZOnWP775i4bNsDbyj5J/95iPK3eX3U2SGkrbiE8pC0XAI2AMcu4uHdd5y7o3w1O1ADtbJ3qHzZqNfn3KQ31JVDLETA1Wiq4j46tcdVFjUAOhtDyPUV89FFIhVvCrXdwb6TvRNO4KOFOhQF5T7isYLmNfQdX9GlOXJIPEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776838752; c=relaxed/simple;
	bh=GhLCn87lDg0zVWE5r8YDpyCLm1zvULHLCWK8oqFTnb0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q+vQy520y8s2CLyz2dlhP4W59/Om4xrvvuIP6dxcqukqzXJiZkrMH14bCUaC+NoLlPuqTYUOgbVN0pKIu3LMoM0ClxzaZz+xEPfvQDyk/qdfSgxA3OrRBhMXXR3NRawxQD9qYHNMtwFTxbJKQyCXAkX1lEq6TMX2hGXSfdBqJwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W9yUAedo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GVSmpaCJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63M5EKdq2935195
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 06:19:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NmV+ExxZZmmRYLRISOrru0LTP1LO55qj5WfaayyYBTM=; b=W9yUAedoabsC3bk6
	gbUygCcbqobtVjb7siSk7sFG0SisKopS0MwHeZnbi3Zcihwl2/OTt+/kYS18l/WE
	VF1QWwNA+CvcaXcJ+GzKHZ9KHyyZ4p4iBM1J9RFLNBXzBSfjMk9pNwyl5zv1iSAu
	vpqNH6BHyctX7zM5OZqAZw5PB6M3pu6UW83jELWOwFQPE72F91jsrzLGBzNqUc8s
	v0ifP1t9CV4fTrK7RyPnDPHSPA7YbyBqZVXv1Fs9JlLbcph7040B8LczNIXG1YAX
	6P4AnXZN6FZMMDeDGxKQQOM+yiUwA37UAT1CGjZSo/Hqy6GRJPmXWHSg0b8WnqUF
	uqunDw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenk9xbd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 06:19:10 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c7982224a54so3836228a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 23:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776838749; x=1777443549; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NmV+ExxZZmmRYLRISOrru0LTP1LO55qj5WfaayyYBTM=;
        b=GVSmpaCJD85GhjDukyKnUJIeLOkmHpg6OHnnlKWk2wTzdAt4HYE9Lx8APKj5VDk5jA
         WTPYYm/zc5jEQ8MEfNXd2YaT/JBM+AerTOHeRRhg45QDoEg/LOcaPbvQkiPcJiJ8Vlp1
         T3g9VmT1qBKqUzI45CuHm1HhYULTs9tvc+sqQ21X+wWiOGohpEB4pOLuwAq4m3BQgcFU
         9Fp9IsshjzAVaf30+YaL2nzRuE6Esrvwim3wsb9zN1ThR4Vxx526/1HSCbh31Zt19BAE
         BbhCqjXH8v8nEqQmzMiYjwQbuY+W64tl2PPiYxGBcpUhaA6kBcYdKQ7G4fvLEZMICw9R
         lMZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776838749; x=1777443549;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NmV+ExxZZmmRYLRISOrru0LTP1LO55qj5WfaayyYBTM=;
        b=CnOBrT8EbX+OMNP0fOO2AEa96+Y04YlqCh/KNd1blw/HvQPClk6x1RIiH0/deX4i4j
         EwQZAwN2pQwl9Luvt6DX8KDpVEtWcuXsBWok3kVxHv0+UmU9J+cK5KFXUsI87dm9QNgX
         2m/CyshUByJ0JWxlDT1/XTfhRUOSVcOHQOWNXRcQCdl12mmWOggLeM+tlQ/Lpg9N7+PN
         x53A1wChpJbxPgIB3vCHRClMNFiJSEzQK8vYey24ezikvq719qvJvQbyqtZKmiLBWUty
         YDh7ij8vy7oHId0GdqIpGEmeMC/N/V42dbeCRcfewK5ENXf2CrFevCcv0bmFjYqxh7YR
         AOIg==
X-Forwarded-Encrypted: i=1; AFNElJ/82uDY4K0VREjeWc4hyvYusgEuHvFzvYzc80gTFSHykIMGMZlXCPC2uKQoJhdQ//N9a9+YXcZdGtaRCoou@vger.kernel.org
X-Gm-Message-State: AOJu0YwJg8cylMCGin8l50B7jrNoijePl793FB2znD+Xmdye2LREgHR4
	YrFdk0p84Ty8b+caZQpIxPjSkCfDHvtEWSB0zM1AaCyMKc3Jo3vKJ+8ekhVeuCAHyznBGtxQpBS
	+HevUQHMchG0V1VqOxP02i6Eix6tVDE63i0I504fhFtijpbp2sJ1MEEcOxVhVSzZrx9rn
X-Gm-Gg: AeBDieuG/WLVwD2+b38Q3tVKQHSCwVINIG05AMyXlx+n75H8Ku1oygyDOfm8RfPqx/V
	/m9iu7w7NotowkmSWb7ODK9D8YQA9AMVRhC5GbluqvmcuzVyEBung6JbQL9eGkReUjuxKK3vQX/
	wyr8Yf+Dycy3dppP3PEMvcrefBUJX1gfcjDqwE4tXmAoM3nBz0u21U5bYsB3UBYsfktjJbjTAbL
	EK9IPAhPi/rjiqsICgrnmEv80qpB2y71SWntihhI6Q7g6yACtIvGeZUcxJq2KS4/OEJE/478ZmW
	cr09w3AHNgJLdzhONxULmhQTku8PwMXETo/EotVTsxW5/TvEwT68G1ZkD75AHjT64nOqlvuXhb1
	c9AgeEx47SbNRCY1NRauIRtcSO6RKbBOBVujKT/Olej4LkQaL/gpuKJMysOF57BK2
X-Received: by 2002:a05:6a00:8715:b0:82f:a89e:e16f with SMTP id d2e1a72fcca58-82fa89ee99fmr9654263b3a.14.1776838749036;
        Tue, 21 Apr 2026 23:19:09 -0700 (PDT)
X-Received: by 2002:a05:6a00:8715:b0:82f:a89e:e16f with SMTP id d2e1a72fcca58-82fa89ee99fmr9654234b3a.14.1776838748498;
        Tue, 21 Apr 2026 23:19:08 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ebbcfd7sm19942638b3a.32.2026.04.21.23.19.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Apr 2026 23:19:07 -0700 (PDT)
Message-ID: <9c76be4a-e907-b5b6-e50f-0f37738752da@oss.qualcomm.com>
Date: Wed, 22 Apr 2026 11:49:00 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 04/11] media: iris: Add helper to create a context bank
 device on iris vpu bus
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev
References: <20260414-glymur-v1-0-7d3d1cf57b16@oss.qualcomm.com>
 <20260414-glymur-v1-4-7d3d1cf57b16@oss.qualcomm.com>
 <ie6dad3xewm25gdrqqne2fsroopu3jwgrqmu54sfzjliis6mo5@6qsgagvyynwx>
 <b0ba2172-3f66-c912-29e9-0a48b4480987@oss.qualcomm.com>
 <sqg2db63gsjg3cxfdfbmndhxibzlprgviarbcl4l6isza36nc3@ljgg23nkuooi>
 <bab7f899-dc05-7c9d-aed5-fed1910aa32b@oss.qualcomm.com>
 <cucl4m3h2wkosvzuyxdwyjec3v5n6vpa5g3osvo5y4farpewtn@jw6kzf3f3eyj>
Content-Language: en-US
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <cucl4m3h2wkosvzuyxdwyjec3v5n6vpa5g3osvo5y4farpewtn@jw6kzf3f3eyj>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: MlApOsb_779dgaT5FQT_XaNnXiFL0cUp
X-Authority-Analysis: v=2.4 cv=SONykuvH c=1 sm=1 tr=0 ts=69e8685e cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=S1jlUsJdER8BTHAalKsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: MlApOsb_779dgaT5FQT_XaNnXiFL0cUp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDA1NyBTYWx0ZWRfX2p9pe0ru9z51
 N3EGht6Kbge8m05cTkwQ4VV85XamKlsTsGEX/JT7l5AF+6zoxpP5qSfP3W0QiETynZBmbK6SXhK
 UquwBXf9nby0hCCONJyoH22q24uGrGQ8n8RJmprqslFWkxbfeQSbXjZnMTpeLteC63dNbCXexwD
 NiO/7Tw1KiCpILt7+HTgkKhTePMhogGos3zPQDgycBKUGUK4q7if21+i62FWdxkTwsmuHRLl/vg
 S78ZgxvUKTelY8V/vdqnkCiHA4IoZV5xzY7ss1rnsPGr2P0jtAYvTHD6Dp+2baubPI9SU/ao7at
 pPuGeOoSrm9M+kRt1piRz3zF57pH0QsOatFG1Hk25SRpHT3XNdJTG7kkWV2C+tI9UVpE42enNMN
 7LwNZj0F0VR1bmVEIi+pDus/ZD332bIwJ8E2vbtAvswgXVbtytJ8pztoloWabghBffBVy8qA0Nm
 nYKlib8MTRR+92r8/vw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 adultscore=0 impostorscore=0 malwarescore=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220057
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104023-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BCBB64425AC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 4/20/2026 11:26 PM, Dmitry Baryshkov wrote:
> On Mon, Apr 20, 2026 at 07:33:01PM +0530, Vishnu Reddy wrote:
>> On 4/17/2026 11:53 PM, Dmitry Baryshkov wrote:
>>> On Fri, Apr 17, 2026 at 08:49:44PM +0530, Vishnu Reddy wrote:
>>>> On 4/14/2026 8:48 PM, Dmitry Baryshkov wrote:
>>>>> On Tue, Apr 14, 2026 at 10:30:00AM +0530, Vishnu Reddy wrote:
>>>>>> From: Vikash Garodia<vikash.garodia@oss.qualcomm.com>
>>>>>>
>>>>>> Add a helper function to allocate and register context bank (CB) device
>>>>>> on the iris vpu bus. The function ID associated with the CB is specified
>>>>>> from the platform data, allowing the bus dma_configure callback to apply
>>>>>> correct stream ID mapping when device is registered.
>>>>>>
>>>>>> Signed-off-by: Vikash Garodia<vikash.garodia@oss.qualcomm.com>
>>>>>> Signed-off-by: Vishnu Reddy<busanna.reddy@oss.qualcomm.com>
>>>>>> ---
>>>>>>   drivers/media/platform/qcom/iris/iris_resources.c | 33 +++++++++++++++++++++++
>>>>>>   drivers/media/platform/qcom/iris/iris_resources.h |  1 +
>>>>>>   2 files changed, 34 insertions(+)
>>>>>>
>>>>>> diff --git a/drivers/media/platform/qcom/iris/iris_resources.c b/drivers/media/platform/qcom/iris/iris_resources.c
>>>>>> index 773f6548370a..a25e0f2e9d26 100644
>>>>>> --- a/drivers/media/platform/qcom/iris/iris_resources.c
>>>>>> +++ b/drivers/media/platform/qcom/iris/iris_resources.c
>>>>>> @@ -6,6 +6,7 @@
>>>>>>   #include <linux/clk.h>
>>>>>>   #include <linux/devfreq.h>
>>>>>>   #include <linux/interconnect.h>
>>>>>> +#include <linux/iris_vpu_bus.h>
>>>>>>   #include <linux/pm_domain.h>
>>>>>>   #include <linux/pm_opp.h>
>>>>>>   #include <linux/pm_runtime.h>
>>>>>> @@ -141,3 +142,35 @@ int iris_disable_unprepare_clock(struct iris_core *core, enum platform_clk_type
>>>>>>   	return 0;
>>>>>>   }
>>>>>> +
>>>>>> +static void iris_release_cb_dev(struct device *dev)
>>>>>> +{
>>>>>> +	kfree(dev);
>>>>>> +}
>>>>>> +
>>>>>> +struct device *iris_create_cb_dev(struct iris_core *core, const char *name, const u32 *f_id)
>>>>> Please move into the bus code and make it generic enough.
>>>> Do you suggest to add a wrapper to pass the varying inputs to the generic
>>>> bus, something like this
>>>> struct device* create_and_register_device(dma_mask, parent_dev, *release,
>>>> dev_name,...)
>>> Definitely not the release function. The devname is also not that
>>> important. The rest, yes, you are correct.
>>>
>>>>>> +{
>>>>>> +	struct device *dev;
>>>>>> +	int ret;
>>>>>> +
>>>>>> +	dev = kzalloc_obj(*dev);
>>>>>> +	if (!dev)
>>>>>> +		return ERR_PTR(-ENOMEM);
>>>>>> +
>>>>>> +	dev->release = iris_release_cb_dev;
>>>>>> +	dev->bus = &iris_vpu_bus_type;
>>>>>> +	dev->parent = core->dev;
>>>>>> +	dev->coherent_dma_mask = core->iris_platform_data->dma_mask;
>>>>>> +	dev->dma_mask = &dev->coherent_dma_mask;
>>>>> Would you also need to set the of_node? See
>>>>> device_set_of_node_from_dev()
>>>> It might be needed for FastRPC as they are following sub node approach, Iris
>>>> does not need.
>>> Wouldn't it save you from passing it to of_dma_configure_id()?
>> Iris will pass parent device of_node, setting parent device is enough.
> Set the of node and pass NULL to of_dma_configure_id.

Passing of_node as NULL to of_dma_configure_id() won’t map the SID to device,
If a dt sub node exists with iommus, the child’s of_node can be used.
Otherwise, the parent’s of_node must be passed with a valid function ID present
in iommu-map.

>>>>>> +
>>>>>> +	dev_set_name(dev, "%s", name);
>>>>>> +	dev_set_drvdata(dev, (void *)f_id);
>>>>>> +
>>>>>> +	ret = device_register(dev);
>>>>>> +	if (ret) {
>>>>>> +		put_device(dev);
>>>>>> +		return ERR_PTR(ret);
>>>>>> +	}
>>>>>> +
>>>>>> +	return dev;
>>>>>> +}
>>>>>> diff --git a/drivers/media/platform/qcom/iris/iris_resources.h b/drivers/media/platform/qcom/iris/iris_resources.h
>>>>>> index 6bfbd2dc6db0..4a494627ff23 100644
>>>>>> --- a/drivers/media/platform/qcom/iris/iris_resources.h
>>>>>> +++ b/drivers/media/platform/qcom/iris/iris_resources.h
>>>>>> @@ -15,5 +15,6 @@ int iris_unset_icc_bw(struct iris_core *core);
>>>>>>   int iris_set_icc_bw(struct iris_core *core, unsigned long icc_bw);
>>>>>>   int iris_disable_unprepare_clock(struct iris_core *core, enum platform_clk_type clk_type);
>>>>>>   int iris_prepare_enable_clock(struct iris_core *core, enum platform_clk_type clk_type);
>>>>>> +struct device *iris_create_cb_dev(struct iris_core *core, const char *name, const u32 *f_id);
>>>>>>   #endif
>>>>>>
>>>>>> -- 
>>>>>> 2.34.1
>>>>>>

