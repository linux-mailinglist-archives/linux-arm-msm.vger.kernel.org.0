Return-Path: <linux-arm-msm+bounces-110799-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IN10AXiqHmq3IwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110799-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 12:03:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 56E8262C138
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 12:03:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E472C3056FF5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jun 2026 09:54:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8561D384CE6;
	Tue,  2 Jun 2026 09:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="RjHcfTVh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E788286D5E;
	Tue,  2 Jun 2026 09:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780394046; cv=none; b=s1TQpE7w/XO2mk1658lwH0DlMZrvDJIT6N9v6fIfbQ0O1mAWROlOQIc5uRJBmzdeRHrdXriGKPgATbQW6icHxeuAOYSZu5Gcny41ZDH5ZbcXEgBpDKDYBRu/psMwiOu/mQd0SVW/eFIMV6ywBg/uptASiP/hTqzqMf8EAce97Zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780394046; c=relaxed/simple;
	bh=YxhZgFQQLPyfxP2Z/dHyTsC3L5Qij2SZoa2WRUzElgQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=oWC/TnoaeWGnwmECJmSP7lXXBY84ZWH4xlAC1IoKhya1Y2d8XG8Aj9QYjghvjkbcT/gXWago7q4Zg/xlA3PRBexvysnnrqyrKzokYBxI2nO3rYeHeL7q0o+VXExZjrUXw7jLcF1ce+kIYc8M9dkxX8TUJXZzDal4l2UZ23kmTaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=RjHcfTVh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6525tdp24012505;
	Tue, 2 Jun 2026 09:53:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e4OYmliaBkD/qjOt/nryp2XmifjuIV55DUJ3GRAThwI=; b=RjHcfTVhjwYIryg9
	okBs/QieipCbvGLfnTMrArpfNy2k/nklxQSmMzycA2ECrXsg1Ke6ommgvntYh+yi
	QtdKXmfvLwACsHuyPkmRHbWYA0NyS8FAlpZETPTv47C+56DQZbkkmdT83BGTVhvi
	jGnCu5OYe8wcpDU3srnKYwnRq9PNloKlChKkBnAccaLV2pBluvYofR8UZwijSbMq
	xtbm9q8KeCF2eq5tj60yPkLFo+4DSl+XlItlcnCdO8IXrW2ca0mr7gjmN7F6xm2h
	GFioe/FzbgArD47JvEqx5zsSjMnWJsRIn6YI7Ez57/Cpus3r40oVvXlxoD2jWIQm
	Cbying==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehsf4h08r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 02 Jun 2026 09:53:55 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTPS id 6529rsA5007667
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 2 Jun 2026 09:53:54 GMT
Received: from [10.233.71.148] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 2 Jun
 2026 02:53:51 -0700
Message-ID: <30ed489e-13a3-41fa-980b-5a6bcf451760@quicinc.com>
Date: Tue, 2 Jun 2026 17:53:49 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 4/4] coresight: cti: expose banked sysfs registers for
 Qualcomm extended CTI
To: Leo Yan <leo.yan@arm.com>
CC: Yingchao Deng <yingchao.deng@oss.qualcomm.com>,
        Suzuki K Poulose
	<suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark
	<james.clark@linaro.org>,
        Alexander Shishkin
	<alexander.shishkin@linux.intel.com>,
        <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <jinlong.mao@oss.qualcomm.com>, <tingwei.zhang@oss.qualcomm.com>,
        <jie.gan@oss.qualcomm.com>, Yingchao Deng
	<quic_yingdeng@quicinc.com>
References: <20260521-extended_cti-v9-0-d21f4f92c51e@oss.qualcomm.com>
 <20260521-extended_cti-v9-4-d21f4f92c51e@oss.qualcomm.com>
 <20260529153200.GL101133@e132581.arm.com>
 <84614238-35dd-4b10-8267-488d840033c4@quicinc.com>
 <20260601104821.GM101133@e132581.arm.com>
Content-Language: en-US
From: "Yingchao Deng (Consultant)" <quic_yingdeng@quicinc.com>
In-Reply-To: <20260601104821.GM101133@e132581.arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDA5MyBTYWx0ZWRfXwzIeITQjr+M1
 CkQMBlWitvxMLOzMRUb/MWdlMMSjcVbde71wh7SexWvJRIjzW10kmlsB9ZVP3xCCyCHn8Fl46p1
 9s5kv5ItW8zLZnYB3m1wt0bUP/NdUcuOLOTksYwBsi+7cTP6ebfeSa/lNglo95dUNXPxoBW2ogq
 UuO+VhT/cnot2zp3ebY7ksfGJzACM/v9NOG1i40DN1XKHFOdoa8qhd3OqHr6TFvhQD+6wxaTz7x
 db1franp7gMrPO2s+yiCnBR7s9gI3Q8AHpp7D4aR1MXZYmHaMOt/A2ACtluRXalmvmz87xYoqjD
 rWx07TEfrsLm4vEdb/aZwf8H37Tbd6uswG/hIsXOiPpWGtX0TcFM0myAa4MBhbCTC3AG3yAM0Mo
 uIHNxVZTQtIQahQRh5GbjD3ohKXPCzj5uB2EE1rrhrTFYsDJ4qw9Q+lg1p1wH6xTewgEWc3TCR+
 4cU3YKxpv5Wogz3PfLg==
X-Proofpoint-GUID: qYS2sn88fHFt5Byo79fyREI9l8Ddb-lB
X-Authority-Analysis: v=2.4 cv=AJZ7LEvz c=1 sm=1 tr=0 ts=6a1ea833 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=KKAkSRfTAAAA:8 a=PKDSVDeBmbQ8FXe6RhAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: qYS2sn88fHFt5Byo79fyREI9l8Ddb-lB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-02_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606020093
X-Rspamd-Queue-Id: 56E8262C138
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[quicinc.com,none];
	R_DKIM_ALLOW(-0.20)[quicinc.com:s=qcppdkim1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[quicinc.com:dkim,quicinc.com:mid,linaro.org:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[quic_yingdeng@quicinc.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110799-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[quicinc.com:+]
X-Rspamd-Action: no action


On 6/1/2026 6:48 PM, Leo Yan wrote:
> On Mon, Jun 01, 2026 at 10:08:55AM +0800, Yingchao Deng (Consultant) wrote:
>
> [...]
>
>>    I noticed that among the new sysfs knobs in this series, the
>>    integration test registers (ittrigin[1-3], ittrigout[1-3],
>>    ittrigoutack[1-3], ittriginack[1-3]) have no existing documentation
>>    for their base (index-0) counterparts, which were added long before
>>    this series.
> Ah, thanks for pointing out the missed piece!
>
>>    Two options for patch 5/5:
>>
>>      (a) Document only the knobs whose base versions are already
>>          documented (triginstatus[1-3] and trigoutstatus[1-3]).
>>
>>      (b) Document everything in patch 5/5 — both the new indexed
>>          variants and the previously missing base IT register entries.
> Please use option (b). Could you fold the code piece below into patch 5?
>
> Note, we cannot merge ittrigin and ittrigin[1-3] into a single entry
> because they were introduced in different kernel versions.
Will update accordingly.

Thanks,
Yingchao
> @Mike, if any chance you could give a review on this?
>
> ---8<---
>
> --- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-cti
> +++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-cti
> @@ -134,6 +134,60 @@ KernelVersion:	5.7
>   Contact:	Mike Leach or Mathieu Poirier
>   Description:	(Read) read current status of output trigger signals.
>   
> +What:		/sys/bus/coresight/devices/<cti-name>/regs/itctrl
> +Date:		March 2020
> +KernelVersion	5.7
> +Contact:	coresight@lists.linaro.org
> +Description:	(RW) Control integration mode.
> +
> +What:		/sys/bus/coresight/devices/<cti-name>/regs/itchin
> +Date:		March 2020
> +KernelVersion	5.7
> +Contact:	coresight@lists.linaro.org
> +Description:	(Read) Read the values of the CTCHIN inputs.
> +
> +What:		/sys/bus/coresight/devices/<cti-name>/regs/itchinack
> +Date:		March 2020
> +KernelVersion	5.7
> +Contact:	coresight@lists.linaro.org
> +Description:	(Write) Write the value of the CTCHINACK input.
> +
> +What:		/sys/bus/coresight/devices/<cti-name>/regs/ittrigin
> +Date:		March 2020
> +KernelVersion	5.7
> +Contact:	coresight@lists.linaro.org
> +Description:	(Read) Read the values of the CTTRIGIN inputs.
> +
> +What:		/sys/bus/coresight/devices/<cti-name>/regs/ittriginack
> +Date:		March 2020
> +KernelVersion	5.7
> +Contact:	coresight@lists.linaro.org
> +Description:	(Write) Write the value of the CTTRIGINACK input.
> +
> +What:		/sys/bus/coresight/devices/<cti-name>/regs/itchout
> +Date:		March 2020
> +KernelVersion	5.7
> +Contact:	coresight@lists.linaro.org
> +Description:	(RW) Read or write the value of the CTCHOUT outputs.
> +
> +What:		/sys/bus/coresight/devices/<cti-name>/regs/itchoutack
> +Date:		March 2020
> +KernelVersion	5.7
> +Contact:	coresight@lists.linaro.org
> +Description:	(Read) Read the value of the CTCHOUTACK input.
> +
> +What:		/sys/bus/coresight/devices/<cti-name>/regs/ittrigout
> +Date:		March 2020
> +KernelVersion	5.7
> +Contact:	coresight@lists.linaro.org
> +Description:	(RW) Read or write the value of the CTTRIGOUT outputs.
> +
> +What:		/sys/bus/coresight/devices/<cti-name>/regs/ittrigoutack
> +Date:		March 2020
> +KernelVersion	5.7
> +Contact:	coresight@lists.linaro.org
> +Description:	(Read) Read the value of the CTTRIGOUTACK input.
> +
>   What:		/sys/bus/coresight/devices/<cti-name>/channels/trigin_attach
>   Date:		March 2020
>   KernelVersion:	5.7

