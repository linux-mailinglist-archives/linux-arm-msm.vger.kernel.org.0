Return-Path: <linux-arm-msm+bounces-116884-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NqXDC9rSS2rAawEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116884-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 18:07:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 844C7713061
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 18:07:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=pQMPUNIq;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=TRsa+aST;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116884-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116884-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D91A630393AF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 13:59:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60CB5322C6D;
	Mon,  6 Jul 2026 13:59:54 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E29F30DEB2
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 13:59:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783346394; cv=none; b=hoCZ5O+2Y8DOPTyB4l9Gf0aY78nOAlfW2ce3f006Fq7siY4xOyXnx0b+wRBn0hYHI2fgw8Ib6a+4Ruvy/cTbvk+FDjVj6TnkcZOfun7/rEwnY4yMuBZClu/C0HaP9pOM1cpjOaPpdV9igEBs/3UjOw+XWPWXj25Qsh6qzdK+PRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783346394; c=relaxed/simple;
	bh=jXPeWbqboVixEnetwSWC5UEDFMEKnoWn4zr+JcaIatc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H10wWAUAGz/AOGyQkPjN08NAIeCuOERltYVtPS8Aion1f7sBmCTOqxiCdHbkIkbmE6JzglAIMjVj7kSkwOOaPzcPY9CD+p+VHGVO7CLeEUsDppKt4/XId4T95ygCVv4W24sG1+6mksnw5ME2UzOnNOHXKBrEegDFgWjv6iItlsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pQMPUNIq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TRsa+aST; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxA1s245625
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 13:59:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0ah2qZwWFY3bPwxLCdOZ4hBH
	jz9IEGBG34zE+2NIOkk=; b=pQMPUNIqwKhFdLcfNpb1d4jqObDcW3cnNaN6kVW0
	hRVo3irpUR5AkinBBBpyQ3WzrLRws6NOf0r7Ga3MTME2KiobV9OzuRHDESRsscoc
	a93BG2rJl5XHZB21i8D8vW6Y/7/qg4OZ/eXyTO1JVi4M8IhX/iJCAjybGg2co/RG
	hfuatSbBh8LIGpJfmdLxarnJSEl1vfyY/w4SXtug0cJI5MWqxrdr95hp0/VHIBzc
	llhzpsag42wiO/OcD6dmRm2JRSJNql0HF1E/6VRuNRFWxTQJ9UnFxCqRPEjM40CQ
	he6uqnIo9Ln3N6enp7ILkMNmLZzljIHM5CW2s1G55OoypA==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a98gw5b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 13:59:52 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-9694e84752eso2803785241.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 06:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783346391; x=1783951191; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0ah2qZwWFY3bPwxLCdOZ4hBHjz9IEGBG34zE+2NIOkk=;
        b=TRsa+aST7OTTytN33mCC8DQdtoGkHgsIcpFs7Q/JSaCdcaEV+R/EB4OdBWSGz63zWh
         DhSa95mqgoaV6KexQ57SHpsdAUhv9Hea6G2HIPFKQF27nTj70Hym7wTyTgY3LojJxq7Y
         YVFLjF6+K6+fsUQRTZFjHm2qnt6HPAjQUk/9x/dhH8C3J5mngk99MWJ6/i2zC6a8Goek
         UtyqqivoA79xw5PKk9oC2L2FKVfsAnu0XjcFOEmmn+QZDO5Dq03HYHRWNtJ2zInNfac6
         wslyp4T4yvmiGHUNpb66f/pHHPaHZx6/tzQ8AGkJJaalXucVNim9HQAb9JLznVxb2UVQ
         xpcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783346391; x=1783951191;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0ah2qZwWFY3bPwxLCdOZ4hBHjz9IEGBG34zE+2NIOkk=;
        b=VZgJ/3q5pNf71RFbQRTiwIpUog906i+zLgyx5ufv3BZUFDxJ/a+A5i9ITIV81kngE7
         fqRlAaPTS9gVmtxzHRIfxrHCaNQ4EVovmBYys1iyZS3C55BW1KNG6vVVe+oos4hf0GmY
         LShx7kSs3GC3bTA3kqGsFooTZ8M5Tra1petLv5oineSR+O6NzzZw64jAxovVYmKtwKq7
         YhMR1nt/Pf9XWNO8Zc7I6p1zRJCIfIFEhRlV2D9RjcuhSD+EH09MTUnxa3nQ1OhfBsBH
         7vsyUXZca1yFVF76qRRd8KDzWfB7N76YHqZ1ErW+SQWEho2DO6+CwGmRtrt0kKnfOzjF
         gFag==
X-Forwarded-Encrypted: i=1; AHgh+RqmJGCk//XcL+GXCBenFLAugAwZ6yBkgFiiwCmgqiwvnkhpBtmRn1yhKA9SuM8ci/S4+pYTUXct3cyAY5ok@vger.kernel.org
X-Gm-Message-State: AOJu0YwhieEXu2i3r+cFPGE8yAebQn3YhUej4HNV6RsLWMbsLyQpnV4Y
	0MT4N8uN62gp/Mr9RdvDAd2odg3LBhdVoP9goaVfy87HVjx/NxJvYMfC8ybRsy358Ljny7ZiUKe
	nxi/NcRrjpnZczN/4WdQ9S1CYTdw3xejTy9SL/Yz45PmTPYfHMzor57RQ/jPRF99itefq
X-Gm-Gg: AfdE7cmrtHjNPDt5BeuEheAXccXuOF5DuAicQykuSDOUhc/LxWlA84BZacg3TdkAnrF
	Gk3X5kC4ak+zJRHo9NCiy1Lx4sLdbUEDiic8oguG4WlbSQ/kK7uyrDm01XB+PLEPgk42TSHDOIk
	8tNZt0Fo9psIhudhO+AlBajciekgXjbWgMHSqOFMhRDii/rKYdDGOkcKgNbqrsp4An4dAUX4dWR
	+LnuWYynV5KXHcrdupsET0/np7MXKWhg92RSLTR/59cdfgjVcEQcN1e7QQszW+selOEz/7gtwlF
	9IrxrjijQ9Hy+fWYSW9D0pMzDqwGGVkVsfB7p3JPcurE6dlsZBlWZj4eXE1BbuWv8K44vu8gIpg
	mfsSwyhyjiXoKdhSneelPz+KELOZpHw7sqcBMxt4AdG88mdbrBpWlAjHQoU3vwbFz3Dihi2mx4Q
	7UdTB0T76A+e5lRF0oRKWSbAFc
X-Received: by 2002:a05:6122:6591:b0:5bd:c32e:b6de with SMTP id 71dfb90a1353d-5be908d732bmr354815e0c.14.1783346391312;
        Mon, 06 Jul 2026 06:59:51 -0700 (PDT)
X-Received: by 2002:a05:6122:6591:b0:5bd:c32e:b6de with SMTP id 71dfb90a1353d-5be908d732bmr354790e0c.14.1783346390851;
        Mon, 06 Jul 2026 06:59:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed1377052sm2893474e87.21.2026.07.06.06.59.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 06:59:49 -0700 (PDT)
Date: Mon, 6 Jul 2026 16:59:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Alexander Koskovich <akoskovich@pm.me>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] media: iris: Add support for Milos (VPU v2.0)
Message-ID: <cq6g5btaybsaloxcnlpruqg7tivve6jew4f2dak3dmpqj4h3xg@gpaogxd7xwfm>
References: <20260705-milos-iris-v3-0-8c1353530f24@pm.me>
 <20260705-milos-iris-v3-2-8c1353530f24@pm.me>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260705-milos-iris-v3-2-8c1353530f24@pm.me>
X-Authority-Analysis: v=2.4 cv=SpigLvO0 c=1 sm=1 tr=0 ts=6a4bb4d8 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=vkwYq-XpzzMP6zU4_eYA:9
 a=CjuIK1q_8ugA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE0MiBTYWx0ZWRfXwWZLAY5YxKC/
 1uf/uaKmrrR7bK5Ii49G3fdE4YYTEHi9XAbN8G9p1gknvgzQL5VitEBD8WoeGTiYV230Gp7eoLF
 NT3w0J6Fgb+n9kiBktvKH3xReKuqIZ+hrnlwq39Chb18PtsO6TPzpUEP1FfOHBhBk2uP4QV4nzD
 JhjrsZfrIddrooJPW/30HMiPJU36pkufHioZCE5cMDGOrnW62sw20Tyz6mg0S8LdemgcYVyFxdp
 +snrZaZ74iJ8aor+pl0YX/cgTHdGGlnDTUVjitzUk0i9uB5z3u/osWWGsmsbxe3dWDu1r0lyCZx
 Oo9ULEKpMvK45kcMhJcpO/bNNAvbA39oZhc//AUOHD2+xSpG/9X1VinNf//oHRholwFbFkEVvC5
 Vn4BBv5lxiseitDeAQgEVYYmwKfItcfmuKxVjurvABA4iIQpcFbCo4MVNnYWU3+Y5/9zJJPANFd
 ItfqQQmN964ofS0Z8Yg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE0MiBTYWx0ZWRfX98moTF0U357E
 x3c+gfLnB5i3jhD554JHbeywjwf4tv94wyC6ZxajV3sfzPyr/OApiksnrEU33MyVCN6y2/YGOIX
 Akwy+USPF8YrdnM20gcv/OnNq4TCthM=
X-Proofpoint-GUID: _yumsAZP7a5SnnkJd-wYu7rGPegtbhvw
X-Proofpoint-ORIG-GUID: _yumsAZP7a5SnnkJd-wYu7rGPegtbhvw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1015 phishscore=0
 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060142
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-116884-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:akoskovich@pm.me,m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pm.me:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 844C7713061

On Sun, Jul 05, 2026 at 10:10:35AM +0000, Alexander Koskovich wrote:
> Add support for the Milos Iris codec. This only supports the variant
> found on the SM7635-AB that has half of it's pipes disabled via efuse.
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---
>  drivers/media/platform/qcom/iris/iris_hfi_gen2.c   | 883 +++++++++++++++++++++
>  .../platform/qcom/iris/iris_platform_common.h      |   2 +
>  .../media/platform/qcom/iris/iris_platform_milos.h |  28 +
>  .../media/platform/qcom/iris/iris_platform_vpu2.c  |  35 +
>  drivers/media/platform/qcom/iris/iris_probe.c      |   4 +
>  5 files changed, 952 insertions(+)
> 
>  
> +static const struct iris_firmware_desc iris_milos_desc = {
> +	.firmware_data = &iris_hfi_milos_data,
> +	.get_vpu_buffer_size = iris_vpu_buf_size,
> +	.fwname = "qcom/vpu/vpu20_p2.mbn",

Nit, please use vpu20_p2_gen2.mbn at least (or, better,
qcom/vpu/vpu20_p2_gen2_s6.mbn or _s7, depending on the MBN signature).
It won't work with gen1 vpu20_p2.mbn.

Otherwise, looks good to me.

> +};
> +
>  static const struct iris_firmware_desc iris_vpu20_p1_gen1_desc = {
>  	.firmware_data = &iris_hfi_gen1_data,
>  	.get_vpu_buffer_size = iris_vpu_buf_size,

-- 
With best wishes
Dmitry

