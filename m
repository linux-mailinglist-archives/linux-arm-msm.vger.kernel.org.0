Return-Path: <linux-arm-msm+bounces-110212-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KFlDHa3sGGqEowgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110212-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 03:32:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D261D5FC082
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 03:32:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 82CE73012251
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 01:32:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35FB93438AF;
	Fri, 29 May 2026 01:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="QXK066fT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDAC2C2EA;
	Fri, 29 May 2026 01:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780018347; cv=none; b=DFjfljUTEpuG+yP3Sr/ZByH3eojNpgbb9UUhohqucnxlMKirpddlTarg2o/P++kZAVtuTWybXSMbahcDpjgorKH6s+D/AT7EXkaKxvetknGAsisncLZwutMAvoyKDnNQuHXrvpmDkytd8pdBzQNR9hZ9l3VvQxXsBNgIaZ9lXZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780018347; c=relaxed/simple;
	bh=tFIQZuMf7lcl4+cgGNaFs1ovJ8Gu1qUjuILKaMVNahw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=gQt6h90IQFo15R4MAizFaRf6PzwrbmD6aleYyguCAi8X3y7wSJsaDs99yvl9lisbyo/ankUhWXQMZx2dSwQBixdGzJ1Yb7YC+6AMP+0H88XZDXEZts7SsUf1R9bzoB2V4sgsH2VwKVyXt3Y78Kqgj32jcDBeRBlXy1rroOOPv2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=QXK066fT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64T0A7C91495706;
	Fri, 29 May 2026 01:32:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JyR0jNyg51FLGM0Fwv/BNrV/LG6rLNf+jCbaD0Res2U=; b=QXK066fTU7rqm/Qd
	8f5Zukv/or8+GG95ChPvQio93eyRAYAJsg+J9qVj3YDCU8pZtyW+U3dIvkbbPPE0
	p7KknVlv8s5YD8F57fUZny5btgle9zvQQsaj0uil+FfkDRxDn1+B/FJgpvXqt7Km
	kC4Ezy9DqHBSFe3qcSrmrQpOR6TIxs7dJFHwzwdBlN1wvMqPwbr3HxvfDb64t1+V
	3zAoUrTIFjsy0tgGNdiR4gJXZTLjVXdStbowUdK/5tVbX78iJfdK1HowXXb4bgLh
	SVhyWSCwtyal/0wTTILdHDivRe2xepv9vunaKEX5XQfNtn7WOmSkINhuAL69w8Tm
	TK4ZUw==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ef01587wg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 May 2026 01:32:15 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTPS id 64T1WFA3011031
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 May 2026 01:32:15 GMT
Received: from [10.233.71.148] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 28 May
 2026 18:32:12 -0700
Message-ID: <c3564b85-955f-4839-94b1-0345707a1ab5@quicinc.com>
Date: Fri, 29 May 2026 09:31:57 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/4] coresight: cti: Convert trigger usage fields to
 dynamic
To: Leo Yan <leo.yan@arm.com>, Yingchao Deng <yingchao.deng@oss.qualcomm.com>
CC: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        "Alexander
 Shishkin" <alexander.shishkin@linux.intel.com>,
        <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <jinlong.mao@oss.qualcomm.com>, <tingwei.zhang@oss.qualcomm.com>,
        <jie.gan@oss.qualcomm.com>
References: <20260521-extended_cti-v9-0-d21f4f92c51e@oss.qualcomm.com>
 <20260521-extended_cti-v9-1-d21f4f92c51e@oss.qualcomm.com>
 <20260528180129.GJ101133@e132581.arm.com>
Content-Language: en-US
From: "Yingchao Deng (Consultant)" <quic_yingdeng@quicinc.com>
In-Reply-To: <20260528180129.GJ101133@e132581.arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-ORIG-GUID: Mxx0XKoQrU2Emb-QQixZ28gFrlzVnZJP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDAxMiBTYWx0ZWRfX1evf7YtoXpX9
 z/OC1ep/uYV93Sun7G9U9ZX7c0delhP058h2kYd+kF2q/h7cIpX+qn4RPPA2nvM8RkaEFcpgIYh
 tvlzmuqeGaLiWKQ8XAMW7Dj0VtwaVkmKACCKfSAoV2k+6flZwOxD/5uthFL9SO31n2+1fgY+Zob
 lc7dwT5iKIkwDDgOoHHXXlP4xflS4RMbL5pKBw7biI8V5iGTtdCE7U9JP8xRCVKk0QZs5FW1RSc
 cRZniNtatUk5FunAQMa+HO8M5/hpTG5Lbo6LUDGui4z+c+oEI4y0POi3jV8E1S7fyHXnIR331tV
 WsvbZOFupVVQlxPRdU8cTRBr+SA8NR6PMqmb2bjmw6FxyMUyAUjAovVgADKA3jlsK+UWoTmpzKo
 y5D2sEK+fxhhDsZv/zmTLrmeqB0ky+MU1u33qTxD8eNbxPNrrjOPGc5ozAfxqRBRzO4bmW3NRSc
 pw3adwp3YK760VBLu4w==
X-Authority-Analysis: v=2.4 cv=DIG/JSNb c=1 sm=1 tr=0 ts=6a18ec9f cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=7CQSdrXTAAAA:8 a=sI340vtnV6QC4qxvR_4A:9 a=QEXdDO2ut3YA:10
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: Mxx0XKoQrU2Emb-QQixZ28gFrlzVnZJP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_07,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 spamscore=0 impostorscore=0 adultscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290012
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[quicinc.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[quicinc.com:s=qcppdkim1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-110212-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[quicinc.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,arm.com:email];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[quic_yingdeng@quicinc.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D261D5FC082
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 5/29/2026 2:01 AM, Leo Yan wrote:
> On Thu, May 21, 2026 at 08:16:27PM +0800, Yingchao Deng wrote:
>
> [...]
>
>> @@ -231,6 +254,8 @@ struct cti_trig_con *cti_allocate_trig_con(struct device *dev, int in_sigs,
>>   {
>>   	struct cti_trig_con *tc = NULL;
>>   	struct cti_trig_grp *in = NULL, *out = NULL;
>> +	struct cti_drvdata *drvdata = dev_get_drvdata(dev);
>> +	int n_trigs = drvdata->config.nr_trig_max;
> I don't mind it allocates bitmask with nr_trig_max, but AI review
> suggests that when in_sigs / out_sigs bigger than nr_trig_max, it might
> access memory out-of-boundary (see cti_plat_read_trig_group()).
>
> It is good to add a check:
>
>      if (in_sigs > n_trigs || out_sigs > n_trigs) {
>          dev_err(dev, "trigger signal is out of range: in=%d out=%d nr_max=%d\n",
>                  in_sigs, out_sigs, n_trigs\n");
>          return NULL;
>      }
>
> With this:
>
> Reviewed-by: Leo Yan <leo.yan@arm.com>
>
> BTW, I have given my review tag on v8, please remember to update
> patches with review / ack tags.

Will update.

Thanks,
Yingchao

