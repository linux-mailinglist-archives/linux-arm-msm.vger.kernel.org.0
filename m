Return-Path: <linux-arm-msm+bounces-118165-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id y2d+OiuTUGpn1wIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118165-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 08:37:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 58441737BF1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 08:37:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=c8ReGJRI;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=IWd19biU;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118165-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118165-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 18E7A30221E9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 06:37:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0478B361DD2;
	Fri, 10 Jul 2026 06:37:14 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B62F371D07
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 06:37:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783665433; cv=none; b=GCkLFYPPi1BE2r1D5/K7FFOTPtMorDRlF1dSOgjsHxWZqy/tA8PWwfebyw550l+PfVUChD2bi911Q1a4jTZRLujKy76Zz/3aV0EYgW4u3AxrPplIojDue0H86sS9WDqeXJig+u+/HwEvR+mS/uUzZrSLUK2f+SrVhQfTdCrtDrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783665433; c=relaxed/simple;
	bh=mBSuDQvKojrT0IOU24GSxHqlrGwicSKqabhsxL5NX+c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YC97+/96VkfXwxxrJYa+W5I9axMSoIj14otUVGLh0ZGUpjDT7WnmIcHWguiDKd/VkEGo2p8eiNDSJeMCG0/hhBN0PB6Z8hE/qnpesr44qyMgFDlT9DRPAhKkFvRBYZctqiEl2ZElUrHj+Ndomsc7z2Mn/Bx1N6sOe9tKjj5ggmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c8ReGJRI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IWd19biU; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66A3mu6j3629910
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 06:37:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b0Nr6OZmag1QtQ05vPgvrW7VieRyDOuUjbEvIh1Jvgc=; b=c8ReGJRIJHnOBoCQ
	BUV9qTWqMXZjONBtYJq+NVtWvwKj8WuGG2poB05YKc7+ub7qIQA8XuZafK8Xj9Om
	PT5H7M7URW/PsMtO9CvTx6nhOkekEOv8yR/tD80wg1mcK3uSYKQCdnIyp+uxjq32
	pXa/zjYrKI+rlnIaPJMnfLKGDjQskao76Mt90zRLEVqkaHrR7884VTVmxpmzAmv0
	TJ7EJkmrxFepHi8MwxTm4EXLwbH229chN2Bi3mN239lw3K2p8/GEUjYpqj5aE9c9
	VmpLXeLAs6C21sclCmY9e/firfeJow17BJGJvof1h1tEz47FbC8GY5afsI4WUCBB
	oX45ZQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fahv8j04f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 06:37:11 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c88ad1558f4so1298325a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 23:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783665426; x=1784270226; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b0Nr6OZmag1QtQ05vPgvrW7VieRyDOuUjbEvIh1Jvgc=;
        b=IWd19biU3T+3VucLmqJqwAKYsrrc6Axjy2k35DwL/hOJIvZ2kDIOD/ScC515WU4BuY
         hA4lX+r+uXVunfkFu8wdIPWQ35NQTEaa7XSavx/UPyVUzPRYJAKn9G2gf9JXGvF32vm3
         mcC/3RjLxIfD9lz/eedsgh5mRaB1t4XcHQ+PRdGq4TIAjcChethC+aeMos4gN8x1P16r
         kauX7GaN61leRKhKbXcE316myRRvg4bPo5yd5tBPROI3gp6Qh4PqRZIxLpSK0PaP0/pz
         txVM0MM1HSskAg6yXhjbIQtRDiLPMoX6eDjAms0TxNjhquHfDP0Igpt1ixmRhPq3HN2e
         vwEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783665426; x=1784270226;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b0Nr6OZmag1QtQ05vPgvrW7VieRyDOuUjbEvIh1Jvgc=;
        b=QY6zBL6MpoZZsc6p5pvnmaiU6hvqb2CYQVpBFCfvSM1ACBHq4qiOueRCZgfSzSHDAR
         bhPXPq3V0iZdyrYri4AJ57ly7nb5cz4YUbc0BVZiNoj5T25YzgCfomBWoLFiDgF9kvLq
         eDLMpXCfVPkq38SgOiTCedZoqE6+oBvafEmK1Mc3yHWiQrcrHw+e1BP/GrZR7NolCg2m
         8+dCoBmwoP0MMqdc3e/ZsAkDm2VGD+DXxD6ffmwm2ZFTCHLK3NEAGO2LGg2wyoaD4cre
         QDlyfJceWQt+IQ9sJjyb7AIaANNpfE/vD8W4Nv/ekflgxQROHoR7lZNceQL38bVdvGB8
         H0bw==
X-Forwarded-Encrypted: i=1; AHgh+RoT+eE5s1LX40cICuo3WVUgkDzERLKYiv3VDruIjrKdXnTweP4XAtx2WJTfyOBpzC1+jt9m2STXeH025p8F@vger.kernel.org
X-Gm-Message-State: AOJu0YwMxh6qO9w/dM2q4Y6MYgmvwDuhMPdSqpI7Z39Q0Z3rA0rAGCav
	cfSb+DWXMLAlSbHe4hEbS1lr0T3oVT5RnKqFwvf2aBjKBni4SgeFEWd1poQa1+6duTxxRq3SCnD
	dcucM/exKOQToMD+jwcbvZPjGMpC9hePMPEmsuar7wo+Y8FSBZOEx3XcT0XCS8Ck9MWKT
X-Gm-Gg: AfdE7cnGodD4r3XdHbNZAkfdNRPVU+9NhJk/s79pNBNxgtiYDVelf4Nwzzq/AlQYdT0
	VYbZ26F/Xic1JeNlmrJUmMSLwDIyr1m1NEDIIURjq8iqP3eklWAXl4F0zd7lUcYfHN5Pvx2WvyO
	0erHH50i0KZo6J+hPiLVZohEgAFJe2KBvwcXI7yUDXP67AOmLgIgHZ4MgMWY5MWIMVApLnNBVWP
	I3+TNUu+8H2RFE/gCef2Tk7yMmPt3LzzEI5lQnbj0EFRp9awW4LrgFV8iZqgtkWigI2g/UE1/uj
	KRrD4oskU4n3qsAjQGm7mQCOC77vqWwCC8FMgRAFUMX4K8E+ELyKBDbTHmG47TJU4Ax9JOzYLgf
	pyzDRsaT7RErex9kduDEXFf+RCYsmCavHQ1qS8Uvj
X-Received: by 2002:a17:902:e54e:b0:2c9:e86e:aa0a with SMTP id d9443c01a7336-2ccea274c6amr101741125ad.0.1783665425610;
        Thu, 09 Jul 2026 23:37:05 -0700 (PDT)
X-Received: by 2002:a17:902:e54e:b0:2c9:e86e:aa0a with SMTP id d9443c01a7336-2ccea274c6amr101740955ad.0.1783665425017;
        Thu, 09 Jul 2026 23:37:05 -0700 (PDT)
Received: from [10.217.223.121] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d5bdddsm54257415ad.77.2026.07.09.23.37.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 23:37:04 -0700 (PDT)
Message-ID: <fb1d4954-7c0f-4609-be40-b032876169b8@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 12:07:00 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] tee: qcomtee: Track the object invocation context
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Cc: Basant Kumar <basantk@qti.qualcomm.com>,
        Apurupa Pattapu <apurupa@qti.qualcomm.com>,
        Arun Kumar Neelakantam <aneelaka@qti.qualcomm.com>,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Sumit Garg <sumit.garg@kernel.org>, jenswi@kernel.org
References: <20260707-qcom_uefisecapp_migrate_qcomtee-v1-0-f659cbd5d04c@oss.qualcomm.com>
 <20260707-qcom_uefisecapp_migrate_qcomtee-v1-1-f659cbd5d04c@oss.qualcomm.com>
 <b7c8b25b-374f-40a4-9c6d-bb20ee0cb5c9@oss.qualcomm.com>
Content-Language: en-US
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
In-Reply-To: <b7c8b25b-374f-40a4-9c6d-bb20ee0cb5c9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: jHNLuLmJcrReCIqoIxbC-4r8v5PPACIh
X-Proofpoint-ORIG-GUID: jHNLuLmJcrReCIqoIxbC-4r8v5PPACIh
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDA2MSBTYWx0ZWRfXxXMei4N51UzZ
 IzHX+O++pqlMpYbwHT53CwbtEoedj3ppLcPnyLcGH2XH3r7fmVJMoRwgUfMekkgWXbUBLsGyCCh
 AOenhv2I5u83DFv3ayyJc2Vkk5K1ZJs=
X-Authority-Analysis: v=2.4 cv=funsol4f c=1 sm=1 tr=0 ts=6a509317 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=-b72njiGIdzoQt0YrOEA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDA2MSBTYWx0ZWRfX2LDLQV/RhR0Q
 04PQMM2hWt+zxWBGexJTdxATnsy9pqzDyGBH+vVL8WkLkJO/JRSzRTMXOHxHIcsHdskWtNT/FYi
 QdkJ9M5xtAPbF+NO04CSG2A3BatIVqQ8JwtBZc4fizZDV2yRPlIiyxuXzp8ntPhnGk1jIbxj7pq
 CXtqPXP9m9J4koQfeh4v/J9PhzVOngIdjRqqCC00bpE6Sj6Qh/mN6Y+m8W6rMeHce8EXMSk7xk5
 IgS8D+l4miHbQmNv+zsRh1xKzJf7FF2ENM2+YpisRUokw/XHPXxoPl1U7rewwKtcIpR84GvGw7u
 QY8egPI2dIaDn8Ejs7trAN4WJpJsH1m4H3fNc9qnsxHQLFzGc5aaN2ojgPBmE26LxD2Yucg6cOk
 KKjNNv7tnaRpveSdS/B93bZmviYsggM/FeVenZ44E7LaCnekTcWuwqQd3jrrGHM+G59zE25g7nj
 slY2mQ+TbVaC2GNznaw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_01,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100061
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-118165-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[harshal.dev@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:amirreza.zarrabi@oss.qualcomm.com,m:basantk@qti.qualcomm.com,m:apurupa@qti.qualcomm.com,m:aneelaka@qti.qualcomm.com,m:op-tee@lists.trustedfirmware.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:konradybcio@kernel.org,m:andersson@kernel.org,m:sumit.garg@kernel.org,m:jenswi@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,arg.id:url,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[harshal.dev@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 58441737BF1

Hi Amir,

On 7/8/2026 11:31 AM, Amirreza Zarrabi wrote:
> Hi Harshal,
> 
> On 7/7/2026 4:11 PM, Harshal Dev wrote:
>> QCOMTEE needs to distinguish between object invocations arriving from
>> kernel clients and user-space clients in order to correctly marshal
>> UBUF parameters and decide whether certain operations should be permitted.
>>
>> Add a kernel_ctx flag to struct qcomtee_object_invoke_context to track
>> the context of object invocation. Objects invoked from the kernel-space
>> are expected to have the MSB of their 64-bit object-id set to indicate a
>> kernel context, whereas objects invoked from user-space should not set it.
>> To ensure this, we restrict the object-id space of user-space invoked
>> objects to 32-bits. This is in-line with QTEE expectation of 32-bit object
>> ids.
>>
>> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
>> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
>> ---
>>  drivers/tee/qcomtee/call.c           | 24 ++++++++++++++++++++++--
>>  drivers/tee/qcomtee/qcomtee.h        |  6 ++++++
>>  drivers/tee/qcomtee/qcomtee_object.h |  8 ++++++--
>>  drivers/tee/tee_core.c               |  4 ++++
>>  4 files changed, 38 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/tee/qcomtee/call.c b/drivers/tee/qcomtee/call.c
>> index 0efc5646242a..a74a54d67b06 100644
>> --- a/drivers/tee/qcomtee/call.c
>> +++ b/drivers/tee/qcomtee/call.c
>> @@ -397,11 +397,31 @@ static int qcomtee_object_invoke(struct tee_context *ctx,
>>  {
>>  	struct qcomtee_context_data *ctxdata = ctx->data;
>>  	struct qcomtee_object *object;
>> +	bool kernel_ctx = false;
>>  	int i, ret, result;
>>  
>>  	if (qcomtee_params_check(params, arg->num_params))
>>  		return -EINVAL;
>>  
>> +	/* Obtain the invocation context information from the MSB of the object
>> +	 * `id` field.
>> +	 */
>> +	kernel_ctx = QCOMTEE_GET_CLIENT_CTX(arg->id);
>> +	/* User-space identifies a NULL object via a 32-bit TEE_OBJREF_NULL id, whereas
>> +	 * the kernel uses as 64-bit object-id. Hence, we check for a NULL object by
>> +	 * sign-extending the object-id to 64 bits. If user-space is indeed invoking a
>> +	 * NULL object we must extend the object-id to 64-bits from here on so that
>> +	 * QCOMTEE can recognize it.
>> +	 */
>> +	if (!kernel_ctx && ((s64)(s32)arg->id) == TEE_OBJREF_NULL)
>> +		arg->id = TEE_OBJREF_NULL;
> 
> Does it need to be MSB -- why bit 63? the object ID supported by QTEE is 32-bit anyway.
> Let's mask the upper 32-bit and do something like kernel_ctx = !!upper_32_bits(id).
> What do you think?

I agree. Instead of checking for kernel-ctx by right shifting, I can use this approach.
QTEE objects invoked from user-space (including NULL object) will always have their
object-id constrained to lower 32 bits anyway as per PR: https://github.com/quic/quic-teec/pull/27

And for kernel-space invoked QTEE objects, upper 32-bits would be set for NULL object,
and 63rd bit expected to be set as well.

> 
>> +
>> +	/* If the object being invoked is not NULL, drop the MSB from the `id` field to
>> +	 * obtain the actual object-id.
>> +	 */
>> +	if (arg->id != TEE_OBJREF_NULL)
>> +		arg->id = QCOMTEE_SANITIZE_OBJ_ID(arg->id);
>> +
>>  	/* First, handle reserved operations: */
>>  	if (arg->op == QCOMTEE_MSG_OBJECT_OP_RELEASE) {
>>  		del_qtee_object(arg->id, ctxdata);
>> @@ -411,7 +431,7 @@ static int qcomtee_object_invoke(struct tee_context *ctx,
>>  
>>  	/* Otherwise, invoke a QTEE object: */
>>  	struct qcomtee_object_invoke_ctx *oic __free(kfree) =
>> -		qcomtee_object_invoke_ctx_alloc(ctx);
>> +		qcomtee_object_invoke_ctx_alloc(ctx, kernel_ctx);
>>  	if (!oic)
>>  		return -ENOMEM;
>>  
>> @@ -648,7 +668,7 @@ static void qcomtee_get_qtee_feature_list(struct tee_context *ctx, u32 id,
>>  	int result;
>>  
>>  	struct qcomtee_object_invoke_ctx *oic __free(kfree) =
>> -		qcomtee_object_invoke_ctx_alloc(ctx);
>> +		qcomtee_object_invoke_ctx_alloc(ctx, true);
>>  	if (!oic)
>>  		return;
>>  
>> diff --git a/drivers/tee/qcomtee/qcomtee.h b/drivers/tee/qcomtee/qcomtee.h
>> index f39bf63fd1c2..5d292a2ff83d 100644
>> --- a/drivers/tee/qcomtee/qcomtee.h
>> +++ b/drivers/tee/qcomtee/qcomtee.h
>> @@ -17,6 +17,12 @@
>>  #define QCOMTEE_OBJREF_FLAG_USER	BIT(1)
>>  #define QCOMTEE_OBJREF_FLAG_MEM		BIT(2)
>>  
>> +/* The MSB of the object_id field indicates whether the client is invoking the
>> + * object from user context or kernel context.
>> + */
>> +#define QCOMTEE_GET_CLIENT_CTX(x) (((x) >> 63) & 1U)
>> +#define QCOMTEE_SANITIZE_OBJ_ID(x) ((x) & (BIT(63) - 1))
>> +
>>  /**
>>   * struct qcomtee - Main service struct.
>>   * @teedev: client device.
>> diff --git a/drivers/tee/qcomtee/qcomtee_object.h b/drivers/tee/qcomtee/qcomtee_object.h
>> index 8b4401ecad48..2528d07e4576 100644
>> --- a/drivers/tee/qcomtee/qcomtee_object.h
>> +++ b/drivers/tee/qcomtee/qcomtee_object.h
>> @@ -146,6 +146,7 @@ static inline int qcomtee_args_len(struct qcomtee_arg *args)
>>   * struct qcomtee_object_invoke_ctx - QTEE context for object invocation.
>>   * @ctx: TEE context for this invocation.
>>   * @flags: flags for the invocation context.
>> + * @kernel_ctx: flag that indicates this context is owned by a kernel client.
>>   * @errno: error code for the invocation.
>>   * @object: current object invoked in this callback context.
>>   * @u: array of arguments for the current invocation (+1 for ending arg).
>> @@ -158,6 +159,7 @@ static inline int qcomtee_args_len(struct qcomtee_arg *args)
>>  struct qcomtee_object_invoke_ctx {
>>  	struct tee_context *ctx;
>>  	unsigned long flags;
>> +	bool kernel_ctx;
>>  	int errno;
>>  
>>  	struct qcomtee_object *object;
>> @@ -172,13 +174,15 @@ struct qcomtee_object_invoke_ctx {
>>  };
>>  
>>  static inline struct qcomtee_object_invoke_ctx *
>> -qcomtee_object_invoke_ctx_alloc(struct tee_context *ctx)
>> +qcomtee_object_invoke_ctx_alloc(struct tee_context *ctx, bool kernel_ctx)
>>  {
>>  	struct qcomtee_object_invoke_ctx *oic;
>>  
>>  	oic = kzalloc_obj(*oic);
>> -	if (oic)
>> +	if (oic) {
>>  		oic->ctx = ctx;
>> +		oic->kernel_ctx = kernel_ctx;
>> +	}
>>  	return oic;
>>  }
>>  
>> diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
>> index ef9642d72672..7f986d7fb47f 100644
>> --- a/drivers/tee/tee_core.c
>> +++ b/drivers/tee/tee_core.c
>> @@ -706,6 +706,10 @@ static int tee_ioctl_object_invoke(struct tee_context *ctx,
>>  			goto out;
>>  	}
>>  
>> +	/* Userspace object-ids are restricted to 32-bits. */
>> +	if (arg.id > U32_MAX)
>> +		return -EINVAL;
>> +
> 
> This change belongs to tee SS, move it to a separate commit with appropriate message.

Ack.

Regards,
Harshal
> 
>>  	rc = ctx->teedev->desc->ops->object_invoke_func(ctx, &arg, params);
>>  	if (rc)
>>  		goto out;
>>
> 
> Regards,
> Amir
> 


