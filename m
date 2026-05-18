Return-Path: <linux-arm-msm+bounces-108121-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CL4JOtvGCmqf8AQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108121-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 09:59:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A5A056845F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 09:59:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D24833002B59
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 07:59:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CB2B2A1B2;
	Mon, 18 May 2026 07:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d9s9F95e";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SXIIhVWS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E690F313E3F
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 07:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779091161; cv=none; b=kLnKnFUq5iFUnDubpwJfyMtNj7aoHIATEGPOl1yAqEEg0eJFd9jJ3nqM0a/PA610NGE190a/ImmhmEMpOfRAHG89mSUNbqIV0DixtfbfbDniYkm7VFyWkmN2zvOtfvfD8TE9Mo8D6CaOd6fy+c/pndLvAht4O20w5MncsBR1mI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779091161; c=relaxed/simple;
	bh=mY1Y6DE3ED910R/Akfi6keCapnlS44F/hjQ0ODPO1dA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hLI4fVllc5mchlXtZA+ZjKmdp9EeyDiigmesf2xfr1LcDpTqXEYHUIahfg80FccQh9CM2WisEatazO/m7KVxbQtzKdaRTdV2K6bQqHXSWCZrRmfrXM3tUc5mlPmp5uQzjvFRGcW5o+/fg6oDmTC0i8Fd2TPjhQdJBfWqWCLbi2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d9s9F95e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SXIIhVWS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64I7e4F72892697
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 07:59:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zxa4aoJy+8GGKmRaYi1pSnhQkdsyiCfnvq+yyPcQAFI=; b=d9s9F95ePq5loa3q
	s7a+Qgrahhvnw7U4g31QyHl0l96kBUbykO0djD5c3qZx1lOZpotOF7EkzspCpYLL
	CJGiUfJPitFxRhxmet7mwTwVmim1IV8Qf2loJYL8YVw7Oam2h5x6eBaHmhb2pz3f
	JmkuLPKWf/4tLsb4LWmujUBH17S2ieu0YzD0V6f77YYte3Jw1Fgal6bIljyAzR2K
	+JnB7TLDBmVLHOovvHQ0bh/zdYjINpZRZJetNZ+rJ2JDta0tPyocuDy0IWfkNxB+
	CuZe81paVkyj3sX6S0DB5eafMUgWVHH0hmUreH5STkpWla1vNfIksZWDO34TYFkx
	FyXmMw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e7xk182u8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 07:59:19 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50e5d7f4b63so5509341cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 00:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779091158; x=1779695958; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zxa4aoJy+8GGKmRaYi1pSnhQkdsyiCfnvq+yyPcQAFI=;
        b=SXIIhVWStIKF9EJcCTmqQCQVxwVryS7x52Ry4PYDLm+rV+rvdniCzfvKttQ6Ti2etf
         mjXyWPbJ3+U9QgP+3uzvixib8CZFBrYrVJmZfktHUX2dF2f1QL2NdxkCKn6u+3qHLQ+v
         4Hx0SVVc4y1pfpLqF5sVwoM+N91fgmT4n8Qpa5RyoQaA4agOvhUix+d+NWAWMn/aFqbM
         dw7cqeakCJXsmOTQahs6h2r2CeM0g5hKHJG7Om1Cyte8sqT7TJmuA88Z2qENYLplNPT9
         WU0MQ2QcVbSon5nZZeC+zQM0Q1DiLzSLMcdjuPJU0iibDvP4bXqwGgs5LadllHBH/5qG
         OMNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779091158; x=1779695958;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zxa4aoJy+8GGKmRaYi1pSnhQkdsyiCfnvq+yyPcQAFI=;
        b=HH84vDtxqbVVAXC1XAa8TtIbTGufvBH/QYyvarookcdjc2BFLxZxyamo2xB6WkIg6b
         gIpA6AItG9lj11ARDWoHHufsgaO+jTkbgTfOJEXfpl60mYsta7kKptCXQ0xvpo7dEhwm
         Sl46YFaYnuG1SvRlr4T1uTqwM6TioWDadfsWEPWbCwxsKph0G4MfTox9i05gcyRQnJRm
         29LAUxJ1ZJWyKEzDWpB9+zHgDmrhAkFSOjRrNr+08xTmyrSB2gBAWcZn7XmGLp+td425
         4w4JDXyTAZ8+UhBP9blYVPcMEz4zHrL7eLER0N9H9manDCA/tKNl4eadR0+n+sc5/8P/
         HAbw==
X-Gm-Message-State: AOJu0YybZ2iRPUHduinp9KBZn5aRcw6nxH2/eHMFei5JLQRNmLr34CXV
	M5FJzKFj/KLrOh9qK8T1B4e28SljOo2dhd/GQuLRyMYLmTMiWR677A3oxMe/viqttuNeh1JVxGy
	OkhqJYhkEx9yE8BOAbbZL5tHqupbeGj/JCceQw1C30/OD051xvMoV+yhcrYzuhAFteFTa
X-Gm-Gg: Acq92OEF4NcHnzaDO9g9mrS9ZVC/TrFivfbANg72ORO7V0TSDzXlbUbrZ9mxh76EjLr
	3OPw8z0zk8a4YfCi72CL4g9wrJygyaWwCAsXbcP0StrgA/iiwcOGVm/Yz8AYCr87xnbpJ0O7LJi
	v7VydBCacP67jcy8QPugM/TpBsqu+kE5pzHFOW0H6QIt+S4ywJTFpGx0AAzMJV4r4QHoMIDBW2R
	IkcZo4zVaJUVwfmOpDhvvXEgyZd7Feuz+/U7XLiJbviOLkFI9zX3dveEXUKpH/nfVT3rToZyVAU
	4GI9zyexPV/avRws06o0ce3Uphn4lZ4NiITG5GgmW5ukvNEl2+yyxhOkcqn9j8g3KMXv7Bu7Cv5
	2+Cvo8nHJIjD2VzFwSF0prJReeWpjs6u9HqeIiDbGiWL7SoxmKJCoQfHMZoMGXNy1k9OB5RWuUu
	iReVM=
X-Received: by 2002:a05:622a:1104:b0:50e:487a:bfef with SMTP id d75a77b69052e-51659fd3213mr148249731cf.2.1779091158222;
        Mon, 18 May 2026 00:59:18 -0700 (PDT)
X-Received: by 2002:a05:622a:1104:b0:50e:487a:bfef with SMTP id d75a77b69052e-51659fd3213mr148249591cf.2.1779091157767;
        Mon, 18 May 2026 00:59:17 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4e68fa6sm543154966b.54.2026.05.18.00.59.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 00:59:16 -0700 (PDT)
Message-ID: <4f8697b8-d602-4718-bc8f-4bd0dba50040@oss.qualcomm.com>
Date: Mon, 18 May 2026 09:59:14 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/5] misc: fastrpc: Fail Audio PD init when reserved
 memory is missing
To: Jianping Li <jianping.li@oss.qualcomm.com>, srini@kernel.org,
        amahesh@qti.qualcomm.com, arnd@arndb.de, gregkh@linuxfoundation.org,
        abelvesa@kernel.org, jorge.ramirez-ortiz@linaro.org
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, ekansh.gupta@oss.qualcomm.com,
        quic_chennak@quicinc.com, stable@kernel.org
References: <20260515124217.20723-1-jianping.li@oss.qualcomm.com>
 <20260515124217.20723-4-jianping.li@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260515124217.20723-4-jianping.li@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: _8ZkQItDSHDQR9q5BH6-j04Dg04k5kn5
X-Proofpoint-ORIG-GUID: _8ZkQItDSHDQR9q5BH6-j04Dg04k5kn5
X-Authority-Analysis: v=2.4 cv=BICDalQG c=1 sm=1 tr=0 ts=6a0ac6d7 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=hhTr-yxhb_4ls8DXav4A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDA3NSBTYWx0ZWRfX3A0/L7zirpbN
 XuYGPcJuR0/sgKfvPDJJPaLAZ/P/K4vWu65NpVpr8C49vmQjlN1Ejv4Nh/5zny6iYf3lWi+8A4v
 BiaDAquKsd1/uOX7xvgr3CKzV/pcVhYUIUV3q+VtbRnc2ilwQX+aujHI+TXIhwj8mIORewQA0HV
 OB8ClGGJwaWauto9DeU1jlTcsljwQZA5gWaLtu9tUXV3z3dngHQcZsOvxNI8jwXjjJL+rxs5UBg
 R4sgjlSlyrnqVH1NqNl+oAQdZg6vNd2SG/jxLtb7PYpylkflidHEBve7nVkNGfdi9a/fZclAPEw
 X4529uRQBIrkvTUhicc4dq14O8PqYMyBMdj6sa6dk6Mexg2caqPlRlb6DlkGsCxuNfbxzoiJTHm
 t9b8Zh1lbn5AkC7+JugE2IYVktAxnWv4+8+NIR7HtuE60qZqusLZRuzYfS8qCiyC9jTvVjWCYtV
 aBeggRIaQlDK0H+unXg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_02,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180075
X-Rspamd-Queue-Id: 4A5A056845F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-108121-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/15/26 2:42 PM, Jianping Li wrote:
> Audio PD static process creation assumes that a reserved-memory
> region is defined in DT and exposed via cctx->remote_heap.
> 
> If reserved-memory is missing or incomplete, the driver may pass
> invalid address/size information to the DSP, leading to undefined
> behavior or crashes.
> 
> Add explicit validation for remote_heap presence and size before
> sending the memory to DSP, and fail early if the configuration is
> invalid.
> 
> Fixes: 0871561055e66 ("misc: fastrpc: Add support for audiopd")
> Cc: stable@kernel.org
> Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
> ---
>  drivers/misc/fastrpc.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index 3c7c3b410d7d..a0337cce77f3 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -1363,6 +1363,12 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>  	args[1].length = inbuf.namelen;
>  	args[1].fd = -1;
>  
> +	if (!fl->cctx->remote_heap ||
> +	    !fl->cctx->remote_heap->dma_addr ||
> +	    !fl->cctx->remote_heap->size) {
> +		err = -ENOMEM;
> +		goto err;

Let's maybe add an UERR() with some context

Konrad

