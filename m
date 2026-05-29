Return-Path: <linux-arm-msm+bounces-110213-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eAUsMwnvGGohpAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110213-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 03:42:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BC105FC11B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 03:42:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3BE15303BBB0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 01:42:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6182735200C;
	Fri, 29 May 2026 01:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Y8d4vhgf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06E9B352030;
	Fri, 29 May 2026 01:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780018939; cv=none; b=GAZNr3j/zuD+OkC09vcDlS22W3WL9vQeip4++2zCxJOSkYt3Nw3uLVAvIPUHedzMrLy71y+5kq0BHIl/2iAwkiGIfV8xGNmqxAF6bdb+OERhbDlhIt/LU9tfF8/BmFevj5BRlkQEg8u2MCEDXIAO6fqg35gHIqMOfa+qTVjCHso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780018939; c=relaxed/simple;
	bh=fegPdjEualrYFQ4P7zg/S4lyWhTYIN6NsDKqObtEet8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=lgrR+2cB4pIN/cEdvC1KFzm1+cuhNL7UgpX8uY1GqwDWrei+nsIoJX9VPKadleU/4A1HgLCysqczVV5g8R8R8BKJq+eVnAjYdewClIgXg/IbvChhe7nhR/jPbqBBe5ep4Vt0j4VWryN/1Hb9zjK8XswB3kjPA1W9277CqetgSKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Y8d4vhgf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64SKkfaZ1386644;
	Fri, 29 May 2026 01:42:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5lbivKeLQZu86GRLVuT6TXCjpcxzgWWJ1Oh8IAuGu7Y=; b=Y8d4vhgfzY1oSDUw
	r1j+rA9G1j/dhxHgqKJFURxzAT9FdpAfLIIMeEuDKpkxsSExEmYr10fGSDMABnN5
	I+Xmw55+CI+aa4lgGE6+a6qx0Q2jyhkM27LGprrkvUZzUAPKXiYD0wq/fY5+QxAD
	STadxWoOjUhbK0NwBVTdXGIbZFHn2nbi14Pm4lGsgkDIRgIuBFBQ7InxYh1BRGmD
	UsX3KprAwpBJ2fq1ZZmoBseEX1cu0tYl0O8L5MMbVanZux7QUcMZOKtoKjddGKuR
	TBFxRR/1MvpQp87ODtV25jEw1BTNiMjDB3CQGGLdw3Hnsn/u+9NC05ddR8NDtqb/
	duTu8Q==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eevums424-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 May 2026 01:42:07 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTPS id 64T1g6LA021337
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 May 2026 01:42:06 GMT
Received: from [10.233.71.148] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 28 May
 2026 18:42:03 -0700
Message-ID: <ecc90c0e-cd81-4960-af4a-a85d562df096@quicinc.com>
Date: Fri, 29 May 2026 09:42:02 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 3/4] coresight: cti: add Qualcomm extended CTI
 identification and quirks
To: Leo Yan <leo.yan@arm.com>, Yingchao Deng <yingchao.deng@oss.qualcomm.com>
CC: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        "Alexander
 Shishkin" <alexander.shishkin@linux.intel.com>,
        <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <jinlong.mao@oss.qualcomm.com>, <tingwei.zhang@oss.qualcomm.com>,
        <jie.gan@oss.qualcomm.com>, Yingchao Deng
	<quic_yingdeng@quicinc.com>
References: <20260521-extended_cti-v9-0-d21f4f92c51e@oss.qualcomm.com>
 <20260521-extended_cti-v9-3-d21f4f92c51e@oss.qualcomm.com>
 <20260528171108.GI101133@e132581.arm.com>
Content-Language: en-US
From: "Yingchao Deng (Consultant)" <quic_yingdeng@quicinc.com>
In-Reply-To: <20260528171108.GI101133@e132581.arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-GUID: y5BtHFN8JWbc4RbAPU7bY33Ai4q1piQ5
X-Proofpoint-ORIG-GUID: y5BtHFN8JWbc4RbAPU7bY33Ai4q1piQ5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDAxMyBTYWx0ZWRfXxEsgedwBl2/4
 XcW6fn2BpZHrf/jB0lxGSCZ1LDyTpg0DpSioduzSamitV5f1Qd1rz2h1n7OChjXmaljQ6YC172C
 t5zthLDkrtwt1oMQ+uX4hctWKZjNcFCOgxVtSPcgIRZ72yucsNyx115cVeriDGGmdxpl716+w7a
 r9loeoH4z5dhKFvCSg9hJJrFGJTOrXpSoXTr9zbimSre3x1XdvG1Lk5T4+jZ1076HYhy+czjHQK
 GeTZ4lH+/9F8IbLhBAoBFbSua/FlaQrPxnvHOpPsDHELspvXYy4TjnYLfVgyJVoC8HmDncC3V3O
 KHNcaSEBt/lJt7LJMhLP3zdVv826P4iCLueoy/NTC2ai7m57nUd5lP3EqNFZxN+Aji3q2Nqq9n7
 JTjvd1hc68FbHJnkdk0BR7tXttfcwDAHYkVfJbOSC5aZYKhbh/P711amDqOz+euj5wL8MEtjdd+
 vcBedUk/Y0xONUDG6dg==
X-Authority-Analysis: v=2.4 cv=cObQdFeN c=1 sm=1 tr=0 ts=6a18eeef cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=ISzTLn2FSy6o0I3Y5eYA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_07,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 spamscore=0 malwarescore=0
 phishscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290013
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[quicinc.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[quicinc.com:s=qcppdkim1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-110213-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[quicinc.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[quic_yingdeng@quicinc.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4BC105FC11B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 5/29/2026 1:11 AM, Leo Yan wrote:
> On Thu, May 21, 2026 at 08:16:29PM +0800, Yingchao Deng wrote:
>
> [...]
>
>> Qualcomm implements an extended variant of the ARM CoreSight CTI with a
>> different register layout and vendor-specific behavior. While the
>> programming model remains largely compatible, the register offsets differ
>> from the standard ARM CTI and require explicit handling.
> I cannot apply this patch successfuly. Please rebase on the latest
> coresight-next branch.
>
>> @@ -726,6 +734,22 @@ static int cti_probe(struct amba_device *adev, const struct amba_id *id)
>>   
>>   	raw_spin_lock_init(&drvdata->spinlock);
>>   
>> +	devarch = readl_relaxed(drvdata->base + CORESIGHT_DEVARCH);
>> +	if (CTI_DEVARCH_ARCHITECT(devarch) == ARCHITECT_QCOM) {
>> +		drvdata->is_qcom_cti = true;
>> +		/*
>> +		 * QCOM CTI does not implement Claimtag functionality as
>> +		 * per CoreSight specification, but its CLAIMSET register
>> +		 * is incorrectly initialized to 0xF. This can mislead
>> +		 * tools or drivers into thinking the component is claimed.
>> +		 *
>> +		 * Reset CLAIMSET to 0 to reflect that no claims are active.
>> +		 */
>> +		CS_UNLOCK(drvdata->base);
>> +		writel_relaxed(0, drvdata->base + CORESIGHT_CLAIMSET);
>> +		CS_LOCK(drvdata->base);
> Sorry I missed this piece before.
>
> Can you move this quirk into firmware? I don't think the CTI driver
> should clear the external claim bit as this totally break the protocol
> defined in PSCI. A clean way would clear the bits in firmware and then
> CTI driver can use the CLAIM registers.
>
> Or, another option is to create several helpers to bypass claim
> operations for Qcom CTI:
>
>    static void cti_clear_self_claim_tag(cti_drvdata *drvdata,
>                                        struct csdev_access *csa)
>    {
>        if (drvdata->is_qcom_cti)
>            return;
>
>        coresight_clear_self_claim_tag(csa);
>    }
>
>    static int cti_claim_device(cti_drvdata *drvdata)
>    {
>        if (drvdata->is_qcom_cti)
>            return 0;
>
>        return coresight_claim_device(drvdata->csdev);
>    }
>
>    static void cti_unclaim_device_unlocked(cti_drvdata *drvdata)
>    {
>        if (drvdata->is_qcom_cti)
>            return;
>
>        return coresight_disclaim_device_unlocked(drvdata->csdev);
>    }
>
> Otherwise, this patch is fine for me.
>
> Thanks,
> Leo
Thanks for the suggestion.

Moving this to firmware would be ideal, but in our case this behavior
comes from the hardware design and affects multiple platforms, so it is
not something we can easily address in firmware.
I will go with the helper bypass approach.


Thanks,
Yingchao

