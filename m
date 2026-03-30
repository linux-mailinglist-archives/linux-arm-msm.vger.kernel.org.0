Return-Path: <linux-arm-msm+bounces-100666-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MLZ7ArMLymmL4gUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100666-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 07:35:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id CFEC03559B5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 07:35:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E9018300159E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 05:35:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23058282F1E;
	Mon, 30 Mar 2026 05:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Es1Jsn6O";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Yq/4rQ6F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAC711F30BB
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 05:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774848941; cv=none; b=sr/Ym8oIAOlvUGHRDEy/W+X/VnIu8OYlBy09VeIibqtKkgukNzeoz/MrR6v+KcI9Hm7v1SwepFuGRvXpMmTfKJD6skTiaGiGXy+pa5iMZZhwaqws6MdctTI3c46UUwg6UaFU+ecKaBYIk8vVhKxQV9pZl4BrIsk7znmZejEULQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774848941; c=relaxed/simple;
	bh=7wL+7puWu9yYo8IYUmSOZKrSiYmX4norFymba/Lu5Gc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iLvs0dFDqE0BCEwvBF/i1fcaok4y8YfnjxDLzqRutIHdfypGpz6w+p2RqYE6LUe+RPwEg2e+qqTz9sudW64xyKfPPL8n4QK2smbmRQNNHHFuknx9GxbSNSavjdjh1Er/z/dWOPEMSJtZqs8yw8WR2WWC9VIRWIQQbsSmGFd9PuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Es1Jsn6O; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Yq/4rQ6F; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U4huHl1619740
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 05:35:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MvSJfFg0/fJyiF2cUvCsRZFu4qD3u5xy8yRyrAefXlE=; b=Es1Jsn6O4tVxuFU7
	AFeap3WWu/LGaGIlBmrLkCWUqNCyVangym5O37LVB6C9SZ99MlBXxy0BOS/bpj2x
	mCyog/Ext0o2l6XJRnnlcfSaH5Hv2QHmK3k5mi/IIjm5D7Vbk857lnktR0vFxQmc
	0mEXgqkpcpBcv/+Gh9oUDg56Bw0SX9LxYtP0AmvG4NGxf0VY3wyZbcs5EJdlPk//
	XOH2OMmPfIolXPDncsbNqqstU9sx1bTSNVdGHaSotS/jyUBbKkrRa6+MTQyhBdbW
	FUBhoBImoHaTZWavuUx3ny1PZKy8Wzp3ilhU1MHkU2vVPux/PaBnNPqlpl2yTuuT
	TyBxNw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d672uchj8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 05:35:38 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3594620fe97so14417708a91.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 22:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774848938; x=1775453738; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MvSJfFg0/fJyiF2cUvCsRZFu4qD3u5xy8yRyrAefXlE=;
        b=Yq/4rQ6FxWtnF+3WAQmormCWnt+bk/mi8QmrVxzdK/gu/gXgbp3wnG0mxQ0WJuUi1V
         1InmQcMj2EvbEX+BBUhDClCeF4UfckFrPZ2ednXyr1PPPyGdaVH+2EDVJYYgAuKtRsgv
         M62/Aq2RmTx21/mssT25GGmpUOfiAP+w7ku8lL+RnWWIN7S4DdO4UxMI5w6rdOg+897l
         aQWK5EDFzb2SJ6xnUVXjP8Q6IBZo7AE8jAa5PMSequ9jBmkseNr6wvAPaKPK7KEQS0xL
         EMCJIFUVbxKj2ZpISb+vVdVMk9Ek6/OG1QNgX0fmWGs7tsYHuv92vaZutnHPcECnE0fl
         XyNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774848938; x=1775453738;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MvSJfFg0/fJyiF2cUvCsRZFu4qD3u5xy8yRyrAefXlE=;
        b=aEdetORXw1nPab6ugTQywdEiR4k76IHqt90B/zjhQawBv/gOfh+rafOWpuV49JLq6u
         SVbkQya+IoSisWO6DdmbJuBrofdufoK80LLXCJpkIllZuhqkKkZcsydovWTZb5TdH5Cf
         +UeF2q/KKoFfrKuvUUyIXn97ANJHC67cj/Df5sRMoUNjr9riqqAJkFE5khOqHaZTWq1o
         7juyYHhnBlqF2cNeiis6bEVGV9mI75iYDFM9gXqf0Dh6kXTPinOkiM2aoOis2QrFriP2
         Nk6yW98P0S5JBpJkMWkMSsX+TrBckClcUKdZ/Gocptbtkc6tYhS4+zSE00FgW20ACXMh
         YUOQ==
X-Forwarded-Encrypted: i=1; AJvYcCVpctTwzZGWo5N/tujavVTIi6Kj++/KBMmKfjXsmky/eEppdTap1r8q6UqgxRvawqEDWWYhSuMn2qrzBxGa@vger.kernel.org
X-Gm-Message-State: AOJu0YygEE5JasfpUtuUOOSORjgMt+vnUXFEY3AowHECDytSZOzds+q4
	aphE5R2E3QOGU3zgek3w7Yvwk+hxYqEhI7SEW4wCGildE8QZUWmwgHxpSSS0XuF8HEm5v4f+zgC
	Xr6vk6z4n3UHGxN+4yEfi0K47fUg8PurTBl1DuHGR6dvDXF1reP1QgnMSsN6aNcAWWAvG
X-Gm-Gg: ATEYQzxPIcFuZO6mHXi1jNC/cMWPFqao3AVhYIhDWM9wggyloZtp8pAv6H4Ocnhhv3y
	ZmdLhYyzRWw4oLvGDLi86mBa2Y4cB5IEpJJrw94kGLc3kV2GCvmkGoU7QQKkzRW6ahJjB9oMTnR
	WmFpEz0UJnEhrI0gJywVy8s2zOudf4u2aZLY0HYpQyj1qPtsx6t33mWBU32/Fw6eimXQoLhzbk3
	XLZYAwvcnsGYXBbKiIETDLMBwlPew+cLoEhhvbmS/epiBLcJjKZwjX0/8iCWXafwUJe8h+e52EZ
	lw6LRr9KtL7H/pydmvWu38Gf2XvmZIH+v0MBOQznG5HQvHO3NxXHusU1zYTtZaRdy344jFmPFqD
	m2e0MIzdKkfC6nkb1HuTbfkY794z2bAR8P/W/LlnVWP3TKbFcnw==
X-Received: by 2002:a05:6a20:72a2:b0:39b:cd0c:3880 with SMTP id adf61e73a8af0-39c87abc942mr11752941637.36.1774848937638;
        Sun, 29 Mar 2026 22:35:37 -0700 (PDT)
X-Received: by 2002:a05:6a20:72a2:b0:39b:cd0c:3880 with SMTP id adf61e73a8af0-39c87abc942mr11752924637.36.1774848937180;
        Sun, 29 Mar 2026 22:35:37 -0700 (PDT)
Received: from [10.218.34.110] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c76917db47esm5101084a12.31.2026.03.29.22.35.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Mar 2026 22:35:36 -0700 (PDT)
Message-ID: <eed2185e-1754-4e5a-8a19-36b9f968c03a@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 11:05:32 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: qcom: cmd-db: fix minor version decoding in debugfs
 output
To: Alok Tiwari <alok.a.tiwari@oracle.com>, andersson@kernel.org,
        konradybcio@kernel.org, linux-arm-msm@vger.kernel.org
Cc: alok.a.tiwarilinux@gmail.com
References: <20260329191110.1476304-1-alok.a.tiwari@oracle.com>
Content-Language: en-US
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
In-Reply-To: <20260329191110.1476304-1-alok.a.tiwari@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: f7xTB5Uoh47lVHrBpUGdng4WphRZsdT2
X-Proofpoint-ORIG-GUID: f7xTB5Uoh47lVHrBpUGdng4WphRZsdT2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA0MSBTYWx0ZWRfX6P+Ai34nCYgu
 buQsIeAAsZZAl+DOIJ3r3RlzQVZZ6nPIxlRenKCIO4ueuWo2MI3dH1Fk28J4IYZqK8ldlGE7V88
 7IHIqRmGCN7y7b9kMWh4YxOFPHKFbpoF0gmrJgG7/TSE65P7R5yp1pmdTp6Rsfbtm2S6Hra3UdQ
 qYQxprJKNJaC0IBENsQUazvGtq/uoVduFv8Z4RY4pAeWhTDq4cmhukPEDLozKzEqtSlyek0Kow8
 KexGEuMdCPOOQ63iA18szrVQ3WyYwYvG3Xc7LIJ3IIFisaNUh45YGtMyvBSmDF2fsfWnsCbkYGW
 F/x494ekb+f6HXP4EeY0xKazXXLBtXa51BuA4B3Cuj6t/V5Jcd1fUq499NRBj5S1AvkT7lnDMps
 NBMRiUbtnXwKnyifM9BeSUk7Fp5eci9NRlpyoZvFFcq3b95TzyllI5RSlLnrwzKkGm76td27hNK
 TXDxrqKgv13sTJXXKLg==
X-Authority-Analysis: v=2.4 cv=Ae683nXG c=1 sm=1 tr=0 ts=69ca0baa cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=yPCof4ZbAAAA:8 a=yQ7-5t_hH2Zg0trD_3IA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 malwarescore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300041
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100666-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sneh.mankad@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CFEC03559B5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 30-Mar-26 12:41 AM, Alok Tiwari wrote:
> cmd-db encodes the version as major in the high byte and minor in the low
> byte. cmd_db_debugfs_dump() prints the full 16 bit value as the minor
> version, resulting in incorrect output.
>
> Extract minor from the low byte using (version & 0xff).
>
> Signed-off-by: Alok Tiwari <alok.a.tiwari@oracle.com>
There should be a "fixes:" tag added since this is a fix.
> ---
>   drivers/soc/qcom/cmd-db.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/soc/qcom/cmd-db.c b/drivers/soc/qcom/cmd-db.c
> index 84a75d8c4b70..eed7013c7676 100644
> --- a/drivers/soc/qcom/cmd-db.c
> +++ b/drivers/soc/qcom/cmd-db.c
> @@ -301,7 +301,7 @@ static int cmd_db_debugfs_dump(struct seq_file *seq, void *p)
>   
>   		version = le16_to_cpu(rsc->version);
>   		major = version >> 8;
> -		minor = version;
> +		minor = version & 0xff;

Minor is already a u8 type, so assigning a u16 type version to u8 type 
will automatically truncate the higher 8 bits.

Its the same reason why version is right shifted by 8 before being 
assigned to major variable.

I do not think there would be any difference in output with or without 
the change, do you have any example?

Thanks,
Sneh Mankad

>   
>   		seq_printf(seq, "Slave %s (v%u.%u)\n", name, major, minor);
>   		seq_puts(seq, "-------------------------\n");

