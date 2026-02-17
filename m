Return-Path: <linux-arm-msm+bounces-93042-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uB21C6jvk2m+9wEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93042-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 05:33:44 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F172148B7B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 05:33:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7E5B03015D33
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 04:33:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 328CA231A3B;
	Tue, 17 Feb 2026 04:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JOgFY/p8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MoqOkPby"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4EC817A305
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 04:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771302817; cv=none; b=l14w50jf6RN0apuI7Q5mFxbBkljSlgld8mRhW7N0BRX2QSt1WjZylZjAorJG0TFeoEoHSAx371gsV+qJOQ+BQzkn63aKa7NDePZSZrQoGTM+sz2WKr79L8l5rfTxXEedxNAYrAwJMkyX0P8gvlN48P+Go94MnCayEpLZ38DPNWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771302817; c=relaxed/simple;
	bh=18dga5OqOEFmpNY+7n54qdi0T3IRzNQI58V35OKMeuA=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=UvpnofPe3buPQS9HnodXvwNQrIgJsmG2J9FttwwCt8rWkopNGS2svrnzcMtPsh40bYjjZTQn1q9LITzitjiIDfTuvxJvhtcRKlN08lbVCffAgoxtixxTEQQgonl0JJ1wO14kDuIKsz244813c0bgY7w9x7nxpx5VpS33TD4nKt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JOgFY/p8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MoqOkPby; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61H0SQ1K1813118
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 04:33:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mb6EumR0MQZS2O5/+j8oX/CYxuAHqFL1AK4kps7fVGo=; b=JOgFY/p80f3BgEr5
	0shp31xqG0+ArMeanwYI5v8veQBXVTc/qNoILSCM/pMdTyJtOsLX0Ck/sQ8/kvHh
	x6NhXKb619SkuKZ+QqBX3h3b5y41TN2jybPCesBcVHhjOe3QxOsr5fBsgCmSE+8n
	BvOqPFo9fMEjULvd6LgQHiv6txTNT8jCjZdlzZu7H+bHaRJTAZS1DLAGrTIh547T
	L8Bpw5JgaohLJ4kKu6twhzp2RMw8VyxSAr//jmKEWJprqWXEyPW4j/rOV87UmILE
	JvyDtMHYTAsX7zfckc8nE7Wiv7Rifo2QAV4/qmShmfIXIPLC7lnR/p9LITsAYXwg
	k/dGOg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cbnv9ka8p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 04:33:33 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-824af3c6c0cso1851553b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 20:33:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771302812; x=1771907612; darn=vger.kernel.org;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mb6EumR0MQZS2O5/+j8oX/CYxuAHqFL1AK4kps7fVGo=;
        b=MoqOkPby3TwZ5U3Tp9P5Nlr2acRbbNrSmdXUo3jdSrenvdrb3RYD/uYbhVkKlG/LI9
         7AxTN2YgLCCxiN1vGADbEtqr+Bnb1pf8KJtMqP1YqmAiveUxkgxDmHBdcQ9/OxiNdP4M
         IggCnJ0jeXo/MABMw1z3qqL/SINP8SHQVh0WAPAo+1wrM9z8fC7o0/ecw1D3LP5xLD+v
         /nQPgxyiO6k1D3sygO6Kh9Lg32/iTdpbpWqic5d16OtckVMb/y5V41cm1Zq5v1qEzsgn
         de841LHM1eNNNmDM5R1hbszrW58fko0sp8MTyWngdrx48vJwcoI30SamX+sORm1Di1Td
         grJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771302812; x=1771907612;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mb6EumR0MQZS2O5/+j8oX/CYxuAHqFL1AK4kps7fVGo=;
        b=MKb4HywaYEtJIqF+Zj2yBbaXHGRijNaOlZ9yLrU29O0baPM9xnYUxptA9Y2JbbXUOP
         rbjW8wdVPPi8FAswzmjHmAu3ZL8e6OShRnEImtPmJoRvQrZbKgP4gy8oBMm6geYtcTlg
         iD8H/yl924O6+nVhxBMg9eTkj+uyJXfP+JjiiSVUtQiYKtcT8r5J9S+lcQ2bv4wTzgHg
         0oFNprCjUxTtsbUjvTKwto46/D708RUus05qmR0OavSWfxIcf7Rgp53JyozSO2ToltRR
         qDnyRWU/pQY3yz1Hziu7RTJ4PSkq74g9noY58hY3tg092GsS+MehE4+WqOTpgB1mFMwW
         IxyA==
X-Forwarded-Encrypted: i=1; AJvYcCVFdtfLNBa5XpW66iQRflIzwUG6A8KCx+0bHQfHg6WTIZmmcMODvnXjAXiqMMGTBY+neQ+YoyqLwRo3Z0uI@vger.kernel.org
X-Gm-Message-State: AOJu0YwhobYVhFkdxuVPKzLoovGVzBS784VLx4ObFExmp+DqWw8MxJI6
	RcfxZjr/Nw8zBZnqBKhxh7lH49G5ClML8SRTgR7R5RKpA7zK6szI2dIMw0ICbiXnZNsMt5g1jXM
	+YnAeRWRoftG7j6P9KVLu8NVeSQH9gR93G+rztYJAK2SVQ6Rklfge3Azz6L9hVXKmOoQu
X-Gm-Gg: AZuq6aICZedaIipbrDzWrmTV+esFVw4mG1BTsnWouKKxWsGi8QyVg2K/w6l64E6RKEy
	2vzLVrhy7OV+AqmSqgurl78klf4iYA2A1yi5i0R7LRwPE9rrPsP5qLs7BDd/3RVc2Eohwv7xXtA
	x4dmIWNANtEYC4SdOfYfAFBRWaRZmeOc1D17VcVxiVDmZg/blPZB6MNyS5bOygg91J0kHHhmQib
	zGCSGuYPurqW6jIjFTkmqm95BX6tondrxKWnTFSXOAbog5XTuCQnfJXYecRok3zwsuzA4xeJ3KO
	C5xkEcO8ERyPC8pvU+M2rUmNoqA+O4FL9hEdVGXdEgm4mpjcij7qQ/apGyxggxbt4SXjBQHus7c
	IYjMyWFLP+7C9VH2RhLLjjCm6nqRhtH1iQa1Z28L0MU2eWm/bMQ==
X-Received: by 2002:a05:6a00:408e:b0:824:9eaf:54ea with SMTP id d2e1a72fcca58-824c9547736mr11035790b3a.28.1771302812370;
        Mon, 16 Feb 2026 20:33:32 -0800 (PST)
X-Received: by 2002:a05:6a00:408e:b0:824:9eaf:54ea with SMTP id d2e1a72fcca58-824c9547736mr11035774b3a.28.1771302811767;
        Mon, 16 Feb 2026 20:33:31 -0800 (PST)
Received: from [10.217.222.63] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-824c6a431fesm12433232b3a.20.2026.02.16.20.33.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Feb 2026 20:33:31 -0800 (PST)
Subject: Re: [PATCH] soc: qcom: ice: Remove platform_driver support and expose
 as a pure library
To: Manivannan Sadhasivam <mani@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
References: <20260203080712.15480-1-manivannan.sadhasivam@oss.qualcomm.com>
 <spejairpdsb5sa3jwuogkl3edkglqoxa4eqz6zriq5w53ic4a6@4gyymeidqy5d>
From: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
Message-ID: <14de409a-d6b4-7c17-d04c-7d26f16469e5@oss.qualcomm.com>
Date: Tue, 17 Feb 2026 10:03:27 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <spejairpdsb5sa3jwuogkl3edkglqoxa4eqz6zriq5w53ic4a6@4gyymeidqy5d>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: kLJ0GpA50vBwdlrzT8h-2NLh_PwvqobB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDAzNCBTYWx0ZWRfX1mKYIK5Mql/z
 k7s8tMRKTghk+arcRuQSQdlyH82ds70FC2x8HBbv53DorPxMR9x9grsBC3jcCWzJs5aqGvMxg3t
 3sPLJajsjw+VRKluDn8XaCIjYoXS1hDSnxHknI39pRqmvNKj1SSKvaC8Sqh+88UHMbuL8OY/Jny
 6jBHfZJhK28NdoIW1yt/w0Mu1yX84hMFkg/+Tko7XbngSFqo2W4ym+4EHsH89R4Dwhrq7nIhyzE
 DjoZAeUnZvEl2hE42npjO1gGvH//zjaaUdAvzfUIcMNpN2Z2+RC6z7L5A1jXv0QbM5GTshmNIfC
 f/XIZKeEk1Nqto11yYLzDgPyaU5XmgAD79NFA2z9AMLkJD57OTrkQRENlH1dqh1jr0TKSiaz51p
 w8CzZXq16Uy/xW01MOFmIvn0dvTkt4sNIfhMmD7ZRledD7LDjoqHf+/cdDdmM9nyFmA152xvel6
 avTyrLVYtKapbOPDd2Q==
X-Authority-Analysis: v=2.4 cv=b7K/I9Gx c=1 sm=1 tr=0 ts=6993ef9d cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pDHAZYaeEG5CUg_tMIYA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: kLJ0GpA50vBwdlrzT8h-2NLh_PwvqobB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-16_08,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 phishscore=0 spamscore=0 clxscore=1011 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170034
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-93042-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neeraj.soni@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9F172148B7B
X-Rspamd-Action: no action



On 2/3/2026 1:40 PM, Manivannan Sadhasivam wrote:
> On Tue, Feb 03, 2026 at 01:37:12PM +0530, Manivannan Sadhasivam wrote:
>> The current platform driver design causes probe ordering races with clients
>> (UFS, eMMC) due to ICE's dependency on SCM firmware calls. If ICE probe
>> fails (missing ICE SCM or DT registers), devm_of_qcom_ice_get() loops with
>> -EPROBE_DEFER, leaving clients non-functional even when ICE should be
>> gracefully disabled. devm_of_qcom_ice_get() cannot know if the ICE driver
>> probe has failed due to above reasons or it is waiting for the SCM driver.
>>
>> Moreover, there is no devlink dependency between ICE and client drivers
>> as 'qcom,ice' is not considered as a DT 'supplier'. So the client drivers
>> have no idea of when the ICE driver is going to probe.
>>
>> To avoid all this hassle, remove the platform driver support altogether and
>> just expose the ICE driver as a pure library to client drivers. With this
>> design, when devm_of_qcom_ice_get() is called, it will check if the ICE
>> instance is available or not. If not, it will create one based on the ICE
>> DT node, increase the refcount and return the handle. When the next client
>> calls the API again, the ICE instance would be available. So this function
>> will just increment the refcount and return the instance.
>>
>> Finally, when the client devices get destroyed, refcount will be
>> decremented and finally the cleanup will happen once all clients are
>> destroyed.
>>
>> For the clients using the old DT binding of providing the separate 'ice'
>> register range in their node, this change has no impact.
>>
>> Cc: stable@vger.kernel.org
>> Cc: Abel Vesa <abel.vesa@oss.qualcomm.com>
>> Reported-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
>> Fixes: 2afbf43a4aec ("soc: qcom: Make the Qualcomm UFS/SDCC ICE a dedicated driver")
>> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
>> ---
>>  drivers/soc/qcom/ice.c | 100 ++++++++++++++++-------------------------
>>  1 file changed, 39 insertions(+), 61 deletions(-)
>>
>> diff --git a/drivers/soc/qcom/ice.c b/drivers/soc/qcom/ice.c
>> index b203bc685cad..b5a9cf8de6e4 100644
>> --- a/drivers/soc/qcom/ice.c
>> +++ b/drivers/soc/qcom/ice.c
>> @@ -107,12 +107,16 @@ struct qcom_ice {
>>  	struct device *dev;
>>  	void __iomem *base;
>>  
>> +	struct kref refcount;
>>  	struct clk *core_clk;
>>  	bool use_hwkm;
>>  	bool hwkm_init_complete;
>>  	u8 hwkm_version;
>>  };
>>  
>> +static DEFINE_MUTEX(ice_mutex);
>> +struct qcom_ice *ice_handle;
>> +
>>  static bool qcom_ice_check_supported(struct qcom_ice *ice)
>>  {
>>  	u32 regval = qcom_ice_readl(ice, QCOM_ICE_REG_VERSION);
>> @@ -599,8 +603,8 @@ static struct qcom_ice *qcom_ice_create(struct device *dev,
>>   * This function will provide an ICE instance either by creating one for the
>>   * consumer device if its DT node provides the 'ice' reg range and the 'ice'
>>   * clock (for legacy DT style). On the other hand, if consumer provides a
>> - * phandle via 'qcom,ice' property to an ICE DT, the ICE instance will already
>> - * be created and so this function will return that instead.
>> + * phandle via 'qcom,ice' property to an ICE DT node, then the ICE instance will
>> + * be created if not already done and will be returned.
>>   *
>>   * Return: ICE pointer on success, NULL if there is no ICE data provided by the
>>   * consumer or ERR_PTR() on error.
>> @@ -611,11 +615,12 @@ static struct qcom_ice *of_qcom_ice_get(struct device *dev)
>>  	struct qcom_ice *ice;
>>  	struct resource *res;
>>  	void __iomem *base;
>> -	struct device_link *link;
>>  
>>  	if (!dev || !dev->of_node)
>>  		return ERR_PTR(-ENODEV);
>>  
>> +	guard(mutex)(&ice_mutex);
>> +
>>  	/*
>>  	 * In order to support legacy style devicetree bindings, we need
>>  	 * to create the ICE instance using the consumer device and the reg
>> @@ -631,6 +636,16 @@ static struct qcom_ice *of_qcom_ice_get(struct device *dev)
>>  		return qcom_ice_create(&pdev->dev, base);
>>  	}
>>  
>> +	/*
>> +	 * If the ICE node has been initialized already, just increase the
>> +	 * refcount and return the handle.
>> +	 */
>> +	if (ice_handle) {
>> +		kref_get(&ice_handle->refcount);
>> +
>> +		return ice_handle;

How will this work for a device using both UFS and eMMC storage (one being primary storage
and other being secondary)? UFS and eMMC will have seperate ICE DT node so returning same
handle to both clients will not be correct.

>> +	}
>> +
>>  	/*
>>  	 * If the consumer node does not provider an 'ice' reg range
>>  	 * (legacy DT binding), then it must at least provide a phandle
>> @@ -643,41 +658,43 @@ static struct qcom_ice *of_qcom_ice_get(struct device *dev)
>>  
>>  	pdev = of_find_device_by_node(node);
>>  	if (!pdev) {
>> -		dev_err(dev, "Cannot find device node %s\n", node->name);
>> +		dev_err(dev, "Cannot find ICE platform device\n");
>> +		platform_device_put(pdev);
> 
> This somehow slipped in...
> 
> - Mani
> 
>>  		return ERR_PTR(-EPROBE_DEFER);
>>  	}
>>  
>> -	ice = platform_get_drvdata(pdev);
>> -	if (!ice) {
>> -		dev_err(dev, "Cannot get ice instance from %s\n",
>> -			dev_name(&pdev->dev));
>> +	base = devm_platform_ioremap_resource(pdev, 0);
>> +	if (IS_ERR(base)) {
>> +		dev_warn(&pdev->dev, "ICE registers not found\n");
>>  		platform_device_put(pdev);
>> -		return ERR_PTR(-EPROBE_DEFER);
>> +		return base;
>>  	}
>>  
>> -	link = device_link_add(dev, &pdev->dev, DL_FLAG_AUTOREMOVE_SUPPLIER);
>> -	if (!link) {
>> -		dev_err(&pdev->dev,
>> -			"Failed to create device link to consumer %s\n",
>> -			dev_name(dev));
>> +	ice = qcom_ice_create(&pdev->dev, base);
>> +	if (IS_ERR(ice)) {
>>  		platform_device_put(pdev);
>> -		ice = ERR_PTR(-EINVAL);
>> +		return ice_handle;
>>  	}
>>  
>> -	return ice;
>> +	ice_handle = ice;
>> +	kref_init(&ice_handle->refcount);
>> +
>> +	return ice_handle;
>>  }
>>  
>> -static void qcom_ice_put(const struct qcom_ice *ice)
>> +static void qcom_ice_put(struct kref *kref)
>>  {
>> -	struct platform_device *pdev = to_platform_device(ice->dev);
>> -
>> -	if (!platform_get_resource_byname(pdev, IORESOURCE_MEM, "ice"))
>> -		platform_device_put(pdev);
>> +	platform_device_put(to_platform_device(ice_handle->dev));
>> +	ice_handle = NULL;
>>  }
>>  
>>  static void devm_of_qcom_ice_put(struct device *dev, void *res)
>>  {
>> -	qcom_ice_put(*(struct qcom_ice **)res);
>> +	const struct qcom_ice *ice = *(struct qcom_ice **)res;
>> +	struct platform_device *pdev = to_platform_device(ice->dev);
>> +
>> +	if (!platform_get_resource_byname(pdev, IORESOURCE_MEM, "ice"))
>> +		kref_put(&ice_handle->refcount, qcom_ice_put);
>>  }
>>  
>>  /**
>> @@ -713,42 +730,3 @@ struct qcom_ice *devm_of_qcom_ice_get(struct device *dev)
>>  	return ice;
>>  }
>>  EXPORT_SYMBOL_GPL(devm_of_qcom_ice_get);
>> -
>> -static int qcom_ice_probe(struct platform_device *pdev)
>> -{
>> -	struct qcom_ice *engine;
>> -	void __iomem *base;
>> -
>> -	base = devm_platform_ioremap_resource(pdev, 0);
>> -	if (IS_ERR(base)) {
>> -		dev_warn(&pdev->dev, "ICE registers not found\n");
>> -		return PTR_ERR(base);
>> -	}
>> -
>> -	engine = qcom_ice_create(&pdev->dev, base);
>> -	if (IS_ERR(engine))
>> -		return PTR_ERR(engine);
>> -
>> -	platform_set_drvdata(pdev, engine);
>> -
>> -	return 0;
>> -}
>> -
>> -static const struct of_device_id qcom_ice_of_match_table[] = {
>> -	{ .compatible = "qcom,inline-crypto-engine" },
>> -	{ },
>> -};
>> -MODULE_DEVICE_TABLE(of, qcom_ice_of_match_table);
>> -
>> -static struct platform_driver qcom_ice_driver = {
>> -	.probe	= qcom_ice_probe,
>> -	.driver = {
>> -		.name = "qcom-ice",
>> -		.of_match_table = qcom_ice_of_match_table,
>> -	},
>> -};
>> -
>> -module_platform_driver(qcom_ice_driver);
>> -
>> -MODULE_DESCRIPTION("Qualcomm Inline Crypto Engine driver");
>> -MODULE_LICENSE("GPL");
>> -- 
>> 2.51.0
>>
> 
Regards
Neeraj

