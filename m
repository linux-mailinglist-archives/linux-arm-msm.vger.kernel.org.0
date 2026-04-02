Return-Path: <linux-arm-msm+bounces-101485-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cBI4HXIrzmnIlQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101485-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 10:40:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CC5363862ED
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 10:40:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 276FB305BFEF
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Apr 2026 08:36:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3862D3BB9FC;
	Thu,  2 Apr 2026 08:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RHma4SsO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j0agQ9jh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C053C3630BC
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Apr 2026 08:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775118973; cv=none; b=GFVG2DRe2crXHaLxcmRJ+13FI62/yQ2nrzFPaUmscHieCWo0AkIpVHJPOZKWAGrnFiGM1zaAs9JGJC+F1Z0ouk4xo00UYwJSybY0wQDkkU5RdjRbBd6DcWiB3WOTCAIqi59oDXna657fXgEt2eq/g27Qj0u/l1ryKUwBgh/Mbe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775118973; c=relaxed/simple;
	bh=efq6KExaXloGlu4W+o6XXI3jit5Ma9jZElLXNdRwpoM=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=KBxRG1Lub4x3UCFRWV9QsHmP72EsspTvNDQyeqZSqsTkbsHO6FOEIUxC9QWRyqMjcmOrJbmghjpZy4kcmgTQ8sUfz9ez33BwnlwivahbqZ87mrW1bGMuJohPHqZwiQXCueb14bCQYfdcLfhoNlzih5/uL5eSY5LSmYgOT03gj4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RHma4SsO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j0agQ9jh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 632723WX547062
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Apr 2026 08:36:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nZz3msypn/iPTQp7pBZHHsP/2F3PYJPj/B+Z6Rd1qmE=; b=RHma4SsOd/81yQFQ
	xAx6QCQAEfsXUYd1eiP/9KcSKt05B/8+nzzL65Ik3f6iUQz9+9v40os1eMNUM4Om
	IS9+3uV9M7/lJ0a6VZGq6psD7b30MCA+yw5iTekmwvuLomU4AkZYSi58G9jG5Mpa
	iOp2Y8QzPE972/fofH+xbDT6h1kVAjUtirRtXOJD/iBWVX/JGnpdt+p1fi87apVD
	1BHkr0w3slGvST99Bky9/WwAq3wJu5E2rRTGZuY1HvKgHB9TediDxYiK2oU1nnOM
	VB+ogu469E8DK5gDXnhY4WdZGMdplI6U/29ywBKz1Vr1nrk+2NFbY0oyylNTCK//
	s0HIyQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d94vvktwq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2026 08:36:10 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35d98c6ab60so1772995a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2026 01:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775118970; x=1775723770; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nZz3msypn/iPTQp7pBZHHsP/2F3PYJPj/B+Z6Rd1qmE=;
        b=j0agQ9jhpGOlLpuYokhwwOgFcvdrH+A8TotNKbbz77s0c7uoAGzwy1JHIP9u1qcFHm
         zWkBbPsOF5yz8vgoD5EfArOkunccFyaHrL4X40vudnPbqS99fDYbwH4LvDPVRf23C36R
         BR1z5LrhsTmjzSBOW09YOCOov3MR6s+bfQLh+NIJhU2M0kUjx9MVHBbkbFZ3QS3QAQBx
         peltmcVVy7LIWI8cUIpNaM1hmIxR+5izrZhR8K4PLxd6UKqVBF9O4OFk+U4i+tC7XSoP
         l1JZuXkVxz2Bmw5ePUePxAFlv1MbnpvT2fPW6X1FIg2y6mmdRLlata4cenJh60fCWN9t
         hO4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775118970; x=1775723770;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nZz3msypn/iPTQp7pBZHHsP/2F3PYJPj/B+Z6Rd1qmE=;
        b=aW9QaCL3UbREDaFjUa1hhq1hEasNXZMux9Dj7H81MGr57oKOxrZZ6Uvi25gsf098QU
         im4/o4NHvhbRQus10wxJJvnwYrNvmhD2R+Vypb2iP/O25zvCpunXr/BLHk9fGZih8J8l
         QPKVQGAHnr/DOhGToiawTb56nn1PrX9adQurd26qvle2DJTDXe3tM/l0AFCrduGj7/Tm
         HMuQdXHOY8RfKFirwDsoxhQEIym1A7rbOD8YPFi1M+B7hdZIUexI37xpqu29U9wnS+4d
         TF6wvyaH0q37Qee6ZpYNPqV196xdRInLwdl6yiQ1N4Dax3t8gzde2hPxNVATdKrYVEea
         C9gQ==
X-Forwarded-Encrypted: i=1; AJvYcCUvbvl5MX0QGVv1G3wjs8zmkCuU3fg8r6c2M4ty0Q1YyngxdCUBLg3nDIj0IDrqoIy/ZP5e5vfhTIwwsOZF@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0FEoLgEZObD9VwoM/J3QwUIhtVnd3acR37YQ5o5HVL4vFbLyU
	4kX0jhNEGOQU4n09TT4XyIhrT9G6P7iB44PBoSCmrLr2cW2uB/VBGeiIb1jlvI0/2cIn5EzOvn0
	heRx+7GOemWkQM6uEOgpWVBCKQGw6DsqNrOBJnd/N6zUiOQJP1p2Tnc1aLC2Bhc7zjKjc
X-Gm-Gg: AeBDievSg8kEWzeHp1ZrDK3bDWm1CjHSFDyhkyVsnOWhknd0yDyeTvIfZuBpGGIBMHu
	+5QgpyxMHnMdXQ77W14/IbL3Gjtsia/TPNWeCSFsCEnnjWJfczqv15KBEPJzLU9EQRDmnlzyuEj
	4p/aqCiAaQtQxqUmrvkRTOLjYh6TRClqkXvO8D/WddfqqaE3Ez4Db/mbwVZbYvNBvGCJeaA5JSN
	yzaWXXK9uTqatilD+lUSija/WkmHgv7F6efsGh8ukbZS8C8qnwj2qj3Me6bbvzvVc4SCb0HzFUG
	+HEMkpQqSlyLtK5YWHWay5nkl16PbalS7L2UFZU0d744Km+DZHlr9LKtRaqAxCw603QhZwgoo70
	SRoaeLYKIh9ejd1F640/IsvVjV7IGXBuhPt+j81pwOjfdodL2sOqc
X-Received: by 2002:a17:902:db12:b0:2b2:4c30:e6e2 with SMTP id d9443c01a7336-2b277e256c0mr15094655ad.16.1775118969712;
        Thu, 02 Apr 2026 01:36:09 -0700 (PDT)
X-Received: by 2002:a17:902:db12:b0:2b2:4c30:e6e2 with SMTP id d9443c01a7336-2b277e256c0mr15094325ad.16.1775118969177;
        Thu, 02 Apr 2026 01:36:09 -0700 (PDT)
Received: from [192.168.1.14] ([110.225.167.58])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2749e2e97sm27595375ad.82.2026.04.02.01.36.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2026 01:36:08 -0700 (PDT)
Message-ID: <998ce121-e027-441d-a3f4-2f3e41e10830@oss.qualcomm.com>
Date: Thu, 2 Apr 2026 14:06:00 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 12/18] accel/qda: Add PRIME dma-buf import support
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>
References: <20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com>
 <20260224-qda-firstpost-v1-12-fe46a9c1a046@oss.qualcomm.com>
 <e87c0c1d-82f1-4a03-9a56-9bf3e03273cf@amd.com>
 <29f9bb45-5c3f-4847-a629-21cef540f38b@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <29f9bb45-5c3f-4847-a629-21cef540f38b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDA3NiBTYWx0ZWRfX7KMUokTTmGuU
 eLQj/EkEpg2835L6SzKQ220thwykGbc5mbOl5YIAFa6M6UWwFP5ZEgaIlp8IL0KDI/HqLYmYGyA
 QYsJV2VHCMYX6QwGq3prPQg+isEA228Xf/6dl+BevhKpKOU75FHsxOp+bf0g3l6TgdyhLwUmkXw
 FMaQ+CJoMRpoNH8wtVvUmSk+w1K/fTo/DfmQngstcwZpq1sVa1lmXyLco+Enoyu6+6IbWlGH1yZ
 kGsJ6HcxmUjIgeCNszxN7MxtjvlVaJ4oPNMPc+gPzYRm3kn+TC5G1WHIni/7GdszrvzqfNtoQJW
 +jK7VkceEErHKGfLsOhe6066KirjUx7Yw+xtienFEQgq6/1dMecwHPSBRPKiLN2CLRhlFZNlagU
 QrkLHEcDlaTNRjQw8Dl1GBTXwGzyfoSfzMprJ2lH5H2qee5+rMjl6v6d0THjGigkpHkeg67fz+7
 zJBSCMLPGB2da5R6sjg==
X-Authority-Analysis: v=2.4 cv=DJSCIiNb c=1 sm=1 tr=0 ts=69ce2a7a cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=GstQyB7T1i92F5dDEt+vJw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=_EeEMxcBAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=yv3-IXtlHroiPP0bXpQA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=czjwGCTIUPoA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: 8vy5WR4iDpyCVyXiYUXMJsDwPnGFnXfn
X-Proofpoint-GUID: 8vy5WR4iDpyCVyXiYUXMJsDwPnGFnXfn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 adultscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604020076
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101485-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[amd.com,kernel.org,lwn.net,linuxfoundation.org,8bytes.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[aka.ms:url,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ekansh.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	REDIRECTOR_URL(0.00)[aka.ms];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CC5363862ED
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/9/2026 12:29 PM, Ekansh Gupta wrote:
>
> On 2/24/2026 2:42 PM, Christian König wrote:
>> On 2/23/26 20:09, Ekansh Gupta wrote:
>>> [Sie erhalten nicht häufig E-Mails von ekansh.gupta@oss.qualcomm.com. Weitere Informationen, warum dies wichtig ist, finden Sie unter https://aka.ms/LearnAboutSenderIdentification ]
>>>
>>> Add PRIME dma-buf import support for QDA GEM buffer objects and integrate
>>> it with the existing per-process memory manager and IOMMU device model.
>>>
>>> The implementation extends qda_gem_obj to represent imported dma-bufs,
>>> including dma_buf references, attachment state, scatter-gather tables
>>> and an imported DMA address used for DSP-facing book-keeping. The
>>> qda_gem_prime_import() path handles reimports of buffers originally
>>> exported by QDA as well as imports of external dma-bufs, attaching them
>>> to the assigned IOMMU device
>> That is usually an absolutely clear NO-GO for DMA-bufs. Where exactly in the code is that?
> dma_buf_attach* to comute-cb iommu devices are critical for DSPs to access the buffer.
> This is needed if the buffer is exported by anyone other than QDA(say system heap). If this is not
> the correct way, what should be the right way here? On the current fastrpc driver also,
> the DMABUF is getting attached with iommu device[1] due to the same requirement.
>
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/misc/fastrpc.c#n779

Hi Christian,

Do you have any suggestions for the shared requirements?

I'm reworking on the next version and currently I don't see any other way
to handle dma_buf_attach* cases.

//Ekansh

>>> and mapping them through the memory manager
>>> for DSP access. The GEM free path is updated to unmap and detach
>>> imported buffers while preserving the existing behaviour for locally
>>> allocated memory.
>>>
>>> The PRIME fd-to-handle path is implemented in qda_prime_fd_to_handle(),
>>> which records the calling drm_file in a driver-private import context
>>> before invoking the core DRM helpers. The GEM import callback retrieves
>>> this context to ensure that an IOMMU device is assigned to the process
>>> and that imported buffers follow the same per-process IOMMU selection
>>> rules as natively allocated GEM objects.
>>>
>>> This patch prepares the driver for interoperable buffer sharing between
>>> QDA and other dma-buf capable subsystems while keeping IOMMU mapping and
>>> lifetime handling consistent with the existing GEM allocation flow.
>>>
>>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>> ...
>>
>>> @@ -15,23 +16,29 @@ static int validate_gem_obj_for_mmap(struct qda_gem_obj *qda_gem_obj)
>>>                 qda_err(NULL, "Invalid GEM object size\n");
>>>                 return -EINVAL;
>>>         }
>>> -       if (!qda_gem_obj->iommu_dev || !qda_gem_obj->iommu_dev->dev) {
>>> -               qda_err(NULL, "Allocated buffer missing IOMMU device\n");
>>> -               return -EINVAL;
>>> -       }
>>> -       if (!qda_gem_obj->iommu_dev->dev) {
>>> -               qda_err(NULL, "Allocated buffer missing IOMMU device\n");
>>> -               return -EINVAL;
>>> -       }
>>> -       if (!qda_gem_obj->virt) {
>>> -               qda_err(NULL, "Allocated buffer missing virtual address\n");
>>> -               return -EINVAL;
>>> -       }
>>> -       if (qda_gem_obj->dma_addr == 0) {
>>> -               qda_err(NULL, "Allocated buffer missing DMA address\n");
>>> -               return -EINVAL;
>>> +       if (qda_gem_obj->is_imported) {
>> Absolutely clear NAK to that. Imported buffers *can't* be mmaped through the importer!
>>
>> Userspace needs to mmap() them through the exporter.
>>
>> If you absolutely have to map them through the importer for uAPI backward compatibility then there is dma_buf_mmap() for that, but this is clearly not the case here.
>>
>> ...
> Okay, the requirement is slightly different here. Any buffer which is not allocated using the
> QDA GEM interface needs to be attached to the iommu device for that particular process to
> enable DSP for the access. I should not call it `mmap` instead it should be called importing the
> buffer to a particular iommu context bank. With this definition, is it fine to keep it this way? Or
> should the dma_buf_attach* calls be moved to some other place?
>>> +static int qda_memory_manager_map_imported(struct qda_memory_manager *mem_mgr,
>>> +                                          struct qda_gem_obj *gem_obj,
>>> +                                          struct qda_iommu_device *iommu_dev)
>>> +{
>>> +       struct scatterlist *sg;
>>> +       dma_addr_t dma_addr;
>>> +       int ret = 0;
>>> +
>>> +       if (!gem_obj->is_imported || !gem_obj->sgt || !iommu_dev) {
>>> +               qda_err(NULL, "Invalid parameters for imported buffer mapping\n");
>>> +               return -EINVAL;
>>> +       }
>>> +
>>> +       gem_obj->iommu_dev = iommu_dev;
>>> +
>>> +       sg = gem_obj->sgt->sgl;
>>> +       if (sg) {
>>> +               dma_addr = sg_dma_address(sg);
>>> +               dma_addr += ((u64)iommu_dev->sid << 32);
>>> +
>>> +               gem_obj->imported_dma_addr = dma_addr;
>> Well that looks like you are only using the first DMA address from the imported sgt. What about the others?
> I might have a proper appach for this now, will update in the next spin.
>> Regards,
>> Christian.


