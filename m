Return-Path: <linux-arm-msm+bounces-67962-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 134BDB1D285
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Aug 2025 08:34:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C367F189017B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Aug 2025 06:35:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79FC2212FAA;
	Thu,  7 Aug 2025 06:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hKXse06K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 954277FBA1;
	Thu,  7 Aug 2025 06:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754548493; cv=none; b=rfjrJXTkrcJIqX3GfbkNJyrw3JEsKfF1O3Wxk7JeVoVhuVMxWRpLxXzw8nQzXF98swLI6712oUV1N1Eubb35M1LFg8n7/qLKDZiEJtJ7Ug98jZHsVFnDF4nksUD72XP52ka0+tlA9ZPPjxpakYkqpbgLnjpMfoQT4+2uDaM6Ekg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754548493; c=relaxed/simple;
	bh=yLIMhLwG4fvZtaq1+QbmdDfEQnWZeJolXFY/ttnj028=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Rgnbj72xQ0qD4mQLrLXo0vykRAmR4T2UcDblu9s3fPTXtdFx+gy4aObjOXLXc3FdCGyJyv/iPuSNZT8pgqcIJRACG2YUpn3kR4mqVa2OQup/WVpDpj3JX2eC5LhfqJBBLYewisVY8sexHf3yn7uhTXSQ0Er/cQdQv2BfzZLnNAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=hKXse06K; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5776CoqW032244;
	Thu, 7 Aug 2025 06:34:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+vAYAORzrriPUdJ+Q/oYHNyyItcYIcDJcqMoO5EPZgA=; b=hKXse06KhM1knT5j
	7RDvqPzGg5IJlXPGU0Lk0Vjxa76n3FvZ7RLOz83tx/HjuKDb5+s3KuipR42A/dTG
	gkH11ouP2gg9iTEPb3Med1Mf9tpWtZlv6F8Ncw2oSnBi7tMPV3O/lZy4T1pktRHo
	8YsWmZyP5V3NH2CrlR3TiYu9dR4e/H98GVEO/URPHikCnZumDZhfShvxhe5USXSk
	O8auAORkY6K8PuCmcv4/4NSwZs3AMuJQnYLvhx5d8kydcUvalk6SvF2OQNFapLAS
	45gh4A11AILgb7/hITijqajWzGOAbHnFL8//rXkrnDglHbXvXqzL1G8GUNFAfNPQ
	07XcIA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpw2wbgx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Aug 2025 06:34:37 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5776Yaer005536
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 7 Aug 2025 06:34:36 GMT
Received: from [10.239.133.49] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 6 Aug
 2025 23:34:32 -0700
Message-ID: <fbb693a7-224a-4155-88a2-67e05faaf21e@quicinc.com>
Date: Thu, 7 Aug 2025 14:34:29 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] stm: class: Add MIPI OST protocol support
To: Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Steven Rostedt
	<rostedt@goodmis.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        "Jonathan
 Corbet" <corbet@lwn.net>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Tingwei Zhang
	<quic_tingweiz@quicinc.com>
CC: <linux-kernel@vger.kernel.org>, <linux-trace-kernel@vger.kernel.org>,
        <linux-doc@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>,
        Yuanfang Zhang <quic_yuanfang@quicinc.com>,
        Tao Zhang
	<quic_taozha@quicinc.com>,
        Hao Zhang <quic_hazha@quicinc.com>
References: <20230419141328.37472-1-quic_jinlmao@quicinc.com>
 <87cz3yyiqf.fsf@ubik.fi.intel.com>
Content-Language: en-US
From: Jinlong Mao <quic_jinlmao@quicinc.com>
In-Reply-To: <87cz3yyiqf.fsf@ubik.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=Vbz3PEp9 c=1 sm=1 tr=0 ts=689448fd cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=b55CFHG7iiXKeY8L-hQA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: -GOc8sAEv-RcYJ75lxStY_8IBQuYJA7m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOCBTYWx0ZWRfX8M/trCRHG0r3
 5InmPPFyj/YFls1zisGC/cSV4Ri1xxORfGM0HhTk40jMhQDArESBAKDrtE7Uqz3av8Sa1JS8/wb
 bKA31BrUs/QDF0n5tBJ2WfY5RzIP+EMmt4GDHGLj0XBjkbz7StqaForb4jkasBW9CvPahEtEoQ4
 BaCHl5JUg+oMWMFnS0pbZJpAmDuvB1olc7ri5cs7I5EeSbW6VYBlk/XSe03wgFvjAkWzpOiyhTA
 Grbg24ViW8GIOXpD5eQz173OFHAC0WR/DiqKIcRVZ2bbnkDmTCOt4iXBogfjLMNsGosj3ESMjsm
 8HjL5WMdio9db7ECoBoVPcEv3o9rPpoHpNBQJTETlZCIaeddo/tTZ33h1mLhuIUZs5YOenk13uN
 +ncssL07
X-Proofpoint-GUID: -GOc8sAEv-RcYJ75lxStY_8IBQuYJA7m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_05,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 malwarescore=0 adultscore=0 suspectscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508060008



On 4/20/2023 6:02 PM, Alexander Shishkin wrote:
> Mao Jinlong <quic_jinlmao@quicinc.com> writes:
> 
>> Add MIPI OST(Open System Trace) protocol support for stm to format
>> the traces. OST over STP packet consists of Header/Payload/End. In
>> header, there will be STARTSIMPLE/VERSION/ENTITY/PROTOCOL. STARTSIMPLE
>> is used to signal the beginning of a simplified OST base protocol
>> packet.The Entity ID field is a one byte unsigned number that identifies
>> the source. FLAG packet is used for END token.
> 
> We'd need a better explanation of what OST is, maybe a link to the spec
> if one exists.
> 
Hi Alexander,

Checked with different internal teams. Spec is not public. We need to 
upstream these codes. We can add more explanation into the commit
text. Is that ok for your ?

Thanks
Jinlong Mao



> Another thing that this patch does is adding source identification,
> which needs to be described better.
> 
> [...]
> 
>> +CONFIG_STM_PROTO_OST is for p_ost driver enablement. Once this config
>> +is enabled, you can select the p_ost protocol by command below:
>> +
>> +# mkdir /sys/kernel/config/stp-policy/stm0:p_ost.policy
>> +
>> +The policy name format is extended like this:
>> +    <device_name>:<protocol_name>.<policy_name>
>> +
>> +With coresight-stm device, it will be look like "stm0:p_ost.policy".
> 
> The part about protocol selection should probably be in stm.rst
> instead.
> 
>> +You can check if the protocol is set successfully by:
>> +# cat /sys/kernel/config/stp-policy/stm0:p_ost.policy/protocol
>> +p_ost
> 
> A successful mkdir is technically enough.
> 
>> +With MIPI OST protocol driver, the attributes for each protocol node is:
>> +# mkdir /sys/kernel/config/stp-policy/stm0:p_ost.policy/default
>> +# ls /sys/kernel/config/stp-policy/stm0:p_ost.policy/default
>> +channels  entity    masters
> 
> Where's "entity_available"?
> 
>> +The entity here is the set the entity that p_ost supports. Currently
>> +p_ost supports ftrace and console entity.
>> +
>> +Get current available entity that p_ost supports:
>> +# cat /sys/kernel/config/stp-policy/stm0:p_ost.policy/default/entity_available
>> +ftrace console
>> +
>> +Set entity:
>> +# echo 'ftrace' > /sys/kernel/config/stp-policy/stm0:p_ost.policy/default/entity
> 
> This is not a very good example, as it will flag everything that goes
> through STM as "ftrace", which is probably not what anybody wants.
> 
> The bigger question is, why do we need to set the source type (for
> which "entity" is not a very good name, btw) in the configfs when
> corresponding stm source drivers already carry this information.
> There should be a way to propagate the source type from stm source
> driver to the protocol driver without relying on the user to set it
> correctly.
> 
>> +See Documentation/ABI/testing/configfs-stp-policy-p_ost for more details.
>> diff --git a/drivers/hwtracing/stm/Kconfig b/drivers/hwtracing/stm/Kconfig
>> index eda6b11d40a1..daa4aa09f64d 100644
>> --- a/drivers/hwtracing/stm/Kconfig
>> +++ b/drivers/hwtracing/stm/Kconfig
>> @@ -40,6 +40,20 @@ config STM_PROTO_SYS_T
>>   
>>   	  If you don't know what this is, say N.
>>   
>> +config STM_PROTO_OST
>> +	tristate "MIPI OST STM framing protocol driver"
>> +	default CONFIG_STM
>> +	help
>> +	  This is an implementation of MIPI OST protocol to be used
>> +	  over the STP transport. In addition to the data payload, it
>> +	  also carries additional metadata for entity, better
>> +	  means of trace source identification, etc.
> 
> What does "entity" mean here?
> 
> [...]
> 
>> +#define OST_TOKEN_STARTSIMPLE		(0x10)
>> +#define OST_VERSION_MIPI1		(0x10 << 8)
> 
> Either write them as bits (BIT(12)) or as a hex value (0x1000).
> 
>> +/* entity id to identify the source*/
>> +#define OST_ENTITY_FTRACE		(0x01 << 16)
>> +#define OST_ENTITY_CONSOLE		(0x02 << 16)
>> +
>> +#define OST_CONTROL_PROTOCOL		(0x0 << 24)
> 
> Zero, really? At this point I'm wondering if this code has even been
> tested.
> 
> [...]
> 
>> +static ssize_t
>> +ost_t_policy_entity_store(struct config_item *item, const char *page,
>> +			size_t count)
>> +{
>> +	struct mutex *mutexp = &item->ci_group->cg_subsys->su_mutex;
>> +	struct ost_policy_node *pn = to_pdrv_policy_node(item);
>> +	char str[10] = "";
>> +
>> +	mutex_lock(mutexp);
>> +	if (sscanf(page, "%s", str) != 1)
>> +		return -EINVAL;
>> +	mutex_unlock(mutexp);
> 
> You forgot to release the mutex in the error path.
> Also, why do you need a mutex around sscanf() in the first place?
> Also, the sscanf() can overrun str.
> 
>> +	if (!strcmp(str, str_ost_entity_type[OST_ENTITY_TYPE_FTRACE]))
>> +		pn->entity_type = OST_ENTITY_TYPE_FTRACE;
>> +	else if (!strcmp(str, str_ost_entity_type[OST_ENTITY_TYPE_CONSOLE]))
>> +		pn->entity_type = OST_ENTITY_TYPE_CONSOLE;
> 
> Why can't you strcmp() on the page directly?
> Also, this is where you do want to hold the mutex.
> Also, what if there are more source types?
> 
>> +	else
>> +		return -EINVAL;
>> +	return count;
>> +}
>> +CONFIGFS_ATTR(ost_t_policy_, entity);
>> +
>> +static ssize_t ost_t_policy_entity_available_show(struct config_item *item,
>> +				char *page)
>> +{
>> +	return scnprintf(page, PAGE_SIZE, "%s\n", "ftrace console");
> 
> Don't hardcode these.
> 
>> +}
>> +CONFIGFS_ATTR_RO(ost_t_policy_, entity_available);
>> +
>> +static struct configfs_attribute *ost_t_policy_attrs[] = {
>> +	&ost_t_policy_attr_entity,
>> +	&ost_t_policy_attr_entity_available,
>> +	NULL,
>> +};
>> +
>> +static ssize_t notrace ost_write(struct stm_data *data,
>> +		struct stm_output *output, unsigned int chan,
>> +		const char *buf, size_t count)
>> +{
>> +	unsigned int c = output->channel + chan;
>> +	unsigned int m = output->master;
>> +	const unsigned char nil = 0;
>> +	u32 header = DATA_HEADER;
>> +	u8 trc_hdr[16];
>> +	ssize_t sz;
>> +
>> +	struct ost_output *op = output->pdrv_private;
> 
> As said above, the stm source driver that calls here already knows its
> own source type, there's no need to store it separately.
> 
>> +
>> +	/*
>> +	 * Identify the source by entity type.
>> +	 * If entity type is not set, return error value.
>> +	 */
>> +	if (op->node.entity_type == OST_ENTITY_TYPE_FTRACE) {
>> +		header |= OST_ENTITY_FTRACE;
>> +	} else if (op->node.entity_type == OST_ENTITY_TYPE_CONSOLE) {
>> +		header |= OST_ENTITY_CONSOLE;
>> +	} else {
>> +		pr_debug("p_ost: Entity must be set for trace data.");
> 
> You forgot a newline.
> Also, this message seems to be quite useless: it's either a nop or a
> dmesg storm. In general, it's a bad idea to printk() in the write
> callback.
> 
>> +		return -EINVAL;
>> +	}
>> +
>> +	/*
>> +	 * STP framing rules for OST frames:
>> +	 *   * the first packet of the OST frame is marked;
>> +	 *   * the last packet is a FLAG with timestamped tag.
>> +	 */
>> +	/* Message layout: HEADER / DATA / TAIL */
>> +	/* HEADER */
>> +	sz = data->packet(data, m, c, STP_PACKET_DATA, STP_PACKET_MARKED,
>> +			  4, (u8 *)&header);
>> +	if (sz <= 0)
>> +		return sz;
>> +
>> +	/* DATA */
>> +	*(u16 *)(trc_hdr) = STM_MAKE_VERSION(0, 4);
>> +	*(u16 *)(trc_hdr + 2) = STM_HEADER_MAGIC;
>> +	*(u32 *)(trc_hdr + 4) = raw_smp_processor_id();
>> +	*(u64 *)(trc_hdr + 8) = task_tgid_nr(get_current());
> 
> What's the value in exporting PIDs when there are PID namespaces? How is
> this useful? Also, neither console nor ftrace are required to come in a
> task context.
> 
> I already asked in the previous version, why is trc_hdr not a struct?
> 
> There also used to be a timestamp field in trc_hdr, what happened to it?
> 
> Regards,
> --
> Alex


