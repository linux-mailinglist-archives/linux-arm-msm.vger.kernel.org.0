Return-Path: <linux-arm-msm+bounces-115817-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MtmsIhPjRWpyGQsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115817-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 06:03:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E132D6F3588
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 06:03:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=YI69gsla;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="fAoDix/a";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115817-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115817-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B84F03037687
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 04:02:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F7E331195B;
	Thu,  2 Jul 2026 04:02:55 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E549034388D
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 04:02:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782964975; cv=none; b=cDzOTrb9CFYOVg+mwI8wlqlOZi0QWrryViPqIaKBDsZwIWfPwo+laICV2JNFyRAgJE1pDdA7RUxaE5Z2G3J60yiShdt7Dybj0Sb+ysE3uDJCDp6hwIkZlSbrzbO4eUobLtzOCVhTndbe6XGq12KhSX9gm1fPAACSRGq6TVLojzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782964975; c=relaxed/simple;
	bh=jEKDy6Q4kJGBzL2hEYleqfwVGMBzwD4g7obTojQDJyM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LvpgnL/92grpgT8/mm5fx1JSKeKTgB5+W4iCFJdocggO8s9f/iFYB9lE3CYbjohOC6KRXYH7Ike/oT8JFRkXreLDvu5ttqaklsy7VvMiold4LXO+6D8Q8YqNR258EJM5IL1GaZGIj6Wy/gTkpga9qAjrMLfN87B4EAljvR72j+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YI69gsla; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fAoDix/a; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6621KODJ3049474
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Jul 2026 04:02:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S9W8w7OdjpJqkYQrVpqOTZBE1FMiUuBplaVPcMbciTs=; b=YI69gslaxtjP7WKe
	MRIXn+3RItS/zEL0oysywiVNP9S4K9vgFvrL4NejWbis6Vo4xUgOZU4drUxE+l98
	d+LcunByJk6oK1zUYY+yWVVvA5RYD7w2BbNmHkla/u4f+lOnIxn7tkiOoBnloQPA
	/+LeSCPLNuv3l6V0vxUpEdjDs8BH6HrWPG7c54QrdLYIP1Va7B760LPzjxjCjn4w
	+JDdSRITeBfITMaRcwe3hSXAGQYtyc8ygPhrAxqPwDgcLpNihqoP72fTIP+nzEcd
	Mj4EbMjxQ0SXK/7d7fN48OnA6hYvTWVaVfA7WIbdxG6ynEGWoc6NPDr1lIuPqXSC
	mUyA3g==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5541ttux-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 04:02:52 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-37d4f23eb37so2415391a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 21:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782964972; x=1783569772; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S9W8w7OdjpJqkYQrVpqOTZBE1FMiUuBplaVPcMbciTs=;
        b=fAoDix/a+A11CFotNVrniiaH9H5MA86uQuXngbzaK9E34uo/Y0VbOxG9bVW/uyZrJ/
         lDSdND0D9619+4sWESqJtLwpVAgR9IRAJQwJoPQRqkILBaerhNIkoCt/+sY+brg92L4R
         fh5cHMTiKZm9fU+QecyMvnPiXPnDU8KzK3BTzLpCG7q2x7j417y53ZDcBWt7xrH13FR9
         aGsJRNdWzkzIBG3IqjEbnUtoWBhYLpUXHGcC47NasDozp7OPJXVTD43MoJQSEauJ3cjz
         fYCtz6zRy7VqFsBWJwdnpIcVRVAdRJYN8hyfBjlppSiwRKtqJbwpD9D7HGX0BIItCvyj
         +v6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782964972; x=1783569772;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S9W8w7OdjpJqkYQrVpqOTZBE1FMiUuBplaVPcMbciTs=;
        b=k33aNKl2SJcFDELZpv426uq5mEIDS/qS2Bied9GtYo1BniUvmgZtCWCR2KenRCR7er
         PBRuALCThEBssJHNcNIl/WRc9Sh3qFIq3d94p+o2dxgo6EeE2edOdAqY9a+59p0CnwzZ
         xPpUKgFp5fxGwbYoWNeYZxYg6NhCOIas8Zbr8PUunrM4zf1TD+6V0y9+tesEqoNq69AW
         BupSLRcpXgvuCQt3CuLd+jNGR5jnb0/Wmj+ovXrssOg5aqXsD5SJLGBSjPRLtpLfQi0I
         zBi6loteQkc8oeE70H6G7oyXDMndqXTYtOXIUhKJOtFPsjGQ+7Jo5Qbo4IIB0AOz2e8D
         be2Q==
X-Forwarded-Encrypted: i=1; AFNElJ+B/byPxygLA3Wkfc6cY6JlRFpQINIa+V811IegijE9ni4k79EYS5hYpXpMa/234iX0wFFbTbLDCM7uCFK7@vger.kernel.org
X-Gm-Message-State: AOJu0YzS7LaQfFVC9PxVN3IwIFjSoSkXUwCo3fQvfLy9xDMj5pCFGPvo
	3dqgBWbI8K/6Tx55+tcU3dccg+uur3b50QNSHYdvIy8TjVBBFD0PEsHj6FJ1zaA4tUXyxTMO0Cb
	yPNVNoCR1cIhw0eqUixNO4/m2RlOMRBFwBz3Kh5ROKehtLnEwTHEd2IFUwCh8DaZMWeJf
X-Gm-Gg: AfdE7cmEY2IxFAI2aJJNcPdGJTTeHAkmyZ0OkpJtLe1tTkI1vB5h+RkayuiBrTz/LrC
	wvyPDdqlRc6Ng4v7r5LvW1u1E6RWtotavNYcQ/+oqXuIzwvVA9+7K0QOaVa33l8XEmCVtgbm7Ya
	rI8Sa0j9DmY6CZfPxfDI7ByRCJJ70DVaywCFbUzoQPtqIIGceNZQlEv+3MaKHFLxKH1xcSp6iUP
	XVTDjF1EXqNtbAdofruke8JOFEAJyCYbyHOMD7Qbc4m0P6uNZ1QBwHf2Grx5QeLmFHe2zT5rfCw
	9dDwM0NitiqyRIXWj0E4U0jaJrixmv9SDhdnAgNHCA2nDPHJifDWfcy2bPFaFQI845RT8ynLcX4
	8FSZOhSbaPyf/5TSpUY4ndFynevyRj9YMv0Hb95/B
X-Received: by 2002:a05:6a21:48d:b0:3bf:9fe1:c27 with SMTP id adf61e73a8af0-3bfed5018efmr5032497637.40.1782964971712;
        Wed, 01 Jul 2026 21:02:51 -0700 (PDT)
X-Received: by 2002:a05:6a21:48d:b0:3bf:9fe1:c27 with SMTP id adf61e73a8af0-3bfed5018efmr5032429637.40.1782964971004;
        Wed, 01 Jul 2026 21:02:51 -0700 (PDT)
Received: from [10.204.78.220] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0bbdc4eesm4446432eec.24.2026.07.01.21.02.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 21:02:50 -0700 (PDT)
Message-ID: <a79182b2-2582-4c77-a859-b4d013b700f3@oss.qualcomm.com>
Date: Thu, 2 Jul 2026 09:32:45 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 3/4] misc: fastrpc: Allocate entire reserved memory for
 Audio PD in probe
To: Srinivas Kandagatla <srini@kernel.org>,
        Jianping Li <jianping.li@oss.qualcomm.com>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        stable@kernel.org
References: <20260609025938.457-1-jianping.li@oss.qualcomm.com>
 <20260609025938.457-4-jianping.li@oss.qualcomm.com>
 <cca276af-3e6a-44d3-a1b6-c2bc401a28cc@kernel.org>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <cca276af-3e6a-44d3-a1b6-c2bc401a28cc@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: TUL-BS6DqmdYzjh2LGLdLD5wB2qtHHWu
X-Proofpoint-ORIG-GUID: TUL-BS6DqmdYzjh2LGLdLD5wB2qtHHWu
X-Authority-Analysis: v=2.4 cv=Xbm5Co55 c=1 sm=1 tr=0 ts=6a45e2ec cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=EWVka2mvqR4YGq0-U2gA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDAzNiBTYWx0ZWRfX7snpAaUZ0eYe
 448GMVKYyY72rIEneY7K+uREpGapTeLpCgGqmr0EbXRfL5iTKP1WOGmUl4orPowsgBM4ahSmfc0
 KAVZXdddZOqEYBHHdraEpodwKgmbfMcrZPKICbo5814PBLldIu/UW68gdON3XStweN1tsWxMuvV
 hGmJNarMAZLKbtHPfV5HEJDKnZaWTmvtH+PL9cFoU1XffLpdmmOJd6T4oufy6+OUPYBab1XXPkS
 dtJn54402IVipFo9nE7tigoW+A8ZORrmi+dTqaqLFwmMxXri3vpBDE6Y0yhp5oMW7Q6x7lwZqjv
 AulumEVTn7q+xYUZcjC7MymszPsrKvEqRpBUN4pQf7vp4uIgWt1DPefZPy47crtIeRd15qTLx7H
 M+Faa7V0j9yVxluSRTsAIgvMnEdM/ZV+KD2wNCHHWRapv76ooCFTXhYtP/+FHlPzA0F1eOMT5RO
 TvyE+qj16VfSkK5mV4w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDAzNiBTYWx0ZWRfX2seuncu8AGhv
 p3mWZqtCTMhrHw67iSEFPekv2KoB5AHCgo9CVaO/mzzia6j242yWYHM6GDkf9dJx4FwSOSeEv5V
 +YTtb6s3Rv5d5k6GHdsDF+QwUPviOy8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020036
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115817-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:jianping.li@oss.qualcomm.com,m:amahesh@qti.qualcomm.com,m:arnd@arndb.de,m:gregkh@linuxfoundation.org,m:abelvesa@kernel.org,m:jorge.ramirez-ortiz@linaro.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:quic_chennak@quicinc.com,m:stable@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[ekansh.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ekansh.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E132D6F3588

On 02-07-2026 02:07, Srinivas Kandagatla wrote:
> 
> 
> On 6/9/26 3:59 AM, Jianping Li wrote:
>> Allocating and freeing Audio PD memory from userspace is unsafe because
>> the kernel cannot reliably determine when the DSP has finished using the
>> memory. Userspace may free buffers while they are still in use by the DSP,
>> and remote free requests cannot be safely trusted.
>>
>> Additionally, the current implementation allows userspace to repeatedly
>> grow the Audio PD heap, but does not support shrinking it. This can lead
>> to unbounded memory usage over time, effectively causing a memory leak.
>>
>> Fix this by allocating the entire Audio PD reserved-memory region during
>> rpmsg probe and tying its lifetime to the rpmsg channel. This removes
>> userspace-controlled alloc/free and ensures that memory is reclaimed only
>> when the DSP process is torn down.
>>
>> Add explicit validation for remote_heap presence and size before sending
>> the memory to DSP, and fail early if the reserved-memory region is
>> missing or incomplete.
>>
>> Fixes: 0871561055e66 ("misc: fastrpc: Add support for audiopd")
>> Cc: stable@kernel.org
>> Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
>> ---
>>  drivers/misc/fastrpc.c | 112 ++++++++++++++++++++++-------------------
>>  1 file changed, 59 insertions(+), 53 deletions(-)
>>
>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>> index 517884000331..1942e74535e5 100644
>> --- a/drivers/misc/fastrpc.c
>> +++ b/drivers/misc/fastrpc.c
>> @@ -276,6 +276,8 @@ struct fastrpc_channel_ctx {
>>  	struct kref refcount;
>>  	/* Flag if dsp attributes are cached */
>>  	bool valid_attributes;
>> +	/* Flag if audio PD init mem was allocated */
>> +	bool audio_init_mem;
>>  	u32 dsp_attributes[FASTRPC_MAX_DSP_ATTRIBUTES];
>>  	struct fastrpc_device *secure_fdevice;
>>  	struct fastrpc_device *fdevice;
>> @@ -1341,15 +1343,24 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>>  	struct fastrpc_init_create_static init;
>>  	struct fastrpc_invoke_args *args;
>>  	struct fastrpc_phy_page pages[1];
>> +	struct fastrpc_channel_ctx *cctx = fl->cctx;
>>  	char *name;
>>  	int err;
>> -	bool scm_done = false;
>>  	struct {
>>  		int client_id;
>>  		u32 namelen;
>>  		u32 pageslen;
>>  	} inbuf;
>>  	u32 sc;
>> +	unsigned long flags;
>> +
>> +	if (!cctx->remote_heap || !cctx->remote_heap->dma_addr ||
>> +	    !cctx->remote_heap->size) {
>> +		err = -ENOMEM;
>> +		dev_err(fl->sctx->dev,
>> +			"remote heap memory region is not added\n");
>> +		return err;
>> +	}
>>  
>>  	args = kzalloc_objs(*args, FASTRPC_CREATE_STATIC_PROCESS_NARGS);
>>  	if (!args)
>> @@ -1373,31 +1384,6 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>>  	inbuf.client_id = fl->client_id;
>>  	inbuf.namelen = init.namelen;
>>  	inbuf.pageslen = 0;
>> -	if (!fl->cctx->remote_heap) {
>> -		err = fastrpc_remote_heap_alloc(fl, fl->sctx->dev, init.memlen,
>> -						&fl->cctx->remote_heap);
>> -		if (err)
>> -			goto err_name;
>> -
>> -		/* Map if we have any heap VMIDs associated with this ADSP Static Process. */
>> -		if (fl->cctx->vmcount) {
>> -			u64 src_perms = BIT(QCOM_SCM_VMID_HLOS);
>> -
>> -			err = qcom_scm_assign_mem(fl->cctx->remote_heap->dma_addr,
>> -							(u64)fl->cctx->remote_heap->size,
>> -							&src_perms,
>> -							fl->cctx->vmperms, fl->cctx->vmcount);
>> -			if (err) {
>> -				dev_err(fl->sctx->dev,
>> -					"Failed to assign memory with dma_addr %pad size 0x%llx err %d\n",
>> -					&fl->cctx->remote_heap->dma_addr,
>> -					fl->cctx->remote_heap->size, err);
>> -				goto err_map;
>> -			}
>> -			scm_done = true;
>> -			inbuf.pageslen = 1;
>> -		}
>> -	}
>>  
>>  	fl->pd = USER_PD;
>>  
>> @@ -1409,8 +1395,17 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>>  	args[1].length = inbuf.namelen;
>>  	args[1].fd = -1;
>>  
>> -	pages[0].addr = fl->cctx->remote_heap->dma_addr;
>> -	pages[0].size = fl->cctx->remote_heap->size;
>> +	spin_lock_irqsave(&cctx->lock, flags);
>> +	if (!cctx->audio_init_mem) {
>> +		pages[0].addr = cctx->remote_heap->dma_addr;
>> +		pages[0].size = cctx->remote_heap->size;
>> +		cctx->audio_init_mem = true;
>> +		inbuf.pageslen = 1;
>> +	} else {
>> +		pages[0].addr = 0;
>> +		pages[0].size = 0;
> 
> What is the expected behavoiur in this case?
Audio daemon is expected to take the memory information to DSP audio PD
only the first time it goes and attaches there.

This is the case where daemon was killed but audio PD session is still
running. In such cases, daemon is not expected to take any memory
information to audio PD as the earlier shared information is already
there with audio PD which it is using irrespective of daemon state.>
>> +	}
>> +	spin_unlock_irqrestore(&cctx->lock, flags);
>>  
>>  	args[2].ptr = (u64)(uintptr_t) pages;
>>  	args[2].length = sizeof(*pages);
>> @@ -1428,27 +1423,7 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>>  
>>  	return 0;
>>  err_invoke:
>> -	if (fl->cctx->vmcount && scm_done) {
>> -		u64 src_perms = 0;
>> -		struct qcom_scm_vmperm dst_perms;
>> -		u32 i;
>> -
>> -		for (i = 0; i < fl->cctx->vmcount; i++)
>> -			src_perms |= BIT(fl->cctx->vmperms[i].vmid);
>> -
>> -		dst_perms.vmid = QCOM_SCM_VMID_HLOS;
>> -		dst_perms.perm = QCOM_SCM_PERM_RWX;
>> -		err = qcom_scm_assign_mem(fl->cctx->remote_heap->dma_addr,
>> -						(u64)fl->cctx->remote_heap->size,
>> -						&src_perms, &dst_perms, 1);
>> -		if (err)
>> -			dev_err(fl->sctx->dev, "Failed to assign memory dma_addr %pad size 0x%llx err %d\n",
>> -				&fl->cctx->remote_heap->dma_addr, fl->cctx->remote_heap->size, err);
>> -	}
>> -err_map:
>> -	fastrpc_buf_free(fl->cctx->remote_heap);
>> -	fl->cctx->remote_heap = NULL;
>> -err_name:
>> +	cctx->audio_init_mem = false;
> this can race.
> 
>>  	kfree(name);
>>  err:
>>  	kfree(args);
>> @@ -2415,12 +2390,23 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>>  		}
>>  	}
>>  
>> -	if (domain_id == SDSP_DOMAIN_ID) {
>> +	if (domain_id == SDSP_DOMAIN_ID || domain_id == ADSP_DOMAIN_ID) {
>>  		struct resource res;
>>  		u64 src_perms;
>>  
>>  		err = of_reserved_mem_region_to_resource(rdev->of_node, 0, &res);
>>  		if (!err) {
>> +			if (domain_id == ADSP_DOMAIN_ID) {
>> +				data->remote_heap =
>> +					kzalloc_obj(*data->remote_heap, GFP_KERNEL);
>> +				if (!data->remote_heap) {
>> +					err = -ENOMEM;
>> +					goto err_free_data;
>> +				}
>> +
>> +				data->remote_heap->dma_addr = res.start;
>> +				data->remote_heap->size = resource_size(&res);
>> +			}
>>  			src_perms = BIT(QCOM_SCM_VMID_HLOS);
>>  
>>  			err = qcom_scm_assign_mem(res.start, resource_size(&res), &src_perms,
>> @@ -2428,7 +2414,6 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>>  			if (err)
>>  				goto err_free_data;
>>  		}
>> -
>>  	}
>>  
>>  	secure_dsp = !(of_property_read_bool(rdev->of_node, "qcom,non-secure-domain"));
>> @@ -2487,6 +2472,7 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>>  		misc_deregister(&data->secure_fdevice->miscdev);
>>  
>>  err_free_data:
>> +	kfree(data->remote_heap);
>>  	kfree(data);
>>  	return err;
>>  }
>> @@ -2509,6 +2495,7 @@ static void fastrpc_rpmsg_remove(struct rpmsg_device *rpdev)
>>  	struct fastrpc_buf *buf, *b;
>>  	struct fastrpc_user *user;
>>  	unsigned long flags;
>> +	int err;
>>  
>>  	/* No invocations past this point */
>>  	spin_lock_irqsave(&cctx->lock, flags);
>> @@ -2526,8 +2513,27 @@ static void fastrpc_rpmsg_remove(struct rpmsg_device *rpdev)
>>  	list_for_each_entry_safe(buf, b, &cctx->invoke_interrupted_mmaps, node)
>>  		list_del(&buf->node);
>>  
>> -	if (cctx->remote_heap)
>> -		fastrpc_buf_free(cctx->remote_heap);
>> +	if (cctx->remote_heap && cctx->vmcount) {
>> +		u64 src_perms = 0;
>> +		struct qcom_scm_vmperm dst_perms;
>> +
>> +		for (u32 i = 0; i < cctx->vmcount; i++)
>> +			src_perms |= BIT(cctx->vmperms[i].vmid);
>> +
>> +		dst_perms.vmid = QCOM_SCM_VMID_HLOS;
>> +		dst_perms.perm = QCOM_SCM_PERM_RWX;
>> +
>> +		err = qcom_scm_assign_mem(cctx->remote_heap->dma_addr,
>> +					  cctx->remote_heap->size, &src_perms,
>> +					  &dst_perms, 1);
>> +		if (err)
>> +			dev_err(&rpdev->dev,
>> +				"Failed to assign memory back to HLOS: dma_addr %pad size %#llx err %d\n",
>> +				&cctx->remote_heap->dma_addr, cctx->remote_heap->size, err);
>> +	}
>> +
>> +	kfree(cctx->remote_heap);
>> +	cctx->remote_heap = NULL;
>>  
>>  	of_platform_depopulate(&rpdev->dev);
>>  
> 


