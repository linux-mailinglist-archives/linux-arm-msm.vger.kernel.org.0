Return-Path: <linux-arm-msm+bounces-91467-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OAVrOTh7gGnE8wIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91467-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 11:23:52 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D85CAD44
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 11:23:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 91001302C90D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Feb 2026 10:19:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08424357735;
	Mon,  2 Feb 2026 10:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ju9C52UE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="adybnmcX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 949DC2E62DC
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Feb 2026 10:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770027582; cv=none; b=i5RVSLcKnoo/aWhcadp/xn4EYaXHGbmfjg295ab9lB5Fjd5gzfnYF3mNI4MXpXv4Xd38HjFjzbVcMZGQfTBiQSzszg61hJRT3tTtFGvSvD5sKK2LlLMcnqfguABAvFfnYSjqkh0pbaJ32twr0BQdk80pruqI4TMpKsCX12zCjls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770027582; c=relaxed/simple;
	bh=Q5S+eZyNIdwCwug/VWZTnTNBY6H5mYjm23B+aZSiTjo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EjK4CrUjX+sfuDbWdJpRrQZYCYNiMxTt9kQE/wT48E8HTrJNVIoKnOVeek3mb9qcS/9eddDZojZfB16UslnBuSudrJvKTqO9LAMbGVau5n7RquL2qJBYeElFmBpLTpTqSZKlnFUbzs/4sCaX1o/IKe4aqMwuV96pk6nTPWBqk3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ju9C52UE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=adybnmcX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61284vMw570742
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Feb 2026 10:19:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7K8yMMMnoWnA+M65AIQlB2vZJmr3ueYjTb6rPsykpro=; b=Ju9C52UEDu4Z1GA6
	Wqpbdrg4K3F9uEIjjLtEV/JECNNTLGII5DiI/Lys1b4ZMl7I/GHPu96VKbeoQVS1
	2OaWGvx4dxu7E3NpVgcq0fT+fPHBhM/YYlGUF81Zl5EwT6balJj124ouPCnU1tKJ
	i/ZpMAwSu9b3VWyeTGlc656SwayBBdxCD1bfQMffJl3okQxaAX68iTp0P6Pxf6Jq
	OV6Zd+5SMNtku6fvIa8DeMdHWR3N6IFRDUPrM9i4mA+8xYRMo9Rf2dGy1paOXLBF
	TBEYZmm4ue91YUe4SP48y+cKqqP/UCCmbn34Hqnt0IQOlG0aqAI0m1HFrvNFOGqM
	GUhguQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1avx4y7k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 10:19:40 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c533f07450so105327985a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 02:19:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770027580; x=1770632380; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7K8yMMMnoWnA+M65AIQlB2vZJmr3ueYjTb6rPsykpro=;
        b=adybnmcX960dzUtuUl7N90q1Q6vRnkb68c9n5PaHyFwicS55ROdW0ZfiRFetZkUse5
         mdyBOHa6C7+G+04LPeOcjCJCNYKSJQV1VLUc2nuRdSXRcwqoaOKX7AoGJqpus3GS/m8+
         ho22CzJX2fIEj7SagBSa4/MM6TGjs0y2w6Y6q02BBXP2RziYQqtV67Ilim8saG0R3VM5
         gJLk9jgbGUq/Z7OxzCeTUyRy8IaTHWp7yZ/nAlmfUHvEinpgc/KAl88lB7apO4WvEL0v
         09Do/xGR6/g32LO5Ds4YJVUyHJt4SSSXwpDkB9gLajKlQJrLK/UNZqx3AfJQEfHF4ijb
         1nqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770027580; x=1770632380;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7K8yMMMnoWnA+M65AIQlB2vZJmr3ueYjTb6rPsykpro=;
        b=qntHFbo6qI6cFDq4Y3c7CQaNOmdYhXUzY5Tckf+PMxEsE3ha2lDo1bQcsBH2YFbN/z
         ZgvGIEsL8gdhhwSKyYAUoyfu2YX55c9POS72dxrSTQp+5Wcm5o7PXSfSShHf4O2kqOZ3
         YdJh2giXpigde8P2e5QcjgjyxOJwCK6E54eumw2IR5+IeOQpsn3qp5QyNJyMR1xUm6uV
         1j3Atwe4jnp1KTcTSl9ADuf+aU30SprROxG174cUwzwu3WbyzVLKeCGYd/bWZEC3fy8w
         9lDujYWRzwKWgEa4Xd2sVXpN5RfIh1rYZUwTT4yzP3SsJGjmyjLitjjrm2DL9SzPnsLr
         3hbQ==
X-Forwarded-Encrypted: i=1; AJvYcCVSXNfvYFaz5988FQ/npeph9+F82jB22jWYE0VDg0SdEQVvicf70V8VzuFYvdqmJ79gklahgkqzsVDbvw9f@vger.kernel.org
X-Gm-Message-State: AOJu0YxVQ5KZ2Z8OCnOj/tH8cmtHhD8GwU+x4Q1dNFCnfS0lXNLunD0s
	MgEEzfKTGKY+mZZPLCa1LbyTUc5Aq/cLYXlBPXj2Jvsp/ienedIBvol6ojX/n83nqrJ6qX7u8KT
	s8cs8Vcivv8sR0jpeS2ceET9tBJR82dhwVopzNkQZaT6ZEjJ1fLZ6fE58T9emT2RTe4oN
X-Gm-Gg: AZuq6aIAQUBXp9vZmTM8TjbAu3IDsRUmzhiIhaDlyAGIBHyvzED/fOvD1DusIlu1e6N
	HjupxeMvfzNMP0PbjX+Oy345Ku2RPjPiOLQM5MrBAUA7+wx0e0mRozhpIQrTp+mcb88n2yAywbG
	6iZXESoFoNow4FfpQ7HoR+qyZ8UKOC4NmNjrC5Nk/dRd8ln9wROENDOxUT2VnUyNv1sF12u/EY3
	KZq3eb5TPApJL9nIixXVvVpiYMF0+HDvTgYUfHtHG06cTDGOtbyn7o01KO1GJokFyqoZ2uVfcbb
	oVuAaK+WxaAN9vlZ8AfvclOWn/w77Il/AYw9Sj1PliEjoFAXcSxFMWWdGE9rehYgBSAXDwjuFpI
	jgcSSBBQ8J6cGJ/1KSK0VrTPVt0H5SiP3xpcmyRvtBCIhv+JwniY6GRy/HqoNFBdz7Jk=
X-Received: by 2002:a05:620a:40c8:b0:8c6:f997:d6d1 with SMTP id af79cd13be357-8c9eb325aaemr1163988085a.8.1770027579929;
        Mon, 02 Feb 2026 02:19:39 -0800 (PST)
X-Received: by 2002:a05:620a:40c8:b0:8c6:f997:d6d1 with SMTP id af79cd13be357-8c9eb325aaemr1163985385a.8.1770027579526;
        Mon, 02 Feb 2026 02:19:39 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dd99188adsm715942266b.50.2026.02.02.02.19.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 02:19:38 -0800 (PST)
Message-ID: <34fa533c-b9ab-4025-b9ad-4041837e790c@oss.qualcomm.com>
Date: Mon, 2 Feb 2026 11:19:36 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] Input: aw86938 - add driver for Awinic AW86938
To: Luca Weiss <luca.weiss@fairphone.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260128-aw86938-driver-v2-0-b51ee086aaf5@fairphone.com>
 <20260128-aw86938-driver-v2-2-b51ee086aaf5@fairphone.com>
 <aX6whqw7XyaKMd9m@google.com>
 <472d7db3-db34-4966-aa17-588e1153ba12@oss.qualcomm.com>
 <DG4EAYDXMGQS.2MKAJKDFQCFEG@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <DG4EAYDXMGQS.2MKAJKDFQCFEG@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: MP7bgcOLtQTdW9szwOw9GvE_SNxy9044
X-Proofpoint-GUID: MP7bgcOLtQTdW9szwOw9GvE_SNxy9044
X-Authority-Analysis: v=2.4 cv=P4w3RyAu c=1 sm=1 tr=0 ts=69807a3c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=hnEZpkAE9kI51XuuN3kA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDA4NSBTYWx0ZWRfX7I7PwPG6Wn0n
 gtQ393dFr5KJd+tZTOjA2n+eTFjz6l5WfyiucUZW6836CC+m8z5WhNi9SGoDeW2Z9pBHaZ9x8o7
 /ExYsoWFvmis+X3koS0BanSv+Lg/4r/yuR22qdItkgqzb2ZWCBPtqkhx9q+Y9MR6JiT18mBtqPJ
 glNoGQH/A5+Zt1xYObL1mIBnS1EkhlRQlh6kjEyX2nooJdM3FnjHYq2wpYYRKQDyhyKPSnyHMmG
 7Zftyu3pJAIK3xHaqCkiV+wualy4WWjsCQnX89CxsNE8yx8ANq/9+84fELlaGU8Uv6CghMf4T8r
 EFexT60FsZNaaurhYp6MeZLqLyN255sbLwup8jTJqtjSixQnZip7Vc3oDWYkusNVkVKjTIv6hNk
 NIvJRkm5cDudEyXg2Nw5YwD5ZShZUVc3tipyoJRzz2BclNdYStYK/F7ej94QRPTbE8FzGvp+NtI
 EfrIAozUn7LNE5psfgg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_03,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602020085
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91467-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[fairphone.com,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 88D85CAD44
X-Rspamd-Action: no action

On 2/2/26 11:14 AM, Luca Weiss wrote:
> Hi Konrad,
> 
> On Mon Feb 2, 2026 at 11:12 AM CET, Konrad Dybcio wrote:
>> On 2/1/26 2:49 AM, Dmitry Torokhov wrote:
>>> Hi Griffin,
>>>
>>> On Wed, Jan 28, 2026 at 04:51:14PM +0100, Griffin Kroah-Hartman wrote:
>>>> @@ -717,9 +746,19 @@ static int aw86927_detect(struct aw86927_data *haptics)
>>>>  
>>>>  	chip_id = be16_to_cpu(read_buf);
>>>>  
>>>> -	if (chip_id != AW86927_CHIPID) {
>>>> -		dev_err(haptics->dev, "Unexpected CHIPID value 0x%x\n", chip_id);
>>>> -		return -ENODEV;
>>>> +	switch (haptics->model) {
>>>> +	case AW86927:
>>>> +		if (chip_id != AW86927_CHIPID) {
>>>> +			dev_err(haptics->dev, "Unexpected CHIPID value 0x%x\n", chip_id);
>>>> +			return -ENODEV;
>>>> +		}
>>>
>>> If we are able to query chip ID why do we need to have separate
>>> compatibles? I would define chip data structure with differences between
>>> variants and assign and use it instead of having separate compatible.
>>
>> dt-bindings guidelines explicitly call for this, a chipid comparison
>> then works as a safety net
> 
> Are you saying, that
> 
> 1. we should enforce dt-bindings == CHIP_ID (what's currently done)

This

> 
> or
> 
> 2. we should have both compatibles with no handling based on compatible,
>    but only use CHIP_ID at runtime to change behavior

This is spaghetti

Konrad

