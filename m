Return-Path: <linux-arm-msm+bounces-27756-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 19B2C9456ED
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Aug 2024 06:23:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B67DE1F242FC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Aug 2024 04:23:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49A27200DE;
	Fri,  2 Aug 2024 04:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Oipho2WI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F2AA79E5;
	Fri,  2 Aug 2024 04:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722572582; cv=none; b=l1VnV902g3Wi9ClMYw4Nv7RmVTOhep+UKljGdMsUWqVdwmVPvcqtpDeeSlCciQvYFynpE+joG6hc+pyon8E8cqb8nhB3S57syEl/xfKrJWOAjUXTeBSlk87ge7hlTDjabyZA7shMbQBrOKza9+McgTMERcv4EBMaGxfTVuJHzuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722572582; c=relaxed/simple;
	bh=3ORW/fD0Ep6n3DQmpaTVum7vWFjXkSkdTlzSd3jeshM=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=bkADn8rl0ZeuluGwqy0l/dQU0F8EYzRD6EnXx2sQzmmHDbHvw4MBtut/pGesqnaHWR1tnN7QhiLLTEJsPya0JyZ+KnmqWCjbeHbo9mxI6vgRXHfEAfg89Tr1dWyKqop2bm5ee2oA3THI7zs7M4d6BvhD1rMe8iKYeKaExqdo05Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Oipho2WI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 471LbKPH009482;
	Fri, 2 Aug 2024 04:22:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eee2pD8O4aEZsVujc0se8xleY3KuTmsCvP2EL3/ttjk=; b=Oipho2WI2oaivVEF
	eplSRrg5esmScWX0RSm9Zey5KArh+3md24UBr6/CtUZKKASscVTqkqW8mAl9HmxN
	Jtzirkk9Q+FtCQhuTJTDkUqXVHmbQX4P6LXHnOt+IyYH56IFkPIHz4VC0zLi4zX7
	kubtxKVJskh1cf+mKwTVjw8Nsair0LvGKkP5N6wRA2A5ffjZYEKAdd+XhkCr3qLq
	6cudqa1T1XH3EIqHh8prFcRSeEqcEbMSWpjVoVPEYPiQLnKIuPmmIA5zkMKBf1yR
	PgdeWpm28MNzkqVX8fc2tGi1BtObKVg7OCSexzYzE1ffEK+QIBbyYLwa6w7kY0e0
	L9FVaA==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40rje6rnc4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 Aug 2024 04:22:12 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 4724MBnp015592
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 2 Aug 2024 04:22:11 GMT
Received: from [10.216.16.55] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 1 Aug 2024
 21:22:05 -0700
Message-ID: <345bde7b-ac61-8265-8dce-d6a9dc1ca2fe@quicinc.com>
Date: Fri, 2 Aug 2024 09:51:44 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 2/6] md: dm-crypt: Set cc->iv_size to 4 bytes
Content-Language: en-US
To: Milan Broz <gmazyland@gmail.com>, <axboe@kernel.dk>, <agk@redhat.com>,
        <snitzer@kernel.org>, <mpatocka@redhat.com>, <adrian.hunter@intel.com>,
        <quic_asutoshd@quicinc.com>, <ritesh.list@gmail.com>,
        <ulf.hansson@linaro.org>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <linux-block@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <dm-devel@lists.linux.dev>,
        <linux-mmc@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <quic_viswanat@quicinc.com>, <quic_srichara@quicinc.com>,
        <quic_varada@quicinc.com>
References: <20240730115838.3507302-1-quic_mdalam@quicinc.com>
 <20240730115838.3507302-3-quic_mdalam@quicinc.com>
 <c897b521-0520-429e-9e94-ba7da74a921f@gmail.com>
From: Md Sadre Alam <quic_mdalam@quicinc.com>
In-Reply-To: <c897b521-0520-429e-9e94-ba7da74a921f@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: N2fic3gubwvizZS42k8gs0OxAHQmF50K
X-Proofpoint-GUID: N2fic3gubwvizZS42k8gs0OxAHQmF50K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-02_01,2024-08-01_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 mlxscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=999 clxscore=1011
 adultscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408020027



On 7/31/2024 6:11 PM, Milan Broz wrote:
> On 7/30/24 1:58 PM, Md Sadre Alam wrote:
>> Set cc->iv_size to 4 bytes instead of 8 bytes, since
>> this cc->iv_size is passing as data unit bytes to
>> blk_crypto_init_key(). Since CQHCI driver having
>> limitation for data unit bytes to 32-bit only.
> 
> In dm-crypt, plain64 IV is defined as "little-endian 64bit IV"
> and was introduced to fix security problem when 32bit "plain" IV
> overflows and IV is reused.
> 
> In that case you can move ciphertext sector between places with
> the same IV (but different offsets) and these will be still
> correctly decrypted.
> 
> If I understand it correctly, this reintroduces the same problem here.
> If you have 32bit only, just use "plain" and do not support plain64 here.
> 
> (In general, I do not understand why you are sending patches
> for dm-crypt code that is clearly not upstream.
> I hope this code will never be accepted.)

  Thanks for reviewing. As Mikulas suggested for
  new target driver for "inline-crypt". Will create
  new target driver and post it.

> 
> Milan
> 
>>
>> Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
>> ---
>>   drivers/md/dm-crypt.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/md/dm-crypt.c b/drivers/md/dm-crypt.c
>> index 37add222b169..c0257d961968 100644
>> --- a/drivers/md/dm-crypt.c
>> +++ b/drivers/md/dm-crypt.c
>> @@ -2490,7 +2490,7 @@ static int crypt_select_inline_crypt_mode(struct dm_target *ti, char *cipher,
>>       }
>>       if (ivmode == NULL || (strcmp(ivmode, "plain64") == 0)) {
>> -        cc->iv_size = 8;
>> +        cc->iv_size = 4;
>>       } else {
>>           ti->error = "Invalid IV mode for inline_crypt";
>>           return -EINVAL;
> 

