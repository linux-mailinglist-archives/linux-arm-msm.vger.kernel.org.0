Return-Path: <linux-arm-msm+bounces-39730-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B5F49DF16E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Nov 2024 16:13:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 585F5B20B79
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Nov 2024 15:13:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B03B19F419;
	Sat, 30 Nov 2024 15:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YFIxG0vq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A26A9199FAD
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 Nov 2024 15:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732979577; cv=none; b=e3LLz/fmJLHKaP1zlAjCWw8++oPJKYa3jk3caDB9QX35DtC5eph9n5vzVRo7+BqKHNhgSeBfP0mSx/MiIiCO2YgMIFv6xJUR+G1/2Mh4jdWa0e+rVYtZDWUfqc7Kdjes7TX6KDS2Cxi4n9M67nwDq+c+YtN36JyQc0xwoD0GLNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732979577; c=relaxed/simple;
	bh=swP3eR9q5AxgACiSp3JiCAYHD6r93GGEio/MMIcxNoY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aGZmsN+6ox2oE3JqI769Zz4pER9LQuUwoZcroofalleNjhw9sNzYX+5Gf9WpfM6h7xhdlY7bvpnpmwI46X9jdSo7CszMSNWnh9cYCU9U8HuwakgVThyd7PNkbVyoSxKWdTpzIq/hvoYrIcLCxE26ylS1ZmLnBB43uvS/+D8ea6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YFIxG0vq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AUE0FVI003736
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 Nov 2024 15:12:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	piF9tu5HqYnrC9XnrkL0QyKgSzjororBfB+7R09Q5Vk=; b=YFIxG0vq8OaJMKRI
	XkRqU5lmxT7zZic+Lmwb3sXAunBdad6vzyETPvrIPKEdnEOrVGIeg4dUtutAdhyD
	/xl0lvdX9+5zjfMzPeX14BbKz1biLeQGCkk7Rrx12kc06X4+E5XQyA3iJo6lM9cd
	RZ2VgS3jwlENUoIWYw1gGxt5hZhRC5runNbMrtgzm7nrL8QaYn+njTFJSuo4UgOc
	sHcyapfHutrJ7GcPhMimXhAqIACa6vwbY2SNYXUdS16cwJRLFcx4jqg/fu6CjPbX
	tdph5TantWaX4rAOBcr3SM1xeyp2KEkAjZpKv1vC6vWPSYAuS75fSDY63rQ2c+wH
	fNEmSw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 437snqs0r7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 Nov 2024 15:12:54 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6d887d2f283so3201746d6.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 30 Nov 2024 07:12:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732979573; x=1733584373;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=piF9tu5HqYnrC9XnrkL0QyKgSzjororBfB+7R09Q5Vk=;
        b=VUFQ+riZzJ3c2PQSdxMR5XbDLVjWVhcDZMZx4Q4IeEGLlQwfcJZetqpLmVG/RaDkJZ
         8A7PmFHo0yvF+Z3vZbxjYX9rjEOiIhPVsyo8eZHDkpzuHi+mPAI0+oIU9181pYE+Xojz
         T2sA2VR3ynqhwkq1lsZdAhWJrE7wpIRYGryxiK9wOIJA6bBlolp+FnEQr+ac3Dwqtn0S
         pvn7atha0aUV97qBNdo0jFfD/bnWZ5u25jOfKyFrh8Wk9YQjExrpjdBq8sIVLVdHCcGI
         +E6koVgfiElYVPhYnWOsvDksEoCoyp0h2bp3p7BIj80vgrTBJC0E8rJR2KXzgVgt02VY
         g6MA==
X-Forwarded-Encrypted: i=1; AJvYcCUTF4q2uyOps+isHqV+r8mp474wnQgZqH62RbhfsQuR15pXBPST/RpVG8X12l/SZSz3pgNjAvaHuLOr0lKn@vger.kernel.org
X-Gm-Message-State: AOJu0YxWMcTk3Bc+Q5sxqfewLHjt+mz9YA8ohoS4eLhXz6L7xa2ZVMWk
	6iPHBsNPshcL437cN8zr4ocMlna2r6g7xEo5E/Dr4KSgFLqTZTZdyJQq+WYmca2j8Q34m0KV5st
	2NKD6ytts20J2qARJCOACjjcAFtRYxoGqQTujik1kbb9pIlR5ZPG+3BTdRStHVE4c
X-Gm-Gg: ASbGnctr8pNuhuSgkDYK+RQ1/6Kg9CerscfGxTvmOXpmh8wmqHh4gre0GcAZA/Ky7d3
	Xp9PWkPc1wkLVh9qOj8Rkifu+1e18LqZ3Jb69VXMyFjcJ72g5LwO/2n4ZZyBXhUSTpqbRWeyboE
	yV036UJ4Zk7iNjgWV4WN/GU9TG8XeCbXzT4mAtI85UbAI47+LJwFqEid1xWAyO0kq0YJMsMbTUO
	jSfqric9s36uUoD0nhVoYeRSy6CRjvJMCTSUdTbVoEb/9riEcJVKieq+f9ak4HgwCbUWyBJuxMv
	/FwW8KQweSLtAep2EOTdbKWYcRyyUeQ=
X-Received: by 2002:ac8:570a:0:b0:462:fb51:7801 with SMTP id d75a77b69052e-466b35d689amr89837911cf.8.1732979573224;
        Sat, 30 Nov 2024 07:12:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEHQyT6/DO0GMjgKj4/WCNKD0HwRh5XZtvFSFNn7j2Rzd6x6vgIxFx8jVCHofXYxn6dWgObkg==
X-Received: by 2002:ac8:570a:0:b0:462:fb51:7801 with SMTP id d75a77b69052e-466b35d689amr89837771cf.8.1732979572760;
        Sat, 30 Nov 2024 07:12:52 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa5998e649csm286979266b.110.2024.11.30.07.12.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 30 Nov 2024 07:12:52 -0800 (PST)
Message-ID: <0881289f-db05-4e33-91a7-ffd415c2f37e@oss.qualcomm.com>
Date: Sat, 30 Nov 2024 16:12:49 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V6 1/4] interconnect: qcom: Add multidev EPSS L3 support
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>,
        Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Odelu Kukatla <quic_okukatla@quicinc.com>,
        Mike Tipton <quic_mdtipton@quicinc.com>,
        Sibi Sankar
 <quic_sibis@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20241125174511.45-1-quic_rlaggysh@quicinc.com>
 <20241125174511.45-2-quic_rlaggysh@quicinc.com>
 <2b95cc25-a842-4edd-a5f3-2351038d264e@oss.qualcomm.com>
 <5egskepgsr52ulnbw7jhvazfjayg5ge5vhg6pi7mllyxx2vwqw@a2ojvabzd36o>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <5egskepgsr52ulnbw7jhvazfjayg5ge5vhg6pi7mllyxx2vwqw@a2ojvabzd36o>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: a7u-xh4z0nscqODJmVD9caC83MSpf2aZ
X-Proofpoint-GUID: a7u-xh4z0nscqODJmVD9caC83MSpf2aZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 phishscore=0 adultscore=0 impostorscore=0 malwarescore=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 mlxscore=0
 mlxlogscore=999 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2411300126

On 30.11.2024 4:09 PM, Dmitry Baryshkov wrote:
> On Sat, Nov 30, 2024 at 01:49:56PM +0100, Konrad Dybcio wrote:
>> On 25.11.2024 6:45 PM, Raviteja Laggyshetty wrote:
>>> EPSS on SA8775P has two instances which requires creation of two device
>>> nodes with different compatible and device data because of unique
>>> icc node id and name limitation in interconnect framework.
>>> Add multidevice support to osm-l3 code to get unique node id from IDA
>>> and node name is made unique by appending node address.
>>>
>>> Signed-off-by: Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>
>>> ---
>>
>> [...]
>>
>>> +	ret = of_property_read_reg(pdev->dev.of_node, 0, &addr, NULL);
>>> +	if (ret)
>>> +		return ret;
>>> +
>>>  	qp->base = devm_platform_ioremap_resource(pdev, 0);
>>>  	if (IS_ERR(qp->base))
>>>  		return PTR_ERR(qp->base);
>>> @@ -242,8 +262,13 @@ static int qcom_osm_l3_probe(struct platform_device *pdev)
>>>  
>>>  	icc_provider_init(provider);
>>>  
>>> +	/* Allocate unique id for qnodes */
>>> +	for (i = 0; i < num_nodes; i++)
>>> +		qnodes[i]->id = ida_alloc_min(&osm_l3_id, OSM_L3_NODE_ID_START, GFP_KERNEL);
>>
>> As I've said in my previous emails, this is a framework-level problem.
>>
>> Up until now we've simply silently ignored the possibility of an
>> interconnect provider having more than one instance, as conveniently
>> most previous SoCs had a bunch of distinct bus masters.
>>
>> Currently, debugfs-client.c relies on the node names being unique.
>> Keeping them as such is also useful for having a sane sysfs/debugfs
>> interface. But it's not always feasible, and a hierarchical approach
>> (like in pmdomain) may be a better fit.
>>
>> Then, node->id is used for creating links, and we unfortunately cannot
>> assume that both src and dst are within the same provider.
>> I'm not a fan of these IDs being hardcoded, but there are some drivers
>> that rely on that, which itself is also a bit unfortunate..
>>
>>
>> If Mike (who introduced debugfs-client and is probably the main user)
>> doesn't object to a small ABI break (which is "fine" with a debugfs
>> driver that requires editing the source code to be compiled), we could
>> add a property within icc_provider like `bool dynamic_ids` and have an
>> ICC-global IDA that would take care of any conflicts.
> 
> Frankly speaking, I think this just delays the inevitable. We have been
> there with GPIOs and with some other suppliers. In my opinion the ICC
> subsystem needs to be refactored in order to support linking based on
> the supplier (fwnode?) + offset_id, but that's a huuuge rework.

I thought about this too, but ended up not including it in the email..

I think this will be more difficult with ICC, as tons of circular
dependencies are inevitable by design and we'd essentially have to
either provide placeholder nodes (like it's the case today) or probe
only parts of a device, recursively, to make sure all links can be
created

Konrad

>> Provider drivers whose consumers don't already rely on programmatical
>> use of hardcoded IDs *and* don't have cross-provider links could then
>> enable that flag and have the node IDs and names set like you did in
>> this patch. This also sounds very useful for icc-clk.
> 

