Return-Path: <linux-arm-msm+bounces-115821-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id V1cKMpX4RWrvHAsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115821-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 07:35:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E3A66F394B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 07:35:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Ro7Z422w;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=VNlG3XW+;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115821-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115821-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A09383006177
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 05:35:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F230445BE3;
	Thu,  2 Jul 2026 05:35:15 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC899226CFE
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 05:35:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782970515; cv=none; b=Kt28+IgcJfoNjoWHf6t463CCNfW2JlQAtO/jihtcIq2JcBUMgcbTT8nA3ZXEUPWywVqC4SugX6QE+xOJB1svVdEwWyhLQaiQIP+KVa2q41xfr4RxdW5KiVqZTrot19XC2Bcf1qc0oLYCd74Ehls9BPEiuxRIg+t2Q4xeMNQ2xP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782970515; c=relaxed/simple;
	bh=XLTSfMptGsGAVVw8MRDFuGXVmpsVxOBv48EiZ2G0+B0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PSmKxBiDJ3enHcFsByYtnkmsKvk3kSDwJ5rJqowsQ67UyCST3DkVUBtPxc2aLGCuK98Xtn4Hr9vgJsfAvwaYcO9Pa6keMlGqWNcIu6QQ4ElIUyOgrHjkphBAlUzXtuiTyXRp05G0G6uEl6JtZI9vMoXrTQG+uJBNhfcRrnwgYGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ro7Z422w; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VNlG3XW+; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6621KvMJ3053022
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Jul 2026 05:35:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BXQOVmnUutoNTds54kZvzeA6Cp+B841HmrjaPmvpvAY=; b=Ro7Z422wvJg6R1s7
	Y0kcMu0dvzFNqsYCQi+5vP5rKolNBWse0+yiKy0SFP2ebg15PUlx+K/R49KfqgT/
	9aaAnJ3RE6Lks689pwq04JwO37K14wcAvoK2ES8ZalzlTzlYHkwDK0CyJq+TIhZn
	0gUg2ZLwJregtSEi1+xPif6BrWe+Jw6cUS7gZ2uGSEvtSfSKH+e1YSe7VKnPW2I6
	btlxDsKQSxpkWJSh5QetF/LooBkd1CNSfXzVrL06cG9ZkV9L+MsvV4hgUkULupXL
	onvBGvV8y+yIXsSm0X94pZfDPwp/RTuZMOfP3MoVvPUsHQ59fz2LLGDYxZzAixSM
	LuUuYQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f56gptfqc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 05:35:12 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-847a5f03ff9so1752437b3a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 22:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782970512; x=1783575312; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BXQOVmnUutoNTds54kZvzeA6Cp+B841HmrjaPmvpvAY=;
        b=VNlG3XW+wnlnQ2QSS7KzYPQ8VnUoA18Ygmz1LnhCrdZi4bBM1ZQvTsSzOoLFKzUWlD
         iWIqxs3UjT/PHqG0/yik9M8YeYfMDTGIzDd4D4rXalcmQa2sYaMzHFCF6DNNy9U257NN
         Gh0U1KgL2cMlPCcnKh5sEdviFSFAWL36t630T6wy4XJYsV5NacNpL6GWqcerXZiXDdze
         uzp8ewtse8i4TqwyubRfyqtPkp7Fi5oUV6v4AHsuzW95eQw95L7c+Zwij0KRyDHDwZh3
         t/2+zfODESkmzaLFtcKpgI0ypYEUsaTE3UQ5Xsl3GEmNR3CHsOoMdz3datQaDKwHbQTC
         V8mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782970512; x=1783575312;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BXQOVmnUutoNTds54kZvzeA6Cp+B841HmrjaPmvpvAY=;
        b=oh0XFs13eyLAH3LBJTdbQrCRxn+VZFhWprLkaM78qDaqG/NWNvbeG3dMVEe72X3ydT
         e0ggvW0wwHbEnKP2nbYYL1Pq7E2ftnZP13wcFb9GCXNFjANDX1XC7NuzdxLjOn/czTZx
         BI8jgjK40m4k0qdE7rf3Cydpf+9nWhsnBYGnaN2hWd7GxJbijOckwaGbaFGO2vZtZmWl
         zhdzN4Ie0tuDvOXQG/mTQNF9tRYL87aQz1zEPJpLm7hR+5KjkquPkSwJBuSBsGb8nSE6
         HBX0viHFDmr9yPus804YTENdO0HHZG4LMI8D5nhz0cevVFal9YQ7ZkIXyJg1H72RCfF4
         eNFA==
X-Gm-Message-State: AOJu0YwZy3d2QQeH/a71TJeA+AtQfuahRSojYpaHQoqZtUp4GROoN4Jn
	IbErP8yKM5rF5Rj8KfPXuDhT3uhOeT+1/HoY0ncbgNXUtoivr2BuDCbfefsWnLKXZ5A3nod+JjW
	y+9xJvQspqwIgJan19/UDC77mesgeZLaib/eqcKZyoMhBmXAm0JVlToNYIh5KJ5uRkx+PL3At8N
	RS
X-Gm-Gg: AfdE7cm5bPsTHhTLoOZNOM4yj7uDRQgUXfckEyn+gWm7P/yDpbL8EtD1JGQksS/6+E6
	m7CZ80A8nDWlAfHUGyBgcP82K9c50PfZPKRekR7XmAxco38wHTs2MzDeLGGLtMZtB2ItMiWXRM7
	wAK1FaZpGqWE55+RpR0X58mc9Uaztk6mVAP9z7thLb9kf88MOq9VbxnktJ/joYSwWtjJSN3aS4y
	jfwHcDgdSI+OMKXkXgrpf2W1yJrt27SJgYAfjMvEfcX7oTgZZ2d92JGcmS71QZIdTRNXnhkJtEE
	1zJVBh39pebLM5AnF677qsqCOsPhpOWueA9ckZg5fJ/FnJ/DrYyzWylfDs4IJPVAHazZtUjP7k4
	Ln4Facf+crFg/9crmcQ3tj0IRqViTPpcoeXZQbd62
X-Received: by 2002:a05:6a00:3018:b0:847:73f1:4ce8 with SMTP id d2e1a72fcca58-847c094766bmr4215989b3a.46.1782970512078;
        Wed, 01 Jul 2026 22:35:12 -0700 (PDT)
X-Received: by 2002:a05:6a00:3018:b0:847:73f1:4ce8 with SMTP id d2e1a72fcca58-847c094766bmr4215958b3a.46.1782970511558;
        Wed, 01 Jul 2026 22:35:11 -0700 (PDT)
Received: from [10.204.78.220] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb6dcd7esm801508b3a.11.2026.07.01.22.35.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 22:35:10 -0700 (PDT)
Message-ID: <01d8d8cb-3de0-4267-9a73-c06287393483@oss.qualcomm.com>
Date: Thu, 2 Jul 2026 11:05:06 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] misc: fastrpc: create duplicate sessions after all CB
 probing
To: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>
References: <20260609-dup-sessions-v1-1-26934abb9fa3@oss.qualcomm.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <20260609-dup-sessions-v1-1-26934abb9fa3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDA1NCBTYWx0ZWRfX339Tqjh/VAye
 5K0lecf0sT38vg8bvSbB6sDT1b2g1vTzrzwPPYTDRZZHkcEoohqBIjeNozKs4nCfitCDrW4kj8m
 Roed3t5tMGrjpNg0DD/m+rSsMldWKms=
X-Proofpoint-GUID: f2MpSu733fO9WvkhGeIgbYMzUCSgPsUQ
X-Proofpoint-ORIG-GUID: f2MpSu733fO9WvkhGeIgbYMzUCSgPsUQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDA1NCBTYWx0ZWRfX3ghZhrklDRyw
 SdB1SNV9azyPljmjZwTR8CKqAfFW9O5kDVCzPjTIrIis82DgbraXZmF99lVaPPyJ+bnhp6C1REz
 o3Bw+Xxb75k9YlK6tqE/j5rtfyAn4afHZs6YbfwhAUsdoncQNhyhbEzeu0laDBlKpQSJOQEHj1N
 rDeZMvfY83A0RrSSSHj+QYIZxrknLvReqW8eCnOT+UvdoTEbfhIbnuFNAmHouUJR2Rz07zCNG2O
 zB0MllHovWPkrTLS9Vj2wUxbWri2s3StqJ2rFAajApYqgm3tJJ/ENVXvmHstC/fTWolqYVJakpr
 quXFblGhK7QKzz/8oiuVGogqoyQLM16R2f+7EJWmTuMg5qzO2vFuyKYB3SsUXtviD8PtVVNKbit
 WB7oZT5sZD/c+oG7uMBn5TmZ/5rp2/qvTsqBQ0h6vfbdekahJuUYkgEqPWWv92jGcuooT+f+L6k
 fHPEILEunefAA2Vcqfg==
X-Authority-Analysis: v=2.4 cv=K9oS2SWI c=1 sm=1 tr=0 ts=6a45f890 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=9RQ4r9LfJCXKqqXW7GcA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020054
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-115821-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[ekansh.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:vinayak.katoch@oss.qualcomm.com,m:srini@kernel.org,m:amahesh@qti.qualcomm.com,m:arnd@arndb.de,m:gregkh@linuxfoundation.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:bkumar@qti.qualcomm.com,m:chennak@qti.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ekansh.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5E3A66F394B

On 09-06-2026 16:03, Vinayak Katoch wrote:
> For ADSP, only a limited number of FastRPC context banks (CBs) are
> available. Each CB supports a single session, which means only a few
> processes can run on ADSP simultaneously. If all sessions are consumed
> by fastrpc daemons, no session remains available when a user application
> starts, causing the application to fail.
> 
> To address this limitation, a Device Tree change was used till now:
>   qcom,nsessions = <5>;
> 
> However, feedback from the upstream community indicated that this change
> should not be made in the Device Tree. Instead, it was recommended to
> handle this as a driver-level change.
> 
> Instead of duplicating sessions inline during fastrpc_cb_probe() using
> the qcom,nsessions DT property, defer duplication until after
> of_platform_populate() returns in fastrpc_rpmsg_probe(), at which point
> all compute-CB child nodes have been probed and the session array is
> fully populated.
> 
> For the ADSP domain, append FASTRPC_DUP_SESSIONS (4) copies of the
> last probed session once of_platform_populate() succeeds. This keeps
> the per-CB probe path simple and ensures duplicates are always derived
> from a stable, fully-initialised session state.
> 
> The qcom,nsessions DT property is no longer consumed by the driver; the
> binding and DT sources are left unchanged.
> 
> Signed-off-by: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
> ---
>  drivers/misc/fastrpc.c | 31 ++++++++++++++++++-------------
>  1 file changed, 18 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index 1080f9acf70a..46afbae9c234 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -30,6 +30,7 @@
>  #define CDSP_DOMAIN_ID (3)
>  #define GDSP_DOMAIN_ID (4)
>  #define FASTRPC_MAX_SESSIONS	14
> +#define FASTRPC_DUP_SESSIONS	4
>  #define FASTRPC_MAX_VMIDS	16
>  #define FASTRPC_ALIGN		128
>  #define FASTRPC_MAX_FDLIST	16
> @@ -2195,7 +2196,6 @@ static int fastrpc_cb_probe(struct platform_device *pdev)
>  	struct fastrpc_channel_ctx *cctx;
>  	struct fastrpc_session_ctx *sess;
>  	struct device *dev = &pdev->dev;
> -	int i, sessions = 0;
>  	unsigned long flags;
>  	int rc;
>  	u32 dma_bits;
> @@ -2204,8 +2204,6 @@ static int fastrpc_cb_probe(struct platform_device *pdev)
>  	if (!cctx)
>  		return -EINVAL;
>  
> -	of_property_read_u32(dev->of_node, "qcom,nsessions", &sessions);
> -
>  	spin_lock_irqsave(&cctx->lock, flags);
>  	if (cctx->sesscount >= FASTRPC_MAX_SESSIONS) {
>  		dev_err(&pdev->dev, "too many sessions\n");
> @@ -2225,16 +2223,6 @@ static int fastrpc_cb_probe(struct platform_device *pdev)
>  	if (of_property_read_u32(dev->of_node, "reg", &sess->sid))
>  		dev_info(dev, "FastRPC Session ID not specified in DT\n");
>  
> -	if (sessions > 0) {
> -		struct fastrpc_session_ctx *dup_sess;
> -
> -		for (i = 1; i < sessions; i++) {
> -			if (cctx->sesscount >= FASTRPC_MAX_SESSIONS)
> -				break;
> -			dup_sess = &cctx->session[cctx->sesscount++];
> -			memcpy(dup_sess, sess, sizeof(*dup_sess));
> -		}
> -	}
>  	spin_unlock_irqrestore(&cctx->lock, flags);
>  	rc = dma_set_mask(dev, DMA_BIT_MASK(dma_bits));
>  	if (rc) {
> @@ -2445,6 +2433,23 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>  	if (err)
>  		goto err_deregister_fdev;
>  
> +	if (data->domain_id == ADSP_DOMAIN_ID && data->sesscount > 0) {
> +		struct fastrpc_session_ctx *last_sess;
> +		struct fastrpc_session_ctx *dup_sess;
> +		unsigned long flags;
> +		int i;
int i was already declared outside, avoid shadowing> +
> +		spin_lock_irqsave(&data->lock, flags);
> +		last_sess = &data->session[data->sesscount - 1];
> +		for (i = 0; i < FASTRPC_DUP_SESSIONS; i++) {
> +			if (data->sesscount >= FASTRPC_MAX_SESSIONS)
> +				break;
> +			dup_sess = &data->session[data->sesscount++];
> +			memcpy(dup_sess, last_sess, sizeof(*dup_sess));
> +		}
> +		spin_unlock_irqrestore(&data->lock, flags);
> +	}
> +
>  	return 0;
>  
>  err_deregister_fdev:
> 
> ---
> base-commit: 97e797263a5e963da3d1e66e743fd518567dfe37
> change-id: 20260609-dup-sessions-ea2acaac1994
> 
> Best regards,


