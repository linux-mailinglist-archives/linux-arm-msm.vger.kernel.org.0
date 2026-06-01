Return-Path: <linux-arm-msm+bounces-110488-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0IA0L8rpHGpWUAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110488-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 04:09:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E358618BAB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 04:09:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 644E63008E37
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jun 2026 02:09:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3EFA1D6195;
	Mon,  1 Jun 2026 02:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="AvB0/9z2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DD5913D51E;
	Mon,  1 Jun 2026 02:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780279751; cv=none; b=bKINyaV0Km99xCEs9YvY7rtAymLYMdXer8OUfPLjU8gy4swZmcXD3CSpiYSX+OHYaT6NEOZZHKBFe5jDqTxdHUiiG73xWbr4WTk5mc0ELQ6RvbV97sPliFNhRH21ZwpusAMiloMZPca+JrW7R881YZEdBHH4EmP/EgZFYHRG92o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780279751; c=relaxed/simple;
	bh=w4Gl+EqZDPje4M3/ph16Go/b1mBzWoRMszhbLxJaGy0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=uFG5pFfpwvPJFYxU8ISYT/pfSEdeHC25ZzDfQX06Ku94gP47kJe1ejg66CzA3BvnvODxjtl3njFg4hvXOfX7AWpgGRkhEN+G26gh0DKEEv2/2z0TNP9XYfHB588b+Bv95ibKVbcYVT3tBwZsYmIJPk0lYUnvgutq9sa0dHbLVyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=AvB0/9z2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64VLuxtp4055885;
	Mon, 1 Jun 2026 02:09:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IcqZtjsqBd2JXLpNzi6znr2ZpkrmRp706amduVTuZws=; b=AvB0/9z2Y0YqQ7KC
	5qJqWH0AkFRn3/0Z4HA+iBUZAUc7Z7gOBy5PCNnEBvewNvtwt01mPXrs7+qVBDzT
	FkEG3rrDah5C0DdcOH4l5ATerV0Vwpa0O8IFKCoXkT/QE9+FmQCJs6mnoT4+NnCU
	fuOuq/eN2K6xP/XZoTZCkXutlIGgLTJUQ1YFA5thYYiZHQWyiaY/4MgNoZgAmNht
	RdzL6gvznnrnaUeKHEYHC/Fqt76R4Xl4aZp5WupXp8SKLJa0CjaAvOoJlGl3/zbg
	wFBmhxTS029UTtvND8sV+jF/rEVt/Unh/IK9sREaowd3GLl4FLupR3G9rhqgNIJK
	HUydsA==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efux54qrw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 01 Jun 2026 02:09:01 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTPS id 651290Gv014292
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 1 Jun 2026 02:09:00 GMT
Received: from [10.233.71.148] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Sun, 31 May
 2026 19:08:57 -0700
Message-ID: <84614238-35dd-4b10-8267-488d840033c4@quicinc.com>
Date: Mon, 1 Jun 2026 10:08:55 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 4/4] coresight: cti: expose banked sysfs registers for
 Qualcomm extended CTI
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
 <20260521-extended_cti-v9-4-d21f4f92c51e@oss.qualcomm.com>
 <20260529153200.GL101133@e132581.arm.com>
Content-Language: en-US
From: "Yingchao Deng (Consultant)" <quic_yingdeng@quicinc.com>
In-Reply-To: <20260529153200.GL101133@e132581.arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-GUID: YKilyvbD365EEUQ70G2bArYTkdf72Xrj
X-Proofpoint-ORIG-GUID: YKilyvbD365EEUQ70G2bArYTkdf72Xrj
X-Authority-Analysis: v=2.4 cv=BdnoFLt2 c=1 sm=1 tr=0 ts=6a1ce9bd cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=7CQSdrXTAAAA:8 a=KKAkSRfTAAAA:8 a=cw98tnrXUE6m4gzgwxMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=a-qgeE7W1pNrGK8U0ZQC:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDAxOSBTYWx0ZWRfX5V2ZBPorVHTS
 zPUSlBqthqRug0FO3lnXX/b2n/mUFtAWTVU2YskwdGTUs1dgTXAyJ5YQ5cgjFHXpbCKYYf8F5ro
 c6zspW83CZHFirj7NsbCLOmO8GRGK1rmSh/oihq1DuGIegLz/zqhQvza+HhgutdyLLT0P6tbzAD
 o3wVXOWt/QFuBjv4SBtLlIsiN+KOPArApNtv/AvgCB0t2xGqE2uSW7rJuZ6BN4mO/77v947J7l9
 Wx35sby8jKqpZ+Cr+2/HHZyhT8Oa4n6sIODinQPP6GFfpN8WbQKQutZmsuGKVPQtw2aL/MCQ/bt
 exjaK93SucU0j3jyBgMZZa51W7IFfn360GL0g9E3nmQzo2OzfLKQZ9jp5FjlaDKpRifgQ8iemJQ
 ljzQvx+i/r6DCTqIXtKUet1xg1p5GgOvJy7o7zFZW+GJ/nSLLnzuvzWA4nL6T9wxAANP7ugfclM
 3SruD+MFDbrD1BQdTQw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0
 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010019
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[quicinc.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	R_DKIM_ALLOW(-0.20)[quicinc.com:s=qcppdkim1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-110488-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[quicinc.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,quicinc.com:mid,quicinc.com:dkim,arm.com:email];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[quic_yingdeng@quicinc.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2E358618BAB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 5/29/2026 11:32 PM, Leo Yan wrote:
> On Thu, May 21, 2026 at 08:16:30PM +0800, Yingchao Deng wrote:
>
> [...]
>
>> @@ -515,18 +543,36 @@ static struct attribute *coresight_cti_regs_attrs[] = {
>>   	&dev_attr_appclear.attr,
>>   	&dev_attr_apppulse.attr,
>>   	coresight_cti_reg(triginstatus, CTITRIGINSTATUS),
>> +	coresight_cti_reg_index(triginstatus1, CTITRIGINSTATUS, 1),
>> +	coresight_cti_reg_index(triginstatus2, CTITRIGINSTATUS, 2),
>> +	coresight_cti_reg_index(triginstatus3, CTITRIGINSTATUS, 3),
> For this patch:
>
> Reviewed-by: Leo Yan <leo.yan@arm.com>
>
> AI tool reminds to update
> Documentation/ABI/testing/sysfs-bus-coresight-devices-cti, you might
> need to add description with a new patch:
>
>    What:           /sys/bus/coresight/devices/<cti-name>/regs/trigoutstatus[1-3]
>    Date:           May 2026
>    KernelVersion:  7.2
>    Contact:        coresight@lists.linaro.org
>    Description:    (Read) read current status of QCOM extended output trigger signals.
>
> And please add document for other new sysfs knobs.
>
> Thanks,
> Leo
   Thanks for the Reviewed-by.

   I noticed that among the new sysfs knobs in this series, the
   integration test registers (ittrigin[1-3], ittrigout[1-3],
   ittrigoutack[1-3], ittriginack[1-3]) have no existing documentation
   for their base (index-0) counterparts, which were added long before
   this series.

   Two options for patch 5/5:

     (a) Document only the knobs whose base versions are already
         documented (triginstatus[1-3] and trigoutstatus[1-3]).

     (b) Document everything in patch 5/5 — both the new indexed
         variants and the previously missing base IT register entries.

   I'm leaning toward (a) to keep the series focused, but happy to go
   with (b) if you prefer to get it all done at once. What do you think?


Thanks,
Yingchao

