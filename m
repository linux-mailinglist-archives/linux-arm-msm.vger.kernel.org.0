Return-Path: <linux-arm-msm+bounces-115318-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kacfFPx3Q2oHZAoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115318-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 10:02:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EC9A06E17F2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 10:02:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=NEKrKVrO;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="bLacls/R";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115318-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115318-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AEFFD30179E6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 07:55:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A8C13E3DA4;
	Tue, 30 Jun 2026 07:55:52 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E30163375CB
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 07:55:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782806152; cv=none; b=BWoHoBBvSL1NyK4EGSw2b9ZOPNXSMXuc1mG055NNUc3jxDhBcyPlGsBQdewNMFvcA23fJbKTi/y6uE2oLi2qiUOtsL1MitNFo07siGozPdH12pLtY5Lbgcg90o41ufPI8LuEOBfCa7jcCkndoaSOrj7rVGWIAzs3kDbMjfdPoCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782806152; c=relaxed/simple;
	bh=cRykOdJcg82LY/zQAD7pq4ibR7qbi1H6EcAU8FKPdFs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CecrSDn53VyejXb8W3x/ZQG6uzk24hbohiN7BiWM9ZrL3i+LKg1WxMN0EVyH2kgqpDpBbR5WbN4zhy4+VDxCJ6+I+Z/6Qokazu7gIpOl8MRpc9bUgnU1QgvlgUw5ZtG/IvgRFND4SbzDofTPFXkLf2I9Z+tngIEfd7U0zbLkyGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NEKrKVrO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bLacls/R; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U6CS8B1088818
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 07:55:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mqpNY3U/BBW/1jq7tUqFwqPx
	2Jgckwa966PpuubyQb4=; b=NEKrKVrOvnmAJZFZpqtVsPhOi8xUrMDGZH2JBrza
	q/nnn5B5u2HL6I7OtB7KwWe0+HftoNYWg93TFf9B/JHmBWcAAKe+/bBEomMGzsop
	ih0l2aHP/TgRU1teiKwmiS128MO1f+LbUudj/RlCoBfD5azIkMWGdr7dIJyGRwKs
	iBAr1MGHu+wM/Ddmuxm+GfkJibRGUCBCRg7h/izAbpx6unFMlFDAa9QVMtWItqug
	NDtXsNLtoGG2SGdKJEniib29uivKu8BOWcGs5zbt4S8dHsypMWfvqKcqipzBVexs
	eZKBiGnnljFIMeLU5xmQm6b/20O26TxqXYUF/oxAa3pJDw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f462fh0kf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 07:55:50 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30ec59471a3so431791eec.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 00:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782806149; x=1783410949; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mqpNY3U/BBW/1jq7tUqFwqPx2Jgckwa966PpuubyQb4=;
        b=bLacls/R4qVVttXVMgFlPvrZfp1uSieL88bFdvmXTvCO90UYH5RPvEC9n9KqvyBieD
         jG3WyryMVjiR0AtVg+6KjVyiyhhPxYXTHq7z3ice9FolNKYWxIagqAPoHiMYmSd62N9y
         hO+CBrJ2xjXXhnlriX8xZ/dmbL/NSHTRtUQxmIapfg3sf+8ZQ1o8xHcIPJxrqOO/+WNF
         v1dzDXik8Fh4eMHHMPCMamNSQ3OwnYJ+SrHkd0srX9x5OOB5BYBWyykJ5rW64eQP0prf
         Dm/8GCYowrYbivFgB8gePdTxPeAyI3Ue/GYqgLv3Z7w5+fPKAMY97MoER5vxSckrL65/
         X6dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782806149; x=1783410949;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mqpNY3U/BBW/1jq7tUqFwqPx2Jgckwa966PpuubyQb4=;
        b=X6z+51xLFvBRWk/mL2JsUxVgi8y5oGCEweM4Un+IN8rIeO0dEMCyYMPDn1e0/WyG9a
         +xgRKojgCarriOrkVX2xWpYLLnxEW6/oYXz4SjUSAegCKKX+qH+fX86UlqW7cw4lbeUj
         YFzuJ1v+wPzEx8bgZwZngQt5iGo2gInL8uFeqUJy+sYqyD1OkwLmxXHJAl7dSAOyIiZr
         Z2QPMwPKlQ0aiSRZDZuGx05ddAnTGJFrfGBLTlI0W2R6jBwrAgr6faJ2dxKGkx8l+Net
         JbrxJ1oQT4YJUXyavvw6B9Cj/0QemYvRUQ7uZpnPdHRt06mrqJCb76MF0YQlqDnYn7Pw
         O+Tg==
X-Forwarded-Encrypted: i=1; AFNElJ+vBAOGgibXvPsszCiJvrWF/GkWm4ukBiDT+S0N3m39ze8t+uw+KbvS8Ts1TbR6GTmPA8t/SvB5BiB9dwE/@vger.kernel.org
X-Gm-Message-State: AOJu0YxlyJmj3r1eCr1VREa4AWY3oCf/SwNYH+oa+Sr3EUdZx6DVvSgg
	y/qHnMe2fRyMo/zMtamffde20bUuQWvWTfUWHxpZ6Iyo0FG78phiy8Fo5a5sTbgQ5G90P+IYguJ
	dViXyx+TTmPpVKsG32MVy8cL5kIxQn8n+6ok+lT+gXxt8JVVlviFyKTn7S+ZMgmBJBPZv
X-Gm-Gg: AfdE7cm8VdpreF842pAxKdXaDUUTASWmtCHxZXgyrc1Iz6OgQMyggrUWa0w0Yu8hmoL
	M4BULrOVzvANP5KUiALF+GyxCnamvri7BZDm9FGTfk14QB3Ra9yLuH9h5VQ0oKrbdD2w6nnmz7Q
	/h7nUfKb6U3FjLYfAzGinqsUWJrczmJ5RAN66Nrqk6SEaW1PmauXEpJejMn1KXHzMk2ZvLav3ig
	jHtNaWCUxd4whzl51IOp88766Qzyhczo2eA+oR1W5xbSQgv3cwleI5lC5pMLqYm83fqCZuFqqqV
	Ton7d4gB1SQpJXYDhf9cTjaH3XE1I4WPWrYeNZWn5L59WZUpx30OKrj7bJ9VOpVT0GAJ94eZq71
	4aOee6vTaY9+/43+rkRWnFhdldDs6G7woYrAe6Q==
X-Received: by 2002:a05:7022:f8c:b0:13b:1bd2:389d with SMTP id a92af1059eb24-13b2e3438cdmr517200c88.24.1782806149189;
        Tue, 30 Jun 2026 00:55:49 -0700 (PDT)
X-Received: by 2002:a05:7022:f8c:b0:13b:1bd2:389d with SMTP id a92af1059eb24-13b2e3438cdmr517169c88.24.1782806148279;
        Tue, 30 Jun 2026 00:55:48 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b2abbba8dsm5647940c88.13.2026.06.30.00.55.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 00:55:47 -0700 (PDT)
Date: Tue, 30 Jun 2026 13:25:42 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Sailesh Nandanavanam <saileshnandanavanam@gmail.com>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] remoteproc: qcom_q6v5_pas: Fix dtb firmware lifecycle
 and leak
Message-ID: <20260630075542.lipjayqvrcgepx7z@hu-mojha-hyd.qualcomm.com>
References: <20260622064141.zfakbyenknx6vbm5@hu-mojha-hyd.qualcomm.com>
 <20260624175335.22799-1-saileshnandanavanam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260624175335.22799-1-saileshnandanavanam@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDA2OSBTYWx0ZWRfX6+az+R/Gh3WV
 Zym2A22HgCy4R4rtgQQTUEPYf2h91+CaSM7fCtpZTml+4M0AOES72lLzRVv6G1Qn7tM0gRm2bcO
 cdfcea2uAfUnk96VSXQ8RzAhqPOaWNPVNhVJyeLQXOAt81t3r215/eMV3sLyTUVBcTbufrew7o0
 3juZCQsrJ/NTrVnQWH4gYoLEKAnkrsOER/AAuSrmb8IGNDDj0eLmFWrZuukRfg5mZyqy58CZrS2
 DaBvjMm14X9OlztofvOJGRu42/n7rbS/l9wjw1F8MIZe3eS9sUptvedhuPwwQR6XkbMV1r6CS/p
 4+CglT6B765OG24/coABvkQbBexku6aXCwBi8po3uPG1zITrV0zsnw6JGX5S+Wskd/fWWCGYUW3
 1nNnktxgOAo0YhiaEG3rXW1ORo8ZxZEn66fBNRmb8L8sHbIBymayeTzBuJw77UEfLPkLVooupP/
 VUf3X056Hy17BascaqA==
X-Proofpoint-ORIG-GUID: m1bG0_6y9QrTNSJW6KyU5zDkqWVzduMg
X-Authority-Analysis: v=2.4 cv=JqbBas4C c=1 sm=1 tr=0 ts=6a437686 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=pGLkceISAAAA:8 a=_ByhrIy0lgGYLjqKynUA:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: m1bG0_6y9QrTNSJW6KyU5zDkqWVzduMg
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDA2OSBTYWx0ZWRfX4sxwwiGr2xuD
 +vsXqQXRUu7BX7P93FUKSKl14zUwXBygD5pp+p14STAXi6R0IJC99dj/R7PlHH/Nt39pM53crEu
 bLaL+9GqMfdUqn+KqCVNCFZ6SUCQxRU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 bulkscore=0 adultscore=0 impostorscore=0
 suspectscore=0 phishscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300069
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-115318-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:saileshnandanavanam@gmail.com,m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,hu-mojha-hyd.qualcomm.com:mid,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_FIVE(0.00)[6];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EC9A06E17F2

On Wed, Jun 24, 2026 at 11:23:35PM +0530, Sailesh Nandanavanam wrote:
> DTB co-firmware was previously requested and loaded in
> qcom_pas_load(), but its lifetime did not match the actual
> start/stop lifecycle of the remoteproc. As a result, the firmware
> reference could be retained across restart cycles, leading to a
> leak for each successful boot.
> 
> Additionally, if qcom_pas_start() failed after loading the DTB
> firmware, the remoteproc core would not invoke .stop(), leaving
> no opportunity to release the associated firmware reference.
> 
> Fix this by moving DTB firmware request and loading into
> qcom_pas_start(), so that its lifetime is strictly tied to the
> remoteproc start sequence.
> 
> Update qcom_pas_start() to ensure proper cleanup on all paths:
> - release PAS metadata on failure
> - release DTB firmware on both success and failure paths
> - unmap DTB carveout where applicable
> 
> Remove DTB firmware handling from qcom_pas_load(), as it does not
> match the correct ownership and lifecycle model.
> 
> With this change, request_firmware() and release_firmware() are
> properly paired within the start path, avoiding leaks and ensuring
> consistent behavior across restart and failure scenarios.
> 
> Fixes: 29814986b82e ("remoteproc: qcom_q6v5_pas: add support for dtb co-firmware loading")
> Signed-off-by: Sailesh Nandanavanam <saileshnandanavanam@gmail.com>

Revision of the patch should be sent separately and not as reply
of the earlier revision.


> ---
> v2:
> - Move DTB firmware request/load from qcom_pas_load() to qcom_pas_start()
> - Fix firmware reference leak across restart cycles
> - Handle start() failure paths where .stop() is not invoked
> - Ensure firmware is released on all success and failure paths
> - Remove DTB handling from load() and drop release from stop()
> ---
>  drivers/remoteproc/qcom_q6v5_pas.c | 54 ++++++++++++++++--------------
>  1 file changed, 29 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index da27d1d3c9da..090f1f09dba3 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -232,28 +232,7 @@ static int qcom_pas_load(struct rproc *rproc, const struct firmware *fw)
>  	if (pas->lite_dtb_pas_id)
>  		qcom_scm_pas_shutdown(pas->lite_dtb_pas_id);
>  
> -	if (pas->dtb_pas_id) {
> -		ret = request_firmware(&pas->dtb_firmware, pas->dtb_firmware_name, pas->dev);
> -		if (ret) {
> -			dev_err(pas->dev, "request_firmware failed for %s: %d\n",
> -				pas->dtb_firmware_name, ret);
> -			return ret;
> -		}
> -
> -		ret = qcom_mdt_pas_load(pas->dtb_pas_ctx, pas->dtb_firmware,
> -					pas->dtb_firmware_name, pas->dtb_mem_region,
> -					&pas->dtb_mem_reloc);
> -		if (ret)
> -			goto release_dtb_metadata;
> -	}
> -
>  	return 0;
> -
> -release_dtb_metadata:
> -	qcom_scm_pas_metadata_release(pas->dtb_pas_ctx);
> -	release_firmware(pas->dtb_firmware);
> -
> -	return ret;
>  }
>  
>  static void qcom_pas_unmap_carveout(struct rproc *rproc, phys_addr_t mem_phys, size_t size)
> @@ -277,9 +256,24 @@ static int qcom_pas_start(struct rproc *rproc)
>  	struct qcom_pas *pas = rproc->priv;
>  	int ret;
>  
> +	if (pas->dtb_pas_id) {
> +		ret = request_firmware(&pas->dtb_firmware, pas->dtb_firmware_name, pas->dev);
> +		if (ret) {
> +			dev_err(pas->dev, "request_firmware failed for %s: %d\n",
> +					pas->dtb_firmware_name, ret);

Check the align of the line.


> +			return ret;
> +		}
> +
> +		ret = qcom_mdt_pas_load(pas->dtb_pas_ctx, pas->dtb_firmware,
> +				pas->dtb_firmware_name, pas->dtb_mem_region,
> +				&pas->dtb_mem_reloc);

Here, as well.

> +		if (ret)
> +			goto release_dtb_metadata;
> +	}
> +
>  	ret = qcom_q6v5_prepare(&pas->q6v5);
>  	if (ret)
> -		return ret;
> +		goto release_dtb_metadata;
>  
>  	ret = qcom_pas_pds_enable(pas, pas->proxy_pds, pas->proxy_pd_count);
>  	if (ret < 0)
> @@ -350,15 +344,17 @@ static int qcom_pas_start(struct rproc *rproc)
>  	/* firmware is used to pass reference from qcom_pas_start(), drop it now */
>  	pas->firmware = NULL;
>  
> +	if (pas->dtb_firmware) {
> +		release_firmware(pas->dtb_firmware);
> +		pas->dtb_firmware = NULL;
> +	}

you can put this under check pas->dtb_pas_id which is already
there.

> +
>  	return 0;
>  
>  unmap_carveout:
>  	qcom_pas_unmap_carveout(rproc, pas->mem_phys, pas->mem_size);
>  release_pas_metadata:
>  	qcom_scm_pas_metadata_release(pas->pas_ctx);
> -	if (pas->dtb_pas_id)
> -		qcom_scm_pas_metadata_release(pas->dtb_pas_ctx);
> -
>  unmap_dtb_carveout:
>  	if (pas->dtb_pas_id)
>  		qcom_pas_unmap_carveout(rproc, pas->dtb_mem_phys, pas->dtb_mem_size);
> @@ -376,6 +372,14 @@ static int qcom_pas_start(struct rproc *rproc)
>  	qcom_pas_pds_disable(pas, pas->proxy_pds, pas->proxy_pd_count);
>  disable_irqs:
>  	qcom_q6v5_unprepare(&pas->q6v5);
> +release_dtb_metadata:
> +	if (pas->dtb_pas_id)
> +		qcom_scm_pas_metadata_release(pas->dtb_pas_ctx);
> +release_dtb_firmware:

who is the user of this label ?


> +	if (pas->dtb_firmware) {

dtb_pas_id check should be fine here..


> +		release_firmware(pas->dtb_firmware);
> +		pas->dtb_firmware = NULL;
> +	}
>  
>  	/* firmware is used to pass reference from qcom_pas_start(), drop it now */
>  	pas->firmware = NULL;
> -- 
> 2.34.1
> 

-- 
-Mukesh Ojha

