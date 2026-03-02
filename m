Return-Path: <linux-arm-msm+bounces-94791-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qDiuNClHpWkg7AUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94791-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 09:15:37 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F541D484A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 09:15:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2895E300A312
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 08:15:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98B7F3876DA;
	Mon,  2 Mar 2026 08:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ipmP+1UO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UJ/pzdb6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23CE8383C6F
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Mar 2026 08:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772439324; cv=none; b=uZX8js+7z4IJPDJsdXB7coC3NqVC2m4L5QMnniYQA1H/9RoqhjHD6aR+tk7P/DvITnE2uogGGVJBWWFSu8St8Y6lzamdW6jlv47JkmP3PYK51RFpnh0WaUhjILk4eejWSehCb593tpXne+MfnD/HceA8OpuozEuVvVSDGVO8S3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772439324; c=relaxed/simple;
	bh=z/OjeLU/BgW56NOv04DU8XYhWIRJ/b3uSHrxF7ye9+U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RXxYfIvAw8goMNdsIVyhl92AYtZHMjLLliybJxD2mrDshm4URccw0wOddZLqL2f7i47rPcGYDy56mTIySRwTFpo+icTnE4JKvu8QrZDqvWfIa+hreb7l3XszdtkeDhjAc1hnnR6r5xtJGOg7Kdyw8kKpyw62G6na2s5sxhcZB74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ipmP+1UO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UJ/pzdb6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6225YYgW1021251
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Mar 2026 08:15:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1nxlvKtWHlixlnWM7lk5L+nk5CDxPToMPWa0ATJIt+U=; b=ipmP+1UOIkbkHrz5
	4Zh5zcejX0AEK4qWy0UQjcCFbrK7VJKAgWA2ZJ+yrMI1JZRb+MYGUxihgsBrJdvu
	dvEsH9Lyyh56EIP2l2/7mw5OHLnTHNZqC10WkhgzC74NlRMcT0BEoBinGtL5Dj9H
	eGrnwxMXT/K9CL7f6sG8CgdUghPuGyzXdkJMoFw04R/N2URMbdxQtDe9in8qrJ51
	tbqk52bdQkuOU+H9AxehKcQ/pjSxjsfc1xNC/DvenXdB2VqfLs3YaYnqy5eG5C/u
	wenPMG+sP7wp9rocb3lxPS5efhm3jHsVbc3cG9Lrok2jOZnioUctBTMXKlsf5411
	Q9pBtw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cksgrvq57-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 08:15:19 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3598518beceso1180864a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 00:15:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772439319; x=1773044119; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1nxlvKtWHlixlnWM7lk5L+nk5CDxPToMPWa0ATJIt+U=;
        b=UJ/pzdb6q8SILS0IEfKyfb9HDtcKda3+8KCiF1wYY+FX/LBmU0USoQg50iwmrKPmKH
         tiaZUrBGy/0ywsUdXlbONs+R2VdxA/yiS1k+tR3NsikT6MO0cNPzUOLTbNGrQS+zZEhY
         bXbNoZVqcac0rmTlnWD2hYFgUV3yHOWlVbxEysA7gCXJPACRHMAbj705J95RgapAKMjb
         jtzSC/qhTd5u7ODCn2QqeFORBspN/ZuOtOQlG0KLs974tMVBf4d/NECopDJAxg/zUmIi
         7E7xtrs+JvGdIyrX1n7uEm54Ki8PiNURwgVI3UxscRGqRUxnlFRrv/qF3mtqfakj7a9k
         RDsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772439319; x=1773044119;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1nxlvKtWHlixlnWM7lk5L+nk5CDxPToMPWa0ATJIt+U=;
        b=XmvMmejSEYvRyDbwnZKXCeHpfGpj7hA0idLLPPtwdQ9i3nJC8aqRRfemeMe9M/zEpd
         vOTHoNQwCyHAE9BpB/MQF5k0hnslXMtRGA/MgOXpLyWpx/3kQhXfAHJJrob+zNXjgwcU
         xh4ElhmQwqdUx5nWiZLCFEndgcNxFXiidIWkjYPpMKm0BUCjYd6VQAgdu7WyvU9mqfTI
         bDI6VEXJyMnZEnQqlEtjL44nMrAdSv5EbdI/afqzzG8bZtyZLDjz4izliGT/4jACJhvU
         99wQVbr/E1Nyb24KAdY5/bO7gaVWgvh9RU3vHIrg2HVKH7Vuet4Eie6EqexMSagckz6X
         8ZDw==
X-Forwarded-Encrypted: i=1; AJvYcCW1ZnRlCn5AUPUNHS9BtKchKt4oW3DGY6gdb2OqKjnh4iHyX+gr34+wXo2B0M4FV/kbXSQ6DrIxvGB1suzs@vger.kernel.org
X-Gm-Message-State: AOJu0YyUaoMloq/TVlnXvxfUAOxDcmrXhSPhg0vnsTMeRK5pRuP3XfTf
	nkU6iin5G5p92UmcezthFxEu6VhnsWEG8GAs2DnOaw4pMLqFt0uzQ635piHfOf+VK4jjs+lbIx5
	REhOeCG6GCW4YX0w6zz0T6Wc/JIAcb3yu2JucB52Ml0cloXm4GM+D0n/0CYG3SgR1bEUk
X-Gm-Gg: ATEYQzxaMP5pagvsZ5PyVAFXQF32ggNu1e2LHiCwmgvbh93qWT1porKT+m28U5gyWwA
	eCvhnbkFhhIO7ixwub8KAittUyEahzi4kakjmXOxppRD802PIbn+oB7lCQelpffOZfBFSdNiZ8V
	4YWWH0eoRyhmBBpneBF8mZ4TsPAzf1j9Hl5tbqywb/sTWPD+INmd818b1PrXzzSL+QbelEeQnfg
	/2NvU1VKLkQDKjZoDjkcqZJWK/7Lq4QvD1em9xhy0YtSnGa0c5QAq+p+Go13tabooUkQ75St8fZ
	YrefgqOrN+bNl+wAPdv9f/KZg6EOsvI7QsmidDr7Tz5t8impbSrPmMxVVvk/RKvXTDlGxESSUfL
	8enrLwfkf1iWNYKAnEJypey6Y2nbRDkhxJfc4P2BV3xGyQJPn4Q==
X-Received: by 2002:a05:6300:85:b0:350:fa56:3f45 with SMTP id adf61e73a8af0-395c3b03cc5mr10176283637.35.1772439318618;
        Mon, 02 Mar 2026 00:15:18 -0800 (PST)
X-Received: by 2002:a05:6300:85:b0:350:fa56:3f45 with SMTP id adf61e73a8af0-395c3b03cc5mr10176246637.35.1772439317962;
        Mon, 02 Mar 2026 00:15:17 -0800 (PST)
Received: from [10.206.99.28] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c70fa806295sm11137313a12.16.2026.03.02.00.15.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 00:15:17 -0800 (PST)
Message-ID: <5448e807-2435-42f4-b98e-2beb6b66a6f4@oss.qualcomm.com>
Date: Mon, 2 Mar 2026 13:45:09 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 06/18] accel/qda: Add memory manager for CB devices
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>
References: <20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com>
 <20260224-qda-firstpost-v1-6-fe46a9c1a046@oss.qualcomm.com>
 <d7s4e7xzfqfbcf5o3grc6xqm74dzwpck6ge7hyrwewmyacpuez@lcd6nhzyjr55>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <d7s4e7xzfqfbcf5o3grc6xqm74dzwpck6ge7hyrwewmyacpuez@lcd6nhzyjr55>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDA3MiBTYWx0ZWRfX5fDKGHQN5k7S
 JQBK7WTxIAgPxYZtG1qnXCLy22fBfpKQDNDqnwx1jbZXonJJMYih4YvKxPd2S+dCDVQYYy9PrIM
 xncwdlby4P0iNked/83jubvAghTjgiXq1JgX+6mM8b/92tYn2LvWqcIvuv0cBd0Wb01abS/OOEv
 DHwLCXb0GTMPArxx9YCA4QNebRN6GbuoK7eRfqkoRTzTnl0qHS4AhgTI4Mp64wMJ2UZmOoGASUg
 ViVbUsvSG4rJ6S7zgNpr0Azw6rT0hFXt2OdbzHEYi+YLjAMKcDlkc6wpjL3wofLh+Vw2nY90+5X
 YtpIWGqywU17F3Ps9YL5Mkw5Ms9zB6n0AtHtn1ugg8+ocXx5ccU7objysBFJyEnJ/pWvDWzS1/t
 myIOHHvsocGxH1dTq6+fL2EXkPKeNxWm+Q5Qm0Mqc+M4EtRbDKxrNMCDKeXUzp2Vl+/aCUm1F5n
 ypiLCzH0tXv3rH7p8Hg==
X-Proofpoint-GUID: 1EoO8fl5Q_hm_lCTxgrnDS6MaycElgB0
X-Proofpoint-ORIG-GUID: 1EoO8fl5Q_hm_lCTxgrnDS6MaycElgB0
X-Authority-Analysis: v=2.4 cv=Zqzg6t7G c=1 sm=1 tr=0 ts=69a54717 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=Dp_If50ftEsHmqaufPoA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_02,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 priorityscore=1501 phishscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020072
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	FREEMAIL_CC(0.00)[kernel.org,lwn.net,linuxfoundation.org,8bytes.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com,lists.freedesktop.org,vger.kernel.org,lists.linux.dev,lists.linaro.org,oss.qualcomm.com,quicinc.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-94791-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ekansh.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C0F541D484A
X-Rspamd-Action: no action



On 2/24/2026 4:20 AM, Dmitry Baryshkov wrote:
> On Tue, Feb 24, 2026 at 12:39:00AM +0530, Ekansh Gupta wrote:
>> Introduce a per-device memory manager for the QDA driver that tracks
>> IOMMU-capable compute context-bank (CB) devices. Each CB device is
>> represented by a qda_iommu_device and registered with a central
>> qda_memory_manager instance owned by qda_dev.
>>
>> The memory manager maintains an xarray of devices and assigns a
>> unique ID to each CB. It also provides basic lifetime management
> Sounds like IDR.
I was planning to stick with xarray accross QDA as IDR gives checkpatch warnings.
>
>> and a workqueue for deferred device removal. qda_cb_setup_device()
> What is deferred device removal? Why do you need it?
This is not needed, I was trying some experiment in my initial design(CB aggregation),
but it's not needed now, I'll remove this.
>
>> now allocates a qda_iommu_device for each CB and registers it with
>> the memory manager after DMA configuration succeeds.
>>
>> qda_init_device() is extended to allocate and initialize the memory
>> manager, while qda_deinit_device() will tear it down in later
>> patches. This prepares the QDA driver for fine-grained memory and
>> IOMMU domain management tied to individual CB devices.
>>
>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>> ---
>>  drivers/accel/qda/Makefile             |   1 +
>>  drivers/accel/qda/qda_cb.c             |  32 +++++++
>>  drivers/accel/qda/qda_drv.c            |  46 ++++++++++
>>  drivers/accel/qda/qda_drv.h            |   3 +
>>  drivers/accel/qda/qda_memory_manager.c | 152 +++++++++++++++++++++++++++++++++
>>  drivers/accel/qda/qda_memory_manager.h | 101 ++++++++++++++++++++++
>>  6 files changed, 335 insertions(+)
>>


