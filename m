Return-Path: <linux-arm-msm+bounces-91222-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OG/HBG/6e2n4JgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91222-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 01:25:19 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B214CB5E37
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 01:25:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 79EF23014C16
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 00:25:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C36427B4F7;
	Fri, 30 Jan 2026 00:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eL8JL5G3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WFtbIQ71"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43E20236453
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 00:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769732714; cv=none; b=EW6q5uuMmqnxZEHN7/I1n7WK6io+nFssIfZHWQFjU+LUOZpM4sSrfAIsZZYcdtAkgv7qlfRgjh2YSw/I3rfkZnN11bXmdLdsCaXdZ82z2q16c/U2V7lbJBviLyGvoo67ry9qaFaeSEHGrhQxIw2p9Y1FAmkUbG24Iz9CVJ1ZhlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769732714; c=relaxed/simple;
	bh=xBWSQE6sS6/JgPpLm+D+fhzj2dQKmuxIS8s6r/p0dqA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=obH4Cg07+3lvdhUgwqfAZ6et1z+BUJ24coauWsv8xLXJhFelUw/845D7wcQ7Ah/tH99a8R+/n02zSPeZQgerG02dtnjhB+irGVHkIeXL7OHTQ1tkF6eFJrk3QMyDDqzJ3x3aFwF1ECthL6M1sqc7FhCSJHZZsJoTsEjGjtchheE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eL8JL5G3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WFtbIQ71; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60TH85WZ3674364
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 00:25:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=k+/DODfwQ3KtQ+bDGIO6pAc6
	mEXPzErqPHRnqZcsRF8=; b=eL8JL5G3c7YUP5QcxBjslM0Woz5/zMP/OM3M70x1
	Yr4BjlucrIgAh0/blPkZverhDpZpB5gr9L/d8hvJOW2Fi/oDCKZuDyQzXw65rfNk
	k+zZqf0wNpG0/hy/tncu+NIUy9CxrRJFTpqGpSRroqdqT/AUibPEjgmJ0WSWlYL3
	ZTUZW9qiH2pu6DHpBoLdTlRopzl2IXdagdyFDrftMx9gIsVHw+NiANpOEzbBcdoi
	/wR1x9eyQNRu6TRS3do6cyCyiZI5N+KHG02L2sR2mCzZvH+LsXtke7YIq1Nyydvi
	Es8n3tPy3gY/sucVauUhHEuyUQYki1bWiS99DGiY57RDUQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c05q7jjeh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 00:25:12 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2b722bc1be1so8275861eec.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 16:25:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769732712; x=1770337512; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=k+/DODfwQ3KtQ+bDGIO6pAc6mEXPzErqPHRnqZcsRF8=;
        b=WFtbIQ71i6U102Lbv+VHML04ubRX3v5eB7thkr/d2D5gKGcDEQHOYAQU9RqNdnjHoe
         y/M/uvitiTM4RTc2iSlJXHt/1CLtbr+JP45ND76g79ZMJTAMwjPOK9YWyR8wufndqxIP
         BJ80xPziQOCtYQm4HMItOzv5v4P2mulsdBz7k1XDwSaqv96KREYFA6OLauZ6aV9mRfSy
         TkYoiltYiMS1PSoiJzH1dcMbQvSFCpK25lpcjeQy3/xQXjOprL4/+rV+Yf8F7O/spir7
         TVaGs2zqgDkDf5DBBOssHidVt2ccBnyenLE4hNSxEohGH1EdgdO/NCdsWde07OO7Hrux
         /rGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769732712; x=1770337512;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k+/DODfwQ3KtQ+bDGIO6pAc6mEXPzErqPHRnqZcsRF8=;
        b=ckPQYBUbc0I43+bVpL1QPRrXXOvLSj3K+f5DPuG3tDEN2Q8MmscFrszXneoLXgkHi8
         k33XKh6JaeBOYroj7xuvdcXUPotk89Q3Vl+GqayIimcViUf1/ukSBEK4dVfz4jpCtVb1
         f/5GYz7XoLX0QeRcZc+0JwSSPpDFsmHxHNXUwhIYvVkrYo9rs+M4GRNsYlsiFuRlsfla
         vu7LJ/HJ9pjKhyiisyok5rtvGQpQ621we8H5tWkn389Fn4kQcWBFK726IXZ5gH+jZ2ML
         4VdT6mVJbYyg1PSE2qCfn7bz0x+eGX7RzFL7zb+EofWYem8gG3HWN2FWIdm7v5UVJNi+
         k1vg==
X-Forwarded-Encrypted: i=1; AJvYcCUgBra3aquOccdKKwybO7r2tvhGiDSU+ujeCUkoh9yZPKzEiHbbGMZL7mzBQExF/WjheySWuzvf2rg4pe4u@vger.kernel.org
X-Gm-Message-State: AOJu0YymoPwtLn3APJLOw+r9C2GoYNXmyaityCjqfxxOiht9vyFDlpSi
	Ueer1ck4DuNSO9GcPl9h6MmXlfo1JWjiz9vQ8Um6IC/OVzk7M+hCJlWXy+hH5C1RTgJYhXdvoMg
	n+7fkbCjVcmlQOy4MRE+ix1AEoNOFXwIo2WohLd1os9uJBeTW3UoSg2CEEGeyDc4GkFPwWtqrK1
	Po
X-Gm-Gg: AZuq6aL2DxKLqYwmy668Ldy5nvM0aTHWSEf4gHJc7AMj1X8U7RfnFhpdGHanCW19+SL
	p+5UhxQo4okrX/8rib4aPjzXkss/5epsUEdE/R9NjRh/l1fpRdTGjYivVRh02nVxPDq3dyAONG8
	emyUvVmTKY+rUc9FKnYVcrdbif9HclUfsDtGiltGeCn63iajJTtYTlX47x/GEXqtzfG/dLMkCDq
	/FxwG5h4BOnImsZx64bfotJmCVmbiCzOEByCI/PE+j+WCEwOAal3qaxWTfN0J+YrGnBCBT1FMRC
	zasRsmUE/lbMJjFZCkWCwkKiGWhUh43pc7YrPJnjnIisS/peLAeiEXcp/siLHO8pH3Ujnu4M4hX
	pHQ+Ni7ttCcLze5FVHno2tkklWTaltpYHQNEDnl4QtBkEwAVI0GPS+e9LUfDhojw=
X-Received: by 2002:a05:693c:2b10:b0:2a4:61d1:f451 with SMTP id 5a478bee46e88-2b7c86644d6mr554727eec.16.1769732711476;
        Thu, 29 Jan 2026 16:25:11 -0800 (PST)
X-Received: by 2002:a05:693c:2b10:b0:2a4:61d1:f451 with SMTP id 5a478bee46e88-2b7c86644d6mr554718eec.16.1769732710951;
        Thu, 29 Jan 2026 16:25:10 -0800 (PST)
Received: from hu-clew-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b7a1abe714sm8997951eec.20.2026.01.29.16.25.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 16:25:10 -0800 (PST)
Date: Thu, 29 Jan 2026 16:25:08 -0800
From: Chris Lew <christopher.lew@oss.qualcomm.com>
To: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        deepak.singh@oss.qualcomm.com, chris.lew@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sudeepgoud Patil <quic_sudeepgo@quicinc.com>
Subject: Re: [PATCH] rpmsg: glink: Replace strcpy() with strscpy()
Message-ID: <aXv6ZEFWRj6pxxwQ@hu-clew-lv.qualcomm.com>
References: <20251211-rpmsg-glink-strcpy-replace-v1-1-be06308e5724@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251211-rpmsg-glink-strcpy-replace-v1-1-be06308e5724@oss.qualcomm.com>
X-Proofpoint-GUID: 4SprHBg9cw8QOayqDxnWYTHiPk8VvvVn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDAwMSBTYWx0ZWRfX4PR/V05AdHxr
 6w8tR8l17atDMnh50WJOwaRTLVntJXmkFAb+8zWPcPwbpVquocf6OOM3fsX8W3VlyoSFbVcZY44
 XaZE7M0SegClu3/WViRm6kjoWOFEiU/ElB62eANbGNuCZK8tmJk1l8yOSe7AvAh7BP/50qbJMrM
 ZU5ec0aFBocLh299pNbKixoIZbV6dzQMkXUVIFFUhciLORAtF15dggCxTFeoxTxld5phr3u5J9P
 fjpLMi4qiREakV9Z7RYiPTV/wZIcZMvbKsbgO8C49p0WwzJfu+wMAXNQC/L+zbuCRfr4OpubjYj
 6av3teddU4n9vbaTDafCUSuKgdAegsmynV7ciMwJEljeHo3Iw2yEhvq9VAotewfUYtdomCgpKjd
 Pw7Jjt4CkXm90uGmARuOhqq988QGXrgr4Tw/ux1B69zGE4ZxBzdmmNm0NMqMQ0vMcL6aAJjaCxc
 VPrsmvrW7NtDlUy3sIg==
X-Authority-Analysis: v=2.4 cv=donWylg4 c=1 sm=1 tr=0 ts=697bfa68 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=PWxM77GI9PN3WSnVtP4A:9 a=CjuIK1q_8ugA:10 a=1F1461vogZIA:10
 a=5kKzt1m56AEA:10 a=scEy_gLbYbu1JhEsrz4S:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 4SprHBg9cw8QOayqDxnWYTHiPk8VvvVn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_03,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601300001
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,hu-clew-lv.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91222-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christopher.lew@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B214CB5E37
X-Rspamd-Action: no action

On Thu, Dec 11, 2025 at 02:18:34PM +0530, Vishnu Santhosh wrote:
> From: Sudeepgoud Patil <quic_sudeepgo@quicinc.com>
> 
> Replace strcpy() with the safer strscpy() to address unsafe API
> usage warnings[1] from static analysis tools, as strcpy() performs
> no bounds checking on the destination buffer.
> 
> [1] https://www.kernel.org/doc/html/latest/process/deprecated.html#strcpy
> 
> Signed-off-by: Sudeepgoud Patil <quic_sudeepgo@quicinc.com>
> Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
> ---
>  drivers/rpmsg/qcom_glink_native.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Chris Lew <christopher.lew@oss.qualcomm.com>

> diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
> index 5ea096acc8581b1aff106f4c0e2f9aee9d56e25b..37b2255495d53270521466a05a5eb97eca98ec0e 100644
> --- a/drivers/rpmsg/qcom_glink_native.c
> +++ b/drivers/rpmsg/qcom_glink_native.c
> @@ -501,7 +501,7 @@ static int qcom_glink_send_open_req(struct qcom_glink *glink,
>  	req->cmd = cpu_to_le16(GLINK_CMD_OPEN);
>  	req->param1 = cpu_to_le16(channel->lcid);
>  	req->param2 = cpu_to_le32(name_len);
> -	strcpy(req->data, channel->name);
> +	strscpy(req->data, channel->name, GLINK_NAME_SIZE);
>  
>  	trace_qcom_glink_cmd_open_tx(glink->label, channel->name,
>  				     channel->lcid, channel->rcid);
> 
> ---
> base-commit: d358e5254674b70f34c847715ca509e46eb81e6f
> change-id: 20251203-rpmsg-glink-strcpy-replace-738ab624071f
> 
> Best regards,
> -- 
> Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
> 

