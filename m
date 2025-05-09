Return-Path: <linux-arm-msm+bounces-57508-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1854AAB200F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 May 2025 00:46:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7E12D5002CB
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 May 2025 22:46:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4112D220F58;
	Fri,  9 May 2025 22:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VVJwUiIH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98FC31CCEE0
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 May 2025 22:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746830781; cv=none; b=N8bFufEtgsktNrrvCOZwXhoLrhI1O5sIA8Cel3mSiV0lEm9WPDsQUClDJj6YY1QodEsq7njqp6//dmUuF1H/Upv74cvlMghi9u8NEbWidGFUDvouKACOtPAY44B6bPrmBwLwXxZwguKwuZ2yL8O8IS5geFwxnl/L7Ndf7S5Xj94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746830781; c=relaxed/simple;
	bh=LmhzGq5CA+i9dw0Q9VRHgaeexbUXN7cdMz8Ehua8V24=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VPY5snmxfGSbsbkw+0pt67Uaezozo727w+5CBtfqqVl3N69h+75vrCx53UmbClQ5z8z3nfN9k7kq+QRE2gcMiy6MKEEYcd5K60Rgy2vYQGMlTvru43bo3EHInLxD/HhpBUYhEDotKDgvuSW3sMTtfCbsk6QXhXNSGMaGhDFsfVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VVJwUiIH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 549CYHpi013361
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 May 2025 22:46:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XmsX3zVPd1MJ+C/O6PKN+I4MPkP+RNbt3dycecHyCTU=; b=VVJwUiIHaWKTi23Z
	FlkN8b+QEkzSnp4Nf0y2v4e6xnmzJjRB3eeDvAvIh0zxNY7CAxC1FJsFd3l3SjHa
	CDEOSAOqZ4GoczhE3dfyILL3sjtSOv4D1ZgIv2MS+ejxBkGffL19m1G4rYRi02dH
	NJo/gzMctJKlKAVhQHzMu+WCnlHxSaIZRDZKM1RCCtNVGKM5NJBCqxKVnc5u2dAf
	02Sp8ct/kxdQIcvWTw9EtDSsSIinz5DI0BB3WfY9lW0ejFubiMMIUxK+DIHxUdad
	cglsclDWTVc4sXojIVetXSxaa+PPKaqnfvb3YPA+68fu0gOWjiPTsEhOh+tgGszx
	ITmDSw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnpmnyk6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 May 2025 22:46:18 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6f543e296e8so6798236d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 May 2025 15:46:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746830777; x=1747435577;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XmsX3zVPd1MJ+C/O6PKN+I4MPkP+RNbt3dycecHyCTU=;
        b=wfazhPbYMqE3eDMqe6jCi/67GlfGbwIt8TcVIsNxTZ+eQcTYjQOH7oRL7a6BELP7gU
         1CZfKweh7HpMS2U22nKBKRcRV3Xi8QgQ1Fq7LbSHCXW2gFenfpgW7c18y/Lp4SOs3ND1
         j2FZCk3u76zuA6wi1xOiOGVuB2JAv9SO2a69K3P2fcxfG1cT0iDDmkDOI36Lr9mfWvBX
         XBsIEjVyS4vGXD4IV+7OlVkVSZAVb3q4tkwN07UwlXu/NCWc1AWloSKkFRzfaq0km3Jh
         6UFGNdoiljai5xPl42Jyi+DIqS/4chQ6oZbNnqvASpFXYgoVadRfm6DAPUHdXwioXfEu
         pUPQ==
X-Forwarded-Encrypted: i=1; AJvYcCVdpkOwbwOudA/z8ggyVs7WDjxYn253OXKbm/esf5bgo+l7nHGfzBL3LSXiDZs/HGk3XKhJIehIHWDNDjIM@vger.kernel.org
X-Gm-Message-State: AOJu0YxJpBECjubtjn5vDiPJU7XRM91lX8mpSikbyoNJFRBPeGIkscGN
	lJQlxKLYsBatdfrJmQ47U0XZGpnibnodGxpzLELQVDc5J/YIsxsra4BJVM5pFcPAN6JTHRmxUqz
	Qp1ENm2yuE0Gs91kPX83zOkAtSiw4Gl01v0oSqT+wPV/K0a8qtCiKNnYYN44ZtqKO
X-Gm-Gg: ASbGncuZ0wYTQ7JmhXABbz+fElRxYfvE7QB3lqsgDdwTFwhOZW9/sCuuXhNPqM8OmIk
	NoCm4xKLE8GIoiYex/H5wWCg6gVclVhmO4OP/tXlAbFMsbniLjVEZwoMja39sM3nC3qhMPlPeTK
	sPVtJKSstWHhlvXZd0Jgd9o+16QeIa+PDT5rThla5qaCPLwrGQ8QI3dbBR9HdM3b363N1AkLy7h
	M/f6OP7sD2m5izpUiOOIq+epGVJ9mQyF+KqDzOHvjA6LOX7smond1bNrqoED2ouAtkKwWiOoA6x
	0X9Iwt3iUo2y6h5WrEyhqK2RSQA3GAW/r1y60SAhNn/w9i2TmZmL278Ng0pw7WNPBSo=
X-Received: by 2002:a05:620a:2628:b0:7c9:2465:8731 with SMTP id af79cd13be357-7cd01042d16mr316449985a.0.1746830777059;
        Fri, 09 May 2025 15:46:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG8mB29rNz9EPmqNSAKWxfwN3Ge2P5PmnwdY5r9Sv1sWFQYXOYKiy7Tvg31K2gb86LZkyrP2g==
X-Received: by 2002:a05:620a:2628:b0:7c9:2465:8731 with SMTP id af79cd13be357-7cd01042d16mr316447585a.0.1746830776665;
        Fri, 09 May 2025 15:46:16 -0700 (PDT)
Received: from [192.168.65.158] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad219345735sm218522166b.64.2025.05.09.15.46.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 May 2025 15:46:16 -0700 (PDT)
Message-ID: <aa864626-3910-403b-a7f6-b3d86b4ed423@oss.qualcomm.com>
Date: Sat, 10 May 2025 00:46:13 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] soc: qcom: socinfo: Add support for new fields in
 revision 21
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250425135946.1087065-1-mukesh.ojha@oss.qualcomm.com>
 <20250425135946.1087065-2-mukesh.ojha@oss.qualcomm.com>
 <mc6n7fbhjhe6cxyoqkxs23kjs7gsa5cihy6qwrcrnz4g3kwjms@vh3vfqzfprw2>
 <aBzPn2OXapJLsikk@hu-mojha-hyd.qualcomm.com>
 <s5fd3txerbwgzzgqnoovkffmijgub5dxfucqqskhdqyjqzkbyl@5cyycrfmubup>
 <aBzgaKSspA0Af0sZ@hu-mojha-hyd.qualcomm.com>
 <03409f08-9612-40be-b8b2-6cebd5acd0a4@oss.qualcomm.com>
 <aB3TkK7wEjdxSSvQ@hu-mojha-hyd.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aB3TkK7wEjdxSSvQ@hu-mojha-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TpjmhCXh c=1 sm=1 tr=0 ts=681e85ba cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=IPssWVxA-tG6VVCJEEYA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: Fd1WG9pE1uS5zonCDTTQspS2No_Jn9Ol
X-Proofpoint-GUID: Fd1WG9pE1uS5zonCDTTQspS2No_Jn9Ol
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDIyOSBTYWx0ZWRfX9O5xSS98MZWL
 H4GpWIaqFWFh6v2fN/GFj6oItXoavYpKaL+Y17rIXJeu9V70EScx1YI2MEtReVpAD8xO2Rrt+g7
 YyPcSFNHfPK+roKlN5bhT0hZgXgDNBVfJRozldEE/WLEyMiFiY3nB09JTodPnVOiAK6ih9wZjU6
 cXK24GWcDY14iut/EWcgcd5OJvRxBM60KHvzIomOrNRlcKdjU2UGLW66EFcW/aBp+7A5tC45oYD
 rHAWZUB9frowoLJImWYyGYs9ktPuWtcCV8cEwgiwTC+MgdX+jECcumFJtezHiR57IbiRcjiWTiY
 hQ5o5TLewg5/Evr7KVFo9df+1BWM9mOqJNSRYHDoOzNx+DejPmZwLXWUnxGKgnqv8UI25Nr6w2R
 eFQzBeQKYm2P6uim8uAnCoUJN/8fc2xBihbCI8sAXzjjiHtI8Gi4xWYJ+CSM3ch9x6ePFRzY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_09,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 adultscore=0 malwarescore=0 mlxlogscore=999 spamscore=0
 impostorscore=0 mlxscore=0 phishscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505090229

On 5/9/25 12:06 PM, Mukesh Ojha wrote:
> On Thu, May 08, 2025 at 08:01:44PM +0200, Konrad Dybcio wrote:
>> On 5/8/25 6:48 PM, Mukesh Ojha wrote:
>>> On Thu, May 08, 2025 at 06:56:47PM +0300, Dmitry Baryshkov wrote:
>>>> On Thu, May 08, 2025 at 09:07:03PM +0530, Mukesh Ojha wrote:
>>>>> On Fri, Apr 25, 2025 at 08:28:51PM +0300, Dmitry Baryshkov wrote:
>>>>>> On Fri, Apr 25, 2025 at 07:29:45PM +0530, Mukesh Ojha wrote:
>>>>>>> Add the subpartfeature offset field to the socinfo structure
>>>>>>> which came for version 21 of socinfo structure.
>>>>>>>
>>>>>>> Subpart_feat_offset is subpart like camera, display, etc.,
>>>>>>> and its internal feature available on a bin.
>>>>>>>
>>>>>>> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
>>>>>>> ---
>>>>>>> Changes in v2:
>>>>>>>  - Added debugfs entry and described more about the field in commit.
>>>>>>>
>>>>>>>  drivers/soc/qcom/socinfo.c       | 6 ++++++
>>>>>>>  include/linux/soc/qcom/socinfo.h | 2 ++
>>>>>>>  2 files changed, 8 insertions(+)
>>>>>>>
>>>>>>> diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
>>>>>>> index 5800ebf9ceea..bac1485f1b27 100644
>>>>>>> --- a/drivers/soc/qcom/socinfo.c
>>>>>>> +++ b/drivers/soc/qcom/socinfo.c
>>>>>>> @@ -154,6 +154,7 @@ struct socinfo_params {
>>>>>>>  	u32 boot_cluster;
>>>>>>>  	u32 boot_core;
>>>>>>>  	u32 raw_package_type;
>>>>>>> +	u32 nsubpart_feat_array_offset;
>>>>>>>  };
>>>>>>>  
>>>>>>>  struct smem_image_version {
>>>>>>> @@ -608,6 +609,11 @@ static void socinfo_debugfs_init(struct qcom_socinfo *qcom_socinfo,
>>>>>>>  			   &qcom_socinfo->info.fmt);
>>>>>>>  
>>>>>>>  	switch (qcom_socinfo->info.fmt) {
>>>>>>> +	case SOCINFO_VERSION(0, 21):
>>>>>>> +		qcom_socinfo->info.nsubpart_feat_array_offset =
>>>>>>> +				   __le32_to_cpu(info->nsubpart_feat_array_offset);
>>>>>>> +		debugfs_create_u32("nsubpart_feat_array_offset", 0444, qcom_socinfo->dbg_root,
>>>>>>> +				   &qcom_socinfo->info.nsubpart_feat_array_offset);
>>>>>>
>>>>>> An offset into what? If this provides additional data, then the data
>>>>>> should be visible in the debugfs. Not sure, what's the point in dumping
>>>>>> the offset here.
>>>>>
>>>>> offset into info(struct socinfo) object.
>>>>>
>>>>> I agree to you and I said the same in first version this is just offset
>>>>> and does not provide any debug info we would look from userspace.  For
>>>>> parity with other fields I did it for all newly added fields.
>>>>> I have dropped it in latest patch.
>>>>
>>>> I'd rather see the decoded structure that is being pointed by this
>>>> offset.
>>>
>>> You mean info + info->nsubpart_feat_array_offset ? 
>>>
>>> There is more to it which I don't want to mention as they are not
>>> upstreamed yet and unrelated to this change.
>>>
>>> data = info + (offset + (part * sizeof(u32)));
>>>
>>> e.g., Here, part is a enum represents camera, display etc., and data
>>> represents their feature presents. Since, part is not upstream yet I
>>> don't feel we should expose this information to debugfs. We could always
>>> add them in debugfs when such things are standardized and upstreamed.
>>
>> That's what Dmitry's saying - just add support for them
> 
> We definitely add support for this in the future.  In the meantime, does
> the absence of the support prevent this socinfo field from being merged?
> Without it, there could be inconsistencies between the boot firmware and
> Linux for the SM8750 platform.

Why delay adding a couple struct definitions into the "future"? I feel
like we spent more time on this thread that describing them would take

Konrad

