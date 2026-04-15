Return-Path: <linux-arm-msm+bounces-103227-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aLeiAfcE32khNwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103227-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 05:24:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CBB23FFF7A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 05:24:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 37FFE305E981
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 03:23:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F38EA309EF4;
	Wed, 15 Apr 2026 03:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ownyt6aG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C3D728CF5D;
	Wed, 15 Apr 2026 03:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776223396; cv=none; b=orOg96LbgYvN25BHUMqTxd9LzjbTkIRMcYY8n7oEWP+6m9Q+p/mJSYWI0kDnfhNA8uNfTQp+tbRZLaQ8FBRJOMiznT910872vhvB3QSu3JpFFMKIGvcNxiPYb0Fqp2SGpui78a7zN7Pi8VdpK3bRulkzLg7+OdQJp8RoRnskDxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776223396; c=relaxed/simple;
	bh=oS8+UFA70/kko0r0QMDLF2JsvERWKTlpzsnvoDiFvBU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=kWVHSO/ogRRS5yB2q9/LvOZbIyyJ4RyTpix0SeJxrY+G/UQWOgMhQctcn1WQrpmydvHHRaKb5XJpnK3aDfW/lnZW1ZkMXx4iRrxgdB2wBNTcxyMQknf4gPSoMuJnaBVG/VrUGQ4agDmntEuBQo+pgJwpZrbeVnsXXz8MgysEt9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ownyt6aG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63EHcMQh3100838;
	Wed, 15 Apr 2026 03:23:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bCJFJAlafGf5iUAnRzpXrnFhih9V2iqwArhAitqgRQ8=; b=ownyt6aGXoSuEjf9
	MPPwNvov26qT07TxxBr/ZKnYIw1WvxJgqiKKveFMzLZvmlwcMej0ViyajxE5j+Iz
	KSV29bGkFdqwGUzcf6QnB3++c0ZMLvYoUrL0xe4mi4rktxrLx7OtHzUnUA9FtPhq
	JCmATz1+ebd1Z4Cli7GMKetN47HyzgMffOw0Vc8WkLcIC1JVDhfcdAeOZp1Ind48
	4HvafF2vM7Yi2/afjkl49JaE2rauxFSUKgnWc0pCf9DETdKEauBLiciwyok42Teg
	oFh0BlnWC/w7HDoEd1bEFJDeGjd64G4VyTcfITB+QdDkS1zNAsr3RZ5D8vJ5EA2s
	SPHzvg==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dht5h1fpt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Apr 2026 03:23:05 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTPS id 63F3N42r025390
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Apr 2026 03:23:04 GMT
Received: from [10.233.71.148] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 14 Apr
 2026 20:23:01 -0700
Message-ID: <9772e300-06cb-4892-810c-bdcf6251bf9f@quicinc.com>
Date: Wed, 15 Apr 2026 11:22:49 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/4] Add Qualcomm extended CTI support
To: Yingchao Deng <yingchao.deng@oss.qualcomm.com>,
        Suzuki K Poulose
	<suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark
	<james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin
	<alexander.shishkin@linux.intel.com>
CC: <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        Jinlong Mao
	<jinlong.mao@oss.qualcomm.com>,
        Tingwei Zhang
	<tingwei.zhang@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Yingchao Deng <quic_yingdeng@quicinc.com>
References: <20260325-extended_cti-v7-0-bb406005089f@oss.qualcomm.com>
Content-Language: en-US
From: "Yingchao Deng (Consultant)" <quic_yingdeng@quicinc.com>
In-Reply-To: <20260325-extended_cti-v7-0-bb406005089f@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDAyOCBTYWx0ZWRfX1VaQpHqArrD7
 E5I+Hr5U4H8MzItwYAi2/ybTLXzzOp/hJCVhZEjSGMLiEPOAXYEMY+rAwAcKCxWtsp5f8F5dg0H
 TS/iHePhASnPb//EN76Dl+lI4HqzPmrffximkoU2WxAdNg0O7ATjffQ+dZUkoAcjvYp+Lotdpq/
 X5hl1o5SgbOBMHnj3cIJ0Ixftj8pxR+lfBgQLkMzVMJ6+sUrcJBqcC2C4LE314LWfFlW8eKXms1
 qBW0npkVL73/t6lih32qNutu5qRb0VSX+9qihRloqPs4Uq5m00Yb03yGfOwG4+SWvWJiFxbeuwF
 EfVZ5ufqWEPGZoDmNFnx6bOQamkOTnsWfHrUw3+sNKFPI0aKWYC9MnuMqal8HABMzpyluZSzwH1
 ZoTzyCflup0YrzA4fkCxt/0ieS0HbtjM1nCO5gj/lfXNbZ5mNi2a5jFrREGDBuyy2tNL04zjk/m
 bfeVqTkN/Yg2sE/0Aeg==
X-Proofpoint-ORIG-GUID: G6ntLghWieHUcqT-liZgDVIM6TJp7O5c
X-Proofpoint-GUID: G6ntLghWieHUcqT-liZgDVIM6TJp7O5c
X-Authority-Analysis: v=2.4 cv=afFRWxot c=1 sm=1 tr=0 ts=69df0499 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=BrGTpx9XV5RcIlctfScA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_04,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 impostorscore=0 clxscore=1011 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604150028
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[quicinc.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[quicinc.com:s=qcppdkim1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-103227-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[quicinc.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[quic_yingdeng@quicinc.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5CBB23FFF7A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 3/25/2026 1:43 PM, Yingchao Deng wrote:
> The Qualcomm extended CTI is a heavily parameterized version of ARM’s
> CSCTI. It allows a debugger to send to trigger events to a processor or to
> send a trigger event to one or more processors when a trigger event occurs
> on another processor on the same SoC, or even between SoCs.
>
> Qualcomm extended CTI supports up to 128 triggers. And some of the register
> offsets are changed.
>
> The commands to configure CTI triggers are the same as ARM's CTI.
>
> Prerequisites:
>     This series depends on the following CoreSight fix:
>     [PATCH v2 1/1] coresight: fix issue where coresight component has no claimtags
> Link: https://lore.kernel.org/all/20251027223545.2801-2-mike.leach@linaro.org/
>
> Changes in v7:
> 1. Split the extended CTI support into smaller, logically independent
>     patches to improve reviewability.
> 2. Removed the dual offset-array based register access used in v6 for
>     standard and Qualcomm CTIs. Register addressing is now unified through
>     a single code path by encoding the register index together with the base
>     offset and applying variant-specific translation at the final MMIO
>     access point.
> 3. Removed ext_reg_sel, extend the CTI sysfs interface to expose banked
>     register instances on Qualcomm CTIs only. Numbered sysfs nodes are
>     hidden on standard ARM CTIs, and on Qualcomm CTIs their visibility is
>     derived from nr_trig_max (32 triggers per bank), ensuring that only
>     registers backed by hardware are exposed.
> Link to v6 - https://lore.kernel.org/all/20251202-extended_cti-v6-0-ab68bb15c4f5@oss.qualcomm.com/
>
> Changes in v6:
> 1. Rename regs_idx to ext_reg_sel and add information in documentation
>     file.
> 2. Reset CLAIMSET to zero for qcom-cti during probe.
> 3. Retrieve idx value under spinlock.
> 4. Use yearless copyright for qcom-cti.h.
> Link to v5 - https://lore.kernel.org/all/20251020-extended_cti-v5-0-6f193da2d467@oss.qualcomm.com/
>
> Changes in v5:
> 1. Move common part in qcom-cti.h to coresight-cti.h.
> 2. Convert trigger usage fields to dynamic bitmaps and arrays.
> 3. Fix holes in struct cti_config to save some space.
> 4. Revert the previous changes related to the claim tag in
>     cti_enable/disable_hw.
> Link to v4 - https://lore.kernel.org/linux-arm-msm/20250902-extended_cti-v4-1-7677de04b416@oss.qualcomm.com/
>
> Changes in v4:
> 1. Read the DEVARCH registers to identify Qualcomm CTI.
> 2. Add a reg_idx node, and refactor the coresight_cti_reg_show() and
> coresight_cti_reg_store() functions accordingly.
> 3. The register offsets specific to Qualcomm CTI are moved to qcom_cti.h.
> Link to v3 - https://lore.kernel.org/linux-arm-msm/20250722081405.2947294-1-quic_jinlmao@quicinc.com/
>
> Changes in v3:
> 1. Rename is_extended_cti() to of_is_extended_cti().
> 2. Add the missing 'i' when write the CTI trigger registers.
> 3. Convert the multi-line output in sysfs to single line.
> 4. Initialize offset arrays using designated initializer.
> Link to V2 - https://lore.kernel.org/all/20250429071841.1158315-3-quic_jinlmao@quicinc.com/
>
> Changes in V2:
> 1. Add enum for compatible items.
> 2. Move offset arrays to coresight-cti-core
>
> Signed-off-by: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
> ---
> Yingchao Deng (4):
>        coresight: cti: Convert trigger usage fields to dynamic bitmaps and arrays
>        coresight: cti: encode trigger register index in register offsets
>        coresight: cti: add Qualcomm extended CTI identification and quirks
>        coresight: cti: expose banked sysfs registers for Qualcomm extended CTI
>
>   drivers/hwtracing/coresight/coresight-cti-core.c   | 114 ++++++++++++++++-----
>   .../hwtracing/coresight/coresight-cti-platform.c   |  16 +--
>   drivers/hwtracing/coresight/coresight-cti-sysfs.c  |  75 ++++++++++++--
>   drivers/hwtracing/coresight/coresight-cti.h        |  30 ++++--
>   drivers/hwtracing/coresight/qcom-cti.h             |  65 ++++++++++++
>   5 files changed, 247 insertions(+), 53 deletions(-)
> ---
> base-commit: 5bca1f031b65a4a8caf700537cbbc770252af475
> change-id: 20260324-extended_cti-707638ceee9e
>
> Best regards,

Gentle reminder.

thanks,
Yingchao.


