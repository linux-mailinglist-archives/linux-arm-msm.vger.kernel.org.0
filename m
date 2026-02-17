Return-Path: <linux-arm-msm+bounces-93115-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MNsKOhVGlGmcBwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93115-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 11:42:29 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C7414AF5C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 11:42:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EC65F3014671
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 10:42:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40D07326D55;
	Tue, 17 Feb 2026 10:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SKt6GQ1n";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qz3mJse6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2177C2D47EF
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 10:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771324947; cv=none; b=LRVRMvF4KeIeNNKej2PX9k3U8ZVFpVnbDAbdc8owqnO/GEtTbObJOeR6ts/koJOBFKMey8dpRiAw0FCkWnLCdIMnP7Irom7gQqVyiN/93SK7eubQKAybxljWpXpOcvCJdl8MoRKKyLoMh0iJ7H9Lv0cBKYc2S4YHyKkWMBmoucM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771324947; c=relaxed/simple;
	bh=zwkZhKPwzD2PsE1qcDcLirFWz7+Ud7DF8KDPjOGbD5Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FyBMp9s7JGQbt9ahHniqNBxi9auwyqnmi9ixkbhrY06CD8Xx8aWLLRDAaNO7soN2225SPHyQEp/Hq0GNyWnJ44RZTbCrNSf5nyqSpZ3UPoW1UaE4MzLkJY40m5Flb+9BP4a4v3W7stQ5L7dYHp0QG4iL8YiA9x/V7oKf47qiKxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SKt6GQ1n; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qz3mJse6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61H9G060985312
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 10:42:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lERWgpfQ021ixuj5VydJR9LwXl6bNyrORxIkuF1K2e8=; b=SKt6GQ1ndkPWdntu
	fLOUWgc0edVxjIUWHa3CXbm/A1NSIdL++g/98VhYcO7GAKtxPVTuKCJzlwXKxE9b
	SAUMTPjw4+eyh29vXrqfAS8IS+MsiKfoSPGQ0JJKoraYbyML/aCJJ9sID/uB2Czv
	KJdlEzvteTnlVFIj9fJ+YAGJtCqetROozgTpTf2xPXZCcSOnf0F+AKYfdAcnPboO
	ChT48Tc85S8v2/grel88r5+fJMwxqg5F7szz7/2uUta3C4JcrJq8zNUS/KkO3Lp3
	MBQ7/3ehwhfB8WGRxORYxEMVbXm58gcs3SGJggNfT0/CXmcHvvsoWb//3Ns7Re72
	9svWxg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc7ap1vgm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 10:42:25 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb3978cdb2so286225785a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 02:42:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771324944; x=1771929744; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lERWgpfQ021ixuj5VydJR9LwXl6bNyrORxIkuF1K2e8=;
        b=Qz3mJse6+k+zYrgF7+ZUunw9+Ak32DY8VTDuF//0Hq81DHCutbPSpzqi1XTmKBVlgy
         2iV8R+zXF/chUUGSoVWYS2dDl3speZc5zAqk3JJRzfyuqJ06nz0ezYhykN5KopXy81Lb
         sWwFLefTjnsH4jfthrfTkA3MRAnnE///C313P2xp2W3V2FZ9mSbquMhirbq+CO6XH/79
         H1ZRjx5bajRqqp5C527EXSCPBy9+pp3ATyxjPxjXeQUIdRGZ8/VJJjSvL8f1KEn9Immf
         yR8PIeKGBlpQUZgoncxm5gu/pLPbh4ei/RGpxofchmXHg8d0Ru+Eo3p40M72QSRxE43r
         YF+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771324944; x=1771929744;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lERWgpfQ021ixuj5VydJR9LwXl6bNyrORxIkuF1K2e8=;
        b=Um75ad6mnHZV7xnILx+lz11VclBqMqI/oKELH3SNWhniZ5cG7StfPCMOXcd7VuJAC3
         QhibmVsn5bjfZQwD9SGCom0bSa9rEYylf0pIzyVkAOpCBm6XUv5+g9p6Wcw8iMBZB2mG
         GX20QzWKMVgQQXsgjDgeXFJAYSGsC7VMNR3eQkm3fDTEQtE4hJF1q8h+/bKe+6c0HYxg
         9ra+OfhH6LU9Bhrwq7kszArbdP10NIn33VKxVDGM1TVa9Hj2RcJZ5AidpFJfEqgHZsJS
         84fmVjd8QwusrNI0/xUQu2GM1mf0xMIJ9vdU/TLyemXMOtFFmIdvxyELk2YLXLTuDPIv
         CiTA==
X-Forwarded-Encrypted: i=1; AJvYcCVyDbkuO0sLeOQdGIf6uvu8U/8btE6ncLRExHADAwjWyDyjQFpnJRwcy6nhYJT7gdzDxh5fyecD08OQwJtA@vger.kernel.org
X-Gm-Message-State: AOJu0YwXGGrL4t3727prudfTBMibQlDKwFHuIKRjUrC5D2ySZBDYzVq0
	PfuBmNP213BTfzWD/a9OnmtROs/vqhQV725hSSZF/sjDQSdrP4h9gu4TZC1JHmDlPNj4IZbyed+
	EFNGmG/mkd5ytZ8elSWxhITOMoCw6dL+R1ySjk1lPy+lJfyYecKguDL3vFspYvPo3C13i
X-Gm-Gg: AZuq6aKywjL2cI7ATegbkWOL3uwyLUFL+PhOEdRdNBv1kZR8w2njmoWVzNSBF2lihGO
	kMpeaazBwKi7UM8P9qBfzTXYJ2f20+9SoM6FNJBc7EdE4vrcCjIn84WChLwbcf3IMAMPGFTHXEt
	Xd6gHzL+s9y0C/cVgkTv3/2eMivG+uBsCI8tCay7TG2m0ULgupmrbkBZURmOdWY6u8vivMn3Rk5
	l9IFSdmqfVqrX8v/cSb1ia3yFX2ZgP5sJF8NEx8xI5DmhoJG9nv/GuHAs+2rGnjn0/PuGNbzjxh
	jjJfmAGsrey4cdekt+d4NVz0XRP0IXku3tqqF6G2nRgK+dYvNyT8rBmIZa/c9iUo0dOGSwKBw4z
	hXczOj4BL4thc5dHCunCTTTMVDB57rKyaq9Toe3FYfPPHbtoEvvS0iJ4vcx4ebkjFHd1Tg5rjlP
	UzaBo=
X-Received: by 2002:a05:620a:40c9:b0:8b2:fe27:d2ff with SMTP id af79cd13be357-8cb408cab72mr1172602485a.8.1771324944424;
        Tue, 17 Feb 2026 02:42:24 -0800 (PST)
X-Received: by 2002:a05:620a:40c9:b0:8b2:fe27:d2ff with SMTP id af79cd13be357-8cb408cab72mr1172601485a.8.1771324943969;
        Tue, 17 Feb 2026 02:42:23 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc763810asm330777466b.43.2026.02.17.02.42.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Feb 2026 02:42:23 -0800 (PST)
Message-ID: <e5fe09e4-758e-43ed-a134-55bcf3a198b7@oss.qualcomm.com>
Date: Tue, 17 Feb 2026 11:42:22 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] crypto: qce - Add runtime PM and interconnect
 bandwidth scaling support
To: quic_utiwari@quicinc.com, herbert@gondor.apana.org.au,
        thara.gopinath@gmail.com, davem@davemloft.net
Cc: linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_neersoni@quicinc.com,
        quic_kuldsing@quicinc.com
References: <20260210061437.2293654-1-quic_utiwari@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260210061437.2293654-1-quic_utiwari@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA4OSBTYWx0ZWRfX8LWBOzl7EfYj
 2rppP6liRjD5QEEfzKMOGh6jfHzQW2ErRtatkXbGGepXxJxWoJAxlCOBClfXVoTYmsgfOy+qJP5
 kra5voPETficF3rdYNaYjkIx/O9EgbI3dpvsPVfGaMhJlZN2m/5LXb4nMJJP6Zz/hEl4gruoTLo
 D+SBJG+7kkq2UC4Ee7ayVbs3fIxMJEq8GWc9Rlrxe+f6dfYV0WsQ3gdFy6H9qM7EdtXrLj+cBGC
 h6sRLEVXGbWD9tmKr4sqW/dxdlKod5R5haIBR/HRbUWHWK59UrBmNJ+bxUgHVLbvQ5lVN4Z/49C
 DlCacaS1kRpETdLJV7yoHnJv+I6NoTqWRbbYwOBFA8gi8TM8lhzvy9iu1cP8oINEXepgXAQbb43
 tzPX+XM/6Tif9unyEkrHfjjb3ejPtKW2bnwVJ8W5bdaI7IzsJS1ZjwYpMEiNWZflQehcKIz4O6H
 iomAdDxJlrQ/wCD0trQ==
X-Proofpoint-ORIG-GUID: cERSCRAMvy5CuY5xFv98jrdyuj4ZTH4y
X-Proofpoint-GUID: cERSCRAMvy5CuY5xFv98jrdyuj4ZTH4y
X-Authority-Analysis: v=2.4 cv=Rfydyltv c=1 sm=1 tr=0 ts=69944611 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=COk6AnOGAAAA:8 a=1gNIoQPsFeqS8mZPopYA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 clxscore=1015 phishscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170089
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,quicinc.com:email];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93115-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[quicinc.com,gondor.apana.org.au,gmail.com,davemloft.net];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 48C7414AF5C
X-Rspamd-Action: no action

On 2/10/26 7:14 AM, quic_utiwari@quicinc.com wrote:
> From: Udit Tiwari <quic_utiwari@quicinc.com>
> 
> The Qualcomm Crypto Engine (QCE) driver currently lacks support for
> runtime power management (PM) and interconnect bandwidth control.
> As a result, the hardware remains fully powered and clocks stay
> enabled even when the device is idle. Additionally, static
> interconnect bandwidth votes are held indefinitely, preventing the
> system from reclaiming unused bandwidth.
> 
> Address this by enabling runtime PM and dynamic interconnect
> bandwidth scaling to allow the system to suspend the device when idle
> and scale interconnect usage based on actual demand. Improve overall
> system efficiency by reducing power usage and optimizing interconnect
> resource allocation.
> 

[...]

> +	ret = pm_runtime_resume_and_get(dev);
>  	if (ret)
>  		return ret;

I expected this to use the new helper too, removing the need for gotos
altogether (unless this path needs some other handling which doesn't
immediately jump out to me)

[...]

> +static int __maybe_unused qce_runtime_resume(struct device *dev)
> +{
> +	struct qce_device *qce = dev_get_drvdata(dev);
> +	int ret = 0;
> +
> +	ret = icc_enable(qce->mem_path);
> +	if (ret)
> +		return ret;
> +
> +	ret = icc_set_bw(qce->mem_path, QCE_DEFAULT_MEM_BANDWIDTH, QCE_DEFAULT_MEM_BANDWIDTH);
> +	if (ret)
> +		goto err_icc;

Just one of these is good - icc_enable() simply calls icc_set_bw() with
the last known rate. Since we're not setting the rate any earlier,
just keeping the set_bw() alone seems like the way to go

Konrad

