Return-Path: <linux-arm-msm+bounces-104845-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ALk3CvUY8GmNOQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104845-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 04:18:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B5F47CAD0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 04:18:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1109F301D4FA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 02:18:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 195ED38E5DA;
	Tue, 28 Apr 2026 02:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="EfYbCGvv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 856D51B4223;
	Tue, 28 Apr 2026 02:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777342705; cv=none; b=sFVvwm6XcxGM9ycPjsbBR86mdbQqjLvOg32/YnFGcoHZG5c/WbwJhpWMBLJ2XsV246bfRhINpwqdD3K+ASNC+OgSCfdUlh/BS72zm3otmhybZluO2L973OuHn4W7vsfR7EhuZqFpCWAEi5kWr8ok2h77mIcWF6JHsE1SbjTRKAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777342705; c=relaxed/simple;
	bh=c6varrIoRd8vqXkTPQa5F1f4qdodFVZXitHD2bbplGU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=extUXkWGfSeDCiQTJPtpxn2ovL4PUyzULF7LgTa9ju0m6FRG/BeG0xX+f+u/Q3g8zCC/G+tVdUdSaXX97PQuZj77gC6/fJ2XvDyXOiyNKiYDQ+sF1BJoggHi+eP0u+Hvj4e5/NzQKC95p1dheanA5W1/TQm7V9Qsu1eLIvhpab4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=EfYbCGvv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RHc5kL1238182;
	Tue, 28 Apr 2026 02:18:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+mSqHhadXZwdIkQjUrQ98XJ41le3upGWvks3dKkuflo=; b=EfYbCGvvKvJbkmiH
	nsXfHJQzO5mID8xofn5Gvgh8PM/CL44lw8XPXXSFsHGyhEF+NbPkfGcx71baf+rY
	d/bE374rhtY7yn2NXTuUb/mSY6/FdBeNN4JTMKo5bk9h16ox+OSzTkgK4vLsQWsj
	3Huwp+3V8qYNDMigoTRh3VZci//aGm7t/fLBCIocH4W+LbjsKHkDM6DQBpow4PFF
	nnZJq6LSrbhJbwrSoe/b/T8N2+wETwAC+xmC1jk8t5GXTNLQ7A5v7WIuS+BDQr18
	yN8uG0WNEgH8rWUcU+2dkzq/kvArHQDtMyYGt9Lkv26lh/RQa4PUhYBe80C5SOQF
	gTcnCA==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt6n4k4qy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Apr 2026 02:18:14 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTPS id 63S2IDYI031978
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Apr 2026 02:18:13 GMT
Received: from [10.233.71.148] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 27 Apr
 2026 19:18:10 -0700
Message-ID: <e9bab953-06bb-456a-915d-02d067974c17@quicinc.com>
Date: Tue, 28 Apr 2026 10:18:08 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 4/4] coresight: cti: expose banked sysfs registers for
 Qualcomm extended CTI
To: Leo Yan <leo.yan@arm.com>, Yingchao Deng <yingchao.deng@oss.qualcomm.com>
CC: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        "Alexander
 Shishkin" <alexander.shishkin@linux.intel.com>,
        <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        Jinlong Mao <jinlong.mao@oss.qualcomm.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jie Gan
	<jie.gan@oss.qualcomm.com>,
        Yingchao Deng <quic_yingdeng@quicinc.com>
References: <20260426-extended-cti-v8-0-23b900a4902f@oss.qualcomm.com>
 <20260426-extended-cti-v8-4-23b900a4902f@oss.qualcomm.com>
 <20260427181557.GC16537@e132581.arm.com>
Content-Language: en-US
From: "Yingchao Deng (Consultant)" <quic_yingdeng@quicinc.com>
In-Reply-To: <20260427181557.GC16537@e132581.arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-ORIG-GUID: kTB4rlQ2bkGXn0xss1veCUiuXgFUmez7
X-Authority-Analysis: v=2.4 cv=Xba5Co55 c=1 sm=1 tr=0 ts=69f018e6 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=twmfm3ud3vkyRM4XvX8A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: kTB4rlQ2bkGXn0xss1veCUiuXgFUmez7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDAyMCBTYWx0ZWRfXwK6A1FvSBe7W
 IJLPwhFWrblM7QPQvXC4u8apng1C16o1docabkYDkEb9ZDjog7k+6zgXGFPACY5PzOgqUX8LArv
 0hrWWMJeZ5p3uGszZwrBoK4jm4Af0GR5qiE4FptC5f5MnM/A5tzal+VxCgB364pT+G6pOIGvHgx
 RW9iGZksJb/DwdLxpsqynWvJgmYoyGLFKQ0YpQQoKzJsgkwirN+OnFQIA3bDHFZWpsZSYc0C55u
 HAfIrccx7YNThLmjKCrSqqODhjF8IFgrqr1tkiTwjNgAtHI4GksYT5eiIztsNVNILC2VdIeP/BY
 c8obLFf+dhoCyY1N0TpFT99XFOCb0OsjjghErMunkkiF52AhTqov3cuYbBz6sTzAgxcsV1Acj++
 Pi6C5BpCaZx5rb+bwAUv+1bc5yoJk/C8hcegaVYgiM6cu0pQBre8afh6D5WGMc1u58+gmVQy7cl
 1clHlcNRNYBz9zQWUiQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 phishscore=0 adultscore=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280020
X-Rspamd-Queue-Id: 88B5F47CAD0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[quicinc.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[quicinc.com:s=qcppdkim1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-104845-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[quicinc.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[quicinc.com:dkim,quicinc.com:mid,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[quic_yingdeng@quicinc.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]


On 4/28/2026 2:15 AM, Leo Yan wrote:
> On Sun, Apr 26, 2026 at 05:44:41PM +0800, Yingchao Deng wrote:
>> Qualcomm extended CTI implements banked trigger status and integration
>> registers, where each bank covers 32 triggers. Multiple instances of
>> these registers are required to expose the full trigger space.
>>
>> Add static sysfs entries for the banked CTI registers and control their
>> visibility based on the underlying hardware configuration. Numbered
>> sysfs nodes are hidden on standard ARM CTIs, preserving the existing ABI.
>> On Qualcomm CTIs, only banked registers backed by hardware are exposed,
>> with the number of visible banks derived from nr_trig_max.
>>
>> This ensures that userspace only sees registers that are actually
>> implemented, while maintaining compatibility with existing CTI tooling.
>>
>> Signed-off-by: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
>> ---
>>   drivers/hwtracing/coresight/coresight-cti-sysfs.c | 58 +++++++++++++++++++++++
>>   1 file changed, 58 insertions(+)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-cti-sysfs.c b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
>> index 8b70e7e38ea3..046757e4e9b6 100644
>> --- a/drivers/hwtracing/coresight/coresight-cti-sysfs.c
>> +++ b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
>> @@ -512,18 +512,36 @@ static struct attribute *coresight_cti_regs_attrs[] = {
>>   	&dev_attr_appclear.attr,
>>   	&dev_attr_apppulse.attr,
>>   	coresight_cti_reg(triginstatus, CTITRIGINSTATUS),
>> +	coresight_cti_reg(triginstatus1, CTI_REG_SET_NR_CONST(CTITRIGINSTATUS, 1)),
> How about extend the cs_off_attribute struct:
>
>    struct cs_off_attribute {
>          struct device_attribute attr;
>          u32 off;
>          u32 index;
>    };
>
>    // by default, the index is 0
>    #define coresight_cti_reg(name, offset)                               \
>          (&((struct cs_off_attribute[]) {                                \
>             {                                                            \
>                  __ATTR(name, 0444, coresight_cti_reg_show, NULL),       \
>                  offset                                                  \
>                  0                                                       \
>             }                                                            \
>    })[0].attr.attr)
>
>    // For the register with index
>    #define coresight_cti_reg_index(name, offset, index)                  \
>          (&((struct cs_off_attribute[]) {                                \
>             {                                                            \
>                  __ATTR(name, 0444, coresight_cti_reg_show, NULL),       \
>                  offset                                                  \
>                  index                                                   \
>             }                                                            \
>    })[0].attr.attr)
>
>    coresight_cti_reg_index(triginstatus1, CTITRIGINSTATUS, 1),
>
>> +	coresight_cti_reg(triginstatus2, CTI_REG_SET_NR_CONST(CTITRIGINSTATUS, 2)),
>> +	coresight_cti_reg(triginstatus3, CTI_REG_SET_NR_CONST(CTITRIGINSTATUS, 3)),
>>   	coresight_cti_reg(trigoutstatus, CTITRIGOUTSTATUS),
>> +	coresight_cti_reg(trigoutstatus1, CTI_REG_SET_NR_CONST(CTITRIGOUTSTATUS, 1)),
>> +	coresight_cti_reg(trigoutstatus2, CTI_REG_SET_NR_CONST(CTITRIGOUTSTATUS, 2)),
>> +	coresight_cti_reg(trigoutstatus3, CTI_REG_SET_NR_CONST(CTITRIGOUTSTATUS, 3)),
>>   	coresight_cti_reg(chinstatus, CTICHINSTATUS),
>>   	coresight_cti_reg(choutstatus, CTICHOUTSTATUS),
>>   #ifdef CONFIG_CORESIGHT_CTI_INTEGRATION_REGS
>>   	coresight_cti_reg_rw(itctrl, CORESIGHT_ITCTRL),
>>   	coresight_cti_reg(ittrigin, ITTRIGIN),
>> +	coresight_cti_reg(ittrigin1, CTI_REG_SET_NR_CONST(ITTRIGIN, 1)),
>> +	coresight_cti_reg(ittrigin2, CTI_REG_SET_NR_CONST(ITTRIGIN, 2)),
>> +	coresight_cti_reg(ittrigin3, CTI_REG_SET_NR_CONST(ITTRIGIN, 3)),
>>   	coresight_cti_reg(itchin, ITCHIN),
>>   	coresight_cti_reg_rw(ittrigout, ITTRIGOUT),
>> +	coresight_cti_reg_rw(ittrigout1, CTI_REG_SET_NR_CONST(ITTRIGOUT, 1)),
>> +	coresight_cti_reg_rw(ittrigout2, CTI_REG_SET_NR_CONST(ITTRIGOUT, 2)),
>> +	coresight_cti_reg_rw(ittrigout3, CTI_REG_SET_NR_CONST(ITTRIGOUT, 3)),
>>   	coresight_cti_reg_rw(itchout, ITCHOUT),
>>   	coresight_cti_reg(itchoutack, ITCHOUTACK),
>>   	coresight_cti_reg(ittrigoutack, ITTRIGOUTACK),
>> +	coresight_cti_reg(ittrigoutack1, CTI_REG_SET_NR_CONST(ITTRIGOUTACK, 1)),
>> +	coresight_cti_reg(ittrigoutack2, CTI_REG_SET_NR_CONST(ITTRIGOUTACK, 2)),
>> +	coresight_cti_reg(ittrigoutack3, CTI_REG_SET_NR_CONST(ITTRIGOUTACK, 3)),
>>   	coresight_cti_reg_wo(ittriginack, ITTRIGINACK),
>> +	coresight_cti_reg_wo(ittriginack1, CTI_REG_SET_NR_CONST(ITTRIGINACK, 1)),
>> +	coresight_cti_reg_wo(ittriginack2, CTI_REG_SET_NR_CONST(ITTRIGINACK, 2)),
>> +	coresight_cti_reg_wo(ittriginack3, CTI_REG_SET_NR_CONST(ITTRIGINACK, 3)),
>>   	coresight_cti_reg_wo(itchinack, ITCHINACK),
>>   #endif
>>   	NULL,
>> @@ -534,10 +552,50 @@ static umode_t coresight_cti_regs_is_visible(struct kobject *kobj,
>>   {
>>   	struct device *dev = kobj_to_dev(kobj);
>>   	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
>> +	static const char * const qcom_suffix_registers[] = {
>> +		"triginstatus",
>> +		"trigoutstatus",
>> +#ifdef CONFIG_CORESIGHT_CTI_INTEGRATION_REGS
>> +		"ittrigin",
>> +		"ittrigout",
>> +		"ittriginack",
>> +		"ittrigoutack",
>> +#endif
>> +	};
>> +	int i, nr, max_bank;
>> +	size_t len;
>>   
>>   	if (attr == &dev_attr_asicctl.attr && !drvdata->config.asicctl_impl)
>>   		return 0;
>>   
>> +	/*
>> +	 * Banked regs are exposed as <qcom_suffix_registers><nr> (nr = 1..3).
>> +	 * - Hide them on standard CTIs.
>> +	 * - On QCOM CTIs, hide suffixes beyond the number of banks implied
>> +	 *   by nr_trig_max (32 triggers per bank).
>> +	 */
>> +	for (i = 0; i < ARRAY_SIZE(qcom_suffix_registers); i++) {
> This can be general for a register with index?  Like:
>
>    for (i = 0; i < ARRAY_SIZE(registers_with_index); i++) {
>
>> +		len = strlen(qcom_suffix_registers[i]);
>> +
>> +		if (strncmp(attr->name, qcom_suffix_registers[i], len))
>> +			continue;
>> +
>> +		if (kstrtoint(attr->name + len, 10, &nr))
>> +			continue;
>> +
>> +		if (!drvdata->is_qcom_cti)
>> +			return 0;
>> +
>> +		if (nr < 1 || nr > 3)
>> +			return 0;
>> +
>> +		max_bank = DIV_ROUND_UP(drvdata->config.nr_trig_max, 32) - 1;
>> +		if (nr > max_bank)
>> +			return 0;
> Directly check the attr's index here?
>
>    struct cs_off_attribute *cti_attr =
>                  container_of(attr, struct cs_off_attribute, attr);
>
>    max_bank = DIV_ROUND_UP(drvdata->config.nr_trig_max, 32);
>    if (cti_attr->index >= max_bank)
>        return 0;
>
> Thanks,
> Leo
Will update.

Thanks,
Yingchao

