Return-Path: <linux-arm-msm+bounces-104934-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IJQLGPiF8GnhUQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104934-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 12:03:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C14482260
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 12:03:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 03EF430382B0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 09:21:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C52B3168E1;
	Tue, 28 Apr 2026 09:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J1rHlRNe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YOd4b1cV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3785D258CCC
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 09:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777368084; cv=none; b=tVKVFXhZqqS03oXdwhtSkTYv7MeHek4bFa9GNB7PjPsystFENkOb+l2DXsl+Vn5tNhVqwlGlAzTYENWZOUsupafwvORos9DHJT7XDMGJXgssJsAMMy7YpKkiebKQUeKmtPiNpP5PPN22ZIkfiY3m9xSCh7YfEJ0IQumG/T9fSYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777368084; c=relaxed/simple;
	bh=IcJ41p1S3Zzjw+o3gA1Mi9zZTLqegfsjHjcr7r1iJcw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ttOu9efTqq/4aMmyFZHPp2gwRl3ak9YMxMiVNAaBL+DfqwQtKvxCWQK4fNTL24HXuXtZSQwwTtIE1yCHUeDNkJkVUMOPzOyszrDQN2f9y3TUWH16Db3NoDVBwF9qOIC5SYDtZbNojn//FJ7IHOlXvhKBj5pJrRvNoXoiyOzbmeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J1rHlRNe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YOd4b1cV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63S8ek2b3123758
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 09:21:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=uVa5aELi8oMy5IN5qMbJc9fv
	wjHh1VOUvgLucaocG9g=; b=J1rHlRNedvYMBPu+kQJFq8obDoBh6bHtsfLGahz2
	hlQdCu+A6u3y7mjNloWouF+t4ISvCbX70e/l5X26Ljg2HnbVteXVnmUdaj70LAwr
	Se5keSzn6OCCgB6kTKCD9qIvIHkO03HYe3XZFCyixRkDWuJsXVxeHgm9aT3NtzNN
	F9k59gi5dAEG//R2LTnCsJS+rxYudLoQgLQRrtgEkNzmE0fUyzlJ5d87WPw51qs8
	LHONOWUKvpSi3Cz+8TPT5HHrXEt22Nh/a6Bdr4yu4IjaazJ6ONe5swPbm4d13sx+
	RvQnHLtGk9d4RZtOgaZOHHVy6uWmbgG2RvD9ITkBdunESQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt5qgmtey-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 09:21:22 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8a1accb970fso184183046d6.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 02:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777368081; x=1777972881; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uVa5aELi8oMy5IN5qMbJc9fvwjHh1VOUvgLucaocG9g=;
        b=YOd4b1cVwSsNK4+1sMkmiM5NJM+9VU0OlisGAe5kL61hrXZzkkHFKS9jUaFSAjQRf2
         LVukT1X7Koq0P6kAjxWZrnnslCGcz5+dYtkPEv/I8stq66KHeEzHOoi/brD4HPoReUx4
         AdzU8v4Ru8YRFofuSSaVUylzsm0i5qOLnMJpKFAX2pnUJtxvTyHMDVhii7wiGv7kna44
         vQrBnFONurN0icXXkY/f3m/Auia+96DcYfe1vvqobI+4l1t8+ZZvA/la57aJqi6z24Ou
         pAwa4SqViMDala8CdJj1yUpv79FaAsd2CeypeXRGtcqI9/uJYMOeFlxPmkwCl68TDsfT
         mF4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777368081; x=1777972881;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uVa5aELi8oMy5IN5qMbJc9fvwjHh1VOUvgLucaocG9g=;
        b=nCOvqKrttuMIg+ncRkvpjyWElbGvB1Go0X7rVUnrY/yg3du9tCjwqpaGANLAsN3k6+
         UeUi/iH8ea08536qGRZOtswFrkHT+2nIUOjWroEi3NnUqYYjQOjt9hZWpQAAbI4uVxFZ
         ATdesUhCeKNuX2mRkIY83CwQXyqhCbgPTSUpUB0KDKfbjvjDF9uiu3xYX79xrmf0Dre7
         URlpGXbfX0i1ikqLqpIGzUyC9XIdI8RFZhhI585z2DXeNhFTFN/NTZke6xRk0T9wjg0t
         ls3GDXqcc5xwF65ap32nhJOsmrROZaOXACHXh7zfn5GgNgWxMrbNZoN6c99sPlZ8RPti
         5h1g==
X-Forwarded-Encrypted: i=1; AFNElJ+ZzIR3p06scr8TLXuSNRh5xWGZrzsPkAn4MfTLBdxd/e/ww8K18mZ1dvmm8qZZLJ1iTGRiDv5nZa5Esnj6@vger.kernel.org
X-Gm-Message-State: AOJu0YwojLBR6pSx02OtueWL1wIa+bb40Y9W8C2TogsdqnYymV0x4oAg
	fmvnoRVTLa6C/n8RnndAP1/t5jEacA3nJOgN5Pr08SRQF5Z43jSHEL70oDP7Dsaf1gCz1EFSUQD
	SPLe/3N+glZ9kq1tN5B08QlgM48CV3ETisdhCrlDuPwiLaTpbDoDQnBpLiDFnEZe6Jooe
X-Gm-Gg: AeBDiesxIBaq3tFalhuIsNP8477FkiXoGlSHFXVnZiXpPGd2OJa3YtLqUUnSRVvUOSJ
	0mJXDgza0mWZAAvO0p9nijBk0HtxGpz13O4bJluykUOT+GQz5OfMpxt8LJb6zsPATf6Unj03o/X
	n3Oumy7IQQwMnvQrKnpTFA5yb7Z54IaPCt5xNtPOKoIRWogbJ/JqlOBHzH/c7hc8jH+ZhbgWHRN
	KxzMoOHyH/6xFrIgOVEuKnpI2Ug5ekbkNxCOhygwcLxiQ6FrNiuFksvgaK5XlBH4u9sitXv7na/
	YcKuMI4U6cqigMkLKBulQmus+nCOzpB8A+ShpphCJfBRtAtFHsoaw2dLKJmrhCWKCYsVWktkHnJ
	RDwryC39WpwyCZgcwcCSPpm8FjJpMD110HR4IRJVXFTOW61lFjVp5Vr1mUQSXZy0o4S3G1ZxU1I
	XcsqKsqQNS/nE6muefXjORSrNn82y1raq531w1jD8AIIZ8Sg==
X-Received: by 2002:ac8:57cd:0:b0:50f:c117:1c52 with SMTP id d75a77b69052e-5100e0f6951mr26863631cf.4.1777368081379;
        Tue, 28 Apr 2026 02:21:21 -0700 (PDT)
X-Received: by 2002:ac8:57cd:0:b0:50f:c117:1c52 with SMTP id d75a77b69052e-5100e0f6951mr26863341cf.4.1777368080872;
        Tue, 28 Apr 2026 02:21:20 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a7462d5821sm470542e87.33.2026.04.28.02.21.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 02:21:19 -0700 (PDT)
Date: Tue, 28 Apr 2026 12:21:16 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Cc: Jens Wiklander <jens.wiklander@linaro.org>,
        Sumit Garg <sumit.garg@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Apurupa Pattapu <quic_apurupa@quicinc.com>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        Harshal Dev <quic_hdev@quicinc.com>, linux-arm-msm@vger.kernel.org,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-doc@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: Re: [PATCH v11 08/11] tee: add Qualcomm TEE driver
Message-ID: <ljfhoo5o45m3t5fsqypg75c46qohvszd5azcqxyjdcr5unx7ob@vcgip4yzkmmn>
References: <20250910-qcom-tee-using-tee-ss-without-mem-obj-v11-0-520e867b3d74@oss.qualcomm.com>
 <20250910-qcom-tee-using-tee-ss-without-mem-obj-v11-8-520e867b3d74@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250910-qcom-tee-using-tee-ss-without-mem-obj-v11-8-520e867b3d74@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDA4MiBTYWx0ZWRfX4WBpMODtXc/P
 InTVeIGT1YZNoYZSiFDAkKv8MosR4Wpi9p4M0cFJxAXH7uq1HPE9wt4jJM/6E0qcmBIdMBJkxDD
 LJzJk9jXjUt7w8pX327mGTxsPR8AwIN26e+qgYPQx0dJVHXY6VzPp4pEc1cHCQAo6kVd0D2lle4
 CkRbz18NPxiEHNscApTEAhrmmE/bRU42q3yWCqg93IlY2PyQSE5QhubUuV25HFQONdO/gKhJJph
 jBPu8zWM3FG8cEC410fTHYgkWELQviMCQSvcfOoKKcc94bxwwhQ3s1HM320T37p1Lm3KlITHOkC
 C2fb8HDtJJYFGbMYzFvHeDapMWpQk8xearR+GvjfvOus0Y2IEb9iEs8Dd2UTIWXxOoO8jFGRQVt
 /DU2ZliNBVIEiSJLPaU/c2BjSxVIP/KOOGRoOW2rO/RZQrFjwXQaqheWZ9HoSwPposYVJbFwaEE
 j6ywLnZQFL47ZedOLOQ==
X-Authority-Analysis: v=2.4 cv=V69NF+ni c=1 sm=1 tr=0 ts=69f07c12 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=KKAkSRfTAAAA:8
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=yhmqyPtzb8d5NndqWuMA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: vW3uKJe01PkGwtoqYH6Vt9bwPRFClgFl
X-Proofpoint-ORIG-GUID: vW3uKJe01PkGwtoqYH6Vt9bwPRFClgFl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0 spamscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604280082
X-Rspamd-Queue-Id: E2C14482260
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104934-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,linaro.org:email,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On Wed, Sep 10, 2025 at 08:41:21PM -0700, Amirreza Zarrabi wrote:
> Introduce qcomtee_object, which represents an object in both QTEE and
> the kernel. QTEE clients can invoke an instance of qcomtee_object to
> access QTEE services. If this invocation produces a new object in QTEE,
> an instance of qcomtee_object will be returned.
> 
> Similarly, QTEE can request services from by issuing a callback
> request, which invokes an instance of qcomtee_object.
> 
> Implement initial support for exporting qcomtee_object to userspace
> and QTEE, enabling the invocation of objects hosted in QTEE and userspace
> through the TEE subsystem.
> 
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
> Tested-by: Harshal Dev <quic_hdev@quicinc.com>
> Acked-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
> ---
>  MAINTAINERS                          |   6 +
>  drivers/tee/Kconfig                  |   1 +
>  drivers/tee/Makefile                 |   1 +
>  drivers/tee/qcomtee/Kconfig          |  12 +
>  drivers/tee/qcomtee/Makefile         |   7 +
>  drivers/tee/qcomtee/async.c          | 182 +++++++
>  drivers/tee/qcomtee/call.c           | 813 +++++++++++++++++++++++++++++++
>  drivers/tee/qcomtee/core.c           | 906 +++++++++++++++++++++++++++++++++++
>  drivers/tee/qcomtee/qcomtee.h        | 143 ++++++
>  drivers/tee/qcomtee/qcomtee_msg.h    | 304 ++++++++++++
>  drivers/tee/qcomtee/qcomtee_object.h | 316 ++++++++++++
>  drivers/tee/qcomtee/shm.c            | 153 ++++++
>  drivers/tee/qcomtee/user_obj.c       | 692 ++++++++++++++++++++++++++
>  include/uapi/linux/tee.h             |   1 +
>  14 files changed, 3537 insertions(+)
> 
> +
> +static int
> +qcomtee_object_invoke_ctx_invoke(struct qcomtee_object_invoke_ctx *oic,
> +				 int *result, u64 *res_type)
> +{
> +	phys_addr_t out_msg_paddr;
> +	phys_addr_t in_msg_paddr;
> +	int ret;
> +	u64 res;
> +
> +	tee_shm_get_pa(oic->out_shm, 0, &out_msg_paddr);
> +	tee_shm_get_pa(oic->in_shm, 0, &in_msg_paddr);
> +	if (!(oic->flags & QCOMTEE_OIC_FLAG_BUSY))
> +		ret = qcom_scm_qtee_invoke_smc(in_msg_paddr, oic->in_msg.size,
> +					       out_msg_paddr, oic->out_msg.size,
> +					       &res, res_type);
> +	else
> +		ret = qcom_scm_qtee_callback_response(out_msg_paddr,
> +						      oic->out_msg.size,
> +						      &res, res_type);
> +
> +	if (ret)
> +		pr_err("QTEE returned with %d.\n", ret);
> +	else
> +		*result = (int)res;

After enablign QCOMTEE driver, I observe the following error during the
bootup on RB3 Gen2:

[    4.720777] qcomtee: QTEE returned with -22.
[    4.725251] qcomtee: QTEE version 0.0.0


> +
> +	return ret;
> +}
> +

-- 
With best wishes
Dmitry

