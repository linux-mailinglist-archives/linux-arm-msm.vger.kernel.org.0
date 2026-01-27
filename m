Return-Path: <linux-arm-msm+bounces-90629-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ILmEKV8feGkKoQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90629-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 03:13:51 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 24D128EEF7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 03:13:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1DFAC3002D54
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 02:13:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CA96284669;
	Tue, 27 Jan 2026 02:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GjuNKuMI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WQCMglq+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AEDC2222CC
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 02:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769480028; cv=none; b=cD5sboCEVHGP35rMwjnDNQR6a8Obpijdl4mZrlkSqKRDj5oBdzu1GyXt3hu3GIKRBACCR+r7aAPT5FQRQ/L4HzPKeWLSpTi/UmsU5PoLLqozd/BNbuqQr9qxnf4tBBXL3TgjnGn++4Z5NDhI5V4hCNzk5vdFNaDZiq2PxKF2sW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769480028; c=relaxed/simple;
	bh=8b/7YfGT5ERjuK1k49Hh7KZUjXwynlJ01OaKEMfhooo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YJ3SQqgkDL5HJ5ABIFsOgq8y/3dH5LBWjuHGa/aNMN2X8IXLGeBziA3ptxFa05Scoi9gUkecl/kPot5yFU8yYF3qfhkKOuhlIPh6ZUG60YMqFNInzB/3MlAbdKBk4f4emf0a84orPfTPN/X/V+pOqMmdT73WSJEeX0hicuJt8D8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GjuNKuMI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WQCMglq+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60QKgILS924921
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 02:13:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mg95GMWQyqE1ExVJVSaQd9MBAjTkj0cnsmy05b2IZIQ=; b=GjuNKuMIVlQvX1/g
	isbwR4w3grcQv1yeShvaoq/mYWmbzIt7MOGr5YY7eJm77C1aw5w/4DfNuXskIsg8
	urgt5rn0Q/rSgYyo0yu4G7T20MZg39fztbrUVRCSPsly6CWr2Cu3PqdY/2hHvR6Y
	xWgMNcQqe1LVtCnzLzOvaHRXWFGvZXzGFvEN331JffBru8JGHvU1SHbDyf4mcF/j
	GKkzDvKOoSFMqwye/PdWcCvQEBAyUBg2d8Qr3CPMOXlsfgvh69+L+3EHbOgMzsTP
	Hk6g7pgJnhro0Fa1Cq+gnr/ArpkwB667NkcuuWGiZSEh5ZnqHoJ8rxXfripzmKkz
	1Gb7sQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxadpst8p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 02:13:46 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-29f2381ea85so108416075ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 18:13:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769480026; x=1770084826; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mg95GMWQyqE1ExVJVSaQd9MBAjTkj0cnsmy05b2IZIQ=;
        b=WQCMglq+bJzknQJWmdO7jfavlhMQtrhlib33omhwkq9YBYov1HE+dE9VX4YWT2ef9c
         LJELqLlP0DG/kWVl/vOh3NUO5bGLzk01Mqe992tm5FUfsFqWEbljmDxJUl9jWjAGrT0K
         KXHwVFy+spqdWL/XGxaCpTk96L0n4jlltIdwBhjtlXwEoyfpLvnSzkD7n44MfXO2UYck
         6ucOXxNArZaNxAEv8X8/M+G2FNvTPUrJfzJDToGAmScvqjmIn2rMs2xZUZDFYQyrLlAz
         oP8bCfgWPZBot0+BFKDGwxBZKda9+Z7vFTN33YgRE06/uO1pOCgarw+JC6mT/4FJ+5j/
         KC+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769480026; x=1770084826;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mg95GMWQyqE1ExVJVSaQd9MBAjTkj0cnsmy05b2IZIQ=;
        b=uww4M27q8XwlSG8LfmCSTbzK6ARe6HvP6yJ9mOdsSoDKHNCFcuvQ+Owpo+Z2/iGJQT
         AiWvmfHHaYrlvvIPzGMowiGVfJIUAvdtN4AM4MztnZktEM4xAf9toRkzUeJSfA3txkqa
         Be+WoVtQ75cql/kRh384WfbqbupMNGGJGo7oRsYM3RbGEaiSDBw12hnfdA8suGfLVeCp
         aYo4PmqlY6cil7gvSVsNIGSqQmQB24wMxzuzuPQzn4KUlvicoCZRo8BG5TVnhgqUJJO/
         K/r0zFSshZfxB+PdrCGJlm6WqvKYZ3ba+Kfv26/0gyN8+DqaNCjZXkvi6qbbrSSlhB5/
         vQtw==
X-Forwarded-Encrypted: i=1; AJvYcCXKMqu6xIkMzU3xAz2p9uoXx+RrehpN/k0fIOVf0qt2eBIqB2rD0nwsyDme1aJzXgHSgvxlJCRHx9gKJbBK@vger.kernel.org
X-Gm-Message-State: AOJu0Yyd/4GvDNKLKk5nCUyljVuDtimLo0cTbMkZaob3hAiV0RvQcXq6
	oPBLydHCMbuYBKOmKvd0TBSiw89l2lthTiosBlOhWo/b/6L6qnn3kwwTFQCGBTk73y2xMsMR3T0
	wk5V+6vhUhytnDxoP0x5ZqOhIUSyQued+AjVnSpaLmwntmojGi8MjQplo6s4wpWFmbwoJ
X-Gm-Gg: AZuq6aL6uBLw7Kncr4YGvjFC/8u5WPa0vPaYi6PbmMiNf74EqDL9ZOVstT9Dgk5NVNV
	c/LRenYXB7kypNH6WtpBo+MDAJZkI51oC8O8vQBz9i5ykaYWn5wlLsQ00dsCju7TrEMAKZyNvju
	ImyhUlB1ao7yMHgdbk2XUYl0255v6QmzbnKAKM8ogqbWWubNdPHQ4PLkeMt4Ql+6/UgvPrnul8l
	EGLcokhLhWYcKzVHg7vC/jEzEXT0CTJwMhlDGfqPybWVVGbKQadME4EPkQIbb5Dey1oL0I91xfE
	9krrVQWUk3ugnJpORjDCOtp3hrlkIC7qjSpJwzhUkiSZRqgfX4LL3t28jbqAPY3tprOnVlS4o15
	ah0MgB2qDw4vXqxnddvUAL1qFGGMqbRr+/or39Uc=
X-Received: by 2002:a17:903:2344:b0:297:e3c4:b2b0 with SMTP id d9443c01a7336-2a870df545bmr2164825ad.54.1769480025595;
        Mon, 26 Jan 2026 18:13:45 -0800 (PST)
X-Received: by 2002:a17:903:2344:b0:297:e3c4:b2b0 with SMTP id d9443c01a7336-2a870df545bmr2164465ad.54.1769480025011;
        Mon, 26 Jan 2026 18:13:45 -0800 (PST)
Received: from [10.239.133.242] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802daa66asm98956485ad.9.2026.01.26.18.13.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jan 2026 18:13:44 -0800 (PST)
Message-ID: <54e3a23e-6426-445b-b5e4-43d727b88709@oss.qualcomm.com>
Date: Tue, 27 Jan 2026 10:13:36 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 2/7] qcom-tgu: Add TGU driver
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, andersson@kernel.org,
        alexander.shishkin@linux.intel.com, mike.leach@linaro.org,
        suzuki.poulose@arm.com, james.clark@arm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        devicetree@vger.kernel.org, gregkh@linuxfoundation.org
References: <20260109021141.3778421-1-songwei.chai@oss.qualcomm.com>
 <20260109021141.3778421-3-songwei.chai@oss.qualcomm.com>
 <c5569d62-1dd5-4dec-8cb9-dd1c6e3938c6@oss.qualcomm.com>
Content-Language: en-US
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
In-Reply-To: <c5569d62-1dd5-4dec-8cb9-dd1c6e3938c6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: VXTszaUVVBmlYmK23wVVpahM5jJG4St8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDAxNyBTYWx0ZWRfX4Um072DmsqOj
 Xuc4R2lZk/BNdRSQbFDwVptq21icEb57dnHmR/UE1I8HRlUKdg1SxN+nwuzyDk0yqfCCg4Ns0fq
 y8IbKNGaHvL7Q1nqKHXm+rfKtt6sZv1wdZ6Nk45lL3xeU+SGpGFTUS+KoHWb0vwadhN0WwhfKnb
 AQmMrYBdeeITr5H8NhcdC8zqg9qgGwsiUlGdke//ySnab01iBS8o6wNWmDtid1/DxA42G0xpAKv
 cpu80lOv5udIagAtBmWSf+nPSLeBgf6xos8H55f3Tve9n+rL6RkCtu8W/EuLSOAgFku1gUpCu5X
 N0aMXBpBKLprdwQepV1EHbDznmwGxB1UeaJct4O4GLKWWtxI6gjJAWrD4Y2hhNH3IODKCzPOfLg
 zGhSVhXiq/gw11Px6ZR/R1jWGfYAmEkHunIXTwTHBcynHrCgSbk30euZ65beHzBTmp9iwUyfmH2
 FnJUMhb98OxTLTKVtqA==
X-Authority-Analysis: v=2.4 cv=GvdPO01C c=1 sm=1 tr=0 ts=69781f5a cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=w9XZVCsArpARl95_J0UA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: VXTszaUVVBmlYmK23wVVpahM5jJG4St8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-27_01,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270017
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90629-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[songwei.chai@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 24D128EEF7
X-Rspamd-Action: no action

Hi Konrad,

Sorry for the late reply.

On 1/13/2026 6:33 PM, Konrad Dybcio wrote:
> On 1/9/26 3:11 AM, Songwei Chai wrote:
>> Add driver to support device TGU (Trigger Generation Unit).
>> TGU is a Data Engine which can be utilized to sense a plurality of
>> signals and create a trigger into the CTI or generate interrupts to
>> processors. Add probe/enable/disable functions for tgu.
>>
>> Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +static void tgu_disable(struct device *dev)
>> +{
>> +	struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
>> +
>> +	guard(spinlock)(&drvdata->lock);
>> +	if (drvdata->enable) {
> 
> if (!drvdata->enabled)
> 	return
> 
Marked, will update.
> 
>> +		TGU_UNLOCK(drvdata->base);
>> +		writel(0, drvdata->base + TGU_CONTROL);
>> +		TGU_LOCK(drvdata->base);
>> +
>> +		drvdata->enable = false;
>> +	}
>> +}
>> +
>> +static ssize_t enable_tgu_show(struct device *dev,
> 
> 'enabled', in all references to this, please
sure.
> 
>> +				struct device_attribute *attr, char *buf)
>> +{
>> +	struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
>> +	bool enabled;
>> +
>> +	guard(spinlock)(&drvdata->lock);
>> +	enabled = drvdata->enable;
>> +
>> +	return sysfs_emit(buf, "%d\n", enabled ? 1 : 0);
> 
> !!enabled
Marked, will update.
> 
> 
>> +}
>> +
>> +/* enable_tgu_store - Configure Trace and Gating Unit (TGU) triggers. */
>> +static ssize_t enable_tgu_store(struct device *dev,
>> +				struct device_attribute *attr,
>> +				const char *buf,
>> +				size_t size)
>> +{
>> +	unsigned long val;
>> +	int ret = 0;
> 
> Drop the initialization, you override it immediately a line below
Sure.
> 
> [...]
> 
>> +static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
>> +{
>> +	struct device *dev = &adev->dev;
>> +	struct tgu_drvdata *drvdata;
>> +	int ret;
>> +
>> +	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
>> +	if (!drvdata)
>> +		return -ENOMEM;
>> +
>> +	drvdata->dev = &adev->dev;
>> +	dev_set_drvdata(dev, drvdata);
>> +
>> +	drvdata->base = devm_ioremap_resource(dev, &adev->res);
>> +	if (IS_ERR(drvdata->base))
>> +		return PTR_ERR(drvdata->base);
>> +
>> +	spin_lock_init(&drvdata->lock);
>> +
>> +	ret = sysfs_create_groups(&dev->kobj, tgu_attr_groups);
>> +	if (ret) {
>> +		dev_err(dev, "failed to create sysfs groups: %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	drvdata->enable = false;
>> +
>> +	pm_runtime_put(&adev->dev);
>> +	return 0;
> 
> Please keep a consistent \n above return as you did in all other places
> throughout this file
Sure.
> 
> [...]
> 
>> +/* Register addresses */
>> +#define TGU_CONTROL 0x0000
>> +#define TGU_LAR		0xfb0
>> +#define TGU_UNLOCK_OFFSET	0xc5acce55
> 
> Please align the values (it's easier with tabs)
> 
Sure.
>> +
>> +static inline void TGU_LOCK(void __iomem *addr)
>> +{
>> +	do {
>> +		/* Wait for things to settle */
>> +		mb();
> 
> What are we waiting for here?
> 
>> +		writel_relaxed(0x0, addr + TGU_LAR);
> 
> If you do a prompt TGU_LOCK()-TGU_UNLOCK() the writes may arrive in
> the order opposite to what you want, I'd say this shouldn't be _relaxed()
> and we should probably have a readback here to make sure the effect has
> taken place immediately
> 
>> +	} while (0);
>> +}
>> +
>> +static inline void TGU_UNLOCK(void __iomem *addr)
>> +{
>> +	do {
>> +		writel_relaxed(TGU_UNLOCK_OFFSET, addr + TGU_LAR);
>> +		/* Make sure everyone has seen this */
>> +		mb();
> 
> I believe this should be a readback instead
> 
>> +	} while (0);
>> +}
This lock/unlock sequence is intentionally modelled after the existing 
CoreSight CS_LOCK/CS_UNLOCK helpers, which have been in mainline for a
long time and are widely used on ARM systems.

The barriers here are meant to provide CPU-side ordering guarantees
around the LAR access rather than to wait for the hardware lock/unlock
to complete. In particular, the intent is to prevent configuration
accesses from being reordered across the lock/unlock boundary, matching
the CoreSight programming model.

I agree that the comments may be misleading in that regard, and I can
update them to clarify the ordering intent.

If you still prefer a stricter write + readback sequence here, I’m also
happy to switch to that for additional conservatism.
>> +
>> +/**
>> + * struct tgu_drvdata - Data structure for a TGU (Trigger Generator Unit)
>> + * @base: Memory-mapped base address of the TGU device
>> + * @dev: Pointer to the associated device structure
>> + * @lock: Spinlock for handling concurrent access
> 
> Concurrent access to what? (presumably the TGU?)
  Concurrent access to private data, such as drvdata->enabled here.
I will update the comment to avoid the confusion.
> 
>> + * @enable: Flag indicating whether the TGU device is enabled
>> + *
>> + * This structure defines the data associated with a TGU device,
>> + * including its base address, device pointers, clock, spinlock for
>> + * synchronization, trigger data pointers, maximum limits for various
>> + * trigger-related parameters, and enable status.
>> + */
>> +struct tgu_drvdata {
>> +	void __iomem *base;
>> +	struct device *dev;
>> +	spinlock_t lock;
>> +	bool enable;
> 
> "enabled", please
sure.
> 
> Konrad


